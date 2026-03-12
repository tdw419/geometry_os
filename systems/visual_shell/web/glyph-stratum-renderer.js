/**
 * GlyphStratum Visual Shell Renderer
 *
 * Renders GlyphStratum programs on the Geometry OS visual shell.
 * Provides interactive visualization of glyphs as clickable elements.
 */
class GlyphStratumRenderer {
    constructor(app, container) {
        this.app = app;
        this.container = container;
        this.glyphs = new Map();
        this.connections = [];
        this.selectedGlyph = null;
        this.program = null;

        // Color scheme for strata
        this.colors = {
            'SUBSTRATE': 0x404040,  // Dark gray
            'MEMORY': 0x4a90d9,     // Blue
            'LOGIC': 0x2a5f2a,      // Green
            'SPEC': 0xf5a53d,       // Yellow/orange
            'INTENT': 0xc7a5f3      // Magenta/purple
        };

        // Opcode glyphs (Unicode symbols)
        this.opcodeSymbols = {
            'NOP': '○',
            'ALLOC': '◼',
            'FREE': '◻',
            'LOAD': '◀',
            'STORE': '▶',
            'LOOP': '↻',
            'BRANCH': '◇',
            'CALL': '○',
            'RETURN': '●',
            'DATA': '░',
            'TYPE': '▓',
            'PTR': '→',
            'STRUCT': '█',
            'MODULE': '▣',
            'EXPORT': '↑',
            'IMPORT': '↓',
            'HALT': '✕'
        };

        // Create layers
        this.glyphLayer = new PIXI.Container();
        this.connectionLayer = new PIXI.Container();
        this.overlayLayer = new PIXI.Container();

        this.container.addChild(this.connectionLayer);
        this.container.addChild(this.glyphLayer);
        this.container.addChild(this.overlayLayer);

        // Event handlers
        this.setupInteraction();
    }

    /**
     * Load a GlyphStratum program from JSON.
     */
    loadProgram(programData) {
        // Clear existing
        this.clear();

        this.program = programData;

        // Create glyphs
        const glyphs = programData.glyphs || {};
        for (const [indexStr, glyphData] of Object.entries(glyphs)) {
            this.createGlyph(parseInt(indexStr), glyphData);
        }

        // Create connections
        this.createConnections();

        // Layout
        this.layoutGlyphs();
    }

    /**
     * Create a visual glyph.
     */
    createGlyph(index, data) {
        const stratum = data.stratum_name || 'SUBSTRATE';
        const opcode = data.opcode_name || 'NOP';
        const color = this.colors[stratum] || 0x404040;
        const symbol = this.opcodeSymbols[opcode] || '○';

        // Create container for glyph
        const glyphContainer = new PIXI.Container();

        // Background based on stratum
        const bg = new PIXI.Graphics();
        bg.beginFill(color);
        bg.drawRoundedRect(-20, -15, 40, 30, 16);
        bg.endFill();
        glyphContainer.addChild(bg);

        // Symbol
        const text = new PIXI.Text(symbol, {
            fontFamily: 'monospace',
            fontSize: 24,
            fill: 0xffffff,
            align: 'center'
        });
        text.anchor.set(0.5, 0.5);
        glyphContainer.addChild(text);

        // Index label
        const indexLabel = new PIXI.Text(`${index}`, {
            fontFamily: 'monospace',
            fontSize: 10,
            fill: 0xaaaaaa
        });
        indexLabel.anchor.set(-15, -20);
        glyphContainer.addChild(indexLabel);

        // Store data
        glyphContainer.glyphData = data;
        glyphContainer.glyphIndex = index;

        // Add to layer
        this.glyphLayer.addChild(glyphContainer);
        this.glyphs.set(index, glyphContainer);

        // Make interactive
        glyphContainer.eventMode = 'static';
        glyphContainer.cursor = 'pointer';
    }

    /**
     * Create dependency connections between glyphs.
     */
    createConnections() {
        // Clear existing connections
        for (const conn of this.connections) {
            conn.destroy();
        }
        this.connections = [];

        // Create new connections
        for (const [index, glyphContainer] of this.glyphs) {
            const deps = glyphContainer.glyphData.dependencies || [];
            for (const depIndex of deps) {
                const depGlyph = this.glyphs.get(depIndex);
                if (depGlyph) {
                    this.createConnection(glyphContainer, depGlyph);
                }
            }
        }
    }

    /**
     * Create a connection line between two glyphs.
     * Draws from dependent (higher stratum) to dependency (lower stratum).
     */
    createConnection(fromGlyph, toGlyph) {
        // Use local positions since both glyphs are in the same coordinate space
        const line = new PIXI.Graphics();
        line.lineStyle(2, 0x444466, 0.6);
        line.moveTo(fromGlyph.x, fromGlyph.y);

        // Draw curved line for better visualization
        const midY = (fromGlyph.y + toGlyph.y) / 2;
        line.lineTo(fromGlyph.x, midY);
        line.lineTo(toGlyph.x, midY);
        line.lineTo(toGlyph.x, toGlyph.y);

        this.connectionLayer.addChild(line);
        this.connections.push(line);
    }

    /**
     * Layout glyphs in a strata-based arrangement.
     */
    layoutGlyphs() {
        // Group by stratum
        const byStratum = {
            'SUBSTRATE': [],
            'MEMORY': [],
            'LOGIC': [],
            'SPEC': [],
            'INTENT': []
        };

        for (const [index, glyph] of this.glyphs) {
            const stratum = glyph.glyphData.stratum_name || 'SUBSTRATE';
            byStratum[stratum].push(glyph);
        }

        // Position each stratum
        const stratumOrder = ['INTENT', 'SPEC', 'LOGIC', 'MEMORY', 'SUBSTRATE'];
        const layerHeight = 80;
        const startX = 100;

        stratumOrder.forEach((stratum, layerIndex) => {
            const glyphs = byStratum[stratum];
            glyphs.forEach((glyph, i) => {
                glyph.x = startX + i * 90;
                glyph.y = -layerIndex * layerHeight;
            });
        });
    }

    /**
     * Setup mouse interaction.
     */
    setupInteraction() {
        this.container.eventMode = 'static';
        this.container.hitArea = new PIXI.Rectangle(-10000, -10000, 20000, 20000);

        this.container.on('pointerdown', (e) => {
            // Check if we clicked on a glyph
            const globalPos = e.data.global;

            // Find clicked glyph by checking bounds
            for (const [index, glyphContainer] of this.glyphs) {
                const bounds = glyphContainer.getBounds();
                if (bounds.contains(globalPos.x, globalPos.y)) {
                    this.selectGlyph(glyphContainer);
                    return;
                }
            }
        });
    }

    /**
     * Select a glyph.
     */
    selectGlyph(glyphContainer) {
        // Deselect previous
        if (this.selectedGlyph && this.selectedGlyph !== glyphContainer) {
            // Remove selection border (last child)
            if (this.selectedGlyph.children.length > 3) {
                this.selectedGlyph.removeChildAt(this.selectedGlyph.children.length - 1);
            }
        }

        this.selectedGlyph = glyphContainer;

        // Add selection border
        const border = new PIXI.Graphics();
        border.lineStyle(3, 0xffff00, 1);
        border.drawRoundedRect(-24, -18, 48, 36, 18);
        glyphContainer.addChild(border);

        // Show info
        this.showGlyphInfo(glyphContainer);

        // Dispatch event for external listeners
        document.dispatchEvent(new CustomEvent('glyphSelected', {
            detail: {
                index: glyphContainer.glyphIndex,
                ...glyphContainer.glyphData
            }
        }));
    }

    /**
     * Show glyph info in overlay.
     */
    showGlyphInfo(glyphContainer) {
        // Clear overlay
        this.overlayLayer.removeChildren();

        const data = glyphContainer.glyphData;

        // Info box
        const infoBox = new PIXI.Container();

        // Title
        const title = new PIXI.Text(
            `[${glyphContainer.glyphIndex}] ${data.stratum_name}.${data.opcode_name}`,
            {
                fontFamily: 'monospace',
                fontSize: 14,
                fill: 0xffffff
            }
        );
        infoBox.addChild(title);

        // Rationale
        if (data.rationale) {
            const rationale = new PIXI.Text(data.rationale, {
                fontFamily: 'sans-serif',
                fontSize: 12,
                fill: 0xcccccc,
                wordWrap: true,
                wordWrapWidth: 180
            });
            rationale.y = 25;
            infoBox.addChild(rationale);
        }

        // Dependencies
        if (data.dependencies && data.dependencies.length > 0) {
            const depsLabel = new PIXI.Text(
                `Deps: ${data.dependencies.join(', ')}`,
                {
                    fontFamily: 'monospace',
                    fontSize: 11,
                    fill: 0x888888
                }
            );
            depsLabel.y = 45;
            infoBox.addChild(depsLabel);
        }

        // Position overlay
        infoBox.x = glyphContainer.x + 50;
        infoBox.y = glyphContainer.y - 60;

        this.overlayLayer.addChild(infoBox);
    }

    /**
     * Clear all glyphs.
     */
    clear() {
        this.glyphLayer.removeChildren();
        this.connectionLayer.removeChildren();
        this.overlayLayer.removeChildren();
        this.glyphs.clear();
        this.connections = [];
        this.program = null;
    }

    /**
     * Destroy the renderer.
     */
    destroy() {
        this.clear();
        this.container.removeChild(this.connectionLayer);
        this.container.removeChild(this.glyphLayer);
        this.container.removeChild(this.overlayLayer);
    }
}

// Export for module loading
if (typeof module !== 'undefined') {
    module.exports = { GlyphStratumRenderer };
}
