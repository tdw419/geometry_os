/**
 * Ouroboros Runner
 *
 * Runs the Ouroboros Renderer program and displays it in the Visual Shell.
 * This is the first program that "draws itself into existence."
 */

import { GlyphExecutionPipeline } from './GlyphExecutionPipeline.js';

export class OuroborosRunner {
    constructor(app, options = {}) {
        this.app = app;
        this.options = {
            atlasUrl: options.atlasUrl || '../glyph_stratum/opcode_atlas.webp',
            programUrl: options.programUrl || '../glyph_stratum/ouroboros_renderer.json',
            ...options
        };

        this.device = null;
        this.pipeline = null;
        this.sprite = null;
        this.running = false;
    }

    /**
     * Initialize WebGPU and the execution pipeline.
     */
    async initialize() {
        // Check for WebGPU
        if (!navigator.gpu) {
            throw new Error('WebGPU not supported');
        }

        const adapter = await navigator.gpu.requestAdapter();
        if (!adapter) {
            throw new Error('No GPU adapter found');
        }

        this.device = await adapter.requestDevice();

        // Create pipeline
        this.pipeline = new GlyphExecutionPipeline(this.device);
        await this.pipeline.initialize(this.options.atlasUrl);

        // Create sprite for output
        this.createOutputSprite();

        console.log('[OuroborosRunner] Initialized');
    }

    /**
     * Create a PixiJS sprite to display the output texture.
     */
    createOutputSprite() {
        // For now, use a Graphics object as placeholder
        // Full WebGPU-PixiJS integration requires custom render pipeline
        this.outputGraphics = new PIXI.Graphics();

        // Background
        this.outputGraphics.rect(0, 0, 1024, 768);
        this.outputGraphics.fill(0x0a0a0a);

        this.app.stage.addChild(this.outputGraphics);

        // Status text
        this.statusText = new PIXI.Text({
            text: 'Ouroboros Renderer: Initializing...',
            style: {
                fontFamily: 'monospace',
                fontSize: 14,
                fill: 0x00ffcc
            }
        });
        this.statusText.x = 20;
        this.statusText.y = 20;
        this.app.stage.addChild(this.statusText);
    }

    /**
     * Load and run the Ouroboros Renderer program.
     */
    async run() {
        try {
            // Load program
            const response = await fetch(this.options.programUrl);
            const programData = await response.json();

            this.statusText.text = `Loaded: ${programData.name}`;

            // Load into pipeline
            this.pipeline.loadProgram(programData);

            // Execute
            this.statusText.text = 'Executing glyph program...';
            this.pipeline.run(100);

            // Render result (simulated for now - full WebGPU integration needed)
            this.renderResult(programData);

            this.statusText.text = `Ouroboros complete: ${this.pipeline.state.cycles} cycles`;

            console.log('[OuroborosRunner] Execution complete');
        } catch (error) {
            console.error('[OuroborosRunner] Error:', error);
            this.statusText.text = `Error: ${error.message}`;
        }
    }

    /**
     * Render the execution result.
     * In full implementation, this would sample the output texture.
     * For now, we simulate by drawing the glyph sequence.
     */
    renderResult(programData) {
        const glyphs = programData.glyphs || {};
        let x = 100;
        const y = 400;
        const glyphWidth = 64;
        const glyphHeight = 64;

        // Clear previous
        this.outputGraphics.clear();
        this.outputGraphics.rect(0, 0, 1024, 768);
        this.outputGraphics.fill(0x0a0a0a);

        // Draw title
        this.outputGraphics.rect(50, 50, 924, 60);
        this.outputGraphics.fill(0x1a1a2e);
        this.outputGraphics.stroke({ width: 2, color: 0x00ffcc });

        const titleText = new PIXI.Text({
            text: 'OUROBOROS RENDERER - Glyphs Drawing Glyphs',
            style: {
                fontFamily: 'monospace',
                fontSize: 24,
                fill: 0x00ffcc
            }
        });
        titleText.x = 100;
        titleText.y = 70;
        this.app.stage.addChild(titleText);

        // Draw each DRAW instruction's target glyph
        for (const [indexStr, glyph] of Object.entries(glyphs)) {
            if (glyph.opcode === 215) { // DRAW
                const srcOpcode = glyph.p1;
                const destX = glyph.p2;
                const destY = glyph.target;

                // Draw placeholder box for the glyph
                this.outputGraphics.rect(destX, destY, glyphWidth, glyphHeight);
                this.outputGraphics.fill(this.getOpcodeColor(srcOpcode));
                this.outputGraphics.stroke({ width: 1, color: 0x00ffcc });

                // Label with opcode
                const label = new PIXI.Text({
                    text: `${srcOpcode}`,
                    style: {
                        fontFamily: 'monospace',
                        fontSize: 12,
                        fill: 0xffffff
                    }
                });
                label.x = destX + 8;
                label.y = destY + 24;
                this.app.stage.addChild(label);
            }
        }

        // Draw execution trace
        const traceY = 600;
        this.outputGraphics.rect(50, traceY, 924, 100);
        this.outputGraphics.fill(0x1a1a1a);
        this.outputGraphics.stroke({ width: 1, color: 0x444466 });

        const traceText = new PIXI.Text({
            text: `Execution Trace: ${Object.keys(glyphs).length} glyphs | ${this.pipeline.state.cycles} cycles | PC: ${this.pipeline.state.pc}`,
            style: {
                fontFamily: 'monospace',
                fontSize: 14,
                fill: 0xaaaaaa
            }
        });
        traceText.x = 60;
        traceText.y = traceY + 10;
        this.app.stage.addChild(traceText);

        // Draw program listing
        let listingY = traceY + 35;
        for (const [idx, glyph] of Object.entries(glyphs)) {
            const line = new PIXI.Text({
                text: `[${idx}] Opcode ${glyph.opcode} → ${glyph.rationale}`,
                style: {
                    fontFamily: 'monospace',
                    fontSize: 11,
                    fill: 0x888888
                }
            });
            line.x = 60;
            line.y = listingY;
            this.app.stage.addChild(line);
            listingY += 14;
        }
    }

    /**
     * Get color for an opcode (visual representation).
     */
    getOpcodeColor(opcode) {
        if (opcode >= 200 && opcode <= 203) return 0x4a90d9; // Arithmetic - blue
        if (opcode >= 204 && opcode <= 207) return 0x2a5f2a; // Memory - green
        if (opcode >= 208 && opcode <= 211) return 0xf5a53d; // Control - orange
        if (opcode >= 212 && opcode <= 215) return 0xc7a5f3; // System - purple
        return 0x404040; // Default - gray
    }

    /**
     * Step through execution one instruction at a time.
     */
    step() {
        if (this.pipeline && !this.pipeline.isHalted()) {
            this.pipeline.step();
            this.statusText.text = `Step: PC=${this.pipeline.state.pc} Cycle=${this.pipeline.state.cycles}`;
        }
    }
}

// Export for module loading
if (typeof window !== 'undefined') {
    window.OuroborosRunner = OuroborosRunner;
}
