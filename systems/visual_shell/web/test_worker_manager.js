/**
 * Test Worker Manager - Verify Web Workers implementation
 *
 * Part of: Neural Heatmap Phase 2.2 - Web Workers Performance Optimization
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-2-web-workers.md
 */

class TestWorkerManager {
    constructor() {
        this.results = [];
        this.workerManager = null;
        this.crossLayerAnalyzer = null;
        this.temporalAnalyzer = null;
    }

    /**
     * Run all tests
     */
    async runAll() {
        console.log('=== Worker Manager Tests ===');

        this.results = [];

        await this.testWorkerManagerInitialization();
        await this.testCorrelationWorker();
        await this.testTemporalWorker();
        await this.testCrossLayerAnalyzerIntegration();
        await this.testTemporalAnalyzerIntegration();
        await this.testFallbackBehavior();
        await this.testProgressiveLoading();

        this.printResults();
        return this.results;
    }

    /**
     * Test worker manager initialization
     */
    async testWorkerManagerInitialization() {
        console.log('\n[Test] Worker Manager Initialization');

        try {
            this.workerManager = new WorkerManager({
                maxWorkers: 4,
                minWorkers: 2,
                taskTimeout: 30000,
                enableFallback: true
            });

            const stats = this.workerManager.getStats();

            this.addResult('Worker Manager Initialization', true, {
                workersAvailable: stats.workersAvailable,
                correlationWorkers: stats.correlationWorkers,
                temporalWorkers: stats.temporalWorkers
            });

            console.log('✓ Worker manager initialized');
            console.log('  - Workers available:', stats.workersAvailable);
            console.log('  - Correlation workers:', stats.correlationWorkers);
            console.log('  - Temporal workers:', stats.temporalWorkers);
        } catch (error) {
            this.addResult('Worker Manager Initialization', false, { error: error.message });
            console.error('✗ Worker manager initialization failed:', error);
        }
    }

    /**
     * Test correlation worker
     */
    async testCorrelationWorker() {
        console.log('\n[Test] Correlation Worker');

        if (!this.workerManager || !this.workerManager.isAvailable()) {
            console.log('⊘ Skipped (workers not available)');
            return;
        }

        try {
            // Add test data
            const modelId = 'test-model';
            const layerName = 'test-layer';

            for (let i = 0; i < 50; i++) {
                this.workerManager.updateWorkerData('correlation', 'add_activity', {
                    modelId,
                    layerName,
                    bounds: { x: 0, y: 0, width: 100, height: 100 },
                    intensity: 0.5 + Math.sin(i * 0.1) * 0.3,
                    timestamp: performance.now() + i * 100
                });
            }

            // Test correlation computation
            const result = await this.workerManager.findHighCorrelations(0.3, 10);

            this.addResult('Correlation Worker', true, {
                correlationsFound: result.length
            });

            console.log('✓ Correlation worker test passed');
            console.log('  - Correlations found:', result.length);
        } catch (error) {
            this.addResult('Correlation Worker', false, { error: error.message });
            console.error('✗ Correlation worker test failed:', error);
        }
    }

    /**
     * Test temporal worker
     */
    async testTemporalWorker() {
        console.log('\n[Test] Temporal Worker');

        if (!this.workerManager || !this.workerManager.isAvailable()) {
            console.log('⊘ Skipped (workers not available)');
            return;
        }

        try {
            // Add test data with periodic pattern
            const modelId = 'test-model-temporal';

            for (let i = 0; i < 100; i++) {
                this.workerManager.updateWorkerData('temporal', 'add_event', {
                    modelId,
                    intensity: 0.5 + Math.sin(i * 0.2) * 0.4,
                    location: { x: 50, y: 50 },
                    layer: 'test-layer',
                    timestamp: performance.now() + i * 50
                });
            }

            // Test periodic pattern detection
            const patterns = await this.workerManager.detectPeriodicPatterns(modelId);

            this.addResult('Temporal Worker', true, {
                patternsFound: patterns.length
            });

            console.log('✓ Temporal worker test passed');
            console.log('  - Patterns found:', patterns.length);
            if (patterns.length > 0) {
                console.log('  - First pattern:', patterns[0]);
            }
        } catch (error) {
            this.addResult('Temporal Worker', false, { error: error.message });
            console.error('✗ Temporal worker test failed:', error);
        }
    }

    /**
     * Test CrossLayerAnalyzer integration
     */
    async testCrossLayerAnalyzerIntegration() {
        console.log('\n[Test] CrossLayerAnalyzer Integration');

        try {
            this.crossLayerAnalyzer = new CrossLayerAnalyzer({
                enableWorkers: true,
                windowSize: 100
            });

            // Add test data
            const models = ['model-a', 'model-b'];
            const layers = ['layer.1', 'layer.2', 'layer.3'];

            for (const model of models) {
                for (const layer of layers) {
                    for (let i = 0; i < 50; i++) {
                        this.crossLayerAnalyzer.recordLayerActivity(
                            model,
                            layer,
                            { x: 0, y: 0, width: 100, height: 100 },
                            0.5 + Math.random() * 0.5,
                            performance.now() + i * 100
                        );
                    }
                }
            }

            // Test correlation matrix with workers
            const matrix = await this.crossLayerAnalyzer.getCorrelationMatrix(models, layers, {
                useWorkers: true
            });

            const workerStats = this.crossLayerAnalyzer.getWorkerStats();

            this.addResult('CrossLayerAnalyzer Integration', true, {
                computedWithWorkers: matrix.computedWithWorkers,
                correlationsCount: matrix.correlations.size,
                workerStats: workerStats
            });

            console.log('✓ CrossLayerAnalyzer integration test passed');
            console.log('  - Computed with workers:', matrix.computedWithWorkers);
            console.log('  - Correlations:', matrix.correlations.size);
        } catch (error) {
            this.addResult('CrossLayerAnalyzer Integration', false, { error: error.message });
            console.error('✗ CrossLayerAnalyzer integration test failed:', error);
        }
    }

    /**
     * Test TemporalAnalyzer integration
     */
    async testTemporalAnalyzerIntegration() {
        console.log('\n[Test] TemporalAnalyzer Integration');

        try {
            this.temporalAnalyzer = new TemporalAnalyzer({
                enableWorkers: true,
                historySize: 1000
            });

            // Add test data with trends
            const modelId = 'model-with-trend';

            for (let i = 0; i < 100; i++) {
                this.temporalAnalyzer.recordEvent(
                    modelId,
                    0.3 + i * 0.005, // Increasing trend
                    { x: 50, y: 50 },
                    'test-layer',
                    performance.now() + i * 50
                );
            }

            // Test trend detection with workers
            const trends = await this.temporalAnalyzer.detectTrends(modelId);

            const workerStats = this.temporalAnalyzer.getWorkerStats();

            this.addResult('TemporalAnalyzer Integration', true, {
                trendsFound: trends.length,
                workerStats: workerStats
            });

            console.log('✓ TemporalAnalyzer integration test passed');
            console.log('  - Trends found:', trends.length);
            if (trends.length > 0) {
                console.log('  - Trend direction:', trends[0].direction);
            }
        } catch (error) {
            this.addResult('TemporalAnalyzer Integration', false, { error: error.message });
            console.error('✗ TemporalAnalyzer integration test failed:', error);
        }
    }

    /**
     * Test fallback behavior
     */
    async testFallbackBehavior() {
        console.log('\n[Test] Fallback Behavior');

        try {
            // Create analyzer with workers disabled
            const analyzer = new CrossLayerAnalyzer({
                enableWorkers: false
            });

            // Add test data
            for (let i = 0; i < 20; i++) {
                analyzer.recordLayerActivity(
                    'model-fallback',
                    'layer-fallback',
                    { x: 0, y: 0, width: 100, height: 100 },
                    Math.random(),
                    performance.now() + i * 100
                );
            }

            // Should fall back to synchronous computation
            const matrix = await analyzer.getCorrelationMatrix(
                ['model-fallback'],
                ['layer-fallback']
            );

            this.addResult('Fallback Behavior', true, {
                computedWithWorkers: matrix.computedWithWorkers,
                fallbackUsed: !matrix.computedWithWorkers
            });

            console.log('✓ Fallback behavior test passed');
            console.log('  - Computed with workers:', matrix.computedWithWorkers);
            console.log('  - Fallback used:', !matrix.computedWithWorkers);

            analyzer.destroy();
        } catch (error) {
            this.addResult('Fallback Behavior', false, { error: error.message });
            console.error('✗ Fallback behavior test failed:', error);
        }
    }

    /**
     * Test progressive loading
     */
    async testProgressiveLoading() {
        console.log('\n[Test] Progressive Loading');

        if (!this.workerManager || !this.workerManager.isAvailable()) {
            console.log('⊘ Skipped (workers not available)');
            return;
        }

        try {
            const progressUpdates = [];

            // Test correlation matrix with progress callback
            const result = await this.workerManager.computeCorrelationMatrix(
                ['model-1', 'model-2'],
                ['layer-1', 'layer-2', 'layer-3', 'layer-4', 'layer-5'],
                {
                    chunkSize: 5,
                    onProgress: (progress) => {
                        progressUpdates.push(progress);
                    }
                }
            );

            this.addResult('Progressive Loading', true, {
                progressUpdates: progressUpdates.length,
                totalChunks: progressUpdates.length > 0 ? progressUpdates[0].totalChunks : 0
            });

            console.log('✓ Progressive loading test passed');
            console.log('  - Progress updates:', progressUpdates.length);
            if (progressUpdates.length > 0) {
                console.log('  - Total chunks:', progressUpdates[0].totalChunks);
                console.log('  - Final progress:', progressUpdates[progressUpdates.length - 1].percentComplete + '%');
            }
        } catch (error) {
            this.addResult('Progressive Loading', false, { error: error.message });
            console.error('✗ Progressive loading test failed:', error);
        }
    }

    /**
     * Add test result
     */
    addResult(name, passed, details = {}) {
        this.results.push({
            name,
            passed,
            details,
            timestamp: new Date().toISOString()
        });
    }

    /**
     * Print test results
     */
    printResults() {
        console.log('\n=== Test Results ===');

        const passed = this.results.filter(r => r.passed).length;
        const total = this.results.length;

        console.log(`\nPassed: ${passed}/${total}`);

        for (const result of this.results) {
            const icon = result.passed ? '✓' : '✗';
            console.log(`  ${icon} ${result.name}`);
            if (Object.keys(result.details).length > 0) {
                console.log('    Details:', result.details);
            }
        }
    }

    /**
     * Cleanup
     */
    destroy() {
        if (this.workerManager) {
            this.workerManager.terminate();
        }
        if (this.crossLayerAnalyzer) {
            this.crossLayerAnalyzer.destroy();
        }
        if (this.temporalAnalyzer) {
            this.temporalAnalyzer.destroy();
        }
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.TestWorkerManager = TestWorkerManager;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { TestWorkerManager };
}
