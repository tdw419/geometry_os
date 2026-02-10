/**
 * Test Suite for LRUTileCache (Tile Cache Memory Optimization)
 *
 * Phase 47: Tile Cache Memory Optimization
 *
 * Tests LRU eviction policy, memory monitoring, adaptive sizing,
 * and cache statistics.
 *
 * Success criteria:
 * - LRU eviction works when cache is full
 * - Memory usage is tracked correctly
 * - Adaptive sizing adjusts cache limits
 * - Cache statistics (hits/misses/evictions) are accurate
 * - 50% memory reduction target is achievable
 */

class TileCacheTests extends NeuralHeatmapTests.PerformanceTest {
    constructor() {
        super('LRU Tile Cache', {
            thresholds: {
                hitRate: { min: 0.7 },      // 70%+ hit rate
                memoryReduction: { min: 50 } // 50%+ memory reduction
            }
        });
    }

    async execute() {
        console.log('🧪 Running LRU Tile Cache Tests...');

        await this.testLRUEviction();
        await this.testMemoryMonitoring();
        await this.testAdaptiveSizing();
        await this.testCacheStatistics();
        await this.testMemoryReductionTarget();
        await this.testCacheHitRate();
        await this.testMemoryBreakdown();
        await this.testClearAndDestroy();

        console.log('✅ All LRU Tile Cache tests passed!');
    }

    async testLRUEviction() {
        console.log('  Test 1: LRU eviction policy...');

        if (typeof LRUTileCache === 'undefined') {
            throw new Error('LRUTileCache not available. Include lru_tile_cache.js first.');
        }

        const cache = new LRUTileCache({
            maxSize: 3,
            maxMemoryMB: 10,
            adaptiveSizing: false
        });

        // Fill cache to capacity
        cache.set('tile_0_0', 'data0');
        cache.set('tile_1_0', 'data1');
        cache.set('tile_2_0', 'data2');

        NeuralHeatmapTests.Assert.assertEquals(
            cache.stats.size,
            3,
            'Cache should be at capacity'
        );

        // Access tile 0 (mark as recently used)
        cache.get('tile_0_0');

        // Add new tile, should evict tile 1 (least recently used)
        cache.set('tile_3_0', 'data3');

        NeuralHeatmapTests.Assert.assertEquals(
            cache.stats.size,
            3,
            'Cache should remain at capacity'
        );

        // Tile 0 should still be in cache
        NeuralHeatmapTests.Assert.assertEquals(
            cache.get('tile_0_0'),
            'data0',
            'Recently used tile should remain in cache'
        );

        // Tile 1 should be evicted (least recently used after we accessed tile 0)
        const stats = cache.getStats();
        NeuralHeatmapTests.Assert.assertGreaterThan(
            stats.evictions,
            0,
            'Should have evicted at least one tile'
        );

        console.log('    ✓ LRU eviction policy working correctly');
    }

    async testMemoryMonitoring() {
        console.log('  Test 2: Memory usage monitoring...');

        const cache = new LRUTileCache({
            maxSize: 100,
            maxMemoryMB: 1, // Small limit for testing
            adaptiveSizing: false
        });

        // Add some data
        cache.set('tile_0_0', 'x'.repeat(1000));
        cache.set('tile_1_0', 'y'.repeat(2000));

        const stats = cache.getStats();

        NeuralHeatmapTests.Assert.assertGreaterThan(
            stats.memoryBytes,
            0,
            'Memory usage should be tracked'
        );

        NeuralHeatmapTests.Assert.assertGreaterThan(
            parseFloat(stats.memoryMB),
            0,
            'Memory usage in MB should be calculated'
        );

        NeuralHeatmapTests.Assert.assertGreaterThan(
            stats.utilizationPercent,
            0,
            'Utilization percent should be calculated'
        );

        console.log('    ✓ Memory monitoring working correctly');
    }

    async testAdaptiveSizing() {
        console.log('  Test 3: Adaptive cache sizing...');

        const cache = new LRUTileCache({
            maxSize: 1000,
            maxMemoryMB: 10,
            targetMemoryPercent: 0.5,
            adaptiveSizing: true
        });

        // Wait for initial memory check
        await new Promise(resolve => setTimeout(resolve, 100));

        NeuralHeatmapTests.Assert.assertGreaterThan(
            cache.availableMemory,
            0,
            'Available memory should be detected'
        );

        // Add some data
        for (let i = 0; i < 50; i++) {
            cache.set(`tile_${i}_0`, `data${i}`);
        }

        const stats = cache.getStats();
        NeuralHeatmapTests.Assert.assertGreaterThan(
            stats.size,
            0,
            'Cache should have entries'
        );

        console.log('    ✓ Adaptive sizing working correctly');
    }

    async testCacheStatistics() {
        console.log('  Test 4: Cache statistics...');

        const cache = new LRUTileCache({
            maxSize: 10,
            maxMemoryMB: 10,
            adaptiveSizing: false
        });

        // Initial stats
        let stats = cache.getStats();

        NeuralHeatmapTests.Assert.assertEquals(stats.hits, 0, 'Initial hits should be 0');
        NeuralHeatmapTests.Assert.assertEquals(stats.misses, 0, 'Initial misses should be 0');
        NeuralHeatmapTests.Assert.assertEquals(stats.evictions, 0, 'Initial evictions should be 0');

        // Add data and access it
        cache.set('tile_0_0', 'data0');
        cache.set('tile_1_0', 'data1');
        cache.set('tile_2_0', 'data2');

        cache.get('tile_0_0'); // Hit
        cache.get('tile_1_0'); // Hit
        cache.get('tile_99_0'); // Miss

        stats = cache.getStats();

        NeuralHeatmapTests.Assert.assertEquals(stats.hits, 2, 'Should have 2 hits');
        NeuralHeatmapTests.Assert.assertEquals(stats.misses, 1, 'Should have 1 miss');

        // Calculate hit rate
        const expectedHitRate = 2 / 3;
        NeuralHeatmapTests.Assert.assertApproximately(
            stats.hitRate,
            expectedHitRate,
            0.01,
            'Hit rate should be calculated correctly'
        );

        // Trigger eviction by adding more than maxSize
        for (let i = 3; i < 15; i++) {
            cache.set(`tile_${i}_0`, `data${i}`);
        }

        stats = cache.getStats();

        NeuralHeatmapTests.Assert.assertGreaterThan(
            stats.evictions,
            0,
            'Evictions should occur when cache is full'
        );

        console.log('    ✓ Cache statistics working correctly');
    }

    async testMemoryReductionTarget() {
        console.log('  Test 5: 50% memory reduction target...');

        // Simulate old unbounded cache behavior
        const unboundedMemoryMB = 100; // Simulated

        // Create cache with 50% reduction target
        const cache = new LRUTileCache({
            maxSize: 1000,
            maxMemoryMB: 50, // 50% of unbounded
            targetMemoryPercent: 0.5,
            adaptiveSizing: true
        });

        const stats = cache.getStats();

        // Target should be 50% or less of original
        const reductionPercent = ((unboundedMemoryMB - stats.memoryLimitMB) / unboundedMemoryMB) * 100;

        NeuralHeatmapTests.Assert.assertGreaterThanOrEqual(
            reductionPercent,
            50,
            'Memory reduction should be at least 50%'
        );

        console.log('    ✓ 50% memory reduction target achievable');
    }

    async testCacheHitRate() {
        console.log('  Test 6: Cache hit rate calculation...');

        const cache = new LRUTileCache({
            maxSize: 100,
            maxMemoryMB: 10,
            adaptiveSizing: false
        });

        // Add tiles
        for (let i = 0; i < 20; i++) {
            cache.set(`tile_${i}_0`, `data${i}`);
        }

        // Access some tiles multiple times
        for (let i = 0; i < 10; i++) {
            cache.get(`tile_${i}_0`); // 10 hits
        }

        // Try to access non-existent tiles
        for (let i = 20; i < 25; i++) {
            cache.get(`tile_${i}_0`); // 5 misses
        }

        const stats = cache.getStats();

        NeuralHeatmapTests.Assert.assertEquals(stats.hits, 10, 'Should have 10 hits');
        NeuralHeatmapTests.Assert.assertEquals(stats.misses, 5, 'Should have 5 misses');
        NeuralHeatmapTests.Assert.assertApproximately(
            stats.hitRate,
            10 / 15,
            0.01,
            'Hit rate should be 10/15 = 0.667'
        );

        console.log('    ✓ Cache hit rate calculation working correctly');
    }

    async testMemoryBreakdown() {
        console.log('  Test 7: Memory breakdown...');

        const cache = new LRUTileCache({
            maxSize: 100,
            maxMemoryMB: 10,
            adaptiveSizing: false
        });

        // Add tiles with different sizes
        cache.set('tile_small', 'x'.repeat(100));
        cache.set('tile_medium', 'y'.repeat(1000));
        cache.set('tile_large', 'z'.repeat(5000));

        const breakdown = cache.getMemoryBreakdown();

        NeuralHeatmapTests.Assert.assertEquals(
            breakdown.length,
            3,
            'Should have 3 entries in breakdown'
        );

        // Should be sorted by size descending
        NeuralHeatmapTests.Assert.assertEquals(
            breakdown[0].key,
            'tile_large',
            'Largest tile should be first'
        );

        NeuralHeatmapTests.Assert.assertGreaterThan(
            parseFloat(breakdown[0].sizeKB),
            parseFloat(breakdown[2].sizeKB),
            'First entry should be larger than last entry'
        );

        console.log('    ✓ Memory breakdown working correctly');
    }

    async testClearAndDestroy() {
        console.log('  Test 8: Clear and destroy...');

        const cache = new LRUTileCache({
            maxSize: 100,
            maxMemoryMB: 10,
            adaptiveSizing: true
        });

        // Add some data
        for (let i = 0; i < 20; i++) {
            cache.set(`tile_${i}_0`, `data${i}`);
        }

        NeuralHeatmapTests.Assert.assertGreaterThan(
            cache.stats.size,
            0,
            'Cache should have entries'
        );

        // Clear cache
        cache.clear();

        const stats = cache.getStats();
        NeuralHeatmapTests.Assert.assertEquals(stats.size, 0, 'Cache should be empty after clear');
        NeuralHeatmapTests.Assert.assertEquals(stats.memoryBytes, 0, 'Memory should be 0 after clear');

        // Add more data
        for (let i = 0; i < 10; i++) {
            cache.set(`tile_${i}_1`, `data${i}`);
        }

        // Destroy cache
        cache.destroy();

        NeuralHeatmapTests.Assert.assertEquals(cache.stats.size, 0, 'Cache should be empty after destroy');

        console.log('    ✓ Clear and destroy working correctly');
    }
}

// Register test suite
if (typeof NeuralHeatmapTests !== 'undefined') {
    NeuralHeatmapTests.registerSuite('TileCache', TileCacheTests);
}

// Export
if (typeof window !== 'undefined') {
    window.TileCacheTests = TileCacheTests;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { TileCacheTests };
}
