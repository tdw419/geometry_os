// ============================================
// GEOMETRY OS - SEMANTIC EXPANSION SHADER
// Phase 22.5: GPU Semantic Substrate
// ============================================

// --- BINDINGS ---

// 0: Source RTS Texture (Semantic Tokens) - RGBA8UNORM format
// Stored as normalized floats (0.0-1.0), need to convert to u8
@group(0) @binding(0) var source_texture: texture_2d<f32>;

// 1: Dictionary Metadata Map (TokenID -> {offset, length})
// Each token maps to [offset, length] pair
@group(0) @binding(1) var<storage, read> dictionary_metadata: array<vec2<u32>>;

// 2: Flattened Dictionary Code (Compressed RISC-V instructions)
@group(0) @binding(2) var<storage, read> dictionary_code: array<u32>;

// 3: Expansion Offsets (Computed via Prefix Sum)
// Maps each pixel index to its starting offset in the expanded buffer
@group(0) @binding(3) var<storage, read> expansion_offsets: array<u32>;

// 4: Target Instruction Buffer (Expanded RISC-V code)
@group(0) @binding(4) var<storage, read_write> expanded_code: array<u32>;

// --- CONSTANTS ---

const MAX_TOKEN_LENGTH: u32 = 128u; // Maximum instructions per semantic token

// --- HELPER FUNCTIONS ---

/**
 * Extract Token ID from pixel data
 * Pixel is stored as f32 in RGBA8UNORM format (0.0-1.0)
 * Need to convert each channel to u8 (0-255) then pack
 */
fn extractTokenID(pixel: vec4<f32>) -> u32 {
    // Convert normalized floats to u8
    let r = u32(pixel.r * 255.0 + 0.5);
    let g = u32(pixel.g * 255.0 + 0.5);
    let b = u32(pixel.b * 255.0 + 0.5);
    // Pack: R = bits 16-23, G = bits 8-15, B = bits 0-7
    return (r << 16u) | (g << 8u) | b;
}

// --- COMPUTE KERNELS ---

/**
 * Main semantic expansion kernel
 *
 * Each thread processes one source pixel and expands it
 * into the output instruction buffer.
 *
 * Workgroup size: 8x8 = 64 threads (2D dispatch)
 */
@compute @workgroup_size(8, 8, 1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let width = textureDimensions(source_texture).x;
    let height = textureDimensions(source_texture).y;

    let x = global_id.x;
    let y = global_id.y;

    // Bounds check
    if (x >= width || y >= height) {
        return;
    }

    // Get source pixel coordinates
    let coords = vec2<i32>(i32(x), i32(y));

    // Read pixel from source texture (rgba8unorm format returns vec4<f32>)
    let pixel = textureLoad(source_texture, coords, 0);

    // Extract Token ID from RGBA channels
    let token_id = extractTokenID(pixel);

    // Calculate linear source index
    let source_index = y * width + x;

    // Get output starting offset from expansion offsets buffer
    let output_start_offset = expansion_offsets[source_index];

    // Look up token metadata from dictionary
    // For prototype, we use token_id as direct index (with bounds check)
    // In production, would use a hash table or sparse mapping
    let meta_index = min(token_id, arrayLength(&dictionary_metadata) - 1u);
    let meta = dictionary_metadata[meta_index];

    let dict_offset = meta.x;
    let dict_length = meta.y;

    // Check if this is a valid semantic token
    if (dict_length == 0u || dict_offset == 0u) {
        // Literal pixel: encode as single 32-bit instruction
        // Token ID becomes the literal instruction
        expanded_code[output_start_offset] = token_id;
    } else {
        // Semantic pixel: copy instruction block from dictionary
        let clamped_length = min(dict_length, MAX_TOKEN_LENGTH);
        for (var i = 0u; i < clamped_length; i = i + 1u) {
            let dict_idx = dict_offset + i;
            let out_idx = output_start_offset + i;

            // Bounds check for dictionary access
            if (dict_idx < arrayLength(&dictionary_code)) {
                expanded_code[out_idx] = dictionary_code[dict_idx];
            }
        }
    }
}

/**
 * 1D variant of the expansion kernel
 *
 * Uses 1D workgroups for simpler dispatch logic.
 * Workgroup size: 256 threads
 */
@compute @workgroup_size(256)
fn main_1d(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let index = global_id.x;

    // Get texture dimensions
    let dims = textureDimensions(source_texture);
    let total_pixels = dims.x * dims.y;

    // Bounds check
    if (index >= total_pixels) {
        return;
    }

    // Convert linear index to 2D coordinates
    let x = index % dims.x;
    let y = index / dims.x;

    // Get source pixel coordinates
    let coords = vec2<i32>(i32(x), i32(y));

    // Read pixel from source texture (rgba8unorm format returns vec4<f32>)
    let pixel = textureLoad(source_texture, coords, 0);

    // Extract Token ID
    let token_id = extractTokenID(pixel);

    // Get output starting offset
    let output_start_offset = expansion_offsets[index];

    // Look up token metadata
    let meta_index = min(token_id, arrayLength(&dictionary_metadata) - 1u);
    let meta = dictionary_metadata[meta_index];

    let dict_offset = meta.x;
    let dict_length = meta.y;

    // Handle semantic vs literal pixels
    if (dict_length == 0u || dict_offset == 0u) {
        expanded_code[output_start_offset] = token_id;
    } else {
        let clamped_length = min(dict_length, MAX_TOKEN_LENGTH);
        for (var i = 0u; i < clamped_length; i = i + 1u) {
            let dict_idx = dict_offset + i;
            let out_idx = output_start_offset + i;

            if (dict_idx < arrayLength(&dictionary_code)) {
                expanded_code[out_idx] = dictionary_code[dict_idx];
            }
        }
    }
}

/**
 * Atomic-based expansion variant
 *
 * Uses atomic operations to handle variable-length tokens
 * without pre-computed offset buffers.
 *
 * Requires an atomic counter at binding 5.
 */
struct AtomicCounter {
    value: atomic<u32>,
};

@group(0) @binding(5) var<storage, read_write> output_counter: AtomicCounter;

@compute @workgroup_size(8, 8, 1)
fn main_atomic(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let width = textureDimensions(source_texture).x;
    let height = textureDimensions(source_texture).y;

    let x = global_id.x;
    let y = global_id.y;

    // Bounds check
    if (x >= width || y >= height) {
        return;
    }

    // Get source pixel
    let coords = vec2<i32>(i32(x), i32(y));
    let pixel = textureLoad(source_texture, coords, 0);
    let token_id = extractTokenID(pixel);

    // Look up token metadata
    let meta_index = min(token_id, arrayLength(&dictionary_metadata) - 1u);
    let meta = dictionary_metadata[meta_index];

    let dict_offset = meta.x;
    let dict_length = meta.y;

    // Determine output length (1 for literal, dict_length for semantic)
    let output_length = select(1u, dict_length, dict_length > 0u);
    output_length = min(output_length, MAX_TOKEN_LENGTH);

    // Atomically reserve space in output buffer
    let output_offset = atomicAdd(&output_counter.value, output_length);

    // Copy instructions to output
    if (dict_length == 0u || dict_offset == 0u) {
        expanded_code[output_offset] = token_id;
    } else {
        for (var i = 0u; i < output_length; i = i + 1u) {
            let dict_idx = dict_offset + i;
            if (dict_idx < arrayLength(&dictionary_code)) {
                expanded_code[output_offset + i] = dictionary_code[dict_idx];
            }
        }
    }
}
