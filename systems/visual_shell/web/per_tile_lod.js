/**
 * PerTileLOD - Individual tile LOD for smooth transitions
 *
 * Phase 47 Advanced Features - Task 3.1: Per-Tile LOD
 *
 * Implements per-tile LOD granularity:
 * - Individual tile LOD levels (no more region-based popping)
 * - Screen-space error metric for LOD selection
 * - Smooth transitions per tile
 * - Focus-based LOD priority
 *
 * @class PerTileLOD
 */

class PerTileLOD {
    constructor(config = {}) {
        this.config = {
            // LOD levels
            lodLevels: [
                { name: 'full', quality: 1.0, distance: 0 },
                { name: 'high', quality: 0.8, distance: 300 },
                { name: 'medium', quality: 0.6, distance: 600 },
                { name: 'low', quality: 0.4, distance: 1000 },
                { name: 'minimal', quality: 0.2, distance: 1500 }
            ],
            
            // Screen-space error
            maxScreenSpaceError: 16,         // pixels
            errorThreshold: 2,                 // pixels
            
            // Transition settings
            transitionDuration: 300,           // ms
            transitionSteps: 10,               // interpolation steps
            
            // Focus boost
            focusBoostRadius: 200,             // pixels
            focusBoostAmount: 0.2,             // quality boost
            
            // Tile size
            tileSize: 100,                    // pixels
            
            ...config
        };

        // Current LOD for each tile (key: "x_y")
        this.tileLOD = new Map();
        
        // Target LOD for each tile (for transitions)
        this.targetLOD = new Map();
        
        // Current quality for each tile
        this.tileQuality = new Map();
        
        // Transition state
        this.transitioningTiles = new Set();
        
        // Focus reference
        this.focusPoint = { x: 0, y: 0 };
    }

    /**
     * Calculate screen-space error for a tile
     * @param {Object} tile - Tile with x, y position
     * @param {Object} viewport - Viewport info
     */
    calculateScreenSpaceError(tile, viewport) {
        // Get tile center in screen coordinates
        const tileCenterX = tile.x + this.config.tileSize / 2;
        const tileCenterY = tile.y + this.config.tileSize / 2;
        
        // Calculate distance from viewport center
        const viewportCenter = viewport.center || { x: viewport.width / 2, y: viewport.height / 2 };
        const dx = tileCenterX - viewportCenter.x;
        const dy = tileCenterY - viewportCenter.y;
        const distance = Math.sqrt(dx * dx + dy * dy);
        
        // Calculate screen-space error based on distance
        // Further tiles = higher error (can use lower LOD)
        const normalizedDistance = distance / Math.max(viewport.width, viewport.height);
        const screenSpaceError = normalizedDistance * this.config.maxScreenSpaceError;
        
        return {
            error: screenSpaceError,
            distance,
            normalizedDistance
        };
    }

    /**
     * Determine appropriate LOD level for a tile
     * @param {Object} tile - Tile info
     * @param {Object} viewport - Viewport info
     * @param {number} focusBoost - Additional quality from focus
     */
    calculateLOD(tile, viewport, focusBoost = 0) {
        const errorInfo = this.calculateScreenSpaceError(tile, viewport);
        
        // Find appropriate LOD level based on distance/error
        for (const lod of this.config.lodLevels) {
            if (errorInfo.distance < lod.distance) {
                // Apply focus boost
                const boostedQuality = Math.min(1.0, lod.quality + focusBoost);
                return {
                    level: lod.name,
                    quality: boostedQuality,
                    baseQuality: lod.quality,
                    screenSpaceError: errorInfo.error
                };
            }
        }
        
        // Default to lowest LOD
        const lowest = this.config.lodLevels[this.config.lodLevels.length - 1];
        return {
            level: lowest.name,
            quality: lowest.quality + focusBoost,
            baseQuality: lowest.quality,
            screenSpaceError: errorInfo.error
        };
    }

    /**
     * Update LOD for a specific tile
     * @param {number} tileX - Tile X index
     * @param {number} tileY - Tile Y index
     * @param {Object} viewport - Viewport info
     */
    updateTileLOD(tileX, tileY, viewport) {
        const key = `${tileX}_${tileY}`;
        const tile = { x: tileX * this.config.tileSize, y: tileY * this.config.tileSize };
        
        // Calculate focus boost
        const tileCenterX = tile.x + this.config.tileSize / 2;
        const tileCenterY = tile.y + this.config.tileSize / 2;
        const dx = tileCenterX - this.focusPoint.x;
        const dy = tileCenterY - this.focusPoint.y;
        const focusDistance = Math.sqrt(dx * dx + dy * dy);
        const focusBoost = focusDistance < this.config.focusBoostRadius ?
            this.config.focusBoostAmount * (1 - focusDistance / this.config.focusBoostRadius) : 0;
        
        // Calculate target LOD
        const targetLOD = this.calculateLOD(tile, viewport, focusBoost);
        
        // Check if LOD changed
        const currentLOD = this.tileLOD.get(key);
        if (!currentLOD || currentLOD.level !== targetLOD.level) {
            // Start transition
            this.targetLOD.set(key, targetLOD);
            this.transitioningTiles.add(key);
        }
        
        return targetLOD;
    }

    /**
     * Transition tile quality smoothly
     * @param {string} key - Tile key
     * @param {number} deltaTime - Time since last update (ms)
     */
    transitionTile(key, deltaTime) {
        if (!this.transitioningTiles.has(key)) {
            return this.tileQuality.get(key) || 1.0;
        }
        
        const target = this.targetLOD.get(key);
        if (!target) return 1.0;
        
        const currentQuality = this.tileQuality.get(key) || 1.0;
        const diff = target.quality - currentQuality;
        
        // Calculate transition step
        const step = diff / this.config.transitionSteps;
        const newQuality = currentQuality + step;
        
        // Update quality
        this.tileQuality.set(key, newQuality);
        
        // Update LOD if transition complete
        if (Math.abs(diff) < 0.01) {
            this.tileLOD.set(key, target);
            this.transitioningTiles.delete(key);
        }
        
        return newQuality;
    }

    /**
     * Get current LOD for a tile
     * @param {number} tileX - Tile X index
     * @param {number} tileY - Tile Y index
     */
    getTileLOD(tileX, tileY) {
        const key = `${tileX}_${tileY}`;
        return {
            current: this.tileLOD.get(key),
            target: this.targetLOD.get(key),
            quality: this.tileQuality.get(key) || 1.0,
            isTransitioning: this.transitioningTiles.has(key)
        };
    }

    /**
     * Update all tiles in viewport
     * @param {Array} tiles - Array of tile coordinates [{x, y}]
     * @param {Object} viewport - Viewport info
     * @param {number} deltaTime - Time since last update
     */
    updateTiles(tiles, viewport, deltaTime) {
        const updates = [];
        
        for (const tile of tiles) {
            // Update LOD
            this.updateTileLOD(tile.x, tile.y, viewport);
            
            // Transition quality
            const key = `${tile.x}_${tile.y}`;
            const quality = this.transitionTile(key, deltaTime);
            
            updates.push({
                tileX: tile.x,
                tileY: tile.y,
                quality,
                lod: this.getTileLOD(tile.x, tile.y)
            });
        }
        
        return updates;
    }

    /**
     * Set focus point (for priority LOD)
     */
    setFocusPoint(x, y) {
        this.focusPoint = { x, y };
    }

    /**
     * Get LOD visualization data
     */
    getLODVisualization() {
        const visualization = [];
        
        for (const [key, lod] of this.tileLOD) {
            const [x, y] = key.split('_').map(Number);
            const quality = this.tileQuality.get(key) || 1.0;
            
            visualization.push({
                x, y,
                level: lod.level,
                quality,
                isTransitioning: this.transitioningTiles.has(key)
            });
        }
        
        return visualization;
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            totalTiles: this.tileLOD.size,
            transitioningTiles: this.transitioningTiles.size,
            lodLevels: this.config.lodLevels.length,
            focusPoint: { ...this.focusPoint }
        };
    }

    /**
     * Clear all LOD data
     */
    clear() {
        this.tileLOD.clear();
        this.targetLOD.clear();
        this.tileQuality.clear();
        this.transitioningTiles.clear();
    }
}

// Export
if (typeof window !== 'undefined') {
    window.PerTileLOD = PerTileLOD;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PerTileLOD };
}
