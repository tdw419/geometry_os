/**
 * WP Bridge Stress Tester
 *
 * Stress tests for WordPress-Geometry OS bridge with 50+ tile scenarios.
 * Tests swarm capacity, broadcast latency, and DOM performance.
 *
 * Usage:
 *   1. Open the Mission Control page in WordPress.
 *   2. Paste this script into the browser console.
 *   3. Run: const tester = new WPBridgeStressTester(); await tester.runStressTests();
 */

class WPBridgeStressTester {
    constructor() {
        this.results = [];
        this.testTiles = [];
    }

    /**
     * Run all stress tests
     */
    async runStressTests() {
        console.log('%c🔥 WP BRIDGE STRESS TESTS', 'color: #ff4444; font-size: 18px; font-weight: bold;');
        console.log('%cTesting 50+ tile capacity, broadcast latency, and FPS...', 'color: #888;');

        await this.testSwarmCapacity50();
        await this.testBroadcastLatency50();
        await this.testDOMPerformance();

        this.report();
    }

    /**
     * Test 1: Spawn 50 mock tiles and verify all registered
     */
    async testSwarmCapacity50() {
        console.log('\n%cTest 1: Swarm Capacity (50 Tiles)', 'color: #ffcc00; font-weight: bold;');

        const startTime = performance.now();
        const tileCount = 50;
        this.testTiles = [];

        // Register 50 tiles with random coordinates
        for (let i = 0; i < tileCount; i++) {
            const tileId = `stress-tile-${i}`;
            const x = Math.floor(Math.random() * 10000);
            const y = Math.floor(Math.random() * 10000);

            window.geometryOS?.registerTile(tileId, {
                x: x,
                y: y,
                state: 'running'
            });

            this.testTiles.push(tileId);
        }

        const endTime = performance.now();
        const duration = endTime - startTime;

        // Verify all tiles registered
        await this.sleep(100);
        const registeredCount = window.geometryOS?.tileRegistry?.size || 0;
        const allRegistered = this.testTiles.every(id =>
            window.geometryOS?.tileRegistry?.has(id)
        );

        // Measure memory if available
        let memoryUsage = null;
        if (performance.memory) {
            memoryUsage = (performance.memory.usedJSHeapSize / 1024 / 1024).toFixed(2);
        }

        const success = registeredCount >= tileCount && allRegistered;
        const details = success
            ? `${registeredCount} tiles registered in ${duration.toFixed(2)}ms${memoryUsage ? `, ${memoryUsage}MB memory` : ''}`
            : `Only ${registeredCount}/${tileCount} tiles registered`;

        this.logResult('Swarm Capacity', success, details);

        // Cleanup will happen after all tests
    }

    /**
     * Test 2: Broadcast to 50 tiles and verify latency under 1000ms
     */
    async testBroadcastLatency50() {
        console.log('\n%cTest 2: Broadcast Latency (50 Tiles)', 'color: #ffcc00; font-weight: bold;');

        // Ensure we have 50 tiles
        if (this.testTiles.length < 50) {
            // Register additional tiles if needed
            for (let i = this.testTiles.length; i < 50; i++) {
                const tileId = `stress-tile-bcast-${i}`;
                window.geometryOS?.registerTile(tileId, {
                    x: Math.floor(Math.random() * 10000),
                    y: Math.floor(Math.random() * 10000),
                    state: 'running'
                });
                this.testTiles.push(tileId);
            }
        }

        await this.sleep(50);

        // Time the broadcast
        const startTime = performance.now();
        const count = window.geometryOS?.broadcastCommand?.('stress-test-ping');
        const endTime = performance.now();

        const latency = endTime - startTime;
        const success = count >= 50 && latency < 1000;
        const details = success
            ? `Broadcast to ${count} tiles in ${latency.toFixed(2)}ms`
            : `Failed: count=${count}, latency=${latency.toFixed(2)}ms`;

        this.logResult('Broadcast Latency', success, details);

        // Cleanup tiles after this test
        this.cleanupTiles();
    }

    /**
     * Test 3: Measure frame rate during heavy activity
     */
    async testDOMPerformance() {
        console.log('\n%cTest 3: DOM Performance (60 frames)', 'color: #ffcc00; font-weight: bold;');

        // Re-register some tiles for activity simulation
        const activeTiles = [];
        for (let i = 0; i < 30; i++) {
            const tileId = `perf-tile-${i}`;
            window.geometryOS?.registerTile(tileId, {
                x: Math.floor(Math.random() * 5000),
                y: Math.floor(Math.random() * 5000),
                state: 'running'
            });
            activeTiles.push(tileId);
        }

        await this.sleep(50);

        // Measure 60 frames of activity
        const frameCount = 60;
        const frameTimes = [];
        let frameIndex = 0;

        return new Promise((resolve) => {
            const measureFrame = () => {
                const frameStart = performance.now();

                // Dispatch metricsUpdate events each frame (simulate heavy activity)
                activeTiles.forEach((tileId, i) => {
                    window.dispatchEvent(new CustomEvent('geometryOS:metricsUpdate', {
                        detail: {
                            tileId: tileId,
                            metrics: {
                                cpu: Math.random() * 100,
                                memory: Math.random() * 1000,
                                entropy: Math.random()
                            }
                        }
                    }));
                });

                // Also dispatch registry updates
                if (frameIndex % 5 === 0) {
                    window.dispatchEvent(new CustomEvent('geometryOS:registryUpdate', {
                        detail: {
                            tileId: activeTiles[frameIndex % activeTiles.length],
                            action: 'update'
                        }
                    }));
                }

                const frameEnd = performance.now();
                frameTimes.push(frameEnd - frameStart);
                frameIndex++;

                if (frameIndex < frameCount) {
                    requestAnimationFrame(measureFrame);
                } else {
                    // Calculate FPS
                    const avgFrameTime = frameTimes.reduce((a, b) => a + b, 0) / frameTimes.length;
                    const avgFPS = 1000 / avgFrameTime;
                    const minFPS = 1000 / Math.max(...frameTimes);
                    const maxFPS = 1000 / Math.min(...frameTimes);

                    const success = avgFPS >= 55;
                    const details = success
                        ? `Average ${avgFPS.toFixed(1)} FPS (${minFPS.toFixed(1)} min, ${maxFPS.toFixed(1)} max)`
                        : `FPS below threshold: ${avgFPS.toFixed(1)} (min: ${minFPS.toFixed(1)})`;

                    this.logResult('DOM Performance', success, details);

                    // Cleanup
                    activeTiles.forEach(id => {
                        window.geometryOS?.tileRegistry?.delete(id);
                    });

                    resolve();
                }
            };

            requestAnimationFrame(measureFrame);
        });
    }

    /**
     * Log test result
     */
    logResult(name, success, details) {
        const symbol = success ? '✅' : '❌';
        console.log(`${symbol} ${name}: ${details}`);
        this.results.push({ name, success, details });
    }

    /**
     * Cleanup test tiles
     */
    cleanupTiles() {
        this.testTiles.forEach(id => {
            window.geometryOS?.tileRegistry?.delete(id);
        });
        this.testTiles = [];

        // Update metrics
        if (window.geometryOSMetrics) {
            window.geometryOSMetrics.setTileCount(window.geometryOS?.tileRegistry?.size || 0);
        }
    }

    /**
     * Generate stress test report
     */
    report() {
        console.log('\n' + '═'.repeat(50));
        console.log('%c🔥 STRESS TEST RESULTS', 'color: #ff4444; font-size: 16px; font-weight: bold;');
        console.log('═'.repeat(50));

        const passed = this.results.filter(r => r.success).length;
        const total = this.results.length;
        const color = passed === total ? 'color: #00ff00' : 'color: #ff4444';

        this.results.forEach(r => {
            const symbol = r.success ? '✅' : '❌';
            console.log(`${symbol} ${r.name.padEnd(20)} | ${r.details}`);
        });

        console.log('─'.repeat(50));
        console.log(`%c${passed}/${total} STRESS TESTS PASSED`, `${color}; font-weight: bold;`);
        console.log('═'.repeat(50));

        // Final cleanup
        this.cleanupTiles();
    }

    /**
     * Sleep helper
     */
    sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
}

// Export for both browser and Node.js
if (typeof window !== 'undefined') {
    window.WPBridgeStressTester = WPBridgeStressTester;
    console.log('%cWPBridgeStressTester loaded.', 'color: #00ffcc;');
    console.log('%cRun: const tester = new WPBridgeStressTester(); await tester.runStressTests();', 'color: #888;');
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { WPBridgeStressTester };
}
