/**
 * Enhanced Tooltip System
 *
 * Neural Heatmap Phase 2.2: Rich interactive tooltips with detailed analytics
 *
 * Features:
 * - Rich content with charts and statistics
 * - Pin/unpin functionality
 * - Keyboard navigation (Tab, Escape)
 * - Customizable size and content density
 * - Mini chart visualization
 * - Contextual information display
 */

class EnhancedTooltip {
    constructor(options = {}) {
        this.options = {
            maxWidth: options.maxWidth || 300,
            maxHeight: options.maxHeight || 200,
            padding: options.padding || 12,
            fontSize: options.fontSize || 11,
            density: options.density || 'medium',
            showCharts: options.showCharts !== false,
            enablePinning: options.enablePinning !== false,
            enableKeyboardNav: options.enableKeyboardNav !== false,
            animationDuration: options.animationDuration || 150,
            ...options
        };

        this.visible = false;
        this.pinned = false;
        this.currentData = null;
        this.position = { x: 0, y: 0 };

        this.container = new PIXI.Container();
        this.container.visible = false;
        this.container.eventMode = 'static';

        this.background = new PIXI.Graphics();
        this.container.addChild(this.background);

        this.contentContainer = new PIXI.Container();
        this.container.addChild(this.contentContainer);

        this.pinButton = null;
        if (this.options.enablePinning) {
            this._createPinButton();
        }

        this.closeButton = null;
        this._createCloseButton();

        if (this.options.enableKeyboardNav) {
            this._setupKeyboardControls();
        }

        console.log('[EnhancedTooltip] Initialized');
    }

    create() {
        this._drawBackground();
        return this.container;
    }

    _drawBackground() {
        this.background.clear();
        this.background.beginFill(0x1a1a2e, 0.95);
        this.background.lineStyle(1, 0x4D96FF, 0.6);
        this.background.drawRoundedRect(0, 0, this.options.maxWidth, this.options.maxHeight, 6);
        this.background.endFill();
    }

    _createPinButton() {
        this.pinButton = new PIXI.Container();
        this.pinButton.eventMode = 'static';
        this.pinButton.cursor = 'pointer';
        this.pinButton.x = this.options.maxWidth - 24;
        this.pinButton.y = 8;

        const icon = new PIXI.Graphics();
        icon.lineStyle(1.5, 0x888888);
        icon.moveTo(6, 12);
        icon.lineTo(6, 6);
        icon.arc(6, 6, 4, Math.PI, 0);
        icon.lineTo(10, 12);
        this.pinButton.addChild(icon);

        this.pinButton.on('pointerdown', () => this.togglePin());
        this.container.addChild(this.pinButton);
    }

    _createCloseButton() {
        this.closeButton = new PIXI.Container();
        this.closeButton.eventMode = 'static';
        this.closeButton.cursor = 'pointer';
        this.closeButton.x = this.options.maxWidth - 24;
        this.closeButton.y = 8;

        const icon = new PIXI.Graphics();
        icon.lineStyle(1.5, 0x888888);
        icon.moveTo(2, 2);
        icon.lineTo(10, 10);
        icon.moveTo(10, 2);
        icon.lineTo(2, 10);
        this.closeButton.addChild(icon);

        this.closeButton.on('pointerdown', () => this.hide());
        this.closeButton.visible = false;
        this.container.addChild(this.closeButton);
    }

    _setupKeyboardControls() {
        this._handleKeyDown = (event) => {
            if (!this.visible) return;
            switch(event.key) {
                case 'Escape':
                    if (this.pinned) this.unpin();
                    else this.hide();
                    break;
                case 'p':
                case 'P':
                    if (event.ctrlKey || event.metaKey) {
                        event.preventDefault();
                        this.togglePin();
                    }
                    break;
            }
        };
        window.addEventListener('keydown', this._handleKeyDown);
    }

    show(data, position, options = {}) {
        this.currentData = data;
        if (position) {
            this.position = this._adjustPosition(position);
            this.container.x = this.position.x;
            this.container.y = this.position.y;
        }
        this._updateContent(data, options);
        this.container.visible = true;
        this.visible = true;
        this._animateIn();
        if (this.closeButton) this.closeButton.visible = this.pinned;
        if (this.pinButton) this.pinButton.visible = !this.pinned;
    }

    _updateContent(data, options = {}) {
        this.contentContainer.removeChildren();
        let yOffset = this.options.padding;

        if (data.title) {
            const title = new PIXI.Text(data.title, {
                fontFamily: 'Arial',
                fontSize: this.options.fontSize + 2,
                fill: 0x4D96FF,
                fontWeight: 'bold',
                wordWrap: true,
                wordWrapWidth: this.options.maxWidth - this.options.padding * 2
            });
            title.x = this.options.padding;
            title.y = yOffset;
            this.contentContainer.addChild(title);
            yOffset += title.height + 8;
        }

        if (data.content) {
            const content = new PIXI.Text(data.content, {
                fontFamily: 'Arial',
                fontSize: this.options.fontSize,
                fill: 0xFFFFFF,
                wordWrap: true,
                wordWrapWidth: this.options.maxWidth - this.options.padding * 2,
                lineHeight: this.options.fontSize * 1.4
            });
            content.x = this.options.padding;
            content.y = yOffset;
            this.contentContainer.addChild(content);
            yOffset += content.height + 8;
        }

        if (data.stats && this.options.density !== 'low') {
            yOffset = this._renderStats(data.stats, yOffset);
        }

        if (data.chart && this.options.showCharts && this.options.density !== 'low') {
            yOffset = this._renderMiniChart(data.chart, yOffset);
        }

        if (data.footer) {
            const footer = new PIXI.Text(data.footer, {
                fontFamily: 'Arial',
                fontSize: this.options.fontSize - 1,
                fill: 0x888888,
                wordWrap: true,
                wordWrapWidth: this.options.maxWidth - this.options.padding * 2
            });
            footer.x = this.options.padding;
            footer.y = yOffset;
            this.contentContainer.addChild(footer);
        }
    }

    _renderStats(stats, yOffset) {
        const statsText = Object.entries(stats)
            .map(([key, value]) => `${this._formatLabel(key)}: ${this._formatValue(value)}`)
            .join('\n');

        const statsObj = new PIXI.Text(statsText, {
            fontFamily: 'Monaco',
            fontSize: this.options.fontSize - 1,
            fill: 0xAAAAAA,
            lineHeight: this.options.fontSize * 1.3
        });
        statsObj.x = this.options.padding;
        statsObj.y = yOffset;
        this.contentContainer.addChild(statsObj);
        return yOffset + statsObj.height + 8;
    }

    _renderMiniChart(chartData, yOffset) {
        const chartWidth = this.options.maxWidth - this.options.padding * 2;
        const chartHeight = 50;
        const chartX = this.options.padding;
        const chartY = yOffset;

        if (chartData.title) {
            const title = new PIXI.Text(chartData.title, {
                fontFamily: 'Arial',
                fontSize: this.options.fontSize - 1,
                fill: 0x888888
            });
            title.x = chartX;
            title.y = chartY;
            this.contentContainer.addChild(title);
            yOffset += title.height + 4;
        }

        const bg = new PIXI.Graphics();
        bg.lineStyle(1, 0x404040);
        bg.drawRect(chartX, yOffset, chartWidth, chartHeight);
        this.contentContainer.addChild(bg);

        if (chartData.type === 'line' && chartData.data) {
            this._drawLineChart(chartData.data, chartX, yOffset, chartWidth, chartHeight);
        } else if (chartData.type === 'bar' && chartData.data) {
            this._drawBarChart(chartData.data, chartX, yOffset, chartWidth, chartHeight);
        }

        return yOffset + chartHeight + 8;
    }

    _drawLineChart(data, x, y, width, height) {
        if (!data || data.length < 2) return;
        const line = new PIXI.Graphics();
        line.lineStyle(1.5, 0x4D96FF);
        const stepX = width / (data.length - 1);
        const minVal = Math.min(...data);
        const maxVal = Math.max(...data);
        const range = maxVal - minVal || 1;
        data.forEach((value, i) => {
            const px = x + i * stepX;
            const py = y + height - ((value - minVal) / range) * height;
            if (i === 0) line.moveTo(px, py);
            else line.lineTo(px, py);
        });
        this.contentContainer.addChild(line);
    }

    _drawBarChart(data, x, y, width, height) {
        if (!data || data.length === 0) return;
        const barWidth = (width / data.length) * 0.8;
        const gap = (width / data.length) * 0.2;
        const maxVal = Math.max(...data) || 1;
        data.forEach((value, i) => {
            const barHeight = (value / maxVal) * height * 0.9;
            const barX = x + i * (barWidth + gap) + gap / 2;
            const barY = y + height - barHeight;
            const bar = new PIXI.Graphics();
            bar.beginFill(0x4D96FF, 0.7);
            bar.drawRect(barX, barY, barWidth, barHeight);
            bar.endFill();
            this.contentContainer.addChild(bar);
        });
    }

    _formatLabel(key) {
        return key.replace(/_/g, ' ').replace(/\b\w/g, l => l.toUpperCase());
    }

    _formatValue(value) {
        if (typeof value === 'number') {
            if (Math.abs(value) < 0.01 || Math.abs(value) >= 1000) {
                return value.toExponential(2);
            }
            return value.toFixed(3);
        }
        return String(value);
    }

    _adjustPosition(position) {
        const screenWidth = window.innerWidth || 1920;
        const screenHeight = window.innerHeight || 1080;
        let x = position.x + 15;
        let y = position.y + 15;
        if (x + this.options.maxWidth > screenWidth) {
            x = position.x - this.options.maxWidth - 15;
        }
        if (y + this.options.maxHeight > screenHeight) {
            y = screenHeight - this.options.maxHeight - 15;
        }
        if (x < 0) x = 15;
        if (y < 0) y = 15;
        return { x, y };
    }

    _animateIn() {
        this.container.alpha = 0;
        this.container.scale.set(0.9);
        const startTime = performance.now();
        const duration = this.options.animationDuration;
        const animate = (currentTime) => {
            const elapsed = currentTime - startTime;
            const progress = Math.min(elapsed / duration, 1);
            const eased = progress * (2 - progress);
            this.container.alpha = eased;
            const scale = 0.9 + 0.1 * eased;
            this.container.scale.set(scale);
            if (progress < 1) requestAnimationFrame(animate);
        };
        requestAnimationFrame(animate);
    }

    hide() {
        if (!this.visible || this.pinned) return;
        this.container.visible = false;
        this.visible = false;
        this.currentData = null;
    }

    togglePin() {
        if (this.pinned) this.unpin();
        else this.pin();
    }

    pin() {
        this.pinned = true;
        if (this.pinButton) this.pinButton.visible = false;
        if (this.closeButton) this.closeButton.visible = true;
    }

    unpin() {
        this.pinned = false;
        if (this.pinButton) this.pinButton.visible = true;
        if (this.closeButton) this.closeButton.visible = false;
    }

    setDensity(density) {
        this.options.density = density;
    }

    getState() {
        return { visible: this.visible, pinned: this.pinned, position: this.position, data: this.currentData };
    }

    destroy() {
        if (this._handleKeyDown) {
            window.removeEventListener('keydown', this._handleKeyDown);
        }
        this.container.destroy();
    }
}

class TooltipFactory {
    static createCorrelationTooltip(correlationValue, layer1, layer2) {
        return {
            title: `Correlation: ${layer1} ↔ ${layer2}`,
            content: `Correlation coefficient: ${correlationValue.toFixed(3)}`,
            stats: {
                value: correlationValue,
                strength: Math.abs(correlationValue) > 0.7 ? 'Strong' : (Math.abs(correlationValue) > 0.3 ? 'Moderate' : 'Weak'),
                direction: correlationValue > 0 ? 'Positive' : 'Negative'
            },
            footer: 'Higher correlation indicates synchronized activity'
        };
    }

    static createTemporalTooltip(patternData, layerId) {
        return {
            title: `Temporal Pattern: ${layerId}`,
            content: `Detected ${patternData.type || 'unknown'} pattern`,
            stats: {
                frequency: patternData.frequency,
                amplitude: patternData.amplitude,
                confidence: patternData.confidence
            },
            chart: {
                type: 'line',
                data: patternData.timeSeries || []
            }
        };
    }

    static createAnomalyTooltip(anomalyData) {
        const severity = anomalyData.score > 3 ? 'Critical' : (anomalyData.score > 2 ? 'Warning' : 'Info');
        return {
            title: `Anomaly Detected: ${anomalyData.layerId}`,
            content: `${severity} anomaly detected`,
            stats: {
                score: anomalyData.score,
                type: anomalyData.type,
                timestamp: new Date(anomalyData.timestamp).toLocaleTimeString()
            },
            footer: 'Click to view details'
        };
    }
}

if (typeof window !== 'undefined') {
    window.EnhancedTooltip = EnhancedTooltip;
    window.TooltipFactory = TooltipFactory;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { EnhancedTooltip, TooltipFactory };
}
