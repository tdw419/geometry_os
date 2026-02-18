/**
 * Test AnomalyDetector.js
 *
 * Tests the anomaly detection functionality including:
 * * - Z-score anomaly detection
 * - Spatial isolation detection
 * - Temporal anomaly detection
 * - Burst detection
 * - Baseline management
 * - Statistics and reporting
 * - Export/import capabilities
 * - Performance benchmarks
 */

// Test configuration
const TEST_ANOMALY_CONFIG = {
    zScoreThreshold: 3.0,
    minSamples: 30,
    clusterSize: 5,
    isolationRadius: 50,
    anomalyHistorySize: 100
};

// Mock activity data generator
class MockActivityGenerator {
    /**
     * Generate mock activity data with normal distribution
     * @param {number} count - Number of activities to generate
     * @param {number} mean - Mean intensity
     * @param {number} stdDev - Standard deviation
     * @returns {Array} Mock activities
     */
    static generateNormal(count, mean = 0.5, stdDev = 0.1) {
        const activities = [];
        for (let i = 0; i < count; i++) {
            // Box-Muller transform for normal distribution
            const u1 = Math.random();
            const u2 = Math.random();
            const z = Math.sqrt(-2.0 * Math.log(u1)) * Math.cos(2.0 * Math.PI * u2);
            const intensity = mean + z * stdDev;
            activities.push({
                intensity: Math.max(0, Math.min(1, intensity)),
                location: {
                    x: Math.random() * 1000,
                    y: Math.random() * 1000
                },
                timestamp: Date.now() + i * 10
            });
        }
        return activities;
    }

    /**
     * Generate activities with anomalies
     * @param {number} normalCount - Number of normal activities
     * @param {number} anomalyCount - Number of anomalous activities
     * @returns {Array} Activities with anomalies
     */
    static generateWithAnomalies(normalCount = 50, anomalyCount = 5) {
        const activities = this.generateNormal(normalCount, 0.5, 0.1);

        // Add high intensity anomalies
        for (let i = 0; i < anomalyCount; i++) {
            activities.push({
                intensity: 0.95 + Math.random() * 0.05,
                location: {
                    x: Math.random() * 1000,
                    y: Math.random() * 1000
                },
                timestamp: Date.now() + (normalCount + i) * 10
            });
        }

        return activities;
    }

    /**
     * Generate spatially isolated activities
     * @param {number} clusterCount - Number of clustered activities
     * @param {number} isolatedCount - Number of isolated activities
     * @returns {Array} Activities with spatial isolation
     */
    static generateSpatialAnomalies(clusterCount = 20, isolatedCount = 3) {
        const activities = [];

        // Generate cluster around center
        const centerX = 500;
        const centerY = 500;
        for (let i = 0; i < clusterCount; i++) {
            activities.push({
                intensity: 0.6 + Math.random() * 0.2,
                location: {
                    x: centerX + (Math.random() - 0.5) * 50,
                    y: centerY + (Math.random() - 0.5) * 50
                },
                timestamp: Date.now() + i * 10
            });
        }

        // Generate isolated high-intensity activities
        for (let i = 0; i < isolatedCount; i++) {
            activities.push({
                intensity: 0.8 + Math.random() * 0.2,
                location: {
                    x: Math.random() * 1000,
                    y: Math.random() * 1000
                },
                timestamp: Date.now() + (clusterCount + i) * 10
            });
        }

        return activities;
    }

    /**
     * Generate burst pattern activities
     * @param {number} burstSize - Number of events in burst
     * @param {number} burstWindow - Time window in ms
     * @returns {Array} Activities with burst pattern
     */
    static generateBurst(burstSize = 15, burstWindow = 200) {
        const activities = [];
        const baseTime = Date.now();

        // Generate burst
        for (let i = 0; i < burstSize; i++) {
            activities.push({
                intensity: 0.7 + Math.random() * 0.2,
                location: {
                    x: Math.random() * 1000,
                    y: Math.random() * 1000
                },
                timestamp: baseTime + Math.random() * burstWindow
            });
        }

        // Add some sparse events
        for (let i = 0; i < 5; i++) {
            activities.push({
                intensity: 0.4 + Math.random() * 0.2,
                location: {
                    x: Math.random() * 1000,
                    y: Math.random() * 1000
                },
                timestamp: baseTime + burstWindow + i * 1000
            });
        }

        return activities;
    }
}

// Test suite
class AnomalyDetectorTestSuite {
    constructor() {
        this.passed = 0;
        this.failed = 0;
        this.tests = [];
    }

    async runAllTests() {
        console.log('\n========================================');
        console.log('  AnomalyDetector Test Suite');
        console.log('========================================\n');

        await this.testBaselineUpdate();
        await this.testZScoreDetection();
        await this.testSpatialIsolationDetection();
        await this.testTemporalAnomalyDetection();
        await this.testBurstDetection();
        await this.testAnomalySummary();
        await this.testBaselineManagement();
        await this.testPerformance();

        this.printSummary();
    }

    async testBaselineUpdate() {
        console.log('Test 1: Baseline Update');
        console.log('-----------------------');

        try {
            const detector = new AnomalyDetector(TEST_ANOMALY_CONFIG);
            const activities = MockActivityGenerator.generateNormal(50, 0.5, 0.1);

            // Update baseline
            const success = detector.updateBaseline('test-model', activities);

            if (success) {
                console.log('✓ Baseline updated successfully');
            } else {
                throw new Error('Baseline update failed');
            }

            // Verify baseline values
            const baseline = detector.getBaseline('test-model');
            if (baseline && baseline.mean > 0 && baseline.stdDev > 0) {
                console.log(`✓ Baseline mean: ${baseline.mean.toFixed(3)}`);
                console.log(`✓ Baseline stdDev: ${baseline.stdDev.toFixed(3)}`);
                console.log(`✓ Baseline sample count: ${baseline.sampleCount}`);
            } else {
                throw new Error('Invalid baseline data');
            }

            // Test force update with fewer samples
            const smallActivities = MockActivityGenerator.generateNormal(5, 0.5, 0.1);
            const forceSuccess = detector.updateBaseline('test-model-force', smallActivities, true);

            if (forceSuccess) {
                console.log('✓ Force update with few samples works');
            }

            this.recordTest('Baseline Update', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Baseline Update', false);
        }

        console.log();
    }

    async testZScoreDetection() {
        console.log('Test 2: Z-Score Anomaly Detection');
        console.log('---------------------------------');

        try {
            const detector = new AnomalyDetector(TEST_ANOMALY_CONFIG);

            // Establish baseline
            const baselineActivities = MockActivityGenerator.generateNormal(50, 0.5, 0.1);
            detector.updateBaseline('test-model', baselineActivities);

            // Generate activities with anomalies
            const testActivities = MockActivityGenerator.generateWithAnomalies(30, 5);

            // Detect z-score anomalies
            const zScoreAnomalies = detector.detectZScoreAnomalies('test-model', testActivities);

            console.log(`✓ Detected ${zScoreAnomalies.length} z-score anomalies`);

            if (zScoreAnomalies.length > 0) {
                const anomaly = zScoreAnomalies[0];
                console.log(`✓ Anomaly ID: ${anomaly.id}`);
                console.log(`✓ Anomaly z-score: ${anomaly.zScore.toFixed(2)}`);
                console.log(`✓ Anomaly severity: ${anomaly.severity}`);
                console.log(`✓ Anomaly has description: ${!!anomaly.description}`);
            }

            // Verify anomaly structure
            const validStructure = zScoreAnomalies.every(a =>
                a.type === 'z_score' &&
                a.id &&
                a.intensity !== undefined &&
                a.zScore !== undefined &&
                a.severity
            );

            if (validStructure) {
                console.log('✓ All anomalies have valid structure');
            } else {
                throw new Error('Invalid anomaly structure');
            }

            // Test with no baseline
            const noBaselineAnomalies = detector.detectZScoreAnomalies('unknown-model', testActivities);
            if (noBaselineAnomalies.length === 0) {
                console.log('✓ Returns empty array for unknown model');
            } else {
                throw new Error('Should return empty for unknown model');
            }

            this.recordTest('Z-Score Anomaly Detection', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Z-Score Anomaly Detection', false);
        }

        console.log();
    }

    async testSpatialIsolationDetection() {
        console.log('Test 3: Spatial Isolation Detection');
        console.log('------------------------------------');

        try {
            const detector = new AnomalyDetector(TEST_ANOMALY_CONFIG);

            // Generate spatial anomalies
            const activities = MockActivityGenerator.generateSpatialAnomalies(20, 3);

            // Detect spatial anomalies
            const spatialAnomalies = detector.detectSpatialAnomalies(activities);

            console.log(`✓ Detected ${spatialAnomalies.length} spatial anomalies`);

            if (spatialAnomalies.length > 0) {
                const anomaly = spatialAnomalies[0];
                console.log(`✓ Anomaly type: ${anomaly.type}`);
                console.log(`✓ Nearby count: ${anomaly.nearbyCount}`);
                console.log(`✓ Isolation radius: ${anomaly.isolationRadius}`);
                console.log(`✓ Anomaly severity: ${anomaly.severity}`);
            }

            // Verify anomaly structure
            const validStructure = spatialAnomalies.every(a =>
                a.type === 'spatial_isolation' &&
                a.id &&
                a.intensity !== undefined &&
                a.location &&
                a.nearbyCount !== undefined
            );

            if (validStructure) {
                console.log('✓ All spatial anomalies have valid structure');
            }

            this.recordTest('Spatial Isolation Detection', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Spatial Isolation Detection', false);
        }

        console.log();
    }

    async testTemporalAnomalyDetection() {
        console.log('Test 4: Temporal Anomaly Detection');
        console.log('-----------------------------------');

        try {
            const detector = new AnomalyDetector(TEST_ANOMALY_CONFIG);

            // Generate activities with irregular timing
            const activities = [];
            const baseTime = Date.now();
            let currentTime = baseTime;

            // Regular intervals
            for (let i = 0; i < 10; i++) {
                activities.push({
                    intensity: 0.5,
                    location: { x: i * 10, y: i * 10 },
                    timestamp: currentTime
                });
                currentTime += 50; // 50ms intervals
            }

            // Add anomaly: long pause
            currentTime += 500; // 500ms gap
            activities.push({
                intensity: 0.5,
                location: { x: 100, y: 100 },
                timestamp: currentTime
            });

            // Add anomaly: rapid succession
            currentTime += 5; // 5ms gap
            activities.push({
                intensity: 0.5,
                location: { x: 110, y: 110 },
                timestamp: currentTime
            });

            // Detect temporal anomalies
            const temporalAnomalies = detector.detectTemporalAnomalies('test-model', activities);

            console.log(`✓ Detected ${temporalAnomalies.length} temporal anomalies`);

            if (temporalAnomalies.length > 0) {
                const anomaly = temporalAnomalies[0];
                console.log(`✓ Anomaly type: ${anomaly.type}`);
                console.log(`✓ Interval: ${anomaly.interval.toFixed(0)}ms`);
                console.log(`✓ Z-score: ${anomaly.zScore.toFixed(2)}`);
                console.log(`✓ Expected range: [${anomaly.expectedRange[0].toFixed(0)}, ${anomaly.expectedRange[1].toFixed(0)}]`);
                console.log(`✓ Anomaly severity: ${anomaly.severity}`);
            }

            // Test with insufficient data
            const fewActivities = activities.slice(0, 2);
            const fewAnomalies = detector.detectTemporalAnomalies('test-model', fewActivities);

            if (fewAnomalies.length === 0) {
                console.log('✓ Returns empty array for insufficient data');
            }

            this.recordTest('Temporal Anomaly Detection', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Temporal Anomaly Detection', false);
        }

        console.log();
    }

    async testBurstDetection() {
        console.log('Test 5: Burst Detection');
        console.log('-----------------------');

        try {
            const detector = new AnomalyDetector(TEST_ANOMALY_CONFIG);

            // Generate burst pattern
            const activities = MockActivityGenerator.generateBurst(15, 200);

            // Detect bursts
            const bursts = detector.detectBursts('test-model', activities, 500, 10);

            console.log(`✓ Detected ${bursts.length} bursts`);

            if (bursts.length > 0) {
                const burst = bursts[0];
                console.log(`✓ Burst type: ${burst.type}`);
                console.log(`✓ Event count: ${burst.eventCount}`);
                console.log(`✓ Time span: ${burst.timeSpan.toFixed(0)}ms`);
                console.log(`✓ Events per second: ${burst.eventsPerSecond.toFixed(0)}`);
                console.log(`✓ Average intensity: ${burst.avgIntensity.toFixed(3)}`);
                console.log(`✓ Burst severity: ${burst.severity}`);
            }

            // Verify burst structure
            const validStructure = bursts.every(b =>
                b.type === 'burst' &&
                b.id &&
                b.eventCount !== undefined &&
                b.timeSpan !== undefined &&
                b.eventsPerSecond !== undefined
            );

            if (validStructure) {
                console.log('✓ All bursts have valid structure');
            }

            // Test with insufficient events
            const fewActivities = activities.slice(0, 5);
            const fewBursts = detector.detectBursts('test-model', fewActivities);

            if (fewBursts.length === 0) {
                console.log('✓ Returns empty array for insufficient events');
            }

            this.recordTest('Burst Detection', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Burst Detection', false);
        }

        console.log();
    }

    async testAnomalySummary() {
        console.log('Test 6: Anomaly Summary');
        console.log('-----------------------');

        try {
            const detector = new AnomalyDetector(TEST_ANOMALY_CONFIG);

            // Establish baseline
            const baselineActivities = MockActivityGenerator.generateNormal(50, 0.5, 0.1);
            detector.updateBaseline('model-a', baselineActivities);
            detector.updateBaseline('model-b', baselineActivities);

            // Generate various anomaly types
            const zScoreActivities = MockActivityGenerator.generateWithAnomalies(20, 3);
            detector.detectZScoreAnomalies('model-a', zScoreActivities);

            const spatialActivities = MockActivityGenerator.generateSpatialAnomalies(15, 2);
            detector.detectSpatialAnomalies(spatialActivities);

            const burstActivities = MockActivityGenerator.generateBurst(12, 150);
            detector.detectBursts('model-a', burstActivities);

            // Get summary
            const summary = detector.getAnomalySummary();

            console.log(`✓ Total anomalies: ${summary.totalAnomalies}`);
            console.log(`✓ By type:`, JSON.stringify(summary.byType, null, 2));
            console.log(`✓ By model:`, JSON.stringify(summary.byModel, null, 2));
            console.log(`✓ By severity:`, JSON.stringify(summary.bySeverity, null, 2));

            if (summary.totalAnomalies > 0) {
                console.log(`✓ Recent anomalies count: ${summary.recent.length}`);
            }

            // Verify structure
            if (summary.byModel && summary.byType && summary.bySeverity) {
                console.log('✓ Summary structure is valid');
            } else {
                throw new Error('Invalid summary structure');
            }

            // Test getAnomaliesForModel
            const modelAnomalies = detector.getAnomaliesForModel('model-a', 10);
            console.log(`✓ Anomalies for model-a: ${modelAnomalies.length}`);

            this.recordTest('Anomaly Summary', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Anomaly Summary', false);
        }

        console.log();
    }

    async testBaselineManagement() {
        console.log('Test 7: Baseline Management');
        console.log('---------------------------');

        try {
            const detector = new AnomalyDetector(TEST_ANOMALY_CONFIG);

            // Create multiple baselines
            const activities = MockActivityGenerator.generateNormal(50, 0.5, 0.1);
            detector.updateBaseline('model-1', activities);
            detector.updateBaseline('model-2', activities);
            detector.updateBaseline('model-3', activities);

            // Get all baselines
            const allBaselines = detector.getAllBaselines();
            const modelIds = Object.keys(allBaselines);

            console.log(`✓ Baseline count: ${modelIds.length}`);
            console.log(`✓ Model IDs: ${modelIds.join(', ')}`);

            if (modelIds.length !== 3) {
                throw new Error('Expected 3 baselines');
            }

            // Test clearBaselines
            detector.clearBaselines();
            const clearedBaselines = detector.getAllBaselines();

            if (Object.keys(clearedBaselines).length === 0) {
                console.log('✓ All baselines cleared');
            } else {
                throw new Error('Baselines not cleared properly');
            }

            // Test clearAnomalies
            detector.updateBaseline('model-test', activities);
            const testActivities = MockActivityGenerator.generateWithAnomalies(20, 2);
            detector.detectZScoreAnomalies('model-test', testActivities);

            const summaryBefore = detector.getAnomalySummary();
            console.log(`✓ Anomalies before clear: ${summaryBefore.totalAnomalies}`);

            detector.clearAnomalies('z_score');
            const summaryAfter = detector.getAnomalySummary();
            console.log(`✓ Anomalies after clear z_score: ${summaryAfter.totalAnomalies}`);

            // Test reset
            detector.reset();
            const stats = detector.getStats();
            if (stats.modelCount === 0 && stats.recentAnomalyCount === 0) {
                console.log('✓ Reset clears all data');
            } else {
                throw new Error('Reset did not clear all data');
            }

            this.recordTest('Baseline Management', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Baseline Management', false);
        }

        console.log();
    }

    async testPerformance() {
        console.log('Test 8: Performance Benchmark');
        console.log('-------------------------------');

        try {
            const detector = new AnomalyDetector(TEST_ANOMALY_CONFIG);

            // Baseline update performance
            const baselineActivities = MockActivityGenerator.generateNormal(1000, 0.5, 0.1);
            const baselineStart = performance.now();
            detector.updateBaseline('perf-model', baselineActivities);
            const baselineTime = performance.now() - baselineStart;
            console.log(`✓ Baseline update (1000 samples): ${baselineTime.toFixed(2)}ms`);

            // Z-score detection performance
            const testActivities = MockActivityGenerator.generateWithAnomalies(500, 20);
            const zScoreStart = performance.now();
            const zScoreAnomalies = detector.detectZScoreAnomalies('perf-model', testActivities);
            const zScoreTime = performance.now() - zScoreStart;
            console.log(`✓ Z-score detection (500 samples): ${zScoreTime.toFixed(2)}ms`);

            // Spatial detection performance
            const spatialStart = performance.now();
            const spatialAnomalies = detector.detectSpatialAnomalies(testActivities);
            const spatialTime = performance.now() - spatialStart;
            console.log(`✓ Spatial detection (500 samples): ${spatialTime.toFixed(2)}ms`);

            // Burst detection performance
            const burstActivities = MockActivityGenerator.generateBurst(100, 300);
            const burstStart = performance.now();
            const bursts = detector.detectBursts('perf-model', burstActivities);
            const burstTime = performance.now() - burstStart;
            console.log(`✓ Burst detection (100 samples): ${burstTime.toFixed(2)}ms`);

            // Full detection pipeline performance
            const fullActivities = MockActivityGenerator.generateWithAnomalies(500, 15);
            const fullStart = performance.now();
            detector.detectAnomalies('perf-model', fullActivities);
            const fullTime = performance.now() - fullStart;
            console.log(`✓ Full detection pipeline (500 samples): ${fullTime.toFixed(2)}ms`);

            // Summary performance
            const summaryStart = performance.now();
            const summary = detector.getAnomalySummary();
            const summaryTime = performance.now() - summaryStart;
            console.log(`✓ Summary generation: ${summaryTime.toFixed(2)}ms`);

            const totalTime = baselineTime + zScoreTime + spatialTime + burstTime + fullTime + summaryTime;
            console.log(`✓ Total time: ${totalTime.toFixed(2)}ms`);

            if (fullTime < 50) {
                console.log('✓ Performance target met (<50ms for full detection)');
            } else {
                console.warn(`⚠ Performance target not met (target: <50ms, actual: ${fullTime.toFixed(2)}ms)`);
            }

            // Get stats
            const stats = detector.getStats();
            console.log(`✓ Stats - Model count: ${stats.modelCount}, Anomalies: ${stats.recentAnomalyCount}`);

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
    module.exports = { AnomalyDetectorTestSuite, MockActivityGenerator };
}

// Auto-run in browser
if (typeof window !== 'undefined') {
    window.AnomalyDetectorTestSuite = AnomalyDetectorTestSuite;
    window.MockActivityGenerator = MockActivityGenerator;

    // Run tests after page load
    window.addEventListener('load', () => {
        const suite = new AnomalyDetectorTestSuite();
        suite.runAllTests();
    });
}
