/**
 * ModelZooManager - Manage library of pretrained LLM models
 *
 * Provides:
 * - Predefined model library with metadata
 * - Custom model import functionality
 * - Model architecture detection
 * - Auto-configuration for heatmap visualization
 */

class ModelZooManager {
    constructor(options = {}) {
        this.options = {
            maxCustomModels: 10,
            ...options
        };

        // Built-in model library
        this.modelLibrary = new Map();
        this._initializeLibrary();

        // Custom imported models
        this.customModels = new Map();

        console.log('[ModelZoo] Manager initialized with', this.modelLibrary.size, 'built-in models');
    }

    /**
     * Initialize built-in model library
     * @private
     */
    _initializeLibrary() {
        // Qwen models
        this._addModelToLibrary({
            id: 'qwen-0.5b',
            name: 'Qwen 0.5B',
            architecture: 'transformer',
            layers: 24,
            hiddenSize: 896,
            attentionHeads: 14,
            color: 0xFF6B6B,
            layerTypes: ['tok_embeddings', 'layers.N.self_attn', 'layers.N.mlp', 'lm_head']
        });

        this._addModelToLibrary({
            id: 'qwen-1.8b',
            name: 'Qwen 1.8B',
            architecture: 'transformer',
            layers: 24,
            hiddenSize: 2048,
            attentionHeads: 16,
            color: 0xFF8E8E,
            layerTypes: ['tok_embeddings', 'layers.N.self_attn', 'layers.N.mlp', 'lm_head']
        });

        this._addModelToLibrary({
            id: 'qwen-7b',
            name: 'Qwen 7B',
            architecture: 'transformer',
            layers: 32,
            hiddenSize: 4096,
            attentionHeads: 32,
            color: 0xFF6B6B,
            layerTypes: ['tok_embeddings', 'layers.N.self_attn', 'layers.N.mlp', 'lm_head']
        });

        // Llama models
        this._addModelToLibrary({
            id: 'llama-7b',
            name: 'Llama 7B',
            architecture: 'llama',
            layers: 32,
            hiddenSize: 4096,
            attentionHeads: 32,
            color: 0x4ECDC4,
            layerTypes: ['tok_embeddings', 'layers.N.attention', 'layers.N.feed_forward', 'lm_head']
        });

        this._addModelToLibrary({
            id: 'llama-13b',
            name: 'Llama 13B',
            architecture: 'llama',
            layers: 40,
            hiddenSize: 5120,
            attentionHeads: 40,
            color: 0x45B7D1,
            layerTypes: ['tok_embeddings', 'layers.N.attention', 'layers.N.feed_forward', 'lm_head']
        });

        this._addModelToLibrary({
            id: 'llama-70b',
            name: 'Llama 70B',
            architecture: 'llama',
            layers: 80,
            hiddenSize: 8192,
            attentionHeads: 64,
            color: 0x96CEB4,
            layerTypes: ['tok_embeddings', 'layers.N.attention', 'layers.N.feed_forward', 'lm_head']
        });

        // Mistral models
        this._addModelToLibrary({
            id: 'mistral-7b',
            name: 'Mistral 7B',
            architecture: 'mistral',
            layers: 32,
            hiddenSize: 4096,
            attentionHeads: 32,
            color: 0xFECEA8,
            layerTypes: ['tok_embeddings', 'layers.N.self_attn', 'layers.N.mlp', 'lm_head']
        });

        // TinyLlama
        this._addModelToLibrary({
            id: 'tinyllama-1.1b',
            name: 'TinyLlama 1.1B',
            architecture: 'llama',
            layers: 22,
            hiddenSize: 2048,
            attentionHeads: 16,
            color: 0xDDA0DD,
            layerTypes: ['tok_embeddings', 'layers.N.attention', 'layers.N.feed_forward', 'lm_head']
        });

        // Phi models
        this._addModelToLibrary({
            id: 'phi-2',
            name: 'Phi-2',
            architecture: 'phi',
            layers: 32,
            hiddenSize: 2560,
            attentionHeads: 32,
            color: 0xF0E68C,
            layerTypes: ['tok_embeddings', 'layers.N.attention', 'layers.N.mlp', 'lm_head']
        });

        // Gemma models
        this._addModelToLibrary({
            id: 'gemma-2b',
            name: 'Gemma 2B',
            architecture: 'gemma',
            layers: 18,
            hiddenSize: 2048,
            attentionHeads: 8,
            color: 0xFFB347,
            layerTypes: ['tok_embeddings', 'layers.N.self_attn', 'layers.N.mlp', 'lm_head']
        });
    }

    /**
     * Add model to library
     * @private
     */
    _addModelToLibrary(modelInfo) {
        modelInfo.builtIn = true;
        modelInfo.registeredAt = Date.now();
        this.modelLibrary.set(modelInfo.id, modelInfo);
    }

    /**
     * Get model info by ID
     * @param {string} modelId - Model identifier
     * @returns {Object|null} Model info or null
     */
    getModel(modelId) {
        return this.modelLibrary.get(modelId) || this.customModels.get(modelId) || null;
    }

    /**
     * Get all built-in models
     * @returns {Array} Array of model info objects
     */
    getBuiltInModels() {
        return Array.from(this.modelLibrary.values());
    }

    /**
     * Get all custom models
     * @returns {Array} Array of custom model info objects
     */
    getCustomModels() {
        return Array.from(this.customModels.values());
    }

    /**
     * Get all models
     * @returns {Array} All models
     */
    getAllModels() {
        return [...this.getBuiltInModels(), ...this.getCustomModels()];
    }

    /**
     * Search models by name or architecture
     * @param {string} query - Search query
     * @returns {Array} Matching models
     */
    searchModels(query) {
        const lowerQuery = query.toLowerCase();
        return this.getAllModels().filter(model =>
            model.name.toLowerCase().includes(lowerQuery) ||
            model.architecture.toLowerCase().includes(lowerQuery) ||
            model.id.toLowerCase().includes(lowerQuery)
        );
    }

    /**
     * Import custom model
     * @param {Object} modelConfig - Model configuration
     * @returns {string} Model ID
     */
    importCustomModel(modelConfig) {
        if (this.customModels.size >= this.options.maxCustomModels) {
            throw new Error(`Maximum custom models (${this.options.maxCustomModels}) reached`);
        }

        const modelId = modelConfig.id || `custom_${Date.now()}`;

        // Validate required fields
        if (!modelConfig.name) {
            throw new Error('Model name is required');
        }

        const modelInfo = {
            id: modelId,
            name: modelConfig.name,
            architecture: modelConfig.architecture || 'unknown',
            layers: modelConfig.layers || 0,
            hiddenSize: modelConfig.hiddenSize || 0,
            attentionHeads: modelConfig.attentionHeads || 0,
            color: modelConfig.color || this._generateColor(),
            layerTypes: modelConfig.layerTypes || [],
            builtIn: false,
            registeredAt: Date.now(),
            customConfig: modelConfig
        };

        this.customModels.set(modelId, modelInfo);
        console.log('[ModelZoo] Imported custom model:', modelInfo.name);

        return modelId;
    }

    /**
     * Remove custom model
     * @param {string} modelId - Model ID to remove
     */
    removeCustomModel(modelId) {
        if (!this.customModels.has(modelId)) {
            console.warn('[ModelZoo] Custom model not found:', modelId);
            return;
        }

        this.customModels.delete(modelId);
        console.log('[ModelZoo] Removed custom model:', modelId);
    }

    /**
     * Get layer names for a model
     * @param {string} modelId - Model ID
     * @returns {Array} Array of layer names
     */
    getLayerNames(modelId) {
        const model = this.getModel(modelId);
        if (!model) return [];

        const layerNames = [];
        for (let i = 0; i < model.layers; i++) {
            model.layerTypes.forEach(type => {
                const layerName = type.replace('N', i.toString());
                layerNames.push(layerName);
            });
        }
        return layerNames;
    }

    /**
     * Get heatmap configuration for a model
     * @param {string} modelId - Model ID
     * @returns {Object} Heatmap configuration
     */
    getHeatmapConfig(modelId) {
        const model = this.getModel(modelId);
        if (!model) return null;

        return {
            modelId: model.id,
            modelName: model.name,
            color: model.color,
            layerNames: this.getLayerNames(modelId),
            totalLayers: model.layers,
            architecture: model.architecture
        };
    }

    /**
     * Generate random color for custom models
     * @private
     */
    _generateColor() {
        const hue = Math.floor(Math.random() * 360);
        return this._hslToHex(hue, 70, 60);
    }

    /**
     * Convert HSL to hex color
     * @private
     */
    _hslToHex(h, s, l) {
        l /= 100;
        const a = s * Math.min(l, 1 - l) / 100;
        const f = n => {
            const k = (n + h / 30) % 12;
            const color = l - a * Math.max(Math.min(k - 3, 9 - k, 1), -1);
            return Math.round(255 * color).toString(16).padStart(2, '0');
        };
        return parseInt(`0x${f(0)}${f(8)}${f(4)}`, 16);
    }

    /**
     * Export model library as JSON
     * @returns {Object} Serializable model library
     */
    exportLibrary() {
        return {
            builtIn: Array.from(this.modelLibrary.values()),
            custom: Array.from(this.customModels.values()),
            exportedAt: Date.now()
        };
    }

    /**
     * Import model library from JSON
     * @param {Object} data - Exported library data
     */
    importLibrary(data) {
        if (data.custom) {
            for (const model of data.custom) {
                try {
                    this.importCustomModel(model.customConfig || model);
                } catch (e) {
                    console.warn('[ModelZoo] Failed to import model:', model.name, e);
                }
            }
        }
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.ModelZooManager = ModelZooManager;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { ModelZooManager };
}
