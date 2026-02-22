/**
 * TensorBoardExporter - Export analytics data to TensorBoard event file format
 *
 * Provides functionality to export correlation matrices, temporal patterns,
 * and anomaly data to TensorBoard-compatible event files for advanced
 * visualization and analysis.
 *
 * TensorBoard Event File Format:
 * - Uses protobuf-like structure with tags
 * - Supports scalar summaries, histograms, and tensors
 * - Wall time (timestamp) in seconds since epoch
 * - Step values for sequential data
 *
 * Part of: Neural Heatmap Phase 2.2 - TensorBoard Integration
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2.2-tensorboard-integration.md
 */

class TensorBoardExporter {
    /**
     * Create a new TensorBoardExporter
     * @param {NeuralHeatmapOverlay} heatmapOverlay - The heatmap overlay instance
     */
    constructor(heatmapOverlay) {
        this.heatmapOverlay = heatmapOverlay;
        this.exportQueue = [];
        this.isExporting = false;
        console.log('[TensorBoardExporter] Initialized');
    }

    /**
     * Encode a 32-bit unsigned integer in varint format
     * @param {number} value - Value to encode
     * @returns {Uint8Array} Encoded bytes
     * @private
     */
    _encodeVarint(value) {
        const bytes = [];
        while (value > 0x7F) {
            bytes.push((value & 0x7F) | 0x80);
            value >>>= 7;
        }
        bytes.push(value & 0x7F);
        return new Uint8Array(bytes);
    }

    /**
     * Encode a 64-bit double in little-endian format
     * @param {number} value - Double value to encode
     * @returns {Uint8Array} Encoded bytes
     * @private
     */
    _encodeDouble(value) {
        const buffer = new ArrayBuffer(8);
        const view = new DataView(buffer);
        view.setFloat64(0, value, true); // little-endian
        return new Uint8Array(buffer);
    }

    /**
     * Create a TensorBoard event file header
     * @returns {Uint8Array} Header bytes
     * @private
     */
    _createHeader() {
        // TensorBoard event files start with a magic number
        const magic = new Uint8Array([0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]);
        return magic;
    }

    /**
     * Create a scalar summary event
     * @param {string} tag - Metric tag/name
     * @param {number} value - Scalar value
     * @param {number} wallTime - Unix timestamp in seconds
     * @param {number} step - Step/index value
     * @returns {Uint8Array} Event data
     * @private
     */
    _createScalarEvent(tag, value, wallTime, step) {
        const parts = [];

        // Tag string (with length prefix)
        const tagBytes = new TextEncoder().encode(tag);
        const tagLen = this._encodeVarint(tagBytes.length);
        parts.push(tagLen, tagBytes);

        // Value (double)
        parts.push(this._encodeDouble(value));

        // Wall time (double)
        parts.push(this._encodeDouble(wallTime));

        // Step (varint)
        parts.push(this._encodeVarint(step));

        // Combine all parts
        const totalLength = parts.reduce((sum, p) => sum + p.length, 0);
        const result = new Uint8Array(totalLength);
        let offset = 0;
        for (const part of parts) {
            result.set(part, offset);
            offset += part.length;
        }

        return result;
    }

    /**
     * Create a histogram summary event
     * @param {string} tag - Metric tag/name
     * @param {Array<number>} values - Histogram values
     * @param {number} wallTime - Unix timestamp in seconds
     * @param {number} step - Step/index value
     * @returns {Uint8Array} Event data
     * @private
     */
    _createHistogramEvent(tag, values, wallTime, step) {
        if (!values || values.length === 0) {
            return new Uint8Array(0);
        }

        // Calculate histogram statistics
        const min = Math.min(...values);
        const max = Math.max(...values);
        const sum = values.reduce((a, b) => a + b, 0);
        const sumSquares = values.reduce((a, b) => a + b * b, 0);
        const count = values.length;

        // Create bins (default: 50 bins)
        const numBuckets = 50;
        const bucketSize = (max - min) / numBuckets;
        const buckets = new Array(numBuckets + 1).fill(0);

        for (const v of values) {
            let bucketIndex = Math.floor((v - min) / bucketSize);
            if (bucketIndex >= numBuckets) bucketIndex = numBuckets - 1;
            if (bucketIndex < 0) bucketIndex = 0;
            buckets[bucketIndex]++;
        }

        const parts = [];

        // Tag
        const tagBytes = new TextEncoder().encode(tag);
        parts.push(this._encodeVarint(tagBytes.length), tagBytes);

        // Histogram metadata
        parts.push(this._encodeDouble(min));
        parts.push(this._encodeDouble(max));
        parts.push(this._encodeDouble(sum));
        parts.push(this._encodeDouble(sumSquares));
        parts.push(this._encodeVarint(count));

        // Buckets
        for (const bucket of buckets) {
            parts.push(this._encodeVarint(bucket));
        }

        // Wall time and step
        parts.push(this._encodeDouble(wallTime));
        parts.push(this._encodeVarint(step));

        const totalLength = parts.reduce((sum, p) => sum + p.length, 0);
        const result = new Uint8Array(totalLength);
        let offset = 0;
        for (const part of parts) {
            result.set(part, offset);
            offset += part.length;
        }

        return result;
    }

    /**
     * Create a tensor event for matrix data
     * @param {string} tag - Metric tag/name
     * @param {Array<Array<number>>} matrix - 2D matrix data
     * @param {number} wallTime - Unix timestamp in seconds
     * @param {number} step - Step/index value
     * @returns {Uint8Array} Event data
     * @private
     */
    _createTensorEvent(tag, matrix, wallTime, step) {
        if (!matrix || matrix.length === 0) {
            return new Uint8Array(0);
        }

        const rows = matrix.length;
        const cols = matrix[0].length;
        const values = matrix.flat();

        const parts = [];

        // Tag
        const tagBytes = new TextEncoder().encode(tag);
        parts.push(this._encodeVarint(tagBytes.length), tagBytes);

        // Tensor shape
        parts.push(this._encodeVarint(2)); // 2 dimensions
        parts.push(this._encodeVarint(rows));
        parts.push(this._encodeVarint(cols));

        // Tensor values
        for (const v of values) {
            parts.push(this._encodeDouble(v));
        }

        // Wall time and step
        parts.push(this._encodeDouble(wallTime));
        parts.push(this._encodeVarint(step));

        const totalLength = parts.reduce((sum, p) => sum + p.length, 0);
        const result = new Uint8Array(totalLength);
        let offset = 0;
        for (const part of parts) {
            result.set(part, offset);
            offset += part.length;
        }

        return result;
    }

    /**
     * Create metadata event with custom properties
     * @param {Object} metadata - Metadata object
     * @param {string} pluginName - Plugin name (e.g., 'correlations', 'temporal')
     * @returns {Uint8Array} Event data
     * @private
     */
    _createMetadataEvent(metadata, pluginName) {
        const jsonStr = JSON.stringify(metadata);
        const jsonBytes = new TextEncoder().encode(jsonStr);
        const pluginBytes = new TextEncoder().encode(pluginName);

        const parts = [
            this._encodeVarint(pluginBytes.length),
            pluginBytes,
            this._encodeVarint(jsonBytes.length),
            jsonBytes
        ];

        const totalLength = parts.reduce((sum, p) => sum + p.length, 0);
        const result = new Uint8Array(totalLength);
        let offset = 0;
        for (const part of parts) {
            result.set(part, offset);
            offset += part.length;
        }

        return result;
    }

    /**
     * Export correlation data as TensorBoard scalar summaries
     * @param {Array} modelIds - Model IDs to include
     * @param {Array} layerNames - Layer names to include
     * @returns {Uint8Array} Event file data
     */
    exportCorrelationScalars(modelIds, layerNames) {
        if (!this.heatmapOverlay || !this.heatmapOverlay.crossLayerAnalyzer) {
            console.error('[TensorBoardExporter] CrossLayerAnalyzer not available');
            return new Uint8Array(0);
        }

        const matrix = this.heatmapOverlay.crossLayerAnalyzer.getCorrelationMatrix(modelIds, layerNames);
        const events = [this._createHeader()];
        const wallTime = Date.now() / 1000;
        let step = 0;

        // Export each correlation as a scalar
        for (const [key, data] of matrix.correlations) {
            const tag = `correlation/${data.model1}/${data.layer1}/${data.model2}/${data.layer2}`;
            events.push(this._createScalarEvent(tag, data.correlation, wallTime, step++));
        }

        // Export summary statistics
        events.push(this._createScalarEvent('correlation_summary/max', matrix.maxCorrelation, wallTime, step++));
        events.push(this._createScalarEvent('correlation_summary/min', matrix.minCorrelation, wallTime, step++));
        events.push(this._createScalarEvent('correlation_summary/avg', matrix.avgCorrelation, wallTime, step++));

        // Add metadata
        const metadata = {
            modelIds: matrix.modelIds,
            layerNames: matrix.layerNames,
            correlationCount: matrix.correlations.size,
            timestamp: new Date().toISOString()
        };
        events.push(this._createMetadataEvent(metadata, 'correlations'));

        return this._concatEvents(events);
    }

    /**
     * Export correlation data as TensorBoard histogram
     * @param {Array} modelIds - Model IDs to include
     * @param {Array} layerNames - Layer names to include
     * @returns {Uint8Array} Event file data
     */
    exportCorrelationHistogram(modelIds, layerNames) {
        if (!this.heatmapOverlay || !this.heatmapOverlay.crossLayerAnalyzer) {
            console.error('[TensorBoardExporter] CrossLayerAnalyzer not available');
            return new Uint8Array(0);
        }

        const matrix = this.heatmapOverlay.crossLayerAnalyzer.getCorrelationMatrix(modelIds, layerNames);
        const events = [this._createHeader()];
        const wallTime = Date.now() / 1000;

        // Extract all correlation values
        const values = [];
        for (const [key, data] of matrix.correlations) {
            values.push(data.correlation);
        }

        if (values.length > 0) {
            events.push(this._createHistogramEvent('correlation_histogram/all', values, wallTime, 0));
        }

        return this._concatEvents(events);
    }

    /**
     * Export correlation data as TensorBoard tensor (full matrix)
     * @param {Array} modelIds - Model IDs to include
     * @param {Array} layerNames - Layer names to include
     * @returns {Uint8Array} Event file data
     */
    exportCorrelationMatrix(modelIds, layerNames) {
        if (!this.heatmapOverlay || !this.heatmapOverlay.crossLayerAnalyzer) {
            console.error('[TensorBoardExporter] CrossLayerAnalyzer not available');
            return new Uint8Array(0);
        }

        const matrix = this.heatmapOverlay.crossLayerAnalyzer.getCorrelationMatrix(modelIds, layerNames);
        const events = [this._createHeader()];
        const wallTime = Date.now() / 1000;

        // Build full matrix
        const size = layerNames.length;
        const fullMatrix = [];

        for (let i = 0; i < size; i++) {
            const row = [];
            for (let j = 0; j < size; j++) {
                const key = `${matrix.modelIds[0]}:${layerNames[i]}|${matrix.modelIds[1] || matrix.modelIds[0]}:${layerNames[j]}`;
                const data = matrix.correlations.get(key);
                row.push(data ? data.correlation : 0);
            }
            fullMatrix.push(row);
        }

        events.push(this._createTensorEvent('correlation_matrix/full', fullMatrix, wallTime, 0));

        return this._concatEvents(events);
    }

    /**
     * Export temporal patterns as time series
     * @param {string} modelId - Model ID to analyze
     * @returns {Uint8Array} Event file data
     */
    exportTemporalPatterns(modelId) {
        if (!this.heatmapOverlay || !this.heatmapOverlay.temporalAnalyzer) {
            console.error('[TensorBoardExporter] TemporalAnalyzer not available');
            return new Uint8Array(0);
        }

        const temporalData = this.heatmapOverlay.temporalAnalyzer.analyzeModel(modelId);
        const events = [this._createHeader()];
        const wallTime = Date.now() / 1000;

        // Export summary statistics
        if (temporalData.summary) {
            let step = 0;
            events.push(this._createScalarEvent(`temporal/${modelId}/total_events`, temporalData.summary.totalEvents, wallTime, step++));
            events.push(this._createScalarEvent(`temporal/${modelId}/avg_intensity`, temporalData.summary.avgIntensity, wallTime, step++));
            events.push(this._createScalarEvent(`temporal/${modelId}/max_intensity`, temporalData.summary.maxIntensity, wallTime, step++));
            events.push(this._createScalarEvent(`temporal/${modelId}/std_dev`, temporalData.summary.stdDev, wallTime, step++));
        }

        // Export periodic patterns as scalars
        for (let i = 0; i < temporalData.periodic.length; i++) {
            const pattern = temporalData.periodic[i];
            events.push(this._createScalarEvent(`temporal/${modelId}/pattern_${i}_frequency`, pattern.frequency, wallTime, i));
            events.push(this._createScalarEvent(`temporal/${modelId}/pattern_${i}_confidence`, pattern.confidence, wallTime, i));
        }

        // Export trends as scalars
        for (let i = 0; i < temporalData.trends.length; i++) {
            const trend = temporalData.trends[i];
            events.push(this._createScalarEvent(`temporal/${modelId}/trend_${i}_slope`, trend.slope, wallTime, i));
            events.push(this._createScalarEvent(`temporal/${modelId}/trend_${i}_confidence`, trend.confidence, wallTime, i));
        }

        // Export time windows as time series
        if (temporalData.timeWindows && temporalData.timeWindows.length > 0) {
            const intensities = temporalData.timeWindows.map(w => w.avgIntensity);
            events.push(this._createHistogramEvent(`temporal/${modelId}/intensity_distribution`, intensities, wallTime, 0));
        }

        return this._concatEvents(events);
    }

    /**
     * Export anomalies with metadata
     * @param {string} modelId - Optional model ID filter
     * @returns {Uint8Array} Event file data
     */
    exportAnomalies(modelId = null) {
        if (!this.heatmapOverlay || !this.heatmapOverlay.anomalyDetector) {
            console.error('[TensorBoardExporter] AnomalyDetector not available');
            return new Uint8Array(0);
        }

        const anomalies = modelId
            ? this.heatmapOverlay.anomalyDetector.getAnomaliesForModel(modelId)
            : this.heatmapOverlay.anomalyDetector.getAnomalySummary().recent || [];

        const events = [this._createHeader()];
        const wallTime = Date.now() / 1000;

        // Export anomaly count
        events.push(this._createScalarEvent('anomalies/count', anomalies.length, wallTime, 0));

        // Export each anomaly with severity encoding
        for (let i = 0; i < anomalies.length; i++) {
            const anomaly = anomalies[i];
            const severityScore = this._severityToScore(anomaly.severity);
            const tag = modelId
                ? `anomalies/${modelId}/${anomaly.type}_${i}`
                : `anomalies/${anomaly.modelId}/${anomaly.type}_${i}`;

            events.push(this._createScalarEvent(tag, severityScore, wallTime, i));

            // Add metadata for this anomaly
            const metadata = {
                id: anomaly.id,
                type: anomaly.type,
                modelId: anomaly.modelId,
                severity: anomaly.severity,
                description: anomaly.description,
                timestamp: anomaly.timestamp
            };
            events.push(this._createMetadataEvent(metadata, `anomaly_${i}`));
        }

        // Export severity distribution
        const severityCounts = { high: 0, medium: 0, low: 0 };
        for (const anomaly of anomalies) {
            severityCounts[anomaly.severity] = (severityCounts[anomaly.severity] || 0) + 1;
        }

        events.push(this._createScalarEvent('anomalies/severity_high', severityCounts.high, wallTime, 0));
        events.push(this._createScalarEvent('anomalies/severity_medium', severityCounts.medium, wallTime, 0));
        events.push(this._createScalarEvent('anomalies/severity_low', severityCounts.low, wallTime, 0));

        return this._concatEvents(events);
    }

    /**
     * Export all analytics data to TensorBoard format
     * @returns {Uint8Array} Complete event file data
     */
    exportAll() {
        const events = [this._createHeader()];
        const wallTime = Date.now() / 1000;

        // Get all active models
        const models = this.heatmapOverlay?.multiModelTracker?.getAllModels() || [];
        const modelIds = models.map(m => m.id);
        const layerNames = this.heatmapOverlay ? this.heatmapOverlay._getAllLayerNames() : [];

        if (modelIds.length > 0 && layerNames.length > 0) {
            // Add correlation data
            const correlationEvents = this.exportCorrelationScalars(modelIds, layerNames);
            if (correlationEvents.length > 8) { // More than just header
                events.push(correlationEvents.slice(8)); // Skip header
            }

            // Add temporal patterns
            for (const modelId of modelIds) {
                const temporalEvents = this.exportTemporalPatterns(modelId);
                if (temporalEvents.length > 8) {
                    events.push(temporalEvents.slice(8));
                }
            }

            // Add anomalies
            const anomalyEvents = this.exportAnomalies();
            if (anomalyEvents.length > 8) {
                events.push(anomalyEvents.slice(8));
            }
        }

        return this._concatEvents(events);
    }

    /**
     * Convert severity string to numeric score
     * @param {string} severity - Severity level ('high', 'medium', 'low')
     * @returns {number} Numeric score
     * @private
     */
    _severityToScore(severity) {
        switch (severity) {
            case 'high': return 3.0;
            case 'medium': return 2.0;
            case 'low': return 1.0;
            default: return 0.0;
        }
    }

    /**
     * Concatenate multiple event arrays
     * @param {Array<Uint8Array>} events - Event arrays
     * @returns {Uint8Array} Concatenated data
     * @private
     */
    _concatEvents(events) {
        const totalLength = events.reduce((sum, e) => sum + e.length, 0);
        const result = new Uint8Array(totalLength);
        let offset = 0;
        for (const event of events) {
            result.set(event, offset);
            offset += event.length;
        }
        return result;
    }

    /**
     * Download event data as TensorBoard file
     * @param {Uint8Array} data - Event file data
     * @param {string} filename - File name (without extension)
     */
    downloadEventFile(data, filename) {
        if (typeof document === 'undefined') {
            console.error('[TensorBoardExporter] Document not available');
            return;
        }

        const blob = new Blob([data], { type: 'application/octet-stream' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `${filename}.events.out.tfevents.${process?.env?.USER || 'user'}.${Date.now()}`;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);

        console.log(`[TensorBoardExporter] Downloaded ${filename}`);
    }

    /**
     * Export correlation matrix and download
     * @param {string} format - 'scalars', 'histogram', or 'matrix'
     */
    exportCorrelations(format = 'scalars') {
        const models = this.heatmapOverlay?.multiModelTracker?.getAllModels() || [];
        const modelIds = models.map(m => m.id);
        const layerNames = this.heatmapOverlay ? this.heatmapOverlay._getAllLayerNames() : [];

        if (modelIds.length === 0 || layerNames.length === 0) {
            console.warn('[TensorBoardExporter] No data to export');
            return;
        }

        let data;
        switch (format) {
            case 'histogram':
                data = this.exportCorrelationHistogram(modelIds, layerNames);
                break;
            case 'matrix':
                data = this.exportCorrelationMatrix(modelIds, layerNames);
                break;
            default:
                data = this.exportCorrelationScalars(modelIds, layerNames);
        }

        this.downloadEventFile(data, `correlations_${format}`);
    }

    /**
     * Export temporal patterns and download
     * @param {string} modelId - Model ID (uses first available if not specified)
     */
    exportTemporal(modelId = null) {
        const models = this.heatmapOverlay?.multiModelTracker?.getAllModels() || [];
        const targetModelId = modelId || (models.length > 0 ? models[0].id : null);

        if (!targetModelId) {
            console.warn('[TensorBoardExporter] No model to export');
            return;
        }

        const data = this.exportTemporalPatterns(targetModelId);
        this.downloadEventFile(data, `temporal_${targetModelId}`);
    }

    /**
     * Export anomalies and download
     * @param {string} modelId - Optional model ID filter
     */
    exportAnomaliesDownload(modelId = null) {
        const data = this.exportAnomalies(modelId);
        this.downloadEventFile(data, `anomalies${modelId ? '_' + modelId : ''}`);
    }

    /**
     * Export all analytics and download
     */
    exportAllDownload() {
        const data = this.exportAll();
        this.downloadEventFile(data, 'neural_heatmap_full');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.TensorBoardExporter = TensorBoardExporter;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { TensorBoardExporter };
}
