/**
 * ThoughtVisualizer - PixiJS renderer for THOUGHT_PULSE glyphs.
 *
 * Renders LLM token generation as visible pulses on the Visual Shell.
 * Each glyph fades over time, creating a "thought trail" effect.
 *
 * Opcode 0xCE (THOUGHT_RENDER) - Cyan pulse for code discovery.
 */

// Opcode color mapping
const OPCODE_COLORS = {
    0xCE: '#00FFFF',  // Cyan - THOUGHT_RENDER (code discovery)
    0xD6: '#00FFFF',  // THOUGHT_PULSE alias
    0xD0: '#FF00FF',  // Magenta - EMBED
    0xD1: '#FFFF00',  // Yellow - ATTEND
    0xD2: '#FF8000',  // Orange - PROJECT
    0xD3: '#00FF00',  // Green - SAMPLE
};

const GLYPH_LIFETIME_MS = 3000;  // 3 seconds
const GLYPH_START_SIZE = 32;
const GLYPH_END_SIZE = 8;

export class ThoughtVisualizer {
    /**
     * Create a new ThoughtVisualizer.
     *
     * @param {Object} app - PixiJS application (or mock for tests)
     * @param {Object} container - Container to add glyphs to (defaults to app.stage)
     */
    constructor(app, container = null) {
        this.app = app;
        this.container = container || (app && app.stage ? app.stage : null);
        this.glyphs = [];

        // Register for ticker updates (if available)
        if (this.app && this.app.ticker && typeof this.app.ticker.add === 'function') {
            this.app.ticker.add((ticker) => {
                this.update(ticker.deltaMS);
            });
        }
    }

    /**
     * Emit a thought pulse glyph.
     *
     * @param {Object} data - Pulse data from WebSocket
     * @param {string} data.type - Message type ("THOUGHT_PULSE")
     * @param {number} data.opcode - GeoASM opcode (0xCE)
     * @param {number} data.token_id - Generated token
     * @param {number} data.x - Screen X position
     * @param {number} data.y - Screen Y position
     * @param {number} data.intensity - Visual intensity (0-1)
     * @returns {Object} The created glyph
     */
    emitThoughtPulse(data) {
        const {
            opcode = 0xCE,
            token_id = 0,
            x = 0,
            y = 0,
            intensity = 1.0
        } = data;

        // Get color for opcode
        const color = this._opcodeToColor(opcode);

        // Create graphics object - use PIXI if available, otherwise mock
        let graphics;
        if (typeof PIXI !== 'undefined' && PIXI.Graphics) {
            graphics = new PIXI.Graphics();
            graphics.circle(0, 0, GLYPH_START_SIZE * intensity);
            graphics.fill({ color: color, alpha: intensity });
        } else {
            // Mock for testing
            graphics = {
                alpha: 1.0,
                x: 0,
                y: 0,
                scale: { set: () => {} },
                destroy: () => {}
            };
        }

        // Position
        graphics.x = x;
        graphics.y = y;

        // Add to container
        if (this.container && typeof this.container.addChild === 'function') {
            this.container.addChild(graphics);
        }

        // Track glyph for animation
        const glyph = {
            graphics,
            token_id,
            color,
            startTime: Date.now(),
            lifetime: GLYPH_LIFETIME_MS,
            startSize: GLYPH_START_SIZE * intensity,
            endSize: GLYPH_END_SIZE
        };

        this.glyphs.push(glyph);

        return glyph;
    }

    /**
     * Update glyph animations (called every frame).
     *
     * @param {number} deltaMs - Milliseconds since last frame
     */
    update(deltaMs) {
        const now = Date.now();
        const toRemove = [];

        for (const glyph of this.glyphs) {
            const elapsed = now - glyph.startTime;
            const progress = Math.min(1.0, elapsed / glyph.lifetime);

            if (progress >= 1.0) {
                toRemove.push(glyph);
                continue;
            }

            // Ease-out fade
            const alpha = 1.0 - Math.pow(progress, 2);
            const scale = 1.0 - (progress * 0.5);

            glyph.graphics.alpha = alpha;
            if (glyph.graphics.scale && typeof glyph.graphics.scale.set === 'function') {
                glyph.graphics.scale.set(scale);
            }
        }

        // Remove faded glyphs
        for (const glyph of toRemove) {
            if (this.container && typeof this.container.removeChild === 'function') {
                this.container.removeChild(glyph.graphics);
            }
            if (typeof glyph.graphics.destroy === 'function') {
                glyph.graphics.destroy();
            }
            const idx = this.glyphs.indexOf(glyph);
            if (idx >= 0) {
                this.glyphs.splice(idx, 1);
            }
        }
    }

    /**
     * Convert opcode to hex color string.
     *
     * @param {number} opcode - GeoASM opcode
     * @returns {string} Hex color (#RRGGBB)
     */
    _opcodeToColor(opcode) {
        return OPCODE_COLORS[opcode] || '#FFFFFF';
    }

    /**
     * Clear all active glyphs.
     */
    clear() {
        for (const glyph of this.glyphs) {
            if (this.container && typeof this.container.removeChild === 'function') {
                this.container.removeChild(glyph.graphics);
            }
            if (typeof glyph.graphics.destroy === 'function') {
                glyph.graphics.destroy();
            }
        }
        this.glyphs = [];
    }

    /**
     * Get count of active glyphs.
     */
    get count() {
        return this.glyphs.length;
    }
}

// Export for both CommonJS and ES modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { ThoughtVisualizer };
}
if (typeof window !== 'undefined') {
    window.ThoughtVisualizer = ThoughtVisualizer;
}
