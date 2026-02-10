/**
 * Tests for HLODSystem - Hierarchical LOD clustering
 *
 * Phase 47 Advanced Features - Task 3.3: HLOD System
 */

const { HLODSystem } = require('../hlod_system.js');

describe('HLODSystem', () => {
    let hlod;

    beforeEach(() => {
        hlod = new HLODSystem({
            clusterSize: 4,
            cullDistance: 2000
        });
    });

    afterEach(() => {
        hlod.clear();
    });

    test('should initialize with default config', () => {
        expect(hlod.config.clusterSize).toBe(4);
        expect(hlod.config.cullDistance).toBe(2000);
        expect(hlod.clusters.size).toBe(0);
    });

    test('should create clusters from tiles', () => {
        const tiles = [
            { x: 0, y: 0 },
            { x: 100, y: 0 },
            { x: 0, y: 100 },
            { x: 100, y: 100 }
        ];
        
        const count = hlod.createCluster(tiles);
        
        expect(count).toBe(1);
        expect(hlod.clusters.size).toBe(1);
    });

    test('should group tiles by cluster key', () => {
        const tiles = [
            { x: 0, y: 0 },   // Cluster 0_0
            { x: 400, y: 0 },  // Cluster 1_0 (different cluster)
            { x: 0, y: 400 }   // Cluster 0_1 (different cluster)
        ];
        
        hlod.createCluster(tiles);
        
        expect(hlod.clusters.size).toBeGreaterThanOrEqual(2);
    });

    test('should generate HLOD for cluster', () => {
        const tiles = [{ x: 0, y: 0 }, { x: 100, y: 0 }];
        hlod.createCluster(tiles);
        
        const key = Array.from(hlod.clusters.keys())[0];
        const hlod = hlod.generateHLOD(key);
        
        expect(hlod).not.toBeNull();
        expect(hlod).toHaveProperty('quality');
        expect(hlod).toHaveProperty('bounds');
        expect(hlod).toHaveProperty('tileCount');
    });

    test('should determine if cluster should be culled', () => {
        const tiles = [{ x: 0, y: 0 }];
        hlod.createCluster(tiles);
        
        const key = Array.from(hlod.clusters.keys())[0];
        const viewport = { 
            center: { x: 960, y: 540 }, 
            width: 1920, 
            height: 1080 
        };
        
        // Cluster at 0,0 should not be culled
        const shouldCull = hlod.shouldCull(key, viewport);
        expect(shouldCull).toBe(false);
    });

    test('should cull far away clusters', () => {
        const tiles = [{ x: 10000, y: 10000 }];
        hlod.createCluster(tiles);
        
        const key = Array.from(hlod.clusters.keys())[0];
        const viewport = { 
            center: { x: 960, y: 540 }, 
            width: 1920, 
            height: 1080 
        };
        
        const shouldCull = hlod.shouldCull(key, viewport);
        expect(shouldCull).toBe(true);
    });

    test('should calculate cluster quality based on distance', () => {
        const tiles = [{ x: 0, y: 0 }];
        hlod.createCluster(tiles);
        
        const key = Array.from(hlod.clusters.keys())[0];
        const viewport = { 
            center: { x: 960, y: 540 }, 
            width: 1920, 
            height: 1080 
        };
        
        const quality = hlod.getClusterQuality(key, viewport);
        expect(quality).toBeGreaterThanOrEqual(0);
        expect(quality).toBeLessThanOrEqual(1);
    });

    test('should get render data with HLOD decision', () => {
        const tiles = [{ x: 0, y: 0 }];
        hlod.createCluster(tiles);
        
        const key = Array.from(hlod.clusters.keys())[0];
        const viewport = { 
            center: { x: 960, y: 540 }, 
            width: 1920, 
            height: 1080 
        };
        
        const data = hlod.getRenderData(key, viewport);
        
        expect(data).toHaveProperty('useHLOD');
        expect(data).toHaveProperty('quality');
        expect(data).toHaveProperty('tiles');
    });

    test('should update active clusters', () => {
        const tiles = [{ x: 0, y: 0 }, { x: 10000, y: 0 }];
        hlod.createCluster(tiles);
        
        const viewport = { 
            center: { x: 960, y: 540 }, 
            width: 1920, 
            height: 1080 
        };
        
        hlod.updateActiveClusters(viewport);
        
        // Only close cluster should be active
        expect(hlod.activeClusters.size).toBe(1);
    });

    test('should auto-generate clusters', () => {
        const tiles = [
            { x: 0, y: 0 },
            { x: 100, y: 0 },
            { x: 200, y: 0 },
            { x: 300, y: 0 }
        ];
        
        hlod.config.autoGenerate = true;
        const count = hlod.autoGenerate(tiles);
        
        expect(count).toBeGreaterThan(0);
    });

    test('should track statistics', () => {
        const stats = hlod.getStats();
        
        expect(stats).toHaveProperty('totalClusters');
        expect(stats).toHaveProperty('activeClusters');
        expect(stats).toHaveProperty('clusterSize');
    });

    test('should clear all data', () => {
        hlod.createCluster([{ x: 0, y: 0 }]);
        expect(hlod.clusters.size).toBeGreaterThan(0);
        
        hlod.clear();
        
        expect(hlod.clusters.size).toBe(0);
        expect(hlod.activeClusters.size).toBe(0);
    });
});

// Run tests if executed directly
if (require.main === module) {
    console.log('Running HLODSystem tests...');
    const tests = require('jest');
    tests.run();
}
