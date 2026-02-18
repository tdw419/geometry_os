/**
 * Geometry OS: Neural Heatmap Overlay
 *
 * Real-time WebGL-based visualization overlay for neural substrate activity.
 * Follows the design specification at docs/plans/2026-02-07-neural-heatmap-overlay-design.md
 *
 * Visualization modes:
 * - entropy: Information entropy heat map (red=high, blue=low)
 * - layer: Neural layer boundary visualization
 * - activity: Real-time activation tracking with decay
 * - gradient: Weight update visualization
 *
 * Performance target: 30+ FPS on 16384×16384 tile grids
 *
 * @class NeuralHeatmapOverlay
 */

class NeuralHeatmapOverlay {
    /**
     * Create a new NeuralHeatmapOverlay
     * @param {Object} config - Configuration options
     * @param {PIXI.Container} config.container - Parent PixiJS container (required)
     * @param {number} config.gridSize - Grid cell size in pixels (default: 100)
     * @param {number} config.maxTiles - Maximum tiles to track (default: 10000)
     * @param {number} config.defaultOpacity - Default overlay opacity (default: 0.6)
     * @param {string} config.defaultMode - Default visualization mode (default: 'entropy')
     * @param {boolean} config.enabled - Start enabled (default: true)
     * @param {ActivityTracker} config.activityTracker - Custom activity tracker instance
     */
    constructor(config = {}) {
        // Validate required config
        if (!config.container && typeof PIXI === 'undefined') {
            throw new Error('NeuralHeatmapOverlay requires either a config.container or PIXI.Container');
        }

        this.config = {
            gridSize: 100,
            maxTiles: 10000,
            defaultOpacity: 0.6,
            defaultMode: 'entropy',
            defaultTheme: 0,
            enabled: true,
            ...config
        };

        // Container for overlay rendering
        this.container = new PIXI.Container();
        this.container.name = 'neuralHeatmapOverlay';
        this.container.zIndex = 200; // Above tiles, below tooltips

        // Add to parent container if provided
        if (this.config.container) {
            this.config.container.addChild(this.container);
        }

        // Overlay state
        this.mode = this.config.defaultMode;
        this.theme = this.config.defaultTheme;
        this.opacity = this.config.defaultOpacity;
        this.enabled = this.config.enabled;
        this.visible = this.config.enabled;

        // Tile attachments: Map<spriteId, {sprite, overlay, data, bounds}>
        this.attachments = new Map();

        // Activity tracking - use global ActivityTracker if available
        if (typeof ActivityTracker !== 'undefined') {
            this.activityTracker = config.activityTracker || new ActivityTracker({
                gridSize: 16, // Match design spec
                decayRate: 0.95,
                maxAge: 5000, // 5 seconds
                maxIntensity: 1.0
            });
        } else {
            console.warn('ActivityTracker not available, activity tracking disabled');
            this.activityTracker = null;
        }

        // Layer mapper for boundary visualization and neural address resolution
        // Phase 2: Deep Inspection & Interaction
        if (typeof LayerMapper !== 'undefined') {
            this.layerMapper = new LayerMapper({
                gridSize: this.config.gridSize,
                bytesPerPixel: 4
            });
            console.log('[Heatmap] LayerMapper initialized for neural address resolution');
        } else {
            this.layerMapper = null;
            console.warn('[Heatmap] LayerMapper not available, neural address resolution will be approximate');
        }
        this.layerBoundaries = new Map();

        // Color schemes for different modes
        this.colorSchemes = {
            entropy: {
                low: { r: 0, g: 0, b: 1 },      // Blue
                medium: { r: 0, g: 1, b: 0 },    // Green
                high: { r: 1, g: 0, b: 0 }       // Red
            },
            layer: {
                embedding: 0x9f7aea,    // Purple
                attention: 0x4299e1,    // Blue
                mlp: 0x48bb78,          // Green
                output: 0xed8936,       // Orange
                other: 0x718096         // Gray
            },
            activity: {
                cold: { r: 0, g: 0.5, b: 1 },    // Cool blue
                warm: { r: 1, g: 0.5, b: 0 }     // Warm orange
            },
            gradient: {
                negative: { r: 0, g: 0, b: 1 },  // Blue (negative change)
                positive: { r: 1, g: 0, b: 0 }   // Red (positive change)
            }
        };

        // WebGL filter/shader for GPU-accelerated rendering
        this.heatmapFilter = null;

        // Performance tracking
        this.stats = {
            frameTime: 0,
            renderTime: 0,
            tileCount: 0,
            activeCells: 0,
            lastUpdate: performance.now(),
            fps: 0
        };

        // Frame timing for FPS calculation
        this._frameCount = 0;
        this._fpsUpdateTime = 0;

        // Viewport culling configuration
        this.cullingEnabled = true;
        this.cullingMargin = 200; // pixels
        this.visibleTiles = new Set();
        this.map = config.container || null; // Reference to map for viewport

        // Initialize tooltip (Phase 2: Interactive Features)
        if (typeof LayerTooltip !== 'undefined') {
            this.tooltip = new LayerTooltip();
            this.tooltipContainer = this.tooltip.create();
            this.container.addChild(this.tooltipContainer);
            this.setupTooltipHandlers();
        }

        // Initialize graphics pool (Phase 3: Performance - Task 3.2)
        if (typeof HeatmapGraphicsPool !== 'undefined') {
            this.graphicsPool = new HeatmapGraphicsPool({
                initialSize: 100,
                maxIdle: 200,
                debug: false
            });
            console.log('[Heatmap] Graphics pool initialized');
        }

        // Browser compatibility (Phase 2.1.1)
        if (typeof BrowserCompatibility !== 'undefined') {
            this.browserCompatibility = new BrowserCompatibility();
            this.browserCompatibility.applyFixes();

            // Log capabilities
            console.log('[Heatmap] Browser capabilities:', this.browserCompatibility.getCapabilitiesReport());
        }

        // Error recovery (Phase 2.1.1)
        if (typeof ErrorRecovery !== 'undefined') {
            this.errorRecovery = new ErrorRecovery({
                maxRetries: 3,
                notifyUser: true
            });

            // Register recovery strategies
            this.errorRecovery.registerStrategy('TypeError', (error, context) => {
                console.log(`[Heatmap] Recovering from TypeError in ${context}`);
                // Return to safe state
                this.setEnabled(false);
                setTimeout(() => this.setEnabled(true), 1000);
            });

            this.errorRecovery.registerStrategy('WebGLContextLostError', (error, context) => {
                console.log('[Heatmap] WebGL context lost, attempting recovery');
                // Recreate context
                this._initializeRenderPipeline();
            });

            // Wire up notifications
            this.errorRecovery.onNotification((message) => {
                if (this.perfDashboard) {
                    this.perfDashboard.showAlert({ metric: 'error', value: message, threshold: 0 });
                }
            });

            console.log('[Heatmap] Error recovery initialized');
        }

        // Performance monitoring (Phase 2.1.1)
        if (typeof PerformanceMonitor !== 'undefined') {
            this.performanceMonitor = new PerformanceMonitor({
                metrics: ['fps', 'memory', 'renderTime'],
                alerts: true,
                historySize: 1000,
                thresholds: {
                    minFps: 30,
                    maxMemory: 500,
                    maxRenderTime: 16
                }
            });

            // Initialize dashboard
            if (typeof PerformanceDashboard !== 'undefined') {
                this.perfDashboard = new PerformanceDashboard({
                    monitor: this.performanceMonitor,
                    position: { x: 20, y: 450 }
                });
                this.perfContainer = this.perfDashboard.create();
                this.container.addChild(this.perfContainer);

                // Wire up alerts
                this.performanceMonitor.onAlert((alert) => {
                    this.perfDashboard.showAlert(alert);
                });
            }

            console.log('[Heatmap] Performance monitoring enabled');
        }

        // Memory leak detection (Phase 2.1.1)
        if (typeof MemoryLeakDetector !== 'undefined') {
            this.memoryLeakDetector = new MemoryLeakDetector({
                enabled: true,
                leakThreshold: 100
            });
            console.log('[Heatmap] Memory leak detection enabled');
        }

        // GPU memory optimization (Phase 2.1.1)
        if (typeof GPUMemoryOptimizer !== 'undefined') {
            this.gpuOptimizer = new GPUMemoryOptimizer({
                enableLOD: true,
                texturePoolSize: 20,
                lodDistances: [500, 1000, 2000]
            });
            console.log('[Heatmap] GPU optimizer enabled');
        }

        // Initialize playback controls (Phase 4: Analytics - Task 4.2)
        if (typeof HeatmapPlaybackControls !== 'undefined' && this.activityTracker) {
            this.playbackControls = new HeatmapPlaybackControls(this.activityTracker, {
                width: 400,
                height: 80
            });
            this.playbackContainer = this.playbackControls.create();
            this.playbackContainer.x = 20;
            this.playbackContainer.y = 350;
            this.container.addChild(this.playbackContainer);
            console.log('[Heatmap] Playback controls initialized');
        }

        // Multi-model support (Phase 2.1)
        if (typeof MultiModelTracker !== 'undefined') {
            this.multiModelTracker = new MultiModelTracker({
                maxModels: 5,
                gridSize: this.config.gridSize,
                decayRate: 0.95
            });

            // Create comparative heatmap when we have 2+ models
            if (typeof ComparativeHeatmap !== 'undefined') {
                this.comparativeHeatmap = new ComparativeHeatmap(this.config.container, {
                    multiModelTracker: this.multiModelTracker,
                    mode: 'split'
                });
                console.log('[Heatmap] Multi-model comparison enabled');
            }
        } else {
            this.multiModelTracker = null;
            this.comparativeHeatmap = null;
        }

        // Model Registry and Discovery integration (Phase 2.1.3)
        if (typeof ModelRegistry !== 'undefined') {
            this.modelRegistry = new ModelRegistry({
                storageKey: 'neural_heatmap_model_registry',
                autoSave: true,
                maxModels: 100
            });

            // Wire up registry change events
            this.modelRegistry.on('add', (data) => {
                console.log('[Heatmap] Model added to registry:', data.model.name);
                // Sync with ModelZooManager if available
                if (this.modelZoo) {
                    try {
                        this.modelZoo.importCustomModel(data.model);
                    } catch (e) {
                        console.warn('[Heatmap] Failed to sync to ModelZoo:', e);
                    }
                }
            });

            this.modelRegistry.on('remove', (data) => {
                console.log('[Heatmap] Model removed from registry:', data.model.name);
            });

            console.log('[Heatmap] ModelRegistry initialized');
        } else {
            this.modelRegistry = null;
        }

        if (typeof ModelDiscovery !== 'undefined') {
            this.modelDiscovery = new ModelDiscovery({
                lmStudioApiUrl: 'http://localhost:1234',
                cacheDuration: 3600000
            });
            this.modelDiscovery.setModelZoo(this.modelZoo);

            // Auto-discover models on init
            this._autoDiscoverModels();

            console.log('[Heatmap] ModelDiscovery initialized');
        } else {
            this.modelDiscovery = null;
        }

        // Auto-load models from registry
        if (this.modelRegistry) {
            this._autoLoadModelsFromRegistry();
        }

        // Phase 2.1.2: InteractiveAnalysis for click-to-zoom and tracing
        if (typeof InteractiveAnalysis !== 'undefined') {
            this.interactiveAnalysis = new InteractiveAnalysis({
                zoomLevel: 2.0,
                maxZoom: 4.0,
                minZoom: 1.0,
                selectionColor: 0x00FFFF,
                showTraces: true,
                traceDuration: 2000
            });

            // Enable interactive analysis on the container
            this.interactiveAnalysis.enable(this.container, this);

            // Wire up zoom callback
            this.interactiveAnalysis.onZoom((zoomLevel, center) => {
                this._handleZoom(zoomLevel, center);
            });

            console.log('[Heatmap] InteractiveAnalysis enabled');
        }

        // Phase 2.1.2: EnhancedOverlay for transparency and blending modes
        if (typeof EnhancedOverlay !== 'undefined' && this.comparativeHeatmap) {
            this.enhancedOverlay = new EnhancedOverlay(this.comparativeHeatmap, {
                container: this.config.container,
                multiModelTracker: this.multiModelTracker,
                defaultTransparency: 50,
                defaultBlendMode: 'screen',
                enableDepthLayering: true,
                position: { x: 20, y: 500 }
            });
            console.log('[Heatmap] EnhancedOverlay enabled');
        }

        // Phase 2.1.2: ExportUtils for export functionality
        if (typeof ExportUtils !== 'undefined') {
            this.exportUtils = new ExportUtils(this);
            console.log('[Heatmap] ExportUtils enabled');
        }

        // Model Zoo Manager integration
        if (typeof ModelZooManager !== 'undefined') {
            this.modelZoo = new ModelZooManager({
                maxCustomModels: 10
            });
            console.log('[Heatmap] ModelZooManager initialized');
        } else {
            this.modelZoo = null;
        }

        // Model Zoo UI integration
        if (typeof ModelZooUI !== 'undefined' && this.modelZoo) {
            this.modelZooUI = new ModelZooUI({
                modelZoo: this.modelZoo,
                width: 300,
                position: { x: 20, y: 20 }
            });
            this.modelZooUIContainer = this.modelZooUI.create();
            this.container.addChild(this.modelZooUIContainer);

            // Wire up model selection to MultiModelTracker
            this.modelZooUI.onModelSelect((action, model) => {
                this._handleModelSelection(action, model);
            });

            console.log('[Heatmap] ModelZooUI initialized');
        }

        // Phase 2.1.4: Advanced Correlation Analytics
        if (typeof CrossLayerAnalyzer !== 'undefined') {
            this.crossLayerAnalyzer = new CrossLayerAnalyzer({
                windowSize: 100,
                correlationThreshold: 0.3
            });
            console.log('[Heatmap] CrossLayerAnalyzer initialized');
        }

        if (typeof TemporalAnalyzer !== 'undefined') {
            this.temporalAnalyzer = new TemporalAnalyzer({
                historySize: 1000,
                minPatternLength: 10
            });
            console.log('[Heatmap] TemporalAnalyzer initialized');
        }

        if (typeof AnomalyDetector !== 'undefined') {
            this.anomalyDetector = new AnomalyDetector({
                zScoreThreshold: 3.0,
                minSamples: 30
            });
            console.log('[Heatmap] AnomalyDetector initialized');
        }

        // Phase 2.1.4: Initialize UI views for advanced analytics
        if (typeof CorrelationMatrixView !== 'undefined') {
            this.correlationMatrixView = new CorrelationMatrixView({
                position: { x: 350, y: 20 },
                width: 400,
                height: 300
            });
            this.correlationMatrixViewContainer = this.correlationMatrixView.create();
            this.correlationMatrixViewContainer.visible = false; // Hidden by default
            this.container.addChild(this.correlationMatrixViewContainer);
            console.log('[Heatmap] CorrelationMatrixView initialized');
        }

        if (typeof TemporalView !== 'undefined') {
            this.temporalView = new TemporalView({
                position: { x: 750, y: 20 },
                width: 350,
                height: 400
            });
            this.temporalViewContainer = this.temporalView.create();
            this.temporalViewContainer.visible = false; // Hidden by default
            this.container.addChild(this.temporalViewContainer);
            console.log('[Heatmap] TemporalView initialized');
        }

        // Analytics update interval (ms) - update views every 500ms
        this._lastAnalyticsViewUpdate = 0;
        this._analyticsViewUpdateInterval = 500;

        // Phase 2.1.4: Initialize analytics exporter
        if (typeof AnalyticsExporter !== 'undefined') {
            this.analyticsExporter = new AnalyticsExporter(this);
            console.log('[Heatmap] AnalyticsExporter initialized');
        }

        // Phase 2.1.4: UI Controls for analytics views
        if (typeof AnalyticsUIControls !== 'undefined') {
            this.analyticsControls = new AnalyticsUIControls({
                heatmapOverlay: this,
                position: { x: 20, y: 580 },
                enableKeyboardShortcuts: true
            });
            this.analyticsControlsContainer = this.analyticsControls.create();
            this.container.addChild(this.analyticsControlsContainer);
            console.log('[Heatmap] AnalyticsUIControls initialized');
        }

        // Phase 2.2: Filter Panel for advanced analytics filtering
        if (typeof AnalyticsFilterPanel !== 'undefined') {
            this.filterPanel = new AnalyticsFilterPanel({
                heatmapOverlay: this,
                container: this.container,
                position: { x: 320, y: 80 },
                width: 280,
                startCollapsed: true
            });
            this.filterPanelContainer = this.filterPanel.create();
            console.log('[Heatmap] AnalyticsFilterPanel initialized');
        }

        // Phase 2.2: Multi-Model Comparison View
        if (typeof MultiModelComparisonView !== 'undefined') {
            this.multiModelComparison = new MultiModelComparisonView({
                heatmapOverlay: this,
                container: this.container,
                maxModels: 4,
                defaultLayout: 'horizontal',
                enabled: false
            });
            this.multiModelComparisonContainer = this.multiModelComparison.create();
            console.log('[Heatmap] MultiModelComparisonView initialized');
        }

        // Auto-load previously active models from localStorage and registry
        this._autoLoadActiveModels();

        // Initialize render pipeline
        this._initializeRenderPipeline();

        console.log(`🌡️  NeuralHeatmapOverlay initialized (mode: ${this.mode})`);
    }

    /**
     * Handle model selection from Model Zoo UI
     * @private
     * @param {string} action - 'add' or 'remove'
     * @param {Object} model - Model info object
     */
    _handleModelSelection(action, model) {
        if (action === 'add') {
            this.addModelFromZoo(model.id);
        } else if (action === 'remove') {
            this.removeModelFromZoo(model.id);
        }

        // Save active models to localStorage
        this._saveActiveModels();
    }

    /**
     * Load layer metadata into the LayerMapper for neural address resolution
     * Phase 2: Deep Inspection & Interaction
     * @param {string|Object} pathOrData - File path to .rts.meta.json or pre-parsed metadata object
     * @returns {Promise<boolean>} Success status
     */
    async loadLayerMetadata(pathOrData) {
        if (!this.layerMapper) {
            console.warn('[Heatmap] LayerMapper not available, cannot load metadata');
            return false;
        }

        try {
            await this.layerMapper.loadMetadata(pathOrData);

            // Generate boundaries for visualization
            const boundaries = this.layerMapper.generateBoundaries();
            this.layerBoundaries.clear();
            for (const boundary of boundaries) {
                this.layerBoundaries.set(boundary.path, boundary);
            }

            console.log(`[Heatmap] Loaded ${this.layerBoundaries.size} layer boundaries for inspection`);
            return true;
        } catch (error) {
            console.error('[Heatmap] Failed to load layer metadata:', error);
            return false;
        }
    }

    /**
     * Get the LayerMapper instance for external access
     * Phase 2: Deep Inspection & Interaction
     * @returns {LayerMapper|null} The LayerMapper instance
     */
    getLayerMapper() {
        return this.layerMapper;
    }

    /**
     * Get layer boundaries for visualization
     * Phase 2: Deep Inspection & Interaction
     * @returns {Map<string, Object>} Map of layer path to boundary objects
     */
    getLayerBoundaries() {
        return this.layerBoundaries;
    }

    /**
     * Phase 2.1.4: Collect data for advanced correlation analytics
     * @private
     */
    _collectAnalyticsData() {
        if (!this.multiModelTracker) return;

        const models = this.multiModelTracker.getAllModels();
        const timestamp = performance.now();

        // Collect data for each model
        for (const model of models) {
            const activities = this.multiModelTracker.getModelActivity(model.id);

            // Feed to cross-layer analyzer
            if (this.crossLayerAnalyzer && activities.length > 0) {
                for (const activity of activities) {
                    // Extract layer info if available
                    const layerName = activity.layer || 'unknown';
                    this.crossLayerAnalyzer.recordLayerActivity(
                        model.id,
                        layerName,
                        { x: activity.x, y: activity.y, width: 16, height: 16 },
                        activity.intensity,
                        timestamp
                    );
                }
            }

            // Feed to temporal analyzer
            if (this.temporalAnalyzer && activities.length > 0) {
                for (const activity of activities) {
                    this.temporalAnalyzer.recordEvent(
                        model.id,
                        activity.intensity,
                        { x: activity.x, y: activity.y },
                        activity.layer || null,
                        timestamp
                    );
                }
            }

            // Feed to anomaly detector
            if (this.anomalyDetector && activities.length >= 30) {
                // Update baseline periodically
                if (!this._lastBaselineUpdate || timestamp - this._lastBaselineUpdate > 5000) {
                    this.anomalyDetector.updateBaseline(model.id, activities.slice(-100));
                    this._lastBaselineUpdate = timestamp;
                }

                // Detect anomalies every ~1 second
                if (!this._lastAnomalyCheck || timestamp - this._lastAnomalyCheck > 1000) {
                    const anomalies = this.anomalyDetector.detectAnomalies(model.id, activities.slice(-50));
                    if (anomalies.length > 0) {
                        console.log('[Heatmap] Anomalies detected for', model.name, ':', anomalies.length);
                    }
                    this._lastAnomalyCheck = timestamp;
                }
            }
        }
    }

    /**
     * Phase 2.1.4: Update analytics views with latest data
     * @private
     */
    _updateAnalyticsViews() {
        if (!this.multiModelTracker) return;

        const models = this.multiModelTracker.getAllModels();
        if (models.length === 0) return;

        // Update CorrelationMatrixView if visible
        if (this.correlationMatrixView && this.correlationMatrixViewContainer && this.correlationMatrixViewContainer.visible) {
            const modelIds = models.map(m => m.id);
            const layerNames = this._getAllLayerNames();
            const correlationMatrix = this.crossLayerAnalyzer?.getCorrelationMatrix(modelIds, layerNames);
            if (correlationMatrix) {
                this.correlationMatrixView.updateMatrix(correlationMatrix);
            }
        }

        // Update TemporalView if visible
        if (this.temporalView && this.temporalViewContainer && this.temporalViewContainer.visible) {
            // Use the first active model for temporal view
            const primaryModel = models[0];
            if (primaryModel && this.temporalAnalyzer) {
                const temporalData = {
                    timeWindows: this.temporalAnalyzer.getTimeWindows(primaryModel.id),
                    periodic: this.temporalAnalyzer.detectPeriodicPatterns(primaryModel.id),
                    trends: this.temporalAnalyzer.detectTrends(primaryModel.id),
                    stateChanges: this.temporalAnalyzer.detectStateChanges(primaryModel.id)
                };
                this.temporalView.update(temporalData);
            }
        }
    }

    /**
     * Phase 2.1.4: Get all layer names from active models
     * @private
     * @returns {Array} Array of layer names
     */
    _getAllLayerNames() {
        const layerSet = new Set();
        if (this.multiModelTracker) {
            const models = this.multiModelTracker.getAllModels();
            for (const model of models) {
                const activities = this.multiModelTracker.getModelActivity(model.id);
                for (const activity of activities) {
                    if (activity.layer) {
                        layerSet.add(activity.layer);
                    }
                }
            }
        }
        return Array.from(layerSet);
    }

    /**
     * Phase 2.1.4: Show/hide correlation matrix view
     * @param {boolean} visible - Visibility state
     */
    showCorrelationMatrix(visible = true) {
        if (this.correlationMatrixViewContainer) {
            this.correlationMatrixViewContainer.visible = visible;
        }
    }

    /**
     * Phase 2.1.4: Show/hide temporal view
     * @param {boolean} visible - Visibility state
     */
    showTemporalView(visible = true) {
        if (this.temporalViewContainer) {
            this.temporalViewContainer.visible = visible;
        }
    }

    /**
     * Phase 2.1.4: Export correlation matrix data
     * @param {string} format - Export format ('csv' or 'json', default: 'json')
     */
    exportCorrelationMatrix(format = 'json') {
        if (!this.analyticsExporter) {
            console.warn('[Heatmap] AnalyticsExporter not available');
            return;
        }
        this.analyticsExporter.exportCorrelationMatrix(format);
    }

    /**
     * Phase 2.1.4: Export temporal patterns data
     * @param {string} modelId - Model ID (uses first available if not specified)
     * @param {string} format - Export format ('csv' or 'json', default: 'json')
     */
    exportTemporalPatterns(modelId = null, format = 'json') {
        if (!this.analyticsExporter) {
            console.warn('[Heatmap] AnalyticsExporter not available');
            return;
        }
        this.analyticsExporter.exportTemporalPatterns(modelId, format);
    }

    /**
     * Phase 2.1.4: Export anomaly data
     * @param {string} modelId - Optional model ID filter
     * @param {string} format - Export format ('csv' or 'json', default: 'json')
     */
    exportAnomalies(modelId = null, format = 'json') {
        if (!this.analyticsExporter) {
            console.warn('[Heatmap] AnalyticsExporter not available');
            return;
        }
        this.analyticsExporter.exportAnomalies(modelId, format);
    }

    /**
     * Phase 2.1.4: Export all analytics data
     * @param {string} format - Export format (only 'json' supported)
     */
    exportAllAnalytics(format = 'json') {
        if (!this.analyticsExporter) {
            console.warn('[Heatmap] AnalyticsExporter not available');
            return;
        }
        this.analyticsExporter.exportAll(format);
    }

    /**
     * Auto-load previously active models from localStorage
     * @private
     */
    _autoLoadActiveModels() {
        try {
            const saved = localStorage.getItem('neural_heatmap_active_models');
            if (saved) {
                const activeModelIds = JSON.parse(saved);
                console.log('[Heatmap] Auto-loading models:', activeModelIds);

                for (const modelId of activeModelIds) {
                    this.addModelFromZoo(modelId, true);
                }
            }
        } catch (e) {
            console.warn('[Heatmap] Failed to auto-load models:', e);
        }
    }

    /**
     * Save active models to localStorage
     * @private
     */
    _saveActiveModels() {
        try {
            const activeModelIds = this.modelZooUI ? this.modelZooUI.getActiveModels() : [];
            localStorage.setItem('neural_heatmap_active_models', JSON.stringify(activeModelIds));
        } catch (e) {
            console.warn('[Heatmap] Failed to save active models:', e);
        }
    }

    /**
     * Auto-discover models from LM Studio and register them
     * @private
     */
    async _autoDiscoverModels() {
        if (!this.modelDiscovery || !this.modelRegistry) {
            return;
        }

        try {
            console.log('[Heatmap] Starting model auto-discovery...');

            // Scan for LM Studio models
            const discoveredModels = await this.modelDiscovery.scanLMStudio();

            if (discoveredModels.length > 0) {
                console.log(`[Heatmap] Discovered ${discoveredModels.length} models`);

                // Register discovered models with the registry
                for (const model of discoveredModels) {
                    try {
                        // Check if already registered
                        if (!this.modelRegistry.has(model.id)) {
                            // Create model metadata for registry
                            const modelData = {
                                id: model.id,
                                name: model.name,
                                provider: 'lm-studio',
                                architecture: model.architecture,
                                parameters: this._estimateParameters(model),
                                contextLength: model.contextLength || 4096,
                                capabilities: this._inferCapabilities(model.name),
                                connection: {
                                    endpoint: model.sourcePath || '',
                                    port: ''
                                },
                                tags: ['discovered', 'lm-studio'],
                                layers: model.layers,
                                hiddenSize: model.hiddenSize,
                                attentionHeads: model.attentionHeads,
                                color: model.color
                            };

                            // Register with ModelRegistry
                            this.modelRegistry.register(modelData);
                        }
                    } catch (e) {
                        console.warn('[Heatmap] Failed to register discovered model:', model.name, e);
                    }
                }

                // Sync discovered models to ModelZooManager
                if (this.modelZoo) {
                    const registered = await this.modelDiscovery.registerAllDiscovered(this.modelZoo);
                    console.log(`[Heatmap] Synced ${registered.length} models to ModelZooManager`);
                }
            }
        } catch (e) {
            console.warn('[Heatmap] Auto-discovery failed:', e);
        }
    }

    /**
     * Auto-load models from ModelRegistry
     * @private
     */
    _autoLoadModelsFromRegistry() {
        if (!this.modelRegistry || !this.multiModelTracker) {
            return;
        }

        try {
            // Get active models from registry
            const activeModels = this.modelRegistry.getActive();

            console.log(`[Heatmap] Loading ${activeModels.length} active models from registry`);

            for (const model of activeModels) {
                // Register with MultiModelTracker
                this.multiModelTracker.registerModel(model.name, {
                    modelId: model.id,
                    color: model.color,
                    architecture: model.architecture,
                    layerTypes: model.layerTypes || []
                });
            }

            // Update comparative heatmap if we have 2+ models
            if (this.multiModelTracker.getModelCount() >= 2 && this.comparativeHeatmap) {
                this.comparativeHeatmap._rebuildContainers();
            }
        } catch (e) {
            console.warn('[Heatmap] Failed to load models from registry:', e);
        }
    }

    /**
     * Estimate parameter count from model info
     * @private
     * @param {Object} model - Model info object
     * @returns {number} Parameter count in billions
     */
    _estimateParameters(model) {
        // Try to extract from name
        const match = model.name?.match(/(\d+(?:\.\d+)?)\s*b/i);
        if (match) {
            return parseFloat(match[1]);
        }
        // Otherwise estimate from layers
        if (model.layers <= 12) return 1;
        if (model.layers <= 24) return 3;
        if (model.layers <= 32) return 7;
        if (model.layers <= 40) return 13;
        return 30;
    }

    /**
     * Infer capabilities from model name
     * @private
     * @param {string} modelName - Model name
     * @returns {Array} Array of capability strings
     */
    _inferCapabilities(modelName) {
        const name = (modelName || '').toLowerCase();
        const capabilities = ['chat', 'completion'];

        if (name.includes('vision') || name.includes('vl') || name.includes('mm')) {
            capabilities.push('vision');
        }
        if (name.includes('code') || name.includes('instruct')) {
            capabilities.push('code');
        }
        if (name.includes('tool')) {
            capabilities.push('tool_use');
        }

        return capabilities;
    }

    /**
     * Get reference to the ModelRegistry
     * @returns {ModelRegistry|null}
     */
    getModelRegistry() {
        return this.modelRegistry;
    }

    /**
     * Get reference to the ModelDiscovery
     * @returns {ModelDiscovery|null}
     */
    getModelDiscovery() {
        return this.modelDiscovery;
    }

    /**
     * Register a discovered model with both registry and tracker
     * @param {Object} modelData - Model metadata
     * @returns {string|null} Registered model ID
     */
    registerDiscoveredModel(modelData) {
        if (!this.modelRegistry) {
            console.warn('[Heatmap] ModelRegistry not available');
            return null;
        }

        try {
            // Register with ModelRegistry
            const registryId = this.modelRegistry.register(modelData);

            // Register with MultiModelTracker for tracking
            if (this.multiModelTracker) {
                this.multiModelTracker.registerModel(modelData.name, {
                    modelId: modelData.id,
                    color: modelData.color || 0x4ECDC4,
                    architecture: modelData.architecture
                });
            }

            console.log('[Heatmap] Registered discovered model:', modelData.name);
            return registryId;
        } catch (e) {
            console.error('[Heatmap] Failed to register discovered model:', e);
            return null;
        }
    }

    /**
     * Add a model from the Model Zoo to the MultiModelTracker
     * @param {string} modelId - Model ID from Model Zoo
     * @param {boolean} silent - If true, don't update UI state
     * @returns {string|null} Registered model ID or null
     */
    addModelFromZoo(modelId, silent = false) {
        if (!this.modelZoo) {
            console.warn('[Heatmap] ModelZooManager not available');
            return null;
        }

        if (!this.multiModelTracker) {
            console.warn('[Heatmap] MultiModelTracker not available');
            return null;
        }

        // Get model config from zoo
        const modelInfo = this.modelZoo.getModel(modelId);
        if (!modelInfo) {
            console.warn('[Heatmap] Model not found in zoo:', modelId);
            return null;
        }

        // Get heatmap configuration
        const heatmapConfig = this.modelZoo.getHeatmapConfig(modelId);
        if (!heatmapConfig) {
            console.warn('[Heatmap] Failed to get heatmap config for:', modelId);
            return null;
        }

        // Register with MultiModelTracker
        const registeredId = this.multiModelTracker.registerModel(modelInfo.name, {
            modelId: modelInfo.id,
            color: modelInfo.color,
            layerNames: heatmapConfig.layerNames,
            totalLayers: heatmapConfig.totalLayers,
            architecture: heatmapConfig.architecture
        });

        if (registeredId) {
            console.log(`[Heatmap] Added model from zoo: ${modelInfo.name} -> ${registeredId}`);

            // Update comparative heatmap if we now have 2+ models
            if (this.multiModelTracker.getModelCount() >= 2 && this.comparativeHeatmap) {
                this.comparativeHeatmap._rebuildContainers();
            }

            // Update UI if not silent
            if (!silent && this.modelZooUI) {
                // Update button state
                const button = this.modelZooUI.modelButtons?.get(modelId);
                if (button && !this.modelZooUI.activeModels.has(modelId)) {
                    this.modelZooUI.activeModels.add(modelId);
                    button.addLabel.text = '✓ Added';
                    button.addLabel.style.fill = 0x00FFFF;
                    button.bg.clear();
                    button.bg.beginFill(modelInfo.color, 0.4);
                    button.bg.lineStyle(2, modelInfo.color, 1);
                    button.bg.drawRoundedRect(0, 0, 270, 28, 4);
                    button.bg.endFill();
                }
            }
        }

        return registeredId;
    }

    /**
     * Remove a model from the MultiModelTracker
     * @param {string} modelId - Model ID from Model Zoo
     */
    removeModelFromZoo(modelId) {
        if (!this.multiModelTracker) return;

        // Find registered model by zoo model ID
        const models = this.multiModelTracker.getAllModels();
        const registeredModel = models.find(m => m.modelId === modelId);

        if (registeredModel) {
            this.multiModelTracker.unregisterModel(registeredModel.id);
            console.log(`[Heatmap] Removed model: ${modelId}`);

            // Update comparative heatmap
            if (this.comparativeHeatmap) {
                this.comparativeHeatmap._rebuildContainers();
            }
        }
    }

    /**
     * Get reference to the ModelZooManager
     * @returns {ModelZooManager|null}
     */
    getModelZoo() {
        return this.modelZoo;
    }

    /**
     * Get reference to the ModelZooUI
     * @returns {ModelZooUI|null}
     */
    getModelZooUI() {
        return this.modelZooUI;
    }

    /**
     * Phase 2.1.4: Get CrossLayerAnalyzer instance
     * @returns {CrossLayerAnalyzer|null}
     */
    getCrossLayerAnalyzer() {
        return this.crossLayerAnalyzer || null;
    }

    /**
     * Phase 2.1.4: Get TemporalAnalyzer instance
     * @returns {TemporalAnalyzer|null}
     */
    getTemporalAnalyzer() {
        return this.temporalAnalyzer || null;
    }

    /**
     * Phase 2.1.4: Get AnomalyDetector instance
     * @returns {AnomalyDetector|null}
     */
    getAnomalyDetector() {
        return this.anomalyDetector || null;
    }

    /**
     * Phase 2.1.4: Get cross-layer correlation matrix
     * @param {Array} modelIds - Models to include
     * @param {Array} layerNames - Layers to analyze
     * @returns {Object|null} Correlation matrix
     */
    getCrossLayerCorrelationMatrix(modelIds, layerNames) {
        if (!this.crossLayerAnalyzer) return null;
        return this.crossLayerAnalyzer.getCorrelationMatrix(modelIds, layerNames);
    }

    /**
     * Phase 2.1.4: Get temporal patterns for a model
     * @param {string} modelId - Model to analyze
     * @returns {Object|null} Temporal patterns
     */
    getTemporalPatterns(modelId) {
        if (!this.temporalAnalyzer) return null;

        return {
            periodic: this.temporalAnalyzer.detectPeriodicPatterns(modelId),
            trends: this.temporalAnalyzer.detectTrends(modelId),
            stateChanges: this.temporalAnalyzer.detectStateChanges(modelId),
            bursts: this.temporalAnalyzer.detectBursts(modelId)
        };
    }

    /**
     * Phase 2.1.4: Get anomaly summary
     * @returns {Object|null} Anomaly summary
     */
    getAnomalySummary() {
        if (!this.anomalyDetector) return null;
        return this.anomalyDetector.getAnomalySummary();
    }

    /**
     * Phase 2.1.4: Get anomalies for a specific model
     * @param {string} modelId - Model identifier
     * @param {number} limit - Max results (default: 50)
     * @returns {Array} Anomalies for the model
     */
    getAnomaliesForModel(modelId, limit = 50) {
        if (!this.anomalyDetector) return [];
        return this.anomalyDetector.getAnomaliesForModel(modelId, limit);
    }

    /**
     * Initialize WebGL render pipeline with custom shader
     * @private
     */
    _initializeRenderPipeline() {
        // Check if PIXI.Filter is available (PixiJS v7+)
        if (typeof PIXI !== 'undefined' && PIXI.Filter) {
            this._createHeatmapFilter();
        } else {
            console.warn('PIXI.Filter not available, using fallback canvas rendering');
        }
    }

    /**
     * Create custom heatmap filter for GPU-accelerated rendering
     * Follows design spec shader structure
     * @private
     */
    _createHeatmapFilter() {
        // Check if browser supports required features
        if (typeof PIXI === 'undefined') {
            console.warn('PIXI not available');
            return;
        }

        // Check for filter support
        if (!PIXI.Filter) {
            console.warn('[Heatmap] PIXI.Filter not available, using fallback rendering');
            this._useFallbackRendering = true;
            return;
        }

        // Check browser compatibility
        if (this.browserCompatibility && !this.browserCompatibility.hasWebGL()) {
            console.warn('[Heatmap] WebGL not available, using canvas rendering');
            this._useFallbackRendering = true;
            return;
        }

        // Vertex shader - standard pass-through
        const vertexSrc = `
            attribute vec2 aVertexPosition;
            attribute vec2 aTextureCoord;

            uniform mat3 projectionMatrix;
            uniform mat3 translationMatrix;
            uniform mat3 textureMatrix;

            varying vec2 vTextureCoord;

            void main() {
                vTextureCoord = (textureMatrix * vec3(aTextureCoord, 1.0)).xy;
                gl_Position = vec4((projectionMatrix * translationMatrix * vec3(aVertexPosition, 1.0)).xy, 0.0, 1.0);
            }
        `;

        // Fragment shader - heatmap visualization following design spec
        // Enhanced for Visual Fidelity (Week 1)
        const fragmentSrc = `
            precision mediump float;

            varying vec2 vTextureCoord;

            uniform sampler2D uSampler;
            uniform float uOpacity;
            uniform float uMode;
            uniform float uTheme;
            uniform vec4 uColorLow;
            uniform vec4 uColorMedium;
            uniform vec4 uColorHigh;
            uniform float uTime;
            uniform vec2 uResolution;

            // Calculate local entropy in neighborhood (from design spec)
            float calculate_entropy(vec2 coord) {
                const float sampleSize = 8.0;
                float sum = 0.0;
                float sumSq = 0.0;
                float count = 0.0;

                // Sample 8x8 neighborhood
                for (float dy = -4.0; dy <= 4.0; dy += 1.0) {
                    for (float dx = -4.0; dx <= 4.0; dx += 1.0) {
                        vec2 sampleCoord = coord + vec2(dx, dy) / uResolution;
                        if (sampleCoord.x >= 0.0 && sampleCoord.x <= 1.0 &&
                            sampleCoord.y >= 0.0 && sampleCoord.y <= 1.0) {
                            vec4 texColor = texture2D(uSampler, sampleCoord);
                            float intensity = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
                            sum += intensity;
                            sumSq += intensity * intensity;
                            count += 1.0;
                        }
                    }
                }

                float mean = sum / count;
                float variance = (sumSq / count) - (mean * mean);
                return clamp(variance * 3.0, 0.0, 1.0);  // Normalize to 0-1
            }

            // Map value to color based on theme
            vec3 apply_theme(float val, float theme) {
                float t = clamp(val, 0.0, 1.0);
                
                // Theme 0: Default (blue-green-red)
                if (theme < 0.5) {
                    if (t < 0.5) {
                        return mix(uColorLow.rgb, uColorMedium.rgb, t * 2.0);
                    } else {
                        return mix(uColorMedium.rgb, uColorHigh.rgb, (t - 0.5) * 2.0);
                    }
                }
                // Theme 1: Cyberpunk (Cyan/Magenta)
                else if (theme < 1.5) {
                     return mix(vec3(0.0, 1.0, 1.0), vec3(1.0, 0.0, 1.0), t);
                }
                // Theme 2: Bioluminescent (Deep Blue/Glowing Green)
                else if (theme < 2.5) {
                     return mix(vec3(0.0, 0.0, 0.2), vec3(0.2, 1.0, 0.5), t * t);
                }
                // Theme 3: Thermal (Black-Red-Yellow-White)
                else if (theme < 3.5) {
                     if (t < 0.33) return mix(vec3(0.0), vec3(1.0, 0.0, 0.0), t * 3.0);
                     if (t < 0.66) return mix(vec3(1.0, 0.0, 0.0), vec3(1.0, 1.0, 0.0), (t - 0.33) * 3.0);
                     return mix(vec3(1.0, 1.0, 0.0), vec3(1.0), (t - 0.66) * 3.0);
                }
                // Theme 4: Monochrome
                else {
                     return vec3(t);
                }
            }

            // Map layer type to color
            vec3 layer_to_color(float layerType) {
                float hue = fract(layerType * 0.25 + uTime * 0.05);
                return vec3(
                    0.5 + 0.5 * cos(6.28318 * (hue + 0.0)),
                    0.5 + 0.5 * cos(6.28318 * (hue + 0.333)),
                    0.5 + 0.5 * cos(6.28318 * (hue + 0.667))
                );
            }

            void main() {
                vec4 texColor = texture2D(uSampler, vTextureCoord);
                vec3 finalColor;
                float alpha;

                // Mode 0: Entropy (blue -> green -> red)
                if (uMode < 0.5) {
                    float entropy = calculate_entropy(vTextureCoord);
                    finalColor = apply_theme(entropy, uTheme);
                    alpha = uOpacity * 0.7;
                }
                // Mode 1: Layer boundaries
                else if (uMode < 1.5) {
                    // Use luminance to determine layer region
                    float intensity = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
                    float layerType = floor(intensity * 4.0);
                    finalColor = layer_to_color(layerType);
                    
                    // Add interference
                    float interference = 0.1 * sin(vTextureCoord.y * 50.0 + uTime * 2.0);
                    finalColor += interference;
                    
                    alpha = uOpacity * 0.5;
                }
                // Mode 2: Activity (blue -> orange with pulse)
                else if (uMode < 2.5) {
                    float intensity = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
                    
                    // Simple bloom by sampling
                    float bloom = 0.0;
                    vec2 onePixel = vec2(1.0) / uResolution;
                    bloom += dot(texture2D(uSampler, vTextureCoord + vec2(0.0, -2.0) * onePixel).rgb, vec3(0.299, 0.587, 0.114));
                    bloom += dot(texture2D(uSampler, vTextureCoord + vec2(-2.0, 0.0) * onePixel).rgb, vec3(0.299, 0.587, 0.114));
                    bloom += dot(texture2D(uSampler, vTextureCoord + vec2(2.0, 0.0) * onePixel).rgb, vec3(0.299, 0.587, 0.114));
                    bloom += dot(texture2D(uSampler, vTextureCoord + vec2(0.0, 2.0) * onePixel).rgb, vec3(0.299, 0.587, 0.114));
                    bloom *= 0.25;
                    
                    float pulse = 0.8 + 0.2 * sin(uTime * 3.0);
                    float combined = (intensity * 0.6 + bloom * 0.8) * pulse;
                    
                    finalColor = apply_theme(combined, uTheme);
                    alpha = uOpacity * (0.3 + intensity * 0.5);
                }
                // Mode 3: Gradient (red=positive, blue=negative)
                else {
                    vec2 delta = vec2(
                        dFdx(dot(texColor.rgb, vec3(0.299, 0.587, 0.114))),
                        dFdy(dot(texColor.rgb, vec3(0.299, 0.587, 0.114)))
                    );
                    float gradient = length(delta);
                    finalColor = apply_theme(gradient * 3.0, uTheme);
                    alpha = uOpacity * 0.6;
                }
                
                // Cyberpunk Scanline
                if (uTheme > 0.5 && uTheme < 1.5) {
                     float scanline = 0.9 + 0.1 * sin(vTextureCoord.y * 1000.0 + uTime * 10.0);
                     finalColor *= scanline;
                }

                // Combine with original texture
                vec3 combined = mix(texColor.rgb, finalColor, alpha);
                gl_FragColor = vec4(combined, texColor.a * (0.3 + alpha * 0.7));
            }
        `;

        this.heatmapFilter = new PIXI.Filter(vertexSrc, fragmentSrc, {
            uOpacity: this.opacity,
            uMode: this._getModeUniform(),
            uTheme: this.theme,
            uColorLow: new Float32Array([0, 0, 1, 1]),
            uColorMedium: new Float32Array([0, 1, 0, 1]),
            uColorHigh: new Float32Array([1, 0, 0, 1]),
            uTime: 0,
            uResolution: new Float32Array([16384, 16384])
        });

        this.heatmapFilter.autoFit = true;
    }

    /**
     * Get numeric uniform value for current mode
     * @private
     * @returns {number}
     */
    _getModeUniform() {
        const modeMap = { entropy: 0, layer: 1, activity: 2, gradient: 3 };
        return modeMap[this.mode] ?? 0;
    }

    /**
     * Setup tooltip hover handlers
     * Phase 2: Interactive Features - Task 2.2
     * Enhanced for Phase 2: Deep Inspection & Interaction
     */
    setupTooltipHandlers() {
        if (!this.tooltip) return;

        // Track hover state
        this.hoveredTile = null;
        this.hoveredPosition = null;

        // Phase 2: Track isolated layer for layer isolation feature
        this.isolatedLayer = null;
        this.isolatedLayerType = null;

        // Add pointer move handler to overlay container
        this.container.eventMode = 'static';
        this.container.hitArea = new PIXI.Rectangle(
            -10000, -10000, 20000, 20000
        );

        this.container.on('pointermove', (event) => {
            const position = event.global;
            this.handleTooltipHover(position);
        });

        this.container.on('pointerleave', () => {
            this.tooltip?.hide();
            this.hoveredTile = null;
            this.hoveredPosition = null;
        });

        // Phase 2: Poke Interaction - Click to stimulate neuron
        this.container.on('pointerdown', (event) => {
            const position = event.global;
            this.handleClick(position);
        });

        // Phase 2: Layer Isolation - Double-click to focus on layer
        this.container.on('dblclick', (event) => {
            const position = event.global;
            this.handleDoubleClick(position);
        });

        // Phase 2: Set up poke callback on tooltip
        if (this.tooltip) {
            this.tooltip.onPoke = (neuralAddress) => {
                this.pokeNeuron(neuralAddress);
            };
        }

        console.log('[Heatmap] Tooltip handlers initialized with poke and isolation');
    }

    /**
     * Handle click for poke interaction
     * Phase 2: "Poke" Interaction
     */
    handleClick(position) {
        const tile = this.getTileAtPosition(position);
        if (!tile) return;

        const layerInfo = this.getLayerInfoAt(tile, position);
        if (!layerInfo?.neuralAddress) return;

        // Visual feedback - flash the clicked area
        this._showPokeFlash(position, layerInfo);
    }

    /**
     * Handle double-click for layer isolation
     * Phase 2: Layer Isolation
     */
    handleDoubleClick(position) {
        const tile = this.getTileAtPosition(position);
        if (!tile) return;

        const layerInfo = this.getLayerInfoAt(tile, position);
        if (!layerInfo) return;

        const layerType = layerInfo.type;

        // Toggle isolation
        if (this.isolatedLayerType === layerType) {
            // Clear isolation
            this.clearLayerIsolation();
        } else {
            // Set isolation
            this.setLayerIsolation(layerType);
        }
    }

    /**
     * Set layer isolation - hide all layers except the specified type
     * Phase 2: Layer Isolation
     * @param {string} layerType - Layer type to isolate ('attention', 'mlp', 'embedding', 'output')
     */
    setLayerIsolation(layerType) {
        this.isolatedLayerType = layerType;

        // Update visibility of all attachments
        for (const [spriteId, attachment] of this.attachments) {
            const layerName = attachment.data?.name || '';
            const type = this._inferLayerType(layerName);

            // Set visibility based on type match
            if (attachment.overlay) {
                attachment.overlay.visible = (type === layerType);
            }
            if (attachment.sprite) {
                attachment.sprite.alpha = (type === layerType) ? 1.0 : 0.2;
            }
        }

        console.log(`[Heatmap] Isolated layer type: ${layerType}`);

        // Show notification
        this._showIsolationNotification(layerType);
    }

    /**
     * Clear layer isolation - show all layers
     * Phase 2: Layer Isolation
     */
    clearLayerIsolation() {
        this.isolatedLayerType = null;

        // Restore visibility of all attachments
        for (const [spriteId, attachment] of this.attachments) {
            if (attachment.overlay) {
                attachment.overlay.visible = true;
            }
            if (attachment.sprite) {
                attachment.sprite.alpha = 1.0;
            }
        }

        console.log('[Heatmap] Cleared layer isolation');

        // Show notification
        this._showIsolationNotification(null);
    }

    /**
     * Poke a neuron - stimulate it for Hebbian learning/debugging
     * Phase 2: "Poke" Interaction
     * @param {Object} neuralAddress - {layer, head, neuron}
     */
    pokeNeuron(neuralAddress) {
        console.log('[Heatmap] Poking neuron:', neuralAddress);

        // Record activity at this neuron's location
        if (this.activityTracker && neuralAddress.neuron !== null) {
            // Convert neural address back to pixel coordinates (approximate)
            const gridSize = this.config.gridSize || 2048;
            const x = (neuralAddress.neuron % gridSize);
            const y = Math.floor(neuralAddress.neuron / gridSize) % gridSize;

            // Record high activity at this location
            this.activityTracker.record(x, y, 1.0);
        }

        // Send signal to LM Studio bridge if available
        if (this.lmStudioBridge && typeof this.lmStudioBridge.pokeNeuron === 'function') {
            this.lmStudioBridge.pokeNeuron(neuralAddress);
        }

        // Visual feedback
        this._showPokeEffect(neuralAddress);

        // Dispatch custom event for external listeners
        this.container.emit('neuron-poked', { neuralAddress, timestamp: Date.now() });
    }

    /**
     * Show visual flash when clicking/poking
     * @private
     */
    _showPokeFlash(position, layerInfo) {
        const flash = new PIXI.Graphics();
        flash.beginFill(0x00FFFF, 0.5);
        flash.drawCircle(0, 0, 20);
        flash.endFill();
        flash.x = position.x;
        flash.y = position.y;
        flash.zIndex = 10001;
        this.container.addChild(flash);

        // Animate and remove
        let scale = 1.0;
        const animate = () => {
            scale += 0.1;
            flash.scale.set(scale);
            flash.alpha -= 0.05;

            if (flash.alpha > 0) {
                requestAnimationFrame(animate);
            } else {
                this.container.removeChild(flash);
                flash.destroy();
            }
        };
        animate();
    }

    /**
     * Show poke effect on neuron
     * @private
     */
    _showPokeEffect(neuralAddress) {
        // Create a more prominent effect for actual poke
        const effect = new PIXI.Graphics();
        effect.beginFill(0x00FF00, 0.7);
        effect.drawCircle(0, 0, 30);
        effect.endFill();
        effect.lineStyle(2, 0x00FF00, 1);
        effect.drawCircle(0, 0, 40);

        // Position at approximate location
        if (neuralAddress.neuron !== null) {
            const gridSize = this.config.gridSize || 2048;
            effect.x = (neuralAddress.neuron % gridSize);
            effect.y = Math.floor(neuralAddress.neuron / gridSize) % gridSize;
        }
        effect.zIndex = 10002;
        this.container.addChild(effect);

        // Animate
        let frame = 0;
        const animate = () => {
            frame++;
            effect.scale.set(1 + frame * 0.05);
            effect.alpha = 1 - frame * 0.03;

            if (frame < 30) {
                requestAnimationFrame(animate);
            } else {
                this.container.removeChild(effect);
                effect.destroy();
            }
        };
        animate();
    }

    /**
     * Show isolation notification
     * @private
     */
    _showIsolationNotification(layerType) {
        // Create notification text
        const text = layerType
            ? `Isolated: ${layerType.toUpperCase()}`
            : 'Showing all layers';

        const notification = new PIXI.Text(text, {
            fontFamily: 'Arial, sans-serif',
            fontSize: 14,
            fill: 0x00FFFF,
            fontWeight: 'bold'
        });

        notification.x = 20;
        notification.y = 80;
        notification.zIndex = 10003;
        this.container.addChild(notification);

        // Fade out after 2 seconds
        setTimeout(() => {
            const fadeOut = () => {
                notification.alpha -= 0.05;
                if (notification.alpha > 0) {
                    requestAnimationFrame(fadeOut);
                } else {
                    this.container.removeChild(notification);
                    notification.destroy();
                }
            };
            fadeOut();
        }, 2000);
    }

    /**
     * Handle tooltip hover over tiles
     */
    handleTooltipHover(position) {
        // Find tile at position
        const tile = this.getTileAtPosition(position);

        if (!tile) {
            this.tooltip?.hide();
            return;
        }

        // Get layer info at position
        const layerInfo = this.getLayerInfoAt(tile, position);

        if (!layerInfo) {
            this.tooltip?.hide();
            return;
        }

        // Show tooltip with delay
        this.tooltip.showWithDelay(layerInfo, position.x, position.y);

        this.hoveredTile = tile;
        this.hoveredPosition = position;
    }

    /**
     * Get tile at screen position
     */
    getTileAtPosition(position) {
        for (const [spriteId, attachment] of this.attachments) {
            const sprite = attachment.sprite;
            if (!sprite) continue;

            const bounds = sprite.getBounds();
            if (position.x >= bounds.x && position.x <= bounds.x + bounds.width &&
                position.y >= bounds.y && position.y <= bounds.y + bounds.height) {
                return { key: spriteId, sprite, attachment };
            }
        }
        return null;
    }

    /**
     * Get layer info at position within tile
     * Enhanced for Phase 2: Deep Inspection & Interaction
     */
    getLayerInfoAt(tile, position) {
        // Get activity level at this position
        const localX = position.x - tile.sprite.x;
        const localY = position.y - tile.sprite.y;

        // Get activity from tracker
        let activity = 0;
        let rawValue = null;
        if (this.activityTracker) {
            // Check if there's activity at this position
            for (const [key, value] of this.activityTracker.activity) {
                const [gx, gy] = key.split(',').map(Number);
                const px = gx * this.activityTracker.gridSize;
                const py = gy * this.activityTracker.gridSize;

                // Simple proximity check
                if (Math.abs(localX - px) < 20 && Math.abs(localY - py) < 20) {
                    activity = Math.max(activity, value);
                    rawValue = value; // Capture raw value for readout
                }
            }
        }

        // Get layer name from tile data or attachment
        const layerName = tile.attachment?.data?.name || tile.sprite.name || 'Unknown';

        // Phase 2: Calculate neural address using reverse Hilbert mapping
        const neuralAddress = this._calculateNeuralAddress(localX, localY, tile);

        // Phase 2: Calculate Hilbert index
        const hilbertIndex = this._calculateHilbertIndex(localX, localY);

        return {
            name: layerName,
            type: this._inferLayerType(layerName),
            shape: this._inferLayerShape(layerName),
            activity: activity,
            // Phase 2: Deep Inspection fields
            neuralAddress: neuralAddress,
            hilbertIndex: hilbertIndex,
            rawValue: rawValue,
            weight: tile.attachment?.data?.weight ?? null
        };
    }

    /**
     * Calculate neural address (Layer L, Head H, Neuron N) from pixel coordinates
     * Phase 2: Hover Inspection - Reverse Hilbert curve mapping
     * @private
     */
    _calculateNeuralAddress(localX, localY, tile) {
        // Default values
        let layer = null;
        let head = null;
        let neuron = null;

        // Get grid size from config or layer mapper
        const gridSize = this.config.gridSize || 2048;

        // Use layer mapper if available for more accurate mapping
        if (this.layerMapper) {
            // Convert pixel coords to Hilbert distance
            const hilbertD = this.layerMapper.hilbertXy2d(
                Math.floor(localX),
                Math.floor(localY)
            );

            // Look up which layer this index falls into
            for (const [path, layerInfo] of this.layerMapper.layers) {
                if (hilbertD >= layerInfo.startPixel && hilbertD < layerInfo.endPixel) {
                    layer = layerInfo.name;

                    // Calculate relative position within layer
                    const relativeIndex = hilbertD - layerInfo.startPixel;

                    // Estimate head and neuron based on layer type
                    if (layerInfo.type === 'attention') {
                        // For attention layers: estimate head from relative position
                        // Assuming typical 32-head architecture
                        const headSize = Math.floor(layerInfo.pixelCount / 32);
                        head = Math.floor(relativeIndex / headSize);
                        neuron = relativeIndex % headSize;
                    } else {
                        // For other layers: neuron is just the relative index
                        neuron = relativeIndex;
                    }
                    break;
                }
            }
        }

        // Fallback: estimate from coordinates directly
        if (layer === null) {
            // Estimate layer from Y position (assuming vertical stacking)
            const tileHeight = tile.sprite?.height || gridSize;
            const normalizedY = localY / tileHeight;

            // Typical 32-layer model
            layer = Math.floor(normalizedY * 32);
            layer = Math.max(0, Math.min(31, layer));

            // Estimate head from X position (for attention layers)
            const tileWidth = tile.sprite?.width || gridSize;
            const normalizedX = localX / tileWidth;
            head = Math.floor(normalizedX * 32);
            head = Math.max(0, Math.min(31, head));

            // Neuron index from combined position
            neuron = Math.floor(normalizedY * 1000 + normalizedX * 100) % 10000;
        }

        return {
            layer: layer,
            head: head,
            neuron: neuron
        };
    }

    /**
     * Calculate Hilbert index from pixel coordinates
     * Phase 2: Hover Inspection
     * @private
     */
    _calculateHilbertIndex(localX, localY) {
        const gridSize = this.config.gridSize || 2048;

        // Use layer mapper if available
        if (this.layerMapper && typeof this.layerMapper.hilbertXy2d === 'function') {
            return this.layerMapper.hilbertXy2d(
                Math.floor(localX) % gridSize,
                Math.floor(localY) % gridSize
            );
        }

        // Fallback: simple linear index (not true Hilbert, but functional)
        return Math.floor(localY) * gridSize + Math.floor(localX);
    }

    /**
     * Infer layer type from name
     */
    _inferLayerType(name) {
        const lower = name.toLowerCase();
        if (lower.includes('attn') || lower.includes('attention')) return 'attention';
        if (lower.includes('mlp') || lower.includes('ffn')) return 'mlp';
        if (lower.includes('embed')) return 'embedding';
        if (lower.includes('output') || lower.includes('lm_head')) return 'output';
        return 'other';
    }

    /**
     * Infer layer shape from name (simplified)
     */
    _inferLayerShape(name) {
        const lower = name.toLowerCase();
        if (lower.includes('embed')) return [1, 512];
        if (lower.includes('attn')) return [32, 32, 128];
        if (lower.includes('mlp')) return [32, 1024];
        return [32, 32];
    }

    /**
     * Attach overlay to a PixiJS sprite representing an LLM tile
     * @param {PIXI.Sprite} sprite - The sprite to attach to
     * @param {Object} tileData - Tile metadata
     * @param {string} tileData.name - Tile/layer name
     * @param {number} tileData.x - Grid X coordinate
     * @param {number} tileData.y - Grid Y coordinate
     * @param {number} tileData.width - Tile width
     * @param {number} tileData.height - Tile height
     * @param {Object} tileData.metadata - Additional tile metadata (layer offsets, etc.)
     * @returns {string} Attachment ID
     */
    attachToTile(sprite, tileData = {}) {
        if (!sprite) {
            console.warn('attachToTile: sprite is null/undefined');
            return null;
        }

        const spriteId = sprite.uid || `tile_${this.attachments.size}_${Date.now()}`;

        // Create overlay graphics for this tile
        const overlay = new PIXI.Graphics();
        overlay.x = sprite.x || 0;
        overlay.y = sprite.y || 0;
        overlay.width = sprite.width || this.config.gridSize;
        overlay.height = sprite.height || this.config.gridSize;
        overlay.alpha = 0;
        overlay.zIndex = 10;
        overlay.name = `heatmap_${spriteId}`;

        // Apply shader filter to sprite for GPU rendering
        if (this.heatmapFilter && this.visible) {
            sprite.filters = sprite.filters || [];
            if (!sprite.filters.includes(this.heatmapFilter)) {
                sprite.filters.push(this.heatmapFilter);
            }
        }

        // Store attachment
        this.attachments.set(spriteId, {
            sprite,
            overlay,
            data: tileData,
            bounds: {
                x: overlay.x,
                y: overlay.y,
                width: overlay.width,
                height: overlay.height
            },
            createdAt: performance.now(),
            lastUpdate: performance.now()
        });

        // Track for memory leak detection
        if (this.memoryLeakDetector) {
            this.memoryLeakDetector.track(overlay, `heatmap_overlay_${spriteId}`);
        }

        // Add overlay to container
        this.container.addChild(overlay);

        // Process layer boundaries if metadata provided
        if (tileData.metadata?.layer_offsets) {
            this._processLayerBoundaries(tileData.metadata, overlay.bounds);
        }

        // Update overlay visualization
        if (this.visible) {
            this._updateOverlay(spriteId);
        }

        // Record initial activity
        if (this.activityTracker) {
            this.activityTracker.recordLayerAccess(
                tileData.name || `tile_${spriteId}`,
                {
                    x: overlay.x,
                    y: overlay.y,
                    width: overlay.width,
                    height: overlay.height
                },
                0.3
            );
        }

        this.stats.tileCount = this.attachments.size;

        console.log(`📎 Attached overlay to tile: ${tileData.name || spriteId} at (${overlay.x}, ${overlay.y})`);

        return spriteId;
    }

    /**
     * Process layer boundaries from metadata
     * @private
     */
    _processLayerBoundaries(metadata, tileBounds) {
        if (!metadata.layer_offsets) return;

        for (const [layerName, layerInfo] of Object.entries(metadata.layer_offsets)) {
            const { start, size } = layerInfo;

            // Convert byte offset to pixel region (simplified - would use Hilbert in full implementation)
            const pixelStart = Math.floor((start / 4) % 16384);
            const pixelEnd = Math.floor(((start + size) / 4) % 16384);

            const layerType = this._classifyLayer(layerName);

            this.layerBoundaries.set(layerName, {
                name: layerName,
                start: pixelStart,
                end: pixelEnd,
                type: layerType,
                bounds: {
                    x: tileBounds.x + (pixelStart % tileBounds.width),
                    y: tileBounds.y + Math.floor(pixelStart / tileBounds.width),
                    width: Math.min(pixelEnd - pixelStart, tileBounds.width),
                    height: tileBounds.height
                }
            });
        }
    }

    /**
     * Classify layer type based on name (from design spec)
     * @private
     */
    _classifyLayer(layerName) {
        const name = layerName.toLowerCase();
        if (name.includes('embed') || name.includes('tok') || name.includes('token')) return 'embedding';
        if (name.includes('attn') || name.includes('attention') || name.includes('q_proj') || name.includes('k_proj') || name.includes('v_proj')) return 'attention';
        if (name.includes('mlp') || name.includes('ffn') || name.includes('gate') || name.includes('up') || name.includes('down')) return 'mlp';
        if (name.includes('output') || name.includes('lm_head') || name.includes('logit')) return 'output';
        return 'other';
    }

    /**
     * Detach overlay from a tile
     * @param {string} spriteId - Attachment ID
     */
    detachFromTile(spriteId) {
        const attachment = this.attachments.get(spriteId);
        if (!attachment) return;

        // Remove shader filter from sprite
        if (attachment.sprite.filters) {
            attachment.sprite.filters = attachment.sprite.filters.filter(f => f !== this.heatmapFilter);
        }

        // Remove overlay graphics
        if (attachment.overlay.parent) {
            this.container.removeChild(attachment.overlay);
        }

        // Clear graphics before destroy
        attachment.overlay.clear();

        // Destroy graphics
        attachment.overlay.destroy({
            children: true,
            texture: false,
            baseTexture: false
        });

        // Memory leak detector notification
        if (this.memoryLeakDetector) {
            this.memoryLeakDetector.release(`heatmap_overlay_${spriteId}`);
        }

        this.attachments.delete(spriteId);
        this.visibleTiles.delete(spriteId);
        this.stats.tileCount = this.attachments.size;

        console.log(`🔓 Detached overlay: ${spriteId}`);
    }

    /**
     * Update overlay visualization for a specific attachment
     * @private
     * @param {string} spriteId - Attachment ID
     */
    _updateOverlay(spriteId) {
        const attachment = this.attachments.get(spriteId);
        if (!attachment) return;

        const overlay = attachment.overlay;
        const bounds = attachment.bounds;

        // Calculate distance from viewport for LOD
        const viewport = this.getViewportBounds();
        const distance = this._calculateDistanceToViewport(bounds, viewport);

        // Get LOD level (0=highest quality, 2=lowest, 3=culled)
        const lod = this.gpuOptimizer ? this.gpuOptimizer.getLODLevel(distance) : 0;

        // Skip rendering if culled (LOD 3+)
        if (lod >= 3) {
            overlay.visible = false;
            return;
        }

        overlay.visible = this.visible;

        // Get current activity level
        let activity = 0;
        if (this.activityTracker) {
            activity = this.activityTracker.getActivityAt(
                bounds.x + bounds.width / 2,
                bounds.y + bounds.height / 2
            );
        }

        // Clear previous graphics
        overlay.clear();

        // Draw overlay based on mode and LOD level
        const detailLevel = 3 - lod; // LOD 0 = detail 3, LOD 2 = detail 1
        switch (this.mode) {
            case 'entropy':
                this._drawEntropyOverlay(overlay, bounds, activity, attachment.data, detailLevel);
                break;
            case 'layer':
                this._drawLayerOverlay(overlay, bounds, attachment.data, detailLevel);
                break;
            case 'activity':
                this._drawActivityOverlay(overlay, bounds, activity, detailLevel);
                break;
            case 'gradient':
                this._drawGradientOverlay(overlay, bounds, activity, detailLevel);
                break;
        }

        // Update opacity
        overlay.alpha = this.opacity;
        attachment.lastUpdate = performance.now();
        attachment.lod = lod;
    }

    /**
     * Calculate distance from bounds to viewport center
     * @param {Object} bounds - Tile bounds
     * @param {Object} viewport - Viewport bounds
     * @returns {number} Distance in pixels
     * @private
     */
    _calculateDistanceToViewport(bounds, viewport) {
        if (!viewport) return 0;

        const centerX = bounds.x + bounds.width / 2;
        const centerY = bounds.y + bounds.height / 2;

        const viewportCenterX = viewport.x + viewport.width / 2;
        const viewportCenterY = viewport.y + viewport.height / 2;

        const dx = centerX - viewportCenterX;
        const dy = centerY - viewportCenterY;

        return Math.sqrt(dx * dx + dy * dy);
    }

    /**
     * Draw entropy-based heatmap (red=high entropy, blue=low)
     * @private
     */
    _drawEntropyOverlay(overlay, bounds, activity, data, detailLevel = 3) {
        // Use fallback rendering if WebGL is not available
        if (this._useFallbackRendering) {
            this._renderFallback(overlay, bounds, activity || data.entropy || 0);
            return;
        }

        const entropy = data.entropy || activity;

        // For LOD 2 (detailLevel 1), skip indicator circle
        const showIndicator = detailLevel >= 2;

        // Calculate color based on entropy (blue -> green -> red)
        const scheme = this.colorSchemes.entropy;
        let r, g, b;

        if (entropy < 0.5) {
            const t = entropy * 2;
            r = scheme.low.r + (scheme.medium.r - scheme.low.r) * t;
            g = scheme.low.g + (scheme.medium.g - scheme.low.g) * t;
            b = scheme.low.b + (scheme.medium.b - scheme.low.b) * t;
        } else {
            const t = (entropy - 0.5) * 2;
            r = scheme.medium.r + (scheme.high.r - scheme.medium.r) * t;
            g = scheme.medium.g + (scheme.high.g - scheme.medium.g) * t;
            b = scheme.medium.b + (scheme.high.b - scheme.medium.b) * t;
        }

        const color = (Math.floor(r * 255) << 16) | (Math.floor(g * 255) << 8) | Math.floor(b * 255);

        // Draw semi-transparent overlay
        overlay.beginFill(color, this.opacity * 0.5);
        overlay.drawRect(0, 0, bounds.width, bounds.height);
        overlay.endFill();

        // Add entropy indicator circle
        const radius = Math.min(bounds.width, bounds.height) * 0.08;
        overlay.beginFill(color, 0.9);
        overlay.drawCircle(bounds.width - radius - 5, bounds.height - radius - 5, radius);
        overlay.endFill();
    }

    /**
     * Draw layer boundary visualization
     * @private
     */
    _drawLayerOverlay(overlay, bounds, data) {
        const layerType = this._classifyLayer(data.name || '');
        const color = this.colorSchemes.layer[layerType] || this.colorSchemes.layer.other;

        // Draw colored border
        overlay.lineStyle(2, color, this.opacity);
        overlay.drawRect(0, 0, bounds.width, bounds.height);

        // Fill with semi-transparent color
        overlay.beginFill(color, this.opacity * 0.15);
        overlay.drawRect(0, 0, bounds.width, bounds.height);
        overlay.endFill();

        // Add layer type indicator
        const typeLabel = layerType.charAt(0).toUpperCase() + layerType.slice(1);
        const label = new PIXI.Text(typeLabel.substring(0, 3), {
            fontFamily: 'Arial',
            fontSize: Math.min(bounds.width, bounds.height) * 0.12,
            fontWeight: 'bold',
            fill: color
        });
        label.anchor.set(1, 1);
        label.x = bounds.width - 5;
        label.y = bounds.height - 5;
        overlay.addChild(label);
    }

    /**
     * Draw activity heatmap (real-time activation tracking)
     * @private
     */
    _drawActivityOverlay(overlay, bounds, activity) {
        const scheme = this.colorSchemes.activity;
        const t = activity;

        // Interpolate between cold and warm colors
        const r = scheme.cold.r + (scheme.warm.r - scheme.cold.r) * t;
        const g = scheme.cold.g + (scheme.warm.g - scheme.cold.g) * t;
        const b = scheme.cold.b + (scheme.warm.b - scheme.cold.b) * t;

        const color = (Math.floor(r * 255) << 16) | (Math.floor(g * 255) << 8) | Math.floor(b * 255);

        // Create radial gradient effect for glow
        const maxRadius = Math.max(bounds.width, bounds.height) * 0.4;
        const glowRadius = maxRadius * (0.2 + activity * 0.8);

        // Draw glow circles
        for (let i = 3; i >= 0; i--) {
            const radius = glowRadius * (1 - i * 0.2);
            const alpha = this.opacity * 0.15 * (1 - i * 0.25);
            overlay.beginFill(color, alpha);
            overlay.drawCircle(bounds.width / 2, bounds.height / 2, radius);
            overlay.endFill();
        }

        // Add activity level indicator bar
        const barWidth = bounds.width * 0.8;
        const barHeight = 4;
        const barX = (bounds.width - barWidth) / 2;
        const barY = bounds.height - 10;

        overlay.beginFill(0x000000, 0.5);
        overlay.drawRect(barX, barY, barWidth, barHeight);
        overlay.endFill();

        overlay.beginFill(color, this.opacity);
        overlay.drawRect(barX, barY, barWidth * activity, barHeight);
        overlay.endFill();
    }

    /**
     * Draw gradient overlay (weight change visualization)
     * @private
     */
    _drawGradientOverlay(overlay, bounds, activity) {
        const scheme = this.colorSchemes.gradient;

        // Simulated gradient visualization based on activity
        const hasPositiveChange = activity > 0.5;
        const baseColor = hasPositiveChange ? scheme.positive : scheme.negative;

        const r = baseColor.r;
        const g = baseColor.g;
        const b = baseColor.b;

        const color = (Math.floor(r * 255) << 16) | (Math.floor(g * 255) << 8) | Math.floor(b * 255);

        // Draw diagonal gradient lines
        const lineCount = 12;
        const intensity = activity;

        for (let i = 0; i < lineCount; i++) {
            const t = i / (lineCount - 1);
            const x1 = t * bounds.width;
            const y1 = 0;
            const x2 = 0;
            const y2 = t * bounds.height;

            overlay.lineStyle(1, color, this.opacity * intensity * 0.6);
            overlay.moveTo(x1, y1);
            overlay.lineTo(x2, y2);
        }

        // Draw border
        overlay.lineStyle(2, color, this.opacity * 0.8);
        overlay.drawRect(0, 0, bounds.width, bounds.height);

        // Add +/- indicator
        const indicator = hasPositiveChange ? '+' : '-';
        const text = new PIXI.Text(indicator, {
            fontFamily: 'Arial',
            fontSize: Math.min(bounds.width, bounds.height) * 0.2,
            fontWeight: 'bold',
            fill: color
        });
        text.anchor.set(0.5);
        text.x = bounds.width / 2;
        text.y = bounds.height / 2;
        overlay.addChild(text);
    }

    /**
     * Set visualization mode
     * @param {string} mode - One of: 'entropy', 'layer', 'activity', 'gradient'
     */
    setMode(mode) {
        const validModes = ['entropy', 'layer', 'activity', 'gradient'];
        if (!validModes.includes(mode)) {
            console.warn(`Invalid mode: ${mode}. Valid modes: ${validModes.join(', ')}`);
            return;
        }

        this.mode = mode;

        // Update shader uniform
        if (this.heatmapFilter) {
            this.heatmapFilter.uniforms.uMode = this._getModeUniform();
        }

        // Update all overlays
        for (const spriteId of this.attachments.keys()) {
            this._updateOverlay(spriteId);
        }

        console.log(`🔄 Mode changed to: ${mode}`);
    }

    /**
     * Set visualization theme
     * @param {number} theme - 0=Default, 1=Cyberpunk, 2=Bioluminescent, 3=Thermal, 4=Monochrome
     */
    setTheme(theme) {
        this.theme = Math.max(0, Math.min(4, Math.floor(theme)));

        // Update shader uniform
        if (this.heatmapFilter) {
            this.heatmapFilter.uniforms.uTheme = this.theme;
        }

        // Update all overlays to trigger redraw if needed
        for (const spriteId of this.attachments.keys()) {
            this._updateOverlay(spriteId);
        }

        console.log(`🎨 Theme changed to: ${this.theme}`);
    }

    /**
     * Cycle to next visualization mode
     */
    cycleMode() {
        const modes = ['entropy', 'layer', 'activity', 'gradient'];
        const currentIndex = modes.indexOf(this.mode);
        const nextMode = modes[(currentIndex + 1) % modes.length];
        this.setMode(nextMode);
    }

    /**
     * Add a model to multi-model tracking
     * @param {string} modelName - Model name
     * @param {Object} options - Model options
     * @returns {string} Model ID or null
     */
    addModel(modelName, options = {}) {
        if (!this.multiModelTracker) {
            console.warn('[Heatmap] Multi-model tracking not available');
            return null;
        }

        const modelId = this.multiModelTracker.registerModel(modelName, options);

        // Update comparative heatmap if we now have 2+ models
        if (this.multiModelTracker.getModelCount() >= 2 && this.comparativeHeatmap) {
            this.comparativeHeatmap._rebuildContainers();
        }

        return modelId;
    }

    /**
     * Remove a model from tracking
     * @param {string} modelId - Model ID to remove
     */
    removeModel(modelId) {
        if (!this.multiModelTracker) return;

        this.multiModelTracker.unregisterModel(modelId);

        // Update comparative heatmap
        if (this.comparativeHeatmap) {
            this.comparativeHeatmap._rebuildContainers();
        }
    }

    /**
     * Set comparison mode for multi-model view
     * @param {string} mode - 'split', 'differential', or 'overlay'
     */
    setComparisonMode(mode) {
        if (!this.comparativeHeatmap) {
            console.warn('[Heatmap] Comparative heatmap not available');
            return;
        }

        this.comparativeHeatmap.setMode(mode);
    }

    /**
     * Enable/disable multi-model comparison view
     * @param {boolean} enabled - Enable comparison view
     */
    setComparisonEnabled(enabled) {
        if (!this.comparativeHeatmap) return;

        this.comparativeHeatmap.container.visible = enabled;

        // Hide single overlay when comparison is enabled
        if (enabled) {
            this.container.visible = false;
        } else {
            this.container.visible = this.visible;
        }

        console.log('[Heatmap] Comparison view:', enabled ? 'enabled' : 'disabled');
    }

    /**
     * Get correlation matrix for all models
     * @returns {Array} 2D array of correlation coefficients
     */
    getCorrelationMatrix() {
        if (!this.multiModelTracker) return null;

        const models = this.multiModelTracker.getAllModels();
        const n = models.length;

        if (n < 2) return null;

        const matrix = [];
        for (let i = 0; i < n; i++) {
            matrix[i] = [];
            for (let j = 0; j < n; j++) {
                if (i === j) {
                    matrix[i][j] = 1.0;
                } else if (i < j) {
                    const corr = this.multiModelTracker.getCorrelation(models[i].id, models[j].id);
                    matrix[i][j] = corr;
                    matrix[j][i] = corr; // Symmetric
                }
            }
        }

        return matrix;
    }

    /**
     * Set overlay opacity
     * @param {number} value - Opacity value (0-1)
     */
    setOpacity(value) {
        this.opacity = Math.max(0, Math.min(1, value));

        // Update shader uniform
        if (this.heatmapFilter) {
            this.heatmapFilter.uniforms.uOpacity = this.opacity;
        }

        // Update all overlays
        for (const spriteId of this.attachments.keys()) {
            this._updateOverlay(spriteId);
        }

        console.log(`🎨 Opacity set to: ${(this.opacity * 100).toFixed(0)}%`);
    }

    /**
     * Toggle overlay visibility
     */
    toggle() {
        this.visible = !this.visible;
        this.container.visible = this.visible;

        // Update sprite filters
        for (const attachment of this.attachments.values()) {
            if (!this.visible && attachment.sprite.filters) {
                // Remove shader when hidden
                attachment.sprite.filters = attachment.sprite.filters.filter(f => f !== this.heatmapFilter);
            } else if (this.visible && this.heatmapFilter) {
                // Re-add shader when visible
                attachment.sprite.filters = attachment.sprite.filters || [];
                if (!attachment.sprite.filters.includes(this.heatmapFilter)) {
                    attachment.sprite.filters.push(this.heatmapFilter);
                }
            }
            // Update overlay alpha
            attachment.overlay.alpha = this.visible ? this.opacity : 0;
        }

        console.log(`👁️  Overlay ${this.visible ? 'shown' : 'hidden'}`);
    }

    /**
     * Show overlay
     */
    show() {
        if (!this.visible) {
            this.toggle();
        }
    }

    /**
     * Hide overlay
     */
    hide() {
        if (this.visible) {
            this.toggle();
        }
    }

    /**
     * Enable/disable overlay (stops updates when disabled)
     * @param {boolean} enabled - Enable state
     */
    setEnabled(enabled) {
        this.enabled = enabled;
        if (!enabled) {
            this.hide();
        }
        console.log(`⚡ Overlay ${enabled ? 'enabled' : 'disabled'}`);
    }

    /**
     * Update visible tiles based on viewport
     * Implements viewport culling for performance optimization
     */
    updateVisibleTiles() {
        if (!this.cullingEnabled || !this.map) return;

        // Get viewport bounds
        const viewport = this.getViewportBounds();
        if (!viewport) return;

        // Check each attachment
        for (const [spriteId, attachment] of this.attachments) {
            const shouldBeVisible = this.isTileInViewport(attachment, viewport);

            if (shouldBeVisible && !this.visibleTiles.has(spriteId)) {
                // Tile became visible
                attachment.overlay.visible = this.visible;
                this.visibleTiles.add(spriteId);
            } else if (!shouldBeVisible && this.visibleTiles.has(spriteId)) {
                // Tile became hidden
                attachment.overlay.visible = false;
                this.visibleTiles.delete(spriteId);
            }
        }
    }

    /**
     * Get current viewport bounds from camera or screen
     * @returns {Object|null} Viewport bounds {x, y, width, height}
     */
    getViewportBounds() {
        // Try to get viewport from map/camera
        if (this.map?.camera) {
            const camera = this.map.camera;
            return {
                x: camera.x - this.cullingMargin,
                y: camera.y - this.cullingMargin,
                width: camera.width + this.cullingMargin * 2,
                height: camera.height + this.cullingMargin * 2
            };
        }

        // Try parent container viewport
        if (this.container.parent?.viewport) {
            const vp = this.container.parent.viewport;
            return {
                x: (vp.left || vp.x || 0) - this.cullingMargin,
                y: (vp.top || vp.y || 0) - this.cullingMargin,
                width: (vp.width || window.innerWidth) + this.cullingMargin * 2,
                height: (vp.height || window.innerHeight) + this.cullingMargin * 2
            };
        }

        // Fallback to screen size with margin
        return {
            x: -this.cullingMargin,
            y: -this.cullingMargin,
            width: window.innerWidth + this.cullingMargin * 2,
            height: window.innerHeight + this.cullingMargin * 2
        };
    }

    /**
     * Check if tile is in viewport bounds
     * @param {Object} attachment - Tile attachment data
     * @param {Object} viewport - Viewport bounds
     * @returns {boolean} True if tile should be visible
     */
    isTileInViewport(attachment, viewport) {
        if (!viewport) return true;

        const bounds = attachment.bounds;
        const margin = this.cullingMargin;

        // Check if bounds intersect with viewport (with margin)
        return !(bounds.x + bounds.width < viewport.x - margin ||
            bounds.x > viewport.x + viewport.width + margin ||
            bounds.y + bounds.height < viewport.y - margin ||
            bounds.y > viewport.y + viewport.height + margin);
    }

    /**
     * Update overlay state (call once per frame)
     * @param {number} dt - Delta time in seconds
     */
    update(dt = 0.016) {
        if (!this.enabled) return;

        if (this.errorRecovery) {
            // Wrap update with error recovery
            try {
                this._doUpdate(dt);
            } catch (error) {
                this.errorRecovery.handleError(error, 'update');
            }
        } else {
            this._doUpdate(dt);
        }
    }

    /**
     * Internal update implementation
     * @private
     */
    _doUpdate(dt) {
        // Start performance monitoring
        this.performanceMonitor?.beginFrame();

        const startTime = performance.now();

        // Update activity tracker
        if (this.activityTracker) {
            this.activityTracker.update(dt);
        }

        // Update multi-model tracker
        if (this.multiModelTracker) {
            this.multiModelTracker.update(dt);

            // Phase 2.1.4: Collect data for advanced analytics
            this._collectAnalyticsData();
        }

        // Phase 2.1.4: Update analytics views (throttled for performance)
        const now = performance.now();
        if (now - this._lastAnalyticsViewUpdate > this._analyticsViewUpdateInterval) {
            this._updateAnalyticsViews();
            this._lastAnalyticsViewUpdate = now;
        }

        // Update shader time uniform for animation
        if (this.heatmapFilter) {
            this.heatmapFilter.uniforms.uTime = performance.now() / 1000;
        }

        // Update visible tiles (viewport culling)
        this.updateVisibleTiles();

        // Only update visible overlays for performance
        let updatedCount = 0;
        for (const spriteId of this.visibleTiles) {
            if (this.visible) {
                this._updateOverlay(spriteId);
                updatedCount++;
            }
        }

        // Update comparative heatmap if enabled
        if (this.comparativeHeatmap && this.comparativeHeatmap.container.visible) {
            this.comparativeHeatmap.update(dt);
        }

        // Update stats
        this.stats.frameTime = performance.now() - startTime;
        this.stats.lastUpdate = performance.now();
        this.stats.activeCells = this.activityTracker ? this.activityTracker.getStats().activeCells : 0;
        this.stats.multiModelStats = this.multiModelTracker ? this.multiModelTracker.getStats() : null;
        this.stats.performanceStats = this.performanceMonitor ? this.performanceMonitor.getAllStats() : null;

        // End performance monitoring
        this.performanceMonitor?.endFrame();

        // Update dashboard
        this.perfDashboard?.update();

        // FPS calculation
        this._frameCount++;
        const now = performance.now();
        if (now - this._fpsUpdateTime > 1000) {
            this.stats.fps = this._frameCount;
            this._frameCount = 0;
            this._fpsUpdateTime = now;
        }
    }

    /**
     * Get visible bounds from viewport
     * @private
     */
    _getVisibleBounds() {
        // Try to get viewport from parent
        if (this.container.parent?.viewport) {
            const vp = this.container.parent.viewport;
            return {
                x: vp.left || vp.x || 0,
                y: vp.top || vp.y || 0,
                width: vp.width || window.innerWidth,
                height: vp.height || window.innerHeight
            };
        }
        return {
            x: 0,
            y: 0,
            width: window.innerWidth,
            height: window.innerHeight
        };
    }

    /**
     * Check if bounds intersect with visible area
     * @private
     */
    _isInBounds(bounds, visibleBounds) {
        return !(bounds.x > visibleBounds.x + visibleBounds.width ||
            bounds.x + bounds.width < visibleBounds.x ||
            bounds.y > visibleBounds.y + visibleBounds.height ||
            bounds.y + bounds.height < visibleBounds.y);
    }

    /**
     * Record activity at a specific point
     * @param {number} x - X coordinate in pixels
     * @param {number} y - Y coordinate in pixels
     * @param {number} intensity - Activity intensity (0-1)
     */
    recordActivity(x, y, intensity = 1.0) {
        if (this.activityTracker) {
            this.activityTracker.recordActivity(x, y, intensity);
        }
    }

    /**
     * Record layer access activity
     * @param {string} layerName - Layer name
     * @param {Object} bounds - Layer bounds
     * @param {number} intensity - Activity intensity
     */
    recordLayerAccess(layerName, bounds, intensity = 1.0) {
        if (this.activityTracker) {
            this.activityTracker.recordLayerAccess(layerName, bounds, intensity);
        }
    }

    /**
     * Get layer information at a point
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @returns {Object|null} Layer info or null
     */
    getLayerAtPoint(x, y) {
        for (const [name, boundary] of this.layerBoundaries) {
            const b = boundary.bounds;
            if (x >= b.x && x <= b.x + b.width && y >= b.y && y <= b.y + b.height) {
                return { name, ...boundary };
            }
        }
        return null;
    }

    /**
     * Get current statistics
     * @returns {Object} Performance and usage statistics
     */
    getStats() {
        return {
            ...this.stats,
            tileCount: this.attachments.size,
            visibleTiles: this.visibleTiles.size,
            culledTiles: this.attachments.size - this.visibleTiles.size,
            cullingEnabled: this.cullingEnabled,
            mode: this.mode,
            opacity: this.opacity,
            enabled: this.enabled,
            visible: this.visible,
            activityStats: this.activityTracker ? this.activityTracker.getStats() : null,
            poolStats: this.graphicsPool ? this.graphicsPool.getStats() : null,
            performanceStats: this.performanceMonitor ? this.performanceMonitor.getAllStats() : null,
            memoryLeakStats: this.memoryLeakDetector ? this.memoryLeakDetector.generateReport() : null,
            gpuOptimizerStats: this.gpuOptimizer ? this.gpuOptimizer.getStats() : null
        };
    }

    /**
     * Handle inference start event
     * Phase 1: Real Data Integration - Task 1.2
     */
    onInferenceStart(data) {
        this.currentInference = {
            model: data.model,
            tile: data.tile,
            startTime: data.timestamp,
            activeLayers: new Set()
        };
        console.log('[Heatmap] Inference started:', data.model);
    }

    /**
     * Handle inference complete event
     */
    onInferenceComplete(data) {
        if (this.currentInference) {
            const duration = data.timestamp - this.currentInference.startTime;
            console.log(`[Heatmap] Inference complete: ${duration.toFixed(0)}ms, ${data.tokens} tokens`);
            this.currentInference = null;
        }
    }

    /**
     * Record layer activation during inference
     */
    recordLayerActivation(layerName, intensity = 1.0) {
        if (!this.currentInference) return;

        const tileKey = `${this.currentInference.tile?.x || 0},${this.currentInference.tile?.y || 0}`;
        const attachment = this.attachments.get(tileKey);

        if (attachment) {
            const position = {
                x: attachment.bounds.x + attachment.bounds.width / 2,
                y: attachment.bounds.y + attachment.bounds.height / 2
            };

            if (this.activityTracker) {
                this.activityTracker.recordActivity(position.x, position.y, intensity);
            }

            console.log(`[Heatmap] Layer activation: ${layerName} at (${position.x.toFixed(0)}, ${position.y.toFixed(0)})`);
        }
    }

    /**
     * Create activity sprite using graphics pool
     * Phase 3: Performance - Task 3.2 (Graphics Pooling)
     */
    createActivitySprite(x, y, intensity = 1.0, radius = 8) {
        let sprite;

        if (this.graphicsPool) {
            const graphics = this.graphicsPool.acquire();

            // Draw activity circle
            graphics.beginFill(0x00FFFF, intensity * 0.5);
            graphics.drawCircle(0, 0, radius);
            graphics.endFill();

            graphics.x = x;
            graphics.y = y;

            sprite = graphics;
        } else {
            // Fallback: create new graphics
            const graphics = new PIXI.Graphics();
            graphics.beginFill(0x00FFFF, intensity * 0.5);
            graphics.drawCircle(0, 0, radius);
            graphics.endFill();
            graphics.x = x;
            graphics.y = y;
            sprite = graphics;
        }

        return sprite;
    }

    /**
     * Release activity sprite back to pool
     */
    releaseActivitySprite(sprite) {
        if (this.graphicsPool) {
            this.graphicsPool.release(sprite);
        } else {
            sprite.destroy();
        }
    }

    /**
     * Fallback rendering for browsers without WebGL
     * @private
     */
    _renderFallback(overlay, bounds, activity) {
        overlay.clear();

        // Simple colored rectangle based on activity
        const intensity = Math.min(activity, 1);

        // Simple gradient effect
        const color = this._interpolateColor(0x0000FF, 0xFF0000, intensity);

        overlay.beginFill(color, this.opacity * 0.5);
        overlay.drawRect(0, 0, bounds.width, bounds.height);
        overlay.endFill();

        // Add border
        overlay.lineStyle(2, color, this.opacity);
        overlay.drawRect(0, 0, bounds.width, bounds.height);
    }

    /**
     * Interpolate between two colors
     * @private
     */
    _interpolateColor(color1, color2, t) {
        const r1 = (color1 >> 16) & 0xFF;
        const g1 = (color1 >> 8) & 0xFF;
        const b1 = color1 & 0xFF;

        const r2 = (color2 >> 16) & 0xFF;
        const g2 = (color2 >> 8) & 0xFF;
        const b2 = color2 & 0xFF;

        const r = Math.round(r1 + (r2 - r1) * t);
        const g = Math.round(g1 + (g2 - g1) * t);
        const b = Math.round(b1 + (b2 - b1) * t);

        return (r << 16) | (g << 8) | b;
    }

    /**
     * Clear all attachments and activity
     */
    clear() {
        for (const spriteId of this.attachments.keys()) {
            this.detachFromTile(spriteId);
        }
        if (this.activityTracker) {
            this.activityTracker.clear();
        }
        this.layerBoundaries.clear();
        console.log('🧹 Overlay cleared');
    }

    // Phase 2.1.2: Enhanced overlay controls

    /**
     * Set overlay transparency (0-100)
     * @param {number} level - Transparency level (0=opaque, 100=transparent)
     */
    setTransparency(level) {
        this.opacity = 1 - (level / 100);
        if (this.enhancedOverlay) {
            this.enhancedOverlay.setTransparency(level);
        }
    }

    /**
     * Set blend mode for overlay rendering
     * @param {string} mode - PIXI blend mode (normal, multiply, screen, overlay, etc.)
     */
    setBlendMode(mode) {
        const validModes = ['normal', 'multiply', 'screen', 'overlay', 'darken', 'lighten',
            'color-dodge', 'color-burn', 'hard-light', 'soft-light',
            'difference', 'exclusion', 'hue', 'saturation', 'color', 'luminosity', 'add'];
        if (!validModes.includes(mode)) {
            console.warn(`[Heatmap] Invalid blend mode: ${mode}`);
            return;
        }

        if (this.enhancedOverlay) {
            this.enhancedOverlay.setBlendMode(mode);
        }

        // Update container blend mode
        if (this.container) {
            this.container.blendMode = mode;
        }

        console.log(`[Heatmap] Blend mode set to: ${mode}`);
    }

    /**
     * Apply color theme
     * @param {string} themeName - Theme name (cyberpunk, bioluminescent, thermal, monochrome, medical)
     */
    setTheme(themeName) {
        if (this.enhancedOverlay) {
            this.enhancedOverlay.setTheme(themeName);
        }
    }

    /**
     * Zoom to specific neural coordinates
     * @param {number} layer - Layer index
     * @param {number} head - Head index
     * @param {number} neuron - Neuron index
     */
    zoomToNeuron(layer, head, neuron) {
        if (this.interactiveAnalysis) {
            this.interactiveAnalysis.zoomToCell(layer, head, neuron);
        }
    }

    /**
     * Export heatmap data
     * @param {string} format - Export format (png, json, csv)
     * @param {string} filename - Output filename
     */
    async exportData(format, filename) {
        if (this.exportUtils) {
            switch (format) {
                case 'png':
                    await this.exportUtils.exportPNG(filename);
                    break;
                case 'json':
                    this.exportUtils.exportJSON(filename);
                    break;
                case 'csv':
                    this.exportUtils.exportCSV(filename);
                    break;
                default:
                    console.warn(`[Heatmap] Unknown export format: ${format}`);
            }
        }
    }

    /**
     * Get comprehensive statistics including Phase 2.1.2 components
     */
    getStats() {
        const baseStats = {
            frameTime: this.stats.frameTime,
            renderTime: this.stats.renderTime,
            tileCount: this.stats.tileCount,
            activeCells: this.stats.activeCells,
            lastUpdate: this.stats.lastUpdate,
            fps: this.stats.fps
        };

        // Add Phase 2.1.1 component stats
        if (this.performanceMonitor) {
            baseStats.performance = this.performanceMonitor.getStats();
        }

        if (this.memoryLeakDetector) {
            baseStats.memoryLeakStats = this.memoryLeakDetector.generateReport();
        }

        if (this.gpuOptimizer) {
            baseStats.gpuOptimizerStats = this.gpuOptimizer.getStats();
        }

        // Add Phase 2.1.2 component stats
        if (this.interactiveAnalysis) {
            baseStats.interactiveStats = this.interactiveAnalysis.getStats();
        }

        if (this.enhancedOverlay) {
            baseStats.enhancedOverlayStats = this.enhancedOverlay.getStats();
        }

        if (this.advancedDifferential) {
            baseStats.differentialStats = this.advancedDifferential.getStats();
        }

        // Add Model Zoo stats
        if (this.modelZoo) {
            baseStats.modelZooStats = this.modelZoo.getStats();
        }

        if (this.modelZooUI) {
            baseStats.modelZooUIStats = {
                activeModels: this.modelZooUI.getActiveModels(),
                activeModelCount: this.modelZooUI.getActiveModels().length
            };
        }

        return baseStats;
    }

    /**
     * Handle zoom event from InteractiveAnalysis
     * @private
     */
    _handleZoom(zoomLevel, center) {
        // Implement zoom behavior
        console.log(`[Heatmap] Zoom to ${zoomLevel}x at (${center.x}, ${center.y})`);
        // TODO: Implement actual zoom transformation
    }

    /**
     * Sync Model Zoo models with MultiModelTracker
     * @private
     */
    _syncModelZooWithTracker() {
        if (!this.modelZoo || !this.multiModelTracker) return;

        const activeModels = this.modelZoo.getActiveModels();

        for (const model of activeModels) {
            this._registerZooModel(model);
        }

        console.log(`[Heatmap] Synced ${activeModels.length} models from zoo`);
    }

    /**
     * Register a single zoo model with the tracker
     * @private
     * @param {Object} model - Model metadata
     */
    _registerZooModel(model) {
        if (!this.multiModelTracker) return;

        // Check if already registered
        if (this.multiModelTracker.getModelInfo(model.id)) {
            return;
        }

        // Map color from hex string to number if needed
        let color = model.color;
        if (typeof color === 'string' && color.startsWith('#')) {
            color = parseInt(color.slice(1), 16);
        }

        this.multiModelTracker.registerModel(model.name, {
            color: color,
            architecture: model.architecture || 'unknown',
            provider: model.provider
        });

        console.log(`[Heatmap] Registered zoo model: ${model.name}`);
    }

    /**
     * Get Model Zoo instance
     * @returns {ModelZooManager|null} Model Zoo manager
     */
    getModelZoo() {
        return this.modelZoo;
    }

    /**
     * Add a model to the zoo and register with tracker
     * @param {Object} modelData - Model metadata
     * @returns {string|null} Model ID
     */
    addModelToZoo(modelData) {
        if (!this.modelZoo) return null;

        try {
            const modelId = this.modelZoo.registerModel(modelData);

            // Register with tracker if active
            if (modelData.active) {
                const model = this.modelZoo.registry.get(modelId);
                if (model) {
                    this._registerZooModel(model);
                }
            }

            return modelId;
        } catch (error) {
            console.error('[Heatmap] Failed to add model to zoo:', error);
            return null;
        }
    }

    /**
     * Remove a model from the zoo
     * @param {string} modelId - Model ID
     * @returns {boolean} Success
     */
    removeModelFromZoo(modelId) {
        if (!this.modelZoo) return false;

        // Unregister from tracker
        this.multiModelTracker?.unregisterModel(modelId);

        // Remove from zoo
        return this.modelZoo.removeModel(modelId);
    }

    /**
     * Scan and register models from LM Studio
     * @returns {Promise<Object>} Scan results
     */
    async scanLMStudioModels() {
        if (!this.modelZoo) {
            return { discovered: 0, registered: 0, models: [] };
        }

        try {
            const results = await this.modelZoo.scanAndRegister({
                register: true
            });

            // Sync newly registered models with tracker
            this._syncModelZooWithTracker();

            return results;
        } catch (error) {
            console.error('[Heatmap] LM Studio scan failed:', error);
            return { discovered: 0, registered: 0, models: [], error: error.message };
        }
    }

    /**
     * Destroy overlay and release resources
     */
    destroy() {
        this.clear();

        // Clean up Model Zoo UI
        if (this.modelZooUI) {
            this.modelZooUI.destroy();
            this.modelZooUI = null;
        }

        // Clean up Model Zoo Manager (no destroy method on built-in version)
        this.modelZoo = null;

        // Clean up Model Registry
        if (this.modelRegistry) {
            this.modelRegistry.destroy();
            this.modelRegistry = null;
        }

        // Clean up Model Discovery
        if (this.modelDiscovery) {
            this.modelDiscovery.destroy();
            this.modelDiscovery = null;
        }

        // Clean up multi-model tracker
        if (this.multiModelTracker) {
            this.multiModelTracker.destroy();
            this.multiModelTracker = null;
        }

        if (this.heatmapFilter) {
            this.heatmapFilter.destroy();
            this.heatmapFilter = null;
        }

        // Clean up AnalyticsUIControls (Phase 2.1.4)
        if (this.analyticsControls) {
            this.analyticsControls.destroy();
            this.analyticsControls = null;
        }

        // Clean up AnalyticsFilterPanel (Phase 2.2)
        if (this.filterPanel) {
            this.filterPanel.destroy();
            this.filterPanel = null;
        }

        // Clean up MultiModelComparisonView (Phase 2.2)
        if (this.multiModelComparison) {
            this.multiModelComparison.destroy();
            this.multiModelComparison = null;
        }

        if (this.container.parent) {
            this.container.parent.removeChild(this.container);
        }
        this.container.destroy();

        console.log('💥 NeuralHeatmapOverlay destroyed');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.NeuralHeatmapOverlay = NeuralHeatmapOverlay;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { NeuralHeatmapOverlay };
}
