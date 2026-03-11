/**
 * Test: CanvasRenderer
 * Tests the Canvas 2D display renderer.
 */
import { CanvasRenderer } from '../display/canvas_renderer.js';

export async function testCanvasRendererExists() {
    const renderer = new CanvasRenderer(1024, 768);
    console.assert(renderer !== null, 'CanvasRenderer should instantiate');
    console.assert(renderer.canvas.width === 1024, 'Canvas width should be 1024');
    console.assert(renderer.canvas.height === 768, 'Canvas height should be 768');
    console.log('✅ CanvasRenderer exists with correct dimensions');
    return true;
}

export async function testCanvasRendererRenders() {
    const renderer = new CanvasRenderer(4, 4);

    // Create fake framebuffer data (4x4 RGBA)
    const fbData = new Uint8Array([
        255, 0, 0, 255,    // Red pixel
        0, 255, 0, 255,    // Green pixel
        0, 0, 255, 255,    // Blue pixel
        255, 255, 0, 255,  // Yellow pixel
        // ... more pixels for 4x4
        0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255,
        0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255,
        0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255
    ]);

    renderer.render(fbData);

    // Verify canvas has content
    const ctx = renderer.canvas.getContext('2d');
    const imageData = ctx.getImageData(0, 0, 1, 1);
    console.assert(imageData.data[0] === 255, 'First pixel should be red');
    console.assert(imageData.data[1] === 0, 'First pixel green channel should be 0');
    console.assert(imageData.data[2] === 0, 'First pixel blue channel should be 0');
    console.log('✅ CanvasRenderer renders framebuffer data');
    return true;
}

export async function testCanvasRendererClear() {
    const renderer = new CanvasRenderer(4, 4);

    // Render some data
    const fbData = new Uint8Array(4 * 4 * 4).fill(255);
    renderer.render(fbData);

    // Clear
    renderer.clear();

    // Verify cleared to black
    const ctx = renderer.canvas.getContext('2d');
    const imageData = ctx.getImageData(0, 0, 4, 4);
    console.assert(imageData.data[0] === 0, 'Canvas should be cleared to black');
    console.log('✅ CanvasRenderer clears to black');
    return true;
}

export async function testCanvasRendererAttachTo() {
    const renderer = new CanvasRenderer(100, 100);

    // Create mock container
    const container = document.createElement('div');
    renderer.attachTo(container);

    console.assert(container.children.length === 1, 'Canvas should be attached to container');
    console.assert(container.children[0] === renderer.canvas, 'Attached element should be the canvas');
    console.log('✅ CanvasRenderer attaches to DOM container');
    return true;
}

export async function testCanvasRendererCapture() {
    const renderer = new CanvasRenderer(4, 4);

    // Render some data
    const fbData = new Uint8Array([
        255, 0, 0, 255, 0, 255, 0, 255,
        0, 0, 255, 255, 255, 255, 0, 255,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0
    ]);
    renderer.render(fbData);

    // Capture
    const dataUrl = renderer.capture();
    console.assert(dataUrl.startsWith('data:image/png;base64,'), 'Capture should return PNG data URL');
    console.log('✅ CanvasRenderer captures to PNG data URL');
    return true;
}

// Export for HTML test runner
if (typeof window !== 'undefined') {
    window.testCanvasRendererExists = testCanvasRendererExists;
    window.testCanvasRendererRenders = testCanvasRendererRenders;
    window.testCanvasRendererClear = testCanvasRendererClear;
    window.testCanvasRendererAttachTo = testCanvasRendererAttachTo;
    window.testCanvasRendererCapture = testCanvasRendererCapture;
}
