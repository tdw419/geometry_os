/**
 * Node.js Test Runner for WGPU Linux GUI Hypervisor
 *
 * Tests core components with mocked browser/WebGPU environment.
 */

// Mock browser globals
global.window = {};

// Mock canvas
class MockCanvas {
    constructor() {
        this.tabIndex = 0;
        this.listeners = {};
    }
    addEventListener(type, handler) {
        this.listeners[type] = handler;
    }
    focus() {}
    getBoundingClientRect() {
        return { left: 0, top: 0, width: 1024, height: 768 };
    }
}

// Mock GPU device
class MockGPUDevice {
    constructor() {
        this.queue = {
            writeBuffer: (buffer, offset, data) => {
                // Mock write - just succeed
                return true;
            }
        };
    }
    createTexture(desc) {
        return { width: desc.size[0], height: desc.size[1] };
    }
}

// Mock GPU buffer
class MockGPUBuffer {}

// Dynamic import for ES modules
async function runTests() {
    console.log('\n========================================');
    console.log('WGPU Linux GUI Hypervisor - Test Suite');
    console.log('========================================\n');

    let passed = 0;
    let failed = 0;

    // Import modules
    const { WGPUKernelLoader } = await import('../wgpu_kernel_loader.js');
    const { WGPUInputHandler } = await import('../wgpu_input_handler.js');

    // ==========================================
    // Test 1: WGPUKernelLoader instantiation
    // ==========================================
    console.log('Test 1: WGPUKernelLoader instantiation...');
    try {
        const loader = new WGPUKernelLoader(null);
        if (loader !== null && loader !== undefined) {
            console.log('  ✅ PASS: WGPUKernelLoader instantiates correctly');
            passed++;
        } else {
            console.log('  ❌ FAIL: WGPUKernelLoader is null/undefined');
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 2: WGPUKernelLoader.loadFromBuffer
    // ==========================================
    console.log('\nTest 2: WGPUKernelLoader.loadFromBuffer...');
    try {
        const loader = new WGPUKernelLoader(null);
        const fakeKernel = new Uint32Array([
            0x02a00513, // addi x10, x0, 42
            0x05d00893, // addi x17, x0, 93 (exit syscall)
            0x00000073  // ecall
        ]);

        const result = await loader.loadFromBuffer(fakeKernel.buffer);

        if (result.entryPoint === 0 && result.size === 12 && result.data instanceof Uint8Array) {
            console.log(`  ✅ PASS: Loaded kernel (entry=${result.entryPoint}, size=${result.size})`);
            passed++;
        } else {
            console.log(`  ❌ FAIL: Unexpected result: entry=${result.entryPoint}, size=${result.size}`);
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 3: WGPUKernelLoader.writeToMemory
    // ==========================================
    console.log('\nTest 3: WGPUKernelLoader.writeToMemory...');
    try {
        const mockDevice = new MockGPUDevice();
        const loader = new WGPUKernelLoader(mockDevice);
        const mockBuffer = new MockGPUBuffer();
        const data = new Uint8Array([1, 2, 3, 4]);

        loader.writeToMemory(mockBuffer, data, 0);
        console.log('  ✅ PASS: writeToMemory executes without error');
        passed++;
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 4: WGPUInputHandler instantiation
    // ==========================================
    console.log('\nTest 4: WGPUInputHandler instantiation...');
    try {
        const mockCanvas = new MockCanvas();
        const mockDevice = new MockGPUDevice();
        const mockBuffer = new MockGPUBuffer();

        const handler = new WGPUInputHandler(mockCanvas, mockDevice, mockBuffer, 'test-kernel');

        if (handler.canvas === mockCanvas && handler.device === mockDevice) {
            console.log('  ✅ PASS: WGPUInputHandler instantiates correctly');
            passed++;
        } else {
            console.log('  ❌ FAIL: WGPUInputHandler properties not set correctly');
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 5: WGPUInputHandler.packKeyboard
    // ==========================================
    console.log('\nTest 5: WGPUInputHandler.packKeyboard...');
    try {
        const mockCanvas = new MockCanvas();
        const mockDevice = new MockGPUDevice();
        const mockBuffer = new MockGPUBuffer();

        const handler = new WGPUInputHandler(mockCanvas, mockDevice, mockBuffer, 'test-kernel');

        const mockEvent = {
            code: 'KeyA',
            shiftKey: true,
            ctrlKey: false,
            altKey: false,
            metaKey: false
        };

        const packed = handler.packKeyboard(mockEvent, true);

        if (packed.type === 1 && packed.scancode === 30 && packed.pressed === 1 && packed.modifiers === 1) {
            console.log(`  ✅ PASS: Keyboard packed correctly (scancode=${packed.scancode}, mods=${packed.modifiers})`);
            passed++;
        } else {
            console.log(`  ❌ FAIL: Unexpected packed data: ${JSON.stringify(packed)}`);
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 6: WGPUInputHandler.packMouse
    // ==========================================
    console.log('\nTest 6: WGPUInputHandler.packMouse...');
    try {
        const mockCanvas = new MockCanvas();
        const mockDevice = new MockGPUDevice();
        const mockBuffer = new MockGPUBuffer();

        const handler = new WGPUInputHandler(mockCanvas, mockDevice, mockBuffer, 'test-kernel');

        const packed = handler.packMouse(512, 384, 1);

        if (packed.type === 2 && packed.x === 512 && packed.y === 384 && packed.buttons === 1) {
            console.log(`  ✅ PASS: Mouse packed correctly (x=${packed.x}, y=${packed.y}, buttons=${packed.buttons})`);
            passed++;
        } else {
            console.log(`  ❌ FAIL: Unexpected packed data: ${JSON.stringify(packed)}`);
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 7: WGPUInputHandler._keyToScancode
    // ==========================================
    console.log('\nTest 7: WGPUInputHandler._keyToScancode...');
    try {
        const mockCanvas = new MockCanvas();
        const mockDevice = new MockGPUDevice();
        const mockBuffer = new MockGPUBuffer();

        const handler = new WGPUInputHandler(mockCanvas, mockDevice, mockBuffer, 'test-kernel');

        const tests = [
            { code: 'KeyA', expected: 30 },
            { code: 'Space', expected: 57 },
            { code: 'Enter', expected: 28 },
            { code: 'Escape', expected: 1 },
            { code: 'ArrowUp', expected: 103 },
            { code: 'Unknown', expected: 0 }
        ];

        let allPassed = true;
        for (const test of tests) {
            const result = handler._keyToScancode(test.code);
            if (result !== test.expected) {
                console.log(`  ❌ FAIL: ${test.code} -> ${result}, expected ${test.expected}`);
                allPassed = false;
            }
        }

        if (allPassed) {
            console.log('  ✅ PASS: All scancode mappings correct');
            passed++;
        } else {
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 8: WGPUInputHandler focus
    // ==========================================
    console.log('\nTest 8: WGPUInputHandler.focus...');
    try {
        const mockCanvas = new MockCanvas();
        const mockDevice = new MockGPUDevice();
        const mockBuffer = new MockGPUBuffer();

        const handler = new WGPUInputHandler(mockCanvas, mockDevice, mockBuffer, 'test-kernel');
        handler.focus();
        console.log('  ✅ PASS: focus() executes without error');
        passed++;
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Summary
    // ==========================================
    console.log('\n========================================');
    console.log('Summary');
    console.log('========================================');
    console.log(`  Passed: ${passed}`);
    console.log(`  Failed: ${failed}`);
    console.log('========================================\n');

    if (failed === 0) {
        console.log('✅ All tests passed!\n');
        process.exit(0);
    } else {
        console.log('❌ Some tests failed\n');
        process.exit(1);
    }
}

runTests().catch(err => {
    console.error('Test runner error:', err);
    process.exit(1);
});
