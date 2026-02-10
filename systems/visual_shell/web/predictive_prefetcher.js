/**
 * PredictivePrefetcher - Predictive tile pre-fetching based on movement
 *
 * Phase 47: Tectonic Saccadic Optimization - Task 3
 *
 * Pre-loads tiles before they enter the viewport by:
 * 1. Analyzing movement velocity and direction
 * 2. Calculating predicted future viewport
 * 3. Prioritizing tiles based on gaze point
 * 4. Debouncing requests to avoid excessive loading
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
            ...config
        };

        // State
        this.lastPrefetchTime = 0;
        this.pendingTiles = new Set();
        this.prefetchCache = new Map();

        // Event listeners
        this.eventListeners = new Map();

        // Debounce timer
        this.debounceTimer = null;
    }

    /**
     * Calculate prefetch bounds based on current bounds and velocity
     */
    calculatePrefetchBounds(currentBounds, velocity) {
        const width = currentBounds.maxX - currentBounds.minX;
        const height = currentBounds.maxY - currentBounds.minY;

        // Base padding (always load nearby tiles)
        let paddingX = width * this.config.minPrefetchPadding;
        let paddingY = height * this.config.minPrefetchPadding;

        // Add velocity-based padding
        const speed = velocity.magnitude || Math.sqrt(velocity.x ** 2 + velocity.y ** 2);
        const dynamicPadding = speed * this.config.speedFactor * Math.max(width, height);

        // Extend in direction of movement
        const dirX = velocity.x >= 0 ? 1 : -1;
        const dirY = velocity.y >= 0 ? 1 : -1;

        paddingX += dynamicPadding * Math.abs(velocity.x / (speed || 1));
        paddingY += dynamicPadding * Math.abs(velocity.y / (speed || 1));

        // Clamp to maximum
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
     * Predict which tiles will be needed soon
     */
    predictTiles(position, velocity, lookaheadTime = null) {
        const ahead = lookaheadTime || this.config.lookaheadTime;

        // Predict future position
        const futurePosition = {
            x: position.x + velocity.x * ahead / 1000,
            y: position.y + velocity.y * ahead / 1000
        };

        // Calculate prefetch bounds centered on future position
        const prefetchBounds = this.calculatePrefetchBounds(
            { minX: futurePosition.x, minY: futurePosition.y, maxX: futurePosition.x, maxY: futurePosition.y },
            velocity
        );

        // Get tile coordinates
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
     * Prioritize tiles based on distance to gaze point
     */
    getPrioritizedTiles(tiles, gazePoint) {
        return tiles.map(tile => {
            const dx = (tile.x + this.config.tileSize / 2) - gazePoint.x;
            const dy = (tile.y + this.config.tileSize / 2) - gazePoint.y;
            const distance = Math.sqrt(dx * dx + dy * dy);

            // Priority decreases with distance (0-1)
            const maxDist = 2000;
            const priority = Math.max(0, 1 - distance / maxDist);

            return { ...tile, priority };
        }).sort((a, b) => b.priority - a.priority);
    }

    /**
     * Request prefetch of tiles (debounced)
     */
    requestPrefetch(tiles, gazePoint = null) {
        // Cancel previous timer
        if (this.debounceTimer) {
            clearTimeout(this.debounceTimer);
        }

        // Set new timer
        this.debounceTimer = setTimeout(() => {
            this._executePrefetch(tiles, gazePoint);
        }, this.config.debounceTime);
    }

    /**
     * Execute the prefetch
     */
    _executePrefetch(tiles, gazePoint = null) {
        // If gaze point provided, prioritize
        const prioritized = gazePoint
            ? this.getPrioritizedTiles(tiles, gazePoint)
            : tiles.map(t => ({ ...t, priority: 0.5 }));

        // Filter out already pending/cached tiles
        const newTiles = prioritized.filter(tile => {
            const key = `${tile.tileX},${tile.tileY}`;
            return !this.pendingTiles.has(key) && !this.prefetchCache.has(key);
        });

        if (newTiles.length === 0) {
            return;
        }

        // Mark as pending
        for (const tile of newTiles) {
            this.pendingTiles.add(`${tile.tileX},${tile.tileY}`);
        }

        // Emit prefetch request
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
        const key = `${tileX},${tileY}`;
        this.pendingTiles.delete(key);
        this.prefetchCache.set(key, {
            data,
            timestamp: Date.now()
        });
    }

    /**
     * Get cached tile data
     */
    getCachedTile(tileX, tileY) {
        const key = `${tileX},${tileY}`;
        return this.prefetchCache.get(key)?.data;
    }

    /**
     * Clear old cache entries
     */
    clearCache(maxAge = 30000) {
        const now = Date.now();
        for (const [key, entry] of this.prefetchCache) {
            if (now - entry.timestamp > maxAge) {
                this.prefetchCache.delete(key);
            }
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

    emit(event, data) {
        if (this.eventListeners.has(event)) {
            this.eventListeners.get(event).forEach(cb => cb(data));
        }
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            pendingTiles: this.pendingTiles.size,
            cacheSize: this.prefetchCache.size,
            lastPrefetchTime: this.lastPrefetchTime
        };
    }
}

// Export
if (typeof window !== 'undefined') {
    window.PredictivePrefetcher = PredictivePrefetcher;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PredictivePrefetcher };
}
