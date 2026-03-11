/**
 * ComparisonExporter - Multi-Model Neural Heatmap Export
 *
 * Provides export functionality for comparing multiple neural models:
 * - Side-by-side model comparison
 * - Differential visualization export
 * - Statistical comparison reports
 * - Multi-model animation sequences
 * - Publication-ready comparative figures
 *
 * Usage:
 *   const exporter = new ComparisonExporter(comparativeHeatmap);
 *   await exporter.exportSideBySide('comparison.png');
 *   exporter.exportDifferentialData('comparison.csv');
 *   await exporter.exportAnimationFrames('animation/');
 */

class ComparisonExporter {
    constructor(comparativeHeatmap) {
        this.comparison = comparativeHeatmap;
        this.options = {
            defaultDPI: 300,
            defaultQuality: 0.95,
            includeLegend: true,
            includeStatistics: true
        };
    }

    /**
     * Export side-by-side comparison of models
     * @param {string} filename - Output filename
     * @param {Object} options - Export options
     * @returns {Promise<Blob>} Side-by-side comparison image
     */
    async exportSideBySide(filename = 'comparison.png', options = {}) {
        const opts = {
            width: options.width || 4096,
            height: options.height || 2048,
            quality: options.quality || this.options.defaultQuality,
            backgroundColor: options.backgroundColor || '#000000',
            modelIds: options.modelIds || this._getActiveModelIds(),
            includeLabels: options.includeLabels !== false,
            includeColorbar: options.includeColorbar !== false,
            labelFont: options.labelFont || 'bold 32px Arial',
            ...options
        };

        console.log(`[ComparisonExporter] Exporting side-by-side comparison: ${filename}`);

        const numModels = opts.modelIds.length;
        if (numModels < 2) {
            throw new Error('At least 2 models required for comparison');
        }

        // Create canvas
        const canvas = document.createElement('canvas');
        canvas.width = opts.width;
        canvas.height = opts.height;
        const ctx = canvas.getContext('2d');

        // Fill background
        ctx.fillStyle = opts.backgroundColor;
        ctx.fillRect(0, 0, opts.width, opts.height);

        // Calculate layout
        const panelWidth = opts.width / numModels;
        const panelHeight = opts.height;

        // Render each model
        for (let i = 0; i < numModels; i++) {
            const modelId = opts.modelIds[i];
            const x = i * panelWidth;

            // Render model heatmap
            await this._renderModelPanel(ctx, modelId, x, 0, panelWidth, panelHeight, opts);

            // Add model label
            if (opts.includeLabels) {
                this._renderModelLabel(ctx, modelId, x, panelWidth, opts);
            }
        }

        // Add shared colorbar
        if (opts.includeColorbar) {
            this._renderSharedColorbar(ctx, opts);
        }

        // Add title
        this._renderComparisonTitle(ctx, opts);

        // Convert to blob
        const blob = await new Promise(resolve => {
            canvas.toBlob(resolve, 'image/png', opts.quality);
        });

        // Download
        if (filename) {
            this._downloadBlob(blob, filename);
        }

        console.log(`[ComparisonExporter] Side-by-side export complete`);
        return blob;
    }

    /**
     * Export differential heatmap between models
     * @param {string} filename - Output filename
     * @param {Object} options - Export options
     * @returns {Promise<Blob>} Differential heatmap image
     */
    async exportDifferential(filename = 'differential.png', options = {}) {
        const opts = {
            width: options.width || 4096,
            height: options.height || 4096,
            quality: options.quality || this.options.defaultQuality,
            modelA: options.modelA,
            modelB: options.modelB,
            diffMode: options.diffMode || 'subtract', // 'subtract', 'ratio', 'percent'
            colormap: options.colormap || 'diverging', // 'diverging', 'sequential'
            zeroPoint: options.zeroPoint || 0.5,
            ...options
        };

        console.log(`[ComparisonExporter] Exporting differential heatmap: ${filename}`);

        if (!opts.modelA || !opts.modelB) {
            const models = this._getActiveModelIds();
            if (models.length < 2) {
                throw new Error('At least 2 models required for differential export');
            }
            opts.modelA = models[0];
            opts.modelB = models[1];
        }

        // Create canvas
        const canvas = document.createElement('canvas');
        canvas.width = opts.width;
        canvas.height = opts.height;
        const ctx = canvas.getContext('2d');

        // Fill background
        ctx.fillStyle = '#000000';
        ctx.fillRect(0, 0, opts.width, opts.height);

        // Get differential data
        const diffData = this._computeDifferentialData(opts.modelA, opts.modelB, opts.diffMode);

        // Render differential heatmap
        this._renderDifferentialHeatmap(ctx, diffData, opts);

        // Add diverging colorbar
        this._renderDivergingColorbar(ctx, opts);

        // Add labels
        this._renderDifferentialLabels(ctx, opts);

        // Convert to blob
        const blob = await new Promise(resolve => {
            canvas.toBlob(resolve, 'image/png', opts.quality);
        });

        // Download
        if (filename) {
            this._downloadBlob(blob, filename);
        }

        console.log(`[ComparisonExporter] Differential export complete`);
        return blob;
    }

    /**
     * Export differential data as CSV
     * @param {string} filename - Output filename
     * @param {Object} options - Export options
     * @returns {string} CSV data
     */
    exportDifferentialData(filename = 'differential.csv', options = {}) {
        const opts = {
            modelA: options.modelA,
            modelB: options.modelB,
            diffMode: options.diffMode || 'subtract',
            includeHeaders: options.includeHeaders !== false,
            includeStatistics: options.includeStatistics !== false,
            delimiter: options.delimiter || ',',
            ...options
        };

        console.log(`[ComparisonExporter] Exporting differential data: ${filename}`);

        // Get model IDs
        if (!opts.modelA || !opts.modelB) {
            const models = this._getActiveModelIds();
            if (models.length < 2) {
                throw new Error('At least 2 models required');
            }
            opts.modelA = models[0];
            opts.modelB = models[1];
        }

        const rows = [];

        // Add headers
        if (opts.includeHeaders) {
            const headers = ['x', 'y', 'tile_id', `${opts.modelA}_value`, `${opts.modelB}_value`, 'difference', 'ratio', 'percent_change'];
            rows.push(headers.join(opts.delimiter));
        }

        // Get differential data
        const diffData = this._computeDifferentialData(opts.modelA, opts.modelB, opts.diffMode);

        // Format rows
        for (const tile of diffData) {
            const row = [
                tile.x,
                tile.y,
                tile.tile_id,
                tile.valueA.toFixed(6),
                tile.valueB.toFixed(6),
                tile.difference.toFixed(6),
                tile.ratio.toFixed(6),
                tile.percentChange.toFixed(2)
            ];
            rows.push(row.map(v => `"${v}"`).join(opts.delimiter));
        }

        // Add statistics
        if (opts.includeStatistics) {
            rows.push('');
            rows.push('Statistics');
            const stats = this._computeDifferentialStatistics(diffData);
            rows.push(`Mean Difference,${stats.meanDiff.toFixed(6)}`);
            rows.push(`Std Difference,${stats.stdDiff.toFixed(6)}`);
            rows.push(`Min Difference,${stats.minDiff.toFixed(6)}`);
            rows.push(`Max Difference,${stats.maxDiff.toFixed(6)}`);
            rows.push(`Correlation,${stats.correlation.toFixed(6)}`);
        }

        const csv = rows.join('\n');

        // Download
        if (filename) {
            const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
            this._downloadBlob(blob, filename);
        }

        console.log(`[ComparisonExporter] Differential data export complete: ${rows.length} rows`);
        return csv;
    }

    /**
     * Export statistical comparison report
     * @param {string} filename - Output filename
     * @param {Object} options - Export options
     * @returns {Object} Statistical report
     */
    exportStatisticalReport(filename = 'statistical_report.json', options = {}) {
        const opts = {
            modelIds: options.modelIds || this._getActiveModelIds(),
            includeCorrelation: options.includeCorrelation !== false,
            includeDistribution: options.includeDistribution !== false,
            includeOutliers: options.includeOutliers !== false,
            ...options
        };

        console.log(`[ComparisonExporter] Exporting statistical report: ${filename}`);

        const report = {
            timestamp: new Date().toISOString(),
            models: opts.modelIds,
            comparisons: []
        };

        // Pairwise comparisons
        for (let i = 0; i < opts.modelIds.length; i++) {
            for (let j = i + 1; j < opts.modelIds.length; j++) {
                const modelA = opts.modelIds[i];
                const modelB = opts.modelIds[j];

                const comparison = {
                    modelA,
                    modelB,
                    statistics: this._computePairwiseStatistics(modelA, modelB, opts)
                };

                report.comparisons.push(comparison);
            }
        }

        // Overall statistics
        report.overall = this._computeOverallStatistics(opts.modelIds);

        const json = JSON.stringify(report, null, 2);

        // Download
        if (filename) {
            const blob = new Blob([json], { type: 'application/json;charset=utf-8;' });
            this._downloadBlob(blob, filename);
        }

        console.log(`[ComparisonExporter] Statistical report export complete`);
        return report;
    }

    /**
     * Export animation frames for multi-model sequence
     * @param {string} outputDir - Output directory pattern (will be appended with frame numbers)
     * @param {Object} options - Export options
     * @returns {Promise<Array<Blob>>} Array of animation frame blobs
     */
    async exportAnimationFrames(outputDir = 'animation/frame_', options = {}) {
        const opts = {
            width: options.width || 2048,
            height: options.height || 2048,
            quality: options.quality || 0.9,
            frames: options.frames || 60,
            duration: options.duration || 3000, // ms
            modelIds: options.modelIds || this._getActiveModelIds(),
            transition: options.transition || 'fade', // 'fade', 'wipe', 'morph'
            includeProgress: options.includeProgress || false,
            ...options
        };

        console.log(`[ComparisonExporter] Exporting ${opts.frames} animation frames`);

        const frames = [];
        const frameDelay = opts.duration / opts.frames;

        for (let frame = 0; frame < opts.frames; frame++) {
            const progress = frame / (opts.frames - 1);

            // Create canvas
            const canvas = document.createElement('canvas');
            canvas.width = opts.width;
            canvas.height = opts.height;
            const ctx = canvas.getContext('2d');

            // Fill background
            ctx.fillStyle = '#000000';
            ctx.fillRect(0, 0, opts.width, opts.height);

            // Render frame based on transition type
            if (opts.transition === 'fade') {
                await this._renderFadeTransition(ctx, opts.modelIds, progress, opts);
            } else if (opts.transition === 'wipe') {
                await this._renderWipeTransition(ctx, opts.modelIds, progress, opts);
            } else if (opts.transition === 'morph') {
                await this._renderMorphTransition(ctx, opts.modelIds, progress, opts);
            }

            // Add progress indicator
            if (opts.includeProgress) {
                this._renderProgressIndicator(ctx, progress, opts);
            }

            // Add frame number
            this._renderFrameNumber(ctx, frame, opts.frames, opts);

            // Convert to blob
            const blob = await new Promise(resolve => {
                canvas.toBlob(resolve, 'image/png', opts.quality);
            });

            frames.push(blob);

            // Download individual frame
            const filename = `${outputDir}${String(frame).padStart(4, '0')}.png`;
            this._downloadBlob(blob, filename);

            if (frame % 10 === 0) {
                console.log(`[ComparisonExporter] Frame ${frame}/${opts.frames}`);
            }
        }

        console.log(`[ComparisonExporter] Animation export complete: ${frames.length} frames`);
        return frames;
    }

    /**
     * Export publication-ready comparison figure
     * @param {string} filename - Output filename
     * @param {Object} options - Export options
     * @returns {Promise<Blob>} Publication-ready figure
     */
    async exportPublicationFigure(filename = 'comparison_publication.png', options = {}) {
        const opts = {
            width: options.width || 6000,
            height: options.height || 3000,
            dpi: options.dpi || 600,
            quality: options.quality || 1.0,
            layout: options.layout || '2x2', // '2x2', '1x3', 'side-by-side'
            backgroundColor: options.backgroundColor || '#FFFFFF',
            panelLabels: options.panelLabels || ['A', 'B', 'C', 'D'],
            includeScaleBars: options.includeScaleBars !== false,
            figureTitle: options.figureTitle || 'Multi-Model Neural Activity Comparison',
            ...options
        };

        console.log(`[ComparisonExporter] Exporting publication figure: ${filename}`);

        const canvas = document.createElement('canvas');
        canvas.width = opts.width;
        canvas.height = opts.height;
        const ctx = canvas.getContext('2d');

        // Fill background
        ctx.fillStyle = opts.backgroundColor;
        ctx.fillRect(0, 0, opts.width, opts.height);

        // Render layout
        if (opts.layout === '2x2') {
            await this._render2x2Layout(ctx, opts);
        } else if (opts.layout === '1x3') {
            await this._render1x3Layout(ctx, opts);
        } else {
            await this._renderSideBySideLayout(ctx, opts);
        }

        // Add figure title
        this._renderFigureTitle(ctx, opts);

        // Add panel labels
        this._renderPanelLabels(ctx, opts);

        // Convert to blob
        const blob = await new Promise(resolve => {
            canvas.toBlob(resolve, 'image/png', opts.quality);
        });

        // Download
        if (filename) {
            this._downloadBlob(blob, filename);
        }

        console.log(`[ComparisonExporter] Publication figure export complete`);
        return blob;
    }

    /**
     * Get active model IDs
     * @private
     */
    _getActiveModelIds() {
        if (this.comparison?.multiModelTracker) {
            return this.comparison.multiModelTracker.getActiveModels();
        }
        return [];
    }

    /**
     * Render model panel
     * @private
     */
    async _renderModelPanel(ctx, modelId, x, y, width, height, opts) {
        // Get model data
        const modelData = this._getModelData(modelId);

        if (!modelData || modelData.length === 0) {
            // Render placeholder
            ctx.fillStyle = '#1a1a1a';
            ctx.fillRect(x, y, width, height);
            ctx.fillStyle = '#666666';
            ctx.font = '24px Arial';
            ctx.textAlign = 'center';
            ctx.fillText(`No data for ${modelId}`, x + width / 2, y + height / 2);
            return;
        }

        // Get bounds
        const bounds = this._getDataBounds(modelData);

        // Calculate scale
        const scaleX = width / bounds.width;
        const scaleY = height / bounds.height;
        const scale = Math.min(scaleX, scaleY) * 0.9;

        const offsetX = x + (width - bounds.width * scale) / 2;
        const offsetY = y + (height - bounds.height * scale) / 2;

        ctx.save();
        ctx.translate(offsetX, offsetY);
        ctx.scale(scale, scale);
        ctx.translate(-bounds.x, -bounds.y);

        // Render tiles
        for (const tile of modelData) {
            const color = this._valueToColor(tile.value);
            ctx.fillStyle = color;
            ctx.fillRect(tile.x, tile.y, tile.width || 50, tile.height || 50);
        }

        ctx.restore();
    }

    /**
     * Render model label
     * @private
     */
    _renderModelLabel(ctx, modelId, x, width, opts) {
        ctx.fillStyle = '#FFFFFF';
        ctx.font = opts.labelFont;
        ctx.textAlign = 'center';
        ctx.fillText(modelId, x + width / 2, 40);
    }

    /**
     * Render shared colorbar
     * @private
     */
    _renderSharedColorbar(ctx, opts) {
        // Implementation similar to ExportUtils but positioned for comparison
    }

    /**
     * Render comparison title
     * @private
     */
    _renderComparisonTitle(ctx, opts) {
        ctx.fillStyle = '#FFFFFF';
        ctx.font = 'bold 40px Arial';
        ctx.textAlign = 'center';
        ctx.fillText('Model Comparison', opts.width / 2, opts.height - 30);
    }

    /**
     * Compute differential data between models
     * @private
     */
    _computeDifferentialData(modelA, modelB, mode) {
        const dataA = this._getModelData(modelA);
        const dataB = this._getModelData(modelB);

        const diffData = [];
        const mapB = new Map(dataB.map(t => [t.tile_id, t]));

        for (const tileA of dataA) {
            const tileB = mapB.get(tileA.tile_id);
            if (tileB) {
                const diff = tileA.value - tileB.value;
                const ratio = tileB.value !== 0 ? tileA.value / tileB.value : 1;
                const percentChange = tileB.value !== 0 ?
                    ((tileA.value - tileB.value) / tileB.value) * 100 : 0;

                diffData.push({
                    x: tileA.x,
                    y: tileA.y,
                    tile_id: tileA.tile_id,
                    valueA: tileA.value,
                    valueB: tileB.value,
                    difference: diff,
                    ratio: ratio,
                    percentChange: percentChange,
                    absDiff: Math.abs(diff)
                });
            }
        }

        return diffData;
    }

    /**
     * Render differential heatmap
     * @private
     */
    _renderDifferentialHeatmap(ctx, diffData, opts) {
        if (diffData.length === 0) return;

        const bounds = this._getDataBounds(diffData);
        const scaleX = opts.width / bounds.width;
        const scaleY = opts.height / bounds.height;
        const scale = Math.min(scaleX, scaleY) * 0.9;

        const offsetX = (opts.width - bounds.width * scale) / 2;
        const offsetY = (opts.height - bounds.height * scale) / 2;

        ctx.save();
        ctx.translate(offsetX, offsetY);
        ctx.scale(scale, scale);
        ctx.translate(-bounds.x, -bounds.y);

        // Find max absolute difference for normalization
        const maxAbs = Math.max(...diffData.map(d => d.absDiff));

        // Render tiles
        for (const tile of diffData) {
            const normalized = tile.absDiff / maxAbs;
            const color = this._diffValueToColor(tile.difference, maxAbs);
            ctx.fillStyle = color;
            ctx.fillRect(tile.x, tile.y, tile.width || 50, tile.height || 50);
        }

        ctx.restore();
    }

    /**
     * Convert differential value to diverging color
     * @private
     */
    _diffValueToColor(value, max) {
        const normalized = value / max;

        if (normalized > 0) {
            // Red for positive
            const intensity = Math.min(1, normalized);
            return `rgba(${255}, ${255 * (1 - intensity)}, ${255 * (1 - intensity)}, 0.8)`;
        } else {
            // Blue for negative
            const intensity = Math.min(1, -normalized);
            return `rgba(${255 * (1 - intensity)}, ${255 * (1 - intensity)}, ${255}, 0.8)`;
        }
    }

    /**
     * Render diverging colorbar
     * @private
     */
    _renderDivergingColorbar(ctx, opts) {
        const barWidth = 60;
        const barHeight = opts.height * 0.6;
        const x = opts.width - barWidth - 40;
        const y = (opts.height - barHeight) / 2;

        // Draw gradient (blue to white to red)
        const gradient = ctx.createLinearGradient(x, y + barHeight, x, y);
        gradient.addColorStop(0, 'rgb(0, 0, 255)');
        gradient.addColorStop(0.5, 'rgb(255, 255, 255)');
        gradient.addColorStop(1, 'rgb(255, 0, 0)');

        ctx.fillStyle = gradient;
        ctx.fillRect(x, y, barWidth, barHeight);

        // Draw border
        ctx.strokeStyle = '#FFFFFF';
        ctx.lineWidth = 2;
        ctx.strokeRect(x, y, barWidth, barHeight);
    }

    /**
     * Render differential labels
     * @private
     */
    _renderDifferentialLabels(ctx, opts) {
        ctx.fillStyle = '#FFFFFF';
        ctx.font = 'bold 36px Arial';
        ctx.textAlign = 'center';
        ctx.fillText(`${opts.modelB} - ${opts.modelA}`, opts.width / 2, 50);
    }

    /**
     * Compute differential statistics
     * @private
     */
    _computeDifferentialStatistics(diffData) {
        const differences = diffData.map(d => d.difference);
        const mean = differences.reduce((a, b) => a + b, 0) / differences.length;
        const variance = differences.reduce((a, b) => a + Math.pow(b - mean, 2), 0) / differences.length;
        const std = Math.sqrt(variance);

        return {
            meanDiff: mean,
            stdDiff: std,
            minDiff: Math.min(...differences),
            maxDiff: Math.max(...differences),
            correlation: this._computeCorrelation(diffData)
        };
    }

    /**
     * Compute correlation between models
     * @private
     */
    _computeCorrelation(diffData) {
        const valuesA = diffData.map(d => d.valueA);
        const valuesB = diffData.map(d => d.valueB);

        const meanA = valuesA.reduce((a, b) => a + b, 0) / valuesA.length;
        const meanB = valuesB.reduce((a, b) => a + b, 0) / valuesB.length;

        let numerator = 0;
        let denomA = 0;
        let denomB = 0;

        for (let i = 0; i < diffData.length; i++) {
            const devA = valuesA[i] - meanA;
            const devB = valuesB[i] - meanB;
            numerator += devA * devB;
            denomA += devA * devA;
            denomB += devB * devB;
        }

        return numerator / Math.sqrt(denomA * denomB);
    }

    /**
     * Compute pairwise statistics
     * @private
     */
    _computePairwiseStatistics(modelA, modelB, opts) {
        const diffData = this._computeDifferentialData(modelA, modelB, 'subtract');
        return this._computeDifferentialStatistics(diffData);
    }

    /**
     * Compute overall statistics
     * @private
     */
    _computeOverallStatistics(modelIds) {
        return {
            modelCount: modelIds.length,
            comparisonCount: modelIds.length * (modelIds.length - 1) / 2
        };
    }

    /**
     * Get model data
     * @private
     */
    _getModelData(modelId) {
        if (!this.comparison?.multiModelTracker) return [];

        const tracker = this.comparison.multiModelTracker;
        const data = [];

        // Get activity data for model
        for (const [spriteId, attachment] of this.comparison.attachments || []) {
            const modelActivity = tracker.getModelActivity(modelId, spriteId);
            if (modelActivity) {
                data.push({
                    tile_id: spriteId,
                    x: attachment.bounds?.x || 0,
                    y: attachment.bounds?.y || 0,
                    width: attachment.bounds?.width || 50,
                    height: attachment.bounds?.height || 50,
                    value: modelActivity.entropy || modelActivity.activity || 0
                });
            }
        }

        return data;
    }

    /**
     * Get data bounds
     * @private
     */
    _getDataBounds(data) {
        if (data.length === 0) {
            return { x: 0, y: 0, width: 1000, height: 1000 };
        }

        let minX = Infinity, minY = Infinity;
        let maxX = -Infinity, maxY = -Infinity;

        for (const tile of data) {
            minX = Math.min(minX, tile.x);
            minY = Math.min(minY, tile.y);
            maxX = Math.max(maxX, tile.x + (tile.width || 50));
            maxY = Math.max(maxY, tile.y + (tile.height || 50));
        }

        return {
            x: minX,
            y: minY,
            width: maxX - minX,
            height: maxY - minY
        };
    }

    /**
     * Convert value to color
     * @private
     */
    _valueToColor(value) {
        const normalized = Math.max(0, Math.min(1, value));
        const r = Math.floor(normalized * 255);
        const b = Math.floor((1 - normalized) * 255);
        return `rgba(${r}, 0, ${b}, 0.6)`;
    }

    /**
     * Render fade transition
     * @private
     */
    async _renderFadeTransition(ctx, modelIds, progress, opts) {
        // Find which models to blend
        const totalModels = modelIds.length;
        const modelIndex = progress * (totalModels - 1);
        const indexA = Math.floor(modelIndex);
        const indexB = Math.min(indexA + 1, totalModels - 1);
        const blend = modelIndex - indexA;

        const modelA = modelIds[indexA];
        const modelB = modelIds[indexB];

        // Render model A with opacity
        ctx.globalAlpha = 1 - blend;
        await this._renderModelPanel(ctx, modelA, 0, 0, opts.width, opts.height, opts);

        // Render model B with opacity
        ctx.globalAlpha = blend;
        await this._renderModelPanel(ctx, modelB, 0, 0, opts.width, opts.height, opts);

        ctx.globalAlpha = 1.0;
    }

    /**
     * Render wipe transition
     * @private
     */
    async _renderWipeTransition(ctx, modelIds, progress, opts) {
        const totalModels = modelIds.length;
        const modelIndex = progress * (totalModels - 1);
        const indexA = Math.floor(modelIndex);
        const indexB = Math.min(indexA + 1, totalModels - 1);
        const blend = modelIndex - indexA;

        const modelA = modelIds[indexA];
        const modelB = modelIds[indexB];

        // Render model A
        await this._renderModelPanel(ctx, modelA, 0, 0, opts.width, opts.height, opts);

        // Render model B with clip
        ctx.save();
        ctx.beginPath();
        ctx.rect(opts.width * blend, 0, opts.width * (1 - blend), opts.height);
        ctx.clip();
        await this._renderModelPanel(ctx, modelB, 0, 0, opts.width, opts.height, opts);
        ctx.restore();
    }

    /**
     * Render morph transition
     * @private
     */
    async _renderMorphTransition(ctx, modelIds, progress, opts) {
        // Similar to fade but with position interpolation
        await this._renderFadeTransition(ctx, modelIds, progress, opts);
    }

    /**
     * Render progress indicator
     * @private
     */
    _renderProgressIndicator(ctx, progress, opts) {
        const barWidth = opts.width * 0.6;
        const barHeight = 10;
        const x = (opts.width - barWidth) / 2;
        const y = opts.height - 50;

        // Draw background
        ctx.fillStyle = 'rgba(255, 255, 255, 0.3)';
        ctx.fillRect(x, y, barWidth, barHeight);

        // Draw progress
        ctx.fillStyle = '#00FFFF';
        ctx.fillRect(x, y, barWidth * progress, barHeight);
    }

    /**
     * Render frame number
     * @private
     */
    _renderFrameNumber(ctx, frame, total, opts) {
        ctx.fillStyle = '#FFFFFF';
        ctx.font = '24px Arial';
        ctx.textAlign = 'left';
        ctx.fillText(`Frame ${frame + 1}/${total}`, 20, 40);
    }

    /**
     * Render 2x2 layout
     * @private
     */
    async _render2x2Layout(ctx, opts) {
        const modelIds = opts.modelIds.slice(0, 4);
        const panelWidth = opts.width / 2;
        const panelHeight = (opts.height - 100) / 2;

        const positions = [
            { x: 0, y: 100 },
            { x: panelWidth, y: 100 },
            { x: 0, y: 100 + panelHeight },
            { x: panelWidth, y: 100 + panelHeight }
        ];

        for (let i = 0; i < modelIds.length; i++) {
            await this._renderModelPanel(
                ctx,
                modelIds[i],
                positions[i].x,
                positions[i].y,
                panelWidth,
                panelHeight,
                opts
            );
        }
    }

    /**
     * Render 1x3 layout
     * @private
     */
    async _render1x3Layout(ctx, opts) {
        const modelIds = opts.modelIds.slice(0, 3);
        const panelWidth = opts.width / 3;
        const panelHeight = opts.height - 150;

        for (let i = 0; i < modelIds.length; i++) {
            await this._renderModelPanel(
                ctx,
                modelIds[i],
                i * panelWidth,
                120,
                panelWidth,
                panelHeight,
                opts
            );
        }
    }

    /**
     * Render side-by-side layout
     * @private
     */
    async _renderSideBySideLayout(ctx, opts) {
        return this._render1x3Layout(ctx, opts);
    }

    /**
     * Render figure title
     * @private
     */
    _renderFigureTitle(ctx, opts) {
        ctx.fillStyle = '#000000';
        ctx.font = 'bold 48px Arial';
        ctx.textAlign = 'center';
        ctx.fillText(opts.figureTitle, opts.width / 2, 60);
    }

    /**
     * Render panel labels
     * @private
     */
    _renderPanelLabels(ctx, opts) {
        ctx.fillStyle = '#000000';
        ctx.font = 'bold 40px Arial';
        ctx.textAlign = 'left';

        const positions = this._getPanelLabelPositions(opts.layout, opts);

        for (let i = 0; i < opts.panelLabels.length && i < positions.length; i++) {
            ctx.fillText(opts.panelLabels[i], positions[i].x, positions[i].y);
        }
    }

    /**
     * Get panel label positions
     * @private
     */
    _getPanelLabelPositions(layout, opts) {
        const layouts = {
            '2x2': [
                { x: 40, y: 140 },
                { x: opts.width / 2 + 40, y: 140 },
                { x: 40, y: opts.height / 2 + 40 },
                { x: opts.width / 2 + 40, y: opts.height / 2 + 40 }
            ],
            '1x3': [
                { x: 40, y: 160 },
                { x: opts.width / 3 + 40, y: 160 },
                { x: (opts.width / 3) * 2 + 40, y: 160 }
            ],
            'side-by-side': [
                { x: 40, y: 160 },
                { x: opts.width / 2 + 40, y: 160 }
            ]
        };

        return layouts[layout] || layouts['side-by-side'];
    }

    /**
     * Download blob
     * @private
     */
    _downloadBlob(blob, filename) {
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
    }
}

// Export
if (typeof window !== 'undefined') {
    window.ComparisonExporter = ComparisonExporter;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { ComparisonExporter };
}
