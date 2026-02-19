/**
 * NeuralCityRenderer - PIXI.js renderer for Neural City visualization
 *
 * Renders the qwen_coder.rts.png weight atlas as an interactive city
 * with foveated LOD (Level of Detail) support.
 *
 * Materials:
 * - Gold: F32 (Full Precision)
 * - Steel: Q8 (8-bit Quantization)
 * - Rust: Q4 (4-bit Quantization)
 * - Dust: Sparse/Zero Weights
 */

class NeuralCityRenderer {
    constructor(config = {}) {
        this.config = {
            app: config.app,
            atlasPath: config.atlasPath || '/systems/neural_city/atlases/low_res_overview.rts.png',
            metadataPath: config.metadataPath || '/systems/neural_city/district_metadata.json',
            districtSize: config.districtSize || 512,
            maxCacheSize: config.maxCacheSize || 64,
            blendDuration: config.blendDuration || 300,
            ...config
        };

        // PIXI components
        this.app = this.config.app;
        this.container = null;
        this.lowResSprite = null;
        this.filter = null;

        // District cache (LRU)
        this.atlasCache = new Map();
        this.loadedDistricts = new Set();

        // District metadata
        this.districtMetadata = null;
        this.totalDistricts = 0;

        // Current foveal state
        this.focusDistrict = { x: 0, y: 0 };

        // Stats
        this.stats = {
            loaded: 0,
            total: 0,
            vramMB: 0,
            focusMaterial: 'unknown'
        };

        console.log('NeuralCityRenderer initialized');
    }

    pixelToDistrict(px, py) {
        return {
            x: Math.floor(px / this.config.districtSize),
            y: Math.floor(py / this.config.districtSize)
        };
    }

    districtToPixel(dx, dy) {
        return {
            x: dx * this.config.districtSize,
            y: dy * this.config.districtSize
        };
    }

    getDistrictId(dx, dy) {
        return `${dx}_${dy}`;
    }

    getStats() {
        return {
            loaded: this.stats.loaded,
            total: this.stats.total,
            vramMB: this.stats.vramMB,
            focusMaterial: this.stats.focusMaterial
        };
    }

    calculateVRAM() {
        const tileSizeMB = (this.config.districtSize * this.config.districtSize * 4) / (1024 * 1024);
        return Math.round(this.atlasCache.size * tileSizeMB);
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.NeuralCityRenderer = NeuralCityRenderer;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { NeuralCityRenderer };
}
