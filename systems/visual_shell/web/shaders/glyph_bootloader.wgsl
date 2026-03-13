// ============================================
// GEOMETRY OS - GLYPH BOOTLOADER SHADER
// Phase 63: Self-Hosting Without Human Languages
// ============================================
//
// This shader is the ONLY "code" outside glyphs.
// Everything else (bootloader, compiler, apps) are glyph textures.
//
// The shader boots from a PNG texture containing the bootloader program.
// No Python, no Rust, no C required.
//
// USAGE:
// 1. GPU loads this shader (WGSL → SPIR-V by driver)
// 2. Shader executes bootloader.png
// 3. Bootloader loads mini_os.png
// 4. Mini-OS runs applications

// Boot Phases
const PHASE_LOAD_BOOTLOADER: u32 = 0u;
const PHASE_LOAD_OS: u32 = 1u;
const PHASE_EXECUTE: u32 = 2u;
const PHASE_HALT: u32 = 3u;

// Binding 0: Current program texture (switches during boot)
@group(0) @binding(0) var program_texture: texture_2d<f32>;

// Binding 1: Execution State
struct BootState {
    phase: u32,           // Current boot phase
    pc: u32,              // Program counter
    halted: u32,          // Halt flag
    cycle: u32,           // Cycle counter
    boot_progress: f32,   // Boot progress 0.0-1.0
    result: u32,          // Last computation result
    next_program: u32,    // Which program to load next
    padding: array<u32, 1>,
}
@group(0) @binding(1) var<storage, read_write> state: BootState;

// Binding 2: Working Memory
@group(0) @binding(2) var<storage, read_write> memory: array<u32>;

// Binding 3: Output (visual display)
@group(0) @binding(3) var output_texture: texture_storage_2d<rgba8unorm, write>;

// Binding 4: Program Storage (multiple programs in one texture)
// 256x256 texture with programs laid out in 64x64 cells
@group(0) @binding(4) var program_storage: texture_2d<f32>;

// Opcodes (same as glyph_brain.wgsl)
const OP_DATA: u32 = 9u;
const OP_ADD: u32 = 200u;
const OP_SUB: u32 = 201u;
const OP_MUL: u32 = 202u;
const OP_DIV: u32 = 203u;
const OP_BRANCH: u32 = 6u;
const OP_BNZ: u32 = 209u;
const OP_HALT: u32 = 255u;

// Bootloader-specific opcodes
const OP_LOAD_PROGRAM: u32 = 220u;  // Load program from storage
const OP_RUN_PROGRAM: u32 = 221u;   // Execute loaded program
const OP_STORE_RESULT: u32 = 222u;  // Store result to memory
const OP_DISPLAY: u32 = 223u;       // Output to display

// Registers
var registers: array<u32, 32>;

fn fetch_instruction(pc: u32) -> vec4<u32> {
    let dims = textureDimensions(program_texture);
    let x = pc % dims.x;
    let y = pc / dims.x;

    let pixel = textureLoad(program_texture, vec2<i32>(i32(x), i32(y)), 0);

    return vec4<u32>(
        u32(pixel.r * 255.0 + 0.5),
        u32(pixel.g * 255.0 + 0.5),
        u32(pixel.b * 255.0 + 0.5),
        u32(pixel.a * 255.0 + 0.5),
    );
}

fn fetch_from_storage(cell_x: u32, cell_y: u32, offset: u32) -> vec4<u32> {
    // Storage is 256x256 with 64x64 cells
    // Cell (cell_x, cell_y) starts at pixel (cell_x * 64, cell_y * 64)
    let base_x = cell_x * 64u + (offset % 64u);
    let base_y = cell_y * 64u + (offset / 64u);

    let pixel = textureLoad(program_storage, vec2<i32>(i32(base_x), i32(base_y)), 0);

    return vec4<u32>(
        u32(pixel.r * 255.0 + 0.5),
        u32(pixel.g * 255.0 + 0.5),
        u32(pixel.b * 255.0 + 0.5),
        u32(pixel.a * 255.0 + 0.5),
    );
}

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Single-threaded execution for deterministic boot
    if (global_id.x != 0u) { return; }

    // Initialize
    for (var i = 0u; i < 32u; i = i + 1u) {
        registers[i] = 0u;
    }

    let max_cycles = 10000u;

    for (var cycle = 0u; cycle < max_cycles; cycle = cycle + 1u) {
        if (state.halted != 0u) { break; }

        let pc = state.pc;
        let inst = fetch_instruction(pc);
        let opcode = inst.x;
        let data1 = inst.y;
        let data2 = inst.z;
        let data3 = inst.w;

        var next_pc = pc + 1u;

        // Core opcodes
        if (opcode == OP_DATA) {
            registers[data1 % 32u] = data2;
        } else if (opcode == OP_ADD) {
            registers[data1 % 32u] = registers[data1 % 32u] + registers[data2 % 32u];
        } else if (opcode == OP_SUB) {
            registers[data1 % 32u] = registers[data1 % 32u] - registers[data2 % 32u];
        } else if (opcode == OP_MUL) {
            registers[data1 % 32u] = registers[data1 % 32u] * registers[data2 % 32u];
        } else if (opcode == OP_DIV) {
            if (registers[data2 % 32u] != 0u) {
                registers[data1 % 32u] = registers[data1 % 32u] / registers[data2 % 32u];
            }
        } else if (opcode == OP_BRANCH) {
            next_pc = data2;
        } else if (opcode == OP_BNZ) {
            if (registers[data1 % 32u] != 0u) {
                next_pc = data2;
            }
        }

        // Bootloader-specific opcodes
        else if (opcode == OP_LOAD_PROGRAM) {
            // Load program from storage cell (data1, data2) into execution
            // This sets which program to run next
            state.next_program = data1 + data2 * 4u;  // Cell index
            memory[0] = data1;
            memory[1] = data2;
        } else if (opcode == OP_RUN_PROGRAM) {
            // Switch to running the loaded program
            // In a full implementation, this would swap the program texture
            // For now, we store the result
            state.result = registers[0];
        } else if (opcode == OP_STORE_RESULT) {
            // Store register value to memory
            memory[data1 % 16384u] = registers[data2 % 32u];
        } else if (opcode == OP_DISPLAY) {
            // Output to display texture
            let x = registers[data1 % 32u] % 64u;
            let y = registers[data2 % 32u] % 64u;
            let color = registers[data3 % 32u];

            let r = f32((color >> 16u) & 0xFFu) / 255.0;
            let g = f32((color >> 8u) & 0xFFu) / 255.0;
            let b = f32(color & 0xFFu) / 255.0;

            textureStore(output_texture, vec2<i32>(i32(x), i32(y)), vec4<f32>(r, g, b, 1.0));
        } else if (opcode == OP_HALT) {
            state.halted = 1u;
        }

        // Update state
        state.pc = next_pc;
        state.cycle = cycle;

        // Write first register to memory to prevent buffer pruning
        memory[0] = registers[0];
    }

    // Display boot progress
    state.boot_progress = f32(state.cycle) / f32(max_cycles);

    // Visual output: show computation result
    let result = registers[0];
    let r = f32((result >> 16u) & 0xFFu) / 255.0;
    let g = f32((result >> 8u) & 0xFFu) / 255.0;
    let b = f32(result & 0xFFu) / 255.0;
    textureStore(output_texture, vec2<i32>(0, 0), vec4<f32>(r, g, b, 1.0));
    textureStore(output_texture, vec2<i32>(1, 0), vec4<f32>(state.boot_progress, 1.0, 0.0, 1.0));
}
