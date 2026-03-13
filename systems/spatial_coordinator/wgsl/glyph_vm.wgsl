// ============================================
// GEOMETRY OS - GLYPH VM (GPU-NATIVE)
// Spatial Program Coordinator
//
// Executes glyph bytecode on GPU using SIMT model.
// Each workgroup executes one app, each thread one "execution lane".
// ============================================

// Opcode constants (must match opcodes.py)
const OP_NOP: u32 = 0u;
const OP_HALT: u32 = 255u;
const OP_JMP: u32 = 1u;
const OP_JEQ: u32 = 2u;
const OP_JNE: u32 = 3u;
const OP_JLT: u32 = 4u;
const OP_JGT: u32 = 5u;
const OP_JLE: u32 = 6u;
const OP_JGE: u32 = 7u;
const OP_CALL: u32 = 8u;
const OP_RET: u32 = 9u;

const OP_MOV: u32 = 16u;
const OP_MOVI: u32 = 17u;
const OP_LD: u32 = 18u;
const OP_ST: u32 = 19u;

const OP_ADD: u32 = 32u;
const OP_SUB: u32 = 33u;
const OP_MUL: u32 = 34u;
const OP_DIV: u32 = 35u;
const OP_MOD: u32 = 36u;
const OP_ADDI: u32 = 37u;
const OP_SUBI: u32 = 38u;

const OP_AND: u32 = 48u;
const OP_OR: u32 = 49u;
const OP_XOR: u32 = 50u;
const OP_NOT: u32 = 51u;
const OP_SHL: u32 = 52u;
const OP_SHR: u32 = 53u;

const OP_CMP: u32 = 64u;
const OP_CMPI: u32 = 65u;

const OP_SYNC: u32 = 254u;
const OP_DRAW: u32 = 80u;

// Register aliases
const REG_REGION_ORIGIN: u32 = 28u;
const REG_INT_PAYLOAD: u32 = 29u;
const REG_INT_TYPE: u32 = 30u;
const REG_INT_SOURCE: u32 = 31u;

// Compare flags
const FLAG_ZERO: u32 = 1u;
const FLAG_NEGATIVE: u32 = 2u;

// Maximum execution steps per frame (prevent infinite loops)
const MAX_STEPS: u32 = 1000u;

// ============================================
// DATA STRUCTURES
// ============================================

/// App execution context
struct AppContext {
    app_id: u32,
    origin_x: u32,
    origin_y: u32,
    width: u32,
    height: u32,
    pc: u32,              // Program counter (byte offset)
    halted: u32,          // Halted flag
    flags: u32,           // Compare flags
    _pad: u32,
    _pad2: u32,
}

/// Register file for one app (32 registers, 32-bit each)
struct RegisterFile {
    regs: array<u32, 32>,
}

/// Memory for one app (64KB)
struct AppMemory {
    data: array<u32, 16384>,  // 64KB / 4 = 16384 u32s
}

/// Call stack entry
struct StackFrame {
    return_pc: u32,
    _pad: u32,
    _pad2: u32,
    _pad3: u32,
}

/// Call stack for one app (max 64 frames)
struct CallStack {
    frames: array<StackFrame, 64>,
    depth: u32,
    _pad: u32,
    _pad2: u32,
    _pad3: u32,
}

/// Syscall request (queued for coordinator)
struct SyscallRequest {
    app_id: u32,
    syscall_id: u32,
    arg1: u32,
    arg2: u32,
    return_value: u32,
    processed: u32,
    _pad: u32,
    _pad2: u32,
}

// ============================================
// BINDINGS
// ============================================

// App contexts (one per app)
@group(0) @binding(0) var<storage, read_write> app_contexts: array<AppContext>;

// Register files (one per app)
@group(0) @binding(1) var<storage, read_write> register_files: array<RegisterFile>;

// App memories (one per app)
@group(0) @binding(2) var<storage, read_write> app_memories: array<AppMemory>;

// Call stacks (one per app)
@group(0) @binding(3) var<storage, read_write> call_stacks: array<CallStack>;

// Syscall queue
@group(0) @binding(4) var<storage, read_write> syscall_queue: array<SyscallRequest>;
@group(0) @binding(5) var<storage, read_write> syscall_count: atomic<u32>;

// Frame counter
@group(0) @binding(6) var<uniform> frame_count: u32;

// Display buffer (1920x1080 packed RGBA)
@group(0) @binding(7) var<storage, read_write> display_buffer: array<u32, 2073600>;

// Font Atlas (256x256 monochrome glyphs, packed into u32 bits)
@group(0) @binding(8) var<storage, read> font_atlas: array<u32, 2048>; // 256*256 / 32 = 2048

// ============================================
// UTILITY FUNCTIONS
// ============================================

/// Fetch instruction at PC (returns 4 bytes packed as u32)
fn fetch_instruction(app_id: u32, pc: u32) -> vec4<u32> {
    // Each instruction is 4 bytes: opcode, rd, rs1, rs2/imm
    let mem_idx = pc / 4u;
    let word = app_memories[app_id].data[mem_idx];

    // Unpack bytes (little-endian)
    return vec4<u32>(
        word & 0xFFu,           // opcode
        (word >> 8u) & 0xFFu,   // rd
        (word >> 16u) & 0xFFu,  // rs1
        (word >> 24u) & 0xFFu,  // rs2/imm
    );
}

/// Read register
fn read_reg(app_id: u32, reg: u32) -> u32 {
    if (reg >= 32u) { return 0u; }
    return register_files[app_id].regs[reg];
}

/// Write register
fn write_reg(app_id: u32, reg: u32, value: u32) {
    if (reg >= 32u) { return; }
    register_files[app_id].regs[reg] = value;
}

/// Read memory (4 bytes)
fn read_mem(app_id: u32, addr: u32) -> u32 {
    if (addr >= 65536u) { return 0u; }
    return app_memories[app_id].data[addr / 4u];
}

/// Write memory (4 bytes)
fn write_mem(app_id: u32, addr: u32, value: u32) {
    if (addr >= 65536u) { return; }
    app_memories[app_id].data[addr / 4u] = value;
}

/// Update compare flags
fn update_flags(app_id: u32, result: i32) {
    var flags: u32 = 0u;
    if (result == 0) { flags |= FLAG_ZERO; }
    if (result < 0) { flags |= FLAG_NEGATIVE; }
    app_contexts[app_id].flags = flags;
}

/// Check zero flag
fn zero_flag(app_id: u32) -> bool {
    return (app_contexts[app_id].flags & FLAG_ZERO) != 0u;
}

/// Check negative flag
fn negative_flag(app_id: u32) -> bool {
    return (app_contexts[app_id].flags & FLAG_NEGATIVE) != 0u;
}

/// Push to call stack
fn push_stack(app_id: u32, return_pc: u32) -> bool {
    var stack = call_stacks[app_id];
    if (stack.depth >= 64u) { return false; }
    stack.frames[stack.depth].return_pc = return_pc;
    stack.depth += 1u;
    return true;
}

/// Pop from call stack
fn pop_stack(app_id: u32) -> u32 {
    var stack = call_stacks[app_id];
    if (stack.depth == 0u) { return 0xFFFFFFFFu; }
    stack.depth -= 1u;
    return stack.frames[stack.depth].return_pc;
}

/// Enqueue syscall
fn enqueue_syscall(app_id: u32, syscall_id: u32, arg1: u32, arg2: u32) {
    let idx = atomicAdd(&syscall_count, 1u);
    if (idx < 256u) {  // Max syscalls per frame
        var req: SyscallRequest;
        req.app_id = app_id;
        req.syscall_id = syscall_id;
        req.arg1 = arg1;
        req.arg2 = arg2;
        req.return_value = 0u;
        req.processed = 0u;
        syscall_queue[idx] = req;
    }
}

// ============================================
// INSTRUCTION EXECUTION
// ============================================

/// Execute one instruction, return next PC (0 = sequential)
fn execute_instruction(app_id: u32, opcode: u32, rd: u32, rs1: u32, rs2: u32, current_pc: u32) -> u32 {
    let ctx = app_contexts[app_id];

    // Control flow
    if (opcode == OP_NOP) {
        return 0u;
    }

    if (opcode == OP_HALT) {
        app_contexts[app_id].halted = 1u;
        return current_pc;
    }

    if (opcode == OP_JMP) {
        return rs2;
    }

    if (opcode == OP_JEQ) {
        if (zero_flag(app_id)) {
            return rs2;
        }
        return 0u;
    }

    if (opcode == OP_JNE) {
        if (!zero_flag(app_id)) {
            return rs2;
        }
        return 0u;
    }

    if (opcode == OP_JLT) {
        if (negative_flag(app_id) && !zero_flag(app_id)) {
            return read_reg(app_id, rs1);
        }
        return 0u;
    }

    if (opcode == OP_JGT) {
        if (!negative_flag(app_id) && !zero_flag(app_id)) {
            return read_reg(app_id, rs1);
        }
        return 0u;
    }

    if (opcode == OP_JLE) {
        if (zero_flag(app_id) || negative_flag(app_id)) {
            return read_reg(app_id, rs1);
        }
        return 0u;
    }

    if (opcode == OP_JGE) {
        if (zero_flag(app_id) || !negative_flag(app_id)) {
            return read_reg(app_id, rs1);
        }
        return 0u;
    }

    if (opcode == OP_CALL) {
        if (push_stack(app_id, ctx.pc + 4u)) {
            return read_reg(app_id, rs1);
        }
        return 0u;
    }

    if (opcode == OP_RET) {
        let ret_pc = pop_stack(app_id);
        if (ret_pc != 0xFFFFFFFFu) {
            return ret_pc;
        }
        app_contexts[app_id].halted = 1u;
        return ctx.pc;
    }

    // Data movement
    if (opcode == OP_MOV) {
        write_reg(app_id, rd, read_reg(app_id, rs1));
        return 0u;
    }

    if (opcode == OP_MOVI) {
        write_reg(app_id, rd, rs2);
        return 0u;
    }

    if (opcode == OP_LD) {
        let addr = read_reg(app_id, rs1) + rs2;
        write_reg(app_id, rd, read_mem(app_id, addr));
        return 0u;
    }

    if (opcode == OP_ST) {
        let addr = read_reg(app_id, rs1) + rs2;
        write_mem(app_id, addr, read_reg(app_id, rd));
        return 0u;
    }

    // Arithmetic
    if (opcode == OP_ADD) {
        let val = read_reg(app_id, rd) + read_reg(app_id, rs1);
        write_reg(app_id, rd, val);
        return 0u;
    }

    if (opcode == OP_SUB) {
        let val = read_reg(app_id, rd) - read_reg(app_id, rs1);
        write_reg(app_id, rd, val);
        return 0u;
    }

    if (opcode == OP_MUL) {
        let val = read_reg(app_id, rd) * read_reg(app_id, rs1);
        write_reg(app_id, rd, val);
        return 0u;
    }

    if (opcode == OP_DIV) {
        let divisor = read_reg(app_id, rs1);
        if (divisor != 0u) {
            write_reg(app_id, rd, read_reg(app_id, rd) / divisor);
        }
        return 0u;
    }

    if (opcode == OP_MOD) {
        let divisor = read_reg(app_id, rs1);
        if (divisor != 0u) {
            write_reg(app_id, rd, read_reg(app_id, rd) % divisor);
        }
        return 0u;
    }

    if (opcode == OP_ADDI) {
        let val = read_reg(app_id, rd) + rs2;
        write_reg(app_id, rd, val);
        return 0u;
    }

    if (opcode == OP_SUBI) {
        let val = read_reg(app_id, rd) - rs2;
        write_reg(app_id, rd, val);
        return 0u;
    }

    // Logic
    if (opcode == OP_AND) {
        write_reg(app_id, rd, read_reg(app_id, rd) & read_reg(app_id, rs1));
        return 0u;
    }

    if (opcode == OP_OR) {
        write_reg(app_id, rd, read_reg(app_id, rd) | read_reg(app_id, rs1));
        return 0u;
    }

    if (opcode == OP_XOR) {
        write_reg(app_id, rd, read_reg(app_id, rd) ^ read_reg(app_id, rs1));
        return 0u;
    }

    if (opcode == OP_NOT) {
        write_reg(app_id, rd, ~read_reg(app_id, rd));
        return 0u;
    }

    if (opcode == OP_SHL) {
        let shift = read_reg(app_id, rs1) & 31u;
        write_reg(app_id, rd, read_reg(app_id, rd) << shift);
        return 0u;
    }

    if (opcode == OP_SHR) {
        let shift = read_reg(app_id, rs1) & 31u;
        write_reg(app_id, rd, read_reg(app_id, rd) >> shift);
        return 0u;
    }

    // Compare
    if (opcode == OP_CMP) {
        let a = read_reg(app_id, rd);
        let b = read_reg(app_id, rs1);
        // Convert to signed for comparison
        let a_signed = bitcast<i32>(a);
        let b_signed = bitcast<i32>(b);
        update_flags(app_id, a_signed - b_signed);
        return 0u;
    }

    if (opcode == OP_CMPI) {
        let a = read_reg(app_id, rd);
        let a_signed = bitcast<i32>(a);
        let b_signed = i32(rs2);
        update_flags(app_id, a_signed - b_signed);
        return 0u;
    }

    // Special
    if (opcode == OP_SYNC) {
        let syscall_id = read_reg(app_id, 0u);  // R0
        let arg1 = read_reg(app_id, 1u);        // R1
        let arg2 = read_reg(app_id, 2u);        // R2
        enqueue_syscall(app_id, syscall_id, arg1, arg2);
        // Return value will be written by coordinator
        return 0u;
    }

    if (opcode == OP_DRAW) {
        let glyph_id = read_reg(app_id, rd);
        let x = read_reg(app_id, rs1) + ctx.origin_x;
        let y = read_reg(app_id, rs2) + ctx.origin_y;
        
        // Simple 8x8 character blit
        let atlas_x = (glyph_id % 32u) * 8u;
        let atlas_y = (glyph_id / 32u) * 8u;
        
        for (var row = 0u; row < 8u; row++) {
            for (var col = 0u; col < 8u; col++) {
                let ax = atlas_x + col;
                let ay = atlas_y + row;
                let bit_idx = ay * 256u + ax;
                let word_idx = bit_idx / 32u;
                let bit = (font_atlas[word_idx] >> (bit_idx % 32u)) & 1u;
                
                if (bit == 1u) {
                    let px = x + col;
                    let py = y + row;
                    if (px < 1920u && py < 1080u) {
                        display_buffer[py * 1920u + px] = 0xFFFFFFFFu; // White
                    }
                }
            }
        }
        return 0u;
    }

    // Unknown opcode - halt
    app_contexts[app_id].halted = 1u;
    return ctx.pc;
}

// ============================================
// MAIN EXECUTION KERNEL
// ============================================

/// Execute one app for up to MAX_STEPS
/// Each workgroup handles one app, threads cooperate on execution
@compute @workgroup_size(1)
fn execute_app(@builtin(workgroup_id) wid: vec3<u32>) {
    let app_id = wid.x;

    // Check if app is valid and not halted
    let ctx = app_contexts[app_id];
    if (ctx.halted != 0u) { return; }

    // Execute up to MAX_STEPS
    var steps: u32 = 0u;
    var pc = ctx.pc;

    while (steps < MAX_STEPS && app_contexts[app_id].halted == 0u) {
        // Fetch instruction
        let inst = fetch_instruction(app_id, pc);
        let opcode = inst.x;
        let rd = inst.y;
        let rs1 = inst.z;
        let rs2 = inst.w;

        // Update PC in context
        app_contexts[app_id].pc = pc;

        // Execute
        let next_pc = execute_instruction(app_id, opcode, rd, rs1, rs2, pc);

        // Update PC
        if (next_pc != 0u) {
            pc = next_pc;
        } else {
            pc += 4u;
        }

        steps += 1u;
    }

    // Store final PC
    app_contexts[app_id].pc = pc;
}

// ============================================
// BATCH EXECUTION KERNEL
// ============================================

/// Execute all apps in parallel
/// Each app gets one thread in the workgroup
@compute @workgroup_size(64)
fn execute_all_apps(@builtin(global_invocation_id) gid: vec3<u32>) {
    let app_id = gid.x;

    // Bounds check
    // Note: app_count would come from uniforms
    // For now, we assume a fixed max of 64 apps

    let ctx = app_contexts[app_id];
    if (ctx.halted != 0u || ctx.app_id != app_id) { return; }

    // Execute up to MAX_STEPS
    var steps: u32 = 0u;
    var pc = ctx.pc;

    while (steps < MAX_STEPS && app_contexts[app_id].halted == 0u) {
        let inst = fetch_instruction(app_id, pc);
        let next_pc = execute_instruction(app_id, inst.x, inst.y, inst.z, inst.w, pc);

        if (next_pc != 0u) {
            pc = next_pc;
        } else {
            pc += 4u;
        }

        steps += 1u;
    }

    app_contexts[app_id].pc = pc;
}

// ============================================
// INTERRUPT DELIVERY
// ============================================

/// Deliver interrupt to app
/// Sets INT_TYPE, INT_PAYLOAD, INT_SOURCE registers and jumps to handler
fn deliver_interrupt(app_id: u32, int_type: u32, payload: u32, source: u32, handler_pc: u32) {
    // Set interrupt registers
    write_reg(app_id, REG_INT_TYPE, int_type);
    write_reg(app_id, REG_INT_PAYLOAD, payload);
    write_reg(app_id, REG_INT_SOURCE, source);

    // Jump to handler
    app_contexts[app_id].pc = handler_pc;

    // Wake if halted
    app_contexts[app_id].halted = 0u;
}
