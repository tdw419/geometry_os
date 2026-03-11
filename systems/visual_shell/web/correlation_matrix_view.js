/**
 * CorrelationMatrixView - Visualizes cross-layer correlation matrix
 *
 * Provides heatmap-style visualization of correlation between layers
 * across different models, with color coding for correlation strength.
 *
 * Part of: Neural Heatmap Phase 2.1.4 - Advanced Correlation Analytics
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-1-4-correlation-analytics.md
 */

class CorrelationMatrixView {
    /**
     * Create a new CorrelationMatrixView
     * @param {Object} options - Configuration options
     * @param {PIXI.Container} options.container - Parent container
     * @param {number} options.width - View width (default: 400)
     * @param {number} options.height - View height (default: 300)
     * @param {Object} options.position - Position {x, y}
     * @param {number} options.cellSize - Size of each cell (default: 20)
     */
    constructor(options = {}) {
        this.options = {
            width: 400,
            height: 300,
            position: { x: 350, y: 20 },
            cellSize: 20,
            padding: 10,
            title: 'Layer Correlation Matrix',
            ...options
        };

        this.container = null;
        this.matrixData = null;
        this.labels = [];

        // Loading indicator
        this.loadingIndicator = null;
        this.isLoading = false;

        // Virtual renderer for large datasets (Phase 2.2)
        this.virtualRenderer = null;
        this.useVirtualization = false;

        // Theme support
        this.themeManager = null;
        this.themeChangeHandler = null;
        this.backgroundGraphics = null;
        this.titleText = null;
        this.legendGraphics = [];

        // Color scheme for correlation values (blue -> white -> red)
        this.colorScale = {
            negative: { r: 0, g: 100, b: 255 },    // Blue for negative
            neutral: { r: 240, g: 240, b: 240 },   // White/grey for neutral
            positive: { r: 255, g: 50, b: 50 }     // Red for positive
        };

        // Initialize theme when available
        this._initTheme();

        // Enhanced tooltip (Phase 2.2)
        this.enhancedTooltip = null;
        if (typeof EnhancedTooltip !== 'undefined') {
            this.enhancedTooltip = new EnhancedTooltip({
                width: 280,
                maxHeight: 350,
                density: 'normal',
                showMiniCharts: true
            });
            console.log('[CorrelationMatrixView] Enhanced tooltip initialized');
        }

        // Accessibility (Phase 2.3)
        this.accessibleCells = [];
        this.currentFocusedCell = null;
        this.keyboardNavIndex = -1;
        this._initAccessibility();
    }

    /**
     * Initialize accessibility features (Phase 2.3)
     * @private
     */
    _initAccessibility() {
        // Register with accessibility manager if available
        if (typeof AccessibilityMixin !== 'undefined') {
            AccessibilityMixin.initAccessibility(this, {
                id: 'correlation-matrix',
                label: 'Layer Correlation Matrix',
                description: 'A heatmap visualization showing correlation values between neural network layers. Use arrow keys to navigate between cells.',
                role: 'region'
            });
        }
    }

    /**
     * Create the UI
     * @returns {PIXI.Container} UI container
     */
    create() {
        if (typeof PIXI === 'undefined') {
            console.warn('[CorrelationMatrixView] PIXI not available');
            return { addChild: () => {}, visible: true };
        }

        this.container = new PIXI.Container();
        this.container.x = this.options.position.x;
        this.container.y = this.options.position.y;
        this.container.zIndex = 1000;

        // Background
        this._createBackground();

        // Title
        this._createTitle();

        // Matrix container (will be populated when data is set)
        this.matrixContainer = new PIXI.Container();
        this.matrixContainer.x = this.options.padding;
        this.matrixContainer.y = 50;
        this.container.addChild(this.matrixContainer);

        // Legend
        this._createLegend();

        // Initialize and add loading indicator
        if (typeof LoadingIndicator !== 'undefined') {
            this.loadingIndicator = new LoadingIndicator({
                message: 'Computing correlations...',
                color: this._getThemeColor('accent', 'green'),
                x: this.options.width / 2,
                y: this.options.height / 2
            });
            const loadingContainer = this.loadingIndicator.create();
            this.container.addChild(loadingContainer);
        }

        // Make interactive
        this.container.eventMode = 'static';

        // Apply theme to existing elements
        this._applyTheme();

        console.log('[CorrelationMatrixView] Created');

        return this.container;
    }

    /**
     * Create background panel
     * @private
     */
    _createBackground() {
        this.backgroundGraphics = new PIXI.Graphics();
        const bgColor = this._getThemeColor('background', 'panel');
        const bgOpacity = this._getThemeOpacity('background', 'panelOpacity');
        const borderColor = this._getThemeColor('border', 'primary');

        this.backgroundGraphics.beginFill(bgColor, bgOpacity);
        this.backgroundGraphics.lineStyle(1, borderColor, 0.3);
        this.backgroundGraphics.drawRoundedRect(0, 0, this.options.width, this.options.height, 8);
        this.backgroundGraphics.endFill();
        this.container.addChild(this.backgroundGraphics);
    }

    /**
     * Create title
     * @private
     */
    _createTitle() {
        const titleColor = this._getThemeColor('text', 'primary');
        const ui = this._getThemeUI();

        this.titleText = new PIXI.Text(this.options.title, {
            fontFamily: 'Arial, sans-serif',
            fontSize: ui.fontSize.title,
            fontWeight: 'bold',
            fill: titleColor
        });
        this.titleText.x = this.options.padding;
        this.titleText.y = 15;
        this.container.addChild(this.titleText);
    }

    /**
     * Create color legend
     * @private
     */
    _createLegend() {
        const legendY = this.options.height - 40;
        const bgColor = this._getThemeColor('background', 'tertiary');
        const borderColor = this._getThemeColor('border', 'subtle');
        const textColor = this._getThemeColor('text', 'tertiary');

        // Legend background
        const legendBg = new PIXI.Graphics();
        legendBg.beginFill(bgColor, 0.5);
        legendBg.lineStyle(1, borderColor, 0.3);
        legendBg.drawRoundedRect(
            this.options.padding,
            legendY,
            this.options.width - 2 * this.options.padding,
            25,
            4
        );
        legendBg.endFill();
        this.container.addChild(legendBg);
        this.legendGraphics.push(legendBg);

        // Color gradient
        const gradientWidth = this.options.width - 2 * this.options.padding - 20;
        const startX = this.options.padding + 10;

        for (let i = 0; i <= gradientWidth; i++) {
            const t = i / gradientWidth; // 0 to 1
            const color = this._correlationToColor(t * 2 - 1); // -1 to 1
            const r = (color >> 16) & 0xFF;
            const g = (color >> 8) & 0xFF;
            const b = color & 0xFF;

            const rect = new PIXI.Graphics();
            rect.beginFill((r << 24) | (g << 16) | (b << 8) | 0xFF);
            rect.drawRect(startX + i, legendY + 8, 1, 10);
            rect.endFill();
            this.container.addChild(rect);
            this.legendGraphics.push(rect);
        }

        // Labels
        const negLabel = new PIXI.Text('-1', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 10,
            fill: textColor
        });
        negLabel.x = startX;
        negLabel.y = legendY + 22;
        this.container.addChild(negLabel);
        this.legendGraphics.push(negLabel);

        const posLabel = new PIXI.Text('+1', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 10,
            fill: textColor
        });
        posLabel.x = startX + gradientWidth;
        posLabel.y = legendY + 22;
        this.container.addChild(posLabel);
        this.legendGraphics.push(posLabel);

        const midLabel = new PIXI.Text('0', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 10,
            fill: textColor
        });
        midLabel.x = startX + gradientWidth / 2;
        midLabel.y = legendY + 22;
        midLabel.anchor.x = 0.5;
        this.container.addChild(midLabel);
        this.legendGraphics.push(midLabel);
    }

    /**
     * Update with correlation matrix data
     * @param {Object} matrix - Correlation matrix from CrossLayerAnalyzer
     */
    updateMatrix(matrix) {
        if (!this.matrixContainer) return;

        // Show loading indicator
        if (this.loadingIndicator) {
            this.loadingIndicator.show();
        }

        // Process matrix asynchronously to allow UI update
        requestAnimationFrame(() => {
            this._renderMatrix(matrix);

            // Hide loading indicator after rendering
            if (this.loadingIndicator) {
                this.loadingIndicator.hide();
            }
        });
    }

    /**
     * Internal method to render the matrix
     * Chooses between virtual and legacy rendering based on dataset size
     * @private
     */
    _renderMatrix(matrix) {

        this.matrixData = matrix;
        this.labels = matrix.layerNames || [];

        // Clear existing
        this.matrixContainer.removeChildren();

        const size = this.labels.length;
        if (size === 0) return;

        // Phase 2.2: Use virtualization for large datasets (50+ layers)
        const virtualizationThreshold = this.options.virtualizationThreshold || 50;
        this.useVirtualization = size >= virtualizationThreshold;

        if (this.useVirtualization && typeof VirtualMatrixRenderer !== 'undefined') {
            console.log('[CorrelationMatrixView] Using virtual rendering for', size, 'layers');
            this._renderVirtual(matrix, size);
        } else {
            console.log('[CorrelationMatrixView] Using legacy rendering for', size, 'layers');
            this._renderLegacy(matrix, size);
        }
    }

    /**
     * Render using VirtualMatrixRenderer for large datasets (Phase 2.2)
     * @private
     */
    _renderVirtual(matrix, size) {
        // Clean up existing virtual renderer
        if (this.virtualRenderer) {
            this.virtualRenderer.destroy();
            this.virtualRenderer = null;
        }

        const matrixWidth = this.options.width - 2 * this.options.padding;
        const matrixHeight = this.options.height - 100; // Leave space for legend and title

        // Create virtual renderer
        this.virtualRenderer = new VirtualMatrixRenderer({
            width: matrixWidth,
            height: matrixHeight,
            cellSize: this.options.cellSize,
            bufferSize: this.options.bufferSize || 2,
            minCellSize: 5,
            maxCellSize: 50
        });

        const rendererContainer = this.virtualRenderer.create();
        rendererContainer.x = this.options.padding;
        rendererContainer.y = 50;

        // Set up cell interaction
        this.virtualRenderer.onCellClick = (cellData) => {
            console.log('[CorrelationMatrixView] Cell clicked:', cellData);
            // Emit event or call callback for tooltip
        };

        this.virtualRenderer.onCellHover = (cellData) => {
            // Could show tooltip here
        };

        // Set data and render
        this.virtualRenderer.setMatrixData(matrix);
        this.container.addChild(rendererContainer);
    }

    /**
     * Render using legacy method for small datasets
     * @private
     */
    _renderLegacy(matrix, size) {
        // Clean up virtual renderer if exists
        if (this.virtualRenderer) {
            this.virtualRenderer.destroy();
            this.virtualRenderer = null;
        }

        const cellSize = Math.min(
            this.options.cellSize,
            (this.options.width - 2 * this.options.padding) / size
        );

        // Draw cells
        for (let i = 0; i < size; i++) {
            for (let j = 0; j < size; j++) {
                // Find correlation for this layer pair
                const key = `${matrix.modelIds[0]}:${this.labels[i]}|${matrix.modelIds[1] || matrix.modelIds[0]}:${this.labels[j]}`;
                const data = matrix.correlations.get(key);
                const correlation = data ? data.correlation : 0;

                const color = this._correlationToColor(correlation);

                const cell = new PIXI.Graphics();
                cell.beginFill(color, 0.9);
                cell.drawRect(
                    j * cellSize,
                    i * cellSize,
                    cellSize - 1,
                    cellSize - 1
                );
                cell.endFill();

                // Add tooltip support
                cell.eventMode = 'static';
                cell.cursor = 'pointer';
                cell.data = {
                    correlation,
                    layer1: this.labels[i],
                    layer2: this.labels[j],
                    model1: matrix.modelIds[0],
                    model2: matrix.modelIds[1] || matrix.modelIds[0],
                    row: i,
                    col: j,
                    totalRows: size,
                    totalCols: size
                };

                // Enhanced tooltip on hover (Phase 2.2)
                cell.on('pointerover', (event) => this._onCellHover(event, cell.data));
                cell.on('pointerout', () => this._onCellOut());

                // Accessibility: Add keyboard navigation (Phase 2.3)
                cell.on('keydown', (event) => this._onCellKeydown(event, cell, i, j, size));

                this.matrixContainer.addChild(cell);

                // Track accessible cells for keyboard navigation
                this.accessibleCells.push(cell);
            }
        }

        // Set up keyboard navigation for the matrix
        this._setupKeyboardNavigation(size);
    }

    /**
     * Set up keyboard navigation for the matrix (Phase 2.3)
     * @private
     */
    _setupKeyboardNavigation(size) {
        // Make matrix container keyboard accessible
        this.matrixContainer.eventMode = 'static';
        this.matrixContainer.setAttribute('role', 'grid');
        this.matrixContainer.setAttribute('aria-label', 'Correlation matrix');
        this.matrixContainer.setAttribute('aria-rowcount', size);
        this.matrixContainer.setAttribute('aria-colcount', size);
    }

    /**
     * Handle keyboard navigation for cells (Phase 2.3)
     * @private
     */
    _onCellKeydown(event, cell, row, col, size) {
        let nextRow = row;
        let nextCol = col;
        let handled = false;

        switch (event.key) {
            case 'ArrowRight':
                nextCol = (col + 1) % size;
                handled = true;
                break;
            case 'ArrowLeft':
                nextCol = (col - 1 + size) % size;
                handled = true;
                break;
            case 'ArrowDown':
                nextRow = (row + 1) % size;
                handled = true;
                break;
            case 'ArrowUp':
                nextRow = (row - 1 + size) % size;
                handled = true;
                break;
            case 'Enter':
            case ' ':
                // Trigger cell action
                this._announceCell(cell.data);
                handled = true;
                break;
        }

        if (handled) {
            event.preventDefault();

            // Find and focus next cell
            const nextIndex = nextRow * size + nextCol;
            if (nextIndex < this.accessibleCells.length) {
                const nextCell = this.accessibleCells[nextIndex];
                this._focusCell(nextCell, nextRow, nextCol);
            }
        }
    }

    /**
     * Focus on a specific cell (Phase 2.3)
     * @private
     */
    _focusCell(cell, row, col) {
        // Remove focus indicator from previous cell
        if (this.currentFocusedCell) {
            this.currentFocusedCell.alpha = 1;
        }

        // Add focus indicator to new cell
        cell.alpha = 0.7;
        this.currentFocusedCell = cell;
        this.keyboardNavIndex = row * this.options.cellSize + col;

        // Announce cell info
        this._announceCell(cell.data);
    }

    /**
     * Announce cell information (Phase 2.3)
     * @private
     */
    _announceCell(data) {
        const correlation = data.correlation.toFixed(3);
        const direction = data.correlation > 0 ? 'positive' :
                         data.correlation < 0 ? 'negative' : 'neutral';
        const strength = Math.abs(data.correlation) > 0.7 ? 'strong' :
                        Math.abs(data.correlation) > 0.3 ? 'moderate' : 'weak';

        const message = `Cell row ${data.row + 1}, column ${data.col + 1}: ` +
                       `${data.layer1} vs ${data.layer2}. ` +
                       `${strength} ${direction} correlation: ${correlation}`;

        if (typeof AccessibilityMixin !== 'undefined') {
            AccessibilityMixin.announce(this, message, 'polite');
        }
    }

        // Draw row labels
        const labelColor = this._getThemeColor('text', 'secondary');
        for (let i = 0; i < size; i++) {
            const label = new PIXI.Text(this._shortenLabel(this.labels[i]), {
                fontFamily: 'Arial, sans-serif',
                fontSize: 9,
                fill: labelColor
            });
            label.x = -cellSize - 5;
            label.y = i * cellSize;
            this.matrixContainer.addChild(label);
        }

        // Draw column labels (rotated)
        for (let j = 0; j < size; j++) {
            const label = new PIXI.Text(this._shortenLabel(this.labels[j]), {
                fontFamily: 'Arial, sans-serif',
                fontSize: 9,
                fill: labelColor
            });
            label.rotation = Math.PI / 4;
            label.x = j * cellSize;
            label.y = -cellSize - 5;
            label.anchor.x = 0;
            this.matrixContainer.addChild(label);
        }
    }

    /**
     * Convert correlation value to color
     * @private
     */
    _correlationToColor(correlation) {
        // Clamp to [-1, 1]
        const c = Math.max(-1, Math.min(1, correlation));

        if (c < 0) {
            // Blue gradient for negative
            const t = Math.abs(c);
            return this._lerpColor(
                this.colorScale.neutral,
                this.colorScale.negative,
                t
            );
        } else {
            // Red gradient for positive
            const t = c;
            return this._lerpColor(
                this.colorScale.neutral,
                this.colorScale.positive,
                t
            );
        }
    }

    /**
     * Linear interpolation between colors
     * @private
     */
    _lerpColor(color1, color2, t) {
        const r = Math.round(color1.r + (color2.r - color1.r) * t);
        const g = Math.round(color1.g + (color2.g - color1.g) * t);
        const b = Math.round(color1.b + (color2.b - color1.b) * t);
        return (0xFF << 24) | (r << 16) | (g << 8) | b;
    }

    /**
     * Shorten label for display
     * @private
     */
    _shortenLabel(label) {
        if (label.length > 12) {
            return label.substring(0, 10) + '..';
        }
        return label;
    }

    /**
     * Handle cell hover for enhanced tooltip (Phase 2.2)
     * @param {Object} event - PIXI event
     * @param {Object} data - Cell data
     * @private
     */
    _onCellHover(event, data) {
        if (!this.enhancedTooltip) return;

        // Get global position
        const globalPos = event.data.global;

        // Show tooltip
        this.enhancedTooltip.show(data, {
            x: globalPos.x + 15,
            y: globalPos.y + 15
        }, 'Correlation Details');
    }

    /**
     * Handle cell out (Phase 2.2)
     * @private
     */
    _onCellOut() {
        if (!this.enhancedTooltip) return;

        // Hide tooltip if not pinned
        if (!this.enhancedTooltip.isPinned) {
            this.enhancedTooltip.hide();
        }
    }

    /**
     * Initialize theme manager integration
     * @private
     */
    _initTheme() {
        if (typeof window !== 'undefined' && window.analyticsTheme) {
            this.themeManager = window.analyticsTheme;

            // Register theme change handler
            this.themeChangeHandler = () => {
                this._applyTheme();
            };

            this.themeManager.addEventListener('themechange', this.themeChangeHandler);
        }
    }

    /**
     * Apply theme to all themed elements
     * @private
     */
    _applyTheme() {
        if (!this.container) return;

        // Update background
        if (this.backgroundGraphics) {
            this.backgroundGraphics.clear();
            const bgColor = this._getThemeColor('background', 'panel');
            const bgOpacity = this._getThemeOpacity('background', 'panelOpacity');
            const borderColor = this._getThemeColor('border', 'primary');

            this.backgroundGraphics.beginFill(bgColor, bgOpacity);
            this.backgroundGraphics.lineStyle(1, borderColor, 0.3);
            this.backgroundGraphics.drawRoundedRect(0, 0, this.options.width, this.options.height, 8);
            this.backgroundGraphics.endFill();
        }

        // Update title
        if (this.titleText) {
            this.titleText.style.fill = this._getThemeColor('text', 'primary');
            const ui = this._getThemeUI();
            this.titleText.style.fontSize = ui.fontSize.title;
        }

        // Update legend colors
        const legendTextColor = this._getThemeColor('text', 'tertiary');
        this.legendGraphics.forEach(graphic => {
            if (graphic instanceof PIXI.Text) {
                graphic.style.fill = legendTextColor;
            } else if (graphic.clear) {
                // Rebuild legend for complex graphics
                this._rebuildLegend();
            }
        });

        // Re-render matrix with new theme if data exists
        if (this.matrixData) {
            this._renderMatrix(this.matrixData);
        }
    }

    /**
     * Rebuild legend when theme changes
     * @private
     */
    _rebuildLegend() {
        // Remove old legend graphics
        this.legendGraphics.forEach(g => {
            if (g.parent) {
                g.parent.removeChild(g);
            }
        });
        this.legendGraphics = [];

        // Recreate legend
        this._createLegend();
    }

    /**
     * Get color from current theme
     * @private
     */
    _getThemeColor(category, shade) {
        if (this.themeManager) {
            return this.themeManager.getColor(category, shade);
        }

        // Fallback to dark theme defaults
        const defaults = {
            background: {
                panel: 0x0a0a1a,
                panelOpacity: 0.95,
                tertiary: 0x1e1e38
            },
            border: {
                primary: 0x00FF00,
                subtle: 0x666666
            },
            text: {
                primary: 0xFFFFFF,
                secondary: 0xCCCCCC,
                tertiary: 0xAAAAAA
            }
        };

        return defaults[category]?.[shade] || 0x000000;
    }

    /**
     * Get opacity from current theme
     * @private
     */
    _getThemeOpacity(category, shade) {
        if (this.themeManager) {
            return this.themeManager.getColor(category, shade);
        }

        // Fallback default
        return 0.95;
    }

    /**
     * Get UI settings from current theme
     * @private
     */
    _getThemeUI() {
        if (this.themeManager) {
            const theme = this.themeManager.getTheme();
            return theme?.ui || { fontSize: { title: 14, label: 11, small: 9 } };
        }

        return { fontSize: { title: 14, label: 11, small: 9 } };
    }

    /**
     * Show/hide the view
     * @param {boolean} visible - Visibility state
     */
    setVisible(visible) {
        if (this.container) {
            this.container.visible = visible;
        }
    }

    /**
     * Get rendering statistics (Phase 2.2)
     * @returns {Object} Performance statistics
     */
    getStats() {
        const stats = {
            useVirtualization: this.useVirtualization,
            layerCount: this.labels.length,
            totalCells: this.labels.length * this.labels.length
        };

        if (this.useVirtualization && this.virtualRenderer) {
            return {
                ...stats,
                ...this.virtualRenderer.getStats()
            };
        }

        return stats;
    }

    /**
     * Destroy view
     */
    destroy() {
        // Clean up enhanced tooltip (Phase 2.2)
        if (this.enhancedTooltip) {
            this.enhancedTooltip.destroy();
            this.enhancedTooltip = null;
        }

        // Clean up virtual renderer (Phase 2.2)
        if (this.virtualRenderer) {
            this.virtualRenderer.destroy();
            this.virtualRenderer = null;
        }

        // Remove theme change listener
        if (this.themeManager && this.themeChangeHandler) {
            this.themeManager.removeEventListener('themechange', this.themeChangeHandler);
        }

        if (this.container) {
            this.container.destroy();
            this.container = null;
        }
        this.matrixData = null;
        this.labels = [];
        this.legendGraphics = [];
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.CorrelationMatrixView = CorrelationMatrixView;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { CorrelationMatrixView };
}
