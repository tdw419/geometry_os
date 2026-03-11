/**
 * ExportUtils - Neural Heatmap Data Export Utilities
 *
 * Provides export functionality for Neural Heatmap data:
 * - PNG image export with custom resolution
 * - CSV data export for statistical analysis
 * - JSON export for state restoration
 * - Publication-ready visualization rendering
 *
 * Usage:
 *   const exporter = new ExportUtils(heatmapOverlay);
 *   await exporter.exportPNG('heatmap.png', { width: 4096, height: 4096 });
 *   exporter.exportCSV('heatmap_data.csv');
 *   exporter.exportJSON('heatmap_state.json');
 */

class ExportUtils {
    constructor(heatmapOverlay) {
        this.heatmap = heatmapOverlay;
        this.options = {
            defaultDPI: 300,
            defaultQuality: 0.95,
            includeMetadata: true,
            includeTimestamp: true
        };
    }

    /**
     * Export heatmap as PNG image
     * @param {string} filename - Output filename
     * @param {Object} options - Export options
     * @returns {Promise<Blob>} PNG image blob
     */
    async exportPNG(filename = 'heatmap.png', options = {}) {
        const opts = {
            width: options.width || 4096,
            height: options.height || 4096,
            quality: options.quality || this.options.defaultQuality,
            backgroundColor: options.backgroundColor || '#000000',
            includeOverlay: options.includeOverlay !== false,
            includeColorbar: options.includeColorbar !== false,
            includeTitle: options.includeTitle !== false,
            title: options.title || 'Neural Heatmap',
            dpi: options.dpi || this.options.defaultDPI,
            ...options
        };

        console.log(`[ExportUtils] Exporting PNG: ${filename} (${opts.width}x${opts.height})`);

        // Create export canvas
        const canvas = document.createElement('canvas');
        canvas.width = opts.width;
        canvas.height = opts.height;
        const ctx = canvas.getContext('2d');

        // Fill background
        ctx.fillStyle = opts.backgroundColor;
        ctx.fillRect(0, 0, opts.width, opts.height);

        // Calculate scale factor
        const bounds = this._getHeatmapBounds();
        const scaleX = opts.width / bounds.width;
        const scaleY = opts.height / bounds.height;
        const scale = Math.min(scaleX, scaleY);

        // Center the heatmap
        const offsetX = (opts.width - bounds.width * scale) / 2;
        const offsetY = (opts.height - bounds.height * scale) / 2;

        ctx.save();
        ctx.translate(offsetX, offsetY);
        ctx.scale(scale, scale);
        ctx.translate(-bounds.x, -bounds.y);

        // Render heatmap tiles
        if (opts.includeOverlay && this.heatmap) {
            this._renderHeatmapToContext(ctx);
        }

        ctx.restore();

        // Add colorbar if requested
        if (opts.includeColorbar) {
            this._renderColorbar(ctx, opts);
        }

        // Add title if requested
        if (opts.includeTitle) {
            this._renderTitle(ctx, opts.title, opts);
        }

        // Add metadata if requested
        if (this.options.includeMetadata) {
            this._renderMetadata(ctx, opts);
        }

        // Convert to blob
        const blob = await new Promise(resolve => {
            canvas.toBlob(resolve, 'image/png', opts.quality);
        });

        // Download if filename provided
        if (filename) {
            this._downloadBlob(blob, filename);
        }

        console.log(`[ExportUtils] PNG export complete: ${(blob.size / 1024).toFixed(2)}KB`);
        return blob;
    }

    /**
     * Export heatmap data as CSV for statistical analysis
     * @param {string} filename - Output filename
     * @param {Object} options - Export options
     * @returns {string} CSV data
     */
    exportCSV(filename = 'heatmap_data.csv', options = {}) {
        const opts = {
            includeHeaders: options.includeHeaders !== false,
            delimiter: options.delimiter || ',',
            includeTimestamp: options.includeTimestamp !== false,
            includeCoordinates: options.includeCoordinates !== false,
            includeAllFields: options.includeAllFields || false,
            aggregation: options.aggregation || 'none', // 'none', 'grid', 'hex'
            gridSize: options.gridSize || 100,
            ...options
        };

        console.log(`[ExportUtils] Exporting CSV: ${filename}`);

        const rows = [];

        // Add headers
        if (opts.includeHeaders) {
            const headers = [];
            if (opts.includeTimestamp) headers.push('timestamp');
            if (opts.includeCoordinates) headers.push('x', 'y');
            headers.push('tile_id', 'value', 'mode', 'layer');
            if (opts.includeAllFields) {
                headers.push('entropy', 'activity', 'gradient', 'intensity');
            }
            rows.push(headers.join(opts.delimiter));
        }

        // Get heatmap data
        const data = this._getHeatmapData();

        // Aggregate if requested
        if (opts.aggregation === 'grid') {
            this._aggregateGrid(data, opts.gridSize).forEach(cell => {
                rows.push(this._formatCSVRow(cell, opts));
            });
        } else {
            // Export raw data
            data.forEach(tile => {
                rows.push(this._formatCSVRow(tile, opts));
            });
        }

        const csv = rows.join('\n');

        // Download if filename provided
        if (filename) {
            const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
            this._downloadBlob(blob, filename);
        }

        console.log(`[ExportUtils] CSV export complete: ${rows.length} rows`);
        return csv;
    }

    /**
     * Export heatmap state as JSON for restoration
     * @param {string} filename - Output filename
     * @param {Object} options - Export options
     * @returns {Object} JSON state object
     */
    exportJSON(filename = 'heatmap_state.json', options = {}) {
        const opts = {
            includeConfig: options.includeConfig !== false,
            includeData: options.includeData !== false,
            includeAttachments: options.includeAttachments !== false,
            includeActivityHistory: options.includeActivityHistory || false,
            pretty: options.pretty !== false,
            compress: options.compress || false,
            ...options
        };

        console.log(`[ExportUtils] Exporting JSON: ${filename}`);

        const state = {
            version: '1.0.0',
            timestamp: new Date().toISOString(),
            heatmap: {}
        };

        // Export configuration
        if (opts.includeConfig && this.heatmap) {
            state.heatmap.config = {
                mode: this.heatmap.mode,
                opacity: this.heatmap.opacity,
                enabled: this.heatmap.enabled,
                visible: this.heatmap.visible,
                gridSize: this.heatmap.config.gridSize,
                maxTiles: this.heatmap.config.maxTiles,
                colorSchemes: this.heatmap.colorSchemes
            };
        }

        // Export tile data
        if (opts.includeData && this.heatmap) {
            state.heatmap.tiles = [];
            for (const [spriteId, attachment] of this.heatmap.attachments) {
                const tile = {
                    id: spriteId,
                    x: attachment.bounds.x,
                    y: attachment.bounds.y,
                    width: attachment.bounds.width,
                    height: attachment.bounds.height,
                    data: attachment.data
                };
                state.heatmap.tiles.push(tile);
            }
        }

        // Export activity history
        if (opts.includeActivityHistory && this.heatmap?.activityTracker) {
            state.heatmap.activityHistory = this.heatmap.activityTracker.getHistory();
        }

        // Export multi-model data
        if (this.heatmap?.multiModelTracker) {
            state.heatmap.multiModel = this.heatmap.multiModelTracker.getState();
        }

        const json = opts.pretty ? JSON.stringify(state, null, 2) : JSON.stringify(state);

        // Download if filename provided
        if (filename) {
            const blob = new Blob([json], { type: 'application/json;charset=utf-8;' });
            this._downloadBlob(blob, filename);
        }

        console.log(`[ExportUtils] JSON export complete: ${(json.length / 1024).toFixed(2)}KB`);
        return state;
    }

    /**
     * Export publication-ready visualization
     * @param {string} filename - Output filename
     * @param {Object} options - Export options
     * @returns {Promise<Blob>} Publication-ready image
     */
    async exportPublication(filename = 'heatmap_publication.png', options = {}) {
        const opts = {
            width: options.width || 8000,
            height: options.height || 8000,
            dpi: options.dpi || 600,
            quality: options.quality || 1.0,
            backgroundColor: options.backgroundColor || '#FFFFFF',
            colorbarPosition: options.colorbarPosition || 'right',
            titleFont: options.titleFont || 'bold 48px Arial',
            labelFont: options.labelFont || '32px Arial',
            title: options.title || 'Neural Activity Heatmap',
            subtitle: options.subtitle || '',
            includeScaleBar: options.includeScaleBar !== false,
            includeNorthArrow: options.includeNorthArrow || false,
            publicationFormat: options.publicationFormat || 'nature', // 'nature', 'science', 'ieee'
            ...options
        };

        console.log(`[ExportUtils] Exporting publication-ready image: ${filename}`);

        // Create publication canvas
        const canvas = document.createElement('canvas');
        canvas.width = opts.width;
        canvas.height = opts.height;
        const ctx = canvas.getContext('2d');

        // Fill white background for publication
        ctx.fillStyle = opts.backgroundColor;
        ctx.fillRect(0, 0, opts.width, opts.height);

        // Calculate layout based on publication format
        const layout = this._getPublicationLayout(opts);

        // Render title
        if (opts.title) {
            ctx.fillStyle = '#000000';
            ctx.font = opts.titleFont;
            ctx.textAlign = 'center';
            ctx.fillText(opts.title, opts.width / 2, layout.titleY);

            if (opts.subtitle) {
                ctx.font = opts.labelFont;
                ctx.fillText(opts.subtitle, opts.width / 2, layout.titleY + 60);
            }
        }

        // Render heatmap
        const heatmapArea = {
            x: layout.margin,
            y: layout.contentY,
            width: opts.width - layout.margin * 2 - layout.colorbarWidth,
            height: opts.height - layout.contentY - layout.margin
        };

        ctx.save();
        // Clip to heatmap area
        ctx.beginPath();
        ctx.rect(heatmapArea.x, heatmapArea.y, heatmapArea.width, heatmapArea.height);
        ctx.clip();

        // Render heatmap content
        const bounds = this._getHeatmapBounds();
        const scale = Math.min(
            heatmapArea.width / bounds.width,
            heatmapArea.height / bounds.height
        );

        const offsetX = heatmapArea.x + (heatmapArea.width - bounds.width * scale) / 2;
        const offsetY = heatmapArea.y + (heatmapArea.height - bounds.height * scale) / 2;

        ctx.translate(offsetX, offsetY);
        ctx.scale(scale, scale);
        ctx.translate(-bounds.x, -bounds.y);

        if (this.heatmap) {
            this._renderHeatmapToContext(ctx);
        }

        ctx.restore();

        // Render colorbar
        this._renderPublicationColorbar(ctx, heatmapArea, opts);

        // Render scale bar
        if (opts.includeScaleBar) {
            this._renderScaleBar(ctx, heatmapArea, opts);
        }

        // Render north arrow
        if (opts.includeNorthArrow) {
            this._renderNorthArrow(ctx, heatmapArea, opts);
        }

        // Add publication metadata
        this._renderPublicationMetadata(ctx, opts);

        // Convert to blob
        const blob = await new Promise(resolve => {
            canvas.toBlob(resolve, 'image/png', opts.quality);
        });

        // Download if filename provided
        if (filename) {
            this._downloadBlob(blob, filename);
        }

        console.log(`[ExportUtils] Publication export complete: ${(blob.size / 1024).toFixed(2)}KB`);
        return blob;
    }

    /**
     * Get heatmap bounds
     * @private
     */
    _getHeatmapBounds() {
        if (!this.heatmap || this.heatmap.attachments.size === 0) {
            return { x: 0, y: 0, width: 1000, height: 1000 };
        }

        let minX = Infinity, minY = Infinity;
        let maxX = -Infinity, maxY = -Infinity;

        for (const [_, attachment] of this.heatmap.attachments) {
            const b = attachment.bounds;
            minX = Math.min(minX, b.x);
            minY = Math.min(minY, b.y);
            maxX = Math.max(maxX, b.x + b.width);
            maxY = Math.max(maxY, b.y + b.height);
        }

        return {
            x: minX,
            y: minY,
            width: maxX - minX,
            height: maxY - minY
        };
    }

    /**
     * Render heatmap to canvas context
     * @private
     */
    _renderHeatmapToContext(ctx) {
        if (!this.heatmap) return;

        for (const [_, attachment] of this.heatmap.attachments) {
            const { bounds, data, overlay } = attachment;

            // Get color based on mode and data
            const color = this._getColorForData(data);

            ctx.fillStyle = color;
            ctx.fillRect(bounds.x, bounds.y, bounds.width, bounds.height);
        }
    }

    /**
     * Get color for heatmap data
     * @private
     */
    _getColorForData(data) {
        if (!data) return 'rgba(128, 128, 128, 0.5)';

        const mode = this.heatmap?.mode || 'entropy';
        const schemes = this.heatmap?.colorSchemes || {};

        let value;
        if (mode === 'entropy' && data.entropy !== undefined) {
            value = data.entropy;
        } else if (mode === 'activity' && data.activity !== undefined) {
            value = data.activity;
        } else {
            value = 0.5;
        }

        return this._valueToColor(value);
    }

    /**
     * Convert value to color
     * @private
     */
    _valueToColor(value) {
        // Blue (low) to Red (high)
        const normalized = Math.max(0, Math.min(1, value));
        const r = Math.floor(normalized * 255);
        const b = Math.floor((1 - normalized) * 255);
        return `rgba(${r}, 0, ${b}, 0.6)`;
    }

    /**
     * Render colorbar
     * @private
     */
    _renderColorbar(ctx, opts) {
        const barWidth = 40;
        const barHeight = opts.height * 0.6;
        const x = opts.width - barWidth - 40;
        const y = (opts.height - barHeight) / 2;

        // Draw gradient
        const gradient = ctx.createLinearGradient(x, y + barHeight, x, y);
        gradient.addColorStop(0, 'rgb(0, 0, 255)');
        gradient.addColorStop(0.5, 'rgb(0, 255, 0)');
        gradient.addColorStop(1, 'rgb(255, 0, 0)');

        ctx.fillStyle = gradient;
        ctx.fillRect(x, y, barWidth, barHeight);

        // Draw border
        ctx.strokeStyle = '#FFFFFF';
        ctx.lineWidth = 2;
        ctx.strokeRect(x, y, barWidth, barHeight);

        // Draw labels
        ctx.fillStyle = '#FFFFFF';
        ctx.font = '24px Arial';
        ctx.textAlign = 'left';
        ctx.fillText('1.0', x + barWidth + 10, y + 10);
        ctx.fillText('0.5', x + barWidth + 10, y + barHeight / 2);
        ctx.fillText('0.0', x + barWidth + 10, y + barHeight);
    }

    /**
     * Render title
     * @private
     */
    _renderTitle(ctx, title, opts) {
        ctx.fillStyle = '#FFFFFF';
        ctx.font = 'bold 36px Arial';
        ctx.textAlign = 'center';
        ctx.fillText(title, opts.width / 2, 50);
    }

    /**
     * Render metadata
     * @private
     */
    _renderMetadata(ctx, opts) {
        const metadata = [
            `Date: ${new Date().toLocaleDateString()}`,
            `Mode: ${this.heatmap?.mode || 'entropy'}`,
            `Tiles: ${this.heatmap?.attachments.size || 0}`,
            `DPI: ${opts.dpi}`
        ];

        ctx.fillStyle = '#FFFFFF';
        ctx.font = '20px Arial';
        ctx.textAlign = 'left';
        metadata.forEach((text, i) => {
            ctx.fillText(text, 20, opts.height - 20 - (metadata.length - 1 - i) * 30);
        });
    }

    /**
     * Get publication layout
     * @private
     */
    _getPublicationLayout(opts) {
        const layouts = {
            nature: {
                margin: opts.width * 0.08,
                colorbarWidth: 150,
                titleY: 80,
                contentY: 150
            },
            science: {
                margin: opts.width * 0.06,
                colorbarWidth: 120,
                titleY: 70,
                contentY: 130
            },
            ieee: {
                margin: opts.width * 0.05,
                colorbarWidth: 100,
                titleY: 60,
                contentY: 120
            }
        };

        return layouts[opts.publicationFormat] || layouts.nature;
    }

    /**
     * Render publication colorbar
     * @private
     */
    _renderPublicationColorbar(ctx, area, opts) {
        const barWidth = 60;
        const barHeight = area.height * 0.8;
        const x = area.x + area.width + 40;
        const y = area.y + (area.height - barHeight) / 2;

        // Draw gradient
        const gradient = ctx.createLinearGradient(x, y + barHeight, x, y);
        gradient.addColorStop(0, 'rgb(0, 0, 255)');
        gradient.addColorStop(0.25, 'rgb(0, 255, 255)');
        gradient.addColorStop(0.5, 'rgb(0, 255, 0)');
        gradient.addColorStop(0.75, 'rgb(255, 255, 0)');
        gradient.addColorStop(1, 'rgb(255, 0, 0)');

        ctx.fillStyle = gradient;
        ctx.fillRect(x, y, barWidth, barHeight);

        // Draw border
        ctx.strokeStyle = '#000000';
        ctx.lineWidth = 3;
        ctx.strokeRect(x, y, barWidth, barHeight);

        // Draw labels
        ctx.fillStyle = '#000000';
        ctx.font = opts.labelFont;
        ctx.textAlign = 'left';
        ctx.fillText('High', x + barWidth + 20, y + 10);
        ctx.fillText('Low', x + barWidth + 20, y + barHeight);
    }

    /**
     * Render scale bar
     * @private
     */
    _renderScaleBar(ctx, area, opts) {
        const barLength = 200;
        const x = area.x + 40;
        const y = area.y + area.height - 60;

        // Draw bar
        ctx.strokeStyle = '#000000';
        ctx.lineWidth = 4;
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + barLength, y);
        ctx.moveTo(x, y - 10);
        ctx.lineTo(x, y + 10);
        ctx.moveTo(x + barLength, y - 10);
        ctx.lineTo(x + barLength, y + 10);
        ctx.stroke();

        // Draw label
        ctx.fillStyle = '#000000';
        ctx.font = opts.labelFont;
        ctx.textAlign = 'center';
        ctx.fillText('200 μm', x + barLength / 2, y + 40);
    }

    /**
     * Render north arrow
     * @private
     */
    _renderNorthArrow(ctx, area, opts) {
        const x = area.x + area.width - 80;
        const y = area.y + 80;
        const size = 40;

        // Draw arrow
        ctx.fillStyle = '#000000';
        ctx.beginPath();
        ctx.moveTo(x, y - size);
        ctx.lineTo(x - size / 2, y);
        ctx.lineTo(x + size / 2, y);
        ctx.closePath();
        ctx.fill();

        // Draw label
        ctx.font = opts.labelFont;
        ctx.textAlign = 'center';
        ctx.fillText('N', x, y - size - 15);
    }

    /**
     * Render publication metadata
     * @private
     */
    _renderPublicationMetadata(ctx, opts) {
        const metadata = [
            `Generated: ${new Date().toISOString()}`,
            `Geometry OS Neural Heatmap v1.0`,
            `DPI: ${opts.dpi}`
        ];

        ctx.fillStyle = '#666666';
        ctx.font = '24px Arial';
        ctx.textAlign = 'right';
        metadata.forEach((text, i) => {
            ctx.fillText(text, opts.width - 20, opts.height - 30 - i * 35);
        });
    }

    /**
     * Get heatmap data
     * @private
     */
    _getHeatmapData() {
        if (!this.heatmap) return [];

        const data = [];
        for (const [spriteId, attachment] of this.heatmap.attachments) {
            data.push({
                tile_id: spriteId,
                x: attachment.bounds.x,
                y: attachment.bounds.y,
                width: attachment.bounds.width,
                height: attachment.bounds.height,
                data: attachment.data,
                mode: this.heatmap?.mode
            });
        }
        return data;
    }

    /**
     * Format CSV row
     * @private
     */
    _formatCSVRow(tile, opts) {
        const fields = [];

        if (opts.includeTimestamp) {
            fields.push(new Date().toISOString());
        }

        if (opts.includeCoordinates) {
            fields.push(tile.x, tile.y);
        }

        fields.push(
            tile.tile_id,
            tile.data?.entropy || tile.data?.activity || 0,
            tile.mode,
            tile.data?.layer || 'unknown'
        );

        if (opts.includeAllFields) {
            fields.push(
                tile.data?.entropy || 0,
                tile.data?.activity || 0,
                tile.data?.gradient || 0,
                tile.data?.intensity || 0
            );
        }

        return fields.map(f => `"${f}"`).join(opts.delimiter);
    }

    /**
     * Aggregate data to grid
     * @private
     */
    _aggregateGrid(data, gridSize) {
        const grid = new Map();

        for (const tile of data) {
            const gridX = Math.floor(tile.x / gridSize);
            const gridY = Math.floor(tile.y / gridSize);
            const key = `${gridX},${gridY}`;

            if (!grid.has(key)) {
                grid.set(key, {
                    x: gridX * gridSize,
                    y: gridY * gridSize,
                    values: [],
                    count: 0
                });
            }

            const cell = grid.get(key);
            cell.values.push(tile.data?.entropy || tile.data?.activity || 0);
            cell.count++;
        }

        return Array.from(grid.values()).map(cell => ({
            x: cell.x,
            y: cell.y,
            value: cell.values.reduce((a, b) => a + b, 0) / cell.values.length,
            count: cell.count
        }));
    }

    /**
     * Download blob as file
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
    window.ExportUtils = ExportUtils;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { ExportUtils };
}
