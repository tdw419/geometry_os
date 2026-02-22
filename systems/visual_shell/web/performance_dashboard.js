/**
 * PerformanceDashboard - Visual display of performance metrics
 *
 * Shows:
 * - Real-time FPS counter
 * - Memory usage gauge
 * - Render time graph
 * - Alert notifications
 */

class PerformanceDashboard {
    /**
     * Create a new PerformanceDashboard
     * @param {Object} options - Configuration options
     * @param {PerformanceMonitor} options.monitor - PerformanceMonitor instance
     * @param {Object} options.position - Screen position {x, y}
     * @param {number} options.width - Dashboard width (default: 250)
     */
    constructor(options = {}) {
        this.options = {
            width: 250,
            position: { x: 20, y: 120 }, // Below heatmap controls
            visible: true,
            graphSamples: 60, // 1 second at 60fps
            ...options
        };

        this.monitor = options.monitor;
        if (!this.monitor) {
            throw new Error('PerformanceDashboard requires a monitor');
        }

        this.container = null;
        this._graphs = new Map();
        this._labels = new Map();
    }

    /**
     * Create the dashboard UI
     * @returns {PIXI.Container} Dashboard container
     */
    create() {
        this.container = new PIXI.Container();
        this.container.x = this.options.position.x;
        this.container.y = this.options.position.y;
        this.container.zIndex = 1000;
        this.container.visible = this.options.visible;

        // Background
        this._createBackground();

        // Title
        this._createTitle();

        // FPS display
        this._createFPSDisplay();

        // Memory display
        this._createMemoryDisplay();

        // Render time graph
        this._createRenderTimeGraph();

        // Alert area
        this._createAlertArea();

        console.log('[PerformanceDashboard] Created');
        return this.container;
    }

    /**
     * Create background
     * @private
     */
    _createBackground() {
        const bg = new PIXI.Graphics();
        bg.beginFill(0x0a0a1a, 0.9);
        bg.lineStyle(1, 0x00FFFF, 0.2);
        bg.drawRoundedRect(0, 0, this.options.width, 180, 6);
        bg.endFill();
        this.container.addChild(bg);
    }

    /**
     * Create title
     * @private
     */
    _createTitle() {
        const title = new PIXI.Text('⚡ Performance', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0x00FFFF
        });
        title.x = 10;
        title.y = 8;
        this.container.addChild(title);
    }

    /**
     * Create FPS display
     * @private
     */
    _createFPSDisplay() {
        // Label
        const label = new PIXI.Text('FPS:', {
            fontFamily: 'monospace',
            fontSize: 10,
            fill: 0x888888
        });
        label.x = 10;
        label.y = 30;
        this.container.addChild(label);
        this._labels.set('fps_label', label);

        // Value
        const value = new PIXI.Text('--', {
            fontFamily: 'monospace',
            fontSize: 14,
            fontWeight: 'bold',
            fill: 0x00FF00
        });
        value.x = 45;
        value.y = 28;
        this.container.addChild(value);
        this._labels.set('fps_value', value);
    }

    /**
     * Create memory display
     * @private
     */
    _createMemoryDisplay() {
        // Label
        const label = new PIXI.Text('Memory:', {
            fontFamily: 'monospace',
            fontSize: 10,
            fill: 0x888888
        });
        label.x = 10;
        label.y = 50;
        this.container.addChild(label);

        // Value
        const value = new PIXI.Text('-- MB', {
            fontFamily: 'monospace',
            fontSize: 11,
            fill: 0xAAAAAA
        });
        value.x = 55;
        value.y = 49;
        this.container.addChild(value);
        this._labels.set('memory_value', value);

        // Bar background
        const barBg = new PIXI.Graphics();
        barBg.beginFill(0x333333, 0.5);
        barBg.drawRoundedRect(10, 65, 230, 6, 2);
        barBg.endFill();
        this.container.addChild(barBg);

        // Bar fill
        const barFill = new PIXI.Graphics();
        barFill.beginFill(0x4ECDC4, 0.8);
        barFill.drawRoundedRect(10, 65, 0, 6, 2);
        barFill.endFill();
        this.container.addChild(barFill);
        this._labels.set('memory_bar', barFill);
    }

    /**
     * Create render time graph
     * @private
     */
    _createRenderTimeGraph() {
        // Label
        const label = new PIXI.Text('Render Time:', {
            fontFamily: 'monospace',
            fontSize: 10,
            fill: 0x888888
        });
        label.x = 10;
        label.y = 80;
        this.container.addChild(label);

        // Graph container
        const graphContainer = new PIXI.Container();
        graphContainer.x = 10;
        graphContainer.y = 95;
        this.container.addChild(graphContainer);
        this._graphs.set('renderTime', graphContainer);

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x111122, 0.5);
        bg.lineStyle(1, 0x333355, 0.5);
        bg.drawRect(0, 0, 230, 40);
        bg.endFill();
        graphContainer.addChild(bg);

        // 16ms target line
        const targetLine = new PIXI.Graphics();
        targetLine.lineStyle(1, 0x44FF44, 0.5);
        targetLine.moveTo(0, 20);
        targetLine.lineTo(230, 20);
        graphContainer.addChild(targetLine);

        // Graph line
        const line = new PIXI.Graphics();
        graphContainer.addChild(line);
        this._labels.set('renderTime_line', line);
    }

    /**
     * Create alert area
     * @private
     */
    _createAlertArea() {
        this._alertContainer = new PIXI.Container();
        this._alertContainer.x = 10;
        this._alertContainer.y = 140;
        this.container.addChild(this._alertContainer);
    }

    /**
     * Update dashboard
     */
    update() {
        const stats = this.monitor.getAllStats();

        // Update FPS
        const fpsStats = stats.fps;
        if (fpsStats) {
            const fpsValue = this._labels.get('fps_value');
            fpsValue.text = Math.round(fpsStats.current);

            // Color based on performance
            if (fpsStats.current >= 55) {
                fpsValue.style.fill = 0x00FF00;
            } else if (fpsStats.current >= 30) {
                fpsValue.style.fill = 0xFFFF00;
            } else {
                fpsValue.style.fill = 0xFF4444;
            }
        }

        // Update memory
        const memStats = stats.memory;
        if (memStats) {
            const memValue = this._labels.get('memory_value');
            const memBar = this._labels.get('memory_bar');

            const memMB = Math.round(memStats.current);
            memValue.text = `${memMB} MB`;

            // Update bar (500MB max)
            const barWidth = Math.min((memMB / 500) * 230, 230);
            memBar.clear();
            memBar.beginFill(memMB > 400 ? 0xFF6666 : 0x4ECDC4, 0.8);
            memBar.drawRoundedRect(10, 65, barWidth, 6, 2);
            memBar.endFill();
        }

        // Update render time graph
        const renderStats = stats.renderTime;
        if (renderStats) {
            this._updateRenderTimeGraph();
        }
    }

    /**
     * Update render time graph
     * @private
     */
    _updateRenderTimeGraph() {
        const history = this.monitor.getHistory('renderTime', this.options.graphSamples);
        if (history.length < 2) return;

        const line = this._labels.get('renderTime_line');
        line.clear();

        // Find max for scaling
        const maxTime = Math.max(...history.map(h => h.value), 33); // At least 33ms for scale

        // Draw line graph
        line.lineStyle(1, 0x00FFFF, 0.8);

        const graphWidth = 230;
        const graphHeight = 40;
        const xStep = graphWidth / this.options.graphSamples;

        history.forEach((sample, i) => {
            const x = i * xStep;
            const y = graphHeight - (sample.value / maxTime) * graphHeight;

            if (i === 0) {
                line.moveTo(x, y);
            } else {
                line.lineTo(x, y);
            }
        });
    }

    /**
     * Show an alert
     * @param {Object} alert - Alert data
     */
    showAlert(alert) {
        const text = new PIXI.Text(
            `⚠️ ${alert.metric} ${alert.direction} threshold!`,
            {
                fontFamily: 'Arial, sans-serif',
                fontSize: 9,
                fill: 0xFF6666
            }
        );
        text.x = 0;
        text.y = this._alertContainer.children.length * 12;
        this._alertContainer.addChild(text);

        // Auto-remove after 5 seconds
        setTimeout(() => {
            if (this._alertContainer && text.parent === this._alertContainer) {
                this._alertContainer.removeChild(text);
                text.destroy();
            }
        }, 5000);
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
        if (this.container && this.container.parent) {
            this.container.parent.removeChild(this.container);
        }
        this.container?.destroy();
        this._graphs.clear();
        this._labels.clear();
    }
}

// Export
if (typeof window !== 'undefined') {
    window.PerformanceDashboard = PerformanceDashboard;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PerformanceDashboard };
}
