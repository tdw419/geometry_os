/**
 * Tests for AttentionVisualizer - PixiJS renderer for attention patterns.
 *
 * Part of Glass Box Dashboard - visualizing internal mechanics of PixelBrain inference.
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
        rect() { return this; }
        circle() { return this; }
        fill() { return this; }
        destroy() {}
    },
    Container: class Container {
        addChild() {}
        removeChild() {}
    }
};

const { AttentionVisualizer } = require('../AttentionVisualizer.js');

test('AttentionVisualizer - should initialize with app and container', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    assert.strictEqual(viz.app, mockApp);
    assert.strictEqual(viz.container, mockContainer);
});

test('AttentionVisualizer - should have renderAttention method', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    assert.strictEqual(typeof viz.renderAttention, 'function');
});

test('AttentionVisualizer - should render attention patterns', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    let addChildCalls = 0;
    const mockContainer = {
        addChild: () => { addChildCalls++; },
        removeChild: () => {}
    };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    viz.renderAttention({
        head_weights: [[0.1, 0.9], [0.8, 0.2]],
        layer_idx: 0,
        seq_position: 5
    });

    // Should create pattern for attention head
    assert.strictEqual(viz.patterns.length, 1);
    assert.ok(addChildCalls > 0, 'Should add graphics to container');
});

test('AttentionVisualizer - should have clear method', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    viz.renderAttention({
        head_weights: [[0.5]],
        layer_idx: 0,
        seq_position: 0
    });

    assert.strictEqual(viz.patterns.length, 1);

    viz.clear();

    assert.strictEqual(viz.patterns.length, 0);
});

test('AttentionVisualizer - should have renderDistribution method', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    assert.strictEqual(typeof viz.renderDistribution, 'function');
});

test('AttentionVisualizer - should render probability distribution bars', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    let addChildCalls = 0;
    const mockContainer = {
        addChild: () => { addChildCalls++; },
        removeChild: () => {}
    };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    viz.renderDistribution({
        probabilities: [0.1, 0.3, 0.4, 0.2],
        labels: ['A', 'B', 'C', 'D'],
        x: 100,
        y: 200
    });

    assert.strictEqual(viz.distributions.length, 1);
    assert.ok(addChildCalls > 0, 'Should add graphics to container');
});

test('AttentionVisualizer - should auto-fade patterns over time', async () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    const pattern = viz.renderAttention({
        head_weights: [[0.5]],
        layer_idx: 0,
        seq_position: 0
    });

    // Set longer lifetime for fade test
    pattern.lifetime = 500; // 500ms

    const initialAlpha = pattern.graphics.alpha;

    // Wait for time to pass (but not enough to expire)
    await new Promise(resolve => setTimeout(resolve, 50));

    // Call update to process fade
    viz.update(0);

    assert.ok(pattern.graphics.alpha < initialAlpha,
        'Alpha should decrease after update');
});

test('AttentionVisualizer - should remove faded patterns', async () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    const pattern = viz.renderAttention({
        head_weights: [[0.5]],
        layer_idx: 0,
        seq_position: 0
    });

    // Set very short lifetime for testing
    pattern.lifetime = 10; // 10ms

    assert.strictEqual(viz.patterns.length, 1);

    // Wait for pattern to expire
    await new Promise(resolve => setTimeout(resolve, 50));

    // Call update to process removal
    viz.update(0);

    assert.strictEqual(viz.patterns.length, 0, 'Patterns should be removed after fading');
});

test('AttentionVisualizer - should map intensity to color', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    // Low intensity should be cooler color
    const lowColor = viz._intensityToColor(0.1);
    // High intensity should be warmer color
    const highColor = viz._intensityToColor(0.9);

    // Colors should be different
    assert.notStrictEqual(lowColor, highColor,
        'Different intensities should produce different colors');
});

test('AttentionVisualizer - should have update method', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    assert.strictEqual(typeof viz.update, 'function');
});

test('AttentionVisualizer - count getter returns pattern count', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    assert.strictEqual(viz.count, 0);

    viz.renderAttention({
        head_weights: [[0.5]],
        layer_idx: 0,
        seq_position: 0
    });

    assert.strictEqual(viz.count, 1);
});

test('AttentionVisualizer - should support multiple attention heads', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    // Render first attention pattern
    viz.renderAttention({
        head_weights: [[0.5, 0.5]],
        layer_idx: 0,
        seq_position: 0
    });

    // Render second attention pattern
    viz.renderAttention({
        head_weights: [[0.8, 0.2]],
        layer_idx: 1,
        seq_position: 0
    });

    assert.strictEqual(viz.patterns.length, 2);
});

test('AttentionVisualizer - clear should also clear distributions', () => {
    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };
    const mockContainer = { addChild: () => {}, removeChild: () => {} };

    const viz = new AttentionVisualizer(mockApp, mockContainer);

    viz.renderAttention({ head_weights: [[0.5]], layer_idx: 0, seq_position: 0 });
    viz.renderDistribution({ probabilities: [0.5], labels: ['A'], x: 0, y: 0 });

    assert.strictEqual(viz.patterns.length, 1);
    assert.strictEqual(viz.distributions.length, 1);

    viz.clear();

    assert.strictEqual(viz.patterns.length, 0);
    assert.strictEqual(viz.distributions.length, 0);
});
