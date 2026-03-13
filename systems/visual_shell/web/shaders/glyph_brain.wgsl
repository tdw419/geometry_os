// ============================================
// GEOMETRY OS - GLYPH BRAIN SHADER
// Phase 61: Recursive Compiling (Simplified)
// ============================================

@group(0) @binding(0) var source_texture: texture_2d<f32>;

struct ExecutionState {
    registers: array<atomic<u32>, 32>,
    pc: atomic<u32>,
    halted: atomic<u32>,
    cycle_count: atomic<u32>,
    padding: array<u32, 1>,
};
@group(0) @binding(1) var<storage, read_write> state: ExecutionState;

@group(0) @binding(2) var<storage, read_write> memory: array<u32>;

@group(0) @binding(3) var output_texture: texture_storage_2d<rgba8unorm, write>;

// Opcodes
const OP_DATA: u32 = 9u;
const OP_ADD: u32 = 200u;
const OP_SUB: u32 = 201u;
const OP_MUL: u32 = 202u;
const OP_DIV: u32 = 203u;
const OP_BRANCH: u32 = 6u;
const OP_BNZ: u32 = 209u;
const OP_HALT: u32 = 255u;

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Single-threaded execution for correctness
    if (global_id.x != 0u) { return; }

    let dims = textureDimensions(source_texture);

    for (var cycle = 0u; cycle < 1000u; cycle = cycle + 1u) {
        let pc = atomicLoad(&state.pc);
        if (atomicLoad(&state.halted) != 0u) { break; }

        // Fetch instruction
        let x = pc % dims.x;
        let y = pc / dims.x;
        let pixel = textureLoad(source_texture, vec2<i32>(i32(x), i32(y)), 0);

        let opcode = u32(pixel.r * 255.0 + 0.5);
        let stratum = u32(pixel.g * 255.0 + 0.5);
        let data1 = u32(pixel.b * 255.0 + 0.5);
        let data2 = u32(pixel.a * 255.0 + 0.5);

        var next_pc = pc + 1u;

        // Execute
        if (opcode == OP_DATA) {
            // LOAD immediate: r[data1] = data2
            atomicStore(&state.registers[data1 % 32u], data2);
        } else if (opcode == OP_ADD) {
            // ADD: r[data1] = r[data1] + r[data2]
            let a = atomicLoad(&state.registers[data1 % 32u]);
            let b = atomicLoad(&state.registers[data2 % 32u]);
            atomicStore(&state.registers[data1 % 32u], a + b);
        } else if (opcode == OP_SUB) {
            // SUB: r[data1] = r[data1] - r[data2]
            let a = atomicLoad(&state.registers[data1 % 32u]);
            let b = atomicLoad(&state.registers[data2 % 32u]);
            atomicStore(&state.registers[data1 % 32u], a - b);
        } else if (opcode == OP_MUL) {
            // MUL: r[data1] = r[data1] * r[data2]
            let a = atomicLoad(&state.registers[data1 % 32u]);
            let b = atomicLoad(&state.registers[data2 % 32u]);
            atomicStore(&state.registers[data1 % 32u], a * b);
        } else if (opcode == OP_DIV) {
            // DIV: r[data1] = r[data1] / r[data2]
            let a = atomicLoad(&state.registers[data1 % 32u]);
            let b = atomicLoad(&state.registers[data2 % 32u]);
            if (b != 0u) {
                atomicStore(&state.registers[data1 % 32u], a / b);
            }
        } else if (opcode == OP_BRANCH) {
            // JMP: PC = data2
            next_pc = data2;
        } else if (opcode == OP_BNZ) {
            // BNZ: if r[data1] != 0: PC = data2
            let val = atomicLoad(&state.registers[data1 % 32u]);
            if (val != 0u) {
                next_pc = data2;
            }
        } else if (opcode == OP_HALT) {
            atomicStore(&state.halted, 1u);
        }

        // Update PC
        atomicStore(&state.pc, next_pc);
        atomicAdd(&state.cycle_count, 1u);

        // Write to memory to prevent buffer pruning
        memory[0] = atomicLoad(&state.registers[0]);

        // Bounds check
        if (next_pc >= (dims.x * dims.y)) {
            atomicStore(&state.halted, 1u);
            break;
        }
    }

    // Visual output - show first register as a color
    let r0 = atomicLoad(&state.registers[0]);
    let r = f32((r0 >> 16u) & 0xFFu) / 255.0;
    let g = f32((r0 >> 8u) & 0xFFu) / 255.0;
    let b = f32(r0 & 0xFFu) / 255.0;
    textureStore(output_texture, vec2<i32>(0, 0), vec4<f32>(r, g, b, 1.0));
}
