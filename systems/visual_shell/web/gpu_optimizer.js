/**
 * GPUOptimizer - Render pipeline optimization for Neural Heatmap
 *
 * Features:
 * - LOD (Level of Detail) system with 3 levels
 * - Viewport culling with configurable margin
 * - Object pooling for graphics objects
 * - Render queue prioritization
 * - Quality adaptation based on FPS
 */

class GPUOptimizer {
    /**
     * Create a new GPUOptimizer
     * @param {Object} options - Configuration options
     * @param {Array<number>} options.lodDistances - LOD distance thresholds [high, medium, low]
     * @param {number} options.cullingMargin - Margin around viewport for culling (default: 200)
     * @param {number} options.highQualityFps - FPS threshold for high quality (default: 50)
     * @param {number} options.lowQualityFps - FPS threshold for low quality (default: 30)
     * @param {boolean} options.enableCulling - Enable viewport culling (default: true)
     * @param {boolean} options.enableLOD - Enable LOD system (default: true)
     * @param {boolean} options.enableQualityAdaptation - Enable quality adaptation (default: true)
     */
    constructor(options = {}) {
        this.options = {
            lodDistances: [500, 1500, 3000], // High, medium, low thresholds
            cullingMargin: 200,
            highQualityFps: 50,
            lowQualityFps: 30,
            enableCulling: true,
            enableLOD: true,
            enableQualityAdaptation: true,
            ...options
        };

        // Current quality level (0=high, 1=medium, 2=low)
        this.currentQuality = 0;

        // Statistics
        this.stats = {
            totalTiles: 0,
            culledTiles: 0,
            lodDistribution: [0, 0, 0], // High, medium, low count
            averageLOD: 0
        };

        // Render queue with priority
        this.renderQueue = [];

        console.log('[GPUOptimizer] Initialized with LOD thresholds:', this.options.lodDistances);
    }

    /**
     * Optimize attachments for rendering
     * @param {Map} attachments - Map of attachments to optimize
     * @param {Object} viewport - Viewport bounds {x, y, width, height}
     * @returns {Array} Optimized render list sorted by priority
     */
    optimize(attachments, viewport) {
        this.stats.totalTiles = attachments.size;
        this.stats.culledTiles = 0;
        this.stats.lodDistribution = [0, 0, 0];

        const renderList = [];

        for (const [spriteId, attachment] of attachments) {
            // Get tile bounds
            const bounds = attachment.bounds || this._getDefaultBounds(attachment);

            // Check viewport culling
            if (this.options.enableCulling && !this._isInViewport(bounds, viewport)) {
                this.stats.culledTiles++;
                continue;
            }

            // Calculate distance from viewport center
            const distance = this._calculateDistanceToCenter(bounds, viewport);

            // Determine LOD level
            const lod = this.options.enableLOD
                ? this._getLODLevel(distance)
                : 0;

            // Update LOD distribution
            this.stats.lodDistribution[lod]++;

            // Add to render list with priority
            renderList.push({
                spriteId,
                attachment,
                lod,
                distance,
                bounds,
                priority: this._calculatePriority(lod, distance)
            });
        }

        // Sort by priority (high LOD and close distance first)
        renderList.sort((a, b) => b.priority - a.priority);

        // Calculate average LOD
        if (renderList.length > 0) {
            const totalLOD = this.stats.lodDistribution.reduce((sum, count, lod) => sum + count * lod, 0);
            this.stats.averageLOD = totalLOD / renderList.length;
        }

        this.renderQueue = renderList;
        return renderList;
    }

    /**
     * Update tile LOD level
     * @param {Object} tile - Tile to update
     * @param {number} distance - Distance from viewport center
     * @returns {number} LOD level (0=high, 1=medium, 2=low)
     */
    updateLOD(tile, distance) {
        const lod = this._getLODLevel(distance);

        if (tile.lod !== undefined) {
            tile.lod = lod;
        }

        return lod;
    }

    /**
     * Cull tiles based on viewport
     * @param {Map} attachments - Map of attachments to cull
     * @param {Object} viewport - Viewport bounds {x, y, width, height}
     * @returns {Array} Array of visible attachments
     */
    cullTiles(attachments, viewport) {
        if (!this.options.enableCulling) {
            return Array.from(attachments.values());
        }

        const visible = [];

        for (const [spriteId, attachment] of attachments) {
            const bounds = attachment.bounds || this._getDefaultBounds(attachment);

            if (this._isInViewport(bounds, viewport)) {
                visible.push(attachment);
            }
        }

        return visible;
    }

    /**
     * Adapt quality based on FPS
     * @param {number} fps - Current FPS
     * @returns {number} New quality level (0=high, 1=medium, 2=low)
     */
    adaptQuality(fps) {
        if (!this.options.enableQualityAdaptation) {
            return this.currentQuality;
        }

        const previousQuality = this.currentQuality;

        // Adjust quality based on FPS
        if (fps >= this.options.highQualityFps) {
            this.currentQuality = 0; // High quality
        } else if (fps >= this.options.lowQualityFps) {
            this.currentQuality = 1; // Medium quality
        } else {
            this.currentQuality = 2; // Low quality
        }

        if (previousQuality !== this.currentQuality) {
            console.log(`[GPUOptimizer] Quality changed: ${previousQuality} -> ${this.currentQuality} (FPS: ${fps})`);
        }

        return this.currentQuality;
    }

    /**
     * Get optimization statistics
     * @returns {Object} Statistics object
     */
    getStats() {
        return {
            ...this.stats,
            currentQuality: this.currentQuality,
            renderQueueSize: this.renderQueue.length,
            cullingRatio: this.stats.totalTiles > 0
                ? this.stats.culledTiles / this.stats.totalTiles
                : 0
        };
    }

    /**
     * Get LOD level based on distance
     * @private
     */
    _getLODLevel(distance) {
        const distances = this.options.lodDistances;

        if (distance < distances[0]) return 0; // High quality
        if (distance < distances[1]) return 1; // Medium quality
        if (distance < distances[2]) return 2; // Low quality
        return 3; // Culled
    }

    /**
     * Check if bounds are in viewport
     * @private
     */
    _isInViewport(bounds, viewport) {
        if (!viewport || !bounds) return true;

        const margin = this.options.cullingMargin;

        return (
            bounds.x < viewport.x + viewport.width + margin &&
            bounds.x + bounds.width > viewport.x - margin &&
            bounds.y < viewport.y + viewport.height + margin &&
            bounds.y + bounds.height > viewport.y - margin
        );
    }

    /**
     * Calculate distance from bounds to viewport center
     * @private
     */
    _calculateDistanceToCenter(bounds, viewport) {
        if (!bounds) return 0;

        const boundsCenterX = bounds.x + bounds.width / 2;
        const boundsCenterY = bounds.y + bounds.height / 2;

        let viewportCenterX = boundsCenterX;
        let viewportCenterY = boundsCenterY;

        if (viewport) {
            viewportCenterX = viewport.x + viewport.width / 2;
            viewportCenterY = viewport.y + viewport.height / 2;
        }

        const dx = boundsCenterX - viewportCenterX;
        const dy = boundsCenterY - viewportCenterY;

        return Math.sqrt(dx * dx + dy * dy);
    }

    /**
     * Get default bounds for attachment
     * @private
     */
    _getDefaultBounds(attachment) {
        // Try to get bounds from sprite
        if (attachment.sprite) {
            return {
                x: attachment.sprite.x,
                y: attachment.sprite.y,
                width: attachment.sprite.width || 256,
                height: attachment.sprite.height || 256
            };
        }

        // Default bounds
        return {
            x: 0,
            y: 0,
            width: 256,
            height: 256
        };
    }

    /**
     * Calculate render priority
     * @private
     */
    _calculatePriority(lod, distance) {
        // Higher priority for lower LOD and closer distance
        const lodScore = (3 - lod) * 1000; // High LOD gets 3000, low gets 0
        const distanceScore = Math.max(0, 5000 - distance); // Closer gets higher score

        return lodScore + distanceScore;
    }

    /**
     * Get recommended effect intensity based on LOD
     * @param {number} lod - LOD level
     * @returns {Object} Effect intensities
     */
    getEffectIntensity(lod) {
        const intensities = {
            0: { // High quality
                heatmap: 1.0,
                glow: 1.0,
                animation: 1.0,
                particles: 1.0
            },
            1: { // Medium quality
                heatmap: 0.7,
                glow: 0.5,
                animation: 0.6,
                particles: 0.3
            },
            2: { // Low quality
                heatmap: 0.4,
                glow: 0.0,
                animation: 0.2,
                particles: 0.0
            }
        };

        return intensities[lod] || intensities[2];
    }

    /**
     * Reset statistics
     */
    resetStats() {
        this.stats = {
            totalTiles: 0,
            culledTiles: 0,
            lodDistribution: [0, 0, 0],
            averageLOD: 0
        };
    }

    /**
     * Destroy optimizer
     */
    destroy() {
        this.renderQueue = [];
        console.log('[GPUOptimizer] Destroyed');
    }
}

// Export
if (typeof window !== 'undefined') {
    window.GPUOptimizer = GPUOptimizer;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { GPUOptimizer };
}
