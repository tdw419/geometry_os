/**
 * Geometry OS: Canvas Display Renderer
 *
 * Renders GPU framebuffer to a Canvas 2D context.
 * Simplest display mode, works everywhere.
 *
 * @module display/canvas_renderer
 */

export class CanvasRenderer {
    /**
     * Create a new Canvas renderer
     * @param {number} width - Canvas width in pixels (default: 1024)
     * @param {number} height - Canvas height in pixels (default: 768)
     */
    constructor(width = 1024, height = 768) {
        this.width = width;
        this.height = height;

        // Create offscreen canvas
        this.canvas = document.createElement('canvas');
        this.canvas.width = width;
        this.canvas.height = height;
        this.ctx = this.canvas.getContext('2d', { willReadFrequently: true });

        // ImageData for efficient pixel updates
        this.imageData = this.ctx.createImageData(width, height);

        // Initialize to black
        this.clear();
    }

    /**
     * Render framebuffer data to canvas
     * @param {Uint8Array|Uint8ClampedArray} framebuffer - RGBA pixel data (width * height * 4 bytes)
     * @throws {Error} If framebuffer size doesn't match canvas dimensions
     */
    render(framebuffer) {
        const expectedSize = this.width * this.height * 4;
        if (framebuffer.length !== expectedSize) {
            throw new Error(
                `Framebuffer size mismatch: expected ${expectedSize} bytes, got ${framebuffer.length}`
            );
        }

        // Copy framebuffer to ImageData
        this.imageData.data.set(framebuffer);

        // Draw to canvas
        this.ctx.putImageData(this.imageData, 0, 0);
    }

    /**
     * Attach canvas to a DOM element
     * @param {HTMLElement} container - Container element to append canvas to
     * @throws {Error} If container is not a valid DOM element
     */
    attachTo(container) {
        if (!(container instanceof HTMLElement)) {
            throw new Error('Container must be a valid DOM element');
        }

        container.innerHTML = '';
        container.appendChild(this.canvas);
    }

    /**
     * Get current canvas as data URL (for screenshots)
     * @param {string} format - Image format (default: 'image/png')
     * @param {number} quality - Image quality for lossy formats (0-1)
     * @returns {string} Base64 data URL
     */
    capture(format = 'image/png', quality = 0.92) {
        return this.canvas.toDataURL(format, quality);
    }

    /**
     * Clear canvas to black
     */
    clear() {
        this.ctx.fillStyle = 'black';
        this.ctx.fillRect(0, 0, this.width, this.height);
    }

    /**
     * Resize the canvas
     * @param {number} width - New width
     * @param {number} height - New height
     */
    resize(width, height) {
        this.width = width;
        this.height = height;
        this.canvas.width = width;
        this.canvas.height = height;
        this.imageData = this.ctx.createImageData(width, height);
        this.clear();
    }

    /**
     * Get the underlying canvas element
     * @returns {HTMLCanvasElement} The canvas element
     */
    getCanvas() {
        return this.canvas;
    }

    /**
     * Get the 2D context
     * @returns {CanvasRenderingContext2D} The 2D rendering context
     */
    getContext() {
        return this.ctx;
    }

    /**
     * Read a pixel from the canvas
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @returns {Uint8Array} RGBA values [r, g, b, a]
     */
    getPixel(x, y) {
        const imageData = this.ctx.getImageData(x, y, 1, 1);
        return new Uint8Array(imageData.data);
    }

    /**
     * Draw a rectangle (useful for debugging)
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @param {number} width - Rectangle width
     * @param {number} height - Rectangle height
     * @param {string} color - CSS color
     */
    drawRect(x, y, width, height, color = 'red') {
        this.ctx.strokeStyle = color;
        this.ctx.lineWidth = 2;
        this.ctx.strokeRect(x, y, width, height);
    }
}

// Export for window global (for non-module usage)
if (typeof window !== 'undefined') {
    window.CanvasRenderer = CanvasRenderer;
}
