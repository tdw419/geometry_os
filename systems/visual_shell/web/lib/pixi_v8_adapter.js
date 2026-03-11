/**
 * PixiJS v8 Adapter
 * 
 * This adapter provides a compatibility layer to handle the asynchronous nature of 
 * asset loading and other changes introduced in PixiJS v8, allowing older code 
 * based on v7's synchronous methods to work with minimal changes.
 * 
 * Key Changes Addressed:
 * 1. `PIXI.Texture.from()` is now `PIXI.Assets.load()`, which is asynchronous.
 * 2. `new PIXI.Sprite(texture)` remains, but the texture must be loaded first.
 * 3. Handles potential texture loading errors gracefully.
 */
class PixiJSV8Adapter {
    constructor() {
        this.errorTexture = null;
        this._createErrorTexture();
    }

    /**
     * Creates a fallback texture to use when an asset fails to load.
     * This is a simple 64x64 red square.
     * @private
     */
    _createErrorTexture() {
        const canvas = document.createElement('canvas');
        canvas.width = 64;
        canvas.height = 64;
        const context = canvas.getContext('2d');
        context.fillStyle = 'red';
        context.fillRect(0, 0, 64, 64);
        this.errorTexture = PIXI.Texture.from(canvas);
    }

    /**
     * Asynchronously loads a texture from a given URL.
     * If the texture fails to load, it returns a pre-defined error texture.
     * @param {string} url - The URL of the texture to load.
     * @returns {Promise<PIXI.Texture>} A promise that resolves with the loaded texture or an error texture.
     */
    async loadTexture(url) {
        try {
            const texture = await PIXI.Assets.load(url);
            return texture;
        } catch (error) {
            console.warn(`⚠️  PixiJSV8Adapter: Failed to load texture from ${url}. Using error texture.`, error);
            return this.errorTexture;
        }
    }

    /**
     * Creates a sprite from a given texture.
     * @param {PIXI.Texture} texture - The texture to use for the sprite.
     * @returns {PIXI.Sprite} A new PIXI.Sprite object.
     */
    createSprite(texture) {
        return new PIXI.Sprite(texture);
    }

    /**
     * Asynchronously creates a sprite directly from a URL by first loading the texture.
     * @param {string} url - The URL of the texture to load.
     * @returns {Promise<PIXI.Sprite>} A promise that resolves with the created sprite.
     */
    async createSpriteFromUrl(url) {
        const texture = await this.loadTexture(url);
        return this.createSprite(texture);
    }
}

// Export for integration
if (typeof window !== 'undefined') {
    window.PixiJSV8Adapter = new PixiJSV8Adapter();
}
