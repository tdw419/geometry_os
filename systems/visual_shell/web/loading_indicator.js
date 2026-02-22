/**
 * LoadingIndicator - Visual loading state indicator for async operations
 *
 * Provides animated loading indicators with configurable styles and states.
 * Designed for use with PIXI.js containers.
 *
 * Part of: Neural Heatmap Phase 2.1.4 - Advanced Correlation Analytics
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-1-4-correlation-analytics.md
 */

class LoadingIndicator {
    /**
     * Create a new LoadingIndicator
     * @param {Object} options - Configuration options
     * @param {string} options.message - Loading message (default: 'Loading...')
     * @param {number} options.x - X position (default: 0)
     * @param {number} options.y - Y position (default: 0)
     * @param {number} options.size - Spinner size (default: 30)
     * @param {number} options.color - Spinner color (default: 0x00FF00)
     */
    constructor(options = {}) {
        this.options = {
            message: 'Loading...',
            x: 0,
            y: 0,
            size: 30,
            color: 0x00FF00,
            textColor: 0x00FF00,
            backgroundColor: 0x000000,
            backgroundAlpha: 0.7,
            ...options
        };

        this.container = null;
        this.spinnerGraphics = null;
        this.messageText = null;
        this.background = null;
        this.rotationAngle = 0;
        this.animationFrame = null;
        this.isVisible = false;
    }

    /**
     * Create the loading indicator UI
     * @returns {PIXI.Container} UI container
     */
    create() {
        if (typeof PIXI === 'undefined') {
            console.warn('[LoadingIndicator] PIXI not available');
            return { addChild: () => {}, visible: true };
        }

        this.container = new PIXI.Container();
        this.container.x = this.options.x;
        this.container.y = this.options.y;
        this.container.visible = false;

        // Background panel
        this.background = new PIXI.Graphics();
        this.background.beginFill(this.options.backgroundColor, this.options.backgroundAlpha);
        this.background.lineStyle(1, this.options.color, 0.3);
        this.background.drawRoundedRect(-75, -30, 150, 60, 8);
        this.background.endFill();
        this.container.addChild(this.background);

        // Spinner graphics
        this.spinnerGraphics = new PIXI.Graphics();
        this.spinnerGraphics.x = 0;
        this.spinnerGraphics.y = -5;
        this.container.addChild(this.spinnerGraphics);

        // Message text
        this.messageText = new PIXI.Text(this.options.message, {
            fontFamily: 'Arial, sans-serif',
            fontSize: 12,
            fill: this.options.textColor
        });
        this.messageText.anchor.x = 0.5;
        this.messageText.x = 0;
        this.messageText.y = 15;
        this.container.addChild(this.messageText);

        console.log('[LoadingIndicator] Created');

        return this.container;
    }

    /**
     * Show the loading indicator
     * @param {string} message - Optional message override
     */
    show(message = null) {
        if (!this.container) return;

        if (message) {
            this.setMessage(message);
        }

        this.container.visible = true;
        this.isVisible = true;
        this._startAnimation();
    }

    /**
     * Hide the loading indicator
     */
    hide() {
        if (!this.container) return;

        this.container.visible = false;
        this.isVisible = false;
        this._stopAnimation();
    }

    /**
     * Set the loading message
     * @param {string} message - New message to display
     */
    setMessage(message) {
        if (this.messageText) {
            this.messageText.text = message;
        }
    }

    /**
     * Position the indicator at the center of a container
     * @param {number} width - Container width
     * @param {number} height - Container height
     */
    centerIn(width, height) {
        if (this.container) {
            this.container.x = width / 2;
            this.container.y = height / 2;
        }
    }

    /**
     * Start the spinner animation
     * @private
     */
    _startAnimation() {
        if (this.animationFrame) return;

        const animate = () => {
            if (!this.isVisible) return;

            this.rotationAngle += 0.1;
            this._drawSpinner();

            this.animationFrame = requestAnimationFrame(animate);
        };

        animate();
    }

    /**
     * Stop the spinner animation
     * @private
     */
    _stopAnimation() {
        if (this.animationFrame) {
            cancelAnimationFrame(this.animationFrame);
            this.animationFrame = null;
        }
    }

    /**
     * Draw the spinner at current rotation
     * @private
     */
    _drawSpinner() {
        if (!this.spinnerGraphics) return;

        this.spinnerGraphics.clear();

        const size = this.options.size;
        const segments = 8;
        const radius = size / 2;

        for (let i = 0; i < segments; i++) {
            const angle = (i / segments) * Math.PI * 2 + this.rotationAngle;
            const alpha = 1 - (i / segments) * 0.8;

            const x = Math.cos(angle) * radius;
            const y = Math.sin(angle) * radius;

            this.spinnerGraphics.beginFill(this.options.color, alpha);
            this.spinnerGraphics.drawCircle(x, y, 3);
            this.spinnerGraphics.endFill();
        }
    }

    /**
     * Set position
     * @param {number} x - X position
     * @param {number} y - Y position
     */
    setPosition(x, y) {
        if (this.container) {
            this.container.x = x;
            this.container.y = y;
        }
    }

    /**
     * Check if indicator is currently visible
     * @returns {boolean} Visibility state
     */
    visible() {
        return this.isVisible;
    }

    /**
     * Destroy the indicator
     */
    destroy() {
        this._stopAnimation();

        if (this.container) {
            this.container.destroy();
            this.container = null;
        }

        this.spinnerGraphics = null;
        this.messageText = null;
        this.background = null;
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.LoadingIndicator = LoadingIndicator;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LoadingIndicator };
}
