/**
 * PixelBrain FFN Projection Shader
 *
 * "Thalamic Gateway" for feed-forward network computation.
 * Reads gate/up/down weights from Hilbert-mapped Brain Atlas.
 *
 * Invoked by GeoASM opcode 0xD2 (PROJECT)
 * Input: hidden_state[64] from R2 register
 * Output: ffn_output[64] to R2 (in-place with residual)
 *
 * Architecture (LLaMA-style SwiGLU):
 * - gate_proj: 64 → 256 (intermediate)
 * - up_proj: 64 → 256 (intermediate)
 * - down_proj: 256 → 64 (output)
 * - Activation: SiLU (Swish) for gate
 */

// Constants
const HIDDEN_DIM: u32 = 64u;
const INTERMEDIATE_DIM: u32 = 256u;
const ATLAS_SIZE: u32 = 1024u;
const FLOATS_PER_PIXEL: u32 = 4u;

// ═══════════════════════════════════════════════════════════════════════════════
// BINDING LAYOUT
// ═══════════════════════════════════════════════════════════════════════════════

@group(0) @binding(0) var brain_atlas: texture_2d<f32>;

struct HiddenBuffer {
    hidden: array<f32>,
}
@group(0) @binding(1) var<storage, read_write> hidden_state: HiddenBuffer;

struct ProjectConfig {
    layer_idx: u32,
    atlas_size: u32,
    _pad1: u32,
    _pad2: u32,
}
@group(0) @binding(3) var<uniform> config: ProjectConfig;

// Intermediate buffer (can't be variable size in WGSL, so we use max)
var<private> intermediate: array<f32, 256>;

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
// WEIGHT OFFSETS
// ═══════════════════════════════════════════════════════════════════════════════

const EMBED_SIZE: u32 = 50257u * 64u;
const QKVO_SIZE: u32 = 4u * 64u * 64u;
const FFN_SIZE: u32 = 3u * 64u * 256u;
const LAYER_SIZE: u32 = QKVO_SIZE + FFN_SIZE;

fn get_ffn_offset(layer: u32, matrix_type: u32) -> u32 {
    // matrix_type: 0=gate, 1=up, 2=down
    let layer_start = EMBED_SIZE + layer * LAYER_SIZE;
    let ffn_start = layer_start + QKVO_SIZE;
    
    if (matrix_type == 0u) {
        return ffn_start; // gate_proj
    } else if (matrix_type == 1u) {
        return ffn_start + 64u * 256u; // up_proj
    } else {
        return ffn_start + 2u * 64u * 256u; // down_proj
    }
}

fn load_ffn_weight(layer: u32, matrix_type: u32, row: u32, col: u32) -> f32 {
    let base_offset = get_ffn_offset(layer, matrix_type);

    // Different matrix shapes
    var flat_idx: u32;
    if (matrix_type == 2u) {
        // down_proj: [64, 256]
        flat_idx = row * INTERMEDIATE_DIM + col;
    } else {
        // gate/up_proj: [256, 64]
        flat_idx = row * HIDDEN_DIM + col;
    }

    let pixel_idx = (base_offset + flat_idx) / FLOATS_PER_PIXEL;
    let channel = (base_offset + flat_idx) % FLOATS_PER_PIXEL;

    let coord = hilbert_d2xy(pixel_idx, config.atlas_size);
    let pixel = textureLoad(brain_atlas, coord, 0);

    if (channel == 0u) { return pixel.r; }
    else if (channel == 1u) { return pixel.g; }
    else if (channel == 2u) { return pixel.b; }
    else { return pixel.a; }
}

// ═══════════════════════════════════════════════════════════════════════════════
// ACTIVATIONS
// ═══════════════════════════════════════════════════════════════════════════════

fn silu(x: f32) -> f32 {
    return x / (1.0 + exp(-x));
}

// ═══════════════════════════════════════════════════════════════════════════════
// FFN COMPUTATION
// ═══════════════════════════════════════════════════════════════════════════════

fn compute_ffn(p_hidden: ptr<function, array<f32, 64>>) {
    // Step 1: gate_proj (64 → 256) with SiLU
    var gate: array<f32, 256>;
    for (var i = 0u; i < INTERMEDIATE_DIM; i++) {
        var sum = 0.0;
        for (var j = 0u; j < HIDDEN_DIM; j++) {
            sum += load_ffn_weight(config.layer_idx, 0u, i, j) * (*p_hidden)[j];
        }
        gate[i] = silu(sum);
    }

    // Step 2: up_proj (64 → 256)
    var up: array<f32, 256>;
    for (var i = 0u; i < INTERMEDIATE_DIM; i++) {
        var sum = 0.0;
        for (var j = 0u; j < HIDDEN_DIM; j++) {
            sum += load_ffn_weight(config.layer_idx, 1u, i, j) * (*p_hidden)[j];
        }
        up[i] = sum;
    }

    // Step 3: Element-wise gate * up
    for (var i = 0u; i < INTERMEDIATE_DIM; i++) {
        intermediate[i] = gate[i] * up[i];
    }

    // Step 4: down_proj (256 → 64)
    var output: array<f32, 64>;
    for (var i = 0u; i < HIDDEN_DIM; i++) {
        var sum = 0.0;
        for (var j = 0u; j < INTERMEDIATE_DIM; j++) {
            sum += load_ffn_weight(config.layer_idx, 2u, i, j) * intermediate[j];
        }
        output[i] = sum;
    }

    // Residual connection
    for (var i = 0u; i < HIDDEN_DIM; i++) {
        (*p_hidden)[i] = (*p_hidden)[i] + output[i];
    }
}

// ═══════════════════════════════════════════════════════════════════════════════
// MAIN
// ═══════════════════════════════════════════════════════════════════════════════

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let pos = global_id.x;

    // Load hidden state
    var hidden: array<f32, 64>;
    for (var i = 0u; i < HIDDEN_DIM; i++) {
        hidden[i] = hidden_state.hidden[pos * HIDDEN_DIM + i];
    }

    // Compute FFN
    compute_ffn(&hidden);

    // Store result
    for (var i = 0u; i < HIDDEN_DIM; i++) {
        hidden_state.hidden[pos * HIDDEN_DIM + i] = hidden[i];
    }
}
