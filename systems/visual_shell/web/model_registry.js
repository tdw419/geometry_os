/**
 * Model Registry
 *
 * Central registry for managing LLM model metadata with localStorage persistence.
 * Provides CRUD operations, querying, and export/import functionality.
 * Part of: Neural Heatmap Phase 2.1.3 - Model Zoo Expansion
 * @see docs/plans/2026-02-07-neural-heatmap-roadmap.md
 */

class ModelRegistry {
    /**
     * Create a new ModelRegistry
     * @param {Object} options - Configuration options
     * @param {string} options.storageKey - localStorage key (default: 'model_zoo_registry')
     * @param {boolean} options.autoSave - Auto-save on changes (default: true)
     * @param {number} options.maxModels - Maximum models to store (default: 100)
     */
    constructor(options = {}) {
        this.options = {
            storageKey: 'model_zoo_registry',
            autoSave: true,
            maxModels: 100,
            ...options
        };

        // In-memory model store: Map<modelId, ModelMetadata>
        this.models = new Map();

        // Event callbacks
        this.listeners = {
            add: [],
            update: [],
            remove: [],
            change: []
        };

        // Statistics
        this.stats = {
            totalAdds: 0,
            totalUpdates: 0,
            totalRemoves: 0,
            lastSaveTime: null
        };

        // Load from localStorage
        this._load();

        console.log(`[ModelRegistry] Initialized with ${this.models.size} models`);
    }

    /**
     * Register a new model
     * @param {Object} modelData - Model metadata
     * @returns {string} Model ID
     * @throws {Error} If validation fails or max models reached
     */
    register(modelData) {
        // Check max models limit
        if (this.models.size >= this.options.maxModels) {
            throw new Error(`Maximum models (${this.options.maxModels}) reached`);
        }

        // Create and validate metadata
        const metadata = ModelMetadata.create(modelData);
        const validation = ModelMetadata.validate(metadata);

        if (!validation.valid) {
            throw new Error(`Invalid model data: ${validation.errors.join(', ')}`);
        }

        // Check for duplicate IDs
        if (this.models.has(metadata.id)) {
            throw new Error(`Model with ID ${metadata.id} already exists`);
        }

        // Add to registry
        this.models.set(metadata.id, metadata);
        this.stats.totalAdds++;

        // Notify listeners
        this._notify('add', metadata);
        this._notify('change', { type: 'add', model: metadata });

        // Auto-save if enabled
        if (this.options.autoSave) {
            this.save();
        }

        console.log(`[ModelRegistry] Registered model: ${metadata.name} (${metadata.id})`);

        return metadata.id;
    }

    /**
     * Update an existing model
     * @param {string} modelId - Model ID to update
     * @param {Object} updates - Fields to update
     * @returns {boolean} True if updated successfully
     */
    update(modelId, updates) {
        const existing = this.models.get(modelId);
        if (!existing) {
            console.warn(`[ModelRegistry] Model not found: ${modelId}`);
            return false;
        }

        // Merge updates with existing data
        const updated = { ...existing, ...updates, id: existing.id };

        // Validate updated metadata
        const validation = ModelMetadata.validate(updated);
        if (!validation.valid) {
            console.warn(`[ModelRegistry] Invalid updates: ${validation.errors.join(', ')}`);
            return false;
        }

        // Update in registry
        this.models.set(modelId, updated);
        this.stats.totalUpdates++;

        // Notify listeners
        this._notify('update', updated);
        this._notify('change', { type: 'update', model: updated });

        // Auto-save if enabled
        if (this.options.autoSave) {
            this.save();
        }

        console.log(`[ModelRegistry] Updated model: ${updated.name}`);

        return true;
    }

    /**
     * Unregister a model
     * @param {string} modelId - Model ID to remove
     * @returns {boolean} True if removed successfully
     */
    unregister(modelId) {
        const model = this.models.get(modelId);
        if (!model) {
            console.warn(`[ModelRegistry] Model not found: ${modelId}`);
            return false;
        }

        // Remove from registry
        this.models.delete(modelId);
        this.stats.totalRemoves++;

        // Notify listeners
        this._notify('remove', model);
        this._notify('change', { type: 'remove', model });

        // Auto-save if enabled
        if (this.options.autoSave) {
            this.save();
        }

        console.log(`[ModelRegistry] Unregistered model: ${model.name}`);

        return true;
    }

    /**
     * Get a model by ID
     * @param {string} modelId - Model ID
     * @returns {ModelMetadata|null} Model metadata or null
     */
    get(modelId) {
        return this.models.get(modelId) || null;
    }

    /**
     * Get all models
     * @returns {Array} Array of all model metadata
     */
    getAll() {
        return Array.from(this.models.values());
    }

    /**
     * Get models by provider
     * @param {string} provider - Provider name
     * @returns {Array} Matching models
     */
    getByProvider(provider) {
        return this.getAll().filter(m => m.provider === provider);
    }

    /**
     * Get models by architecture
     * @param {string} architecture - Architecture type
     * @returns {Array} Matching models
     */
    getByArchitecture(architecture) {
        return this.getAll().filter(m => m.architecture === architecture);
    }

    /**
     * Get models with specific capability
     * @param {string} capability - Capability name
     * @returns {Array} Matching models
     */
    getByCapability(capability) {
        return this.getAll().filter(m => m.capabilities.includes(capability));
    }

    /**
     * Get active models
     * @returns {Array} Active models
     */
    getActive() {
        return this.getAll().filter(m => m.active);
    }

    /**
     * Query models with filter
     * @param {ModelFilter|Object} filter - Filter criteria
     * @returns {Array} Matching models
     */
    query(filter) {
        const modelFilter = filter instanceof ModelFilter
            ? filter
            : new ModelFilter(filter);

        return this.getAll().filter(model => modelFilter.matches(model));
    }

    /**
     * Find models by search term
     * @param {string} searchTerm - Search term
     * @returns {Array} Matching models
     */
    search(searchTerm) {
        const term = searchTerm.toLowerCase();
        return this.getAll().filter(model => {
            const inName = model.name.toLowerCase().includes(term);
            const inTags = model.tags.some(t => t.toLowerCase().includes(term));
            const inId = model.id.toLowerCase().includes(term);
            return inName || inTags || inId;
        });
    }

    /**
     * Sort models by field
     * @param {string} field - Field to sort by (name, parameters, addedDate)
     * @param {string} order - Sort order (asc, desc)
     * @returns {Array} Sorted models
     */
    sort(field = 'name', order = 'asc') {
        const models = this.getAll();

        return models.sort((a, b) => {
            let comparison = 0;

            switch (field) {
                case 'name':
                    comparison = a.name.localeCompare(b.name);
                    break;
                case 'parameters':
                    comparison = (b.parameters || 0) - (a.parameters || 0);
                    break;
                case 'addedDate':
                    comparison = new Date(a.addedDate) - new Date(b.addedDate);
                    break;
                case 'lastUsed':
                    const aTime = a.lastUsed ? new Date(a.lastUsed).getTime() : 0;
                    const bTime = b.lastUsed ? new Date(b.lastUsed).getTime() : 0;
                    comparison = bTime - aTime;
                    break;
                default:
                    comparison = 0;
            }

            return order === 'desc' ? -comparison : comparison;
        });
    }

    /**
     * Set model active state
     * @param {string} modelId - Model ID
     * @param {boolean} active - Active state
     * @returns {boolean} True if updated
     */
    setActive(modelId, active) {
        return this.update(modelId, { active, lastUsed: new Date().toISOString() });
    }

    /**
     * Toggle model active state
     * @param {string} modelId - Model ID
     * @returns {boolean|null} New active state or null if not found
     */
    toggleActive(modelId) {
        const model = this.get(modelId);
        if (!model) return null;

        const newState = !model.active;
        this.update(modelId, { active: newState, lastUsed: new Date().toISOString() });
        return newState;
    }

    /**
     * Get model count
     * @returns {number} Number of registered models
     */
    count() {
        return this.models.size;
    }

    /**
     * Check if model exists
     * @param {string} modelId - Model ID
     * @returns {boolean} True if exists
     */
    has(modelId) {
        return this.models.has(modelId);
    }

    /**
     * Clear all models
     */
    clear() {
        const count = this.models.size;
        this.models.clear();
        this.stats.totalRemoves += count;

        // Notify listeners
        this._notify('change', { type: 'clear' });

        // Auto-save if enabled
        if (this.options.autoSave) {
            this.save();
        }

        console.log(`[ModelRegistry] Cleared ${count} models`);
    }

    /**
     * Save registry to localStorage
     * @returns {boolean} True if saved successfully
     */
    save() {
        try {
            const data = {
                version: 1,
                timestamp: new Date().toISOString(),
                models: Array.from(this.models.entries())
            };

            localStorage.setItem(this.options.storageKey, JSON.stringify(data));

            this.stats.lastSaveTime = Date.now();

            return true;
        } catch (error) {
            console.error('[ModelRegistry] Save failed:', error);
            return false;
        }
    }

    /**
     * Load registry from localStorage
     * @private
     * @returns {boolean} True if loaded successfully
     */
    _load() {
        try {
            const serialized = localStorage.getItem(this.options.storageKey);
            if (!serialized) {
                console.log('[ModelRegistry] No saved registry found');
                return false;
            }

            const data = JSON.parse(serialized);

            // Validate version
            if (data.version !== 1) {
                console.warn(`[ModelRegistry] Unknown version: ${data.version}`);
                return false;
            }

            // Restore models
            this.models = new Map(data.models);

            console.log(`[ModelRegistry] Loaded ${this.models.size} models from storage`);

            return true;
        } catch (error) {
            console.error('[ModelRegistry] Load failed:', error);
            return false;
        }
    }

    /**
     * Export registry to JSON string
     * @param {boolean} pretty - Pretty print JSON
     * @returns {string} JSON string
     */
    exportJSON(pretty = true) {
        const data = {
            version: 1,
            exportedAt: new Date().toISOString(),
            count: this.models.size,
            models: Array.from(this.models.values())
        };

        return JSON.stringify(data, null, pretty ? 2 : 0);
    }

    /**
     * Import registry from JSON string
     * @param {string} jsonString - JSON string
     * @param {Object} options - Import options
     * @param {boolean} options.merge - Merge with existing (default: false)
     * @param {boolean} options.validate - Validate models (default: true)
     * @returns {Object} Import result with success, imported, skipped, failed
     */
    importJSON(jsonString, options = {}) {
        const opts = {
            merge: false,
            validate: true,
            ...options
        };

        let imported = 0;
        let skipped = 0;
        let failed = 0;

        try {
            const data = JSON.parse(jsonString);

            // Validate version
            if (data.version !== 1) {
                throw new Error(`Unknown version: ${data.version}`);
            }

            // Clear existing if not merging
            if (!opts.merge) {
                this.clear();
            }

            // Import models
            for (const modelData of data.models) {
                try {
                    // Validate if enabled
                    if (opts.validate) {
                        const validation = ModelMetadata.validate(modelData);
                        if (!validation.valid) {
                            console.warn(`[ModelRegistry] Skipping invalid model: ${validation.errors.join(', ')}`);
                            skipped++;
                            continue;
                        }
                    }

                    // Check for existing ID when merging
                    if (opts.merge && this.models.has(modelData.id)) {
                        skipped++;
                        continue;
                    }

                    // Add to registry
                    this.models.set(modelData.id, modelData);
                    imported++;

                } catch (error) {
                    console.error(`[ModelRegistry] Failed to import model:`, error);
                    failed++;
                }
            }

            // Save after import
            this.save();

            // Notify listeners
            this._notify('change', { type: 'import', count: imported });

            return {
                success: true,
                imported,
                skipped,
                failed
            };

        } catch (error) {
            console.error('[ModelRegistry] Import failed:', error);
            return {
                success: false,
                imported,
                skipped,
                failed,
                error: error.message
            };
        }
    }

    /**
     * Get registry statistics
     * @returns {Object} Statistics
     */
    getStats() {
        const models = this.getAll();

        return {
            ...this.stats,
            currentCount: this.models.size,
            byProvider: this._groupBy(models, 'provider'),
            byArchitecture: this._groupBy(models, 'architecture'),
            activeCount: models.filter(m => m.active).length,
            totalCapabilities: models.reduce((sum, m) => sum + m.capabilities.length, 0),
            avgParameters: models.length > 0
                ? models.reduce((sum, m) => sum + (m.parameters || 0), 0) / models.length
                : 0
        };
    }

    /**
     * Group models by field
     * @private
     * @param {Array} models - Models to group
     * @param {string} field - Field to group by
     * @returns {Object} Grouped counts
     */
    _groupBy(models, field) {
        const groups = {};
        for (const model of models) {
            const value = model[field] || 'unknown';
            groups[value] = (groups[value] || 0) + 1;
        }
        return groups;
    }

    /**
     * Register event listener
     * @param {string} event - Event name (add, update, remove, change)
     * @param {Function} callback - Callback function
     */
    on(event, callback) {
        if (this.listeners[event]) {
            this.listeners[event].push(callback);
        }
    }

    /**
     * Unregister event listener
     * @param {string} event - Event name
     * @param {Function} callback - Callback function
     */
    off(event, callback) {
        if (this.listeners[event]) {
            const index = this.listeners[event].indexOf(callback);
            if (index > -1) {
                this.listeners[event].splice(index, 1);
            }
        }
    }

    /**
     * Notify event listeners
     * @private
     * @param {string} event - Event name
     * @param {*} data - Event data
     */
    _notify(event, data) {
        if (this.listeners[event]) {
            for (const callback of this.listeners[event]) {
                try {
                    callback(data);
                } catch (error) {
                    console.error(`[ModelRegistry] Listener error:`, error);
                }
            }
        }
    }

    /**
     * Destroy registry and cleanup
     */
    destroy() {
        this.models.clear();
        this.listeners = {
            add: [],
            update: [],
            remove: [],
            change: []
        };
        console.log('[ModelRegistry] Destroyed');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.ModelRegistry = ModelRegistry;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { ModelRegistry };
}
