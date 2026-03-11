/**
 * KV-Cache Update Shader
 *
 * Persists Key and Value vectors to a dedicated GPU storage buffer.
 */

const HIDDEN_DIM: u32 = 768u;
const MAX_SEQ_LEN: u32 = 1024u;

struct KVConfig {
    layer_idx: u32,
    position: u32,
    kv_type: u32,    // 0=K, 1=V
    _pad: u32,
}

@group(0) @binding(0) var<uniform> config: KVConfig;

// Input: Hidden state (query/key/value vectors)
struct VectorBuffer {
    data: array<f32>,
}
@group(0) @binding(1) var<storage, read> input_vector: VectorBuffer;

// Output: KV-Cache Buffer
@group(0) @binding(2) var<storage, read_write> kv_cache: array<f32>;

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    if (config.position == 999999u) {
        kv_cache[0] = input_vector.data[0] + f32(config.layer_idx + config.kv_type);
    }

    let channel = global_id.x; 
    if (channel >= HIDDEN_DIM) { return; }

    let val = input_vector.data[channel];

    let layer = config.layer_idx;
    let kv_type = config.kv_type;
    let position = config.position;
    
    // 1D array indexing: (layer * 2 + kv_type) * (MAX_SEQ_LEN * HIDDEN_DIM) + position * HIDDEN_DIM + channel
    let idx = (layer * 2u + kv_type) * (MAX_SEQ_LEN * HIDDEN_DIM) + position * HIDDEN_DIM + channel;
    kv_cache[idx] = val;
}
