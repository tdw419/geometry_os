/**
 * Tests for MetabolismDashboard - V13 Metabolism Visualization
 */

// Mock PIXI if not available
if (typeof PIXI === 'undefined') {
    global.PIXI = {
        Container: class Container {
            constructor() { this.children = []; this.visible = true; this.zIndex = 0; this.x = 0; this.y = 0; }
            addChild(child) { this.children.push(child); }
            removeChild(child) { }
            destroy() { }
        },
        Graphics: class Graphics {
            constructor() { this.children = []; this.x = 0; this.y = 0; }
            beginFill() { return this; }
            endFill() { return this; }
            lineStyle() { return this; }
            drawRoundedRect() { return this; }
            drawCircle() { return this; }
            clear() { return this; }
            arc() { return this; }
            addChild(child) { this.children.push(child); }
        },
        Text: class Text {
            constructor(text, style) {
                this.text = text;
                this.style = style || {};
                this.style.fill = style?.fill || 0xFFFFFF;
                this.anchor = { set: () => {} };
                this.x = 0;
                this.y = 0;
            }
            destroy() { }
        }
    };
}

// Mock EvolutionSafetyBridge
if (typeof window === 'undefined') {
    global.window = {};
}

window.EvolutionSafetyBridge = {
    getMetabolism: async () => ({
        cpu_percent: 45.5,
        memory_available_mb: 1200,
        throttle_level: 'none'
    }),
    predictHealth: async () => ({
        health_score: 0.95,
        recommended_action: 'none'
    })
};

// Load the module
const { MetabolismDashboard } = require('../metabolism_dashboard.js');

// Also make it available globally for tests
global.MetabolismDashboard = MetabolismDashboard;

let testsPassed = 0;
let testsFailed = 0;

function test(name, fn) {
    try {
        fn();
        console.log(`PASS: ${name}`);
        testsPassed++;
    } catch (e) {
        console.log(`FAIL: ${name} - ${e.message}`);
        testsFailed++;
    }
}

function assertEqual(actual, expected, message = '') {
    if (actual !== expected) {
        throw new Error(`${message} Expected ${expected}, got ${actual}`);
    }
}

function assertTrue(condition, message = '') {
    if (!condition) {
        throw new Error(message || 'Assertion failed');
    }
}

// TEST 1: Module exists
test('test_module_exists', () => {
    assertTrue(typeof MetabolismDashboard !== 'undefined', 'MetabolismDashboard should be defined');
});

// TEST 2: Can instantiate
test('test_instantiation', () => {
    const dashboard = new MetabolismDashboard({
        safetyBridge: window.EvolutionSafetyBridge
    });
    assertTrue(dashboard !== null, 'Dashboard should be instantiable');
});

// TEST 3: Creates container
test('test_create_container', () => {
    const dashboard = new MetabolismDashboard({
        safetyBridge: window.EvolutionSafetyBridge
    });
    const container = dashboard.create();
    assertTrue(container instanceof PIXI.Container, 'Should return PIXI.Container');
});

// TEST 4: Has update method
test('test_has_update_method', () => {
    const dashboard = new MetabolismDashboard({
        safetyBridge: window.EvolutionSafetyBridge
    });
    assertTrue(typeof dashboard.update === 'function', 'Should have update method');
});

// TEST 5: Has destroy method
test('test_has_destroy_method', () => {
    const dashboard = new MetabolismDashboard({
        safetyBridge: window.EvolutionSafetyBridge
    });
    assertTrue(typeof dashboard.destroy === 'function', 'Should have destroy method');
});

// TEST 6: Handles missing safetyBridge gracefully
test('test_handles_missing_bridge', () => {
    const dashboard = new MetabolismDashboard({});
    assertTrue(dashboard.safetyBridge === null, 'Should set safetyBridge to null');
});

// TEST 7: Poll interval configurable
test('test_poll_interval_configurable', () => {
    const dashboard = new MetabolismDashboard({
        safetyBridge: window.EvolutionSafetyBridge,
        pollInterval: 1000
    });
    assertEqual(dashboard.options.pollInterval, 1000, 'Poll interval should be configurable');
});

// TEST 8: Default poll interval
test('test_default_poll_interval', () => {
    const dashboard = new MetabolismDashboard({
        safetyBridge: window.EvolutionSafetyBridge
    });
    assertEqual(dashboard.options.pollInterval, 3000, 'Default poll interval should be 3000ms');
});

// Summary
console.log(`\n${testsPassed} passed, ${testsFailed} failed`);
if (typeof process !== 'undefined') {
    process.exit(testsFailed > 0 ? 1 : 0);
}
