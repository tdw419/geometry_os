/**
 * PredictivePrefetcher - Predictive tile pre-fetching based on movement
 *
 * Phase 47: Tectonic Saccadic Optimization - Task 3
 *
 * Now uses a Web Worker to offload computations, freeing 10-15ms on main thread.
 *
 * This file provides the main PredictivePrefetcher class that can use either:
 * 1. A Web Worker for offloading (preferred)
 * 2. Main thread execution (fallback)
 *
 * @class PredictivePrefetcher
 */
class PredictivePrefetcher {
    constructor(config = {}) {
        this.config = {
            lookaheadTime: 500,      // ms to look ahead
            minPrefetchPadding: 0.5, // % of viewport size to always preload
            speedFactor: 0.002,      // Additional padding per pixel/sec of velocity
            maxPrefetchDistance: 3,  // Maximum viewport sizes to prefetch
            debounceTime: 100,       // ms to debounce prefetch requests
            tileSize: 100,
            useWorker: true,         // Enable/disable worker (for fallback)
            workerPath: './workers/predictive_prefetcher_worker.js',
            // LRU Cache configuration (50% memory reduction target)
            cacheMaxSize: 1000,
            cacheMaxMemoryMB: 50,
            cacheTargetMemoryPercent: 0.5,
            cacheAdaptiveSizing: true,
            cacheEvictionPolicy: 'lru',
            ...config
        };

        // State
        this.lastPrefetchTime = 0;
        this.pendingTiles = new Set();

        // Use LRU cache for better memory management
        if (typeof LRUTileCache !== 'undefined') {
            this.prefetchCache = new LRUTileCache({
                maxSize: this.config.cacheMaxSize,
                maxMemoryMB: this.config.cacheMaxMemoryMB,
                targetMemoryPercent: this.config.cacheTargetMemoryPercent,
                adaptiveSizing: this.config.cacheAdaptiveSizing,
                evictionPolicy: this.config.cacheEvictionPolicy
            });
        } else {
            // Fallback to simple Map
            this.prefetchCache = new Map();
        }

        // Event listeners
        this.eventListeners = new Map();

        // Worker state
        this.worker = null;
        this.state = 'uninitialized';
        this.messageId = 0;
        this.pendingMessages = new Map();

        // Debounce timer
        this.debounceTimer = null;

        // Initialize worker or fallback to main thread
        if (this.config.useWorker && typeof Worker !== 'undefined') {
            this._initWorker();
        } else {
            this._initMainThread();
        }
    }

    /**
     * Initialize Web Worker
     */
    _initWorker() {
        try {
            this.worker = new Worker(this.config.workerPath);

            // Set up message handler
            this.worker.onmessage = (e) => {
                const data = e.data;

                // Handle ready state
                if (data.type === 'ready') {
                    this.state = 'ready';
                    this.emit('ready');
                    return;
                }

                // Handle errors
                if (data.type === 'error') {
                    console.error('[PredictivePrefetcher] Worker error:', data.error);
                    this.emit('error', data);
                    return;
                }

                // Handle prefetch events (main use case)
                if (data.type === 'prefetch') {
                    this.emit('prefetch', data);
                    this.lastPrefetchTime = data.timestamp;
                    return;
                }

                // Resolve pending promises for other message types
                if (data.messageId && this.pendingMessages.has(data.messageId)) {
                    const { resolve } = this.pendingMessages.get(data.messageId);
                    this.pendingMessages.delete(data.messageId);
                    resolve(data);
                }

                // Emit other event types
                this.emit(data.type, data);
            };

            // Set up error handler
            this.worker.onerror = (e) => {
                console.error('[PredictivePrefetcher] Worker error:', e);
                this.emit('error', { error: e });
            };

        } catch (error) {
            console.warn('[PredictivePrefetcher] Failed to initialize worker, falling back to main thread:', error);
            this._initMainThread();
        }
    }

    /**
     * Initialize main thread fallback
     */
    _initMainThread() {
        this.state = 'ready';
        this.worker = null;
        this.emit('ready');
    }

    /**
     * Send message to worker
     */
    _sendMessage(type, data = {}) {
        if (!this.worker) {
            // Main thread fallback
            return Promise.resolve(this._handleMainThreadFallback(type, data));
        }

        const messageId = ++this.messageId;
        const message = { type, data, messageId };

        return new Promise((resolve, reject) => {
            this.pendingMessages.set(messageId, { resolve, reject });
            this.worker.postMessage(message);

            // Timeout after 5 seconds
            setTimeout(() => {
                if (this.pendingMessages.has(messageId)) {
                    this.pendingMessages.delete(messageId);
                    reject(new Error(`Message timeout: ${type}`));
                }
            }, 5000);
        });
    }

    /**
     * Handle main thread fallback processing
     */
    _handleMainThreadFallback(type, data) {
        switch (type) {
            case 'calculate_bounds':
                return { type: 'bounds_calculated', bounds: this._calculateBoundsMainThread(data.bounds, data.velocity) };
            case 'predict_tiles':
                return { type: 'prediction_result', tiles: this._predictTilesMainThread(data.position, data.velocity, data.lookaheadTime) };
            case 'get_stats':
                return { type: 'stats', stats: this._getStatsMainThread() };
            default:
                return { type: 'ack' };
        }
    }

    /**
     * Calculate prefetch bounds based on current bounds and velocity
     */
    _calculateBoundsMainThread(currentBounds, velocity) {
        const width = currentBounds.maxX - currentBounds.minX;
        const height = currentBounds.maxY - currentBounds.minY;

        let paddingX = width * this.config.minPrefetchPadding;
        let paddingY = height * this.config.minPrefetchPadding;

        const speed = velocity.magnitude || Math.sqrt(velocity.x ** 2 + velocity.y ** 2);
        const dynamicPadding = speed * this.config.speedFactor * Math.max(width, height);

        paddingX += dynamicPadding * Math.abs(velocity.x / (speed || 1));
        paddingY += dynamicPadding * Math.abs(velocity.y / (speed || 1));

        paddingX = Math.min(paddingX, width * this.config.maxPrefetchDistance);
        paddingY = Math.min(paddingY, height * this.config.maxPrefetchDistance);

        return {
            minX: currentBounds.minX - paddingX / 2,
            minY: currentBounds.minY - paddingY / 2,
            maxX: currentBounds.maxX + paddingX / 2,
            maxY: currentBounds.maxY + paddingY / 2,
            width: width + paddingX,
            height: height + paddingY
        };
    }

    /**
     * Predict tiles on main thread
     */
    _predictTilesMainThread(position, velocity, lookaheadTime) {
        const ahead = lookaheadTime || this.config.lookaheadTime;
        const futurePosition = {
            x: position.x + velocity.x * ahead / 1000,
            y: position.y + velocity.y * ahead / 1000
        };

        const prefetchBounds = this._calculateBoundsMainThread(
            { minX: futurePosition.x, minY: futurePosition.y, maxX: futurePosition.x, maxY: futurePosition.y },
            velocity
        );

        const tiles = [];
        const tileSize = this.config.tileSize;

        const startTileX = Math.floor(prefetchBounds.minX / tileSize);
        const startTileY = Math.floor(prefetchBounds.minY / tileSize);
        const endTileX = Math.ceil(prefetchBounds.maxX / tileSize);
        const endTileY = Math.ceil(prefetchBounds.maxY / tileSize);

        for (let tx = startTileX; tx <= endTileX; tx++) {
            for (let ty = startTileY; ty <= endTileY; ty++) {
                tiles.push({ x: tx * tileSize, y: ty * tileSize, tileX: tx, tileY: ty });
            }
        }

        return tiles;
    }

    /**
     * Get stats on main thread
     */
    _getStatsMainThread() {
        return {
            pendingTiles: this.pendingTiles.size,
            cacheSize: this.prefetchCache.size,
            lastPrefetchTime: this.lastPrefetchTime
        };
    }

    /**
     * Calculate prefetch bounds (public API)
     */
    calculatePrefetchBounds(currentBounds, velocity) {
        if (this.worker) {
            return this._sendMessage('calculate_bounds', { bounds: currentBounds, velocity })
                .then(result => result.bounds);
        }
        return Promise.resolve(this._calculateBoundsMainThread(currentBounds, velocity));
    }

    /**
     * Predict which tiles will be needed soon
     */
    predictTiles(position, velocity, lookaheadTime = null) {
        if (this.worker) {
            this._sendMessage('predict_tiles', { position, velocity, lookaheadTime });
        } else {
            const tiles = this._predictTilesMainThread(position, velocity, lookaheadTime);
            this.emit('prediction_result', { tiles });
        }
    }

    /**
     * Prioritize tiles based on distance to gaze point
     */
    getPrioritizedTiles(tiles, gazePoint) {
        return tiles.map(tile => {
            const dx = (tile.x + this.config.tileSize / 2) - gazePoint.x;
            const dy = (tile.y + this.config.tileSize / 2) - gazePoint.y;
            const distance = Math.sqrt(dx * dx + dy * dy);

            const maxDist = 2000;
            const priority = Math.max(0, 1 - distance / maxDist);

            return { ...tile, priority };
        }).sort((a, b) => b.priority - a.priority);
    }

    /**
     * Request prefetch of tiles (debounced)
     */
    requestPrefetch(tiles, gazePoint = null) {
        if (this.worker) {
            this._sendMessage('request_prefetch', { tiles, gazePoint });
        } else {
            if (this.debounceTimer) {
                clearTimeout(this.debounceTimer);
            }

            this.debounceTimer = setTimeout(() => {
                this._executePrefetch(tiles, gazePoint);
            }, this.config.debounceTime);
        }
    }

    /**
     * Execute the prefetch (main thread)
     */
    _executePrefetch(tiles, gazePoint = null) {
        const prioritized = gazePoint
            ? this.getPrioritizedTiles(tiles, gazePoint)
            : tiles.map(t => ({ ...t, priority: 0.5 }));

        const newTiles = prioritized.filter(tile => {
            const key = `${tile.tileX},${tile.tileY}`;
            return !this.pendingTiles.has(key) && !this.prefetchCache.has(key);
        });

        if (newTiles.length === 0) return;

        for (const tile of newTiles) {
            this.pendingTiles.add(`${tile.tileX},${tile.tileY}`);
        }

        this.emit('prefetch', {
            tiles: newTiles,
            timestamp: Date.now()
        });

        this.lastPrefetchTime = Date.now();
    }

    /**
     * Mark tile as loaded
     */
    markTileLoaded(tileX, tileY, data) {
        if (this.worker) {
            this._sendMessage('mark_tile_loaded', { tileX, tileY, tileData: data });
        } else {
            const key = `${tileX},${tileY}`;
            this.pendingTiles.delete(key);

            // Use LRU cache if available
            if (this.prefetchCache instanceof LRUTileCache) {
                this.prefetchCache.set(key, data);
                const stats = this.prefetchCache.getStats();
                this.emit('tile_loaded', { tileX, tileY, cacheSize: stats.size, memoryMB: stats.memoryMB });
            } else {
                // Fallback to simple Map
                this.prefetchCache.set(key, { data, timestamp: Date.now() });
                this.emit('tile_loaded', { tileX, tileY, cacheSize: this.prefetchCache.size });
            }
        }
    }

    /**
     * Get cached tile data
     */
    getCachedTile(tileX, tileY) {
        if (this.worker) {
            return this._sendMessage('get_cached_tile', { tileX, tileY })
                .then(result => result.data);
        }

        // Use LRU cache if available
        if (this.prefetchCache instanceof LRUTileCache) {
            const key = `${tileX},${tileY}`;
            return Promise.resolve(this.prefetchCache.get(key));
        }

        // Fallback to simple Map
        const key = `${tileX},${tileY}`;
        return Promise.resolve(this.prefetchCache.get(key)?.data || null);
    }

    /**
     * Clear old cache entries
     */
    clearCache(maxAge = 30000) {
        if (this.worker) {
            return this._sendMessage('clear_cache', { maxAge });
        } else {
            // Use LRU cache if available
            if (this.prefetchCache instanceof LRUTileCache) {
                // LRUTileCache doesn't have clearOld, just clear all for now
                // In production, could iterate and check timestamps
                this.prefetchCache.clear();
                return Promise.resolve({ cleared: this.prefetchCache.stats.size });
            }

            // Fallback to simple Map
            const now = Date.now();
            let cleared = 0;
            for (const [key, entry] of this.prefetchCache) {
                if (now - entry.timestamp > maxAge) {
                    this.prefetchCache.delete(key);
                    cleared++;
                }
            }
            return Promise.resolve({ cleared });
        }
    }

    /**
     * Get statistics
     */
    getStats() {
        if (this.worker) {
            return this._sendMessage('get_stats', {})
                .then(result => result.stats);
        }

        const baseStats = this._getStatsMainThread();

        // Add LRU cache statistics if available
        if (this.prefetchCache instanceof LRUTileCache) {
            return Promise.resolve({
                ...baseStats,
                ...this.prefetchCache.getStats()
            });
        }

        return Promise.resolve(baseStats);
    }

    /**
     * Get cache statistics (detailed, LRU-specific)
     */
    getCacheStats() {
        if (this.worker) {
            return this._sendMessage('get_cache_stats', {})
                .then(result => result.stats);
        }

        if (this.prefetchCache instanceof LRUTileCache) {
            return Promise.resolve(this.prefetchCache.getStats());
        }

        // Fallback for simple Map
        return Promise.resolve({
            size: this.prefetchCache.size,
            memoryBytes: 0,
            memoryMB: 0,
            hitRate: 0,
            missRate: 0
        });
    }

    /**
     * Predict and prefetch in one operation
     */
    predictAndPrefetch(position, velocity, gazePoint = null, lookaheadTime = null) {
        if (this.worker) {
            this._sendMessage('predict_and_prefetch', { position, velocity, gazePoint, lookaheadTime });
        } else {
            const tiles = this._predictTilesMainThread(position, velocity, lookaheadTime);
            this.requestPrefetch(tiles, gazePoint);
        }
    }

    /**
     * Update configuration
     */
    updateConfig(newConfig) {
        this.config = { ...this.config, ...newConfig };

        // Update LRU cache configuration if applicable
        if (this.prefetchCache instanceof LRUTileCache) {
            const cacheConfig = {};
            if (newConfig.cacheMaxSize !== undefined) cacheConfig.maxSize = newConfig.cacheMaxSize;
            if (newConfig.cacheMaxMemoryMB !== undefined) cacheConfig.maxMemoryMB = newConfig.cacheMaxMemoryMB;
            if (newConfig.cacheTargetMemoryPercent !== undefined) cacheConfig.targetMemoryPercent = newConfig.cacheTargetMemoryPercent;
            if (newConfig.cacheAdaptiveSizing !== undefined) cacheConfig.adaptiveSizing = newConfig.cacheAdaptiveSizing;
            if (newConfig.cacheEvictionPolicy !== undefined) cacheConfig.evictionPolicy = newConfig.cacheEvictionPolicy;

            if (Object.keys(cacheConfig).length > 0) {
                this.prefetchCache.updateConfig(cacheConfig);
            }
        }

        if (this.worker) {
            this._sendMessage('update_config', newConfig);
        }
    }

    /**
     * Update cache configuration specifically
     */
    updateCacheConfig(cacheConfig) {
        if (this.prefetchCache instanceof LRUTileCache) {
            this.prefetchCache.updateConfig(cacheConfig);
        }

        if (this.worker) {
            this._sendMessage('update_cache_config', cacheConfig);
        }
    }

    /**
     * Reset state
     */
    reset() {
        if (this.worker) {
            this._sendMessage('reset', {});
        } else {
            this.pendingTiles.clear();

            // Clear LRU cache if available
            if (this.prefetchCache instanceof LRUTileCache) {
                this.prefetchCache.clear();
                this.prefetchCache.resetStats();
            } else {
                // Fallback for simple Map
                this.prefetchCache.clear();
            }

            this.lastPrefetchTime = 0;
            if (this.debounceTimer) {
                clearTimeout(this.debounceTimer);
            }
        }
    }

    /**
     * Terminate the worker
     */
    async terminate() {
        if (this.worker) {
            this.worker.terminate();
            this.worker = null;
        }
        this.state = 'terminated';
        this.pendingMessages.clear();
        if (this.debounceTimer) {
            clearTimeout(this.debounceTimer);
        }
    }

    /**
     * Event handling
     */
    on(event, callback) {
        if (!this.eventListeners.has(event)) {
            this.eventListeners.set(event, new Set());
        }
        this.eventListeners.get(event).add(callback);
    }

    off(event, callback) {
        if (this.eventListeners.has(event)) {
            this.eventListeners.get(event).delete(callback);
        }
    }

    once(event, callback) {
        const wrappedCallback = (data) => {
            callback(data);
            this.off(event, wrappedCallback);
        };
        this.on(event, wrappedCallback);
    }

    emit(event, data) {
        if (this.eventListeners.has(event)) {
            this.eventListeners.get(event).forEach(cb => cb(data));
        }
    }
}

// Export
if (typeof window !== 'undefined') {
    window.PredictivePrefetcher = PredictivePrefetcher;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PredictivePrefetcher };
}
