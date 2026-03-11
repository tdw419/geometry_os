/**
 * TemporalView - Visualizes temporal patterns in neural activity
 *
 * Displays timeline views, trend charts, and state change indicators
 * for temporal analysis of neural activity over time.
 *
 * Part of: Neural Heatmap Phase 2.1.4 - Advanced Correlation Analytics
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-1-4-correlation-analytics.md
 */

class TemporalView {
    /**
     * Create a new TemporalView
     * @param {Object} options - Configuration options
     * @param {PIXI.Container} options.container - Parent container
     * @param {number} options.width - View width (default: 350)
     * @param {number} options.height - View height (default: 400)
     * @param {Object} options.position - Position {x, y}
     */
    constructor(options = {}) {
        this.options = {
            width: 350,
            height: 400,
            position: { x: 750, y: 20 },
            padding: 10,
            title: 'Temporal Patterns',
            maxDataPoints: 100,
            ...options
        };

        this.container = null;
        this.timelineData = [];
        this.patternData = [];
        this.trendData = [];

        // Graphics objects
        this.timelineGraphics = null;
        this.patternContainer = null;
        this.trendGraphics = null;

        // Loading indicator
        this.loadingIndicator = null;

        // Theme support
        this.themeManager = null;
        this.themeChangeHandler = null;
        this.backgroundGraphics = null;
        this.titleText = null;
        this.sectionLabels = [];

        // Initialize theme when available
        this._initTheme();

        // Enhanced tooltip (Phase 2.2)
        this.enhancedTooltip = null;
        if (typeof EnhancedTooltip !== 'undefined') {
            this.enhancedTooltip = new EnhancedTooltip({
                width: 300,
                maxHeight: 380,
                density: 'normal',
                showMiniCharts: true
            });
            console.log('[TemporalView] Enhanced tooltip initialized');
        }

        // Predictive analytics integration (Phase 2.3)
        this.predictiveAnalytics = null;
        this.predictionVisualizer = null;
        this.showPredictions = false;

        if (typeof PredictiveAnalytics !== 'undefined') {
            this.predictiveAnalytics = new PredictiveAnalytics({
                lookbackWindow: 20,
                predictionHorizon: 10,
                enableOnlineLearning: true,
                retrainInterval: 60000
            });
            console.log('[TemporalView] Predictive analytics initialized');
        }

        if (typeof PredictionVisualizer !== 'undefined') {
            this.predictionVisualizer = new PredictionVisualizer({
                temporalView: this,
                predictiveAnalytics: this.predictiveAnalytics
            });
            console.log('[TemporalView] Prediction visualizer initialized');
        }

        // Accessibility (Phase 2.3)
        this.accessiblePoints = [];
        this.accessiblePatterns = [];
        this.currentFocusedPoint = null;
        this._initAccessibility();

        console.log('[TemporalView] Initialized');
    }

    /**
     * Initialize accessibility features (Phase 2.3)
     * @private
     */
    _initAccessibility() {
        // Register with accessibility manager if available
        if (typeof AccessibilityMixin !== 'undefined') {
            AccessibilityMixin.initAccessibility(this, {
                id: 'temporal-view',
                label: 'Temporal Patterns View',
                description: 'Displays temporal patterns in neural activity including timeline, detected periodic patterns, and trend analysis.',
                role: 'region'
            });
        }
    }

    /**
     * Create the UI
     * @returns {PIXI.Container} UI container
     */
    create() {
        if (typeof PIXI === 'undefined') {
            console.warn('[TemporalView] PIXI not available');
            return { addChild: () => {}, visible: true };
        }

        this.container = new PIXI.Container();
        this.container.x = this.options.position.x;
        this.container.y = this.options.position.y;
        this.container.zIndex = 1000;

        // Background
        this._createBackground();

        // Title
        this._createTitle();

        // Create sections
        this._createTimelineSection();
        this._createPatternsSection();
        this._createTrendSection();

        // Initialize and add loading indicator
        if (typeof LoadingIndicator !== 'undefined') {
            this.loadingIndicator = new LoadingIndicator({
                message: 'Analyzing patterns...',
                color: this._getThemeColor('accent', 'magenta'),
                x: this.options.width / 2,
                y: this.options.height / 2
            });
            const loadingContainer = this.loadingIndicator.create();
            this.container.addChild(loadingContainer);
        }

        // Make interactive
        this.container.eventMode = 'static';

        // Apply theme to existing elements
        this._applyTheme();

        console.log('[TemporalView] Created');

        return this.container;
    }

    /**
     * Create background panel
     * @private
     */
    _createBackground() {
        this.backgroundGraphics = new PIXI.Graphics();
        const bgColor = this._getThemeColor('background', 'panel');
        const bgOpacity = this._getThemeOpacity('background', 'panelOpacity');
        const borderColor = this._getThemeColor('border', 'secondary');

        this.backgroundGraphics.beginFill(bgColor, bgOpacity);
        this.backgroundGraphics.lineStyle(1, borderColor, 0.3);
        this.backgroundGraphics.drawRoundedRect(0, 0, this.options.width, this.options.height, 8);
        this.backgroundGraphics.endFill();
        this.container.addChild(this.backgroundGraphics);
    }

    /**
     * Create title
     * @private
     */
    _createTitle() {
        const titleColor = this._getThemeColor('border', 'secondary');
        const ui = this._getThemeUI();

        this.titleText = new PIXI.Text(this.options.title, {
            fontFamily: 'Arial, sans-serif',
            fontSize: ui.fontSize.title,
            fontWeight: 'bold',
            fill: titleColor
        });
        this.titleText.x = this.options.padding;
        this.titleText.y = 15;
        this.container.addChild(this.titleText);
    }

    /**
     * Create timeline section
     * @private
     */
    _createTimelineSection() {
        const sectionY = 45;
        const sectionHeight = 120;

        // Section label
        const labelColor = this._getThemeColor('text', 'tertiary');
        const ui = this._getThemeUI();
        const label = new PIXI.Text('Activity Timeline', {
            fontFamily: 'Arial, sans-serif',
            fontSize: ui.fontSize.label,
            fill: labelColor
        });
        label.x = this.options.padding;
        label.y = sectionY;
        this.container.addChild(label);
        this.sectionLabels.push(label);

        // Timeline container
        this.timelineGraphics = new PIXI.Graphics();
        this.timelineGraphics.x = this.options.padding;
        this.timelineGraphics.y = sectionY + 20;
        this.container.addChild(this.timelineGraphics);

        // Add baseline
        const borderColor = this._getThemeColor('border', 'subtle');
        this.timelineGraphics.lineStyle(1, borderColor, 0.5);
        this.timelineGraphics.moveTo(0, 30);
        this.timelineGraphics.lineTo(this.options.width - 2 * this.options.padding, 30);
    }

    /**
     * Create patterns section
     * @private
     */
    _createPatternsSection() {
        const sectionY = 180;

        const labelColor = this._getThemeColor('text', 'tertiary');
        const ui = this._getThemeUI();
        const label = new PIXI.Text('Detected Patterns', {
            fontFamily: 'Arial, sans-serif',
            fontSize: ui.fontSize.label,
            fill: labelColor
        });
        label.x = this.options.padding;
        label.y = sectionY;
        this.container.addChild(label);
        this.sectionLabels.push(label);

        this.patternContainer = new PIXI.Container();
        this.patternContainer.x = this.options.padding;
        this.patternContainer.y = sectionY + 20;
        this.container.addChild(this.patternContainer);
    }

    /**
     * Create trend section
     * @private
     */
    _createTrendSection() {
        const sectionY = 300;

        const labelColor = this._getThemeColor('text', 'tertiary');
        const ui = this._getThemeUI();
        const label = new PIXI.Text('Trend Analysis', {
            fontFamily: 'Arial, sans-serif',
            fontSize: ui.fontSize.label,
            fill: labelColor
        });
        label.x = this.options.padding;
        label.y = sectionY;
        this.container.addChild(label);
        this.sectionLabels.push(label);

        this.trendGraphics = new PIXI.Graphics();
        this.trendGraphics.x = this.options.padding;
        this.trendGraphics.y = sectionY + 20;
        this.container.addChild(this.trendGraphics);
    }

    /**
     * Update with temporal data
     * @param {Object} temporalData - Data from TemporalAnalyzer
     */
    update(temporalData) {
        if (!temporalData) return;

        // Show loading indicator
        if (this.loadingIndicator) {
            this.loadingIndicator.show();
        }

        // Update views
        if (temporalData.timeWindows && temporalData.timeWindows.length > 0) {
            this._updateTimeline(temporalData.timeWindows);
        }

        if (temporalData.periodic && temporalData.periodic.length > 0) {
            this._updatePatterns(temporalData.periodic);
        }

        if (temporalData.trends && temporalData.trends.length > 0) {
            this._updateTrends(temporalData.trends[0], temporalData.timeWindows);
        }

        // Update predictions if enabled (Phase 2.3)
        if (this.showPredictions) {
            this._updatePredictions();
        }

        // Hide loading indicator after update
        if (this.loadingIndicator) {
            this.loadingIndicator.hide();
        }
    }

    /**
     * Update timeline visualization
     * @private
     */
    _updateTimeline(timeWindows) {
        if (!this.timelineGraphics) return;

        // Clear previous
        this.timelineGraphics.clear();

        // Draw baseline
        const borderColor = this._getThemeColor('border', 'subtle');
        this.timelineGraphics.lineStyle(1, borderColor, 0.5);
        this.timelineGraphics.moveTo(0, 30);
        this.timelineGraphics.lineTo(this.options.width - 2 * this.options.padding, 30);

        // Draw activity points
        const width = this.options.width - 2 * this.options.padding;
        const step = width / Math.min(timeWindows.length, 50);

        // Store timeWindows for later reference (Phase 2.2)
        this.timelineData = timeWindows;

        // Create interactive container for points (Phase 2.2)
        if (!this.timelinePointsContainer) {
            this.timelinePointsContainer = new PIXI.Container();
            this.timelineGraphics.addChild(this.timelinePointsContainer);
        } else {
            this.timelinePointsContainer.removeChildren();
        }

        timeWindows.forEach((window, i) => {
            const x = i * step;
            const height = (window.avgIntensity / (window.maxIntensity || 1)) * 25;

            // Color based on intensity
            const intensity = window.avgIntensity || 0;
            const color = this._intensityToColor(intensity);

            const point = new PIXI.Graphics();
            point.beginFill(color, 0.8);
            point.drawCircle(x, 30 - height, 4);
            point.endFill();

            // Make interactive for tooltip (Phase 2.2)
            point.eventMode = 'static';
            point.cursor = 'pointer';
            point.data = {
                type: 'temporal',
                timeWindow: window,
                index: i,
                timestamp: window.timestamp || Date.now() - (timeWindows.length - i) * 1000,
                totalPoints: timeWindows.length
            };

            point.on('pointerover', (event) => this._onPointHover(event, point.data));
            point.on('pointerout', () => this._onPointOut());

            // Accessibility: Add keyboard navigation (Phase 2.3)
            point.on('keydown', (event) => this._onPointKeydown(event, point, i, timeWindows.length));

            this.timelinePointsContainer.addChild(point);

            // Track accessible points for keyboard navigation
            this.accessiblePoints.push(point);
        });

        // Announce timeline update to screen readers
        this._announceTimelineUpdate(timeWindows.length);
    }

    /**
     * Handle keyboard navigation for timeline points (Phase 2.3)
     * @private
     */
    _onPointKeydown(event, point, index, totalPoints) {
        let nextIndex = index;
        let handled = false;

        switch (event.key) {
            case 'ArrowRight':
                nextIndex = (index + 1) % totalPoints;
                handled = true;
                break;
            case 'ArrowLeft':
                nextIndex = (index - 1 + totalPoints) % totalPoints;
                handled = true;
                break;
            case 'Home':
                nextIndex = 0;
                handled = true;
                break;
            case 'End':
                nextIndex = totalPoints - 1;
                handled = true;
                break;
            case 'Enter':
            case ' ':
                // Announce point details
                this._announcePoint(point.data);
                handled = true;
                break;
        }

        if (handled) {
            event.preventDefault();

            // Find and focus next point
            if (nextIndex < this.accessiblePoints.length) {
                const nextPoint = this.accessiblePoints[nextIndex];
                this._focusPoint(nextPoint, nextIndex);
            }
        }
    }

    /**
     * Focus on a specific timeline point (Phase 2.3)
     * @private
     */
    _focusPoint(point, index) {
        // Remove focus indicator from previous point
        if (this.currentFocusedPoint) {
            this.currentFocusedPoint.alpha = 1;
        }

        // Add focus indicator to new point
        point.alpha = 0.5;
        this.currentFocusedPoint = point;

        // Announce point info
        this._announcePoint(point.data);
    }

    /**
     * Announce timeline point information (Phase 2.3)
     * @private
     */
    _announcePoint(data) {
        const intensity = data.timeWindow.avgIntensity?.toFixed(2) || '0';
        const events = data.timeWindow.totalEvents || 0;
        const maxIntensity = data.timeWindow.maxIntensity?.toFixed(2) || '0';

        const message = `Time window ${data.index + 1} of ${data.totalPoints}: ` +
                       `${events} events, average intensity ${intensity}, ` +
                       `maximum intensity ${maxIntensity}`;

        if (typeof AccessibilityMixin !== 'undefined') {
            AccessibilityMixin.announce(this, message, 'polite');
        }
    }

    /**
     * Announce timeline update (Phase 2.3)
     * @private
     */
    _announceTimelineUpdate(pointCount) {
        const message = `Timeline updated with ${pointCount} time windows`;
        if (typeof AccessibilityMixin !== 'undefined') {
            AccessibilityMixin.announce(this, message, 'polite');
        }
    }

    /**
     * Update patterns display
     * @private
     */
    _updatePatterns(patterns) {
        if (!this.patternContainer) return;

        this.patternContainer.removeChildren();

        let y = 0;

        const successColor = this._getThemeColor('status', 'success');
        const mutedColor = this._getThemeColor('text', 'muted');

        patterns.forEach(pattern => {
            const text = new PIXI.Text(
                `∿ ${Math.round(pattern.frequency * 10) / 10} Hz (${(pattern.confidence * 100).toFixed(0)}%)`,
                {
                    fontFamily: 'Arial, sans-serif',
                    fontSize: 9,
                    fill: successColor
                }
            );
            text.x = 0;
            text.y = y;

            // Make interactive for tooltip (Phase 2.2)
            text.eventMode = 'static';
            text.cursor = 'pointer';
            text.data = {
                type: 'temporal',
                periodic: patterns,
                patternIndex: patterns.indexOf(pattern),
                pattern: pattern
            };

            text.on('pointerover', (event) => this._onPatternHover(event, text.data));
            text.on('pointerout', () => this._onPatternOut());

            // Accessibility: Add keyboard navigation (Phase 2.3)
            text.on('keydown', (event) => this._onPatternKeydown(event, text, patterns.indexOf(pattern), patterns.length));

            this.patternContainer.addChild(text);

            // Track accessible patterns for keyboard navigation
            this.accessiblePatterns.push(text);

            y += 15;
        });

        if (patterns.length === 0) {
            const noneText = new PIXI.Text('No patterns detected', {
                fontFamily: 'Arial, sans-serif',
                fontSize: 9,
                fill: mutedColor
            });
            noneText.x = 0;
            noneText.y = 0;
            this.patternContainer.addChild(noneText);

            // Announce no patterns
            if (typeof AccessibilityMixin !== 'undefined') {
                AccessibilityMixin.announce(this, 'No periodic patterns detected', 'polite');
            }
        } else {
            // Announce patterns count
            if (typeof AccessibilityMixin !== 'undefined') {
                AccessibilityMixin.announce(this, `Detected ${patterns.length} periodic patterns`, 'polite');
            }
        }
    }

    /**
     * Handle keyboard navigation for pattern items (Phase 2.3)
     * @private
     */
    _onPatternKeydown(event, text, index, totalPatterns) {
        let nextIndex = index;
        let handled = false;

        switch (event.key) {
            case 'ArrowDown':
                nextIndex = (index + 1) % totalPatterns;
                handled = true;
                break;
            case 'ArrowUp':
                nextIndex = (index - 1 + totalPatterns) % totalPatterns;
                handled = true;
                break;
            case 'Home':
                nextIndex = 0;
                handled = true;
                break;
            case 'End':
                nextIndex = totalPatterns - 1;
                handled = true;
                break;
            case 'Enter':
            case ' ':
                // Announce pattern details
                this._announcePattern(text.data);
                handled = true;
                break;
        }

        if (handled) {
            event.preventDefault();

            // Find and focus next pattern
            if (nextIndex < this.accessiblePatterns.length) {
                const nextPattern = this.accessiblePatterns[nextIndex];
                this._focusPattern(nextPattern, nextIndex);
            }
        }
    }

    /**
     * Focus on a specific pattern (Phase 2.3)
     * @private
     */
    _focusPattern(pattern, index) {
        // Add visual focus indicator
        pattern.alpha = 0.7;

        // Announce pattern info
        this._announcePattern(pattern.data);

        // Reset after delay
        setTimeout(() => {
            pattern.alpha = 1;
        }, 200);
    }

    /**
     * Announce pattern information (Phase 2.3)
     * @private
     */
    _announcePattern(data) {
        const pattern = data.pattern;
        const frequency = pattern.frequency.toFixed(2);
        const confidence = (pattern.confidence * 100).toFixed(0);
        const strength = pattern.confidence > 0.8 ? 'strong' :
                        pattern.confidence > 0.5 ? 'moderate' : 'weak';

        const message = `Pattern ${data.patternIndex + 1}: ${strength} ${frequency} Hz oscillation, ${confidence}% confidence`;

        if (typeof AccessibilityMixin !== 'undefined') {
            AccessibilityMixin.announce(this, message, 'polite');
        }
    }

    /**
     * Update trend visualization
     * @private
     */
    _updateTrends(trend, timeWindows) {
        if (!this.trendGraphics || !timeWindows || timeWindows.length === 0) return;

        this.trendGraphics.clear();

        const width = this.options.width - 2 * this.options.padding;
        const step = width / Math.min(timeWindows.length, 50);
        const accentColor = this._getThemeColor('accent', 'cyan');

        // Compute trend line
        this.trendGraphics.lineStyle(2, accentColor, 0.6);
        this.trendGraphics.moveTo(0, 60);

        timeWindows.forEach((window, i) => {
            const x = i * step;
            const slope = trend.slope || 0;
            const intercept = trend.intercept || 0;
            const index = (window.avgIntensity || 0) * 100;

            // Draw point
            const y = 60 - (slope * index + intercept) * 30;

            if (i === timeWindows.length - 1) {
                this.trendGraphics.lineTo(x, y);
            }

            // Draw point
            this.trendGraphics.beginFill(accentColor, 0.8);
            this.trendGraphics.drawCircle(x, y, 3);
            this.trendGraphics.endFill();
        });

        // Draw direction label
        const dir = trend.direction || 'stable';
        let dirColor;
        if (dir === 'increasing') {
            dirColor = this._getThemeColor('status', 'success');
        } else if (dir === 'decreasing') {
            dirColor = this._getThemeColor('status', 'error');
        } else {
            dirColor = this._getThemeColor('status', 'neutral');
        }

        const dirText = new PIXI.Text(`Trend: ${dir} (${(trend.confidence * 100).toFixed(0)}%)`, {
            fontFamily: 'Arial, sans-serif',
            fontSize: 9,
            fill: dirColor
        });
        dirText.x = 0;
        dirText.y = -10;
        this.trendGraphics.addChild(dirText);
    }

    /**
     * Convert intensity to color
     * @private
     */
    _intensityToColor(intensity) {
        // Use theme colors for intensity
        const lowColor = this._getThemeColor('intensity', 'low');
        const mediumColor = this._getThemeColor('intensity', 'medium');
        const highColor = this._getThemeColor('intensity', 'high');

        if (intensity < 0.3) {
            return lowColor;
        } else if (intensity < 0.7) {
            return mediumColor;
        } else {
            return highColor;
        }
    }

    /**
     * Show/hide the view
     * @param {boolean} visible - Visibility state
     */
    setVisible(visible) {
        if (this.container) {
            this.container.visible = visible;
        }
    }

    /**
     * Destroy view
     */
    destroy() {
        // Clean up enhanced tooltip (Phase 2.2)
        if (this.enhancedTooltip) {
            this.enhancedTooltip.destroy();
            this.enhancedTooltip = null;
        }

        // Clean up predictive analytics (Phase 2.3)
        if (this.predictiveAnalytics) {
            this.predictiveAnalytics.destroy();
            this.predictiveAnalytics = null;
        }

        if (this.predictionVisualizer) {
            this.predictionVisualizer.destroy();
            this.predictionVisualizer = null;
        }

        // Remove theme change listener
        if (this.themeManager && this.themeChangeHandler) {
            this.themeManager.removeEventListener('themechange', this.themeChangeHandler);
        }

        if (this.container) {
            this.container.destroy();
            this.container = null;
        }
        this.timelineData = [];
        this.patternData = [];
        this.trendData = [];
        this.sectionLabels = [];
    }

    /**
     * Initialize theme manager integration
     * @private
     */
    _initTheme() {
        if (typeof window !== 'undefined' && window.analyticsTheme) {
            this.themeManager = window.analyticsTheme;

            // Register theme change handler
            this.themeChangeHandler = () => {
                this._applyTheme();
            };

            this.themeManager.addEventListener('themechange', this.themeChangeHandler);
        }
    }

    /**
     * Apply theme to all themed elements
     * @private
     */
    _applyTheme() {
        if (!this.container) return;

        // Update background
        if (this.backgroundGraphics) {
            this.backgroundGraphics.clear();
            const bgColor = this._getThemeColor('background', 'panel');
            const bgOpacity = this._getThemeOpacity('background', 'panelOpacity');
            const borderColor = this._getThemeColor('border', 'secondary');

            this.backgroundGraphics.beginFill(bgColor, bgOpacity);
            this.backgroundGraphics.lineStyle(1, borderColor, 0.3);
            this.backgroundGraphics.drawRoundedRect(0, 0, this.options.width, this.options.height, 8);
            this.backgroundGraphics.endFill();
        }

        // Update title
        if (this.titleText) {
            this.titleText.style.fill = this._getThemeColor('border', 'secondary');
            const ui = this._getThemeUI();
            this.titleText.style.fontSize = ui.fontSize.title;
        }

        // Update section labels
        const labelColor = this._getThemeColor('text', 'tertiary');
        this.sectionLabels.forEach(label => {
            label.style.fill = labelColor;
        });

        // Re-render timeline and trends with new theme
        if (this.timelineData.length > 0) {
            this._updateTimeline(this.timelineData);
        }
        if (this.trendData.length > 0) {
            this._updateTrends(this.trendData[0], this.timelineData);
        }
    }

    /**
     * Handle timeline point hover for enhanced tooltip (Phase 2.2)
     * @param {Object} event - PIXI event
     * @param {Object} data - Point data
     * @private
     */
    _onPointHover(event, data) {
        if (!this.enhancedTooltip) return;

        const globalPos = event.data.global;

        // Create detailed temporal data for tooltip
        const tooltipData = {
            type: 'temporal',
            summary: {
                totalEvents: data.timeWindow.totalEvents || 0,
                avgIntensity: data.timeWindow.avgIntensity || 0,
                maxIntensity: data.timeWindow.maxIntensity || 0,
                stdDev: data.timeWindow.stdDev || 0
            },
            timeWindows: [data.timeWindow],
            timestamp: data.timestamp
        };

        this.enhancedTooltip.show(tooltipData, {
            x: globalPos.x + 15,
            y: globalPos.y + 15
        }, `Time Window ${data.index}`);
    }

    /**
     * Handle pattern hover for enhanced tooltip (Phase 2.2)
     * @param {Object} event - PIXI event
     * @param {Object} data - Pattern data
     * @private
     */
    _onPatternHover(event, data) {
        if (!this.enhancedTooltip) return;

        const globalPos = event.data.global;

        // Create detailed pattern data for tooltip
        const tooltipData = {
            type: 'temporal',
            periodic: data.periodic,
            summary: {
                totalEvents: data.periodic.length,
                avgIntensity: data.pattern.confidence
            }
        };

        this.enhancedTooltip.show(tooltipData, {
            x: globalPos.x + 15,
            y: globalPos.y + 15
        }, 'Pattern Analysis');
    }

    /**
     * Handle point/pattern out (Phase 2.2)
     * @private
     */
    _onPointOut() {
        if (!this.enhancedTooltip) return;
        if (!this.enhancedTooltip.isPinned) {
            this.enhancedTooltip.hide();
        }
    }

    /**
     * Handle pattern out (Phase 2.2)
     * @private
     */
    _onPatternOut() {
        if (!this.enhancedTooltip) return;
        if (!this.enhancedTooltip.isPinned) {
            this.enhancedTooltip.hide();
        }
    }

    /**
     * Enable/disable prediction overlay (Phase 2.3)
     * @param {boolean} enabled - Whether to show predictions
     */
    setPredictionsEnabled(enabled) {
        this.showPredictions = enabled;

        if (this.predictionVisualizer) {
            if (enabled) {
                // Generate and show predictions
                this._updatePredictions();
            } else {
                // Clear prediction overlays
                this.predictionVisualizer.clearOverlays();
            }
        }
    }

    /**
     * Update prediction visualizations (Phase 2.3)
     * @private
     */
    async _updatePredictions() {
        if (!this.showPredictions || !this.predictiveAnalytics || !this.predictionVisualizer) {
            return;
        }

        // Feed timeline data to predictive analytics
        if (this.timelineData && this.timelineData.length > 0) {
            // Record recent activity
            for (const window of this.timelineData.slice(-20)) {
                this.predictiveAnalytics.recordData(
                    'neural-activity',
                    window.avgIntensity || 0,
                    [window.avgIntensity || 0, window.maxIntensity || 0]
                );
            }

            // Generate forecast
            try {
                const predictions = await this.predictiveAnalytics.forecast('neural-activity', {
                    horizon: 10,
                    confidence: 0.95
                });

                // Update visualization
                this.predictionVisualizer.updatePredictions('neural-activity', predictions);
            } catch (error) {
                console.warn('[TemporalView] Failed to update predictions:', error);
            }
        }
    }

    /**
     * Get predictive analytics instance (Phase 2.3)
     * @returns {PredictiveAnalytics|null} Predictive analytics instance
     */
    getPredictiveAnalytics() {
        return this.predictiveAnalytics;
    }

    /**
     * Get prediction visualizer instance (Phase 2.3)
     * @returns {PredictionVisualizer|null} Prediction visualizer instance
     */
    getPredictionVisualizer() {
        return this.predictionVisualizer;
    }

    /**
     * Get color from current theme
     * @private
     */
    _getThemeColor(category, shade) {
        if (this.themeManager) {
            return this.themeManager.getColor(category, shade);
        }

        // Fallback to dark theme defaults
        const defaults = {
            background: {
                panel: 0x0a0a1a,
                panelOpacity: 0.95
            },
            border: {
                secondary: 0xFF00FF,
                subtle: 0x666666
            },
            text: {
                tertiary: 0xAAAAAA,
                muted: 0x666666
            },
            accent: {
                cyan: 0x00FFFF
            },
            status: {
                success: 0x00FF88,
                error: 0xFF4444,
                neutral: 0x888888
            },
            intensity: {
                low: 0x00FF00,
                medium: 0xFFFF00,
                high: 0xFF0000
            }
        };

        return defaults[category]?.[shade] || 0x000000;
    }

    /**
     * Get opacity from current theme
     * @private
     */
    _getThemeOpacity(category, shade) {
        if (this.themeManager) {
            return this.themeManager.getColor(category, shade);
        }

        // Fallback default
        return 0.95;
    }

    /**
     * Get UI settings from current theme
     * @private
     */
    _getThemeUI() {
        if (this.themeManager) {
            const theme = this.themeManager.getTheme();
            return theme?.ui || { fontSize: { title: 14, label: 11, small: 9 } };
        }

        return { fontSize: { title: 14, label: 11, small: 9 } };
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.TemporalView = TemporalView;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { TemporalView };
}
