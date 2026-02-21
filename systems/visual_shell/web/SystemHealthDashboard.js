/**
 * Geometry OS: SystemHealthDashboard
 *
 * Real-time system health dashboard widget for monitoring
 * bridge latency, tile count, sync coherence, and system stability.
 * Listens for geometryOS:metricsUpdate events and renders a styled table.
 */

class SystemHealthDashboard {
    /**
     * Create a new SystemHealthDashboard instance
     * @param {string|HTMLElement} container - Container element or selector
     * @param {Object} options - Configuration options
     */
    constructor(container, options = {}) {
        // Resolve container
        this.container = typeof container === 'string'
            ? document.querySelector(container)
            : container;

        if (!this.container) {
            console.error('%c[SystemHealthDashboard] Container not found', 'color: #ff4444');
            return;
        }

        // Configuration
        this.options = {
            latencyTarget: 100,    // Target latency in ms (below = PASS)
            tileTarget: 100,       // Target tile count (above = WARN)
            ...options
        };

        // Current metrics state
        this.metrics = {
            avgLatency: 0,
            tileCount: 0,
            syncCoherence: 100,    // Percentage
            bufferDrops: 0,
            reconnectCount: 0,
            lastUpdate: null
        };

        // Bound event handler for cleanup
        this._handleMetricsUpdate = this._onMetricsUpdate.bind(this);

        // Inject styles
        this._injectStyles();

        // Initial render
        this.render();

        // Bind events
        this.bindEvents();

        console.log('%c[SystemHealthDashboard] Initialized', 'color: #00ffcc');
    }

    /**
     * Bind event listeners
     */
    bindEvents() {
        window.addEventListener('geometryOS:metricsUpdate', this._handleMetricsUpdate);
    }

    /**
     * Handle metrics update event
     * @param {CustomEvent} event - The metrics update event
     */
    _onMetricsUpdate(event) {
        const detail = event.detail;

        // Update metrics from event
        this.metrics.avgLatency = detail.avgLatency ?? 0;
        this.metrics.tileCount = detail.tileCount ?? 0;
        this.metrics.syncCoherence = this._calculateSyncCoherence(detail);
        this.metrics.bufferDrops = detail.bufferDrops ?? 0;
        this.metrics.reconnectCount = detail.reconnectCount ?? 0;
        this.metrics.lastUpdate = detail.timestamp ?? Date.now();

        // Re-render
        this.render();
    }

    /**
     * Calculate sync coherence percentage
     * @param {Object} detail - Event detail with metrics
     * @returns {number} - Coherence percentage (0-100)
     */
    _calculateSyncCoherence(detail) {
        // If we have syncs and low buffer drops, coherence is high
        const syncs = detail.syncCount ?? 0;
        const drops = detail.bufferDrops ?? 0;

        if (syncs === 0) return 100; // No syncs yet, assume healthy

        const coherence = Math.max(0, 100 - (drops / syncs) * 100);
        return Math.round(coherence);
    }

    /**
     * Get status (PASS or WARN) based on value vs target
     * @param {number} value - Current value
     * @param {number} target - Target threshold
     * @param {boolean} inverse - If true, value above target is WARN (for latency)
     * @returns {string} - 'PASS' or 'WARN'
     */
    getStatus(value, target, inverse = false) {
        if (inverse) {
            // For latency: lower is better
            return value <= target ? 'PASS' : 'WARN';
        } else {
            // For tile count, coherence: higher is better (or target is max)
            return value <= target ? 'PASS' : 'WARN';
        }
    }

    /**
     * Get color for status
     * @param {string} status - 'PASS' or 'WARN'
     * @returns {string} - CSS color value
     */
    getStatusColor(status) {
        return status === 'PASS' ? '#00ff00' : '#ffcc00';
    }

    /**
     * Format timestamp to human-readable time ago
     * @param {number} ts - Timestamp in milliseconds
     * @returns {string} - Human-readable string
     */
    formatTimestamp(ts) {
        if (!ts) return 'Never';

        const now = Date.now();
        const diff = now - ts;

        if (diff < 1000) return 'Just now';
        if (diff < 60000) return `${Math.floor(diff / 1000)}s ago`;
        if (diff < 3600000) return `${Math.floor(diff / 60000)}m ago`;
        if (diff < 86400000) return `${Math.floor(diff / 3600000)}h ago`;

        return new Date(ts).toLocaleTimeString();
    }

    /**
     * Inject inline CSS styles
     */
    _injectStyles() {
        const styleId = 'system-health-dashboard-styles';

        // Don't inject twice
        if (document.getElementById(styleId)) return;

        const style = document.createElement('style');
        style.id = styleId;
        style.textContent = `
            .system-health-dashboard {
                background: #1a1a2e;
                border: 1px solid #00ffcc;
                border-radius: 8px;
                padding: 16px;
                font-family: 'JetBrains Mono', 'Fira Code', monospace;
                color: #e0e0e0;
                min-width: 320px;
                box-shadow: 0 4px 12px rgba(0, 255, 204, 0.15);
            }

            .shd-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 12px;
                padding-bottom: 8px;
                border-bottom: 1px solid #00ffcc33;
            }

            .shd-title {
                color: #00ffcc;
                font-size: 14px;
                font-weight: bold;
                letter-spacing: 1px;
            }

            .shd-last-update {
                color: #888;
                font-size: 11px;
            }

            .shd-table {
                width: 100%;
                border-collapse: collapse;
                font-size: 12px;
            }

            .shd-table th {
                text-align: left;
                color: #888;
                font-weight: normal;
                padding: 6px 8px;
                border-bottom: 1px solid #333;
            }

            .shd-table td {
                padding: 8px;
                border-bottom: 1px solid #222;
            }

            .shd-table tr:last-child td {
                border-bottom: none;
            }

            .shd-metric-name {
                color: #e0e0e0;
            }

            .shd-target {
                color: #666;
            }

            .shd-value {
                color: #00ffcc;
                font-weight: bold;
            }

            .shd-status {
                font-weight: bold;
                text-align: center;
            }

            .shd-status-pass {
                color: #00ff00;
            }

            .shd-status-warn {
                color: #ffcc00;
            }
        `;
        document.head.appendChild(style);
    }

    /**
     * Render the dashboard to the container
     */
    render() {
        if (!this.container) return;

        const metrics = [
            {
                name: 'Bridge Latency',
                value: this.metrics.avgLatency.toFixed(1) + ' ms',
                target: '< ' + this.options.latencyTarget + ' ms',
                status: this.getStatus(this.metrics.avgLatency, this.options.latencyTarget, true)
            },
            {
                name: 'Tile Count',
                value: this.metrics.tileCount.toString(),
                target: '< ' + this.options.tileTarget,
                status: this.getStatus(this.metrics.tileCount, this.options.tileTarget, false)
            },
            {
                name: 'Sync Coherence',
                value: this.metrics.syncCoherence + '%',
                target: '> 90%',
                status: this.metrics.syncCoherence >= 90 ? 'PASS' : 'WARN'
            },
            {
                name: 'Buffer Drops',
                value: this.metrics.bufferDrops.toString(),
                target: '0',
                status: this.metrics.bufferDrops === 0 ? 'PASS' : 'WARN'
            },
            {
                name: 'Reconnects',
                value: this.metrics.reconnectCount.toString(),
                target: '0',
                status: this.metrics.reconnectCount === 0 ? 'PASS' : 'WARN'
            }
        ];

        const html = `
            <div class="system-health-dashboard">
                <div class="shd-header">
                    <span class="shd-title">SYSTEM HEALTH</span>
                    <span class="shd-last-update">${this.formatTimestamp(this.metrics.lastUpdate)}</span>
                </div>
                <table class="shd-table">
                    <thead>
                        <tr>
                            <th>Metric</th>
                            <th>Target</th>
                            <th>Current</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        ${metrics.map(m => `
                            <tr>
                                <td class="shd-metric-name">${m.name}</td>
                                <td class="shd-target">${m.target}</td>
                                <td class="shd-value">${m.value}</td>
                                <td class="shd-status shd-status-${m.status.toLowerCase()}" style="color: ${this.getStatusColor(m.status)}">${m.status}</td>
                            </tr>
                        `).join('')}
                    </tbody>
                </table>
            </div>
        `;

        this.container.innerHTML = html;
    }

    /**
     * Destroy the dashboard and cleanup
     */
    destroy() {
        window.removeEventListener('geometryOS:metricsUpdate', this._handleMetricsUpdate);

        if (this.container) {
            this.container.innerHTML = '';
        }

        console.log('%c[SystemHealthDashboard] Destroyed', 'color: #00ffcc');
    }
}

// Export for testing in Node.js
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SystemHealthDashboard;
}
