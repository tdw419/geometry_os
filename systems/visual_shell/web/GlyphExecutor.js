/**
 * Geometry OS: GlyphExecutor - The Motherboard
 *
 * Executes Resonance Glyphs placed on the Infinite Map.
 * Bridges PixiJS visual layer to WebGPU compute execution.
 *
 * Glyph size: 16x16 pixels
 * Max cores: 64 (matching shader workgroup size)
 * Registers per core: 46 (from visual_cpu_riscv_morph.wgsl)
 */

class GlyphExecutor {
    constructor(options = {}) {
        this.options = {
            maxCores: 64,
            glyphSize: 16,
            regsPerCore: 46,
            atlasPath: '/assets/universal_font.rts.png',
            ...options
        };

        // WebGPU state
        this.device = null;
        this.adapter = null;

        // GPU resources
        this.atlasTexture = null;
        this.systemMemoryBuffer = null;
        this.cpuStatesBuffer = null;

        // Glyph registry: Map<"x,y" -> GlyphEntry>
        this.registry = new Map();

        // Execution state
        this.executionCount = 0;
        this.autoExecutionInterval = null;
        this.executing = false;
        this.lastResult = null;
        this.ticker = null;
        this.frameCount = 0;

        console.log('GlyphExecutor created with options:', this.options);
    }

    /**
     * Async initialization - must be called after constructor
     * WebGPU requires async initialization
     */
    async init() {
        console.log('GlyphExecutor.init() called');

        // Initialize WebGPU
        const device = await this.initWebGPU();
        if (!device) {
            console.warn('GlyphExecutor initialized without WebGPU - execution disabled');
            return this;
        }

        // Create GPU buffers
        this.createBuffers();

        console.log('GlyphExecutor initialization complete');
        return this;
    }

    /**
     * Initialize WebGPU adapter and device
     * @returns {GPUDevice|null} WebGPU device or null if unavailable
     */
    async initWebGPU() {
        console.log('GlyphExecutor.initWebGPU() called');

        // Check WebGPU availability
        if (!navigator.gpu) {
            console.warn('WebGPU not supported in this browser');
            return null;
        }

        try {
            // Request adapter
            this.adapter = await navigator.gpu.requestAdapter();
            if (!this.adapter) {
                console.warn('Failed to get WebGPU adapter');
                return null;
            }

            // Request device
            this.device = await this.adapter.requestDevice();
            console.log('WebGPU device acquired');

            return this.device;
        } catch (error) {
            console.error('WebGPU initialization failed:', error);
            return null;
        }
    }

    /**
     * Create GPU buffers for system memory and CPU states
     * - systemMemory: 1MB storage buffer for program data/heap
     * - cpuStates: maxCores * 46 * 4 bytes (46 u32 registers per core)
     */
    createBuffers() {
        console.log('GlyphExecutor.createBuffers() called');

        if (!this.device) {
            console.error('Cannot create buffers: WebGPU device not initialized');
            return;
        }

        const { maxCores, regsPerCore } = this.options;

        // System Memory: 1MB storage buffer
        const systemMemorySize = 1 * 1024 * 1024; // 1MB
        this.systemMemoryBuffer = this.device.createBuffer({
            size: systemMemorySize,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_READ | GPUBufferUsage.COPY_WRITE,
        });

        // CPU States: maxCores * 46 regs * 4 bytes per u32
        const cpuStatesSize = maxCores * regsPerCore * 4;
        this.cpuStatesBuffer = this.device.createBuffer({
            size: cpuStatesSize,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_READ | GPUBufferUsage.COPY_WRITE,
        });

        console.log('Buffers created', {
            systemMemorySize,
            cpuStatesSize,
            maxCores,
            regsPerCore
        });
    }

    /**
     * Load the glyph atlas texture
     * @param {string} atlasPath - Path to atlas PNG file
     * @returns {GPUTexture|null} The loaded atlas texture or null on failure
     */
    async loadAtlas(atlasPath) {
        console.log('GlyphExecutor.loadAtlas() called with path:', atlasPath);

        if (!this.device) {
            console.error('Cannot load atlas: WebGPU device not initialized');
            return null;
        }

        try {
            // Fetch the atlas image
            const response = await fetch(atlasPath);
            if (!response.ok) {
                throw new Error(`Failed to fetch atlas: ${response.status} ${response.statusText}`);
            }

            const blob = await response.blob();

            // Create ImageBitmap for efficient GPU upload
            const imageBitmap = await createImageBitmap(blob);

            // Store dimensions
            this.atlasWidth = imageBitmap.width;
            this.atlasHeight = imageBitmap.height;

            // Create GPU texture
            this.atlasTexture = this.device.createTexture({
                size: [this.atlasWidth, this.atlasHeight, 1],
                format: 'rgba8unorm',
                usage: GPUTextureUsage.TEXTURE_BINDING |
                       GPUTextureUsage.COPY_DST |
                       GPUTextureUsage.RENDER_ATTACHMENT,
            });

            // Copy image data to GPU texture
            this.device.queue.copyExternalImageToTexture(
                { source: imageBitmap },
                { texture: this.atlasTexture },
                [this.atlasWidth, this.atlasHeight, 1]
            );

            console.log(`Atlas loaded: ${this.atlasWidth}x${this.atlasHeight}`);

            return this.atlasTexture;
        } catch (error) {
            console.error('Failed to load atlas:', error);
            return null;
        }
    }

    /**
     * Register a glyph for execution
     * @param {number} x - X coordinate on the map
     * @param {number} y - Y coordinate on the map
     * @param {object} sprite - PixiJS sprite reference
     * @param {number} atlasX - X position in atlas (glyph column)
     * @param {number} atlasY - Y position in atlas (glyph row)
     * @returns {number} Assigned core ID
     */
    registerGlyph(x, y, sprite, atlasX, atlasY) {
        const key = `${x},${y}`;

        // Check if already registered
        if (this.registry.has(key)) {
            console.warn(`Glyph already registered at (${x},${y})`);
            return this.registry.get(key).coreId;
        }

        // Assign core ID using round-robin modulo
        const coreId = this.registry.size % this.options.maxCores;

        // Create GlyphEntry
        const entry = {
            sprite,
            atlasX,
            atlasY,
            coreId,
            pc: 0,
            active: true,
            lastResult: null,
            executionCount: 0,
            glowIntensity: 0
        };

        // Add to registry
        this.registry.set(key, entry);

        console.log(`Glyph registered at (${x},${y}), core ${coreId}`);

        return coreId;
    }

    /**
     * Unregister a glyph from execution
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     */
    unregisterGlyph(x, y) {
        const key = `${x},${y}`;

        if (this.registry.has(key)) {
            const entry = this.registry.get(key);
            this.registry.delete(key);
            console.log(`Glyph unregistered at (${x},${y}), was core ${entry.coreId}`);
        } else {
            console.warn(`No glyph registered at (${x},${y}) to unregister`);
        }
    }

    /**
     * Get execution state for a glyph
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @returns {object|null} Execution state or null if not registered
     */
    getExecutionState(x, y) {
        const key = `${x},${y}`;
        return this.registry.get(key) || null;
    }

    /**
     * Get all registered glyphs
     * @returns {Array} Array of GlyphEntry objects
     */
    getActiveGlyphs() {
        return Array.from(this.registry.values());
    }

    /**
     * Execute all registered glyphs
     * Full execution loop: sync -> dispatch -> read -> update
     * @returns {Promise<object>} Execution results
     */
    async execute() {
        console.log('GlyphExecutor.execute() called');

        // Prevent re-entry
        if (this.executing) {
            console.warn('Execute already in progress, skipping');
            return { skipped: true };
        }
        this.executing = true;

        try {
            const activeGlyphs = this.getActiveGlyphs().filter(g => g.active);
            const glyphCount = activeGlyphs.length;

            if (glyphCount === 0) {
                console.log('No active glyphs to execute');
                this.executing = false;
                return { executed: 0 };
            }

            // Step 1: Sync CPU states to GPU buffer
            this.syncCPUIStates(activeGlyphs);

            // Step 2: Dispatch compute (simulated for POC)
            await this.dispatchCompute(activeGlyphs);

            // Step 3: Read results from GPU buffer
            const results = await this.readResults(activeGlyphs);

            // Step 4: Update visual feedback
            this.updateVisualFeedback(activeGlyphs, results);

            // Update execution count and last result
            this.executionCount++;
            this.lastResult = {
                executed: glyphCount,
                timestamp: Date.now(),
                results
            };

            console.log(`Executed ${glyphCount} glyphs`);

            return this.lastResult;
        } finally {
            this.executing = false;
        }
    }

    /**
     * Sync CPU states to GPU buffer
     * Creates Uint32Array, sets PC for each active glyph
     */
    syncCPUIStates(activeGlyphs) {
        const { maxCores, regsPerCore } = this.options;
        const glyphsPerRow = this.atlasWidth ? Math.floor(this.atlasWidth / 16) : 64;

        // Create CPU states array
        const cpuStates = new Uint32Array(maxCores * regsPerCore);

        for (const glyph of activeGlyphs) {
            const baseIdx = glyph.coreId * regsPerCore;

            // Set PC at offset +32 (from shader spec)
            cpuStates[baseIdx + 32] = glyph.pc;

            // Set atlas position for decode
            cpuStates[baseIdx + 0] = glyph.atlasX;
            cpuStates[baseIdx + 1] = glyph.atlasY;

            // Calculate glyph index in atlas
            const glyphIdx = glyph.atlasY * glyphsPerRow + glyph.atlasX;
            cpuStates[baseIdx + 2] = glyphIdx;

            console.log(`syncCPUIStates: core ${glyph.coreId}, PC=${glyph.pc}, atlas=(${glyph.atlasX},${glyph.atlasY})`);
        }

        // Write to GPU buffer if available
        if (this.device && this.cpuStatesBuffer) {
            this.device.queue.writeBuffer(
                this.cpuStatesBuffer,
                0,
                cpuStates.buffer,
                0,
                cpuStates.byteLength
            );
        }
    }

    /**
     * Dispatch compute shader (simulated for POC)
     * In full implementation, would dispatch visual_cpu_riscv_morph.wgsl
     * @param {Array} activeGlyphs - Glyphs to execute
     */
    async dispatchCompute(activeGlyphs) {
        // POC: Simulated compute - just increment execution count per glyph
        // Full implementation would:
        // 1. Create compute pipeline with visual_cpu_riscv_morph.wgsl
        // 2. Create bind group with atlas texture, systemMemory, cpuStates
        // 3. Dispatch workgroups (1 per glyph, max 64)
        // 4. Wait for completion

        for (const glyph of activeGlyphs) {
            glyph.executionCount++;
        }

        // Simulate async GPU work
        await new Promise(resolve => setTimeout(resolve, 1));

        console.log(`dispatchCompute: simulated execution for ${activeGlyphs.length} glyphs`);
    }

    /**
     * Read results from GPU buffer
     * Checks halt flag and extracts execution state
     * Detects fraud when halt flag is set
     * @param {Array} activeGlyphs - Glyphs to read results for
     * @returns {Promise<Array>} Results per glyph
     */
    async readResults(activeGlyphs) {
        const { maxCores, regsPerCore } = this.options;
        const results = [];

        // POC: Simulated readback
        // Full implementation would:
        // 1. Create staging buffer with MAP_READ | COPY_DST
        // 2. Copy cpuStatesBuffer to staging
        // 3. mapAsync(), read, unmap()

        for (const glyph of activeGlyphs) {
            const baseIdx = glyph.coreId * regsPerCore;

            // Simulated: check halt flag at offset +38
            // In real implementation, read from buffer
            // POC: Simulate fraud detection - 5% chance of halt for testing
            const fraudDetected = Math.random() < 0.05;
            const haltFlag = fraudDetected; // POC: random fraud for testing
            const cycles = glyph.executionCount;

            results.push({
                coreId: glyph.coreId,
                halted: haltFlag,
                fraud: fraudDetected,
                cycles,
                pc: glyph.pc
            });

            // Update glyph's lastResult with fraud flag
            glyph.lastResult = {
                cycles,
                halted: haltFlag,
                fraud: fraudDetected
            };
        }

        console.log(`readResults: ${results.length} glyph states read`);
        return results;
    }

    /**
     * Update visual feedback for glyphs
     * Updates glowIntensity based on active state with smooth interpolation
     * Active glyphs: alpha 0.7-1.0, pulsing scale effect
     * Halted glyphs (fraud detected): red tint
     * @param {Array} activeGlyphs - Glyphs to update
     * @param {Array} results - Execution results
     */
    updateVisualFeedback(activeGlyphs, results) {
        const time = Date.now();

        for (let i = 0; i < activeGlyphs.length; i++) {
            const glyph = activeGlyphs[i];
            const result = results[i];

            if (!glyph.sprite) continue;

            // Check for fraud/halt detection
            if (result.halted || result.fraud) {
                // Halted glyphs (fraud detected): red tint, dim
                glyph.sprite.tint = 0xff0000; // Red tint for fraud
                glyph.sprite.alpha = 0.5;
                glyph.active = false;

                // Smooth interpolation to zero glow
                const targetGlow = 0;
                glyph.glowIntensity = glyph.glowIntensity * 0.85 + targetGlow * 0.15;

                // No scale pulse for halted glyphs
                glyph.sprite.scale.set(1.0);
            } else {
                // Active glyphs: glow and pulse
                // Target glow intensity based on execution activity
                const targetGlow = Math.min(1.0, 0.5 + (glyph.executionCount % 10) * 0.05);

                // Smooth interpolation: glowIntensity = glowIntensity * 0.85 + target * 0.15
                glyph.glowIntensity = glyph.glowIntensity * 0.85 + targetGlow * 0.15;

                // Alpha blend: 0.7-1.0 based on glowIntensity
                glyph.sprite.alpha = 0.7 + glyph.glowIntensity * 0.3;

                // Pulsing scale effect: 1.0 + sin(time/300 + coreId) * 0.1 * glowIntensity
                const scalePulse = Math.sin(time / 300 + glyph.coreId) * 0.1 * glyph.glowIntensity;
                const scale = 1.0 + scalePulse;
                glyph.sprite.scale.set(scale);

                // Clear any red tint from previous state
                glyph.sprite.tint = 0xffffff;
            }
        }

        console.log(`updateVisualFeedback: ${activeGlyphs.length} glyphs updated`);
    }

    /**
     * Start auto-execution mode
     * @param {number} fps - Frames per second for execution
     */
    startAutoExecution(fps = 30) {
        console.log('GlyphExecutor.startAutoExecution() called with fps:', fps);

        if (this.ticker !== null) {
            console.warn('Auto-execution already running');
            return;
        }

        const intervalMs = 1000 / fps;
        this.ticker = setInterval(() => {
            this.frameCount++;
            this.execute();
        }, intervalMs);

        console.log(`Auto-execution started at ${fps} FPS (interval: ${intervalMs}ms)`);
    }

    /**
     * Stop auto-execution mode
     */
    stopAutoExecution() {
        console.log('GlyphExecutor.stopAutoExecution() called');

        if (this.ticker === null) {
            console.warn('Auto-execution not running');
            return;
        }

        clearInterval(this.ticker);
        this.ticker = null;

        console.log('Auto-execution stopped');
    }

    /**
     * Toggle auto-execution mode
     * @param {number} fps - Frames per second for execution
     * @returns {boolean} New auto-execution state (true = running, false = stopped)
     */
    toggleAutoExecution(fps = 30) {
        console.log('GlyphExecutor.toggleAutoExecution() called');

        if (this.ticker === null) {
            this.startAutoExecution(fps);
            return true;
        } else {
            this.stopAutoExecution();
            return false;
        }
    }

    /**
     * Check if auto-execution is running
     * @returns {boolean} True if auto-execution is active
     */
    isAutoExecuting() {
        return this.ticker !== null;
    }
}

// Export for Node.js compatibility
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { GlyphExecutor };
}

// Export for browser (window global)
if (typeof window !== 'undefined') {
    window.GlyphExecutor = GlyphExecutor;
}
