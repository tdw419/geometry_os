// ============================================
// GEOMETRY OS - GLYPH MICROCODE SHADER
// Phase 55: Evolutionary Swarm Substrate
// ============================================

@group(0) @binding(0) var source_texture: texture_2d<f32>;

struct ExecutionState {
    pc: u32,
    halted: u32,
    cycle_count: u32,
    time: f32, // New: Global time for animation
};
@group(0) @binding(1) var<storage, read_write> state: ExecutionState;

@group(0) @binding(2) var<storage, read_write> memory: array<u32>;

@group(0) @binding(3) var output_texture: texture_storage_2d<rgba8unorm, write>;

// Binding 4: Swarm DNA (Genetic Parameters)
// Each agent has 4x u32 DNA: [ColorBias, SpeedBias, SpatialBias, MutationRate]
@group(0) @binding(4) var<storage, read> swarm_dna: array<vec4<u32>>;

const OP_ADD: u32 = 200u;
const OP_SUB: u32 = 201u;
const OP_MUL: u32 = 202u;
const OP_BRANCH: u32 = 6u;
const OP_BNZ: u32 = 209u;
const OP_DATA: u32 = 9u;
const OP_HALT: u32 = 255u;
const OP_DRAW: u32 = 215u;

@compute @workgroup_size(128)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let thread_id = global_id.x;
    if (thread_id >= 10000u) { return; }

    let dna = swarm_dna[thread_id];
    let dims = textureDimensions(source_texture);
    var registers: array<u32, 32>;
    var pc: u32 = 0u; 
    var halted: u32 = 0u;

    // Use DNA to seed registers
    registers[1] = dna.x; // Color Personality
    registers[2] = dna.z; // Initial Position Seed

    for (var i = 0u; i < 100u; i = i + 1u) {
        if (halted != 0u) { break; }

        let x = pc % dims.x;
        let y = pc / dims.x;
        let pixel = textureLoad(source_texture, vec2<i32>(i32(x), i32(y)), 0);

        let opcode = u32(pixel.r * 255.0 + 0.5);
        let data1 = u32(pixel.b * 255.0 + 0.5);
        let data2 = u32(pixel.a * 255.0 + 0.5);

        var next_pc = pc + 1u;

        if (opcode == OP_DATA) {
            registers[data1 % 32u] = data2;
        } else if (opcode == OP_ADD) {
            registers[data1 % 32u] = registers[data1 % 32u] + registers[data2 % 32u];
        } else if (opcode == OP_SUB) {
            registers[data1 % 32u] = registers[data1 % 32u] - registers[data2 % 32u];
        } else if (opcode == OP_MUL) {
            registers[data1 % 32u] = registers[data1 % 32u] * registers[data2 % 32u];
        } else if (opcode == OP_BRANCH) {
            next_pc = data2;
        } else if (opcode == OP_BNZ) {
            if (registers[data1 % 32u] != 0u) { next_pc = data2; }
        } else if (opcode == OP_DRAW) {
            // Evolved Liquid DRAW
            let speed = f32(dna.y % 100u) / 10.0;
            let offset_x = sin(state.time * speed + f32(thread_id)) * 2.0;
            let offset_y = cos(state.time * speed + f32(thread_id)) * 2.0;

            let tx = i32(f32(dna.z) + offset_x);
            let ty = i32(f32(dna.w) + offset_y);

            let color_raw = dna.x;
            let r = f32((color_raw >> 24u) & 0xFFu) / 255.0;
            let g = f32((color_raw >> 16u) & 0xFFu) / 255.0;
            let b = f32((color_raw >> 8u) & 0xFFu) / 255.0;

            textureStore(output_texture, vec2<i32>(tx, ty), vec4<f32>(r, g, b, 1.0));
        }
 else if (opcode == OP_HALT) {
            halted = 1u;
        }

        pc = next_pc;
        if (pc >= (dims.x * dims.y)) { break; }
    }
}
