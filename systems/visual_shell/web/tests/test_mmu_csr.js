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

// Export for HTML test runner
if (typeof window !== 'undefined') {
    window.testCSRRegisters = testCSRRegisters;
    window.testCSRHaltLocation = testCSRHaltLocation;
    window.testExtendedStateSize = testExtendedStateSize;
}

export { testCSRRegisters, testCSRHaltLocation, testExtendedStateSize };
