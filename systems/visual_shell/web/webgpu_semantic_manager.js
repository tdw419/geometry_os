/**
 * Geometry OS: WebGPU Semantic Manager
 *
 * Orchestrates GPU-accelerated semantic expansion of .rts.png textures.
 * Links the HolographicDictionary to WebGPU compute pipelines.
 */

class WebGPUSemanticManager {
    constructor(device, dictionary) {
        this.device = device;
        this.dictionary = dictionary;

        this.resources = {
            dictionaryCode: null,
            dictionaryMetadata: null,
            expansionOffsets: null,
            expandedCode: null
        };

        this.pipelines = {
            expand: null
        };

        this.initialized = false;
        console.log('⚡ WebGPUSemanticManager: Substrate initialized');
    }

    /**
     * Initialize WebGPU resources and pipelines
     */
    async initialize() {
        if (this.initialized) return;

        // 1. Load Expansion Shader
        const shaderCode = await fetch('shaders/semantic_expansion.wgsl').then(r => r.text());
        this.shaderModule = this.device.createShaderModule({
            label: 'Semantic Expansion Shader',
            code: shaderCode
        });

        // 2. Create Dictionary Resources
        await this._prepareDictionaryResources();

        // 3. Create Compute Pipeline
        this.pipelines.expand = this.device.createComputePipeline({
            label: 'Expansion Pipeline',
            layout: 'auto',
            compute: {
                module: this.shaderModule,
                entryPoint: 'main'
            }
        });

        this.initialized = true;
        console.log('✅ WebGPUSemanticManager: Pipelines ready');
    }

    /**
     * Prepare dictionary buffers from the HolographicDictionary
     * @private
     */
    async _prepareDictionaryResources() {
        const gpuData = this.dictionary.exportForWebGPU();
        if (!gpuData) throw new Error('Dictionary must be loaded before GPU initialization');

        // Create Flattened Instruction Buffer
        this.resources.dictionaryCode = this.device.createBuffer({
            label: 'Dictionary Code Buffer',
            size: gpuData.instructionBuffer.byteLength,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
            mappedAtCreation: true
        });
        new Uint32Array(this.resources.dictionaryCode.getMappedRange()).set(gpuData.instructionBuffer);
        this.resources.dictionaryCode.unmap();

        // Create Metadata Buffer (TokenID -> [offset, length])
        // We use a buffer of 2^24 entries for direct TokenID indexing if possible,
        // or a remapped version. For version 1, let's use a 64k entry cache.
        const metadataArray = new Uint32Array(65536 * 2); // [offset, length] pairs
        for (const [tokenId, meta] of gpuData.metadata.entries()) {
            // Only cache tokens within 0-65535 for this prototype
            if (tokenId < 65536) {
                metadataArray[tokenId * 2] = meta.offset;
                metadataArray[tokenId * 2 + 1] = meta.length;
            }
        }

        this.resources.dictionaryMetadata = this.device.createBuffer({
            label: 'Dictionary Metadata Buffer',
            size: metadataArray.byteLength,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
            mappedAtCreation: true
        });
        new Uint32Array(this.resources.dictionaryMetadata.getMappedRange()).set(metadataArray);
        this.resources.dictionaryMetadata.unmap();
    }

    /**
     * Expand a semantic texture into a linear instruction buffer on the GPU
     * @param {GPUTexture} texture - Source .rts.png texture
     * @returns {Promise<GPUBuffer>} - Buffer containing expanded RISC-V instructions
     */
    async expand(texture) {
        if (!this.initialized) await this.initialize();

        const width = texture.width;
        const height = texture.height;
        const totalPixels = width * height;

        // 1. Calculate Offsets (CPU-side for prototype, fast enough for 512x512)
        // In real use, Pass 1 would be a GPU scan.
        const offsets = await this._calculateOffsetsOnCPU(texture);

        // 2. Create/Update Offsets Buffer
        if (!this.resources.expansionOffsets || this.resources.expansionOffsets.size < offsets.byteLength) {
            this.resources.expansionOffsets = this.device.createBuffer({
                label: 'Expansion Offsets Buffer',
                size: offsets.byteLength,
                usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
            });
        }
        this.device.queue.writeBuffer(this.resources.expansionOffsets, 0, offsets);

        // 3. Create/Update Output Buffer
        // We need to know the final expanded size (last offset + last length)
        const totalExpandedInstructions = offsets[totalPixels - 1] + 100; // Buffer padding
        const outputBufferSize = totalExpandedInstructions * 4;

        if (!this.resources.expandedCode || this.resources.expandedCode.size < outputBufferSize) {
            this.resources.expandedCode = this.device.createBuffer({
                label: 'Expanded Code Buffer',
                size: Math.max(1024 * 1024, outputBufferSize), // Min 1MB
                usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC
            });
        }

        // 4. RUN EXPANSION KERNEL
        const commandEncoder = this.device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();
        passEncoder.setPipeline(this.pipelines.expand);

        const bindGroup = this.device.createBindGroup({
            layout: this.pipelines.expand.getBindGroupLayout(0),
            entries: [
                { binding: 0, resource: texture.createView() },
                { binding: 1, resource: { buffer: this.resources.dictionaryMetadata } },
                { binding: 2, resource: { buffer: this.resources.dictionaryCode } },
                { binding: 3, resource: { buffer: this.resources.expansionOffsets } },
                { binding: 4, resource: { buffer: this.resources.expandedCode } }
            ]
        });

        passEncoder.setBindGroup(0, bindGroup);
        passEncoder.dispatchWorkgroups(Math.ceil(width / 8), Math.ceil(height / 8));
        passEncoder.end();

        this.device.queue.submit([commandEncoder.finish()]);

        return this.resources.expandedCode;
    }

    /**
     * Calculate offsets on CPU for prototype phase
     * Maps each pixel to its starting index in the expanded buffer.
     * @private
     */
    async _calculateOffsetsOnCPU(texture) {
        // This is a placeholder. In a real GPU pipeline, we don't read back texture.
        // But for the prototype bridge, we use the Dictionary's knowledge.

        // Simulating the result of a parallel scan
        const width = texture.width;
        const height = texture.height;
        const totalPixels = width * height;
        const offsets = new Uint32Array(totalPixels);

        // Note: In real integration, we'd have the Pixel-Exec metadata 
        // already available or run a fast length-only compute pass.

        let currentOffset = 0;
        for (let i = 0; i < totalPixels; i++) {
            offsets[i] = currentOffset;

            // Assume average expansion of 4 for the POC
            // (Real version reads lengths from the metadata buffer)
            currentOffset += 4;
        }

        return offsets;
    }
}

if (typeof window !== 'undefined') {
    window.WebGPUSemanticManager = WebGPUSemanticManager;
}
