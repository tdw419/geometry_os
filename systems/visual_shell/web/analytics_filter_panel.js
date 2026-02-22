/**
 * AnalyticsFilterPanel - Advanced Filtering for Neural Heatmap Analytics
 *
 * Provides a collapsible filter panel with controls for:
 * - Layer ID filtering
 * - Correlation range filtering
 * - Time window filtering
 * - Anomaly score filtering
 * - Quick presets and save/load configurations
 *
 * Part of: Neural Heatmap Phase 2.2 - Advanced Filtering
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2.2-advanced-filtering.md
 *
 * @class AnalyticsFilterPanel
 */

class AnalyticsFilterPanel {
    /**
     * Create a new AnalyticsFilterPanel
     * @param {Object} config - Configuration options
     * @param {NeuralHeatmapOverlay} config.heatmapOverlay - NeuralHeatmapOverlay instance (required)
     * @param {PIXI.Container} config.container - Parent PixiJS container for UI (required)
     * @param {Object} config.position - Position {x, y} for panel (default: {x: 20, y: 80})
     * @param {number} config.width - Panel width (default: 280)
     * @param {boolean} config.startCollapsed - Start collapsed (default: false)
     * @param {boolean} config.enabled - Start enabled (default: true)
     */
    constructor(config = {}) {
        if (!config.heatmapOverlay) {
            throw new Error('AnalyticsFilterPanel requires heatmapOverlay in config');
        }
        if (!config.container && typeof PIXI === 'undefined') {
            throw new Error('AnalyticsFilterPanel requires config.container or PIXI.Container');
        }

        this.heatmapOverlay = config.heatmapOverlay;
        this.container = config.container;

        this.config = {
            position: { x: 20, y: 80 },
            width: 280,
            startCollapsed: false,
            enabled: true,
            panelColor: 0x1a1a2e,
            borderColor: 0x00FFFF,
            textColor: 0xffffff,
            accentColor: 0x4488ff,
            ...config
        };

        // UI State
        this.panelContainer = null;
        this.isCollapsed = this.config.startCollapsed;
        this.isDragging = false;
        this.dragOffset = { x: 0, y: 0 };

        // Filter State
        this.activeFilters = {
            layerIds: [],
            correlationRange: { min: -1, max: 1 },
            timeWindow: { start: null, end: null },
            anomalyScore: { min: 0, max: 1 }
        };

        // Saved configurations
        this.savedConfigs = this._loadSavedConfigs();

        // Presets
        this.presets = this._createPresets();

        // UI Components
        this.panelBackground = null;
        this.headerBar = null;
        this.contentArea = null;
        this.filterControls = {};
        this.activeIndicator = null;

        console.log('[AnalyticsFilterPanel] Initialized');
    }

    /**
     * Create the filter panel UI
     * @returns {PIXI.Container} Panel container
     */
    create() {
        if (typeof PIXI === 'undefined') {
            console.warn('[AnalyticsFilterPanel] PIXI not available, using DOM fallback');
            return this._createDOMPanel();
        }

        // Create main container
        this.panelContainer = new PIXI.Container();
        this.panelContainer.x = this.config.position.x;
        this.panelContainer.y = this.config.position.y;
        this.panelContainer.eventMode = 'static';

        // Create panel background
        this._createPanelBackground();

        // Create header bar
        this._createHeaderBar();

        // Create content area
        this._createContentArea();

        // Create active filter indicator
        this._createActiveIndicator();

        // Apply initial collapse state
        if (this.isCollapsed) {
            this._collapsePanel();
        }

        console.log('[AnalyticsFilterPanel] Panel created');

        return this.panelContainer;
    }

    /**
     * Create panel background
     * @private
     */
    _createPanelBackground() {
        this.panelBackground = new PIXI.Graphics();
        this._updatePanelBackground();
        this.panelContainer.addChild(this.panelBackground);
    }

    /**
     * Update panel background based on state
     * @private
     */
    _updatePanelBackground() {
        if (!this.panelBackground) return;

        const width = this.config.width;
        const height = this.isCollapsed ? 40 : 500;

        this.panelBackground.clear();
        this.panelBackground.beginFill(this.config.panelColor, 0.95);
        this.panelBackground.drawRoundedRect(0, 0, width, height, 8);
        this.panelBackground.endFill();

        // Border
        this.panelBackground.lineStyle(2, this.config.borderColor, 0.8);
        this.panelBackground.drawRoundedRect(0, 0, width, height, 8);

        // Shadow effect
        this.panelBackground.beginFill(0x000000, 0.3);
        this.panelBackground.drawRoundedRect(3, 3, width, height, 8);
        this.panelBackground.endFill();
    }

    /**
     * Create header bar with title and collapse button
     * @private
     */
    _createHeaderBar() {
        this.headerBar = new PIXI.Container();
        this.headerBar.y = 0;
        this.headerBar.eventMode = 'static';
        this.panelContainer.addChild(this.headerBar);

        // Header background
        const headerBg = new PIXI.Graphics();
        headerBg.beginFill(0x0a0a1a, 0.9);
        headerBg.drawRoundedRect(0, 0, this.config.width, 40, 8);
        headerBg.endFill();
        this.headerBar.addChild(headerBg);

        // Title
        const title = new PIXI.Text('🔍 Analytics Filters', {
            fontSize: 14,
            fontWeight: 'bold',
            fill: this.config.textColor,
            fontFamily: 'Courier New, monospace'
        });
        title.x = 45;
        title.y = 12;
        this.headerBar.addChild(title);

        // Collapse button
        const collapseBtn = this._createCollapseButton();
        collapseBtn.x = this.config.width - 35;
        collapseBtn.y = 10;
        collapseBtn.on('pointerdown', () => this._toggleCollapse());
        this.headerBar.addChild(collapseBtn);
        this.filterControls.collapseButton = collapseBtn;

        // Make header draggable
        this._makeDraggable();
    }

    /**
     * Create collapse button
     * @private
     */
    _createCollapseButton() {
        const button = new PIXI.Container();
        button.eventMode = 'static';
        button.cursor = 'pointer';

        const bg = new PIXI.Graphics();
        bg.beginFill(0x222233, 0.9);
        bg.drawCircle(10, 10, 12);
        bg.endFill();
        bg.lineStyle(1, this.config.borderColor, 0.6);
        bg.drawCircle(10, 10, 12);
        button.addChild(bg);

        const icon = new PIXI.Text(this.isCollapsed ? '+' : '−', {
            fontSize: 16,
            fontWeight: 'bold',
            fill: this.config.textColor,
            fontFamily: 'Arial, sans-serif'
        });
        icon.anchor.set(0.5);
        icon.x = 10;
        icon.y = 10;
        button.addChild(icon);
        button.iconText = icon;

        // Hover effect
        button.on('pointerover', () => {
            bg.clear();
            bg.beginFill(this.config.accentColor, 0.4);
            bg.drawCircle(10, 10, 12);
            bg.endFill();
        });

        button.on('pointerout', () => {
            bg.clear();
            bg.beginFill(0x222233, 0.9);
            bg.drawCircle(10, 10, 12);
            bg.endFill();
            bg.lineStyle(1, this.config.borderColor, 0.6);
            bg.drawCircle(10, 10, 12);
        });

        return button;
    }

    /**
     * Create content area with filter controls
     * @private
     */
    _createContentArea() {
        this.contentArea = new PIXI.Container();
        this.contentArea.y = 50;
        this.panelContainer.addChild(this.contentArea);

        let yPos = 0;

        // Layer ID Filter
        yPos += this._createLayerIdFilter(yPos);

        // Correlation Range Filter
        yPos += this._createCorrelationRangeFilter(yPos);

        // Time Window Filter
        yPos += this._createTimeWindowFilter(yPos);

        // Anomaly Score Filter
        yPos += this._createAnomalyScoreFilter(yPos);

        // Presets Section
        yPos += this._createPresetsSection(yPos);

        // Save/Load Section
        yPos += this._createSaveLoadSection(yPos);

        // Apply/Reset Buttons
        yPos += this._createActionButtons(yPos);
    }

    /**
     * Create layer ID filter
     * @private
     */
    _createLayerIdFilter(yPos) {
        const section = new PIXI.Container();
        section.y = yPos;
        this.contentArea.addChild(section);

        // Label
        const label = new PIXI.Text('Layer IDs:', {
            fontSize: 11,
            fontWeight: 'bold',
            fill: this.config.textColor,
            fontFamily: 'Courier New, monospace'
        });
        label.x = 10;
        label.y = 0;
        section.addChild(label);

        // Input field (simplified as a button for PIXI)
        const inputBg = new PIXI.Graphics();
        inputBg.beginFill(0x0a0a1a, 0.8);
        inputBg.drawRoundedRect(10, 20, this.config.width - 60, 28, 4);
        inputBg.endFill();
        inputBg.lineStyle(1, 0x444444, 0.5);
        inputBg.drawRoundedRect(10, 20, this.config.width - 60, 28, 4);
        section.addChild(inputBg);

        const inputText = new PIXI.Text('e.g., 0-10, 15, 20-25', {
            fontSize: 10,
            fill: 0x888888,
            fontFamily: 'Courier New, monospace'
        });
        inputText.x = 15;
        inputText.y = 27;
        section.addChild(inputText);
        this.filterControls.layerIdInput = inputText;

        // Clear button
        const clearBtn = this._createSmallButton('×', 0xff4444);
        clearBtn.x = this.config.width - 45;
        clearBtn.y = 24;
        clearBtn.on('pointerdown', () => this._clearLayerFilter());
        section.addChild(clearBtn);

        return 60;
    }

    /**
     * Create correlation range filter
     * @private
     */
    _createCorrelationRangeFilter(yPos) {
        const section = new PIXI.Container();
        section.y = yPos;
        this.contentArea.addChild(section);

        // Label
        const label = new PIXI.Text('Correlation Range:', {
            fontSize: 11,
            fontWeight: 'bold',
            fill: this.config.textColor,
            fontFamily: 'Courier New, monospace'
        });
        label.x = 10;
        label.y = 0;
        section.addChild(label);

        // Range display
        const rangeText = new PIXI.Text(`${this.activeFilters.correlationRange.min} to ${this.activeFilters.correlationRange.max}`, {
            fontSize: 10,
            fill: 0x88ccff,
            fontFamily: 'Courier New, monospace'
        });
        rangeText.x = 10;
        rangeText.y = 20;
        section.addChild(rangeText);
        this.filterControls.correlationRangeText = rangeText;

        // Slider visualization
        const sliderBg = new PIXI.Graphics();
        sliderBg.beginFill(0x0a0a1a, 0.8);
        sliderBg.drawRoundedRect(10, 38, this.config.width - 20, 8, 2);
        sliderBg.endFill();
        section.addChild(sliderBg);

        // Range bar
        const rangeBar = new PIXI.Graphics();
        rangeBar.beginFill(this.config.accentColor, 0.7);
        rangeBar.drawRoundedRect(10, 38, this.config.width - 20, 8, 2);
        rangeBar.endFill();
        section.addChild(rangeBar);
        this.filterControls.correlationRangeBar = rangeBar;

        return 60;
    }

    /**
     * Create time window filter
     * @private
     */
    _createTimeWindowFilter(yPos) {
        const section = new PIXI.Container();
        section.y = yPos;
        this.contentArea.addChild(section);

        // Label
        const label = new PIXI.Text('Time Window:', {
            fontSize: 11,
            fontWeight: 'bold',
            fill: this.config.textColor,
            fontFamily: 'Courier New, monospace'
        });
        label.x = 10;
        label.y = 0;
        section.addChild(label);

        // Quick time buttons
        const timeButtons = [
            { label: '1m', duration: 60 },
            { label: '5m', duration: 300 },
            { label: '15m', duration: 900 },
            { label: '1h', duration: 3600 }
        ];

        let xPos = 10;
        timeButtons.forEach(btn => {
            const button = this._createSmallButton(btn.label, this.config.accentColor);
            button.x = xPos;
            button.y = 20;
            button.on('pointerdown', () => this._setTimeWindow(btn.duration));
            section.addChild(button);
            xPos += 45;
        });

        // Clear button
        const clearBtn = this._createSmallButton('×', 0xff4444);
        clearBtn.x = this.config.width - 35;
        clearBtn.y = 20;
        clearBtn.on('pointerdown', () => this._clearTimeWindow());
        section.addChild(clearBtn);

        return 55;
    }

    /**
     * Create anomaly score filter
     * @private
     */
    _createAnomalyScoreFilter(yPos) {
        const section = new PIXI.Container();
        section.y = yPos;
        this.contentArea.addChild(section);

        // Label
        const label = new PIXI.Text('Min Anomaly Score:', {
            fontSize: 11,
            fontWeight: 'bold',
            fill: this.config.textColor,
            fontFamily: 'Courier New, monospace'
        });
        label.x = 10;
        label.y = 0;
        section.addChild(label);

        // Score display
        const scoreText = new PIXI.Text(`≥ ${this.activeFilters.anomalyScore.min}`, {
            fontSize: 10,
            fill: 0xff8844,
            fontFamily: 'Courier New, monospace'
        });
        scoreText.x = 10;
        scoreText.y = 20;
        section.addChild(scoreText);
        this.filterControls.anomalyScoreText = scoreText;

        // Slider bar
        const sliderBg = new PIXI.Graphics();
        sliderBg.beginFill(0x0a0a1a, 0.8);
        sliderBg.drawRoundedRect(10, 38, this.config.width - 20, 8, 2);
        sliderBg.endFill();
        section.addChild(sliderBg);

        // Threshold indicator
        const thresholdBar = new PIXI.Graphics();
        thresholdBar.beginFill(0xff8844, 0.7);
        thresholdBar.drawRoundedRect(10, 38, (this.config.width - 20) * this.activeFilters.anomalyScore.min, 8, 2);
        thresholdBar.endFill();
        section.addChild(thresholdBar);
        this.filterControls.anomalyThresholdBar = thresholdBar;

        // Increment/decrement buttons
        const incBtn = this._createSmallButton('+', 0x44ff44);
        incBtn.x = this.config.width - 55;
        incBtn.y = 20;
        incBtn.on('pointerdown', () => this._adjustAnomalyThreshold(0.1));
        section.addChild(incBtn);

        const decBtn = this._createSmallButton('−', 0xff4444);
        decBtn.x = this.config.width - 85;
        decBtn.y = 20;
        decBtn.on('pointerdown', () => this._adjustAnomalyThreshold(-0.1));
        section.addChild(decBtn);

        return 60;
    }

    /**
     * Create presets section
     * @private
     */
    _createPresetsSection(yPos) {
        const section = new PIXI.Container();
        section.y = yPos;
        this.contentArea.addChild(section);

        // Label
        const label = new PIXI.Text('Quick Presets:', {
            fontSize: 11,
            fontWeight: 'bold',
            fill: this.config.textColor,
            fontFamily: 'Courier New, monospace'
        });
        label.x = 10;
        label.y = 0;
        section.addChild(label);

        // Preset buttons
        let xPos = 10;
        this.presets.forEach(preset => {
            const button = this._createPresetButton(preset.name, preset.color);
            button.x = xPos;
            button.y = 20;
            button.on('pointerdown', () => this._applyPreset(preset));
            section.addChild(button);
            xPos += 65;
        });

        return 50;
    }

    /**
     * Create save/load section
     * @private
     */
    _createSaveLoadSection(yPos) {
        const section = new PIXI.Container();
        section.y = yPos;
        this.contentArea.addChild(section);

        // Label
        const label = new PIXI.Text('Saved Configs:', {
            fontSize: 11,
            fontWeight: 'bold',
            fill: this.config.textColor,
            fontFamily: 'Courier New, monospace'
        });
        label.x = 10;
        label.y = 0;
        section.addChild(label);

        // Save button
        const saveBtn = this._createSmallButton('💾 Save', 0x44ff88);
        saveBtn.x = 10;
        saveBtn.y = 20;
        saveBtn.on('pointerdown', () => this._saveConfig());
        section.addChild(saveBtn);

        // Load dropdown (simplified)
        const loadBtn = this._createSmallButton('📂 Load', this.config.accentColor);
        loadBtn.x = 80;
        loadBtn.y = 20;
        loadBtn.on('pointerdown', () => this._showLoadMenu());
        section.addChild(loadBtn);

        return 50;
    }

    /**
     * Create action buttons
     * @private
     */
    _createActionButtons(yPos) {
        const section = new PIXI.Container();
        section.y = yPos;
        this.contentArea.addChild(section);

        // Apply button
        const applyBtn = this._createActionButton('Apply Filters', 0x44ff88);
        applyBtn.x = 10;
        applyBtn.y = 0;
        applyBtn.on('pointerdown', () => this._applyFilters());
        section.addChild(applyBtn);
        this.filterControls.applyButton = applyBtn;

        // Reset button
        const resetBtn = this._createActionButton('Reset All', 0xff4444);
        resetBtn.x = this.config.width - 115;
        resetBtn.y = 0;
        resetBtn.on('pointerdown', () => this._resetFilters());
        section.addChild(resetBtn);
        this.filterControls.resetButton = resetBtn;

        return 40;
    }

    /**
     * Create active filter indicator
     * @private
     */
    _createActiveIndicator() {
        this.activeIndicator = new PIXI.Container();
        this.activeIndicator.x = 5;
        this.activeIndicator.y = 5;
        this.activeIndicator.visible = false;
        this.panelContainer.addChild(this.activeIndicator);

        const dot = new PIXI.Graphics();
        dot.beginFill(0xff4444, 1);
        dot.drawCircle(0, 0, 5);
        dot.endFill();
        this.activeIndicator.addChild(dot);

        // Pulse animation
        this._pulseIndicator();
    }

    /**
     * Pulse animation for active indicator
     * @private
     */
    _pulseIndicator() {
        if (!this.activeIndicator) return;

        const dot = this.activeIndicator.getChildAt(0);
        if (dot) {
            dot.alpha = dot.alpha === 1 ? 0.5 : 1;
        }

        requestAnimationFrame(() => this._pulseIndicator());
    }

    /**
     * Create a small button
     * @private
     */
    _createSmallButton(label, color) {
        const button = new PIXI.Container();
        button.eventMode = 'static';
        button.cursor = 'pointer';

        const bg = new PIXI.Graphics();
        bg.beginFill(0x1a1a2e, 0.9);
        bg.drawRoundedRect(0, 0, 35, 24, 4);
        bg.endFill();
        bg.lineStyle(1, color, 0.8);
        bg.drawRoundedRect(0, 0, 35, 24, 4);
        button.addChild(bg);
        button.buttonBg = bg;

        const text = new PIXI.Text(label, {
            fontSize: 10,
            fontWeight: 'bold',
            fill: color,
            fontFamily: 'Arial, sans-serif'
        });
        text.anchor.set(0.5);
        text.x = 17.5;
        text.y = 12;
        button.addChild(text);

        // Hover effect
        button.on('pointerover', () => {
            bg.clear();
            bg.beginFill(color, 0.3);
            bg.drawRoundedRect(0, 0, 35, 24, 4);
            bg.endFill();
            bg.lineStyle(1, color, 1);
            bg.drawRoundedRect(0, 0, 35, 24, 4);
        });

        button.on('pointerout', () => {
            bg.clear();
            bg.beginFill(0x1a1a2e, 0.9);
            bg.drawRoundedRect(0, 0, 35, 24, 4);
            bg.endFill();
            bg.lineStyle(1, color, 0.8);
            bg.drawRoundedRect(0, 0, 35, 24, 4);
        });

        return button;
    }

    /**
     * Create a preset button
     * @private
     */
    _createPresetButton(label, color) {
        const button = new PIXI.Container();
        button.eventMode = 'static';
        button.cursor = 'pointer';

        const bg = new PIXI.Graphics();
        bg.beginFill(0x1a1a2e, 0.9);
        bg.drawRoundedRect(0, 0, 60, 24, 4);
        bg.endFill();
        bg.lineStyle(1, color, 0.8);
        bg.drawRoundedRect(0, 0, 60, 24, 4);
        button.addChild(bg);
        button.buttonBg = bg;

        const text = new PIXI.Text(label, {
            fontSize: 9,
            fontWeight: 'bold',
            fill: color,
            fontFamily: 'Arial, sans-serif'
        });
        text.anchor.set(0.5);
        text.x = 30;
        text.y = 12;
        button.addChild(text);

        // Hover effect
        button.on('pointerover', () => {
            bg.clear();
            bg.beginFill(color, 0.3);
            bg.drawRoundedRect(0, 0, 60, 24, 4);
            bg.endFill();
            bg.lineStyle(1, color, 1);
            bg.drawRoundedRect(0, 0, 60, 24, 4);
        });

        button.on('pointerout', () => {
            bg.clear();
            bg.beginFill(0x1a1a2e, 0.9);
            bg.drawRoundedRect(0, 0, 60, 24, 4);
            bg.endFill();
            bg.lineStyle(1, color, 0.8);
            bg.drawRoundedRect(0, 0, 60, 24, 4);
        });

        return button;
    }

    /**
     * Create an action button
     * @private
     */
    _createActionButton(label, color) {
        const button = new PIXI.Container();
        button.eventMode = 'static';
        button.cursor = 'pointer';

        const bg = new PIXI.Graphics();
        bg.beginFill(color, 0.3);
        bg.drawRoundedRect(0, 0, 100, 30, 5);
        bg.endFill();
        bg.lineStyle(2, color, 0.9);
        bg.drawRoundedRect(0, 0, 100, 30, 5);
        button.addChild(bg);
        button.buttonBg = bg;

        const text = new PIXI.Text(label, {
            fontSize: 11,
            fontWeight: 'bold',
            fill: 0xffffff,
            fontFamily: 'Courier New, monospace'
        });
        text.anchor.set(0.5);
        text.x = 50;
        text.y = 15;
        button.addChild(text);

        // Hover effect
        button.on('pointerover', () => {
            bg.clear();
            bg.beginFill(color, 0.5);
            bg.drawRoundedRect(0, 0, 100, 30, 5);
            bg.endFill();
            bg.lineStyle(2, color, 1);
            bg.drawRoundedRect(0, 0, 100, 30, 5);
        });

        button.on('pointerout', () => {
            bg.clear();
            bg.beginFill(color, 0.3);
            bg.drawRoundedRect(0, 0, 100, 30, 5);
            bg.endFill();
            bg.lineStyle(2, color, 0.9);
            bg.drawRoundedRect(0, 0, 100, 30, 5);
        });

        return button;
    }

    /**
     * Make header draggable
     * @private
     */
    _makeDraggable() {
        this.headerBar.on('pointerdown', (event) => {
            if (event.target !== this.headerBar &&
                !this.headerBar.children.includes(event.target)) {
                return;
            }

            this.isDragging = true;
            this.dragOffset.x = event.global.x - this.panelContainer.x;
            this.dragOffset.y = event.global.y - this.panelContainer.y;
        });

        this.panelContainer.on('pointermove', (event) => {
            if (!this.isDragging) return;

            this.panelContainer.x = event.global.x - this.dragOffset.x;
            this.panelContainer.y = event.global.y - this.dragOffset.y;
        });

        this.panelContainer.on('pointerup', () => {
            this.isDragging = false;
        });

        this.panelContainer.on('pointerupoutside', () => {
            this.isDragging = false;
        });
    }

    /**
     * Toggle panel collapse state
     * @private
     */
    _toggleCollapse() {
        this.isCollapsed = !this.isCollapsed;

        if (this.isCollapsed) {
            this._collapsePanel();
        } else {
            this._expandPanel();
        }

        // Update collapse button icon
        if (this.filterControls.collapseButton && this.filterControls.collapseButton.iconText) {
            this.filterControls.collapseButton.iconText.text = this.isCollapsed ? '+' : '−';
        }
    }

    /**
     * Collapse panel
     * @private
     */
    _collapsePanel() {
        if (this.contentArea) {
            this.contentArea.visible = false;
        }
        this._updatePanelBackground();
    }

    /**
     * Expand panel
     * @private
     */
    _expandPanel() {
        if (this.contentArea) {
            this.contentArea.visible = true;
        }
        this._updatePanelBackground();
    }

    /**
     * Clear layer filter
     * @private
     */
    _clearLayerFilter() {
        this.activeFilters.layerIds = [];
        if (this.filterControls.layerIdInput) {
            this.filterControls.layerIdInput.text = 'e.g., 0-10, 15, 20-25';
            this.filterControls.layerIdInput.style.fill = 0x888888;
        }
        this._updateActiveIndicator();
    }

    /**
     * Set time window
     * @private
     */
    _setTimeWindow(duration) {
        const now = Date.now();
        this.activeFilters.timeWindow = {
            start: now - duration * 1000,
            end: now
        };
        this._updateActiveIndicator();
    }

    /**
     * Clear time window
     * @private
     */
    _clearTimeWindow() {
        this.activeFilters.timeWindow = { start: null, end: null };
        this._updateActiveIndicator();
    }

    /**
     * Adjust anomaly threshold
     * @private
     */
    _adjustAnomalyThreshold(delta) {
        this.activeFilters.anomalyScore.min = Math.max(0, Math.min(1,
            this.activeFilters.anomalyScore.min + delta));

        if (this.filterControls.anomalyScoreText) {
            this.filterControls.anomalyScoreText.text =
                `≥ ${this.activeFilters.anomalyScore.min.toFixed(1)}`;
        }

        if (this.filterControls.anomalyThresholdBar) {
            this.filterControls.anomalyThresholdBar.clear();
            this.filterControls.anomalyThresholdBar.beginFill(0xff8844, 0.7);
            this.filterControls.anomalyThresholdBar.drawRoundedRect(
                10, 38,
                (this.config.width - 20) * this.activeFilters.anomalyScore.min,
                8, 2
            );
            this.filterControls.anomalyThresholdBar.endFill();
        }

        this._updateActiveIndicator();
    }

    /**
     * Apply preset
     * @private
     */
    _applyPreset(preset) {
        this.activeFilters = { ...preset.filters };
        this._updateFilterUI();
        this._applyFilters();
        console.log(`[AnalyticsFilterPanel] Applied preset: ${preset.name}`);
    }

    /**
     * Update filter UI to match current state
     * @private
     */
    _updateFilterUI() {
        // Update layer ID display
        if (this.activeFilters.layerIds.length > 0 && this.filterControls.layerIdInput) {
            this.filterControls.layerIdInput.text = this.activeFilters.layerIds.join(', ');
            this.filterControls.layerIdInput.style.fill = 0x88ccff;
        }

        // Update correlation range display
        if (this.filterControls.correlationRangeText) {
            this.filterControls.correlationRangeText.text =
                `${this.activeFilters.correlationRange.min} to ${this.activeFilters.correlationRange.max}`;
        }

        // Update anomaly score display
        if (this.filterControls.anomalyScoreText) {
            this.filterControls.anomalyScoreText.text =
                `≥ ${this.activeFilters.anomalyScore.min.toFixed(1)}`;
        }
    }

    /**
     * Update active filter indicator
     * @private
     */
    _updateActiveIndicator() {
        if (!this.activeIndicator) return;

        const hasActiveFilters = this._hasActiveFilters();
        this.activeIndicator.visible = hasActiveFilters;
    }

    /**
     * Check if any filters are active
     * @private
     */
    _hasActiveFilters() {
        return this.activeFilters.layerIds.length > 0 ||
               this.activeFilters.timeWindow.start !== null ||
               this.activeFilters.anomalyScore.min > 0 ||
               this.activeFilters.correlationRange.min !== -1 ||
               this.activeFilters.correlationRange.max !== 1;
    }

    /**
     * Apply filters
     * @private
     */
    _applyFilters() {
        // Trigger filter application event
        if (this.heatmapOverlay && this.heatmapOverlay.applyFilters) {
            this.heatmapOverlay.applyFilters(this.activeFilters);
        }

        this._updateActiveIndicator();

        console.log('[AnalyticsFilterPanel] Filters applied:', this.activeFilters);
    }

    /**
     * Reset all filters
     * @private
     */
    _resetFilters() {
        this.activeFilters = {
            layerIds: [],
            correlationRange: { min: -1, max: 1 },
            timeWindow: { start: null, end: null },
            anomalyScore: { min: 0, max: 1 }
        };

        this._updateFilterUI();
        this._applyFilters();

        console.log('[AnalyticsFilterPanel] All filters reset');
    }

    /**
     * Save current configuration
     * @private
     */
    _saveConfig() {
        const name = prompt('Enter configuration name:');
        if (!name) return;

        const config = {
            name,
            filters: { ...this.activeFilters },
            timestamp: Date.now()
        };

        this.savedConfigs.push(config);
        this._persistSavedConfigs();

        console.log(`[AnalyticsFilterPanel] Saved configuration: ${name}`);
    }

    /**
     * Show load menu
     * @private
     */
    _showLoadMenu() {
        if (this.savedConfigs.length === 0) {
            alert('No saved configurations found.');
            return;
        }

        const menuText = this.savedConfigs.map((config, index) =>
            `${index + 1}. ${config.name}`
        ).join('\n');

        const selection = prompt(`Select configuration:\n${menuText}\nEnter number:`);

        if (selection) {
            const index = parseInt(selection) - 1;
            if (index >= 0 && index < this.savedConfigs.length) {
                this.activeFilters = { ...this.savedConfigs[index].filters };
                this._updateFilterUI();
                this._applyFilters();
                console.log(`[AnalyticsFilterPanel] Loaded: ${this.savedConfigs[index].name}`);
            }
        }
    }

    /**
     * Create default presets
     * @private
     */
    _createPresets() {
        return [
            {
                name: 'High Corr',
                color: 0x44ff88,
                filters: {
                    layerIds: [],
                    correlationRange: { min: 0.7, max: 1 },
                    timeWindow: { start: null, end: null },
                    anomalyScore: { min: 0, max: 1 }
                }
            },
            {
                name: 'Anomalies',
                color: 0xff8844,
                filters: {
                    layerIds: [],
                    correlationRange: { min: -1, max: 1 },
                    timeWindow: { start: null, end: null },
                    anomalyScore: { min: 0.7, max: 1 }
                }
            },
            {
                name: 'Recent',
                color: 0x4488ff,
                filters: {
                    layerIds: [],
                    correlationRange: { min: -1, max: 1 },
                    timeWindow: { start: Date.now() - 300000, end: Date.now() },
                    anomalyScore: { min: 0, max: 1 }
                }
            },
            {
                name: 'Critical',
                color: 0xff4444,
                filters: {
                    layerIds: [],
                    correlationRange: { min: 0.8, max: 1 },
                    timeWindow: { start: Date.now() - 300000, end: Date.now() },
                    anomalyScore: { min: 0.8, max: 1 }
                }
            }
        ];
    }

    /**
     * Load saved configurations from localStorage
     * @private
     */
    _loadSavedConfigs() {
        try {
            const stored = localStorage.getItem('analyticsFilterConfigs');
            if (stored) {
                return JSON.parse(stored);
            }
        } catch (e) {
            console.warn('[AnalyticsFilterPanel] Failed to load saved configs:', e);
        }
        return [];
    }

    /**
     * Persist saved configurations to localStorage
     * @private
     */
    _persistSavedConfigs() {
        try {
            localStorage.setItem('analyticsFilterConfigs', JSON.stringify(this.savedConfigs));
        } catch (e) {
            console.warn('[AnalyticsFilterPanel] Failed to persist configs:', e);
        }
    }

    /**
     * Get current filter state
     * @returns {Object} Current active filters
     */
    getActiveFilters() {
        return { ...this.activeFilters };
    }

    /**
     * Set filter state programmatically
     * @param {Object} filters - Filter configuration
     */
    setActiveFilters(filters) {
        this.activeFilters = { ...this.activeFilters, ...filters };
        this._updateFilterUI();
        this._applyFilters();
    }

    /**
     * Show the panel
     */
    show() {
        if (this.panelContainer) {
            this.panelContainer.visible = true;
        }
        this.config.enabled = true;
    }

    /**
     * Hide the panel
     */
    hide() {
        if (this.panelContainer) {
            this.panelContainer.visible = false;
        }
        this.config.enabled = false;
    }

    /**
     * Expand the panel
     */
    expand() {
        this.isCollapsed = false;
        this._expandPanel();
        if (this.filterControls.collapseButton && this.filterControls.collapseButton.iconText) {
            this.filterControls.collapseButton.iconText.text = '−';
        }
    }

    /**
     * Collapse the panel
     */
    collapse() {
        this.isCollapsed = true;
        this._collapsePanel();
        if (this.filterControls.collapseButton && this.filterControls.collapseButton.iconText) {
            this.filterControls.collapseButton.iconText.text = '+';
        }
    }

    /**
     * Destroy the panel and clean up
     */
    destroy() {
        if (this.panelContainer) {
            this.panelContainer.destroy();
            this.panelContainer = null;
        }

        this.panelBackground = null;
        this.headerBar = null;
        this.contentArea = null;
        this.activeIndicator = null;
        this.filterControls = {};

        console.log('[AnalyticsFilterPanel] Destroyed');
    }

    /**
     * DOM fallback for when PIXI is not available
     * @private
     */
    _createDOMPanel() {
        const container = document.createElement('div');
        container.id = 'analytics-filter-panel';
        container.style.cssText = `
            position: fixed;
            top: ${this.config.position.y}px;
            left: ${this.config.position.x}px;
            width: ${this.config.width}px;
            background: rgba(26, 26, 46, 0.95);
            border: 2px solid #00FFFF;
            border-radius: 8px;
            z-index: 9999;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
        `;

        // Create header
        const header = document.createElement('div');
        header.style.cssText = `
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 15px;
            background: rgba(10, 10, 26, 0.9);
            border-radius: 6px 6px 0 0;
            cursor: move;
        `;
        header.innerHTML = `
            <span style="color: #fff; font-weight: bold; font-family: 'Courier New', monospace;">
                🔍 Analytics Filters
            </span>
            <button id="collapse-btn" style="background: #222233; border: 1px solid #00FFFF; color: #fff; border-radius: 50%; width: 24px; height: 24px; cursor: pointer;">−</button>
        `;
        container.appendChild(header);

        // Create content
        const content = document.createElement('div');
        content.id = 'filter-content';
        content.style.cssText = `
            padding: 15px;
            max-height: 450px;
            overflow-y: auto;
        `;

        // Layer ID filter
        content.innerHTML += `
            <div style="margin-bottom: 15px;">
                <label style="color: #fff; font-size: 11px; font-weight: bold; font-family: 'Courier New', monospace;">Layer IDs:</label>
                <div style="display: flex; gap: 5px; margin-top: 5px;">
                    <input type="text" id="layer-filter" placeholder="e.g., 0-10, 15, 20-25" style="flex: 1; background: rgba(10, 10, 26, 0.8); border: 1px solid #444; color: #888; font-family: 'Courier New', monospace; font-size: 10px; padding: 5px; border-radius: 4px;">
                    <button id="clear-layer-btn" style="background: #222; border: 1px solid #ff4444; color: #ff4444; padding: 5px 10px; border-radius: 4px; cursor: pointer;">×</button>
                </div>
            </div>
        `;

        // Correlation range filter
        content.innerHTML += `
            <div style="margin-bottom: 15px;">
                <label style="color: #fff; font-size: 11px; font-weight: bold; font-family: 'Courier New', monospace;">Correlation Range:</label>
                <div id="correlation-display" style="color: #88ccff; font-family: 'Courier New', monospace; font-size: 10px; margin-top: 5px;">-1 to 1</div>
                <div style="background: rgba(10, 10, 26, 0.8); height: 8px; border-radius: 2px; margin-top: 5px; position: relative;">
                    <div id="correlation-bar" style="background: #4488ff; height: 100%; border-radius: 2px; width: 100%; opacity: 0.7;"></div>
                </div>
            </div>
        `;

        // Time window filter
        content.innerHTML += `
            <div style="margin-bottom: 15px;">
                <label style="color: #fff; font-size: 11px; font-weight: bold; font-family: 'Courier New', monospace;">Time Window:</label>
                <div style="display: flex; gap: 5px; margin-top: 5px;">
                    <button class="time-btn" data-duration="60" style="background: #1a1a2e; border: 1px solid #4488ff; color: #4488ff; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 10px;">1m</button>
                    <button class="time-btn" data-duration="300" style="background: #1a1a2e; border: 1px solid #4488ff; color: #4488ff; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 10px;">5m</button>
                    <button class="time-btn" data-duration="900" style="background: #1a1a2e; border: 1px solid #4488ff; color: #4488ff; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 10px;">15m</button>
                    <button class="time-btn" data-duration="3600" style="background: #1a1a2e; border: 1px solid #4488ff; color: #4488ff; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 10px;">1h</button>
                    <button id="clear-time-btn" style="background: #222; border: 1px solid #ff4444; color: #ff4444; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 10px;">×</button>
                </div>
            </div>
        `;

        // Anomaly score filter
        content.innerHTML += `
            <div style="margin-bottom: 15px;">
                <label style="color: #fff; font-size: 11px; font-weight: bold; font-family: 'Courier New', monospace;">Min Anomaly Score:</label>
                <div style="display: flex; align-items: center; gap: 10px; margin-top: 5px;">
                    <span id="anomaly-display" style="color: #ff8844; font-family: 'Courier New', monospace; font-size: 10px;">≥ 0.0</span>
                    <button id="dec-anomaly-btn" style="background: #222; border: 1px solid #ff4444; color: #ff4444; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 10px;">−</button>
                    <button id="inc-anomaly-btn" style="background: #222; border: 1px solid #44ff44; color: #44ff44; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 10px;">+</button>
                </div>
                <div style="background: rgba(10, 10, 26, 0.8); height: 8px; border-radius: 2px; margin-top: 5px; position: relative;">
                    <div id="anomaly-bar" style="background: #ff8844; height: 100%; border-radius: 2px; width: 0%; opacity: 0.7;"></div>
                </div>
            </div>
        `;

        // Presets
        content.innerHTML += `
            <div style="margin-bottom: 15px;">
                <label style="color: #fff; font-size: 11px; font-weight: bold; font-family: 'Courier New', monospace;">Quick Presets:</label>
                <div style="display: flex; gap: 5px; margin-top: 5px; flex-wrap: wrap;">
                    <button class="preset-btn" data-preset="high-corr" style="background: #1a1a2e; border: 1px solid #44ff88; color: #44ff88; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 9px;">High Corr</button>
                    <button class="preset-btn" data-preset="anomalies" style="background: #1a1a2e; border: 1px solid #ff8844; color: #ff8844; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 9px;">Anomalies</button>
                    <button class="preset-btn" data-preset="recent" style="background: #1a1a2e; border: 1px solid #4488ff; color: #4488ff; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 9px;">Recent</button>
                    <button class="preset-btn" data-preset="critical" style="background: #1a1a2e; border: 1px solid #ff4444; color: #ff4444; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 9px;">Critical</button>
                </div>
            </div>
        `;

        // Save/Load
        content.innerHTML += `
            <div style="margin-bottom: 15px;">
                <label style="color: #fff; font-size: 11px; font-weight: bold; font-family: 'Courier New', monospace;">Saved Configs:</label>
                <div style="display: flex; gap: 5px; margin-top: 5px;">
                    <button id="save-config-btn" style="background: #1a1a2e; border: 1px solid #44ff88; color: #44ff88; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 10px;">💾 Save</button>
                    <button id="load-config-btn" style="background: #1a1a2e; border: 1px solid #4488ff; color: #4488ff; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 10px;">📂 Load</button>
                </div>
            </div>
        `;

        // Action buttons
        content.innerHTML += `
            <div style="display: flex; justify-content: space-between; gap: 10px;">
                <button id="apply-filters-btn" style="flex: 1; background: rgba(68, 255, 136, 0.3); border: 2px solid #44ff88; color: #fff; padding: 8px; border-radius: 5px; cursor: pointer; font-weight: bold; font-family: 'Courier New', monospace; font-size: 11px;">Apply Filters</button>
                <button id="reset-filters-btn" style="flex: 1; background: rgba(255, 68, 68, 0.3); border: 2px solid #ff4444; color: #fff; padding: 8px; border-radius: 5px; cursor: pointer; font-weight: bold; font-family: 'Courier New', monospace; font-size: 11px;">Reset All</button>
            </div>
        `;

        container.appendChild(content);

        // Add active indicator
        const indicator = document.createElement('div');
        indicator.id = 'active-filter-indicator';
        indicator.style.cssText = `
            position: absolute;
            top: 5px;
            left: 5px;
            width: 10px;
            height: 10px;
            background: #ff4444;
            border-radius: 50%;
            display: none;
            animation: pulse 1s infinite;
        `;
        container.appendChild(indicator);

        document.body.appendChild(container);

        // Add event listeners
        this._setupDOMEventListeners(container);

        return container;
    }

    /**
     * Setup DOM event listeners
     * @private
     */
    _setupDOMEventListeners(container) {
        // Collapse button
        const collapseBtn = container.querySelector('#collapse-btn');
        const content = container.querySelector('#filter-content');
        collapseBtn.addEventListener('click', () => {
            this.isCollapsed = !this.isCollapsed;
            content.style.display = this.isCollapsed ? 'none' : 'block';
            collapseBtn.textContent = this.isCollapsed ? '+' : '−';
        });

        // Make draggable
        const header = container.querySelector('div');
        let isDragging = false;
        let dragOffset = { x: 0, y: 0 };

        header.addEventListener('mousedown', (e) => {
            if (e.target.tagName === 'BUTTON') return;
            isDragging = true;
            dragOffset.x = e.clientX - container.offsetLeft;
            dragOffset.y = e.clientY - container.offsetTop;
        });

        document.addEventListener('mousemove', (e) => {
            if (!isDragging) return;
            container.style.left = (e.clientX - dragOffset.x) + 'px';
            container.style.top = (e.clientY - dragOffset.y) + 'px';
        });

        document.addEventListener('mouseup', () => {
            isDragging = false;
        });

        // Filter controls
        container.querySelector('#clear-layer-btn')?.addEventListener('click', () => this._clearLayerFilter());
        container.querySelector('#clear-time-btn')?.addEventListener('click', () => this._clearTimeWindow());

        // Time buttons
        container.querySelectorAll('.time-btn').forEach(btn => {
            btn.addEventListener('click', () => {
                const duration = parseInt(btn.dataset.duration);
                this._setTimeWindow(duration);
            });
        });

        // Anomaly controls
        container.querySelector('#inc-anomaly-btn')?.addEventListener('click', () => this._adjustAnomalyThreshold(0.1));
        container.querySelector('#dec-anomaly-btn')?.addEventListener('click', () => this._adjustAnomalyThreshold(-0.1));

        // Presets
        container.querySelectorAll('.preset-btn').forEach(btn => {
            btn.addEventListener('click', () => {
                const presetName = btn.dataset.preset;
                const preset = this.presets.find(p => p.name.toLowerCase().replace(' ', '-') === presetName);
                if (preset) this._applyPreset(preset);
            });
        });

        // Save/Load
        container.querySelector('#save-config-btn')?.addEventListener('click', () => this._saveConfig());
        container.querySelector('#load-config-btn')?.addEventListener('click', () => this._showLoadMenu());

        // Action buttons
        container.querySelector('#apply-filters-btn')?.addEventListener('click', () => this._applyFilters());
        container.querySelector('#reset-filters-btn')?.addEventListener('click', () => this._resetFilters());

        // Add pulse animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes pulse {
                0%, 100% { opacity: 1; }
                50% { opacity: 0.5; }
            }
        `;
        document.head.appendChild(style);
    }
}
