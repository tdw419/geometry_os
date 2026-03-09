/**
 * AtlasGlowOverlay - Visualizes weight atlas access patterns.
 *
 * Renders a heatmap overlay on the brain atlas showing which
 * pixels were accessed during inference. This makes the model's
 * "thinking" visible by highlighting the weight regions being used.
 *
 * Part of PixelBrain Visual Shell Integration - Task 4: ATLAS_GLOW
 */

// Default glow color (cyan for neural activity)
const DEFAULT_GLOW_COLOR = 0x00FFFF;

class AtlasGlowOverlay {
    /**
     * Create a new AtlasGlowOverlay.
     *
     * @param {Object} app - PixiJS application (or mock for tests)
     * @param {Object} options - Configuration options
     * @param {number} options.atlasSize - Size of atlas texture (default 1024)
     */
    constructor(app, options = {}) {
        this.app = app;
        this.atlasSize = options.atlasSize || 1024;
        this.glowPoints = new Map();

        // Create container for glow sprites
        if (typeof PIXI !== 'undefined' && PIXI.Container) {
            this.container = new PIXI.Container();
            if (this.app && this.app.stage && typeof this.app.stage.addChild === 'function') {
                this.app.stage.addChild(this.container);
            }
        } else {
            // Mock for testing
            this.container = {
                children: [],
                addChild: function(child) { this.children.push(child); },
                removeChild: function(child) {
                    const idx = this.children.indexOf(child);
                    if (idx >= 0) this.children.splice(idx, 1);
                }
            };
        }

        // Create render texture for glow accumulation (if PIXI available)
        if (typeof PIXI !== 'undefined' && PIXI.RenderTexture && this.app && this.app.renderer) {
            this.glowTexture = PIXI.RenderTexture.create({
                width: this.atlasSize,
                height: this.atlasSize
            });

            if (typeof PIXI.Sprite !== 'undefined') {
                this.glowSprite = new PIXI.Sprite(this.glowTexture);
                this.glowSprite.blendMode = 'ADD';
                this.container.addChild(this.glowSprite);
            }
        }
    }

    /**
     * Handle ATLAS_GLOW message from WebSocket.
     *
     * @param {Object} data - Glow data from WebSocket
     * @param {number[]} data.indices - Hilbert indices that were accessed
     * @param {number} data.intensity - Glow intensity (0-1)
     * @param {number} data.duration_ms - Duration in milliseconds
     */
    handleGlow(data) {
        const { indices, intensity = 1.0, duration_ms = 500 } = data;

        if (!indices || indices.length === 0) return;

        // Create glow graphics
        let graphics;
        if (typeof PIXI !== 'undefined' && PIXI.Graphics) {
            graphics = new PIXI.Graphics();
            graphics.circle(0, 0, 2);
            graphics.fill({ color: DEFAULT_GLOW_COLOR, alpha: intensity * 0.3 });

            // Draw points for each accessed index
            for (const idx of indices) {
                const coord = this._hilbertIndexToCoord(idx);
                graphics.circle(coord.x, coord.y, 2);
            }
            graphics.fill();
        } else {
            // Mock for testing
            graphics = {
                alpha: 1.0,
                destroy: () => {}
            };
        }

        // Add to container
        if (this.container && typeof this.container.addChild === 'function') {
            this.container.addChild(graphics);
        }

        // Schedule fade
        const glowId = Date.now() + Math.random();
        this.glowPoints.set(glowId, {
            graphics,
            startTime: Date.now(),
            duration: duration_ms
        });

        // Auto-cleanup after duration
        setTimeout(() => {
            this._removeGlow(glowId);
        }, duration_ms + 100);
    }

    /**
     * Convert Hilbert index to (x, y) coordinate.
     * Simplified - assumes 1024x1024 atlas.
     *
     * @param {number} index - Hilbert index
     * @returns {{x: number, y: number}} Coordinate
     */
    _hilbertIndexToCoord(index) {
        // Simplified Hilbert lookup - in production would use full algorithm
        // For now, just spread indices across the atlas
        const x = index % this.atlasSize;
        const y = Math.floor(index / this.atlasSize) % this.atlasSize;
        return { x, y };
    }

    /**
     * Remove a glow effect.
     *
     * @param {number} glowId - Glow identifier
     */
    _removeGlow(glowId) {
        const glow = this.glowPoints.get(glowId);
        if (glow) {
            if (this.container && typeof this.container.removeChild === 'function') {
                this.container.removeChild(glow.graphics);
            }
            if (typeof glow.graphics.destroy === 'function') {
                glow.graphics.destroy();
            }
            this.glowPoints.delete(glowId);
        }
    }

    /**
     * Clear all glow effects.
     */
    clear() {
        for (const [id, glow] of this.glowPoints) {
            if (this.container && typeof this.container.removeChild === 'function') {
                this.container.removeChild(glow.graphics);
            }
            if (typeof glow.graphics.destroy === 'function') {
                glow.graphics.destroy();
            }
        }
        this.glowPoints.clear();
    }

    /**
     * Get count of active glow points.
     */
    get count() {
        return this.glowPoints.size;
    }
}

// Export for both CommonJS and ES modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { AtlasGlowOverlay, DEFAULT_GLOW_COLOR };
}
if (typeof window !== 'undefined') {
    window.AtlasGlowOverlay = AtlasGlowOverlay;
}
