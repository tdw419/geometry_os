/**
 * Test Predictive Analytics Engine
 *
 * Part of: Neural Heatmap Phase 2.3 - Predictive Analytics Engine
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-3-roadmap.md
 */

class TestPredictiveAnalytics {
    constructor() {
        this.results = [];
        this.passed = 0;
        this.failed = 0;
    }

    /**
     * Run all tests
     */
    async runAll() {
        console.log('=== Predictive Analytics Engine Tests ===\n');

        await this.testInitialization();
        await this.testDataRecording();
        await this.testFallbackForecast();
        await this.testConfidenceIntervals();
        await this.testStatistics();
        await this.testReset();
        await this.testStateExportImport();

        this.printSummary();
        return this.results;
    }

    /**
     * Test PredictiveAnalytics initialization
     */
    async testInitialization() {
        console.log('Test: Initialization');

        try {
            const analytics = new PredictiveAnalytics({
                lookbackWindow: 10,
                predictionHorizon: 5
            });

            this.assert(analytics.options.lookbackWindow === 10, 'Lookback window set correctly');
            this.assert(analytics.options.predictionHorizon === 5, 'Prediction horizon set correctly');
            this.assert(analytics.models.size === 0, 'No models initialized');
            this.assert(analytics.historyBuffer.size === 0, 'History buffer empty');

            analytics.destroy();
            this.record('Initialization', true);
        } catch (error) {
            this.record('Initialization', false, error.message);
        }
    }

    /**
     * Test data recording
     */
    async testDataRecording() {
        console.log('\nTest: Data Recording');

        try {
            const analytics = new PredictiveAnalytics();

            // Record some data points
            for (let i = 0; i < 20; i++) {
                analytics.recordData('test-model', 0.5 + Math.sin(i * 0.5) * 0.3);
            }

            this.assert(analytics.historyBuffer.has('test-model'), 'Model data recorded');
            this.assert(analytics.historyBuffer.get('test-model').length === 20, 'All data points recorded');

            // Test with features
            analytics.recordData('test-model', 0.7, [0.7, 0.8, 0.9]);
            const buffer = analytics.historyBuffer.get('test-model');
            this.assert(buffer[buffer.length - 1].features.length === 3, 'Features recorded correctly');

            analytics.destroy();
            this.record('Data Recording', true);
        } catch (error) {
            this.record('Data Recording', false, error.message);
        }
    }

    /**
     * Test fallback forecasting (without TensorFlow.js)
     */
    async testFallbackForecast() {
        console.log('\nTest: Fallback Forecast');

        try {
            const analytics = new PredictiveAnalytics();

            // Generate test data
            const values = [];
            for (let i = 0; i < 30; i++) {
                const value = 0.5 + Math.sin(i * 0.3) * 0.2 + (Math.random() - 0.5) * 0.1;
                values.push(value);
                analytics.recordData('test-model', value);
            }

            // Generate forecast
            const predictions = await analytics.forecast('test-model', { horizon: 10 });

            this.assert(predictions !== null, 'Forecast generated');
            this.assert(predictions.values.length === 10, 'Correct horizon');
            this.assert(predictions.method === 'linear-extrapolation' || predictions.method === 'fallback',
                'Using fallback method');

            // Check prediction structure
            predictions.values.forEach((value, i) => {
                this.assert(typeof value.mean === 'number', `Prediction ${i} has mean`);
                this.assert(typeof value.confidence.lower === 'number', `Prediction ${i} has lower bound`);
                this.assert(typeof value.confidence.upper === 'number', `Prediction ${i} has upper bound`);
            });

            analytics.destroy();
            this.record('Fallback Forecast', true);
        } catch (error) {
            this.record('Fallback Forecast', false, error.message);
        }
    }

    /**
     * Test confidence interval calculation
     */
    async testConfidenceIntervals() {
        console.log('\nTest: Confidence Intervals');

        try {
            const analytics = new PredictiveAnalytics();

            // Generate constant data
            for (let i = 0; i < 50; i++) {
                analytics.recordData('constant-model', 0.5);
            }

            // Forecast with different confidence levels
            const p90 = await analytics.forecast('constant-model', { confidence: 0.90 });
            const p95 = await analytics.forecast('constant-model', { confidence: 0.95 });
            const p99 = await analytics.forecast('constant-model', { confidence: 0.99 });

            // Higher confidence should give wider intervals
            this.assert(p90.confidence < p95.confidence, '90% CI narrower than 95%');
            this.assert(p95.confidence < p99.confidence, '95% CI narrower than 99%');

            analytics.destroy();
            this.record('Confidence Intervals', true);
        } catch (error) {
            this.record('Confidence Intervals', false, error.message);
        }
    }

    /**
     * Test statistics retrieval
     */
    async testStatistics() {
        console.log('\nTest: Statistics');

        try {
            const analytics = new PredictiveAnalytics();

            // Generate test data with known statistics
            const values = [0.2, 0.4, 0.6, 0.8, 1.0, 0.8, 0.6, 0.4, 0.2];
            values.forEach(v => analytics.recordData('stats-model', v));

            const stats = analytics.getStatistics('stats-model');

            this.assert(stats !== null, 'Statistics returned');
            this.assert(stats.dataPoints === 9, 'Correct data point count');
            this.assert(stats.min === 0.2, 'Min value correct');
            this.assert(stats.max === 1.0, 'Max value correct');
            this.assert(Math.abs(stats.mean - 0.555) < 0.01, 'Mean value approximately correct');

            analytics.destroy();
            this.record('Statistics', true);
        } catch (error) {
            this.record('Statistics', false, error.message);
        }
    }

    /**
     * Test reset functionality
     */
    async testReset() {
        console.log('\nTest: Reset');

        try {
            const analytics = new PredictiveAnalytics();

            // Add data
            for (let i = 0; i < 20; i++) {
                analytics.recordData('test-model', 0.5);
            }

            // Generate forecast to populate cache
            await analytics.forecast('test-model');

            this.assert(analytics.historyBuffer.size > 0, 'Data exists before reset');
            this.assert(analytics.predictionCache.size > 0, 'Cache exists before reset');

            // Reset with clearHistory
            analytics.reset({ clearHistory: true });

            this.assert(analytics.historyBuffer.size === 0, 'History cleared');
            this.assert(analytics.predictionCache.size === 0, 'Cache cleared');

            analytics.destroy();
            this.record('Reset', true);
        } catch (error) {
            this.record('Reset', false, error.message);
        }
    }

    /**
     * Test state export/import
     */
    async testStateExportImport() {
        console.log('\nTest: State Export/Import');

        try {
            const analytics1 = new PredictiveAnalytics();

            // Add data
            for (let i = 0; i < 20; i++) {
                analytics1.recordData('test-model', 0.5 + i * 0.01);
            }

            // Export state
            const state = analytics1.exportState();

            this.assert(state.history !== undefined, 'History exported');
            this.assert(state.history['test-model'].length === 20, 'History data exported');
            this.assert(state.timestamp !== undefined, 'Timestamp exported');

            // Create new instance and import
            const analytics2 = new PredictiveAnalytics();
            analytics2.importState(state);

            this.assert(analytics2.historyBuffer.has('test-model'), 'Model imported');
            this.assert(analytics2.historyBuffer.get('test-model').length === 20, 'History data imported');

            analytics1.destroy();
            analytics2.destroy();
            this.record('State Export/Import', true);
        } catch (error) {
            this.record('State Export/Import', false, error.message);
        }
    }

    /**
     * Test PredictionVisualizer
     */
    async testPredictionVisualizer() {
        console.log('\nTest: Prediction Visualizer');

        try {
            const visualizer = new PredictionVisualizer({
                showConfidence: true,
                showAnomalies: true
            });

            this.assert(visualizer.options.showConfidence === true, 'Confidence enabled');
            this.assert(visualizer.options.showAnomalies === true, 'Anomalies enabled');

            // Create mock predictions
            const predictions = {
                modelId: 'test-model',
                values: [
                    { step: 1, mean: 0.5, confidence: { lower: 0.4, upper: 0.6 }, isAnomaly: false },
                    { step: 2, mean: 0.6, confidence: { lower: 0.5, upper: 0.7 }, isAnomaly: true },
                    { step: 3, mean: 0.7, confidence: { lower: 0.6, upper: 0.8 }, isAnomaly: false }
                ]
            };

            // Test visualization creation (will fail gracefully without PIXI)
            const container = visualizer.create();
            this.assert(container !== null, 'Container created');

            visualizer.destroy();
            this.record('Prediction Visualizer', true);
        } catch (error) {
            this.record('Prediction Visualizer', false, error.message);
        }
    }

    /**
     * Assert helper
     */
    assert(condition, message) {
        if (!condition) {
            throw new Error(`Assertion failed: ${message}`);
        }
    }

    /**
     * Record test result
     */
    record(name, passed, error = null) {
        const result = { name, passed, error };
        this.results.push(result);

        if (passed) {
            this.passed++;
            console.log(`  ✓ ${name}`);
        } else {
            this.failed++;
            console.log(`  ✗ ${name}`);
            if (error) console.log(`    Error: ${error}`);
        }
    }

    /**
     * Print test summary
     */
    printSummary() {
        const total = this.passed + this.failed;
        console.log('\n=== Test Summary ===');
        console.log(`Total: ${total}`);
        console.log(`Passed: ${this.passed}`);
        console.log(`Failed: ${this.failed}`);
        console.log(`Success Rate: ${((this.passed / total) * 100).toFixed(1)}%`);
    }
}

// Run tests if in browser
if (typeof window !== 'undefined') {
    window.TestPredictiveAnalytics = TestPredictiveAnalytics;

    // Auto-run on page load if flag set
    if (window.location.search.includes('test=predictive')) {
        window.onload = async () => {
            const tester = new TestPredictiveAnalytics();
            await tester.runAll();
        };
    }
}

// Export for module systems
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { TestPredictiveAnalytics };
}
