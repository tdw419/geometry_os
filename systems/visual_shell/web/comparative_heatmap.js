/**
 * ComparativeHeatmap - Render comparative visualizations of multiple model activities
 *
 * Supports multiple visualization modes:
 * - split: Side-by-side comparison panels
 * - differential: Highlight differences between models
 * - overlay: Superimpose activities with color blending
 *
 * Part of: Neural Heatmap Phase 2.1 - Multi-Model Comparison
 * @see docs/plans/2026-02-07-neural-heatmap-phase2-multi-model.md
 */

class ComparativeHeatmap {
    /**
     * Create a new ComparativeHeatmap
     * @param {PIXI.Container} container - Parent container
     * @param {Object} options - Configuration options
     * @param {MultiModelTracker} options.multiModelTracker - Multi-model tracker instance
     * @param {string} options.mode - Visualization mode: 'split', 'differential', 'overlay'
     * @param {number} options.opacity - Base opacity (0-1)
     */
    constructor(container, options = {}) {
        if (!container) {
            throw new Error('ComparativeHeatmap requires a container');
        }

        this.options = {
            mode: 'split',
            opacity: 0.7,
            differentialThreshold: 0.1,
            overlayBlendMode: 'screen',
            ...options
        };

        this.multiModelTracker = options.multiModelTracker;
        if (!this.multiModelTracker) {
            throw new Error('ComparativeHeatmap requires a multiModelTracker');
        }

        // Create PIXI container for rendering
        if (typeof PIXI !== 'undefined') {
            this.container = new PIXI.Container();
            this.container.name = 'comparativeHeatmap';
            this.container.zIndex = 201; // Above single heatmap

            container.addChild(this.container);
        } else {
            // Fallback for non-PIXI environments
            this.container = {
                addChild: () => {},
                removeChildren: () => {},
                parent: container,
                visible: true,
                destroy: () => {}
            };
            this._fallbackMode = true;
        }

        // Visualization mode
        this.mode = this.options.mode;

        // Per-model render containers (for split mode)
        this.modelContainers = new Map();

        // Differential graphics (for differential mode)
        this.differentialGraphics = null;
        this.differentialCells = [];

        // Overlay graphics (for overlay mode)
        this.overlayGraphics = new Map();

        // Labels container for text elements
        this.labelsContainer = typeof PIXI !== 'undefined' ? new PIXI.Container() : null;

        // Statistics
        this.stats = {
            modelsRendered: 0,
            totalCellsRendered: 0,
            renderTime: 0
        };

        // Phase 2.1.2: AdvancedDifferential for statistical comparison
        if (typeof AdvancedDifferential !== 'undefined') {
            this.advancedDifferential = new AdvancedDifferential(this.multiModelTracker, {
                significanceThreshold: 0.05,
                minSampleSize: 5,
                confidenceLevel: 0.95,
                showIndicators: true
            });
            console.log('[ComparativeHeatmap] AdvancedDifferential enabled');
        } else {
            this.advancedDifferential = null;
        }

        // Phase 2.1.2: ExportUtils for export functionality
        if (typeof ExportUtils !== 'undefined') {
            this.exportUtils = new ExportUtils(this);
            console.log('[ComparativeHeatmap] ExportUtils enabled');
        } else {
            this.exportUtils = null;
        }

        // Initialize containers
        if (!this._fallbackMode) {
            this._rebuildContainers();
        }

        console.log(`[ComparativeHeatmap] Initialized with mode: ${this.mode}`);
    }

    /**
     * Set visualization mode
     * @param {string} mode - 'split', 'differential', or 'overlay'
     */
    setMode(mode) {
        const validModes = ['split', 'differential', 'overlay'];
        if (!validModes.includes(mode)) {
            console.warn(`[ComparativeHeatmap] Invalid mode: ${mode}`);
            return;
        }

        this.mode = mode;
        this._rebuildContainers();
        console.log(`[ComparativeHeatmap] Mode changed to: ${mode}`);
    }

    /**
     * Rebuild containers for new mode
     * @private
     */
    _rebuildContainers() {
        if (this._fallbackMode) return;

        // Clear existing containers
        this.container.removeChildren();
        if (this.labelsContainer) {
            this.labelsContainer.removeChildren();
            this.container.addChild(this.labelsContainer);
        }

        if (this.mode === 'split') {
            this._setupSplitContainers();
        } else if (this.mode === 'differential') {
            this.differentialGraphics = new PIXI.Graphics();
            this.container.addChild(this.differentialGraphics);
            if (this.labelsContainer) {
                this.container.addChild(this.labelsContainer);
            }
        } else if (this.mode === 'overlay') {
            this._setupOverlayContainers();
        }
    }

    /**
     * Setup split view containers
     * @private
     */
    _setupSplitContainers() {
        if (this._fallbackMode) return;

        const models = this.multiModelTracker.getAllModels();
        const modelCount = models.length;

        if (modelCount === 0) return;

        // Calculate layout
        const cols = Math.ceil(Math.sqrt(modelCount));
        const rows = Math.ceil(modelCount / cols);

        const panelWidth = this.container.parent?.width || window.innerWidth;
        const panelHeight = this.container.parent?.height || window.innerHeight;

        const cellWidth = panelWidth / cols;
        const cellHeight = panelHeight / rows;

        models.forEach((model, index) => {
            const modelContainer = new PIXI.Container();
            modelContainer.name = `model_${model.id}`;

            // Position in grid
            const col = index % cols;
            const row = Math.floor(index / cols);
            modelContainer.x = col * cellWidth;
            modelContainer.y = row * cellHeight;

            // Add panel background
            const bg = new PIXI.Graphics();
            bg.beginFill(model.color, 0.1);
            bg.lineStyle(2, model.color, 0.5);
            bg.drawRect(0, 0, cellWidth, cellHeight);
            bg.endFill();
            modelContainer.addChild(bg);

            // Add model label
            const label = new PIXI.Text(`${model.name}`, {
                fontFamily: 'Arial, sans-serif',
                fontSize: 14,
                fontWeight: 'bold',
                fill: model.color
            });
            label.x = 10;
            label.y = 10;
            modelContainer.addChild(label);

            // Create graphics for this model
            const graphics = new PIXI.Graphics();
            modelContainer.addChild(graphics);

            this.container.addChild(modelContainer);
            this.modelContainers.set(model.id, {
                container: modelContainer,
                graphics: graphics,
                bounds: { x: col * cellWidth, y: row * cellHeight, width: cellWidth, height: cellHeight }
            });
        });
    }

    /**
     * Setup overlay mode containers
     * @private
     */
    _setupOverlayContainers() {
        if (this._fallbackMode) return;

        const models = this.multiModelTracker.getAllModels();

        models.forEach(model => {
            const graphics = new PIXI.Graphics();
            graphics.alpha = 0.6; // Semi-transparent for overlay

            // Set blend mode if supported
            if (typeof PIXI.BLEND_MODES !== 'undefined') {
                const blendModes = {
                    'screen': PIXI.BLEND_MODES.SCREEN,
                    'add': PIXI.BLEND_MODES.ADD,
                    'normal': PIXI.BLEND_MODES.NORMAL
                };
                graphics.blendMode = blendModes[this.options.overlayBlendMode] || PIXI.BLEND_MODES.SCREEN;
            }

            this.container.addChild(graphics);
            this.overlayGraphics.set(model.id, graphics);
        });
    }

    /**
     * Update comparative visualization
     * @param {number} dt - Delta time in seconds
     */
    update(dt = 0.016) {
        const startTime = performance.now();

        // Update multi-model tracker
        this.multiModelTracker.update(dt);

        // Clear previous rendering
        this._clearGraphics();

        // Rebuild containers if model count changed
        const modelCount = this.multiModelTracker.getModelCount();
        if (this.mode === 'split' && this.modelContainers.size !== modelCount) {
            this._rebuildContainers();
        }

        // Render based on mode
        switch (this.mode) {
            case 'split':
                this._renderSplitMode();
                break;
            case 'differential':
                this._renderDifferentialMode();
                break;
            case 'overlay':
                this._renderOverlayMode();
                break;
        }

        // Update stats
        this.stats.renderTime = performance.now() - startTime;
        this.stats.modelsRendered = this.multiModelTracker.getModelCount();
    }

    /**
     * Clear all graphics
     * @private
     */
    _clearGraphics() {
        if (this._fallbackMode) return;

        for (const container of this.modelContainers.values()) {
            container.graphics.clear();
        }
        this.differentialGraphics?.clear();
        for (const graphics of this.overlayGraphics.values()) {
            graphics.clear();
        }
        if (this.labelsContainer) {
            this.labelsContainer.removeChildren();
        }
    }

    /**
     * Render split mode
     * @private
     */
    _renderSplitMode() {
        if (this._fallbackMode) return;

        const models = this.multiModelTracker.getAllModels();
        let totalCells = 0;

        models.forEach(model => {
            const containerData = this.modelContainers.get(model.id);
            if (!containerData) return;

            const { graphics, bounds } = containerData;
            const cells = this.multiModelTracker.getModelActivity(model.id);

            cells.forEach(cell => {
                // Map absolute coordinates to panel-relative coordinates
                const panelX = cell.x - bounds.x;
                const panelY = cell.y - bounds.y;

                // Skip if outside panel bounds
                if (panelX < 0 || panelX > bounds.width || panelY < 0 || panelY > bounds.height) {
                    return;
                }

                // Draw activity cell
                const color = model.color;
                const alpha = cell.intensity * this.options.opacity;

                graphics.beginFill(color, alpha);
                graphics.drawCircle(panelX, panelY, 6);
                graphics.endFill();

                totalCells++;
            });
        });

        this.stats.totalCellsRendered = totalCells;
    }

    /**
     * Render differential mode
     * @private
     */
    _renderDifferentialMode() {
        if (this._fallbackMode) return;

        const models = this.multiModelTracker.getAllModels();
        this.differentialCells = [];

        if (models.length < 2) {
            // Need at least 2 models for differential
            return;
        }

        // Compare first two models
        const model1 = models[0];
        const model2 = models[1];

        const differentials = this.multiModelTracker.getDifferentialActivity(model1.id, model2.id);

        differentials.forEach(diff => {
            const absDelta = Math.abs(diff.delta);
            if (absDelta < this.options.differentialThreshold) return;

            // Color based on which model is more active
            // Red = model1 higher, Blue = model2 higher
            const color = diff.delta > 0 ? 0xFF4444 : 0x4444FF;
            const intensity = Math.min(absDelta, 1.0) * this.options.opacity;

            this.differentialGraphics.beginFill(color, intensity);
            this.differentialGraphics.drawCircle(diff.x, diff.y, 8);
            this.differentialGraphics.endFill();

            // Add edge glow for significant differences
            if (absDelta > 0.3) {
                this.differentialGraphics.lineStyle(2, color, 0.5);
                this.differentialGraphics.drawCircle(diff.x, diff.y, 10);
                this.differentialGraphics.lineStyle(0, 0, 0); // Reset line style
            }

            this.differentialCells.push(diff);
        });

        // Draw legend
        this._drawDifferentialLegend();
        this.stats.totalCellsRendered = this.differentialCells.length;
    }

    /**
     * Draw differential mode legend
     * @private
     */
    _drawDifferentialLegend() {
        if (this._fallbackMode || !this.labelsContainer) return;

        const models = this.multiModelTracker.getAllModels();
        if (models.length < 2) return;

        const legendX = 20;
        const legendY = 100;

        // Background
        this.differentialGraphics.beginFill(0x0a0a1a, 0.9);
        this.differentialGraphics.lineStyle(1, 0x00FFFF, 0.3);
        this.differentialGraphics.drawRoundedRect(legendX, legendY, 200, 80, 8);
        this.differentialGraphics.endFill();

        // Title
        const title = new PIXI.Text('Differential View', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0x00FFFF
        });
        title.x = legendX + 10;
        title.y = legendY + 8;
        this.labelsContainer.addChild(title);

        // Model 1 indicator
        this.differentialGraphics.beginFill(0xFF4444, 0.8);
        this.differentialGraphics.drawCircle(legendX + 20, legendY + 35, 6);
        this.differentialGraphics.endFill();

        const label1 = new PIXI.Text(`= ${models[0].name} higher`, {
            fontFamily: 'Arial, sans-serif',
            fontSize: 10,
            fill: 0xFFAAAA
        });
        label1.x = legendX + 35;
        label1.y = legendY + 28;
        this.labelsContainer.addChild(label1);

        // Model 2 indicator
        this.differentialGraphics.beginFill(0x4444FF, 0.8);
        this.differentialGraphics.drawCircle(legendX + 20, legendY + 55, 6);
        this.differentialGraphics.endFill();

        const label2 = new PIXI.Text(`= ${models[1].name} higher`, {
            fontFamily: 'Arial, sans-serif',
            fontSize: 10,
            fill: 0xAAAAFF
        });
        label2.x = legendX + 35;
        label2.y = legendY + 48;
        this.labelsContainer.addChild(label2);
    }

    /**
     * Render overlay mode
     * @private
     */
    _renderOverlayMode() {
        if (this._fallbackMode) return;

        const models = this.multiModelTracker.getAllModels();
        let totalCells = 0;

        models.forEach(model => {
            const graphics = this.overlayGraphics.get(model.id);
            if (!graphics) return;

            const cells = this.multiModelTracker.getModelActivity(model.id);

            cells.forEach(cell => {
                const color = model.color;
                const alpha = cell.intensity * this.options.opacity * 0.5;

                graphics.beginFill(color, alpha);
                graphics.drawCircle(cell.x, cell.y, 6);
                graphics.endFill();

                // Add glow for high intensity
                if (cell.intensity > 0.7) {
                    graphics.lineStyle(1, color, 0.3);
                    graphics.drawCircle(cell.x, cell.y, 10);
                    graphics.lineStyle(0, 0, 0); // Reset
                }

                totalCells++;
            });
        });

        this.stats.totalCellsRendered = totalCells;
    }

    /**
     * Get differential cells for testing
     * @returns {Array} Array of differential cells
     */
    getDifferentialCells() {
        return this.differentialCells || [];
    }

    /**
     * Get overlay blend intensity at a point
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @returns {number} Combined intensity (0-1)
     */
    getOverlayBlendIntensity(x, y) {
        const models = this.multiModelTracker.getAllModels();
        let totalIntensity = 0;

        models.forEach(model => {
            const intensity = this.multiModelTracker.getModelActivityAt(model.id, x, y);
            totalIntensity += intensity;
        });

        return Math.min(totalIntensity, 1.0);
    }

    /**
     * Get number of models being rendered
     * @returns {number} Model count
     */
    getModelRenderCount() {
        return this.multiModelTracker.getModelCount();
    }

    /**
     * Get current statistics
     * @returns {Object} Statistics
     */
    getStats() {
        return { ...this.stats };
    }

    /**
     * Clear all visualization
     */
    clear() {
        this._clearGraphics();
        this.multiModelTracker.clear();
    }

    /**
     * Destroy heatmap and release resources
     */
    destroy() {
        this.clear();
        this.modelContainers.clear();
        this.overlayGraphics.clear();

        if (this.container.parent) {
            this.container.parent.removeChild(this.container);
        }
        if (typeof this.container.destroy === 'function') {
            this.container.destroy();
        }

        console.log('[ComparativeHeatmap] Destroyed');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.ComparativeHeatmap = ComparativeHeatmap;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { ComparativeHeatmap };
}
