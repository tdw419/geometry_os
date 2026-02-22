/**
 * Geometry OS: Sprite Pool Module
 * 
 * Implements object pooling for PixiJS sprites to minimize garbage collection
 * and improve rendering performance. Instead of creating/destroying sprites,
 * we reuse a fixed pool of sprites.
 * 
 * Key features:
 * - Fixed-size pool to prevent memory growth
 * - Automatic recycling of off-screen sprites
 * - Texture caching to avoid redundant loads
 * - Efficient sprite allocation and deallocation
 * 
 * @module sprite_pool
 */

/**
 * SpritePool - Manages a pool of reusable PixiJS sprites
 * 
 * @class SpritePool
 */
class SpritePool {
    /**
     * @param {Object} config - Configuration
     * @param {PIXI.Container} config.container - Parent container for sprites
     * @param {number} config.initialSize - Initial pool size (default: 500)
     * @param {number} config.maxSize - Maximum pool size (default: 2000)
     * @param {number} config.growthFactor - Pool growth factor when exhausted (default: 1.5)
     */
    constructor(config = {}) {
        this.config = {
            container: null,
            initialSize: 500,
            maxSize: 2000,
            growthFactor: 1.5,
            ...config
        };

        // Sprite pools
        this.availableSprites = []; // Available for reuse
        this.activeSprites = new Map(); // "x,y" -> sprite
        this.textureCache = new Map(); // URL -> PIXI.Texture

        // Statistics
        this.stats = {
            totalAllocated: 0,
            totalReused: 0,
            totalReleased: 0,
            poolSize: 0,
            textureCacheSize: 0
        };

        console.log('🎨 SpritePool initialized', this.config);
    }

    /**
     * Initialize the sprite pool
     */
    initialize() {
        if (!this.config.container) {
            console.warn('SpritePool: No container provided, sprites will not be added to scene');
        }

        // Pre-allocate initial sprites
        this._growPool(this.config.initialSize);

        console.log(`🎨 SpritePool ready with ${this.stats.poolSize} sprites`);
    }

    /**
     * Grow the pool by creating new sprites
     */
    _growPool(count) {
        const targetSize = Math.min(
            this.stats.poolSize + count,
            this.config.maxSize
        );

        const toAdd = targetSize - this.stats.poolSize;

        for (let i = 0; i < toAdd; i++) {
            const sprite = new PIXI.Sprite();
            sprite.visible = false;
            sprite.alpha = 0;

            // Add to container if available
            if (this.config.container) {
                this.config.container.addChild(sprite);
            }

            this.availableSprites.push(sprite);
        }

        this.stats.poolSize = targetSize;
        this.stats.totalAllocated += toAdd;

        console.log(`🎨 Pool grown by ${toAdd} sprites (total: ${this.stats.poolSize})`);
    }

    /**
     * Acquire a sprite from the pool
     */
    acquire() {
        let sprite;

        // Try to get from available pool
        if (this.availableSprites.length > 0) {
            sprite = this.availableSprites.pop();
            this.stats.totalReused++;
        } else {
            // Pool exhausted, try to grow
            if (this.stats.poolSize < this.config.maxSize) {
                const growth = Math.floor(
                    this.stats.poolSize * (this.config.growthFactor - 1)
                );
                this._growPool(Math.max(growth, 10));

                if (this.availableSprites.length > 0) {
                    sprite = this.availableSprites.pop();
                    this.stats.totalReused++;
                }
            }
        }

        if (!sprite) {
            console.warn('🎨 SpritePool exhausted, creating temporary sprite');
            sprite = new PIXI.Sprite();
            if (this.config.container) {
                this.config.container.addChild(sprite);
            }
        }

        // Reset sprite state
        sprite.visible = true;
        sprite.alpha = 1;
        sprite.x = 0;
        sprite.y = 0;
        sprite.width = 0;
        sprite.height = 0;
        sprite.rotation = 0;
        sprite.scale.set(1);
        sprite.anchor.set(0);
        sprite.zIndex = 0;

        return sprite;
    }

    /**
     * Release a sprite back to the pool
     */
    release(sprite) {
        if (!sprite) return;

        // Hide sprite
        sprite.visible = false;
        sprite.alpha = 0;

        // Return to pool
        this.availableSprites.push(sprite);
        this.stats.totalReleased++;
    }

    /**
     * Release multiple sprites at once
     */
    releaseAll(sprites) {
        sprites.forEach(sprite => this.release(sprite));
    }

    /**
     * Get or load a texture
     */
    async getTexture(url) {
        // Check cache
        const cached = this.textureCache.get(url);
        if (cached) {
            return cached;
        }

        try {
            // Load texture using PixiJS adapter
            const texture = await window.PixiJSV8Adapter.loadTexture(url);

            // Cache the texture
            this.textureCache.set(url, texture);
            this.stats.textureCacheSize = this.textureCache.size;

            return texture;
        } catch (error) {
            console.error(`❌ Failed to load texture: ${url}`, error);
            return null;
        }
    }

    /**
     * Preload textures
     */
    async preloadTextures(urls) {
        const promises = urls.map(url => this.getTexture(url));
        return Promise.all(promises);
    }

    /**
     * Create a sprite with a texture at a specific position
     */
    async createTileSprite(x, y, textureUrl, options = {}) {
        const texture = await this.getTexture(textureUrl);
        if (!texture) {
            return null;
        }

        const sprite = this.acquire();
        sprite.texture = texture;
        sprite.x = x;
        sprite.y = y;

        // Apply options
        if (options.width !== undefined) sprite.width = options.width;
        if (options.height !== undefined) sprite.height = options.height;
        if (options.alpha !== undefined) sprite.alpha = options.alpha;
        if (options.zIndex !== undefined) sprite.zIndex = options.zIndex;
        if (options.anchor !== undefined) sprite.anchor.copyFrom(options.anchor);
        if (options.rotation !== undefined) sprite.rotation = options.rotation;

        return sprite;
    }

    /**
     * Update an existing sprite's position and texture
     */
    async updateSprite(sprite, x, y, textureUrl, options = {}) {
        // Load new texture if URL changed
        if (textureUrl && sprite.texture &&
            sprite.texture.baseTexture &&
            sprite.texture.baseTexture.resource &&
            sprite.texture.baseTexture.resource.url !== textureUrl) {
            const texture = await this.getTexture(textureUrl);
            if (texture) {
                sprite.texture = texture;
            }
        }

        // Update position
        sprite.x = x;
        sprite.y = y;

        // Apply options
        if (options.width !== undefined) sprite.width = options.width;
        if (options.height !== undefined) sprite.height = options.height;
        if (options.alpha !== undefined) sprite.alpha = options.alpha;
        if (options.zIndex !== undefined) sprite.zIndex = options.zIndex;

        return sprite;
    }

    /**
     * Get all active sprites
     */
    getActiveSprites() {
        return Array.from(this.activeSprites.values());
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            ...this.stats,
            availableSprites: this.availableSprites.length,
            activeSprites: this.activeSprites.size,
            reuseRate: this.stats.totalAllocated > 0
                ? (this.stats.totalReused / this.stats.totalAllocated * 100).toFixed(2) + '%'
                : '0%'
        };
    }

    /**
     * Clear texture cache
     */
    clearTextureCache() {
        // Destroy all cached textures
        for (const texture of this.textureCache.values()) {
            if (texture && texture.destroy) {
                texture.destroy(true);
            }
        }
        this.textureCache.clear();
        this.stats.textureCacheSize = 0;
    }

    /**
     * Destroy the pool and clean up resources
     */
    destroy() {
        // Release all active sprites
        for (const sprite of this.activeSprites.values()) {
            this.release(sprite);
        }
        this.activeSprites.clear();

        // Remove all sprites from container
        if (this.config.container) {
            for (const sprite of this.availableSprites) {
                this.config.container.removeChild(sprite);
                if (sprite.destroy) {
                    sprite.destroy(true);
                }
            }
        }
        this.availableSprites = [];

        // Clear texture cache
        this.clearTextureCache();

        console.log('🎨 SpritePool destroyed');
    }
}

/**
 * TileSpriteManager - High-level manager for tile sprites
 * Handles sprite lifecycle for tiles in the map
 * 
 * @class TileSpriteManager
 */
class TileSpriteManager {
    /**
     * @param {Object} config - Configuration
     * @param {PIXI.Container} config.container - Parent container
     * @param {SpritePool} config.spritePool - Sprite pool instance
     * @param {number} config.gridSize - Grid size in pixels (default: 100)
     */
    constructor(config = {}) {
        this.config = {
            container: null,
            spritePool: null,
            gridSize: 100,
            ...config
        };

        // Tile sprite tracking
        this.tileSprites = new Map(); // "x,y" -> { sprite, tileData, timestamp }

        // Statistics
        this.stats = {
            tilesRendered: 0,
            tilesUpdated: 0,
            tilesHidden: 0
        };
    }

    /**
     * Initialize the manager
     */
    initialize() {
        if (!this.config.spritePool) {
            console.warn('TileSpriteManager: No sprite pool provided, creating default');
            this.config.spritePool = new SpritePool({
                container: this.config.container
            });
            this.config.spritePool.initialize();
        }

        console.log('🎨 TileSpriteManager initialized');
    }

    /**
     * Render a tile
     */
    async renderTile(tileData) {
        const { x, y, brick, timestamp } = tileData;
        const key = `${x},${y}`;
        const existing = this.tileSprites.get(key);

        // Calculate position
        const posX = x * this.config.gridSize;
        const posY = y * this.config.gridSize;

        // Construct texture URL
        const textureUrl = `/builder/queue/${brick}?t=${timestamp}`;

        if (existing) {
            // Update existing sprite
            await this.config.spritePool.updateSprite(
                existing.sprite,
                posX,
                posY,
                textureUrl,
                {
                    width: this.config.gridSize,
                    height: this.config.gridSize,
                    alpha: 0.8,
                    zIndex: -100
                }
            );
            existing.tileData = tileData;
            existing.timestamp = timestamp;
            this.stats.tilesUpdated++;
        } else {
            // Create new sprite
            const sprite = await this.config.spritePool.createTileSprite(
                posX,
                posY,
                textureUrl,
                {
                    width: this.config.gridSize,
                    height: this.config.gridSize,
                    alpha: 0.8,
                    zIndex: -100
                }
            );

            if (sprite) {
                this.tileSprites.set(key, {
                    sprite,
                    tileData,
                    timestamp
                });
                this.stats.tilesRendered++;
            }
        }

        return this.tileSprites.get(key);
    }

    /**
     * Render multiple tiles
     */
    async renderTiles(tileDataArray) {
        const promises = tileDataArray.map(tileData => this.renderTile(tileData));
        return Promise.all(promises);
    }

    /**
     * Hide a tile (release its sprite back to pool)
     */
    hideTile(x, y) {
        const key = `${x},${y}`;
        const tileSprite = this.tileSprites.get(key);

        if (tileSprite) {
            this.config.spritePool.release(tileSprite.sprite);
            this.tileSprites.delete(key);
            this.stats.tilesHidden++;
        }
    }

    /**
     * Hide multiple tiles
     */
    hideTiles(tileCoords) {
        tileCoords.forEach(({ x, y }) => this.hideTile(x, y));
    }

    /**
     * Update visible tiles based on viewport
     */
    async updateVisibleTiles(visibleTiles, viewport) {
        const visibleKeys = new Set();

        // Render visible tiles
        for (const tileData of visibleTiles) {
            const key = `${tileData.x},${tileData.y}`;
            visibleKeys.add(key);
            await this.renderTile(tileData);
        }

        // Hide tiles that are no longer visible
        for (const [key, tileSprite] of this.tileSprites) {
            if (!visibleKeys.has(key)) {
                const [x, y] = key.split(',').map(Number);
                this.hideTile(x, y);
            }
        }

        return this.getVisibleTileCount();
    }

    /**
     * Get tile sprite at specific coordinates
     */
    getTileSprite(x, y) {
        const key = `${x},${y}`;
        const tileSprite = this.tileSprites.get(key);
        return tileSprite ? tileSprite.sprite : null;
    }

    /**
     * Get all visible tile sprites
     */
    getVisibleTileSprites() {
        return Array.from(this.tileSprites.values()).map(ts => ts.sprite);
    }

    /**
     * Get count of visible tiles
     */
    getVisibleTileCount() {
        return this.tileSprites.size;
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            ...this.stats,
            visibleTiles: this.tileSprites.size,
            poolStats: this.config.spritePool ? this.config.spritePool.getStats() : null
        };
    }

    /**
     * Clear all tile sprites
     */
    clear() {
        for (const [key, tileSprite] of this.tileSprites) {
            this.config.spritePool.release(tileSprite.sprite);
        }
        this.tileSprites.clear();
        this.stats = {
            tilesRendered: 0,
            tilesUpdated: 0,
            tilesHidden: 0
        };
    }

    /**
     * Destroy the manager
     */
    destroy() {
        this.clear();

        if (this.config.spritePool) {
            this.config.spritePool.destroy();
        }

        console.log('🎨 TileSpriteManager destroyed');
    }
}

/**
 * SpritePoolFactory - Factory for creating sprite pools
 * 
 * @class SpritePoolFactory
 */
class SpritePoolFactory {
    /**
     * Create a sprite pool for tiles
     */
    static createTilePool(container, config = {}) {
        return new SpritePool({
            container,
            initialSize: 500,
            maxSize: 2000,
            growthFactor: 1.5,
            ...config
        });
    }

    /**
     * Create a sprite pool for UI elements
     */
    static createUIPool(container, config = {}) {
        return new SpritePool({
            container,
            initialSize: 100,
            maxSize: 500,
            growthFactor: 1.3,
            ...config
        });
    }

    /**
     * Create a sprite pool for particles
     */
    static createParticlePool(container, config = {}) {
        return new SpritePool({
            container,
            initialSize: 200,
            maxSize: 1000,
            growthFactor: 2.0,
            ...config
        });
    }
}

// Export for use in other modules
if (typeof window !== 'undefined') {
    window.SpritePool = SpritePool;
    window.TileSpriteManager = TileSpriteManager;
    window.SpritePoolFactory = SpritePoolFactory;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        SpritePool,
        TileSpriteManager,
        SpritePoolFactory
    };
}
