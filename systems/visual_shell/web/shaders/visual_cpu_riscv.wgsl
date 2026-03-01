// ============================================
// GEOMETRY OS - VISUAL CPU SHADER (RISC-V)
// Phase 25: Native GPU-RISCV Substrate
// ============================================

// --- BINDINGS ---

// 0: Expanded Instruction Buffer (RISC-V 32-bit)
@group(0) @binding(0) var<storage, read> expanded_code: array<u32>;

// 1: System Memory / Heap (Storage Buffer)
@group(0) @binding(1) var<storage, read_write> system_memory: array<u32>;

// 2: CPU State (Registers x0-x31, PC, Cycles)
// Structured as: [thread_0_regs(32), thread_0_pc, thread_0_halted, ..., thread_n...]
@group(0) @binding(2) var<storage, read_write> cpu_states: array<u32>;

// --- CONSTANTS ---
const REGS_PER_CORE: u32 = 64u; // Expanded to 64 for power-of-2 alignment and Tectonic metadata

// --- CSR INDICES (in cpu_states array) ---
const CSR_SATP: u32 = 34u;      // Page table base + mode
const CSR_STVEC: u32 = 35u;     // Trap handler address
const CSR_SSCRATCH: u32 = 36u;  // Scratch register for traps
const CSR_MODE: u32 = 37u;      // Privilege mode (0=user, 1=supervisor)
const CSR_HALT: u32 = 38u;      // Halted flag (moved from 33)
const CSR_RESERVATION: u32 = 39u; // Reservation address for LR/SC

// --- NEW: Trap Handling CSRs ---
const CSR_SEPC: u32 = 40u;      // Exception program counter
const CSR_SCAUSE: u32 = 41u;    // Exception cause code
const CSR_STVAL: u32 = 42u;     // Trap value (faulting address)
const CSR_SSTATUS: u32 = 43u;   // Status register (SIE, SPIE, SPP)
const CSR_SIE: u32 = 44u;       // Supervisor interrupt enable
const CSR_SIP: u32 = 45u;       // Supervisor interrupt pending

// --- TECTONIC EXTENSIONS (Indices 46-49) ---
const CSR_GUEST_BASE: u32 = 46u;      // Physical pixel offset on Infinite Map
const CSR_GUEST_SIZE: u32 = 47u;      // Dimensions of the guest plate
const CSR_GEOM_CACHE_BASE: u32 = 48u; // Address for Tier 2 JIT
const CSR_TRANS_FLAGS: u32 = 49u;     // Metadata for the Transpiler (Tier status)

// --- M-MODE CSRs (Indices 50-59) ---
const CSR_MSTATUS: u32 = 50u;   // 0x300 - Machine status
const CSR_MTVEC: u32 = 51u;     // 0x305 - Machine trap handler
const CSR_MEPC: u32 = 52u;      // 0x341 - Machine exception PC
const CSR_MCAUSE: u32 = 53u;    // 0x342 - Machine exception cause
const CSR_MTVAL: u32 = 54u;     // 0x343 - Machine trap value
const CSR_MSCRATCH: u32 = 55u;  // 0x340 - Machine scratch
const CSR_MIDELEG: u32 = 56u;   // 0x303 - Interrupt delegation
const CSR_MEDELEG: u32 = 57u;   // 0x302 - Exception delegation
const CSR_MIE: u32 = 58u;       // 0x304 - Machine interrupt enable
const CSR_MIP: u32 = 59u;       // 0x344 - Machine interrupt pending

// MSTATUS bit positions (RV32)
const MSTATUS_MIE: u32 = 0x8u;      // Bit 3: Machine Interrupt Enable
const MSTATUS_MPIE: u32 = 0x80u;    // Bit 7: Machine Previous IE
const MSTATUS_MPP_MASK: u32 = 0x1800u; // Bits 12:11: Previous privilege

// SSTATUS bit positions (per RISC-V Privileged Spec v1.12)
const SSTATUS_SIE: u32 = 2u;    // Bit 1: Supervisor Interrupt Enable
const SSTATUS_SPIE: u32 = 32u;  // Bit 5: Supervisor Previous Interrupt Enable
const SSTATUS_SPP: u32 = 256u;  // Bit 8: Previous privilege mode (1=S, 0=U)

// --- MMIO INPUT REGION (Offset 32MB) ---
const MMIO_INPUT_BASE: u32 = 0x02000000u;  // 32MB offset
const MMIO_INPUT_STATUS: u32 = 0u;   // Offset from base
const MMIO_INPUT_TYPE: u32 = 4u;     // Offset from base
const MMIO_INPUT_KEY: u32 = 8u;      // Offset from base
const MMIO_INPUT_X: u32 = 12u;       // Offset from base
const MMIO_INPUT_Y: u32 = 16u;       // Offset from base
const MMIO_INPUT_FLAGS: u32 = 20u;   // Offset from base

// --- UART REGION (Offset 80MB) ---
const UART_BASE: u32 = 0x05000000u;
const UART_FIFO_BASE: u32 = 0x05000400u;
const UART_FIFO_PTR: u32 = 0x050004FCu; // Counter for writes

// Input types
const INPUT_TYPE_NONE: u32 = 0u;
const INPUT_TYPE_KEYBOARD: u32 = 1u;
const INPUT_TYPE_MOUSE: u32 = 2u;
const INPUT_TYPE_TOUCH: u32 = 3u;

// Input flags
const INPUT_FLAG_PRESSED: u32 = 1u;
const INPUT_FLAG_RELEASED: u32 = 2u;

// --- SBI CONSTANTS ---
const SBI_EID_TIMER: u32 = 0x00u;
const SBI_EID_CONSOLE: u32 = 0x01u;
const SBI_EID_SRST: u32 = 0x08u;
const SBI_EID_BASE: u32 = 0x10u;

// SBI memory region for JS bridge
const SBI_BRIDGE_ADDR: u32 = 0x05010000u; // After UART FIFO
const SBI_BRIDGE_FLAG: u32 = 0x05010000u; // Flag to signal JS
const SBI_BRIDGE_EID: u32 = 0x05010004u;
const SBI_BRIDGE_FID: u32 = 0x05010008u;
const SBI_BRIDGE_ARGS: u32 = 0x0501000Cu; // 6 args = 24 bytes
const SBI_BRIDGE_RET: u32 = 0x05010024u; // 2 returns = 8 bytes

// --- DECODING HELPERS ---
fn get_opcode(inst: u32) -> u32 { return inst & 0x7Fu; }
fn get_rd(inst: u32) -> u32     { return (inst >> 7u) & 0x1Fu; }
fn get_funct3(inst: u32) -> u32 { return (inst >> 12u) & 0x07u; }
fn get_rs1(inst: u32) -> u32    { return (inst >> 15u) & 0x1Fu; }
fn get_rs2(inst: u32) -> u32    { return (inst >> 20u) & 0x1Fu; }

// --- CSR HELPER ---
// Maps CSR number to its index in cpu_states array
// Returns 255u for unknown CSRs (should trap in full implementation)
fn _get_csr_index(csr_num: u32) -> u32 {
    switch (csr_num) {
        case 0x180u: { return CSR_SATP; }      // satp
        case 0x105u: { return CSR_STVEC; }     // stvec
        case 0x140u: { return CSR_SSCRATCH; }  // sscratch
        case 0x100u: { return CSR_SSTATUS; }   // sstatus
        case 0x141u: { return CSR_SEPC; }      // sepc
        case 0x142u: { return CSR_SCAUSE; }    // scause
        case 0x143u: { return CSR_STVAL; }     // stval
        case 0x104u: { return CSR_SIE; }       // sie
        case 0x144u: { return CSR_SIP; }       // sip
        // M-mode CSRs
        case 0x300u: { return CSR_MSTATUS; }   // mstatus
        case 0x305u: { return CSR_MTVEC; }     // mtvec
        case 0x341u: { return CSR_MEPC; }      // mepc
        case 0x342u: { return CSR_MCAUSE; }    // mcause
        case 0x343u: { return CSR_MTVAL; }     // mtval
        case 0x340u: { return CSR_MSCRATCH; }  // mscratch
        case 0x303u: { return CSR_MIDELEG; }   // mideleg
        case 0x302u: { return CSR_MEDELEG; }   // medeleg
        case 0x304u: { return CSR_MIE; }       // mie
        case 0x344u: { return CSR_MIP; }       // mip
        default: { return 255u; }              // Unknown CSR
    }
}

// --- TRAP HANDLING ---
// Exception codes (SCAUSE values)
const CAUSE_ILLEGAL_INST: u32 = 2u;
const CAUSE_BREAKPOINT: u32 = 3u;
const CAUSE_ECALL_U: u32 = 8u;
const CAUSE_ECALL_S: u32 = 11u;
const CAUSE_INST_PAGE_FAULT: u32 = 12u;
const CAUSE_LOAD_PAGE_FAULT: u32 = 13u;
const CAUSE_STORE_PAGE_FAULT: u32 = 15u;

// Access types for MMU
const ACCESS_READ: u32 = 0u;
const ACCESS_WRITE: u32 = 1u;
const ACCESS_EXEC: u32 = 2u;

// Interrupt codes (SCAUSE with interrupt bit set)
const CAUSE_S_TIMER_INT: u32 = 0x80000005u; // Supervisor Timer Interrupt (bit 31 set)
const SIP_STIP: u32 = 0x20u;                // Bit 5: Timer interrupt pending
const SIE_STIE: u32 = 0x20u;                // Bit 5: Timer interrupt enable

// Enter trap handler
// Saves PC to SEPC, sets SCAUSE/STVAL, updates SSTATUS, jumps to STVEC
fn trap_enter(base_idx: u32, cause: u32, tval: u32, pc: u32) -> u32 {
    // 1. Save exception PC to SEPC
    cpu_states[base_idx + CSR_SEPC] = pc;

    // 2. Set exception cause
    cpu_states[base_idx + CSR_SCAUSE] = cause;

    // 3. Set trap value (faulting address)
    cpu_states[base_idx + CSR_STVAL] = tval;

    // 4. Update SSTATUS:
    let current_mode = cpu_states[base_idx + CSR_MODE];
    let current_sstatus = cpu_states[base_idx + CSR_SSTATUS];

    var new_sstatus = current_sstatus;

    if ((current_sstatus & SSTATUS_SIE) != 0u) {
        new_sstatus = new_sstatus | SSTATUS_SPIE;
    } else {
        new_sstatus = new_sstatus & ~SSTATUS_SPIE;
    }

    new_sstatus = new_sstatus & ~SSTATUS_SIE;

    if (current_mode == 0u) {
        new_sstatus = new_sstatus & ~SSTATUS_SPP;     
    } else {
        new_sstatus = new_sstatus | SSTATUS_SPP;      
    }
    cpu_states[base_idx + CSR_SSTATUS] = new_sstatus;

    // 5. Set MODE to supervisor
    cpu_states[base_idx + CSR_MODE] = 1u;

    // 6. Return STVEC as new PC
    let stvec = cpu_states[base_idx + CSR_STVEC];
    return stvec;
}

// Enter M-mode trap handler
// Saves PC to MEPC, sets MCAUSE/MTVAL, updates MSTATUS, jumps to MTVEC
fn trap_enter_mmode(base_idx: u32, cause: u32, tval: u32, pc: u32) -> u32 {
    // 1. Save exception PC to MEPC
    cpu_states[base_idx + CSR_MEPC] = pc;

    // 2. Set exception cause
    cpu_states[base_idx + CSR_MCAUSE] = cause;

    // 3. Set trap value (faulting address)
    cpu_states[base_idx + CSR_MTVAL] = tval;

    // 4. Update MSTATUS
    let current_mode = cpu_states[base_idx + CSR_MODE];
    let current_mstatus = cpu_states[base_idx + CSR_MSTATUS];

    var new_mstatus = current_mstatus;

    // Copy MIE to MPIE
    if ((current_mstatus & MSTATUS_MIE) != 0u) {
        new_mstatus = new_mstatus | MSTATUS_MPIE;
    } else {
        new_mstatus = new_mstatus & ~MSTATUS_MPIE;
    }

    // Clear MIE (disable interrupts)
    new_mstatus = new_mstatus & ~MSTATUS_MIE;

    // Save current mode to MPP (bits 12:11)
    new_mstatus = new_mstatus & ~MSTATUS_MPP_MASK;
    new_mstatus = new_mstatus | (current_mode << 11u);

    cpu_states[base_idx + CSR_MSTATUS] = new_mstatus;

    // 5. Set MODE to M-mode (3)
    cpu_states[base_idx + CSR_MODE] = 3u;

    // 6. Return MTVEC as new PC
    return cpu_states[base_idx + CSR_MTVEC];
}

// Return from trap (SRET instruction)
fn trap_ret(base_idx: u32) -> u32 {
    let epc = cpu_states[base_idx + CSR_SEPC];
    let sstatus = cpu_states[base_idx + CSR_SSTATUS];
    let spie = (sstatus >> 5u) & 1u;  
    let spp = (sstatus >> 8u) & 1u;   

    var new_sstatus = sstatus;
    if (spie == 1u) {
        new_sstatus = new_sstatus | SSTATUS_SIE;
    } else {
        new_sstatus = new_sstatus & ~SSTATUS_SIE;
    }
    new_sstatus = new_sstatus & ~SSTATUS_SPIE;  
    cpu_states[base_idx + CSR_SSTATUS] = new_sstatus;

    cpu_states[base_idx + CSR_MODE] = spp;
    return epc;
}

// Check if trap should be delegated to S-mode based on medeleg/mideleg
// Returns true if delegation should occur
fn should_delegate_to_smode(base_idx: u32, cause: u32) -> bool {
    // Only delegate if currently in S-mode or U-mode
    let current_mode = cpu_states[base_idx + CSR_MODE];
    if (current_mode == 3u) {
        // Already in M-mode, don't delegate downward
        return false;
    }

    // Check if cause is an interrupt (bit 31 set)
    let is_interrupt = (cause & 0x80000000u) != 0u;

    if (is_interrupt) {
        // Check mideleg for interrupt delegation
        let mideleg = cpu_states[base_idx + CSR_MIDELEG];
        let cause_bit = cause & 0x1Fu;  // Lower 5 bits for interrupt type
        return (mideleg & (1u << cause_bit)) != 0u;
    } else {
        // Check medeleg for exception delegation
        let medeleg = cpu_states[base_idx + CSR_MEDELEG];
        return (medeleg & (1u << cause)) != 0u;
    }
}

// Unified trap entry - dispatches to M-mode or S-mode based on delegation
fn trap_enter_dispatch(base_idx: u32, cause: u32, tval: u32, pc: u32) -> u32 {
    if (should_delegate_to_smode(base_idx, cause)) {
        return trap_enter(base_idx, cause, tval, pc);  // S-mode handler
    } else {
        return trap_enter_mmode(base_idx, cause, tval, pc);  // M-mode handler
    }
}

// Return from M-mode trap (MRET instruction)
fn trap_ret_mmode(base_idx: u32) -> u32 {
    // Get MEPC (return address)
    let epc = cpu_states[base_idx + CSR_MEPC];

    // Get mstatus and extract fields
    let mstatus = cpu_states[base_idx + CSR_MSTATUS];
    let mpie = (mstatus >> 7u) & 1u;   // MPIE at bit 7
    let mpp = (mstatus >> 11u) & 3u;   // MPP at bits 12:11

    // Restore MIE from MPIE
    var new_mstatus = mstatus;
    if (mpie == 1u) {
        new_mstatus = new_mstatus | MSTATUS_MIE;
    } else {
        new_mstatus = new_mstatus & ~MSTATUS_MIE;
    }

    // Set MPIE to 1
    new_mstatus = new_mstatus | MSTATUS_MPIE;

    // Clear MPP to 0 (U-mode) after reading it
    new_mstatus = new_mstatus & ~MSTATUS_MPP_MASK;

    cpu_states[base_idx + CSR_MSTATUS] = new_mstatus;

    // Restore privilege mode from MPP
    cpu_states[base_idx + CSR_MODE] = mpp;

    return epc;
}

// --- INTERRUPT CHECKING ---
fn check_timer_interrupt(base_idx: u32) -> bool {
    let sstatus = cpu_states[base_idx + CSR_SSTATUS];
    let mode = cpu_states[base_idx + CSR_MODE];
    if (mode == 1u && (sstatus & SSTATUS_SIE) == 0u) { return false; }
    let sie = cpu_states[base_idx + CSR_SIE];
    if ((sie & SIE_STIE) == 0u) { return false; }
    let sip = cpu_states[base_idx + CSR_SIP];
    if ((sip & SIP_STIP) == 0u) { return false; }
    return true;
}

fn take_timer_interrupt(base_idx: u32, pc: u32) -> u32 {
    let sip = cpu_states[base_idx + CSR_SIP];
    cpu_states[base_idx + CSR_SIP] = sip & ~SIP_STIP;
    return trap_enter(base_idx, CAUSE_S_TIMER_INT, 0u, pc);
}

// --- TECTONIC SPATIAL MAPPING ---
// Maps 1D physical address to 2D Morton-order (Z-curve) index
// This preserves locality for the texture cache in the spatial substrate.
fn phys_to_morton(paddr: u32) -> u32 {
    var x = paddr & 0x0000FFFFu;
    var y = (paddr >> 16u) & 0x0000FFFFu;

    x = (x | (x << 8u)) & 0x00FF00FFu;
    x = (x | (x << 4u)) & 0x0F0F0F0Fu;
    x = (x | (x << 2u)) & 0x33333333u;
    x = (x | (x << 1u)) & 0x55555555u;

    y = (y | (y << 8u)) & 0x00FF00FFu;
    y = (y | (y << 4u)) & 0x0F0F0F0Fu;
    y = (y | (y << 2u)) & 0x33333333u;
    y = (y | (y << 1u)) & 0x55555555u;

    return x | (y << 1u);
}

// --- MMU: Sv32 PAGE TABLE WALKER ---
fn translate_address(vaddr: u32, access_type: u32, base_idx: u32) -> u32 {
    let satp = cpu_states[base_idx + CSR_SATP];
    let satp_mode = (satp >> 31u) & 1u;
    
    var paddr: u32 = 0u;

    if (satp_mode == 0u) { 
        paddr = vaddr; 
    } else {
        let vpn1 = (vaddr >> 22u) & 0x3FFu;   
        let vpn0 = (vaddr >> 12u) & 0x3FFu;   
        let offset = vaddr & 0xFFFu;            

        let ppn_root = satp & 0x3FFFFFu;
        let pte1_addr = (ppn_root * 4096u) + (vpn1 * 4u);
        if (pte1_addr >= 134217728u) { return 0xFFFFFFFFu; }

        var pte1 = system_memory[pte1_addr / 4u];
        let pte1_v = pte1 & 1u;
        if (pte1_v == 0u) { return 0xFFFFFFFFu; }

        let pte1_xwr = (pte1 >> 1u) & 0x7u;
        if (pte1_xwr != 0u) {
            // Leaf PTE at level 1 (MegaPage)
            let ppn1 = (pte1 >> 10u) & 0xFFFFFu;
            paddr = (ppn1 << 22u) | (vpn0 << 12u) | offset;
            
            // Set A/D bits
            pte1 = pte1 | 0x40u; // A=1
            if (access_type == ACCESS_WRITE) { pte1 = pte1 | 0x80u; } // D=1
            system_memory[pte1_addr / 4u] = pte1;
        } else {
            let ppn1_from_pte1 = (pte1 >> 10u) & 0x3FFFFFu;
            let pte0_addr = (ppn1_from_pte1 * 4096u) + (vpn0 * 4u);
            if (pte0_addr >= 134217728u) { return 0xFFFFFFFFu; }

            var pte0 = system_memory[pte0_addr / 4u];
            if ((pte0 & 1u) == 0u) { return 0xFFFFFFFFu; } // V=0

            // Check permissions
            let pte_r = (pte0 >> 1u) & 1u;
            let pte_w = (pte0 >> 2u) & 1u;
            let pte_x = (pte0 >> 3u) & 1u;
            
            if (access_type == ACCESS_READ && pte_r == 0u) { return 0xFFFFFFFFu; }
            if (access_type == ACCESS_WRITE && pte_w == 0u) { return 0xFFFFFFFFu; }
            if (access_type == ACCESS_EXEC && pte_x == 0u) { return 0xFFFFFFFFu; }

            let ppn0 = (pte0 >> 10u) & 0xFFFFFu;
            paddr = (ppn0 << 12u) | offset;
            
            // Set A/D bits
            pte0 = pte0 | 0x40u; // A=1
            if (access_type == ACCESS_WRITE) { pte0 = pte0 | 0x80u; } // D=1
            system_memory[pte0_addr / 4u] = pte0;
        }
    }

    // Tectonic Bounds Check
    let g_base = cpu_states[base_idx + CSR_GUEST_BASE];
    let g_size = cpu_states[base_idx + CSR_GUEST_SIZE];
    if (g_size > 0u) { // Only check if size is set
        if (paddr < g_base || paddr >= (g_base + g_size)) { return 0xFFFFFFFFu; }
    }

    return paddr;
}

// --- MMIO INPUT POLLING ---
fn poll_input(base_idx: u32) -> bool {
    let status_addr = (MMIO_INPUT_BASE + MMIO_INPUT_STATUS) / 4u;
    if (status_addr >= arrayLength(&system_memory)) { return false; }
    let status = system_memory[status_addr];
    if ((status & 1u) == 0u) { return false; }

    let type_addr = (MMIO_INPUT_BASE + MMIO_INPUT_TYPE) / 4u;
    let input_type = system_memory[type_addr];

    if (input_type == INPUT_TYPE_KEYBOARD) {
        let key_addr = (MMIO_INPUT_BASE + MMIO_INPUT_KEY) / 4u;
        let flags_addr = (MMIO_INPUT_BASE + MMIO_INPUT_FLAGS) / 4u;
        let key_code = system_memory[key_addr];
        let flags = system_memory[flags_addr];
        let kb_buf_addr = 0x02100000u / 4u;
        if (kb_buf_addr < arrayLength(&system_memory)) {
            system_memory[kb_buf_addr] = key_code | (flags << 16u);
        }
    } else if (input_type == INPUT_TYPE_MOUSE) {
        let x_addr = (MMIO_INPUT_BASE + MMIO_INPUT_X) / 4u;
        let y_addr = (MMIO_INPUT_BASE + MMIO_INPUT_Y) / 4u;
        let flags_addr = (MMIO_INPUT_BASE + MMIO_INPUT_FLAGS) / 4u;
        let mouse_x = system_memory[x_addr];
        let mouse_y = system_memory[y_addr];
        let flags = system_memory[flags_addr];
        let mouse_buf_addr = 0x02200000u / 4u;
        if (mouse_buf_addr + 2u < arrayLength(&system_memory)) {
            system_memory[mouse_buf_addr] = mouse_x;
            system_memory[mouse_buf_addr + 1u] = mouse_y;
            system_memory[mouse_buf_addr + 2u] = flags;
        }
    }
    system_memory[status_addr] = status & ~1u;
    return true;
}

// --- COMPUTE KERNEL ---

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let core_id = global_id.x;
    let base_idx = core_id * REGS_PER_CORE;
    
    for (var step = 0u; step < 100u; step++) {
        let halted = cpu_states[base_idx + CSR_HALT];
        if (halted > 0u) { break; }

        // Initialize M-mode state if this is first execution (CSR_MODE unset)
        let current_mode = cpu_states[base_idx + CSR_MODE];
        if (current_mode == 0u && cpu_states[base_idx + CSR_MTVEC] == 0u) {
            // First boot - initialize M-mode CSRs
            cpu_states[base_idx + CSR_MODE] = 3u;  // Start in M-mode
            cpu_states[base_idx + CSR_MSTATUS] = MSTATUS_MPIE;  // MPIE=1 for first MRET
            // MTVEC should be set by firmware/bootloader via CSR write
        }

        let sbi_flag = system_memory[SBI_BRIDGE_FLAG / 4u];
        if (sbi_flag != 0u) { break; }

        if (core_id == 0u) { poll_input(base_idx); }

        var pc = cpu_states[base_idx + 32u];

        if (check_timer_interrupt(base_idx)) {
            pc = take_timer_interrupt(base_idx, pc);
            cpu_states[base_idx + 32u] = pc;
            break; 
        }

        // SECURITY: Translate PC through MMU before fetch
        let pc_paddr = translate_address(pc * 4u, ACCESS_EXEC, base_idx);
        if (pc_paddr == 0xFFFFFFFFu) {
            // Instruction fetch fault - trap to handler
            pc = trap_enter(base_idx, CAUSE_INST_PAGE_FAULT, pc * 4u, pc);
            trap_triggered = true;
            break;
        }
        let inst = expanded_code[pc_paddr / 4u];
        let opcode = get_opcode(inst);
        let rd = get_rd(inst);
        let funct3 = get_funct3(inst);
        let rs1 = get_rs1(inst);
        let rs2 = get_rs2(inst);
        
        var pc_changed = false;
        var trap_triggered = false;

        switch (opcode) {
            case 0x13u: { // OP-IMM (ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI)
                let imm = i32(inst) >> 20u;  // Sign-extended 12-bit immediate
                let uimm = (inst >> 20u) & 0xFFFu;  // Unsigned immediate for shifts
                let val1 = i32(cpu_states[base_idx + rs1]);
                let uval1 = cpu_states[base_idx + rs1];
                let shamt = uimm & 0x1Fu;  // Shift amount (bits 24:20)

                if (funct3 == 0x0u) { // ADDI
                    if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 + imm); }
                } else if (funct3 == 0x2u) { // SLTI (set less than immediate, signed)
                    if (rd != 0u) { cpu_states[base_idx + rd] = select(0u, 1u, val1 < imm); }
                } else if (funct3 == 0x3u) { // SLTIU (set less than immediate, unsigned)
                    // Note: immediate is still sign-extended, then treated as unsigned
                    if (rd != 0u) { cpu_states[base_idx + rd] = select(0u, 1u, uval1 < u32(imm)); }
                } else if (funct3 == 0x4u) { // XORI
                    if (rd != 0u) { cpu_states[base_idx + rd] = uval1 ^ u32(imm); }
                } else if (funct3 == 0x6u) { // ORI
                    if (rd != 0u) { cpu_states[base_idx + rd] = uval1 | u32(imm); }
                } else if (funct3 == 0x7u) { // ANDI
                    if (rd != 0u) { cpu_states[base_idx + rd] = uval1 & u32(imm); }
                } else if (funct3 == 0x1u) { // SLLI (shift left logical immediate)
                    if (rd != 0u) { cpu_states[base_idx + rd] = uval1 << shamt; }
                } else if (funct3 == 0x5u) { // SRLI/SRAI
                    let funct7bit = (inst >> 30u) & 1u;
                    if (funct7bit == 0u) { // SRLI (shift right logical immediate)
                        if (rd != 0u) { cpu_states[base_idx + rd] = uval1 >> shamt; }
                    } else { // SRAI (shift right arithmetic immediate)
                        if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 >> i32(shamt)); }
                    }
                }
            }
            case 0x33u: { // OP (ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND)
                let val1 = i32(cpu_states[base_idx + rs1]);
                let val2 = i32(cpu_states[base_idx + rs2]);
                let uval1 = cpu_states[base_idx + rs1];
                let uval2 = cpu_states[base_idx + rs2];
                let funct7 = (inst >> 25u) & 0x7Fu;

                if (funct7 == 0x01u) {
                    // M extension (MUL, DIV)
                    if (funct3 == 0u) { if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 * val2); } }
                    else if (funct3 == 4u) { if (val2 != 0 && rd != 0u) { cpu_states[base_idx + rd] = u32(val1 / val2); } }
                } else if (funct7 == 0x00u || funct7 == 0x20u) {
                    // Standard R-type operations
                    if (funct3 == 0x0u) { // ADD
                        if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 + val2); }
                    } else if (funct3 == 0x1u) { // SLL (shift left logical)
                        if (rd != 0u) { cpu_states[base_idx + rd] = uval1 << (uval2 & 0x1Fu); }
                    } else if (funct3 == 0x2u) { // SLT (set less than, signed)
                        if (rd != 0u) { cpu_states[base_idx + rd] = select(0u, 1u, val1 < val2); }
                    } else if (funct3 == 0x3u) { // SLTU (set less than, unsigned)
                        if (rd != 0u) { cpu_states[base_idx + rd] = select(0u, 1u, uval1 < uval2); }
                    } else if (funct3 == 0x4u) { // XOR
                        if (rd != 0u) { cpu_states[base_idx + rd] = uval1 ^ uval2; }
                    } else if (funct3 == 0x5u) { // SRL/SRA
                        if (funct7 == 0x00u) { // SRL (shift right logical)
                            if (rd != 0u) { cpu_states[base_idx + rd] = uval1 >> (uval2 & 0x1Fu); }
                        } else { // SRA (shift right arithmetic)
                            if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 >> i32(uval2 & 0x1Fu)); }
                        }
                    } else if (funct3 == 0x6u) { // OR
                        if (rd != 0u) { cpu_states[base_idx + rd] = uval1 | uval2; }
                    } else if (funct3 == 0x7u) { // AND
                        if (rd != 0u) { cpu_states[base_idx + rd] = uval1 & uval2; }
                    }
                }
            }
            case 0x17u: { // AUIPC (Add Upper Immediate to PC)
                let imm = inst & 0xFFFFF000u;  // Upper 20 bits, shifted left 12
                if (rd != 0u) {
                    // PC is instruction index, byte address is pc * 4
                    cpu_states[base_idx + rd] = u32(i32(pc * 4u) + i32(imm));
                }
            }
            case 0x37u: { // LUI (Load Upper Immediate)
                let imm = inst & 0xFFFFF000u;  // Upper 20 bits, shifted left 12
                if (rd != 0u) {
                    cpu_states[base_idx + rd] = imm;
                }
            }
            case 0x6Fu: { // JAL
                let imm = ( (inst >> 31u) << 20u ) | ( ((inst >> 12u) & 0xFFu) << 12u ) | ( ((inst >> 20u) & 1u) << 11u ) | ( ((inst >> 21u) & 0x3FFu) << 1u );
                let offset = (i32(imm) << 11u) >> 11u; 
                if (rd != 0u) { cpu_states[base_idx + rd] = pc + 1u; }
                pc = u32(i32(pc) + (offset / 4));
                pc_changed = true;
            }
            case 0x67u: { // JALR
                let imm = i32(inst) >> 20u; 
                let val1 = i32(cpu_states[base_idx + rs1]);
                let target = u32(val1 + imm) & ~1u;
                if (rd != 0u) { cpu_states[base_idx + rd] = pc + 1u; }
                pc = target / 4u;
                pc_changed = true;
            }
            case 0x63u: { // BRANCH (BEQ, BNE, BLT, BGE, BLTU, BGEU)
                let val1 = cpu_states[base_idx + rs1];
                let val2 = cpu_states[base_idx + rs2];
                let sval1 = i32(val1);
                let sval2 = i32(val2);
                var branch = false;

                if (funct3 == 0u) { branch = (val1 == val2); }          // BEQ
                else if (funct3 == 1u) { branch = (val1 != val2); }     // BNE
                else if (funct3 == 4u) { branch = (sval1 < sval2); }    // BLT (signed)
                else if (funct3 == 5u) { branch = (sval1 >= sval2); }   // BGE (signed)
                else if (funct3 == 6u) { branch = (val1 < val2); }      // BLTU (unsigned)
                else if (funct3 == 7u) { branch = (val1 >= val2); }     // BGEU (unsigned)

                if (branch) {
                    let imm = ( (inst >> 31u) << 12u ) | ( ((inst >> 7u) & 1u) << 11u ) | ( ((inst >> 25u) & 0x3Fu) << 5u ) | ( ((inst >> 8u) & 0xFu) << 1u );
                    let offset = (i32(imm) << 19u) >> 19u;
                    pc = u32(i32(pc) + (offset / 4));
                    pc_changed = true;
                }
            }
            case 0x03u: { // LOAD (LB, LH, LW, LBU, LHU)
                let offset = i32(inst) >> 20u;
                let val1 = i32(cpu_states[base_idx + rs1]);
                let vaddr = u32(val1 + offset);
                let paddr = translate_address(vaddr, ACCESS_READ, base_idx);

                if (paddr == 0xFFFFFFFFu) {
                    pc = trap_enter(base_idx, CAUSE_LOAD_PAGE_FAULT, vaddr, pc);
                    trap_triggered = true;
                } else if (paddr < 134217728u) {
                    let word_addr = paddr / 4u;
                    let byte_offset = paddr % 4u;
                    let word_val = system_memory[word_addr];

                    if (funct3 == 0x0u) { // LB (load byte, sign-extend)
                        let byte_val = (word_val >> (byte_offset * 8u)) & 0xFFu;
                        let sign_ext = select(0u, 0xFFFFFF00u, (byte_val & 0x80u) != 0u);
                        if (rd != 0u) { cpu_states[base_idx + rd] = byte_val | sign_ext; }
                    } else if (funct3 == 0x1u) { // LH (load half, sign-extend)
                        let half_offset = (paddr / 2u) % 2u;
                        let half_val = (word_val >> (half_offset * 16u)) & 0xFFFFu;
                        let sign_ext = select(0u, 0xFFFF0000u, (half_val & 0x8000u) != 0u);
                        if (rd != 0u) { cpu_states[base_idx + rd] = half_val | sign_ext; }
                    } else if (funct3 == 0x2u) { // LW (load word)
                        if (rd != 0u) { cpu_states[base_idx + rd] = word_val; }
                    } else if (funct3 == 0x4u) { // LBU (load byte, zero-extend)
                        let byte_val = (word_val >> (byte_offset * 8u)) & 0xFFu;
                        if (rd != 0u) { cpu_states[base_idx + rd] = byte_val; }
                    } else if (funct3 == 0x5u) { // LHU (load half, zero-extend)
                        let half_offset = (paddr / 2u) % 2u;
                        let half_val = (word_val >> (half_offset * 16u)) & 0xFFFFu;
                        if (rd != 0u) { cpu_states[base_idx + rd] = half_val; }
                    }
                }
            }
            case 0x23u: { // STORE (SB, SH, SW)
                let imm_s = ((inst >> 25u) & 0x7Fu) << 5u | ((inst >> 7u) & 0x1Fu);
                let offset_s = (i32(imm_s) << 20u) >> 20u;
                let val1 = i32(cpu_states[base_idx + rs1]);
                let val2 = cpu_states[base_idx + rs2];
                let vaddr = u32(val1 + offset_s);
                let paddr = translate_address(vaddr, ACCESS_WRITE, base_idx);

                if (paddr == 0xFFFFFFFFu) {
                    pc = trap_enter(base_idx, CAUSE_STORE_PAGE_FAULT, vaddr, pc);
                    trap_triggered = true;
                } else if (paddr < 134217728u) {
                    if (funct3 == 0x0u) { // SB (store byte)
                        let byte_offset = paddr % 4u;
                        let mask = ~(0xFFu << (byte_offset * 8u));
                        let existing = system_memory[paddr / 4u] & mask;
                        let new_byte = (val2 & 0xFFu) << (byte_offset * 8u);
                        system_memory[paddr / 4u] = existing | new_byte;
                    } else if (funct3 == 0x1u) { // SH (store half)
                        let half_offset = (paddr / 2u) % 2u;
                        let mask = ~(0xFFFFu << (half_offset * 16u));
                        let existing = system_memory[paddr / 4u] & mask;
                        let new_half = (val2 & 0xFFFFu) << (half_offset * 16u);
                        system_memory[paddr / 4u] = existing | new_half;
                    } else if (funct3 == 0x2u) { // SW (store word)
                        system_memory[paddr / 4u] = val2;
                    }

                    // UART handling
                    if (paddr == UART_BASE) {
                        let char_byte = val2 & 0xFFu;
                        let head = system_memory[UART_FIFO_PTR / 4u];
                        system_memory[(UART_FIFO_BASE / 4u) + (head % 256u)] = char_byte;
                        system_memory[UART_FIFO_PTR / 4u] = head + 1u;
                    }
                }
            }
            case 0x73u: { // SYSTEM (ECALL, EBREAK, SRET, CSRRW)
                let funct3_sys = (inst >> 12u) & 0x7u;
                let funct7_sys = (inst >> 25u) & 0x7Fu;
                let funct12_sys = (inst >> 20u) & 0xFFFu;  // For ECALL/EBREAK distinction

                // MRET: funct7=0x18, funct3=0, funct12=0x302
                if (funct7_sys == 0x18u && funct3_sys == 0u && funct12_sys == 0x302u) {
                    pc = trap_ret_mmode(base_idx);
                    pc_changed = true;
                } else if (funct7_sys == 0x30u) { // SRET
                    pc = trap_ret(base_idx);
                    pc_changed = true;
                } else if (funct3_sys == 0u && funct12_sys == 0x000u) { // ECALL
                    let eid = cpu_states[base_idx + 17u];
                    let fid = cpu_states[base_idx + 16u];
                    system_memory[SBI_BRIDGE_EID / 4u] = eid;
                    system_memory[SBI_BRIDGE_FID / 4u] = fid;
                    system_memory[(SBI_BRIDGE_ARGS + 0u) / 4u] = cpu_states[base_idx + 10u];
                    system_memory[(SBI_BRIDGE_ARGS + 4u) / 4u] = cpu_states[base_idx + 11u];
                    system_memory[(SBI_BRIDGE_ARGS + 8u) / 4u] = cpu_states[base_idx + 12u];
                    system_memory[(SBI_BRIDGE_ARGS + 12u) / 4u] = cpu_states[base_idx + 13u];
                    system_memory[(SBI_BRIDGE_ARGS + 16u) / 4u] = cpu_states[base_idx + 14u];
                    system_memory[(SBI_BRIDGE_ARGS + 20u) / 4u] = cpu_states[base_idx + 15u];
                    system_memory[SBI_BRIDGE_FLAG / 4u] = 1u;
                    let priv = cpu_states[base_idx + CSR_MODE];
                    pc = trap_enter(base_idx, select(CAUSE_ECALL_S, CAUSE_ECALL_U, priv == 0u), eid, pc);
                    trap_triggered = true;
                } else if (funct3_sys == 0u && funct12_sys == 0x001u) { // EBREAK
                    pc = trap_enter(base_idx, CAUSE_BREAKPOINT, pc * 4u, pc);
                    trap_triggered = true;
                } else if (funct3_sys == 1u) { // CSRRW
                    let csr_idx = _get_csr_index(inst >> 20u);
                    if (csr_idx < 255u) {
                        let old = cpu_states[base_idx + csr_idx];
                        if (rd != 0u) { cpu_states[base_idx + rd] = old; }
                        cpu_states[base_idx + csr_idx] = cpu_states[base_idx + rs1];
                    }
                } else if (funct3_sys == 2u) { // CSRRS (Read and Set bits)
                    let csr_idx = _get_csr_index(inst >> 20u);
                    if (csr_idx < 255u) {
                        let old = cpu_states[base_idx + csr_idx];
                        if (rd != 0u) { cpu_states[base_idx + rd] = old; }
                        if (rs1 != 0u) {
                            cpu_states[base_idx + csr_idx] = old | cpu_states[base_idx + rs1];
                        }
                    }
                } else if (funct3_sys == 3u) { // CSRRC (Read and Clear bits)
                    let csr_idx = _get_csr_index(inst >> 20u);
                    if (csr_idx < 255u) {
                        let old = cpu_states[base_idx + csr_idx];
                        if (rd != 0u) { cpu_states[base_idx + rd] = old; }
                        if (rs1 != 0u) {
                            cpu_states[base_idx + csr_idx] = old & ~cpu_states[base_idx + rs1];
                        }
                    }
                } else if (funct3_sys == 5u) { // CSRRWI (Read and Write Immediate)
                    let csr_idx = _get_csr_index(inst >> 20u);
                    let zimm = (inst >> 15u) & 0x1Fu;  // 5-bit immediate from bits 19:15
                    if (csr_idx < 255u) {
                        let old = cpu_states[base_idx + csr_idx];
                        if (rd != 0u) { cpu_states[base_idx + rd] = old; }
                        cpu_states[base_idx + csr_idx] = zimm;
                    }
                } else if (funct3_sys == 6u) { // CSRRSI (Read and Set Immediate)
                    let csr_idx = _get_csr_index(inst >> 20u);
                    let zimm = (inst >> 15u) & 0x1Fu;  // 5-bit immediate from bits 19:15
                    if (csr_idx < 255u) {
                        let old = cpu_states[base_idx + csr_idx];
                        if (rd != 0u) { cpu_states[base_idx + rd] = old; }
                        if (zimm != 0u) {
                            cpu_states[base_idx + csr_idx] = old | zimm;
                        }
                    }
                } else if (funct3_sys == 7u) { // CSRRCI (Read and Clear Immediate)
                    let csr_idx = _get_csr_index(inst >> 20u);
                    let zimm = (inst >> 15u) & 0x1Fu;  // 5-bit immediate from bits 19:15
                    if (csr_idx < 255u) {
                        let old = cpu_states[base_idx + csr_idx];
                        if (rd != 0u) { cpu_states[base_idx + rd] = old; }
                        if (zimm != 0u) {
                            cpu_states[base_idx + csr_idx] = old & ~zimm;
                        }
                    }
                }
            }
            case 0x2Fu: { trap_triggered = true; }
            default: { pc = trap_enter(base_idx, CAUSE_ILLEGAL_INST, inst, pc); trap_triggered = true; }
        }

        if (!pc_changed && !trap_triggered) { cpu_states[base_idx + 32u] = pc + 1u; }
        else { cpu_states[base_idx + 32u] = pc; }
        if (trap_triggered || pc_changed) { break; }
    }
}
