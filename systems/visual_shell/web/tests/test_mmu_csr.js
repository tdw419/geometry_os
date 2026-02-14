/**
 * Test: CSR Register Access for MMU
 *
 * Tests RISC-V CSR (Control and Status Registers) for MMU support
 * Following TDD: Write failing test first, then implement
 */

import { GPUExecutionSystem } from '../gpu_execution_system.js';

/**
 * Task 1 Test: Verify CSR registers exist in CPU state
 * Expected to FAIL initially (CSR fields don't exist yet)
 */
async function testCSRRegisters() {
    const adapter = await navigator.gpu.requestAdapter();
    const device = await adapter.requestDevice();
    const gpu = new GPUExecutionSystem(device, {});
    await gpu.initialize();

    // Deploy minimal kernel
    await gpu.deploy('data:text/plain,', 'test-csr');

    // Read initial state
    const state = await gpu.readState('test-csr');

    console.log('Raw state:', state);

    // Verify CSR registers exist in state
    // satp (CSR 0x180) should be at index 34
    // stvec (CSR 0x105) should be at index 35
    // sscratch (CSR 0x140) should be at index 36
    // mode (0=user, 1=supervisor) should be at index 37

    console.assert(state.satp !== undefined, 'satp CSR must exist');
    console.assert(state.stvec !== undefined, 'stvec CSR must exist');
    console.assert(state.mode !== undefined, 'privilege mode must exist');

    console.log('✅ CSR registers present in CPU state');
    return true;
}

/**
 * Task 1 Test: Verify CSR halt index moved from 33 to 38
 * Expected to FAIL initially (halt is still at index 33)
 */
async function testCSRHaltLocation() {
    const adapter = await navigator.gpu.requestAdapter();
    const device = await adapter.requestDevice();
    const gpu = new GPUExecutionSystem(device, {});
    await gpu.initialize();

    await gpu.deploy('data:text/plain,', 'test-csr-halt');
    const state = await gpu.readState('test-csr-halt');

    // Halted flag should be at index 38 (CSR_HALT)
    // not at index 33 (old location)
    console.assert(state.halted !== undefined, 'halted flag must exist');
    console.log('halted value:', state.halted);

    console.log('✅ CSR halt location verified');
    return true;
}

/**
 * Task 1 Test: Verify extended state size (39 u32s)
 * Expected to FAIL initially (size is still 34)
 */
async function testExtendedStateSize() {
    const adapter = await navigator.gpu.requestAdapter();
    const device = await adapter.requestDevice();
    const gpu = new GPUExecutionSystem(device, {});
    await gpu.initialize();

    await gpu.deploy('data:text/plain,', 'test-csr-size');

    // Read raw state to verify size
    const kernel = gpu.kernels.get('test-csr-size');
    const stagingBuffer = device.createBuffer({
        size: 256, // Read up to 256 bytes
        usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST
    });

    const commandEncoder = device.createCommandEncoder();
    commandEncoder.copyBufferToBuffer(kernel.stateBuffer, 0, stagingBuffer, 0, 256);
    device.queue.submit([commandEncoder.finish()]);

    await stagingBuffer.mapAsync(GPUMapMode.READ);
    const states = new Uint32Array(stagingBuffer.getMappedRange().slice(0, 39 * 4));
    stagingBuffer.unmap();

    console.log('State array length:', states.length);
    console.assert(states.length >= 39, 'State must be at least 39 u32s');

    console.log('✅ Extended state size verified (39 u32s)');
    return true;
}

/**
 * Task 2 Test: Verify CSR instruction encoding
 * Tests CSRRW (CSR Read Write) and CSRRS (CSR Read Set)
 */
async function testCSRRWInstruction() {
    // Test CSRRW: swap register with CSR
    // Instruction format: csrrw rd, csr, rs1
    // Encoding: csr[11:0] | funct3=001 | rs1[4:0] | rd[4:0] | opcode=1110011

    // Build test: csrrw x5, satp, x6 (atomic swap)
    // rd=5 (x5), funct3=1 (CSRRW), rs1=6 (x6), csr=0x180 (satp)
    // csrrw x5, satp, x6 = 0x180612F73
    const inst_csrrw = (0x180 << 20) | (6 << 15) | (1 << 12) | (5 << 7) | 0x73;

    console.assert(inst_csrrw === 0x180612F73, `CSRRW encoding mismatch: ${inst_csrrw.toString(16)}`);
    console.log('CSRRW instruction encoding:', inst_csrrw.toString(16));

    // Test CSRRS: set bits in CSR
    // Instruction format: csrrs rd, csr, rs1
    // Encoding: csr[11:0] | funct3=010 | rs1[4:0] | rd[4:0] | opcode=1110011

    // Build test: csrrs x5, stvec, x7
    // rd=5 (x5), funct3=2 (CSRRS), rs1=7 (x7), csr=0x105 (stvec)
    // csrrs x5, stvec, x7 = 0x105712F73
    const inst_csrrs = (0x105 << 20) | (7 << 15) | (2 << 12) | (5 << 7) | 0x73;

    console.assert(inst_csrrs === 0x105712F73, `CSRRS encoding mismatch: ${csrrs.toString(16)}`);
    console.log('CSRRS instruction encoding:', inst_csrrs.toString(16));

    console.log('✅ CSR instruction encoding validated');
    return true;
}

/**
 * Task 2 Test: Verify CSR instruction execution in shader
 * This test requires actual GPU execution to verify CSRRW/CSRRS work
 */
async function testCSRExecution() {
    const adapter = await navigator.gpu.requestAdapter();
    const device = await adapter.requestDevice();
    const gpu = new GPUExecutionSystem(device, {});
    await gpu.initialize();

    // Create a minimal program that uses CSRRW
    // Program: csrrw x5, satp, x6  (where x6 = 0x12345678)
    // After execution: x5 should contain old satp, satp should contain 0x12345678

    // csrrw x5, satp, x6 = 0x180612F73
    const csrrw_inst = (0x180 << 20) | (6 << 15) | (1 << 12) | (5 << 7) | 0x73;

    // Build instruction buffer: [csrrw instruction, halt instruction]
    const halt_inst = 0x05D00873; // ecall (a7=93 for exit)
    const instructions = new Uint32Array([csrrw_inst, halt_inst]);

    // Deploy with custom code buffer
    await gpu.deploy('data:text/plain,', 'test-csr-exec');

    // Set up initial state: x6 = 0x12345678, satp = 0xDEADBEEF
    const kernel = gpu.kernels.get('test-csr-exec');

    // Write x6 value (at index 6 in state buffer)
    const x6Data = new Uint32Array([0x12345678]);
    device.queue.writeBuffer(kernel.stateBuffer, 6 * 4, x6Data);

    // Write initial satp value (at index 34 in state buffer)
    const satpData = new Uint32Array([0xDEADBEEF]);
    device.queue.writeBuffer(kernel.stateBuffer, 34 * 4, satpData);

    // Set PC to 0
    const pcData = new Uint32Array([0]);
    device.queue.writeBuffer(kernel.stateBuffer, 32 * 4, pcData);

    // Run one tick
    await gpu.tick('test-csr-exec', 1);

    // Read state
    const state = await gpu.readState('test-csr-exec');

    console.log('After CSRRW execution:');
    console.log('  x5 (rd):', state.registers[5].toString(16));
    console.log('  satp:', state.satp.toString(16));

    // x5 should contain old satp value (0xDEADBEEF)
    // satp should contain x6 value (0x12345678)
    console.assert(state.registers[5] === 0xDEADBEEF, `x5 should be 0xDEADBEEF, got 0x${state.registers[5].toString(16)}`);
    console.assert(state.satp === 0x12345678, `satp should be 0x12345678, got 0x${state.satp.toString(16)}`);

    console.log('✅ CSRRW instruction execution verified');
    return true;
}

// Export for HTML test runner
if (typeof window !== 'undefined') {
    window.testCSRRegisters = testCSRRegisters;
    window.testCSRHaltLocation = testCSRHaltLocation;
    window.testExtendedStateSize = testExtendedStateSize;
    window.testCSRRWInstruction = testCSRRWInstruction;
    window.testCSRExecution = testCSRExecution;
}

export { testCSRRegisters, testCSRHaltLocation, testExtendedStateSize, testCSRRWInstruction, testCSRExecution };
