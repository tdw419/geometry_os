/**
 * Geometry OS: Linux GPU Loader (Phase 29.1)
 *
 * "The Penguin Tile" - Boot Linux directly on GPU
 *
 * This module upgrades LinuxKernelLoader to use GPUExecutionSystem
 * for true holographic Linux execution. The entire kernel is treated
 * as a "Super-Token" that expands into millions of RISC-V instructions.
 *
 * @module linux_gpu_loader
 */

class LinuxGPULoader {
    /**
     * Create a new LinuxGPULoader
     * @param {GPUExecutionSystem} gpuSystem - GPU execution system
     * @param {InfiniteMap} infiniteMap - Infinite map instance
     * @param {Object} options - Configuration
     */
    constructor(gpuSystem, infiniteMap, options = {}) {
        this.gpuSystem = gpuSystem;
        this.map = infiniteMap;
        this.options = {
            kernelPath: '/rts_files/alpine_visual.rts.png',
            tileSize: 2048,
            ttyRows: 25,
            ttyCols: 80,
            enableFramebuffer: true,
            ...options
        };

        // State
        this.isLoaded = false;
        this.isBooted = false;
        this.kernelTile = null;
        this.ttyTexture = null;
        this.framebufferTexture = null;

        // Performance stats
        this.stats = {
            loadTime: 0,
            bootTime: 0,
            gpuCycles: 0,
            syscalls: 0
        };

        console.log('🐧 LinuxGPULoader initialized');
        console.log('   "The Penguin Tile" - GPU-accelerated Linux boot');
    }

    /**
     * Load the Linux kernel as a holographic tile
     */
    async loadKernel(tileX = 0, tileY = 0) {
        if (this.isLoaded) {
            console.log('⚠️  Kernel already loaded');
            return;
        }

        console.log('');
        console.log('═══════════════════════════════════════════════════════════');
        console.log('     PHASE 29.1: THE PENGUIN TILE                                 ');
        console.log('═══════════════════════════════════════════════════════════');
        console.log('');

        const startTime = Date.now();

        try {
            // Load kernel texture
            const textureUrl = this.options.kernelPath;
            console.log(`📂 Loading kernel: ${textureUrl}`);

            const texture = await PIXI.Assets.load(textureUrl);
            console.log(`✅ Kernel loaded: ${texture.width}×${texture.height}px`);

            // Calculate instruction count
            const totalPixels = texture.width * texture.height;
            const instructionCount = totalPixels; // 1 pixel = 1 instruction (or more with semantic expansion)
            console.log(`📊 Instruction capacity: ${instructionCount.toLocaleString()} instructions`);

            // Create kernel tile container
            const container = this._createKernelTile(texture, tileX, tileY);
            this.map.world.addChild(container);

            // Register kernel as Super-Token with GeometricDictionary
            await this._registerSuperToken(texture);

            // Store reference
            this.kernelTile = {
                x: tileX,
                y: tileY,
                container: container,
                texture: texture,
                instructionCount: instructionCount
            };

            this.isLoaded = true;
            this.stats.loadTime = Date.now() - startTime;

            console.log('');
            console.log('✅ Penguin Tile deployed');
            console.log(`   Load time: ${this.stats.loadTime}ms`);
            console.log(`   Position: (${tileX}, ${tileY})`);
            console.log('   Click the tile to boot Linux on GPU');
            console.log('');

        } catch (error) {
            console.error('❌ Failed to load kernel:', error);
            throw error;
        }
    }

    /**
     * Create the kernel tile UI
     * @private
     */
    _createKernelTile(texture, tileX, tileY) {
        const container = new PIXI.Container();
        const gridSize = this.map.config.gridSize || 512;
        container.x = tileX * gridSize;
        container.y = tileY * gridSize;

        // Background glow
        const glow = new PIXI.Graphics();
        glow.beginFill(0x00FF00, 0.1);
        glow.drawCircle(gridSize / 2, gridSize / 2, gridSize / 2);
        glow.endFill();
        container.addChild(glow);

        // Kernel sprite
        const sprite = new PIXI.Sprite(texture);
        const scale = (gridSize - 40) / Math.max(texture.width, texture.height);
        sprite.scale.set(scale);
        sprite.x = 20;
        sprite.y = 20;
        sprite.alpha = 0.8;
        container.addChild(sprite);

        // Border
        const border = new PIXI.Graphics();
        border.lineStyle(3, 0x00FF00, 0.6);
        border.drawRoundedRect(17, 17, gridSize - 34, gridSize - 34, 8);
        container.addChild(border);

        // Label
        const label = new PIXI.Text('🐧 ALPINE LINUX\n(GPU Boot)', {
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0x00FF00,
            fontWeight: 'bold',
            align: 'center'
        });
        label.x = gridSize - 130;
        label.y = 25;
        container.addChild(label);

        // Status indicator
        const status = new PIXI.Text('STATUS: READY', {
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: 0x00FF00
        });
        status.x = gridSize - 130;
        status.y = 55;
        container.addChild(status);
        container.statusLabel = status;

        // Make interactive
        container.eventMode = 'static';
        container.cursor = 'pointer';
        container.on('pointerdown', () => this.bootOnGPU());

        return container;
    }

    /**
     * Register kernel as a Super-Token with GeometricDictionary
     * @private
     */
    async _registerSuperToken(texture) {
        console.log('📝 Registering kernel as Super-Token...');

        // Create a special token ID for Linux (0xF00000 = Linux Super-Token)
        const LINUX_SUPER_TOKEN = 0xF00000;

        // Extract kernel instructions from texture
        const instructions = await this._extractKernelInstructions(texture);

        // Register with GPU system's dictionary
        if (this.gpuSystem.dictionary) {
            const superToken = new SemanticToken({
                token_id: LINUX_SUPER_TOKEN,
                name: 'LINUX_KERNEL',
                category: 'system',
                complexity: 1.0,
                stability: 0.95,
                code_bytes: Array.from(instructions).map(i => i.toString(16).padStart(2, '0')).join('')
            });

            this.gpuSystem.dictionary.tokens.set(LINUX_SUPER_TOKEN, superToken);
            console.log(`✅ Registered as token 0x${LINUX_SUPER_TOKEN.toString(16).toUpperCase()}`);
        }
    }

    /**
     * Extract RISC-V instructions from kernel texture
     * @private
     */
    async _extractKernelInstructions(texture) {
        const canvas = document.createElement('canvas');
        canvas.width = texture.width;
        canvas.height = texture.height;
        const ctx = canvas.getContext('2d');

        ctx.drawImage(texture.source.resource, 0, 0);
        const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
        const pixels = imageData.data;

        const instructions = new Uint32Array((pixels.length / 4));

        for (let i = 0; i < pixels.length; i += 4) {
            // RGBA to 32-bit instruction
            const inst = pixels[i] | (pixels[i + 1] << 8) | (pixels[i + 2] << 16) | (pixels[i + 3] << 24);
            instructions[i / 4] = inst;
        }

        return instructions;
    }

    /**
     * Boot Linux directly on GPU
     */
    async bootOnGPU() {
        if (this.isBooted) {
            console.log('⚠️  Linux already running');
            return;
        }

        if (!this.isLoaded) {
            console.error('❌ Kernel not loaded');
            return;
        }

        console.log('');
        console.log('🚀 BOOTING LINUX ON GPU...');
        console.log('');

        const startTime = Date.now();

        try {
            // Update UI
            if (this.kernelTile.container.statusLabel) {
                this.kernelTile.container.statusLabel.text = 'STATUS: BOOTING...';
                this.kernelTile.container.statusLabel.style.fill = 0xFFFF00;
            }

            // Deploy kernel to GPU
            console.log('📦 Deploying kernel to GPU memory...');
            await this.gpuSystem.deploy(
                this.options.kernelPath,
                'linux_kernel',
                {
                    entryPoint: 0,
                    memorySize: this.kernelTile.instructionCount * 4
                }
            );

            console.log('✅ Kernel deployed to GPU');

            // Create TTY texture for console output
            this.ttyTexture = this._createTTYTexture();
            this.map.world.addChild(this.ttyTexture);

            // Set up syscall handlers
            this._setupSyscallHandlers();

            // Start GPU execution loop
            this.isBooted = true;
            await this._startGPUExecution();

            // Update stats
            this.stats.bootTime = Date.now() - startTime;

            console.log('');
            console.log('✅ LINUX BOOTED ON GPU');
            console.log(`   Boot time: ${this.stats.bootTime}ms`);
            console.log('   TTY ready at (300, 0)');
            console.log('');

            // Update UI
            if (this.kernelTile.container.statusLabel) {
                this.kernelTile.container.statusLabel.text = 'STATUS: RUNNING';
                this.kernelTile.container.statusLabel.style.fill = 0x00FF00;
            }

        } catch (error) {
            console.error('❌ GPU boot failed:', error);

            if (this.kernelTile.container.statusLabel) {
                this.kernelTile.container.statusLabel.text = 'STATUS: ERROR';
                this.kernelTile.container.statusLabel.style.fill = 0xFF0000;
            }

            throw error;
        }
    }

    /**
     * Create TTY texture for console output
     * @private
     */
    _createTTYTexture() {
        const container = new PIXI.Container();
        container.x = 300;
        container.y = 0;

        // TTY background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.95);
        bg.lineStyle(2, 0x00FF00, 0.5);
        bg.drawRoundedRect(0, 0, 640, 400, 8);
        bg.endFill();
        container.addChild(bg);

        // Title bar
        const titleBar = new PIXI.Graphics();
        titleBar.beginFill(0x001100, 1);
        titleBar.drawRect(0, 0, 640, 25);
        titleBar.endFill();
        container.addChild(titleBar);

        // Title
        const title = new PIXI.Text('🐧 Alpine Linux TTY (GPU)', {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0x00FF00,
            fontWeight: 'bold'
        });
        title.x = 10;
        title.y = 5;
        container.addChild(title);

        // Console text container
        const consoleText = new PIXI.Text('', {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0x00FF00,
            align: 'left'
        });
        consoleText.x = 15;
        consoleText.y = 35;
        container.addChild(consoleText);
        container.consoleText = consoleText;

        // Make draggable
        container.eventMode = 'static';
        container.cursor = 'move';
        container.on('pointerdown', (e) => {
            container.offsetX = e.globalX - container.x;
            container.offsetY = e.globalY - container.y;
            container.dragging = true;
        });
        container.on('pointermove', (e) => {
            if (container.dragging) {
                container.x = e.globalX - container.offsetX;
                container.y = e.globalY - container.offsetY;
            }
        });
        container.on('pointerup', () => {
            container.dragging = false;
        });
        container.on('pointerupoutside', () => {
            container.dragging = false;
        });

        return container;
    }

    /**
     * Set up Linux syscall handlers
     * @private
     */
    _setupSyscallHandlers() {
        // Override GPU system's syscall handling
        this.originalHandleSyscall = this.gpuSystem.handleSyscall;

        this.gpuSystem.handleSyscall = async (syscallNum, args) => {
            this.stats.syscalls++;

            switch (syscallNum) {
                case 64: // sys_write
                    const fd = args[0];
                    const buf = args[1];
                    const count = args[2];

                    if (fd === 1 || fd === 2) { // stdout or stderr
                        await this._writeToTTY(buf, count);
                    }
                    break;

                case 93: // sys_exit
                    console.log(`🐧 Process exited with code ${args[0]}`);
                    this.isBooted = false;
                    break;

                case 80: // sys_fcntl
                case 57: // sys_close
                    // File operations - would need filesystem implementation
                    break;

                default:
                    console.log(`🐧 Syscall ${syscallNum}: ${args.join(', ')}`);
            }
        };
    }

    /**
     * Write to TTY console
     * @private
     */
    async _writeToTTY(address, count) {
        if (!this.ttyTexture || !this.ttyTexture.consoleText) return;

        // Read actual memory content from GPU
        const buffer = await this.gpuSystem.readMemory('linux_kernel', address, count);
        if (!buffer) return;

        // Decode UTF-8
        const decoder = new TextDecoder();
        const text = decoder.decode(buffer);

        // Update TTY
        this.ttyTexture.consoleText.text += text;

        // Auto-scroll
        if (this.ttyTexture.consoleText.height > 350) {
            const lines = this.ttyTexture.consoleText.text.split('\n');
            this.ttyTexture.consoleText.text = lines.slice(-25).join('\n');
        }
    }

    /**
     * Start GPU execution loop
     * @private
     */
    async _startGPUExecution() {
        const executeFrame = async () => {
            if (!this.isBooted) return;

            // Execute a batch of cycles on GPU
            const cyclesPerFrame = 1000;
            try {
                const state = await this.gpuSystem.tick('linux_kernel', cyclesPerFrame);

                if (state && state.halted) {
                    console.log('🐧 Kernel halted');
                    this.isBooted = false;
                    return;
                }

                this.stats.gpuCycles += cyclesPerFrame;

            } catch (error) {
                console.error('GPU execution error:', error);
            }

            // Schedule next frame
            requestAnimationFrame(() => executeFrame());
        };

        requestAnimationFrame(() => executeFrame());
    }

    /**
     * Stop kernel execution
     */
    stop() {
        this.isBooted = false;
        console.log('🛑 Linux execution stopped');

        if (this.kernelTile.container.statusLabel) {
            this.kernelTile.container.statusLabel.text = 'STATUS: STOPPED';
            this.kernelTile.container.statusLabel.style.fill = 0xFFAA00;
        }
    }

    /**
     * Get execution statistics
     */
    getStats() {
        return {
            ...this.stats,
            isLoaded: this.isLoaded,
            isBooted: this.isBooted,
            instructionCount: this.kernelTile?.instructionCount || 0
        };
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.LinuxGPULoader = LinuxGPULoader;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LinuxGPULoader };
}

/**
 * Usage Example:
 *
 * const loader = new LinuxGPULoader(gpuSystem, infiniteMap, {
 *     kernelPath: '/rts_files/alpine_visual.rts.png'
 * });
 *
 * await loader.loadKernel(0, 0);  // Load at tile (0, 0)
 * await loader.bootOnGPU();        // Boot Linux on GPU
 *
 * // TTY console appears at (300, 0)
 * // Linux executes directly on GPU
 */
