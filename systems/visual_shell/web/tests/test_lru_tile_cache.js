/**
 * Tests for LRUTileCache - LRU eviction for tile cache
 *
 * Phase 47 Improvements: Tile Cache Memory Optimization
 */

const { LRUTileCache } = require('../lru_tile_cache.js');

describe('LRUTileCache', () => {
    let cache;

    beforeEach(() => {
        cache = new LRUTileCache({
            maxSize: 10,
            maxMemoryMB: 1,
            tileSize: 1024  // 1KB per tile for testing
        });
    });

    afterEach(() => {
        cache.destroy();
    });

    test('should store and retrieve tiles', () => {
        cache.set('tile_0_0', { data: 'tile data' });
        const retrieved = cache.get('tile_0_0');
        expect(retrieved.data).toBe('tile data');
    });

    test('should track cache hits and misses', () => {
        cache.set('tile_0_0', { data: 'tile data' });

        cache.get('tile_0_0');  // Hit
        cache.get('tile_1_1');  // Miss

        const stats = cache.getStats();
        expect(stats.hits).toBe(1);
        expect(stats.misses).toBe(1);
        expect(stats.hitRate).toBe(0.5);
    });

    test('should evict least recently used item when full', () => {
        // Fill cache
        for (let i = 0; i < 10; i++) {
            cache.set(`tile_${i}`, { data: `tile_${i}` });
        }

        // Access some tiles to update LRU order
        cache.get('tile_0');
        cache.get('tile_1');

        // Add one more - should evict tile_2 (least recently used)
        cache.set('tile_10', { data: 'tile_10' });

        expect(cache.has('tile_0')).toBe(true);
        expect(cache.has('tile_1')).toBe(true);
        expect(cache.has('tile_2')).toBe(false);  // Evicted
    });

    test('should track memory usage', () => {
        cache.set('tile_0', { data: new ArrayBuffer(2048) });  // 2KB
        cache.set('tile_1', { data: new ArrayBuffer(1024) });  // 1KB

        const stats = cache.getStats();
        expect(stats.memoryBytes).toBeGreaterThan(0);
        expect(parseInt(stats.memoryMB)).toBeGreaterThan(0);
    });

    test('should respect memory limit', () => {
        const smallCache = new LRUTileCache({
            maxSize: 100,
            maxMemoryMB: 0.001,  // 1KB limit
            tileSize: 512
        });

        // Add items until memory limit is hit
        for (let i = 0; i < 10; i++) {
            smallCache.set(`tile_${i}`, { data: new ArrayBuffer(512) });
        }

        const stats = smallCache.getStats();
        // Should have evicted some items to stay under limit
        expect(stats.size).toBeLessThan(10);

        smallCache.destroy();
    });

    test('should update access order on get', () => {
        cache.set('tile_0', { data: '0' });
        cache.set('tile_1', { data: '1' });
        cache.set('tile_2', { data: '2' });

        // Access tile_0 to make it more recent
        cache.get('tile_0');

        // Fill cache - tile_1 should be evicted (not tile_0)
        for (let i = 3; i < 12; i++) {
            cache.set(`tile_${i}`, { data: `${i}` });
        }

        expect(cache.has('tile_0')).toBe(true);
        expect(cache.has('tile_1')).toBe(false);
        expect(cache.has('tile_2')).toBe(false);
    });

    test('should clear all cache data', () => {
        cache.set('tile_0', { data: '0' });
        cache.set('tile_1', { data: '1' });

        cache.clear();

        expect(cache.size).toBe(0);
        expect(cache.stats.memoryBytes).toBe(0);
    });

    test('should delete specific key', () => {
        cache.set('tile_0', { data: '0' });
        cache.set('tile_1', { data: '1' });

        cache.delete('tile_0');

        expect(cache.has('tile_0')).toBe(false);
        expect(cache.has('tile_1')).toBe(true);
    });

    test('should provide memory breakdown', () => {
        cache.set('large_tile', { data: new ArrayBuffer(4096) });
        cache.set('small_tile', { data: new ArrayBuffer(512) });

        const breakdown = cache.getMemoryBreakdown();
        expect(breakdown.length).toBeGreaterThan(0);
        expect(breakdown[0].key).toBe('large_tile');  // Largest first
    });
});

// Run tests if executed directly
if (require.main === module) {
    console.log('Running LRUTileCache tests...');
    const tests = require('jest');
    tests.run();
}
