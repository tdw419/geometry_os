/**
 * Geometry OS: Privileged Architecture Test Suite
 *
 * Comprehensive test suite validating all privileged instructions:
 * - CSR instructions (CSRRW, CSRRS, CSRRC, CSRRWI, CSRRSI, CSRRCI)
 * - Trap handling (M-mode and S-mode entry)
 * - Trap return (MRET, SRET)
 *
 * Phase 18-04: Privileged Architecture Verification (TDD)
 */

import { RiscvTestEncoder, executeProgram } from './test_riscv_core.js';
import { CoreExecutionVerifier } from '../CoreExecutionVerifier.js';

// ============================================================================
// CSR ADDRESS CONSTANTS
// ============================================================================

// S-mode CSRs
const CSR_SSTATUS = 0x100;
const CSR_SIE = 0x104;
const CSR_STVEC = 0x105;
const CSR_SSCRATCH = 0x140;
const CSR_SEPC = 0x141;
const CSR_SCAUSE = 0x142;
const CSR_STVAL = 0x143;
const CSR_SIP = 0x144;
const CSR_SATP = 0x180;

// M-mode CSRs
const CSR_MSTATUS = 0x300;
const CSR_MISA = 0x301;
const CSR_MEDELEG = 0x302;
const CSR_MIDELEG = 0x303;
const CSR_MIE = 0x304;
const CSR_MTVEC = 0x305;
const CSR_MSCRATCH = 0x340;
const CSR_MEPC = 0x341;
const CSR_MCAUSE = 0x342;
const CSR_MTVAL = 0x343;
const CSR_MIP = 0x344;

// ============================================================================
// PRIVILEGED TEST ENCODER - Extends RiscvTestEncoder with privileged instructions
// ============================================================================

/**
 * Extended RISC-V encoder with privileged instructions.
 * Adds CSR instructions, MRET, SRET, and WFI.
 *
 * Provides both static encoding methods (return instruction words) and
 * instance methods (append to program).
 */
export class PrivilegedTestEncoder extends RiscvTestEncoder {
    constructor() {
        super();
    }

    // ========================================================================
    // STATIC CSR ENCODERS (return instruction word, don't append)
    // ========================================================================

    /**
     * CSRRW rd, rs1, csr - Atomic Read/Write CSR
     * Read old value of CSR into rd, write rs1 into CSR
     * If rd=x0, the instruction does not read the CSR (write-only)
     */
    static CSRRW(rd, rs1, csr) {
        // I-type: imm[11:0] = CSR address, funct3 = 1
        return ((csr & 0xFFF) << 20) | (rs1 << 15) | (1 << 12) | (rd << 7) | 0x73;
    }

    /**
     * CSRRS rd, rs1, csr - Atomic Read and Set Bits in CSR
     * Read old value of CSR into rd, set bits from rs1
     * If rs1=x0, the instruction does not write to the CSR (read-only)
     */
    static CSRRS(rd, rs1, csr) {
        return ((csr & 0xFFF) << 20) | (rs1 << 15) | (2 << 12) | (rd << 7) | 0x73;
    }

    /**
     * CSRRC rd, rs1, csr - Atomic Read and Clear Bits in CSR
     * Read old value of CSR into rd, clear bits from rs1
     * If rs1=x0, the instruction does not write to the CSR
     */
    static CSRRC(rd, rs1, csr) {
        return ((csr & 0xFFF) << 20) | (rs1 << 15) | (3 << 12) | (rd << 7) | 0x73;
    }

    /**
     * CSRRWI rd, zimm, csr - Atomic Read/Write CSR Immediate
     * Read old value of CSR into rd, write zero-extended 5-bit immediate
     */
    static CSRRWI(rd, zimm, csr) {
        return ((csr & 0xFFF) << 20) | ((zimm & 0x1F) << 15) | (5 << 12) | (rd << 7) | 0x73;
    }

    /**
     * CSRRSI rd, zimm, csr - Atomic Read and Set Bits Immediate
     * Read old value of CSR into rd, set bits from zero-extended 5-bit immediate
     */
    static CSRRSI(rd, zimm, csr) {
        return ((csr & 0xFFF) << 20) | ((zimm & 0x1F) << 15) | (6 << 12) | (rd << 7) | 0x73;
    }

    /**
     * CSRRCI rd, zimm, csr - Atomic Read and Clear Bits Immediate
     * Read old value of CSR into rd, clear bits from zero-extended 5-bit immediate
     */
    static CSRRCI(rd, zimm, csr) {
        return ((csr & 0xFFF) << 20) | ((zimm & 0x1F) << 15) | (7 << 12) | (rd << 7) | 0x73;
    }

    // ========================================================================
    // STATIC PRIVILEGED INSTRUCTION ENCODERS
    // ========================================================================

    /**
     * MRET - Return from Machine Mode
     * Encoding: 0x30200073
     */
    static MRET() {
        return 0x30200073;
    }

    /**
     * SRET - Return from Supervisor Mode
     * Encoding: 0x10200073
     */
    static SRET() {
        return 0x10200073;
    }

    /**
     * ECALL - Environment Call
     * Encoding: 0x00000073
     */
    static ECALL() {
        return 0x00000073;
    }

    /**
     * EBREAK - Breakpoint
     * Encoding: 0x00100073
     */
    static EBREAK() {
        return 0x00100073;
    }

    /**
     * SFENCE.VMA - TLB Flush
     * Encoding: 0x00012073
     */
    static SFENCE_VMA() {
        return 0x00012073;
    }

    // ========================================================================
    // INSTANCE METHODS - CSR INSTRUCTIONS (opcode 0x73, SYSTEM)
    // ========================================================================

    /**
     * Emit CSR instruction with I-type format
     * Format: csr[11:0] | rs1/zimm[19:15] | funct3[14:12] | rd[11:7] | opcode[6:0]
     */
    _emitCSR(funct3, rd, rs1, csr) {
        const inst = (csr << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | 0x73;
        this.code.push(inst >>> 0);
        this.pc += 4;
    }

    /** CSRRW rd, rs1, csr - Atomic read/write CSR */
    csrrw(rd, rs1, csr) {
        this._emitCSR(0x1, rd, rs1, csr);
    }

    /** CSRRS rd, rs1, csr - Atomic read and set bits in CSR */
    csrrs(rd, rs1, csr) {
        this._emitCSR(0x2, rd, rs1, csr);
    }

    /** CSRRC rd, rs1, csr - Atomic read and clear bits in CSR */
    csrrc(rd, rs1, csr) {
        this._emitCSR(0x3, rd, rs1, csr);
    }

    /** CSRRWI rd, zimm, csr - Atomic read/write CSR (immediate) */
    csrrwi(rd, zimm, csr) {
        this._emitCSR(0x5, rd, zimm, csr);
    }

    /** CSRRSI rd, zimm, csr - Atomic read and set bits (immediate) */
    csrrsi(rd, zimm, csr) {
        this._emitCSR(0x6, rd, zimm, csr);
    }

    /** CSRRCI rd, zimm, csr - Atomic read and clear bits (immediate) */
    csrrci(rd, zimm, csr) {
        this._emitCSR(0x7, rd, zimm, csr);
    }

    // ========================================================================
    // INSTANCE METHODS - PRIVILEGED INSTRUCTIONS
    // ========================================================================

    /** MRET - Return from M-mode trap */
    mret() {
        this.code.push(PrivilegedTestEncoder.MRET());
        this.pc += 4;
    }

    /** SRET - Return from S-mode trap */
    sret() {
        this.code.push(PrivilegedTestEncoder.SRET());
        this.pc += 4;
    }

    /** ECALL - Environment call */
    ecall() {
        this.code.push(PrivilegedTestEncoder.ECALL());
        this.pc += 4;
    }

    /** WFI - Wait for interrupt */
    wfi() {
        // WFI encoding: 0x10500073
        this.code.push(0x10500073 >>> 0);
        this.pc += 4;
    }

    /** EBREAK - Breakpoint (causes trap) */
    ebreak() {
        this.code.push(PrivilegedTestEncoder.EBREAK());
        this.pc += 4;
    }

    /** SFENCE.VMA - TLB Flush */
    sfence_vma() {
        this.code.push(0x00012073 >>> 0);
        this.pc += 4;
    }
}

// ============================================================================
// TEST EXECUTION HELPER
// ============================================================================

/**
 * Execute a privileged test program and return state
 */
async function executePrivilegedTest(verifier, device, queue, code, options = {}) {
    const { maxSteps = 100, memorySize = 4096 } = options;

    const { codeBuffer, memoryBuffer, stateBuffer } = verifier.createTestBuffers(code, memorySize);

    try {
        const shaderModule = device.createShaderModule({
            label: 'visual_cpu_riscv_privileged_test',
            code: await fetch('../shaders/visual_cpu_riscv.wgsl').then(r => r.text())
        });

        const bindGroupLayout = device.createBindGroupLayout({
            label: 'riscv-privileged-test-bgl',
            entries: [
                { binding: 0, visibility: GPUShaderStage.COMPUTE, buffer: { type: 'read-only-storage' } },
                { binding: 1, visibility: GPUShaderStage.COMPUTE, buffer: { type: 'storage' } },
                { binding: 2, visibility: GPUShaderStage.COMPUTE, buffer: { type: 'storage' } }
            ]
        });

        const pipeline = device.createComputePipeline({
            label: 'riscv-privileged-test-pipeline',
            layout: device.createPipelineLayout({ bindGroupLayouts: [bindGroupLayout] }),
            compute: { module: shaderModule, entryPoint: 'main' }
        });

        const bindGroup = device.createBindGroup({
            layout: bindGroupLayout,
            entries: [
                { binding: 0, resource: { buffer: codeBuffer } },
                { binding: 1, resource: { buffer: memoryBuffer } },
                { binding: 2, resource: { buffer: stateBuffer } }
            ]
        });

        const commandEncoder = device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();
        passEncoder.setPipeline(pipeline);
        passEncoder.setBindGroup(0, bindGroup);
        passEncoder.dispatchWorkgroups(1);
        passEncoder.end();
        queue.submit([commandEncoder.finish()]);

        const state = await verifier.readState(stateBuffer);

        return {
            registers: state.registers,
            pc: state.pc,
            halted: state.halted,
            mode: state.mode,
            raw: state.raw
        };
    } finally {
        codeBuffer.destroy();
        memoryBuffer.destroy();
        stateBuffer.destroy();
    }
}

// ============================================================================
// CSR INSTRUCTION TESTS
// ============================================================================

/**
 * Test CSRRW: read old value, write new value
 */
export async function testCSRRW(verifier, device, queue) {
    const e = new PrivilegedTestEncoder();

    // x1 = 0x1234
    // CSRRW x2, x1, MSCRATCH: x2 = old mscratch, mscratch = x1
    // Halt
    e.addi(1, 0, 0x1234);
    e.csrrw(2, 1, CSR_MSCRATCH);
    e.jal(0, 0);  // halt (jump to self)

    const state = await executePrivilegedTest(verifier, device, queue, e.finalize());

    // x2 should be 0 (initial mscratch)
    // mscratch (CSR index 55) should be 0x1234
    const mscratchIndex = 55;
    return {
        name: 'CSRRW read/write',
        pass: state.registers[2] === 0 && state.raw[mscratchIndex] === 0x1234,
        expected: 'x2=0, mscratch=0x1234',
        actual: `x2=${state.registers[2]}, mscratch=0x${state.raw[mscratchIndex]?.toString(16)}`
    };
}

/**
 * Test CSRRS: read and set bits
 */
export async function testCSRRS(verifier, device, queue) {
    const e = new PrivilegedTestEncoder();

    // x1 = 0x5 (bits 0 and 2)
    // mstatus = 0x5
    // x1 = 0x10 (bit 4)
    // CSRRS x2, x1, MSTATUS: x2 = mstatus, mstatus |= 0x10
    e.addi(1, 0, 0x5);
    e.csrrw(0, 1, CSR_MSTATUS);
    e.addi(1, 0, 0x10);
    e.csrrs(2, 1, CSR_MSTATUS);
    e.jal(0, 0);

    const state = await executePrivilegedTest(verifier, device, queue, e.finalize());

    // x2 should be 0x5, mstatus (index 50) should be 0x15
    const mstatusIndex = 50;
    return {
        name: 'CSRRS set bits',
        pass: state.registers[2] === 0x5 && state.raw[mstatusIndex] === 0x15,
        expected: 'x2=0x5, mstatus=0x15',
        actual: `x2=0x${state.registers[2]?.toString(16)}, mstatus=0x${state.raw[mstatusIndex]?.toString(16)}`
    };
}

/**
 * Test CSRRC: read and clear bits
 */
export async function testCSRRC(verifier, device, queue) {
    const e = new PrivilegedTestEncoder();

    // x1 = 0x15
    // mstatus = 0x15
    // x1 = 0x5 (bits to clear)
    // CSRRC x2, x1, MSTATUS: x2 = mstatus, mstatus &= ~0x5
    e.addi(1, 0, 0x15);
    e.csrrw(0, 1, CSR_MSTATUS);
    e.addi(1, 0, 0x5);
    e.csrrc(2, 1, CSR_MSTATUS);
    e.jal(0, 0);

    const state = await executePrivilegedTest(verifier, device, queue, e.finalize());

    // x2 should be 0x15, mstatus should be 0x10
    const mstatusIndex = 50;
    return {
        name: 'CSRRC clear bits',
        pass: state.registers[2] === 0x15 && state.raw[mstatusIndex] === 0x10,
        expected: 'x2=0x15, mstatus=0x10',
        actual: `x2=0x${state.registers[2]?.toString(16)}, mstatus=0x${state.raw[mstatusIndex]?.toString(16)}`
    };
}

/**
 * Test CSRRS with rs1=x0: read-only (no modification)
 */
export async function testCSRReadonlyWithX0(verifier, device, queue) {
    const e = new PrivilegedTestEncoder();

    // x1 = 0x1234
    // mscratch = 0x1234
    // CSRRS x2, x0, MSCRATCH: x2 = mscratch (no write since rs1=x0)
    e.addi(1, 0, 0x1234);
    e.csrrw(0, 1, CSR_MSCRATCH);
    e.csrrs(2, 0, CSR_MSCRATCH);
    e.jal(0, 0);

    const state = await executePrivilegedTest(verifier, device, queue, e.finalize());

    // x2 should be 0x1234, mscratch should still be 0x1234
    const mscratchIndex = 55;
    return {
        name: 'CSRRS readonly (x0)',
        pass: state.registers[2] === 0x1234 && state.raw[mscratchIndex] === 0x1234,
        expected: 'x2=0x1234, mscratch=0x1234',
        actual: `x2=0x${state.registers[2]?.toString(16)}, mscratch=0x${state.raw[mscratchIndex]?.toString(16)}`
    };
}

/**
 * Test CSR immediate variants: CSRRWI, CSRRSI, CSRRCI
 */
export async function testCSRImmediateVariants(verifier, device, queue) {
    const e = new PrivilegedTestEncoder();

    // CSRRWI x1, 0x1F, MSCRATCH: x1 = old, mscratch = 0x1F
    // CSRRSI x2, 0x8, MSTATUS: x2 = mstatus, mstatus |= 0x8
    e.csrrwi(1, 0x1F, CSR_MSCRATCH);
    e.csrrsi(2, 0x8, CSR_MSTATUS);
    e.jal(0, 0);

    const state = await executePrivilegedTest(verifier, device, queue, e.finalize());

    // x1 should be 0 (initial), mscratch should be 0x1F
    const mscratchIndex = 55;
    return {
        name: 'CSRRWI/CSRRSI immediates',
        pass: state.registers[1] === 0 && state.raw[mscratchIndex] === 0x1F,
        expected: 'x1=0, mscratch=0x1F',
        actual: `x1=${state.registers[1]}, mscratch=0x${state.raw[mscratchIndex]?.toString(16)}`
    };
}

/**
 * Test CSRRCI: clear bits with immediate
 */
export async function testCSRRCI(verifier, device, queue) {
    const e = new PrivilegedTestEncoder();

    // Set mscratch to 0xFF
    // CSRRCI x1, 0x0F, MSCRATCH: x1 = mscratch, mscratch &= ~0x0F
    e.addi(1, 0, 0xFF);
    e.csrrw(0, 1, CSR_MSCRATCH);
    e.csrrci(2, 0x0F, CSR_MSCRATCH);
    e.jal(0, 0);

    const state = await executePrivilegedTest(verifier, device, queue, e.finalize());

    // x2 should be 0xFF, mscratch should be 0xF0
    const mscratchIndex = 55;
    return {
        name: 'CSRRCI clear immediate',
        pass: state.registers[2] === 0xFF && state.raw[mscratchIndex] === 0xF0,
        expected: 'x2=0xFF, mscratch=0xF0',
        actual: `x2=0x${state.registers[2]?.toString(16)}, mscratch=0x${state.raw[mscratchIndex]?.toString(16)}`
    };
}

// ============================================================================
// TRAP RETURN TESTS (MRET, SRET)
// ============================================================================

/**
 * Test MRET: return from M-mode trap
 */
export async function testMRET(verifier, device, queue) {
    const e = new PrivilegedTestEncoder();

    // Set up for MRET:
    // x1 = 0x100 (return address in instruction words, not bytes)
    // mepc = 0x100 (byte address = 0x400)
    // x1 = 0x88 (MPIE=1, MPP=0)
    // mstatus = 0x88
    // MRET: jump to mepc
    // This should not execute
    // At address 0x100 (instruction index 0x40):
    e.addi(1, 0, 0x400);   // x1 = 0x400 (byte address)
    e.csrrw(0, 1, CSR_MEPC);  // mepc = 0x400
    e.addi(1, 0, 0x88);    // x1 = MPIE set, MPP=0
    e.csrrw(0, 1, CSR_MSTATUS);  // mstatus = 0x88
    e.mret();              // Should jump to 0x400
    e.addi(3, 0, 0x999);   // Should not execute if MRET works

    // Pad with zeros to reach address 0x400 (instruction index 0x100)
    while (e.code.length < 0x100) {
        e.code.push(0);
    }
    e.addi(3, 0, 0x42);    // x3 = 42 at return target
    e.jal(0, 0);

    const state = await executePrivilegedTest(verifier, device, queue, e.finalize());

    // x3 should be 42 (executed return target), not 999
    return {
        name: 'MRET trap return',
        pass: state.registers[3] === 42,
        expected: 'x3=42',
        actual: `x3=${state.registers[3]}`
    };
}

/**
 * Test SRET: return from S-mode trap
 */
export async function testSRET(verifier, device, queue) {
    const e = new PrivilegedTestEncoder();

    // Set up for SRET:
    // x1 = 0x400 (return byte address)
    // sepc = 0x400
    // x1 = 0x20 (SPP=1, SPIE=0)
    // sstatus = 0x20
    // SRET: jump to sepc
    e.addi(1, 0, 0x400);
    e.csrrw(0, 1, CSR_SEPC);  // sepc = 0x400
    e.addi(1, 0, 0x20);    // x1 = SPP=1, SPIE=0
    e.csrrw(0, 1, CSR_SSTATUS);  // sstatus = 0x20
    e.sret();              // Should jump to 0x400
    e.addi(3, 0, 0x999);   // Should not execute

    // Pad to reach address 0x400 (instruction index 0x100)
    while (e.code.length < 0x100) {
        e.code.push(0);
    }
    e.addi(3, 0, 0x42);
    e.jal(0, 0);

    const state = await executePrivilegedTest(verifier, device, queue, e.finalize());

    return {
        name: 'SRET trap return',
        pass: state.registers[3] === 42,
        expected: 'x3=42',
        actual: `x3=${state.registers[3]}`
    };
}

// ============================================================================
// TRAP HANDLING TESTS
// ============================================================================

/**
 * Test M-mode trap entry on EBREAK
 */
export async function testTrapEnterMmode(verifier, device, queue) {
    const e = new PrivilegedTestEncoder();

    // Set up trap handler:
    // x1 = 0x200 (trap handler byte address)
    // mtvec = 0x200
    // EBREAK: should trap to MTVEC
    // Should not execute
    e.addi(1, 0, 0x200);
    e.csrrw(0, 1, CSR_MTVEC);  // mtvec = 0x200
    e.ebreak();            // Should trap to MTVEC
    e.addi(2, 0, 0x999);   // Should not execute

    // Pad and add handler at 0x200 (instruction index 0x80)
    while (e.code.length < 0x80) {
        e.code.push(0);
    }
    e.addi(2, 0, 0x42);    // x2 = 42 in handler
    e.jal(0, 0);

    const state = await executePrivilegedTest(verifier, device, queue, e.finalize());

    // x2 should be 42 (handler executed), not 999
    // mcause should be 3 (breakpoint exception)
    const mcauseIndex = 53;
    return {
        name: 'M-mode trap entry',
        pass: state.registers[2] === 42 && state.raw[mcauseIndex] === 3,
        expected: 'x2=42, mcause=3',
        actual: `x2=${state.registers[2]}, mcause=${state.raw[mcauseIndex]}`
    };
}

/**
 * Test trap delegation: M-mode can delegate to S-mode
 */
export async function testTrapDelegation(verifier, device, queue) {
    const e = new PrivilegedTestEncoder();

    // Set up for delegation:
    // medeleg = 0x8 (delegate breakpoint exception)
    // mtvec = 0x400 (M-mode handler)
    // stvec = 0x200 (S-mode handler)
    // EBREAK: should be delegated to S-mode
    e.addi(1, 0, 0x8);
    e.csrrw(0, 1, CSR_MEDELEG);  // medeleg = 0x8 (delegate breakpoint)
    e.addi(1, 0, 0x400);
    e.csrrw(0, 1, CSR_MTVEC);    // mtvec = 0x400
    e.addi(1, 0, 0x200);
    e.csrrw(0, 1, CSR_STVEC);    // stvec = 0x200
    e.ebreak();              // Should be delegated to S-mode
    e.addi(2, 0, 0x999);     // Should not execute

    // S-mode handler at 0x200 (instruction index 0x80)
    while (e.code.length < 0x80) {
        e.code.push(0);
    }
    e.addi(2, 0, 0x42);      // x2 = 42 in S-mode handler
    e.jal(0, 0);

    // M-mode handler at 0x400 (instruction index 0x100) - should not execute
    while (e.code.length < 0x100) {
        e.code.push(0);
    }
    e.addi(3, 0, 0x99);      // x3 = 99 in M-mode handler (should not execute)
    e.jal(0, 0);

    const state = await executePrivilegedTest(verifier, device, queue, e.finalize());

    // x2 should be 42 (S-mode handler executed)
    // x3 should be 0 (M-mode handler not executed)
    return {
        name: 'Trap delegation',
        pass: state.registers[2] === 42 && state.registers[3] === 0,
        expected: 'x2=42, x3=0',
        actual: `x2=${state.registers[2]}, x3=${state.registers[3]}`
    };
}

/**
 * Test privilege mode stays in M-mode at boot
 */
export async function testMmodeAtBoot(verifier, device, queue) {
    const e = new PrivilegedTestEncoder();

    // Just halt immediately - check initial mode
    e.jal(0, 0);

    const state = await executePrivilegedTest(verifier, device, queue, e.finalize());

    // Mode should be 3 (M-mode) at boot
    return {
        name: 'M-mode at boot',
        pass: state.mode === 3,
        expected: 'mode=3',
        actual: `mode=${state.mode}`
    };
}

/**
 * Test MSTATUS initialization
 */
export async function testMstatusBoot(verifier, device, queue) {
    const e = new PrivilegedTestEncoder();

    // Read mstatus immediately
    e.csrrs(1, 0, CSR_MSTATUS);  // x1 = mstatus (read-only)
    e.jal(0, 0);

    const state = await executePrivilegedTest(verifier, device, queue, e.finalize());

    // mstatus should have MPIE=1 at boot (bit 7)
    const mpie = state.registers[1] & 0x80;
    return {
        name: 'MSTATUS boot init',
        pass: mpie === 0x80,
        expected: 'MPIE=1 (bit 7 set)',
        actual: `mstatus=0x${state.registers[1]?.toString(16)}, MPIE=${mpie === 0x80 ? 1 : 0}`
    };
}

// ============================================================================
// RUN ALL TESTS
// ============================================================================

/**
 * Run all privileged architecture tests
 */
export async function runAllPrivilegedTests(verifier, device, queue) {
    const results = {
        csr: [],
        trapReturn: [],
        trapHandling: [],
        bootState: []
    };

    let errors = [];

    // CSR Tests
    try {
        results.csr.push(await testCSRRW(verifier, device, queue));
        results.csr.push(await testCSRRS(verifier, device, queue));
        results.csr.push(await testCSRRC(verifier, device, queue));
        results.csr.push(await testCSRReadonlyWithX0(verifier, device, queue));
        results.csr.push(await testCSRImmediateVariants(verifier, device, queue));
        results.csr.push(await testCSRRCI(verifier, device, queue));
    } catch (e) {
        errors.push(`CSR tests failed: ${e.message}`);
    }

    // Trap Return Tests
    try {
        results.trapReturn.push(await testMRET(verifier, device, queue));
        results.trapReturn.push(await testSRET(verifier, device, queue));
    } catch (e) {
        errors.push(`Trap return tests failed: ${e.message}`);
    }

    // Trap Handling Tests
    try {
        results.trapHandling.push(await testTrapEnterMmode(verifier, device, queue));
        results.trapHandling.push(await testTrapDelegation(verifier, device, queue));
    } catch (e) {
        errors.push(`Trap handling tests failed: ${e.message}`);
    }

    // Boot State Tests
    try {
        results.bootState.push(await testMmodeAtBoot(verifier, device, queue));
        results.bootState.push(await testMstatusBoot(verifier, device, queue));
    } catch (e) {
        errors.push(`Boot state tests failed: ${e.message}`);
    }

    // Calculate totals
    let totalTests = 0;
    let passedTests = 0;

    for (const category of Object.keys(results)) {
        for (const test of results[category]) {
            totalTests++;
            if (test.pass) passedTests++;
        }
    }

    return {
        categories: results,
        errors,
        totalTests,
        passedTests,
        allPassed: passedTests === totalTests && errors.length === 0
    };
}

// Export for both module and global scope
if (typeof window !== 'undefined') {
    window.PrivilegedTestEncoder = PrivilegedTestEncoder;
    window.runAllPrivilegedTests = runAllPrivilegedTests;
    window.CSR_MSTATUS = CSR_MSTATUS;
    window.CSR_MTVEC = CSR_MTVEC;
    window.CSR_MEPC = CSR_MEPC;
    window.CSR_MCAUSE = CSR_MCAUSE;
    window.CSR_MSCRATCH = CSR_MSCRATCH;
    window.CSR_MEDELEG = CSR_MEDELEG;
    window.CSR_MIDELEG = CSR_MIDELEG;
    window.CSR_SEPC = CSR_SEPC;
    window.CSR_SSTATUS = CSR_SSTATUS;
    window.CSR_STVEC = CSR_STVEC;
}
