/**
 * PixelBrain Sampling Shader
 */

// [DEQUANT_CODE_PLACEHOLDER]

const VOCAB_SIZE: u32 = 50257u;
const HIDDEN_DIM: u32 = 768u;

// [BINDING_PLACEHOLDER]

struct HiddenBuffer { hidden: array<f32> }
struct TokenBuffer { tokens: array<u32> }
struct LogitsBuffer { logits: array<f32> }

struct SampleConfig {
    position: u32,
    temperature: f32,
    top_k: u32,
    atlas_size: u32,
    lm_head_start: u32,
    ln_f_w_start: u32,   // Final LayerNorm weight start
    ln_f_b_start: u32,   // Final LayerNorm bias start
    _pad1: u32
}

@group(0) @binding(1) var<storage, read> hidden_state: HiddenBuffer;
@group(0) @binding(2) var<storage, read_write> output_tokens: TokenBuffer;
@group(0) @binding(3) var<storage, read_write> logits_buf: LogitsBuffer;
@group(0) @binding(4) var<uniform> config: SampleConfig;

struct RandomState { seed: u32 }
@group(0) @binding(5) var<storage, read_write> rng: RandomState;

fn load_weight_value(float_idx: u32) -> f32 {
    // [LOAD_WEIGHT_PLACEHOLDER]
    return 0.0;
}

@compute @workgroup_size(256)
fn compute_logits(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Dummy usage of all bindings to prevent WGPU from optimizing them away
    // This ensures bind group layout matches what we create in Python
    let _dummy_tokens = output_tokens.tokens[0u];
    let _dummy_rng = rng.seed;

    let token_idx = global_id.x;
    if (token_idx >= VOCAB_SIZE) { return; }

    // First, apply final LayerNorm to the hidden state
    // We compute this in parallel - each thread helps compute mean/var
    let hidden_offset = config.position * HIDDEN_DIM;

    // Load hidden and compute contribution to mean
    var sum = 0.0;
    var count = 0u;
    for (var i = token_idx; i < HIDDEN_DIM; i += VOCAB_SIZE) {
        sum += hidden_state.hidden[hidden_offset + i];
        count += 1u;
    }
    // Note: This is an approximation since we can't easily do workgroup sync across 50257 threads
    // For now, we'll compute the logit directly and rely on the hidden state being already normalized

    var logit = 0.0;
    let head_float_start = config.lm_head_start + token_idx * HIDDEN_DIM;

    // [COMPUTE_LOGIT_LOGIC_PLACEHOLDER]
    // The placeholder will be replaced by logic that loads hidden_state.hidden[hidden_offset + i]
    // instead of local array if using texture, or specialized logic if using Q4_0.

    logits_buf.logits[token_idx] = logit;
}

@compute @workgroup_size(1)
fn sample(@builtin(global_invocation_id) global_id: vec3<u32>) {
    var best_idx = 0u;
    var best_val = -1e38;
    for (var i = 0u; i < VOCAB_SIZE; i++) {
        if (logits_buf.logits[i] > best_val) {
            best_val = logits_buf.logits[i];
            best_idx = i;
        }
    }
    output_tokens.tokens[config.position] = best_idx;
}

@compute @workgroup_size(1)
fn sample_greedy(@builtin(global_invocation_id) global_id: vec3<u32>) {
    var best_idx = 0u;
    var best_val = -1e38;
    for (var i = 0u; i < VOCAB_SIZE; i++) {
        if (logits_buf.logits[i] > best_val) {
            best_val = logits_buf.logits[i];
            best_idx = i;
        }
    }
    output_tokens.tokens[config.position] = best_idx;
}
