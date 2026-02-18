/**
 * Test TemporalAnalyzer.js
 *
 * Tests the temporal pattern detection functionality including:
 * - Event recording and storage
 * - Periodic pattern detection
 * - Trend detection
 * - State change detection
 * - Burst detection
 * - Performance benchmarks
 * - Integration with other components
 */

// Test configuration
const TEST_TEMPORAL_CONFIG = {
    historySize: 1000,
    minPatternLength: 10,
    autocorrLag: 100,
    stateChangeThreshold: 0.5
};

// Test suite
class TemporalAnalyzerTestSuite {
    constructor() {
        this.passed = 0;
        this.failed = 0;
        this.tests = [];
    }

    async runAllTests() {
        console.log('\n========================================');
        console.log('  TemporalAnalyzer Test Suite');
        console.log('========================================\n');

        await this.testEventRecording();
        await this.testPeriodicPatternDetection();
        await this.testTrendDetection();
        await this.testStateChangeDetection();
        await this.testBurstDetection();
        await this.testTimeWindows();
        await this.testCompleteAnalysis();
        await this.testPerformance();

        this.printSummary();
    }

    async testEventRecording() {
        console.log('Test 1: Event Recording');
        console.log('------------------------');

        try {
            const analyzer = new TemporalAnalyzer(TEST_TEMPORAL_CONFIG);

            // Test single event recording
            analyzer.recordEvent('model1', 0.5, { x: 100, y: 200 }, 'layer1', 1000);
            analyzer.recordEvent('model1', 0.7, { x: 150, y: 250 }, 'layer2', 2000);

            const stats = analyzer.getStats();
            console.log(`✓ Recorded ${stats.totalEvents} events`);

            if (stats.totalEvents === 2) {
                console.log(`✓ Event count matches expected`);
            } else {
                throw new Error(`Expected 2 events, got ${stats.totalEvents}`);
            }

            // Test batch recording
            const batch = [
                { modelId: 'model2', intensity: 0.3, location: { x: 50, y: 50 }, layer: 'layer1', timestamp: 3000 },
                { modelId: 'model2', intensity: 0.8, location: { x: 75, y: 75 }, layer: 'layer2', timestamp: 4000 }
            ];
            analyzer.recordBatch(batch);

            const stats2 = analyzer.getStats();
            console.log(`✓ Batch recorded, total events: ${stats2.totalEvents}`);

            if (stats2.totalEvents === 4) {
                console.log(`✓ Batch recording successful`);
            } else {
                throw new Error(`Expected 4 events after batch, got ${stats2.totalEvents}`);
            }

            // Test model tracking
            const modelIds = analyzer.getModelIds();
            console.log(`✓ Tracked models: ${modelIds.length}`);

            if (modelIds.length === 2 && modelIds.includes('model1') && modelIds.includes('model2')) {
                console.log(`✓ Model tracking verified`);
            } else {
                throw new Error('Model tracking incorrect');
            }

            this.recordTest('Event Recording', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Event Recording', false);
        }

        console.log();
    }

    async testPeriodicPatternDetection() {
        console.log('Test 2: Periodic Pattern Detection');
        console.log('-----------------------------------');

        try {
            const analyzer = new TemporalAnalyzer(TEST_TEMPORAL_CONFIG);

            // Generate periodic data (sine wave pattern)
            const now = performance.now();
            for (let i = 0; i < 100; i++) {
                const intensity = 0.5 + 0.3 * Math.sin(2 * Math.PI * i / 20); // Period of 20
                analyzer.recordEvent('periodic_model', intensity, { x: i, y: i }, 'layer1', now + i * 10);
            }

            const patterns = analyzer.detectPeriodicPatterns('periodic_model');
            console.log(`✓ Detected ${patterns.length} periodic patterns`);

            if (patterns.length > 0) {
                console.log(`✓ Top pattern: period=${patterns[0].period}, confidence=${patterns[0].confidence.toFixed(2)}`);

                // Verify pattern structure
                if (patterns[0].type === 'periodic' && patterns[0].period > 0) {
                    console.log(`✓ Pattern structure verified`);
                } else {
                    throw new Error('Invalid pattern structure');
                }
            }

            // Test with insufficient data
            const emptyPatterns = analyzer.detectPeriodicPatterns('nonexistent_model');
            if (emptyPatterns.length === 0) {
                console.log(`✓ Correctly returns empty array for non-existent model`);
            } else {
                throw new Error('Should return empty array for non-existent model');
            }

            this.recordTest('Periodic Pattern Detection', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Periodic Pattern Detection', false);
        }

        console.log();
    }

    async testTrendDetection() {
        console.log('Test 3: Trend Detection');
        console.log('-----------------------');

        try {
            const analyzer = new TemporalAnalyzer(TEST_TEMPORAL_CONFIG);

            // Generate increasing trend data
            const now = performance.now();
            for (let i = 0; i < 50; i++) {
                const intensity = 0.1 + (i / 50) * 0.8; // Linear increase
                analyzer.recordEvent('trend_model', intensity, { x: i, y: i }, 'layer1', now + i * 10);
            }

            const trends = analyzer.detectTrends('trend_model');
            console.log(`✓ Detected ${trends.length} trend(s)`);

            if (trends.length > 0) {
                console.log(`✓ Trend direction: ${trends[0].direction}, slope: ${trends[0].slope.toFixed(4)}`);

                if (trends[0].direction === 'increasing' && trends[0].slope > 0) {
                    console.log(`✓ Correctly identified increasing trend`);
                } else {
                    throw new Error('Failed to identify increasing trend');
                }
            }

            // Test with decreasing trend
            const analyzer2 = new TemporalAnalyzer(TEST_TEMPORAL_CONFIG);
            for (let i = 0; i < 50; i++) {
                const intensity = 0.9 - (i / 50) * 0.8; // Linear decrease
                analyzer2.recordEvent('trend_model2', intensity, { x: i, y: i }, 'layer1', now + i * 10);
            }

            const decreasingTrends = analyzer2.detectTrends('trend_model2');
            if (decreasingTrends.length > 0 && decreasingTrends[0].direction === 'decreasing') {
                console.log(`✓ Correctly identified decreasing trend`);
            }

            this.recordTest('Trend Detection', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Trend Detection', false);
        }

        console.log();
    }

    async testStateChangeDetection() {
        console.log('Test 4: State Change Detection');
        console.log('--------------------------------');

        try {
            const analyzer = new TemporalAnalyzer({
                ...TEST_TEMPORAL_CONFIG,
                stateChangeThreshold: 0.3
            });

            const now = performance.now();
            const intensities = [0.1, 0.15, 0.12, 0.8, 0.85, 0.9, 0.2, 0.25, 0.18]; // Two state changes

            for (let i = 0; i < intensities.length; i++) {
                analyzer.recordEvent('state_model', intensities[i], { x: i, y: i }, 'layer1', now + i * 10);
            }

            const changes = analyzer.detectStateChanges('state_model');
            console.log(`✓ Detected ${changes.length} state changes`);

            if (changes.length >= 2) {
                console.log(`✓ First change: ${changes[0].direction}, magnitude: ${changes[0].magnitude.toFixed(2)}`);
                console.log(`✓ Second change: ${changes[1].direction}, magnitude: ${changes[1].magnitude.toFixed(2)}`);

                // Verify state change structure
                if (changes[0].type === 'state_change' && changes[0].delta !== undefined) {
                    console.log(`✓ State change structure verified`);
                } else {
                    throw new Error('Invalid state change structure');
                }
            }

            // Test custom threshold
            const changesHighThreshold = analyzer.detectStateChanges('state_model', 1.0);
            console.log(`✓ High threshold (1.0): ${changesHighThreshold.length} changes`);

            this.recordTest('State Change Detection', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('State Change Detection', false);
        }

        console.log();
    }

    async testBurstDetection() {
        console.log('Test 5: Burst Detection');
        console.log('-----------------------');

        try {
            const analyzer = new TemporalAnalyzer(TEST_TEMPORAL_CONFIG);

            const now = performance.now();

            // Generate baseline activity
            for (let i = 0; i < 20; i++) {
                analyzer.recordEvent('burst_model', 0.2, { x: i, y: i }, 'layer1', now + i * 10);
            }

            // Generate burst (high intensity events)
            for (let i = 20; i < 30; i++) {
                analyzer.recordEvent('burst_model', 0.8, { x: i, y: i }, 'layer1', now + i * 10);
            }

            // More baseline
            for (let i = 30; i < 40; i++) {
                analyzer.recordEvent('burst_model', 0.2, { x: i, y: i }, 'layer1', now + i * 10);
            }

            const bursts = analyzer.detectBursts('burst_model', 500, 0.5);
            console.log(`✓ Detected ${bursts.length} burst(s)`);

            if (bursts.length > 0) {
                console.log(`✓ Burst duration: ${bursts[0].duration.toFixed(0)}ms, events: ${bursts[0].eventCount}`);

                // Verify burst structure
                if (bursts[0].type === 'burst' && bursts[0].avgIntensity > 0.5) {
                    console.log(`✓ Burst structure verified`);
                } else {
                    throw new Error('Invalid burst structure');
                }
            }

            // Test with non-existent model
            const noBursts = analyzer.detectBursts('nonexistent_model');
            if (noBursts.length === 0) {
                console.log(`✓ Correctly returns empty array for non-existent model`);
            }

            this.recordTest('Burst Detection', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Burst Detection', false);
        }

        console.log();
    }

    async testTimeWindows() {
        console.log('Test 6: Time Window Analysis');
        console.log('-----------------------------');

        try {
            const analyzer = new TemporalAnalyzer(TEST_TEMPORAL_CONFIG);

            const now = performance.now();

            // Generate 250 events
            for (let i = 0; i < 250; i++) {
                const intensity = 0.3 + 0.4 * Math.random();
                analyzer.recordEvent('window_model', intensity, { x: i, y: i }, 'layer1', now + i * 10);
            }

            const windows = analyzer.getTimeWindows('window_model', 100);
            console.log(`✓ Created ${windows.length} time windows`);

            if (windows.length >= 2) {
                console.log(`✓ First window: ${windows[0].eventCount} events, avg intensity: ${windows[0].avgIntensity.toFixed(2)}`);
                console.log(`✓ Second window: ${windows[1].eventCount} events, avg intensity: ${windows[1].avgIntensity.toFixed(2)}`);

                // Verify window structure
                if (windows[0].index === 0 && windows[0].eventCount === 100) {
                    console.log(`✓ Window structure verified`);
                } else {
                    throw new Error('Invalid window structure');
                }
            }

            // Test with non-existent model
            const noWindows = analyzer.getTimeWindows('nonexistent_model');
            if (noWindows.length === 0) {
                console.log(`✓ Correctly returns empty array for non-existent model`);
            }

            this.recordTest('Time Window Analysis', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Time Window Analysis', false);
        }

        console.log();
    }

    async testCompleteAnalysis() {
        console.log('Test 7: Complete Model Analysis');
        console.log('---------------------------------');

        try {
            const analyzer = new TemporalAnalyzer(TEST_TEMPORAL_CONFIG);

            const now = performance.now();

            // Generate mixed data: periodic + trend + bursts
            for (let i = 0; i < 200; i++) {
                const periodic = 0.3 * Math.sin(2 * Math.PI * i / 20);
                const trend = 0.002 * i;
                const noise = 0.1 * Math.random();
                const intensity = 0.5 + periodic + trend + noise;

                analyzer.recordEvent('complete_model', Math.max(0, Math.min(1, intensity)), { x: i, y: i }, 'layer1', now + i * 10);
            }

            const analysis = analyzer.analyzeModel('complete_model');
            console.log(`✓ Complete analysis generated`);

            // Verify analysis structure
            if (analysis.modelId === 'complete_model' &&
                Array.isArray(analysis.periodic) &&
                Array.isArray(analysis.trends) &&
                Array.isArray(analysis.stateChanges) &&
                Array.isArray(analysis.bursts) &&
                Array.isArray(analysis.timeWindows) &&
                analysis.summary !== null) {
                console.log(`✓ Analysis structure verified`);
            } else {
                throw new Error('Invalid analysis structure');
            }

            console.log(`✓ Periodic patterns: ${analysis.periodic.length}`);
            console.log(`✓ Trends: ${analysis.trends.length}`);
            console.log(`✓ State changes: ${analysis.stateChanges.length}`);
            console.log(`✓ Bursts: ${analysis.bursts.length}`);
            console.log(`✓ Time windows: ${analysis.timeWindows.length}`);

            if (analysis.summary) {
                console.log(`✓ Summary - events: ${analysis.summary.totalEvents}, avg intensity: ${analysis.summary.avgIntensity.toFixed(2)}`);
            }

            this.recordTest('Complete Model Analysis', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Complete Model Analysis', false);
        }

        console.log();
    }

    async testPerformance() {
        console.log('Test 8: Performance Benchmark');
        console.log('-------------------------------');

        try {
            const analyzer = new TemporalAnalyzer(TEST_TEMPORAL_CONFIG);

            // Test with 10,000 events
            console.log('Testing with 10,000 events...');
            const now = performance.now();

            // Benchmark event recording
            const recordStart = performance.now();
            for (let i = 0; i < 10000; i++) {
                const intensity = 0.3 + 0.4 * Math.random();
                analyzer.recordEvent('perf_model', intensity, { x: i % 100, y: Math.floor(i / 100) }, 'layer1', now + i);
            }
            const recordTime = performance.now() - recordStart;
            console.log(`✓ Event recording: ${recordTime.toFixed(2)}ms (${(10000 / recordTime * 1000).toFixed(0)} events/sec)`);

            // Benchmark complete analysis
            const analysisStart = performance.now();
            const analysis = analyzer.analyzeModel('perf_model');
            const analysisTime = performance.now() - analysisStart;
            console.log(`✓ Complete analysis: ${analysisTime.toFixed(2)}ms`);

            const totalTime = recordTime + analysisTime;
            console.log(`✓ Total time: ${totalTime.toFixed(2)}ms`);

            // Get stats
            const stats = analyzer.getStats();
            console.log(`✓ Total events: ${stats.totalEvents}`);
            console.log(`✓ Models tracked: ${stats.modelCount}`);

            // Performance targets
            if (recordTime < 100) {
                console.log(`✓ Recording performance target met (<100ms)`);
            } else {
                console.warn(`⚠ Recording performance target not met (target: <100ms, actual: ${recordTime.toFixed(2)}ms)`);
            }

            if (analysisTime < 50) {
                console.log(`✓ Analysis performance target met (<50ms)`);
            } else {
                console.warn(`⚠ Analysis performance target not met (target: <50ms, actual: ${analysisTime.toFixed(2)}ms)`);
            }

            // Test clear functionality
            const clearStart = performance.now();
            analyzer.clear();
            const clearTime = performance.now() - clearStart;
            console.log(`✓ Clear operation: ${clearTime.toFixed(2)}ms`);

            const statsAfterClear = analyzer.getStats();
            if (statsAfterClear.totalEvents === 0 && statsAfterClear.modelCount === 0) {
                console.log(`✓ Clear operation verified`);
            } else {
                throw new Error('Clear operation failed');
            }

            this.recordTest('Performance Benchmark', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Performance Benchmark', false);
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
            console.log('✓ All tests passed!');
        } else {
            console.log('✗ Some tests failed. See details above.');
        }
    }
}

// Run tests if in Node.js environment
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { TemporalAnalyzerTestSuite };
}

// Auto-run in browser
if (typeof window !== 'undefined') {
    window.TemporalAnalyzerTestSuite = TemporalAnalyzerTestSuite;

    // Run tests after page load
    window.addEventListener('load', () => {
        const suite = new TemporalAnalyzerTestSuite();
        suite.runAllTests();
    });
}
