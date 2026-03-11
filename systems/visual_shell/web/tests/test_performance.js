/**
 * Performance Tests for Neural Heatmap Monitoring System
 *
 * Tests the PerformanceMonitor and PerformanceDashboard components
 * to ensure accurate FPS, memory, and render time tracking.
 *
 * Success criteria:
 * - PerformanceMonitor should track FPS, memory, render time
 * - Should emit alerts when thresholds exceeded
 * - Should maintain 1000 sample history
 * - Should provide aggregate statistics (min, max, avg, p95)
 * - Performance dashboard should display metrics correctly
 */

class PerformanceMonitoringTests extends NeuralHeatmapTests.PerformanceTest {
    constructor() {
        super('Performance Monitoring System', {
            thresholds: {
                fps: { min: 30, warning: 25 },
                frameTime: { max: 33, warning: 40 },
                renderTime: { max: 16, warning: 20 }
            }
        });
    }

    async execute() {
        // Test 1: PerformanceMonitor initialization
        await this.testMonitorInitialization();

        // Test 2: Metric tracking
        await this.testMetricTracking();

        // Test 3: Alert system
        await this.testAlertSystem();

        // Test 4: Statistics calculation
        await this.testStatisticsCalculation();

        // Test 5: Performance dashboard integration
        await this.testDashboardIntegration();
    }

    async testMonitorInitialization() {
        console.log('  Testing PerformanceMonitor initialization...');

        if (typeof PerformanceMonitor === 'undefined') {
            throw new Error('PerformanceMonitor not available');
        }

        const monitor = new PerformanceMonitor({
            sampleSize: 1000,
            alertThresholds: {
                fps: { min: 30, max: 120 },
                frameTime: { max: 33 },
                memory: { max: 500 }
            }
        });

        NeuralHeatmapTests.Assert.assertEquals(monitor.options.sampleSize, 1000, 'Sample size should be configured');
        NeuralHeatmapTests.Assert.assertEquals(monitor.history.size, 0, 'History should be empty initially');

        console.log('    ✓ PerformanceMonitor initializes correctly');
    }

    async testMetricTracking() {
        console.log('  Testing metric tracking...');

        const monitor = new PerformanceMonitor({ sampleSize: 100 });

        // Record some samples
        for (let i = 0; i < 10; i++) {
            monitor.record('fps', 60);
            monitor.record('frameTime', 16.67);
            monitor.record('renderTime', 10);
        }

        const fpsStats = monitor.getStats('fps');
        NeuralHeatmapTests.Assert.assertEquals(fpsStats.count, 10, 'Should record 10 samples');
        NeuralHeatmapTests.Assert.assertEquals(fpsStats.current, 60, 'Current value should be last recorded');

        console.log('    ✓ Metrics tracked correctly');
    }

    async testAlertSystem() {
        console.log('  Testing alert system...');

        const monitor = new PerformanceMonitor({
            sampleSize: 100,
            alertThresholds: {
                fps: { min: 30, max: 120 }
            }
        });

        let alertReceived = false;
        monitor.onAlert((alert) => {
            if (alert.metric === 'fps') {
                alertReceived = true;
            }
        });

        // Record low FPS to trigger alert
        monitor.record('fps', 20);

        NeuralHeatmapTests.Assert.assertTrue(alertReceived, 'Should receive alert for low FPS');

        console.log('    ✓ Alert system works correctly');
    }

    async testStatisticsCalculation() {
        console.log('  Testing statistics calculation...');

        const monitor = new PerformanceMonitor({ sampleSize: 100 });

        // Record known values
        const values = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
        for (const value of values) {
            monitor.record('test_metric', value);
        }

        const stats = monitor.getStats('test_metric');

        NeuralHeatmapTests.Assert.assertEquals(stats.min, 10, 'Min should be correct');
        NeuralHeatmapTests.Assert.assertEquals(stats.max, 100, 'Max should be correct');
        NeuralHeatmapTests.Assert.assertEquals(stats.avg, 55, 'Avg should be correct');
        NeuralHeatmapTests.Assert.assertTrue(stats.p50 >= 49 && stats.p50 <= 51, 'P50 should be ~50');
        NeuralHeatmapTests.Assert.assertTrue(stats.p95 >= 94 && stats.p95 <= 96, 'P95 should be ~95');

        console.log('    ✓ Statistics calculated correctly');
    }

    async testDashboardIntegration() {
        console.log('  Testing dashboard integration...');

        if (typeof PerformanceDashboard === 'undefined') {
            console.log('    ⚠ PerformanceDashboard not available, skipping');
            return;
        }

        const dashboard = new PerformanceDashboard({
            position: 'top-right',
            updateInterval: 100,
            visible: true
        });

        NeuralHeatmapTests.Assert.assertNotNull(dashboard.container, 'Dashboard should have container');
        NeuralHeatmapTests.Assert.assertEquals(dashboard.options.updateInterval, 100, 'Update interval should be configured');

        dashboard.destroy();

        console.log('    ✓ Dashboard integration works correctly');
    }
}

/**
 * Real-World Performance Test
 *
 * Tests actual performance with a simulated load to ensure
 * the system meets the 30+ FPS target.
 */
class RealWorldPerformanceTest extends NeuralHeatmapTests.PerformanceTest {
    constructor() {
        super('Real-World Performance (30+ FPS)', {
            timeout: 30000
        });
    }

    async execute() {
        console.log('  Testing real-world performance...');

        // Check if NeuralHeatmapOverlay is available
        if (typeof NeuralHeatmapOverlay === 'undefined') {
            throw new Error('NeuralHeatmapOverlay not available - integration incomplete');
        }

        // Create overlay instance
        const container = NeuralHeatmapTests.MockObjects.createMockContainer();
        const overlay = new NeuralHeatmapOverlay({
            container: container,
            gridSize: 100,
            maxTiles: 10000,
            enabled: true
        });

        // Generate mock tiles
        const tiles = NeuralHeatmapTests.TestHelpers.generateMockTileData(100);
        for (const tile of tiles) {
            overlay.attachTile(tile.id, tile);
        }

        // Measure performance over 5 seconds
        const frameTimes = [];
        const startTime = performance.now();
        const testDuration = 5000;

        while (performance.now() - startTime < testDuration) {
            const frameStart = performance.now();
            overlay.update(0.016);
            const frameTime = performance.now() - frameStart;
            frameTimes.push(frameTime);
            await NeuralHeatmapTests.TestHelpers.wait(16); // ~60 FPS target
        }

        // Calculate FPS
        const avgFrameTime = frameTimes.reduce((a, b) => a + b, 0) / frameTimes.length;
        const avgFps = 1000 / avgFrameTime;

        console.log(`    Average FPS: ${avgFps.toFixed(2)}`);
        console.log(`    Average Frame Time: ${avgFrameTime.toFixed(2)}ms`);

        // Verify against thresholds
        if (avgFps < this.thresholds.fps.min) {
            throw new Error(`FPS below threshold: ${avgFps.toFixed(2)} < ${this.thresholds.fps.min}`);
        }

        if (avgFrameTime > this.thresholds.frameTime.max) {
            throw new Error(`Frame time above threshold: ${avgFrameTime.toFixed(2)}ms > ${this.thresholds.frameTime.max}ms`);
        }

        console.log('    ✓ Real-world performance meets targets');
    }
}

/**
 * Performance Test Suite Runner
 */
async function runPerformanceTests() {
    const suite = new NeuralHeatmapTests.TestSuite('Performance Monitoring');

    suite.addTest(new PerformanceMonitoringTests());
    suite.addTest(new RealWorldPerformanceTest());

    return await suite.run();
}

// Export
if (typeof window !== 'undefined') {
    window.runPerformanceTests = runPerformanceTests;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { runPerformanceTests, PerformanceMonitoringTests, RealWorldPerformanceTest };
}
