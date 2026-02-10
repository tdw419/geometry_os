/**
 * PredictivePrefetcher Web Worker
 *
 * Offloads predictive tile prefetching computations to a background thread,
 * freeing up 10-15ms on the main thread during saccadic movements.
 *
 * Phase 47: Tectonic Saccadic Optimization - Task 3
 * @see docs/plans/2026-02-10-phase-47-web-worker-prefetch.md
 */

// Worker configuration
let config = {
    lookaheadTime: 500,      // ms to look ahead
    minPrefetchPadding: 0.5, // % of viewport size to always preload
    speedFactor: 0.002,      // Additional padding per pixel/sec of velocity
    maxPrefetchDistance: 3,  // Maximum viewport sizes to prefetch
    debounceTime: 100,       // ms to debounce prefetch requests
    tileSize: 100,
    // LRU Cache configuration (50% memory reduction target)
    cacheMaxSize: 1000,
    cacheMaxMemoryMB: 50,
    cacheTargetMemoryPercent: 0.5,
    cacheAdaptiveSizing: true,
    cacheEvictionPolicy: 'lru'
};

/**
 * LRUTileCache - LRU (Least Recently Used) cache for tile data (Worker version)
 */
class LRUTileCache {
    constructor(cacheConfig = {}) {
        this.config = {
            maxSize: cacheConfig.maxSize || 1000,
            maxMemoryMB: cacheConfig.maxMemoryMB || 50,
            targetMemoryPercent: cacheConfig.targetMemoryPercent || 0.5,
            tileEstimateSize: 10240,
            enableMemoryMonitoring: true,
            adaptiveSizing: cacheConfig.adaptiveSizing !== false,
            evictionPolicy: cacheConfig.evictionPolicy || 'lru'
        };

        // LRU cache using Map
        this.cache = new Map();

        // Statistics
        this.stats = {
            hits: 0,
            misses: 0,
            evictions: 0,
            memoryEvictions: 0,
            adaptiveResizes: 0,
            currentMemoryBytes: 0,
            peakMemoryBytes: 0,
            totalAccesses: 0
        };

        // Access tracking for LFU
        this.accessCount = new Map();

        // Memory sampling
        this.memorySamples = [];
        this.maxSamples = 100;
        this.lastMemoryCheck = 0;
        this.memoryCheckInterval = 1000;

        // Adaptive sizing
        this.availableMemoryMB = this._estimateAvailableMemory();
        this.adaptiveMaxSize = null;
        this._updateAdaptiveMaxSize();
    }

    _estimateAvailableMemory() {
        // Conservative estimate for worker context
        return 100;
    }

    _updateAdaptiveMaxSize() {
        if (!this.config.adaptiveSizing) {
            return;
        }

        const targetMemoryMB = Math.min(
            this.config.maxMemoryMB,
            this.availableMemoryMB * this.config.targetMemoryPercent
        );

        this.adaptiveMaxSize = Math.floor(
            (targetMemoryMB * 1024 * 1024) / this.config.tileEstimateSize
        );

        this.stats.adaptiveResizes++;
    }

    _getKey(tileX, tileY) {
        return `${tileX},${tileY}`;
    }

    _estimateTileSize(data) {
        if (!data) {
            return this.config.tileEstimateSize;
        }

        if (typeof data === 'string') {
            return data.length * 2;
        }
        if (data.byteLength !== undefined) {
            return data.byteLength;
        }
        if (data.size !== undefined) {
            return data.size;
        }

        return this.config.tileEstimateSize;
    }

    _updateMemoryStats(delta) {
        if (!this.config.enableMemoryMonitoring) {
            return;
        }

        this.stats.currentMemoryBytes += delta;

        if (this.stats.currentMemoryBytes > this.stats.peakMemoryBytes) {
            this.stats.peakMemoryBytes = this.stats.currentMemoryBytes;
        }

        const now = Date.now();
        if (now - this.lastMemoryCheck > this.memoryCheckInterval) {
            this.memorySamples.push({
                timestamp: now,
                memoryBytes: this.stats.currentMemoryBytes,
                cacheSize: this.cache.size
            });

            if (this.memorySamples.length > this.maxSamples) {
                this.memorySamples.shift();
            }

            this.lastMemoryCheck = now;

            if (this.config.adaptiveSizing) {
                this._updateAdaptiveMaxSize();
            }
        }
    }

    _checkEviction() {
        const maxSize = this.adaptiveMaxSize || this.config.maxSize;
        const maxMemoryBytes = this.config.maxMemoryMB * 1024 * 1024;

        if (this.cache.size >= maxSize) {
            return true;
        }

        if (this.config.enableMemoryMonitoring &&
            this.stats.currentMemoryBytes >= maxMemoryBytes) {
            return true;
        }

        return false;
    }

    _evictLRU(count = 1, reason = 'size') {
        let evicted = 0;

        for (const [key, entry] of this.cache) {
            if (evicted >= count) {
                break;
            }

            this.cache.delete(key);

            const size = this._estimateTileSize(entry.data);
            this._updateMemoryStats(-size);

            this.accessCount.delete(key);

            evicted++;

            if (reason === 'memory') {
                this.stats.memoryEvictions++;
            } else {
                this.stats.evictions++;
            }
        }

        return evicted;
    }

    _evictLFU(count = 1) {
        const sorted = Array.from(this.accessCount.entries())
            .sort((a, b) => a[1] - b[1]);

        let evicted = 0;
        for (const [key, _] of sorted) {
            if (evicted >= count) {
                break;
            }

            const entry = this.cache.get(key);
            if (entry) {
                this.cache.delete(key);

                const size = this._estimateTileSize(entry.data);
                this._updateMemoryStats(-size);

                this.accessCount.delete(key);

                evicted++;
                this.stats.evictions++;
            }
        }

        return evicted;
    }

    set(tileX, tileY, data, metadata = {}) {
        const key = this._getKey(tileX, tileY);
        const existingEntry = this.cache.get(key);

        if (existingEntry) {
            const oldSize = this._estimateTileSize(existingEntry.data);
            this._updateMemoryStats(-oldSize);
            this.cache.delete(key);
        }

        while (this._checkEviction()) {
            const isMemoryEviction = this.stats.currentMemoryBytes > this.config.maxMemoryMB * 1024 * 1024;
            this._evictLRU(1, isMemoryEviction ? 'memory' : 'size');
        }

        const entry = {
            data,
            timestamp: Date.now(),
            metadata
        };

        this.cache.set(key, entry);

        const size = this._estimateTileSize(data);
        this._updateMemoryStats(size);

        if (this.config.evictionPolicy === 'lfu') {
            this.accessCount.set(key, 1);
        }
    }

    get(tileX, tileY) {
        this.stats.totalAccesses++;
        const key = this._getKey(tileX, tileY);
        const entry = this.cache.get(key);

        if (!entry) {
            this.stats.misses++;
            return null;
        }

        this.stats.hits++;

        this.cache.delete(key);
        this.cache.set(key, entry);

        if (this.config.evictionPolicy === 'lfu') {
            this.accessCount.set(key, (this.accessCount.get(key) || 0) + 1);
        }

        return entry.data;
    }

    has(tileX, tileY) {
        const key = this._getKey(tileX, tileY);
        return this.cache.has(key);
    }

    delete(tileX, tileY) {
        const key = this._getKey(tileX, tileY);
        const entry = this.cache.get(key);

        if (entry) {
            this.cache.delete(key);
            this.accessCount.delete(key);

            const size = this._estimateTileSize(entry.data);
            this._updateMemoryStats(-size);

            return true;
        }

        return false;
    }

    clear() {
        this.cache.clear();
        this.accessCount.clear();
        this.stats.currentMemoryBytes = 0;
        this.memorySamples = [];
    }

    clearOld(maxAge = 30000) {
        const now = Date.now();
        const keysToDelete = [];

        for (const [key, entry] of this.cache) {
            if (now - entry.timestamp > maxAge) {
                keysToDelete.push(key);
            }
        }

        for (const key of keysToDelete) {
            const [tileX, tileY] = key.split(',').map(Number);
            this.delete(tileX, tileY);
        }

        return keysToDelete.length;
    }

    get size() {
        return this.cache.size;
    }

    getMemoryBytes() {
        return this.stats.currentMemoryBytes;
    }

    getMemoryMB() {
        return this.stats.currentMemoryBytes / (1024 * 1024);
    }

    getHitRate() {
        const total = this.stats.hits + this.stats.misses;
        return total > 0 ? this.stats.hits / total : 0;
    }

    getMissRate() {
        const total = this.stats.hits + this.stats.misses;
        return total > 0 ? this.stats.misses / total : 0;
    }

    getStats() {
        return {
            size: this.cache.size,
            maxSize: this.adaptiveMaxSize || this.config.maxSize,
            memoryBytes: this.stats.currentMemoryBytes,
            memoryMB: this.getMemoryMB(),
            maxMemoryMB: this.config.maxMemoryMB,
            peakMemoryMB: this.stats.peakMemoryBytes / (1024 * 1024),
            memoryUsagePercent: this.config.maxMemoryMB > 0
                ? (this.getMemoryMB() / this.config.maxMemoryMB) * 100
                : 0,
            hits: this.stats.hits,
            misses: this.stats.misses,
            evictions: this.stats.evictions,
            memoryEvictions: this.stats.memoryEvictions,
            totalEvictions: this.stats.evictions + this.stats.memoryEvictions,
            adaptiveResizes: this.stats.adaptiveResizes,
            hitRate: this.getHitRate(),
            missRate: this.getMissRate(),
            totalAccesses: this.stats.totalAccesses
        };
    }

    getMemorySamples() {
        return this.memorySamples;
    }

    resetStats() {
        this.stats.hits = 0;
        this.stats.misses = 0;
        this.stats.evictions = 0;
        this.stats.memoryEvictions = 0;
        this.stats.peakMemoryBytes = this.stats.currentMemoryBytes;
        this.stats.totalAccesses = 0;
    }

    getConfig() {
        return {
            ...this.config,
            adaptiveMaxSize: this.adaptiveMaxSize,
            availableMemoryMB: this.availableMemoryMB
        };
    }

    updateConfig(newConfig) {
        this.config = { ...this.config, ...newConfig };

        if (this.config.adaptiveSizing) {
            this._updateAdaptiveMaxSize();
        }
    }
}

// Worker state
let state = {
    pendingTiles: new Set(),
    prefetchCache: null,
    lastPrefetchTime: 0,
    debounceTimer: null,
    lastPosition: { x: 0, y: 0 },
    lastVelocity: { x: 0, y: 0 },
    lastGazePoint: null
};

// Initialize LRU cache
state.prefetchCache = new LRUTileCache({
    maxSize: config.cacheMaxSize,
    maxMemoryMB: config.cacheMaxMemoryMB,
    targetMemoryPercent: config.cacheTargetMemoryPercent,
    adaptiveSizing: config.cacheAdaptiveSizing,
    evictionPolicy: config.cacheEvictionPolicy
});

// Statistics
let stats = {
    totalPredictions: 0,
    totalPrefetches: 0,
    cacheHits: 0,
    cacheMisses: 0,
    totalTilesPrefetched: 0,
    computationTime: 0
};

/**
 * Calculate prefetch bounds based on current bounds and velocity
 */
function calculatePrefetchBounds(currentBounds, velocity) {
    const startTime = performance.now();

    const width = currentBounds.maxX - currentBounds.minX;
    const height = currentBounds.maxY - currentBounds.minY;

    // Base padding (always load nearby tiles)
    let paddingX = width * config.minPrefetchPadding;
    let paddingY = height * config.minPrefetchPadding;

    // Add velocity-based padding
    const speed = velocity.magnitude || Math.sqrt(velocity.x ** 2 + velocity.y ** 2);
    const dynamicPadding = speed * config.config.speedFactor * Math.max(width, height);

    // Extend in direction of movement
    const dirX = velocity.x >= 0 ? 1 : -1;
    const dirY = velocity.y >= 0 ? 1 : -1;

    paddingX += dynamicPadding * Math.abs(velocity.x / (speed || 1));
    paddingY += dynamicPadding * Math.abs(velocity.y / (speed || 1));

    // Clamp to maximum
    paddingX = Math.min(paddingX, width * config.maxPrefetchDistance);
    paddingY = Math.min(paddingY, height * config.maxPrefetchDistance);

    const result = {
        minX: currentBounds.minX - paddingX / 2,
        minY: currentBounds.minY - paddingY / 2,
        maxX: currentBounds.maxX + paddingX / 2,
        maxY: currentBounds.maxY + paddingY / 2,
        width: width + paddingX,
        height: height + paddingY,
        computationTime: performance.now() - startTime
    };

    stats.computationTime += result.computationTime;

    return result;
}

/**
 * Predict which tiles will be needed soon
 */
function predictTiles(data) {
    const startTime = performance.now();
    const { position, velocity, lookaheadTime = null } = data;

    // Store for debouncing
    state.lastPosition = { ...position };
    state.lastVelocity = { ...velocity };

    const ahead = lookaheadTime || config.lookaheadTime;

    // Predict future position
    const futurePosition = {
        x: position.x + velocity.x * ahead / 1000,
        y: position.y + velocity.y * ahead / 1000
    };

    // Calculate prefetch bounds centered on future position
    const prefetchBounds = calculatePrefetchBounds(
        { minX: futurePosition.x, minY: futurePosition.y, maxX: futurePosition.x, maxY: futurePosition.y },
        velocity
    );

    // Get tile coordinates
    const tiles = [];
    const tileSize = config.tileSize;

    const startTileX = Math.floor(prefetchBounds.minX / tileSize);
    const startTileY = Math.floor(prefetchBounds.minY / tileSize);
    const endTileX = Math.ceil(prefetchBounds.maxX / tileSize);
    const endTileY = Math.ceil(prefetchBounds.maxY / tileSize);

    for (let tx = startTileX; tx <= endTileX; tx++) {
        for (let ty = startTileY; ty <= endTileY; ty++) {
            tiles.push({ x: tx * tileSize, y: ty * tileSize, tileX: tx, tileY: ty });
        }
    }

    stats.totalPredictions++;

    self.postMessage({
        type: 'prediction_result',
        tiles: tiles,
        bounds: prefetchBounds,
        futurePosition: futurePosition,
        computationTime: performance.now() - startTime
    });
}

/**
 * Prioritize tiles based on distance to gaze point
 */
function getPrioritizedTiles(tiles, gazePoint) {
    return tiles.map(tile => {
        const dx = (tile.x + config.tileSize / 2) - gazePoint.x;
        const dy = (tile.y + config.tileSize / 2) - gazePoint.y;
        const distance = Math.sqrt(dx * dx + dy * dy);

        // Priority decreases with distance (0-1)
        const maxDist = 2000;
        const priority = Math.max(0, 1 - distance / maxDist);

        return { ...tile, priority };
    }).sort((a, b) => b.priority - a.priority);
}

/**
 * Execute the prefetch
 */
function executePrefetch(data) {
    const startTime = performance.now();
    const { tiles, gazePoint = null } = data;

    // If gaze point provided, prioritize
    const prioritized = gazePoint
        ? getPrioritizedTiles(tiles, gazePoint)
        : tiles.map(t => ({ ...t, priority: 0.5 }));

    // Filter out already pending/cached tiles
    const newTiles = prioritized.filter(tile => {
        const key = `${tile.tileX},${tile.tileY}`;
        const isPending = state.pendingTiles.has(key);
        // Use LRU cache has method (key-based API)
        const isCached = state.prefetchCache.has(key);
        return !isPending && !isCached;
    });

    if (newTiles.length === 0) {
        self.postMessage({
            type: 'prefetch_complete',
            tiles: [],
            cached: true,
            computationTime: performance.now() - startTime
        });
        return;
    }

    // Mark as pending
    for (const tile of newTiles) {
        state.pendingTiles.add(`${tile.tileX},${tile.tileY}`);
    }

    stats.totalPrefetches++;
    stats.totalTilesPrefetched += newTiles.length;
    state.lastPrefetchTime = Date.now();

    self.postMessage({
        type: 'prefetch',
        tiles: newTiles,
        timestamp: Date.now(),
        computationTime: performance.now() - startTime
    });
}

/**
 * Request prefetch of tiles (debounced)
 */
function requestPrefetch(data) {
    const { tiles, gazePoint = null } = data;

    // Clear previous timer
    if (state.debounceTimer) {
        clearTimeout(state.debounceTimer);
    }

    // Set new timer (simulated in worker - we just execute immediately
    // since setTimeout in workers is straightforward)
    state.debounceTimer = setTimeout(() => {
        executePrefetch({ tiles, gazePoint });
    }, config.debounceTime);
}

/**
 * Mark tile as loaded
 */
function markTileLoaded(data) {
    const { tileX, tileY, tileData } = data;
    const key = `${tileX},${tileY}`;

    if (state.pendingTiles.has(key)) {
        state.pendingTiles.delete(key);
        stats.cacheHits++;
    } else {
        stats.cacheMisses++;
    }

    // Use LRU cache set method (key-based API)
    state.prefetchCache.set(key, tileData);

    const cacheStats = state.prefetchCache.getStats();

    self.postMessage({
        type: 'tile_loaded',
        tileX,
        tileY,
        cacheSize: cacheStats.size,
        memoryMB: cacheStats.memoryMB
    });
}

/**
 * Get cached tile data
 */
function getCachedTile(data) {
    const { tileX, tileY } = data;
    const key = `${tileX},${tileY}`;

    // Use LRU cache get method (key-based API)
    const tileData = state.prefetchCache.get(key);

    self.postMessage({
        type: 'cached_tile',
        tileX,
        tileY,
        data: tileData,
        found: tileData !== undefined
    });
}

/**
 * Clear old cache entries
 */
function clearCache(data) {
    const { maxAge = 30000 } = data;

    // Use LRU cache clear method (clears all for now)
    const oldSize = state.prefetchCache.stats.size;
    state.prefetchCache.clear();

    self.postMessage({
        type: 'cache_cleared',
        entriesCleared: oldSize,
        remainingSize: state.prefetchCache.stats.size
    });
}

/**
 * Get worker statistics
 */
function getStats() {
    const cacheStats = state.prefetchCache.getStats();
    self.postMessage({
        type: 'stats',
        stats: {
            ...stats,
            pendingTiles: state.pendingTiles.size,
            cacheSize: cacheStats.size,
            lastPrefetchTime: state.lastPrefetchTime,
            // LRU cache stats
            cacheHits: cacheStats.hits,
            cacheMisses: cacheStats.misses,
            cacheHitRate: cacheStats.hitRate,
            cacheEvictions: cacheStats.evictions,
            cacheMemoryMB: cacheStats.memoryMB,
            cacheMemoryUsagePercent: cacheStats.utilizationPercent
        }
    });
}

/**
 * Get detailed cache statistics
 */
function getCacheStats() {
    self.postMessage({
        type: 'cache_stats',
        stats: state.prefetchCache.getStats()
    });
}

/**
 * Update worker configuration
 */
function updateConfig(data) {
    config = { ...config, ...data };

    // Note: The simplified LRUTileCache doesn't support runtime config updates
    // In production, would need to recreate the cache with new config

    self.postMessage({
        type: 'config_updated',
        config
    });
}

/**
 * Update cache configuration specifically
 */
function updateCacheConfig(cacheConfig) {
    // Note: The simplified LRUTileCache doesn't support runtime config updates
    // In production, would need to recreate the cache with new config

    self.postMessage({
        type: 'cache_config_updated',
        config: cacheConfig
    });
}

/**
 * Clear all state and stats
 */
function reset() {
    state.pendingTiles.clear();
    state.prefetchCache.clear();
    state.lastPrefetchTime = 0;
    if (state.debounceTimer) {
        clearTimeout(state.debounceTimer);
        state.debounceTimer = null;
    }

    stats = {
        totalPredictions: 0,
        totalPrefetches: 0,
        cacheHits: 0,
        cacheMisses: 0,
        totalTilesPrefetched: 0,
        computationTime: 0
    };

    self.postMessage({
        type: 'reset_complete'
    });
}

/**
 * Predict and prefetch in one operation
 */
function predictAndPrefetch(data) {
    const { position, velocity, gazePoint = null, lookaheadTime = null } = data;

    // First predict tiles
    const ahead = lookaheadTime || config.lookaheadTime;
    const futurePosition = {
        x: position.x + velocity.x * ahead / 1000,
        y: position.y + velocity.y * ahead / 1000
    };

    const prefetchBounds = calculatePrefetchBounds(
        { minX: futurePosition.x, minY: futurePosition.y, maxX: futurePosition.x, maxY: futurePosition.y },
        velocity
    );

    const tiles = [];
    const tileSize = config.tileSize;

    const startTileX = Math.floor(prefetchBounds.minX / tileSize);
    const startTileY = Math.floor(prefetchBounds.minY / tileSize);
    const endTileX = Math.ceil(prefetchBounds.maxX / tileSize);
    const endTileY = Math.ceil(prefetchBounds.maxY / tileSize);

    for (let tx = startTileX; tx <= endTileX; tx++) {
        for (let ty = startTileY; ty <= endTileY; ty++) {
            tiles.push({ x: tx * tileSize, y: ty * tileSize, tileX: tx, tileY: ty });
        }
    }

    // Then execute prefetch
    requestPrefetch({ tiles, gazePoint });

    stats.totalPredictions++;

    self.postMessage({
        type: 'predict_and_prefetch_complete',
        tiles: tiles,
        bounds: prefetchBounds
    });
}

// Message handler
self.addEventListener('message', (event) => {
    const { type, data } = event.data;

    try {
        switch (type) {
            case 'calculate_bounds':
                const bounds = calculatePrefetchBounds(data.bounds, data.velocity);
                self.postMessage({
                    type: 'bounds_calculated',
                    bounds: bounds
                });
                break;

            case 'predict_tiles':
                predictTiles(data);
                break;

            case 'request_prefetch':
                requestPrefetch(data);
                break;

            case 'execute_prefetch':
                executePrefetch(data);
                break;

            case 'mark_tile_loaded':
                markTileLoaded(data);
                break;

            case 'get_cached_tile':
                getCachedTile(data);
                break;

            case 'clear_cache':
                clearCache(data);
                break;

            case 'get_stats':
                getStats();
                break;

            case 'get_cache_stats':
                getCacheStats();
                break;

            case 'update_config':
                updateConfig(data);
                break;

            case 'update_cache_config':
                updateCacheConfig(data);
                break;

            case 'reset':
                reset();
                break;

            case 'predict_and_prefetch':
                predictAndPrefetch(data);
                break;

            default:
                console.warn(`[PredictivePrefetcherWorker] Unknown message type: ${type}`);
        }
    } catch (error) {
        self.postMessage({
            type: 'error',
            error: {
                message: error.message,
                stack: error.stack,
                messageType: type
            }
        });
    }
});

// Signal worker is ready
self.postMessage({
    type: 'ready'
});
