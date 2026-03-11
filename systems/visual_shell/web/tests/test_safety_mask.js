const assert = require('node:assert');
const test = require('node:test');

global.window = {};
const { NeuralCityRenderer } = require('../NeuralCityRenderer.js');

test('NeuralCityRenderer - setSafetyMask accepts array', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    // 32x32 mask = 1024 districts
    const mask = new Float32Array(32 * 32);
    mask[0] = 1.0; // Quarantine district 0,0

    renderer.setSafetyMask(mask);

    assert.ok(renderer.safetyMask);
    assert.strictEqual(renderer.safetyMask.length, 1024);
});

test('NeuralCityRenderer - getQuarantineStatus returns mask value', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    const mask = new Float32Array(32 * 32);
    mask[5 * 32 + 7] = 1.0; // Quarantine district (7, 5)

    renderer.setSafetyMask(mask);

    assert.strictEqual(renderer.getQuarantineStatus(7, 5), 1.0);
    assert.strictEqual(renderer.getQuarantineStatus(0, 0), 0.0);
});

test('NeuralCityRenderer - clearSafetyMask resets all to 0', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    const mask = new Float32Array(32 * 32);
    mask.fill(1.0);
    renderer.setSafetyMask(mask);
    renderer.clearSafetyMask();

    assert.strictEqual(renderer.getQuarantineStatus(0, 0), 0.0);
});

test('NeuralCityRenderer - setQuarantineStatus creates mask if needed', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    // No mask set initially
    assert.strictEqual(renderer.safetyMask, undefined);

    // setQuarantineStatus should create mask
    renderer.setQuarantineStatus(5, 10, true);

    assert.ok(renderer.safetyMask);
    assert.strictEqual(renderer.getQuarantineStatus(5, 10), 1.0);
});
