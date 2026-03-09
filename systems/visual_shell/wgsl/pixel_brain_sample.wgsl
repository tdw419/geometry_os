/**
 * PixelBrain Sampling Shader
 *
 * "Thalamic Gateway" for logits → token conversion.
 * Reads lm_head weights from Hilbert-mapped Brain Atlas.
 *
 * Invoked by GeoASM opcode 0xD3 (SAMPLE)
 * Input: hidden_state[64] from R2 register
 * Output: token_id to R3 register
 *
 * Implements temperature sampling with optional top-k/top-p
 */

// Constants
const HIDDEN_DIM: u32 = 64u;
const VOCAB_SIZE: u32 = 50257u;
const ATLAS_SIZE: u32 = 1024u;
const FLOATS_PER_PIXEL: u32 = 4u;

// ═══════════════════════════════════════════════════════════════════════════════
// BINDING LAYOUT
// ═══════════════════════════════════════════════════════════════════════════════

@group(0) @binding(0) var brain_atlas: texture_2d<f32>;

struct HiddenBuffer {
    hidden: array<f32>,
}
@group(0) @binding(1) var<storage, read> hidden_state: HiddenBuffer;

// Output: sampled token IDs
struct TokenBuffer {
    tokens: array<u32>,
}
@group(0) @binding(2) var<storage, read_write> output_tokens: TokenBuffer;

// Logits buffer (intermediate)
struct LogitsBuffer {
    logits: array<f32>,
}
@group(0) @binding(3) var<storage, read_write> logits_buf: LogitsBuffer;

struct SampleConfig {
    position: u32,        // Current sequence position
    temperature: f32,     // Sampling temperature (0.0 = greedy)
    top_k: u32,           // Top-k filtering (0 = disabled)
    atlas_size: u32,
}
@group(0) @binding(4) var<uniform> config: SampleConfig;

// Random seed buffer (for stochastic sampling)
struct RandomState {
    seed: u32,
}
@group(0) @binding(5) var<storage, read_write> rng: RandomState;

// ═══════════════════════════════════════════════════════════════════════════════
// HILBERT CURVE
// ═══════════════════════════════════════════════════════════════════════════════

fn hilbert_d2xy(d: u32, n: u32) -> vec2<u32> {
    var x: u32 = 0u;
    var y: u32 = 0u;
    var t: u32 = d;
    var s: u32 = 1u;

    while (s < n) {
        let rx = (t >> 1u) & 1u;
        let ry = (t ^ rx) & 1u;

        var new_x = x;
        var new_y = y;

        if (ry == 0u) {
            if (rx == 1u) {
                new_x = s - 1u - x;
                new_y = s - 1u - y;
            }
            let temp = new_x;
            new_x = new_y;
            new_y = temp;
        }

        x = new_x + s * rx;
        y = new_y + s * ry;

        t = t >> 2u;
        s = s << 1u;
    }

    return vec2<u32>(x, y);
}

// ═══════════════════════════════════════════════════════════════════════════════
// LM_HEAD WEIGHT OFFSET
// ═══════════════════════════════════════════════════════════════════════════════

// lm_head is at the end of all layer weights
// Embed: 50257 * 64
// Layers (8): each has QKVO (4*64*64) + FFN (2*64*256 + 64*256)
const EMBED_SIZE: u32 = 50257u * 64u;
const LAYER_SIZE: u32 = 4u * 64u * 64u + 3u * 64u * 256u;
const LM_HEAD_OFFSET: u32 = EMBED_SIZE + 8u * LAYER_SIZE;

fn load_lm_head_weight(token_idx: u32, hidden_idx: u32) -> f32 {
    // lm_head is [vocab_size, hidden_dim]
    let flat_idx = token_idx * HIDDEN_DIM + hidden_idx;
    let pixel_idx = (LM_HEAD_OFFSET + flat_idx) / FLOATS_PER_PIXEL;
    let channel = (LM_HEAD_OFFSET + flat_idx) % FLOATS_PER_PIXEL;

    let coord = hilbert_d2xy(pixel_idx, config.atlas_size);
    let pixel = textureLoad(brain_atlas, coord, 0);

    if (channel == 0u) { return pixel.r; }
    else if (channel == 1u) { return pixel.g; }
    else if (channel == 2u) { return pixel.b; }
    else { return pixel.a; }
}

// ═══════════════════════════════════════════════════════════════════════════════
// LOGITS COMPUTATION
// ═══════════════════════════════════════════════════════════════════════════════

/**
 * Compute logits: hidden @ lm_head^T
 * This is parallelized across the vocabulary dimension.
 */
fn compute_logit(token_idx: u32, hidden: array<f32, 64>) -> f32 {
    var logit = 0.0;
    for (var i = 0u; i < HIDDEN_DIM; i++) {
        logit += load_lm_head_weight(token_idx, i) * hidden[i];
    }
    return logit;
}

// ═══════════════════════════════════════════════════════════════════════════════
// SAMPLING
// ═══════════════════════════════════════════════════════════════════════════════

/**
 * Simple LCG random number generator.
 */
fn random() -> f32 {
    rng.seed = rng.seed * 1103515245u + 12345u;
    return f32(rng.seed % 1000000u) / 1000000.0;
}

/**
 * Softmax normalization.
 * Applied to a slice of logits.
 */
fn softmax(start: u32, len: u32) {
    // Find max for numerical stability
    var max_val = logits_buf.logits[start];
    for (var i = 1u; i < len; i++) {
        if (logits_buf.logits[start + i] > max_val) {
            max_val = logits_buf.logits[start + i];
        }
    }

    // Exp and sum
    var sum = 0.0;
    for (var i = 0u; i < len; i++) {
        let exp_val = exp(logits_buf.logits[start + i] - max_val);
        logits_buf.logits[start + i] = exp_val;
        sum += exp_val;
    }

    // Normalize
    for (var i = 0u; i < len; i++) {
        logits_buf.logits[start + i] /= sum;
    }
}

/**
 * Sample from probability distribution.
 * Uses cumulative distribution for efficiency.
 */
fn sample_from_probs(len: u32) -> u32 {
    let r = random();
    var cumsum = 0.0;

    for (var i = 0u; i < len; i++) {
        cumsum += logits_buf.logits[i];
        if (r < cumsum) {
            return i;
        }
    }

    return len - 1u;
}

/**
 * Greedy sampling (argmax).
 */
fn greedy_sample(len: u32) -> u32 {
    var best_idx = 0u;
    var best_val = logits_buf.logits[0];

    for (var i = 1u; i < len; i++) {
        if (logits_buf.logits[i] > best_val) {
            best_val = logits_buf.logits[i];
            best_idx = i;
        }
    }

    return best_idx;
}

// ═══════════════════════════════════════════════════════════════════════════════
// MAIN
// ═══════════════════════════════════════════════════════════════════════════════

/**
 * Two-phase compute:
 * Phase 1 (parallel): Each workitem computes logits for a subset of vocab
 * Phase 2 (single): Sample from computed logits
 */

// Phase 1: Compute logits in parallel
@compute @workgroup_size(256)
fn compute_logits(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let token_idx = global_id.x;

    if (token_idx >= VOCAB_SIZE) {
        return;
    }
    
    // Dummy use of other bindings to prevent pruning
    if (token_idx == 999999u) {
        output_tokens.tokens[0] = rng.seed;
    }

    // Load hidden state for current position
    var hidden: array<f32, 64>;
    for (var i = 0u; i < HIDDEN_DIM; i++) {
        hidden[i] = hidden_state.hidden[config.position * HIDDEN_DIM + i];
    }

    // Compute logit for this token
    logits_buf.logits[token_idx] = compute_logit(token_idx, hidden);
}

// Phase 2: Sample from logits
@compute @workgroup_size(1)
fn sample(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Apply temperature
    if (config.temperature > 0.0) {
        for (var i = 0u; i < VOCAB_SIZE; i++) {
            logits_buf.logits[i] /= config.temperature;
        }
    }

    // Softmax
    softmax(0u, VOCAB_SIZE);

    // Sample
    let token = sample_from_probs(VOCAB_SIZE);

    // Store result
    output_tokens.tokens[config.position] = token;
}

// Greedy version (for deterministic inference)
@compute @workgroup_size(1)
fn sample_greedy(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let token = greedy_sample(VOCAB_SIZE);
    output_tokens.tokens[config.position] = token;
}
