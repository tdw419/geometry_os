/**
 * Geometry OS: GlyphExecutor
 *
 * The "Visual Motherboard" of the post-symbolic execution substrate.
 * Orchestrates:
 * - Glyph Atlas texture binding
 * - Dictionary buffer management
 * - Compute pipeline dispatch
 * - State synchronization with CPU
 *
 * Phase 28: Zero-Symbol Holographic Execution
 */

export class GlyphExecutor {
    /**
     * @param {GPUDevice} device - WebGPU device
     */
    constructor(device) {
        this.device = device;

        // Pipeline state
        this.pipeline = null;
        this.bindGroupLayout = null;
        this.initialized = false;

        // Texture atlas
        this.glyphAtlas = null;
        this.atlasWidth = 1024;   // pixels
        this.atlasHeight = 1024;  // pixels
        this.tileSize = 16;       // 16x16 glyph tiles

        // Dictionary
        this.dictionaryBuffer = null;
        this.dictionarySize = 0;

        // Memory (128MB)
        this.MEMORY_SIZE = 128 * 1024 * 1024;
        this.memoryBuffer = null;

        // CPU state (256 * 4 bytes)
        this.stateBuffer = null;

        // Active kernels
        this.kernels = new Map();

        // Syscall hook for UART output
        this.onConsoleOutput = null;
    }

    /**
     * Initialize the executor (load shader, create pipeline)
     */
    async initialize() {
        if (this.initialized) return;

        console.log('[GlyphExecutor] Initializing post-symbolic substrate...');

        // Load shader
        const shaderCode = await this._loadShader('shaders/visual_cpu_riscv_post_symbolic.wgsl');
        this.shaderModule = this.device.createShaderModule({
            label: 'Post-Symbolic CPU (RISC-V)',
            code: shaderCode
        });

        // Create bind group layout
        // Binding 0: Glyph Atlas Texture
        // Binding 1: Atlas Dictionary
        // Binding 2: System Memory
        // Binding 3: CPU State
        this.bindGroupLayout = this.device.createBindGroupLayout({
            entries: [
                {
                    binding: 0,
                    visibility: GPUShaderStage.COMPUTE,
                    texture: { sampleType: 'float', viewDimension: '2d' }
                },
                {
                    binding: 1,
                    visibility: GPUShaderStage.COMPUTE,
                    buffer: { type: 'read-only-storage' }
                },
                {
                    binding: 2,
                    visibility: GPUShaderStage.COMPUTE,
                    buffer: { type: 'storage' }
                },
                {
                    binding: 3,
                    visibility: GPUShaderStage.COMPUTE,
                    buffer: { type: 'storage' }
                }
            ]
        });

        // Create pipeline
        this.pipeline = this.device.createComputePipeline({
            layout: this.device.createPipelineLayout({
                bindGroupLayouts: [this.bindGroupLayout]
            }),
            compute: {
                module: this.shaderModule,
                entryPoint: 'main'
            }
        });

        this.initialized = true;
        console.log('[GlyphExecutor] Initialized successfully');
    }

    /**
     * Load shader source from URL
     * @private
     */
    async _loadShader(url) {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`Failed to load shader: ${url}`);
        }
        return response.text();
    }

    /**
     * Deploy a kernel from morphological texture
     * @param {string} textureUrl - URL to .rts.png file
     * @param {string} kernelId - Unique kernel identifier
     */
    async deploy(textureUrl, kernelId) {
        if (!this.initialized) await this.initialize();

        console.log(`[GlyphExecutor] Deploying kernel: ${kernelId}`);

        // 1. Load texture and metadata
        const { texture, dictionary } = await this._loadMorphologicalTexture(textureUrl);

        // 2. Create/update dictionary buffer
        this._updateDictionary(dictionary);

        // 3. Create memory buffer
        const memoryBuffer = this.device.createBuffer({
            size: this.MEMORY_SIZE,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST
        });

        // 4. Create state buffer
        const stateBuffer = this.device.createBuffer({
            size: 256 * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST | GPUBufferUsage.MAP_READ
        });

        // 5. Initialize state buffer (PC=0, halted=0)
        const initialState = new Uint32Array(256);
        initialState[32] = 0; // PC
        initialState[38] = 0; // Halted flag
        this.device.queue.writeBuffer(stateBuffer, 0, initialState);

        // 6. Create bind group
        const bindGroup = this.device.createBindGroup({
            layout: this.bindGroupLayout,
            entries: [
                { binding: 0, resource: texture.createView() },
                { binding: 1, resource: { buffer: this.dictionaryBuffer } },
                { binding: 2, resource: { buffer: memoryBuffer } },
                { binding: 3, resource: { buffer: stateBuffer } }
            ]
        });

        // 7. Register kernel
        this.kernels.set(kernelId, {
            texture,
            memoryBuffer,
            stateBuffer,
            bindGroup,
            pc: 0,
            cycleCount: 0,
            halted: false,
            running: false,
            onOutput: null
        });

        console.log(`[GlyphExecutor] Kernel ${kernelId} deployed`);
        return true;
    }

    /**
     * Load morphological texture and its dictionary
     * @private
     */
    async _loadMorphologicalTexture(url) {
        // Fetch texture
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`[GlyphExecutor] Failed to fetch texture: ${url}`);
        }
        const blob = await response.blob();
        const imageBitmap = await createImageBitmap(blob);

        // Create GPU texture
        const texture = this.device.createTexture({
            size: [imageBitmap.width, imageBitmap.height],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.COPY_DST | GPUTextureUsage.RENDER_ATTACHMENT
        });

        this.device.queue.copyExternalImageToTexture(
            { source: imageBitmap },
            { texture },
            [imageBitmap.width, imageBitmap.height]
        );

        // Fetch dictionary
        const metaUrl = url + '.meta.json';
        const metaResponse = await fetch(metaUrl);
        if (!metaResponse.ok) {
            throw new Error(`[GlyphExecutor] Failed to fetch metadata: ${metaUrl}`);
        }
        const metadata = await metaResponse.json();

        // Convert dictionary to Uint32Array
        const dictionary = new Uint32Array(metadata.dictionary.instructions);

        this.glyphAtlas = texture;
        this.atlasWidth = imageBitmap.width;
        this.atlasHeight = imageBitmap.height;

        console.log(`[GlyphExecutor] Loaded texture ${imageBitmap.width}x${imageBitmap.height}, ${dictionary.length} dictionary entries`);

        return { texture, dictionary };
    }

    /**
     * Update dictionary buffer
     * @private
     */
    _updateDictionary(dictionary) {
        const size = dictionary.byteLength;

        if (this.dictionaryBuffer && this.dictionarySize < size) {
            this.dictionaryBuffer.destroy();
            this.dictionaryBuffer = null;
        }

        if (!this.dictionaryBuffer) {
            this.dictionaryBuffer = this.device.createBuffer({
                size: size,
                usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
            });
        }

        this.device.queue.writeBuffer(this.dictionaryBuffer, 0, dictionary);
        this.dictionarySize = size;
    }

    /**
     * Execute N cycles
     * @param {string} kernelId - Kernel to execute
     * @param {number} cycles - Number of cycles to run (default 100000)
     */
    execute(kernelId, cycles = 100000) {
        const kernel = this.kernels.get(kernelId);
        if (!kernel) {
            throw new Error(`[GlyphExecutor] Kernel not found: ${kernelId}`);
        }

        const commandEncoder = this.device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();

        passEncoder.setPipeline(this.pipeline);
        passEncoder.setBindGroup(0, kernel.bindGroup);
        passEncoder.dispatchWorkgroups(1);  // Single core for now

        passEncoder.end();

        this.device.queue.submit([commandEncoder.finish()]);
        kernel.cycleCount += cycles;
    }

    /**
     * Read CPU state
     * @param {string} kernelId - Kernel to read
     * @returns {Promise<Uint32Array>}
     */
    async readState(kernelId) {
        const kernel = this.kernels.get(kernelId);
        if (!kernel) {
            throw new Error(`[GlyphExecutor] Kernel not found: ${kernelId}`);
        }

        await kernel.stateBuffer.mapAsync(GPUMapMode.READ);
        const state = new Uint32Array(kernel.stateBuffer.getMappedRange().slice(0));
        kernel.stateBuffer.unmap();

        return state;
    }

    /**
     * Validate holographic resonance for a glyph tile
     * @param {number} tileX - Tile X coordinate in atlas
     * @param {number} tileY - Tile Y coordinate in atlas
     * @returns {Promise<boolean>}
     */
    async validateResonance(tileX, tileY) {
        // Read the tile's symmetry metadata from alpha channel
        const pixel = await this._sampleTile(tileX, tileY);

        // A channel encodes symmetry mask:
        // 0xFF = fully executable (resonance validated)
        // 0x00 = NOP padding
        // 0x7F = partial resonance (requires geometric integrity check)

        const symmetryMask = pixel.a;

        if (symmetryMask === 0xFF) {
            return true;  // Full resonance
        } else if (symmetryMask === 0x00) {
            return false; // NOP - no resonance needed
        } else {
            // Partial resonance - perform dot-product validation
            return await this._checkGeometricIntegrity(tileX, tileY, symmetryMask);
        }
    }

    /**
     * Sample a tile from the atlas
     * @private
     */
    async _sampleTile(tileX, tileY) {
        // For POC, return a placeholder with full resonance
        return { r: 0, g: 0, b: 0, a: 0xFF };
    }

    /**
     * Check geometric integrity using dot-product resonance
     * @private
     */
    async _checkGeometricIntegrity(tileX, tileY, symmetryMask) {
        // For POC, trust the encoder's symmetry metadata
        return (symmetryMask & 0x80) !== 0;
    }

    /**
     * Start continuous execution loop
     * @param {string} kernelId - Kernel to execute
     * @param {number} cyclesPerFrame - Cycles per animation frame (default 100000)
     * @param {function} onOutput - Callback for UART output
     */
    startContinuous(kernelId, cyclesPerFrame = 100000, onOutput = null) {
        const kernel = this.kernels.get(kernelId);
        if (!kernel) {
            throw new Error(`[GlyphExecutor] Kernel not found: ${kernelId}`);
        }

        if (kernel.running) {
            console.warn(`[GlyphExecutor] Kernel ${kernelId} already running`);
            return;
        }

        kernel.running = true;
        kernel.onOutput = onOutput;

        const executeFrame = () => {
            if (!kernel.running || kernel.halted) {
                return;
            }

            this.execute(kernelId, cyclesPerFrame);

            // Check for UART output
            if (onOutput) {
                this._checkUARTOutput(kernelId).then(output => {
                    if (output) {
                        onOutput(output);
                    }
                });
            }

            requestAnimationFrame(executeFrame);
        };

        requestAnimationFrame(executeFrame);
        console.log(`[GlyphExecutor] Started continuous execution for ${kernelId}`);
    }

    /**
     * Stop continuous execution
     * @param {string} kernelId - Kernel to stop
     */
    stop(kernelId) {
        const kernel = this.kernels.get(kernelId);
        if (kernel) {
            kernel.running = false;
            console.log(`[GlyphExecutor] Stopped kernel ${kernelId}`);
        }
    }

    /**
     * Check UART output buffer
     * @private
     */
    async _checkUARTOutput(kernelId) {
        const kernel = this.kernels.get(kernelId);
        if (!kernel) return null;

        // Read memory at UART FIFO region
        // For POC, we'd need a memory read mechanism
        // This is a placeholder for the full implementation
        return null;
    }
}
