/**
 * Geometry OS: Font Execution Terminal
 *
 * A terminal class that encapsulates UI state, PixiJS setup, and execution logic
 * for the geometric font execution system.
 *
 * Architecture:
 * [Keyboard] → [GeometryFont.compile()] → [GPU Texture] → [FontExecutionSystem] → [State/Output]
 */

import { GeometryFont } from './GeometryFont.js';
import { FontExecutionSystem } from './FontExecutionSystem.js';

export class FontExecutionTerminal {
    constructor(options = {}) {
        this.options = {
            historyElement: options.historyElement || null,
            inputElement: options.inputElement || null,
            glyphCanvasContainer: options.glyphCanvasContainer || null,
            programTextureSize: options.programTextureSize || 128,
            containerWidth: options.containerWidth || 300,
        };

        // PixiJS applications
        this.app = null;
        this.glyphApp = null;

        // Core systems
        this.font = null;
        this.gpu = null;

        // UI state
        this.currentGlyphText = '';
        this.glyphDisplayContainer = null;
        this.containerWidth = this.options.containerWidth;
        this.containerHeight = 500;

        // DOM elements (set during init)
        this.historyEl = null;
        this.inputEl = null;
    }

    /**
     * Initialize the terminal system
     */
    async init() {
        console.log('[FontExecutionTerminal] Initializing...');

        // Get DOM elements
        this.historyEl = this.options.historyElement || document.getElementById('history');
        this.inputEl = this.options.inputElement || document.getElementById('command-input');

        const glyphContainer = this.options.glyphCanvasContainer || document.getElementById('glyph-canvas');
        this.containerHeight = glyphContainer?.offsetHeight || 500;

        // Initialize PixiJS for GPU access (invisible)
        this.app = new PIXI.Application();
        await this.app.init({
            width: 1,
            height: 1,
            backgroundColor: 0x000000
        });

        // Load geometry font
        this.font = new GeometryFont(this.app);
        await this.font.load();

        // Initialize GPU execution system
        const device = this.app.renderer.gpu.device;
        this.gpu = new FontExecutionSystem(device);
        await this.gpu.initialize();

        // Initialize glyph visualization canvas
        await this._initGlyphCanvas(glyphContainer);

        // Bind event handlers
        this._bindEvents();

        console.log('[FontExecutionTerminal] Ready');
        return this;
    }

    /**
     * Initialize the glyph visualization canvas
     */
    async _initGlyphCanvas(container) {
        this.glyphApp = new PIXI.Application();
        await this.glyphApp.init({
            width: this.containerWidth,
            height: this.containerHeight,
            backgroundColor: 0x050505,
            antialias: true,
            resolution: window.devicePixelRatio || 1,
            autoDensity: true
        });
        container.appendChild(this.glyphApp.canvas);

        this.glyphDisplayContainer = new PIXI.Container();
        this.glyphDisplayContainer.x = 20;
        this.glyphDisplayContainer.y = 20;
        this.glyphApp.stage.addChild(this.glyphDisplayContainer);
    }

    /**
     * Bind input event handlers
     */
    _bindEvents() {
        // Real-time glyph visualization as user types
        this.inputEl.addEventListener('input', (e) => {
            this.currentGlyphText = this.inputEl.value;
            this._updateGlyphDisplay(this.currentGlyphText);
        });

        // Command execution on Enter
        this.inputEl.addEventListener('keydown', async (e) => {
            if (e.key === 'Enter') {
                await this._executeCommand(this.inputEl.value);
                this.inputEl.value = '';
            }
        });
    }

    /**
     * Update the glyph visualization display
     */
    _updateGlyphDisplay(text) {
        this.glyphDisplayContainer.removeChildren();
        if (!text) return;

        const glyphText = this.font.createText(text, {
            spacing: 2,
            scale: 2,
            tint: 0x00FF00
        });
        this.glyphDisplayContainer.addChild(glyphText);

        // Word wrap logic
        const maxWidth = this.containerWidth - 40;
        let currentX = 0;
        let currentY = 0;
        const lineHeight = this.font.glyphSize * 2 + 8;

        glyphText.children.forEach(sprite => {
            if (currentX + sprite.width > maxWidth) {
                currentX = 0;
                currentY += lineHeight;
            }
            sprite.x = currentX;
            sprite.y = currentY;
            currentX += sprite.width + 4;
        });
    }

    /**
     * Clear the glyph display
     */
    _clearGlyphDisplay() {
        this.currentGlyphText = '';
        this.glyphDisplayContainer.removeChildren();
    }

    /**
     * Log a message to the terminal history
     */
    log(msg, type = 'info') {
        const div = document.createElement('div');
        div.textContent = msg;
        if (type === 'command') div.style.color = '#fff';
        if (type === 'error') div.style.color = '#f00';
        this.historyEl.appendChild(div);
        this.historyEl.scrollTop = this.historyEl.scrollHeight;
    }

    /**
     * Update the state panel display
     */
    updateStatePanel(state, output) {
        const statePc = document.getElementById('state-pc');
        const stateAcc = document.getElementById('state-acc');
        const stateCycle = document.getElementById('state-cycle');
        const haltedIndicator = document.getElementById('halted-indicator');
        const outputList = document.getElementById('output-list');

        if (statePc) statePc.textContent = state.pc;
        if (stateAcc) stateAcc.textContent = state.accumulator;
        if (stateCycle) stateCycle.textContent = state.cycle || 0;

        if (haltedIndicator) {
            if (state.halted) {
                haltedIndicator.textContent = 'HALTED';
                haltedIndicator.className = 'halted';
            } else {
                haltedIndicator.textContent = 'RUNNING';
                haltedIndicator.className = 'running';
            }
        }

        if (outputList) {
            outputList.innerHTML = '';
            if (output && output.length > 0) {
                output.forEach(val => {
                    const item = document.createElement('div');
                    item.className = 'output-item';
                    item.textContent = val;
                    outputList.appendChild(item);
                });
            }
        }
    }

    /**
     * Reset the state panel for new execution
     */
    resetStatePanel() {
        const elements = ['state-pc', 'state-acc', 'state-cycle'];
        elements.forEach(id => {
            const el = document.getElementById(id);
            if (el) el.textContent = '0';
        });

        const haltedIndicator = document.getElementById('halted-indicator');
        if (haltedIndicator) {
            haltedIndicator.textContent = 'RUNNING';
            haltedIndicator.className = 'running';
        }
    }

    /**
     * Execute a command
     */
    async _executeCommand(cmd) {
        this.log(`$ ${cmd}`, 'command');
        this._clearGlyphDisplay();

        if (cmd.trim() === '') return;

        try {
            // 1. Compile Command to Morphological Sequence
            const program = this.font.compile(cmd + '\n#'); // Auto-append halt

            // 2. Prepare Texture
            const size = this.options.programTextureSize;
            const data = new Uint32Array(size * size * 4);
            program.forEach((inst, i) => {
                const idx = i * 4;
                data[idx] = 255;
                data[idx + 1] = inst.opcode;
                data[idx + 2] = inst.operand;
                data[idx + 3] = inst.executable ? 255 : 0;
            });

            const device = this.app.renderer.gpu.device;
            const programTexture = device.createTexture({
                size: [size, size],
                format: 'rgba8uint',
                usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.COPY_DST
            });

            device.queue.writeTexture(
                { texture: programTexture },
                data,
                { bytesPerRow: size * 4 * 4 },
                { width: size, height: size }
            );

            this.gpu.setProgramTexture(programTexture);

            // 3. Reset GPU State
            device.queue.writeBuffer(this.gpu.stateBuffer, 0, new Int32Array([0, 0, 0, 0]));

            // 4. Run on GPU
            await this.gpu.run();

            // 5. Read back result
            await new Promise(resolve => setTimeout(resolve, 10));

            const state = await this.gpu.readState();
            const output = await this.gpu.readOutput(10);

            // Update state panel
            this.updateStatePanel(state, state.outputPtr > 0 ? output : []);

            // Display results
            if (state.outputPtr > 0) {
                const outputValues = Array.from(output.slice(0, state.outputPtr));
                outputValues.forEach(val => {
                    this.log(`OUT: ${val}`);
                });
            } else {
                this.log(`ACC: ${state.accumulator}`);
            }
        } catch (error) {
            this.log(`Error: ${error.message}`, 'error');
            console.error('[FontExecutionTerminal] Execution error:', error);
        }
    }

    /**
     * Focus the input field
     */
    focus() {
        if (this.inputEl) {
            this.inputEl.focus();
        }
    }

    /**
     * Clean up resources
     */
    destroy() {
        if (this.glyphApp) {
            this.glyphApp.destroy(true);
            this.glyphApp = null;
        }
        if (this.app) {
            this.app.destroy(true);
            this.app = null;
        }
        this.font = null;
        this.gpu = null;
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.FontExecutionTerminal = FontExecutionTerminal;
}
