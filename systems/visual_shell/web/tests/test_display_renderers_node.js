/**
 * Node.js Test Runner for Display Renderers
 *
 * Tests Canvas and WebGPU renderers with mocked environment.
 */

// Mock browser globals
global.window = {};
global.HTMLElement = class HTMLElement {};

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
        this.strokeStyle = '#000000';
        this.lineWidth = 1;
        this._imageData = new Uint8ClampedArray(width * height * 4);
    }

    createImageData(width, height) {
        return new MockImageData(null, width, height);
    }

    getImageData(x, y, w, h) {
        return new MockImageData(null, w, h);
    }

    putImageData(data, x, y) {
        // Mock - just succeed
    }

    fillRect(x, y, w, h) {
        // Mock - just succeed
    }

    strokeRect(x, y, w, h) {
        // Mock - just succeed
    }

    toDataURL(format, quality) {
        return 'data:image/png;base64,mock';
    }
}

// Mock canvas element
class MockCanvas {
    constructor(width = 1024, height = 768) {
        this.width = width;
        this.height = height;
        this._context = new MockCanvas2DContext(width, height);
    }

    getContext(type, options) {
        if (type === '2d') {
            return this._context;
        }
        if (type === 'webgpu') {
            return { configure: () => {} };
        }
        return null;
    }

    toDataURL(format, quality) {
        return 'data:image/png;base64,mock';
    }
}

// Mock document
global.document = {
    createElement: (tag) => {
        if (tag === 'canvas') {
            return new MockCanvas();
        }
        return {};
    }
};

// Mock navigator for WebGPU
global.navigator = {
    gpu: {
        getPreferredCanvasFormat: () => 'rgba8unorm'
    }
};

// Mock GPU constants
global.GPUTextureUsage = {
    TEXTURE_BINDING: 1,
    COPY_DST: 2,
    RENDER_ATTACHMENT: 4
};

// Mock GPU device for WebGPU renderer
class MockGPUDevice {
    constructor() {
        this.queue = {
            writeTexture: (destination, data, dataLayout, size) => {
                return true;
            },
            submit: (commands) => {}
        };
    }

    createTexture(desc) {
        return {
            width: desc.size[0],
            height: desc.size[1],
            createView: () => ({})
        };
    }

    createCommandEncoder() {
        return {
            beginRenderPass: (desc) => ({
                end: () => {}
            }),
            finish: () => ({})
        };
    }
}

// Dynamic import for ES modules
async function runTests() {
    console.log('\n========================================');
    console.log('Display Renderers - Test Suite');
    console.log('========================================\n');

    let passed = 0;
    let failed = 0;

    // Import modules
    const { CanvasRenderer } = await import('../display/canvas_renderer.js');
    const { WebGPURenderer } = await import('../display/webgpu_renderer.js');

    // ==========================================
    // Test 1: CanvasRenderer instantiation
    // ==========================================
    console.log('Test 1: CanvasRenderer instantiation...');
    try {
        const renderer = new CanvasRenderer(1024, 768);

        if (renderer.width === 1024 && renderer.height === 768 && renderer.canvas && renderer.ctx) {
            console.log('  ✅ PASS: CanvasRenderer instantiates correctly');
            passed++;
        } else {
            console.log('  ❌ FAIL: CanvasRenderer properties not set correctly');
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 2: CanvasRenderer default size
    // ==========================================
    console.log('\nTest 2: CanvasRenderer default size...');
    try {
        const renderer = new CanvasRenderer();

        if (renderer.width === 1024 && renderer.height === 768) {
            console.log('  ✅ PASS: Default size is 1024x768');
            passed++;
        } else {
            console.log(`  ❌ FAIL: Unexpected default size: ${renderer.width}x${renderer.height}`);
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 3: CanvasRenderer.render
    // ==========================================
    console.log('\nTest 3: CanvasRenderer.render...');
    try {
        const renderer = new CanvasRenderer(100, 100);
        const framebuffer = new Uint8Array(100 * 100 * 4);

        renderer.render(framebuffer);
        console.log('  ✅ PASS: render() executes without error');
        passed++;
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 4: CanvasRenderer.render size mismatch
    // ==========================================
    console.log('\nTest 4: CanvasRenderer.render size mismatch...');
    try {
        const renderer = new CanvasRenderer(100, 100);
        const wrongFramebuffer = new Uint8Array(50 * 50 * 4); // Wrong size

        try {
            renderer.render(wrongFramebuffer);
            console.log('  ❌ FAIL: Should have thrown error for size mismatch');
            failed++;
        } catch (e) {
            if (e.message.includes('size mismatch')) {
                console.log('  ✅ PASS: Correctly throws error for size mismatch');
                passed++;
            } else {
                console.log(`  ❌ FAIL: Wrong error message: ${e.message}`);
                failed++;
            }
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 5: CanvasRenderer.clear
    // ==========================================
    console.log('\nTest 5: CanvasRenderer.clear...');
    try {
        const renderer = new CanvasRenderer();
        renderer.clear();
        console.log('  ✅ PASS: clear() executes without error');
        passed++;
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 6: CanvasRenderer.capture
    // ==========================================
    console.log('\nTest 6: CanvasRenderer.capture...');
    try {
        const renderer = new CanvasRenderer();
        const dataUrl = renderer.capture();

        if (typeof dataUrl === 'string' && dataUrl.startsWith('data:image/png')) {
            console.log('  ✅ PASS: capture() returns data URL');
            passed++;
        } else {
            console.log(`  ❌ FAIL: Unexpected capture result: ${dataUrl}`);
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 7: CanvasRenderer.resize
    // ==========================================
    console.log('\nTest 7: CanvasRenderer.resize...');
    try {
        const renderer = new CanvasRenderer(100, 100);
        renderer.resize(800, 600);

        if (renderer.width === 800 && renderer.height === 600) {
            console.log('  ✅ PASS: resize() updates dimensions');
            passed++;
        } else {
            console.log(`  ❌ FAIL: Unexpected dimensions: ${renderer.width}x${renderer.height}`);
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 8: CanvasRenderer.getPixel
    // ==========================================
    console.log('\nTest 8: CanvasRenderer.getPixel...');
    try {
        const renderer = new CanvasRenderer();
        const pixel = renderer.getPixel(10, 10);

        if (pixel instanceof Uint8Array && pixel.length === 4) {
            console.log('  ✅ PASS: getPixel() returns RGBA array');
            passed++;
        } else {
            console.log(`  ❌ FAIL: Unexpected pixel data: ${pixel}`);
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 9: WebGPURenderer instantiation
    // ==========================================
    console.log('\nTest 9: WebGPURenderer instantiation...');
    try {
        const mockDevice = new MockGPUDevice();
        const renderer = new WebGPURenderer(mockDevice, 1024, 768);

        if (renderer.width === 1024 && renderer.height === 768 && renderer.texture) {
            console.log('  ✅ PASS: WebGPURenderer instantiates correctly');
            passed++;
        } else {
            console.log('  ❌ FAIL: WebGPURenderer properties not set correctly');
            failed++;
        }
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 10: WebGPURenderer.render
    // ==========================================
    console.log('\nTest 10: WebGPURenderer.render...');
    try {
        const mockDevice = new MockGPUDevice();
        const renderer = new WebGPURenderer(mockDevice, 100, 100);
        const framebuffer = new Uint8Array(100 * 100 * 4);

        renderer.render(framebuffer);
        console.log('  ✅ PASS: WebGPU render() executes without error');
        passed++;
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 11: WebGPURenderer.clear
    // ==========================================
    console.log('\nTest 11: WebGPURenderer.clear...');
    try {
        const mockDevice = new MockGPUDevice();
        const renderer = new WebGPURenderer(mockDevice);
        renderer.clear();
        console.log('  ✅ PASS: WebGPU clear() executes without error');
        passed++;
    } catch (e) {
        console.log(`  ❌ FAIL: ${e.message}`);
        failed++;
    }

    // ==========================================
    // Test 12: WebGPURenderer.getCanvas
    // ==========================================
    console.log('\nTest 12: WebGPURenderer.getCanvas...');
    try {
        const mockDevice = new MockGPUDevice();
        const renderer = new WebGPURenderer(mockDevice);
        const canvas = renderer.getCanvas();

        if (canvas && canvas.getContext) {
            console.log('  ✅ PASS: getCanvas() returns canvas element');
            passed++;
        } else {
            console.log('  ❌ FAIL: getCanvas() did not return valid canvas');
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
        console.log('✅ All display renderer tests passed!\n');
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
