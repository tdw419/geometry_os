/**
 * Geometry OS: WGPU Kernel Loader
 *
 * Loads Linux kernels from .rts.png textures or raw binary buffers
 * into GPU memory for execution by the RISC-V shader.
 */

export class WGPUKernelLoader {
    constructor(device) {
        this.device = device;
    }

    /**
     * Load kernel from a raw binary buffer
     * @param {ArrayBuffer} buffer - Raw kernel binary
     * @returns {{entryPoint: number, size: number, data: Uint8Array}}
     */
    async loadFromBuffer(buffer) {
        const data = new Uint8Array(buffer);
        return {
            entryPoint: 0,           // Entry point offset
            size: data.byteLength,   // Total size in bytes
            data: data
        };
    }

    /**
     * Load kernel from a .rts.png texture URL
     * @param {string} url - URL to the .rts.png file
     * @returns {{entryPoint: number, size: number, texture: GPUTexture}}
     */
    async loadFromRTS(url) {
        // Fetch the image
        const response = await fetch(url);
        const blob = await response.blob();
        const img = new Image();
        img.src = URL.createObjectURL(blob);
        await img.decode();

        // Create bitmap and texture
        const bitmap = await createImageBitmap(img);
        const texture = this.device.createTexture({
            size: [bitmap.width, bitmap.height],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.COPY_DST
        });

        this.device.queue.copyExternalImageToTexture(
            { source: bitmap },
            { texture: texture },
            [bitmap.width, bitmap.height]
        );

        // Extract kernel size from metadata (first 4 pixels = size in bytes)
        // For now, assume full texture is kernel data

        return {
            entryPoint: 0,
            size: bitmap.width * bitmap.height * 4, // RGBA
            texture: texture
        };
    }

    /**
     * Write kernel to GPU memory at specified address
     * @param {GPUBuffer} memoryBuffer - System memory buffer
     * @param {Uint8Array} kernelData - Kernel binary data
     * @param {number} address - Destination address (default 0)
     */
    writeToMemory(memoryBuffer, kernelData, address = 0) {
        this.device.queue.writeBuffer(memoryBuffer, address, kernelData);
    }
}

// Export for window global
if (typeof window !== 'undefined') {
    window.WGPUKernelLoader = WGPUKernelLoader;
}
