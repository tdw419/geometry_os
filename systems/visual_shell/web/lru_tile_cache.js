/**
 * LRUTileCache - LRU (Least Recently Used) eviction for tile cache
 *
 * Phase 47 Improvements: Tile Cache Memory Optimization
 *
 * Features:
 * - LRU eviction policy for 50% memory reduction
 * - Memory usage monitoring via performance.memory API
 * - Adaptive cache sizing based on available memory
 * - Cache statistics (hits, misses, evictions)
 *
 * @class LRUTileCache
 */

class LRUTileCache {
    constructor(config = {}) {
        this.config = {
            maxSize: 1000,                    // Maximum number of tiles
            maxMemoryMB: 50,                  // Maximum memory in MB
            targetMemoryPercent: 0.5,         // Target 50% memory reduction
            adaptiveSizing: true,             // Adjust cache size based on available memory
            evictionPolicy: 'lru',            // 'lru' or 'lfu'
            tileSize: 32768,                  // Estimated bytes per tile (256x256 RGBA)
            ...config
        };

        // Cache storage
        this.cache = new Map();
        this.accessOrder = new Map();  // Track access order for LRU

        // Statistics
        this.stats = {
            hits: 0,
            misses: 0,
            evictions: 0,
            size: 0,
            memoryBytes: 0,
            hitRate: 0
        };

        // Memory monitoring
        this.memoryLimit = this.config.maxMemoryMB * 1024 * 1024;
        this.availableMemory = this._getAvailableMemory();

        // Adaptive sizing
        if (this.config.adaptiveSizing) {
            this._startMemoryMonitoring();
        }
    }

    /**
     * Get available memory (Chrome-specific)
     */
    _getAvailableMemory() {
        if (typeof performance !== 'undefined' && performance.memory) {
            return performance.memory.jsHeapSizeLimit - performance.memory.usedJSHeapSize;
        }
        return Infinity;
    }

    /**
     * Estimate memory size of a tile
     */
    _estimateTileSize(tile) {
        if (tile && tile.data) {
            // Rough estimate for image data
            if (tile.data instanceof ImageData) {
                return tile.data.width * tile.data.height * 4;  // RGBA
            }
            if (tile.data instanceof ArrayBuffer) {
                return tile.data.byteLength;
            }
        }
        return this.config.tileSize;
    }

    /**
     * Start memory monitoring (for adaptive sizing)
     */
    _startMemoryMonitoring() {
        // Check memory every 5 seconds
        this.memoryCheckInterval = setInterval(() => {
            const available = this._getAvailableMemory();
            const usage = this.stats.memoryBytes;

            // If we're using more than target percentage, trigger eviction
            if (available < Infinity && usage > available * this.config.targetMemoryPercent) {
                this._evictToTarget(usage * (1 - this.config.targetMemoryPercent));
            }

            this.availableMemory = available;
        }, 5000);
    }

    /**
     * Get a tile from cache
     */
    get(key) {
        const entry = this.cache.get(key);

        if (entry) {
            // Cache hit - update access order
            this.accessOrder.set(key, Date.now());
            this.stats.hits++;
            this._updateHitRate();
            return entry.data;
        }

        // Cache miss
        this.stats.misses++;
        this._updateHitRate();
        return undefined;
    }

    /**
     * Set a tile in cache
     */
    set(key, value) {
        const existingSize = this.cache.has(key) ? this.cache.get(key).size : 0;
        const newSize = this._estimateTileSize({ data: value });

        // Check if we need to evict before adding
        this._ensureCapacity(newSize - existingSize);

        // Add to cache
        this.cache.set(key, {
            data: value,
            size: newSize,
            timestamp: Date.now(),
            accessCount: 0
        });

        this.accessOrder.set(key, Date.now());
        this.stats.size = this.cache.size;
        this.stats.memoryBytes += (newSize - existingSize);
    }

    /**
     * Check if cache has key
     */
    has(key) {
        return this.cache.has(key);
    }

    /**
     * Delete a specific key
     */
    delete(key) {
        const entry = this.cache.get(key);
        if (entry) {
            this.stats.memoryBytes -= entry.size;
            this.cache.delete(key);
            this.accessOrder.delete(key);
            this.stats.size = this.cache.size;
        }
    }

    /**
     * Clear entire cache
     */
    clear() {
        this.cache.clear();
        this.accessOrder.clear();
        this.stats.memoryBytes = 0;
        this.stats.size = 0;
    }

    /**
     * Ensure cache has capacity for new item
     */
    _ensureCapacity(requiredBytes) {
        // Check memory limit
        while (this.stats.memoryBytes + requiredBytes > this.memoryLimit && this.cache.size > 0) {
            this._evictOne();
        }

        // Check max size limit
        while (this.cache.size >= this.config.maxSize && this.cache.size > 0) {
            this._evictOne();
        }
    }

    /**
     * Evict tiles to meet target memory reduction
     */
    _evictToTarget(targetBytes) {
        const toEvict = Math.ceil(targetBytes / this.config.tileSize);
        for (let i = 0; i < toEvict && this.cache.size > 0; i++) {
            this._evictOne();
        }
    }

    /**
     * Evict least recently used item
     */
    _evictOne() {
        let oldestKey = null;
        let oldestTime = Infinity;

        // Find least recently accessed item
        for (const [key, time] of this.accessOrder) {
            if (time < oldestTime) {
                oldestTime = time;
                oldestKey = key;
            }
        }

        if (oldestKey !== null) {
            this._evict(oldestKey);
        }
    }

    /**
     * Evict specific key
     */
    _evict(key) {
        const entry = this.cache.get(key);
        if (entry) {
            this.stats.memoryBytes -= entry.size;
            this.cache.delete(key);
            this.accessOrder.delete(key);
            this.stats.evictions++;
            this.stats.size = this.cache.size;
        }
    }

    /**
     * Update hit rate
     */
    _updateHitRate() {
        const total = this.stats.hits + this.stats.misses;
        this.stats.hitRate = total > 0 ? this.stats.hits / total : 0;
    }

    /**
     * Get cache statistics
     */
    getStats() {
        return {
            ...this.stats,
            memoryMB: (this.stats.memoryBytes / 1024 / 1024).toFixed(2),
            utilizationPercent: (this.stats.memoryBytes / this.memoryLimit * 100).toFixed(1),
            memoryLimitMB: this.config.maxMemoryMB,
            maxSize: this.config.maxSize
        };
    }

    /**
     * Get memory usage breakdown
     */
    getMemoryBreakdown() {
        const entries = [];
        for (const [key, entry] of this.cache) {
            entries.push({
                key,
                size: entry.size,
                sizeKB: (entry.size / 1024).toFixed(2),
                timestamp: entry.timestamp,
                age: Date.now() - entry.timestamp
            });
        }
        // Sort by size descending
        entries.sort((a, b) => b.size - a.size);
        return entries.slice(0, 20);  // Top 20
    }

    /**
     * Force garbage collection hint (for debugging)
     */
    hintGC() {
        if (typeof gc !== 'undefined') {
            gc();
        }
    }

    /**
     * Destroy cache
     */
    destroy() {
        this.clear();
        if (this.memoryCheckInterval) {
            clearInterval(this.memoryCheckInterval);
        }
    }
}

// Export
if (typeof window !== 'undefined') {
    window.LRUTileCache = LRUTileCache;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LRUTileCache };
}
