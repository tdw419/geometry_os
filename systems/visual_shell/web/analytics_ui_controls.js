/**
 * AnalyticsUIControls - UI Controls for Analytics Views
 *
 * Provides toggle buttons and keyboard shortcuts for controlling analytics views:
 * - Correlation Matrix View (Ctrl+M)
 * - Temporal Patterns View (Ctrl+T)
 * - All Analytics Toggle (Ctrl+A)
 *
 * Part of: Neural Heatmap Phase 2.1.4 - Advanced Correlation Analytics
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-1-4-correlation-analytics.md
 *
 * @class AnalyticsUIControls
 */

class AnalyticsUIControls {
    /**
     * Create a new AnalyticsUIControls
     * @param {Object} config - Configuration options
     * @param {NeuralHeatmapOverlay} config.heatmapOverlay - NeuralHeatmapOverlay instance (required)
     * @param {PIXI.Container} config.container - Parent PixiJS container for UI (required)
     * @param {Object} config.position - Position {x, y} for control panel (default: {x: 20, y: 20})
     * @param {boolean} config.enabled - Start enabled (default: true)
     * @param {Object} config.shortcuts - Custom keyboard shortcuts (default: standard shortcuts)
     */
    constructor(config = {}) {
        if (!config.heatmapOverlay) {
            throw new Error('AnalyticsUIControls requires heatmapOverlay in config');
        }
        if (!config.container && typeof PIXI === 'undefined') {
            throw new Error('AnalyticsUIControls requires config.container or PIXI.Container');
        }

        this.heatmapOverlay = config.heatmapOverlay;
        this.container = config.container;

        this.config = {
            position: { x: 20, y: 20 },
            enabled: true,
            buttonWidth: 40,
            buttonHeight: 40,
            buttonSpacing: 10,
            shortcuts: {
                correlationMatrix: 'ctrl+m',
                temporalView: 'ctrl+t',
                toggleAll: 'ctrl+a',
                toggleTheme: 'ctrl+d',
                toggleFilter: 'ctrl+f',
                toggleCompare: 'ctrl+shift+c'
            },
            ...config
        };

        // Initialize theme when available
        this._initTheme();

        // UI State
        this.controlsContainer = null;
        this.correlationButton = null;
        this.temporalButton = null;
        this.toggleAllButton = null;
        this.themeToggleButton = null;
        this.filterButton = null; // Phase 2.2
        this.compareButton = null; // Phase 2.2
        this.isKeyboardEnabled = true;

        // Track view states
        this.viewStates = {
            correlationMatrix: false,
            temporalView: false
        };

        // Background graphics
        this.panelBackground = null;

        // Theme manager integration
        this.themeManager = null;
        this.themeChangeHandler = null;

        console.log('[AnalyticsUIControls] Initialized');
    }

    /**
     * Create the UI controls
     * @returns {PIXI.Container} Controls container
     */
    create() {
        if (typeof PIXI === 'undefined') {
            console.warn('[AnalyticsUIControls] PIXI not available, using DOM fallback');
            return this._createDOMControls();
        }

        // Create main container
        this.controlsContainer = new PIXI.Container();
        this.controlsContainer.x = this.config.position.x;
        this.controlsContainer.y = this.config.position.y;
        this.controlsContainer.eventMode = 'static';

        // Create semi-transparent background panel
        this.panelBackground = new PIXI.Graphics();
        this._updatePanelBackground();
        this.controlsContainer.addChild(this.panelBackground);

        // Create buttons
        this._createCorrelationButton();
        this._createTemporalButton();
        this._createToggleAllButton();
        this._createThemeToggleButton();
        this._createFilterButton(); // Phase 2.2: Filter panel toggle
        this._createCompareButton(); // Phase 2.2: Multi-model comparison toggle

        // Enable keyboard shortcuts
        this._enableKeyboardShortcuts();

        console.log('[AnalyticsUIControls] UI controls created');

        return this.controlsContainer;
    }

    /**
     * Update panel background based on button count
     * @private
     */
    _updatePanelBackground() {
        if (!this.panelBackground) return;

        const buttonCount = 6; // M, T, A, D, F (filter), C (compare)
        const totalWidth = (buttonCount * this.config.buttonWidth) +
                          ((buttonCount - 1) * this.config.buttonSpacing);
        const totalHeight = this.config.buttonHeight;

        const bgColor = this._getThemeColor('background', 'secondary', 0x000000);
        const borderColor = this._getThemeColor('accent', 'cyan', 0x00FFFF);

        this.panelBackground.clear();
        this.panelBackground.beginFill(bgColor, 0.7);
        this.panelBackground.drawRoundedRect(0, 0, totalWidth, totalHeight, 5);
        this.panelBackground.endFill();

        // Add border
        this.panelBackground.lineStyle(1, borderColor, 0.5);
        this.panelBackground.drawRoundedRect(0, 0, totalWidth, totalHeight, 5);
    }

    /**
     * Create correlation matrix toggle button
     * @private
     */
    _createCorrelationButton() {
        const button = this._createButton({
            x: 0,
            label: 'M',
            tooltip: 'Correlation Matrix (Ctrl+M)',
            color: 0x4488ff
        });

        button.on('pointerdown', () => {
            this.toggleCorrelationMatrix();
            this._updateButtonState(this.correlationButton, this.viewStates.correlationMatrix);
        });

        this.correlationButton = button;
        this.controlsContainer.addChild(button);
    }

    /**
     * Create temporal view toggle button
     * @private
     */
    _createTemporalButton() {
        const xPos = this.config.buttonWidth + this.config.buttonSpacing;

        const button = this._createButton({
            x: xPos,
            label: 'T',
            tooltip: 'Temporal View (Ctrl+T)',
            color: 0x44ff88
        });

        button.on('pointerdown', () => {
            this.toggleTemporalView();
            this._updateButtonState(this.temporalButton, this.viewStates.temporalView);
        });

        this.temporalButton = button;
        this.controlsContainer.addChild(button);
    }

    /**
     * Create toggle all analytics button
     * @private
     */
    _createToggleAllButton() {
        const xPos = (this.config.buttonWidth + this.config.buttonSpacing) * 2;

        const button = this._createButton({
            x: xPos,
            label: 'A',
            tooltip: 'Toggle All (Ctrl+A)',
            color: 0xffaa00
        });

        button.on('pointerdown', () => {
            this.toggleAllAnalytics();
        });

        this.toggleAllButton = button;
        this.controlsContainer.addChild(button);
    }

    /**
     * Create theme toggle button
     * @private
     */
    _createThemeToggleButton() {
        const xPos = (this.config.buttonWidth + this.config.buttonSpacing) * 3;

        const button = this._createButton({
            x: xPos,
            label: 'D',
            tooltip: 'Toggle Dark/Light Theme (Ctrl+D)',
            color: 0x888888
        });

        button.on('pointerdown', () => {
            this.toggleTheme();
        });

        this.themeToggleButton = button;
        this.controlsContainer.addChild(button);

        // Update button to reflect current theme
        this._updateThemeButtonState();
    }

    /**
     * Create filter panel toggle button (Phase 2.2)
     * @private
     */
    _createFilterButton() {
        const xPos = (this.config.buttonWidth + this.config.buttonSpacing) * 4;

        const button = this._createButton({
            x: xPos,
            label: 'F',
            tooltip: 'Toggle Filter Panel (Ctrl+F)',
            color: 0xff8844
        });

        button.on('pointerdown', () => {
            this.toggleFilterPanel();
        });

        this.filterButton = button;
        this.controlsContainer.addChild(button);
    }

    /**
     * Create comparison view toggle button (Phase 2.2)
     * @private
     */
    _createCompareButton() {
        const xPos = (this.config.buttonWidth + this.config.buttonSpacing) * 5;

        const button = this._createButton({
            x: xPos,
            label: 'C',
            tooltip: 'Toggle Comparison View (Ctrl+Shift+C)',
            color: 0x8844ff
        });

        button.on('pointerdown', () => {
            this.toggleComparisonView();
        });

        this.compareButton = button;
        this.controlsContainer.addChild(button);
    }

    /**
     * Create a button with standard styling
     * @private
     */
    _createButton(options) {
        const { x, label, tooltip, color } = options;

        const button = new PIXI.Container();
        button.x = x;
        button.eventMode = 'static';
        button.cursor = 'pointer';

        // Button background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x222222, 0.9);
        bg.drawRoundedRect(0, 0, this.config.buttonWidth, this.config.buttonHeight, 5);
        bg.endFill();

        // Button border (uses the theme color)
        bg.lineStyle(2, color, 0.8);
        bg.drawRoundedRect(0, 0, this.config.buttonWidth, this.config.buttonHeight, 5);

        button.addChild(bg);
        button.buttonBg = bg;

        // Button label
        const labelText = new PIXI.Text(label, {
            fontSize: 18,
            fontWeight: 'bold',
            fill: 0xffffff,
            fontFamily: 'Courier New, monospace'
        });
        labelText.anchor.set(0.5);
        labelText.x = this.config.buttonWidth / 2;
        labelText.y = this.config.buttonHeight / 2;
        button.addChild(labelText);

        // Hover effect
        button.on('pointerover', () => {
            if (button.buttonBg) {
                button.buttonBg.clear();
                button.buttonBg.beginFill(color, 0.3);
                button.buttonBg.drawRoundedRect(0, 0, this.config.buttonWidth, this.config.buttonHeight, 5);
                button.buttonBg.endFill();
                button.buttonBg.lineStyle(2, color, 1);
                button.buttonBg.drawRoundedRect(0, 0, this.config.buttonWidth, this.config.buttonHeight, 5);
            }
        });

        button.on('pointerout', () => {
            if (button.buttonBg) {
                button.buttonBg.clear();
                button.buttonBg.beginFill(0x222222, 0.9);
                button.buttonBg.drawRoundedRect(0, 0, this.config.buttonWidth, this.config.buttonHeight, 5);
                button.buttonBg.endFill();
                button.buttonBg.lineStyle(2, color, 0.8);
                button.buttonBg.drawRoundedRect(0, 0, this.config.buttonWidth, this.config.buttonHeight, 5);
            }
        });

        // Store tooltip
        button.tooltip = tooltip;

        return button;
    }

    /**
     * Update button visual state
     * @private
     */
    _updateButtonState(button, isActive) {
        if (!button || !button.buttonBg) return;

        const color = isActive ? 0x00ff00 : 0x444444;

        button.buttonBg.clear();
        button.buttonBg.beginFill(color, isActive ? 0.5 : 0.9);
        button.buttonBg.drawRoundedRect(0, 0, this.config.buttonWidth, this.config.buttonHeight, 5);
        button.buttonBg.endFill();
        button.buttonBg.lineStyle(2, isActive ? 0x00ff00 : 0x666666, isActive ? 1 : 0.8);
        button.buttonBg.drawRoundedRect(0, 0, this.config.buttonWidth, this.config.buttonHeight, 5);
    }

    /**
     * Toggle correlation matrix view
     * @returns {boolean} New state (true if visible)
     */
    toggleCorrelationMatrix() {
        this.viewStates.correlationMatrix = !this.viewStates.correlationMatrix;

        if (this.heatmapOverlay.correlationMatrixContainer) {
            this.heatmapOverlay.correlationMatrixContainer.visible = this.viewStates.correlationMatrix;
        }

        console.log(`[AnalyticsUIControls] Correlation Matrix: ${this.viewStates.correlationMatrix ? 'ON' : 'OFF'}`);

        return this.viewStates.correlationMatrix;
    }

    /**
     * Toggle temporal view
     * @returns {boolean} New state (true if visible)
     */
    toggleTemporalView() {
        this.viewStates.temporalView = !this.viewStates.temporalView;

        if (this.heatmapOverlay.temporalViewContainer) {
            this.heatmapOverlay.temporalViewContainer.visible = this.viewStates.temporalView;
        }

        console.log(`[AnalyticsUIControls] Temporal View: ${this.viewStates.temporalView ? 'ON' : 'OFF'}`);

        return this.viewStates.temporalView;
    }

    /**
     * Toggle all analytics views
     * @returns {Object} New states
     */
    toggleAllAnalytics() {
        // If all are on, turn off. Otherwise turn all on.
        const allOn = this.viewStates.correlationMatrix && this.viewStates.temporalView;
        const newState = !allOn;

        this.viewStates.correlationMatrix = newState;
        this.viewStates.temporalView = newState;

        if (this.heatmapOverlay.correlationMatrixContainer) {
            this.heatmapOverlay.correlationMatrixContainer.visible = newState;
        }

        if (this.heatmapOverlay.temporalViewContainer) {
            this.heatmapOverlay.temporalViewContainer.visible = newState;
        }

        this._updateButtonState(this.correlationButton, newState);
        this._updateButtonState(this.temporalButton, newState);

        console.log(`[AnalyticsUIControls] All Analytics: ${newState ? 'ON' : 'OFF'}`);

        return { ...this.viewStates };
    }

    /**
     * Enable keyboard shortcuts
     * @private
     */
    _enableKeyboardShortcuts() {
        if (typeof document === 'undefined') {
            console.warn('[AnalyticsUIControls] Document not available for keyboard shortcuts');
            return;
        }

        this._keyboardHandler = (event) => {
            if (!this.isKeyboardEnabled || !this.config.enabled) return;

            const key = event.key.toLowerCase();
            const ctrl = event.ctrlKey || event.metaKey;

            if (!ctrl) return;

            switch (key) {
                case 'm':
                    event.preventDefault();
                    this.toggleCorrelationMatrix();
                    this._updateButtonState(this.correlationButton, this.viewStates.correlationMatrix);
                    break;

                case 't':
                    event.preventDefault();
                    this.toggleTemporalView();
                    this._updateButtonState(this.temporalButton, this.viewStates.temporalView);
                    break;

                case 'a':
                    event.preventDefault();
                    this.toggleAllAnalytics();
                    break;

                case 'd':
                    event.preventDefault();
                    this.toggleTheme();
                    break;

                case 'f':
                    event.preventDefault();
                    this.toggleFilterPanel();
                    break;

                case 'c':
                    if (event.shiftKey) {
                        event.preventDefault();
                        this.toggleComparisonView();
                    }
                    break;
            }
        };

        document.addEventListener('keydown', this._keyboardHandler);
        console.log('[AnalyticsUIControls] Keyboard shortcuts enabled (Ctrl+M, Ctrl+T, Ctrl+A, Ctrl+D, Ctrl+F, Ctrl+Shift+C)');
    }

    /**
     * Disable keyboard shortcuts
     */
    disableKeyboardShortcuts() {
        this.isKeyboardEnabled = false;
        if (this._keyboardHandler && typeof document !== 'undefined') {
            document.removeEventListener('keydown', this._keyboardHandler);
        }
    }

    /**
     * Enable keyboard shortcuts
     */
    enableKeyboardShortcuts() {
        this.isKeyboardEnabled = true;
        if (this._keyboardHandler && typeof document !== 'undefined') {
            document.addEventListener('keydown', this._keyboardHandler);
        }
    }

    /**
     * Show the controls
     */
    show() {
        if (this.controlsContainer) {
            this.controlsContainer.visible = true;
        }
        this.config.enabled = true;
    }

    /**
     * Hide the controls
     */
    hide() {
        if (this.controlsContainer) {
            this.controlsContainer.visible = false;
        }
        this.config.enabled = false;
    }

    /**
     * Destroy the controls and clean up event listeners
     */
    destroy() {
        // Remove theme change listener
        if (this.themeManager && this.themeChangeHandler) {
            this.themeManager.removeEventListener('themechange', this.themeChangeHandler);
        }

        this.disableKeyboardShortcuts();

        if (this.controlsContainer) {
            this.controlsContainer.destroy();
            this.controlsContainer = null;
        }

        this.correlationButton = null;
        this.temporalButton = null;
        this.toggleAllButton = null;
        this.themeToggleButton = null;
        this.panelBackground = null;

        console.log('[AnalyticsUIControls] Destroyed');
    }

    /**
     * DOM fallback for when PIXI is not available
     * @private
     */
    _createDOMControls() {
        const container = document.createElement('div');
        container.id = 'analytics-ui-controls';
        container.style.cssText = `
            position: fixed;
            top: ${this.config.position.y}px;
            left: ${this.config.position.x}px;
            background: rgba(0, 0, 0, 0.8);
            border: 1px solid #00FFFF;
            border-radius: 5px;
            padding: 8px;
            z-index: 9999;
            display: flex;
            gap: 8px;
        `;

        // Create correlation button
        this.correlationButton = this._createDOMButton('M', 'Correlation Matrix (Ctrl+M)', '#4488ff', () => {
            this.toggleCorrelationMatrix();
        });

        // Create temporal button
        this.temporalButton = this._createDOMButton('T', 'Temporal View (Ctrl+T)', '#44ff88', () => {
            this.toggleTemporalView();
        });

        // Create toggle all button
        this.toggleAllButton = this._createDOMButton('A', 'Toggle All (Ctrl+A)', '#ffaa00', () => {
            this.toggleAllAnalytics();
        });

        container.appendChild(this.correlationButton);
        container.appendChild(this.temporalButton);
        container.appendChild(this.toggleAllButton);

        // Create theme toggle button
        this.themeToggleButton = this._createDOMButton('D', 'Toggle Dark/Light Theme (Ctrl+D)', '#888888', () => {
            this.toggleTheme();
        });
        container.appendChild(this.themeToggleButton);

        // Update button to reflect current theme
        this._updateThemeButtonState();

        document.body.appendChild(container);

        // Enable keyboard shortcuts
        this._enableKeyboardShortcuts();

        return container;
    }

    /**
     * Create a DOM button element
     * @private
     */
    _createDOMButton(label, tooltip, color, onClick) {
        const button = document.createElement('button');
        button.textContent = label;
        button.title = tooltip;
        button.style.cssText = `
            width: ${this.config.buttonWidth}px;
            height: ${this.config.buttonHeight}px;
            background: #222;
            border: 2px solid ${color};
            color: white;
            font-weight: bold;
            font-family: 'Courier New', monospace;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.2s;
        `;

        button.onmouseover = () => {
            button.style.background = color;
            button.style.opacity = '0.5';
        };

        button.onmouseout = () => {
            button.style.background = '#222';
            button.style.opacity = '1';
        };

        button.onclick = onClick;

        return button;
    }

    /**
     * Update button state for DOM buttons
     * @private
     */
    _updateButtonState(button, isActive) {
        if (!button || !button.style) return;

        if (isActive) {
            button.style.background = '#00ff00';
            button.style.opacity = '0.5';
            button.style.borderColor = '#00ff00';
        } else {
            button.style.background = '#222';
            button.style.opacity = '1';
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
                this._onThemeChange();
            };

            this.themeManager.addEventListener('themechange', this.themeChangeHandler);
        }
    }

    /**
     * Get color from current theme
     * @private
     */
    _getThemeColor(category, shade, fallback) {
        if (this.themeManager) {
            return this.themeManager.getColor(category, shade);
        }
        return fallback;
    }

    /**
     * Toggle between light and dark themes
     * @returns {string} New theme name
     */
    toggleTheme() {
        if (this.themeManager) {
            const newTheme = this.themeManager.toggleTheme();
            console.log(`[AnalyticsUIControls] Theme toggled to: ${newTheme}`);
            return newTheme;
        } else {
            console.warn('[AnalyticsUIControls] Theme manager not available');
        }
        return null;
    }

    /**
     * Toggle filter panel visibility (Phase 2.2)
     * @returns {boolean} New state (true if visible)
     */
    toggleFilterPanel() {
        if (this.heatmapOverlay && this.heatmapOverlay.filterPanel) {
            const panel = this.heatmapOverlay.filterPanel;
            if (panel.panelContainer || typeof panel.show === 'function') {
                // Toggle visibility
                if (panel.panelContainer) {
                    panel.panelContainer.visible = !panel.panelContainer.visible;
                    const newState = panel.panelContainer.visible;
                    console.log(`[AnalyticsUIControls] Filter Panel: ${newState ? 'ON' : 'OFF'}`);
                    this._updateButtonState(this.filterButton, newState);
                    return newState;
                } else {
                    // DOM fallback
                    const isVisible = panel.panelContainer?.style.display !== 'none';
                    if (isVisible) {
                        panel.hide();
                    } else {
                        panel.show();
                    }
                    console.log(`[AnalyticsUIControls] Filter Panel toggled`);
                    return !isVisible;
                }
            }
        }
        console.warn('[AnalyticsUIControls] Filter panel not available');
        return false;
    }

    /**
     * Toggle comparison view visibility (Phase 2.2)
     * @returns {boolean} New state (true if visible)
     */
    toggleComparisonView() {
        if (this.heatmapOverlay && this.heatmapOverlay.multiModelComparison) {
            const comparison = this.heatmapOverlay.multiModelComparison;
            if (comparison.comparisonContainer || typeof comparison.show === 'function') {
                // Toggle visibility
                if (comparison.comparisonContainer) {
                    comparison.comparisonContainer.visible = !comparison.comparisonContainer.visible;
                    const newState = comparison.comparisonContainer.visible;
                    console.log(`[AnalyticsUIControls] Comparison View: ${newState ? 'ON' : 'OFF'}`);
                    this._updateButtonState(this.compareButton, newState);
                    return newState;
                } else {
                    // DOM fallback
                    const isVisible = comparison.comparisonContainer?.style.display !== 'none';
                    if (isVisible) {
                        comparison.hide();
                    } else {
                        comparison.show();
                    }
                    console.log(`[AnalyticsUIControls] Comparison View toggled`);
                    return !isVisible;
                }
            }
        }
        console.warn('[AnalyticsUIControls] Comparison view not available');
        return false;
    }

    /**
     * Handle theme change event
     * @private
     */
    _onThemeChange() {
        // Update panel background with new theme colors
        this._updatePanelBackground();

        // Update theme button state
        this._updateThemeButtonState();

        console.log('[AnalyticsUIControls] Theme applied to controls');
    }

    /**
     * Update theme button state to reflect current theme
     * @private
     */
    _updateThemeButtonState() {
        if (!this.themeToggleButton) return;

        const isDark = this.themeManager && this.themeManager.currentTheme === 'dark';

        if (this.themeToggleButton.buttonBg) {
            // PIXI button
            const color = isDark ? 0x000000 : 0xFFFFFF;
            const textColor = isDark ? 0xFFFFFF : 0x000000;

            this.themeToggleButton.buttonBg.clear();
            this.themeToggleButton.buttonBg.beginFill(color, 0.9);
            this.themeToggleButton.buttonBg.drawRoundedRect(0, 0, this.config.buttonWidth, this.config.buttonHeight, 5);
            this.themeToggleButton.buttonBg.endFill();
            this.themeToggleButton.buttonBg.lineStyle(2, 0x888888, 0.8);
            this.themeToggleButton.buttonBg.drawRoundedRect(0, 0, this.config.buttonWidth, this.config.buttonHeight, 5);

            // Update label color
            const label = this.themeToggleButton.children.find(child => child instanceof PIXI.Text);
            if (label) {
                label.style.fill = textColor;
            }
        } else if (this.themeToggleButton.style) {
            // DOM button
            if (isDark) {
                this.themeToggleButton.style.background = '#000';
                this.themeToggleButton.style.color = '#fff';
                this.themeToggleButton.style.borderColor = '#888';
            } else {
                this.themeToggleButton.style.background = '#fff';
                this.themeToggleButton.style.color = '#000';
                this.themeToggleButton.style.borderColor = '#888';
            }
        }
    }
}
