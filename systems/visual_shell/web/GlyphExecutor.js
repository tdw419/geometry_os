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
        console.log('GlyphExecutor.registerGlyph() called at:', x, y);
        // Placeholder - will be implemented in Task 1.3
        return 0;
    }

    /**
     * Unregister a glyph from execution
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     */
    unregisterGlyph(x, y) {
        console.log('GlyphExecutor.unregisterGlyph() called at:', x, y);
        // Placeholder - will be implemented in Task 1.3
    }

    /**
     * Get execution state for a glyph
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @returns {object|null} Execution state or null if not registered
     */
    getExecutionState(x, y) {
        console.log('GlyphExecutor.getExecutionState() called at:', x, y);
        // Placeholder - will be implemented in Task 1.3
        return null;
    }

    /**
     * Get all registered glyphs
     * @returns {Array} Array of GlyphEntry objects
     */
    getActiveGlyphs() {
        console.log('GlyphExecutor.getActiveGlyphs() called');
        // Placeholder - will be implemented in Task 1.3
        return [];
    }

    /**
     * Execute all registered glyphs
     * Simulates compute dispatch for POC
     */
    execute() {
        console.log('GlyphExecutor.execute() called');
        // Placeholder - will be implemented in Task 1.5
        this.executionCount++;
    }

    /**
     * Start auto-execution mode
     * @param {number} fps - Frames per second for execution
     */
    startAutoExecution(fps = 30) {
        console.log('GlyphExecutor.startAutoExecution() called with fps:', fps);
        // Placeholder - will be implemented in Phase 2
    }

    /**
     * Stop auto-execution mode
     */
    stopAutoExecution() {
        console.log('GlyphExecutor.stopAutoExecution() called');
        // Placeholder - will be implemented in Phase 2
    }

    /**
     * Toggle auto-execution mode
     * @param {number} fps - Frames per second for execution
     */
    toggleAutoExecution(fps = 30) {
        console.log('GlyphExecutor.toggleAutoExecution() called');
        // Placeholder - will be implemented in Phase 2
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
