/**
 * Geometry OS: Level of Detail (LOD) System Module
 * 
 * Implements dynamic level of detail rendering based on zoom level.
 * Adjusts rendering quality and technique based on distance and zoom.
 * 
 * Key features:
 * - Multiple LOD levels (Full, Medium, Low, Minimal)
 * - Automatic LOD transitions based on zoom
 * - Region texture generation for distant views
 * - Semantic view for extreme zoom-out
 * - Performance-optimized rendering
 * 
 * @module lod_system
 */

/**
 * LODLevel - Represents a single level of detail
 * 
 * @class LODLevel
 */
class LODLevel {
    /**
     * @param {string} name - Level name
     * @param {number} minZoom - Minimum zoom for this level
     * @param {number} maxZoom - Maximum zoom for this level
     * @param {string} renderMode - Render mode: 'full', 'medium', 'low', 'minimal', 'semantic'
     * @param {number} tileSize - Tile size in pixels at this level
     * @param {number} maxVisibleTiles - Maximum tiles to render at this level
     */
    constructor(name, minZoom, maxZoom, renderMode, tileSize, maxVisibleTiles) {
        this.name = name;
        this.minZoom = minZoom;
        this.maxZoom = maxZoom;
        this.renderMode = renderMode;
        this.tileSize = tileSize;
        this.maxVisibleTiles = maxVisibleTiles;
    }

    /**
     * Check if this level applies to a given zoom
     */
    appliesTo(zoom) {
        return zoom >= this.minZoom && zoom < this.maxZoom;
    }

    /**
     * Get the quality factor (0-1) for this level
     */
    getQualityFactor() {
        switch (this.renderMode) {
            case 'full': return 1.0;
            case 'medium': return 0.7;
            case 'low': return 0.4;
            case 'minimal': return 0.2;
            case 'semantic': return 0.1;
            default: return 0.5;
        }
    }
}

/**
 * LODSystem - Manages level of detail rendering
 * 
 * @class LODSystem
 */
class LODSystem {
    /**
     * @param {Object} config - Configuration
     * @param {ViewportManager} config.viewport - ViewportManager instance
     * @param {number} config.gridSize - Grid size in pixels (default: 100)
     * @param {Array} config.customLevels - Custom LOD levels (optional)
     */
    constructor(config = {}) {
        this.config = {
            viewport: null,
            gridSize: 100,
            ...config
        };

        // LOD levels
        this.levels = config.customLevels || this._createDefaultLevels();

        // Current state
        this.currentLevel = null;
        this.currentZoom = 1.0;
        this.regionCache = new Map(); // "chunkX,chunkY" -> PIXI.Texture
        this.semanticCache = new Map(); // "chunkX,chunkY" -> semantic data

        // Statistics
        this.stats = {
            levelTransitions: 0,
            regionRenders: 0,
            semanticRenders: 0,
            tilesCulled: 0
        };

        console.log('🎚️  LODSystem initialized with', this.levels.length, 'levels');
    }

    /**
     * Create default LOD levels
     */
    _createDefaultLevels() {
        return [
            // Full detail: Individual tiles with textures
            new LODLevel('full', 2.0, Infinity, 'full', 100, 1000),

            // Medium detail: Individual tiles, simplified
            new LODLevel('medium', 1.0, 2.0, 'medium', 100, 500),

            // Low detail: Individual tiles, minimal
            new LODLevel('low', 0.5, 1.0, 'low', 100, 200),

            // Minimal detail: Region textures (chunks)
            new LODLevel('minimal', 0.2, 0.5, 'minimal', 16, 50),

            // Semantic view: Colored rectangles only
            new LODLevel('semantic', 0, 0.2, 'semantic', 1, 20)
        ];
    }

    /**
     * Update LOD based on current viewport zoom
     */
    update() {
        if (!this.config.viewport) {
            return;
        }

        const camera = this.config.viewport.getCamera();
        this.currentZoom = camera.zoom;

        // Find appropriate LOD level
        const newLevel = this.levels.find(level => level.appliesTo(this.currentZoom));

        if (newLevel && newLevel !== this.currentLevel) {
            this.currentLevel = newLevel;
            this.stats.levelTransitions++;
            console.log(`🎚️  LOD transition: ${newLevel.name} (zoom: ${this.currentZoom.toFixed(2)})`);
        }
    }

    /**
     * Get current LOD level
     */
    getCurrentLevel() {
        return this.currentLevel || this.levels[0];
    }

    /**
     * Check if a tile should be rendered at current LOD
     */
    shouldRenderTile(tileData, visibleCount) {
        const level = this.getCurrentLevel();

        // Check if we've exceeded max visible tiles
        if (visibleCount >= level.maxVisibleTiles) {
            this.stats.tilesCulled++;
            return false;
        }

        // For semantic view, only render a subset
        if (level.renderMode === 'semantic') {
            // Render every Nth tile based on zoom
            const skipFactor = Math.floor(1 / this.currentZoom);
            const shouldRender = (tileData.x % skipFactor === 0) && (tileData.y % skipFactor === 0);
            return shouldRender;
        }

        return true;
    }

    /**
     * Get render options for a tile at current LOD
     */
    getRenderOptions(tileData) {
        const level = this.getCurrentLevel();
        const quality = level.getQualityFactor();

        const options = {
            alpha: 0.8 * quality,
            width: this.config.gridSize,
            height: this.config.gridSize,
            zIndex: -100
        };

        // Adjust based on render mode
        switch (level.renderMode) {
            case 'full':
                options.alpha = 0.8;
                break;
            case 'medium':
                options.alpha = 0.6;
                break;
            case 'low':
                options.alpha = 0.4;
                break;
            case 'minimal':
                options.alpha = 0.3;
                break;
            case 'semantic':
                options.alpha = 0.2;
                break;
        }

        return options;
    }

    /**
     * Generate a region texture for a chunk
     */
    async generateRegionTexture(chunkX, chunkY, chunkData) {
        const key = `${chunkX},${chunkY}`;

        // Check cache
        const cached = this.regionCache.get(key);
        if (cached) {
            return cached;
        }

        // Create off-screen canvas for region rendering
        const canvas = document.createElement('canvas');
        const size = 4096; // High resolution for region texture
        canvas.width = size;
        canvas.height = size;
        const ctx = canvas.getContext('2d');

        // Draw tiles onto canvas (simplified representation)
        const tileSize = size / chunkData.tiles.length;

        for (const tile of chunkData.tiles) {
            const x = tile.x * tileSize;
            const y = tile.y * tileSize;

            // Draw simplified tile representation
            ctx.fillStyle = this._getTileColor(tile);
            ctx.fillRect(x, y, tileSize, tileSize);
        }

        // Create PIXI texture from canvas
        const texture = PIXI.Texture.from(canvas);

        // Cache the texture
        this.regionCache.set(key, texture);
        this.stats.regionRenders++;

        console.log(`🎚️  Generated region texture for chunk (${chunkX}, ${chunkY})`);
        return texture;
    }

    /**
     * Get semantic color for a tile
     */
    _getTileColor(tileData) {
        // Generate color based on tile properties
        const hash = this._hashString(tileData.brick || 'default');
        const hue = hash % 360;
        return `hsl(${hue}, 70%, 50%)`;
    }

    /**
     * Hash a string to a number
     */
    _hashString(str) {
        let hash = 0;
        for (let i = 0; i < str.length; i++) {
            const char = str.charCodeAt(i);
            hash = ((hash << 5) - hash) + char;
            hash = hash & hash;
        }
        return Math.abs(hash);
    }

    /**
     * Render semantic view (colored rectangles)
     */
    renderSemanticView(container, tiles, gridSize) {
        const level = this.getCurrentLevel();

        // Clear container
        container.removeChildren();

        // Create graphics object for semantic view
        const graphics = new PIXI.Graphics();

        for (const tile of tiles) {
            const x = tile.x * gridSize;
            const y = tile.y * gridSize;
            const color = this._getTileColor(tile);
            const hexColor = this._colorToHex(color);

            graphics.beginFill(hexColor, 0.5);
            graphics.drawRect(x, y, gridSize, gridSize);
            graphics.endFill();
        }

        container.addChild(graphics);
        this.stats.semanticRenders++;

        return graphics;
    }

    /**
     * Convert HSL color to hex
     */
    _colorToHex(hsl) {
        // Parse HSL string
        const match = hsl.match(/hsl\((\d+),\s*(\d+)%,\s*(\d+)%\)/);
        if (!match) return 0x888888;

        const h = parseInt(match[1]) / 360;
        const s = parseInt(match[2]) / 100;
        const l = parseInt(match[3]) / 100;

        let r, g, b;

        if (s === 0) {
            r = g = b = l;
        } else {
            const hue2rgb = (p, q, t) => {
                if (t < 0) t += 1;
                if (t > 1) t -= 1;
                if (t < 1 / 6) return p + (q - p) * 6 * t;
                if (t < 1 / 2) return q;
                if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
                return p;
            };

            const q = l < 0.5 ? l * (1 + s) : l + s - l * s;
            const p = 2 * l - q;
            r = hue2rgb(p, q, h + 1 / 3);
            g = hue2rgb(p, q, h);
            b = hue2rgb(p, q, h - 1 / 3);
        }

        return (Math.round(r * 255) << 16) | (Math.round(g * 255) << 8) | Math.round(b * 255);
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            ...this.stats,
            currentLevel: this.currentLevel ? this.currentLevel.name : 'none',
            currentZoom: this.currentZoom,
            regionCacheSize: this.regionCache.size,
            semanticCacheSize: this.semanticCache.size
        };
    }

    /**
     * Clear caches
     */
    clearCaches() {
        // Destroy cached textures
        for (const texture of this.regionCache.values()) {
            if (texture && texture.destroy) {
                texture.destroy(true);
            }
        }
        this.regionCache.clear();
        this.semanticCache.clear();

        console.log('🎚️  LOD caches cleared');
    }

    /**
     * Destroy the LOD system
     */
    destroy() {
        this.clearCaches();
        console.log('🎚️  LODSystem destroyed');
    }
}

/**
 * LODRenderer - High-level renderer that uses LOD system
 * 
 * @class LODRenderer
 */
class LODRenderer {
    /**
     * @param {Object} config - Configuration
     * @param {PIXI.Container} config.container - Parent container
     * @param {LODSystem} config.lodSystem - LODSystem instance
     * @param {SpritePool} config.spritePool - SpritePool instance
     */
    constructor(config = {}) {
        this.config = {
            container: null,
            lodSystem: null,
            spritePool: null,
            ...config
        };

        // Semantic view container
        this.semanticContainer = new PIXI.Container();
        this.semanticContainer.zIndex = -50;

        if (this.config.container) {
            this.config.container.addChild(this.semanticContainer);
        }

        // Statistics
        this.stats = {
            tilesRendered: 0,
            regionsRendered: 0,
            framesRendered: 0
        };

        console.log('🎨 LODRenderer initialized');
    }

    /**
     * Render tiles with LOD
     */
    async render(tiles) {
        const level = this.config.lodSystem.getCurrentLevel();
        this.stats.framesRendered++;
        this.stats.tilesRendered = 0;

        // Handle different render modes
        switch (level.renderMode) {
            case 'semantic':
                this._renderSemantic(tiles);
                break;
            case 'minimal':
                await this._renderMinimal(tiles);
                break;
            case 'low':
            case 'medium':
            case 'full':
            default:
                await this._renderTiles(tiles);
                break;
        }

        return this.stats.tilesRendered;
    }

    /**
     * Render semantic view
     */
    _renderSemantic(tiles) {
        this.config.lodSystem.renderSemanticView(
            this.semanticContainer,
            tiles,
            this.config.lodSystem.config.gridSize
        );
        this.stats.tilesRendered = tiles.length;
    }

    /**
     * Render minimal view (region textures)
     */
    async _renderMinimal(tiles) {
        // Group tiles by chunk
        const chunks = this._groupTilesByChunk(tiles);

        for (const [chunkKey, chunkTiles] of chunks) {
            const [chunkX, chunkY] = chunkKey.split(',').map(Number);

            // Generate or get region texture
            const texture = await this.config.lodSystem.generateRegionTexture(
                chunkX,
                chunkY,
                { tiles: chunkTiles }
            );

            if (texture) {
                // Create sprite for region
                const sprite = this.config.spritePool.acquire();
                sprite.texture = texture;
                sprite.x = chunkX * 16 * this.config.lodSystem.config.gridSize;
                sprite.y = chunkY * 16 * this.config.lodSystem.config.gridSize;
                sprite.width = 16 * this.config.lodSystem.config.gridSize;
                sprite.height = 16 * this.config.lodSystem.config.gridSize;
                sprite.alpha = 0.5;
                sprite.zIndex = -80;

                this.stats.tilesRendered += chunkTiles.length;
                this.stats.regionsRendered++;
            }
        }
    }

    /**
     * Render individual tiles
     */
    async _renderTiles(tiles) {
        let visibleCount = 0;

        for (const tileData of tiles) {
            // Check if should render at current LOD
            if (!this.config.lodSystem.shouldRenderTile(tileData, visibleCount)) {
                continue;
            }

            // Get render options
            const options = this.config.lodSystem.getRenderOptions(tileData);

            // Create tile sprite
            const sprite = await this.config.spritePool.createTileSprite(
                tileData.x * this.config.lodSystem.config.gridSize,
                tileData.y * this.config.lodSystem.config.gridSize,
                `/builder/queue/${tileData.brick}?t=${tileData.timestamp}`,
                options
            );

            if (sprite) {
                visibleCount++;
                this.stats.tilesRendered++;
            }
        }
    }

    /**
     * Group tiles by chunk
     */
    _groupTilesByChunk(tiles) {
        const chunks = new Map();

        for (const tile of tiles) {
            const chunkX = Math.floor(tile.x / 16);
            const chunkY = Math.floor(tile.y / 16);
            const key = `${chunkX},${chunkY}`;

            if (!chunks.has(key)) {
                chunks.set(key, []);
            }
            chunks.get(key).push(tile);
        }

        return chunks;
    }

    /**
     * Clear rendered content
     */
    clear() {
        this.semanticContainer.removeChildren();
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            ...this.stats,
            lodStats: this.config.lodSystem.getStats()
        };
    }

    /**
     * Destroy the renderer
     */
    destroy() {
        this.clear();

        if (this.semanticContainer.parent) {
            this.semanticContainer.parent.removeChild(this.semanticContainer);
        }

        console.log('🎨 LODRenderer destroyed');
    }
}

// Export for use in other modules
if (typeof window !== 'undefined') {
    window.LODLevel = LODLevel;
    window.LODSystem = LODSystem;
    window.LODRenderer = LODRenderer;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        LODLevel,
        LODSystem,
        LODRenderer
    };
}
