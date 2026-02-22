/**
 * CrossLayerAnalyzer - Analyze correlations between neural layers across models
 *
 * Computes correlation matrices showing how different layers correlate
 * across multiple models, identifying architectural similarities.
 *
 * Part of: Neural Heatmap Phase 2.1.4 - Advanced Correlation Analytics
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-1-4-correlation-analytics.md
 *
 * Phase 2.2: Web Workers Performance Optimization
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-2-web-workers.md
 */

class CrossLayerAnalyzer {
    /**
     * Create a new CrossLayerAnalyzer
     * @param {Object} options - Configuration options
     * @param {number} options.windowSize - Number of frames to analyze (default: 100)
     * @param {number} options.correlationThreshold - Minimum correlation for significance (default: 0.3)
     * @param {number} options.cacheSize - Maximum cache entries (default: 1000)
     */
    constructor(options = {}) {
        this.options = {
            windowSize: 100,
            correlationThreshold: 0.3,
            cacheSize: 1000,
            enableWorkers: true, // Enable Web Workers for parallel processing
            ...options
        };

        // Layer activity history: Map<key, Array<activityData>>
        // key format: "modelId:layerName"
        this.layerHistory = new Map();

        // Correlation cache: Map<cacheKey, correlation>
        // cacheKey format: "modelId1:layer1|modelId2:layer2"
        this.correlationCache = new Map();

        // Statistics
        this.stats = {
            totalRecords: 0,
            totalCorrelationsComputed: 0,
            cacheHits: 0,
            cacheMisses: 0
        };

        // Worker manager for parallel processing
        this.workerManager = null;

        // Initialize workers if enabled and available
        if (this.options.enableWorkers && typeof WorkerManager !== 'undefined') {
            try {
                this.workerManager = new WorkerManager({
                    maxWorkers: 4,
                    minWorkers: 2,
                    enableFallback: true
                });

                // Sync history to workers
                this._syncHistoryToWorkers();

                console.log('[CrossLayerAnalyzer] Initialized with Web Workers support');
            } catch (error) {
                console.warn('[CrossLayerAnalyzer] Failed to initialize workers:', error);
                this.workerManager = null;
            }
        } else {
            console.log('[CrossLayerAnalyzer] Initialized (synchronous mode)');
        }
    }

    /**
     * Record activity for a specific layer
     * @param {string} modelId - Model identifier
     * @param {string} layerName - Layer name (e.g., "layers.5.self_attn")
     * @param {Object} bounds - Layer bounds {x, y, width, height}
     * @param {number} intensity - Average intensity (0-1)
     * @param {number} timestamp - Activity timestamp
     */
    recordLayerActivity(modelId, layerName, bounds, intensity, timestamp = performance.now()) {
        const key = `${modelId}:${layerName}`;

        if (!this.layerHistory.has(key)) {
            this.layerHistory.set(key, []);
        }

        const history = this.layerHistory.get(key);
        history.push({
            timestamp,
            intensity,
            bounds: { ...bounds },
            spatialMap: this._computeSpatialMap(bounds),
            modelId,
            layerName
        });

        // Trim history to window size
        if (history.length > this.options.windowSize) {
            history.shift();
        }

        this.stats.totalRecords++;

        // Invalidate cache for this layer when new data arrives
        this._invalidateCache(key);

        // Sync to workers if available
        if (this.workerManager && this.workerManager.isAvailable()) {
            this.workerManager.updateWorkerData('correlation', 'add_activity', {
                modelId,
                layerName,
                bounds,
                intensity,
                timestamp
            });
        }
    }

    /**
     * Record multiple layer activities at once
     * @param {Array} activities - Array of {modelId, layerName, bounds, intensity, timestamp}
     */
    recordBatch(activities) {
        for (const activity of activities) {
            this.recordLayerActivity(
                activity.modelId,
                activity.layerName,
                activity.bounds,
                activity.intensity,
                activity.timestamp
            );
        }
    }

    /**
     * Compute correlation between two layers
     * @param {string} modelId1 - First model
     * @param {string} layer1 - First layer
     * @param {string} modelId2 - Second model
     * @param {string} layer2 - Second layer
     * @returns {number} Correlation coefficient (-1 to 1)
     */
    getLayerCorrelation(modelId1, layer1, modelId2, layer2) {
        const key = this._getCacheKey(modelId1, layer1, modelId2, layer2);

        if (this.correlationCache.has(key)) {
            this.stats.cacheHits++;
            return this.correlationCache.get(key);
        }

        this.stats.cacheMisses++;

        const history1 = this.layerHistory.get(`${modelId1}:${layer1}`);
        const history2 = this.layerHistory.get(`${modelId2}:${layer2}`);

        if (!history1 || !history2 || history1.length < 2 || history2.length < 2) {
            return 0;
        }

        // Compute temporal correlation
        const correlation = this._computeTemporalCorrelation(history1, history2);

        // Cache the result
        this._addToCache(key, correlation);
        this.stats.totalCorrelationsComputed++;

        return correlation;
    }

    /**
     * Get correlation matrix for all layers across all models
     * @param {Array} modelIds - Array of model IDs
     * @param {Array} layerNames - Array of layer names
     * @returns {Object} Correlation matrix with correlations Map and metadata
     */
    /**
     * Get correlation matrix for all layers across all models
     * @param {Array} modelIds - Array of model IDs
     * @param {Array} layerNames - Array of layer names
     * @param {Object} options - Options including {useWorkers, onProgress}
     * @returns {Promise<Object>} Correlation matrix with correlations Map and metadata
     */
    async getCorrelationMatrix(modelIds, layerNames, options = {}) {
        const useWorkers = options.useWorkers !== false && this.workerManager && this.workerManager.isAvailable();

        if (useWorkers && modelIds.length * layerNames.length > 100) {
            // Use workers for large matrices
            try {
                const result = await this.workerManager.computeCorrelationMatrix(modelIds, layerNames, {
                    chunkSize: 10,
                    onProgress: options.onProgress
                });

                // Convert results array to Map
                const correlations = new Map();
                for (const item of result.results) {
                    correlations.set(item.key, item);
                }

                return {
                    modelIds: [...modelIds],
                    layerNames: [...layerNames],
                    correlations: correlations,
                    computedAt: performance.now(),
                    computedWithWorkers: true,
                    computationTime: result.computationTime
                };
            } catch (error) {
                console.warn('[CrossLayerAnalyzer] Worker computation failed, falling back:', error);
                // Fall through to synchronous computation
            }
        }

        // Synchronous computation (original implementation)
        return this._getCorrelationMatrixSync(modelIds, layerNames);
    }

    /**
     * Synchronous correlation matrix computation
     * @private
     */
    _getCorrelationMatrixSync(modelIds, layerNames) {
        const matrix = {
            modelIds: [...modelIds],
            layerNames: [...layerNames],
            correlations: new Map(),
            maxCorrelation: -Infinity,
            minCorrelation: Infinity,
            avgCorrelation: 0,
            computedAt: performance.now(),
            computedWithWorkers: false
        };

        let sumCorrelation = 0;
        let count = 0;

        for (const m1 of modelIds) {
            for (const m2 of modelIds) {
                for (const l1 of layerNames) {
                    for (const l2 of layerNames) {
                        const corr = this.getLayerCorrelation(m1, l1, m2, l2);

                        const key = `${m1}:${l1}|${m2}:${l2}`;
                        matrix.correlations.set(key, {
                            model1: m1,
                            layer1: l1,
                            model2: m2,
                            layer2: l2,
                            correlation: corr
                        });

                        if (corr !== 0) {
                            matrix.maxCorrelation = Math.max(matrix.maxCorrelation, corr);
                            matrix.minCorrelation = Math.min(matrix.minCorrelation, corr);
                            sumCorrelation += Math.abs(corr);
                            count++;
                        }
                    }
                }
            }
        }

        matrix.avgCorrelation = count > 0 ? sumCorrelation / count : 0;

        return matrix;
    }

    /**
     * Find layers with high cross-correlation
     * @param {number} threshold - Minimum correlation (default: 0.7)
     * @param {number} limit - Maximum results to return
     * @returns {Promise<Array>} Array of highly correlated layer pairs
     */
    async findHighCorrelations(threshold = 0.7, limit = 50) {
        if (this.workerManager && this.workerManager.isAvailable()) {
            try {
                return await this.workerManager.findHighCorrelations(threshold, limit);
            } catch (error) {
                console.warn('[CrossLayerAnalyzer] Worker findHighCorrelations failed:', error);
                // Fall through to synchronous implementation
            }
        }

        // Synchronous implementation
        const results = [];

        // Iterate through all layer pairs
        for (const [key1, history1] of this.layerHistory) {
            if (history1.length < 2) continue;

            for (const [key2, history2] of this.layerHistory) {
                if (key1 >= key2) continue; // Avoid duplicates
                if (history2.length < 2) continue;

                const [m1, l1] = key1.split(':');
                const [m2, l2] = key2.split(':');

                const corr = this._computeTemporalCorrelation(history1, history2);

                if (Math.abs(corr) >= threshold) {
                    results.push({
                        model1: m1,
                        layer1: l1,
                        model2: m2,
                        layer2: l2,
                        correlation: corr,
                        sampleSize: Math.min(history1.length, history2.length)
                    });
                }
            }
        }

        return results
            .sort((a, b) => Math.abs(b.correlation) - Math.abs(a.correlation))
            .slice(0, limit);
    }

    /**
     * Find low correlation (divergence) between layers
     * @param {number} threshold - Maximum correlation (default: 0.2)
     * @param {number} limit - Maximum results
     * @returns {Array} Array of low-correlation layer pairs
     */
    findDivergentLayers(threshold = 0.2, limit = 50) {
        const results = [];

        for (const [key1, history1] of this.layerHistory) {
            if (history1.length < 2) continue;

            for (const [key2, history2] of this.layerHistory) {
                if (key1 >= key2) continue;
                if (history2.length < 2) continue;

                const corr = this._computeTemporalCorrelation(history1, history2);

                if (Math.abs(corr) <= threshold) {
                    const [m1, l1] = key1.split(':');
                    const [m2, l2] = key2.split(':');

                    results.push({
                        model1: m1,
                        layer1: l1,
                        model2: m2,
                        layer2: l2,
                        correlation: corr,
                        sampleSize: Math.min(history1.length, history2.length)
                    });
                }
            }
        }

        return results
            .sort((a, b) => Math.abs(a.correlation) - Math.abs(b.correlation))
            .slice(0, limit);
    }

    /**
     * Get correlation heatmap data for visualization
     * @param {Array} modelIds - Models to include
     * @param {Array} layerNames - Layers to include
     * @returns {Object} Heatmap data with 2D array and color mappings
     */
    getCorrelationHeatmap(modelIds, layerNames) {
        const matrix = this.getCorrelationMatrix(modelIds, layerNames);
        const size = layerNames.length;
        const heatmap = new Array(size * size);

        for (let i = 0; i < size; i++) {
            for (let j = 0; j < size; j++) {
                // Find matching correlation (if comparing same layer across models)
                const key = `${modelIds[0]}:${layerNames[i]}|${modelIds[1] || modelIds[0]}:${layerNames[j]}`;
                const data = matrix.correlations.get(key);
                heatmap[i * size + j] = data ? data.correlation : 0;
            }
        }

        return {
            data: heatmap,
            size: size,
            labels: layerNames,
            min: matrix.minCorrelation,
            max: matrix.maxCorrelation,
            timestamp: matrix.computedAt
        };
    }

    /**
     * Compute spatial map from layer bounds
     * @private
     */
    _computeSpatialMap(bounds) {
        return {
            centerX: bounds.x + bounds.width / 2,
            centerY: bounds.y + bounds.height / 2,
            area: bounds.width * bounds.height,
            aspectRatio: bounds.width / (bounds.height || 1)
        };
    }

    /**
     * Compute temporal correlation between two layer histories
     * Uses Pearson correlation coefficient
     * @private
     */
    _computeTemporalCorrelation(history1, history2) {
        // Align sequences by index (assume same sampling rate)
        const n = Math.min(history1.length, history2.length);
        if (n < 2) return 0;

        let sumX = 0, sumY = 0, sumXY = 0, sumX2 = 0, sumY2 = 0;

        for (let i = 0; i < n; i++) {
            const x = history1[i].intensity;
            const y = history2[i].intensity;

            sumX += x;
            sumY += y;
            sumXY += x * y;
            sumX2 += x * x;
            sumY2 += y * y;
        }

        const numerator = n * sumXY - sumX * sumY;
        const denominator = Math.sqrt((n * sumX2 - sumX * sumX) * (n * sumY2 - sumY * sumY));

        return denominator === 0 ? 0 : numerator / denominator;
    }

    /**
     * Get cache key for layer pair
     * @private
     */
    _getCacheKey(m1, l1, m2, l2) {
        return `${m1}:${l1}|${m2}:${l2}`;
    }

    /**
     * Add result to cache with LRU eviction
     * @private
     */
    _addToCache(key, value) {
        // Enforce cache size limit
        if (this.correlationCache.size >= this.options.cacheSize) {
            // Remove oldest entry (first in Map)
            const firstKey = this.correlationCache.keys().next().value;
            this.correlationCache.delete(firstKey);
        }

        this.correlationCache.set(key, value);
    }

    /**
     * Invalidate cache entries for a layer
     * @private
     */
    _invalidateCache(layerKey) {
        for (const [key] of this.correlationCache) {
            if (key.startsWith(layerKey) || key.endsWith(layerKey)) {
                this.correlationCache.delete(key);
            }
        }
    }

    /**
     * Get statistics about the analyzer
     * @returns {Object} Statistics
     */
    getStats() {
        return {
            ...this.stats,
            layerCount: this.layerHistory.size,
            cacheSize: this.correlationCache.size,
            cacheHitRate: this.stats.totalCorrelationsComputed > 0
                ? this.stats.cacheHits / (this.stats.cacheHits + this.stats.cacheMisses)
                : 0
        };
    }

    /**
     * Get history for a specific layer
     * @param {string} modelId - Model ID
     * @param {string} layerName - Layer name
     * @returns {Array} Activity history or null
     */
    getLayerHistory(modelId, layerName) {
        const key = `${modelId}:${layerName}`;
        return this.layerHistory.get(key) || null;
    }

    /**
     * Get all tracked layers
     * @returns {Array} Array of {modelId, layerName, recordCount}
     */
    getTrackedLayers() {
        const layers = [];
        for (const [key, history] of this.layerHistory) {
            const [modelId, layerName] = key.split(':');
            layers.push({
                modelId,
                layerName,
                recordCount: history.length,
                lastUpdate: history[history.length - 1]?.timestamp
            });
        }
        return layers;
    }

    /**
     * Clear all history and cache
     */
    clear() {
        this.layerHistory.clear();
        this.correlationCache.clear();
        this.stats.totalRecords = 0;
        this.stats.totalCorrelationsComputed = 0;
        console.log('[CrossLayerAnalyzer] Cleared');
    }

    /**
     * Destroy analyzer and release resources
     */
    /**
     * Sync layer history to workers
     * @private
     */
    _syncHistoryToWorkers() {
        if (!this.workerManager || !this.workerManager.isAvailable()) return;

        // Convert Map to array for transfer
        const historyArray = Array.from(this.layerHistory.entries());

        this.workerManager.updateWorkerData('correlation', 'update_history', {
            history: historyArray
        });
    }

    /**
     * Get worker statistics if available
     * @returns {Object} Worker statistics or null
     */
    getWorkerStats() {
        if (this.workerManager) {
            return this.workerManager.getStats();
        }
        return null;
    }

    destroy() {
        if (this.workerManager) {
            this.workerManager.terminate();
            this.workerManager = null;
        }
        this.clear();
        console.log('[CrossLayerAnalyzer] Destroyed');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.CrossLayerAnalyzer = CrossLayerAnalyzer;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { CrossLayerAnalyzer };
}
