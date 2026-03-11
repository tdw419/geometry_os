/**
 * Test Suite for PredictivePrefetcher (Task 3 of Phase 47)
 *
 * Tests predictive tile pre-fetching based on movement velocity.
 * Uses the NeuralHeatmapTests framework.
 *
 * Success criteria:
 * - Calculates prefetch bounds based on velocity vector
 * - Predicts tiles in movement direction
 * - Limits prefetch distance based on speed
 * - Prioritizes tiles by gaze point distance
 * - Debounces prefetch requests
 */

class PredictivePrefetcherTests extends NeuralHeatmapTests.PerformanceTest {
    constructor() {
        super('Predictive Prefetcher', {
            thresholds: {
                prefetchTime: { max: 5 }, // ms
                predictionAccuracy: { min: 0.8 }
            }
        });
    }

    async execute() {
        console.log('🧪 Running PredictivePrefetcher Tests...');

        await this.testPrefetchBoundsBasedOnVelocity();
        await this.testPredictTilesInMovementDirection();
        await this.testLimitPrefetchDistanceBasedOnSpeed();
        await this.testPrioritizeTilesByGazeDirection();
        await this.testDebouncePrefetchRequests();

        console.log('✅ All PredictivePrefetcher tests passed!');
    }

    async testPrefetchBoundsBasedOnVelocity() {
        console.log('  Test 1: Calculate prefetch bounds based on velocity...');

        if (typeof PredictivePrefetcher === 'undefined') {
            throw new Error('PredictivePrefetcher not available. Include predictive_prefetcher.js first.');
        }

        const prefetcher = new PredictivePrefetcher({
            tileSize: 100,
            lookaheadTime: 500,
            minPrefetchPadding: 0.5,
            speedFactor: 0.002
        });

        const bounds = { minX: 0, minY: 0, maxX: 1000, maxY: 1000 };
        const velocity = { x: 500, y: 0 }; // Moving right

        const prefetchBounds = prefetcher.calculatePrefetchBounds(bounds, velocity);

        // Should extend in direction of movement
        NeuralHeatmapTests.Assert.assertGreaterThan(
            prefetchBounds.maxX,
            bounds.maxX,
            'Prefetch bounds should extend beyond current bounds in movement direction'
        );

        // Left side should have minimal extension (no movement in that direction)
        const minXDiff = Math.abs(prefetchBounds.minX - bounds.minX);
        NeuralHeatmapTests.Assert.assertLessThan(
            minXDiff,
            50,
            'Prefetch bounds should not extend much opposite to movement direction'
        );

        console.log('    ✓ Prefetch bounds calculated correctly based on velocity');
    }

    async testPredictTilesInMovementDirection() {
        console.log('  Test 2: Predict tiles in movement direction...');

        const prefetcher = new PredictivePrefetcher({
            tileSize: 100,
            lookaheadTime: 200
        });

        const position = { x: 500, y: 500 };
        const velocity = { x: 100, y: 0 }; // Moving right at 100 px/sec

        const tiles = prefetcher.predictTiles(position, velocity, 1000);

        NeuralHeatmapTests.Assert.assertGreaterThan(
            tiles.length,
            0,
            'Should predict at least one tile'
        );

        // Average tile position should be ahead of current position
        const avgX = tiles.reduce((sum, t) => sum + t.x, 0) / tiles.length;
        NeuralHeatmapTests.Assert.assertGreaterThan(
            avgX,
            500,
            'Predicted tiles should be ahead in movement direction'
        );

        console.log('    ✓ Tiles predicted correctly in movement direction');
    }

    async testLimitPrefetchDistanceBasedOnSpeed() {
        console.log('  Test 3: Limit prefetch distance based on speed...');

        const prefetcher = new PredictivePrefetcher({
            tileSize: 100,
            maxPrefetchDistance: 2,
            speedFactor: 0.001
        });

        const position = { x: 500, y: 500 };
        const slowVelocity = { x: 10, y: 0, magnitude: 10 };
        const fastVelocity = { x: 1000, y: 0, magnitude: 1000 };

        const slowTiles = prefetcher.predictTiles(position, slowVelocity, 500);
        const fastTiles = prefetcher.predictTiles(position, fastVelocity, 500);

        // Faster movement should predict more tiles ahead
        NeuralHeatmapTests.Assert.assertGreaterThan(
            fastTiles.length,
            slowTiles.length,
            'Faster movement should result in more predicted tiles'
        );

        // But there should still be a maximum limit
        NeuralHeatmapTests.Assert.assertLessThan(
            fastTiles.length,
            1000,
            'Prefetch should be limited to maximum distance'
        );

        console.log('    ✓ Prefetch distance correctly limited based on speed');
    }

    async testPrioritizeTilesByGazeDirection() {
        console.log('  Test 4: Prioritize tiles by gaze direction...');

        const prefetcher = new PredictivePrefetcher({
            tileSize: 100
        });

        const gazePoint = { x: 1000, y: 500 };
        const tiles = [
            { x: 500, y: 500 },
            { x: 1000, y: 500 },
            { x: 500, y: 1000 }
        ];

        const prioritized = prefetcher.getPrioritizedTiles(tiles, gazePoint);

        // First tile should be closest to gaze point
        NeuralHeatmapTests.Assert.assertEquals(
            prioritized[0].x,
            1000,
            'Tile at gaze point should be first'
        );

        // All tiles should have priority values
        prioritized.forEach(tile => {
            NeuralHeatmapTests.Assert.assertExists(
                tile.priority,
                'All tiles should have priority values'
            );
            NeuralHeatmapTests.Assert.assertGreaterThan(
                tile.priority,
                0,
                'Priority should be positive'
            );
        });

        // Tiles should be sorted by priority (highest first)
        for (let i = 0; i < prioritized.length - 1; i++) {
            NeuralHeatmapTests.Assert.assertGreaterThan(
                prioritized[i].priority,
                prioritized[i + 1].priority,
                'Tiles should be sorted by priority descending'
            );
        }

        console.log('    ✓ Tiles correctly prioritized by gaze direction');
    }

    async testDebouncePrefetchRequests() {
        console.log('  Test 5: Debounce prefetch requests...');

        const prefetcher = new PredictivePrefetcher({
            debounceTime: 50
        });

        let callCount = 0;
        prefetcher.on('prefetch', () => {
            callCount++;
        });

        // Make multiple rapid requests
        prefetcher.requestPrefetch([{ x: 0, y: 0 }]);
        prefetcher.requestPrefetch([{ x: 0, y: 0 }]);
        prefetcher.requestPrefetch([{ x: 0, y: 0 }]);

        // Wait for debounce to complete
        await new Promise(resolve => setTimeout(resolve, 100));

        // Should have called only once (debounced)
        NeuralHeatmapTests.Assert.assertLessThan(
            callCount,
            3,
            'Prefetch requests should be debounced'
        );

        NeuralHeatmapTests.Assert.assertGreaterThan(
            callCount,
            0,
            'Prefetch should execute at least once'
        );

        console.log('    ✓ Prefetch requests correctly debounced');
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
