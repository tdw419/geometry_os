/**
 * Tests for NeuralCityEngine THOUGHT_PULSE Integration.
 * Verifies that THOUGHT_PULSE WebSocket messages are routed to ThoughtVisualizer.
 */

const assert = require('node:assert');
const test = require('node:test');

// Mock requestAnimationFrame for Node.js
global.requestAnimationFrame = (callback) => setTimeout(callback, 16);

// Mock PIXI before importing
global.PIXI = {
    Graphics: class Graphics {
        constructor() {
            this.alpha = 1.0;
            this.x = 0;
            this.y = 0;
            this.scale = { set: () => {} };
        }
        circle() { return this; }
        rect() { return this; }
        fill() { return this; }
        stroke() { return this; }
        clear() { return this; }
        moveTo() { return this; }
        lineTo() { return this; }
        destroy() {}
    },
    Container: class Container {
        constructor() {
            this.children = [];
        }
        addChild(child) { this.children.push(child); }
        removeChild(child) {
            const idx = this.children.indexOf(child);
            if (idx >= 0) this.children.splice(idx, 1);
        }
    }
};

// Mock window for NeuralCityEngine URL construction
if (typeof global.window === 'undefined') {
    global.window = {
        location: { hostname: 'localhost' }
    };
}

// Mock dependencies that NeuralCityEngine expects
global.TelemetryBus = class TelemetryBus {
    constructor(url) {
        this.url = url;
        this.connected = false;
    }
    async connect() { this.connected = true; }
    disconnect() { this.connected = false; }
    isConnected() { return this.connected; }
    subscribe() {}
    emit() {}
};

global.CityOrchestrator = class CityOrchestrator {
    constructor(config) {
        this.buildings = new Map();
        this.bridges = [];
        this.districtPulses = new Map();
    }
    getBuilding() { return null; }
    getBridges() { return []; }
    getDistrictState() { return { pulse: 0 }; }
};

global.InstancedCityMesh = class InstancedCityMesh {
    constructor(app) {
        this.container = new global.PIXI.Container();
    }
    tick(dt, time, camera) {}
};

// Mock ThoughtVisualizer
global.ThoughtVisualizer = class ThoughtVisualizer {
    constructor(app, container) {
        this.app = app;
        this.container = container;
        this.glyphs = [];
    }
    emitThoughtPulse(data) {
        this.glyphs.push(data);
    }
    get count() {
        return this.glyphs.length;
    }
};

test('NeuralCityEngine should have ThoughtVisualizer instance after start', async () => {
    const NeuralCityEngine = require('../js/NeuralCityEngine.js');

    const mockApp = {
        stage: {
            addChild: () => {},
            removeChild: () => {}
        },
        ticker: { add: () => {} }
    };

    const engine = new NeuralCityEngine({ app: mockApp });

    // Before start, thoughtVisualizer is null
    assert.strictEqual(engine.thoughtVisualizer, null);

    // After start, it should be initialized
    await engine.start();

    assert.ok(engine.thoughtVisualizer, 'Engine should have thoughtVisualizer property after start()');
    assert.strictEqual(engine.thoughtVisualizer.count, 0, 'ThoughtVisualizer should start with 0 glyphs');
});

test('NeuralCityEngine._handleThoughtPulse should forward to ThoughtVisualizer', async () => {
    // Clear require cache to get fresh instance
    delete require.cache[require.resolve('../js/NeuralCityEngine.js')];
    const NeuralCityEngine = require('../js/NeuralCityEngine.js');

    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };

    const engine = new NeuralCityEngine({ app: mockApp });
    await engine.start();

    const message = {
        type: 'THOUGHT_PULSE',
        token_id: 15496,
        x: 100,
        y: 100,
        intensity: 0.8
    };

    // Call handler
    engine._handleThoughtPulse(message);

    // Verify glyph was created
    assert.strictEqual(engine.thoughtVisualizer.count, 1,
        'ThoughtVisualizer should have one glyph after _handleThoughtPulse');
    assert.strictEqual(engine.thoughtVisualizer.glyphs[0].token_id, 15496,
        'Glyph should have correct token_id');
});

test('NeuralCityEngine.handleFFIResponse should route THOUGHT_PULSE to visualizer', async () => {
    // Clear require cache
    delete require.cache[require.resolve('../js/NeuralCityEngine.js')];
    const NeuralCityEngine = require('../js/NeuralCityEngine.js');

    const mockApp = {
        stage: { addChild: () => {}, removeChild: () => {} },
        ticker: { add: () => {} }
    };

    const engine = new NeuralCityEngine({ app: mockApp });
    await engine.start();

    // Simulate FFI Bridge response with THOUGHT_PULSE
    const thoughtPulseResponse = {
        type: 'THOUGHT_PULSE',
        token_id: 0,
        x: 50,
        y: 50,
        intensity: 1.0
    };

    // Call handleFFIResponse
    engine.handleFFIResponse(thoughtPulseResponse);

    // Verify glyph was created
    assert.strictEqual(engine.thoughtVisualizer.count, 1,
        'ThoughtVisualizer should have one glyph after handleFFIResponse with THOUGHT_PULSE');
});

test('NeuralCityEngine._handleThoughtPulse should be safe when visualizer not initialized', async () => {
    // Clear require cache
    delete require.cache[require.resolve('../js/NeuralCityEngine.js')];
    const NeuralCityEngine = require('../js/NeuralCityEngine.js');

    const engine = new NeuralCityEngine({ app: null }); // No app, so ThoughtVisualizer won't initialize

    // This should not throw
    assert.doesNotThrow(() => {
        engine._handleThoughtPulse({
            type: 'THOUGHT_PULSE',
            token_id: 1,
            x: 0,
            y: 0,
            intensity: 1.0
        });
    }, '_handleThoughtPulse should not throw when thoughtVisualizer is null');
});
