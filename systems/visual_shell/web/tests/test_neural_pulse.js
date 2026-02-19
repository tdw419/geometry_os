/**
 * Tests for NeuralPulseSystem
 *
 * Run with: node test_neural_pulse.js
 * Or in browser: Open test_neural_pulse.html
 */

// Mock PIXI for Node.js testing
class MockGraphics {
    constructor() {
        this.children = [];
        this.destroyed = false;
    }
    clear() {}
    lineStyle() {}
    moveTo() {}
    lineTo() {}
    beginFill() {}
    endFill() {}
    drawCircle() {}
    destroy() {
        this.destroyed = true;
    }
}

class MockContainer {
    constructor() {
        this.children = [];
    }
    addChild(child) {
        this.children.push(child);
    }
    destroy() {}
}

const MockPIXI = {
    Container: MockContainer,
    Graphics: MockGraphics
};

// Create a mock PIXI app with stage
function createMockApp() {
    return {
        stage: new MockContainer()
    };
}

// Mock Building class
class MockBuilding {
    constructor(id, x, y, options = {}) {
        this.id = id;
        this.x = x;
        this.y = y;
        this.width = options.width || 64;
        this.height = options.height || 64;
    }
}

// Mock BuildingOrchestrator
class MockOrchestrator {
    constructor() {
        this.buildings = new Map();
    }

    spawnBuilding(id, type, options) {
        const x = options.x !== undefined ? options.x : 100;
        const y = options.y !== undefined ? options.y : 100;
        const building = new MockBuilding(id, x, y, options);
        this.buildings.set(id, building);
        return building;
    }

    getBuilding(id) {
        return this.buildings.get(id);
    }
}

// Mock TelemetryBus
class MockTelemetryBus {
    constructor() {
        this.listeners = new Map();
        this.eventsEmitted = [];
    }

    on(event, callback) {
        if (!this.listeners.has(event)) {
            this.listeners.set(event, []);
        }
        this.listeners.get(event).push(callback);
    }

    addEventListener(event, callback) {
        this.on(event, callback);
    }

    emit(event, data) {
        this.eventsEmitted.push({ event, data });
        const callbacks = this.listeners.get(event);
        if (callbacks) {
            callbacks.forEach(cb => cb(data));
        }
    }

    dispatchEvent(event, data) {
        this.emit(event, { detail: data });
    }
}

// Setup for testing
let NeuralPulseSystem, NeuralPulse, PulseEventType, PulseColors;
let testResults = [];
let assert;

if (typeof require !== 'undefined') {
    // Node.js environment
    global.PIXI = MockPIXI;

    const fs = require('fs');
    const path = require('path');

    // Load NeuralPulseSystem
    const code = fs.readFileSync(path.join(__dirname, '../js/NeuralPulseSystem.js'), 'utf8');
    const func = new Function('module', 'exports', 'global', 'PIXI', code);
    const mod = { exports: {} };
    func(mod, mod.exports, global, MockPIXI);

    NeuralPulseSystem = global.NeuralPulseSystem || mod.exports.NeuralPulseSystem;
    NeuralPulse = global.NeuralPulse || mod.exports.NeuralPulse;
    PulseEventType = global.PulseEventType || mod.exports.PulseEventType;
    PulseColors = global.PulseColors || mod.exports.PulseColors;

    assert = (condition, message) => {
        testResults.push({ passed: condition, message });
        if (!condition) {
            console.log(`  FAIL: ${message}`);
        } else {
            console.log(`  PASS: ${message}`);
        }
    };
} else {
    // Browser environment
    NeuralPulseSystem = window.NeuralPulseSystem;
    NeuralPulse = window.NeuralPulse;
    PulseEventType = window.PulseEventType;
    PulseColors = window.PulseColors;

    assert = (condition, message) => {
        testResults.push({ passed: condition, message });
        const li = document.createElement('li');
        li.className = condition ? 'pass' : 'fail';
        li.textContent = `${condition ? 'PASS' : 'FAIL'}: ${message}`;
        document.getElementById('results').appendChild(li);
    };
}

// Test utilities
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

// ===========================================
// TEST SUITE
// ===========================================

async function runTests() {
    console.log('\n=== NeuralPulseSystem Test Suite ===\n');

    // Test 1: test_create_pulse_system_with_color_mapping
    console.log('Test 1: test_create_pulse_system_with_color_mapping');
    try {
        const system = new NeuralPulseSystem({ app: createMockApp() });

        assert(system !== null, 'NeuralPulseSystem should be created');
        assert(system.eventColors !== null, 'Event colors should be defined');

        // Verify color mapping
        const cyanColor = system.getColorForEvent(PulseEventType.CODE_DISCOVERY);
        assert(cyanColor.hex === 0x00FFFF, 'CODE_DISCOVERY should be cyan (0x00FFFF)');

        const orangeColor = system.getColorForEvent(PulseEventType.RESOURCE_PRESSURE);
        assert(orangeColor.hex === 0xFFA500, 'RESOURCE_PRESSURE should be orange (0xFFA500)');

        const violetColor = system.getColorForEvent(PulseEventType.DISTRICT_SYNC);
        assert(violetColor.hex === 0x9400D3, 'DISTRICT_SYNC should be violet (0x9400D3)');

        testResults.push({ group: 'Color Mapping', passed: true });
    } catch (e) {
        assert(false, `Color mapping test failed: ${e.message}`);
    }

    // Test 2: test_create_pulse_between_buildings
    console.log('\nTest 2: test_create_pulse_between_buildings');
    try {
        const orchestrator = new MockOrchestrator();
        orchestrator.spawnBuilding('building-a', 'compute', { x: 100, y: 100 });
        orchestrator.spawnBuilding('building-b', 'memory', { x: 300, y: 200 });

        const system = new NeuralPulseSystem({
            app: createMockApp(),
            orchestrator: orchestrator
        });

        const pulse = system.createPulse('building-a', 'building-b', PulseEventType.CODE_DISCOVERY, {
            confidence: 0.9
        });

        assert(pulse !== null, 'Pulse should be created');
        assert(pulse.fromTileId === 'building-a', 'Pulse should have correct source');
        assert(pulse.toTileId === 'building-b', 'Pulse should have correct target');
        assert(pulse.eventType === PulseEventType.CODE_DISCOVERY, 'Pulse should have correct event type');
        assert(pulse.confidence === 0.9, 'Pulse should have correct confidence');

        // Verify position resolution
        assert(pulse.startPos.x === 132, 'Start X should be center of building-a (100 + 64/2)');
        assert(pulse.startPos.y === 132, 'Start Y should be center of building-a (100 + 64/2)');
        assert(pulse.endPos.x === 332, 'End X should be center of building-b (300 + 64/2)');
        assert(pulse.endPos.y === 232, 'End Y should be center of building-b (200 + 64/2)');

        testResults.push({ group: 'Create Pulse', passed: true });
    } catch (e) {
        assert(false, `Create pulse test failed: ${e.message}`);
    }

    // Test 3: test_animate_pulse_along_path
    console.log('\nTest 3: test_animate_pulse_along_path');
    try {
        const orchestrator = new MockOrchestrator();
        orchestrator.spawnBuilding('tile-1', 'compute', { x: 0, y: 0 });
        orchestrator.spawnBuilding('tile-2', 'memory', { x: 100, y: 0 });

        const system = new NeuralPulseSystem({
            app: createMockApp(),
            orchestrator: orchestrator
        });

        const pulse = system.createPulse('tile-1', 'tile-2', PulseEventType.DISTRICT_SYNC);

        // Initial state
        assert(pulse.progress === 0, 'Pulse should start at progress 0');
        assert(pulse.currentPos.x === pulse.startPos.x, 'Current X should be at start');
        assert(pulse.trail.length === 0, 'Trail should be empty initially');

        // Store start and end positions
        const startX = pulse.startPos.x;
        const endX = pulse.endPos.x;

        // Update multiple times to animate
        for (let i = 0; i < 10; i++) {
            pulse.update(16); // 16ms per frame - update pulse directly to avoid removal
        }

        assert(pulse.progress > 0, 'Pulse should have progressed');
        // Position should be between start and end (moved from start)
        assert(pulse.currentPos.x > startX, `Current X (${pulse.currentPos.x}) should have moved from start (${startX})`);
        assert(pulse.currentPos.x < endX, `Current X (${pulse.currentPos.x}) should not have reached end (${endX})`);
        assert(pulse.trail.length > 0, 'Trail should have points');

        // Verify trail fading
        const trailPoints = pulse.getTrailPoints();
        assert(trailPoints[0].alpha > trailPoints[trailPoints.length - 1].alpha,
            'Trail should fade (first point brighter than last)');

        testResults.push({ group: 'Animate Pulse', passed: true });
    } catch (e) {
        assert(false, `Animate pulse test failed: ${e.message}`);
    }

    // Test 4: test_remove_pulse_after_completion
    console.log('\nTest 4: test_remove_pulse_after_completion');
    try {
        const orchestrator = new MockOrchestrator();
        orchestrator.spawnBuilding('src', 'compute', { x: 0, y: 0 });
        orchestrator.spawnBuilding('dst', 'memory', { x: 200, y: 0 });

        const system = new NeuralPulseSystem({
            app: createMockApp(),
            orchestrator: orchestrator,
            defaultSpeed: 0.2 // Faster for test
        });

        const pulse = system.createPulse('src', 'dst', PulseEventType.RESOURCE_PRESSURE);
        const pulseId = pulse.id;

        assert(system.getActiveCount() === 1, 'Should have 1 active pulse');

        // Update until complete
        for (let i = 0; i < 20; i++) {
            system.update(16);
        }

        assert(pulse.completed === true, 'Pulse should be marked as completed');
        assert(system.getActiveCount() === 0, 'Pulse should be removed after completion');

        // Verify pulse is gone from system
        assert(system.getPulse(pulseId) === undefined, 'Pulse should not be retrievable after removal');

        testResults.push({ group: 'Remove Pulse', passed: true });
    } catch (e) {
        assert(false, `Remove pulse test failed: ${e.message}`);
    }

    // Test 5: test_handle_neural_event_telemetry
    console.log('\nTest 5: test_handle_neural_event_telemetry');
    try {
        const orchestrator = new MockOrchestrator();
        orchestrator.spawnBuilding('source-tile', 'compute', { x: 50, y: 50 });
        orchestrator.spawnBuilding('target-1', 'memory', { x: 150, y: 50 });
        orchestrator.spawnBuilding('target-2', 'memory', { x: 250, y: 50 });

        const telemetryBus = new MockTelemetryBus();

        const system = new NeuralPulseSystem({
            app: createMockApp(),
            orchestrator: orchestrator
        });

        // Connect to telemetry
        system.connectToTelemetry(telemetryBus);
        assert(system.connected === true, 'System should be connected to telemetry');

        // Emit neural_event
        telemetryBus.emit('neural_event', {
            sourceTileId: 'source-tile',
            targetTileIds: ['target-1', 'target-2'],
            eventType: 'CODE_DISCOVERY',
            confidence: 0.85
        });

        const countAfterNeuralEvent = system.getActiveCount();
        assert(countAfterNeuralEvent === 2, `Should create 2 pulses for 2 targets, got ${countAfterNeuralEvent}`);

        // Verify pulses have correct properties
        const pulses = Array.from(system.getAllPulses().values());
        const pulse1 = pulses.find(p => p.toTileId === 'target-1');
        const pulse2 = pulses.find(p => p.toTileId === 'target-2');

        assert(pulse1 !== undefined, 'Pulse to target-1 should exist');
        assert(pulse2 !== undefined, 'Pulse to target-2 should exist');
        assert(pulse1.eventType === PulseEventType.CODE_DISCOVERY, 'Event type should be mapped');
        assert(pulse1.confidence === 0.85, 'Confidence should be preserved');

        // Test memory_broadcast
        system.clearAll();

        telemetryBus.emit('memory_broadcast', {
            sourceTileId: 'source-tile',
            subscribers: ['target-1']
        });

        const countAfterBroadcast = system.getActiveCount();
        assert(countAfterBroadcast === 1, `Should create 1 pulse for memory_broadcast, got ${countAfterBroadcast}`);

        const broadcastPulses = Array.from(system.getAllPulses().values());
        const broadcastPulse = broadcastPulses[0];
        assert(broadcastPulse.eventType === PulseEventType.DISTRICT_SYNC,
            'memory_broadcast should use DISTRICT_SYNC event type');

        testResults.push({ group: 'Telemetry Integration', passed: true });
    } catch (e) {
        assert(false, `Telemetry test failed: ${e.message}`);
    }

    // Summary
    console.log('\n=== Test Summary ===');
    const passed = testResults.filter(r => r.passed).length;
    const total = testResults.length;
    console.log(`Passed: ${passed}/${total}`);

    if (passed === total) {
        console.log('\nAll tests passed!');
    } else {
        console.log('\nSome tests failed.');
    }

    return { passed, total, results: testResults };
}

// Run tests if executed directly
if (typeof require !== 'undefined' && require.main === module) {
    runTests().then(({ passed, total }) => {
        process.exit(passed === total ? 0 : 1);
    }).catch(err => {
        console.error('Test runner error:', err);
        process.exit(1);
    });
}

// Export for browser
if (typeof window !== 'undefined') {
    window.runNeuralPulseTests = runTests;
}
