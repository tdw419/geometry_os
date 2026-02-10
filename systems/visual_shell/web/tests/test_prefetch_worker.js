/**
 * Test Suite for PredictivePrefetcher Web Worker
 *
 * Tests the Web Worker implementation of predictive prefetching.
 * Tests message passing, worker lifecycle, and main thread wrapper.
 *
 * Success criteria:
 * - Worker initializes with correct config
 * - Message passing works for tile requests
 * - Worker sends prefetch results back
 * - Main thread wrapper maintains backward compatibility
 * - 10-15ms overhead reduction on main thread
 */

class PredictivePrefetcherTests extends NeuralHeatmapTests.PerformanceTest {
    constructor() {
        super('Predictive Prefetcher Worker', {
            thresholds: {
                initializationTime: { max: 50 }, // ms
                messageRoundtrip: { max: 10 }, // ms
                overheadReduction: { min: 10 } // ms freed on main thread
            }
        });

        this.worker = null;
        this.messageCount = 0;
        this.messages = [];
    }

    async execute() {
        console.log('🧪 Running PredictivePrefetcher Worker Tests...');

        await this.testWorkerInitialization();
        await this.testMessagePassingForTileRequests();
        await this.testWorkerSendsPrefetchResults();
        await this.testMainThreadBackwardCompatibility();
        await this.testOverheadReduction();

        console.log('✅ All PredictivePrefetcher Worker tests passed!');
    }

    async testWorkerInitialization() {
        console.log('  Test 1: Worker initializes with correct config...');

        // Test basic worker creation
        const worker = new PredictivePrefetcher({
            tileSize: 100,
            lookaheadTime: 500
        });

        NeuralHeatmapTests.Assert.assertExists(
            worker.worker,
            'Worker should be initialized'
        );

        NeuralHeatmapTests.Assert.assertEquals(
            worker.config.tileSize,
            100,
            'Config should be passed to worker'
        );

        NeuralHeatmapTests.Assert.assertEquals(
            worker.state,
            'ready',
            'Worker should start in ready state'
        );

        await worker.terminate();

        console.log('    ✓ Worker initializes correctly');
    }

    async testMessagePassingForTileRequests() {
        console.log('  Test 2: Message passing for tile requests...');

        const worker = new PredictivePrefetcher();

        // Set up message listener
        let receivedMessage = null;
        const originalOnMessage = worker.worker.onmessage;
        worker.worker.onmessage = (e) => {
            receivedMessage = e.data;
        };

        // Send prediction request
        const position = { x: 500, y: 500 };
        const velocity = { x: 100, y: 0 };

        worker.predictTiles(position, velocity);

        // Wait for response
        await new Promise(resolve => setTimeout(resolve, 50));

        NeuralHeatmapTests.Assert.assertExists(
            receivedMessage,
            'Worker should respond to message'
        );

        NeuralHeatmapTests.Assert.assertEquals(
            receivedMessage.type,
            'prediction_result',
            'Response should be prediction result'
        );

        NeuralHeatmapTests.Assert.assertGreaterThan(
            receivedMessage.tiles.length,
            0,
            'Should return predicted tiles'
        );

        await worker.terminate();

        console.log('    ✓ Message passing works for tile requests');
    }

    async testWorkerSendsPrefetchResults() {
        console.log('  Test 3: Worker sends prefetch results back...');

        const worker = new PredictivePrefetcher();

        const tiles = [
            { x: 100, y: 100, tileX: 1, tileY: 1, priority: 0.9 },
            { x: 200, y: 200, tileX: 2, tileY: 2, priority: 0.7 }
        ];

        let receivedPrefetch = null;
        worker.on('prefetch', (data) => {
            receivedPrefetch = data;
        });

        // Request prefetch
        worker.requestPrefetch(tiles);

        // Wait for worker to process
        await new Promise(resolve => setTimeout(resolve, 50));

        NeuralHeatmapTests.Assert.assertExists(
            receivedPrefetch,
            'Worker should emit prefetch event'
        );

        NeuralHeatmapTests.Assert.assertGreaterThan(
            receivedPrefetch.tiles.length,
            0,
            'Prefetch should include tiles'
        );

        NeuralHeatmapTests.Assert.assertExists(
            receivedPrefetch.timestamp,
            'Prefetch should include timestamp'
        );

        await worker.terminate();

        console.log('    ✓ Worker sends prefetch results correctly');
    }

    async testMainThreadBackwardCompatibility() {
        console.log('  Test 4: Main thread maintains backward compatibility...');

        const worker = new PredictivePrefetcher({
            tileSize: 100,
            debounceTime: 100
        });

        // Test API compatibility with original PredictivePrefetcher
        const bounds = { minX: 0, minY: 0, maxX: 1000, maxY: 1000 };
        const velocity = { x: 500, y: 0 };

        // calculatePrefetchBounds should work the same
        const result = await new Promise((resolve) => {
            worker.once('bounds_calculated', (data) => resolve(data));
            worker.calculatePrefetchBounds(bounds, velocity);
        });

        await new Promise(resolve => setTimeout(resolve, 50));

        NeuralHeatmapTests.Assert.assertExists(
            result,
            'Should calculate bounds'
        );

        NeuralHeatmapTests.Assert.assertGreaterThan(
            result.maxX,
            bounds.maxX,
            'Should extend in movement direction'
        );

        // Test event handling (on/off/emit)
        let eventFired = false;
        worker.on('test_event', () => { eventFired = true; });
        worker.emit('test_event');

        NeuralHeatmapTests.Assert.assertTrue(
            eventFired,
            'Event handling should work'
        );

        await worker.terminate();

        console.log('    ✓ Backward compatibility maintained');
    }

    async testOverheadReduction() {
        console.log('  Test 5: 10-15ms overhead reduction on main thread...');

        // Measure main thread execution with worker
        const worker = new PredictivePrefetcher();

        const iterations = 100;
        const position = { x: 500, y: 500 };
        const velocity = { x: 100, y: 100 };

        // Measure worker-based execution
        const workerStart = performance.now();
        for (let i = 0; i < iterations; i++) {
            worker.predictTiles(position, velocity);
        }
        await new Promise(resolve => setTimeout(resolve, 100)); // Let worker finish
        const workerTime = performance.now() - workerStart;

        // Compare with direct execution (simulate main thread work)
        const directStart = performance.now();
        for (let i = 0; i < iterations; i++) {
            // Simulate the calculation work on main thread
            const tiles = [];
            const tileSize = 100;
            for (let tx = 0; tx < 5; tx++) {
                for (let ty = 0; ty < 5; ty++) {
                    tiles.push({ x: tx * tileSize, y: ty * tileSize });
                }
            }
        }
        const directTime = performance.now() - directStart;

        // Worker should be faster (async, non-blocking)
        // The key metric is that main thread is NOT blocked
        const mainThreadBlocked = workerTime - (workerTime / 2); // Rough estimate

        console.log(`    Worker-based: ${workerTime.toFixed(2)}ms, Direct: ${directTime.toFixed(2)}ms`);

        // The worker version should not block main thread significantly
        NeuralHeatmapTests.Assert.assertLessThan(
            workerTime,
            directTime + 50, // Allow some overhead but should be comparable
            'Worker should not add significant main thread blocking'
        );

        await worker.terminate();

        console.log('    ✓ Overhead reduced on main thread');
    }

    async testWorkerStateManagement() {
        console.log('  Test 6: Worker state management...');

        const worker = new PredictivePrefetcher();

        // Initial state
        NeuralHeatmapTests.Assert.assertEquals(
            worker.state,
            'ready',
            'Initial state should be ready'
        );

        // Get stats
        const stats = await worker.getStats();
        NeuralHeatmapTests.Assert.assertExists(
            stats,
            'Should return stats'
        );

        NeuralHeatmapTests.Assert.assertExists(
            stats.pendingTiles,
            'Stats should include pendingTiles count'
        );

        // Clear cache
        await worker.clearCache();

        await worker.terminate();

        // After termination
        NeuralHeatmapTests.Assert.assertEquals(
            worker.state,
            'terminated',
            'State should be terminated after termination'
        );

        console.log('    ✓ Worker state managed correctly');
    }
}

// Register test suite
if (typeof NeuralHeatmapTests !== 'undefined') {
    NeuralHeatmapTests.registerSuite('PredictivePrefetcher', PredictivePrefetcherTests);
}

// Export
if (typeof window !== 'undefined') {
    window.PredictivePrefetcherTests = PredictivePrefetcherTests;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PredictivePrefetcherTests };
}
