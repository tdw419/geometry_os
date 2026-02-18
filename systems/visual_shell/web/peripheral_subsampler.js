/**
 * PeripheralSubsampler
 *
 * Reduces rendering resolution for peripheral regions based on
 * distance from the current focus point (foveal region).
 *
 * Resolution tiers:
 * - Foveal (< 50px): 100% resolution
 * - Parafoveal (50-150px): 50% resolution
 * - Peripheral (> 150px): 25% resolution
 *
 * This mimics human vision where only the fovea processes high detail.
 */

class PeripheralSubsampler {
    constructor(config = {}) {
        this.config = {
            fovealRadius: config.fovealRadius || 50,
            parafovealRadius: config.parafovealRadius || 150,
            peripheralRadius: config.peripheralRadius || 400,

            // Resolution multipliers per region
            fovealResolution: config.fovealResolution || 1.0,
            parafovealResolution: config.parafovealResolution || 0.5,
            peripheralResolution: config.peripheralResolution || 0.25,

            // Smoothing for transitions
            transitionSmoothing: config.transitionSmoothing || 0.1
        };

        // Current focus point
        this.focusX = 0;
        this.focusY = 0;

        // Statistics
        this.stats = {
            fovealPixels: 0,
            parafovealPixels: 0,
            peripheralPixels: 0,
            totalPixels: 0
        };

        console.log('✓ PeripheralSubsampler initialized');
    }

    /**
     * Set the current focus point.
     * @param {number} x - Focus X coordinate
     * @param {number} y - Focus Y coordinate
     */
    setFocus(x, y) {
        this.focusX = x;
        this.focusY = y;
    }

    /**
     * Get the region for a point relative to focus.
     * @param {number} x - Point X coordinate
     * @param {number} y - Point Y coordinate
     * @param {number} focusX - Focus X coordinate
     * @param {number} focusY - Focus Y coordinate
     * @returns {string} Region name ('foveal', 'parafoveal', 'peripheral')
     */
    getRegion(x, y, focusX, focusY) {
        const dx = x - focusX;
        const dy = y - focusY;
        const distance = Math.sqrt(dx * dx + dy * dy);

        if (distance <= this.config.fovealRadius) {
            return 'foveal';
        } else if (distance <= this.config.parafovealRadius) {
            return 'parafoveal';
        } else {
            return 'peripheral';
        }
    }

    /**
     * Get the resolution multiplier for a point.
     * @param {number} x - Point X coordinate
     * @param {number} y - Point Y coordinate
     * @param {number} focusX - Focus X coordinate
     * @param {number} focusY - Focus Y coordinate
     * @returns {number} Resolution multiplier (0.25 - 1.0)
     */
    getResolution(x, y, focusX, focusY) {
        const region = this.getRegion(x, y, focusX, focusY);

        switch (region) {
            case 'foveal':
                return this.config.fovealResolution;
            case 'parafoveal':
                return this.config.parafovealResolution;
            case 'peripheral':
            default:
                return this.config.peripheralResolution;
        }
    }

    /**
     * Calculate the overall load reduction for a set of tiles.
     * @param {Array} tiles - Array of tile objects with {x, y, width, height}
     * @param {number} focusX - Focus X coordinate
     * @param {number} focusY - Focus Y coordinate
     * @returns {Object} Load reduction statistics
     */
    calculateLoadReduction(tiles, focusX, focusY) {
        let fovealPixels = 0;
        let parafovealPixels = 0;
        let peripheralPixels = 0;
        let totalPixels = 0;
        let weightedPixels = 0;

        for (const tile of tiles) {
            const centerX = tile.x + tile.width / 2;
            const centerY = tile.y + tile.height / 2;
            const pixels = tile.width * tile.height;

            const region = this.getRegion(centerX, centerY, focusX, focusY);
            const resolution = this.getResolution(centerX, centerY, focusX, focusY);

            totalPixels += pixels;
            weightedPixels += pixels * resolution;

            if (region === 'foveal') {
                fovealPixels += pixels;
            } else if (region === 'parafoveal') {
                parafovealPixels += pixels;
            } else {
                peripheralPixels += pixels;
            }
        }

        // Load reduction = 1 - (weighted / total)
        const loadReduction = 1 - (weightedPixels / totalPixels);

        return {
            totalPixels,
            weightedPixels,
            loadReduction: loadReduction * 100, // As percentage
            fovealPixels,
            parafovealPixels,
            peripheralPixels,
            meetsTarget: loadReduction >= 0.5 // 50% reduction target
        };
    }

    /**
     * Get current statistics.
     * @returns {Object} Statistics object
     */
    getStats() {
        return {
            ...this.stats,
            config: this.config,
            focus: { x: this.focusX, y: this.focusY }
        };
    }
}

// Export
if (typeof window !== 'undefined') {
    window.PeripheralSubsampler = PeripheralSubsampler;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PeripheralSubsampler };
}
