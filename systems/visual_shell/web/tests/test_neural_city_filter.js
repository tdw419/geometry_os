// systems/visual_shell/web/tests/test_neural_city_filter.js

const assert = require('node:assert');
const test = require('node:test');
const { NeuralCityFilter } = require('../NeuralCityFilter.js');

test('should create filter with default uniforms', () => {
    const filter = new NeuralCityFilter();
    assert.ok(filter.uniforms);
    assert.strictEqual(filter.uniforms.uTime, 0);
});

test('should update time uniform', () => {
    const filter = new NeuralCityFilter();
    filter.updateTime(1.5);
    assert.strictEqual(filter.uniforms.uTime, 1.5);
});

test('should update focus district', () => {
    const filter = new NeuralCityFilter();
    filter.setFocusDistrict(100, 200);
    assert.deepStrictEqual(filter.uniforms.uFocusDistrict, [100, 200]);
});

test('should set hi-res valid flag', () => {
    const filter = new NeuralCityFilter();
    filter.setHiResValid(true);
    assert.strictEqual(filter.uniforms.uHiResValid, 1.0);
    filter.setHiResValid(false);
    assert.strictEqual(filter.uniforms.uHiResValid, 0.0);
});
