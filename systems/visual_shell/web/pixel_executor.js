/**
 * Geometry OS: Pixel Executor - "The Screen is the Hard Drive"
 *
 * Implements the Pixel-Exec Protocol: Direct execution of RISC-V instructions
 * from texture pixels using Hilbert curve spatial mapping.
 *
 * This is the missing link between the Visual Shell (PixiJS) and the RTS FUSE
 * system - allowing instructions to be executed directly from .rts.png textures
 * without intermediate file extraction.
 *
 * @module pixel_executor
 */

class PixelExecutor {
    /**
     * Create a new PixelExecutor
     * @param {Object} options - Configuration options
     * @param {SimplePixelCPU} options.cpu - Pixel CPU instance (optional, creates new if not provided)
     * @param {number} options.order - Hilbert curve order (auto-detected if not provided)
     * @param {boolean} options.littleEndian - Use little-endian byte order (default: true)
     * @param {boolean} options.semanticMode - Enable semantic pixel expansion (default: false)
     * @param {GeometricDictionary} options.dictionary - Geometric dictionary for semantic expansion
     * @param {boolean} options.hybridMode - Allow mixed literal/semantic pixels (default: true)
     */
    constructor(options = {}) {
        this.options = {
            littleEndian: true,
            semanticMode: false,
            hybridMode: true,
            ...options
        };

        // CPU instance
        this.cpu = options.cpu || null;
        if (!this.cpu && typeof SimplePixelCPU !== 'undefined') {
            this.cpu = new SimplePixelCPU();
        }

        // Hilbert LUT builder
        this.hilbert = new HilbertLUTBuilder();
        if (options.order) {
            this.hilbert.setOrder(options.order);
        }

        // Geometric Dictionary for semantic expansion
        this.dictionary = options.dictionary || null;

        // Execution state
        this.isExecuting = false;
        this.executionStats = {
            instructionsExecuted: 0,
            cycles: 0,
            texturesLoaded: 0,
            totalInstructionsExtracted: 0,
            semanticPixelsExpanded: 0,
            literalPixelsExtracted: 0,
            compressionRatio: 1.0
        };

        // Event callbacks
        this.onInstruction = null;
        this.onHalt = null;
        this.onError = null;
        this.onProgress = null;
        this.onSemanticExpansion = null; // Callback when semantic pixel is expanded

        console.log('🎮 PixelExecutor initialized', {
            ...this.options,
            hasDictionary: !!this.dictionary
        });
    }

    /**
     * Load and execute instructions from a texture/sprite
     * @param {PIXI.Sprite|HTMLImageElement|HTMLCanvasElement|string} textureSource - Texture to execute
     * @param {Object} options - Execution options
     * @param {number} options.maxCycles - Maximum cycles to execute (default: 10000)
     * @param {number} options.entryPoint - Entry point instruction index (default: 0)
     * @param {boolean} options.reset - Reset CPU before loading (default: true)
     * @returns {Promise<Object>} - Execution result with stats
     */
    async executeFromTexture(textureSource, options = {}) {
        const opts = {
            maxCycles: 10000,
            entryPoint: 0,
            reset: true,
            ...options
        };

        try {
            // Extract instructions from texture
            console.log('📺 Extracting instructions from texture...');
            const instructions = await this.extractFromTexture(textureSource);

            if (instructions.length === 0) {
                throw new Error('No instructions found in texture');
            }

            console.log(`✓ Extracted ${instructions.length} instructions`);

            // Load into CPU
            if (opts.reset && this.cpu) {
                this.cpu.reset();
            }

            // Set entry point
            const pc = opts.entryPoint;
            if (this.cpu) {
                this.cpu.memory = Array.from(instructions);
                this.cpu.pc = pc;
            }

            // Execute
            console.log(`🚀 Starting execution from PC=${pc}...`);
            const result = await this.execute(opts.maxCycles);

            return {
                success: true,
                instructionsLoaded: instructions.length,
                entryPoint: pc,
                ...result
            };

        } catch (error) {
            console.error('❌ Execution failed:', error);
            if (this.onError) {
                this.onError(error);
            }
            return {
                success: false,
                error: error.message
            };
        }
    }

    /**
     * Extract RISC-V instructions from a texture source
     * @param {PIXI.Sprite|HTMLImageElement|HTMLCanvasElement|string} source - Texture source
     * @returns {Promise<Uint32Array>} - Array of 32-bit instructions
     */
    async extractFromTexture(source) {
        let imageData;

        // Handle different source types
        if (typeof source === 'string') {
            // URL path
            imageData = await this._loadImageFromUrl(source);
        } else if (source instanceof HTMLElement && source.tagName === 'IMG') {
            // HTMLImageElement
            imageData = this._getImageData(source);
        } else if (source instanceof HTMLElement && source.tagName === 'CANVAS') {
            // HTMLCanvasElement
            const ctx = source.getContext('2d');
            imageData = ctx.getImageData(0, 0, source.width, source.height);
        } else if (source instanceof PIXI.Sprite) {
            // PixiJS Sprite
            imageData = this._getPixiSpriteImageData(source);
        } else if (source instanceof PIXI.Texture) {
            // PixiJS Texture
            imageData = this._getPixiTextureImageData(source);
        } else {
            throw new Error(`Unsupported texture source type: ${source.constructor.name}`);
        }

        // Extract instructions using appropriate method
        let instructions;
        if (this.options.semanticMode && this.dictionary) {
            // Semantic expansion mode
            instructions = await this.extractSemantic(imageData);
        } else {
            // Literal mode (default)
            instructions = this.hilbert.extractInstructions(
                imageData.data,
                imageData.width,
                imageData.height,
                this.options.littleEndian
            );
            this.executionStats.literalPixelsExtracted += Math.ceil(instructions.length);
        }

        this.executionStats.totalInstructionsExtracted += instructions.length;
        this.executionStats.texturesLoaded++;

        return instructions;
    }

    /**
     * Load image from URL
     * @private
     */
    async _loadImageFromUrl(url) {
        return new Promise((resolve, reject) => {
            const img = new Image();
            img.crossOrigin = 'anonymous';
            img.onload = () => resolve(this._getImageData(img));
            img.onerror = () => reject(new Error(`Failed to load image: ${url}`));
            img.src = url;
        });
    }

    /**
     * Get ImageData from HTMLImageElement
     * @private
     */
    _getImageData(img) {
        const canvas = document.createElement('canvas');
        canvas.width = img.width;
        canvas.height = img.height;
        const ctx = canvas.getContext('2d');
        ctx.drawImage(img, 0, 0);
        return ctx.getImageData(0, 0, img.width, img.height);
    }

    /**
     * Get ImageData from PixiJS Sprite
     * @private
     */
    _getPixiSpriteImageData(sprite) {
        return this._getPixiTextureImageData(sprite.texture);
    }

    /**
     * Get ImageData from PixiJS Texture
     * @private
     */
    _getPixiTextureImageData(texture) {
        // Create a temporary canvas to extract pixel data
        const canvas = document.createElement('canvas');
        canvas.width = texture.width;
        canvas.height = texture.height;
        const ctx = canvas.getContext('2d');

        // Render texture to canvas
        if (texture.baseTexture.resource && texture.baseTexture.resource.source) {
            ctx.drawImage(texture.baseTexture.resource.source, 0, 0);
        } else {
            // Fallback: try to get from WebGL context
            console.warn('Cannot extract texture data directly - WebGL context required');
            // Return empty ImageData
            return ctx.createImageData(1, 1);
        }

        return ctx.getImageData(0, 0, canvas.width, canvas.height);
    }

    /**
     * Extract instructions with semantic expansion
     * Uses the Geometric Dictionary to expand semantic pixels into instruction blocks
     * @param {ImageData} imageData - Image data from texture
     * @returns {Promise<Uint32Array>} - Array of 32-bit instructions
     * @private
     */
    async extractSemantic(imageData) {
        if (!this.dictionary) {
            throw new Error('Semantic mode requires a GeometricDictionary');
        }

        console.log('🔍 Using semantic expansion mode...');
        const startTime = performance.now();

        // Calculate Hilbert order for this image
        const order = HilbertLUT.calculateOrder(imageData.width, imageData.height);
        const gridSize = 2 ** order;

        // Create LUT if needed
        if (this.hilbert.lut === null || this.hilbert.order !== order) {
            this.hilbert.setOrder(order);
        }

        const allInstructions = [];
        let semanticCount = 0;
        let literalCount = 0;
        const totalPixels = Math.min(gridSize * gridSize, Math.floor(imageData.data.length / 4));

        for (let d = 0; d < totalPixels; d++) {
            const [x, y] = this.hilbert.lut[d];

            // Skip if out of bounds
            if (x >= imageData.width || y >= imageData.height) {
                break;
            }

            // Extract RGBA from pixel
            const offset = (y * imageData.width + x) * 4;
            const r = imageData.data[offset];
            const g = imageData.data[offset + 1];
            const b = imageData.data[offset + 2];
            const a = imageData.data[offset + 3];

            // Check if this is a semantic pixel
            if (this.dictionary.isSemanticPixel(r, g, b)) {
                // Semantic pixel: expand using dictionary
                const instructions = this.dictionary.getInstructionsFromPixel(r, g, b, a);
                allInstructions.push(...instructions);
                semanticCount++;

                if (this.onSemanticExpansion) {
                    this.onSemanticExpansion({
                        x, y,
                        tokenId: (r << 16) | (g << 8) | b,
                        instructionCount: instructions.length
                    });
                }
            } else if (this.options.hybridMode) {
                // Hybrid mode: treat as literal 4-byte instruction
                const instruction = (r << 24) | (g << 16) | (b << 8) | a;
                allInstructions.push(instruction);
                literalCount++;
            } else {
                // Pure semantic mode: skip non-semantic pixels
                continue;
            }
        }

        const extractionTime = performance.now() - startTime;
        this.executionStats.semanticPixelsExpanded = semanticCount;
        this.executionStats.literalPixelsExtracted = literalCount;

        // Calculate compression ratio
        const totalPixelsProcessed = semanticCount + literalCount;
        if (totalPixelsProcessed > 0) {
            this.executionStats.compressionRatio = allInstructions.length / totalPixelsProcessed;
        }

        console.log(`✓ Semantic expansion complete in ${extractionTime.toFixed(2)}ms`);
        console.log(`  Semantic pixels: ${semanticCount} → ${allInstructions.length - literalCount} instructions`);
        console.log(`  Literal pixels: ${literalCount}`);
        console.log(`  Total instructions: ${allInstructions.length}`);
        console.log(`  Compression ratio: ${this.executionStats.compressionRatio.toFixed(2)}x`);

        return new Uint32Array(allInstructions);
    }

    /**
     * Set the Geometric Dictionary for semantic expansion
     * @param {GeometricDictionary} dictionary - Dictionary instance
     */
    setDictionary(dictionary) {
        this.dictionary = dictionary;
        console.log('📖 Geometric Dictionary set for semantic expansion');
    }

    /**
     * Enable or disable semantic mode
     * @param {boolean} enabled - Enable semantic mode
     */
    setSemanticMode(enabled) {
        this.options.semanticMode = enabled;

        if (enabled && !this.dictionary) {
            console.warn('⚠ Semantic mode enabled but no dictionary loaded');
        }

        console.log(`🔍 Semantic mode: ${enabled ? 'ENABLED' : 'DISABLED'}`);
    }

    /**
     * Load dictionary from URL and enable semantic mode
     * @param {string} dictionaryUrl - URL to geometric_codebook.json
     * @returns {Promise<Object>} - Loading result
     */
    async loadDictionary(dictionaryUrl) {
        if (typeof GeometricDictionary === 'undefined') {
            throw new Error('GeometricDictionary not loaded. Include holographic_dictionary.js first.');
        }

        this.dictionary = new GeometricDictionary({
            cacheVRAM: true
        });

        const result = await this.dictionary.loadFromManifest(dictionaryUrl);

        if (result.success) {
            this.options.semanticMode = true;
            console.log('✅ Dictionary loaded and semantic mode enabled');
        }

        return result;
    }

    /**
     * Execute instructions on the CPU
     * @param {number} maxCycles - Maximum cycles to execute
     * @returns {Promise<Object>} - Execution result
     * @private
     */
    async execute(maxCycles) {
        if (!this.cpu) {
            throw new Error('No CPU instance available');
        }

        this.isExecuting = true;
        const startTime = performance.now();
        let lastProgress = 0;

        return new Promise((resolve) => {
            const executeStep = () => {
                // Check if halted
                if (this.cpu.halted) {
                    this.isExecuting = false;
                    const endTime = performance.now();

                    if (this.onHalt) {
                        this.onHalt(this.cpu);
                    }

                    resolve({
                        halted: true,
                        cycles: this.cpu.cycles,
                        instructionsExecuted: this.executionStats.instructionsExecuted,
                        executionTime: endTime - startTime,
                        registers: Array.from(this.cpu.registers),
                        pc: this.cpu.pc
                    });
                    return;
                }

                // Check cycle limit
                if (this.cpu.cycles >= maxCycles) {
                    console.warn(`⚠ Reached cycle limit (${maxCycles})`);
                    this.isExecuting = false;
                    const endTime = performance.now();

                    resolve({
                        halted: false,
                        cycles: this.cpu.cycles,
                        instructionsExecuted: this.executionStats.instructionsExecuted,
                        executionTime: endTime - startTime,
                        cycleLimitReached: true,
                        registers: Array.from(this.cpu.registers),
                        pc: this.cpu.pc
                    });
                    return;
                }

                // Execute one instruction
                try {
                    this.cpu.step();

                    // Update stats
                    this.executionStats.instructionsExecuted++;

                    // Progress callback (every 1000 instructions)
                    if (this.onProgress && this.cpu.cycles % 1000 === 0) {
                        const progress = (this.cpu.cycles / maxCycles) * 100;
                        if (progress - lastProgress >= 5) { // Update every 5%
                            this.onProgress(progress, this.cpu.cycles, maxCycles);
                            lastProgress = progress;
                        }
                    }

                    // Instruction callback
                    if (this.onInstruction) {
                        this.onInstruction(this.cpu);
                    }

                } catch (error) {
                    console.error('❌ Execution error:', error);
                    this.isExecuting = false;

                    if (this.onError) {
                        this.onError(error);
                    }

                    resolve({
                        halted: false,
                        error: error.message,
                        cycles: this.cpu.cycles,
                        instructionsExecuted: this.executionStats.instructionsExecuted
                    });
                    return;
                }

                // Continue execution (use setTimeout to allow UI updates)
                setTimeout(executeStep, 0);
            };

            executeStep();
        });
    }

    /**
     * Stop execution
     */
    stop() {
        this.isExecuting = false;
        if (this.cpu) {
            this.cpu.halted = true;
        }
        console.log('⏹ Execution stopped');
    }

    /**
     * Reset executor state
     */
    reset() {
        this.stop();
        this.executionStats = {
            instructionsExecuted: 0,
            cycles: 0,
            texturesLoaded: 0,
            totalInstructionsExtracted: 0
        };

        if (this.cpu) {
            this.cpu.reset();
        }

        console.log('🔄 PixelExecutor reset');
    }

    /**
     * Get execution statistics
     * @returns {Object} - Execution statistics
     */
    getStats() {
        return {
            ...this.executionStats,
            isExecuting: this.isExecuting,
            cpuState: this.cpu ? {
                pc: this.cpu.pc,
                cycles: this.cpu.cycles,
                halted: this.cpu.halted,
                memorySize: this.cpu.memory.length
            } : null
        };
    }

    /**
     * Create a snapshot of current CPU state
     * @returns {Object} - CPU state snapshot
     */
    createSnapshot() {
        if (!this.cpu) {
            throw new Error('No CPU instance available');
        }

        return {
            registers: Array.from(this.cpu.registers),
            pc: this.cpu.pc,
            memory: Array.from(this.cpu.memory),
            cycles: this.cpu.cycles,
            halted: this.cpu.halted
        };
    }

    /**
     * Restore CPU state from snapshot
     * @param {Object} snapshot - CPU state snapshot
     */
    restoreSnapshot(snapshot) {
        if (!this.cpu) {
            throw new Error('No CPU instance available');
        }

        this.cpu.registers = Array.from(snapshot.registers);
        this.cpu.pc = snapshot.pc;
        this.cpu.memory = Array.from(snapshot.memory);
        this.cpu.cycles = snapshot.cycles;
        this.cpu.halted = snapshot.halted;

        console.log('📸 CPU state restored from snapshot');
    }
}

/**
 * PixelExecutorFactory - Utility for creating preconfigured executors
 */
class PixelExecutorFactory {
    /**
     * Create a fast executor (optimized for quick execution)
     * @returns {PixelExecutor}
     */
    static createFast() {
        return new PixelExecutor({
            littleEndian: true
        });
    }

    /**
     * Create a debugging executor (with instruction tracing)
     * @returns {PixelExecutor}
     */
    static createDebug() {
        const executor = new PixelExecutor({
            littleEndian: true
        });

        executor.onInstruction = (cpu) => {
            const instr = cpu.memory[cpu.pc] || 0;
            console.log(`[${cpu.pc.toString(16).padStart(8, '0')}] 0x${instr.toString(16).padStart(8, '0')}`);
        };

        return executor;
    }

    /**
     * Create an executor with progress callback
     * @param {Function} progressCallback - Progress callback
     * @returns {PixelExecutor}
     */
    static withProgress(progressCallback) {
        const executor = new PixelExecutor({
            littleEndian: true
        });

        executor.onProgress = progressCallback;

        return executor;
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.PixelExecutor = PixelExecutor;
    window.PixelExecutorFactory = PixelExecutorFactory;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        PixelExecutor,
        PixelExecutorFactory
    };
}
