/**
 * Phase 7: Test Runner for Pixel CPU - PixiJS Integration
 *
 * Comprehensive test runner that mocks browser environment for Node.js testing.
 */

// Mock browser environment
global.document = {
    createElement: function (tag) {
        return {
            width: 0,
            height: 0,
            getContext: function () {
                return {
                    fillStyle: '#000000',
                    fillRect: function () { },
                    createImageData: function () {
                        return { data: new Uint8ClampedArray(0) };
                    }
                };
            }
        };
    }
};

global.performance = {
    now: function () {
        return Date.now();
    }
};

// Mock PIXI
global.PIXI = {
    Texture: {
        from: function (canvas) {
            return {
                update: function () { },
                destroy: function () { }
            };
        }
    },
    Sprite: function (texture) {
        return {
            x: 0,
            y: 0,
            width: 0,
            height: 0,
            zIndex: 0,
            texture: texture
        };
    },
    Container: function () {
        return {
            x: 0,
            y: 0,
            zIndex: 0,
            addChild: function (child) { },
            removeChild: function (child) { }
        };
    },
    Text: function (text, style) {
        return {
            text: text,
            style: style || {},
            x: 0,
            y: 0
        };
    },
    Graphics: function () {
        return {
            beginFill: function () { return this; },
            endFill: function () { return this; },
            lineStyle: function () { return this; },
            drawRect: function () { return this; },
            drawRoundedRect: function () { return this; },
            clear: function () { return this; }
        };
    }
};

// Load required modules
const SimplePixelCPU = require('./pixel_cpu.js');
const PixelCPUIntegration = require('./pixel_cpu_integration.js');

// Create mock infiniteMap that returns PIXI objects
const mockInfiniteMap = {
    world: {
        addChild: function (child) { },
        removeChild: function (child) { },
        children: []
    }
};

// Import test suites
const unitTests = require('./test_pixel_cpu_integration_unit.js');

/**
 * Run all tests
 */
async function runAllTests() {
    console.log('\n========================================');
    console.log('Phase 7: Complete Test Suite');
    console.log('Pixel CPU - PixiJS Integration');
    console.log('========================================\n');

    let allPassed = true;

    // Run unit tests
    console.log('Running Unit Tests...\n');
    try {
        const unitResult = unitTests.runAllUnitTests();
        if (!unitResult) {
            allPassed = false;
        }
    } catch (error) {
        console.error('\n✗ Unit tests failed with error:', error.message);
        console.error(error.stack);
        allPassed = false;
    }

    // Summary
    console.log('\n========================================');
    if (allPassed) {
        console.log('✓ All tests passed!');
        console.log('========================================\n');
        process.exit(0);
    } else {
        console.log('✗ Some tests failed');
        console.log('========================================\n');
        process.exit(1);
    }
}

// Run tests if executed directly
if (require.main === module) {
    runAllTests().catch(error => {
        console.error('Test runner failed:', error);
        process.exit(1);
    });
}

module.exports = {
    runAllTests
};
