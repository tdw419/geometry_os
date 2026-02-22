/**
 * Tests for SaccadeGPU - GPU-accelerated saccade calculations
 *
 * Phase 47 Improvements: GPU-Accelerated Saccade Calculations
 */

// Mock WebGPU for Node.js testing
class MockGPUBuffer {
    constructor(size) { this.size = size; this.data = new Float32Array(size / 4); }
    destroy() {}
}

class MockGPUDevice {
    createBuffer(opts) { return new MockGPUBuffer(opts.size); }
    createShaderModule(opts) { return {}; }
    createComputePipeline(opts) { return { getBindGroupLayout: () => ({}) }; }
    createBindGroup(opts) { return {}; }
    queue = {
        writeBuffer: () => {},
        submit: () => {}
    };
}

global.navigator = { gpu: { requestAdapter: async () => ({ requestDevice: async () => new MockGPUDevice() }) } };

const { SaccadeGPU } = require('../saccade_gpu.js');

describe('SaccadeGPU', () => {
    let gpu;

    beforeEach(() => {
        gpu = new SaccadeGPU({
            maxSaccades: 64,
            saccadeDuration: 0.150,
            settlingDuration: 0.200,
            saccadeThreshold: 100
        });
    });

    afterEach(() => {
        gpu.destroy();
    });

    test('should initialize with WebGPU', async () => {
        const result = await gpu.initialize();
        expect(result).toBe(true);
        expect(gpu.initialized).toBe(true);
    });

    test('should fall back to CPU when WebGPU unavailable', async () => {
        global.navigator.gpu = null;
        const fallbackGPU = new SaccadeGPU();
        await fallbackGPU.initialize();
        expect(fallbackGPU.useCPUFallback).toBe(true);
        fallbackGPU.destroy();
    });

    test('should trigger saccade when distance exceeds threshold', async () => {
        await gpu.initialize();
        gpu.setTarget(0, 0);
        gpu.updatePosition(0, 0);

        // Target far enough to trigger saccade
        gpu.setTarget(200, 200);

        const state = gpu.getState();
        expect(state.phase).toBe('saccade');
    });

    test('should not trigger saccade for small movements', async () => {
        await gpu.initialize();
        gpu.setTarget(0, 0);
        gpu.updatePosition(0, 0);

        // Target not far enough
        gpu.setTarget(50, 50);

        const state = gpu.getState();
        expect(state.phase).not.toBe('saccade');
    });

    test('should update position during continuous movement', async () => {
        await gpu.initialize();
        gpu.updatePosition(100, 100, 16);

        const state = gpu.getState();
        expect(state.position.x).toBe(100);
        expect(state.position.y).toBe(100);
    });

    test('should calculate velocity correctly', async () => {
        await gpu.initialize();
        gpu.updatePosition(0, 0, 16);
        gpu.updatePosition(100, 100, 16);

        const state = gpu.getState();
        // Velocity = distance / time * 1000
        // 100 pixels / 16ms * 1000 = 6250 pixels/second
        expect(state.velocity.magnitude).toBeGreaterThan(6000);
    });

    test('should track settling phase after saccade', async () => {
        await gpu.initialize();
        gpu.setTarget(0, 0);
        gpu.updatePosition(0, 0);
        gpu.setTarget(200, 200);

        // Update multiple times to complete saccade
        for (let i = 0; i < 20; i++) {
            await gpu.update(20);
        }

        const state = gpu.getState();
        // Should be in settling or fixation phase
        expect(['settling', 'fixation']).toContain(state.phase);
    });

    test('should report GPU metrics correctly', async () => {
        await gpu.initialize();
        const metrics = gpu.getMetrics();

        expect(metrics.usingGPU).toBe(!gpu.useCPUFallback);
        expect(metrics.initialized).toBe(true);
        expect(metrics.maxSaccades).toBe(64);
    });

    test('should handle callbacks for saccade events', async () => {
        await gpu.initialize();

        let saccadeStarted = false;
        let saccadeEnded = false;

        gpu.onSaccadeStart = () => { saccadeStarted = true; };
        gpu.onSaccadeEnd = () => { saccadeEnded = true; };

        gpu.setTarget(0, 0);
        gpu.updatePosition(0, 0);
        gpu.setTarget(200, 200);

        expect(saccadeStarted).toBe(true);
    });
});

// Run tests if executed directly
if (require.main === module) {
    console.log('Running SaccadeGPU tests...');
    const tests = require('jest');
    tests.run();
}
