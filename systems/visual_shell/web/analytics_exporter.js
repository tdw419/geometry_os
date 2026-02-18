/**
 * AnalyticsExporter - Export analytics data to various formats
 *
 * Provides functionality to export correlation matrices, temporal
 * patterns, and anomaly data to CSV, JSON, and TensorBoard formats.
 *
 * Part of: Neural Heatmap Phase 2.1.4 - Data Export Feature
 * Phase 2.2: Added TensorBoard export integration
 */

class AnalyticsExporter {
    /**
     * Create a new AnalyticsExporter
     * @param {NeuralHeatmapOverlay} heatmapOverlay - The heatmap overlay instance
     */
    constructor(heatmapOverlay) {
        this.heatmapOverlay = heatmapOverlay;

        // Initialize TensorBoard exporter if available
        if (typeof TensorBoardExporter !== 'undefined') {
            this.tensorBoardExporter = new TensorBoardExporter(heatmapOverlay);
        } else {
            this.tensorBoardExporter = null;
            console.warn('[AnalyticsExporter] TensorBoardExporter not available');
        }

        console.log('[AnalyticsExporter] Initialized');
    }

    /**
     * Export correlation matrix to CSV
     * @param {Array} modelIds - Model IDs to include
     * @param {Array} layerNames - Layer names to include
     * @returns {string} CSV content
     */
    exportCorrelationMatrixCSV(modelIds, layerNames) {
        if (!this.heatmapOverlay || !this.heatmapOverlay.crossLayerAnalyzer) {
            console.error('[AnalyticsExporter] CrossLayerAnalyzer not available');
            return '';
        }

        const matrix = this.heatmapOverlay.crossLayerAnalyzer.getCorrelationMatrix(modelIds, layerNames);

        let csv = 'Model1,Layer1,Model2,Layer2,Correlation\n';

        for (const [key, data] of matrix.correlations) {
            csv += `${data.model1},${data.layer1},${data.model2},${data.layer2},${data.correlation.toFixed(4)}\n`;
        }

        return csv;
    }

    /**
     * Export correlation matrix to JSON
     * @param {Array} modelIds - Model IDs to include
     * @param {Array} layerNames - Layer names to include
     * @returns {string} JSON content
     */
    exportCorrelationMatrixJSON(modelIds, layerNames) {
        if (!this.heatmapOverlay || !this.heatmapOverlay.crossLayerAnalyzer) {
            console.error('[AnalyticsExporter] CrossLayerAnalyzer not available');
            return '';
        }

        const matrix = this.heatmapOverlay.crossLayerAnalyzer.getCorrelationMatrix(modelIds, layerNames);

        // Convert Map to plain object for JSON serialization
        const correlations = {};
        for (const [key, data] of matrix.correlations) {
            correlations[key] = {
                model1: data.model1,
                layer1: data.layer1,
                model2: data.model2,
                layer2: data.layer2,
                correlation: data.correlation
            };
        }

        const exportData = {
            exportType: 'correlation_matrix',
            exportedAt: new Date().toISOString(),
            modelIds: matrix.modelIds,
            layerNames: matrix.layerNames,
            correlations: correlations,
            summary: {
                maxCorrelation: matrix.maxCorrelation,
                minCorrelation: matrix.minCorrelation,
                avgCorrelation: matrix.avgCorrelation
            }
        };

        return JSON.stringify(exportData, null, 2);
    }

    /**
     * Export temporal patterns to CSV
     * @param {string} modelId - Model ID to analyze
     * @returns {string} CSV content
     */
    exportTemporalPatternsCSV(modelId) {
        if (!this.heatmapOverlay || !this.heatmapOverlay.temporalAnalyzer) {
            console.error('[AnalyticsExporter] TemporalAnalyzer not available');
            return '';
        }

        const temporalData = this.heatmapOverlay.temporalAnalyzer.analyzeModel(modelId);

        let csv = 'Type,Property,Value\n';

        // Summary
        if (temporalData.summary) {
            csv += `summary,totalEvents,${temporalData.summary.totalEvents}\n`;
            csv += `summary,avgIntensity,${temporalData.summary.avgIntensity.toFixed(4)}\n`;
            csv += `summary,maxIntensity,${temporalData.summary.maxIntensity.toFixed(4)}\n`;
            csv += `summary,stdDev,${temporalData.summary.stdDev.toFixed(4)}\n`;
        }

        // Periodic patterns
        for (const pattern of temporalData.periodic) {
            csv += `periodic,frequency,${pattern.frequency.toFixed(2)}\n`;
            csv += `periodic,period,${pattern.period}\n`;
            csv += `periodic,confidence,${pattern.confidence.toFixed(4)}\n`;
        }

        // Trends
        for (const trend of temporalData.trends) {
            csv += `trend,direction,${trend.direction}\n`;
            csv += `trend,slope,${trend.slope.toFixed(6)}\n`;
            csv += `trend,confidence,${trend.confidence.toFixed(4)}\n`;
        }

        return csv;
    }

    /**
     * Export temporal patterns to JSON
     * @param {string} modelId - Model ID to analyze
     * @returns {string} JSON content
     */
    exportTemporalPatternsJSON(modelId) {
        if (!this.heatmapOverlay || !this.heatmapOverlay.temporalAnalyzer) {
            console.error('[AnalyticsExporter] TemporalAnalyzer not available');
            return '';
        }

        const temporalData = this.heatmapOverlay.temporalAnalyzer.analyzeModel(modelId);

        const exportData = {
            exportType: 'temporal_patterns',
            exportedAt: new Date().toISOString(),
            modelId: modelId,
            summary: temporalData.summary,
            periodic: temporalData.periodic,
            trends: temporalData.trends,
            stateChanges: temporalData.stateChanges,
            bursts: temporalData.bursts
        };

        return JSON.stringify(exportData, null, 2);
    }

    /**
     * Export anomalies to CSV
     * @param {string} modelId - Optional model ID filter
     * @returns {string} CSV content
     */
    exportAnomaliesCSV(modelId = null) {
        if (!this.heatmapOverlay || !this.heatmapOverlay.anomalyDetector) {
            console.error('[AnalyticsExporter] AnomalyDetector not available');
            return '';
        }

        const anomalies = modelId
            ? this.heatmapOverlay.anomalyDetector.getAnomaliesForModel(modelId)
            : this.heatmapOverlay.anomalyDetector.getAnomalySummary().recent || [];

        let csv = 'ID,Type,Model,Severity,Description,Timestamp\n';

        for (const anomaly of anomalies) {
            const timestamp = anomaly.timestamp ? new Date(anomaly.timestamp).toISOString() : '';
            csv += `${anomaly.id},${anomaly.type},${anomaly.modelId || ''},${anomaly.severity || ''},"${anomaly.description || ''}",${timestamp}\n`;
        }

        return csv;
    }

    /**
     * Export anomalies to JSON
     * @param {string} modelId - Optional model ID filter
     * @returns {string} JSON content
     */
    exportAnomaliesJSON(modelId = null) {
        if (!this.heatmapOverlay || !this.heatmapOverlay.anomalyDetector) {
            console.error('[AnalyticsExporter] AnomalyDetector not available');
            return '';
        }

        const data = modelId
            ? { modelId: modelId, anomalies: this.heatmapOverlay.anomalyDetector.getAnomaliesForModel(modelId) }
            : this.heatmapOverlay.anomalyDetector.getAnomalySummary();

        const exportData = {
            exportType: 'anomalies',
            exportedAt: new Date().toISOString(),
            ...data
        };

        return JSON.stringify(exportData, null, 2);
    }

    /**
     * Export all analytics data to JSON
     * @returns {string} JSON content
     */
    exportAllJSON() {
        const exportData = {
            exportType: 'full_analytics',
            exportedAt: new Date().toISOString(),
            correlationMatrices: {},
            temporalPatterns: {},
            anomalies: {}
        };

        // Get all active models
        const models = this.heatmapOverlay?.multiModelTracker?.getAllModels() || [];
        const modelIds = models.map(m => m.id);
        const layerNames = this.heatmapOverlay ? this.heatmapOverlay._getAllLayerNames() : [];

        if (modelIds.length > 0 && layerNames.length > 0) {
            // Correlation matrix
            exportData.correlationMatrices = JSON.parse(
                this.exportCorrelationMatrixJSON(modelIds, layerNames)
            );

            // Temporal patterns for each model
            for (const modelId of modelIds) {
                exportData.temporalPatterns[modelId] = JSON.parse(
                    this.exportTemporalPatternsJSON(modelId)
                );
            }

            // Anomalies
            exportData.anomalies = JSON.parse(this.exportAnomaliesJSON());
        }

        return JSON.stringify(exportData, null, 2);
    }

    /**
     * Download content as file
     * @param {string} content - File content
     * @param {string} filename - File name
     * @param {string} mimeType - MIME type (default: 'text/plain')
     */
    downloadAsFile(content, filename, mimeType = 'text/plain') {
        if (typeof document === 'undefined') {
            console.error('[AnalyticsExporter] Document not available');
            return;
        }

        const blob = new Blob([content], { type: mimeType });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);

        console.log(`[AnalyticsExporter] Downloaded ${filename}`);
    }

    /**
     * Export and download correlation matrix
     * @param {string} format - 'csv' or 'json'
     */
    exportCorrelationMatrix(format = 'json') {
        const models = this.heatmapOverlay?.multiModelTracker?.getAllModels() || [];
        const modelIds = models.map(m => m.id);
        const layerNames = this.heatmapOverlay ? this.heatmapOverlay._getAllLayerNames() : [];

        if (modelIds.length === 0 || layerNames.length === 0) {
            console.warn('[AnalyticsExporter] No data to export');
            return;
        }

        const content = format === 'csv'
            ? this.exportCorrelationMatrixCSV(modelIds, layerNames)
            : this.exportCorrelationMatrixJSON(modelIds, layerNames);

        const timestamp = new Date().toISOString().replace(/[:.]/g, '-').slice(0, -5);
        const filename = `correlation_matrix_${timestamp}.${format}`;
        const mimeType = format === 'csv' ? 'text/csv' : 'application/json';

        this.downloadAsFile(content, filename, mimeType);
    }

    /**
     * Export and download temporal patterns
     * @param {string} modelId - Model ID (uses first available if not specified)
     * @param {string} format - 'csv' or 'json'
     */
    exportTemporalPatterns(modelId = null, format = 'json') {
        const models = this.heatmapOverlay?.multiModelTracker?.getAllModels() || [];
        const targetModelId = modelId || (models.length > 0 ? models[0].id : null);

        if (!targetModelId) {
            console.warn('[AnalyticsExporter] No model to export');
            return;
        }

        const content = format === 'csv'
            ? this.exportTemporalPatternsCSV(targetModelId)
            : this.exportTemporalPatternsJSON(targetModelId);

        const timestamp = new Date().toISOString().replace(/[:.]/g, '-').slice(0, -5);
        const filename = `temporal_patterns_${targetModelId}_${timestamp}.${format}`;
        const mimeType = format === 'csv' ? 'text/csv' : 'application/json';

        this.downloadAsFile(content, filename, mimeType);
    }

    /**
     * Export and download anomalies
     * @param {string} modelId - Optional model ID filter
     * @param {string} format - 'csv' or 'json'
     */
    exportAnomalies(modelId = null, format = 'json') {
        const content = format === 'csv'
            ? this.exportAnomaliesCSV(modelId)
            : this.exportAnomaliesJSON(modelId);

        const timestamp = new Date().toISOString().replace(/[:.]/g, '-').slice(0, -5);
        const modelSuffix = modelId ? `_${modelId}` : '';
        const filename = `anomalies${modelSuffix}_${timestamp}.${format}`;
        const mimeType = format === 'csv' ? 'text/csv' : 'application/json';

        this.downloadAsFile(content, filename, mimeType);
    }

    /**
     * Export all analytics data
     * @param {string} format - 'json' (only JSON supported for full export)
     */
    exportAll(format = 'json') {
        if (format !== 'json') {
            console.warn('[AnalyticsExporter] Full export only supports JSON format');
            return;
        }

        const content = this.exportAllJSON();
        const timestamp = new Date().toISOString().replace(/[:.]/g, '-').slice(0, -5);
        const filename = `neural_heatmap_analytics_${timestamp}.json`;

        this.downloadAsFile(content, filename, 'application/json');
    }

    /**
     * Export to TensorBoard format
     * @param {string} dataType - Type of data to export ('correlations', 'temporal', 'anomalies', 'all')
     * @param {string} subType - Sub-type for correlations ('scalars', 'histogram', 'matrix')
     * @param {string} modelId - Optional model ID for temporal/anomaly exports
     */
    exportToTensorBoard(dataType = 'all', subType = 'scalars', modelId = null) {
        if (!this.tensorBoardExporter) {
            console.error('[AnalyticsExporter] TensorBoard exporter not available');
            return;
        }

        switch (dataType) {
            case 'correlations':
                this.tensorBoardExporter.exportCorrelations(subType);
                break;
            case 'temporal':
                this.tensorBoardExporter.exportTemporal(modelId);
                break;
            case 'anomalies':
                this.tensorBoardExporter.exportAnomaliesDownload(modelId);
                break;
            case 'all':
            default:
                this.tensorBoardExporter.exportAllDownload();
                break;
        }

        console.log(`[AnalyticsExporter] Exported ${dataType} to TensorBoard format`);
    }

    /**
     * Get available export formats
     * @returns {Array<string>} Available formats
     */
    getAvailableFormats() {
        const formats = ['csv', 'json'];
        if (this.tensorBoardExporter) {
            formats.push('tensorboard');
        }
        return formats;
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.AnalyticsExporter = AnalyticsExporter;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { AnalyticsExporter };
}
