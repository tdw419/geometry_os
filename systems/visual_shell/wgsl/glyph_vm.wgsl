// ============================================
// GEOMETRY OS - GLYPH VIRTUAL MACHINE
// Phase 43: Native Glyph Execution
// This shader bypasses human programming languages by interpreting
// the visual pixels of the Brain Atlas directly as executable instructions.
// ============================================

struct Uniforms {
    atlas_width: u32,
    atlas_height: u32,
    execution_step: u32,
    _pad: u32,
};

@group(0) @binding(0) var<uniform> uniforms: Uniforms;

// The "Hard Drive" - The visual state of the OS
@group(0) @binding(1) var<storage, read> atlas_pixels: array<vec4<f32>>;

// The "RAM" - The output state of the execution
@group(0) @binding(2) var<storage, read_write> memory_state: array<f32>;

// Opcode Definitions (Mirroring GlyphStratum)
const OP_NOP: u32 = 0u;
const OP_LOAD: u32 = 3u;
const OP_STORE: u32 = 4u;
const OP_CALL: u32 = 7u;
const OP_DATA: u32 = 9u;

// Semantic Sector Mapping (B Channel)
fn decode_opcode(b_channel: f32) -> u32 {
    let sector = u32(b_channel * 5.0);
    if (sector == 0u) { return OP_DATA; }     // Embedding
    if (sector == 1u) { return OP_CALL; }     // Attention
    if (sector == 2u) { return OP_LOAD; }     // FFN
    if (sector == 3u) { return OP_STORE; }    // Norm (Adapted for VM)
    return OP_NOP;
}

@compute @workgroup_size(64)
fn execute_glyphs(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let pixel_idx = global_id.x;
    let total_pixels = uniforms.atlas_width * uniforms.atlas_height;
    
    if (pixel_idx >= total_pixels) { return; }

    // 1. FETCH INSTRUCTION (Read the visual state)
    let pixel = atlas_pixels[pixel_idx];
    
    let activation = pixel.r; // Value/Magnitude
    let entropy = pixel.g;    // Uncertainty/Condition
    let sector = pixel.b;     // Opcode Family

    // 2. DECODE
    let opcode = decode_opcode(sector);
    
    // 3. EXECUTE (The Glyph VM)
    // In a fully native OS, this modifies memory based purely on the glyph's physical properties.
    var result: f32 = 0.0;

    switch opcode {
        case 9u: { // OP_DATA
            // Raw substrate data
            result = activation;
        }
        case 3u: { // OP_LOAD
            // Memory retrieval (simplified: load from adjacent cell)
            let adj_idx = (pixel_idx + 1u) % total_pixels;
            result = memory_state[adj_idx] * activation;
        }
        case 4u: { // OP_STORE
            // Memory mutation
            memory_state[pixel_idx] = activation;
            result = activation;
        }
        case 7u: { // OP_CALL
            // Logic execution (simplified: dot product or activation)
            if (entropy < 0.6) {
                // High confidence execution
                result = activation * 2.0; 
            } else {
                // High entropy branch path (stochastic)
                result = activation * 0.5;
            }
        }
        default: {
            result = 0.0;
        }
    }

    // 4. WRITE BACK
    // Currently writing to RAM, but in Phase 44 this writes back to atlas_pixels
    memory_state[pixel_idx] = result;
}
