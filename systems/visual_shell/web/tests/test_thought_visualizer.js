/**
 * Tests for ThoughtVisualizer - PixiJS renderer for THOUGHT_PULSE glyphs.
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
            this.scale = { set: () => {} };
        }
        circle() { return this; }
        fill() { return this; }
        destroy() {}
    },
    Container: class Container {
        addChild() {}
        removeChild() {}
    }
};

const { ThoughtVisualizer } = require('../ThoughtVisualizer.js');

test('ThoughtVisualizer - should initialize with PixiJS app', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new ThoughtVisualizer(mockApp, mockContainer);

    assert.strictEqual(viz.app, mockApp);
    assert.strictEqual(viz.container, mockContainer);
});

test('ThoughtVisualizer - should create glyph on emitThoughtPulse', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    let addChildCalled = false;
    const mockContainer = {
        addChild: () => { addChildCalled = true; },
        removeChild: () => {}
    };

    const viz = new ThoughtVisualizer(mockApp, mockContainer);

    viz.emitThoughtPulse({
        type: 'THOUGHT_PULSE',
        token_id: 15496,
        x: 100,
        y: 100,
        intensity: 0.8
    });

    assert.strictEqual(viz.glyphs.length, 1);
    assert.strictEqual(addChildCalled, true);
});

test('ThoughtVisualizer - should fade glyphs over time', async () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new ThoughtVisualizer(mockApp, mockContainer);

    viz.emitThoughtPulse({
        type: 'THOUGHT_PULSE',
        token_id: 0,
        x: 0,
        y: 0,
        intensity: 1.0
    });

    const initialAlpha = viz.glyphs[0].graphics.alpha;

    // Wait for real time to pass
    await new Promise(resolve => setTimeout(resolve, 100));

    // Call update to process the time-based fade
    viz.update(0);

    assert.ok(viz.glyphs[0].graphics.alpha < initialAlpha,
        'Alpha should decrease after update');
});

test('ThoughtVisualizer - should remove faded glyphs', async () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new ThoughtVisualizer(mockApp, mockContainer);

    // Create a glyph with very short lifetime for testing
    const glyph = viz.emitThoughtPulse({
        type: 'THOUGHT_PULSE',
        token_id: 0,
        x: 0,
        y: 0,
        intensity: 1.0
    });

    // Override lifetime to be very short for testing
    glyph.lifetime = 10; // 10ms

    assert.strictEqual(viz.glyphs.length, 1);

    // Wait for glyph to expire
    await new Promise(resolve => setTimeout(resolve, 50));

    // Call update to process removal
    viz.update(0);

    assert.strictEqual(viz.glyphs.length, 0, 'Glyphs should be removed after fading');
});

test('ThoughtVisualizer - should use 0xCE opcode color cyan', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new ThoughtVisualizer(mockApp, mockContainer);

    viz.emitThoughtPulse({
        type: 'THOUGHT_PULSE',
        opcode: 0xCE,
        token_id: 0,
        x: 0,
        y: 0,
        intensity: 1.0
    });

    const glyph = viz.glyphs[0];
    assert.strictEqual(glyph.color, '#00FFFF', '0xCE should map to cyan');
});

test('ThoughtVisualizer - clear should remove all glyphs', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new ThoughtVisualizer(mockApp, mockContainer);

    viz.emitThoughtPulse({ type: 'THOUGHT_PULSE', token_id: 1, x: 0, y: 0, intensity: 1.0 });
    viz.emitThoughtPulse({ type: 'THOUGHT_PULSE', token_id: 2, x: 50, y: 50, intensity: 1.0 });
    viz.emitThoughtPulse({ type: 'THOUGHT_PULSE', token_id: 3, x: 100, y: 100, intensity: 1.0 });

    assert.strictEqual(viz.glyphs.length, 3);

    viz.clear();

    assert.strictEqual(viz.glyphs.length, 0);
});

test('ThoughtVisualizer - count getter returns glyph count', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new ThoughtVisualizer(mockApp, mockContainer);

    assert.strictEqual(viz.count, 0);

    viz.emitThoughtPulse({ type: 'THOUGHT_PULSE', token_id: 1, x: 0, y: 0, intensity: 1.0 });

    assert.strictEqual(viz.count, 1);
});
