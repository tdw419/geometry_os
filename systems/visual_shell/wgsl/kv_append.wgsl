/**
 * KV-Cache Update Shader
 *
 * Persists Key and Value vectors to a dedicated GPU texture.
 * Layout:
 *   X-axis: Sequence Position (0-1024)
 *   Y-axis: Layer/Type/Dim index
 *     Layer L: K (rows L*32 to L*32+15), V (rows L*32+16 to L*32+31)
 */

struct KVConfig {
    layer_idx: u32,  // 0-7
    position: u32,   // 0-1023
    kv_type: u32,    // 0=K, 1=V
    _pad: u32,
}

@group(0) @binding(0) var<uniform> config: KVConfig;

// Input: Hidden state (query/key/value vectors)
struct VectorBuffer {
    data: array<f32>,
}
@group(0) @binding(1) var<storage, read> input_vector: VectorBuffer;

// Output: KV-Cache Texture (RGBA32Float)
// Using storage texture for direct write
@group(0) @binding(2) var kv_cache: texture_storage_2d<rgba32float, write>;

@compute @workgroup_size(16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let pixel_idx = global_id.x; // 0 to 15 (for 64-dim vector)
    if (pixel_idx >= 16u) { return; }

    // Map 64-dim vector to 16 RGBA pixels
    let base_idx = pixel_idx * 4u;
    let r = input_vector.data[base_idx + 0u];
    let g = input_vector.data[base_idx + 1u];
    let b = input_vector.data[base_idx + 2u];
    let a = input_vector.data[base_idx + 3u];

    // Calculate texture coordinates
    let pixel_x = config.position;
    let y_base = config.layer_idx * 32u;
    let y = y_base + (config.kv_type * 16u) + pixel_idx;

    // Write to KV-cache texture
    textureStore(kv_cache, vec2<u32>(pixel_x, y), vec4<f32>(r, g, b, a));
}
