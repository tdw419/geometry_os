/**
 * Geometry OS: Pixel Palette UI Component
 *
 * Phase 26: The Chromatic Programming Interface
 *
 * A floating palette that allows users to select operation brushes
 * by color/category. The Palette is the interface to PixelLang.
 *
 * @module pixel_palette
 */

class PixelPalette {
    /**
     * Create a new PixelPalette
     * @param {PIXI.Application} app - PixiJS application
     * @param {GeometricCanvas} canvas - Geometric canvas instance
     * @param {Object} options - Configuration
     */
    constructor(app, canvas, options = {}) {
        this.app = app;
        this.canvas = canvas;
        this.options = {
            x: 20,
            y: 20,
            width: 200,
            itemHeight: 30,
            gap: 5,
            collapsed: false,
            ...options
        };

        this.selectedBrush = null;
        this.items = [];
        this.container = null;
        this.background = null;
        this.contentContainer = null;
        this.header = null;
        this.toggleButton = null;

        this.onBrushSelected = null;

        console.log('🎨 PixelPalette initialized');
    }

    /**
     * Initialize the palette UI
     */
    initialize() {
        // Create main container
        this.container = new PIXI.Container();
        this.container.x = this.options.x;
        this.container.y = this.options.y;

        // Create background
        this.background = new PIXI.Graphics();
        this._drawBackground();
        this.container.addChild(this.background);

        // Create content container
        this.contentContainer = new PIXI.Container();
        this.contentContainer.mask = this._createContentMask();
        this.container.addChild(this.contentContainer);

        // Create header with title
        this._createHeader();

        // Create palette items
        this._createPaletteItems();

        // Create toggle button
        this._createToggleButton();

        // Setup interaction
        this._setupInteraction();

        return this.container;
    }

    /**
     * Draw the palette background
     * @private
     */
    _drawBackground() {
        this.background.clear();

        const width = this.options.width;
        const height = this._calculateHeight();

        // Semi-transparent dark background
        this.background.beginFill(0x1a1a1a, 0.95);
        this.background.drawRoundedRect(0, 0, width, height, 8);
        this.background.endFill();

        // Border
        this.background.lineStyle(2, 0x00FFFF, 0.5);
        this.background.drawRoundedRect(0, 0, width, height, 8);
        this.background.endFill();
    }

    /**
     * Calculate total palette height
     * @private
     */
    _calculateHeight() {
        const headerHeight = 40;
        const itemsHeight = this.items.length * (this.options.itemHeight + this.options.gap);
        return headerHeight + itemsHeight + this.options.gap;
    }

    /**
     * Create content mask for scrolling
     * @private
     */
    _createContentMask() {
        const mask = new PIXI.Graphics();
        mask.beginFill(0xFFFFFF);
        const maskHeight = this.options.height - 50; // Leave room for header
        mask.drawRect(0, 40, this.options.width, maskHeight);
        mask.endFill();

        return mask;
    }

    /**
     * Create the palette header
     * @private
     */
    _createHeader() {
        this.header = new PIXI.Container();
        this.header.y = 10;

        // Title text
        const titleText = new PIXI.Text('PIXELLANG PALETTE', {
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0x00FFFF,
            fontWeight: 'bold'
        });
        titleText.x = 10;
        this.header.addChild(titleText);

        // PAS score indicator
        this.pasIndicator = new PIXI.Text('PAS: 1.00', {
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: 0x00FF00
        });
        this.pasIndicator.x = this.options.width - 60;
        this.header.addChild(this.pasIndicator);

        this.container.addChild(this.header);
    }

    /**
     * Create palette items (brushes)
     * @private
     */
    _createPaletteItems() {
        let y = 50; // Start below header

        // Group brushes by category
        const categories = [
            { name: 'FOUNDATION', brushes: GeometricBrush.getByCategory('foundation') },
            { name: 'MOVEMENT', brushes: GeometricBrush.getByCategory('movement') },
            { name: 'COMPUTATION', brushes: GeometricBrush.getByCategory('computation') },
            { name: 'LOGIC', brushes: GeometricBrush.getByCategory('logic') }
        ];

        for (const category of categories) {
            // Add category label
            const label = new PIXI.Text(category.name, {
                fontFamily: 'Courier New',
                fontSize: 10,
                fill: 0x888888,
                fontWeight: 'bold'
            });
            label.x = 10;
            label.y = y;
            this.contentContainer.addChild(label);
            y += 15;

            // Add brushes in this category
            for (const [name, brush] of Object.entries(category.brushes)) {
                const item = this._createPaletteItem(10, y, name, brush);
                this.items.push(item);
                this.contentContainer.addChild(item.container);
                y += this.options.itemHeight + this.options.gap;
            }

            y += 10; // Extra spacing between categories
        }
    }

    /**
     * Create a single palette item
     * @private
     */
    _createPaletteItem(x, y, name, brush) {
        const width = this.options.width - 20;
        const height = this.options.itemHeight;

        // Container for this item
        const container = new PIXI.Container();
        container.x = x;
        container.y = y;

        // Background (initially unselected)
        const bg = new PIXI.Graphics();
        bg.lineStyle(1, 0x333333, 0.5);
        bg.beginFill(0x2a2a2a, 0.8);
        bg.drawRoundedRect(0, 0, width, height, 4);
        bg.endFill();
        container.addChild(bg);

        // Color swatch
        const swatchSize = height - 8;
        const swatch = new PIXI.Graphics();
        swatch.beginFill(brush.color, 1);
        swatch.drawRect(0, 0, swatchSize, swatchSize);
        swatch.endFill();
        swatch.x = 5;
        swatch.y = 4;
        container.addChild(swatch);

        // Operation name
        const text = new PIXI.Text(name, {
            fontFamily: 'Courier New',
            fontSize: 11,
            fill: 0xFFFFFF
        });
        text.x = swatchSize + 12;
        text.y = (height - text.height) / 2;
        container.addChild(text);

        // Store references
        return {
            container,
            bg,
            swatch,
            name,
            brush
        };
    }

    /**
     * Create toggle button (collapse/expand)
     * @private
     */
    _createToggleButton() {
        this.toggleButton = new PIXI.Container();
        this.toggleButton.x = this.options.width - 25;
        this.toggleButton.y = 12;

        const bg = new PIXI.Graphics();
        bg.beginFill(0x00FFFF, 0.2);
        bg.drawCircle(10, 10, 8);
        bg.endFill();
        this.toggleButton.addChild(bg);

        // Icon (simple arrow)
        const icon = new PIXI.Graphics();
        icon.lineStyle(2, 0x00FFFF);
        icon.moveTo(5, 8);
        icon.lineTo(10, 13);
        icon.lineTo(15, 8);
        this.toggleButton.addChild(icon);

        this.toggleButton.eventMode = 'static';
        this.toggleButton.cursor = 'pointer';
        this.toggleButton.on('pointerdown', this._toggle.bind(this));

        this.container.addChild(this.toggleButton);
    }

    /**
     * Setup interaction handlers
     * @private
     */
    _setupInteraction() {
        for (const item of this.items) {
            item.container.eventMode = 'static';
            item.container.cursor = 'pointer';

            item.container.on('pointerdown', () => {
                this._selectItem(item);
            });

            item.container.on('pointerover', () => {
                if (this.selectedBrush !== item.brush) {
                    item.bg.clear();
                    item.bg.lineStyle(1, 0x00FFFF, 0.8);
                    item.bg.beginFill(0x3a3a3a, 0.9);
                    item.bg.drawRoundedRect(0, 0, this.options.width - 20, this.options.itemHeight, 4);
                    item.bg.endFill();
                }
            });

            item.container.on('pointerout', () => {
                if (this.selectedBrush !== item.brush) {
                    this._resetItemBackground(item);
                }
            });
        }
    }

    /**
     * Select a palette item
     * @private
     */
    _selectItem(item) {
        // Deselect previous
        if (this.selectedBrush) {
            const prevItem = this.items.find(i => i.brush === this.selectedBrush);
            if (prevItem) {
                this._resetItemBackground(prevItem);
            }
        }

        // Select new
        this.selectedBrush = item.brush;

        // Update visual
        item.bg.clear();
        item.bg.lineStyle(2, 0x00FFFF, 1);
        item.bg.beginFill(0x4a4a4a, 1);
        item.bg.drawRoundedRect(0, 0, this.options.width - 20, this.options.itemHeight, 4);
        item.bg.endFill();

        // Apply to canvas
        this.canvas.setBrush(item.brush);

        // Trigger callback
        if (this.onBrushSelected) {
            this.onBrushSelected(item.brush);
        }

        console.log(`🖌️ Selected: ${item.name} (${item.brush.category})`);
    }

    /**
     * Reset item background to default state
     * @private
     */
    _resetItemBackground(item) {
        item.bg.clear();
        item.bg.lineStyle(1, 0x333333, 0.5);
        item.bg.beginFill(0x2a2a2a, 0.8);
        item.bg.drawRoundedRect(0, 0, this.options.width - 20, this.options.itemHeight, 4);
        item.bg.endFill();
    }

    /**
     * Toggle collapse/expand
     * @private
     */
    _toggle() {
        this.options.collapsed = !this.options.collapsed;

        if (this.options.collapsed) {
            this.contentContainer.visible = false;
        } else {
            this.contentContainer.visible = true;
        }
    }

    /**
     * Update PAS score indicator
     * @param {number} score - PAS score (0-1)
     */
    updatePAS(score) {
        if (!this.pasIndicator) return;

        const scoreText = score.toFixed(2);
        let color = 0x00FF00; // Green

        if (score < 0.7) color = 0xFFFF00; // Yellow
        if (score < 0.5) color = 0xFF8800; // Orange
        if (score < 0.3) color = 0xFF0000; // Red

        this.pasIndicator.text = `PAS: ${scoreText}`;
        this.pasIndicator.style.fill = color;
    }

    /**
     * Set position
     * @param {number} x
     * @param {number} y
     */
    setPosition(x, y) {
        this.container.x = x;
        this.container.y = y;
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.PixelPalette = PixelPalette;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PixelPalette };
}
