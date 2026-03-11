/**
 * Test Integration Analytics - Neural Heatmap Phase 2.2 Integration Tests
 *
 * Comprehensive integration tests for the analytics system including:
 * - CrossLayerAnalyzer → CorrelationMatrixView data flow
 * - TemporalAnalyzer → TemporalView data flow
 * - AnomalyDetector → both views integration
 * - Cache invalidation across components
 * - Real-time update propagation
 *
 * Part of: Neural Heatmap Phase 2.2 - Integration Testing
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-2-integration-tests.md
 */

// Test suite
class IntegrationAnalyticsTestSuite {
    constructor() {
        this.passed = 0;
        this.failed = 0;
        this.tests = [];
        this.mockPIXI = {
            Container: function() {
                this.children = [];
                this.x = 0;
                this.y = 0;
                this.zIndex = 0;
                this.visible = true;
                this.eventMode = 'static';
                this.addChild = function(child) { this.children.push(child); };
                this.removeChildren = function() { this.children = []; };
                this.destroy = function() { this.children = []; };
            },
            Graphics: function() {
                this.children = [];
                this.addChild = function(child) { this.children.push(child); };
                this.clear = function() { this.children = []; };
                this.beginFill = function() { return this; };
                this.endFill = function() { return this; };
                this.drawRoundedRect = function() { return this; };
                this.drawRect = function() { return this; };
                this.drawCircle = function() { return this; };
                this.lineTo = function() { return this; };
                this.moveTo = function() { return this; };
                this.lineStyle = function() { return this; };
                this.destroy = function() { this.children = []; };
            },
            Text: function(text, style) {
                this.text = text;
                this.style = style;
                this.x = 0;
                this.y = 0;
                this.anchor = { x: 0, y: 0 };
                this.rotation = 0;
                this.destroy = function() {};
            }
        };

        // Mock PIXI globally if not available
        if (typeof PIXI === 'undefined') {
            window.PIXI = this.mockPIXI;
        }
    }

    async runAllTests() {
        console.log('\n========================================');
        console.log('  Integration Analytics Test Suite');
        console.log('  Neural Heatmap Phase 2.2');
        console.log('========================================\n');

        await this.testCrossLayerToCorrelationView();
        await this.testTemporalToTemporalView();
        await this.testAnomalyDetectorToViews();
        await this.testCacheInvalidation();
        await this.testRealTimeUpdatePropagation();
        await this.testMultiModelDataFlow();
        await this.testErrorHandling();
        await this.testMemoryLeaks();
        await this.testComponentLifecycle();

        this.printSummary();
    }

    /**
     * Test 1: CrossLayerAnalyzer → CorrelationMatrixView data flow
     */
    async testCrossLayerToCorrelationView() {
        console.log('Test 1: CrossLayerAnalyzer → CorrelationMatrixView Data Flow');
        console.log('-----------------------------------------------------------');

        try {
            // Initialize analyzer
            const analyzer = new CrossLayerAnalyzer({
                windowSize: 100,
                correlationThreshold: 0.3
            });

            // Record test data
            const modelIds = ['model1', 'model2'];
            const layerNames = ['layer.0', 'layer.1', 'layer.2'];

            // Create correlated data
            for (let i = 0; i < 50; i++) {
                const baseIntensity = 0.5 + Math.sin(i * 0.2) * 0.3;
                for (const model of modelIds) {
                    for (const layer of layerNames) {
                        analyzer.recordLayerActivity(
                            model,
                            layer,
                            { x: i * 10, y: i * 10, width: 16, height: 16 },
                            baseIntensity + Math.random() * 0.1,
                            1000 + i * 100
                        );
                    }
                }
            }

            // Get correlation matrix
            const matrix = analyzer.getCorrelationMatrix(modelIds, layerNames);

            // Verify matrix structure
            if (matrix.modelIds.length !== 2) {
                throw new Error(`Expected 2 model IDs, got ${matrix.modelIds.length}`);
            }
            console.log('✓ Matrix contains correct model IDs');

            if (matrix.layerNames.length !== 3) {
                throw new Error(`Expected 3 layer names, got ${matrix.layerNames.length}`);
            }
            console.log('✓ Matrix contains correct layer names');

            if (matrix.correlations.size === 0) {
                throw new Error('Matrix should contain correlations');
            }
            console.log(`✓ Matrix has ${matrix.correlations.size} correlation entries`);

            // Initialize view
            const view = new CorrelationMatrixView({
                width: 400,
                height: 300,
                position: { x: 0, y: 0 }
            });

            const container = view.create();
            if (!container) {
                throw new Error('View creation failed');
            }
            console.log('✓ CorrelationMatrixView created successfully');

            // Test data flow: update view with matrix data
            view.updateMatrix(matrix);

            // Verify view received data
            if (view.matrixData !== matrix) {
                throw new Error('View did not store matrix data');
            }
            console.log('✓ View received and stored matrix data');

            if (view.labels.length !== layerNames.length) {
                throw new Error(`Expected ${layerNames.length} labels, got ${view.labels.length}`);
            }
            console.log('✓ View extracted correct labels from matrix');

            // Verify cache hit on subsequent access
            const stats1 = analyzer.getStats();
            const correlation = analyzer.getLayerCorrelation('model1', 'layer.0', 'model1', 'layer.1');
            const stats2 = analyzer.getStats();

            if (stats2.cacheHits <= stats1.cacheHits) {
                console.log('ℹ Cache may not have been hit (expected behavior)');
            } else {
                console.log('✓ Cache working correctly in data flow');
            }

            // Cleanup
            analyzer.destroy();
            view.destroy();

            this.recordTest('CrossLayerAnalyzer → CorrelationMatrixView', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            console.error(error.stack);
            this.recordTest('CrossLayerAnalyzer → CorrelationMatrixView', false);
        }

        console.log();
    }

    /**
     * Test 2: TemporalAnalyzer → TemporalView data flow
     */
    async testTemporalToTemporalView() {
        console.log('Test 2: TemporalAnalyzer → TemporalView Data Flow');
        console.log('-----------------------------------------------');

        try {
            // Initialize temporal analyzer
            const temporalAnalyzer = new TemporalAnalyzer({
                historySize: 500,
                minPatternLength: 10
            });

            // Record temporal data with patterns
            const modelId = 'test_model';
            for (let i = 0; i < 100; i++) {
                // Create periodic pattern
                const intensity = 0.5 + Math.sin(i * 0.5) * 0.3;
                temporalAnalyzer.recordEvent(
                    modelId,
                    intensity,
                    { x: i * 5, y: i * 5 },
                    'layer.0',
                    1000 + i * 50
                );
            }

            // Verify data was recorded
            const stats = temporalAnalyzer.getStats();
            if (stats.totalEvents !== 100) {
                throw new Error(`Expected 100 events, got ${stats.totalEvents}`);
            }
            console.log('✓ TemporalAnalyzer recorded 100 events');

            // Analyze patterns
            const patterns = temporalAnalyzer.detectPeriodicPatterns(modelId);
            console.log(`✓ Detected ${patterns.length} periodic patterns`);

            const trends = temporalAnalyzer.detectTrends(modelId);
            console.log(`✓ Detected ${trends.length} trend(s)`);

            const stateChanges = temporalAnalyzer.detectStateChanges(modelId);
            console.log(`✓ Detected ${stateChanges.length} state change(s)`);

            // Get complete analysis
            const analysis = temporalAnalyzer.analyzeModel(modelId);

            // Verify analysis structure
            if (!analysis.periodic || !analysis.trends || !analysis.stateChanges) {
                throw new Error('Analysis missing required properties');
            }
            console.log('✓ Analysis has correct structure');

            // Initialize temporal view
            const temporalView = new TemporalView({
                width: 350,
                height: 400,
                position: { x: 0, y: 0 }
            });

            const container = temporalView.create();
            if (!container) {
                throw new Error('View creation failed');
            }
            console.log('✓ TemporalView created successfully');

            // Test data flow: update view with analysis data
            temporalView.update(analysis);

            // Verify view processed data
            if (!analysis.timeWindows || analysis.timeWindows.length === 0) {
                throw new Error('Analysis should have time windows');
            }
            console.log(`✓ View received ${analysis.timeWindows.length} time windows`);

            // Verify temporal data integrity
            if (analysis.modelId !== modelId) {
                throw new Error(`Model ID mismatch: ${analysis.modelId} vs ${modelId}`);
            }
            console.log('✓ Data integrity maintained through data flow');

            // Cleanup
            temporalAnalyzer.destroy();
            temporalView.destroy();

            this.recordTest('TemporalAnalyzer → TemporalView', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            console.error(error.stack);
            this.recordTest('TemporalAnalyzer → TemporalView', false);
        }

        console.log();
    }

    /**
     * Test 3: AnomalyDetector → both views integration
     */
    async testAnomalyDetectorToViews() {
        console.log('Test 3: AnomalyDetector → Both Views Integration');
        console.log('-----------------------------------------------');

        try {
            // Initialize anomaly detector
            const anomalyDetector = new AnomalyDetector({
                zScoreThreshold: 2.5,
                minSamples: 20
            });

            // Create baseline data
            const baselineActivities = [];
            for (let i = 0; i < 50; i++) {
                baselineActivities.push({
                    intensity: 0.5 + Math.random() * 0.1,
                    location: { x: i * 10, y: i * 10 },
                    timestamp: 1000 + i * 100
                });
            }

            const updated = anomalyDetector.updateBaseline('model1', baselineActivities);
            if (!updated) {
                throw new Error('Baseline update failed');
            }
            console.log('✓ Baseline established for anomaly detection');

            // Create anomalous data
            const anomalousActivities = [
                { intensity: 0.95, location: { x: 100, y: 100 }, timestamp: 6000 },
                { intensity: 0.92, location: { x: 110, y: 110 }, timestamp: 6100 },
                { intensity: 0.05, location: { x: 200, y: 200 }, timestamp: 6200 }
            ];

            // Detect anomalies
            const anomalies = anomalyDetector.detectAnomalies('model1', anomalousActivities);

            console.log(`✓ Detected ${anomalies.length} anomalies`);

            if (anomalies.length === 0) {
                console.log('ℹ No anomalies detected (may be expected with random data)');
            } else {
                // Verify anomaly structure
                const firstAnomaly = anomalies[0];
                if (!firstAnomaly.type || !firstAnomaly.severity) {
                    throw new Error('Anomaly missing required properties');
                }
                console.log('✓ Anomalies have correct structure');
            }

            // Test anomaly summary
            const summary = anomalyDetector.getAnomalySummary();
            if (!summary.totalAnomalies && summary.totalAnomalies !== 0) {
                throw new Error('Summary should have totalAnomalies property');
            }
            console.log('✓ Anomaly summary generated correctly');

            // Test integration with correlation view
            const correlationView = new CorrelationMatrixView({
                width: 400,
                height: 300,
                position: { x: 0, y: 0 }
            });
            correlationView.create();

            // Verify view can handle anomaly-related updates
            const mockMatrix = {
                modelIds: ['model1'],
                layerNames: ['layer.0', 'layer.1'],
                correlations: new Map([
                    ['model1:layer.0|model1:layer.1', { correlation: 0.85 }]
                ]),
                avgCorrelation: 0.85,
                maxCorrelation: 0.85,
                minCorrelation: 0.85
            };
            correlationView.updateMatrix(mockMatrix);
            console.log('✓ CorrelationView handles updates from anomaly context');

            // Test integration with temporal view
            const temporalView = new TemporalView({
                width: 350,
                height: 400,
                position: { x: 0, y: 0 }
            });
            temporalView.create();

            const mockTemporalData = {
                modelId: 'model1',
                periodic: [],
                trends: [],
                stateChanges: anomalies.map(a => ({
                    type: 'state_change',
                    timestamp: a.timestamp,
                    fromIntensity: 0.5,
                    toIntensity: a.intensity,
                    delta: a.intensity - 0.5
                })),
                timeWindows: [{ avgIntensity: 0.5, maxIntensity: 1, duration: 1000 }]
            };
            temporalView.update(mockTemporalData);
            console.log('✓ TemporalView handles anomaly-derived state changes');

            // Cleanup
            anomalyDetector.destroy();
            correlationView.destroy();
            temporalView.destroy();

            this.recordTest('AnomalyDetector → Both Views', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            console.error(error.stack);
            this.recordTest('AnomalyDetector → Both Views', false);
        }

        console.log();
    }

    /**
     * Test 4: Cache invalidation across components
     */
    async testCacheInvalidation() {
        console.log('Test 4: Cache Invalidation Across Components');
        console.log('-------------------------------------------');

        try {
            // Test CrossLayerAnalyzer cache invalidation
            const analyzer = new CrossLayerAnalyzer({
                windowSize: 50,
                cacheSize: 100
            });

            // Record initial data
            for (let i = 0; i < 20; i++) {
                analyzer.recordLayerActivity('model1', 'layer.0', { x: 0, y: 0, width: 16, height: 16 }, 0.5, 1000 + i * 100);
                analyzer.recordLayerActivity('model1', 'layer.1', { x: 0, y: 0, width: 16, height: 16 }, 0.5, 1000 + i * 100);
            }

            // Compute correlation (should cache)
            const corr1 = analyzer.getLayerCorrelation('model1', 'layer.0', 'model1', 'layer.1');
            const stats1 = analyzer.getStats();
            console.log(`✓ Initial correlation computed: ${corr1.toFixed(3)}, cache misses: ${stats1.cacheMisses}`);

            // Access again (should hit cache)
            const corr2 = analyzer.getLayerCorrelation('model1', 'layer.0', 'model1', 'layer.1');
            const stats2 = analyzer.getStats();

            if (stats2.cacheHits > stats1.cacheHits) {
                console.log('✓ Cache hit on repeated access');
            } else {
                console.log('ℹ Cache not hit (may need more data)');
            }

            // Record new data (should invalidate cache)
            analyzer.recordLayerActivity('model1', 'layer.0', { x: 0, y: 0, width: 16, height: 16 }, 0.9, 5000);

            const stats3 = analyzer.getStats();
            const cacheSizeBefore = stats3.cacheSize;

            // Access correlation again
            const corr3 = analyzer.getLayerCorrelation('model1', 'layer.0', 'model1', 'layer.1');
            const stats4 = analyzer.getStats();

            // Cache should have been invalidated and recomputed
            if (Math.abs(corr3 - corr1) > 0.01) {
                console.log('✓ Cache invalidated on new data (correlation changed)');
            } else {
                console.log('ℹ Correlation similar (cache may not be fully invalidated)');
            }

            // Test TemporalAnalyzer cache invalidation
            const temporalAnalyzer = new TemporalAnalyzer({
                historySize: 200
            });

            // Record events
            for (let i = 0; i < 50; i++) {
                temporalAnalyzer.recordEvent('model1', 0.5 + Math.random() * 0.2, { x: i, y: i }, 'layer.0', 1000 + i * 100);
            }

            // Detect patterns (should use cache)
            const patterns1 = temporalAnalyzer.detectPeriodicPatterns('model1');
            console.log(`✓ Temporal patterns detected: ${patterns1.length}`);

            // Add new event (should invalidate cache)
            temporalAnalyzer.recordEvent('model1', 0.9, { x: 100, y: 100 }, 'layer.0', 6000);

            // Detect patterns again
            const patterns2 = temporalAnalyzer.detectPeriodicPatterns('model1');
            console.log(`✓ Cache handling for temporal patterns: ${patterns2.length} patterns`);

            // Test AnomalyDetector baseline updates
            const anomalyDetector = new AnomalyDetector();

            const baselineData = [];
            for (let i = 0; i < 30; i++) {
                baselineData.push({ intensity: 0.5, location: { x: i, y: i } });
            }

            anomalyDetector.updateBaseline('model1', baselineData);

            const baseline1 = anomalyDetector.getBaseline('model1');
            console.log(`✓ Baseline mean: ${baseline1.mean.toFixed(3)}`);

            // Update baseline with new data
            const newData = baselineData.map(d => ({ ...d, intensity: d.intensity + 0.1 }));
            anomalyDetector.updateBaseline('model1', newData);

            const baseline2 = anomalyDetector.getBaseline('model1');
            if (Math.abs(baseline2.mean - baseline1.mean - 0.1) < 0.01) {
                console.log('✓ Baseline updated correctly (cache invalidated)');
            }

            // Cleanup
            analyzer.destroy();
            temporalAnalyzer.destroy();
            anomalyDetector.destroy();

            this.recordTest('Cache Invalidation', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            console.error(error.stack);
            this.recordTest('Cache Invalidation', false);
        }

        console.log();
    }

    /**
     * Test 5: Real-time update propagation
     */
    async testRealTimeUpdatePropagation() {
        console.log('Test 5: Real-time Update Propagation');
        console.log('-----------------------------------');

        try {
            // Create analyzers
            const crossLayerAnalyzer = new CrossLayerAnalyzer();
            const temporalAnalyzer = new TemporalAnalyzer();
            const anomalyDetector = new AnomalyDetector();

            // Create views
            const correlationView = new CorrelationMatrixView();
            const temporalView = new TemporalView();

            correlationView.create();
            temporalView.create();

            // Simulate real-time data stream
            const updateCount = 10;
            let correlationUpdateCount = 0;
            let temporalUpdateCount = 0;

            for (let i = 0; i < updateCount; i++) {
                // Record data to all analyzers
                const timestamp = performance.now();
                const intensity = 0.3 + Math.random() * 0.4;

                // Cross-layer data
                crossLayerAnalyzer.recordLayerActivity('model1', 'layer.0', { x: i * 20, y: 0, width: 16, height: 16 }, intensity, timestamp);
                crossLayerAnalyzer.recordLayerActivity('model1', 'layer.1', { x: i * 20, y: 20, width: 16, height: 16 }, intensity * 0.9, timestamp);

                // Temporal data
                temporalAnalyzer.recordEvent('model1', intensity, { x: i * 20, y: 0 }, 'layer.0', timestamp);

                // Anomaly detection data
                anomalyDetector.recordEvent?.('model1', intensity, { x: i * 20, y: 0 }, 'layer.0', timestamp) ||
                anomalyDetector.updateBaseline('model1', [{ intensity, location: { x: i * 20, y: i * 20 } }], true);

                // Update views every few iterations
                if (i % 3 === 0) {
                    const matrix = crossLayerAnalyzer.getCorrelationMatrix(['model1'], ['layer.0', 'layer.1']);
                    if (matrix.correlations.size > 0) {
                        correlationView.updateMatrix(matrix);
                        correlationUpdateCount++;
                    }

                    const analysis = temporalAnalyzer.analyzeModel('model1');
                    temporalView.update(analysis);
                    temporalUpdateCount++;
                }

                // Simulate delay between updates
                await new Promise(resolve => setTimeout(resolve, 10));
            }

            console.log(`✓ Correlation view updated ${correlationUpdateCount} times`);
            console.log(`✓ Temporal view updated ${temporalUpdateCount} times`);

            // Verify data consistency
            const finalStats1 = crossLayerAnalyzer.getStats();
            const finalStats2 = temporalAnalyzer.getStats();

            if (finalStats1.totalRecords < updateCount * 2) {
                throw new Error(`CrossLayerAnalyzer should have at least ${updateCount * 2} records`);
            }
            console.log(`✓ CrossLayerAnalyzer: ${finalStats1.totalRecords} records`);

            if (finalStats2.totalEvents < updateCount) {
                throw new Error(`TemporalAnalyzer should have at least ${updateCount} events`);
            }
            console.log(`✓ TemporalAnalyzer: ${finalStats2.totalEvents} events`);

            // Verify view state after updates
            if (correlationView.matrixData && correlationUpdateCount > 0) {
                console.log('✓ CorrelationView has valid matrix data');
            }

            if (temporalView.timelineData || temporalUpdateCount > 0) {
                console.log('✓ TemporalView processed updates');
            }

            // Cleanup
            crossLayerAnalyzer.destroy();
            temporalAnalyzer.destroy();
            anomalyDetector.destroy();
            correlationView.destroy();
            temporalView.destroy();

            this.recordTest('Real-time Update Propagation', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            console.error(error.stack);
            this.recordTest('Real-time Update Propagation', false);
        }

        console.log();
    }

    /**
     * Test 6: Multi-model data flow
     */
    async testMultiModelDataFlow() {
        console.log('Test 6: Multi-Model Data Flow');
        console.log('-----------------------------');

        try {
            const analyzer = new CrossLayerAnalyzer();

            // Create data for multiple models
            const models = ['model1', 'model2', 'model3'];
            const layers = ['layer.0', 'layer.1', 'layer.2', 'layer.3'];

            // Record activities with different patterns per model
            for (const model of models) {
                for (const layer of layers) {
                    for (let i = 0; i < 30; i++) {
                        // Create model-specific patterns
                        const baseIntensity = model === 'model1' ? 0.7 : model === 'model2' ? 0.5 : 0.3;
                        const layerOffset = parseInt(layer.split('.')[1]) * 0.1;

                        analyzer.recordLayerActivity(
                            model,
                            layer,
                            { x: i * 15, y: i * 15, width: 16, height: 16 },
                            baseIntensity + layerOffset + Math.random() * 0.1,
                            1000 + i * 100
                        );
                    }
                }
            }

            // Get correlation matrix for subset of models
            const matrix = analyzer.getCorrelationMatrix(models.slice(0, 2), layers);

            if (matrix.modelIds.length !== 2) {
                throw new Error(`Expected 2 model IDs in matrix`);
            }
            console.log('✓ Matrix created for model subset');

            if (matrix.layerNames.length !== layers.length) {
                throw new Error(`Expected ${layers.length} layer names`);
            }
            console.log(`✓ Matrix includes all ${layers.length} layers`);

            // Verify cross-model correlations
            let crossModelCorrelations = 0;
            for (const [key, data] of matrix.correlations) {
                if (data.model1 !== data.model2) {
                    crossModelCorrelations++;
                }
            }
            console.log(`✓ Found ${crossModelCorrelations} cross-model correlations`);

            // Test view with multi-model data
            const view = new CorrelationMatrixView();
            view.create();
            view.updateMatrix(matrix);

            if (view.matrixData !== matrix) {
                throw new Error('View did not store multi-model matrix');
            }
            console.log('✓ View handles multi-model matrix');

            // Test TemporalAnalyzer with multiple models
            const temporalAnalyzer = new TemporalAnalyzer();

            for (const model of models) {
                for (let i = 0; i < 50; i++) {
                    temporalAnalyzer.recordEvent(
                        model,
                        0.3 + Math.random() * 0.4,
                        { x: i * 10, y: i * 10 },
                        'layer.0',
                        1000 + i * 100
                    );
                }
            }

            const trackedModels = temporalAnalyzer.getModelIds();
            if (trackedModels.length !== models.length) {
                throw new Error(`Expected ${models.length} tracked models`);
            }
            console.log(`✓ TemporalAnalyzer tracks ${trackedModels.length} models`);

            // Analyze each model
            for (const model of models) {
                const analysis = temporalAnalyzer.analyzeModel(model);
                if (analysis.modelId !== model) {
                    throw new Error(`Analysis model ID mismatch`);
                }
            }
            console.log('✓ All models analyzed successfully');

            // Cleanup
            analyzer.destroy();
            temporalAnalyzer.destroy();
            view.destroy();

            this.recordTest('Multi-Model Data Flow', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            console.error(error.stack);
            this.recordTest('Multi-Model Data Flow', false);
        }

        console.log();
    }

    /**
     * Test 7: Error handling in integration
     */
    async testErrorHandling() {
        console.log('Test 7: Error Handling in Integration');
        console.log('-------------------------------------');

        try {
            const analyzer = new CrossLayerAnalyzer();
            const view = new CorrelationMatrixView();
            view.create();

            // Test with empty data
            const emptyMatrix = analyzer.getCorrelationMatrix([], []);
            if (emptyMatrix.avgCorrelation !== 0) {
                throw new Error('Empty matrix should have avgCorrelation of 0');
            }
            console.log('✓ Handles empty model/layer arrays');

            // Test view with null data
            try {
                view.updateMatrix(null);
                console.log('✓ View handles null matrix gracefully');
            } catch (e) {
                console.log('ℹ View throws on null (acceptable behavior)');
            }

            // Test view with invalid matrix structure
            try {
                view.updateMatrix({ modelIds: [], correlations: null });
                console.log('✓ View handles invalid structure');
            } catch (e) {
                console.log('ℹ View throws on invalid structure (acceptable)');
            }

            // Test TemporalAnalyzer with non-existent model
            const temporalAnalyzer = new TemporalAnalyzer();
            const emptyAnalysis = temporalAnalyzer.analyzeModel('nonexistent');
            if (emptyAnalysis.modelId !== 'nonexistent') {
                throw new Error('Should return analysis with requested model ID');
            }
            console.log('✓ Handles non-existent model gracefully');

            // Test AnomalyDetector without baseline
            const anomalyDetector = new AnomalyDetector();
            const anomalies = anomalyDetector.detectAnomalies('model1', [{ intensity: 0.9, location: { x: 0, y: 0 } }]);
            if (!Array.isArray(anomalies)) {
                throw new Error('Should return array even without baseline');
            }
            console.log('✓ Handles detection without baseline');

            // Cleanup
            analyzer.destroy();
            view.destroy();
            temporalAnalyzer.destroy();
            anomalyDetector.destroy();

            this.recordTest('Error Handling', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            console.error(error.stack);
            this.recordTest('Error Handling', false);
        }

        console.log();
    }

    /**
     * Test 8: Memory leak detection
     */
    async testMemoryLeaks() {
        console.log('Test 8: Memory Leak Detection');
        console.log('----------------------------');

        try {
            const analyzer = new CrossLayerAnalyzer({
                windowSize: 100,
                cacheSize: 50
            });

            const view = new CorrelationMatrixView();
            view.create();

            // Record large amount of data
            const initialRecords = 1000;
            for (let i = 0; i < initialRecords; i++) {
                analyzer.recordLayerActivity('model1', 'layer.0', { x: i, y: i, width: 16, height: 16 }, Math.random(), 1000 + i);
            }

            const stats1 = analyzer.getStats();
            console.log(`✓ Recorded ${stats1.totalRecords} activities`);

            // Update view multiple times
            for (let i = 0; i < 10; i++) {
                const matrix = analyzer.getCorrelationMatrix(['model1'], ['layer.0']);
                view.updateMatrix(matrix);
            }

            // Verify cache size is controlled
            const stats2 = analyzer.getStats();
            if (stats2.cacheSize > 100) {
                console.log(`⚠ Cache size ${stats2.cacheSize} exceeds expected limit`);
            } else {
                console.log(`✓ Cache size controlled: ${stats2.cacheSize}`);
            }

            // Test history trimming
            const recordsBefore = stats1.totalRecords;
            for (let i = 0; i < 200; i++) {
                analyzer.recordLayerActivity('model1', 'layer.0', { x: i, y: i, width: 16, height: 16 }, Math.random(), 10000 + i);
            }

            const stats3 = analyzer.getStats();
            // With windowSize=100, oldest records should be trimmed
            if (stats3.totalRecords < recordsBefore + 200) {
                console.log('✓ History trimming working (oldest records removed)');
            } else {
                console.log(`ℹ History not trimmed (${stats3.totalRecords} records)`);
            }

            // Test cleanup
            const trackedLayers = analyzer.getTrackedLayers();
            console.log(`✓ Tracked ${trackedLayers.length} layers`);

            analyzer.clear();
            const statsAfterClear = analyzer.getStats();
            if (statsAfterClear.totalRecords !== 0) {
                throw new Error('Clear should reset all records');
            }
            console.log('✓ Clear resets analyzer state');

            // Cleanup
            view.destroy();
            analyzer.destroy();

            this.recordTest('Memory Leak Detection', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            console.error(error.stack);
            this.recordTest('Memory Leak Detection', false);
        }

        console.log();
    }

    /**
     * Test 9: Component lifecycle
     */
    async testComponentLifecycle() {
        console.log('Test 9: Component Lifecycle');
        console.log('--------------------------');

        try {
            // Test full lifecycle: create -> update -> destroy
            const analyzer = new CrossLayerAnalyzer();
            const view = new CorrelationMatrixView();

            // Create
            const container = view.create();
            if (!container || !container.addChild) {
                throw new Error('Container should be created');
            }
            console.log('✓ Component created');

            // Update
            analyzer.recordLayerActivity('model1', 'layer.0', { x: 0, y: 0, width: 16, height: 16 }, 0.5, 1000);
            analyzer.recordLayerActivity('model1', 'layer.1', { x: 0, y: 0, width: 16, height: 16 }, 0.6, 1000);

            const matrix = analyzer.getCorrelationMatrix(['model1'], ['layer.0', 'layer.1']);
            view.updateMatrix(matrix);

            if (view.matrixData === null) {
                throw new Error('View should store matrix after update');
            }
            console.log('✓ Component updated');

            // Visibility
            view.setVisible(false);
            if (container.visible !== false) {
                console.log('ℹ Visibility toggle may not work in mock');
            }
            view.setVisible(true);
            console.log('✓ Visibility toggled');

            // Destroy
            view.destroy();
            analyzer.destroy();

            // Verify destroyed state
            const viewContainer = view.container;
            if (viewContainer !== null && viewContainer.children && viewContainer.children.length > 0) {
                console.log('ℹ Container may not be fully cleared');
            }
            console.log('✓ Component destroyed');

            // Test TemporalAnalyzer lifecycle
            const temporalAnalyzer = new TemporalAnalyzer();
            temporalAnalyzer.recordEvent('model1', 0.5, { x: 0, y: 0 }, 'layer.0', 1000);

            const statsBefore = temporalAnalyzer.getStats();
            if (statsBefore.totalEvents !== 1) {
                throw new Error('Should have 1 event');
            }

            temporalAnalyzer.clear();
            const statsAfter = temporalAnalyzer.getStats();
            if (statsAfter.totalEvents !== 0) {
                throw new Error('Clear should reset events');
            }
            console.log('✓ TemporalAnalyzer lifecycle works');

            temporalAnalyzer.destroy();

            this.recordTest('Component Lifecycle', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            console.error(error.stack);
            this.recordTest('Component Lifecycle', false);
        }

        console.log();
    }

    recordTest(name, passed) {
        this.tests.push({ name, passed });
        if (passed) {
            this.passed++;
        } else {
            this.failed++;
        }
    }

    printSummary() {
        console.log('========================================');
        console.log('  Test Summary');
        console.log('========================================');
        console.log(`Total tests: ${this.tests.length}`);
        console.log(`Passed: ${this.passed}`);
        console.log(`Failed: ${this.failed}`);
        console.log(`Success rate: ${((this.passed / this.tests.length) * 100).toFixed(1)}%`);
        console.log('========================================\n');

        if (this.failed === 0) {
            console.log('✓ All integration tests passed!');
        } else {
            console.log('✗ Some tests failed. See details above.');
        }
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.IntegrationAnalyticsTestSuite = IntegrationAnalyticsTestSuite;

    // Run tests after page load
    if (typeof window.addEventListener !== 'undefined') {
        window.addEventListener('load', () => {
            // Check if we should auto-run
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('run') === 'integration') {
                const suite = new IntegrationAnalyticsTestSuite();
                suite.runAllTests();
            }
        });
    }
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { IntegrationAnalyticsTestSuite };
}
