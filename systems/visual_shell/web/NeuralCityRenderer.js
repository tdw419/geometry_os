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

        // Pulse buffer for LM Studio inference visualization
        this.pulseBuffer = [];
        this.pulseBufferMaxSize = 64;
        this.pulseTTL = 1000; // milliseconds

        // Stats
        this.stats = {
            loaded: 0,
            total: 0,
            vramMB: 0,
            focusMaterial: 'unknown',
            metabolismIPC: 0.5,
            throttleLevel: 'NONE'
        };

        // Camera navigation (Task 4: Synaptic Query Interface)
        this.navigationTarget = null;
        this.navigationStart = null;
        this.navigationDuration = 1000;
        this.navigationElapsed = 0;

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
            focusMaterial: this.stats.focusMaterial,
            metabolismIPC: this.stats.metabolismIPC,
            throttleLevel: this.stats.throttleLevel,
            pulseCount: this.pulseBuffer.length
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
    async setFocus(x, y) {
        const prevFocus = { ...this.focusDistrict };
        this.focusDistrict = this.pixelToDistrict(x, y);

        if (this.filter) {
            this.filter.setFocusDistrict(x, y);
        }

        // Auto-load hi-res district if focus changed
        if (this.focusDistrict.x !== prevFocus.x || this.focusDistrict.y !== prevFocus.y) {
            await this.loadDistrict(this.focusDistrict.x, this.focusDistrict.y);

            // Update filter with new hi-res texture if available
            const hiRes = this.getHiResTexture();
            if (hiRes && this.filter) {
                this.filter.setHiResTexture(hiRes);
            }
        }

        const districtId = this.getDistrictId(this.focusDistrict.x, this.focusDistrict.y);
        if (this.districtMetadata && this.districtMetadata.districts) {
            const meta = this.districtMetadata.districts.find(
                d => d.id === districtId
            );
            if (meta) {
                this.stats.focusMaterial = meta.dominant_q;
            }
        }
    }

    /**
     * Set zoom level for LOD (Level of Detail) control
     * @param {number} zoom - Zoom level (1.0 = 100%, 2.0 = 200%, etc.)
     */
    setZoom(zoom) {
        if (this.filter) {
            this.filter.setZoom(zoom);
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
            const texture = await this.extractTile(dx, dy);

            if (!texture) {
                return null;
            }

            // Add to cache
            this.atlasCache.set(districtId, {
                texture: texture,
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
     * Extract a 512x512 tile from the source RTS via Tile Server
     * @param {number} dx - District X
     * @param {number} dy - District Y
     * @returns {Promise<PIXI.Texture|null>}
     */
    async extractTile(dx, dy) {
        const x = dx * this.config.districtSize;
        const y = dy * this.config.districtSize;
        const url = `http://127.0.0.1:8000/tile/${x}/${y}`;

        try {
            const response = await fetch(url);
            if (!response.ok) {
                throw new Error(`Tile server error: ${response.status}`);
            }

            const buffer = await response.arrayBuffer();
            const data = new Uint8Array(buffer);

            // Create PIXI.Texture from raw RGBA buffer
            // Note: PIXI v8 uses Texture.fromBuffer or similar
            const resource = new PIXI.BufferResource(data, {
                width: this.config.districtSize,
                height: this.config.districtSize
            });

            const baseTexture = new PIXI.BaseTexture(resource);
            const texture = new PIXI.Texture(baseTexture);

            return texture;
        } catch (err) {
            console.warn(`Failed to fetch tile from ${url}:`, err.message);
            return null;
        }
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

    /**
     * Set the safety quarantine mask
     * @param {Float32Array} mask - 32x32 mask (1.0 = quarantined)
     */
    setSafetyMask(mask) {
        this.safetyMask = mask;
        this.safetyMaskSize = 32;

        // Update filter uniform if available
        if (this.filter && this.filter.uniforms) {
            this.filter.uniforms.uSafetyMask = mask;
        }
    }

    /**
     * Get quarantine status for a district
     * @param {number} dx - District X coordinate (0-31, not pixels)
     * @param {number} dy - District Y coordinate (0-31, not pixels)
     * @returns {number} 1.0 if quarantined, 0.0 otherwise
     */
    getQuarantineStatus(dx, dy) {
        if (!this.safetyMask) return 0.0;

        // Direct 1:1 mapping: district coordinates map directly to mask cells
        const maskX = Math.floor(dx);
        const maskY = Math.floor(dy);

        // Bounds check
        if (maskX < 0 || maskX >= this.safetyMaskSize || maskY < 0 || maskY >= this.safetyMaskSize) {
            return 0.0;
        }

        const index = maskY * this.safetyMaskSize + maskX;
        return this.safetyMask[index] || 0.0;
    }

    /**
     * Clear all quarantine entries
     */
    clearSafetyMask() {
        if (this.safetyMask) {
            this.safetyMask.fill(0.0);
        }
    }

    /**
     * Set quarantine status for a specific district
     * @param {number} dx - District X coordinate (0-31, not pixels)
     * @param {number} dy - District Y coordinate (0-31, not pixels)
     * @param {boolean} quarantined - True to quarantine
     */
    setQuarantineStatus(dx, dy, quarantined) {
        if (!this.safetyMask) {
            this.safetyMask = new Float32Array(32 * 32);
            this.safetyMaskSize = 32;
        }

        // Direct 1:1 mapping
        const maskX = Math.floor(dx);
        const maskY = Math.floor(dy);

        // Bounds check
        if (maskX < 0 || maskX >= this.safetyMaskSize || maskY < 0 || maskY >= this.safetyMaskSize) {
            return;
        }

        const index = maskY * this.safetyMaskSize + maskX;
        this.safetyMask[index] = quarantined ? 1.0 : 0.0;
    }

    /**
     * Add a pulse at the given coordinate
     * @param {number} x - X coordinate (world space)
     * @param {number} y - Y coordinate (world space)
     * @param {number} timestamp - When the pulse occurred
     * @param {number} pulseType - 0.0 for Neural (Cyan), 1.0 for Silicon (Green)
     */
    addPulse(x, y, timestamp, pulseType = 0.0) {
        this.pulseBuffer.push({
            coords: { x, y },
            timestamp,
            type: pulseType
        });

        // Enforce max size
        while (this.pulseBuffer.length > this.pulseBufferMaxSize) {
            this.pulseBuffer.shift();
        }

        // Update filter
        this._updatePulseUniforms();
    }

    /**
     * Remove pulses older than TTL
     * @param {number} ttl - Time-to-live in milliseconds
     */
    expireOldPulses(ttl = this.pulseTTL) {
        const now = Date.now();
        this.pulseBuffer = this.pulseBuffer.filter(p =>
            now - p.timestamp < ttl
        );
        this._updatePulseUniforms();
    }

    /**
     * Clear all pulses
     */
    clearPulses() {
        this.pulseBuffer = [];
        this._updatePulseUniforms();
    }

    /**
     * Update filter uniforms with pulse data
     * @private
     */
    _updatePulseUniforms() {
        if (!this.filter) return;

        // Pack pulse coords into arrays for shader
        const pulseX = new Float32Array(64);
        const pulseY = new Float32Array(64);
        const pulseAge = new Float32Array(64);
        const pulseType = new Float32Array(64);

        const now = Date.now();
        for (let i = 0; i < Math.min(this.pulseBuffer.length, 64); i++) {
            const pulse = this.pulseBuffer[i];
            pulseX[i] = pulse.coords.x;
            pulseY[i] = pulse.coords.y;
            pulseAge[i] = (now - pulse.timestamp) / 1000; // seconds
            pulseType[i] = pulse.type;
        }

        this.filter.uniforms.uPulseX = pulseX;
        this.filter.uniforms.uPulseY = pulseY;
        this.filter.uniforms.uPulseAge = pulseAge;
        this.filter.uniforms.uPulseType = pulseType;
        this.filter.uniforms.uPulseCount = this.pulseBuffer.length;
    }

    /**
     * Update metabolism values for ambient lighting control
     * Task 5: Metabolism Ambient Lighting
     * @param {Object} data - Metabolism data
     * @param {number} data.ipc - Instructions per cycle (0.0 to 1.0)
     * @param {string} data.throttle_level - Throttle level: 'NONE', 'MODERATE', 'AGGRESSIVE'
     */
    updateMetabolism(data) {
        if (!data || typeof data !== 'object') {
            console.warn('NeuralCityRenderer.updateMetabolism: invalid data', data);
            return;
        }

        const ipc = data.ipc ?? 0.5;
        const throttleLevel = data.throttle_level ?? 'NONE';

        this.stats.metabolismIPC = ipc;
        this.stats.throttleLevel = throttleLevel;

        if (this.filter) {
            this.filter.setMetabolism(ipc, throttleLevel);
        }
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
