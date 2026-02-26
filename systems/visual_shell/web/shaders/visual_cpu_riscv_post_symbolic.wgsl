// ============================================
// GEOMETRY OS - POST-SYMBOLIC RISC-V SHADER
// Phase 27: Zero-Symbol Holographic Execution
// ============================================

// --- BINDINGS ---

// 0: Resonance Texture (.rts.png) - The Physical Code
@group(0) @binding(0) var rts_texture: texture_2d<f32>;

// 1: System Memory / Heap (Storage Buffer)
@group(0) @binding(1) var<storage, read_write> system_memory: array<u32>;

// 2: CPU State (Registers x0-x31, PC, Cycles)
@group(0) @binding(2) var<storage, read_write> cpu_states: array<u32>;

// --- CONSTANTS ---
const REGS_PER_CORE: u32 = 64u;
const GLYPH_SIZE: u32 = 16u;

// --- CSR INDICES ---
const CSR_SATP: u32 = 34u;
const CSR_STVEC: u32 = 35u;
const CSR_SSCRATCH: u32 = 36u;
const CSR_MODE: u32 = 37u;
const CSR_HALT: u32 = 38u;
const CSR_RESERVATION: u32 = 39u;
const CSR_SEPC: u32 = 40u;
const CSR_SCAUSE: u32 = 41u;
const CSR_STVAL: u32 = 42u;
const CSR_SSTATUS: u32 = 43u;
const CSR_SIE: u32 = 44u;
const CSR_SIP: u32 = 45u;

// SSTATUS bits
const SSTATUS_SIE: u32 = 2u;
const SSTATUS_SPIE: u32 = 32u;
const SSTATUS_SPP: u32 = 256u;

// UART
const UART_BASE: u32 = 0x05000000u;
const UART_FIFO_BASE: u32 = 0x05000400u;
const UART_FIFO_PTR: u32 = 0x050004FCu;

// SBI
const SBI_BRIDGE_FLAG: u32 = 0x05010000u;

// --- HOLOGRAPHIC DECODER ---

fn hadamard_sign(i: u32, j: u32) -> i32 {
    let p = countOneBits(i & j);
    if ((p % 2u) == 0u) { return 1; }
    return -1;
}

fn decode_holographic(x_base: i32, y_base: i32) -> u32 {
    var instr: u32 = 0u;
    for(var k: u32 = 0u; k < 32u; k++) {
        var dot_product: f32 = 0.0;
        let row_k = (k / 8u) + 1u;
        let col_k = (k % 8u) + 1u;
        
        for(var i: i32 = 0; i < 16; i++) {
            for(var j: i32 = 0; j < 16; j++) {
                let pix = textureLoad(rts_texture, vec2<i32>(x_base + i, y_base + j), 0);
                // Mean interference from RGB
                let val = (pix.r + pix.g + pix.b) / 3.0 - 0.5;
                let h_val = f32(hadamard_sign(u32(i), row_k) * hadamard_sign(u32(j), col_k));
                dot_product += val * h_val;
            }
        }
        
        if (dot_product > 0.0) {
            instr = instr | (1u << k);
        }
    }
    return instr;
}

// --- GEOMETRIC AUDIT ---

fn get_required_symmetry(opcode: u32) -> u32 {
    if (opcode == 0x33u || opcode == 0x13u) { return 1u; } // OP, OP-IMM -> ROT_90
    if (opcode == 0x6Fu || opcode == 0x67u || opcode == 0x63u) { return 2u; } // JAL, JALR, BRANCH -> ASYMMETRIC
    return 0u;
}

fn verify_symmetry(x_base: i32, y_base: i32, sym_type: u32) -> bool {
    if (sym_type == 0u) { return true; } 
    var q_mass = vec4<f32>(0.0, 0.0, 0.0, 0.0);
    for(var i: i32 = 0; i < 4; i++) {
        for(var j: i32 = 0; j < 4; j++) {
            q_mass.x += textureLoad(rts_texture, vec2<i32>(x_base + i*2 + 2, y_base + j*2 + 2), 0).a;
            q_mass.y += textureLoad(rts_texture, vec2<i32>(x_base + i*2 + 10, y_base + j*2 + 2), 0).a;
            q_mass.z += textureLoad(rts_texture, vec2<i32>(x_base + i*2 + 10, y_base + j*2 + 10), 0).a;
            q_mass.w += textureLoad(rts_texture, vec2<i32>(x_base + i*2 + 2, y_base + j*2 + 10), 0).a;
        }
    }
    if (sym_type == 1u) { 
        let avg = (q_mass.x + q_mass.y + q_mass.z + q_mass.w) / 4.0;
        if (avg < 0.2) { return false; }
        let diff = abs(q_mass.x - avg) + abs(q_mass.y - avg) + abs(q_mass.z - avg) + abs(q_mass.w - avg);
        return diff < (avg * 1.5); 
    }
    if (sym_type == 2u) { 
        let left_mass = q_mass.x + q_mass.w;
        let right_mass = q_mass.y + q_mass.z;
        return right_mass > (left_mass + 0.5); 
    }
    return true;
}

// --- DECODING HELPERS ---
fn get_opcode(inst: u32) -> u32 { return inst & 0x7Fu; }
fn get_rd(inst: u32) -> u32     { return (inst >> 7u) & 0x1Fu; }
fn get_funct3(inst: u32) -> u32 { return (inst >> 12u) & 0x07u; }
fn get_rs1(inst: u32) -> u32    { return (inst >> 15u) & 0x1Fu; }
fn get_rs2(inst: u32) -> u32    { return (inst >> 20u) & 0x1Fu; }

// --- CSR HELPER ---
fn _get_csr_index(csr_num: u32) -> u32 {
    switch (csr_num) {
        case 0x180u: { return CSR_SATP; }
        case 0x105u: { return CSR_STVEC; }
        case 0x140u: { return CSR_SSCRATCH; }
        case 0x100u: { return CSR_SSTATUS; }
        case 0x141u: { return CSR_SEPC; }
        case 0x142u: { return CSR_SCAUSE; }
        case 0x143u: { return CSR_STVAL; }
        case 0x104u: { return CSR_SIE; }
        case 0x144u: { return CSR_SIP; }
        default: { return 255u; }
    }
}

// --- TRAP HANDLING ---
const CAUSE_INST_PAGE_FAULT: u32 = 12u;
const CAUSE_ILLEGAL_INST: u32 = 2u;

fn trap_enter(base_idx: u32, cause: u32, tval: u32, pc: u32) -> u32 {
    cpu_states[base_idx + CSR_SEPC] = pc;
    cpu_states[base_idx + CSR_SCAUSE] = cause;
    cpu_states[base_idx + CSR_STVAL] = tval;
    let current_mode = cpu_states[base_idx + CSR_MODE];
    let current_sstatus = cpu_states[base_idx + CSR_SSTATUS];
    var new_sstatus = current_sstatus;
    if ((current_sstatus & SSTATUS_SIE) != 0u) { new_sstatus = new_sstatus | SSTATUS_SPIE; }
    else { new_sstatus = new_sstatus & ~SSTATUS_SPIE; }
    new_sstatus = new_sstatus & ~SSTATUS_SIE;
    if (current_mode == 0u) { new_sstatus = new_sstatus & ~SSTATUS_SPP; }
    else { new_sstatus = new_sstatus | SSTATUS_SPP; }
    cpu_states[base_idx + CSR_SSTATUS] = new_sstatus;
    cpu_states[base_idx + CSR_MODE] = 1u;
    return cpu_states[base_idx + CSR_STVEC];
}

fn trap_ret(base_idx: u32) -> u32 {
    let epc = cpu_states[base_idx + CSR_SEPC];
    let sstatus = cpu_states[base_idx + CSR_SSTATUS];
    let spie = (sstatus >> 5u) & 1u;
    let spp = (sstatus >> 8u) & 1u;
    var new_sstatus = sstatus;
    if (spie == 1u) { new_sstatus = new_sstatus | SSTATUS_SIE; }
    else { new_sstatus = new_sstatus & ~SSTATUS_SIE; }
    new_sstatus = new_sstatus & ~SSTATUS_SPIE;
    cpu_states[base_idx + CSR_SSTATUS] = new_sstatus;
    cpu_states[base_idx + CSR_MODE] = spp;
    return epc;
}

// --- COMPUTE KERNEL ---

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let core_id = global_id.x;
    let base_idx = core_id * REGS_PER_CORE;
    
    // Execute a small batch
    for (var step = 0u; step < 10u; step++) {
        let halted = cpu_states[base_idx + CSR_HALT];
        if (halted > 0u) { break; }

        let sbi_flag = system_memory[SBI_BRIDGE_FLAG / 4u];
        if (sbi_flag != 0u) { break; }

        var pc = cpu_states[base_idx + 32u];

        // 1. Morphological Instruction Fetch
        let tex_dim = textureDimensions(rts_texture);
        let w_blocks = tex_dim.x / GLYPH_SIZE;
        
        let x_block = pc % w_blocks;
        let y_block = pc / w_blocks;
        
        if (y_block >= (tex_dim.y / GLYPH_SIZE)) {
            pc = trap_enter(base_idx, CAUSE_INST_PAGE_FAULT, pc, pc);
            cpu_states[base_idx + 32u] = pc;
            break;
        }

        let x_base = i32(x_block * GLYPH_SIZE);
        let y_base = i32(y_block * GLYPH_SIZE);
        
        // HOLOGRAPHIC DECODE
        let inst = decode_holographic(x_base, y_base);

        // 2. GEOMETRIC AUDIT
        let opcode = get_opcode(inst);
        let req_sym = get_required_symmetry(opcode);
        if (!verify_symmetry(x_base, y_base, req_sym)) {
            cpu_states[base_idx + CSR_HALT] = 1u; // Audit failure
            break;
        }

        // 3. EXECUTE
        let rd = get_rd(inst);
        let funct3 = get_funct3(inst);
        let rs1 = get_rs1(inst);
        let rs2 = get_rs2(inst);
        
        var pc_changed = false;
        var trap_triggered = false;

        switch (opcode) {
            case 0x13u: { // OP-IMM
                let imm = i32(inst) >> 20u;
                let val1 = i32(cpu_states[base_idx + rs1]);
                if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 + imm); }
            }
            case 0x33u: { // OP
                let val1 = i32(cpu_states[base_idx + rs1]);
                let val2 = i32(cpu_states[base_idx + rs2]);
                if (funct3 == 0u) { if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 + val2); } }
            }
            case 0x6Fu: { // JAL
                let imm = ( (inst >> 31u) << 20u ) | ( ((inst >> 12u) & 0xFFu) << 12u ) | ( ((inst >> 20u) & 1u) << 11u ) | ( ((inst >> 21u) & 0x3FFu) << 1u );
                let offset = (i32(imm) << 11u) >> 11u; 
                if (rd != 0u) { cpu_states[base_idx + rd] = pc + 1u; }
                pc = u32(i32(pc) + (offset / 4));
                pc_changed = true;
            }
            case 0x23u: { // STORE
                let imm_s = ((inst >> 25u) & 0x7Fu) << 5u | ((inst >> 7u) & 0x1Fu);
                let offset_s = (i32(imm_s) << 20u) >> 20u;
                let addr = u32(i32(cpu_states[base_idx + rs1]) + offset_s);
                let val = cpu_states[base_idx + rs2];
                if (addr < arrayLength(&system_memory) * 4u) {
                    system_memory[addr / 4u] = val;
                    if (addr == UART_BASE) {
                        let head = system_memory[UART_FIFO_PTR / 4u];
                        system_memory[(UART_FIFO_BASE / 4u) + (head % 256u)] = val & 0xFFu;
                        system_memory[UART_FIFO_PTR / 4u] = head + 1u;
                    }
                }
            }
            case 0x73u: { // SYSTEM
                if (funct3 == 0u) {
                    // SBI Console Out via a7=1
                    let eid = cpu_states[base_idx + 17u];
                    if (eid == 1u) {
                        let val = cpu_states[base_idx + 10u];
                        let head = system_memory[UART_FIFO_PTR / 4u];
                        system_memory[(UART_FIFO_BASE / 4u) + (head % 256u)] = val & 0xFFu;
                        system_memory[UART_FIFO_PTR / 4u] = head + 1u;
                    }
                }
            }
            default: { }
        }

        if (!pc_changed && !trap_triggered) { cpu_states[base_idx + 32u] = pc + 1u; }
        else { cpu_states[base_idx + 32u] = pc; }
        if (trap_triggered || pc_changed) { break; }
        
        cpu_states[base_idx + 39u] = cpu_states[base_idx + 39u] + 1u;
    }
}
