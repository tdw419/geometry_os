/**
 * ModelZooUI - User interface for Model Zoo Manager
 *
 * Provides:
 * - Model selection dropdown
 * - Quick-add buttons for popular models
 * - Custom model import form
 * - Visual indicator of active models
 *
 * Part of: Neural Heatmap Phase 2.1 - Multi-Model Comparison
 * @see docs/plans/2026-02-07-neural-heatmap-phase2-multi-model.md
 */

class ModelZooUI {
    constructor(options = {}) {
        this.options = {
            width: 300,
            position: { x: 20, y: 20 },
            ...options
        };

        this.modelZoo = options.modelZoo;
        if (!this.modelZoo) {
            // Fallback to creating our own if not provided
            if (typeof ModelZooManager !== 'undefined') {
                this.modelZoo = new ModelZooManager();
            }
        }

        this.container = null;
        this.activeModels = new Set();
        this.onModelSelectCallback = null;
        this.modelButtons = new Map();
    }

    /**
     * Create the UI
     * @returns {PIXI.Container} UI container
     */
    create() {
        if (typeof PIXI === 'undefined') {
            console.warn('[ModelZooUI] PIXI not available, returning mock container');
            return { addChild: () => {}, visible: true };
        }

        this.container = new PIXI.Container();
        this.container.x = this.options.position.x;
        this.container.y = this.options.position.y;
        this.container.zIndex = 1000;

        // Background panel
        this._createBackground();

        // Title
        this._createTitle();

        // Quick add buttons
        this._createQuickAddButtons();

        // Model count indicator
        this._createModelCountLabel();

        // Custom import button
        this._createImportButton();

        // Make interactive
        this.container.eventMode = 'static';

        console.log('[ModelZooUI] Created');
        return this.container;
    }

    /**
     * Create background panel
     * @private
     */
    _createBackground() {
        const bg = new PIXI.Graphics();
        bg.beginFill(0x0a0a1a, 0.95);
        bg.lineStyle(1, 0x00FFFF, 0.3);
        bg.drawRoundedRect(0, 0, this.options.width, 400, 8);
        bg.endFill();
        this.container.addChild(bg);
    }

    /**
     * Create title
     * @private
     */
    _createTitle() {
        const title = new PIXI.Text('🏠 Model Zoo', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 16,
            fontWeight: 'bold',
            fill: 0x00FFFF
        });
        title.x = 15;
        title.y = 15;
        this.container.addChild(title);

        const subtitle = new PIXI.Text('Select models to compare', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 11,
            fill: 0x888888
        });
        subtitle.x = 15;
        subtitle.y = 38;
        this.container.addChild(subtitle);
    }

    /**
     * Create quick-add buttons for popular models
     * @private
     */
    _createQuickAddButtons() {
        const popularModels = ['qwen-7b', 'llama-7b', 'mistral-7b'];
        let buttonY = 65;

        popularModels.forEach(modelId => {
            const model = this.modelZoo?.getModel(modelId);
            if (!model) return;

            const button = this._createModelButton(model);
            button.x = 15;
            button.y = buttonY;
            this.container.addChild(button);

            this.modelButtons.set(model.id, button);

            buttonY += 35;
        });
    }

    /**
     * Create button for a model
     * @private
     */
    _createModelButton(model) {
        const button = new PIXI.Container();
        button.eventMode = 'static';
        button.cursor = 'pointer';

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(model.color, 0.2);
        bg.lineStyle(1, model.color, 0.5);
        bg.drawRoundedRect(0, 0, 270, 28, 4);
        bg.endFill();
        button.addChild(bg);

        // Model name
        const label = new PIXI.Text(model.name, {
            fontFamily: 'Arial, sans-serif',
            fontSize: 12,
            fill: model.color
        });
        label.x = 10;
        label.y = 7;
        button.addChild(label);

        // Add indicator
        const addLabel = new PIXI.Text('+ Add', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 10,
            fill: 0x00FF88
        });
        addLabel.x = 220;
        addLabel.y = 8;
        button.addChild(addLabel);

        // Click handler
        button.on('pointerdown', () => {
            this._onModelClick(model, button);
        });

        // Store reference for updates
        button.modelId = model.id;
        button.addLabel = addLabel;
        button.bg = bg;

        return button;
    }

    /**
     * Handle model button click
     * @private
     */
    _onModelClick(model, button) {
        if (this.activeModels.has(model.id)) {
            // Remove model
            this.activeModels.delete(model.id);
            button.addLabel.text = '+ Add';
            button.addLabel.style.fill = 0x00FF88;
            button.bg.clear();
            button.bg.beginFill(model.color, 0.2);
            button.bg.lineStyle(1, model.color, 0.5);
            button.bg.drawRoundedRect(0, 0, 270, 28, 4);
            button.bg.endFill();

            if (this.onModelSelectCallback) {
                this.onModelSelectCallback('remove', model);
            }
        } else {
            // Add model (limit to 3)
            if (this.activeModels.size >= 3) {
                console.warn('[ModelZooUI] Maximum 3 models allowed');
                return;
            }

            this.activeModels.add(model.id);
            button.addLabel.text = '✓ Added';
            button.addLabel.style.fill = 0x00FFFF;
            button.bg.clear();
            button.bg.beginFill(model.color, 0.4);
            button.bg.lineStyle(2, model.color, 1);
            button.bg.drawRoundedRect(0, 0, 270, 28, 4);
            button.bg.endFill();

            if (this.onModelSelectCallback) {
                this.onModelSelectCallback('add', model);
            }
        }
    }

    /**
     * Create model count label
     * @private
     */
    _createModelCountLabel() {
        const allModels = this.modelZoo?.getAllModels() || [];
        const countLabel = new PIXI.Text(
            `+ ${allModels.length - 3} more models available`,
            {
                fontFamily: 'Arial, sans-serif',
                fontSize: 10,
                fill: 0x666666
            }
        );
        countLabel.x = 15;
        countLabel.y = 175;
        countLabel.name = 'countLabel';
        this.container.addChild(countLabel);
    }

    /**
     * Create import button
     * @private
     */
    _createImportButton() {
        const button = new PIXI.Container();
        button.eventMode = 'static';
        button.cursor = 'pointer';

        const bg = new PIXI.Graphics();
        bg.beginFill(0x333355, 0.5);
        bg.lineStyle(1, 0x6666AA, 0.5);
        bg.drawRoundedRect(0, 0, 270, 30, 4);
        bg.endFill();
        button.addChild(bg);

        const label = new PIXI.Text('📥 Import Custom Model', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 11,
            fill: 0xAAAACC
        });
        label.x = 20;
        label.y = 8;
        button.addChild(label);

        button.x = 15;
        button.y = 360;
        this.container.addChild(button);

        button.on('pointerdown', () => {
            this._showImportDialog();
        });
    }

    /**
     * Show custom model import dialog
     * @private
     */
    _showImportDialog() {
        // For now, use browser prompt
        console.log('[ModelZooUI] Import dialog');

        const modelName = prompt('Enter model name:');
        if (modelName) {
            try {
                const modelId = this.modelZoo?.importCustomModel({
                    name: modelName,
                    architecture: 'custom'
                });
                console.log('[ModelZooUI] Imported:', modelId);
            } catch (e) {
                alert('Failed to import model: ' + e.message);
            }
        }
    }

    /**
     * Set callback for model selection
     * @param {Function} callback - (action, model) => void
     */
    onModelSelect(callback) {
        this.onModelSelectCallback = callback;
    }

    /**
     * Get active model IDs
     * @returns {Array} Array of active model IDs
     */
    getActiveModels() {
        return Array.from(this.activeModels);
    }

    /**
     * Clear active models
     */
    clearActiveModels() {
        // Reset all buttons
        for (const [modelId, button] of this.modelButtons) {
            if (this.activeModels.has(modelId)) {
                const model = this.modelZoo?.getModel(modelId);
                if (model) {
                    button.addLabel.text = '+ Add';
                    button.addLabel.style.fill = 0x00FF88;
                    button.bg.clear();
                    button.bg.beginFill(model.color, 0.2);
                    button.bg.lineStyle(1, model.color, 0.5);
                    button.bg.drawRoundedRect(0, 0, 270, 28, 4);
                    button.bg.endFill();
                }
            }
        }
        this.activeModels.clear();
    }

    /**
     * Show/hide the UI
     * @param {boolean} visible - Visibility state
     */
    setVisible(visible) {
        if (this.container) {
            this.container.visible = visible;
        }
    }

    /**
     * Destroy UI
     */
    destroy() {
        if (this.container) {
            this.container.destroy();
            this.container = null;
        }
        this.modelButtons.clear();
        this.activeModels.clear();
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.ModelZooUI = ModelZooUI;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { ModelZooUI };
}
