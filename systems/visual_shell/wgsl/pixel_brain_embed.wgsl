/**
 * PixelBrain Embedding Lookup Shader
 *
 * "Thalamic Gateway" for token → hidden state conversion.
 * Reads Hilbert-mapped weights from the Brain Atlas texture.
 *
 * Invoked by GeoASM opcode 0xD0 (EMBED)
 * Input: token_id from R1 register
 * Output: hidden_state[64] to R2 buffer
 */

// Constants from TinyStories-1M config
const VOCAB_SIZE: u32 = 50257u;
const HIDDEN_DIM: u32 = 64u;
const ATLAS_SIZE: u32 = 1024u;

// Embedding sector starts at Hilbert index 0 (top-left of atlas)
// Each token's embedding is 64 floats = 16 pixels (4 floats per RGBA)
const EMBED_SECTOR_START: u32 = 0u;
const FLOATS_PER_PIXEL: u32 = 4u;
const PIXELS_PER_TOKEN: u32 = HIDDEN_DIM / FLOATS_PER_PIXEL; // 16

// ═══════════════════════════════════════════════════════════════════════════════
// BINDING LAYOUT
// ═══════════════════════════════════════════════════════════════════════════════

// The Brain Atlas texture (RGBA32Float for precision)
@group(0) @binding(0) var brain_atlas: texture_2d<f32>;

// Input: token IDs buffer
struct TokenBuffer {
    tokens: array<u32>,
}
@group(0) @binding(1) var<storage, read> input_tokens: TokenBuffer;

// Output: Hidden states buffer
struct HiddenBuffer {
    // [batch * hidden_dim] - each token produces 64 floats
    hidden: array<f32>,
}
@group(0) @binding(2) var<storage, read_write> output_hidden: HiddenBuffer;

// Configuration uniforms
struct EmbedConfig {
    batch_size: u32,
    atlas_size: u32,
    embed_sector_start: u32,
    position_offset: u32,
}
@group(0) @binding(3) var<uniform> config: EmbedConfig;

// ═══════════════════════════════════════════════════════════════════════════════
// HILBERT CURVE COMPUTATION
// ═══════════════════════════════════════════════════════════════════════════════

/**
 * Convert Hilbert distance d to (x, y) coordinates.
 * Matches the CPU implementation in pixelrts_v2_core.py
 */
fn hilbert_d2xy(d: u32, n: u32) -> vec2<u32> {
    var x: u32 = 0u;
    var y: u32 = 0u;
    var t: u32 = d;
    var s: u32 = 1u;

    while (s < n) {
        let rx = (t >> 1u) & 1u;
        let ry = (t ^ rx) & 1u;

        // Rotate/flip quadrant
        var new_x = x;
        var new_y = y;

        if (ry == 0u) {
            if (rx == 1u) {
                new_x = s - 1u - x;
                new_y = s - 1u - y;
            }
            // Swap
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

/**
 * Get the pixel coordinate for a specific float index in the embedding sector.
 * Each pixel stores 4 floats (RGBA), so we calculate which pixel and which channel.
 */
fn get_embed_coord(token_id: u32, float_offset: u32) -> vec2<u32> {
    // Total float index = token_start + float_offset
    let token_start = token_id * HIDDEN_DIM;
    let total_float_idx = config.embed_sector_start + token_start + float_offset;

    // Convert to pixel index (4 floats per pixel)
    let pixel_idx = total_float_idx / FLOATS_PER_PIXEL;

    // Hilbert map to (x, y)
    return hilbert_d2xy(pixel_idx, config.atlas_size);
}

// ═══════════════════════════════════════════════════════════════════════════════
// EMBEDDING LOOKUP
// ═══════════════════════════════════════════════════════════════════════════════

/**
 * Look up the embedding vector for a single token.
 * Reads 16 pixels (64 floats) from the brain atlas.
 */
fn lookup_embedding(token_id: u32, out_base: u32) {
    // Each workitem reads 4 floats (1 pixel) at a time
    // We process 16 pixels for the full 64-dim embedding

    for (var pixel_off = 0u; pixel_off < PIXELS_PER_TOKEN; pixel_off++) {
        let float_base = pixel_off * FLOATS_PER_PIXEL;
        let coord = get_embed_coord(token_id, float_base);

        // Sample the atlas texture
        let pixel = textureLoad(brain_atlas, coord, 0);

        // Write to output buffer
        output_hidden.hidden[out_base + float_base + 0u] = pixel.r;
        output_hidden.hidden[out_base + float_base + 1u] = pixel.g;
        output_hidden.hidden[out_base + float_base + 2u] = pixel.b;
        output_hidden.hidden[out_base + float_base + 3u] = pixel.a;
    }
}

/**
 * Main compute entry point.
 * Each invocation processes one token in the batch.
 */
@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let batch_idx = global_id.x;

    if (batch_idx >= config.batch_size) {
        return;
    }

    let token_id = input_tokens.tokens[config.position_offset + batch_idx];

    // Bounds check
    if (token_id >= VOCAB_SIZE) {
        // Write zeros for invalid tokens
        for (var i = 0u; i < HIDDEN_DIM; i++) {
            output_hidden.hidden[(config.position_offset + batch_idx) * HIDDEN_DIM + i] = 0.0;
        }
        return;
    }

    // Lookup embedding
    let out_base = (config.position_offset + batch_idx) * HIDDEN_DIM;
    lookup_embedding(token_id, out_base);
}

// ═══════════════════════════════════════════════════════════════════════════════
// VISUALIZATION HOOK (for compositor)
// ═══════════════════════════════════════════════════════════════════════════════

/**
 * Optional: Output which atlas pixels were accessed for visualization.
 * The compositor can highlight these during inference.
 */
struct AccessPattern {
    // Packed coordinates: x in lower 16 bits, y in upper 16 bits
    coords: array<u32>,
}

@group(1) @binding(0) var<storage, read_write> access_pattern: AccessPattern;

fn record_access(batch_idx: u32, token_id: u32) {
    // Record the 16 pixels accessed for this token
    for (var i = 0u; i < PIXELS_PER_TOKEN; i++) {
        let coord = get_embed_coord(token_id, i * FLOATS_PER_PIXEL);
        let packed = coord.x | (coord.y << 16u);
        access_pattern.coords[batch_idx * PIXELS_PER_TOKEN + i] = packed;
    }
}
