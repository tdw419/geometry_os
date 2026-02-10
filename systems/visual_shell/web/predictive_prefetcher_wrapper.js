/**
 * PredictivePrefetcher - Main Thread Wrapper with Web Worker
 *
 * Provides backward-compatible API while offloading computations
 * to a background Web Worker, freeing 10-15ms on the main thread.
 *
 * Phase 47: Tectonic Saccadic Optimization - Task 3
 * @see docs/plans/2026-02-10-phase-47-web-worker-prefetch.md
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
            ...config
        };

        // State
        this.lastPrefetchTime = 0;
        this.pendingTiles = new Set();
        this.prefetchCache = new Map();

        // Event listeners (for backward compatibility)
        this.eventListeners = new Map();

        // Worker state
        this.worker = null;
        this.state = 'uninitialized';
        this.messageId = 0;
        this.pendingMessages = new Map();

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
            // Create worker from external file
            const workerPath = this.config.workerPath || './workers/predictive_prefetcher_worker.js';
            this.worker = new Worker(workerPath);

            // Set up message handler
            this.worker.onmessage = (e) => {
                this._handleWorkerMessage(e.data);
            };

            // Set up error handler
            this.worker.onerror = (e) => {
                console.error('[PredictivePrefetcher] Worker error:', e);
                this.emit('error', { error: e });
            };

            // Wait for worker to be ready
            this.worker.onmessage = (e) => {
                if (e.data.type === 'ready') {
                    this.state = 'ready';
                    this.emit('ready');
                    // Now set up the actual message handler
                    this.worker.onmessage = (e) => {
                        this._handleWorkerMessage(e.data);
                    };
                }
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
     * Handle messages from worker
     */
    _handleWorkerMessage(data) {
        const { type, ...rest } = data;

        switch (type) {
            case 'prediction_result':
                this.emit('prediction_result', rest);
                // Resolve pending promises
                this._resolvePendingMessage(data);
                break;

            case 'bounds_calculated':
                this.emit('bounds_calculated', rest);
                this._resolvePendingMessage(data);
                break;

            case 'prefetch':
                this.emit('prefetch', rest);
                this.lastPrefetchTime = rest.timestamp;
                break;

            case 'prefetch_complete':
                this.emit('prefetch_complete', rest);
                break;

            case 'tile_loaded':
                this.emit('tile_loaded', rest);
                this._resolvePendingMessage(data);
                break;

            case 'cached_tile':
                this.emit('cached_tile', rest);
                this._resolvePendingMessage(data);
                break;

            case 'cache_cleared':
                this.emit('cache_cleared', rest);
                this._resolvePendingMessage(data);
                break;

            case 'stats':
                this.emit('stats', rest);
                this._resolvePendingMessage(data);
                break;

            case 'config_updated':
                this.config = { ...this.config, ...rest.config };
                this.emit('config_updated', rest);
                break;

            case 'reset_complete':
                this.pendingTiles.clear();
                this.prefetchCache.clear();
                this.emit('reset_complete');
                break;

            case 'predict_and_prefetch_complete':
                this.emit('predict_and_prefetch_complete', rest);
                break;

            case 'error':
                console.error('[PredictivePrefetcher] Worker error:', rest.error);
                this.emit('error', rest);
                break;

            default:
                console.warn(`[PredictivePrefetcher] Unknown message type: ${type}`);
        }
    }

    /**
     * Send message to worker
     */
    _sendMessage(type, data = {}) {
        if (!this.worker) {
            // Main thread fallback
            return this._handleMainThreadMessage(type, data);
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
     * Resolve pending message promise
     */
    _resolvePendingMessage(data) {
        if (data.messageId && this.pendingMessages.has(data.messageId)) {
            const { resolve } = this.pendingMessages.get(data.messageId);
            this.pendingMessages.delete(data.messageId);
            resolve(data);
        }
    }

    /**
     * Handle main thread fallback processing
     */
    _handleMainThreadMessage(type, data) {
        // Main thread implementation for backward compatibility
        // when worker is not available

        switch (type) {
            case 'predict_tiles':
                const tiles = this._predictTilesMainThread(data.position, data.velocity, data.lookaheadTime);
                return Promise.resolve({ type: 'prediction_result', tiles });

            case 'calculate_bounds':
                const bounds = this._calculateBoundsMainThread(data.bounds, data.velocity);
                return Promise.resolve({ type: 'bounds_calculated', bounds });

            case 'get_stats':
                return Promise.resolve({
                    type: 'stats',
                    stats: {
                        pendingTiles: this.pendingTiles.size,
                        cacheSize: this.prefetchCache.size,
                        lastPrefetchTime: this.lastPrefetchTime
                    }
                });

            default:
                return Promise.resolve({ type: 'ack' });
        }
    }

    /**
     * Main thread fallback: Predict tiles
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
     * Main thread fallback: Calculate bounds
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
     * Calculate prefetch bounds based on current bounds and velocity
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
            return;
        }
        const tiles = this._predictTilesMainThread(position, velocity, lookaheadTime);
        this.emit('prediction_result', { tiles });
    }

    /**
     * Prioritize tiles based on distance to gaze point (main thread helper)
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
            // Main thread debouncing
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

        if (newTiles.length === 0) {
            return;
        }

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
            this.prefetchCache.set(key, {
                data,
                timestamp: Date.now()
            });
            this.emit('tile_loaded', { tileX, tileY, cacheSize: this.prefetchCache.size });
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
            const now = Date.now();
            for (const [key, entry] of this.prefetchCache) {
                if (now - entry.timestamp > maxAge) {
                    this.prefetchCache.delete(key);
                }
            }
            return Promise.resolve();
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
        return Promise.resolve({
            pendingTiles: this.pendingTiles.size,
            cacheSize: this.prefetchCache.size,
            lastPrefetchTime: this.lastPrefetchTime
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
        if (this.worker) {
            this._sendMessage('update_config', newConfig);
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
            this.prefetchCache.clear();
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
