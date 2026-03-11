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
     * @param {Object} metadata - Optional metadata for section offsets
     * @returns {{entryPoint: number, size: number, data: Uint8Array, sections: Object}}
     */
    async loadFromRTS(url, metadata = null) {
        // Fetch the image
        const response = await fetch(url);
        const blob = await response.blob();
        const img = new Image();
        img.src = URL.createObjectURL(blob);
        await img.decode();

        // Create a temporary canvas to extract pixel data
        const canvas = document.createElement('canvas');
        canvas.width = img.width;
        canvas.height = img.height;
        const ctx = canvas.getContext('2d');
        ctx.drawImage(img, 0, 0);
        
        const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
        const data = new Uint8Array(imageData.data.buffer);

        console.log(`[WGPUKernelLoader] Extracted ${data.byteLength} bytes from ${url}`);

        const result = {
            entryPoint: 0,
            size: data.byteLength,
            data: data,
            sections: {}
        };

        // If metadata is provided, split into sections
        if (metadata && metadata.offsets) {
            for (const [name, offsetInfo] of Object.entries(metadata.offsets)) {
                const start = offsetInfo.start !== undefined ? offsetInfo.start : offsetInfo[0];
                const end = offsetInfo.end !== undefined ? offsetInfo.end : offsetInfo[1];
                
                if (start !== undefined && end !== undefined && end <= data.byteLength) {
                    result.sections[name] = data.slice(start, end);
                    console.log(`[WGPUKernelLoader] Identified section '${name}': ${result.sections[name].byteLength} bytes`);
                }
            }
            
            // If we have a explicit kernel section, use it as primary data
            if (result.sections.kernel) {
                result.data = result.sections.kernel;
                result.size = result.data.byteLength;
            }
        }

        return result;
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
