/**
 * Model Metadata Schemas
 *
 * Defines metadata structures and validation for LLM models in the Model Zoo.
 * Part of: Neural Heatmap Phase 2.1.3 - Model Zoo Expansion
 * @see docs/plans/2026-02-07-neural-heatmap-roadmap.md
 */

/**
 * Model metadata schema definition
 * @typedef {Object} ModelMetadata
 * @property {string} id - Unique model identifier
 * @property {string} name - Human-readable model name
 * @property {string} provider - Model provider (lm-studio, ollama, openai, etc.)
 * @property {string} architecture - Model architecture (llama, mistral, qwen, etc.)
 * @property {number} parameters - Parameter count in billions
 * @property {number} contextLength - Maximum context window
 * @property {string[]} capabilities - Supported capabilities (vision, code, chat, etc.)
 * @property {Object} performance - Performance metrics
 * @property {number} performance.tokensPerSecond - Inference speed
 * @property {number} performance.memoryUsage - VRAM usage in GB
 * @property {Object} connection - Connection details
 * @property {string} connection.endpoint - API endpoint URL
 * @property {string} connection.port - WebSocket port (if applicable)
 * @property {string[]} tags - User-defined tags for filtering
 * @property {boolean} active - Whether model is currently active
 * @property {string} addedDate - ISO timestamp when model was added
 * @property {string} lastUsed - ISO timestamp of last use
 * @property {Object} customFields - Additional custom metadata
 */

/**
 * Model capability enum
 * @enum {string}
 */
const ModelCapability = {
    VISION: 'vision',
    CODE: 'code',
    CHAT: 'chat',
    COMPLETION: 'completion',
    EMBEDDING: 'embedding',
    TOOL_USE: 'tool_use',
    MULTILINGUAL: 'multilingual',
    JSON_MODE: 'json_mode',
    FUNCTION_CALLING: 'function_calling'
};

/**
 * Model provider enum
 * @enum {string}
 */
const ModelProvider = {
    LM_STUDIO: 'lm-studio',
    OLLAMA: 'ollama',
    OPENAI: 'openai',
    ANTHROPIC: 'anthropic',
    COHERE: 'cohere',
    HUGGINGFACE: 'huggingface',
    CUSTOM: 'custom'
};

/**
 * Model architecture enum
 * @enum {string}
 */
const ModelArchitecture = {
    LLAMA: 'llama',
    MISTRAL: 'mistral',
    QWEN: 'qwen',
    GPT: 'gpt',
    CLAUDE: 'claude',
    GEMMA: 'gemma',
    PHI: 'phi',
    FALCON: 'falcon',
    OTHER: 'other'
};

/**
 * ModelMetadata class for creating and validating model metadata
 */
class ModelMetadata {
    /**
     * Create a new ModelMetadata instance
     * @param {Object} data - Raw model data
     * @returns {ModelMetadata} Validated model metadata
     * @throws {Error} If validation fails
     */
    static create(data) {
        const metadata = {
            id: data.id || this._generateId(),
            name: data.name || 'Unknown Model',
            provider: data.provider || ModelProvider.CUSTOM,
            architecture: data.architecture || ModelArchitecture.OTHER,
            parameters: this._parseParameters(data.parameters),
            contextLength: data.contextLength || 4096,
            capabilities: this._normalizeCapabilities(data.capabilities || []),
            performance: {
                tokensPerSecond: data.performance?.tokensPerSecond || 0,
                memoryUsage: data.performance?.memoryUsage || 0
            },
            connection: {
                endpoint: data.connection?.endpoint || '',
                port: data.connection?.port || ''
            },
            tags: data.tags || [],
            active: data.active ?? false,
            addedDate: data.addedDate || new Date().toISOString(),
            lastUsed: data.lastUsed || null,
            customFields: data.customFields || {}
        };

        // Validate required fields
        if (!metadata.name) {
            throw new Error('Model name is required');
        }

        // Validate capabilities
        metadata.capabilities = metadata.capabilities.filter(cap =>
            Object.values(ModelCapability).includes(cap)
        );

        // Validate provider
        if (!Object.values(ModelProvider).includes(metadata.provider)) {
            console.warn(`Unknown provider: ${metadata.provider}`);
        }

        return metadata;
    }

    /**
     * Generate a unique model ID
     * @private
     * @returns {string} Unique ID
     */
    static _generateId() {
        return `model_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
    }

    /**
     * Parse parameter count from various formats
     * @private
     * @param {number|string} params - Parameter count (e.g., 7, "7B", "7.5b")
     * @returns {number} Parameter count in billions
     */
    static _parseParameters(params) {
        if (typeof params === 'number') return params;
        if (typeof params === 'string') {
            const match = params.match(/([\d.]+)\s*b/i);
            return match ? parseFloat(match[1]) : 0;
        }
        return 0;
    }

    /**
     * Normalize capabilities array
     * @private
     * @param {string[]} capabilities - Raw capabilities
     * @returns {string[]} Normalized capabilities
     */
    static _normalizeCapabilities(capabilities) {
        return capabilities.map(cap => {
            const normalized = cap.toLowerCase().replace(/[-_]/g, '');
            // Map common aliases to standard capabilities
            const aliases = {
                'vision': ModelCapability.VISION,
                'image': ModelCapability.VISION,
                'multimodal': ModelCapability.VISION,
                'coding': ModelCapability.CODE,
                'programming': ModelCapability.CODE,
                'conversation': ModelCapability.CHAT,
                'instruct': ModelCapability.CHAT,
                'inference': ModelCapability.COMPLETION,
                'embeddings': ModelCapability.EMBEDDING,
                'tools': ModelCapability.TOOL_USE,
                'agents': ModelCapability.TOOL_USE
            };
            return aliases[normalized] || cap;
        });
    }

    /**
     * Validate model metadata
     * @param {ModelMetadata} metadata - Metadata to validate
     * @returns {Object} Validation result with valid flag and errors array
     */
    static validate(metadata) {
        const errors = [];

        if (!metadata.name || metadata.name.trim() === '') {
            errors.push('Model name is required');
        }

        if (metadata.parameters < 0) {
            errors.push('Parameter count cannot be negative');
        }

        if (metadata.contextLength < 1) {
            errors.push('Context length must be at least 1');
        }

        if (!metadata.connection.endpoint && metadata.provider === ModelProvider.LM_STUDIO) {
            errors.push('LM Studio models require an endpoint');
        }

        return {
            valid: errors.length === 0,
            errors
        };
    }

    /**
     * Create metadata from LM Studio model info
     * @param {Object} lmStudioModel - LM Studio model object
     * @returns {ModelMetadata} Formatted metadata
     */
    static fromLMStudio(lmStudioModel) {
        return this.create({
            name: lmStudioModel.id || lmStudioModel.model || 'Unknown',
            provider: ModelProvider.LM_STUDIO,
            architecture: this._inferArchitecture(lmStudioModel.id || ''),
            parameters: this._extractParamsFromModelName(lmStudioModel.id || ''),
            contextLength: lmStudioModel.context_length || lmStudioModel.max_tokens || 4096,
            capabilities: this._inferCapabilities(lmStudioModel.id || ''),
            connection: {
                endpoint: lmStudioModel.endpoint || 'http://localhost:1234',
                port: lmStudioModel.port || '1234'
            },
            tags: ['lm-studio', 'discovered']
        });
    }

    /**
     * Infer architecture from model name
     * @private
     * @param {string} modelName - Model name
     * @returns {string} Architecture type
     */
    static _inferArchitecture(modelName) {
        const name = modelName.toLowerCase();
        if (name.includes('llama')) return ModelArchitecture.LLAMA;
        if (name.includes('mistral')) return ModelArchitecture.MISTRAL;
        if (name.includes('mixtral')) return ModelArchitecture.MISTRAL;
        if (name.includes('qwen')) return ModelArchitecture.QWEN;
        if (name.includes('gemma')) return ModelArchitecture.GEMMA;
        if (name.includes('phi')) return ModelArchitecture.PHI;
        if (name.includes('falcon')) return ModelArchitecture.FALCON;
        return ModelArchitecture.OTHER;
    }

    /**
     * Extract parameter count from model name
     * @private
     * @param {string} modelName - Model name
     * @returns {number} Parameter count in billions
     */
    static _extractParamsFromModelName(modelName) {
        const match = modelName.match(/(\d+(?:\.\d+)?)\s*b/i);
        return match ? parseFloat(match[1]) : 0;
    }

    /**
     * Infer capabilities from model name
     * @private
     * @param {string} modelName - Model name
     * @returns {string[]} Inferred capabilities
     */
    static _inferCapabilities(modelName) {
        const name = modelName.toLowerCase();
        const capabilities = [ModelCapability.CHAT, ModelCapability.COMPLETION];

        if (name.includes('vision') || name.includes('vl') || name.includes('mm')) {
            capabilities.push(ModelCapability.VISION);
        }
        if (name.includes('code') || name.includes('instruct')) {
            capabilities.push(ModelCapability.CODE);
        }
        if (name.includes('tool')) {
            capabilities.push(ModelCapability.TOOL_USE);
        }

        return capabilities;
    }

    /**
     * Create a summary string for display
     * @param {ModelMetadata} metadata - Model metadata
     * @returns {string} Formatted summary
     */
    static summarize(metadata) {
        const params = metadata.parameters > 0
            ? `${metadata.parameters}B`
            : 'Unknown size';
        const caps = metadata.capabilities.slice(0, 3).join(', ');
        return `${metadata.name} (${params}) - ${caps}`;
    }

    /**
     * Compare two models by parameters
     * @param {ModelMetadata} a - First model
     * @param {ModelMetadata} b - Second model
     * @returns {number} Comparison result
     */
    static compareByParameters(a, b) {
        return (b.parameters || 0) - (a.parameters || 0);
    }

    /**
     * Compare two models by name
     * @param {ModelMetadata} a - First model
     * @param {ModelMetadata} b - Second model
     * @returns {number} Comparison result
     */
    static compareByName(a, b) {
        return a.name.localeCompare(b.name);
    }
}

/**
 * ModelFilter for querying models
 */
class ModelFilter {
    /**
     * Create a new ModelFilter
     * @param {Object} criteria - Filter criteria
     */
    constructor(criteria = {}) {
        this.criteria = {
            provider: criteria.provider || null,
            architecture: criteria.architecture || null,
            minParameters: criteria.minParameters || 0,
            maxParameters: criteria.maxParameters || Infinity,
            capabilities: criteria.capabilities || [],
            tags: criteria.tags || [],
            active: criteria.active,
            search: criteria.search || ''
        };
    }

    /**
     * Test if a model matches the filter criteria
     * @param {ModelMetadata} model - Model to test
     * @returns {boolean} True if model matches
     */
    matches(model) {
        // Provider filter
        if (this.criteria.provider && model.provider !== this.criteria.provider) {
            return false;
        }

        // Architecture filter
        if (this.criteria.architecture && model.architecture !== this.criteria.architecture) {
            return false;
        }

        // Parameter range filter
        if (model.parameters < this.criteria.minParameters ||
            model.parameters > this.criteria.maxParameters) {
            return false;
        }

        // Capabilities filter (must have all specified capabilities)
        if (this.criteria.capabilities.length > 0) {
            const hasAllCapabilities = this.criteria.capabilities.every(cap =>
                model.capabilities.includes(cap)
            );
            if (!hasAllCapabilities) return false;
        }

        // Tags filter (must have at least one specified tag)
        if (this.criteria.tags.length > 0) {
            const hasTag = this.criteria.tags.some(tag =>
                model.tags.includes(tag)
            );
            if (!hasTag) return false;
        }

        // Active filter
        if (this.criteria.active !== undefined && model.active !== this.criteria.active) {
            return false;
        }

        // Search filter (name contains search string)
        if (this.criteria.search) {
            const searchLower = this.criteria.search.toLowerCase();
            const inName = model.name.toLowerCase().includes(searchLower);
            const inTags = model.tags.some(t => t.toLowerCase().includes(searchLower));
            if (!inName && !inTags) return false;
        }

        return true;
    }

    /**
     * Update filter criteria
     * @param {Object} updates - Criteria updates
     */
    update(updates) {
        Object.assign(this.criteria, updates);
    }

    /**
     * Clear all filter criteria
     */
    clear() {
        this.criteria = {
            provider: null,
            architecture: null,
            minParameters: 0,
            maxParameters: Infinity,
            capabilities: [],
            tags: [],
            active: undefined,
            search: ''
        };
    }

    /**
     * Get current filter criteria
     * @returns {Object} Copy of current criteria
     */
    getCriteria() {
        return { ...this.criteria };
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.ModelMetadata = ModelMetadata;
    window.ModelCapability = ModelCapability;
    window.ModelProvider = ModelProvider;
    window.ModelArchitecture = ModelArchitecture;
    window.ModelFilter = ModelFilter;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        ModelMetadata,
        ModelCapability,
        ModelProvider,
        ModelArchitecture,
        ModelFilter
    };
}
