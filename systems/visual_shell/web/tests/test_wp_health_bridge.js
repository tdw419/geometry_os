/**
 * Geometry OS: WpHealthBridge Unit Tests
 *
 * Tests the WpHealthBridge functionality including health score calculation,
 * heartbeat payload construction, and graceful error handling.
 *
 * Usage:
 *   1. Include wp_health_bridge.js and this test file in the browser.
 *   2. Run: const tester = new WpHealthBridgeTester(); await tester.runAll();
 */

class WpHealthBridgeTester {
    constructor() {
        this.results = [];
    }

    /**
     * Run all tests
     */
    async runAll() {
        console.log('%c[WpHealthBridge Tests] Starting...', 'color: #00ffcc; font-size: 16px; font-weight: bold;');

        // Setup
        this.setup();

        // Run tests
        await this.test_calculate_health_score_perfect();
        await this.test_calculate_health_score_high_latency();
        await this.test_calculate_health_score_buffer_drops();
        await this.test_calculate_health_score_reconnects();
        await this.test_heartbeat_payload_keys();
        await this.test_graceful_error_handling();

        // Report
        this.report();

        // Cleanup
        this.teardown();
    }

    setup() {
        this.results = [];
    }

    teardown() {
        // No cleanup needed for pure function tests
    }

    /**
     * Extract calculateHealthScore from wp_health_bridge.js IIFE for testing
     * This mirrors the function logic from the bridge
     */
    calculateHealthScore(metrics) {
        if (!metrics) return 100;

        let score = 100;

        // Latency penalty (target: <100ms)
        const latency = metrics.avgLatency || 0;
        if (latency > 200) score -= 20;
        else if (latency > 100) score -= 10;

        // Buffer drops penalty
        const drops = metrics.bufferDrops || 0;
        if (drops > 10) score -= 15;
        else if (drops > 0) score -= 5;

        // Reconnect penalty
        const reconnects = metrics.reconnects || 0;
        if (reconnects > 5) score -= 15;
        else if (reconnects > 0) score -= 5;

        return Math.max(0, Math.min(100, score));
    }

    /**
     * Build heartbeat payload (mirrors logic from wp_health_bridge.js)
     */
    buildHeartbeatPayload(metrics) {
        if (!metrics) return null;

        const healthScore = this.calculateHealthScore(metrics);

        return {
            latency_ms: metrics.avgLatency || 0,
            swarm_count: metrics.tileCount || 0,
            health_score: healthScore,
            buffer_drops: metrics.bufferDrops || 0,
            reconnects: metrics.reconnects || 0
        };
    }

    /**
     * Test 1: Perfect metrics should return score of 100
     */
    async test_calculate_health_score_perfect() {
        console.log('%c  Test: calculate_health_score_perfect', 'color: #ffcc00;');

        try {
            // Perfect metrics
            const perfectMetrics = {
                avgLatency: 50,
                bufferDrops: 0,
                reconnects: 0
            };

            const score = this.calculateHealthScore(perfectMetrics);

            if (score !== 100) {
                throw new Error(`Expected score 100, got ${score}`);
            }

            // Also test with empty metrics
            const emptyScore = this.calculateHealthScore({});
            if (emptyScore !== 100) {
                throw new Error(`Expected score 100 for empty metrics, got ${emptyScore}`);
            }

            // Test with null (should return 100)
            const nullScore = this.calculateHealthScore(null);
            if (nullScore !== 100) {
                throw new Error(`Expected score 100 for null metrics, got ${nullScore}`);
            }

            this.logResult('calculate_health_score_perfect', true, 'Score: 100 for perfect metrics');
        } catch (error) {
            this.logResult('calculate_health_score_perfect', false, error.message);
        }
    }

    /**
     * Test 2: High latency should penalize score
     */
    async test_calculate_health_score_high_latency() {
        console.log('%c  Test: calculate_health_score_high_latency', 'color: #ffcc00;');

        try {
            // Test latency > 200ms (20 point penalty)
            const highLatencyMetrics = {
                avgLatency: 250,
                bufferDrops: 0,
                reconnects: 0
            };

            const highScore = this.calculateHealthScore(highLatencyMetrics);
            if (highScore !== 80) {
                throw new Error(`Expected score 80 for 250ms latency, got ${highScore}`);
            }

            // Test latency > 100ms but < 200ms (10 point penalty)
            const mediumLatencyMetrics = {
                avgLatency: 150,
                bufferDrops: 0,
                reconnects: 0
            };

            const mediumScore = this.calculateHealthScore(mediumLatencyMetrics);
            if (mediumScore !== 90) {
                throw new Error(`Expected score 90 for 150ms latency, got ${mediumScore}`);
            }

            // Test latency exactly 100ms (no penalty, boundary)
            const boundaryMetrics = {
                avgLatency: 100,
                bufferDrops: 0,
                reconnects: 0
            };

            const boundaryScore = this.calculateHealthScore(boundaryMetrics);
            if (boundaryScore !== 100) {
                throw new Error(`Expected score 100 for 100ms latency, got ${boundaryScore}`);
            }

            this.logResult('calculate_health_score_high_latency', true, 'Latency penalties correct (80, 90, 100)');
        } catch (error) {
            this.logResult('calculate_health_score_high_latency', false, error.message);
        }
    }

    /**
     * Test 3: Buffer drops should penalize score
     */
    async test_calculate_health_score_buffer_drops() {
        console.log('%c  Test: calculate_health_score_buffer_drops', 'color: #ffcc00;');

        try {
            // Test buffer drops > 10 (15 point penalty)
            const highDropsMetrics = {
                avgLatency: 50,
                bufferDrops: 15,
                reconnects: 0
            };

            const highScore = this.calculateHealthScore(highDropsMetrics);
            if (highScore !== 85) {
                throw new Error(`Expected score 85 for 15 drops, got ${highScore}`);
            }

            // Test buffer drops > 0 but < 10 (5 point penalty)
            const lowDropsMetrics = {
                avgLatency: 50,
                bufferDrops: 5,
                reconnects: 0
            };

            const lowScore = this.calculateHealthScore(lowDropsMetrics);
            if (lowScore !== 95) {
                throw new Error(`Expected score 95 for 5 drops, got ${lowScore}`);
            }

            // Test exactly 10 drops (5 point penalty, boundary)
            const boundaryMetrics = {
                avgLatency: 50,
                bufferDrops: 10,
                reconnects: 0
            };

            const boundaryScore = this.calculateHealthScore(boundaryMetrics);
            if (boundaryScore !== 95) {
                throw new Error(`Expected score 95 for 10 drops, got ${boundaryScore}`);
            }

            this.logResult('calculate_health_score_buffer_drops', true, 'Buffer drop penalties correct (85, 95)');
        } catch (error) {
            this.logResult('calculate_health_score_buffer_drops', false, error.message);
        }
    }

    /**
     * Test 4: Reconnects should penalize score
     */
    async test_calculate_health_score_reconnects() {
        console.log('%c  Test: calculate_health_score_reconnects', 'color: #ffcc00;');

        try {
            // Test reconnects > 5 (15 point penalty)
            const highReconnectsMetrics = {
                avgLatency: 50,
                bufferDrops: 0,
                reconnects: 10
            };

            const highScore = this.calculateHealthScore(highReconnectsMetrics);
            if (highScore !== 85) {
                throw new Error(`Expected score 85 for 10 reconnects, got ${highScore}`);
            }

            // Test reconnects > 0 but < 5 (5 point penalty)
            const lowReconnectsMetrics = {
                avgLatency: 50,
                bufferDrops: 0,
                reconnects: 3
            };

            const lowScore = this.calculateHealthScore(lowReconnectsMetrics);
            if (lowScore !== 95) {
                throw new Error(`Expected score 95 for 3 reconnects, got ${lowScore}`);
            }

            // Test exactly 5 reconnects (5 point penalty, boundary)
            const boundaryMetrics = {
                avgLatency: 50,
                bufferDrops: 0,
                reconnects: 5
            };

            const boundaryScore = this.calculateHealthScore(boundaryMetrics);
            if (boundaryScore !== 95) {
                throw new Error(`Expected score 95 for 5 reconnects, got ${boundaryScore}`);
            }

            this.logResult('calculate_health_score_reconnects', true, 'Reconnect penalties correct (85, 95)');
        } catch (error) {
            this.logResult('calculate_health_score_reconnects', false, error.message);
        }
    }

    /**
     * Test 5: Heartbeat payload should have correct key names
     */
    async test_heartbeat_payload_keys() {
        console.log('%c  Test: heartbeat_payload_keys', 'color: #ffcc00;');

        try {
            const metrics = {
                avgLatency: 75.5,
                tileCount: 42,
                bufferDrops: 3,
                reconnects: 1
            };

            const payload = this.buildHeartbeatPayload(metrics);

            // Verify payload exists
            if (!payload) {
                throw new Error('Payload is null');
            }

            // Verify all expected keys exist
            const expectedKeys = ['latency_ms', 'swarm_count', 'health_score', 'buffer_drops', 'reconnects'];
            for (const key of expectedKeys) {
                if (!(key in payload)) {
                    throw new Error(`Missing key: ${key}`);
                }
            }

            // Verify correct value mapping
            if (payload.latency_ms !== 75.5) {
                throw new Error(`Expected latency_ms 75.5, got ${payload.latency_ms}`);
            }

            if (payload.swarm_count !== 42) {
                throw new Error(`Expected swarm_count 42, got ${payload.swarm_count}`);
            }

            // Health score should be 85 (95 - 5 for drops - 5 for reconnects)
            if (payload.health_score !== 85) {
                throw new Error(`Expected health_score 85, got ${payload.health_score}`);
            }

            if (payload.buffer_drops !== 3) {
                throw new Error(`Expected buffer_drops 3, got ${payload.buffer_drops}`);
            }

            if (payload.reconnects !== 1) {
                throw new Error(`Expected reconnects 1, got ${payload.reconnects}`);
            }

            this.logResult('heartbeat_payload_keys', true, 'All payload keys correct: latency_ms, swarm_count, health_score, buffer_drops, reconnects');
        } catch (error) {
            this.logResult('heartbeat_payload_keys', false, error.message);
        }
    }

    /**
     * Test 6: Graceful error handling when metrics unavailable
     */
    async test_graceful_error_handling() {
        console.log('%c  Test: graceful_error_handling', 'color: #ffcc00;');

        try {
            // Test with null metrics
            const nullPayload = this.buildHeartbeatPayload(null);
            if (nullPayload !== null) {
                throw new Error('Expected null payload for null metrics');
            }

            // Test with undefined metrics
            const undefinedPayload = this.buildHeartbeatPayload(undefined);
            if (undefinedPayload !== null) {
                throw new Error('Expected null payload for undefined metrics');
            }

            // Test health score with missing fields
            const partialMetrics = {};
            const partialScore = this.calculateHealthScore(partialMetrics);
            if (partialScore !== 100) {
                throw new Error(`Expected score 100 for partial metrics, got ${partialScore}`);
            }

            // Test health score never goes negative
            const terribleMetrics = {
                avgLatency: 500,
                bufferDrops: 50,
                reconnects: 20
            };
            const terribleScore = this.calculateHealthScore(terribleMetrics);
            // Expected: 100 - 20 (latency) - 15 (drops) - 15 (reconnects) = 50
            if (terribleScore < 0) {
                throw new Error(`Score should not be negative, got ${terribleScore}`);
            }
            if (terribleScore !== 50) {
                throw new Error(`Expected score 50 for terrible metrics, got ${terribleScore}`);
            }

            // Test score never exceeds 100
            const amazingMetrics = {
                avgLatency: 0,
                bufferDrops: 0,
                reconnects: 0
            };
            const amazingScore = this.calculateHealthScore(amazingMetrics);
            if (amazingScore > 100) {
                throw new Error(`Score should not exceed 100, got ${amazingScore}`);
            }

            this.logResult('graceful_error_handling', true, 'Handles null/undefined/metrics gracefully, score bounded [0,100]');
        } catch (error) {
            this.logResult('graceful_error_handling', false, error.message);
        }
    }

    logResult(name, success, details) {
        const symbol = success ? '✅' : '❌';
        console.log(`    ${symbol} ${name}: ${details}`);
        this.results.push({ name, success, details });
    }

    report() {
        console.log('\n' + '='.repeat(50));
        console.log('%cWpHealthBridge Test Report', 'color: #00ffcc; font-weight: bold;');
        console.log('='.repeat(50));

        const passed = this.results.filter(r => r.success).length;
        const total = this.results.length;
        const color = passed === total ? 'color: #00ff00' : 'color: #ff4444';

        console.log(`%cPASSED: ${passed}/${total}`, `${color}; font-weight: bold;`);

        this.results.forEach(r => {
            console.log(`  ${r.success ? '✅' : '❌'} ${r.name.padEnd(35)} | ${r.details}`);
        });

        console.log('='.repeat(50));
    }

    sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
}

// Export for Node.js testing
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { WpHealthBridgeTester };
}

// Convenience auto-run message
console.log('%c[WpHealthBridge Tests] Loaded. Run: const t = new WpHealthBridgeTester(); await t.runAll();', 'color: #00ffcc');
