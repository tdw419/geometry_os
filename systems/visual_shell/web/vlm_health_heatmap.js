/**
 * Geometry OS: VLM Health Heatmap Visualization
 *
 * Visual feedback for VLM (Vision-Language Model) health monitoring
 * of PixelRTS images. Provides canvas-based rendering with status
 * backgrounds, anomaly highlighting, and tooltips.
 *
 * @class VLMHealthHeatmap
 *
 * Usage:
 *   const heatmap = new VLMHealthHeatmap(container);
 *   heatmap.renderHealthStatus(healthData);
 *   const highlights = heatmap.getAnomalyHighlights();
 */

class VLMHealthHeatmap {
    /**
     * Create a new VLMHealthHeatmap
     * @param {HTMLElement} container - Parent DOM element (required)
     * @param {Object} config - Configuration options
     * @param {number} config.width - Canvas width (default: 800)
     * @param {number} config.height - Canvas height (default: 600)
     * @param {string} config.healthyColor - Background color for healthy status (default: '#4caf50')
     * @param {string} config.degradedColor - Background color for degraded status (default: '#ffc107')
     * @param {string} config.unhealthyColor - Background color for unhealthy status (default: '#f44336')
     * @param {boolean} config.showTooltips - Enable hover tooltips (default: true)
     */
    constructor(container, config = {}) {
        // Validate required container
        if (!container) {
            throw new Error('VLMHealthHeatmap requires a container element');
        }

        this.container = container;
        this.config = {
            width: 800,
            height: 600,
            healthyColor: '#4caf50',
            degradedColor: '#ffc107',
            unhealthyColor: '#f44336',
            neutralColor: '#2196f3',
            showTooltips: true,
            ...config
        };

        // Current state
        this.currentStatus = null;
        this.currentConfidence = 0;
        this.anomalies = [];
        this.anomalyCount = 0;
        this.metadata = {};

        // Create canvas element
        this.canvas = document.createElement('canvas');
        this.canvas.id = `vlm-heatmap-${Date.now()}`;
        this.canvas.width = this.config.width;
        this.canvas.height = this.config.height;
        this.canvas.style.display = 'block';
        this.canvas.style.cursor = 'crosshair';

        // Get 2D context
        this.ctx = this.canvas.getContext('2d');
        if (!this.ctx) {
            throw new Error('Failed to get 2D context from canvas');
        }

        // Add to container
        this.container.appendChild(this.canvas);

        // Anomaly highlights for query
        this.highlights = [];

        // Setup tooltip if enabled
        if (this.config.showTooltips) {
            this.setupTooltip();
        }

        // Setup event listeners
        this.setupEventListeners();
    }

    /**
     * Setup tooltip element
     * @private
     */
    setupTooltip() {
        this.tooltip = document.createElement('div');
        this.tooltip.className = 'vlm-heatmap-tooltip';
        this.tooltip.style.position = 'absolute';
        this.tooltip.style.display = 'none';
        this.tooltip.style.backgroundColor = 'rgba(0, 0, 0, 0.8)';
        this.tooltip.style.color = '#fff';
        this.tooltip.style.padding = '8px 12px';
        this.tooltip.style.borderRadius = '4px';
        this.tooltip.style.fontSize = '12px';
        this.tooltip.style.pointerEvents = 'none';
        this.tooltip.style.zIndex = '1000';
        this.tooltip.style.maxWidth = '300px';
        document.body.appendChild(this.tooltip);
    }

    /**
     * Setup mouse event listeners for tooltips
     * @private
     */
    setupEventListeners() {
        if (!this.config.showTooltips) return;

        this.canvas.addEventListener('mousemove', (e) => this.handleMouseMove(e));
        this.canvas.addEventListener('mouseleave', () => this.hideTooltip());
    }

    /**
     * Handle mouse movement for tooltip display
     * @param {MouseEvent} e - Mouse event
     * @private
     */
    handleMouseMove(e) {
        const rect = this.canvas.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;

        // Check if mouse is over an anomaly region
        const anomaly = this.findAnomalyAtPosition(x, y);
        if (anomaly) {
            this.showTooltip(e.clientX, e.clientY, anomaly);
        } else {
            this.hideTooltip();
        }
    }

    /**
     * Find anomaly at given position
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @returns {Object|null} Anomaly object or null
     * @private
     */
    findAnomalyAtPosition(x, y) {
        for (const highlight of this.highlights) {
            if (x >= highlight.x && x <= highlight.x + highlight.width &&
                y >= highlight.y && y <= highlight.y + highlight.height) {
                return highlight.anomaly;
            }
        }
        return null;
    }

    /**
     * Show tooltip at position
     * @param {number} x - Screen X coordinate
     * @param {number} y - Screen Y coordinate
     * @param {Object} anomaly - Anomaly object
     * @private
     */
    showTooltip(x, y, anomaly) {
        if (!this.tooltip) return;

        this.tooltip.innerHTML = `
            <div style="font-weight: 600; margin-bottom: 4px;">${anomaly.type || 'Anomaly'}</div>
            <div>Region: ${anomaly.region}</div>
            <div>Severity: <span style="color: ${this.getSeverityColor(anomaly.severity)}">${anomaly.severity}</span></div>
        `;
        this.tooltip.style.display = 'block';
        this.tooltip.style.left = `${x + 15}px`;
        this.tooltip.style.top = `${y + 15}px`;
    }

    /**
     * Hide tooltip
     * @private
     */
    hideTooltip() {
        if (this.tooltip) {
            this.tooltip.style.display = 'none';
        }
    }

    /**
     * Get color for severity level
     * @param {string} severity - Severity level
     * @returns {string} CSS color
     * @private
     */
    getSeverityColor(severity) {
        const colors = {
            low: '#4caf50',
            medium: '#ffc107',
            high: '#ff9800',
            critical: '#f44336'
        };
        return colors[severity] || '#fff';
    }

    /**
     * Render health status on canvas
     * @param {Object} healthData - Health data from VLM checker
     * @param {string} healthData.status - 'healthy', 'degraded', or 'unhealthy'
     * @param {number} healthData.confidence - Confidence score (0-1)
     * @param {Array} healthData.anomalies - Array of anomaly objects
     * @param {Object} healthData.metadata - Additional metadata
     */
    renderHealthStatus(healthData) {
        // Update state
        this.currentStatus = healthData.status || 'unknown';
        this.currentConfidence = healthData.confidence || 0;
        this.anomalies = healthData.anomalies || [];
        this.anomalyCount = this.anomalies.length;
        this.metadata = healthData.metadata || {};

        // Clear canvas
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);

        // Draw status background
        this.drawStatusBackground();

        // Draw anomaly highlights
        this.drawAnomalies();

        // Draw status indicator
        this.drawStatusIndicator();

        // Build highlights array for querying
        this.buildHighlights();
    }

    /**
     * Draw status background
     * @private
     */
    drawStatusBackground() {
        const color = this.getStatusColor(this.currentStatus);
        const alpha = 0.15;

        // Fill background with status color
        this.ctx.fillStyle = this.hexToRgba(color, alpha);
        this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);

        // Add gradient overlay for depth
        const gradient = this.ctx.createLinearGradient(0, 0, this.canvas.width, this.canvas.height);
        gradient.addColorStop(0, this.hexToRgba(color, alpha * 0.5));
        gradient.addColorStop(1, this.hexToRgba(color, alpha * 1.5));
        this.ctx.fillStyle = gradient;
        this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
    }

    /**
     * Get color for status
     * @param {string} status - Health status
     * @returns {string} Hex color
     * @private
     */
    getStatusColor(status) {
        const colors = {
            healthy: this.config.healthyColor,
            degraded: this.config.degradedColor,
            unhealthy: this.config.unhealthyColor,
            unknown: this.config.neutralColor
        };
        return colors[status] || this.config.neutralColor;
    }

    /**
     * Convert hex color to RGBA
     * @param {string} hex - Hex color string
     * @param {number} alpha - Alpha value (0-1)
     * @returns {string} RGBA color string
     * @private
     */
    hexToRgba(hex, alpha) {
        // Remove # if present
        hex = hex.replace('#', '');
        const r = parseInt(hex.substring(0, 2), 16);
        const g = parseInt(hex.substring(2, 4), 16);
        const b = parseInt(hex.substring(4, 6), 16);
        return `rgba(${r}, ${g}, ${b}, ${alpha})`;
    }

    /**
     * Draw anomaly regions
     * @private
     */
    drawAnomalies() {
        for (const anomaly of this.anomalies) {
            const region = this.parseRegion(anomaly.region);
            if (!region) continue;

            const severity = anomaly.severity || 'medium';
            const color = this.getSeverityColor(severity);

            // Draw filled region
            this.ctx.fillStyle = this.hexToRgba(color, 0.3);
            this.ctx.fillRect(region.x, region.y, region.width, region.height);

            // Draw border
            this.ctx.strokeStyle = color;
            this.ctx.lineWidth = 2;
            this.ctx.strokeRect(region.x, region.y, region.width, region.height);

            // Draw severity indicator
            this.ctx.fillStyle = color;
            this.ctx.font = 'bold 12px monospace';
            this.ctx.fillText(severity.toUpperCase(), region.x + 5, region.y + 15);
        }
    }

    /**
     * Parse region string to coordinates
     * @param {string} regionStr - Region string like "(0, 0) to (256, 256)"
     * @returns {Object|null} Parsed region with x, y, width, height
     * @private
     */
    parseRegion(regionStr) {
        if (!regionStr) return null;

        // Parse "(x1, y1) to (x2, y2)" format
        const match = regionStr.match(/\((\d+),\s*(\d+)\)\s+to\s+\((\d+),\s*(\d+)\)/);
        if (!match) return null;

        const x1 = parseInt(match[1]);
        const y1 = parseInt(match[2]);
        const x2 = parseInt(match[3]);
        const y2 = parseInt(match[4]);

        return {
            x: Math.min(x1, x2),
            y: Math.min(y1, y2),
            width: Math.abs(x2 - x1),
            height: Math.abs(y2 - y1)
        };
    }

    /**
     * Draw status indicator in corner
     * @private
     */
    drawStatusIndicator() {
        const padding = 15;
        const boxWidth = 200;
        const boxHeight = 80;

        // Draw background box
        this.ctx.fillStyle = 'rgba(0, 0, 0, 0.7)';
        this.ctx.roundRect ?
            this.ctx.roundRect(padding, padding, boxWidth, boxHeight, 8) :
            this.ctx.fillRect(padding, padding, boxWidth, boxHeight);
        this.ctx.fill();

        // Draw status text
        this.ctx.fillStyle = this.getStatusColor(this.currentStatus);
        this.ctx.font = 'bold 16px -apple-system, BlinkMacSystemFont, sans-serif';
        this.ctx.fillText(
            `STATUS: ${this.currentStatus.toUpperCase()}`,
            padding + 15,
            padding + 25
        );

        // Draw confidence
        this.ctx.fillStyle = '#fff';
        this.ctx.font = '12px -apple-system, BlinkMacSystemFont, sans-serif';
        const confidencePercent = Math.round(this.currentConfidence * 100);
        this.ctx.fillText(
            `Confidence: ${confidencePercent}%`,
            padding + 15,
            padding + 45
        );

        // Draw anomaly count
        const anomalyText = this.anomalyCount === 0 ?
            'No anomalies detected' :
            `${this.anomalyCount} anomaly${this.anomalyCount > 1 ? 'ies' : ''} detected`;
        this.ctx.fillText(
            anomalyText,
            padding + 15,
            padding + 65
        );
    }

    /**
     * Build highlights array for querying
     * @private
     */
    buildHighlights() {
        this.highlights = [];
        for (const anomaly of this.anomalies) {
            const region = this.parseRegion(anomaly.region);
            if (!region) continue;

            this.highlights.push({
                region: anomaly.region,
                x: region.x,
                y: region.y,
                width: region.width,
                height: region.height,
                severity: anomaly.severity,
                type: anomaly.type,
                anomaly: anomaly
            });
        }
    }

    /**
     * Get anomaly highlights
     * @returns {Array} Array of highlight objects
     */
    getAnomalyHighlights() {
        return this.highlights.map(h => ({
            region: h.region,
            severity: h.severity,
            type: h.type
        }));
    }

    /**
     * Clear the heatmap
     */
    clear() {
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
        this.currentStatus = null;
        this.currentConfidence = 0;
        this.anomalies = [];
        this.anomalyCount = 0;
        this.highlights = [];
    }

    /**
     * Resize the canvas
     * @param {number} width - New width
     * @param {number} height - New height
     */
    resize(width, height) {
        this.canvas.width = width;
        this.canvas.height = height;
        this.config.width = width;
        this.config.height = height;

        // Re-render if we have data
        if (this.currentStatus) {
            this.renderHealthStatus({
                status: this.currentStatus,
                confidence: this.currentConfidence,
                anomalies: this.anomalies,
                metadata: this.metadata
            });
        }
    }

    /**
     * Destroy the heatmap and clean up
     */
    destroy() {
        if (this.tooltip && this.tooltip.parentNode) {
            this.tooltip.parentNode.removeChild(this.tooltip);
        }
        if (this.canvas && this.canvas.parentNode) {
            this.canvas.parentNode.removeChild(this.canvas);
        }
        this.container = null;
        this.canvas = null;
        this.ctx = null;
        this.tooltip = null;
        this.highlights = [];
    }
}

// Export for use in modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = VLMHealthHeatmap;
}

// Also attach to window for browser use
if (typeof window !== 'undefined') {
    window.VLMHealthHeatmap = VLMHealthHeatmap;
}
