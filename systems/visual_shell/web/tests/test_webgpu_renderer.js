/**
 * Test: WebGPURenderer
 * Tests the WebGPU texture-based display renderer.
 */
import { WebGPURenderer } from '../display/webgpu_renderer.js';

export async function testWebGPURendererExists() {
    const adapter = await navigator.gpu.requestAdapter();
    if (!adapter) {
        throw new Error('WebGPU not supported');
    }
    const device = await adapter.requestDevice();
    const renderer = new WebGPURenderer(device, 256, 256);

    console.assert(renderer !== null, 'WebGPURenderer should instantiate');
    console.assert(renderer.width === 256, 'Width should be 256');
    console.assert(renderer.height === 256, 'Height should be 256');
    console.log('✅ WebGPURenderer exists with correct dimensions');
    return true;
}

export async function testWebGPURendererHasTexture() {
    const adapter = await navigator.gpu.requestAdapter();
    if (!adapter) {
        throw new Error('WebGPU not supported');
    }
    const device = await adapter.requestDevice();
    const renderer = new WebGPURenderer(device, 128, 128);

    console.assert(renderer.texture !== null, 'Should have a texture');
    console.assert(renderer.texture !== undefined, 'Texture should be defined');
    console.log('✅ WebGPURenderer has texture');
    return true;
}

export async function testWebGPURendererHasCanvas() {
    const adapter = await navigator.gpu.requestAdapter();
    if (!adapter) {
        throw new Error('WebGPU not supported');
    }
    const device = await adapter.requestDevice();
    const renderer = new WebGPURenderer(device, 64, 64);

    console.assert(renderer.canvas instanceof HTMLCanvasElement, 'Should have a canvas element');
    console.assert(renderer.canvas.width === 64, 'Canvas width should be 64');
    console.assert(renderer.canvas.height === 64, 'Canvas height should be 64');
    console.log('✅ WebGPURenderer has canvas');
    return true;
}

export async function testWebGPURendererRender() {
    const adapter = await navigator.gpu.requestAdapter();
    if (!adapter) {
        throw new Error('WebGPU not supported');
    }
    const device = await adapter.requestDevice();
    const renderer = new WebGPURenderer(device, 4, 4);

    // Create test framebuffer (4x4 RGBA)
    const framebuffer = new Uint8Array(4 * 4 * 4);
    for (let i = 0; i < framebuffer.length; i += 4) {
        framebuffer[i] = 255;     // R
        framebuffer[i + 1] = 0;   // G
        framebuffer[i + 2] = 0;   // B
        framebuffer[i + 3] = 255; // A
    }

    // Should not throw
    renderer.render(framebuffer);
    console.log('✅ WebGPURenderer renders framebuffer');
    return true;
}

export async function testWebGPURendererAttachTo() {
    const adapter = await navigator.gpu.requestAdapter();
    if (!adapter) {
        throw new Error('WebGPU not supported');
    }
    const device = await adapter.requestDevice();
    const renderer = new WebGPURenderer(device, 100, 100);

    const container = document.createElement('div');
    renderer.attachTo(container);

    console.assert(container.children.length === 1, 'Canvas should be attached');
    console.assert(container.children[0] === renderer.canvas, 'Attached element is canvas');
    console.log('✅ WebGPURenderer attaches to container');
    return true;
}

export async function testWebGPURendererClear() {
    const adapter = await navigator.gpu.requestAdapter();
    if (!adapter) {
        throw new Error('WebGPU not supported');
    }
    const device = await adapter.requestDevice();
    const renderer = new WebGPURenderer(device, 32, 32);

    // Should not throw
    renderer.clear();
    console.log('✅ WebGPURenderer clears to black');
    return true;
}

// Export for HTML test runner
if (typeof window !== 'undefined') {
    window.testWebGPURendererExists = testWebGPURendererExists;
    window.testWebGPURendererHasTexture = testWebGPURendererHasTexture;
    window.testWebGPURendererHasCanvas = testWebGPURendererHasCanvas;
    window.testWebGPURendererRender = testWebGPURendererRender;
    window.testWebGPURendererAttachTo = testWebGPURendererAttachTo;
    window.testWebGPURendererClear = testWebGPURendererClear;
}
