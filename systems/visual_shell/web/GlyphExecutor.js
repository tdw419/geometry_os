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

        // Glyph Registry - maps spatial positions to execution state
        this.glyphRegistry = new Map(); // "x,y" -> { coreId, sprite, atlasX, atlasY, state }
        this.nextCoreId = 1;

        // Auto-execution state
        this.autoExecutionInterval = null;
        this.autoExecutionFps = 60;
        this.frameCount = 0;
        this.autoExecutionEnabled = false;
    }

    /**
     * Register a glyph for execution tracking
     * @param {number} x - Screen X position
     * @param {number} y - Screen Y position
     * @param {PIXI.Sprite} sprite - Visual sprite for this glyph
     * @param {number} atlasX - X position in glyph atlas
     * @param {number} atlasY - Y position in glyph atlas
     * @returns {number} Assigned core ID
     */
    registerGlyph(x, y, sprite, atlasX, atlasY) {
        const key = `${x},${y}`;
        const coreId = this.nextCoreId++;

        this.glyphRegistry.set(key, {
            coreId,
            sprite,
            atlasX,
            atlasY,
            state: 'idle', // idle | running | halted | error
            pc: 0,
            cycleCount: 0,
            lastOutput: null
        });

        console.log(`[GlyphExecutor] Registered glyph at (${x},${y}) with coreId=${coreId}`);
        return coreId;
    }

    /**
     * Unregister a glyph from execution tracking
     * @param {number} x - Screen X position
     * @param {number} y - Screen Y position
     * @returns {boolean} True if glyph was removed
     */
    unregisterGlyph(x, y) {
        const key = `${x},${y}`;
        const removed = this.glyphRegistry.delete(key);

        if (removed) {
            console.log(`[GlyphExecutor] Unregistered glyph at (${x},${y})`);
        }
        return removed;
    }

    /**
     * Get execution state for a glyph
     * @param {number} x - Screen X position
     * @param {number} y - Screen Y position
     * @returns {Object|null} State object or null if not found
     */
    getExecutionState(x, y) {
        const key = `${x},${y}`;
        return this.glyphRegistry.get(key) || null;
    }

    /**
     * Get all active glyphs in the registry
     * @returns {Array} Array of {x, y, ...entry} objects
     */
    getActiveGlyphs() {
        const active = [];

        for (const [key, entry] of this.glyphRegistry) {
            const [x, y] = key.split(',').map(Number);
            active.push({
                x,
                y,
                ...entry
            });
        }

        return active;
    }

    /**
     * Update execution state for a glyph
     * @param {number} x - Screen X position
     * @param {number} y - Screen Y position
     * @param {Object} stateUpdate - Partial state to merge
     * @returns {boolean} True if update succeeded
     */
    updateGlyphState(x, y, stateUpdate) {
        const key = `${x},${y}`;
        const entry = this.glyphRegistry.get(key);

        if (!entry) return false;

        Object.assign(entry, stateUpdate);

        // Update sprite visual state based on execution state
        if (entry.sprite) {
            switch (entry.state) {
                case 'running':
                    entry.sprite.tint = 0x00FF88; // Green glow
                    break;
                case 'halted':
                    entry.sprite.tint = 0xFFAA00; // Orange
                    break;
                case 'error':
                    entry.sprite.tint = 0xFF4444; // Red
                    break;
                default:
                    entry.sprite.tint = 0xFFFFFF; // White (idle)
            }
        }

        return true;
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

    /**
     * Update visual feedback for all registered glyphs
     * Called each frame during continuous execution
     */
    updateVisualFeedback() {
        const now = Date.now();

        for (const [key, entry] of this.glyphRegistry) {
            if (!entry.sprite) continue;

            const sprite = entry.sprite;
            const timeSinceExecution = now - (entry.lastExecutionTime || 0);

            // Calculate glow intensity based on execution state
            let glowIntensity = 0;
            let baseColor = 0xFFFFFF;
            let alpha = 0.9;

            switch (entry.state) {
                case 'running':
                    // Bright green glow, full intensity
                    glowIntensity = 1.0;
                    baseColor = 0x00FF88;
                    alpha = 1.0;

                    // Pulsing effect while running
                    const pulse = Math.sin(now / 100) * 0.3 + 0.7;
                    sprite.scale.set(pulse);
                    break;

                case 'halted':
                    // Orange/amber for halted (intentional stop)
                    glowIntensity = 0.6;
                    baseColor = 0xFFAA00;
                    alpha = 0.85;
                    sprite.scale.set(1.0);
                    break;

                case 'error':
                    // Red for errors and fraud detection
                    glowIntensity = 0.8;
                    baseColor = 0xFF4444;
                    alpha = 0.9;

                    // Vibration effect for errors
                    sprite.rotation = Math.sin(now / 50) * 0.05;
                    break;

                case 'fraud':
                    // Deep red pulsing for fraud/invalid resonance
                    glowIntensity = 1.0;
                    baseColor = 0xFF0000;
                    alpha = 1.0;

                    // Aggressive pulsing
                    const fraudPulse = Math.sin(now / 80) * 0.4 + 0.6;
                    sprite.scale.set(fraudPulse);
                    sprite.rotation = Math.sin(now / 30) * 0.1;
                    break;

                default: // idle
                    // Dim white for idle glyphs
                    glowIntensity = 0.3;
                    baseColor = 0xFFFFFF;
                    alpha = 0.7;
                    sprite.scale.set(1.0);
                    sprite.rotation = 0;
            }

            // Apply pulsing decay for recently executed glyphs
            if (entry.state !== 'running' && timeSinceExecution < 500) {
                // Recent execution glow (decays over 500ms)
                const decayPulse = 1 - (timeSinceExecution / 500);
                glowIntensity = Math.max(glowIntensity, decayPulse * 0.5);

                // Brief green flash
                if (decayPulse > 0.7) {
                    baseColor = this._blendColors(baseColor, 0x00FF88, decayPulse);
                }
            }

            // Apply to sprite
            sprite.tint = baseColor;
            sprite.alpha = alpha * (0.7 + glowIntensity * 0.3);

            // Apply shader uniforms if available
            if (sprite.shader && sprite.shader.resources && sprite.shader.resources.uniforms) {
                const uniforms = sprite.shader.resources.uniforms;
                uniforms.glowIntensity = glowIntensity;
                uniforms.time = now / 1000;
            }
        }
    }

    /**
     * Blend two hex colors
     * @private
     */
    _blendColors(color1, color2, amount) {
        const r1 = (color1 >> 16) & 0xFF;
        const g1 = (color1 >> 8) & 0xFF;
        const b1 = color1 & 0xFF;

        const r2 = (color2 >> 16) & 0xFF;
        const g2 = (color2 >> 8) & 0xFF;
        const b2 = color2 & 0xFF;

        const r = Math.round(r1 + (r2 - r1) * amount);
        const g = Math.round(g1 + (g2 - g1) * amount);
        const b = Math.round(b1 + (b2 - b1) * amount);

        return (r << 16) | (g << 8) | b;
    }

    /**
     * Mark a glyph as recently executed (triggers glow decay)
     * @param {number} x - Screen X position
     * @param {number} y - Screen Y position
     */
    markExecuted(x, y) {
        const entry = this.glyphRegistry.get(`${x},${y}`);
        if (entry) {
            entry.lastExecutionTime = Date.now();
        }
    }

    /**
     * Mark a glyph as fraud/invalid resonance
     * @param {number} x - Screen X position
     * @param {number} y - Screen Y position
     * @param {string} reason - Fraud detection reason
     */
    markFraud(x, y, reason) {
        const entry = this.glyphRegistry.get(`${x},${y}`);
        if (entry) {
            entry.state = 'fraud';
                entry.fraudReason = reason;
                console.warn(`[GlyphExecutor] Fraud detected at (${x},${y}): ${reason}`);
        }
    }

    /**
     * Start auto-execution mode
     * Runs all registered glyphs at specified FPS
     * @param {number} fps - Target frames per second (default: 30)
     * @param {string} kernelId - Kernel to execute
     */
    startAutoExecution(fps = 30, kernelId = null) {
        if (this.autoExecutionEnabled) {
            console.warn('[GlyphExecutor] Auto-execution already running');
            return;
        }

        this.autoExecutionEnabled = true;
        const frameInterval = 1000 / fps;

        console.log(`[GlyphExecutor] Starting auto-execution at ${fps} FPS`);

        this._autoExecutionInterval = setInterval(() => {
            this.frameCount++;

            // Execute all registered glyphs
            for (const [key, entry] of this.glyphRegistry) {
                if (entry.state === 'running' || entry.state === 'idle') {
                    // Mark as executed for visual feedback
                    const [x, y] = key.split(',').map(Number);
                    this.markExecuted(x, y);

                    // Update visual state
                    this.updateGlyphState(x, y, { state: 'running' });
                }
            }

            // Execute the kernel if specified
            if (kernelId && this.kernels.has(kernelId)) {
                this.execute(kernelId, 1000); // Execute 1000 cycles per frame
            }

            // Update visual feedback
            this.updateVisualFeedback();

        }, frameInterval);
    }

    /**
     * Stop auto-execution mode
     */
    stopAutoExecution() {
        if (!this.autoExecutionEnabled) {
            return;
        }

        if (this._autoExecutionInterval) {
            clearInterval(this._autoExecutionInterval);
            this._autoExecutionInterval = null;
        }

        this.autoExecutionEnabled = false;

        // Mark all running glyphs as halted
        for (const [key, entry] of this.glyphRegistry) {
            if (entry.state === 'running') {
                const [x, y] = key.split(',').map(Number);
                this.updateGlyphState(x, y, { state: 'halted' });
            }
        }

        console.log('[GlyphExecutor] Stopped auto-execution');
    }

    /**
     * Toggle auto-execution mode
     * @param {number} fps - Target FPS (default: 30)
     * @param {string} kernelId - Kernel to execute
     * @returns {boolean} New state (true = running)
     */
    toggleAutoExecution(fps = 30, kernelId = null) {
        if (this.autoExecutionEnabled) {
            this.stopAutoExecution();
            return false;
        } else {
            this.startAutoExecution(fps, kernelId);
            return true;
        }
    }

    /**
     * Check if auto-execution is enabled
     * @returns {boolean}
     */
    isAutoExecutionEnabled() {
        return this.autoExecutionEnabled;
    }

    /**
     * Get current frame count
     * @returns {number}
     */
    getFrameCount() {
        return this.frameCount;
    }
}
