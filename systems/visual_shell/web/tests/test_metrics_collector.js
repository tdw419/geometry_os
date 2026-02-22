/**
 * Geometry OS: MetricsCollector Unit Tests
 *
 * Tests the MetricsCollector class for latency measurement,
 * sync/tile tracking, and event emission.
 *
 * Usage:
 *   1. Include MetricsCollector.js and this test file in the browser.
 *   2. Run: const tester = new MetricsCollectorTester(); await tester.runAll();
 */

class MetricsCollectorTester {
    constructor() {
        this.results = [];
        this.metricsCollector = null;
    }

    /**
     * Run all tests
     */
    async runAll() {
        console.log('%c[MetricCollector Tests] Starting...', 'color: #00ffcc; font-size: 16px; font-weight: bold;');

        // Setup
        this.setup();

        // Run tests
        await this.test_latency_measure();
        await this.test_sync_count();
        await this.test_tile_count();
        await this.test_average_latency();
        await this.test_event_emission();

        // Report
        this.report();

        // Cleanup
        this.teardown();
    }

    setup() {
        this.metricsCollector = new MetricsCollector();
        this.results = [];
    }

    teardown() {
        if (this.metricsCollector) {
            this.metricsCollector.reset();
        }
    }

    /**
     * Test 1: Verify start/end latency measurement works
     */
    async test_latency_measure() {
        console.log('%c  Test: latency_measure', 'color: #ffcc00;');

        try {
            const id = 'test-measure-1';
            const t0 = this.metricsCollector.startLatencyMeasure(id);

            // Verify t0 is a number (timestamp)
            if (typeof t0 !== 'number') {
                throw new Error(`Expected t0 to be number, got ${typeof t0}`);
            }

            // Simulate some latency
            await this.sleep(10);

            const latency = this.metricsCollector.endLatencyMeasure(id, t0);

            // Verify latency is calculated
            if (typeof latency !== 'number') {
                throw new Error(`Expected latency to be number, got ${typeof latency}`);
            }

            // Verify latency is at least the time we waited
            if (latency < 10) {
                throw new Error(`Expected latency >= 10ms, got ${latency}ms`);
            }

            // Verify it was recorded
            if (this.metricsCollector.latencySamples.length !== 1) {
                throw new Error(`Expected 1 sample, got ${this.metricsCollector.latencySamples.length}`);
            }

            this.logResult('latency_measure', true, `Latency measured: ${latency.toFixed(2)}ms`);
        } catch (error) {
            this.logResult('latency_measure', false, error.message);
        }
    }

    /**
     * Test 2: Verify recordSync increments counter
     */
    async test_sync_count() {
        console.log('%c  Test: sync_count', 'color: #ffcc00;');

        try {
            // Initial count should be 0
            const initial = this.metricsCollector.getMetric('syncCount');
            if (initial !== 0) {
                throw new Error(`Expected initial syncCount 0, got ${initial}`);
            }

            // Record syncs
            this.metricsCollector.recordSync();
            this.metricsCollector.recordSync();
            this.metricsCollector.recordSync();

            const count = this.metricsCollector.getMetric('syncCount');
            if (count !== 3) {
                throw new Error(`Expected syncCount 3, got ${count}`);
            }

            this.logResult('sync_count', true, `Sync count: ${count}`);
        } catch (error) {
            this.logResult('sync_count', false, error.message);
        }
    }

    /**
     * Test 3: Verify setTileCount works
     */
    async test_tile_count() {
        console.log('%c  Test: tile_count', 'color: #ffcc00;');

        try {
            // Initial count should be 0
            const initial = this.metricsCollector.getMetric('tileCount');
            if (initial !== 0) {
                throw new Error(`Expected initial tileCount 0, got ${initial}`);
            }

            // Set tile count
            this.metricsCollector.setTileCount(42);

            const count = this.metricsCollector.getMetric('tileCount');
            if (count !== 42) {
                throw new Error(`Expected tileCount 42, got ${count}`);
            }

            // Update tile count
            this.metricsCollector.setTileCount(100);

            const updated = this.metricsCollector.getMetric('tileCount');
            if (updated !== 100) {
                throw new Error(`Expected tileCount 100, got ${updated}`);
            }

            this.logResult('tile_count', true, `Tile count set and updated correctly`);
        } catch (error) {
            this.logResult('tile_count', false, error.message);
        }
    }

    /**
     * Test 4: Verify average latency calculation
     */
    async test_average_latency() {
        console.log('%c  Test: average_latency', 'color: #ffcc00;');

        try {
            // Reset to start fresh
            this.metricsCollector.reset();

            // Record known latency values
            const values = [10, 20, 30, 40, 50];
            values.forEach(v => this.metricsCollector.recordLatency(v));

            const avg = this.metricsCollector.getAverageLatency();
            const expected = 30; // (10+20+30+40+50) / 5

            // Allow small floating point tolerance
            if (Math.abs(avg - expected) > 0.01) {
                throw new Error(`Expected avg ${expected}, got ${avg}`);
            }

            // Verify via getMetric
            const viaGet = this.metricsCollector.getMetric('avgLatency');
            if (Math.abs(viaGet - expected) > 0.01) {
                throw new Error(`Expected avgLatency ${expected}, got ${viaGet}`);
            }

            this.logResult('average_latency', true, `Average: ${avg.toFixed(2)}ms (expected: ${expected}ms)`);
        } catch (error) {
            this.logResult('average_latency', false, error.message);
        }
    }

    /**
     * Test 5: Verify metricsUpdate event fires
     */
    async test_event_emission() {
        console.log('%c  Test: event_emission', 'color: #ffcc00;');

        return new Promise((resolve) => {
            let eventReceived = false;
            let eventDetail = null;

            const listener = (e) => {
                eventReceived = true;
                eventDetail = e.detail;
                window.removeEventListener('geometryOS:metricsUpdate', listener);
            };

            window.addEventListener('geometryOS:metricsUpdate', listener);

            // Set some metrics and emit
            this.metricsCollector.recordSync();
            this.metricsCollector.setTileCount(5);
            this.metricsCollector.emitUpdate();

            // Give event loop time to process
            setTimeout(() => {
                try {
                    if (!eventReceived) {
                        this.logResult('event_emission', false, 'No event received');
                    } else if (!eventDetail) {
                        this.logResult('event_emission', false, 'Event has no detail');
                    } else if (eventDetail.syncCount !== 1) {
                        this.logResult('event_emission', false, `Expected syncCount 1, got ${eventDetail.syncCount}`);
                    } else if (eventDetail.tileCount !== 5) {
                        this.logResult('event_emission', false, `Expected tileCount 5, got ${eventDetail.tileCount}`);
                    } else if (typeof eventDetail.timestamp !== 'number') {
                        this.logResult('event_emission', false, 'Missing timestamp in event detail');
                    } else {
                        this.logResult('event_emission', true, 'Event emitted with correct metrics');
                    }
                } catch (error) {
                    this.logResult('event_emission', false, error.message);
                }
                resolve();
            }, 50);
        });
    }

    logResult(name, success, details) {
        const symbol = success ? '✅' : '❌';
        console.log(`    ${symbol} ${name}: ${details}`);
        this.results.push({ name, success, details });
    }

    report() {
        console.log('\n' + '='.repeat(50));
        console.log('%cMetricsCollector Test Report', 'color: #00ffcc; font-weight: bold;');
        console.log('='.repeat(50));

        const passed = this.results.filter(r => r.success).length;
        const total = this.results.length;
        const color = passed === total ? 'color: #00ff00' : 'color: #ff4444';

        console.log(`%cPASSED: ${passed}/${total}`, `${color}; font-weight: bold;`);

        this.results.forEach(r => {
            console.log(`  ${r.success ? '✅' : '❌'} ${r.name.padEnd(20)} | ${r.details}`);
        });

        console.log('='.repeat(50));
    }

    sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
}

// Export for Node.js testing
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { MetricsCollectorTester };
}

// Convenience auto-run message
console.log('%c[MetricsCollector Tests] Loaded. Run: const t = new MetricsCollectorTester(); await t.runAll();', 'color: #00ffcc');
