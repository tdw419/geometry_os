/**
 * Tests for AtlasGlowOverlay - Visualizes weight atlas access patterns.
 */

const assert = require('node:assert');
const test = require('node:test');

// Mock PIXI before importing
global.PIXI = {
    Graphics: class Graphics {
        constructor() {
            this.alpha = 1.0;
            this.x = 0;
            this.y = 0;
            this.blendMode = 'NORMAL';
        }
        circle() { return this; }
        fill() { return this; }
        destroy() {}
    },
    Container: class Container {
        constructor() {
            this.children = [];
        }
        addChild(child) { this.children.push(child); }
        removeChild(child) {
            const idx = this.children.indexOf(child);
            if (idx >= 0) this.children.splice(idx, 1);
        }
    },
    Sprite: class Sprite {
        constructor(texture) {
            this.texture = texture;
            this.blendMode = 'NORMAL';
        }
    },
    RenderTexture: {
        create: (options) => ({ width: options.width, height: options.height })
    }
};

// Clear module cache to ensure fresh import
delete require.cache[require.resolve('../AtlasGlowOverlay.js')];
const { AtlasGlowOverlay } = require('../AtlasGlowOverlay.js');

test('AtlasGlowOverlay - should initialize with app and options', () => {
    const mockApp = {
        stage: new PIXI.Container(),
        ticker: { add: () => {} }
    };

    const overlay = new AtlasGlowOverlay(mockApp, { atlasSize: 512 });

    assert.strictEqual(overlay.atlasSize, 512);
    assert.ok(overlay.container);
});

test('AtlasGlowOverlay - should use default atlasSize of 1024', () => {
    const mockApp = {
        stage: new PIXI.Container(),
        ticker: { add: () => {} }
    };

    const overlay = new AtlasGlowOverlay(mockApp);

    assert.strictEqual(overlay.atlasSize, 1024);
});

test('AtlasGlowOverlay - handleGlow should create graphics for indices', () => {
    const mockApp = {
        stage: new PIXI.Container(),
        ticker: { add: () => {} }
    };

    const overlay = new AtlasGlowOverlay(mockApp);

    overlay.handleGlow({
        indices: [0, 64, 128],
        intensity: 0.8,
        duration_ms: 500
    });

    assert.strictEqual(overlay.glowPoints.size, 1);
});

test('AtlasGlowOverlay - handleGlow should ignore empty indices', () => {
    const mockApp = {
        stage: new PIXI.Container(),
        ticker: { add: () => {} }
    };

    const overlay = new AtlasGlowOverlay(mockApp);

    overlay.handleGlow({
        indices: [],
        intensity: 0.8,
        duration_ms: 500
    });

    assert.strictEqual(overlay.glowPoints.size, 0);
});

test('AtlasGlowOverlay - handleGlow should ignore null indices', () => {
    const mockApp = {
        stage: new PIXI.Container(),
        ticker: { add: () => {} }
    };

    const overlay = new AtlasGlowOverlay(mockApp);

    overlay.handleGlow({
        indices: null,
        intensity: 0.8,
        duration_ms: 500
    });

    assert.strictEqual(overlay.glowPoints.size, 0);
});

test('AtlasGlowOverlay - _hilbertIndexToCoord should convert indices', () => {
    const mockApp = {
        stage: new PIXI.Container(),
        ticker: { add: () => {} }
    };

    const overlay = new AtlasGlowOverlay(mockApp, { atlasSize: 1024 });

    // Test simple modulo conversion
    const coord1 = overlay._hilbertIndexToCoord(0);
    assert.strictEqual(coord1.x, 0);
    assert.strictEqual(coord1.y, 0);

    const coord2 = overlay._hilbertIndexToCoord(1025);
    assert.strictEqual(coord2.x, 1);
    assert.strictEqual(coord2.y, 1);

    const coord3 = overlay._hilbertIndexToCoord(2048);
    assert.strictEqual(coord3.x, 0);
    assert.strictEqual(coord3.y, 2);
});

test('AtlasGlowOverlay - clear should remove all glow points', () => {
    const mockApp = {
        stage: new PIXI.Container(),
        ticker: { add: () => {} }
    };

    const overlay = new AtlasGlowOverlay(mockApp);

    overlay.handleGlow({ indices: [0, 64, 128], intensity: 0.8, duration_ms: 500 });
    overlay.handleGlow({ indices: [256, 512], intensity: 0.5, duration_ms: 300 });

    assert.strictEqual(overlay.glowPoints.size, 2);

    overlay.clear();

    assert.strictEqual(overlay.glowPoints.size, 0);
});

test('AtlasGlowOverlay - should use default intensity and duration', () => {
    const mockApp = {
        stage: new PIXI.Container(),
        ticker: { add: () => {} }
    };

    const overlay = new AtlasGlowOverlay(mockApp);

    overlay.handleGlow({ indices: [0] });

    assert.strictEqual(overlay.glowPoints.size, 1);
});

test('AtlasGlowOverlay - _removeGlow should remove specific glow', () => {
    const mockApp = {
        stage: new PIXI.Container(),
        ticker: { add: () => {} }
    };

    const overlay = new AtlasGlowOverlay(mockApp);

    overlay.handleGlow({ indices: [0], intensity: 1.0, duration_ms: 10000 });

    assert.strictEqual(overlay.glowPoints.size, 1);

    // Get the glow ID
    const glowId = [...overlay.glowPoints.keys()][0];
    overlay._removeGlow(glowId);

    assert.strictEqual(overlay.glowPoints.size, 0);
});
