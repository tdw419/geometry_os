/**
 * Test Runner for VLM Health Heatmap
 *
 * Simple Node.js test runner that mocks DOM environment
 * and runs VLMHealthHeatmapTests.
 */

// Mock DOM environment
global.document = {
    createElement: function(tag) {
        return {
            tagName: tag,
            id: null,
            className: '',
            style: {},
            childNodes: [],
            appendChild: function(child) { this.childNodes.push(child); },
            removeChild: function(child) {
                this.childNodes = this.childNodes.filter(c => c !== child);
            },
            getContext: function() {
                return {
                    fillStyle: '#000000',
                    fillRect: function() {},
                    strokeRect: function() {},
                    clearRect: function() {},
                    fillText: function() {},
                    measureText: function(text) { return { width: text.length * 8 }; },
                    beginPath: function() {},
                    moveTo: function() {},
                    lineTo: function() {},
                    stroke: function() {},
                    fill: function() {},
                    arc: function() {},
                    createLinearGradient: function() {
                        return {
                            addColorStop: function() {}
                        };
                    },
                    roundRect: function() { return this; }
                };
            },
            width: 800,
            height: 600,
            addEventListener: function() {},
            removeEventListener: function() {},
            getBoundingClientRect: function() {
                return { left: 0, top: 0 };
            }
        };
    },
    getElementById: function(id) {
        const el = this.createElement('div');
        el.id = id;
        return el;
    },
    body: {
        appendChild: function(child) {},
        removeChild: function(child) {}
    }
};

// Load the VLMHealthHeatmap class
const VLMHealthHeatmap = require('./vlm_health_heatmap.js');
global.VLMHealthHeatmap = VLMHealthHeatmap.default || VLMHealthHeatmap;

// Load the test class
const VLMHealthHeatmapTests = require('./tests/test_vlm_health_heatmap.js');
const TestClass = VLMHealthHeatmapTests.VLMHealthHeatmapTests || VLMHealthHeatmapTests.default || VLMHealthHeatmapTests;

// Run tests
async function runTests() {
    console.log('='.repeat(60));
    console.log('VLM Health Heatmap Tests');
    console.log('='.repeat(60));
    console.log();

    const tests = new TestClass();
    const results = await tests.runAll();

    console.log('Test Results:');
    console.log('-'.repeat(40));
    for (const test of results.tests) {
        const status = test.passed > 0 ? '✓ PASS' : '✗ FAIL';
        console.log(`${status}: ${test.name} - ${test.message}`);
    }

    console.log();
    console.log('Summary:');
    console.log(`  Total:  ${results.total}`);
    console.log(`  Passed: ${results.passed}`);
    console.log(`  Failed: ${results.failed}`);
    console.log();

    if (results.failed === 0) {
        console.log('All tests passed! ✓');
        process.exit(0);
    } else {
        console.log('Some tests failed! ✗');
        process.exit(1);
    }
}

runTests().catch(err => {
    console.error('Test runner error:', err);
    process.exit(1);
});
