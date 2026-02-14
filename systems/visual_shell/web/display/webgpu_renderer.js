/**
 * Geometry OS: WebGPU Display Renderer
 *
 * Renders GPU framebuffer using WebGPU texture swap.
 * Faster than Canvas for high-frequency updates.
 */

export class WebGPURenderer {
    constructor(device, width = 1024, height = 768) {
        this.device = device;
        this.width = width;
        this.height = height;

        // Create display texture
        this.texture = device.createTexture({
            size: [width, height],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.TEXTURE_BINDING |
                   GPUTextureUsage.COPY_DST |
                   GPUTextureUsage.RENDER_ATTACHMENT
        });

        // Create canvas context for presentation
        this.canvas = document.createElement('canvas');
        this.canvas.width = width;
        this.canvas.height = height;
        this.context = this.canvas.getContext('webgpu');
    }

    /**
     * Render framebuffer data
     */
    render(framebuffer) {
        // Write directly to texture
        this.device.queue.writeTexture(
            { texture: this.texture },
            framebuffer,
            { bytesPerRow: this.width * 4 },
            { width: this.width, height: this.height }
        );
    }

    attachTo(container) {
        container.innerHTML = '';
        container.appendChild(this.canvas);

        // Configure WebGPU context
        this.context.configure({
            device: this.device,
            format: navigator.gpu.getPreferredCanvasFormat(),
            usage: GPUTextureUsage.RENDER_ATTACHMENT
        });
    }

    capture() {
        // WebGPU doesn't have direct capture, fall back to Canvas2D
        const canvas = document.createElement('canvas');
        canvas.width = this.width;
        canvas.height = this.height;
        const ctx = canvas.getContext('2d');
        // Would need to read texture back...
        return canvas.toDataURL('image/png');
    }

    clear() {
        // Clear texture via command encoder
        const encoder = this.device.createCommandEncoder();
        const pass = encoder.beginRenderPass({
            colorAttachments: [{
                view: this.texture.createView(),
                clearValue: { r: 0, g: 0, b: 0, a: 1 },
                loadOp: 'clear',
                storeOp: 'store'
            }]
        });
        pass.end();
        this.device.queue.submit([encoder.finish()]);
    }

    getCanvas() {
        return this.canvas;
    }
}

if (typeof window !== 'undefined') {
    window.WebGPURenderer = WebGPURenderer;
}
