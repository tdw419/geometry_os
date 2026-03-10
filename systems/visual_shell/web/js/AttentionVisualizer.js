/**
 * AttentionVisualizer - PixiJS renderer for attention patterns and probability distributions.
 *
 * Part of Glass Box Dashboard - visualizing internal mechanics of PixelBrain inference.
 * Renders attention heatmaps, probability bars, and fades them over time.
 */

const PATTERN_LIFETIME_MS = 2000;  // 2 seconds auto-fade
const CELL_SIZE = 8;  // Size of each heatmap cell in pixels
const BAR_WIDTH = 20;  // Width of probability bars
const BAR_MAX_HEIGHT = 100;  // Maximum height of probability bars
const BAR_SPACING = 4;  // Spacing between bars

export class AttentionVisualizer {
    /**
     * Create a new AttentionVisualizer.
     *
     * @param {Object} app - PixiJS application (or mock for tests)
     * @param {Object} container - Container to add patterns to (defaults to app.stage)
     */
    constructor(app, container = null) {
        this.app = app;
        this.container = container || (app && app.stage ? app.stage : null);
        this.patterns = [];
        this.distributions = [];

        // Register for ticker updates (if available)
        if (this.app && this.app.ticker && typeof this.app.ticker.add === 'function') {
            this.app.ticker.add((ticker) => {
                this.update(ticker.deltaMS);
            });
        }
    }

    /**
     * Render an attention pattern as a heatmap.
     *
     * @param {Object} data - Attention data
     * @param {number[][]} data.head_weights - 2D array of attention weights (0-1)
     * @param {number} data.layer_idx - Layer index for positioning
     * @param {number} data.seq_position - Sequence position for positioning
     * @param {number} [data.x] - Optional X position override
     * @param {number} [data.y] - Optional Y position override
     * @returns {Object} The created pattern object
     */
    renderAttention(data) {
        const {
            head_weights = [[0.5]],
            layer_idx = 0,
            seq_position = 0,
            x = null,
            y = null
        } = data;

        // Calculate position based on layer and sequence
        const posX = x !== null ? x : seq_position * (head_weights[0]?.length * CELL_SIZE + 20);
        const posY = y !== null ? y : layer_idx * (head_weights.length * CELL_SIZE + 40);

        // Create graphics object - use PIXI if available, otherwise mock
        let graphics;
        if (typeof PIXI !== 'undefined' && PIXI.Graphics) {
            graphics = new PIXI.Graphics();

            // Draw heatmap cells
            for (let row = 0; row < head_weights.length; row++) {
                for (let col = 0; col < head_weights[row].length; col++) {
                    const intensity = head_weights[row][col];
                    const color = this._intensityToColor(intensity);

                    graphics.rect(
                        col * CELL_SIZE,
                        row * CELL_SIZE,
                        CELL_SIZE - 1,
                        CELL_SIZE - 1
                    );
                    graphics.fill({ color: color, alpha: intensity });
                }
            }
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
        graphics.x = posX;
        graphics.y = posY;

        // Add to container
        if (this.container && typeof this.container.addChild === 'function') {
            this.container.addChild(graphics);
        }

        // Track pattern for animation
        const pattern = {
            graphics,
            head_weights,
            layer_idx,
            seq_position,
            startTime: Date.now(),
            lifetime: PATTERN_LIFETIME_MS
        };

        this.patterns.push(pattern);

        return pattern;
    }

    /**
     * Render a probability distribution as a bar chart.
     *
     * @param {Object} data - Distribution data
     * @param {number[]} data.probabilities - Array of probabilities (0-1)
     * @param {string[]} data.labels - Labels for each bar
     * @param {number} data.x - X position
     * @param {number} data.y - Y position
     * @returns {Object} The created distribution object
     */
    renderDistribution(data) {
        const {
            probabilities = [],
            labels = [],
            x = 0,
            y = 0
        } = data;

        // Create graphics object - use PIXI if available, otherwise mock
        let graphics;
        if (typeof PIXI !== 'undefined' && PIXI.Graphics) {
            graphics = new PIXI.Graphics();

            // Draw probability bars
            for (let i = 0; i < probabilities.length; i++) {
                const prob = probabilities[i];
                const barHeight = prob * BAR_MAX_HEIGHT;
                const color = this._intensityToColor(prob);

                // Draw bar
                graphics.rect(
                    i * (BAR_WIDTH + BAR_SPACING),
                    BAR_MAX_HEIGHT - barHeight,
                    BAR_WIDTH,
                    barHeight
                );
                graphics.fill({ color: color, alpha: 0.8 });
            }
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

        // Track distribution for animation
        const distribution = {
            graphics,
            probabilities,
            labels,
            startTime: Date.now(),
            lifetime: PATTERN_LIFETIME_MS
        };

        this.distributions.push(distribution);

        return distribution;
    }

    /**
     * Update pattern animations (called every frame).
     *
     * @param {number} deltaMs - Milliseconds since last frame
     */
    update(deltaMs) {
        const now = Date.now();

        // Update attention patterns
        const patternsToRemove = [];
        for (const pattern of this.patterns) {
            const elapsed = now - pattern.startTime;
            const progress = Math.min(1.0, elapsed / pattern.lifetime);

            if (progress >= 1.0) {
                patternsToRemove.push(pattern);
                continue;
            }

            // Ease-out fade
            const alpha = 1.0 - Math.pow(progress, 2);
            pattern.graphics.alpha = alpha;
        }

        // Remove faded patterns
        for (const pattern of patternsToRemove) {
            this._removePattern(pattern);
        }

        // Update distributions
        const distsToRemove = [];
        for (const dist of this.distributions) {
            const elapsed = now - dist.startTime;
            const progress = Math.min(1.0, elapsed / dist.lifetime);

            if (progress >= 1.0) {
                distsToRemove.push(dist);
                continue;
            }

            // Ease-out fade
            const alpha = 1.0 - Math.pow(progress, 2);
            dist.graphics.alpha = alpha;
        }

        // Remove faded distributions
        for (const dist of distsToRemove) {
            this._removeDistribution(dist);
        }
    }

    /**
     * Map intensity value (0-1) to a color.
     * Uses a heat map color scheme: blue (cold) -> cyan -> green -> yellow -> red (hot)
     *
     * @param {number} intensity - Intensity value (0-1)
     * @returns {number} Color as hex number
     */
    _intensityToColor(intensity) {
        // Clamp intensity to 0-1
        const i = Math.max(0, Math.min(1, intensity));

        // Heat map gradient
        if (i < 0.25) {
            // Blue to Cyan
            const t = i / 0.25;
            return this._rgbToHex(0, Math.floor(255 * t), 255);
        } else if (i < 0.5) {
            // Cyan to Green
            const t = (i - 0.25) / 0.25;
            return this._rgbToHex(0, 255, Math.floor(255 * (1 - t)));
        } else if (i < 0.75) {
            // Green to Yellow
            const t = (i - 0.5) / 0.25;
            return this._rgbToHex(Math.floor(255 * t), 255, 0);
        } else {
            // Yellow to Red
            const t = (i - 0.75) / 0.25;
            return this._rgbToHex(255, Math.floor(255 * (1 - t)), 0);
        }
    }

    /**
     * Convert RGB values to hex color number.
     *
     * @param {number} r - Red (0-255)
     * @param {number} g - Green (0-255)
     * @param {number} b - Blue (0-255)
     * @returns {number} Hex color
     */
    _rgbToHex(r, g, b) {
        return (r << 16) | (g << 8) | b;
    }

    /**
     * Remove a pattern from the visualizer.
     *
     * @param {Object} pattern - Pattern to remove
     */
    _removePattern(pattern) {
        if (this.container && typeof this.container.removeChild === 'function') {
            this.container.removeChild(pattern.graphics);
        }
        if (typeof pattern.graphics.destroy === 'function') {
            pattern.graphics.destroy();
        }
        const idx = this.patterns.indexOf(pattern);
        if (idx >= 0) {
            this.patterns.splice(idx, 1);
        }
    }

    /**
     * Remove a distribution from the visualizer.
     *
     * @param {Object} dist - Distribution to remove
     */
    _removeDistribution(dist) {
        if (this.container && typeof this.container.removeChild === 'function') {
            this.container.removeChild(dist.graphics);
        }
        if (typeof dist.graphics.destroy === 'function') {
            dist.graphics.destroy();
        }
        const idx = this.distributions.indexOf(dist);
        if (idx >= 0) {
            this.distributions.splice(idx, 1);
        }
    }

    /**
     * Clear all active patterns and distributions.
     */
    clear() {
        // Clear patterns
        for (const pattern of this.patterns) {
            if (this.container && typeof this.container.removeChild === 'function') {
                this.container.removeChild(pattern.graphics);
            }
            if (typeof pattern.graphics.destroy === 'function') {
                pattern.graphics.destroy();
            }
        }
        this.patterns = [];

        // Clear distributions
        for (const dist of this.distributions) {
            if (this.container && typeof this.container.removeChild === 'function') {
                this.container.removeChild(dist.graphics);
            }
            if (typeof dist.graphics.destroy === 'function') {
                dist.graphics.destroy();
            }
        }
        this.distributions = [];
    }

    /**
     * Get count of active patterns.
     */
    get count() {
        return this.patterns.length + this.distributions.length;
    }
}

// Export for both CommonJS and ES modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { AttentionVisualizer };
}
if (typeof window !== 'undefined') {
    window.AttentionVisualizer = AttentionVisualizer;
}
