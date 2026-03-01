/**
 * Geometry OS: RISC-V Core Execution Test Suite
 *
 * Comprehensive test suite validating all RV32I instructions execute correctly
 * on the GPU via WebGPU compute shaders.
 *
 * Phase 17-03: Core Execution Verification
 *
 * Based on Rust encoder pattern from riscv_test_programs.rs
 */

// ============================================================================
// RISCV TEST ENCODER - JavaScript port
// ============================================================================

/**
 * RISC-V instruction encoder for test program generation.
 * Encodes RV32I instructions as 32-bit words for GPU execution.
 */
export class RiscvTestEncoder {
    constructor() {
        this.code = [];
        this.pc = 0;
    }

    // ========================================================================
    // INTERNAL ENCODING METHODS
    // ========================================================================

    /**
     * Emit R-type instruction
     * Format: funct7[31:25] | rs2[24:20] | rs1[19:15] | funct3[14:12] | rd[11:7] | opcode[6:0]
     */
    _emitR(opcode, rd, rs1, rs2, funct3, funct7) {
        const inst = (funct7 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode;
        this.code.push(inst >>> 0); // Ensure unsigned 32-bit
        this.pc += 4;
    }

    /**
     * Emit I-type instruction
     * Format: imm[31:20] | rs1[19:15] | funct3[14:12] | rd[11:7] | opcode[6:0]
     */
    _emitI(opcode, rd, rs1, funct3, imm) {
        // Handle sign extension for 12-bit immediate
        const imm12 = imm & 0xFFF;
        const inst = (imm12 << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode;
        this.code.push(inst >>> 0);
        this.pc += 4;
    }

    /**
     * Emit U-type instruction
     * Format: imm[31:12] | rd[11:7] | opcode[6:0]
     */
    _emitU(opcode, rd, imm) {
        // Upper 20 bits of immediate (shifted left 12)
        const imm20 = imm & 0xFFFFF000;
        const inst = imm20 | (rd << 7) | opcode;
        this.code.push(inst >>> 0);
        this.pc += 4;
    }

    /**
     * Emit B-type instruction (branch)
     * Format: imm[12|10:5][31:25] | rs2[24:20] | rs1[19:15] | funct3[14:12] | imm[4:1|11][11:7] | opcode[6:0]
     */
    _emitB(opcode, rs1, rs2, funct3, imm) {
        // Convert to unsigned for bit manipulation
        const immU32 = imm >>> 0;

        const imm12 = (immU32 >> 12) & 0x1;  // imm[12]
        const imm10_5 = (immU32 >> 5) & 0x3F; // imm[10:5]
        const imm4_1 = (immU32 >> 1) & 0xF;   // imm[4:1]
        const imm11 = (immU32 >> 11) & 0x1;   // imm[11]

        const inst = (imm12 << 31) | (imm10_5 << 25) | (rs2 << 20) | (rs1 << 15) |
                     (funct3 << 12) | (imm4_1 << 8) | (imm11 << 7) | opcode;
        this.code.push(inst >>> 0);
        this.pc += 4;
    }

    /**
     * Emit J-type instruction (jump)
     * Format: imm[20|10:1|11|19:12][31:12] | rd[11:7] | opcode[6:0]
     */
    _emitJ(opcode, rd, imm) {
        const immU32 = imm >>> 0;

        const imm20 = (immU32 >> 20) & 0x1;    // imm[20]
        const imm10_1 = (immU32 >> 1) & 0x3FF; // imm[10:1]
        const imm11 = (immU32 >> 11) & 0x1;    // imm[11]
        const imm19_12 = (immU32 >> 12) & 0xFF; // imm[19:12]

        const inst = (imm20 << 31) | (imm19_12 << 12) | (imm11 << 20) |
                     (imm10_1 << 21) | (rd << 7) | opcode;
        this.code.push(inst >>> 0);
        this.pc += 4;
    }

    /**
     * Emit S-type instruction (store)
     * Format: imm[11:5][31:25] | rs2[24:20] | rs1[19:15] | funct3[14:12] | imm[4:0][11:7] | opcode[6:0]
     */
    _emitS(opcode, rs2, rs1, funct3, imm) {
        const immU32 = imm >>> 0;

        const imm11_5 = (immU32 >> 5) & 0x7F; // imm[11:5]
        const imm4_0 = immU32 & 0x1F;          // imm[4:0]

        const inst = (imm11_5 << 25) | (rs2 << 20) | (rs1 << 15) |
                     (funct3 << 12) | (imm4_0 << 7) | opcode;
        this.code.push(inst >>> 0);
        this.pc += 4;
    }

    // ========================================================================
    // NOP
    // ========================================================================

    /**
     * NOP instruction (addi x0, x0, 0)
     */
    nop() {
        this.addi(0, 0, 0);
    }

    // ========================================================================
    // R-TYPE: ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND
    // ========================================================================

    /** ADD rd, rs1, rs2 */
    add(rd, rs1, rs2) {
        this._emitR(0x33, rd, rs1, rs2, 0x0, 0x00);
    }

    /** SUB rd, rs1, rs2 */
    sub(rd, rs1, rs2) {
        this._emitR(0x33, rd, rs1, rs2, 0x0, 0x20);
    }

    /** SLL rd, rs1, rs2 (shift left logical) */
    sll(rd, rs1, rs2) {
        this._emitR(0x33, rd, rs1, rs2, 0x1, 0x00);
    }

    /** SLT rd, rs1, rs2 (set less than, signed) */
    slt(rd, rs1, rs2) {
        this._emitR(0x33, rd, rs1, rs2, 0x2, 0x00);
    }

    /** SLTU rd, rs1, rs2 (set less than, unsigned) */
    sltu(rd, rs1, rs2) {
        this._emitR(0x33, rd, rs1, rs2, 0x3, 0x00);
    }

    /** XOR rd, rs1, rs2 */
    xor(rd, rs1, rs2) {
        this._emitR(0x33, rd, rs1, rs2, 0x4, 0x00);
    }

    /** SRL rd, rs1, rs2 (shift right logical) */
    srl(rd, rs1, rs2) {
        this._emitR(0x33, rd, rs1, rs2, 0x5, 0x00);
    }

    /** SRA rd, rs1, rs2 (shift right arithmetic) */
    sra(rd, rs1, rs2) {
        this._emitR(0x33, rd, rs1, rs2, 0x5, 0x20);
    }

    /** OR rd, rs1, rs2 */
    or(rd, rs1, rs2) {
        this._emitR(0x33, rd, rs1, rs2, 0x6, 0x00);
    }

    /** AND rd, rs1, rs2 */
    and(rd, rs1, rs2) {
        this._emitR(0x33, rd, rs1, rs2, 0x7, 0x00);
    }

    // ========================================================================
    // I-TYPE: ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI
    // ========================================================================

    /** ADDI rd, rs1, imm */
    addi(rd, rs1, imm) {
        this._emitI(0x13, rd, rs1, 0x0, imm);
    }

    /** SLTI rd, rs1, imm (set less than immediate, signed) */
    slti(rd, rs1, imm) {
        this._emitI(0x13, rd, rs1, 0x2, imm);
    }

    /** SLTIU rd, rs1, imm (set less than immediate, unsigned) */
    sltiu(rd, rs1, imm) {
        this._emitI(0x13, rd, rs1, 0x3, imm);
    }

    /** XORI rd, rs1, imm */
    xori(rd, rs1, imm) {
        this._emitI(0x13, rd, rs1, 0x4, imm);
    }

    /** ORI rd, rs1, imm */
    ori(rd, rs1, imm) {
        this._emitI(0x13, rd, rs1, 0x6, imm);
    }

    /** ANDI rd, rs1, imm */
    andi(rd, rs1, imm) {
        this._emitI(0x13, rd, rs1, 0x7, imm);
    }

    /** SLLI rd, rs1, shamt (shift left logical immediate) */
    slli(rd, rs1, shamt) {
        // SLLI uses I-type encoding but with shamt in lower 5 bits of imm
        this._emitI(0x13, rd, rs1, 0x1, shamt & 0x1F);
    }

    /** SRLI rd, rs1, shamt (shift right logical immediate) */
    srli(rd, rs1, shamt) {
        // SRLI uses I-type encoding with funct7=0x00
        const imm = shamt & 0x1F;
        this._emitI(0x13, rd, rs1, 0x5, imm);
    }

    /** SRAI rd, rs1, shamt (shift right arithmetic immediate) */
    srai(rd, rs1, shamt) {
        // SRAI uses I-type encoding with funct7=0x20 (bit 30 set)
        const imm = (0x20 << 5) | (shamt & 0x1F);
        this._emitI(0x13, rd, rs1, 0x5, imm);
    }

    // ========================================================================
    // LOAD: LB, LH, LW, LBU, LHU
    // ========================================================================

    /** LB rd, offset(rs1) - load byte, sign-extend */
    lb(rd, rs1, offset) {
        this._emitI(0x03, rd, rs1, 0x0, offset);
    }

    /** LH rd, offset(rs1) - load halfword, sign-extend */
    lh(rd, rs1, offset) {
        this._emitI(0x03, rd, rs1, 0x1, offset);
    }

    /** LW rd, offset(rs1) - load word */
    lw(rd, rs1, offset) {
        this._emitI(0x03, rd, rs1, 0x2, offset);
    }

    /** LBU rd, offset(rs1) - load byte, zero-extend */
    lbu(rd, rs1, offset) {
        this._emitI(0x03, rd, rs1, 0x4, offset);
    }

    /** LHU rd, offset(rs1) - load halfword, zero-extend */
    lhu(rd, rs1, offset) {
        this._emitI(0x03, rd, rs1, 0x5, offset);
    }

    // ========================================================================
    // STORE: SB, SH, SW
    // ========================================================================

    /** SB rs2, offset(rs1) - store byte */
    sb(rs2, rs1, offset) {
        this._emitS(0x23, rs2, rs1, 0x0, offset);
    }

    /** SH rs2, offset(rs1) - store halfword */
    sh(rs2, rs1, offset) {
        this._emitS(0x23, rs2, rs1, 0x1, offset);
    }

    /** SW rs2, offset(rs1) - store word */
    sw(rs2, rs1, offset) {
        this._emitS(0x23, rs2, rs1, 0x2, offset);
    }

    // ========================================================================
    // BRANCH: BEQ, BNE, BLT, BGE, BLTU, BGEU
    // ========================================================================

    /** BEQ rs1, rs2, offset - branch if equal */
    beq(rs1, rs2, offset) {
        this._emitB(0x63, rs1, rs2, 0x0, offset);
    }

    /** BNE rs1, rs2, offset - branch if not equal */
    bne(rs1, rs2, offset) {
        this._emitB(0x63, rs1, rs2, 0x1, offset);
    }

    /** BLT rs1, rs2, offset - branch if less than (signed) */
    blt(rs1, rs2, offset) {
        this._emitB(0x63, rs1, rs2, 0x4, offset);
    }

    /** BGE rs1, rs2, offset - branch if greater or equal (signed) */
    bge(rs1, rs2, offset) {
        this._emitB(0x63, rs1, rs2, 0x5, offset);
    }

    /** BLTU rs1, rs2, offset - branch if less than (unsigned) */
    bltu(rs1, rs2, offset) {
        this._emitB(0x63, rs1, rs2, 0x6, offset);
    }

    /** BGEU rs1, rs2, offset - branch if greater or equal (unsigned) */
    bgeu(rs1, rs2, offset) {
        this._emitB(0x63, rs1, rs2, 0x7, offset);
    }

    // ========================================================================
    // JUMP: JAL, JALR
    // ========================================================================

    /** JAL rd, offset - jump and link */
    jal(rd, offset) {
        this._emitJ(0x6F, rd, offset);
    }

    /** JALR rd, rs1, offset - jump and link register */
    jalr(rd, rs1, offset) {
        this._emitI(0x67, rd, rs1, 0x0, offset);
    }

    // ========================================================================
    // UPPER IMMEDIATE: LUI, AUIPC
    // ========================================================================

    /** LUI rd, imm - load upper immediate */
    lui(rd, imm) {
        this._emitU(0x37, rd, imm);
    }

    /** AUIPC rd, imm - add upper immediate to PC */
    auipc(rd, imm) {
        this._emitU(0x17, rd, imm);
    }

    // ========================================================================
    // SYSTEM: ECALL, EBREAK
    // ========================================================================

    /** ECALL - environment call (syscall) */
    ecall() {
        // ECALL: opcode=0x73, funct3=0, rd=0, rs1=0, imm=0
        this._emitI(0x73, 0, 0, 0x0, 0x000);
    }

    /** EBREAK - breakpoint */
    ebreak() {
        // EBREAK: opcode=0x73, funct3=0, rd=0, rs1=0, imm=1
        this._emitI(0x73, 0, 0, 0x0, 0x001);
    }

    // ========================================================================
    // FINALIZE
    // ========================================================================

    /**
     * Return encoded program as Uint32Array
     */
    finalize() {
        return new Uint32Array(this.code);
    }

    /**
     * Return current instruction count
     */
    length() {
        return this.code.length;
    }
}

// ============================================================================
// TEST EXECUTION HELPER
// ============================================================================

/**
 * Execute a RISC-V program on the GPU and return results
 *
 * @param {CoreExecutionVerifier} verifier - Verifier instance
 * @param {GPUDevice} device - WebGPU device
 * @param {GPUQueue} queue - GPU queue
 * @param {Uint32Array} code - RISC-V instructions
 * @param {Object} options - Options for execution
 * @returns {Promise<Object>} Execution results { registers, pc, halted }
 */
export async function executeProgram(verifier, device, queue, code, options = {}) {
    const { maxSteps = 100, memorySize = 4096 } = options;

    // Create test buffers
    const { codeBuffer, memoryBuffer, stateBuffer } = verifier.createTestBuffers(code, memorySize);

    try {
        // Load shader
        const shaderModule = device.createShaderModule({
            label: 'visual_cpu_riscv_test',
            code: await fetch('../shaders/visual_cpu_riscv.wgsl').then(r => r.text())
        });

        // Create bind group layout
        const bindGroupLayout = device.createBindGroupLayout({
            label: 'riscv-core-test-bgl',
            entries: [
                { binding: 0, visibility: GPUShaderStage.COMPUTE, buffer: { type: 'read-only-storage' } },
                { binding: 1, visibility: GPUShaderStage.COMPUTE, buffer: { type: 'storage' } },
                { binding: 2, visibility: GPUShaderStage.COMPUTE, buffer: { type: 'storage' } }
            ]
        });

        // Create pipeline
        const pipeline = device.createComputePipeline({
            label: 'riscv-core-test-pipeline',
            layout: device.createPipelineLayout({ bindGroupLayouts: [bindGroupLayout] }),
            compute: { module: shaderModule, entryPoint: 'main' }
        });

        // Create bind group
        const bindGroup = device.createBindGroup({
            layout: bindGroupLayout,
            entries: [
                { binding: 0, resource: { buffer: codeBuffer } },
                { binding: 1, resource: { buffer: memoryBuffer } },
                { binding: 2, resource: { buffer: stateBuffer } }
            ]
        });

        // Execute
        const commandEncoder = device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();
        passEncoder.setPipeline(pipeline);
        passEncoder.setBindGroup(0, bindGroup);
        passEncoder.dispatchWorkgroups(1);
        passEncoder.end();
        queue.submit([commandEncoder.finish()]);

        // Read state back
        const state = await verifier.readState(stateBuffer);

        return {
            registers: state.registers,
            pc: state.pc,
            halted: state.halted
        };
    } finally {
        codeBuffer.destroy();
        memoryBuffer.destroy();
        stateBuffer.destroy();
    }
}

// ============================================================================
// TEST FUNCTIONS
// ============================================================================

/**
 * Test R-type arithmetic instructions: ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND
 */
export async function testArithmetic(verifier, device, queue) {
    const results = [];
    const e = new RiscvTestEncoder();

    // Test 1: ADD - basic addition
    // x1 = 5, x2 = 7, x3 = x1 + x2 (expect 12)
    e.addi(1, 0, 5);
    e.addi(2, 0, 7);
    e.add(3, 1, 2);
    e.ecall();

    let state = await executeProgram(verifier, device, queue, e.finalize());
    results.push({
        name: 'ADD basic',
        pass: state.registers[3] === 12,
        expected: 12,
        actual: state.registers[3]
    });

    // Test 2: SUB - basic subtraction
    const e2 = new RiscvTestEncoder();
    e2.addi(1, 0, 20);
    e2.addi(2, 0, 8);
    e2.sub(3, 1, 2); // x3 = 20 - 8 = 12
    e2.ecall();

    state = await executeProgram(verifier, device, queue, e2.finalize());
    results.push({
        name: 'SUB basic',
        pass: state.registers[3] === 12,
        expected: 12,
        actual: state.registers[3]
    });

    // Test 3: SLL - shift left logical
    const e3 = new RiscvTestEncoder();
    e3.addi(1, 0, 5);
    e3.addi(2, 0, 2);
    e3.sll(3, 1, 2); // x3 = 5 << 2 = 20
    e3.ecall();

    state = await executeProgram(verifier, device, queue, e3.finalize());
    results.push({
        name: 'SLL basic',
        pass: state.registers[3] === 20,
        expected: 20,
        actual: state.registers[3]
    });

    // Test 4: SLT - set less than (signed)
    const e4 = new RiscvTestEncoder();
    e4.addi(1, 0, 5);
    e4.addi(2, 0, 10);
    e4.slt(3, 1, 2); // x3 = (5 < 10) = 1
    e4.slt(4, 2, 1); // x4 = (10 < 5) = 0
    e4.ecall();

    state = await executeProgram(verifier, device, queue, e4.finalize());
    results.push({
        name: 'SLT signed',
        pass: state.registers[3] === 1 && state.registers[4] === 0,
        expected: 'x3=1, x4=0',
        actual: `x3=${state.registers[3]}, x4=${state.registers[4]}`
    });

    // Test 5: SLTU - set less than (unsigned)
    const e5 = new RiscvTestEncoder();
    e5.addi(1, 0, -1);  // x1 = 0xFFFFFFFF (unsigned: max)
    e5.addi(2, 0, 1);
    e5.sltu(3, 2, 1);   // x3 = (1 < 0xFFFFFFFF unsigned) = 1
    e5.sltu(4, 1, 2);   // x4 = (0xFFFFFFFF < 1 unsigned) = 0
    e5.ecall();

    state = await executeProgram(verifier, device, queue, e5.finalize());
    results.push({
        name: 'SLTU unsigned',
        pass: state.registers[3] === 1 && state.registers[4] === 0,
        expected: 'x3=1, x4=0',
        actual: `x3=${state.registers[3]}, x4=${state.registers[4]}`
    });

    // Test 6: XOR
    const e6 = new RiscvTestEncoder();
    e6.addi(1, 0, 0xFF);
    e6.addi(2, 0, 0x0F);
    e6.xor(3, 1, 2); // x3 = 0xFF ^ 0x0F = 0xF0
    e6.ecall();

    state = await executeProgram(verifier, device, queue, e6.finalize());
    results.push({
        name: 'XOR basic',
        pass: state.registers[3] === 0xF0,
        expected: 0xF0,
        actual: state.registers[3]
    });

    // Test 7: SRL - shift right logical
    const e7 = new RiscvTestEncoder();
    e7.addi(1, 0, 32);
    e7.addi(2, 0, 2);
    e7.srl(3, 1, 2); // x3 = 32 >> 2 = 8
    e7.ecall();

    state = await executeProgram(verifier, device, queue, e7.finalize());
    results.push({
        name: 'SRL basic',
        pass: state.registers[3] === 8,
        expected: 8,
        actual: state.registers[3]
    });

    // Test 8: SRA - shift right arithmetic (preserve sign)
    const e8 = new RiscvTestEncoder();
    e8.addi(1, 0, -16); // x1 = -16 (sign-extended)
    e8.addi(2, 0, 2);
    e8.sra(3, 1, 2);    // x3 = -16 >> 2 = -4
    e8.ecall();

    state = await executeProgram(verifier, device, queue, e8.finalize());
    // -16 >>> 2 = -4 in two's complement
    const expectedSRA = (new Int32Array([-16]))[0] >> 2;
    results.push({
        name: 'SRA signed',
        pass: (new Int32Array([state.registers[3]]))[0] === expectedSRA,
        expected: expectedSRA,
        actual: (new Int32Array([state.registers[3]]))[0]
    });

    // Test 9: OR
    const e9 = new RiscvTestEncoder();
    e9.addi(1, 0, 0xF0);
    e9.addi(2, 0, 0x0F);
    e9.or(3, 1, 2); // x3 = 0xF0 | 0x0F = 0xFF
    e9.ecall();

    state = await executeProgram(verifier, device, queue, e9.finalize());
    results.push({
        name: 'OR basic',
        pass: state.registers[3] === 0xFF,
        expected: 0xFF,
        actual: state.registers[3]
    });

    // Test 10: AND
    const e10 = new RiscvTestEncoder();
    e10.addi(1, 0, 0xFF);
    e10.addi(2, 0, 0x0F);
    e10.and(3, 1, 2); // x3 = 0xFF & 0x0F = 0x0F
    e10.ecall();

    state = await executeProgram(verifier, device, queue, e10.finalize());
    results.push({
        name: 'AND basic',
        pass: state.registers[3] === 0x0F,
        expected: 0x0F,
        actual: state.registers[3]
    });

    return results;
}

/**
 * Test I-type immediate instructions: ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI
 */
export async function testImmediate(verifier, device, queue) {
    const results = [];

    // Test 1: ADDI basic
    const e1 = new RiscvTestEncoder();
    e1.addi(1, 0, 100);
    e1.addi(2, 1, 50); // x2 = 100 + 50 = 150
    e1.ecall();

    let state = await executeProgram(verifier, device, queue, e1.finalize());
    results.push({
        name: 'ADDI basic',
        pass: state.registers[2] === 150,
        expected: 150,
        actual: state.registers[2]
    });

    // Test 2: ADDI negative
    const e2 = new RiscvTestEncoder();
    e2.addi(1, 0, 100);
    e2.addi(2, 1, -30); // x2 = 100 - 30 = 70
    e2.ecall();

    state = await executeProgram(verifier, device, queue, e2.finalize());
    results.push({
        name: 'ADDI negative',
        pass: state.registers[2] === 70,
        expected: 70,
        actual: state.registers[2]
    });

    // Test 3: SLTI - set less than immediate (signed)
    const e3 = new RiscvTestEncoder();
    e3.addi(1, 0, 5);
    e3.slti(2, 1, 10);  // x2 = (5 < 10) = 1
    e3.slti(3, 1, 3);   // x3 = (5 < 3) = 0
    e3.slti(4, 1, 5);   // x4 = (5 < 5) = 0
    e3.ecall();

    state = await executeProgram(verifier, device, queue, e3.finalize());
    results.push({
        name: 'SLTI signed',
        pass: state.registers[2] === 1 && state.registers[3] === 0 && state.registers[4] === 0,
        expected: 'x2=1, x3=0, x4=0',
        actual: `x2=${state.registers[2]}, x3=${state.registers[3]}, x4=${state.registers[4]}`
    });

    // Test 4: SLTIU - set less than immediate (unsigned)
    const e4 = new RiscvTestEncoder();
    e4.addi(1, 0, 1);
    e4.sltiu(2, 1, 2);  // x2 = (1 < 2 unsigned) = 1
    e4.ecall();

    state = await executeProgram(verifier, device, queue, e4.finalize());
    results.push({
        name: 'SLTIU unsigned',
        pass: state.registers[2] === 1,
        expected: 1,
        actual: state.registers[2]
    });

    // Test 5: XORI
    const e5 = new RiscvTestEncoder();
    e5.addi(1, 0, 0xAA);
    e5.xori(2, 1, 0xFF); // x2 = 0xAA ^ 0xFF = 0x55
    e5.ecall();

    state = await executeProgram(verifier, device, queue, e5.finalize());
    results.push({
        name: 'XORI basic',
        pass: state.registers[2] === 0x55,
        expected: 0x55,
        actual: state.registers[2]
    });

    // Test 6: ORI
    const e6 = new RiscvTestEncoder();
    e6.addi(1, 0, 0xF0);
    e6.ori(2, 1, 0x0F); // x2 = 0xF0 | 0x0F = 0xFF
    e6.ecall();

    state = await executeProgram(verifier, device, queue, e6.finalize());
    results.push({
        name: 'ORI basic',
        pass: state.registers[2] === 0xFF,
        expected: 0xFF,
        actual: state.registers[2]
    });

    // Test 7: ANDI
    const e7 = new RiscvTestEncoder();
    e7.addi(1, 0, 0xFF);
    e7.andi(2, 1, 0x0F); // x2 = 0xFF & 0x0F = 0x0F
    e7.ecall();

    state = await executeProgram(verifier, device, queue, e7.finalize());
    results.push({
        name: 'ANDI basic',
        pass: state.registers[2] === 0x0F,
        expected: 0x0F,
        actual: state.registers[2]
    });

    // Test 8: SLLI - shift left logical immediate
    const e8 = new RiscvTestEncoder();
    e8.addi(1, 0, 5);
    e8.slli(2, 1, 3); // x2 = 5 << 3 = 40
    e8.ecall();

    state = await executeProgram(verifier, device, queue, e8.finalize());
    results.push({
        name: 'SLLI basic',
        pass: state.registers[2] === 40,
        expected: 40,
        actual: state.registers[2]
    });

    // Test 9: SRLI - shift right logical immediate
    const e9 = new RiscvTestEncoder();
    e9.addi(1, 0, 64);
    e9.srli(2, 1, 3); // x2 = 64 >> 3 = 8
    e9.ecall();

    state = await executeProgram(verifier, device, queue, e9.finalize());
    results.push({
        name: 'SRLI basic',
        pass: state.registers[2] === 8,
        expected: 8,
        actual: state.registers[2]
    });

    // Test 10: SRAI - shift right arithmetic immediate
    const e10 = new RiscvTestEncoder();
    e10.addi(1, 0, -32);  // x1 = -32
    e10.srai(2, 1, 2);    // x2 = -32 >> 2 = -8 (arithmetic)
    e10.ecall();

    state = await executeProgram(verifier, device, queue, e10.finalize());
    const expectedSRAI = (new Int32Array([-32]))[0] >> 2;
    results.push({
        name: 'SRAI signed',
        pass: (new Int32Array([state.registers[2]]))[0] === expectedSRAI,
        expected: expectedSRAI,
        actual: (new Int32Array([state.registers[2]]))[0]
    });

    return results;
}

/**
 * Test memory instructions: LB, LH, LW, LBU, LHU, SB, SH, SW
 */
export async function testMemory(verifier, device, queue) {
    const results = [];

    // Test 1: SW/LW - store and load word
    const e1 = new RiscvTestEncoder();
    e1.addi(1, 0, 0x1000);   // x1 = base address
    e1.addi(2, 0, 0xDEADBEEF); // x2 = value to store
    e1.sw(2, 1, 0);          // store word at 0x1000
    e1.lw(3, 1, 0);          // load word from 0x1000
    e1.ecall();

    let state = await executeProgram(verifier, device, queue, e1.finalize());
    results.push({
        name: 'SW/LW word',
        pass: state.registers[3] === 0xDEADBEEF,
        expected: 0xDEADBEEF >>> 0,
        actual: state.registers[3] >>> 0
    });

    // Test 2: SB/LB - store and load byte (sign-extended)
    const e2 = new RiscvTestEncoder();
    e2.addi(1, 0, 0x1000);
    e2.addi(2, 0, 0x8F);     // 0x8F = -113 signed byte
    e2.sb(2, 1, 0);          // store byte
    e2.lb(3, 1, 0);          // load byte (sign-extended)
    e2.ecall();

    state = await executeProgram(verifier, device, queue, e2.finalize());
    // Sign extension: 0x8F -> 0xFFFFFF8F
    const expectedLB = 0xFFFFFF8F >>> 0;
    results.push({
        name: 'SB/LB sign-extend',
        pass: state.registers[3] === expectedLB,
        expected: `0x${expectedLB.toString(16)}`,
        actual: `0x${state.registers[3].toString(16)}`
    });

    // Test 3: LBU - load byte unsigned (zero-extended)
    const e3 = new RiscvTestEncoder();
    e3.addi(1, 0, 0x1000);
    e3.addi(2, 0, 0x8F);
    e3.sb(2, 1, 0);
    e3.lbu(3, 1, 0);         // load byte unsigned
    e3.ecall();

    state = await executeProgram(verifier, device, queue, e3.finalize());
    results.push({
        name: 'LBU zero-extend',
        pass: state.registers[3] === 0x8F,
        expected: 0x8F,
        actual: state.registers[3]
    });

    // Test 4: SH/LH - store and load halfword
    const e4 = new RiscvTestEncoder();
    e4.addi(1, 0, 0x1000);
    e4.addi(2, 0, 0xABCD);
    e4.sh(2, 1, 0);          // store halfword
    e4.lh(3, 1, 0);          // load halfword (sign-extended)
    e4.ecall();

    state = await executeProgram(verifier, device, queue, e4.finalize());
    // 0xABCD sign-extended = 0xFFFFABCD
    const expectedLH = 0xFFFFABCD >>> 0;
    results.push({
        name: 'SH/LH sign-extend',
        pass: state.registers[3] === expectedLH,
        expected: `0x${expectedLH.toString(16)}`,
        actual: `0x${state.registers[3].toString(16)}`
    });

    // Test 5: LHU - load halfword unsigned
    const e5 = new RiscvTestEncoder();
    e5.addi(1, 0, 0x1000);
    e5.addi(2, 0, 0xABCD);
    e5.sh(2, 1, 0);
    e5.lhu(3, 1, 0);         // load halfword unsigned
    e5.ecall();

    state = await executeProgram(verifier, device, queue, e5.finalize());
    results.push({
        name: 'LHU zero-extend',
        pass: state.registers[3] === 0xABCD,
        expected: 0xABCD,
        actual: state.registers[3]
    });

    return results;
}

/**
 * Test branch instructions: BEQ, BNE, BLT, BGE, BLTU, BGEU
 */
export async function testBranch(verifier, device, queue) {
    const results = [];

    // Test 1: BEQ - branch if equal
    const e1 = new RiscvTestEncoder();
    e1.addi(1, 0, 5);
    e1.addi(2, 0, 5);
    e1.addi(3, 0, 0);        // x3 = 0 (counter)
    e1.beq(1, 2, 8);         // branch +8 bytes (2 instructions)
    e1.addi(3, 3, 1);        // skipped if branch taken
    e1.addi(3, 3, 100);      // skipped if branch taken
    e1.addi(3, 3, 10);       // target: x3 += 10
    e1.ecall();

    let state = await executeProgram(verifier, device, queue, e1.finalize());
    results.push({
        name: 'BEQ taken',
        pass: state.registers[3] === 10,
        expected: 10,
        actual: state.registers[3]
    });

    // Test 2: BNE - branch if not equal
    const e2 = new RiscvTestEncoder();
    e2.addi(1, 0, 5);
    e2.addi(2, 0, 10);
    e2.addi(3, 0, 0);
    e2.bne(1, 2, 8);         // branch taken (5 != 10)
    e2.addi(3, 3, 1);
    e2.addi(3, 3, 100);
    e2.addi(3, 3, 10);
    e2.ecall();

    state = await executeProgram(verifier, device, queue, e2.finalize());
    results.push({
        name: 'BNE taken',
        pass: state.registers[3] === 10,
        expected: 10,
        actual: state.registers[3]
    });

    // Test 3: BLT - branch if less than (signed)
    const e3 = new RiscvTestEncoder();
    e3.addi(1, 0, -5);       // signed: -5
    e3.addi(2, 0, 5);        // signed: 5
    e3.addi(3, 0, 0);
    e3.blt(1, 2, 8);         // branch taken (-5 < 5)
    e3.addi(3, 3, 1);
    e3.addi(3, 3, 100);
    e3.addi(3, 3, 10);
    e3.ecall();

    state = await executeProgram(verifier, device, queue, e3.finalize());
    results.push({
        name: 'BLT signed',
        pass: state.registers[3] === 10,
        expected: 10,
        actual: state.registers[3]
    });

    // Test 4: BGE - branch if greater or equal (signed)
    const e4 = new RiscvTestEncoder();
    e4.addi(1, 0, 10);
    e4.addi(2, 0, 5);
    e4.addi(3, 0, 0);
    e4.bge(1, 2, 8);         // branch taken (10 >= 5)
    e4.addi(3, 3, 1);
    e4.addi(3, 3, 100);
    e4.addi(3, 3, 10);
    e4.ecall();

    state = await executeProgram(verifier, device, queue, e4.finalize());
    results.push({
        name: 'BGE signed',
        pass: state.registers[3] === 10,
        expected: 10,
        actual: state.registers[3]
    });

    // Test 5: BLTU - branch if less than (unsigned)
    const e5 = new RiscvTestEncoder();
    e5.addi(1, 0, 1);
    e5.addi(2, 0, -1);       // unsigned: 0xFFFFFFFF
    e5.addi(3, 0, 0);
    e5.bltu(1, 2, 8);        // branch taken (1 < 0xFFFFFFFF unsigned)
    e5.addi(3, 3, 1);
    e5.addi(3, 3, 100);
    e5.addi(3, 3, 10);
    e5.ecall();

    state = await executeProgram(verifier, device, queue, e5.finalize());
    results.push({
        name: 'BLTU unsigned',
        pass: state.registers[3] === 10,
        expected: 10,
        actual: state.registers[3]
    });

    // Test 6: BGEU - branch if greater or equal (unsigned)
    const e6 = new RiscvTestEncoder();
    e6.addi(1, 0, -1);       // unsigned: 0xFFFFFFFF
    e6.addi(2, 0, 1);
    e6.addi(3, 0, 0);
    e6.bgeu(1, 2, 8);        // branch taken (0xFFFFFFFF >= 1 unsigned)
    e6.addi(3, 3, 1);
    e6.addi(3, 3, 100);
    e6.addi(3, 3, 10);
    e6.ecall();

    state = await executeProgram(verifier, device, queue, e6.finalize());
    results.push({
        name: 'BGEU unsigned',
        pass: state.registers[3] === 10,
        expected: 10,
        actual: state.registers[3]
    });

    return results;
}

/**
 * Test jump instructions: JAL, JALR
 */
export async function testJump(verifier, device, queue) {
    const results = [];

    // Test 1: JAL - jump and link
    const e1 = new RiscvTestEncoder();
    e1.addi(3, 0, 0);        // x3 = 0
    e1.jal(1, 12);           // jump +12 bytes (3 instructions), x1 = return address
    e1.addi(3, 3, 100);      // skipped
    e1.addi(3, 3, 100);      // skipped
    e1.addi(3, 3, 100);      // skipped
    e1.addi(3, 3, 10);       // target: x3 += 10
    e1.ecall();

    let state = await executeProgram(verifier, device, queue, e1.finalize());
    results.push({
        name: 'JAL forward',
        pass: state.registers[3] === 10,
        expected: 10,
        actual: state.registers[3]
    });

    // Test 2: JALR - jump and link register
    const e2 = new RiscvTestEncoder();
    e2.addi(3, 0, 0);        // x3 = 0
    e2.addi(1, 0, 24);       // x1 = 24 (target address in bytes)
    e2.jalr(2, 1, 0);        // jump to address in x1, x2 = return address
    e2.addi(3, 3, 100);      // skipped
    e2.addi(3, 3, 100);      // skipped
    e2.addi(3, 3, 100);      // skipped
    e2.addi(3, 3, 100);      // skipped
    e2.addi(3, 3, 100);      // skipped
    e2.addi(3, 3, 10);       // target: x3 += 10
    e2.ecall();

    state = await executeProgram(verifier, device, queue, e2.finalize());
    results.push({
        name: 'JALR indirect',
        pass: state.registers[3] === 10,
        expected: 10,
        actual: state.registers[3]
    });

    // Test 3: JAL backward (loop)
    const e3 = new RiscvTestEncoder();
    e3.addi(1, 0, 3);        // x1 = counter
    e3.addi(2, 0, 0);        // x2 = accumulator
    // loop: (PC = 8)
    e3.addi(2, 2, 1);        // x2 += 1
    e3.addi(1, 1, -1);       // x1 -= 1
    e3.bne(1, 0, -12);       // if x1 != 0, branch back to loop (-12 bytes = -3 instructions)
    e3.ecall();

    state = await executeProgram(verifier, device, queue, e3.finalize());
    results.push({
        name: 'JAL loop',
        pass: state.registers[2] === 3,
        expected: 3,
        actual: state.registers[2]
    });

    return results;
}

/**
 * Test upper immediate instructions: LUI, AUIPC
 */
export async function testUpperImmediate(verifier, device, queue) {
    const results = [];

    // Test 1: LUI - load upper immediate
    const e1 = new RiscvTestEncoder();
    e1.lui(1, 0x12345);      // x1 = 0x12345000
    e1.ecall();

    let state = await executeProgram(verifier, device, queue, e1.finalize());
    const expectedLUI = 0x12345000;
    results.push({
        name: 'LUI basic',
        pass: state.registers[1] === expectedLUI,
        expected: `0x${expectedLUI.toString(16)}`,
        actual: `0x${state.registers[1].toString(16)}`
    });

    // Test 2: LUI + ADDI for 32-bit constant
    const e2 = new RiscvTestEncoder();
    e2.lui(1, 0x12345);      // x1 = 0x12345000
    e2.addi(1, 1, 0x678);    // x1 = 0x12345678
    e2.ecall();

    state = await executeProgram(verifier, device, queue, e2.finalize());
    const expected32 = 0x12345678;
    results.push({
        name: 'LUI+ADDI 32-bit',
        pass: state.registers[1] === expected32,
        expected: `0x${expected32.toString(16)}`,
        actual: `0x${state.registers[1].toString(16)}`
    });

    // Test 3: AUIPC - add upper immediate to PC
    const e3 = new RiscvTestEncoder();
    e3.auipc(1, 0x1000);     // x1 = PC + 0x1000000
    e3.ecall();

    state = await executeProgram(verifier, device, queue, e3.finalize());
    // PC at AUIPC is 0, so x1 should be 0x1000000
    const expectedAUIPC = 0x1000000;
    results.push({
        name: 'AUIPC basic',
        pass: state.registers[1] === expectedAUIPC,
        expected: `0x${expectedAUIPC.toString(16)}`,
        actual: `0x${state.registers[1].toString(16)}`
    });

    return results;
}

/**
 * Run all RV32I tests
 */
export async function runAllTests(verifier, device, queue) {
    const results = {
        arithmetic: [],
        immediate: [],
        memory: [],
        branch: [],
        jump: [],
        upperImmediate: []
    };

    let errors = [];

    try {
        results.arithmetic = await testArithmetic(verifier, device, queue);
    } catch (e) {
        errors.push(`Arithmetic tests failed: ${e.message}`);
    }

    try {
        results.immediate = await testImmediate(verifier, device, queue);
    } catch (e) {
        errors.push(`Immediate tests failed: ${e.message}`);
    }

    try {
        results.memory = await testMemory(verifier, device, queue);
    } catch (e) {
        errors.push(`Memory tests failed: ${e.message}`);
    }

    try {
        results.branch = await testBranch(verifier, device, queue);
    } catch (e) {
        errors.push(`Branch tests failed: ${e.message}`);
    }

    try {
        results.jump = await testJump(verifier, device, queue);
    } catch (e) {
        errors.push(`Jump tests failed: ${e.message}`);
    }

    try {
        results.upperImmediate = await testUpperImmediate(verifier, device, queue);
    } catch (e) {
        errors.push(`Upper immediate tests failed: ${e.message}`);
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
    window.RiscvTestEncoder = RiscvTestEncoder;
    window.runAllTests = runAllTests;
    window.executeProgram = executeProgram;
}
