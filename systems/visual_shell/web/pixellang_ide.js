/**
 * Geometry OS: PixelLang IDE Integration
 *
 * Phase 26: The Morphological Workbench
 *
 * Integrates the Geometric Canvas, Pixel Palette, and GPU Execution System
 * into a unified "Paint Your Program" development environment.
 *
 * @module pixellang_ide
 */

class PixelLangIDE {
    /**
     * Create a new PixelLang IDE
     * @param {PIXI.Application} app - PixiJS application instance
     * @param {Object} options - Configuration options
     */
    constructor(app, options = {}) {
        this.app = app;
        this.options = {
            canvasSize: 2048,
            pixelSize: 16,
            enableGPU: true,
            enablePAS: true,
            liveExecution: true,
            ...options
        };

        // Components
        this.canvas = null;
        this.palette = null;
        this.gpuSystem = null;
        this.pasOracle = null;
        this.transpiler = null;
        this.tokenBrowser = null; // Semantic Token Browser

        // UI containers
        this.ideContainer = null;
        this.statusBar = null;

        // IDE State
        this.isInitialized = false;
        this.executionActive = false;
        this.currentPAS = 1.0;

        console.log('🖥️  PixelLang IDE initialized');
    }

    /**
     * Initialize the IDE
     */
    async initialize() {
        if (this.isInitialized) return;

        console.log('═══════════════════════════════════════════════════════════');
        console.log('     PIXELLANG IDE: THE MORPHOLOGICAL WORKBENCH                  ');
        console.log('═══════════════════════════════════════════════════════════');
        console.log('');
        console.log('  "Software is not text. Software is morphological texture."');
        console.log('  The era of symbolic computation is over.');
        console.log('');
        console.log('═══════════════════════════════════════════════════════════');
        console.log('');

        // Create main IDE container
        this.ideContainer = new PIXI.Container();
        this.app.stage.addChild(this.ideContainer);

        // Initialize WebGPU if enabled
        if (this.options.enableGPU) {
            await this._initializeGPU();
        }

        // Initialize PAS Oracle if enabled
        if (this.options.enablePAS) {
            this._initializePAS();
        }

        // Create and initialize canvas
        this.canvas = new GeometricCanvas(this.app, {
            width: this.options.canvasSize,
            height: this.options.canvasSize,
            pixelSize: this.options.pixelSize,
            gridEnabled: true,
            liveExecution: this.options.liveExecution
        });
        this.ideContainer.addChild(this.canvas.initialize());

        // Attach GPU and PAS to canvas
        if (this.gpuSystem) {
            this.canvas.attachGPUExecution(this.gpuSystem);
        }
        if (this.pasOracle) {
            this.canvas.attachPASOracle(this.pasOracle);
        }

        // Create and initialize palette
        this.palette = new PixelPalette(this.app, this.canvas, {
            x: 20,
            y: this.options.canvasSize + 30
        });
        this.ideContainer.addChild(this.palette.initialize());

        // Initialize Token Browser (Do this before sync)
        this.tokenBrowser = await createTokenBrowser(this.app, this.canvas, {
            x: this.app.screen.width - 340,
            y: 20
        });

        // Initialize Transpiler
        this.transpiler = new GeoScriptTranspiler(this.gpuSystem ? this.gpuSystem.dictionary : null);

        // Add UI buttons to palette
        this._addTokenBrowserButton();
        this._addSelfWriteButton(); // Phase 34.4: EvolutionDaemon Self-Writing
        this._addTransmuteButton(); // Phase 34.2: Transmute Button
        this._addImportButton();
        
        // Phase 34.3: Setup drag-and-drop for .rts.png files
        this._setupDragAndDrop();

        // Sync tokens with GPU dictionary
        await this._syncTokens();

        // Set up keyboard listeners
        this._setupKeyboardListeners();

        // Set up callbacks
        this._setupCallbacks();

        // Create status bar
        this._createStatusBar();

        // Select default brush
        this.palette._selectItem(this.palette.items[0]);

        // Center camera on canvas
        this._centerCamera();

        this.isInitialized = true;

        console.log('✅ PixelLang IDE ready');
        console.log('');
        console.log('🎨 The canvas is your editor.');
        console.log('🖌️  The palette is your syntax.');
        console.log('⚡ The pixels are your program.');
        console.log('');
        console.log('Begin painting. Execute instantly.');
        console.log('');
    }

    /**
     * Initialize WebGPU system
     * @private
     */
    async _initializeGPU() {
        if (!navigator.gpu) {
            console.warn('⚠️  WebGPU not supported. GPU execution disabled.');
            return;
        }

        const adapter = await navigator.gpu.requestAdapter();
        const device = await adapter.requestDevice();

        // Create dictionary (will load from manifest in production)
        const dictionary = new GeometricDictionary({ cacheVRAM: true });

        // Create GPU execution system
        this.gpuSystem = new GPUExecutionSystem(device, dictionary);
        await this.gpuSystem.initialize();

        console.log('⚡ GPU Execution System ready');
    }

    /**
     * Initialize PAS Oracle
     * @private
     */
    _initializePAS() {
        // The PAS Oracle validates structural health as you paint
        // For now, we'll use a simple implementation
        this.pasOracle = {
            analyze: async (textureData) => {
                // Placeholder: In production, this would call TectonicCanary
                return {
                    v_pas_score: this.currentPAS,
                    semantic_coherence: 0.9,
                    spectral_stability: 0.85,
                    texture_entropy: 0.2
                };
            }
        };

        console.log('📊 PAS Oracle ready');
    }

    /**
     * Set up event callbacks
     * @private
     */
    _setupCallbacks() {
        // Canvas change callback
        this.canvas.onCanvasChanged = (pixels) => {
            this._onCanvasChanged(pixels);
        };

        // Pixel painted callback
        this.canvas.onPixelPainted = (x, y, brush) => {
            this._onPixelPainted(x, y, brush);
        };

        // Brush selected callback
        this.palette.onBrushSelected = (brush) => {
            this._onBrushSelected(brush);
        };
    }

    /**
     * Create status bar
     * @private
     */
    _createStatusBar() {
        this.statusBar = new PIXI.Container();
        this.statusBar.y = this.app.screen.height - 30;

        const bg = new PIXI.Graphics();
        bg.beginFill(0x0a0a0a, 0.95);
        bg.drawRect(0, 0, this.app.screen.width, 30);
        bg.endFill();
        this.statusBar.addChild(bg);

        // Status text
        this.statusText = new PIXI.Text('', {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0x00FFFF
        });
        this.statusText.x = 10;
        this.statusText.y = 8;
        this.statusBar.addChild(this.statusText);

        // Initial status
        this._updateStatus('Ready to paint');

        this.ideContainer.addChild(this.statusBar);
    }

    /**
     * Handle canvas changes
     * @private
     */
    async _onCanvasChanged(pixels) {
        // Update PAS score
        if (this.pasOracle) {
            const textureData = this.canvas._generateTextureData();
            const result = await this.pasOracle.analyze(textureData);
            this.currentPAS = result.v_pas_score;
            this.palette.updatePAS(this.currentPAS);
        }

        // Trigger live execution
        if (this.options.liveExecution && this.gpuSystem) {
            await this._executeLive();
        }
    }

    /**
     * Handle pixel painted
     * @private
     */
    _onPixelPainted(x, y, brush) {
        this._updateStatus(`Painted (${x}, ${y}): ${brush.operation}`);
    }

    /**
     * Handle brush selected
     * @private
     */
    _onBrushSelected(brush) {
        this._updateStatus(`Brush: ${brush.operation} [${brush.category}]`);
    }

    /**
     * Execute painted code on GPU
     * @private
     */
    async _executeLive() {
        if (!this.gpuSystem) return;

        // Export canvas as texture
        const textureURL = this.canvas.exportTexture();

        // Deploy to GPU
        try {
            await this.gpuSystem.deploy(textureURL, 'live_kernel');

            // Run a few cycles
            await this.gpuSystem.tick('live_kernel', 10);

            // Read back state (for debugging/visualization)
            const state = await this.gpuSystem.readState('live_kernel');

            if (state) {
                this._updateExecutionStatus(state);
            }
        } catch (error) {
            console.warn('Live execution failed:', error);
        }
    }

    /**
     * Update execution status display
     * @private
     */
    _updateExecutionStatus(state) {
        if (!state || !state.registers) return;

        const x1 = state.registers[1];
        const x2 = state.registers[2];
        const pc = state.pc;

        const execText = `PC: ${pc} | x1: ${x1} | x2: ${x2}`;

        // Append to status bar
        const fullStatus = this.statusText.text;
        const parts = fullStatus.split(' | ');
        if (parts.length > 2) {
            parts[2] = `EXEC: ${execText}`;
        } else {
            parts.push(`EXEC: ${execText}`);
        }

        this.statusText.text = parts.join(' | ');
    }

    /**
     * Update status bar
     * @private
     */
    _updateStatus(message) {
        if (!this.statusText) return;

        const parts = this.statusText.text.split(' | ').filter(p => !p.startsWith('EXEC:'));
        parts[0] = message;

        this.statusText.text = parts.join(' | ');
    }

    /**
     * Center camera on canvas
     * @private
     */
    _centerCamera() {
        this.app.stage.x = (this.app.screen.width - this.options.canvasSize) / 2;
        this.app.stage.y = (this.app.screen.height - this.options.canvasSize) / 2;
    }

    /**
     * Export the current program as a .rts.png file
     * @returns {string} Data URL
     */
    exportProgram() {
        return this.canvas.exportTexture();
    }

    /**
     * Get IDE statistics
     * @returns {Object} IDE statistics
     */
    getStats() {
        return {
            ...this.canvas.getStats(),
            gpuEnabled: !!this.gpuSystem,
            pasEnabled: !!this.pasOracle,
            liveExecution: this.options.liveExecution
        };
    }

    /**
     * Clear the canvas
     */
    clear() {
        this.canvas.clear();
        this._updateStatus('Canvas cleared');
    }

    /**
     * Enable/disable live execution
     * @param {boolean} enabled
     */
    setLiveExecution(enabled) {
        this.options.liveExecution = enabled;
        this.canvas.setLiveExecution(enabled);
        this._updateStatus(`Live execution: ${enabled ? 'ON' : 'OFF'}`);
    }

    /**
     * Internal method to add an import button to the palette
     * @private
     */
    _addImportButton() {
        if (!this.palette) return;

        const btn = new PIXI.Container();
        btn.x = 10;
        btn.y = this.palette._calculateHeight() - 35;

        const bg = new PIXI.Graphics();
        bg.beginFill(0x00FFFF, 0.3);
        bg.drawRoundedRect(0, 0, this.palette.options.width - 20, 25, 4);
        bg.endFill();
        btn.addChild(bg);

        const label = new PIXI.Text('IMPORT GEOSCRIPT', {
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: 0x00FFFF,
            fontWeight: 'bold'
        });
        label.x = (bg.width - label.width) / 2;
        label.y = 5;
        btn.addChild(label);

        btn.eventMode = 'static';
        btn.cursor = 'pointer';
        btn.on('pointerdown', () => this._showImportDialog());
        this.palette.container.addChild(btn);
    }

    async _showImportDialog() {
        const code = prompt("Paste GeoScript here:", "assign(0, 0, x1)\npaint(0, 0, CRIMSON)\npaint(1, 0, AZURE)\npaint(2, 0, LIME_GREEN)");
        if (code) {
            const result = this.transpiler.transpile(code);
            this.canvas.clear();
            for (const [key, p] of result.pixels) {
                // We need a brute-force way to set pixels in the canvas
                // because _paintPixel is private and handles currentBrush
                const brush = this.palette.items.find(i => i.brush.color === p.color)?.brush || {
                    color: p.color,
                    category: 'transpiled',
                    operation: 'IMPORTED'
                };

                const oldBrush = { ...this.canvas.currentBrush };
                this.canvas.setBrush(brush);
                this.canvas._paintPixel(p.x, p.y);
                this.canvas.setBrush(oldBrush);
            }
            this._updateStatus('GeoScript Imported');
        }
    }

    /**
     * Add the Transmute button to the palette
     * @private
     */
    _addTransmuteButton() {
        if (!this.palette) return;

        const btn = new PIXI.Container();
        btn.x = 10;
        // Position above the Token Browser button (-65)
        btn.y = this.palette._calculateHeight() - 95;

        const bg = new PIXI.Graphics();
        bg.beginFill(0xFFA500, 0.4); // Orange for Transmutation
        bg.drawRoundedRect(0, 0, this.palette.options.width - 20, 25, 4);
        bg.endFill();
        btn.addChild(bg);

        const label = new PIXI.Text('TRANSMUTE', {
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: 0xFFD700,
            fontWeight: 'bold'
        });
        label.x = (bg.width - label.width) / 2;
        label.y = 5;
        btn.addChild(label);

        btn.eventMode = 'static';
        btn.cursor = 'pointer';
        btn.on('pointerdown', () => this._showTransmuteDialog());
        this.palette.container.addChild(btn);
    }

    async _showTransmuteDialog() {
        const language = prompt("Language (python, js, c):", "python");
        if (!language) return;

        const code = prompt("Paste Code to Transmute:", "print('Hello Geometric World')");
        if (!code) return;

        this._updateStatus('Transmuting...');

        try {
            const response = await fetch('http://localhost:8080/api/transmute', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ code, language })
            });

            const result = await response.json();

            if (result.success) {
                this._updateStatus('SUCCESS: Artifact Loaded to GPU');
                console.log("Artifact Path:", result.artifact_path);
            } else {
                this._updateStatus('FAILED: See Console');
                console.error(result.message);
                alert("Transmutation Failed:\n" + result.message);
            }
        } catch (e) {
            this._updateStatus('Network Error');
            console.error(e);
        }
    }

    /**
     * Add the Self-Write button to the palette (Phase 34.4)
     * @private
     */
    _addSelfWriteButton() {
        if (!this.palette) return;

        const btn = new PIXI.Container();
        btn.x = 10;
        // Position above the Transmute button
        btn.y = this.palette._calculateHeight() - 125;

        const bg = new PIXI.Graphics();
        bg.beginFill(0x9400D3, 0.4); // Dark Violet for Self-Writing
        bg.drawRoundedRect(0, 0, this.palette.options.width - 20, 25, 4);
        bg.endFill();
        btn.addChild(bg);

        const label = new PIXI.Text('SELF-WRITE', {
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: 0xDA70D6,
            fontWeight: 'bold'
        });
        label.x = (bg.width - label.width) / 2;
        label.y = 5;
        btn.addChild(label);

        btn.eventMode = 'static';
        btn.cursor = 'pointer';
        btn.on('pointerdown', () => this._showSelfWriteDialog());
        this.palette.container.addChild(btn);
    }

    async _showSelfWriteDialog() {
        const language = prompt("Target Language (python, js, c):", "python");
        if (!language) return;

        const intent = prompt("Describe what code to generate:", "Create a function that calculates fibonacci numbers");
        if (!intent) return;

        this._updateStatus('EvolutionDaemon self-writing...');

        try {
            const response = await fetch('http://localhost:8080/api/self-write', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ intent, language })
            });

            const result = await response.json();

            if (result.success) {
                this._updateStatus('SUCCESS: Self-writing complete');
                console.log("Generated Code:", result.generated_code);
                if (result.artifact_path) {
                    console.log("Artifact:", result.artifact_path);
                }
                // Show generated code
                alert(`Self-writing complete!\\n\\nGenerated code:\\n${result.generated_code?.substring(0, 200)}...`);
            } else {
                this._updateStatus('FAILED: See Console');
                console.error(result.message);
                alert("Self-writing Failed:\\n" + result.message);
            }
        } catch (e) {
            this._updateStatus('Network Error');
            console.error(e);
        }
    }

    /**
     * Add the Token Browser button to the palette
     * @private
     */
    _addTokenBrowserButton() {
        if (!this.palette) return;

        const btn = new PIXI.Container();
        btn.x = 10;
        // Position above the Import button
        btn.y = this.palette._calculateHeight() - 65;

        const bg = new PIXI.Graphics();
        bg.beginFill(0x8B008B, 0.4); // Deep Purple/Magenta for tokens
        bg.drawRoundedRect(0, 0, this.palette.options.width - 20, 25, 4);
        bg.endFill();
        btn.addChild(bg);

        const label = new PIXI.Text('SEMANTIC TOKENS', {
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: 0xFF00FF,
            fontWeight: 'bold'
        });
        label.x = (bg.width - label.width) / 2;
        label.y = 5;
        btn.addChild(label);

        btn.eventMode = 'static';
        btn.cursor = 'pointer';
        btn.on('pointerdown', () => {
            if (this.tokenBrowser) this.tokenBrowser.toggle();
        });

        this.palette.container.addChild(btn);
    }

    /**
     * Synchronize tokens from the library with the GPU dictionary
     * @private
     */
    async _syncTokens() {
        if (!this.gpuSystem || !this.tokenBrowser) return;

        const library = this.tokenBrowser.library;
        const dictionary = this.gpuSystem.dictionary;

        console.log('🔄 Syncing semantic tokens with GPU dictionary...');
        const codebook = library.exportToCodebook();

        let count = 0;
        for (const token of codebook.tokens) {
            // Register in the GPU-native dictionary if not present
            if (!dictionary.getToken(token.token_id)) {
                dictionary.registerToken(token);
                count++;
            }
        }

        if (count > 0) {
            console.log(`✅ Synced ${count} new tokens to GPU dictionary`);
        }
    }

    /**
     * Set up keyboard listeners for IDE shortcuts
     * @private
     */
    _setupKeyboardListeners() {
        window.addEventListener('keydown', (e) => {
            // Toggle Token Browser with 'B'
            if (e.key.toLowerCase() === 'b' && !e.ctrlKey && !e.metaKey && !e.altKey) {
                // Ignore if user is typing in an input
                if (document.activeElement.tagName === 'INPUT' || document.activeElement.tagName === 'TEXTAREA') {
                    return;
                }

                if (this.tokenBrowser) {
                    this.tokenBrowser.toggle();
                }
            }
        });
    }

    /**
     * Phase 34.3: Setup drag-and-drop for .rts.png files
     * @private
     */
    _setupDragAndDrop() {
        // Prevent default drag behaviors
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            document.body.addEventListener(eventName, (e) => {
                e.preventDefault();
                e.stopPropagation();
            }, false);
        });

        // Highlight drop area on drag enter
        document.body.addEventListener('dragenter', () => {
            this._updateStatus('Drop .rts.png file to execute');
        });

        // Handle file drop
        document.body.addEventListener('drop', async (e) => {
            const files = e.dataTransfer.files;
            if (files.length === 0) return;

            const file = files[0];
            
            // Check if it's an .rts.png or .rts file
            if (file.name.endsWith('.rts.png') || file.name.endsWith('.rts')) {
                this._updateStatus(`Loading ${file.name}...`);
                
                // For browser security, we can't get the full path
                // Show dialog to enter the full file path
                const filePath = prompt(
                    `Enter full path to ${file.name}:\n(Example: /home/user/project/${file.name})`,
                    `${file.name}`
                );
                
                if (filePath) {
                    this._loadFileByPath(filePath);
                }
            } else {
                this._updateStatus('Only .rts.png files supported');
            }
        });
    }

    /**
     * Load a file by path via API (Phase 34.3)
     * @private
     */
    async _loadFileByPath(filePath) {
        this._updateStatus('Loading: ' + filePath);
        
        try {
            const response = await fetch('http://localhost:8080/api/load-file', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ file_path: filePath })
            });

            const result = await response.json();

            if (result.success) {
                this._updateStatus('EXECUTING: ' + filePath.split('/').pop());
                console.log("Loaded artifact:", result.loaded_path);
            } else {
                this._updateStatus('FAILED: ' + result.message);
                console.error(result.message);
            }
        } catch (e) {
            this._updateStatus('Network Error');
            console.error(e);
        }
    }
}

/**
 * Factory function to create and initialize the IDE
 */
async function createPixelLangIDE(app, options = {}) {
    const ide = new PixelLangIDE(app, options);
    await ide.initialize();
    return ide;
}

// Export for browser
if (typeof window !== 'undefined') {
    window.PixelLangIDE = PixelLangIDE;
    window.createPixelLangIDE = createPixelLangIDE;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        PixelLangIDE,
        createPixelLangIDE
    };
}

/**
 * Auto-initialize when page loads
 */
if (typeof window !== 'undefined') {
    window.addEventListener('load', async () => {
        // Check if we should auto-initialize
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('ide') === 'pixellang') {
            // Wait for GeometryOSApplication to be ready
            window.addEventListener('geometry-os-ready', async () => {
                if (window.geometryOSApp) {
                    const ide = await createPixelLangIDE(window.geometryOSApp.app);
                    window.pixelLangIDE = ide;
                    console.log('✅ PixelLang IDE auto-loaded');
                }
            });
        }
    });
}
