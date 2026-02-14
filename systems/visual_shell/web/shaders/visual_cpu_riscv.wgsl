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
const REGS_PER_CORE: u32 = 46u; // 32 regs + PC + Halt + CSRs (6) + Trap CSRs (6)

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

// Input types
const INPUT_TYPE_NONE: u32 = 0u;
const INPUT_TYPE_KEYBOARD: u32 = 1u;
const INPUT_TYPE_MOUSE: u32 = 2u;
const INPUT_TYPE_TOUCH: u32 = 3u;

// Input flags
const INPUT_FLAG_PRESSED: u32 = 1u;
const INPUT_FLAG_RELEASED: u32 = 2u;

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
    //    - Save current MODE to SPP (bit 8)
    //    - Save current SIE to SPIE (bit 5)
    //    - Clear SIE (bit 1) - disable interrupts during trap
    let current_mode = cpu_states[base_idx + CSR_MODE];
    let current_sstatus = cpu_states[base_idx + CSR_SSTATUS];

    var new_sstatus = current_sstatus;

    // Copy SIE (bit 1) to SPIE (bit 5)
    if ((current_sstatus & SSTATUS_SIE) != 0u) {
        new_sstatus = new_sstatus | SSTATUS_SPIE;
    } else {
        new_sstatus = new_sstatus & ~SSTATUS_SPIE;
    }

    // Clear SIE
    new_sstatus = new_sstatus & ~SSTATUS_SIE;

    // Set SPP based on current mode
    if (current_mode == 0u) {
        new_sstatus = new_sstatus & ~SSTATUS_SPP;     // SPP = 0 (from user)
    } else {
        new_sstatus = new_sstatus | SSTATUS_SPP;      // SPP = 1 (from supervisor)
    }
    cpu_states[base_idx + CSR_SSTATUS] = new_sstatus;

    // 5. Set MODE to supervisor
    cpu_states[base_idx + CSR_MODE] = 1u;

    // 6. Return STVEC as new PC
    let stvec = cpu_states[base_idx + CSR_STVEC];
    return stvec;
}

// Return from trap (SRET instruction)
// Restores PC from SEPC, MODE from SPP, SIE from SPIE
fn trap_ret(base_idx: u32) -> u32 {
    // 1. Get saved PC from SEPC
    let epc = cpu_states[base_idx + CSR_SEPC];

    // 2. Restore SSTATUS:
    //    - SIE = SPIE
    //    - MODE = SPP
    let sstatus = cpu_states[base_idx + CSR_SSTATUS];
    let spie = (sstatus >> 5u) & 1u;  // Get SPIE bit (bit 5)
    let spp = (sstatus >> 8u) & 1u;   // Get SPP bit (bit 8)

    // Set SIE = SPIE, clear SPIE after restore
    var new_sstatus = sstatus;
    if (spie == 1u) {
        new_sstatus = new_sstatus | SSTATUS_SIE;
    } else {
        new_sstatus = new_sstatus & ~SSTATUS_SIE;
    }
    new_sstatus = new_sstatus & ~SSTATUS_SPIE;  // Clear SPIE
    cpu_states[base_idx + CSR_SSTATUS] = new_sstatus;

    // 3. Restore privilege mode from SPP
    cpu_states[base_idx + CSR_MODE] = spp;

    // 4. Return EPC as new PC
    return epc;
}

// --- MMU: Sv32 PAGE TABLE WALKER ---
// Translates virtual address to physical address using Sv32 scheme
// Returns physical address, or 0xFFFFFFFF on fault
fn translate_address(vaddr: u32, is_write: u32, base_idx: u32) -> u32 {
    // Get satp CSR
    let satp = cpu_states[base_idx + CSR_SATP];
    let satp_mode = (satp >> 31u) & 1u;

    // If MMU disabled (bare mode), return virtual address as-is
    if (satp_mode == 0u) {
        return vaddr;
    }

    // Sv32 translation
    let vpn1 = (vaddr >> 22u) & 0x3FFu;   // Bits 31:22
    let vpn0 = (vaddr >> 12u) & 0x3FFu;   // Bits 21:12
    let offset = vaddr & 0xFFFu;            // Bits 11:0

    // Level 1: Get PPN from satp (bits 21:0)
    let ppn_root = satp & 0x3FFFFFu;
    let pte1_addr = (ppn_root * 4096u) + (vpn1 * 4u);

    // Check bounds (64MB memory limit)
    if (pte1_addr >= 67108864u) {
        return 0xFFFFFFFFu; // Fault
    }

    let pte1 = system_memory[pte1_addr / 4u];
    let pte1_v = pte1 & 1u;

    if (pte1_v == 0u) {
        return 0xFFFFFFFFu; // Invalid PTE
    }

    // Check if leaf (XWR bits set) - megapage support (4MB)
    let pte1_xwr = (pte1 >> 1u) & 0x7u;
    let is_leaf1 = pte1_xwr != 0u;

    if (is_leaf1) {
        // Megapage: 4MB page
        let ppn1 = (pte1 >> 10u) & 0xFFFFFu;
        return (ppn1 << 22u) | (vpn0 << 12u) | offset;
    }

    // Level 2: Walk to level 0
    let ppn1_from_pte1 = (pte1 >> 10u) & 0x3FFFFFu;
    let pte0_addr = (ppn1_from_pte1 * 4096u) + (vpn0 * 4u);

    if (pte0_addr >= 67108864u) {
        return 0xFFFFFFFFu;
    }

    let pte0 = system_memory[pte0_addr / 4u];
    let pte0_v = pte0 & 1u;

    if (pte0_v == 0u) {
        return 0xFFFFFFFFu;
    }

    // Check permission (W bit for writes)
    let pte0_w = (pte0 >> 2u) & 1u;
    if (is_write == 1u && pte0_w == 0u) {
        return 0xFFFFFFFFu; // Write fault
    }

    // 4KB page
    let ppn0 = (pte0 >> 10u) & 0xFFFFFu;
    return (ppn0 << 12u) | offset;
}

// --- MMIO INPUT POLLING ---
fn poll_input(base_idx: u32) -> bool {
    // Read input status
    let status_addr = (MMIO_INPUT_BASE + MMIO_INPUT_STATUS) / 4u;

    if (status_addr >= arrayLength(&system_memory)) {
        return false;
    }

    let status = system_memory[status_addr];
    let pending = status & 1u;

    if (pending == 0u) {
        return false;  // No input pending
    }

    // Read input type
    let type_addr = (MMIO_INPUT_BASE + MMIO_INPUT_TYPE) / 4u;
    let input_type = system_memory[type_addr];

    // Process based on type
    if (input_type == INPUT_TYPE_KEYBOARD) {
        // Read key code and flags
        let key_addr = (MMIO_INPUT_BASE + MMIO_INPUT_KEY) / 4u;
        let flags_addr = (MMIO_INPUT_BASE + MMIO_INPUT_FLAGS) / 4u;

        let key_code = system_memory[key_addr];
        let flags = system_memory[flags_addr];

        // For now, store in a memory location the OS can read
        // Keyboard buffer at 0x02100000 (33MB)
        let kb_buf_addr = 0x02100000u / 4u;
        if (kb_buf_addr < arrayLength(&system_memory)) {
            // Write: keycode | (flags << 16)
            system_memory[kb_buf_addr] = key_code | (flags << 16u);
        }

    } else if (input_type == INPUT_TYPE_MOUSE) {
        // Read mouse coordinates
        let x_addr = (MMIO_INPUT_BASE + MMIO_INPUT_X) / 4u;
        let y_addr = (MMIO_INPUT_BASE + MMIO_INPUT_Y) / 4u;
        let flags_addr = (MMIO_INPUT_BASE + MMIO_INPUT_FLAGS) / 4u;

        let mouse_x = system_memory[x_addr];
        let mouse_y = system_memory[y_addr];
        let flags = system_memory[flags_addr];

        // Mouse buffer at 0x02200000 (34MB)
        let mouse_buf_addr = 0x02200000u / 4u;
        if (mouse_buf_addr + 2u < arrayLength(&system_memory)) {
            system_memory[mouse_buf_addr] = mouse_x;
            system_memory[mouse_buf_addr + 1u] = mouse_y;
            system_memory[mouse_buf_addr + 2u] = flags;
        }
    }

    // Clear pending flag (acknowledge)
    system_memory[status_addr] = status & ~1u;

    return true;
}

// --- COMPUTE KERNEL ---

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let core_id = global_id.x;
    let base_idx = core_id * REGS_PER_CORE;
    
    // 1. Check if HALTED (stored in CSR_HALT index)
    let halted = cpu_states[base_idx + CSR_HALT];
    if (halted > 0u) { return; }

    // 1.5. Poll for MMIO input (only core 0)
    if (core_id == 0u) {
        poll_input(base_idx);
    }

    // 2. Fetch PC
    var pc = cpu_states[base_idx + 32u];
    
    // 3. Instruction Fetch
    let inst = expanded_code[pc];
    
    // 4. Decode
    let opcode = get_opcode(inst);
    let rd = get_rd(inst);
    let funct3 = get_funct3(inst);
    let rs1 = get_rs1(inst);
    let rs2 = get_rs2(inst);
    
    // 5. Execute
    switch (opcode) {
        case 0x13u: { // OP-IMM (addi, etc)
            if (funct3 == 0u) { // ADDI
                let imm = i32(inst) >> 20u; // Sign-extended 12-bit
                let val1 = i32(cpu_states[base_idx + rs1]);
                if (rd != 0u) {
                    cpu_states[base_idx + rd] = u32(val1 + imm);
                }
            }
        }
        case 0x33u: { // OP (add, sub, mul, div, etc)
            let val1 = i32(cpu_states[base_idx + rs1]);
            let val2 = i32(cpu_states[base_idx + rs2]);
            let funct7 = (inst >> 25u) & 0x7Fu;

            if (funct7 == 0x01u) {
                // M extension
                if (funct3 == 0u) { // MUL
                    if (rd != 0u) {
                        // 32-bit multiply (low 32 bits of product)
                        cpu_states[base_idx + rd] = u32(val1 * val2);
                    }
                } else if (funct3 == 1u) { // MULH (signed * signed, high bits)
                    // For 32-bit, need 64-bit intermediate
                    // WGSL doesn't have i64, so we simulate
                    let sign1 = val1 < 0;
                    let sign2 = val2 < 0;
                    let abs1 = select(-val1, val1, sign1);
                    let abs2 = select(-val2, val2, sign2);
                    let prod = u32(abs1) * u32(abs2);
                    let high = prod >> 32u;
                    if (sign1 != sign2) {
                        // Result should be negative
                        if (rd != 0u) {
                            cpu_states[base_idx + rd] = ~high;
                        }
                    } else {
                        if (rd != 0u) {
                            cpu_states[base_idx + rd] = high;
                        }
                    }
                } else if (funct3 == 4u) { // DIV
                    if (val2 != 0 && rd != 0u) {
                        cpu_states[base_idx + rd] = u32(val1 / val2);
                    }
                } else if (funct3 == 5u) { // DIVU
                    if (val2 != 0u && rd != 0u) {
                        cpu_states[base_idx + rd] = cpu_states[base_idx + rs1] / cpu_states[base_idx + rs2];
                    }
                } else if (funct3 == 6u) { // REM
                    if (val2 != 0 && rd != 0u) {
                        cpu_states[base_idx + rd] = u32(val1 % val2);
                    }
                } else if (funct3 == 7u) { // REMU
                    if (val2 != 0u && rd != 0u) {
                        cpu_states[base_idx + rd] = cpu_states[base_idx + rs1] % cpu_states[base_idx + rs2];
                    }
                }
            } else if (funct3 == 0u) { // ADD / SUB
                if (funct7 == 0x00u) {
                    if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 + val2); }
                } else if (funct7 == 0x20u) {
                    if (rd != 0u) { cpu_states[base_idx + rd] = u32(val1 - val2); }
                }
            }
        }
        case 0x63u: { // BRANCH (beq, bne)
            let val1 = cpu_states[base_idx + rs1];
            let val2 = cpu_states[base_idx + rs2];
            var branch = false;
            if (funct3 == 0u) { branch = (val1 == val2); }      // BEQ
            else if (funct3 == 1u) { branch = (val1 != val2); } // BNE
            
            if (branch) {
                // Simplified B-type immediate extraction
                let imm = ( (inst >> 31u) << 12u ) |
                          ( ((inst >> 7u) & 1u) << 11u ) |
                          ( ((inst >> 25u) & 0x3Fu) << 5u ) |
                          ( ((inst >> 8u) & 0xFu) << 1u );
                let offset = i32(imm); // Sign extend would be more complex, but for POC...
                pc = u32(i32(pc) + (offset / 4) - 1); 
            }
        }
        case 0x03u: { // LOAD (lw)
            if (funct3 == 0x2u) { // LW
                 let offset = i32(inst) >> 20u;
                 let val1 = i32(cpu_states[base_idx + rs1]);
                 let vaddr = u32(val1 + offset);

                 // Translate virtual to physical
                 let paddr = translate_address(vaddr, 0u, base_idx);

                 if (paddr == 0xFFFFFFFFu) {
                     // Page fault - trap to handler
                     pc = trap_enter(base_idx, CAUSE_LOAD_PAGE_FAULT, vaddr, pc);
                 } else if (paddr < 67108864u) {
                     // Assume word aligned for POC
                     let word_idx = paddr / 4u;
                     let loaded_val = system_memory[word_idx];
                     if (rd != 0u) { cpu_states[base_idx + rd] = loaded_val; }
                 }
            }
        }
        case 0x23u: { // STORE (sw)
            if (funct3 == 0x2u) { // SW
                 // S-Type immediate construction
                 let imm11_5 = (inst >> 25u) & 0x7Fu;
                 let imm4_0 = (inst >> 7u) & 0x1Fu;
                 let imm_s = (imm11_5 << 5u) | imm4_0;
                 // Sign extend 12-bit immediate
                 let offset_s = (i32(imm_s) << 20u) >> 20u;

                 let val1 = i32(cpu_states[base_idx + rs1]);
                 let val2 = cpu_states[base_idx + rs2];
                 let vaddr = u32(val1 + offset_s);

                 // Translate virtual to physical
                 let paddr = translate_address(vaddr, 1u, base_idx);

                 if (paddr == 0xFFFFFFFFu) {
                     // Page fault - trap to handler
                     pc = trap_enter(base_idx, CAUSE_STORE_PAGE_FAULT, vaddr, pc);
                 } else if (paddr < 67108864u) {
                     let word_idx = paddr / 4u;
                     system_memory[word_idx] = val2;
                 }
            }
        }
        case 0x73u: { // SYSTEM (ecall, csrrw, csrrs, sret)
            let funct3_sys = (inst >> 12u) & 0x7u;
            let funct7_sys = (inst >> 25u) & 0x7Fu;

            if (funct7_sys == 0x30u) {
                // SRET - Return from trap
                pc = trap_ret(base_idx);
            } else if (funct3_sys == 0u) {
                // ECALL/EBREAK
                let imm = inst >> 20u;
                if (imm == 0u) {
                    // ECALL - system call
                    let current_mode = cpu_states[base_idx + CSR_MODE];
                    let cause = select(CAUSE_ECALL_S, CAUSE_ECALL_U, current_mode == 0u);
                    pc = trap_enter(base_idx, cause, 0u, pc);
                } else if (imm == 1u) {
                    // EBREAK - breakpoint
                    pc = trap_enter(base_idx, CAUSE_BREAKPOINT, pc, pc);
                }
            } else if (funct3_sys == 1u) {
                // CSRRW: CSR[csr] <- rs1; rd <- old_csr
                let csr_num = inst >> 20u;
                let csr_idx = _get_csr_index(csr_num);
                if (csr_idx < 255u) {
                    let old_val = cpu_states[base_idx + csr_idx];
                    if (rd != 0u) {
                        cpu_states[base_idx + rd] = old_val;
                    }
                    cpu_states[base_idx + csr_idx] = cpu_states[base_idx + rs1];
                }
            } else if (funct3_sys == 2u) {
                // CSRRS: CSR[csr] <- CSR | rs1; rd <- old_csr (set bits)
                let csr_num = inst >> 20u;
                let csr_idx = _get_csr_index(csr_num);
                if (csr_idx < 255u) {
                    let old_val = cpu_states[base_idx + csr_idx];
                    if (rd != 0u) {
                        cpu_states[base_idx + rd] = old_val;
                    }
                    let rs1_val = cpu_states[base_idx + rs1];
                    cpu_states[base_idx + csr_idx] = old_val | rs1_val;
                }
            } else if (funct3_sys == 3u) {
                // CSRRC: CSR[csr] <- CSR & ~rs1; rd <- old_csr (clear bits)
                let csr_num = inst >> 20u;
                let csr_idx = _get_csr_index(csr_num);
                if (csr_idx < 255u) {
                    let old_val = cpu_states[base_idx + csr_idx];
                    if (rd != 0u) {
                        cpu_states[base_idx + rd] = old_val;
                    }
                    let rs1_val = cpu_states[base_idx + rs1];
                    cpu_states[base_idx + csr_idx] = old_val & ~rs1_val;
                }
            }
        }
        case 0x2Fu: { // ATOMIC (A-Extension)
            // Format: funct5 | aq | rl | rs2 | rs1 | funct3 | rd | opcode
            let funct5 = (inst >> 27u) & 0x1Fu;
            let val1 = i32(cpu_states[base_idx + rs1]); // Address base
            let vaddr = u32(val1); // rs1 contains address

            // Translate address
            // AMOs are Read-Modify-Write, so effectively Write.
            // LR is Read.
            var is_write = 1u;
            if (funct5 == 0x02u) { // LR.W
                is_write = 0u;
            }

            let paddr = translate_address(vaddr, is_write, base_idx);

            if (paddr == 0xFFFFFFFFu) {
                // Page fault - trap to handler
                pc = trap_enter(base_idx, CAUSE_STORE_PAGE_FAULT, vaddr, pc);
            } else if (paddr < 67108864u) {
                let word_idx = paddr / 4u;
                let mem_val = system_memory[word_idx]; // Original value
                let val2 = cpu_states[base_idx + rs2]; // Source operand

                if (funct5 == 0x02u) { // LR.W
                    // Load Reserved: Load value, set reservation
                    if (rd != 0u) { cpu_states[base_idx + rd] = mem_val; }
                    cpu_states[base_idx + CSR_RESERVATION] = paddr;
                } else if (funct5 == 0x03u) { // SC.W
                    // Store Conditional: Store only if reservation matches
                    let reservation = cpu_states[base_idx + CSR_RESERVATION];
                    if (reservation == paddr) {
                        system_memory[word_idx] = val2;
                        if (rd != 0u) { cpu_states[base_idx + rd] = 0u; } // Success = 0
                        cpu_states[base_idx + CSR_RESERVATION] = 0xFFFFFFFFu; // Invalidate
                    } else {
                        if (rd != 0u) { cpu_states[base_idx + rd] = 1u; } // Failure = 1
                    }
                } else {
                    // AMOs (Read-Modify-Write)
                    
                    // First read loaded value into rd (atomic swap/add/etc returns ORIGINAL value)
                    if (rd != 0u) { cpu_states[base_idx + rd] = mem_val; }

                    var result: u32 = 0u;
                    let i_mem = i32(mem_val);
                    let i_src = i32(val2);

                    switch (funct5) {
                        case 0x01u: { result = val2; } // AMOSWAP
                        case 0x00u: { result = u32(i_mem + i_src); } // AMOADD
                        case 0x04u: { result = mem_val ^ val2; } // AMOXOR
                        case 0x0Cu: { result = mem_val & val2; } // AMOAND
                        case 0x08u: { result = mem_val | val2; } // AMOOR
                        case 0x10u: { result = u32(min(i_mem, i_src)); } // AMOMIN
                        case 0x14u: { result = u32(max(i_mem, i_src)); } // AMOMAX
                        case 0x18u: { result = min(mem_val, val2); } // AMOMINU
                        case 0x1Cu: { result = max(mem_val, val2); } // AMOMAXU
                        default: { result = mem_val; } // Unknown - no op
                    }
                    
                    // Write back result
                    system_memory[word_idx] = result;
                }
            }
        }
        default: {
            // Unknown opcode - illegal instruction trap
            pc = trap_enter(base_idx, CAUSE_ILLEGAL_INST, inst, pc);
        }
    }

    // 6. Update PC for next tick
    cpu_states[base_idx + 32u] = pc + 1u;
}
