/**
 * Geometry OS: Chunk Manager Module
 * 
 * Implements viewport-driven chunk loading for infinite maps.
 * Only loads chunks that are currently visible or near the viewport.
 * 
 * Key features:
 * - Lazy loading: Only fetch visible chunks from server
 * - LRU cache: Keep recently used chunks in memory
 * - Preloading: Load adjacent chunks before they enter viewport
 * - Unloading: Release memory for distant chunks
 * 
 * @module chunk_manager
 */

/**
 * Chunk - Represents a single chunk of the map
 * 
 * @class Chunk
 */
class Chunk {
    /**
     * @param {number} chunkX - Chunk X coordinate
     * @param {number} chunkY - Chunk Y coordinate
     * @param {number} chunkSize - Size of chunk in tiles (default: 16)
     */
    constructor(chunkX, chunkY, chunkSize = 16) {
        this.chunkX = chunkX;
        this.chunkY = chunkY;
        this.chunkSize = chunkSize;
        this.key = `${chunkX},${chunkY}`;

        // World bounds of this chunk
        this.minX = chunkX * chunkSize;
        this.minY = chunkY * chunkSize;
        this.maxX = this.minX + chunkSize - 1;
        this.maxY = this.minY + chunkSize - 1;

        // State
        this.loaded = false;
        this.loading = false;
        this.lastAccessed = Date.now();
        this.tiles = new Map(); // "x,y" -> tile data
        this.metadata = null;   // Additional chunk metadata
    }

    /**
     * Check if this chunk contains a specific tile coordinate
     */
    contains(x, y) {
        return x >= this.minX && x <= this.maxX &&
            y >= this.minY && y <= this.maxY;
    }

    /**
     * Get distance from this chunk to a point
     */
    distanceTo(x, y) {
        const centerX = (this.minX + this.maxX) / 2;
        const centerY = (this.minY + this.maxY) / 2;
        const dx = x - centerX;
        const dy = y - centerY;
        return Math.sqrt(dx * dx + dy * dy);
    }

    /**
     * Get tile data for a specific position within this chunk
     */
    getTile(x, y) {
        return this.tiles.get(`${x},${y}`);
    }

    /**
     * Set tile data for a specific position within this chunk
     */
    setTile(x, y, tileData) {
        this.tiles.set(`${x},${y}`, tileData);
    }

    /**
     * Get all tiles in this chunk
     */
    getAllTiles() {
        return Array.from(this.tiles.values());
    }

    /**
     * Clear all tile data
     */
    clear() {
        this.tiles.clear();
        this.loaded = false;
        this.loading = false;
    }
}

/**
 * ChunkManager - Manages chunk loading and caching
 * 
 * @class ChunkManager
 */
class ChunkManager {
    /**
     * @param {Object} config - Configuration
     * @param {number} config.chunkSize - Size of each chunk in tiles (default: 16)
     * @param {number} config.maxCachedChunks - Maximum chunks to keep in memory (default: 64)
     * @param {number} config.preloadRadius - Number of chunks to preload around viewport (default: 1)
     * @param {string} config.apiEndpoint - API endpoint for fetching chunks (default: '/api/chunk')
     * @param {number} config.chunkTTL - Time to live for chunks in ms (default: 300000)
     */
    constructor(config = {}) {
        this.config = {
            chunkSize: 16,
            maxCachedChunks: 64,
            preloadRadius: 1,
            apiEndpoint: '/api/chunk',
            chunkTTL: 300000, // 5 minutes
            ...config
        };

        // Chunk storage
        this.chunks = new Map(); // "x,y" -> Chunk
        this.loadingQueue = new Set(); // Chunk keys currently loading

        // Statistics
        this.stats = {
            chunksLoaded: 0,
            chunksUnloaded: 0,
            cacheHits: 0,
            cacheMisses: 0,
            totalRequests: 0
        };

        console.log('📦 ChunkManager initialized', this.config);
    }

    /**
     * Convert world coordinates to chunk coordinates
     */
    _worldToChunk(x, y) {
        const chunkX = Math.floor(x / this.config.chunkSize);
        const chunkY = Math.floor(y / this.config.chunkSize);
        return { chunkX, chunkY };
    }

    /**
     * Get chunk key
     */
    _getChunkKey(chunkX, chunkY) {
        return `${chunkX},${chunkY}`;
    }

    /**
     * Get or create a chunk
     */
    _getOrCreateChunk(chunkX, chunkY) {
        const key = this._getChunkKey(chunkX, chunkY);
        let chunk = this.chunks.get(key);

        if (!chunk) {
            chunk = new Chunk(chunkX, chunkY, this.config.chunkSize);
            this.chunks.set(key, chunk);
        }

        return chunk;
    }

    /**
     * Load a chunk from the server
     */
    async loadChunk(chunkX, chunkY) {
        const key = this._getChunkKey(chunkX, chunkY);

        // Check if already loading
        if (this.loadingQueue.has(key)) {
            return null;
        }

        // Check if already loaded and fresh
        const existing = this.chunks.get(key);
        if (existing && existing.loaded) {
            const age = Date.now() - existing.lastAccessed;
            if (age < this.config.chunkTTL) {
                this.stats.cacheHits++;
                existing.lastAccessed = Date.now();
                return existing;
            }
        }

        this.stats.cacheMisses++;
        this.stats.totalRequests++;
        this.loadingQueue.add(key);

        try {
            const chunk = this._getOrCreateChunk(chunkX, chunkY);
            chunk.loading = true;

            // Fetch chunk data from server
            const url = `${this.config.apiEndpoint}?x=${chunkX}&y=${chunkY}&size=${this.config.chunkSize}`;
            const response = await fetch(url + '&t=' + Date.now());

            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }

            const data = await response.json();

            // Populate chunk with tile data
            if (data.tiles) {
                for (const [coord, tileData] of Object.entries(data.tiles)) {
                    const [x, y] = coord.split(',').map(Number);
                    chunk.setTile(x, y, tileData);
                }
            }

            chunk.metadata = data.metadata || null;
            chunk.loaded = true;
            chunk.loading = false;
            chunk.lastAccessed = Date.now();

            this.stats.chunksLoaded++;
            this.loadingQueue.delete(key);

            console.log(`📦 Loaded chunk (${chunkX}, ${chunkY}) with ${chunk.tiles.size} tiles`);
            return chunk;

        } catch (error) {
            console.error(`❌ Failed to load chunk (${chunkX}, ${chunkY}):`, error);
            this.loadingQueue.delete(key);

            // Remove failed chunk
            const chunk = this.chunks.get(key);
            if (chunk && !chunk.loaded) {
                this.chunks.delete(key);
            }

            return null;
        }
    }

    /**
     * Unload a chunk to free memory
     */
    unloadChunk(chunkX, chunkY) {
        const key = this._getChunkKey(chunkX, chunkY);
        const chunk = this.chunks.get(key);

        if (chunk) {
            chunk.clear();
            this.chunks.delete(key);
            this.stats.chunksUnloaded++;
            console.log(`🗑️  Unloaded chunk (${chunkX}, ${chunkY})`);
        }
    }

    /**
     * Get chunks needed for a viewport
     */
    getChunksForViewport(viewport) {
        const { minX, minY, maxX, maxY } = viewport;
        const minChunk = this._worldToChunk(minX, minY);
        const maxChunk = this._worldToChunk(maxX, maxY);

        const chunks = [];

        for (let cx = minChunk.chunkX; cx <= maxChunk.chunkX; cx++) {
            for (let cy = minChunk.chunkY; cy <= maxChunk.chunkY; cy++) {
                chunks.push({ chunkX: cx, chunkY: cy });
            }
        }

        return chunks;
    }

    /**
     * Get chunks to preload around a viewport
     */
    getPreloadChunks(viewport) {
        const { minX, minY, maxX, maxY } = viewport;
        const minChunk = this._worldToChunk(minX, minY);
        const maxChunk = this._worldToChunk(maxX, maxY);

        const radius = this.config.preloadRadius;
        const chunks = new Set();

        // Get visible chunks
        for (let cx = minChunk.chunkX; cx <= maxChunk.chunkX; cx++) {
            for (let cy = minChunk.chunkY; cy <= maxChunk.chunkY; cy++) {
                chunks.add(this._getChunkKey(cx, cy));
            }
        }

        // Get preload chunks
        for (let cx = minChunk.chunkX - radius; cx <= maxChunk.chunkX + radius; cx++) {
            for (let cy = minChunk.chunkY - radius; cy <= maxChunk.chunkY + radius; cy++) {
                chunks.add(this._getChunkKey(cx, cy));
            }
        }

        return Array.from(chunks).map(key => {
            const [cx, cy] = key.split(',').map(Number);
            return { chunkX: cx, chunkY: cy };
        });
    }

    /**
     * Load all chunks needed for a viewport
     */
    async loadChunksForViewport(viewport) {
        const chunksToLoad = this.getPreloadChunks(viewport);
        const loadPromises = chunksToLoad.map(({ chunkX, chunkY }) =>
            this.loadChunk(chunkX, chunkY)
        );

        const results = await Promise.all(loadPromises);
        return results.filter(chunk => chunk !== null);
    }

    /**
     * Get all visible tiles for a viewport
     */
    getVisibleTiles(viewport) {
        const { minX, minY, maxX, maxY } = viewport;
        const tiles = [];

        // Get chunks intersecting viewport
        const minChunk = this._worldToChunk(minX, minY);
        const maxChunk = this._worldToChunk(maxX, maxY);

        for (let cx = minChunk.chunkX; cx <= maxChunk.chunkX; cx++) {
            for (let cy = minChunk.chunkY; cy <= maxChunk.chunkY; cy++) {
                const key = this._getChunkKey(cx, cy);
                const chunk = this.chunks.get(key);

                if (chunk && chunk.loaded) {
                    chunk.getAllTiles().forEach(tile => {
                        if (tile.x >= minX && tile.x <= maxX &&
                            tile.y >= minY && tile.y <= maxY) {
                            tiles.push(tile);
                        }
                    });
                }
            }
        }

        return tiles;
    }

    /**
     * Get tile at specific world coordinates
     */
    getTile(x, y) {
        const { chunkX, chunkY } = this._worldToChunk(x, y);
        const key = this._getChunkKey(chunkX, chunkY);
        const chunk = this.chunks.get(key);

        if (chunk && chunk.loaded) {
            return chunk.getTile(x, y);
        }

        return null;
    }

    /**
     * Update tile data
     */
    updateTile(x, y, tileData) {
        const { chunkX, chunkY } = this._worldToChunk(x, y);
        const chunk = this._getOrCreateChunk(chunkX, chunkY);

        chunk.setTile(x, y, tileData);
        chunk.lastAccessed = Date.now();
    }

    /**
     * Prune old chunks to free memory
     */
    pruneChunks(viewport) {
        const now = Date.now();
        const chunksToUnload = [];

        for (const [key, chunk] of this.chunks) {
            const age = now - chunk.lastAccessed;

            // Unload if:
            // 1. Too old AND
            // 2. Not in preload area AND
            // 3. We have too many chunks cached
            if (age > this.config.chunkTTL &&
                this.chunks.size > this.config.maxCachedChunks) {

                // Check if chunk is far from viewport
                const viewportCenterX = (viewport.minX + viewport.maxX) / 2;
                const viewportCenterY = (viewport.minY + viewport.maxY) / 2;
                const distance = chunk.distanceTo(viewportCenterX, viewportCenterY);

                if (distance > this.config.chunkSize * 2) {
                    chunksToUnload.push({ chunkX: chunk.chunkX, chunkY: chunk.chunkY });
                }
            }
        }

        // Unload old chunks
        chunksToUnload.forEach(({ chunkX, chunkY }) => {
            this.unloadChunk(chunkX, chunkY);
        });

        return chunksToUnload.length;
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            ...this.stats,
            cachedChunks: this.chunks.size,
            loadingChunks: this.loadingQueue.size,
            cacheHitRate: this.stats.totalRequests > 0
                ? (this.stats.cacheHits / this.stats.totalRequests * 100).toFixed(2) + '%'
                : '0%'
        };
    }

    /**
     * Clear all chunks
     */
    clear() {
        this.chunks.clear();
        this.loadingQueue.clear();
        this.stats = {
            chunksLoaded: 0,
            chunksUnloaded: 0,
            cacheHits: 0,
            cacheMisses: 0,
            totalRequests: 0
        };
    }

    /**
     * Get all loaded chunks
     */
    getAllChunks() {
        return Array.from(this.chunks.values());
    }
}

// Global export
if (typeof window !== 'undefined') {
    window.Chunk = Chunk;
    window.ChunkManager = ChunkManager;
    // RegionLoader will be exported after class definition
}

/**
 * RegionLoader - Alternative API for loading rectangular regions
 * Useful for legacy compatibility or different backend implementations
 * 
 * @class RegionLoader
 */
class RegionLoader {
    /**
     * @param {Object} config - Configuration
     * @param {string} config.apiEndpoint - API endpoint for fetching regions (default: '/api/region')
     */
    constructor(config = {}) {
        this.config = {
            apiEndpoint: '/api/region',
            ...config
        };

        this.regionCache = new Map(); // "minX,minY,maxX,maxY" -> region data
    }

    /**
     * Load a rectangular region from the server
     */
    async loadRegion(minX, minY, width, height) {
        const maxX = minX + width - 1;
        const maxY = minY + height - 1;
        const key = `${minX},${minY},${maxX},${maxY}`;

        // Check cache
        const cached = this.regionCache.get(key);
        if (cached) {
            return cached;
        }

        try {
            const url = `${this.config.apiEndpoint}?x=${minX}&y=${minY}&w=${width}&h=${height}`;
            const response = await fetch(url + '&t=' + Date.now());

            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }

            const data = await response.json();

            // Cache the result
            this.regionCache.set(key, data);

            return data;
        } catch (error) {
            console.error(`❌ Failed to load region (${minX}, ${minY}, ${width}, ${height}):`, error);
            return null;
        }
    }

    /**
     * Clear region cache
     */
    clearCache() {
        this.regionCache.clear();
    }
}

// Export for use in other modules
if (typeof window !== 'undefined') {
    window.Chunk = Chunk;
    window.ChunkManager = ChunkManager;
    window.RegionLoader = RegionLoader;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        Chunk,
        ChunkManager,
        RegionLoader
    };
}
