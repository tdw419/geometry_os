const assert = require('node:assert');
const test = require('node:test');

global.window = {};
const { NeuralCityFilter } = require('../NeuralCityFilter.js');
const { NeuralCityRenderer } = require('../NeuralCityRenderer.js');

test('NeuralCityFilter - uniforms include metabolism', () => {
    const filter = new NeuralCityFilter();
    assert.ok('uMetabolismIPC' in filter.uniforms);
    assert.ok('uThrottleLevel' in filter.uniforms);
});

test('NeuralCityFilter - setMetabolism updates uniforms', () => {
    const filter = new NeuralCityFilter();

    filter.setMetabolism(0.8, 'NONE');  // High IPC, no throttle

    assert.strictEqual(filter.uniforms.uMetabolismIPC, 0.8);
    assert.strictEqual(filter.uniforms.uThrottleLevel, 0.0);
});

test('NeuralCityRenderer - updateMetabolism passes to filter', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    renderer.filter = new NeuralCityFilter();

    renderer.updateMetabolism({ ipc: 0.5, throttle_level: 'MODERATE' });

    assert.strictEqual(renderer.filter.uniforms.uMetabolismIPC, 0.5);
    assert.strictEqual(renderer.filter.uniforms.uThrottleLevel, 0.5);
});

test('NeuralCityFilter - unknown throttle level defaults to 0.0', () => {
    const filter = new NeuralCityFilter();
    filter.setMetabolism(0.5, 'UNKNOWN');
    assert.strictEqual(filter.uniforms.uThrottleLevel, 0.0);
});

test('NeuralCityFilter - IPC clamping works correctly', () => {
    const filter = new NeuralCityFilter();

    // Test values above 1.0 are clamped
    filter.setMetabolism(2.0, 'NONE');
    assert.strictEqual(filter.uniforms.uMetabolismIPC, 1.0);

    // Test values below 0.0 are clamped
    filter.setMetabolism(-0.5, 'NONE');
    assert.strictEqual(filter.uniforms.uMetabolismIPC, 0.0);
});

test('NeuralCityRenderer - updateMetabolism handles invalid data', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    renderer.filter = new NeuralCityFilter();

    // Set initial values
    renderer.filter.setMetabolism(0.8, 'AGGRESSIVE');

    // Test null data - should not crash and values should remain unchanged
    renderer.updateMetabolism(null);
    assert.strictEqual(renderer.filter.uniforms.uMetabolismIPC, 0.8);

    // Test undefined data
    renderer.updateMetabolism(undefined);
    assert.strictEqual(renderer.filter.uniforms.uMetabolismIPC, 0.8);

    // Test non-object data
    renderer.updateMetabolism('invalid');
    assert.strictEqual(renderer.filter.uniforms.uMetabolismIPC, 0.8);
});

test('NeuralCityRenderer - updateMetabolism uses nullish coalescing for defaults', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    renderer.filter = new NeuralCityFilter();

    // Test with explicit 0 (should use 0, not default)
    renderer.updateMetabolism({ ipc: 0, throttle_level: 'NONE' });
    assert.strictEqual(renderer.filter.uniforms.uMetabolismIPC, 0.0);

    // Test with missing properties (should use defaults)
    renderer.updateMetabolism({});
    assert.strictEqual(renderer.filter.uniforms.uMetabolismIPC, 0.5);
    assert.strictEqual(renderer.filter.uniforms.uThrottleLevel, 0.0);
});
