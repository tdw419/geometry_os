/**
 * Tests for PerformanceHUD - On-screen performance profiler
 *
 * Phase 47 Improvements - Task 5.2: Performance Profiling HUD
 */

const { PerformanceHUD } = require('../perf_hud.js');

// Mock DOM for Node.js
global.document = {
    createElement: (tag) => {
        const el = {
            style: { cssText: '' },
            innerHTML: '',
            textContent: '',
            appendChild: () => {},
            querySelector: () => null
        };
        if (tag === 'canvas') {
            el.width = 200;
            el.height = 60;
            el.getContext = () => ({
                fillStyle: '',
                fillRect: () => {},
                strokeStyle: '',
                lineWidth: 0,
                beginPath: () => {},
                moveTo: () => {},
                lineTo: () => {},
                stroke: () => {}
            });
        }
        return el;
    },
    body: {
        appendChild: () => {}
    }
};

global.performance = {
    now: () => Date.now(),
    memory: {
        usedJSHeapSize: 50 * 1024 * 1024,
        totalJSHeapSize: 60 * 1024 * 1024,
        jsHeapSizeLimit: 100 * 1024 * 1024
    }
};

describe('PerformanceHUD', () => {
    let hud;

    beforeEach(() => {
        hud = new PerformanceHUD({
            enabled: false,
            updateInterval: 100
        });
    });

    afterEach(() => {
        hud.destroy();
    });

    test('should initialize with default config', () => {
        expect(hud.config.enabled).toBe(false);
        expect(hud.config.showFPS).toBe(true);
        expect(hud.config.showFrameTime).toBe(true);
    });

    test('should toggle visibility', () => {
        expect(hud.config.enabled).toBe(false);
        hud.toggle();
        expect(hud.config.enabled).toBe(true);
        hud.toggle();
        expect(hud.config.enabled).toBe(false);
    });

    test('should record frame times', () => {
        hud.recordFrame({ saccade: 1, lod: 2, prefetch: 1, render: 8 });

        expect(hud.frames.length).toBe(1);
        expect(hud.breakdown.saccade).toBe(1);
        expect(hud.breakdown.lod).toBe(2);
    });

    test('should calculate FPS', () => {
        // Simulate 60 FPS (16.67ms per frame)
        for (let i = 0; i < 10; i++) {
            hud.recordFrame({});
        }

        const metrics = hud.getMetrics();
        expect(metrics.fps).toBeGreaterThan(0);
    });

    test('should calculate average frame time', () => {
        hud.recordFrame({ saccade: 5, lod: 3, prefetch: 2, render: 10 });
        hud.recordFrame({ saccade: 5, lod: 3, prefetch: 2, render: 10 });

        const avgFrameTime = hud._getAverageFrameTime();
        expect(avgFrameTime).toBeGreaterThan(0);
    });

    test('should get memory usage', () => {
        const memory = hud._getMemoryUsage();
        expect(memory.usedMB).not.toBe('--');
        expect(memory.limitMB).not.toBe('--');
        expect(parseFloat(memory.usedMB)).toBeGreaterThan(0);
    });

    test('should update breakdown values', () => {
        hud.setBreakdown({ saccade: 2.5, lod: 1.8 });

        expect(hud.breakdown.saccade).toBe(2.5);
        expect(hud.breakdown.lod).toBe(1.8);
    });

    test('should calculate "other" time', () => {
        hud.recordFrame({ saccade: 5, lod: 3, prefetch: 1, render: 8 });

        // Other time = frame time - sum of known breakdowns
        expect(hud.breakdown.other).toBeGreaterThanOrEqual(0);
    });

    test('should return metrics', () => {
        hud.recordFrame({ saccade: 1, lod: 2, prefetch: 1, render: 8 });

        const metrics = hud.getMetrics();
        expect(metrics).toHaveProperty('fps');
        expect(metrics).toHaveProperty('avgFrameTime');
        expect(metrics).toHaveProperty('memory');
        expect(metrics).toHaveProperty('breakdown');
    });

    test('should limit frame history', () => {
        const smallHud = new PerformanceHUD({
            historyLength: 1,  // 1 second
            updateInterval: 1000
        });

        // Add many frames
        for (let i = 0; i < 1000; i++) {
            smallHud.recordFrame({});
        }

        // History should be limited
        expect(smallHud.frames.length).toBeLessThan(100);

        smallHud.destroy();
    });

    test('should track memory history', () => {
        hud.recordFrame({});
        hud.recordFrame({});

        expect(hud.memoryHistory.length).toBe(2);
        expect(hud.memoryHistory[0]).toHaveProperty('usedMB');
    });
});

// Run tests if executed directly
if (require.main === module) {
    console.log('Running PerformanceHUD tests...');
    const tests = require('jest');
    tests.run();
}
