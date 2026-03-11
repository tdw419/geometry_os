/**
 * Geometry OS: Heatmap Graphics Pool
 *
 * Object pooling system for PIXI.Graphics objects to optimize performance
 * and reduce garbage collection pressure in the neural heatmap overlay.
 *
 * Features:
 * - Configurable initial pool size and maximum idle objects
 * - acquire()/release() methods for graphics object lifecycle management
 * - Automatic clearing of graphics when returned to pool
 * - Statistics tracking for monitoring pool efficiency
 * - Automatic cleanup of excess idle objects
 *
 * Performance benefits:
 * - Reduces GPU memory allocations by reusing graphics objects
 * - Minimizes garbage collection pauses
 * - Maintains consistent frame rates during high activity periods
 *
 * @class HeatmapGraphicsPool
 * @see docs/plans/2026-02-07-neural-heatmap-improvement-roadmap.md Task 3.2
 */

class HeatmapGraphicsPool {
    /**
     * Create a new HeatmapGraphicsPool
     * @param {Object} options - Configuration options
     * @param {number} options.initialSize - Initial pool size (default: 50)
     * @param {number} options.maxIdle - Maximum idle objects to keep (default: 100)
     * @param {boolean} options.preallocate - Preallocate pool on init (default: true)
     * @param {boolean} options.debug - Enable debug logging (default: false)
     */
    constructor(options = {}) {
        /**
         * Pool configuration options
         * @type {Object}
         * @property {number} initialSize - Initial number of graphics objects to create
         * @property {number} maxIdle - Maximum idle objects before destroying excess
         * @property {boolean} preallocate - Whether to preallocate pool on construction
         * @property {boolean} debug - Enable debug logging
         */
        this.options = {
            initialSize: 50,
            maxIdle: 100,
            preallocate: true,
            debug: false,
            ...options
        };

        // Validate configuration
        this._validateOptions();

        /**
         * Available graphics objects ready for use
         * @type {Array<PIXI.Graphics>}
         * @private
         */
        this.available = [];

        /**
         * Graphics objects currently in use
         * @type {Set<PIXI.Graphics>}
         * @private
         */
        this.inUse = new Set();

        /**
         * Total number of graphics objects created (including destroyed)
         * @type {number}
         * @private
         */
        this.totalCreated = 0;

        /**
         * Total number of graphics objects destroyed
         * @type {number}
         * @private
         */
        this.totalDestroyed = 0;

        /**
         * Peak number of objects in use simultaneously
         * @type {number}
         * @private
         */
        this.peakUsage = 0;

        /**
         * Number of acquire() calls
         * @type {number}
         * @private
         */
        this.acquireCount = 0;

        /**
         * Number of successful pool hits (reuse)
         * @type {number}
         * @private
         */
        this.poolHits = 0;

        /**
         * Number of pool misses (new creation)
         * @type {number}
         * @private
         */
        this.poolMisses = 0;

        /**
         * Pool creation timestamp
         * @type {number}
         * @private
         */
        this.createdAt = performance.now();

        // Preallocate pool if enabled
        if (this.options.preallocate) {
            this._preallocate();
        }

        this._log('Pool created', this.getStats());
    }

    /**
     * Validate pool configuration options
     * @private
     * @throws {Error} If options are invalid
     */
    _validateOptions() {
        if (this.options.initialSize < 0) {
            throw new Error('initialSize must be non-negative');
        }
        if (this.options.maxIdle < 0) {
            throw new Error('maxIdle must be non-negative');
        }
        if (this.options.initialSize > this.options.maxIdle) {
            console.warn('[HeatmapGraphicsPool] initialSize exceeds maxIdle, adjusting maxIdle');
            this.options.maxIdle = this.options.initialSize;
        }
    }

    /**
     * Preallocate graphics objects to initial pool size
     * @private
     */
    _preallocate() {
        for (let i = 0; i < this.options.initialSize; i++) {
            const graphics = this._createGraphics();
            this.available.push(graphics);
        }
        this._log(`Preallocated ${this.options.initialSize} graphics objects`);
    }

    /**
     * Create a new PIXI.Graphics object
     * @private
     * @returns {PIXI.Graphics} New graphics object
     */
    _createGraphics() {
        if (typeof PIXI === 'undefined' || !PIXI.Graphics) {
            throw new Error('PIXI.Graphics not available. Ensure PIXI.js is loaded.');
        }

        const graphics = new PIXI.Graphics();
        this.totalCreated++;

        // Add pool metadata for debugging
        graphics._poolId = `${this.createdAt}_${this.totalCreated}`;
        graphics._pooled = true;
        graphics._acquiredAt = null;
        graphics._acquireCount = 0;

        return graphics;
    }

    /**
     * Acquire a graphics object from the pool
     * Creates a new object if none are available
     *
     * @returns {PIXI.Graphics} A graphics object ready for use
     * @throws {Error} If PIXI.Graphics is not available
     *
     * @example
     * const pool = new HeatmapGraphicsPool();
     * const graphics = pool.acquire();
     * graphics.beginFill(0xFF0000, 0.5);
     * graphics.drawCircle(100, 100, 50);
     * graphics.endFill();
     * // ... use graphics ...
     * pool.release(graphics);
     */
    acquire() {
        this.acquireCount++;
        let graphics;

        if (this.available.length > 0) {
            // Reuse existing graphics from pool
            graphics = this.available.pop();
            this.poolHits++;

            // Track usage metadata
            graphics._acquiredAt = performance.now();
            graphics._acquireCount++;

            this._log('Acquired from pool', {
                poolId: graphics._poolId,
                acquireCount: graphics._acquireCount,
                remaining: this.available.length
            });
        } else {
            // Create new graphics object
            graphics = this._createGraphics();
            this.poolMisses++;

            this._log('Created new graphics', {
                poolId: graphics._poolId,
                totalCreated: this.totalCreated
            });
        }

        this.inUse.add(graphics);

        // Update peak usage statistic
        if (this.inUse.size > this.peakUsage) {
            this.peakUsage = this.inUse.size;
        }

        return graphics;
    }

    /**
     * Release a graphics object back to the pool
     * Clears the graphics and returns it to the available pool
     * or destroys it if maxIdle limit is reached
     *
     * @param {PIXI.Graphics} graphics - The graphics object to release
     * @throws {Error} If the graphics object is not tracked by this pool
     *
     * @example
     * const graphics = pool.acquire();
     * // ... use graphics ...
     * pool.release(graphics);
     */
    release(graphics) {
        if (!this.inUse.has(graphics)) {
            if (graphics._pooled) {
                console.warn('[HeatmapGraphicsPool] Attempting to release graphics that is not in use', {
                    poolId: graphics._poolId,
                    inUseCount: graphics._acquireCount
                });
            } else {
                console.warn('[HeatmapGraphicsPool] Attempting to release graphics that does not belong to this pool');
            }
            return;
        }

        this.inUse.delete(graphics);

        // Clear all graphics commands
        graphics.clear();

        // Reset common properties
        graphics.x = 0;
        graphics.y = 0;
        graphics.alpha = 1;
        graphics.visible = true;
        graphics.renderable = true;

        // Return to pool if under maxIdle limit, otherwise destroy
        if (this.available.length < this.options.maxIdle) {
            this.available.push(graphics);
            this._log('Returned to pool', {
                poolId: graphics._poolId,
                availableCount: this.available.length
            });
        } else {
            // Pool is full, destroy the graphics
            graphics.destroy({ children: true, texture: false, baseTexture: false });
            this.totalDestroyed++;

            this._log('Destroyed excess graphics', {
                poolId: graphics._poolId,
                totalDestroyed: this.totalDestroyed
            });
        }
    }

    /**
     * Get pool statistics for monitoring and debugging
     *
     * @returns {Object} Pool statistics
     * @returns {number} return.available - Number of available graphics objects
     * @returns {number} return.inUse - Number of graphics objects currently in use
     * @returns {number} return.totalCreated - Total number of graphics objects created
     * @returns {number} return.totalDestroyed - Total number of graphics objects destroyed
     * @returns {number} return.peakUsage - Peak number of objects in use simultaneously
     * @returns {number} return.acquireCount - Total number of acquire() calls
     * @returns {number} return.poolHits - Number of times objects were reused from pool
     * @returns {number} return.poolMisses - Number of times new objects had to be created
     * @returns {number} return.hitRate - Percentage of acquires that were pool hits
     * @returns {number} return.efficiency - Pool efficiency score (0-100)
     *
     * @example
     * const stats = pool.getStats();
     * console.log(`Pool hit rate: ${stats.hitRate.toFixed(1)}%`);
     * console.log(`Current usage: ${stats.inUse}/${stats.totalCreated}`);
     */
    getStats() {
        const hitRate = this.acquireCount > 0
            ? (this.poolHits / this.acquireCount) * 100
            : 0;

        // Efficiency score: combines hit rate with pool utilization
        const utilization = this.options.initialSize > 0
            ? (this.inUse.size / this.options.initialSize) * 100
            : 0;
        const efficiency = (hitRate * 0.7) + (Math.min(utilization, 100) * 0.3);

        return {
            available: this.available.length,
            inUse: this.inUse.size,
            totalCreated: this.totalCreated,
            totalDestroyed: this.totalDestroyed,
            peakUsage: this.peakUsage,
            acquireCount: this.acquireCount,
            poolHits: this.poolHits,
            poolMisses: this.poolMisses,
            hitRate: hitRate,
            efficiency: efficiency,

            // Configuration
            initialSize: this.options.initialSize,
            maxIdle: this.options.maxIdle,

            // Timing
            uptime: performance.now() - this.createdAt
        };
    }

    /**
     * Resize the pool to a new target size
     * Adjusts available objects up or down as needed
     *
     * @param {number} newInitialSize - New initial pool size
     * @param {number} newMaxIdle - New maximum idle objects (optional)
     *
     * @example
     * pool.resize(100, 200);
     */
    resize(newInitialSize, newMaxIdle = null) {
        const oldSize = this.options.initialSize;
        this.options.initialSize = Math.max(0, newInitialSize);

        if (newMaxIdle !== null) {
            this.options.maxIdle = Math.max(newInitialSize, newMaxIdle);
        }

        // Grow pool if needed
        if (this.options.initialSize > oldSize) {
            const toAdd = this.options.initialSize - oldSize;
            for (let i = 0; i < toAdd; i++) {
                const graphics = this._createGraphics();
                this.available.push(graphics);
            }
            this._log(`Pool grown by ${toAdd} objects`);
        }

        // Shrink pool if needed
        if (this.available.length > this.options.maxIdle) {
            const toRemove = this.available.length - this.options.maxIdle;
            for (let i = 0; i < toRemove; i++) {
                const graphics = this.available.pop();
                graphics.destroy({ children: true, texture: false, baseTexture: false });
                this.totalDestroyed++;
            }
            this._log(`Pool shrunk by ${toRemove} objects`);
        }
    }

    /**
     * Clear all available graphics objects
     * Does not affect objects currently in use
     */
    clearAvailable() {
        const count = this.available.length;
        for (const graphics of this.available) {
            graphics.destroy({ children: true, texture: false, baseTexture: false });
            this.totalDestroyed++;
        }
        this.available = [];
        this._log(`Cleared ${count} available graphics`);
    }

    /**
     * Force release all graphics objects currently in use
     * WARNING: This may cause rendering issues if objects are still being used
     */
    forceReleaseAll() {
        const inUseCopy = new Set(this.inUse);
        for (const graphics of inUseCopy) {
            this.release(graphics);
        }
        this._log('Force released all graphics objects');
    }

    /**
     * Destroy the pool and all graphics objects
     * WARNING: This will destroy all graphics, including those still in use
     */
    destroy() {
        // Destroy available graphics
        for (const graphics of this.available) {
            graphics.destroy({ children: true, texture: false, baseTexture: false });
        }

        // Destroy in-use graphics
        for (const graphics of this.inUse) {
            graphics.destroy({ children: true, texture: false, baseTexture: false });
        }

        // Clear collections
        this.available = [];
        this.inUse.clear();

        this._log('Pool destroyed', this.getStats());
    }

    /**
     * Log debug message if debug mode is enabled
     * @private
     */
    _log(...args) {
        if (this.options.debug) {
            console.log('[HeatmapGraphicsPool]', ...args);
        }
    }

    /**
     * Create a formatted statistics report
     * @returns {string} Formatted statistics string
     */
    getStatsReport() {
        const stats = this.getStats();
        const uptimeSec = (stats.uptime / 1000).toFixed(1);

        return `
HeatmapGraphicsPool Statistics
===============================
Configuration:
  Initial Size: ${stats.initialSize}
  Max Idle: ${stats.maxIdle}
  Uptime: ${uptimeSec}s

Current State:
  Available: ${stats.available}
  In Use: ${stats.inUse}
  Total Created: ${stats.totalCreated}
  Total Destroyed: ${stats.totalDestroyed}

Performance:
  Peak Usage: ${stats.peakUsage}
  Acquire Calls: ${stats.acquireCount}
  Pool Hits: ${stats.poolHits}
  Pool Misses: ${stats.poolMisses}
  Hit Rate: ${stats.hitRate.toFixed(1)}%
  Efficiency Score: ${stats.efficiency.toFixed(1)}%
`.trim();
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.HeatmapGraphicsPool = HeatmapGraphicsPool;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { HeatmapGraphicsPool };
}
