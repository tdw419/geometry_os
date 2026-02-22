/**
 * Tests for DebugOverlayManager - Visual debugging tools
 *
 * Phase 47 Improvements - Task 5.1: Visual Debugging Tools
 */

const { DebugOverlayManager } = require('../debug_overlays.js');

// Mock DOM for Node.js
global.document = {
    createElement: (tag) => ({
        id: '',
        style: { cssText: '', display: '' },
        getContext: () => ({
            clearRect: () => {},
            strokeStyle: '',
            lineWidth: 0,
            globalAlpha: 1,
            beginPath: () => {},
            moveTo: () => {},
            lineTo: () => {},
            stroke: () => {},
            fillStyle: '',
            arc: () => {},
            fill: () => {},
            fillRect: () => {},
            createRadialGradient: () => ({
                addColorStop: () => {}
            })
        }),
        addEventListener: () => {},
        width: 0,
        height: 0
    }),
    body: {
        appendChild: () => {}
    }
};

global.window = {
    innerWidth: 1920,
    innerHeight: 1080,
    addEventListener: () => {}
};

describe('DebugOverlayManager', () => {
    let manager;

    beforeEach(() => {
        manager = new DebugOverlayManager({
            enabled: false,
            maxPathLength: 10
        });
    });

    afterEach(() => {
        manager.destroy();
    });

    test('should initialize with default config', () => {
        expect(manager.config.enabled).toBe(false);
        expect(manager.config.showSaccadePath).toBe(true);
        expect(manager.config.showLODHeatmap).toBe(true);
    });

    test('should toggle debug overlay', () => {
        expect(manager.config.enabled).toBe(false);
        manager.toggle();
        expect(manager.config.enabled).toBe(true);
        manager.toggle();
        expect(manager.config.enabled).toBe(false);
    });

    test('should record saccade movements', () => {
        manager._recordSaccadeMovement({ x: 0, y: 0 }, { x: 100, y: 100 });
        expect(manager.saccadePath.length).toBe(1);
        expect(manager.saccadePath[0].from.x).toBe(0);
        expect(manager.saccadePath[0].to.x).toBe(100);
    });

    test('should limit saccade path length', () => {
        for (let i = 0; i < 20; i++) {
            manager._recordSaccadeMovement({ x: i, y: i }, { x: i + 1, y: i + 1 });
        }
        expect(manager.saccadePath.length).toBe(10);  // maxPathLength
    });

    test('should update LOD data', () => {
        manager.updateLODData(10, 20, 'high');
        expect(manager.lodData.has('10_20')).toBe(true);
        expect(manager.lodData.get('10_20').level).toBe('high');
    });

    test('should update prefetch tiles', () => {
        manager._updatePrefetchTiles([
            { x: 0, y: 0 },
            { x: 1, y: 1 }
        ]);
        expect(manager.prefetchTiles.has('0_0')).toBe(true);
        expect(manager.prefetchTiles.has('1_1')).toBe(true);
    });

    test('should update attention data', () => {
        manager.updateAttentionData({ x: 500, y: 500 });
        expect(manager.attentionData.length).toBe(1);
        expect(manager.attentionData[0].x).toBe(500);
    });

    test('should decay old attention points', () => {
        // Add old attention point
        manager.attentionData.push({
            x: 100,
            y: 100,
            timestamp: Date.now() - 10000,  // 10 seconds ago
            weight: 1.0
        });

        manager.updateAttentionData({ x: 500, y: 500 });
        // Old point should be filtered out
        expect(manager.attentionData.length).toBe(1);
        expect(manager.attentionData[0].x).toBe(500);
    });

    test('should clear all data', () => {
        manager._recordSaccadeMovement({ x: 0, y: 0 }, { x: 100, y: 100 });
        manager.updateLODData(10, 20, 'high');
        manager._updatePrefetchTiles([{ x: 0, y: 0 }]);

        manager.clearData();

        expect(manager.saccadePath.length).toBe(0);
        expect(manager.lodData.size).toBe(0);
        expect(manager.prefetchTiles.size).toBe(0);
    });

    test('should return stats', () => {
        manager._recordSaccadeMovement({ x: 0, y: 0 }, { x: 100, y: 100 });
        manager.updateLODData(10, 20, 'high');

        const stats = manager.getStats();
        expect(stats.enabled).toBe(false);
        expect(stats.saccadePathLength).toBe(1);
        expect(stats.lodTilesCount).toBe(1);
    });

    test('should cycle through display modes', () => {
        const initialLOD = manager.config.showLODHeatmap;
        const initialPrefetch = manager.config.showPrefetchDisplay;

        manager.cycleMode();

        // After cycling from "all", LOD and prefetch should be off
        expect(manager.config.showLODHeatmap).toBe(!initialLOD);
        expect(manager.config.showPrefetchDisplay).toBe(!initialPrefetch);
    });
});

// Run tests if executed directly
if (require.main === module) {
    console.log('Running DebugOverlayManager tests...');
    const tests = require('jest');
    tests.run();
}
