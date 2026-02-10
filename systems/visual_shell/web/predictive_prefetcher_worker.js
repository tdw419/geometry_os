/**
 * PredictivePrefetcher Web Worker
 *
 * Offloads predictive prefetching calculations to a dedicated worker
 * to free up 10-15ms on the main thread.
 *
 * Phase 47: Tectonic Saccadic Optimization - Task 3
 *
 * Message types:
 * - 'init': Initialize worker with config
 * - 'calculate_bounds': Calculate prefetch bounds
 * - 'predict_tiles': Predict future tiles
 * - 'prioritize_tiles': Prioritize tiles by gaze point
 * - 'request_prefetch': Request prefetch (debounced)
 * - 'mark_loaded': Mark tile as loaded
 * - 'get_cached': Get cached tile data
 * - 'clear_cache': Clear old cache entries
 * - 'get_stats': Get worker statistics
 * - 'terminate': Clean up and terminate
 */

// Worker state
let config = {
    lookaheadTime: 500,
    minPrefetchPadding: 0.5,
    speedFactor: 0.002,
    maxPrefetchDistance: 3,
    debounceTime: 100,
    tileSize: 100
};

let state = {
    lastPrefetchTime: 0,
    pendingTiles: new Set(),
    prefetchCache: new Map()
};

let debounceTimer = null;

/**
 * Calculate prefetch bounds based on current bounds and velocity
 */
function calculatePrefetchBounds(currentBounds, velocity) {
    const width = currentBounds.maxX - currentBounds.minX;
    const height = currentBounds.maxY - currentBounds.minY;

    // Base padding (always load nearby tiles)
    let paddingX = width * config.minPrefetchPadding;
    let paddingY = height * config.minPrefetchPadding;

    // Add velocity-based padding
    const speed = velocity.magnitude || Math.sqrt(velocity.x ** 2 + velocity.y ** 2);
    const dynamicPadding = speed * config.speedFactor * Math.max(width, height);

    // Extend in direction of movement
    const dirX = velocity.x >= 0 ? 1 : -1;
    const dirY = velocity.y >= 0 ? 1 : -1;

    paddingX += dynamicPadding * Math.abs(velocity.x / (speed || 1));
    paddingY += dynamicPadding * Math.abs(velocity.y / (speed || 1));

    // Clamp to maximum
    paddingX = Math.min(paddingX, width * config.maxPrefetchDistance);
    paddingY = Math.min(paddingY, height * config.maxPrefetchDistance);

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
function predictTiles(position, velocity, lookaheadTime = null) {
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

    return tiles;
}

/**
 * Prioritize tiles based on distance to gaze point
 */
function prioritizeTiles(tiles, gazePoint) {
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
 * Execute the prefetch (internal)
 */
function executePrefetch(tiles, gazePoint = null) {
    // If gaze point provided, prioritize
    const prioritized = gazePoint
        ? prioritizeTiles(tiles, gazePoint)
        : tiles.map(t => ({ ...t, priority: 0.5 }));

    // Filter out already pending/cached tiles
    const newTiles = prioritized.filter(tile => {
        const key = `${tile.tileX},${tile.tileY}`;
        return !state.pendingTiles.has(key) && !state.prefetchCache.has(key);
    });

    if (newTiles.length === 0) {
        return;
    }

    // Mark as pending
    for (const tile of newTiles) {
        state.pendingTiles.add(`${tile.tileX},${tile.tileY}`);
    }

    // Send prefetch result back to main thread
    self.postMessage({
        type: 'prefetch',
        data: {
            tiles: newTiles,
            timestamp: Date.now()
        }
    });

    state.lastPrefetchTime = Date.now();
}

/**
 * Mark tile as loaded
 */
function markTileLoaded(tileX, tileY, data) {
    const key = `${tileX},${tileY}`;
    state.pendingTiles.delete(key);
    state.prefetchCache.set(key, {
        data,
        timestamp: Date.now()
    });
}

/**
 * Get cached tile data
 */
function getCachedTile(tileX, tileY) {
    const key = `${tileX},${tileY}`;
    const entry = state.prefetchCache.get(key);
    return entry ? entry.data : null;
}

/**
 * Clear old cache entries
 */
function clearCache(maxAge = 30000) {
    const now = Date.now();
    for (const [key, entry] of state.prefetchCache) {
        if (now - entry.timestamp > maxAge) {
            state.prefetchCache.delete(key);
        }
    }
}

/**
 * Get statistics
 */
function getStats() {
    return {
        pendingTiles: state.pendingTiles.size,
        cacheSize: state.prefetchCache.size,
        lastPrefetchTime: state.lastPrefetchTime
    };
}

/**
 * Handle messages from main thread
 */
self.onmessage = function(e) {
    const { type, data, id } = e.data;

    try {
        let result;

        switch (type) {
            case 'init':
                config = { ...config, ...data };
                result = { type: 'initialized', data: { config } };
                break;

            case 'calculate_bounds':
                result = {
                    type: 'bounds_calculated',
                    data: calculatePrefetchBounds(data.bounds, data.velocity)
                };
                break;

            case 'predict_tiles':
                result = {
                    type: 'prediction_result',
                    data: {
                        tiles: predictTiles(data.position, data.velocity, data.lookaheadTime),
                        timestamp: Date.now()
                    }
                };
                break;

            case 'prioritize_tiles':
                result = {
                    type: 'prioritized_tiles',
                    data: {
                        tiles: prioritizeTiles(data.tiles, data.gazePoint)
                    }
                };
                break;

            case 'request_prefetch':
                // Clear previous timer
                if (debounceTimer) {
                    clearTimeout(debounceTimer);
                }

                // Set new timer
                debounceTimer = setTimeout(() => {
                    executePrefetch(data.tiles, data.gazePoint);
                }, config.debounceTime);

                // Acknowledge request
                result = { type: 'prefetch_requested', data: { timestamp: Date.now() } };
                break;

            case 'mark_loaded':
                markTileLoaded(data.tileX, data.tileY, data.data);
                result = { type: 'tile_marked_loaded', data: { tileX: data.tileX, tileY: data.tileY } };
                break;

            case 'get_cached':
                result = {
                    type: 'cached_tile',
                    data: getCachedTile(data.tileX, data.tileY),
                    tileX: data.tileX,
                    tileY: data.tileY
                };
                break;

            case 'clear_cache':
                clearCache(data.maxAge);
                result = { type: 'cache_cleared', data: getStats() };
                break;

            case 'get_stats':
                result = { type: 'stats', data: getStats() };
                break;

            case 'terminate':
                // Clean up
                if (debounceTimer) {
                    clearTimeout(debounceTimer);
                }
                state.pendingTiles.clear();
                state.prefetchCache.clear();
                result = { type: 'terminated', data: {} };
                break;

            default:
                result = { type: 'error', data: { message: `Unknown message type: ${type}` } };
        }

        // Send result back to main thread
        if (result && id) {
            self.postMessage({ ...result, id });
        } else if (result && type !== 'request_prefetch') {
            // For async messages like prefetch, don't send immediate response
            self.postMessage(result);
        }
    } catch (error) {
        self.postMessage({
            type: 'error',
            data: { message: error.message, stack: error.stack },
            id
        });
    }
};

// Signal ready
self.postMessage({ type: 'ready', data: { timestamp: Date.now() } });
