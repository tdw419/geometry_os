/**
 * PixiJS V8 Adapter (Browser Mock)
 * 
 * In the rust-based environment, this was a C++ binding.
 * Here in the browser, we just wrap standard PixiJS texture loading.
 */
class PixiJSV8Adapter {
    static get errorTexture() {
        return PIXI.Texture.WHITE; // Fallback
    }

    static async loadTexture(url) {
        try {
            // In a real app we might proxy this to avoiding CORS
            // For now, assume relative path or valid CORS
            const texture = await PIXI.Assets.load(url);
            return texture;
        } catch (e) {
            console.warn(`Failed to load texture ${url}:`, e);
            return this.errorTexture;
        }
    }

    static createSprite(texture) {
        return new PIXI.Sprite(texture);
    }
}

window.PixiJSV8Adapter = PixiJSV8Adapter;
