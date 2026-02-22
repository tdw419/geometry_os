/**
 * PredictiveAnalytics - LSTM-based time series forecasting for neural activity
 *
 * Implements predictive analytics using TensorFlow.js for:
 * - Time series forecasting with LSTM models
 * - Anomaly prediction based on historical patterns
 * - Confidence interval calculation
 * - Trend visualization with prediction overlays
 *
 * Part of: Neural Heatmap Phase 2.3 - Predictive Analytics Engine
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-3-roadmap.md
 *
 * @class PredictiveAnalytics
 */

class PredictiveAnalytics {
    /**
     * Create a new PredictiveAnalytics instance
     * @param {Object} options - Configuration options
     * @param {number} options.lookbackWindow - Number of time steps to look back (default: 20)
     * @param {number} options.predictionHorizon - Number of steps to predict (default: 10)
     * @param {number} options.lstmUnits - Number of LSTM units per layer (default: 64)
     * @param {number} options.lstmLayers - Number of LSTM layers (default: 2)
     * @param {number} options.epochs - Training epochs for online learning (default: 50)
     * @param {number} options.batchSize - Batch size for training (default: 32)
     * @param {number} options.confidenceLevel - Default confidence level (default: 0.95)
     * @param {boolean} options.enableOnlineLearning - Enable continuous learning (default: true)
     * @param {number} options.retrainInterval - Retrain interval in ms (default: 60000)
     */
    constructor(options = {}) {
        this.options = {
            lookbackWindow: 20,
            predictionHorizon: 10,
            lstmUnits: 64,
            lstmLayers: 2,
            epochs: 50,
            batchSize: 32,
            confidenceLevel: 0.95,
            enableOnlineLearning: true,
            retrainInterval: 60000,
            validationSplit: 0.2,
            earlyStoppingPatience: 10,
            ...options
        };

        // TensorFlow.js models (per-model predictions)
        this.models = new Map(); // Map<modelId, {model, scaler, lastTrained, predictions}>

        // Historical data buffers
        this.historyBuffer = new Map(); // Map<modelId, Array<{timestamp, value, features}>>

        // Prediction cache
        this.predictionCache = new Map();
        this.cacheExpiry = 5000; // 5 seconds

        // Anomaly detection models
        this.anomalyDetectors = new Map(); // Map<modelId, AnomalyDetector>

        // Performance metrics
        this.metrics = {
            modelsTrained: 0,
            predictionsMade: 0,
            anomaliesDetected: 0,
            avgPredictionTime: 0,
            avgTrainingTime: 0
        };

        // Theme integration
        this.themeManager = null;
        this._initTheme();

        // Check TensorFlow.js availability
        this.tfAvailable = typeof tf !== 'undefined';
        if (!this.tfAvailable) {
            console.warn('[PredictiveAnalytics] TensorFlow.js not available, using fallback predictions');
        }

        // Initialize online learning timer
        this.learningTimer = null;
        if (this.options.enableOnlineLearning) {
            this._startOnlineLearning();
        }

        console.log('[PredictiveAnalytics] Initialized with',
            this.tfAvailable ? 'TensorFlow.js' : 'fallback mode');
    }

    /**
     * Initialize theme manager integration
     * @private
     */
    _initTheme() {
        if (typeof window !== 'undefined' && window.analyticsTheme) {
            this.themeManager = window.analyticsTheme;
        }
    }

    /**
     * Start online learning timer
     * @private
     */
    _startOnlineLearning() {
        if (this.learningTimer) {
            clearInterval(this.learningTimer);
        }

        this.learningTimer = setInterval(() => {
            this._retrainAllModels();
        }, this.options.retrainInterval);
    }

    /**
     * Retrain all models with latest data
     * @private
     */
    async _retrainAllModels() {
        if (!this.tfAvailable) return;

        const startTime = performance.now();
        let retrainedCount = 0;

        for (const [modelId, history] of this.historyBuffer) {
            if (history.length >= this.options.lookbackWindow) {
                try {
                    await this._trainModel(modelId, history);
                    retrainedCount++;
                } catch (error) {
                    console.warn(`[PredictiveAnalytics] Failed to retrain model ${modelId}:`, error);
                }
            }
        }

        const duration = performance.now() - startTime;
        this.metrics.avgTrainingTime =
            (this.metrics.avgTrainingTime * 0.9) + (duration / Math.max(1, retrainedCount) * 0.1);

        if (retrainedCount > 0) {
            console.log(`[PredictiveAnalytics] Retrained ${retrainedCount} models in ${duration.toFixed(0)}ms`);
        }
    }

    /**
     * Record historical data point
     * @param {string} modelId - Model identifier
     * @param {number} value - Activity value (0-1)
     * @param {Array<number>} features - Optional feature vector
     * @param {number} timestamp - Timestamp (default: now)
     */
    recordData(modelId, value, features = null, timestamp = performance.now()) {
        const dataPoint = {
            timestamp,
            value,
            features: features || [value]
        };

        // Add to history buffer
        if (!this.historyBuffer.has(modelId)) {
            this.historyBuffer.set(modelId, []);
        }

        const buffer = this.historyBuffer.get(modelId);
        buffer.push(dataPoint);

        // Trim buffer to reasonable size (keep last 1000 points)
        if (buffer.length > 1000) {
            buffer.splice(0, buffer.length - 1000);
        }

        // Invalidate cache for this model
        this.predictionCache.delete(modelId);

        // Train model if we have enough data
        if (this.tfAvailable && buffer.length >= this.options.lookbackWindow * 2) {
            this._trainModel(modelId, buffer).catch(error => {
                console.warn(`[PredictiveAnalytics] Training error for ${modelId}:`, error);
            });
        }
    }

    /**
     * Train LSTM model for a specific model
     * @private
     * @param {string} modelId - Model identifier
     * @param {Array} history - Historical data
     */
    async _trainModel(modelId, history) {
        if (!this.tfAvailable || history.length < this.options.lookbackWindow) {
            return null;
        }

        const startTime = performance.now();

        try {
            // Prepare training data
            const { X, y } = this._prepareTrainingData(history);

            // Create or get existing model
            let model = this.models.get(modelId)?.model;

            if (!model) {
                model = this._createLSTMModel();
                this.models.set(modelId, {
                    model,
                    scaler: { min: 0, max: 1 },
                    lastTrained: Date.now(),
                    predictions: []
                });
            }

            // Train model
            await model.fit(X, y, {
                epochs: this.options.epochs,
                batchSize: this.options.batchSize,
                validationSplit: this.options.validationSplit,
                shuffle: true,
                callbacks: {
                    onEpochEnd: (epoch, logs) => {
                        if (epoch % 10 === 0) {
                            console.log(`[PredictiveAnalytics] ${modelId} Epoch ${epoch}: loss=${logs.loss.toFixed(6)}`);
                        }
                    }
                }
            });

            const duration = performance.now() - startTime;
            this.metrics.modelsTrained++;

            // Update model metadata
            const modelData = this.models.get(modelId);
            modelData.lastTrained = Date.now();

            console.log(`[PredictiveAnalytics] Trained model ${modelId} in ${duration.toFixed(0)}ms`);

            return model;

        } catch (error) {
            console.error(`[PredictiveAnalytics] Training failed for ${modelId}:`, error);
            return null;
        }
    }

    /**
     * Prepare training data for LSTM
     * @private
     * @param {Array} history - Historical data
     * @returns {Object} {X, y} tensors
     */
    _prepareTrainingData(history) {
        const lookback = this.options.lookbackWindow;
        const horizon = this.options.predictionHorizon;
        const featureDim = history[0]?.features?.length || 1;

        const samples = [];
        const targets = [];

        // Create sliding window samples
        for (let i = 0; i <= history.length - lookback - horizon; i++) {
            // Input sequence
            const sequence = [];
            for (let j = 0; j < lookback; j++) {
                sequence.push(history[i + j].features);
            }

            // Target sequence (predict next horizon values)
            const target = [];
            for (let j = 0; j < horizon; j++) {
                target.push([history[i + lookback + j].value]);
            }

            samples.push(sequence);
            targets.push(target);
        }

        // Convert to tensors
        const X = tf.tensor3d(samples, [samples.length, lookback, featureDim]);
        const y = tf.tensor3d(targets, [targets.length, horizon, 1]);

        return { X, y };
    }

    /**
     * Create LSTM model architecture
     * @private
     * @returns {tf.LayersModel} TensorFlow.js model
     */
    _createLSTMModel() {
        const model = tf.sequential();

        // First LSTM layer
        model.add(tf.layers.lstm({
            units: this.options.lstmUnits,
            returnSequences: this.options.lstmLayers > 1,
            inputShape: [this.options.lookbackWindow, 1] // [timesteps, features]
        }));

        // Additional LSTM layers
        for (let i = 1; i < this.options.lstmLayers - 1; i++) {
            model.add(tf.layers.lstm({
                units: this.options.lstmUnits,
                returnSequences: true
            }));
        }

        // Last LSTM layer (doesn't return sequences)
        if (this.options.lstmLayers > 1) {
            model.add(tf.layers.lstm({
                units: this.options.lstmUnits,
                returnSequences: false
            }));
        }

        // Dense layers for prediction
        model.add(tf.layers.repeatVector({
            n: this.options.predictionHorizon
        }));

        model.add(tf.layers.lstm({
            units: this.options.lstmUnits / 2,
            returnSequences: true
        }));

        model.add(tf.layers.timeDistributed({
            layer: tf.layers.dense({ units: 1 })
        }));

        // Compile model
        model.compile({
            optimizer: tf.train.adam(0.001),
            loss: 'mse',
            metrics: ['mae']
        });

        return model;
    }

    /**
     * Generate forecast for a model
     * @param {string} modelId - Model identifier
     * @param {Object} options - Forecast options
     * @param {number} options.horizon - Prediction horizon (default: from config)
     * @param {number} options.confidence - Confidence level (default: 0.95)
     * @returns {Promise<Object>} Prediction results
     */
    async forecast(modelId, options = {}) {
        const horizon = options.horizon || this.options.predictionHorizon;
        const confidence = options.confidence || this.options.confidenceLevel;

        // Check cache
        const cacheKey = `${modelId}-${horizon}-${confidence}`;
        const cached = this.predictionCache.get(cacheKey);
        if (cached && Date.now() - cached.timestamp < this.cacheExpiry) {
            return cached.predictions;
        }

        const startTime = performance.now();
        let predictions;

        if (this.tfAvailable && this.models.has(modelId)) {
            predictions = await this._tfForecast(modelId, horizon, confidence);
        } else {
            predictions = this._fallbackForecast(modelId, horizon, confidence);
        }

        const duration = performance.now() - startTime;
        this.metrics.predictionsMade++;
        this.metrics.avgPredictionTime =
            (this.metrics.avgPredictionTime * 0.9) + (duration * 0.1);

        // Cache predictions
        this.predictionCache.set(cacheKey, {
            predictions,
            timestamp: Date.now()
        });

        return predictions;
    }

    /**
     * Generate forecast using TensorFlow.js model
     * @private
     */
    async _tfForecast(modelId, horizon, confidence) {
        const modelData = this.models.get(modelId);
        const history = this.historyBuffer.get(modelId);

        if (!history || history.length < this.options.lookbackWindow) {
            throw new Error(`Insufficient data for model ${modelId}`);
        }

        // Prepare input sequence
        const lookback = this.options.lookbackWindow;
        const sequence = [];
        for (let i = history.length - lookback; i < history.length; i++) {
            sequence.push([history[i].value]);
        }

        const input = tf.tensor3d([sequence], [1, lookback, 1]);

        // Generate prediction
        const prediction = await modelData.model.predict(input);
        const values = await prediction.data();

        // Calculate confidence intervals
        const confidenceIntervals = this._calculateConfidenceIntervals(
            history,
            values,
            confidence
        );

        // Detect anomalies
        const anomalies = this._detectAnomalies(modelId, values, confidenceIntervals);

        prediction.dispose();
        input.dispose();

        return {
            modelId,
            horizon,
            values: Array.from(values).map((mean, i) => ({
                step: i + 1,
                mean,
                confidence: confidenceIntervals[i],
                isAnomaly: anomalies[i] || false
            })),
            confidence,
            timestamp: Date.now(),
            method: 'lstm'
        };
    }

    /**
     * Generate forecast using statistical fallback
     * @private
     */
    _fallbackForecast(modelId, horizon, confidence) {
        const history = this.historyBuffer.get(modelId);

        if (!history || history.length < 3) {
            // Return flat prediction if insufficient data
            return {
                modelId,
                horizon,
                values: Array(horizon).fill(null).map((_, i) => ({
                    step: i + 1,
                    mean: 0.5,
                    confidence: { lower: 0, upper: 1 },
                    isAnomaly: false
                })),
                confidence,
                timestamp: Date.now(),
                method: 'fallback'
            };
        }

        // Use simple linear extrapolation
        const recentValues = history.slice(-10).map(h => h.value);
        const mean = recentValues.reduce((a, b) => a + b, 0) / recentValues.length;
        const variance = recentValues.reduce((sum, v) => sum + Math.pow(v - mean, 2), 0) / recentValues.length;
        const std = Math.sqrt(variance);

        // Calculate trend
        const trend = (recentValues[recentValues.length - 1] - recentValues[0]) / recentValues.length;

        // Calculate confidence interval multiplier
        const zScore = this._zScore(confidence);

        return {
            modelId,
            horizon,
            values: Array(horizon).fill(null).map((_, i) => {
                const predictedMean = mean + trend * (i + 1);
                const margin = zScore * std;

                return {
                    step: i + 1,
                    mean: Math.max(0, Math.min(1, predictedMean)),
                    confidence: {
                        lower: Math.max(0, predictedMean - margin),
                        upper: Math.min(1, predictedMean + margin)
                    },
                    isAnomaly: false
                };
            }),
            confidence,
            timestamp: Date.now(),
            method: 'linear-extrapolation'
        };
    }

    /**
     * Calculate confidence intervals using historical variance
     * @private
     */
    _calculateConfidenceIntervals(history, predictions, confidence) {
        const recentValues = history.slice(-50).map(h => h.value);
        const mean = recentValues.reduce((a, b) => a + b, 0) / recentValues.length;
        const variance = recentValues.reduce((sum, v) => sum + Math.pow(v - mean, 2), 0) / recentValues.length;
        const std = Math.sqrt(variance);

        // Confidence interval increases with prediction horizon
        const zScore = this._zScore(confidence);

        return Array.from(predictions).map((value, i) => {
            // Wider confidence intervals for further predictions
            const horizonFactor = 1 + (i * 0.1);
            const margin = zScore * std * horizonFactor;

            return {
                lower: Math.max(0, value - margin),
                upper: Math.min(1, value + margin)
            };
        });
    }

    /**
     * Detect anomalies in predictions
     * @private
     */
    _detectAnomalies(modelId, predictions, confidenceIntervals) {
        const history = this.historyBuffer.get(modelId);
        if (!history || history.length < 10) return [];

        const recentValues = history.slice(-20).map(h => h.value);
        const mean = recentValues.reduce((a, b) => a + b, 0) / recentValues.length;
        const std = Math.sqrt(recentValues.reduce((sum, v) => sum + Math.pow(v - mean, 2), 0) / recentValues.length);

        // Detect if prediction deviates significantly from historical patterns
        return Array.from(predictions).map((value, i) => {
            const zScore = Math.abs((value - mean) / (std || 1));
            return zScore > 2.5; // Flag as anomaly if > 2.5 standard deviations
        });
    }

    /**
     * Get z-score for confidence level
     * @private
     */
    _zScore(confidence) {
        // Approximate z-scores for common confidence levels
        const zScores = {
            0.90: 1.645,
            0.95: 1.96,
            0.99: 2.576
        };
        return zScores[confidence] || 1.96;
    }

    /**
     * Get prediction statistics
     * @param {string} modelId - Model identifier
     * @returns {Object} Statistics
     */
    getStatistics(modelId) {
        const history = this.historyBuffer.get(modelId);
        const model = this.models.get(modelId);

        if (!history || history.length === 0) {
            return null;
        }

        const values = history.map(h => h.value);
        const mean = values.reduce((a, b) => a + b, 0) / values.length;
        const variance = values.reduce((sum, v) => sum + Math.pow(v - mean, 2), 0) / values.length;
        const std = Math.sqrt(variance);

        return {
            dataPoints: history.length,
            mean,
            std,
            min: Math.min(...values),
            max: Math.max(...values),
            lastValue: values[values.length - 1],
            hasModel: !!model,
            lastTrained: model?.lastTrained || null,
            timeRange: {
                start: history[0].timestamp,
                end: history[history.length - 1].timestamp,
                duration: history[history.length - 1].timestamp - history[0].timestamp
            }
        };
    }

    /**
     * Get model performance metrics
     * @returns {Object} Performance metrics
     */
    getMetrics() {
        return {
            ...this.metrics,
            models: this.models.size,
            dataBuffers: this.historyBuffer.size,
            cacheSize: this.predictionCache.size,
            tfAvailable: this.tfAvailable
        };
    }

    /**
     * Clear cache and optionally reset models
     * @param {Object} options - Reset options
     * @param {boolean} options.clearModels - Clear trained models
     * @param {boolean} options.clearHistory - Clear historical data
     */
    reset(options = {}) {
        this.predictionCache.clear();

        if (options.clearModels) {
            // Dispose TensorFlow.js models
            for (const [modelId, modelData] of this.models) {
                if (modelData.model) {
                    try {
                        modelData.model.dispose();
                    } catch (e) {
                        // Ignore disposal errors
                    }
                }
            }
            this.models.clear();
        }

        if (options.clearHistory) {
            this.historyBuffer.clear();
        }
    }

    /**
     * Destroy and cleanup resources
     */
    destroy() {
        // Stop online learning timer
        if (this.learningTimer) {
            clearInterval(this.learningTimer);
            this.learningTimer = null;
        }

        // Dispose all models
        this.reset({ clearModels: true, clearHistory: true });

        console.log('[PredictiveAnalytics] Destroyed');
    }

    /**
     * Export model state for persistence
     * @returns {Object} Serializable state
     */
    exportState() {
        const state = {
            options: this.options,
            history: {},
            metrics: this.metrics,
            timestamp: Date.now()
        };

        // Export history buffers
        for (const [modelId, buffer] of this.historyBuffer) {
            state.history[modelId] = buffer.map(h => ({
                ...h,
                // Convert features to plain array if it's a typed array
                features: Array.isArray(h.features) ? Array.from(h.features) : h.features
            }));
        }

        return state;
    }

    /**
     * Import model state
     * @param {Object} state - Previously exported state
     */
    importState(state) {
        if (!state) return;

        // Restore history
        if (state.history) {
            this.historyBuffer.clear();
            for (const [modelId, buffer] of Object.entries(state.history)) {
                this.historyBuffer.set(modelId, buffer);
            }
        }

        // Restore metrics
        if (state.metrics) {
            this.metrics = state.metrics;
        }

        // Retrain models
        if (this.options.enableOnlineLearning) {
            this._retrainAllModels();
        }

        console.log('[PredictiveAnalytics] State imported');
    }
}

/**
 * PredictionVisualizer - Visualize predictions on temporal view
 *
 * Integrates with TemporalView to overlay predictions
 */
class PredictionVisualizer {
    /**
     * Create a new PredictionVisualizer
     * @param {Object} options - Configuration options
     * @param {TemporalView} options.temporalView - TemporalView instance
     * @param {PredictiveAnalytics} options.predictiveAnalytics - PredictiveAnalytics instance
     */
    constructor(options = {}) {
        this.temporalView = options.temporalView;
        this.predictiveAnalytics = options.predictiveAnalytics;

        // Visualization options
        this.options = {
            showConfidence: true,
            showAnomalies: true,
            predictionColor: 0xFF00FF, // Magenta
            confidenceColor: 0x9370DB, // Purple
            anomalyColor: 0xFF0000, // Red
            lineWidth: 2,
            ...options
        };

        // Graphics containers
        this.predictionGraphics = null;
        this.overlays = new Map(); // Map<modelId, PIXI.Graphics>

        // Theme integration
        this.themeManager = null;
        this._initTheme();

        console.log('[PredictionVisualizer] Initialized');
    }

    /**
     * Initialize theme manager
     * @private
     */
    _initTheme() {
        if (typeof window !== 'undefined' && window.analyticsTheme) {
            this.themeManager = window.analyticsTheme;
        }
    }

    /**
     * Get theme color with fallback
     * @private
     */
    _getThemeColor(category, shade, fallback) {
        if (this.themeManager) {
            return this.themeManager.getColor(category, shade);
        }
        return fallback;
    }

    /**
     * Create prediction overlay container
     * @returns {PIXI.Container} Container for prediction overlays
     */
    create() {
        if (typeof PIXI === 'undefined') {
            console.warn('[PredictionVisualizer] PIXI not available');
            return { addChild: () => {}, visible: true };
        }

        this.predictionGraphics = new PIXI.Container();
        this.predictionGraphics.name = 'predictionOverlay';

        return this.predictionGraphics;
    }

    /**
     * Update prediction visualization for a model
     * @param {string} modelId - Model identifier
     * @param {Object} predictions - Prediction results from PredictiveAnalytics
     */
    async updatePredictions(modelId, predictions) {
        if (!this.predictionGraphics || !predictions) return;

        // Remove old overlay
        const oldOverlay = this.overlays.get(modelId);
        if (oldOverlay) {
            this.predictionGraphics.removeChild(oldOverlay);
            oldOverlay.destroy();
        }

        // Create new overlay
        const overlay = new PIXI.Graphics();
        this.overlays.set(modelId, overlay);
        this.predictionGraphics.addChild(overlay);

        // Get colors from theme
        const predictionColor = this._getThemeColor('accent', 'magenta', this.options.predictionColor);
        const confidenceColor = this._getThemeColor('accent', 'purple', this.options.confidenceColor);
        const anomalyColor = this._getThemeColor('status', 'error', this.options.anomalyColor);

        // Draw prediction line
        this._drawPredictionLine(overlay, predictions.values, predictionColor);

        // Draw confidence intervals
        if (this.options.showConfidence) {
            this._drawConfidenceIntervals(overlay, predictions.values, confidenceColor);
        }

        // Draw anomalies
        if (this.options.showAnomalies) {
            this._drawAnomalies(overlay, predictions.values, anomalyColor);
        }

        console.log(`[PredictionVisualizer] Updated predictions for ${modelId}`);
    }

    /**
     * Draw prediction line
     * @private
     */
    _drawPredictionLine(graphics, values, color) {
        if (values.length === 0) return;

        const step = 10; // Horizontal spacing
        const height = 60; // Available height
        const startY = 30;

        graphics.lineStyle(this.options.lineWidth, color, 0.8);

        values.forEach((value, i) => {
            const x = i * step;
            const y = startY - (value.mean * height);

            if (i === 0) {
                graphics.moveTo(x, y);
            } else {
                graphics.lineTo(x, y);
            }

            // Draw point
            graphics.beginFill(color, 1);
            graphics.drawCircle(x, y, 3);
            graphics.endFill();
        });
    }

    /**
     * Draw confidence intervals
     * @private
     */
    _drawConfidenceIntervals(graphics, values, color) {
        if (values.length === 0) return;

        const step = 10;
        const height = 60;
        const startY = 30;

        graphics.beginFill(color, 0.2);

        // Draw upper bound
        values.forEach((value, i) => {
            const x = i * step;
            const y = startY - (value.confidence.upper * height);
            if (i === 0) {
                graphics.moveTo(x, y);
            } else {
                graphics.lineTo(x, y);
            }
        });

        // Draw lower bound (reverse)
        for (let i = values.length - 1; i >= 0; i--) {
            const x = i * step;
            const y = startY - (value.confidence.lower * height);
            graphics.lineTo(x, y);
        }

        graphics.endFill();
    }

    /**
     * Draw anomaly markers
     * @private
     */
    _drawAnomalies(graphics, values, color) {
        const step = 10;
        const height = 60;
        const startY = 30;

        values.forEach((value, i) => {
            if (value.isAnomaly) {
                const x = i * step;
                const y = startY - (value.mean * height);

                // Draw anomaly marker (triangle)
                graphics.beginFill(color, 1);
                graphics.moveTo(x, y - 8);
                graphics.lineTo(x - 5, y - 15);
                graphics.lineTo(x + 5, y - 15);
                graphics.closePath();
                graphics.endFill();
            }
        });
    }

    /**
     * Clear all prediction overlays
     */
    clearOverlays() {
        for (const [modelId, overlay] of this.overlays) {
            this.predictionGraphics.removeChild(overlay);
            overlay.destroy();
        }
        this.overlays.clear();
    }

    /**
     * Destroy visualizer
     */
    destroy() {
        this.clearOverlays();
        if (this.predictionGraphics) {
            this.predictionGraphics.destroy();
            this.predictionGraphics = null;
        }
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.PredictiveAnalytics = PredictiveAnalytics;
    window.PredictionVisualizer = PredictionVisualizer;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PredictiveAnalytics, PredictionVisualizer };
}
