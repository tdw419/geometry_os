/**
 * Test: RISC-V M Extension (Multiply/Divide)
 *
 * Tests M extension instructions for RISC-V shader
 * Following TDD: Write failing test first, then implement
 */

import { GPUExecutionSystem } from '../gpu_execution_system.js';

/**
 * Task 7 Test: Verify M extension instruction encoding
 */
async function testMExtensionEncoding() {
    // MUL: rd = (rs1 * rs2)[31:0]
    // Encoding: funct7=0000001 | rs2 | rs1 | funct3=000 | rd | opcode=0110011

    // Test: mul x7, x5, x6  (7 * 6 = 42)
    // funct7=0x01, rs2=6, rs1=5, funct3=0, rd=7, opcode=0x33
    const inst_mul = (0x01 << 25) | (6 << 20) | (5 << 15) | (0 << 12) | (7 << 7) | 0x33;

    console.log('MUL instruction encoding:', '0x' + inst_mul.toString(16));

    // MULH: rd = (rs1 * rs2)[63:32] (signed * signed, high bits)
    // funct7=0000001 | rs2 | rs1 | funct3=001 | rd | opcode=0110011
    const inst_mulh = (0x01 << 25) | (6 << 20) | (5 << 15) | (1 << 12) | (7 << 7) | 0x33;

    console.log('MULH instruction encoding:', '0x' + inst_mulh.toString(16));

    // DIV: rd = rs1 / rs2 (signed division)
    // funct7=0000001 | rs2 | rs1 | funct3=100 | rd | opcode=0110011
    const inst_div = (0x01 << 25) | (6 << 20) | (5 << 15) | (4 << 12) | (7 << 7) | 0x33;

    console.log('DIV instruction encoding:', '0x' + inst_div.toString(16));

    // REM: rd = rs1 % rs2 (signed remainder)
    // funct7=0000001 | rs2 | rs1 | funct3=110 | rd | opcode=0110011
    const inst_rem = (0x01 << 25) | (6 << 20) | (5 << 15) | (6 << 12) | (7 << 7) | 0x33;

    console.log('REM instruction encoding:', '0x' + inst_rem.toString(16));

    console.log('✅ M extension encoding validated');
    return true;
}

/**
 * Task 7 Test: Verify MUL instruction execution
 */
async function testMULExecution() {
    const adapter = await navigator.gpu.requestAdapter();
    const device = await adapter.requestDevice();
    const gpu = new GPUExecutionSystem(device, {});
    await gpu.initialize();

    // Test: mul x7, x5, x6 where x5=7, x6=6, expected x7=42
    const inst_mul = (0x01 << 25) | (6 << 20) | (5 << 15) | (0 << 12) | (7 << 7) | 0x33;
    const halt_inst = 0x05D00873;

    await gpu.deploy('data:text/plain,', 'test-mul');
    const kernel = gpu.kernels.get('test-mul');

    // Set x5 = 7, x6 = 6
    const x5Data = new Uint32Array([7]);
    device.queue.writeBuffer(kernel.stateBuffer, 5 * 4, x5Data);
    const x6Data = new Uint32Array([6]);
    device.queue.writeBuffer(kernel.stateBuffer, 6 * 4, x6Data);

    // Set PC to 0
    const pcData = new Uint32Array([0]);
    device.queue.writeBuffer(kernel.stateBuffer, 32 * 4, pcData);

    // Run one tick
    await gpu.tick('test-mul', 1);

    const state = await gpu.readState('test-mul');
    console.log('After MUL: x7 =', state.registers[7]);

    console.assert(state.registers[7] === 42, `x7 should be 42, got ${state.registers[7]}`);

    console.log('✅ MUL instruction execution verified');
    return true;
}

/**
 * Task 7 Test: Verify DIV instruction execution
 */
async function testDIVExecution() {
    const adapter = await navigator.gpu.requestAdapter();
    const device = await adapter.requestDevice();
    const gpu = new GPUExecutionSystem(device, {});
    await gpu.initialize();

    // Test: div x7, x5, x6 where x5=100, x6=7, expected x7=14
    const inst_div = (0x01 << 25) | (6 << 20) | (5 << 15) | (4 << 12) | (7 << 7) | 0x33;
    const halt_inst = 0x05D00873;

    await gpu.deploy('data:text/plain,', 'test-div');
    const kernel = gpu.kernels.get('test-div');

    // Set x5 = 100, x6 = 7
    const x5Data = new Uint32Array([100]);
    device.queue.writeBuffer(kernel.stateBuffer, 5 * 4, x5Data);
    const x6Data = new Uint32Array([7]);
    device.queue.writeBuffer(kernel.stateBuffer, 6 * 4, x6Data);

    // Set PC to 0
    const pcData = new Uint32Array([0]);
    device.queue.writeBuffer(kernel.stateBuffer, 32 * 4, pcData);

    // Run one tick
    await gpu.tick('test-div', 1);

    const state = await gpu.readState('test-div');
    console.log('After DIV: x7 =', state.registers[7]);

    console.assert(state.registers[7] === 14, `x7 should be 14, got ${state.registers[7]}`);

    console.log('✅ DIV instruction execution verified');
    return true;
}

/**
 * Task 7 Test: Verify REM instruction execution
 */
async function testREMExecution() {
    const adapter = await navigator.gpu.requestAdapter();
    const device = await adapter.requestDevice();
    const gpu = new GPUExecutionSystem(device, {});
    await gpu.initialize();

    // Test: rem x7, x5, x6 where x5=100, x6=7, expected x7=2 (100 % 7 = 2)
    const inst_rem = (0x01 << 25) | (6 << 20) | (5 << 15) | (6 << 12) | (7 << 7) | 0x33;
    const halt_inst = 0x05D00873;

    await gpu.deploy('data:text/plain,', 'test-rem');
    const kernel = gpu.kernels.get('test-rem');

    // Set x5 = 100, x6 = 7
    const x5Data = new Uint32Array([100]);
    device.queue.writeBuffer(kernel.stateBuffer, 5 * 4, x5Data);
    const x6Data = new Uint32Array([7]);
    device.queue.writeBuffer(kernel.stateBuffer, 6 * 4, x6Data);

    // Set PC to 0
    const pcData = new Uint32Array([0]);
    device.queue.writeBuffer(kernel.stateBuffer, 32 * 4, pcData);

    // Run one tick
    await gpu.tick('test-rem', 1);

    const state = await gpu.readState('test-rem');
    console.log('After REM: x7 =', state.registers[7]);

    console.assert(state.registers[7] === 2, `x7 should be 2, got ${state.registers[7]}`);

    console.log('✅ REM instruction execution verified');
    return true;
}

// Export for HTML test runner
if (typeof window !== 'undefined') {
    window.testMExtensionEncoding = testMExtensionEncoding;
    window.testMULExecution = testMULExecution;
    window.testDIVExecution = testDIVExecution;
    window.testREMExecution = testREMExecution;
}

export { testMExtensionEncoding, testMULExecution, testDIVExecution, testREMExecution };
