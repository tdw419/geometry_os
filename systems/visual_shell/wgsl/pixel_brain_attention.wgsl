/**
 * GPT-Neo-125M Self-Attention Shader for Geometry OS
 * Dimensions: HIDDEN_DIM=768, NUM_HEADS=12, HEAD_DIM=64
 */

// [DEQUANT_CODE_PLACEHOLDER]

const HIDDEN_DIM: u32 = 768u;
const NUM_HEADS: u32 = 12u;
const HEAD_DIM: u32 = 64u;
const MAX_SEQ_LEN: u32 = 1024u;

// [BINDING_PLACEHOLDER]

struct HiddenBuffer { hidden: array<f32> }
@group(0) @binding(1) var<storage, read_write> hidden_state: HiddenBuffer;

struct AttentionOutput { weights: array<f32> }
@group(0) @binding(2) var<storage, read_write> attention_out: AttentionOutput;

struct AttentionConfig {
    layer_idx: u32,
    position: u32,
    atlas_size: u32,
    weights_start: u32,  // Q weights start
    k_start: u32,        // K weights start
    v_start: u32,        // V weights start
    o_start: u32,        // O weights start
    q_b_start: u32,      // Q bias start
    k_b_start: u32,      // K bias start
    v_b_start: u32,      // V bias start
    o_b_start: u32,      // O bias start
    seq_len: u32,
    ln_w_start: u32,     // LayerNorm weight start
    ln_b_start: u32,     // LayerNorm bias start
    _pad: u32
}
@group(0) @binding(3) var<uniform> config: AttentionConfig;

@group(0) @binding(4) var<storage, read_write> kv_cache: array<f32>;

fn load_weight_value(float_idx: u32) -> f32 {
    // [LOAD_WEIGHT_PLACEHOLDER]
    return 0.0;
}

var<workgroup> x_norm: array<f32, 768>;
var<workgroup> q_vec: array<f32, 768>;
var<workgroup> k_vec: array<f32, 768>;
var<workgroup> v_vec: array<f32, 768>;
var<workgroup> context_vec: array<f32, 768>;
var<workgroup> scores: array<f32, 1024>;
var<workgroup> shared_f32: array<f32, 64>;

@compute @workgroup_size(64, 1, 1)
fn main(@builtin(local_invocation_id) local_id: vec3<u32>) {
    // Dead code path removed - was causing type mismatch compilation error

    let tid = local_id.x;
    let pos = config.seq_len - 1u;
    let layer = config.layer_idx;

    // 1. Load current hidden state and compute LayerNorm (simple version)
    for (var i = tid; i < HIDDEN_DIM; i += 64u) {
        x_norm[i] = hidden_state.hidden[pos * HIDDEN_DIM + i];
    }
    workgroupBarrier();

    // Compute mean
    var sum = 0.0;
    for (var i = tid; i < HIDDEN_DIM; i += 64u) { sum += x_norm[i]; }
    shared_f32[tid] = sum;
    workgroupBarrier();
    if (tid == 0u) {
        var total_sum = 0.0;
        for (var i = 0u; i < 64u; i++) { total_sum += shared_f32[i]; }
        shared_f32[0] = total_sum / f32(HIDDEN_DIM);
    }
    workgroupBarrier();
    let mean = shared_f32[0];

    // Compute variance
    sum = 0.0;
    for (var i = tid; i < HIDDEN_DIM; i += 64u) { 
        let diff = x_norm[i] - mean;
        sum += diff * diff;
    }
    shared_f32[tid] = sum;
    workgroupBarrier();
    if (tid == 0u) {
        var total_sum = 0.0;
        for (var i = 0u; i < 64u; i++) { total_sum += shared_f32[i]; }
        shared_f32[0] = 1.0 / sqrt(total_sum / f32(HIDDEN_DIM) + 1e-5);
    }
    workgroupBarrier();
    let inv_std = shared_f32[0];

    // Apply normalization with learned LayerNorm parameters
    for (var i = tid; i < HIDDEN_DIM; i += 64u) {
        let ln_w = load_weight_value(config.ln_w_start + i);
        let ln_b = load_weight_value(config.ln_b_start + i);
        x_norm[i] = ((x_norm[i] - mean) * inv_std) * ln_w + ln_b;
    }
    workgroupBarrier();

    // 2. Projections Q, K, V with biases
    // Q is HIDDEN_DIM x HIDDEN_DIM
    for (var row = 0u; row < HIDDEN_DIM; row++) {
        var dot = 0.0;
        let row_offset = config.weights_start + row * HIDDEN_DIM;
        for (var i = tid; i < HIDDEN_DIM; i += 64u) {
            dot += x_norm[i] * load_weight_value(row_offset + i);
        }
        shared_f32[tid] = dot;
        workgroupBarrier();
        if (tid == 0u) {
            var row_sum = 0.0;
            for (var i = 0u; i < 64u; i++) { row_sum += shared_f32[i]; }
            let q_bias = load_weight_value(config.q_b_start + row);
            q_vec[row] = row_sum + q_bias;
        }
        workgroupBarrier();
    }

    // K is HIDDEN_DIM x HIDDEN_DIM, starts at config.k_start
    for (var row = 0u; row < HIDDEN_DIM; row++) {
        var dot = 0.0;
        let row_offset = config.k_start + row * HIDDEN_DIM;
        for (var i = tid; i < HIDDEN_DIM; i += 64u) {
            dot += x_norm[i] * load_weight_value(row_offset + i);
        }
        shared_f32[tid] = dot;
        workgroupBarrier();
        if (tid == 0u) {
            var row_sum = 0.0;
            for (var i = 0u; i < 64u; i++) { row_sum += shared_f32[i]; }
            let k_bias = load_weight_value(config.k_b_start + row);
            k_vec[row] = row_sum + k_bias;
        }
        workgroupBarrier();
    }

    // V is HIDDEN_DIM x HIDDEN_DIM, starts at config.v_start
    for (var row = 0u; row < HIDDEN_DIM; row++) {
        var dot = 0.0;
        let row_offset = config.v_start + row * HIDDEN_DIM;
        for (var i = tid; i < HIDDEN_DIM; i += 64u) {
            dot += x_norm[i] * load_weight_value(row_offset + i);
        }
        shared_f32[tid] = dot;
        workgroupBarrier();
        if (tid == 0u) {
            var row_sum = 0.0;
            for (var i = 0u; i < 64u; i++) { row_sum += shared_f32[i]; }
            let v_bias = load_weight_value(config.v_b_start + row);
            v_vec[row] = row_sum + v_bias;
        }
        workgroupBarrier();
    }

    // 3. Save K, V to KV-cache storage buffer
    let k_offset = (layer * 2u + 0u) * (MAX_SEQ_LEN * HIDDEN_DIM) + pos * HIDDEN_DIM;
    let v_offset = (layer * 2u + 1u) * (MAX_SEQ_LEN * HIDDEN_DIM) + pos * HIDDEN_DIM;
    for (var i = tid; i < HIDDEN_DIM; i += 64u) {
        kv_cache[k_offset + i] = k_vec[i];
        kv_cache[v_offset + i] = v_vec[i];
    }
    workgroupBarrier();
    storageBarrier();  // CRITICAL: Ensure KV cache writes are visible before reading for attention

    // 4. Attention for each head
    // NOTE: GPT-Neo does NOT use the standard 1/sqrt(head_dim) scaling in attention
    // The scaling is baked into the Q projection weights during training
    for (var h = 0u; h < NUM_HEADS; h++) {
        let head_offset = h * HEAD_DIM;
        
        // Compute scores against all previous positions
        for (var j = 0u; j < config.seq_len; j++) {
            var dot = 0.0;
            let k_pos_offset = (layer * 2u + 0u) * (MAX_SEQ_LEN * HIDDEN_DIM) + j * HIDDEN_DIM + head_offset;
            for (var i = tid; i < HEAD_DIM; i += 64u) {
                dot += q_vec[head_offset + i] * kv_cache[k_pos_offset + i];
            }
            shared_f32[tid] = dot;
            workgroupBarrier();
            if (tid == 0u) {
                var total_dot = 0.0;
                for (var i = 0u; i < 64u; i++) { total_dot += shared_f32[i]; }
                scores[j] = total_dot;  // No scaling - GPT-Neo doesn't use 1/sqrt(head_dim)
            }
            workgroupBarrier();
        }

        // Softmax
        var max_score = -1e10;
        if (tid == 0u) {
            for (var j = 0u; j < config.seq_len; j++) {
                if (scores[j] > max_score) { max_score = scores[j]; }
            }
            shared_f32[0] = max_score;
        }
        workgroupBarrier();
        max_score = shared_f32[0];

        var score_sum = 0.0;
        if (tid == 0u) {
            for (var j = 0u; j < config.seq_len; j++) {
                scores[j] = exp(scores[j] - max_score);
                score_sum += scores[j];
            }
            shared_f32[0] = score_sum;
        }
        workgroupBarrier();
        score_sum = shared_f32[0];
        if (tid == 0u) {
            for (var j = 0u; j < config.seq_len; j++) {
                scores[j] /= score_sum;
            }
        }
        workgroupBarrier();

        // Context calculation
        for (var i = tid; i < HEAD_DIM; i += 64u) {
            var c_val = 0.0;
            for (var j = 0u; j < config.seq_len; j++) {
                let v_pos_offset = (layer * 2u + 1u) * (MAX_SEQ_LEN * HIDDEN_DIM) + j * HIDDEN_DIM + head_offset + i;
                c_val += scores[j] * kv_cache[v_pos_offset];
            }
            context_vec[head_offset + i] = c_val;
        }
        workgroupBarrier();
        
        // Save weights for visualization (first head only for now)
        if (h == 0u && tid == 0u) {
            for (var j = 0u; j < config.seq_len; j++) {
                attention_out.weights[j] = scores[j];
            }
        }
    }

    // 5. O Projection
    // context_vec (768) * W_o (768x768) -> output + bias
    for (var row = 0u; row < HIDDEN_DIM; row++) {
        var dot = 0.0;
        let row_offset = config.o_start + row * HIDDEN_DIM;
        for (var i = tid; i < HIDDEN_DIM; i += 64u) {
            dot += context_vec[i] * load_weight_value(row_offset + i);
        }
        shared_f32[tid] = dot;
        workgroupBarrier();
        if (tid == 0u) {
            var row_sum = 0.0;
            for (var i = 0u; i < 64u; i++) { row_sum += shared_f32[i]; }
            // Add O projection bias
            let o_bias = load_weight_value(config.o_b_start + row);
            // 6. Residual Connection
            hidden_state.hidden[pos * HIDDEN_DIM + row] += row_sum + o_bias;
        }
        workgroupBarrier();
    }
}
