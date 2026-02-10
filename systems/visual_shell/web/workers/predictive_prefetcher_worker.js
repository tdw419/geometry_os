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
    tileSize: 100
};

// Worker state
let state = {
    pendingTiles: new Set(),
    prefetchCache: new Map(),
    lastPrefetchTime: 0,
    debounceTimer: null,
    lastPosition: { x: 0, y: 0 },
    lastVelocity: { x: 0, y: 0 },
    lastGazePoint: null
};

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

    state.prefetchCache.set(key, {
        data: tileData,
        timestamp: Date.now()
    });

    self.postMessage({
        type: 'tile_loaded',
        tileX,
        tileY,
        cacheSize: state.prefetchCache.size
    });
}

/**
 * Get cached tile data
 */
function getCachedTile(data) {
    const { tileX, tileY } = data;
    const key = `${tileX},${tileY}`;
    const entry = state.prefetchCache.get(key);

    self.postMessage({
        type: 'cached_tile',
        tileX,
        tileY,
        data: entry ? entry.data : null,
        found: !!entry
    });
}

/**
 * Clear old cache entries
 */
function clearCache(data) {
    const { maxAge = 30000 } = data;
    const now = Date.now();
    let cleared = 0;

    for (const [key, entry] of state.prefetchCache) {
        if (now - entry.timestamp > maxAge) {
            state.prefetchCache.delete(key);
            cleared++;
        }
    }

    self.postMessage({
        type: 'cache_cleared',
        entriesCleared: cleared,
        remainingSize: state.prefetchCache.size
    });
}

/**
 * Get worker statistics
 */
function getStats() {
    self.postMessage({
        type: 'stats',
        stats: {
            ...stats,
            pendingTiles: state.pendingTiles.size,
            cacheSize: state.prefetchCache.size,
            lastPrefetchTime: state.lastPrefetchTime
        }
    });
}

/**
 * Update worker configuration
 */
function updateConfig(data) {
    config = { ...config, ...data };

    self.postMessage({
        type: 'config_updated',
        config
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

            case 'update_config':
                updateConfig(data);
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
