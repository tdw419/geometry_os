/**
 * Multi-Model Comparison View
 *
 * Neural Heatmap Phase 2.2: Compare analytics data across multiple models
 * with side-by-side views, synchronized navigation, and comparison metrics.
 *
 * Features:
 * - Split-view layout (horizontal/vertical)
 * - Compare up to 4 models simultaneously
 * - Correlation similarity scoring
 * - Temporal pattern overlap analysis
 * - Visual overlays and difference highlighting
 * - Synchronized scrolling and time navigation
 */

class MultiModelComparisonView {
    constructor(options = {}) {
        this.options = {
            width: options.width || 1200,
            height: options.height || 600,
            position: options.position || { x: 0, y: 0 },
            maxModels: options.maxModels || 4,
            splitDirection: options.splitDirection || 'horizontal', // 'horizontal' or 'vertical'
            showMetrics: options.showMetrics !== false,
            enableSync: options.enableSync !== false,
            ...options
        };

        this.models = new Map(); // modelId -> model data
        this.views = new Map();  // modelId -> view container
        this.metrics = new Map(); // modelId -> metrics
        this.comparisonData = null;

        // PixiJS container
        this.container = new PIXI.Container();
        this.container.x = this.options.position.x;
        this.container.y = this.options.position.y;

        // Background
        this.background = new PIXI.Graphics();
        this.container.addChild(this.background);

        // Split view containers
        this.splitContainers = [];
        this.splitRatios = [];

        // Comparison overlay
        this.overlayContainer = new PIXI.Container();
        this.container.addChild(this.overlayContainer);

        // Metrics panel
        this.metricsPanel = null;

        // Sync state
        this.syncState = {
            scrollPosition: 0,
            timeWindow: null,
            zoomLevel: 1.0
        };

        // Interaction state
        this.isDragging = false;
        this.dragStart = { x: 0, y: 0 };
        this.splitHandle = null;

        console.log('[MultiModelComparisonView] Initialized');
    }

    /**
     * Create the view
     */
    create() {
        this._drawBackground();
        this._createSplitContainers();
        this._createSplitHandle();
        this._createMetricsPanel();
        this._createControls();

        console.log('[MultiModelComparisonView] View created');
        return this.container;
    }

    /**
     * Draw background
     */
    _drawBackground() {
        this.background.beginFill(0x1a1a2e, 0.95);
        this.background.drawRoundedRect(0, 0, this.options.width, this.options.height, 8);
        this.background.endFill();

        // Border
        this.background.lineStyle(2, 0x4D96FF, 0.5);
        this.background.drawRoundedRect(0, 0, this.options.width, this.options.height, 8);
    }

    /**
     * Create split containers for model views
     */
    _createSplitContainers() {
        const numSplits = Math.min(this.models.size || 2, this.options.maxModels);
        const isHorizontal = this.options.splitDirection === 'horizontal';

        for (let i = 0; i < this.options.maxModels; i++) {
            const container = new PIXI.Container();
            container.visible = false; // Hidden until model added

            // Placeholder background
            const placeholder = new PIXI.Graphics();
            placeholder.beginFill(0x2C2C54, 0.5);
            placeholder.drawRoundedRect(0, 0, 100, 100, 4);
            placeholder.endFill();

            // Placeholder text
            const text = new PIXI.Text(`Model ${i + 1}\nDrop to add`, {
                fontFamily: 'Arial',
                fontSize: 14,
                fill: 0x888888,
                align: 'center'
            });
            text.anchor.set(0.5);
            text.x = 50;
            text.y = 50;

            container.addChild(placeholder);
            container.addChild(text);

            this.splitContainers.push(container);
            this.container.addChild(container);
            this.views.set(i, container);

            // Initialize split ratio (equal distribution)
            this.splitRatios.push(1 / this.options.maxModels);
        }

        this._updateSplitLayout();
    }

    /**
     * Update split layout based on direction and ratios
     */
    _updateSplitLayout() {
        const isHorizontal = this.options.splitDirection === 'horizontal';
        let offset = 0;
        const padding = 10;
        const availableSize = isHorizontal ?
            this.options.width - padding * (this.splitContainers.length + 1) :
            this.options.height - padding * (this.splitContainers.length + 1);

        this.splitContainers.forEach((container, index) => {
            if (!container.visible) {
                container.width = 0;
                container.height = 0;
                return;
            }

            const size = availableSize * this.splitRatios[index];

            if (isHorizontal) {
                container.x = offset + padding;
                container.y = padding;
                const height = this.options.height - padding * 2 - (this.options.showMetrics ? 100 : 0);
                container.height = height;
                container.width = size;
            } else {
                container.x = padding;
                container.y = offset + padding;
                const width = this.options.width - padding * 2;
                container.width = width;
                container.height = size;
            }

            offset += size + padding;
        });
    }

    /**
     * Create draggable split handle
     */
    _createSplitHandle() {
        this.splitHandle = new PIXI.Graphics();
        this.splitHandle.eventMode = 'static';
        this.splitHandle.cursor = 'grab';

        // Draw handle (will be positioned based on split direction)
        const isHorizontal = this.options.splitDirection === 'horizontal';
        const handleSize = isHorizontal ? 6 : 100;
        const handleLength = isHorizontal ? 100 : 6;

        this.splitHandle.beginFill(0x4D96FF, 0.8);
        this.splitHandle.drawRoundedRect(0, 0, handleSize, handleLength, 3);
        this.splitHandle.endFill();

        // Interaction events
        this.splitHandle.on('pointerdown', this._onSplitHandleDown.bind(this));
        this.splitHandle.on('pointermove', this._onSplitHandleMove.bind(this));
        this.splitHandle.on('pointerup', this._onSplitHandleUp.bind(this));
        this.splitHandle.on('pointerupoutside', this._onSplitHandleUp.bind(this));

        this.container.addChild(this.splitHandle);
    }

    /**
     * Handle split handle drag start
     */
    _onSplitHandleDown(event) {
        this.isDragging = true;
        this.dragStart = { x: event.global.x, y: event.global.y };
        this.splitHandle.cursor = 'grabbing';
        this.splitHandle.alpha = 1;
    }

    /**
     * Handle split handle drag
     */
    _onSplitHandleMove(event) {
        if (!this.isDragging) return;

        const dx = event.global.x - this.dragStart.x;
        const dy = event.global.y - this.dragStart.y;

        // Adjust split ratios based on drag
        const delta = this.options.splitDirection === 'horizontal' ? dx : dy;
        const containerSize = this.options.splitDirection === 'horizontal' ?
            this.options.width : this.options.height;

        // Find adjacent containers and adjust their ratios
        for (let i = 0; i < this.splitRatios.length - 1; i++) {
            const ratioDelta = delta / containerSize;
            this.splitRatios[i] = Math.max(0.1, Math.min(0.9, this.splitRatios[i] + ratioDelta));
            this.splitRatios[i + 1] = Math.max(0.1, Math.min(0.9, this.splitRatios[i + 1] - ratioDelta));
        }

        this._updateSplitLayout();
        this.dragStart = { x: event.global.x, y: event.global.y };
    }

    /**
     * Handle split handle drag end
     */
    _onSplitHandleUp() {
        this.isDragging = false;
        this.splitHandle.cursor = 'grab';
        this.splitHandle.alpha = 0.8;
    }

    /**
     * Create metrics panel
     */
    _createMetricsPanel() {
        if (!this.options.showMetrics) return;

        this.metricsPanel = new PIXI.Container();
        this.metricsPanel.y = this.options.height - 100;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x0a0a1a, 0.9);
        bg.drawRoundedRect(0, 0, this.options.width, 90, 4);
        bg.endFill();
        this.metricsPanel.addChild(bg);

        // Metrics title
        const title = new PIXI.Text('Comparison Metrics', {
            fontFamily: 'Arial',
            fontSize: 12,
            fill: 0x4D96FF,
            fontWeight: 'bold'
        });
        title.x = 10;
        title.y = 5;
        this.metricsPanel.addChild(title);

        this.metricsText = new PIXI.Text('', {
            fontFamily: 'Monaco',
            fontSize: 10,
            fill: 0xFFFFFF,
            lineHeight: 14
        });
        this.metricsText.x = 10;
        this.metricsText.y = 25;
        this.metricsPanel.addChild(this.metricsText);

        this.container.addChild(this.metricsPanel);
    }

    /**
     * Create view controls
     */
    _createControls() {
        const controls = new PIXI.Container();
        controls.x = this.options.width - 150;
        controls.y = 10;

        // Direction toggle button
        const dirBtn = this._createButton('Toggle View', () => {
            this.options.splitDirection = this.options.splitDirection === 'horizontal' ? 'vertical' : 'horizontal';
            this._updateSplitLayout();
        });
        dirBtn.x = 0;
        dirBtn.y = 0;
        controls.addChild(dirBtn);

        // Compare mode button
        const compareBtn = this._createButton('Diff Mode', () => {
            this._toggleDifferenceMode();
        });
        compareBtn.x = 70;
        compareBtn.y = 0;
        controls.addChild(compareBtn);

        this.container.addChild(controls);
    }

    /**
     * Create a button
     */
    _createButton(label, callback) {
        const button = new PIXI.Container();
        button.eventMode = 'static';
        button.cursor = 'pointer';

        const bg = new PIXI.Graphics();
        bg.beginFill(0x4D96FF, 0.8);
        bg.drawRoundedRect(0, 0, 60, 24, 4);
        bg.endFill();
        button.addChild(bg);

        const text = new PIXI.Text(label, {
            fontFamily: 'Arial',
            fontSize: 10,
            fill: 0xFFFFFF
        });
        text.anchor.set(0.5);
        text.x = 30;
        text.y = 12;
        button.addChild(text);

        button.on('pointerdown', () => {
            bg.alpha = 0.6;
            callback();
        });
        button.on('pointerup', () => bg.alpha = 0.8);
        button.on('pointerupoutside', () => bg.alpha = 0.8);

        return button;
    }

    /**
     * Add a model to comparison
     */
    addModel(modelId, modelData, viewIndex = null) {
        if (this.models.size >= this.options.maxModels) {
            console.warn('[MultiModelComparisonView] Max models reached');
            return false;
        }

        if (this.models.has(modelId)) {
            console.warn(`[MultiModelComparisonView] Model ${modelId} already added`);
            return false;
        }

        // Find available slot
        const index = viewIndex !== null ? viewIndex :
            Array.from(this.views.keys()).find(i => !this.models.has(Array.from(this.models.keys())[i])) || 0;

        this.models.set(modelId, {
            id: modelId,
            data: modelData,
            index: index
        });

        // Show container
        const container = this.splitContainers[index];
        if (container) {
            container.visible = true;
            container.removeChildren(); // Remove placeholder

            // Add model-specific visualization
            this._createModelView(container, modelId, modelData);
        }

        this._updateComparisonMetrics();
        this._updateSplitLayout();

        console.log(`[MultiModelComparisonView] Added model ${modelId}`);
        return true;
    }

    /**
     * Create view for a single model
     */
    _createModelView(container, modelId, modelData) {
        // Add label
        const label = new PIXI.Text(modelId, {
            fontFamily: 'Arial',
            fontSize: 12,
            fill: 0x4D96FF,
            fontWeight: 'bold'
        });
        label.x = 10;
        label.y = 10;
        container.addChild(label);

        // Create correlation matrix visualization if data available
        if (modelData.correlationMatrix) {
            this._renderCorrelationMiniMap(container, modelData.correlationMatrix, 10, 30, 80);
        }

        // Create temporal visualization if data available
        if (modelData.temporalPatterns) {
            this._renderTemporalMiniChart(container, modelData.temporalPatterns, 100, 30, 100);
        }
    }

    /**
     * Render mini correlation matrix
     */
    _renderCorrelationMiniMap(container, matrix, x, y, size) {
        const cellSize = size / matrix.length;

        for (let i = 0; i < matrix.length; i++) {
            for (let j = 0; j < matrix[i].length; j++) {
                const value = matrix[i][j];
                const color = this._correlationToColor(value);

                const cell = new PIXI.Graphics();
                cell.beginFill(color);
                cell.drawRect(x + j * cellSize, y + i * cellSize, cellSize - 1, cellSize - 1);
                cell.endFill();
                container.addChild(cell);
            }
        }
    }

    /**
     * Render mini temporal chart
     */
    _renderTemporalMiniChart(container, patterns, x, y, width) {
        const height = 50;

        // Background
        const bg = new PIXI.Graphics();
        bg.lineStyle(1, 0x404040);
        bg.drawRect(x, y, width, height);
        container.addChild(bg);

        // Draw temporal line if data available
        if (patterns.timeWindows && patterns.timeWindows.length > 0) {
            const line = new PIXI.Graphics();
            line.lineStyle(1, 0xFF6B6B);

            const stepX = width / patterns.timeWindows.length;
            patterns.timeWindows.forEach((window, i) => {
                const px = x + i * stepX;
                const py = y + height - (window.avg || 0) * height;
                if (i === 0) {
                    line.moveTo(px, py);
                } else {
                    line.lineTo(px, py);
                }
            });
            container.addChild(line);
        }
    }

    /**
     * Remove a model from comparison
     */
    removeModel(modelId) {
        if (!this.models.has(modelId)) return false;

        const model = this.models.get(modelId);
        const container = this.splitContainers[model.index];

        if (container) {
            container.visible = false;
            container.removeChildren();
            // Add back placeholder
            this._addPlaceholder(container);
        }

        this.models.delete(modelId);
        this.metrics.delete(modelId);

        this._updateComparisonMetrics();
        this._updateSplitLayout();

        console.log(`[MultiModelComparisonView] Removed model ${modelId}`);
        return true;
    }

    /**
     * Add placeholder to empty container
     */
    _addPlaceholder(container) {
        const placeholder = new PIXI.Graphics();
        placeholder.beginFill(0x2C2C54, 0.5);
        placeholder.drawRoundedRect(0, 0, container.width || 100, container.height || 100, 4);
        placeholder.endFill();

        const text = new PIXI.Text('Drop model here', {
            fontFamily: 'Arial',
            fontSize: 12,
            fill: 0x888888,
            align: 'center'
        });
        text.anchor.set(0.5);
        text.x = (container.width || 100) / 2;
        text.y = (container.height || 100) / 2;

        container.addChild(placeholder);
        container.addChild(text);
    }

    /**
     * Update comparison metrics
     */
    _updateComparisonMetrics() {
        const modelIds = Array.from(this.models.keys());

        if (modelIds.length < 2) {
            this.metricsText.text = 'Add at least 2 models to see comparison metrics';
            return;
        }

        let metrics = '';

        // Compute correlation similarity
        if (modelIds.length >= 2) {
            const model1 = this.models.get(modelIds[0]);
            const model2 = this.models.get(modelIds[1]);

            if (model1.data.correlationMatrix && model2.data.correlationMatrix) {
                const similarity = this._computeMatrixSimilarity(
                    model1.data.correlationMatrix,
                    model2.data.correlationMatrix
                );
                metrics += `Correlation Similarity (${modelIds[0]} vs ${modelIds[1]}): ${(similarity * 100).toFixed(1)}%\n`;
            }
        }

        // Compute temporal pattern overlap
        const overlaps = this._computeTemporalOverlaps();
        overlaps.forEach(overlap => {
            metrics += `Temporal Overlap (${overlap.pair}): ${(overlap.score * 100).toFixed(1)}%\n`;
        });

        this.metricsText.text = metrics || 'No comparison data available';
    }

    /**
     * Compute similarity between two correlation matrices
     */
    _computeMatrixSimilarity(matrix1, matrix2) {
        if (matrix1.length !== matrix2.length) return 0;

        let totalDiff = 0;
        let count = 0;

        for (let i = 0; i < matrix1.length; i++) {
            if (!matrix2[i]) continue;
            for (let j = 0; j < matrix1[i].length; j++) {
                if (matrix2[i][j] === undefined) continue;
                totalDiff += Math.abs(matrix1[i][j] - (matrix2[i][j] || 0));
                count++;
            }
        }

        if (count === 0) return 0;
        const avgDiff = totalDiff / count;
        return Math.max(0, 1 - avgDiff); // Similarity decreases with difference
    }

    /**
     * Compute temporal pattern overlaps
     */
    _computeTemporalOverlaps() {
        const modelIds = Array.from(this.models.keys());
        const overlaps = [];

        for (let i = 0; i < modelIds.length; i++) {
            for (let j = i + 1; j < modelIds.length; j++) {
                const model1 = this.models.get(modelIds[i]);
                const model2 = this.models.get(modelIds[j]);

                if (model1.data.temporalPatterns && model2.data.temporalPatterns) {
                    const score = this._computeTemporalOverlap(
                        model1.data.temporalPatterns,
                        model2.data.temporalPatterns
                    );
                    overlaps.push({
                        pair: `${modelIds[i]} vs ${modelIds[j]}`,
                        score: score
                    });
                }
            }
        }

        return overlaps;
    }

    /**
     * Compute overlap between temporal patterns
     */
    _computeTemporalOverlap(patterns1, patterns2) {
        // Simple overlap based on time windows
        if (!patterns1.timeWindows || !patterns2.timeWindows) return 0;

        const windows1 = patterns1.timeWindows;
        const windows2 = patterns2.timeWindows;

        // Find matching windows and compare averages
        let matchCount = 0;
        let totalDiff = 0;

        const minLen = Math.min(windows1.length, windows2.length);
        for (let i = 0; i < minLen; i++) {
            const avg1 = windows1[i]?.avg || 0;
            const avg2 = windows2[i]?.avg || 0;
            totalDiff += Math.abs(avg1 - avg2);
            matchCount++;
        }

        if (matchCount === 0) return 0;
        const avgDiff = totalDiff / matchCount;
        return Math.max(0, 1 - avgDiff);
    }

    /**
     * Toggle difference overlay mode
     */
    _toggleDifferenceMode() {
        // Toggle visual difference highlighting between models
        this.overlayContainer.visible = !this.overlayContainer.visible;
        console.log('[MultiModelComparisonView] Difference mode:', this.overlayContainer.visible);
    }

    /**
     * Convert correlation value to color
     */
    _correlationToColor(value) {
        // Clamp value to [-1, 1]
        value = Math.max(-1, Math.min(1, value));

        if (value > 0) {
            // Red scale for positive
            const intensity = Math.floor(value * 255);
            return (intensity << 16) | (0 << 8) | (0 << 0); // Red
        } else {
            // Blue scale for negative
            const intensity = Math.floor(-value * 255);
            return (0 << 16) | (0 << 8) | (intensity << 0); // Blue
        }
    }

    /**
     * Get comparison data
     */
    getComparisonData() {
        return {
            models: Array.from(this.models.values()),
            metrics: Array.from(this.metrics.values()),
            comparisonData: this.comparisonData
        };
    }

    /**
     * Export comparison as JSON
     */
    exportComparison() {
        const data = this.getComparisonData();
        return JSON.stringify(data, null, 2);
    }

    /**
     * Clear all models
     */
    clear() {
        this.models.forEach((model, modelId) => {
            this.removeModel(modelId);
        });
        console.log('[MultiModelComparisonView] Cleared all models');
    }

    /**
     * Destroy the view
     */
    destroy() {
        this.clear();
        this.container.destroy();
        console.log('[MultiModelComparisonView] Destroyed');
    }
}

// Auto-export for browser
if (typeof window !== 'undefined') {
    window.MultiModelComparisonView = MultiModelComparisonView;
}

// Export for Node.js
if (typeof module !== 'undefined' && module.exports) {
    module.exports = MultiModelComparisonView;
}
