/**
 * Test Performance Benchmarks - Neural Heatmap Phase 2.2 Performance Tests
 *
 * Performance benchmarks for the Neural Heatmap analytics system.
 * Measures:
 * - Correlation matrix computation time for N layers
 * - Temporal pattern detection performance
 * - Memory usage during extended sessions
 * - Scalability with 5, 10, 20, 50 active models
 *
 * Part of: Neural Heatmap Phase 2.2 - Performance Testing
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-2-performance-tests.md
 */

// Performance benchmark suite
class AnalyticsPerformanceBenchmark {
    constructor() {
        this.results = [];
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

    async runAllBenchmarks() {
        console.log('\n========================================');
        console.log('  Analytics Performance Benchmarks');
        console.log('  Neural Heatmap Phase 2.2');
        console.log('========================================\n');

        await this.benchmarkCorrelationMatrix();
        await this.benchmarkTemporalAnalysis();
        await this.benchmarkAnomalyDetection();
        await this.benchmarkMultiModelScalability();
        await this.benchmarkMemoryUsage();
        await this.benchmarkViewRendering();

        this.printSummary();
    }

    /**
     * Benchmark 1: Correlation matrix computation for N layers
     */
    async benchmarkCorrelationMatrix() {
        console.log('Benchmark 1: Correlation Matrix Computation');
        console.log('--------------------------------------------');

        const layerCounts = [5, 10, 20, 50];
        const samplesPerLayer = 100;

        for (const layerCount of layerCounts) {
            const analyzer = new CrossLayerAnalyzer({
                windowSize: samplesPerLayer,
                correlationThreshold: 0.3
            });

            const startTime = performance.now();

            // Generate test data
            for (let i = 0; i < layerCount; i++) {
                for (let j = 0; j < samplesPerLayer; j++) {
                    analyzer.recordLayerActivity(
                        'model1',
                        `layer.${i}`,
                        { x: j * 10, y: j * 10, width: 16, height: 16 },
                        Math.random(),
                        1000 + j * 10
                    );
                }
            }

            const computationStart = performance.now();
            const layerNames = Array.from({ length: layerCount }, (_, i) => `layer.${i}`);
            const matrix = analyzer.getCorrelationMatrix(['model1'], layerNames);
            const computationTime = performance.now() - computationStart;
            const totalTime = performance.now() - startTime;

            console.log(`\n${layerCount} layers x ${samplesPerLayer} samples:`);
            console.log(`  Computation: ${computationTime.toFixed(2)}ms`);
            console.log(`  Total: ${totalTime.toFixed(2)}ms`);
            console.log(`  Matrix entries: ${matrix.correlations.size}`);

            this.recordResult('Correlation Matrix', {
                layerCount,
                samplesPerLayer,
                computationTime,
                totalTime,
                matrixEntries: matrix.correlations.size
            });

            // Performance targets
            const target = layerCount <= 10 ? 50 : (layerCount <= 20 ? 200 : 500);
            if (computationTime < target) {
                console.log(`  ✓ Meets target (< ${target}ms)`);
            } else {
                console.log(`  ⚠ Exceeds target (target: ${target}ms)`);
            }

            analyzer.destroy();
        }

        console.log();
    }

    /**
     * Benchmark 2: Temporal pattern detection
     */
    async benchmarkTemporalAnalysis() {
        console.log('Benchmark 2: Temporal Pattern Detection');
        console.log('-----------------------------------------');

        const eventCounts = [50, 100, 200, 500];

        for (const eventCount of eventCounts) {
            const analyzer = new TemporalAnalyzer({
                historySize: eventCount + 100,
                minPatternLength: 10
            });

            const startTime = performance.now();

            // Simulate temporal data with patterns
            for (let i = 0; i < eventCount; i++) {
                analyzer.recordEvent(
                    'model1',
                    0.5 + Math.sin(i * 0.1) * 0.3 + (Math.random() - 0.5) * 0.1,
                    { x: i, y: i },
                    'layer.0',
                    1000 + i * 10
                );
            }

            const analysisStart = performance.now();
            const patterns = analyzer.detectPeriodicPatterns('model1');
            const trends = analyzer.detectTrends('model1');
            const stateChanges = analyzer.detectStateChanges('model1');
            const analysisTime = performance.now() - analysisStart;
            const totalTime = performance.now() - startTime;

            console.log(`\n${eventCount} events:`);
            console.log(`  Analysis: ${analysisTime.toFixed(2)}ms`);
            console.log(`  Total: ${totalTime.toFixed(2)}ms`);
            console.log(`  Periodic patterns: ${patterns.length}`);
            console.log(`  Trends: ${trends.length}`);
            console.log(`  State changes: ${stateChanges.length}`);

            this.recordResult('Temporal Analysis', {
                eventCount,
                analysisTime,
                totalTime,
                patternsFound: patterns.length,
                trendsFound: trends.length,
                stateChangesFound: stateChanges.length
            });

            // Performance target: < 100ms for 100 events
            const target = eventCount <= 100 ? 100 : (eventCount <= 200 ? 200 : 500);
            if (analysisTime < target) {
                console.log(`  ✓ Meets target (< ${target}ms)`);
            } else {
                console.log(`  ⚠ Exceeds target (target: ${target}ms)`);
            }

            analyzer.destroy();
        }

        console.log();
    }

    /**
     * Benchmark 3: Anomaly detection performance
     */
    async benchmarkAnomalyDetection() {
        console.log('Benchmark 3: Anomaly Detection');
        console.log('--------------------------------');

        const sampleCounts = [100, 500, 1000, 2000];

        for (const sampleCount of sampleCounts) {
            const detector = new AnomalyDetector({
                zScoreThreshold: 2.5,
                minSamples: 30
            });

            const startTime = performance.now();

            // Establish baseline
            const baselineData = [];
            for (let i = 0; i < 50; i++) {
                baselineData.push({
                    intensity: 0.5 + (Math.random() - 0.5) * 0.2,
                    location: { x: i, y: i },
                    timestamp: 1000 + i * 10
                });
            }
            detector.updateBaseline('model1', baselineData);

            // Record activities with occasional anomalies
            const activities = [];
            for (let i = 0; i < sampleCount; i++) {
                const isAnomaly = i % 100 === 0;
                activities.push({
                    intensity: isAnomaly ? 0.95 : (0.5 + (Math.random() - 0.5) * 0.2),
                    location: { x: i, y: i },
                    timestamp: 2000 + i * 10
                });
            }

            const detectionStart = performance.now();
            const anomalies = detector.detectAnomalies('model1', activities);
            const detectionTime = performance.now() - detectionStart;
            const totalTime = performance.now() - startTime;

            console.log(`\n${sampleCount} samples:`);
            console.log(`  Detection: ${detectionTime.toFixed(2)}ms`);
            console.log(`  Total: ${totalTime.toFixed(2)}ms`);
            console.log(`  Anomalies found: ${anomalies.length}`);

            this.recordResult('Anomaly Detection', {
                sampleCount,
                detectionTime,
                totalTime,
                anomaliesFound: anomalies.length
            });

            // Performance target: < 50ms for 1000 samples
            const target = sampleCount <= 500 ? 20 : (sampleCount <= 1000 ? 50 : 100);
            if (detectionTime < target) {
                console.log(`  ✓ Meets target (< ${target}ms)`);
            } else {
                console.log(`  ⚠ Exceeds target (target: ${target}ms)`);
            }

            detector.destroy();
        }

        console.log();
    }

    /**
     * Benchmark 4: Multi-model scalability (5, 10, 20, 50 models)
     */
    async benchmarkMultiModelScalability() {
        console.log('Benchmark 4: Multi-Model Scalability');
        console.log('--------------------------------------');

        const modelCounts = [5, 10, 20, 50];
        const layersPerModel = 10;
        const samplesPerLayer = 50;

        for (const modelCount of modelCounts) {
            const analyzer = new CrossLayerAnalyzer({
                windowSize: samplesPerLayer
            });

            const startTime = performance.now();

            // Create data for multiple models
            for (let m = 0; m < modelCount; m++) {
                for (let l = 0; l < layersPerModel; l++) {
                    for (let s = 0; s < samplesPerLayer; s++) {
                        analyzer.recordLayerActivity(
                            `model${m}`,
                            `layer.${l}`,
                            { x: s, y: s, width: 16, height: 16 },
                            Math.random(),
                            1000 + s * 10
                        );
                    }
                }
            }

            const computationStart = performance.now();

            // Compute correlation matrices for all models
            const modelIds = Array.from({ length: modelCount }, (_, i) => `model${i}`);
            const layerNames = Array.from({ length: layersPerModel }, (_, i) => `layer.${i}`);

            // Test full matrix computation
            const fullMatrix = analyzer.getCorrelationMatrix(modelIds, layerNames);

            const computationTime = performance.now() - computationStart;
            const totalTime = performance.now() - startTime;

            const totalActivities = modelCount * layersPerModel * samplesPerLayer;

            console.log(`\n${modelCount} models (${layersPerModel} layers each):`);
            console.log(`  Total activities: ${totalActivities}`);
            console.log(`  Computation: ${computationTime.toFixed(2)}ms`);
            console.log(`  Total: ${totalTime.toFixed(2)}ms`);
            console.log(`  Per model: ${(computationTime / modelCount).toFixed(2)}ms`);
            console.log(`  Matrix entries: ${fullMatrix.correlations.size}`);

            this.recordResult('Multi-Model Scalability', {
                modelCount,
                layersPerModel,
                totalActivities,
                computationTime,
                totalTime,
                timePerModel: computationTime / modelCount,
                matrixEntries: fullMatrix.correlations.size
            });

            // Performance target: < 100ms per model
            if (computationTime / modelCount < 100) {
                console.log(`  ✓ Meets target (< 100ms per model)`);
            } else {
                console.log(`  ⚠ Exceeds target (target: 100ms per model)`);
            }

            analyzer.destroy();
        }

        console.log();
    }

    /**
     * Benchmark 5: Memory usage profiling
     */
    async benchmarkMemoryUsage() {
        console.log('Benchmark 5: Memory Usage Profiling');
        console.log('------------------------------------');

        if (!performance.memory) {
            console.log('⚠ Memory API not available in this browser\n');
            return;
        }

        const scenarios = [
            { name: 'Single model, 10 layers', models: 1, layers: 10, samples: 100 },
            { name: 'Single model, 50 layers', models: 1, layers: 50, samples: 100 },
            { name: '10 models, 10 layers each', models: 10, layers: 10, samples: 100 },
            { name: '20 models, 20 layers each', models: 20, layers: 20, samples: 100 }
        ];

        for (const scenario of scenarios) {
            // Force garbage collection if available
            if (typeof global !== 'undefined' && global.gc) {
                global.gc();
            }

            const initialMemory = performance.memory.usedJSHeapSize;

            const analyzer = new CrossLayerAnalyzer({
                windowSize: scenario.samples
            });

            for (let m = 0; m < scenario.models; m++) {
                for (let l = 0; l < scenario.layers; l++) {
                    for (let s = 0; s < scenario.samples; s++) {
                        analyzer.recordLayerActivity(
                            `model${m}`,
                            `layer.${l}`,
                            { x: s, y: s, width: 16, height: 16 },
                            Math.random(),
                            1000 + s * 10
                        );
                    }
                }
            }

            // Compute matrices
            const modelIds = Array.from({ length: scenario.models }, (_, i) => `model${i}`);
            const layerNames = Array.from({ length: scenario.layers }, (_, i) => `layer.${i}`);
            analyzer.getCorrelationMatrix(modelIds, layerNames);

            const finalMemory = performance.memory.usedJSHeapSize;
            const memoryUsed = finalMemory - initialMemory;
            const memoryMB = memoryUsed / (1024 * 1024);

            console.log(`\n${scenario.name}:`);
            console.log(`  Memory used: ${memoryMB.toFixed(2)} MB`);
            console.log(`  Total activities: ${scenario.models * scenario.layers * scenario.samples}`);

            this.recordResult('Memory Usage', {
                scenario: scenario.name,
                memoryUsed,
                memoryMB,
                totalActivities: scenario.models * scenario.layers * scenario.samples
            });

            // Performance target
            const target = scenario.models <= 1 ? 10 : (scenario.models <= 10 ? 50 : 200);
            if (memoryMB < target) {
                console.log(`  ✓ Meets target (< ${target} MB)`);
            } else {
                console.log(`  ⚠ Exceeds target (target: ${target} MB)`);
            }

            analyzer.destroy();
        }

        console.log();
    }

    /**
     * Benchmark 6: View rendering performance
     */
    async benchmarkViewRendering() {
        console.log('Benchmark 6: View Rendering Performance');
        console.log('-----------------------------------------');

        const matrixSizes = [5, 10, 20, 50];

        for (const size of matrixSizes) {
            // Generate test matrix
            const modelIds = ['model1', 'model2'];
            const layerNames = Array.from({ length: size }, (_, i) => `layer.${i}`);
            const correlations = new Map();

            for (let i = 0; i < size; i++) {
                for (let j = 0; j < size; j++) {
                    const correlation = i === j ? 1.0 : (Math.random() * 2 - 1) * 0.5;
                    correlations.set(`model1:${layerNames[i]}|model2:${layerNames[j]}`, {
                        model1: 'model1',
                        layer1: layerNames[i],
                        model2: 'model2',
                        layer2: layerNames[j],
                        correlation: correlation
                    });
                }
            }

            const matrix = {
                modelIds: modelIds,
                layerNames: layerNames,
                correlations: correlations,
                avgCorrelation: 0.5,
                maxCorrelation: 1.0,
                minCorrelation: -1.0,
                computedAt: performance.now()
            };

            const view = new CorrelationMatrixView({
                width: 400,
                height: 400
            });
            view.create();

            const startTime = performance.now();
            view.updateMatrix(matrix);
            const renderTime = performance.now() - startTime;

            console.log(`\n${size}x${size} matrix (${correlations.size} entries):`);
            console.log(`  Render time: ${renderTime.toFixed(2)}ms`);

            this.recordResult('View Rendering', {
                matrixSize: size,
                matrixEntries: correlations.size,
                renderTime
            });

            // Performance target: < 100ms for any matrix size
            if (renderTime < 100) {
                console.log(`  ✓ Meets target (< 100ms)`);
            } else {
                console.log(`  ⚠ Exceeds target (target: 100ms)`);
            }

            view.destroy();
        }

        // Test TemporalView rendering
        console.log('\n--- TemporalView Rendering ---');

        const eventCounts = [50, 100, 200, 500];
        for (const eventCount of eventCounts) {
            const temporalAnalyzer = new TemporalAnalyzer();

            for (let i = 0; i < eventCount; i++) {
                temporalAnalyzer.recordEvent(
                    'model1',
                    0.3 + Math.random() * 0.4,
                    { x: i, y: i },
                    'layer.0',
                    1000 + i * 10
                );
            }

            const analysis = temporalAnalyzer.analyzeModel('model1');

            const temporalView = new TemporalView();
            temporalView.create();

            const startTime = performance.now();
            temporalView.update(analysis);
            const renderTime = performance.now() - startTime;

            console.log(`\n${eventCount} events:`);
            console.log(`  Render time: ${renderTime.toFixed(2)}ms`);

            this.recordResult('TemporalView Rendering', {
                eventCount,
                renderTime
            });

            temporalView.destroy();
            temporalAnalyzer.destroy();
        }

        console.log();
    }

    /**
     * Record benchmark result
     */
    recordResult(benchmarkName, data) {
        this.results.push({
            benchmark: benchmarkName,
            ...data,
            timestamp: Date.now()
        });
    }

    /**
     * Print summary of all benchmarks
     */
    printSummary() {
        console.log('\n========================================');
        console.log('  Performance Summary');
        console.log('========================================\n');

        // Group by benchmark type
        const grouped = {};
        this.results.forEach(result => {
            const key = result.benchmark;
            if (!grouped[key]) {
                grouped[key] = [];
            }
            grouped[key].push(result);
        });

        // Print summary for each benchmark type
        Object.keys(grouped).forEach(key => {
            console.log(`${key}:`);
            grouped[key].forEach(result => {
                if (key === 'Correlation Matrix') {
                    console.log(`  ${result.layerCount} layers: ${result.computationTime.toFixed(2)}ms`);
                } else if (key === 'Temporal Analysis') {
                    console.log(`  ${result.eventCount} events: ${result.analysisTime.toFixed(2)}ms`);
                } else if (key === 'Anomaly Detection') {
                    console.log(`  ${result.sampleCount} samples: ${result.detectionTime.toFixed(2)}ms`);
                } else if (key === 'Multi-Model Scalability') {
                    console.log(`  ${result.modelCount} models: ${result.computationTime.toFixed(2)}ms (${result.timePerModel.toFixed(2)}ms/model)`);
                } else if (key === 'Memory Usage') {
                    console.log(`  ${result.scenario}: ${result.memoryMB.toFixed(2)} MB`);
                } else if (key === 'View Rendering') {
                    console.log(`  ${result.matrixSize}x${result.matrixSize}: ${result.renderTime.toFixed(2)}ms`);
                } else if (key === 'TemporalView Rendering') {
                    console.log(`  ${result.eventCount} events: ${result.renderTime.toFixed(2)}ms`);
                }
            });
            console.log();
        });

        // Export results
        console.log('Results exported to window.analyticsBenchmarkResults');
        if (typeof window !== 'undefined') {
            window.analyticsBenchmarkResults = this.results;
        }
    }

    /**
     * Export results as JSON
     */
    exportResults() {
        return JSON.stringify(this.results, null, 2);
    }

    /**
     * Export results as CSV
     */
    exportCSV() {
        if (this.results.length === 0) return '';

        const headers = Object.keys(this.results[0]);
        const rows = this.results.map(result =>
            headers.map(header => result[header] ?? '').join(',')
        );

        return [headers.join(','), ...rows].join('\n');
    }
}

// Auto-load in browser
if (typeof window !== 'undefined') {
    window.AnalyticsPerformanceBenchmark = AnalyticsPerformanceBenchmark;

    console.log('Performance benchmark suite loaded. Run with:');
    console.log('  const benchmark = new AnalyticsPerformanceBenchmark();');
    console.log('  await benchmark.runAllBenchmarks();');

    // Auto-run if requested
    if (typeof window.addEventListener !== 'undefined') {
        window.addEventListener('load', () => {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('run') === 'benchmarks') {
                const benchmark = new AnalyticsPerformanceBenchmark();
                benchmark.runAllBenchmarks();
            }
        });
    }
}

// Export for Node.js
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { AnalyticsPerformanceBenchmark };
}
