/**
 * MultiModelTracker - Track neural activity across multiple LLM models simultaneously
 *
 * Enables side-by-side comparison, correlation analysis, and differential visualization
 * of neural activations across different model architectures and instances.
 *
 * Part of: Neural Heatmap Phase 2.1 - Multi-Model Comparison
 * @see docs/plans/2026-02-07-neural-heatmap-phase2-multi-model.md
 */

class MultiModelTracker {
    /**
     * Create a new MultiModelTracker
     * @param {Object} options - Configuration options
     * @param {number} options.maxModels - Maximum concurrent models (default: 5)
     * @param {number} options.gridSize - Size of grid cells in pixels (default: 16)
     * @param {number} options.decayRate - Activity decay per second (default: 0.95)
     * @param {number} options.maxAge - Maximum activity age in seconds (default: 5.0)
     */
    constructor(options = {}) {
        this.options = {
            maxModels: 5,
            gridSize: 16,
            decayRate: 0.95,
            maxAge: 5.0,
            ...options
        };

        // Model registry: Map<modelId, ModelInfo>
        this.models = new Map();
        this.modelCounter = 0;

        // Per-model activity trackers: Map<modelId, ActivityTracker>
        this.trackers = new Map();

        // Color palette for different models
        this.modelColors = [
            0xFF6B6B, // Red
            0x4ECDC4, // Cyan
            0x45B7D1, // Blue
            0x96CEB4, // Green
            0xFECEA8  // Orange
        ];

        // Statistics
        this.stats = {
            totalModelsRegistered: 0,
            currentModelCount: 0,
            activeCellsPerModel: new Map(),
            lastUpdateTime: performance.now()
        };

        console.log(`[MultiModelTracker] Initialized (maxModels: ${this.options.maxModels})`);
    }

    /**
     * Register a new model for tracking
     * @param {string} modelName - Human-readable model name
     * @param {Object} options - Model-specific options
     * @param {number} options.color - Display color (hex, auto-assigned if null)
     * @param {string} options.architecture - Model architecture type
     * @returns {string} Model ID for reference
     */
    registerModel(modelName, options = {}) {
        // Check max model limit
        if (this.models.size >= this.options.maxModels) {
            console.warn(`[MultiModelTracker] Max models (${this.options.maxModels}) reached`);
            return null;
        }

        const modelId = `model_${this.modelCounter++}`;
        const color = options.color || this.modelColors[this.models.size % this.modelColors.length];

        // Create model info
        const modelInfo = {
            id: modelId,
            name: modelName,
            color: color,
            architecture: options.architecture || 'unknown',
            registeredAt: performance.now(),
            options: { ...options }
        };

        // Create activity tracker for this model
        const tracker = typeof ActivityTracker !== 'undefined'
            ? new ActivityTracker({
                gridSize: this.options.gridSize,
                decayRate: this.options.decayRate,
                maxAge: this.options.maxAge
            })
            : this._createFallbackTracker();

        // Store references
        this.models.set(modelId, modelInfo);
        this.trackers.set(modelId, tracker);
        this.stats.activeCellsPerModel.set(modelId, 0);

        this.stats.totalModelsRegistered++;
        this.stats.currentModelCount = this.models.size;

        console.log(`[MultiModelTracker] Registered model: ${modelName} (${modelId})`);

        return modelId;
    }

    /**
     * Create fallback tracker if ActivityTracker not available
     * @private
     */
    _createFallbackTracker() {
        return {
            activity: new Map(),
            layerActivity: new Map(),
            gridSize: this.options.gridSize,
            recordActivity: function(x, y, intensity = 1.0) {
                const gx = Math.floor(x / this.gridSize);
                const gy = Math.floor(y / this.gridSize);
                const key = `${gx},${gy}`;
                this.activity.set(key, Math.max(this.activity.get(key) || 0, intensity));
            },
            recordLayerAccess: function(layerName, bounds, intensity = 1.0) {
                this.layerActivity.set(layerName, {
                    intensity,
                    lastUpdate: performance.now() / 1000,
                    bounds: { ...bounds }
                });
                if (bounds) {
                    const startX = Math.floor(bounds.x / this.gridSize) * this.gridSize;
                    const startY = Math.floor(bounds.y / this.gridSize) * this.gridSize;
                    const endX = bounds.x + bounds.width;
                    const endY = bounds.y + bounds.height;
                    for (let gy = startY; gy < endY; gy += this.gridSize) {
                        for (let gx = startX; gx < endX; gx += this.gridSize) {
                            this.recordActivity(gx, gy, intensity);
                        }
                    }
                }
            },
            getActiveCells: function() {
                const cells = [];
                for (const [key, intensity] of this.activity) {
                    const [gx, gy] = key.split(',').map(Number);
                    cells.push({ x: gx * this.gridSize, y: gy * this.gridSize, intensity });
                }
                return cells;
            },
            getActivityAt: function(x, y) {
                const gx = Math.floor(x / this.gridSize);
                const gy = Math.floor(y / this.gridSize);
                return this.activity.get(`${gx},${gy}`) || 0;
            },
            clear: function() {
                this.activity.clear();
                this.layerActivity.clear();
            },
            update: function(dt) {
                const decayFactor = Math.pow(0.95, dt);
                const keysToDelete = [];
                for (const [key, value] of this.activity) {
                    const decayed = value * decayFactor;
                    if (decayed < 0.01) {
                        keysToDelete.push(key);
                    } else {
                        this.activity.set(key, decayed);
                    }
                }
                for (const key of keysToDelete) {
                    this.activity.delete(key);
                }
                return this.activity.size;
            }
        };
    }

    /**
     * Unregister a model and release its resources
     * @param {string} modelId - Model ID to unregister
     */
    unregisterModel(modelId) {
        if (!this.models.has(modelId)) {
            console.warn(`[MultiModelTracker] Unknown model: ${modelId}`);
            return;
        }

        const modelInfo = this.models.get(modelId);
        const tracker = this.trackers.get(modelId);

        // Clear tracker data
        tracker.clear();

        // Remove references
        this.models.delete(modelId);
        this.trackers.delete(modelId);
        this.stats.activeCellsPerModel.delete(modelId);

        this.stats.currentModelCount = this.models.size;

        console.log(`[MultiModelTracker] Unregistered model: ${modelInfo.name}`);
    }

    /**
     * Record activity for a specific model
     * @param {string} modelId - Model ID
     * @param {number} x - X coordinate in pixels
     * @param {number} y - Y coordinate in pixels
     * @param {number} intensity - Activity intensity (0-1)
     */
    recordActivity(modelId, x, y, intensity = 1.0) {
        const tracker = this.trackers.get(modelId);
        if (!tracker) {
            console.warn(`[MultiModelTracker] Unknown model ID: ${modelId}`);
            return;
        }

        tracker.recordActivity(x, y, intensity);
    }

    /**
     * Record layer access for a specific model
     * @param {string} modelId - Model ID
     * @param {string} layerName - Layer name
     * @param {Object} bounds - Layer bounds {x, y, width, height}
     * @param {number} intensity - Activity intensity
     */
    recordLayerAccess(modelId, layerName, bounds, intensity = 1.0) {
        const tracker = this.trackers.get(modelId);
        if (!tracker) {
            console.warn(`[MultiModelTracker] Unknown model ID: ${modelId}`);
            return;
        }

        tracker.recordLayerAccess(layerName, bounds, intensity);
    }

    /**
     * Get activity for a specific model at a point
     * @param {string} modelId - Model ID
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @returns {number} Activity level (0-1)
     */
    getModelActivityAt(modelId, x, y) {
        const tracker = this.trackers.get(modelId);
        return tracker ? tracker.getActivityAt(x, y) : 0;
    }

    /**
     * Get all active cells for a specific model
     * @param {string} modelId - Model ID
     * @returns {Array} Array of {x, y, intensity} objects
     */
    getModelActivity(modelId) {
        const tracker = this.trackers.get(modelId);
        return tracker ? tracker.getActiveCells() : [];
    }

    /**
     * Get activity for all models as a combined view
     * @returns {Map<string, Array>} Map of modelId -> activity arrays
     */
    getAllModelActivity() {
        const result = new Map();
        for (const [modelId, tracker] of this.trackers) {
            result.set(modelId, tracker.getActiveCells());
        }
        return result;
    }

    /**
     * Calculate correlation between two models' activity patterns
     * @param {string} modelId1 - First model ID
     * @param {string} modelId2 - Second model ID
     * @returns {number} Correlation coefficient (-1 to 1)
     */
    getCorrelation(modelId1, modelId2) {
        const tracker1 = this.trackers.get(modelId1);
        const tracker2 = this.trackers.get(modelId2);

        if (!tracker1 || !tracker2) {
            console.warn('[MultiModelTracker] Invalid model IDs for correlation');
            return 0;
        }

        // Get active cells from both models
        const cells1 = tracker1.getActiveCells();
        const cells2 = tracker2.getActiveCells();

        if (cells1.length === 0 || cells2.length === 0) {
            return 0;
        }

        // Create spatial maps for comparison
        const map1 = this._createSpatialMap(cells1);
        const map2 = this._createSpatialMap(cells2);

        // Calculate Pearson correlation
        let sumX = 0, sumY = 0, sumXY = 0, sumX2 = 0, sumY2 = 0;
        let n = 0;

        for (const [key, val1] of map1) {
            const val2 = map2.get(key) || 0;
            sumX += val1;
            sumY += val2;
            sumXY += val1 * val2;
            sumX2 += val1 * val1;
            sumY2 += val2 * val2;
            n++;
        }

        // Add cells only in map2
        for (const [key, val2] of map2) {
            if (!map1.has(key)) {
                sumX += 0;
                sumY += val2;
                sumXY += 0;
                sumX2 += 0;
                sumY2 += val2 * val2;
                n++;
            }
        }

        if (n < 2) return 0;

        const numerator = n * sumXY - sumX * sumY;
        const denominator = Math.sqrt((n * sumX2 - sumX * sumX) * (n * sumY2 - sumY * sumY));

        return denominator === 0 ? 0 : numerator / denominator;
    }

    /**
     * Create spatial map from cells for efficient comparison
     * @private
     */
    _createSpatialMap(cells) {
        const map = new Map();
        for (const cell of cells) {
            const key = `${cell.x},${cell.y}`;
            map.set(key, cell.intensity);
        }
        return map;
    }

    /**
     * Get differential activity between two models
     * @param {string} modelId1 - First model ID
     * @param {string} modelId2 - Second model ID
     * @returns {Array} Array of {x, y, delta} where delta is intensity difference
     */
    getDifferentialActivity(modelId1, modelId2) {
        const tracker1 = this.trackers.get(modelId1);
        const tracker2 = this.trackers.get(modelId2);

        if (!tracker1 || !tracker2) {
            console.warn('[MultiModelTracker] Invalid model IDs for differential');
            return [];
        }

        const cells1 = tracker1.getActiveCells();
        const cells2 = tracker2.getActiveCells();

        const map1 = this._createSpatialMap(cells1);
        const map2 = this._createSpatialMap(cells2);

        const differentials = [];
        const processedKeys = new Set();

        // Process cells in model 1
        for (const [key, val1] of map1) {
            const val2 = map2.get(key) || 0;
            const [x, y] = key.split(',').map(Number);
            differentials.push({ x, y, delta: val1 - val2 });
            processedKeys.add(key);
        }

        // Add cells only in model 2
        for (const [key, val2] of map2) {
            if (!processedKeys.has(key)) {
                const [x, y] = key.split(',').map(Number);
                differentials.push({ x, y, delta: -val2 }); // Negative because model2 - model1
            }
        }

        return differentials;
    }

    /**
     * Update all model trackers with temporal decay
     * @param {number} dt - Delta time in seconds
     * @returns {number} Total active cells across all models
     */
    update(dt = 0.016) {
        let totalActiveCells = 0;

        for (const [modelId, tracker] of this.trackers) {
            const activeCells = tracker.update(dt);
            this.stats.activeCellsPerModel.set(modelId, activeCells);
            totalActiveCells += activeCells;
        }

        this.stats.lastUpdateTime = performance.now();
        this.stats.totalActiveCells = totalActiveCells;

        return totalActiveCells;
    }

    /**
     * Get model information
     * @param {string} modelId - Model ID
     * @returns {Object|null} Model info or null
     */
    getModelInfo(modelId) {
        return this.models.get(modelId) || null;
    }

    /**
     * Get all registered models
     * @returns {Array} Array of model info objects
     */
    getAllModels() {
        return Array.from(this.models.values());
    }

    /**
     * Get model count
     * @returns {number} Number of registered models
     */
    getModelCount() {
        return this.models.size;
    }

    /**
     * Get current statistics
     * @returns {Object} Statistics object
     */
    getStats() {
        return {
            ...this.stats,
            activeCellsPerModel: Object.fromEntries(this.stats.activeCellsPerModel)
        };
    }

    /**
     * Clear all model activity
     */
    clear() {
        for (const tracker of this.trackers.values()) {
            tracker.clear();
        }
        console.log('[MultiModelTracker] All model activity cleared');
    }

    /**
     * Destroy tracker and release resources
     */
    destroy() {
        this.clear();
        this.models.clear();
        this.trackers.clear();
        this.stats.activeCellsPerModel.clear();
        console.log('[MultiModelTracker] Destroyed');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.MultiModelTracker = MultiModelTracker;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { MultiModelTracker };
}
