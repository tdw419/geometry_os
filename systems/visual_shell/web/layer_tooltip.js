/**
 * Layer Tooltip - Shows detailed information on hover
 *
 * Part of Neural Heatmap Overlay improvement roadmap
 * Phase 2: Interactive Features - Task 2.1
 * Enhanced Phase 2: Deep Inspection & Interaction
 */

class LayerTooltip {
    constructor(options = {}) {
        this.options = {
            maxWidth: 350,
            padding: 12,
            fontSize: 12,
            lineHeight: 16,
            showNeuralAddress: true,  // Phase 2: Show neural address (L, H, N)
            showValueReadout: true,   // Phase 2: Show raw activation value
            showPokeButton: true,     // Phase 2: Show "Poke" button
            ...options
        };

        this.container = null;
        this.visible = false;
        this.currentData = null;
        this.hoverDelay = 200;
        this.hoverTimer = null;

        // Phase 2: Poke callback
        this.onPoke = null;
    }

    /**
     * Create the tooltip container
     */
    create() {
        this.container = new PIXI.Container();
        this.container.visible = false;
        this.container.zIndex = 10000;

        // Background
        this.background = new PIXI.Graphics();
        this.container.addChild(this.background);

        // Title text
        this.titleText = new PIXI.Text('', {
            fontFamily: 'Arial, sans-serif',
            fontSize: this.options.fontSize + 2,
            fontWeight: 'bold',
            fill: 0x00FFFF,
            wordWrap: true,
            wordWrapWidth: this.options.maxWidth - this.options.padding * 2
        });
        this.container.addChild(this.titleText);

        // Info text
        this.infoText = new PIXI.Text('', {
            fontFamily: 'Monaco, monospace',
            fontSize: this.options.fontSize,
            fill: 0xCCCCCC,
            wordWrap: true,
            wordWrapWidth: this.options.maxWidth - this.options.padding * 2,
            lineHeight: this.options.lineHeight
        });
        this.container.addChild(this.infoText);

        return this.container;
    }

    /**
     * Show tooltip with layer data
     */
    show(data, x, y) {
        this.currentData = data;

        // Update content
        this.updateContent(data);

        // Position tooltip
        this.position(x, y);

        // Show with animation
        this.container.alpha = 0;
        this.container.visible = true;

        // Fade in
        const fadeIn = () => {
            if (this.container.alpha < 1) {
                this.container.alpha += 0.1;
                requestAnimationFrame(fadeIn);
            }
        };
        fadeIn();

        this.visible = true;
    }

    /**
     * Update tooltip content
     * Enhanced for Phase 2: Deep Inspection & Interaction
     */
    updateContent(data) {
        // Title
        this.titleText.text = data.name || 'Unknown Layer';
        this.titleText.x = this.options.padding;
        this.titleText.y = this.options.padding;

        // Build info string with Phase 2 enhancements
        const lines = [
            `Type: ${data.type || 'N/A'}`,
            `Shape: ${this.formatShape(data.shape)}`,
            `Activity: ${((data.activity || 0) * 100).toFixed(1)}%`
        ];

        // Phase 2: Neural Address (Layer L, Head H, Neuron N)
        if (this.options.showNeuralAddress && data.neuralAddress) {
            lines.push('--- Neural Address ---');
            lines.push(`Layer: ${data.neuralAddress.layer ?? 'N/A'}`);
            lines.push(`Head: ${data.neuralAddress.head ?? 'N/A'}`);
            lines.push(`Neuron: ${data.neuralAddress.neuron ?? 'N/A'}`);
        }

        // Phase 2: Raw Value Readout
        if (this.options.showValueReadout && data.rawValue !== undefined) {
            lines.push('--- Value ---');
            lines.push(`Raw: ${typeof data.rawValue === 'number' ? data.rawValue.toFixed(6) : data.rawValue}`);
            if (data.weight !== undefined) {
                lines.push(`Weight: ${typeof data.weight === 'number' ? data.weight.toFixed(6) : data.weight}`);
            }
        }

        // Phase 2: Hilbert index
        if (data.hilbertIndex !== undefined) {
            lines.push(`Hilbert Index: ${data.hilbertIndex}`);
        }

        this.infoText.text = lines.join('\n');
        this.infoText.x = this.options.padding;
        this.infoText.y = this.titleText.y + this.titleText.height + 8;

        // Phase 2: Create poke button if enabled
        if (this.options.showPokeButton && data.neuralAddress) {
            this._createPokeButton();
        }

        // Draw background
        this.drawBackground();
    }

    /**
     * Create poke button for neuron stimulation
     * Phase 2: "Poke" Interaction
     * @private
     */
    _createPokeButton() {
        if (this.pokeButton) {
            this.pokeButton.destroy();
        }

        this.pokeButton = new PIXI.Container();
        this.pokeButton.eventMode = 'static';
        this.pokeButton.cursor = 'pointer';

        const buttonBg = new PIXI.Graphics();
        buttonBg.beginFill(0x00FFFF, 0.3);
        buttonBg.lineStyle(1, 0x00FFFF, 0.8);
        buttonBg.drawRoundedRect(0, 0, 80, 24, 4);
        buttonBg.endFill();
        this.pokeButton.addChild(buttonBg);

        const buttonText = new PIXI.Text('⚡ Poke', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 11,
            fill: 0x00FFFF,
            fontWeight: 'bold'
        });
        buttonText.x = 10;
        buttonText.y = 5;
        this.pokeButton.addChild(buttonText);

        // Position below info text
        this.pokeButton.x = this.options.padding;
        this.pokeButton.y = this.infoText.y + this.infoText.height + 10;

        // Click handler
        this.pokeButton.on('pointerdown', () => {
            if (this.onPoke && this.currentData?.neuralAddress) {
                this.onPoke(this.currentData.neuralAddress);
                // Visual feedback
                buttonBg.clear();
                buttonBg.beginFill(0x00FF00, 0.5);
                buttonBg.lineStyle(1, 0x00FF00, 1);
                buttonBg.drawRoundedRect(0, 0, 80, 24, 4);
                buttonBg.endFill();

                setTimeout(() => {
                    buttonBg.clear();
                    buttonBg.beginFill(0x00FFFF, 0.3);
                    buttonBg.lineStyle(1, 0x00FFFF, 0.8);
                    buttonBg.drawRoundedRect(0, 0, 80, 24, 4);
                    buttonBg.endFill();
                }, 200);
            }
        });

        // Hover effects
        this.pokeButton.on('pointerover', () => {
            buttonBg.clear();
            buttonBg.beginFill(0x00FFFF, 0.5);
            buttonBg.lineStyle(1, 0x00FFFF, 1);
            buttonBg.drawRoundedRect(0, 0, 80, 24, 4);
            buttonBg.endFill();
        });

        this.pokeButton.on('pointerout', () => {
            buttonBg.clear();
            buttonBg.beginFill(0x00FFFF, 0.3);
            buttonBg.lineStyle(1, 0x00FFFF, 0.8);
            buttonBg.drawRoundedRect(0, 0, 80, 24, 4);
            buttonBg.endFill();
        });

        this.container.addChild(this.pokeButton);
    }

    /**
     * Draw tooltip background with glassmorphic effect
     * Enhanced for Phase 2 to account for poke button
     */
    drawBackground() {
        this.background.clear();

        const width = this.options.maxWidth;
        let height = this.infoText.y + this.infoText.height + this.options.padding;

        // Account for poke button if present
        if (this.pokeButton && this.pokeButton.visible) {
            height = this.pokeButton.y + this.pokeButton.height + this.options.padding;
        }

        // Glassmorphic background
        this.background.beginFill(0x1a1a2e, 0.95);
        this.background.lineStyle(1, 0x00FFFF, 0.5);

        // Rounded rectangle
        const radius = 8;
        this.background.drawRoundedRect(0, 0, width, height, radius);
        this.background.endFill();

        // Add subtle glow
        this.background.lineStyle(2, 0x00FFFF, 0.2);
        this.background.drawRoundedRect(1, 1, width - 2, height - 2, radius - 1);
    }

    /**
     * Position tooltip (prevent overflow)
     */
    position(x, y) {
        const screenWidth = this.container.parent?.width || window.innerWidth;
        const screenHeight = this.container.parent?.height || window.innerHeight;

        let finalX = x + 15;
        let finalY = y + 15;

        // Prevent right overflow
        if (finalX + this.options.maxWidth > screenWidth) {
            finalX = x - this.options.maxWidth - 15;
        }

        // Prevent bottom overflow
        if (finalY + 200 > screenHeight) {
            finalY = y - 200;
        }

        this.container.x = finalX;
        this.container.y = finalY;
    }

    /**
     * Hide tooltip
     */
    hide() {
        if (!this.visible) return;

        // Remove poke button
        if (this.pokeButton) {
            this.pokeButton.destroy();
            this.pokeButton = null;
        }

        // Fade out
        const fadeOut = () => {
            if (this.container.alpha > 0) {
                this.container.alpha -= 0.1;
                requestAnimationFrame(fadeOut);
            } else {
                this.container.visible = false;
            }
        };
        fadeOut();

        this.visible = false;
        this.currentData = null;
    }

    /**
     * Show with delay (hover detection)
     */
    showWithDelay(data, x, y) {
        clearTimeout(this.hoverTimer);

        this.hoverTimer = setTimeout(() => {
            this.show(data, x, y);
        }, this.hoverDelay);
    }

    /**
     * Cancel pending show
     */
    cancelDelay() {
        clearTimeout(this.hoverTimer);
    }

    /**
     * Format layer shape for display
     */
    formatShape(shape) {
        if (!shape) return 'N/A';
        if (Array.isArray(shape)) {
            return `[${shape.join(', ')}]`;
        }
        return String(shape);
    }

    /**
     * Destroy tooltip
     */
    destroy() {
        if (this.container) {
            this.container.destroy();
            this.container = null;
        }
    }
}

// Export for use
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LayerTooltip };
}
