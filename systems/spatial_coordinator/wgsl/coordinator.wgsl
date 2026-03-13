// coordinator.wgsl
// Main Spatial Program Coordinator Compute Shader
//
// NOTE: WGSL does not support #include. This file is concatenated at build time with:
//   interrupt_injector.wgsl, app_loader.wgsl, syscall_handler.wgsl
// See: build_shaders.py
//
// Build order: interrupt_injector.wgsl + app_loader.wgsl + syscall_handler.wgsl + coordinator.wgsl

struct CoordinatorUniforms {
    map_width: u32,
    map_height: u32,
    frame_count: u32,
    app_count: u32,
}

@group(0) @binding(0) var<uniform> uniforms: CoordinatorUniforms;
@group(0) @binding(1) var<storage, read_write> infinite_map: array<u32>;
@group(0) @binding(2) var<storage, read> app_registry: array<AppHeader>;
@group(0) @binding(3) var<storage, read> interrupts: array<Interrupt>;
@group(0) @binding(4) var<storage, read_write> syscall_queue: array<SyscallRequest>;

const OP_INT: u32 = 16u;    // 0x10
const OP_SYNC: u32 = 254u;  // 0xFE
const OP_HALT: u32 = 255u;  // 0xFF

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) gid: vec3<u32>) {
    let cell_idx = gid.x;
    let total_cells = uniforms.map_width * uniforms.map_height;

    if (cell_idx >= total_cells) {
        return;
    }

    // Phase 1: Inject pending interrupts (handled by inject_interrupts shader)
    // Phase 2: Propagate interrupts spatially (handled by propagate_interrupts shader)

    // Phase 3: Execute glyph at this cell
    let glyph = infinite_map[cell_idx];

    if (glyph == OP_SYNC) {
        // Queue syscall for processing
        // Read R0, R1, R2 from register file (simplified)
        var req: SyscallRequest;
        req.app_id = 0u;  // Would be resolved from cell position
        req.syscall_id = 0u;  // Would be read from R0
        req.arg1 = 0u;
        req.arg2 = 0u;
        enqueue_syscall(req);
    } else if (glyph == OP_HALT) {
        // App halted
        return;
    }

    // Phase 4: Execute glyph microcode
    // Delegated to existing glyph_vm.wgsl / glyph_microcode.wgsl
}
