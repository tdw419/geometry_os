/**
 * Memory Ghost Renderer
 *
 * Renders translucent overlays of past successful UI states on top
 * of the live VM feed. Ghosts show where similar UI elements were
 * found before, with opacity indicating confidence.
 *
 * Usage:
 *   const renderer = new MemoryGhostRenderer(app);
 *   renderer.updateGhosts(ghostsData);
 *   renderer.render();
 */
export class MemoryGhostRenderer {
    constructor(pixiApp, options = {}) {
        this.app = pixiApp;
        this.options = {
            maxGhosts: options.maxGhosts || 10,
            panelColor: options.panelColor || 0x00FF00,
            buttonColor: options.buttonColor || 0x00AAFF,
            lineColor: options.lineColor || 0xFFFF00,
            fadeEnabled: options.fadeEnabled !== false,
            ...options
        };

        // Container for all ghost graphics
        this.container = new PIXI.Container();
        this.container.name = 'MemoryGhosts';
        this.container.zIndex = 100; // Above main content

        // Graphics objects for each ghost type
        this.panelGraphics = new PIXI.Graphics();
        this.buttonGraphics = new PIXI.Graphics();
        this.lineGraphics = new PIXI.Graphics();

        this.container.addChild(this.lineGraphics);
        this.container.addChild(this.panelGraphics);
        this.container.addChild(this.buttonGraphics);

        // Active ghosts
        this.ghosts = [];

        // Animation state
        this.pulseTime = 0;
        this.animationEnabled = true;
    }

    /**
     * Update ghosts from server data.
     * @param {Array} ghostsData - Array of ghost objects from server
     */
    updateGhosts(ghostsData) {
        if (!ghostsData || ghostsData.length === 0) {
            this.ghosts = [];
            return;
        }

        this.ghosts = ghostsData.map(g => ({
            id: g.ghost_id,
            source: g.source_memory,
            panels: g.panels || [],
            buttons: g.buttons || [],
            lines: g.lines || [],
            opacity: g.opacity || 0.5,
            color: this._parseColor(g.color || '#00FF00'),
            similarity: g.similarity || 0,
            confidence: g.confidence || 'LOW',
            timestamp: g.timestamp || Date.now()
        }));

        this._redraw();
    }

    /**
     * Parse hex color string to number.
     */
    _parseColor(hex) {
        if (typeof hex === 'number') return hex;
        return parseInt(hex.replace('#', '0x'), 16);
    }

    /**
     * Redraw all ghost elements.
     */
    _redraw() {
        this.panelGraphics.clear();
        this.buttonGraphics.clear();
        this.lineGraphics.clear();

        for (const ghost of this.ghosts) {
            const alpha = ghost.opacity * this._getPulseFactor();

            // Draw panels (dashed outline, filled)
            for (const panel of ghost.panels) {
                const [x1, y1, x2, y2] = panel.bbox || [0, 0, 0, 0];
                const width = x2 - x1;
                const height = y2 - y1;

                // Fill with semi-transparent color
                this.panelGraphics.beginFill(ghost.color, alpha * 0.2);
                this.panelGraphics.drawRect(x1, y1, width, height);
                this.panelGraphics.endFill();

                // Dashed outline (simulated with line segments)
                this.panelGraphics.lineStyle(2, ghost.color, alpha);
                this._drawDashedRect(this.panelGraphics, x1, y1, width, height, 8, 4);
            }

            // Draw buttons (solid outline)
            for (const button of ghost.buttons) {
                const [x1, y1, x2, y2] = button.bbox || [0, 0, 0, 0];
                const width = x2 - x1;
                const height = y2 - y1;

                this.buttonGraphics.beginFill(this.options.buttonColor, alpha * 0.3);
                this.buttonGraphics.lineStyle(2, ghost.color, alpha);
                this.buttonGraphics.drawRoundedRect(x1, y1, width, height, 4);
                this.buttonGraphics.endFill();
            }

            // Draw lines
            for (const line of ghost.lines) {
                this.lineGraphics.lineStyle(2, this.options.lineColor, alpha * 0.7);
                this.lineGraphics.moveTo(line.x1, line.y1);
                this.lineGraphics.lineTo(line.x2, line.y2);
            }
        }
    }

    /**
     * Draw a dashed rectangle.
     */
    _drawDashedRect(graphics, x, y, width, height, dashLength, gapLength) {
        // Top edge
        this._drawDashedLine(graphics, x, y, x + width, y, dashLength, gapLength);
        // Right edge
        this._drawDashedLine(graphics, x + width, y, x + width, y + height, dashLength, gapLength);
        // Bottom edge
        this._drawDashedLine(graphics, x + width, y + height, x, y + height, dashLength, gapLength);
        // Left edge
        this._drawDashedLine(graphics, x, y + height, x, y, dashLength, gapLength);
    }

    /**
     * Draw a dashed line.
     */
    _drawDashedLine(graphics, x1, y1, x2, y2, dashLength, gapLength) {
        const dx = x2 - x1;
        const dy = y2 - y1;
        const length = Math.sqrt(dx * dx + dy * dy);
        const dashCount = Math.floor(length / (dashLength + gapLength));

        for (let i = 0; i < dashCount; i++) {
            const start = i * (dashLength + gapLength);
            const end = Math.min(start + dashLength, length);

            const startX = x1 + (dx / length) * start;
            const startY = y1 + (dy / length) * start;
            const endX = x1 + (dx / length) * end;
            const endY = y1 + (dy / length) * end;

            graphics.moveTo(startX, startY);
            graphics.lineTo(endX, endY);
        }
    }

    /**
     * Get pulse factor for animation.
     */
    _getPulseFactor() {
        if (!this.animationEnabled) return 1.0;
        // Subtle pulse between 0.8 and 1.0
        return 0.9 + 0.1 * Math.sin(this.pulseTime * 2);
    }

    /**
     * Update animation state.
     */
    update(deltaTime) {
        this.pulseTime += deltaTime;
        if (this.ghosts.length > 0 && this.animationEnabled) {
            this._redraw();
        }
    }

    /**
     * Get the container for adding to stage.
     */
    getContainer() {
        return this.container;
    }

    /**
     * Clear all ghosts.
     */
    clear() {
        this.ghosts = [];
        this.panelGraphics.clear();
        this.buttonGraphics.clear();
        this.lineGraphics.clear();
    }

    /**
     * Set visibility.
     */
    setVisible(visible) {
        this.container.visible = visible;
    }

    /**
     * Toggle animation.
     */
    setAnimation(enabled) {
        this.animationEnabled = enabled;
    }
}
