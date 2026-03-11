const assert = require('node:assert');
const test = require('node:test');

global.window = {};
const { NeuralCityRenderer } = require('../NeuralCityRenderer.js');

test('NeuralCityRenderer - addPulse stores coordinate', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    renderer.addPulse(1000, 2000, Date.now());

    assert.strictEqual(renderer.pulseBuffer.length, 1);
    assert.deepStrictEqual(renderer.pulseBuffer[0].coords, { x: 1000, y: 2000 });
});

test('NeuralCityRenderer - pulseBuffer has max size', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    // Add more than max
    for (let i = 0; i < 100; i++) {
        renderer.addPulse(i * 100, i * 100, Date.now());
    }

    assert.ok(renderer.pulseBuffer.length <= 64);
});

test('NeuralCityRenderer - expireOldPulses removes stale entries', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    const oldTime = Date.now() - 5000; // 5 seconds ago
    const newTime = Date.now();

    renderer.addPulse(100, 100, oldTime);
    renderer.addPulse(200, 200, newTime);
    renderer.expireOldPulses(1000); // 1 second TTL

    assert.strictEqual(renderer.pulseBuffer.length, 1);
    assert.strictEqual(renderer.pulseBuffer[0].coords.x, 200);
});

test('NeuralCityRenderer - clearPulses empties buffer', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    renderer.addPulse(100, 100, Date.now());
    renderer.addPulse(200, 200, Date.now());
    renderer.clearPulses();

    assert.strictEqual(renderer.pulseBuffer.length, 0);
});
