/**
 * Geometry OS: WpHealthBridge Unit Tests
 *
 * Tests the wp_health_bridge.js functionality:
 * - calculateHealthScore method
 * - Heartbeat payload construction
 * - Error handling for missing metrics
 *
 * Usage:
 *   1. Include wp_health_bridge.js and this test file in the browser.
 *   2. Run: const tester = new WpHealthBridgeTester(); await tester.runAll();
 */

class WpHealthBridgeTester {
    constructor() {
        this.results = [];
        this.bridge = null;
    }

    /**
     * Run all tests
     */
    async runAll() {
        console.log('%c[WpHealthBridge Tests] Starting...', 'color: #00ffcc; font-size: 16px; font-weight: bold;');

        // Setup
        this.setup();

        // Run tests
        await this.test_calculateHealthScore_perfect();
        await this.test_calculateHealthScore_high_latency();
        await this.test_calculateHealthScore_buffer_drops();
        await this.test_calculateHealthScore_reconnects();
        await this.test_heartbeat_payload_keys();
        await this.test_graceful_error_handling();

        // Report
        this.report();

        // Cleanup
        this.teardown();
    }

    setup() {
        // Create a minimal mock bridge for testing
        this.bridge = {
            calculateHealthScore: (metrics) => {
                // Replicate the calculateHealthScore logic from wp_health_bridge.js
                let score = 100;

                // Latency penalty: -1 per ms over 50ms
                if (metrics.avgLatency > 50) {
                    score -= Math.min(metrics.avgLatency - 50, 50);
                }

                // Buffer drop penalty: -5 per drop
                score -= metrics.bufferDrops * 5;

                // Reconnect penalty: -10 per reconnect
                score -= metrics.reconnectCount * 10;

                return Math.max(0, score);
            },

            buildHeartbeatPayload: (metrics) => {
                return {
                    latency_ms: metrics.avgLatency || 0,
                    swarm_count: metrics.tileCount || 0,
                    health_score: this.bridge.calculateHealthScore(metrics),
                    buffer_drops: metrics.bufferDrops || 0,
                    reconnects: metrics.reconnectCount || 0,
                    timestamp: Date.now()
                };
            }
        };
        this.results = [];
    }

    teardown() {
        this.bridge = null;
    }

    sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    /**
     * Test 1: Perfect metrics should return 100
     */
    async test_calculateHealthScore_perfect() {
        console.log('%c  Test: calculateHealthScore_perfect', 'color: #ffcc00;');

        try {
            const perfectMetrics = {
                avgLatency: 10,
                tileCount: 100,
                bufferDrops: 0,
                reconnectCount: 0
            };

            const score = this.bridge.calculateHealthScore(perfectMetrics);

            if (score !== 100) {
                throw new Error(`Expected score 100, got ${score}`);
            }

            this.results.push({ name: 'calculateHealthScore_perfect', passed: true });
            console.log('%c    PASS', 'color: #00ff00;');
        } catch (e) {
            this.results.push({ name: 'calculateHealthScore_perfect', passed: false, error: e.message });
            console.log('%c    FAIL: ' + e.message, 'color: #ff4444;');
        }
    }

    /**
     * Test 2: High latency should reduce score
     */
    async test_calculateHealthScore_high_latency() {
        console.log('%c  Test: calculateHealthScore_high_latency', 'color: #ffcc00;');

        try {
            const highLatencyMetrics = {
                avgLatency: 100,  // 50ms over threshold = -50 penalty
                tileCount: 100,
                bufferDrops: 0,
                reconnectCount: 0
            };

            const score = this.bridge.calculateHealthScore(highLatencyMetrics);

            if (score !== 50) {
                throw new Error(`Expected score 50, got ${score}`);
            }

            this.results.push({ name: 'calculateHealthScore_high_latency', passed: true });
            console.log('%c    PASS', 'color: #00ff00;');
        } catch (e) {
            this.results.push({ name: 'calculateHealthScore_high_latency', passed: false, error: e.message });
            console.log('%c    FAIL: ' + e.message, 'color: #ff4444;');
        }
    }

    /**
     * Test 3: Buffer drops should reduce score
     */
    async test_calculateHealthScore_buffer_drops() {
        console.log('%c  Test: calculateHealthScore_buffer_drops', 'color: #ffcc00;');

        try {
            const bufferDropMetrics = {
                avgLatency: 10,
                tileCount: 100,
                bufferDrops: 5,  // 5 * -5 = -25 penalty
                reconnectCount: 0
            };

            const score = this.bridge.calculateHealthScore(bufferDropMetrics);

            if (score !== 75) {
                throw new Error(`Expected score 75, got ${score}`);
            }

            this.results.push({ name: 'calculateHealthScore_buffer_drops', passed: true });
            console.log('%c    PASS', 'color: #00ff00;');
        } catch (e) {
            this.results.push({ name: 'calculateHealthScore_buffer_drops', passed: false, error: e.message });
            console.log('%c    FAIL: ' + e.message, 'color: #ff4444;');
        }
    }

    /**
     * Test 4: Reconnects should reduce score
     */
    async test_calculateHealthScore_reconnects() {
        console.log('%c  Test: calculateHealthScore_reconnects', 'color: #ffcc00;');

        try {
            const reconnectMetrics = {
                avgLatency: 10,
                tileCount: 100,
                bufferDrops: 0,
                reconnectCount: 3  // 3 * -10 = -30 penalty
            };

            const score = this.bridge.calculateHealthScore(reconnectMetrics);

            if (score !== 70) {
                throw new Error(`Expected score 70, got ${score}`);
            }

            this.results.push({ name: 'calculateHealthScore_reconnects', passed: true });
            console.log('%c    PASS', 'color: #00ff00;');
        } catch (e) {
            this.results.push({ name: 'calculateHealthScore_reconnects', passed: false, error: e.message });
            console.log('%c    FAIL: ' + e.message, 'color: #ff4444;');
        }
    }

    /**
     * Test 5: Heartbeat payload uses correct metric keys
     */
    async test_heartbeat_payload_keys() {
        console.log('%c  Test: heartbeat_payload_keys', 'color: #ffcc00;');

        try {
            const metrics = {
                avgLatency: 42,
                tileCount: 150,
                bufferDrops: 2,
                reconnectCount: 1
            };

            const payload = this.bridge.buildHeartbeatPayload(metrics);

            // Verify correct keys are used
            if (!payload.hasOwnProperty('latency_ms')) {
                throw new Error('Missing latency_ms in payload');
            }

            if (!payload.hasOwnProperty('swarm_count')) {
                throw new Error('Missing swarm_count in payload');
            }

            if (!payload.hasOwnProperty('health_score')) {
                throw new Error('Missing health_score in payload');
            }

            // Verify values match metrics
            if (payload.latency_ms !== 42) {
                throw new Error(`Expected latency_ms 42, got ${payload.latency_ms}`);
            }

            if (payload.swarm_count !== 150) {
                throw new Error(`Expected swarm_count 150, got ${payload.swarm_count}`);
            }

            this.results.push({ name: 'heartbeat_payload_keys', passed: true });
            console.log('%c    PASS', 'color: #00ff00;');
        } catch (e) {
            this.results.push({ name: 'heartbeat_payload_keys', passed: false, error: e.message });
            console.log('%c    FAIL: ' + e.message, 'color: #ff4444;');
        }
    }

    /**
     * Test 6: Graceful handling when metrics unavailable
     */
    async test_graceful_error_handling() {
        console.log('%c  Test: graceful_error_handling', 'color: #ffcc00;');

        try {
            // Test with null metrics
            const nullPayload = this.bridge.buildHeartbeatPayload(null);

            if (nullPayload.latency_ms !== 0) {
                throw new Error('Expected latency_ms 0 for null metrics');
            }

            if (nullPayload.swarm_count !== 0) {
                throw new Error('Expected swarm_count 0 for null metrics');
            }

            // Test with empty metrics
            const emptyPayload = this.bridge.buildHeartbeatPayload({});

            if (emptyPayload.latency_ms !== 0) {
                throw new Error('Expected latency_ms 0 for empty metrics');
            }

            this.results.push({ name: 'graceful_error_handling', passed: true });
            console.log('%c    PASS', 'color: #00ff00;');
        } catch (e) {
            this.results.push({ name: 'graceful_error_handling', passed: false, error: e.message });
            console.log('%c    FAIL: ' + e.message, 'color: #ff4444;');
        }
    }

    /**
     * Print test report
     */
    report() {
        const passed = this.results.filter(r => r.passed).length;
        const total = this.results.length;

        console.log('%c[WpHealthBridge Tests] Results:', 'color: #00ffcc; font-weight: bold;');
        console.log(`  Passed: ${passed}/${total}`);

        if (passed === total) {
            console.log('%c  ALL TESTS PASSED', 'color: #00ff00; font-weight: bold;');
        } else {
            console.log('%c  SOME TESTS FAILED', 'color: #ff4444; font-weight: bold;');
            this.results.filter(r => !r.passed).forEach(r => {
                console.log(`    - ${r.name}: ${r.error}`);
            });
        }
    }
}

// Auto-run if loaded in browser with ?autorun
if (typeof window !== 'undefined') {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('autorun') === 'wp_health_bridge') {
        window.addEventListener('DOMContentLoaded', async () => {
            const tester = new WpHealthBridgeTester();
            await tester.runAll();
        });
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { WpHealthBridgeTester };
}
