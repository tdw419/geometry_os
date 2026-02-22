/**
 * Test: PixiRenderer
 * Tests the PixiJS display renderer.
 */
import { PixiRenderer } from '../display/pixi_renderer.js';

export async function testPixiRendererExists() {
    // Create a mock PixiJS app
    const mockApp = {
        stage: {
            addChild: (child) => {
                mockApp.stage.children.push(child);
            }
        },
        stage: {
            children: [],
            addChild: function(child) { this.children.push(child); }
        }
    };

    const renderer = new PixiRenderer(mockApp, 256, 256);

    console.assert(renderer !== null, 'PixiRenderer should instantiate');
    console.assert(renderer.width === 256, 'Width should be 256');
    console.assert(renderer.height === 256, 'Height should be 256');
    console.log('✅ PixiRenderer exists with correct dimensions');
    return true;
}

export async function testPixiRendererHasContainer() {
    const mockApp = {
        stage: {
            children: [],
            addChild: function(child) { this.children.push(child); }
        }
    };

    const renderer = new PixiRenderer(mockApp, 128, 128);

    console.assert(renderer.container !== null, 'Should have a container');
    console.assert(renderer.container !== undefined, 'Container should be defined');
    console.log('✅ PixiRenderer has container');
    return true;
}

export async function testPixiRendererHasSprite() {
    const mockApp = {
        stage: {
            children: [],
            addChild: function(child) { this.children.push(child); }
        }
    };

    const renderer = new PixiRenderer(mockApp, 64, 64);

    console.assert(renderer.sprite !== null, 'Should have a sprite');
    console.assert(renderer.sprite !== undefined, 'Sprite should be defined');
    console.log('✅ PixiRenderer has sprite');
    return true;
}

export async function testPixiRendererHasCanvas() {
    const mockApp = {
        stage: {
            children: [],
            addChild: function(child) { this.children.push(child); }
        }
    };

    const renderer = new PixiRenderer(mockApp, 32, 32);

    console.assert(renderer.canvas instanceof HTMLCanvasElement, 'Should have a canvas element');
    console.assert(renderer.canvas.width === 32, 'Canvas width should be 32');
    console.assert(renderer.canvas.height === 32, 'Canvas height should be 32');
    console.log('✅ PixiRenderer has canvas');
    return true;
}

export async function testPixiRendererRender() {
    const mockApp = {
        stage: {
            children: [],
            addChild: function(child) { this.children.push(child); }
        }
    };

    const renderer = new PixiRenderer(mockApp, 4, 4);

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
    console.log('✅ PixiRenderer renders framebuffer');
    return true;
}

export async function testPixiRendererClear() {
    const mockApp = {
        stage: {
            children: [],
            addChild: function(child) { this.children.push(child); }
        }
    };

    const renderer = new PixiRenderer(mockApp, 16, 16);

    // Should not throw
    renderer.clear();
    console.log('✅ PixiRenderer clears to black');
    return true;
}

export async function testPixiRendererAttachTo() {
    const mockApp = {
        stage: {
            children: [],
            addChild: function(child) { this.children.push(child); }
        }
    };

    const renderer = new PixiRenderer(mockApp, 100, 100);

    const container = document.createElement('div');
    renderer.attachTo(container);

    console.assert(container.children.length === 1, 'Canvas should be attached');
    console.assert(container.children[0] === renderer.canvas, 'Attached element is canvas');
    console.log('✅ PixiRenderer attaches to container');
    return true;
}

export async function testPixiRendererCapture() {
    const mockApp = {
        stage: {
            children: [],
            addChild: function(child) { this.children.push(child); }
        }
    };

    const renderer = new PixiRenderer(mockApp, 8, 8);

    const dataUrl = renderer.capture();
    console.assert(dataUrl.startsWith('data:image/png;base64,'), 'Capture should return PNG data URL');
    console.log('✅ PixiRenderer captures to PNG data URL');
    return true;
}

export async function testPixiRendererResize() {
    const mockApp = {
        stage: {
            children: [],
            addChild: function(child) { this.children.push(child); }
        }
    };

    const renderer = new PixiRenderer(mockApp, 50, 50);
    renderer.resize(100, 100);

    console.assert(renderer.width === 100, 'Width should be 100');
    console.assert(renderer.height === 100, 'Height should be 100');
    console.assert(renderer.canvas.width === 100, 'Canvas width should be 100');
    console.assert(renderer.canvas.height === 100, 'Canvas height should be 100');
    console.log('✅ PixiRenderer resizes correctly');
    return true;
}

// Export for HTML test runner
if (typeof window !== 'undefined') {
    window.testPixiRendererExists = testPixiRendererExists;
    window.testPixiRendererHasContainer = testPixiRendererHasContainer;
    window.testPixiRendererHasSprite = testPixiRendererHasSprite;
    window.testPixiRendererHasCanvas = testPixiRendererHasCanvas;
    window.testPixiRendererRender = testPixiRendererRender;
    window.testPixiRendererClear = testPixiRendererClear;
    window.testPixiRendererAttachTo = testPixiRendererAttachTo;
    window.testPixiRendererCapture = testPixiRendererCapture;
    window.testPixiRendererResize = testPixiRendererResize;
}
