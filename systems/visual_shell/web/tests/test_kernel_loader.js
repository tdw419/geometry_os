/**
 * Test: WGPUKernelLoader
 */
import { WGPUKernelLoader } from '../wgpu_kernel_loader.js';

export async function testKernelLoaderExists() {
    const loader = new WGPUKernelLoader(null);
    console.assert(loader !== null, 'WGPUKernelLoader should instantiate');
    console.log('✅ WGPUKernelLoader exists');
    return true;
}

export async function testLoadFakeKernel() {
    // Create a minimal fake kernel (just a few RISC-V instructions)
    // li x5, 42; ecall (exit with x10=0)
    const fakeKernel = new Uint32Array([
        0x02a00513, // addi x10, x0, 42
        0x05d00893, // addi x17, x0, 93 (exit syscall)
        0x00000073  // ecall
    ]);

    const loader = new WGPUKernelLoader(null);
    const result = await loader.loadFromBuffer(fakeKernel.buffer);

    console.assert(result.entryPoint === 0, 'Entry point should be 0');
    console.assert(result.size === 12, 'Size should be 12 bytes');
    console.log('✅ Kernel loader loads buffer correctly');
    return true;
}

// Export for HTML test runner
window.testKernelLoaderExists = testKernelLoaderExists;
window.testLoadFakeKernel = testLoadFakeKernel;
