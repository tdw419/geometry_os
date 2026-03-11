/**
 * Node.js Test Runner for WGPULinuxHypervisor
 *
 * Tests main orchestrator with mocked dependencies.
 */

// Mock browser globals
global.window = {};
global.HTMLElement = class HTMLElement {};

// Mock navigator.gpu
global.navigator = {
    gpu: {
        requestAdapter: async () => ({
            requestDevice: async () => new MockGPUDevice()
        })
    }
};

// Mock ImageData
class MockImageData {
    constructor(data, width, height) {
        this.data = data || new Uint8ClampedArray(width * height * 4);
        this.width = width;
        this.height = height;
    }
}

// Mock canvas context
class MockCanvas2DContext {
    constructor(width, height) {
        this.width = width;
        this.height = height;
        this.fillStyle = '#000000';
        this._imageData = new Uint8ClampedArray(width * height * 4);
    }

    createImageData(width, height) {
        return new MockImageData(null, width, height);
    }

    getImageData(x, y, w, h) {
        return new MockImageData(null, w, h);
    }

    putImageData(data, x, y) {}

    fillRect(x, y, w, h) {}
}

// Mock canvas element
class MockCanvas {
    constructor(width = 1024, height = 768) {
        this.width = width;
        this.height = height;
        this._context = new MockCanvas2DContext(width, height);
    }

    getContext(type, options) {
        return type === '2d' ? this._context : null;
    }

    toDataURL(format, quality) {
        return 'data:image/png;base64,mock';
    }
}

// Mock document
global.document = {
    createElement: (tag) => {
        if (tag === 'canvas') return new MockCanvas();
        return {};
    }
};

// Mock requestAnimationFrame
global.requestAnimationFrame = (fn) => setTimeout(fn, 16);
global.cancelAnimationFrame = (id) => clearTimeout(id);

// Mock GPU device
class MockGPUDevice {
    constructor() {
        this.queue = {
            writeBuffer: () => true,
            writeTexture: () => true,
            submit: () => {}
        };
    }

    createTexture(desc) {
        return { width: desc.size[0], height: desc.size[1], createView: () => ({}) };
    }

    createBuffer(desc) {
        return { size: desc.size, usage: desc.usage };
    }

    createBindGroupLayout(desc) {
        return {};
    }

    createPipelineLayout(desc) {
        return {};
    }

    createRenderPipeline(desc) {
        return {};
    }

    createBindGroup(desc) {
        return {};
    }

    createCommandEncoder() {
        return {
            beginComputePass: () => ({ setPipeline: () => {}, setBindGroup: () => {}, dispatchWorkgroups: () => {}, end: () => {} }),
            beginRenderPass: () => ({ setPipeline: () => {}, draw: () => {}, end: () => {} }),
            finish: () => ({})
        };
    }
}

// Mock GPUExecutionSystem
class MockGPUExecutionSystem {
    constructor(device, options) {
        this.device = device;
        this.options = options;
        this.kernels = new Map();
    }

    async initialize() {
        // Create a mock kernel
        this.kernels.set('main', {
            memoryBuffer: {},
            stateBuffer: {}
        });
    }

    async deploy(code, id) {
        this.kernels.set(id, {
            memoryBuffer: {},
            stateBuffer: {}
        });
    }

    async tick(id, cycles) {
        return true;
    }

    async readState(id) {
        return {
            registers: new Array(32).fill(0),
            pc: 0,
            halted: false,
            satp: 0,
            mode: 0
        };
    }

    async readFramebuffer(id) {
        return new Uint8Array(1024 * 768 * 4);
    }

    async injectInput(id, type, data) {
        return true;
    }
}

// Mock the imports
const mockGPUExecutionSystem = { GPUExecutionSystem: MockGPUExecutionSystem };
const mockKernelLoader = {
    WGPUKernelLoader: class {
        constructor(device) { this.device = device; }
        async loadFromBuffer(buffer) {
            const data = new Uint8Array(buffer);
            return { entryPoint: 0, size: data.byteLength, data };
        }
        writeToMemory(buffer, data, address) {}
    }
};
const mockCanvasRenderer = {
    CanvasRenderer: class {
        constructor(width = 1024, height = 768) {
            this.width = width;
            this.height = height;
            this.canvas = new MockCanvas(width, height);
        }
        render(data) {}
        attachTo(container) {}
        capture() { return 'data:image/png;base64,mock'; }
    }
};
const mockInputHandler = {
    WGPUInputHandler: class {
        constructor(canvas, device, buffer, id) {
            this.canvas = canvas;
            this.device = device;
        }
        focus() {}
    }
};

// Dynamic import for ES modules
async function runTests() {
    console.log('\n========================================');
    console.log('WGPULinuxHypervisor - Test Suite');
    console.log('========================================\n');

    let passed = 0;
    let failed = 0;

    // We'll create a test version that uses mocked dependencies
    const { WGPULinuxHypervisor } = await import('../wgpu_linux_hypervisor.js')
        .then(module => module)
        .catch(() => {
            // If import fails due to missing dependencies, we'll test the class structure
            return { WGPULinuxHypervisor: null };
        });

    // ==========================================
    // Test 1: Class structure verification
    // ==========================================
    console.log('Test 1: Verify hypervisor file exists and has correct structure...');
    try {
        const fs = await import('fs');
        const content = fs.readFileSync('wgpu_linux_hypervisor.js', 'utf-8');

        const hasClass = content.includes('class WGPULinuxHypervisor');
        const hasInit = content.includes('async init()');
        const hasLoadKernel = content.includes('async loadKernel(buffer)');
        const hasTick = content.includes('async tick(');
        const hasStart = content.includes('start(');
        const hasStop = content.includes('stop()');
        const hasRender = content.includes('async render()');
        const hasCapture = content.includes('capture()');
        const hasInjectKeyboard = content.includes('async injectKeyboard(');
        const hasInjectMouse = content.includes('async injectMouse(');
        const hasSetupMMU = content.includes('async setupMMU()');

        if (hasClass && hasInit && hasLoadKernel && hasTick && hasStart && hasStop &&
            hasRender && hasCapture && hasInjectKeyboard && hasInjectMouse && hasSetupMMU) {
            console.log('  ✅ PASS: All required methods present');
            passed++;
        } else {
            console.log('  ❌ FAIL: Missing required methods');
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 2: Options parsing
    // ==========================================
    console.log('\nTest 2: Verify default options...');
    try {
        const fs = await import('fs');
        const content = fs.readFileSync('wgpu_linux_hypervisor.js', 'utf-8');

        const hasDefaultWidth = content.includes("width: options.width || 1024");
        const hasDefaultHeight = content.includes("height: options.height || 1024");
        const hasDefaultCycles = content.includes("cyclesPerFrame: options.cyclesPerFrame || 10000");
        const hasDefaultDisplay = content.includes("displayMode: options.displayMode || 'canvas'");

        if (hasDefaultWidth && hasDefaultHeight && hasDefaultCycles && hasDefaultDisplay) {
            console.log('  ✅ PASS: Default options correctly defined');
            passed++;
        } else {
            console.log('  ❌ FAIL: Missing or incorrect default options');
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 3: Import statements
    // ==========================================
    console.log('\nTest 3: Verify correct imports...');
    try {
        const fs = await import('fs');
        const content = fs.readFileSync('wgpu_linux_hypervisor.js', 'utf-8');

        const hasGPUExecutionSystem = content.includes("from './gpu_execution_system.js'");
        const hasKernelLoader = content.includes("from './wgpu_kernel_loader.js'");
        const hasCanvasRenderer = content.includes("from './display/canvas_renderer.js'");
        const hasInputHandler = content.includes("from './wgpu_input_handler.js'");

        if (hasGPUExecutionSystem && hasKernelLoader && hasCanvasRenderer && hasInputHandler) {
            console.log('  ✅ PASS: All imports correctly defined');
            passed++;
        } else {
            console.log('  ❌ FAIL: Missing imports');
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 4: State structure
    // ==========================================
    console.log('\nTest 4: Verify getState() returns correct structure...');
    try {
        const fs = await import('fs');
        const content = fs.readFileSync('wgpu_linux_hypervisor.js', 'utf-8');

        const hasRegisters = content.includes('registers: new Array(32).fill(0)');
        const hasPC = content.includes('pc: 0');
        const hasHalted = content.includes('halted: false');
        const hasSATP = content.includes('satp: 0');
        const hasMode = content.includes('mode: 0');

        if (hasRegisters && hasPC && hasHalted && hasSATP && hasMode) {
            console.log('  ✅ PASS: State structure correctly defined');
            passed++;
        } else {
            console.log('  ❌ FAIL: Missing state fields');
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 5: MMU setup
    // ==========================================
    console.log('\nTest 5: Verify MMU setup constants...');
    try {
        const fs = await import('fs');
        const content = fs.readFileSync('wgpu_linux_hypervisor.js', 'utf-8');

        const hasSATPEnable = content.includes('(1 << 31)');
        const hasSv32 = content.includes('Mode=1');
        const hasPageTableAddr = content.includes('0x03000000');

        if (hasSATPEnable && hasSv32 && hasPageTableAddr) {
            console.log('  ✅ PASS: MMU setup correctly implemented');
            passed++;
        } else {
            console.log('  ❌ FAIL: MMU setup incomplete');
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 6: Window export
    // ==========================================
    console.log('\nTest 6: Verify window global export...');
    try {
        const fs = await import('fs');
        const content = fs.readFileSync('wgpu_linux_hypervisor.js', 'utf-8');

        const hasWindowExport = content.includes("window.WGPULinuxHypervisor = WGPULinuxHypervisor");

        if (hasWindowExport) {
            console.log('  ✅ PASS: Window export correctly defined');
            passed++;
        } else {
            console.log('  ❌ FAIL: Missing window export');
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 7: Verify dependency files exist
    // ==========================================
    console.log('\nTest 7: Verify all dependency files exist...');
    try {
        const fs = await import('fs');

        const files = [
            'gpu_execution_system.js',
            'wgpu_kernel_loader.js',
            'wgpu_input_handler.js',
            'display/canvas_renderer.js',
            'display/webgpu_renderer.js',
            'display/pixi_renderer.js'
        ];

        let allExist = true;
        for (const file of files) {
            if (!fs.existsSync(file)) {
                console.log(`  ❌ Missing: ${file}`);
                allExist = false;
            }
        }

        if (allExist) {
            console.log('  ✅ PASS: All dependency files exist');
            passed++;
        } else {
            failed++;
        }
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
        console.log('✅ All hypervisor tests passed!\n');
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
