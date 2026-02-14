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
const REGS_PER_CORE: u32 = 39u; // 32 registers + PC + Halt + satp + stvec + sscratch + mode

// --- CSR INDICES (in cpu_states array) ---
const CSR_SATP: u32 = 34u;      // Page table base + mode
const CSR_STVEC: u32 = 35u;     // Trap handler address
const CSR_SSCRATCH: u32 = 36u;  // Scratch register for traps
const CSR_MODE: u32 = 37u;      // Privilege mode (0=user, 1=supervisor)
const CSR_HALT: u32 = 38u;      // Halted flag (moved from 33)

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
        case 0x100u: { return CSR_HALT; }     // Treat halt as writable CSR
        default: { return 255u; }              // Unknown CSR
    }
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

// --- COMPUTE KERNEL ---

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let core_id = global_id.x;
    let base_idx = core_id * REGS_PER_CORE;
    
    // 1. Check if HALTED (stored in CSR_HALT index)
    let halted = cpu_states[base_idx + CSR_HALT];
    if (halted > 0u) { return; }

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
        case 0x33u: { // OP (add, sub, etc)
            let val1 = i32(cpu_states[base_idx + rs1]);
            let val2 = i32(cpu_states[base_idx + rs2]);
            if (funct3 == 0u) { // ADD / SUB
                let funct7 = (inst >> 25u) & 0x7Fu;
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
                     // Page fault - halt
                     cpu_states[base_idx + CSR_HALT] = 1u;
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
                     // Page fault - halt
                     cpu_states[base_idx + CSR_HALT] = 1u;
                 } else if (paddr < 67108864u) {
                     let word_idx = paddr / 4u;
                     system_memory[word_idx] = val2;
                 }
            }
        }
        case 0x73u: { // SYSTEM (ecall, csrrw, csrrs)
            let funct3_sys = (inst >> 12u) & 0x7u;

            if (funct3_sys == 0u) {
                // ECALL/EBREAK
                let a7 = cpu_states[base_idx + 17u]; // x17
                if (a7 == 93u) { // exit
                    cpu_states[base_idx + CSR_HALT] = 1u; // SET HALT
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
        default: {
            // NOP or Unknown
        }
    }

    // 6. Update PC for next tick
    cpu_states[base_idx + 32u] = pc + 1u;
}
