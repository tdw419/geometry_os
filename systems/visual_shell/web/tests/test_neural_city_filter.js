/**
 * Tests for NeuralCityFilter
 *
 * Run with: node test_neural_city_filter.js
 */

// Setup for testing
let NeuralCityFilter;
let testResults = [];
let assert;

if (typeof require !== 'undefined') {
    // Node.js environment
    const fs = require('fs');
    const path = require('path');

    // Load NeuralCityFilter
    const ncfCode = fs.readFileSync(path.join(__dirname, '../NeuralCityFilter.js'), 'utf8');
    const ncfFunc = new Function('module', 'exports', 'global', 'window', ncfCode);
    const ncfModule = { exports: {} };
    ncfFunc(ncfModule, ncfModule.exports, global, {});
    NeuralCityFilter = global.NeuralCityFilter || ncfModule.exports.NeuralCityFilter;

    assert = (condition, message) => {
        testResults.push({ passed: condition, message });
        if (!condition) {
            console.log('  FAIL: ' + message);
        } else {
            console.log('  PASS: ' + message);
        }
    };
} else {
    NeuralCityFilter = window.NeuralCityFilter;
    assert = (condition, message) => {
        testResults.push({ passed: condition, message });
    };
}

async function runTests() {
    console.log('\n=== NeuralCityFilter Test Suite ===\n');

    // Test 1: Creating filter with default uniforms
    console.log('Test 1: Creating filter with default uniforms');
    try {
        const filter = new NeuralCityFilter();
        assert(filter !== null, 'Filter should be created');
        assert(filter.uniforms.uFocusX === 0.5, 'Default focusX should be 0.5');
        assert(filter.uniforms.uFocusY === 0.5, 'Default focusY should be 0.5');
        assert(filter.uniforms.uZoom === 1.0, 'Default zoom should be 1.0');
        assert(filter.uniforms.uTime === 0, 'Default time should be 0');
        assert(filter.uniforms.uHiResBlend === 0.0, 'Default hiResBlend should be 0.0');
        testResults.push({ group: 'Default Uniforms', passed: true });
    } catch (e) {
        assert(false, 'Filter creation failed: ' + e.message);
    }

    // Test 2: setFocus method
    console.log('\nTest 2: setFocus method');
    try {
        const filter = new NeuralCityFilter();
        filter.setFocus(0.3, 0.7);
        assert(filter.uniforms.uFocusX === 0.3, 'FocusX should be updated to 0.3');
        assert(filter.uniforms.uFocusY === 0.7, 'FocusY should be updated to 0.7');
        testResults.push({ group: 'Set Focus', passed: true });
    } catch (e) {
        assert(false, 'setFocus failed: ' + e.message);
    }

    // Test 3: setZoom method
    console.log('\nTest 3: setZoom method');
    try {
        const filter = new NeuralCityFilter();
        filter.setZoom(3.5);
        assert(filter.uniforms.uZoom === 3.5, 'Zoom should be updated to 3.5');
        testResults.push({ group: 'Set Zoom', passed: true });
    } catch (e) {
        assert(false, 'setZoom failed: ' + e.message);
    }

    // Test 4: Material palette colors - gold
    console.log('\nTest 4: Material palette colors - gold');
    try {
        const filter = new NeuralCityFilter();
        const gold = filter.getMaterialColor('gold');
        assert(Array.isArray(gold), 'Gold should be an array');
        assert(gold.length === 4, 'Gold should have 4 components (RGBA)');
        assert(gold[0] === 1.0, 'Gold red should be 1.0');
        assert(gold[1] === 0.84, 'Gold green should be 0.84');
        assert(gold[2] === 0.0, 'Gold blue should be 0.0');
        assert(gold[3] === 1.0, 'Gold alpha should be 1.0');
        testResults.push({ group: 'Gold Material', passed: true });
    } catch (e) {
        assert(false, 'Gold material failed: ' + e.message);
    }

    // Test 5: Material palette colors - steel
    console.log('\nTest 5: Material palette colors - steel');
    try {
        const filter = new NeuralCityFilter();
        const steel = filter.getMaterialColor('steel');
        assert(Array.isArray(steel), 'Steel should be an array');
        assert(steel.length === 4, 'Steel should have 4 components (RGBA)');
        assert(Math.abs(steel[0] - 0.69) < 0.01, 'Steel red should be ~0.69');
        assert(Math.abs(steel[1] - 0.75) < 0.01, 'Steel green should be ~0.75');
        assert(Math.abs(steel[2] - 0.77) < 0.01, 'Steel blue should be ~0.77');
        assert(steel[3] === 1.0, 'Steel alpha should be 1.0');
        testResults.push({ group: 'Steel Material', passed: true });
    } catch (e) {
        assert(false, 'Steel material failed: ' + e.message);
    }

    // Test 6: Material palette colors - rust
    console.log('\nTest 6: Material palette colors - rust');
    try {
        const filter = new NeuralCityFilter();
        const rust = filter.getMaterialColor('rust');
        assert(Array.isArray(rust), 'Rust should be an array');
        assert(rust.length === 4, 'Rust should have 4 components (RGBA)');
        assert(Math.abs(rust[0] - 0.72) < 0.01, 'Rust red should be ~0.72');
        assert(Math.abs(rust[1] - 0.45) < 0.01, 'Rust green should be ~0.45');
        assert(Math.abs(rust[2] - 0.20) < 0.01, 'Rust blue should be ~0.20');
        assert(rust[3] === 1.0, 'Rust alpha should be 1.0');
        testResults.push({ group: 'Rust Material', passed: true });
    } catch (e) {
        assert(false, 'Rust material failed: ' + e.message);
    }

    // Test 7: Material palette colors - dust
    console.log('\nTest 7: Material palette colors - dust');
    try {
        const filter = new NeuralCityFilter();
        const dust = filter.getMaterialColor('dust');
        assert(Array.isArray(dust), 'Dust should be an array');
        assert(dust.length === 4, 'Dust should have 4 components (RGBA)');
        assert(Math.abs(dust[0] - 0.66) < 0.01, 'Dust red should be ~0.66');
        assert(Math.abs(dust[1] - 0.66) < 0.01, 'Dust green should be ~0.66');
        assert(Math.abs(dust[2] - 0.66) < 0.01, 'Dust blue should be ~0.66');
        assert(dust[3] === 1.0, 'Dust alpha should be 1.0');
        testResults.push({ group: 'Dust Material', passed: true });
    } catch (e) {
        assert(false, 'Dust material failed: ' + e.message);
    }

    // Test 8: getFilter returns PIXI.Filter-compatible object
    console.log('\nTest 8: getFilter returns PIXI.Filter-compatible object');
    try {
        const filter = new NeuralCityFilter();
        const pixiFilter = filter.getFilter();
        assert(pixiFilter !== null, 'getFilter should return an object');
        assert(pixiFilter.uniforms !== undefined, 'Filter should have uniforms property');
        assert(pixiFilter.uniforms === filter.uniforms, 'Filter uniforms should reference filter instance uniforms');
        testResults.push({ group: 'Get Filter', passed: true });
    } catch (e) {
        assert(false, 'getFilter failed: ' + e.message);
    }

    // Summary
    console.log('\n=== Test Summary ===');
    const passed = testResults.filter(r => r.passed).length;
    const total = testResults.length;
    console.log('Passed: ' + passed + '/' + total);

    if (passed === total) {
        console.log('\nAll tests passed!');
    } else {
        console.log('\nSome tests failed.');
    }

    return { passed, total, results: testResults };
}

// Run tests if executed directly
if (typeof require !== 'undefined' && require.main === module) {
    runTests().then(function(result) {
        process.exit(result.passed === result.total ? 0 : 1);
    }).catch(function(err) {
        console.error('Test runner error:', err);
        process.exit(1);
    });
}

// Export for browser
if (typeof window !== 'undefined') {
    window.runNeuralCityFilterTests = runTests;
}

// ============================================
// Task 3: MutationPulse Tests
// ============================================

async function runMutationPulseTests() {
    console.log('\n=== MutationPulse Test Suite ===\n');

    // Test 1: should have mutation pulse uniform
    console.log('Test 1: should have mutation pulse uniform');
    try {
        const filter = new NeuralCityFilter();
        assert(filter.uniforms.uMutationPulse !== undefined, 'uMutationPulse should be defined');
        assert(filter.uniforms.uMutationPulse === 0, 'uMutationPulse should be 0 initially');
        assert(filter.uniforms.uMutationFocusX !== undefined, 'uMutationFocusX should be defined');
        assert(filter.uniforms.uMutationFocusY !== undefined, 'uMutationFocusY should be defined');
        assert(filter.uniforms.uDistrictUpgrade !== undefined, 'uDistrictUpgrade should be defined');
        assert(filter.uniforms.uMutationScale !== undefined, 'uMutationScale should be defined');
        testResults.push({ group: 'MutationPulse Uniforms', passed: true });
    } catch (e) {
        assert(false, 'Mutation pulse uniform test failed: ' + e.message);
    }

    // Test 2: should trigger mutation pulse
    console.log('\nTest 2: should trigger mutation pulse');
    try {
        const filter = new NeuralCityFilter();
        filter.triggerMutation(0.5, 0.3);

        assert(filter.uniforms.uMutationPulse > 0, 'uMutationPulse should be greater than 0');
        assert(filter.uniforms.uMutationFocusX === 0.5, 'uMutationFocusX should be 0.5');
        assert(filter.uniforms.uMutationFocusY === 0.3, 'uMutationFocusY should be 0.3');
        assert(filter.uniforms.uMutationScale > 1.0, 'uMutationScale should increase during morph');
        testResults.push({ group: 'Trigger Mutation', passed: true });
    } catch (e) {
        assert(false, 'Trigger mutation test failed: ' + e.message);
    }

    // Test 3: should decay mutation pulse over time
    console.log('\nTest 3: should decay mutation pulse over time');
    try {
        const filter = new NeuralCityFilter();
        filter.triggerMutation(0.5, 0.5);
        const initialPulse = filter.uniforms.uMutationPulse;

        // Simulate 3 frames of 16ms each
        filter.update(16);
        filter.update(16);
        filter.update(16);

        assert(filter.uniforms.uMutationPulse < initialPulse, 'uMutationPulse should decay over time');
        testResults.push({ group: 'Mutation Decay', passed: true });
    } catch (e) {
        assert(false, 'Mutation decay test failed: ' + e.message);
    }

    // Test 4: should set district upgrade animation
    console.log('\nTest 4: should set district upgrade animation');
    try {
        const filter = new NeuralCityFilter();
        filter.startDistrictUpgrade('5_12', 'rust', 'gold');

        assert(filter.uniforms.uDistrictUpgrade === 1, 'uDistrictUpgrade should be 1');
        assert(Array.isArray(filter.uniforms.uUpgradeFrom), 'uUpgradeFrom should be an array');
        assert(Array.isArray(filter.uniforms.uUpgradeTo), 'uUpgradeTo should be an array');
        assert(filter.uniforms.uUpgradeFrom.length === 4, 'uUpgradeFrom should have 4 components');
        assert(filter.uniforms.uUpgradeTo.length === 4, 'uUpgradeTo should have 4 components');
        // Verify the colors match materials
        assert(filter.uniforms.uUpgradeFrom[0] > 0.7, 'Rust red should be ~0.72');
        assert(filter.uniforms.uUpgradeTo[0] === 1.0, 'Gold red should be 1.0');
        testResults.push({ group: 'District Upgrade', passed: true });
    } catch (e) {
        assert(false, 'District upgrade test failed: ' + e.message);
    }

    // Test 5: should decay mutation scale back to normal
    console.log('\nTest 5: should decay mutation scale back to normal');
    try {
        const filter = new NeuralCityFilter();
        filter.triggerMutation(0.5, 0.5);
        assert(filter.uniforms.uMutationScale > 1.0, 'Initial scale should be > 1.0');

        // Simulate many frames to get scale back to normal
        for (let i = 0; i < 30; i++) {
            filter.update(16);
        }

        assert(filter.uniforms.uMutationScale === 1.0, 'Scale should return to 1.0');
        testResults.push({ group: 'Scale Decay', passed: true });
    } catch (e) {
        assert(false, 'Scale decay test failed: ' + e.message);
    }

    // Summary for mutation tests
    const mutationTests = testResults.filter(r => r.group && r.group.includes('Mutation'));
    return mutationTests;
}

// Combined test runner
async function runAllTests() {
    await runTests();
    await runMutationPulseTests();

    console.log('\n=== Combined Test Summary ===');
    const passed = testResults.filter(r => r.passed).length;
    const total = testResults.length;
    console.log('Passed: ' + passed + '/' + total);

    if (passed === total) {
        console.log('\nAll tests passed!');
    } else {
        console.log('\nSome tests failed.');
    }

    return { passed, total, results: testResults };
}

// Run combined tests if executed directly
if (typeof require !== 'undefined' && require.main === module) {
    runAllTests().then(function(result) {
        process.exit(result.passed === result.total ? 0 : 1);
    }).catch(function(err) {
        console.error('Test runner error:', err);
        process.exit(1);
    });
}
