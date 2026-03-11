/**
 * EnhancedOverlay - Advanced overlay modes for comparative heatmap visualization
 *
 * Extends ComparativeHeatmap with enhanced overlay capabilities:
 * - Transparency slider controls (0-100% opacity)
 * - Multiple blending modes (screen, multiply, overlay, add, normal)
 * - 3D depth layering with Z-ordering control
 * - Per-model visibility toggles
 *
 * Part of: Neural Heatmap Phase 2.1.2 - Enhanced Visualization Modes
 * @see docs/plans/2026-02-07-neural-heatmap-phase-2-1-2-enhanced-modes.md
 */

class EnhancedOverlay {
    /**
     * Create a new EnhancedOverlay
     * @param {ComparativeHeatmap} comparativeHeatmap - Base comparative heatmap instance
     * @param {Object} options - Configuration options
     * @param {PIXI.Container} options.container - Parent PIXI container
     * @param {MultiModelTracker} options.multiModelTracker - Multi-model tracker instance
     * @param {number} options.defaultTransparency - Default transparency (0-100)
     * @param {string} options.defaultBlendMode - Default blend mode
     * @param {boolean} options.enableDepthLayering - Enable 3D depth layering
     * @param {Object} options.position - Control panel position {x, y}
     */
    constructor(comparativeHeatmap, options = {}) {
        if (!comparativeHeatmap) {
            throw new Error('EnhancedOverlay requires a comparativeHeatmap instance');
        }

        this.comparativeHeatmap = comparativeHeatmap;
        this.multiModelTracker = comparativeHeatmap.multiModelTracker || options.multiModelTracker;

        if (!this.multiModelTracker) {
            throw new Error('EnhancedOverlay requires a multiModelTracker');
        }

        this.options = {
            defaultTransparency: 50,
            defaultBlendMode: 'screen',
            enableDepthLayering: true,
            position: { x: 20, y: 350 },
            ...options
        };

        // Transparency state (0-100)
        this.transparency = this.options.defaultTransparency;

        // Blend mode state
        this.currentBlendMode = this.options.defaultBlendMode;

        // Available blend modes mapping to PIXI
        this.blendModes = {
            'normal': PIXI.BLEND_MODES.NORMAL,
            'add': PIXI.BLEND_MODES.ADD,
            'multiply': PIXI.BLEND_MODES.MULTIPLY,
            'screen': PIXI.BLEND_MODES.SCREEN,
            'overlay': null // PIXI doesn't have overlay, we'll simulate it
        };

        // Per-model visibility state
        this.modelVisibility = new Map();

        // Per-model transparency (allows individual model control)
        this.modelTransparency = new Map();

        // Z-ordering for depth layering
        this.zOrder = [];
        this.depthScale = 1.0; // Scale factor for depth perception

        // Enhanced overlay containers
        this.enhancedContainers = new Map();
        this.controlPanel = null;

        // Initialize PIXI components
        if (typeof PIXI !== 'undefined' && options.container) {
            this.container = new PIXI.Container();
            this.container.name = 'enhancedOverlay';
            this.container.zIndex = 202; // Above comparative heatmap
            options.container.addChild(this.container);

            this._initializeModelStates();
            this._createControlPanel();
        } else {
            this._fallbackMode = true;
        }

        console.log('[EnhancedOverlay] Initialized');
    }

    /**
     * Initialize model states
     * @private
     */
    _initializeModelStates() {
        const models = this.multiModelTracker.getAllModels();

        models.forEach((model, index) => {
            this.modelVisibility.set(model.id, true);
            this.modelTransparency.set(model.id, this.transparency);
            this.zOrder.push({ modelId: model.id, depth: index });
        });

        // Sort by depth
        this._sortZOrder();
    }

    /**
     * Sort Z-order by depth
     * @private
     */
    _sortZOrder() {
        this.zOrder.sort((a, b) => a.depth - b.depth);
    }

    /**
     * Create control panel UI
     * @private
     */
    _createControlPanel() {
        if (this._fallbackMode) return;

        this.controlPanel = new PIXI.Container();
        this.controlPanel.x = this.options.position.x;
        this.controlPanel.y = this.options.position.y;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x0a0a1a, 0.95);
        bg.lineStyle(1, 0x00FFFF, 0.3);
        bg.drawRoundedRect(0, 0, 280, 200, 8);
        bg.endFill();
        this.controlPanel.addChild(bg);

        // Title
        const title = new PIXI.Text('🎨 Enhanced Overlay', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 14,
            fontWeight: 'bold',
            fill: 0x00FFFF
        });
        title.x = 10;
        title.y = 10;
        this.controlPanel.addChild(title);

        // Global transparency slider
        this._createTransparencySlider();

        // Blend mode selector
        this._createBlendModeSelector();

        // Model visibility toggles
        this._createModelToggles();

        // Depth layering controls
        if (this.options.enableDepthLayering) {
            this._createDepthControls();
        }

        this.container.addChild(this.controlPanel);
    }

    /**
     * Create transparency slider
     * @private
     */
    _createTransparencySlider() {
        if (this._fallbackMode) return;

        const yPos = 40;

        // Label
        const label = new PIXI.Text('Transparency:', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 11,
            fill: 0xAAAAAA
        });
        label.x = 10;
        label.y = yPos;
        this.controlPanel.addChild(label);

        // Value display
        this.transparencyValue = new PIXI.Text(`${this.transparency}%`, {
            fontFamily: 'monospace',
            fontSize: 11,
            fill: 0x00FFFF
        });
        this.transparencyValue.x = 230;
        this.transparencyValue.y = yPos;
        this.controlPanel.addChild(this.transparencyValue);

        // Slider background
        const sliderBg = new PIXI.Graphics();
        sliderBg.beginFill(0x222233, 0.8);
        sliderBg.drawRoundedRect(10, yPos + 15, 200, 8, 4);
        sliderBg.endFill();
        this.controlPanel.addChild(sliderBg);

        // Slider fill
        this.transparencySliderFill = new PIXI.Graphics();
        this._updateTransparencyFill();
        this.controlPanel.addChild(this.transparencySliderFill);

        // Slider handle
        this.transparencyHandle = new PIXI.Graphics();
        this.transparencyHandle.beginFill(0x00FFFF, 1);
        this.transparencyHandle.drawCircle(0, 0, 8);
        this.transparencyHandle.endFill();
        this.transparencyHandle.x = 10 + (this.transparency / 100) * 200;
        this.transparencyHandle.y = yPos + 19;
        this.transparencyHandle.interactive = true;
        this.transparencyHandle.cursor = 'pointer';

        // Drag interaction
        this.transparencyHandle.on('pointerdown', this._onTransparencyDragStart.bind(this));
        this.controlPanel.addChild(this.transparencyHandle);
    }

    /**
     * Update transparency fill
     * @private
     */
    _updateTransparencyFill() {
        if (!this.transparencySliderFill) return;

        this.transparencySliderFill.clear();
        this.transparencySliderFill.beginFill(0x00FFFF, 0.5);
        this.transparencySliderFill.drawRoundedRect(10, 55, (this.transparency / 100) * 200, 8, 4);
        this.transparencySliderFill.endFill();
    }

    /**
     * Handle transparency drag start
     * @private
     */
    _onTransparencyDragStart(event) {
        const handle = event.target;
        const startX = event.data.global.x - handle.parent.worldTransform.tx;

        const onMove = (moveEvent) => {
            const currentX = moveEvent.data.global.x - handle.parent.worldTransform.tx;
            let newX = Math.max(10, Math.min(210, currentX));
            handle.x = newX;

            // Update transparency
            this.transparency = Math.round(((newX - 10) / 200) * 100);
            this.transparencyValue.text = `${this.transparency}%`;
            this._updateTransparencyFill();

            // Apply to all models
            this._applyTransparency();
        };

        const onEnd = () => {
            handle.off('pointermove', onMove);
            handle.off('pointerup', onEnd);
            handle.off('pointerupoutside', onEnd);
        };

        handle.on('pointermove', onMove);
        handle.on('pointerup', onEnd);
        handle.on('pointerupoutside', onEnd);
    }

    /**
     * Apply transparency to all models
     * @private
     */
    _applyTransparency() {
        const models = this.multiModelTracker.getAllModels();
        models.forEach(model => {
            this.modelTransparency.set(model.id, this.transparency);
        });

        // Update comparative heatmap
        if (this.comparativeHeatmap && this.comparativeHeatmap.options) {
            this.comparativeHeatmap.options.opacity = (100 - this.transparency) / 100;
        }
    }

    /**
     * Create blend mode selector
     * @private
     */
    _createBlendModeSelector() {
        if (this._fallbackMode) return;

        const yPos = 80;

        // Label
        const label = new PIXI.Text('Blend Mode:', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 11,
            fill: 0xAAAAAA
        });
        label.x = 10;
        label.y = yPos;
        this.controlPanel.addChild(label);

        // Blend mode buttons
        const modes = ['normal', 'add', 'screen', 'multiply', 'overlay'];
        const buttonWidth = 48;
        const buttonHeight = 20;
        const spacing = 5;

        modes.forEach((mode, index) => {
            const button = new PIXI.Container();
            button.x = 10 + index * (buttonWidth + spacing);
            button.y = yPos + 15;

            // Button background
            const bg = new PIXI.Graphics();
            const isSelected = mode === this.currentBlendMode;
            bg.beginFill(isSelected ? 0x00FFFF : 0x222233, isSelected ? 0.3 : 0.8);
            bg.lineStyle(1, isSelected ? 0x00FFFF : 0x444455, 1);
            bg.drawRoundedRect(0, 0, buttonWidth, buttonHeight, 4);
            bg.endFill();
            button.addChild(bg);

            // Button text
            const text = new PIXI.Text(mode.substring(0, 4), {
                fontFamily: 'Arial, sans-serif',
                fontSize: 9,
                fill: isSelected ? 0x000000 : 0xAAAAAA
            });
            text.x = buttonWidth / 2;
            text.y = buttonHeight / 2;
            text.anchor.set(0.5);
            button.addChild(text);

            // Click handler
            button.interactive = true;
            button.cursor = 'pointer';
            button.on('pointerdown', () => {
                this.setBlendMode(mode);
                this._rebuildControlPanel();
            });

            this.controlPanel.addChild(button);
        });
    }

    /**
     * Create model visibility toggles
     * @private
     */
    _createModelToggles() {
        if (this._fallbackMode) return;

        const yPos = 125;

        // Label
        const label = new PIXI.Text('Models:', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 11,
            fill: 0xAAAAAA
        });
        label.x = 10;
        label.y = yPos;
        this.controlPanel.addChild(label);

        // Model toggle buttons
        const models = this.multiModelTracker.getAllModels();
        models.forEach((model, index) => {
            const toggle = new PIXI.Container();
            toggle.x = 10 + (index % 3) * 90;
            toggle.y = yPos + 15 + Math.floor(index / 3) * 25;

            // Toggle background
            const bg = new PIXI.Graphics();
            const isVisible = this.modelVisibility.get(model.id);
            bg.beginFill(isVisible ? model.color : 0x222233, 0.3);
            bg.lineStyle(1, model.color, 0.5);
            bg.drawRoundedRect(0, 0, 85, 20, 4);
            bg.endFill();
            toggle.addChild(bg);

            // Status indicator
            const indicator = new PIXI.Graphics();
            indicator.beginFill(isVisible ? 0x00FF00 : 0xFF0000, 1);
            indicator.drawCircle(8, 10, 4);
            indicator.endFill();
            toggle.addChild(indicator);

            // Model name
            const text = new PIXI.Text(model.name.substring(0, 8), {
                fontFamily: 'Arial, sans-serif',
                fontSize: 9,
                fill: 0xFFFFFF
            });
            text.x = 18;
            text.y = 6;
            toggle.addChild(text);

            // Click handler
            toggle.interactive = true;
            toggle.cursor = 'pointer';
            toggle.on('pointerdown', () => {
                this.toggleModelVisibility(model.id);
                this._rebuildControlPanel();
            });

            this.controlPanel.addChild(toggle);
        });
    }

    /**
     * Create depth layering controls
     * @private
     */
    _createDepthControls() {
        if (this._fallbackMode) return;

        const yPos = 180;

        // Depth scale label
        const label = new PIXI.Text('Depth:', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 11,
            fill: 0xAAAAAA
        });
        label.x = 10;
        label.y = yPos;
        this.controlPanel.addChild(label);

        // Simple depth indicator
        const indicator = new PIXI.Text('Z-order active', {
            fontFamily: 'monospace',
            fontSize: 9,
            fill: 0x00FF00
        });
        indicator.x = 60;
        indicator.y = yPos;
        this.controlPanel.addChild(indicator);
    }

    /**
     * Rebuild control panel
     * @private
     */
    _rebuildControlPanel() {
        if (!this.controlPanel) return;

        this.controlPanel.removeChildren();
        this._createControlPanel();
    }

    /**
     * Set transparency level
     * @param {number} value - Transparency value (0-100)
     */
    setTransparency(value) {
        this.transparency = Math.max(0, Math.min(100, value));
        this.transparencyValue.text = `${this.transparency}%`;
        this._updateTransparencyFill();
        this._applyTransparency();
    }

    /**
     * Get current transparency
     * @returns {number} Transparency value (0-100)
     */
    getTransparency() {
        return this.transparency;
    }

    /**
     * Set blend mode
     * @param {string} mode - Blend mode: 'normal', 'add', 'screen', 'multiply', 'overlay'
     */
    setBlendMode(mode) {
        if (!this.blendModes.hasOwnProperty(mode)) {
            console.warn(`[EnhancedOverlay] Unknown blend mode: ${mode}`);
            return;
        }

        this.currentBlendMode = mode;

        // Apply to comparative heatmap
        if (this.comparativeHeatmap && this.comparativeHeatmap.options) {
            this.comparativeHeatmap.options.overlayBlendMode = mode;
        }

        // Rebuild containers with new blend mode
        if (this.comparativeHeatmap.mode === 'overlay') {
            this.comparativeHeatmap._rebuildContainers();
        }

        console.log(`[EnhancedOverlay] Blend mode set to: ${mode}`);
    }

    /**
     * Get current blend mode
     * @returns {string} Current blend mode
     */
    getBlendMode() {
        return this.currentBlendMode;
    }

    /**
     * Toggle model visibility
     * @param {string} modelId - Model ID
     */
    toggleModelVisibility(modelId) {
        const current = this.modelVisibility.get(modelId);
        this.modelVisibility.set(modelId, !current);
        console.log(`[EnhancedOverlay] Model ${modelId} visibility: ${!current}`);
    }

    /**
     * Set model visibility
     * @param {string} modelId - Model ID
     * @param {boolean} visible - Visibility state
     */
    setModelVisibility(modelId, visible) {
        this.modelVisibility.set(modelId, visible);
    }

    /**
     * Get model visibility
     * @param {string} modelId - Model ID
     * @returns {boolean} Visibility state
     */
    getModelVisibility(modelId) {
        return this.modelVisibility.get(modelId) ?? true;
    }

    /**
     * Set model-specific transparency
     * @param {string} modelId - Model ID
     * @param {number} value - Transparency value (0-100)
     */
    setModelTransparency(modelId, value) {
        this.modelTransparency.set(modelId, Math.max(0, Math.min(100, value)));
    }

    /**
     * Get model-specific transparency
     * @param {string} modelId - Model ID
     * @returns {number} Transparency value
     */
    getModelTransparency(modelId) {
        return this.modelTransparency.get(modelId) ?? this.transparency;
    }

    /**
     * Set Z-order (depth layering)
     * @param {Array} order - Array of {modelId, depth} objects
     */
    setZOrder(order) {
        this.zOrder = order;
        this._sortZOrder();
    }

    /**
     * Get Z-order
     * @returns {Array} Current Z-order
     */
    getZOrder() {
        return [...this.zOrder];
    }

    /**
     * Bring model to front
     * @param {string} modelId - Model ID
     */
    bringToFront(modelId) {
        const maxDepth = Math.max(...this.zOrder.map(z => z.depth));
        const item = this.zOrder.find(z => z.modelId === modelId);
        if (item) {
            item.depth = maxDepth + 1;
            this._sortZOrder();
        }
    }

    /**
     * Send model to back
     * @param {string} modelId - Model ID
     */
    sendToBack(modelId) {
        const minDepth = Math.min(...this.zOrder.map(z => z.depth));
        const item = this.zOrder.find(z => z.modelId === modelId);
        if (item) {
            item.depth = minDepth - 1;
            this._sortZOrder();
        }
    }

    /**
     * Apply enhanced overlay settings
     * This method applies all transparency, blend mode, and visibility settings
     */
    applySettings() {
        // Apply transparency to base heatmap
        if (this.comparativeHeatmap) {
            this.comparativeHeatmap.options.opacity = (100 - this.transparency) / 100;
            this.comparativeHeatmap.options.overlayBlendMode = this.currentBlendMode;
        }

        // Update overlay graphics with blend modes
        if (this.comparativeHeatmap && this.comparativeHeatmap.overlayGraphics) {
            for (const [modelId, graphics] of this.comparativeHeatmap.overlayGraphics) {
                // Apply blend mode
                const pixiBlendMode = this.blendModes[this.currentBlendMode];
                if (pixiBlendMode) {
                    graphics.blendMode = pixiBlendMode;
                }

                // Apply transparency
                const modelTrans = this.modelTransparency.get(modelId) ?? this.transparency;
                graphics.alpha = (100 - modelTrans) / 100;

                // Apply visibility
                graphics.visible = this.modelVisibility.get(modelId) ?? true;

                // Apply Z-order
                const zItem = this.zOrder.find(z => z.modelId === modelId);
                if (zItem) {
                    graphics.zIndex = zItem.depth;
                }
            }
        }
    }

    /**
     * Update enhanced overlay
     * @param {number} dt - Delta time
     */
    update(dt = 0.016) {
        // Apply settings before update
        this.applySettings();

        // Update base comparative heatmap
        if (this.comparativeHeatmap) {
            this.comparativeHeatmap.update(dt);
        }
    }

    /**
     * Get current state
     * @returns {Object} Current overlay state
     */
    getState() {
        return {
            transparency: this.transparency,
            blendMode: this.currentBlendMode,
            modelVisibility: Object.fromEntries(this.modelVisibility),
            modelTransparency: Object.fromEntries(this.modelTransparency),
            zOrder: [...this.zOrder],
            depthScale: this.depthScale
        };
    }

    /**
     * Restore state
     * @param {Object} state - State to restore
     */
    restoreState(state) {
        if (state.transparency !== undefined) {
            this.setTransparency(state.transparency);
        }
        if (state.blendMode) {
            this.setBlendMode(state.blendMode);
        }
        if (state.modelVisibility) {
            Object.entries(state.modelVisibility).forEach(([id, visible]) => {
                this.modelVisibility.set(id, visible);
            });
        }
        if (state.modelTransparency) {
            Object.entries(state.modelTransparency).forEach(([id, trans]) => {
                this.modelTransparency.set(id, trans);
            });
        }
        if (state.zOrder) {
            this.setZOrder(state.zOrder);
        }
        if (state.depthScale !== undefined) {
            this.depthScale = state.depthScale;
        }

        this._rebuildControlPanel();
    }

    /**
     * Toggle control panel visibility
     */
    toggleControlPanel() {
        if (this.controlPanel) {
            this.controlPanel.visible = !this.controlPanel.visible;
        }
    }

    /**
     * Set control panel visibility
     * @param {boolean} visible - Visibility state
     */
    setControlPanelVisible(visible) {
        if (this.controlPanel) {
            this.controlPanel.visible = visible;
        }
    }

    /**
     * Get statistics
     * @returns {Object} Statistics
     */
    getStats() {
        const models = this.multiModelTracker.getAllModels();
        const visibleModels = models.filter(m => this.modelVisibility.get(m.id));

        return {
            totalModels: models.length,
            visibleModels: visibleModels.length,
            transparency: this.transparency,
            blendMode: this.currentBlendMode,
            depthLayers: this.zOrder.length
        };
    }

    /**
     * Destroy enhanced overlay
     */
    destroy() {
        if (this.controlPanel && this.controlPanel.parent) {
            this.controlPanel.parent.removeChild(this.controlPanel);
        }
        this.controlPanel?.destroy();

        if (this.container && this.container.parent) {
            this.container.parent.removeChild(this.container);
        }
        this.container?.destroy();

        this.modelVisibility.clear();
        this.modelTransparency.clear();
        this.zOrder = [];

        console.log('[EnhancedOverlay] Destroyed');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.EnhancedOverlay = EnhancedOverlay;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { EnhancedOverlay };
}
