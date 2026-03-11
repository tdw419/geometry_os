/**
 * Geometry OS: PixiJS Display Renderer
 *
 * Renders GPU framebuffer as a PixiJS sprite.
 * Integrates with existing visual shell.
 */

export class PixiRenderer {
    constructor(app, width = 1024, height = 768) {
        this.app = app;
        this.width = width;
        this.height = height;

        // Create a container for the display
        this.container = new PIXI.Container();

        // Create a sprite from a blank texture
        const texture = PIXI.Texture.fromBuffer(
            new Uint8Array(width * height * 4),
            width,
            height
        );
        this.sprite = new PIXI.Sprite(texture);
        this.container.addChild(this.sprite);

        // Canvas for intermediate rendering
        this.canvas = document.createElement('canvas');
        this.canvas.width = width;
        this.canvas.height = height;
        this.ctx = this.canvas.getContext('2d');
        this.imageData = this.ctx.createImageData(width, height);
    }

    render(framebuffer) {
        // Update ImageData
        this.imageData.data.set(framebuffer);
        this.ctx.putImageData(this.imageData, 0, 0);

        // Update PixiJS texture from canvas
        const texture = PIXI.Texture.from(this.canvas);
        this.sprite.texture = texture;
    }

    attachTo(container) {
        // Add to PixiJS stage if app exists
        if (this.app && this.app.stage) {
            this.app.stage.addChild(this.container);
        }
    }

    capture() {
        return this.canvas.toDataURL('image/png');
    }

    clear() {
        this.ctx.fillStyle = 'black';
        this.ctx.fillRect(0, 0, this.width, this.height);
    }

    // Expose canvas for input handling
    getCanvas() {
        return this.canvas;
    }
}

// Note: Requires PIXI to be loaded globally
if (typeof window !== 'undefined') {
    window.PixiRenderer = PixiRenderer;
}
