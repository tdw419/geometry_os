/**
 * GPUMemoryOptimizer - Optimize GPU memory usage for heatmap
 *
 * Features:
 * - Texture atlas management
 * - Object pooling for graphics
 * - Batch rendering optimization
 * - LOD (Level of Detail) system
 */

class GPUMemoryOptimizer {
    constructor(options = {}) {
        this.options = {
            maxTextureSize: 4096,
            texturePoolSize: 10,
            enableLOD: true,
            lodDistances: [500, 1000, 2000], // Near, medium, far
            ...options
        };

        // Texture pool
        this.texturePool = [];
        this._initializeTexturePool();

        // Graphics object pool (reuse PIXI.Graphics)
        this.graphicsPool = [];
        this.graphicsPoolMaxSize = 200;

        // Active objects
        this.activeTextures = new Map();
        this.activeGraphics = new Set();

        // LOD cache
        this.lodCache = new Map();

        console.log('[GPUMemoryOptimizer] Initialized');
    }

    /**
     * Initialize texture pool
     * @private
     */
    _initializeTexturePool() {
        for (let i = 0; i < this.options.texturePoolSize; i++) {
            const canvas = document.createElement('canvas');
            canvas.width = 256;
            canvas.height = 256;
            const texture = PIXI.Texture.from(canvas);
            this.texturePool.push(texture);
        }
    }

    /**
     * Acquire texture from pool
     * @param {number} width - Texture width
     * @param {number} height - Texture height
     * @returns {PIXI.Texture} Texture
     */
    acquireTexture(width = 256, height = 256) {
        // Try to reuse from pool
        if (this.texturePool.length > 0) {
            const texture = this.texturePool.pop();
            this.activeTextures.set(texture.textureCacheId, texture);
            return texture;
        }

        // Create new texture
        const canvas = document.createElement('canvas');
        canvas.width = Math.min(width, this.options.maxTextureSize);
        canvas.height = Math.min(height, this.options.maxTextureSize);
        const texture = PIXI.Texture.from(canvas);
        this.activeTextures.set(texture.textureCacheId, texture);
        return texture;
    }

    /**
     * Release texture back to pool
     * @param {PIXI.Texture} texture - Texture to release
     */
    releaseTexture(texture) {
        if (!texture) return;

        this.activeTextures.delete(texture.textureCacheId);

        // Add back to pool if not full
        if (this.texturePool.length < this.options.texturePoolSize) {
            this.texturePool.push(texture);
        } else {
            // Destroy if pool is full
            texture.destroy(true);
        }
    }

    /**
     * Acquire graphics from pool
     * @returns {PIXI.Graphics} Graphics object
     */
    acquireGraphics() {
        let graphics;

        if (this.graphicsPool.length > 0) {
            graphics = this.graphicsPool.pop();
        } else {
            graphics = new PIXI.Graphics();
        }

        this.activeGraphics.add(graphics);
        return graphics;
    }

    /**
     * Release graphics back to pool
     * @param {PIXI.Graphics} graphics - Graphics to release
     */
    releaseGraphics(graphics) {
        if (!graphics || !this.activeGraphics.has(graphics)) return;

        this.activeGraphics.delete(graphics);
        graphics.clear();

        if (this.graphicsPool.length < this.graphicsPoolMaxSize) {
            this.graphicsPool.push(graphics);
        } else {
            graphics.destroy();
        }
    }

    /**
     * Get LOD level based on distance
     * @param {number} distance - Distance from camera
     * @returns {number} LOD level (0=highest, 2=lowest)
     */
    getLODLevel(distance) {
        if (!this.options.enableLOD) return 0;

        const distances = this.options.lodDistances;
        for (let i = 0; i < distances.length; i++) {
            if (distance < distances[i]) return i;
        }
        return distances.length;
    }

    /**
     * Get cached LOD representation
     * @param {string} key - Cache key
     * @param {number} lod - LOD level
     * @returns {*} Cached value or null
     */
    getLODCache(key, lod) {
        const cacheKey = `${key}_${lod}`;
        return this.lodCache.get(cacheKey);
    }

    /**
     * Set LOD cache
     * @param {string} key - Cache key
     * @param {number} lod - LOD level
     * @param {*} value - Value to cache
     */
    setLODCache(key, lod, value) {
        const cacheKey = `${key}_${lod}`;
        this.lodCache.set(cacheKey, value);
    }

    /**
     * Clear LOD cache
     */
    clearLODCache() {
        this.lodCache.clear();
    }

    /**
     * Optimize batch rendering
     * @param {Array} drawables - Array of drawable objects
     * @returns {Array} Optimized batches
     */
    optimizeBatches(drawables) {
        // Group by texture and blend mode
        const batches = new Map();

        for (const drawable of drawables) {
            const key = `${drawable.texture}_${drawable.blendMode}`;
            if (!batches.has(key)) {
                batches.set(key, []);
            }
            batches.get(key).push(drawable);
        }

        return Array.from(batches.values());
    }

    /**
     * Get memory statistics
     * @returns {Object} Memory stats
     */
    getStats() {
        return {
            texturePoolSize: this.texturePool.length,
            activeTextures: this.activeTextures.size,
            graphicsPoolSize: this.graphicsPool.length,
            activeGraphics: this.activeGraphics.size,
            lodCacheSize: this.lodCache.size
        };
    }

    /**
     * Cleanup unused resources
     */
    cleanup() {
        // Clear LOD cache
        this.lodCache.clear();

        // Release all active graphics
        for (const graphics of this.activeGraphics) {
            this.releaseGraphics(graphics);
        }

        console.log('[GPUMemoryOptimizer] Cleaned up');
    }

    /**
     * Destroy optimizer
     */
    destroy() {
        this.cleanup();

        // Destroy all textures
        for (const texture of this.texturePool) {
            texture.destroy(true);
        }
        this.texturePool = [];

        for (const texture of this.activeTextures.values()) {
            texture.destroy(true);
        }
        this.activeTextures.clear();

        // Destroy all graphics
        for (const graphics of this.graphicsPool) {
            graphics.destroy();
        }
        this.graphicsPool = [];

        console.log('[GPUMemoryOptimizer] Destroyed');
    }
}

// Export
if (typeof window !== 'undefined') {
    window.GPUMemoryOptimizer = GPUMemoryOptimizer;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { GPUMemoryOptimizer };
}
