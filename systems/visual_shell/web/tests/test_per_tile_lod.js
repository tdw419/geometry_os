/**
 * Tests for PerTileLOD - Individual tile LOD
 *
 * Phase 47 Advanced Features - Task 3.1: Per-Tile LOD
 */

const { PerTileLOD } = require('../per_tile_lod.js');

describe('PerTileLOD', () => {
    let lod;

    beforeEach(() => {
        lod = new PerTileLOD({
            tileSize: 100,
            transitionSteps: 5
        });
    });

    afterEach(() => {
        lod.clear();
    });

    test('should initialize with default config', () => {
        expect(lod.config.tileSize).toBe(100);
        expect(lod.config.lodLevels.length).toBe(5);
        expect(lod.tileLOD.size).toBe(0);
    });

    test('should calculate screen-space error', () => {
        const tile = { x: 0, y: 0 };
        const viewport = { width: 1920, height: 1080, center: { x: 960, y: 540 } };
        
        const error = lod.calculateScreenSpaceError(tile, viewport);
        
        expect(error).toHaveProperty('error');
        expect(error).toHaveProperty('distance');
        expect(error).toHaveProperty('normalizedDistance');
        expect(error.distance).toBeGreaterThan(0);
    });

    test('should determine appropriate LOD level', () => {
        const tile = { x: 100, y: 100 };
        const viewport = { width: 1920, height: 1080, center: { x: 960, y: 540 } };
        
        const tileLOD = lod.calculateLOD(tile, viewport);
        
        expect(tileLOD).toHaveProperty('level');
        expect(tileLOD).toHaveProperty('quality');
        expect(tileLOD).toHaveProperty('screenSpaceError');
        expect(tileLOD.quality).toBeGreaterThan(0);
        expect(tileLOD.quality).toBeLessThanOrEqual(1);
    });

    test('should update LOD for specific tile', () => {
        const viewport = { width: 1920, height: 1080, center: { x: 960, y: 540 } };
        
        lod.updateTileLOD(5, 5, viewport);
        
        const tileLOD = lod.getTileLOD(5, 5);
        expect(tileLOD.target).not.toBeNull();
        expect(tileLOD.target).toHaveProperty('level');
    });

    test('should transition tile quality smoothly', () => {
        const key = '5_5';
        lod.tileQuality.set(key, 0.5);
        lod.targetLOD.set(key, { level: 'high', quality: 0.8 });
        lod.transitioningTiles.add(key);
        
        const quality1 = lod.transitionTile(key, 100);
        const quality2 = lod.transitionTile(key, 100);
        
        // Quality should move toward target
        expect(quality2).toBeGreaterThan(quality1);
        expect(quality2).toBeLessThanOrEqual(0.8);
    });

    test('should complete transition when close to target', () => {
        const key = '10_10';
        lod.tileQuality.set(key, 0.79);
        lod.targetLOD.set(key, { level: 'high', quality: 0.8 });
        lod.transitioningTiles.add(key);
        
        lod.transitionTile(key, 100);
        
        // Should complete transition
        expect(lod.transitioningTiles.has(key)).toBe(false);
    });

    test('should apply focus boost to nearby tiles', () => {
        lod.setFocusPoint(500, 500);
        
        const tile = { x: 450, y: 450 };  // Close to focus
        const viewport = { width: 1920, height: 1080, center: { x: 960, y: 540 } };
        
        const tileLOD = lod.calculateLOD(tile, viewport, 0.1);
        
        // Quality should be boosted
        expect(tileLOD.quality).toBeGreaterThan(tileLOD.baseQuality);
    });

    test('should update multiple tiles', () => {
        const viewport = { width: 1920, height: 1080, center: { x: 960, y: 540 } };
        const tiles = [
            { x: 0, y: 0 },
            { x: 1, y: 0 },
            { x: 2, y: 0 }
        ];
        
        const updates = lod.updateTiles(tiles, viewport, 16);
        
        expect(updates.length).toBe(3);
        expect(updates[0]).toHaveProperty('tileX');
        expect(updates[0]).toHaveProperty('quality');
        expect(updates[0]).toHaveProperty('lod');
    });

    test('should provide LOD visualization', () => {
        lod.tileLOD.set('5_5', { level: 'high', quality: 0.8 });
        lod.tileQuality.set('5_5', 0.8);
        
        const viz = lod.getLODVisualization();
        
        expect(Array.isArray(viz)).toBe(true);
        expect(viz.length).toBe(1);
        expect(viz[0]).toHaveProperty('x');
        expect(viz[0]).toHaveProperty('level');
        expect(viz[0]).toHaveProperty('quality');
    });

    test('should track statistics', () => {
        lod.updateTileLOD(1, 1, { width: 1920, height: 1080, center: { x: 960, y: 540 } });
        lod.updateTileLOD(2, 2, { width: 1920, height: 1080, center: { x: 960, y: 540 } });
        
        const stats = lod.getStats();
        
        expect(stats.totalTiles).toBe(2);
        expect(stats).toHaveProperty('transitioningTiles');
        expect(stats).toHaveProperty('lodLevels');
    });

    test('should clear all LOD data', () => {
        lod.updateTileLOD(1, 1, { width: 1920, height: 1080, center: { x: 960, y: 540 } });
        
        expect(lod.tileLOD.size).toBeGreaterThan(0);
        
        lod.clear();
        
        expect(lod.tileLOD.size).toBe(0);
        expect(lod.targetLOD.size).toBe(0);
    });

    test('should handle tiles outside viewport', () => {
        const viewport = { width: 1920, height: 1080, center: { x: 960, y: 540 } };
        const farTile = { x: 10000, y: 10000 };  // Far away
        
        const tileLOD = lod.calculateLOD(farTile, viewport);
        
        // Should use lowest LOD
        expect(['low', 'minimal']).toContain(tileLOD.level);
        expect(tileLOD.quality).toBeLessThan(0.5);
    });

    test('should prioritize tiles near focus', () => {
        lod.setFocusPoint(500, 500);
        
        const closeTile = { x: 480, y: 480 };
        const farTile = { x: 800, y: 800 };
        const viewport = { width: 1920, height: 1080, center: { x: 960, y: 540 } };
        
        const closeLOD = lod.calculateLOD(closeTile, viewport);
        const farLOD = lod.calculateLOD(farTile, viewport);
        
        // Close tile should have higher quality
        expect(closeLOD.quality).toBeGreaterThanOrEqual(farLOD.quality);
    });

    test('should get current LOD with transition state', () => {
        const key = '5_5';
        lod.targetLOD.set(key, { level: 'high', quality: 0.8 });
        lod.transitioningTiles.add(key);
        
        const tileLOD = lod.getTileLOD(5, 5);
        
        expect(tileLOD).toHaveProperty('current');
        expect(tileLOD).toHaveProperty('target');
        expect(tileLOD).toHaveProperty('quality');
        expect(tileLOD).toHaveProperty('isTransitioning');
        expect(tileLOD.isTransitioning).toBe(true);
    });
});

// Run tests if executed directly
if (require.main === module) {
    console.log('Running PerTileLOD tests...');
    const tests = require('jest');
    tests.run();
}
