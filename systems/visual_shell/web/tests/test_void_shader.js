/**
 * Task 2: The Void Shader Logic - Test Suite
 *
 * Tests for NeuralCityFilter's safety mask uniform and The Void shader support.
 * The Void renders quarantined districts as non-reflective black monoliths.
 */

const assert = require('node:assert');
const test = require('node:test');

global.window = {};
const { NeuralCityFilter } = require('../NeuralCityFilter.js');

test('NeuralCityFilter - uniforms include uSafetyMask', () => {
    const filter = new NeuralCityFilter();
    assert.ok('uSafetyMask' in filter.uniforms, 'uSafetyMask should be in uniforms');
});

test('NeuralCityFilter - setSafetyMask updates uniform', () => {
    const filter = new NeuralCityFilter();
    const mask = new Float32Array(32 * 32);
    mask[0] = 1.0;

    filter.setSafetyMask(mask);

    assert.strictEqual(filter.uniforms.uSafetyMask, mask);
});

test('NeuralCityFilter - uMaskSize uniform defaults to 32', () => {
    const filter = new NeuralCityFilter();
    assert.strictEqual(filter.uniforms.uMaskSize, 32);
});

test('NeuralCityFilter - uQuarantineActive uniform exists', () => {
    const filter = new NeuralCityFilter();
    assert.ok('uQuarantineActive' in filter.uniforms, 'uQuarantineActive should be in uniforms');
});

test('NeuralCityFilter - default safety mask is all zeros (no quarantines)', () => {
    const filter = new NeuralCityFilter();
    const mask = filter.uniforms.uSafetyMask;

    // Check all values are 0
    let allZero = true;
    for (let i = 0; i < mask.length; i++) {
        if (mask[i] !== 0) {
            allZero = false;
            break;
        }
    }
    assert.ok(allZero, 'Default safety mask should have all zeros');
});

test('NeuralCityFilter - setSafetyMask sets uQuarantineActive when mask has quarantine', () => {
    const filter = new NeuralCityFilter();
    const mask = new Float32Array(32 * 32);
    mask[42] = 1.0; // Quarantine one district

    filter.setSafetyMask(mask);

    assert.strictEqual(filter.uniforms.uQuarantineActive, 1.0,
        'uQuarantineActive should be 1.0 when mask has quarantine');
});

test('NeuralCityFilter - setSafetyMask clears uQuarantineActive when mask is all zeros', () => {
    const filter = new NeuralCityFilter();
    // First set a quarantine
    const mask1 = new Float32Array(32 * 32);
    mask1[0] = 1.0;
    filter.setSafetyMask(mask1);

    // Then clear it
    const mask2 = new Float32Array(32 * 32);
    filter.setSafetyMask(mask2);

    assert.strictEqual(filter.uniforms.uQuarantineActive, 0.0,
        'uQuarantineActive should be 0.0 when mask has no quarantines');
});

test('NeuralCityFilter - setSafetyMask detects quarantine at threshold 0.5', () => {
    const filter = new NeuralCityFilter();
    const mask = new Float32Array(32 * 32);
    mask[0] = 0.6; // Just above threshold

    filter.setSafetyMask(mask);
    assert.strictEqual(filter.uniforms.uQuarantineActive, 1.0);
});

test('NeuralCityFilter - setSafetyMask ignores values below threshold 0.5', () => {
    const filter = new NeuralCityFilter();
    const mask = new Float32Array(32 * 32);
    mask[0] = 0.4; // Below threshold

    filter.setSafetyMask(mask);
    assert.strictEqual(filter.uniforms.uQuarantineActive, 0.0);
});
