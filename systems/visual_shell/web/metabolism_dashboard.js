/**
 * MetabolismDashboard - Visual display of V13 Evolution Daemon metabolism
 *
 * Shows:
 * - CPU/Memory metabolism meters (circular arcs)
 * - Throttle status indicator (Metabolism Core)
 * - Prognostics feed (RTS health predictions)
 * - Alert notifications for aggressive throttling
 */

class MetabolismDashboard {
    /**
     * Create a new MetabolismDashboard
     * @param {Object} options - Configuration options
     * @param {Object} options.safetyBridge - EvolutionSafetyBridge instance
     * @param {Object} options.position - Screen position {x, y}
     * @param {number} options.width - Dashboard width (default: 280)
     * @param {number} options.pollInterval - Poll interval in ms (default: 3000)
     */
    constructor(options = {}) {
        this.options = {
            width: 280,
            height: 200,
            position: { x: 20, y: 310 }, // Below performance dashboard
            visible: true,
            pollInterval: 3000,
            maxPrognosticsEntries: 5,
            ...options
        };

        this.safetyBridge = options.safetyBridge || null;
        this.container = null;
        this._labels = new Map();
        this._meters = new Map();
        this._prognosticsLog = [];
        this._pollTimer = null;
        this._lastMetabolism = null;
    }

    /**
     * Create the dashboard UI
     * @returns {PIXI.Container} Dashboard container
     */
    create() {
        this.container = new PIXI.Container();
        this.container.x = this.options.position.x;
        this.container.y = this.options.position.y;
        this.container.zIndex = 1001;
        this.container.visible = this.options.visible;

        // Background
        this._createBackground();

        // Title
        this._createTitle();

        // CPU/Memory meters
        this._createMetabolismMeters();

        // Throttle status (Metabolism Core)
        this._createThrottleIndicator();

        // Prognostics feed
        this._createPrognosticsFeed();

        // Start polling
        this._startPolling();

        console.log('[MetabolismDashboard] Created');
        return this.container;
    }

    /**
     * Create background panel
     * @private
     */
    _createBackground() {
        const bg = new PIXI.Graphics();
        bg.beginFill(0x0a0a1a, 0.9);
        bg.lineStyle(1, 0x00FF88, 0.3);
        bg.drawRoundedRect(0, 0, this.options.width, this.options.height, 6);
        bg.endFill();
        this.container.addChild(bg);
    }

    /**
     * Create title
     * @private
     */
    _createTitle() {
        const title = new PIXI.Text('🧬 Metabolism', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0x00FF88
        });
        title.x = 10;
        title.y = 8;
        this.container.addChild(title);
    }

    /**
     * Create CPU/Memory circular meters
     * @private
     */
    _createMetabolismMeters() {
        const meterY = 35;
        const meterRadius = 25;
        const meterSpacing = 80;

        // CPU Meter
        this._createCircularMeter('cpu', 50, meterY, meterRadius, 'CPU', 0x00FFFF);

        // Memory Meter
        this._createCircularMeter('memory', 50 + meterSpacing, meterY, meterRadius, 'MEM', 0x4ECDC4);

        // Throttle Meter (smaller)
        this._createCircularMeter('throttle', 50 + meterSpacing * 2, meterY, meterRadius * 0.8, 'THR', 0xFF6B6B);
    }

    /**
     * Create a circular progress meter
     * @private
     */
    _createCircularMeter(id, x, y, radius, label, color) {
        const container = new PIXI.Container();
        container.x = x;
        container.y = y;
        this.container.addChild(container);

        // Background circle
        const bgCircle = new PIXI.Graphics();
        bgCircle.lineStyle(4, 0x333355, 0.5);
        bgCircle.drawCircle(0, 0, radius);
        this.container.addChild(bgCircle);

        // Progress arc (drawn dynamically)
        const progressArc = new PIXI.Graphics();
        progressArc.x = x;
        progressArc.y = y;
        this.container.addChild(progressArc);
        this._meters.set(`${id}_arc`, progressArc);
        this._meters.set(`${id}_radius`, radius);
        this._meters.set(`${id}_color`, color);

        // Value text
        const valueText = new PIXI.Text('--', {
            fontFamily: 'monospace',
            fontSize: 10,
            fontWeight: 'bold',
            fill: 0xFFFFFF
        });
        valueText.anchor.set(0.5);
        valueText.x = x;
        valueText.y = y;
        this.container.addChild(valueText);
        this._labels.set(`${id}_value`, valueText);

        // Label text
        const labelText = new PIXI.Text(label, {
            fontFamily: 'monospace',
            fontSize: 8,
            fill: 0x888888
        });
        labelText.anchor.set(0.5);
        labelText.x = x;
        labelText.y = y + radius + 12;
        this.container.addChild(labelText);
    }

    /**
     * Create throttle status indicator (Metabolism Core)
     * @private
     */
    _createThrottleIndicator() {
        // Status indicator box
        const statusBox = new PIXI.Graphics();
        statusBox.x = 10;
        statusBox.y = 95;
        this.container.addChild(statusBox);
        this._meters.set('status_box', statusBox);

        // Status label
        const statusLabel = new PIXI.Text('Throttle: NONE', {
            fontFamily: 'monospace',
            fontSize: 10,
            fill: 0x00FF00
        });
        statusLabel.x = 15;
        statusLabel.y = 100;
        this.container.addChild(statusLabel);
        this._labels.set('throttle_status', statusLabel);
    }

    /**
     * Create prognostics feed area
     * @private
     */
    _createPrognosticsFeed() {
        // Title
        const feedTitle = new PIXI.Text('📊 Prognostics:', {
            fontFamily: 'monospace',
            fontSize: 9,
            fill: 0x888888
        });
        feedTitle.x = 10;
        feedTitle.y = 120;
        this.container.addChild(feedTitle);

        // Feed container
        this._prognosticsContainer = new PIXI.Container();
        this._prognosticsContainer.x = 10;
        this._prognosticsContainer.y = 135;
        this.container.addChild(this._prognosticsContainer);
    }

    /**
     * Start polling for metabolism data
     * @private
     */
    _startPolling() {
        if (!this.safetyBridge) {
            console.warn('[MetabolismDashboard] No safetyBridge, polling disabled');
            return;
        }

        // Initial fetch
        this._pollMetabolism();

        // Set up interval
        this._pollTimer = setInterval(() => {
            this._pollMetabolism();
        }, this.options.pollInterval);
    }

    /**
     * Poll metabolism data from safety bridge
     * @private
     */
    async _pollMetabolism() {
        if (!this.safetyBridge) return;

        try {
            const metabolism = await this.safetyBridge.getMetabolism();
            this._lastMetabolism = metabolism;
            this._updateDisplay(metabolism);
        } catch (e) {
            console.warn('[MetabolismDashboard] Poll failed:', e.message);
            this._showConnectionError();
        }
    }

    /**
     * Update display with new metabolism data
     * @private
     */
    _updateDisplay(metabolism) {
        // Update CPU meter
        this._updateCircularMeter('cpu', metabolism.cpu_percent || 0, '%');

        // Update Memory meter
        const memUsed = (metabolism.memory_total_mb || 0) - (metabolism.memory_available_mb || 0);
        const memPercent = metabolism.memory_total_mb
            ? (memUsed / metabolism.memory_total_mb) * 100
            : 0;
        this._updateCircularMeter('memory', memPercent, '%');

        // Update throttle
        const throttleLevel = metabolism.throttle_level || 'none';
        const throttlePercent = throttleLevel === 'none' ? 0 :
                               throttleLevel === 'moderate' ? 50 : 90;
        this._updateCircularMeter('throttle', throttlePercent, '');
        this._updateThrottleStatus(throttleLevel);
    }

    /**
     * Update a circular meter's arc and value
     * @private
     */
    _updateCircularMeter(id, percent, suffix) {
        const arc = this._meters.get(`${id}_arc`);
        const radius = this._meters.get(`${id}_radius`);
        const baseColor = this._meters.get(`${id}_color`);
        const valueText = this._labels.get(`${id}_value`);

        if (!arc || !radius) return;

        // Clear and redraw arc
        arc.clear();

        const startAngle = -Math.PI / 2; // Start at top
        const endAngle = startAngle + (Math.PI * 2 * (percent / 100));

        // Color based on level
        let color = baseColor;
        if (percent > 80) {
            color = 0xFF4444;
        } else if (percent > 60) {
            color = 0xFFAA00;
        }

        arc.lineStyle(4, color, 0.9);
        arc.arc(0, 0, radius, startAngle, endAngle);

        // Update value text
        if (valueText) {
            valueText.text = `${Math.round(percent)}${suffix}`;
            valueText.style.fill = color;
        }
    }

    /**
     * Update throttle status indicator
     * @private
     */
    _updateThrottleStatus(level) {
        const statusBox = this._meters.get('status_box');
        const statusLabel = this._labels.get('throttle_status');

        if (!statusBox || !statusLabel) return;

        let color, text;
        switch (level) {
            case 'none':
                color = 0x00FF00;
                text = 'Throttle: NONE';
                break;
            case 'moderate':
                color = 0xFFAA00;
                text = 'Throttle: MODERATE';
                break;
            case 'aggressive':
                color = 0xFF4444;
                text = 'Throttle: AGGRESSIVE';
                break;
            default:
                color = 0x888888;
                text = `Throttle: ${level}`;
        }

        // Redraw status box
        statusBox.clear();
        statusBox.beginFill(color, 0.2);
        statusBox.lineStyle(1, color, 0.8);
        statusBox.drawRoundedRect(0, 0, this.options.width - 20, 20, 4);
        statusBox.endFill();

        // Update text
        statusLabel.text = text;
        statusLabel.style.fill = color;
    }

    /**
     * Show connection error state
     * @private
     */
    _showConnectionError() {
        const statusLabel = this._labels.get('throttle_status');
        if (statusLabel) {
            statusLabel.text = '⚠️ No connection';
            statusLabel.style.fill = 0xFF6B6B;
        }
    }

    /**
     * Add a prognostics entry to the feed
     * @param {Object} entry - Prognostics entry {rts_path, health_score, action}
     */
    addPrognosticsEntry(entry) {
        this._prognosticsLog.unshift(entry);

        // Trim to max entries
        if (this._prognosticsLog.length > this.options.maxPrognosticsEntries) {
            this._prognosticsLog.pop();
        }

        this._refreshPrognosticsFeed();
    }

    /**
     * Refresh the prognostics feed display
     * @private
     */
    _refreshPrognosticsFeed() {
        // Clear existing entries
        while (this._prognosticsContainer.children.length > 0) {
            const child = this._prognosticsContainer.children[0];
            this._prognosticsContainer.removeChild(child);
            child.destroy();
        }

        // Add entries
        this._prognosticsLog.forEach((entry, i) => {
            const healthColor = entry.health_score >= 0.8 ? 0x00FF00 :
                               entry.health_score >= 0.5 ? 0xFFAA00 : 0xFF4444;

            const text = new PIXI.Text(
                `${entry.rts_path?.substring(0, 15) || 'unknown'}: ${entry.health_score?.toFixed(2) || '--'} ${entry.action || ''}`,
                {
                    fontFamily: 'monospace',
                    fontSize: 8,
                    fill: healthColor
                }
            );
            text.y = i * 11;
            this._prognosticsContainer.addChild(text);
        });
    }

    /**
     * Update dashboard (call from main loop)
     */
    update() {
        // Polling is handled by timer, this is for any per-frame updates
    }

    /**
     * Toggle visibility
     */
    toggle() {
        this.container.visible = !this.container.visible;
    }

    /**
     * Set visibility
     * @param {boolean} visible - Visibility state
     */
    setVisible(visible) {
        this.container.visible = visible;
    }

    /**
     * Destroy dashboard
     */
    destroy() {
        if (this._pollTimer) {
            clearInterval(this._pollTimer);
            this._pollTimer = null;
        }

        if (this.container && this.container.parent) {
            this.container.parent.removeChild(this.container);
        }
        this.container?.destroy();
        this._labels.clear();
        this._meters.clear();
        this._prognosticsLog = [];
    }
}

// Export
if (typeof window !== 'undefined') {
    window.MetabolismDashboard = MetabolismDashboard;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { MetabolismDashboard };
}
