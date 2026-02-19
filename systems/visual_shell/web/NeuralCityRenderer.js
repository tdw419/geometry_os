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

// Import NeuralCityFilter for Node.js/CommonJS environments
let NeuralCityFilter;
if (typeof module !== 'undefined' && module.exports) {
    const filterModule = require('./NeuralCityFilter.js');
    NeuralCityFilter = filterModule.NeuralCityFilter;
}

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

    /**
     * Load district metadata from JSON
     * @returns {Promise<void>}
     */
    async loadMetadata() {
        try {
            const response = await fetch(this.config.metadataPath);
            if (!response.ok) {
                throw new Error(`Failed to load metadata: ${response.status}`);
            }
            this.districtMetadata = await response.json();
            this.totalDistricts = this.districtMetadata.length;
            this.stats.total = this.totalDistricts;
            console.log(`✓ Loaded metadata for ${this.totalDistricts} districts`);
        } catch (err) {
            console.warn('Failed to load district metadata:', err.message);
            this.districtMetadata = [];
            this.totalDistricts = 0;
        }
    }

    /**
     * Create the PIXI container with low-res atlas sprite
     * @returns {Promise<PIXI.Container>}
     */
    async createContainer() {
        this.container = new PIXI.Container();
        this.container.name = 'NeuralCity';

        try {
            const texture = await PIXI.Assets.load(this.config.atlasPath);
            this.lowResSprite = new PIXI.Sprite(texture);
            this.lowResSprite.name = 'NeuralCityLowRes';
            this.container.addChild(this.lowResSprite);
            console.log(`✓ Loaded low-res atlas: ${texture.width}x${texture.height}`);
        } catch (err) {
            console.error('Failed to load low-res atlas:', err.message);
            throw err;
        }

        return this.container;
    }

    /**
     * Initialize the renderer (load metadata + create container)
     * @returns {Promise<PIXI.Container>}
     */
    async initialize() {
        await this.loadMetadata();
        const container = await this.createContainer();
        console.log('NeuralCityRenderer ready');
        return container;
    }

    /**
     * Destroy and cleanup resources
     */
    destroy() {
        if (this.container) {
            this.container.destroy({ children: true });
            this.container = null;
        }
        this.atlasCache.clear();
        this.loadedDistricts.clear();
        console.log('NeuralCityRenderer destroyed');
    }

    /**
     * Apply the Neural City filter to the sprite
     */
    applyFilter() {
        if (!this.lowResSprite) {
            console.warn('Cannot apply filter: sprite not loaded');
            return;
        }

        if (!this.filter) {
            this.filter = new NeuralCityFilter({
                lowResTexture: this.lowResSprite.texture
            });
            console.log('✓ Created NeuralCityFilter');
        }

        this.lowResSprite.filters = [this.filter];
    }

    /**
     * Update renderer state (call each frame)
     * @param {number} deltaTime - Time since last frame in seconds
     */
    tick(deltaTime) {
        if (this.filter) {
            this.filter.updateTime(
                (this.filter.uniforms.uTime || 0) + deltaTime
            );
        }
    }

    /**
     * Set focus point for foveated rendering
     * @param {number} x - Focus X in world coordinates
     * @param {number} y - Focus Y in world coordinates
     */
    setFocus(x, y) {
        this.focusDistrict = this.pixelToDistrict(x, y);

        if (this.filter) {
            this.filter.setFocusDistrict(x, y);
        }

        const districtId = this.getDistrictId(this.focusDistrict.x, this.focusDistrict.y);
        if (this.districtMetadata) {
            const meta = this.districtMetadata.find(
                d => d.x === this.focusDistrict.x && d.y === this.focusDistrict.y
            );
            if (meta) {
                const q = meta.dominant_q;
                if (q < 0.25) this.stats.focusMaterial = 'Gold (F32)';
                else if (q < 0.5) this.stats.focusMaterial = 'Steel (Q8)';
                else if (q < 0.75) this.stats.focusMaterial = 'Rust (Q4)';
                else this.stats.focusMaterial = 'Dust (Sparse)';
            }
        }
    }

    /**
     * Handle viewport resize
     * @param {number} width - New width
     * @param {number} height - New height
     */
    resize(width, height) {
        if (this.filter) {
            this.filter.setResolution(width, height);
        }
    }

    /**
     * Load a hi-res district tile on demand
     * @param {number} dx - District X
     * @param {number} dy - District Y
     * @returns {Promise<Object|null>}
     */
    async loadDistrict(dx, dy) {
        const districtId = this.getDistrictId(dx, dy);

        // Check cache first
        if (this.atlasCache.has(districtId)) {
            const cached = this.atlasCache.get(districtId);
            cached.lastUsed = Date.now();
            return cached;
        }

        // Extract tile from source RTS
        try {
            const tile = await this.extractTile(dx, dy);

            if (!tile) {
                return null;
            }

            // Add to cache
            this.atlasCache.set(districtId, {
                texture: tile.texture || tile,
                lastUsed: Date.now()
            });

            this.loadedDistricts.add(districtId);
            this.stats.loaded = this.loadedDistricts.size;
            this.stats.vramMB = this.calculateVRAM();

            console.log(`✓ Loaded district ${districtId} (cache: ${this.atlasCache.size}/${this.config.maxCacheSize})`);

            // Evict if over limit
            this._evictIfNeeded();

            return this.atlasCache.get(districtId);
        } catch (err) {
            console.warn(`Failed to load district ${districtId}:`, err.message);
            return null;
        }
    }

    /**
     * Extract a 512x512 tile from the source RTS
     * Override this method to implement actual extraction
     * @param {number} dx - District X
     * @param {number} dy - District Y
     * @returns {Promise<Object|null>}
     */
    async extractTile(dx, dy) {
        // Placeholder - in production, this would:
        // 1. Load source qwen_coder.rts.png if not loaded
        // 2. Extract 512x512 region at (dx*512, dy*512)
        // 3. Create PIXI.Texture from extracted region

        // For now, return a mock tile for testing
        return { texture: { width: 512, height: 512 }, mock: true };
    }

    /**
     * Evict oldest tiles if cache is full (LRU policy)
     * @private
     */
    _evictIfNeeded() {
        while (this.atlasCache.size > this.config.maxCacheSize) {
            // Find oldest entry
            let oldestId = null;
            let oldestTime = Infinity;

            for (const [id, entry] of this.atlasCache) {
                if (entry.lastUsed < oldestTime) {
                    oldestTime = entry.lastUsed;
                    oldestId = id;
                }
            }

            if (oldestId) {
                this.atlasCache.delete(oldestId);
                this.loadedDistricts.delete(oldestId);
                console.log(`  Evicted district ${oldestId}`);
            }
        }

        this.stats.loaded = this.loadedDistricts.size;
        this.stats.vramMB = this.calculateVRAM();
    }

    /**
     * Get the current hi-res texture for the focused district
     * @returns {Object|null}
     */
    getHiResTexture() {
        const districtId = this.getDistrictId(this.focusDistrict.x, this.focusDistrict.y);
        if (this.atlasCache.has(districtId)) {
            return this.atlasCache.get(districtId).texture;
        }
        return null;
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
