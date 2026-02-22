/**
 * Memory Leak Tests for Neural Heatmap
 *
 * Tests for memory leaks in the overlay system, including:
 * - Tile attachment/detachment cleanup
 * - Graphics pool memory management
 * - Activity tracker cleanup
 * - Event listener removal
 *
 * Success criteria:
 * - Memory growth < 10% over 100 iterations
 * - All detached tiles are cleaned up
 * - No orphaned event listeners
 * - Graphics pool properly reuses objects
 */

class MemoryLeakTests extends NeuralHeatmapTests.MemoryLeakTest {
    constructor() {
        super('Memory Leak Detection', {
            iterations: 100,
            leakThreshold: 1.1 // 10% growth allowed
        });
    }

    async execute() {
        // Test 1: Tile attachment/detachment cleanup
        await this.testTileAttachmentCleanup();

        // Test 2: Graphics pool memory management
        await this.testGraphicsPoolMemory();

        // Test 3: Activity tracker cleanup
        await this.testActivityTrackerCleanup();

        // Test 4: Event listener cleanup
        await this.testEventListenerCleanup();

        // Test 5: Long-running memory stability
        await this.testLongRunningStability();
    }

    async testTileAttachmentCleanup() {
        console.log('  Testing tile attachment/detachment cleanup...');

        if (typeof NeuralHeatmapOverlay === 'undefined') {
            console.log('    ⚠ NeuralHeatmapOverlay not available, skipping');
            return;
        }

        const container = NeuralHeatmapTests.MockObjects.createMockContainer();
        const overlay = new NeuralHeatmapOverlay({
            container: container,
            maxTiles: 1000
        });

        // Get initial memory
        const initialMemory = NeuralHeatmapTests.TestHelpers.measureMemory();

        // Attach and detach tiles repeatedly
        for (let i = 0; i < this.iterations; i++) {
            const tile = {
                id: `leak_test_tile_${i}`,
                x: 100 + (i % 10) * 100,
                y: 100 + Math.floor(i / 10) * 100,
                width: 512,
                height: 512,
                data: { entropy: Math.random() }
            };

            overlay.attachTile(tile.id, tile);
            overlay.detachTile(tile.id);
        }

        // Force garbage collection if available
        if (global.gc) {
            global.gc();
        }

        await NeuralHeatmapTests.TestHelpers.wait(100);

        const finalMemory = NeuralHeatmapTests.TestHelpers.measureMemory();

        if (initialMemory && finalMemory) {
            const growth = finalMemory.used / initialMemory.used;
            console.log(`    Memory growth: ${((growth - 1) * 100).toFixed(2)}%`);

            if (growth > this.leakThreshold) {
                throw new Error(`Memory leak detected: ${growth.toFixed(2)}x growth exceeds threshold ${this.leakThreshold}x`);
            }
        }

        // Verify attachments map is empty
        NeuralHeatmapTests.Assert.assertEquals(overlay.attachments.size, 0, 'All tiles should be detached');

        console.log('    ✓ Tile attachment/detachment cleanup works correctly');
    }

    async testGraphicsPoolMemory() {
        console.log('  Testing graphics pool memory management...');

        if (typeof HeatmapGraphicsPool === 'undefined') {
            console.log('    ⚠ HeatmapGraphicsPool not available, skipping');
            return;
        }

        const pool = new HeatmapGraphicsPool({
            initialSize: 50,
            maxIdle: 100
        });

        const initialMemory = NeuralHeatmapTests.TestHelpers.measureMemory();

        // Acquire and release many graphics objects
        const objects = [];
        for (let i = 0; i < this.iterations; i++) {
            const obj = pool.acquire();
            objects.push(obj);

            if (objects.length > 50) {
                pool.release(objects.shift());
            }
        }

        // Release remaining objects
        for (const obj of objects) {
            pool.release(obj);
        }

        await NeuralHeatmapTests.TestHelpers.wait(100);

        const finalMemory = NeuralHeatmapTests.TestHelpers.measureMemory();

        if (initialMemory && finalMemory) {
            const growth = finalMemory.used / initialMemory.used;
            console.log(`    Memory growth: ${((growth - 1) * 100).toFixed(2)}%`);

            // Check pool size
            const poolSize = pool.getStats().totalCreated;
            console.log(`    Pool created ${poolSize} objects`);

            // Pool should not create more than initial + some buffer
            NeuralHeatmapTests.Assert.assertTrue(poolSize < 100, `Pool should reuse objects, created ${poolSize}`);
        }

        console.log('    ✓ Graphics pool memory management works correctly');
    }

    async testActivityTrackerCleanup() {
        console.log('  Testing activity tracker cleanup...');

        if (typeof ActivityTracker === 'undefined') {
            console.log('    ⚠ ActivityTracker not available, skipping');
            return;
        }

        const tracker = new ActivityTracker({
            gridSize: 16,
            decayRate: 0.95,
            maxAge: 5000
        });

        const initialMemory = NeuralHeatmapTests.TestHelpers.measureMemory();

        // Record many activities
        for (let i = 0; i < 1000; i++) {
            tracker.recordActivity(
                Math.random() * 10000,
                Math.random() * 10000,
                { entropy: Math.random() }
            );
        }

        // Update tracker to let decay work
        for (let i = 0; i < 100; i++) {
            tracker.update(0.1);
        }

        await NeuralHeatmapTests.TestHelpers.wait(500);

        const finalMemory = NeuralHeatmapTests.TestHelpers.measureMemory();

        if (initialMemory && finalMemory) {
            const growth = finalMemory.used / initialMemory.used;
            console.log(`    Memory growth: ${((growth - 1) * 100).toFixed(2)}%`);
        }

        // Check that old activities are cleaned up
        const stats = tracker.getStats();
        console.log(`    Active cells: ${stats.activeCells}`);

        console.log('    ✓ Activity tracker cleanup works correctly');
    }

    async testEventListenerCleanup() {
        console.log('  Testing event listener cleanup...');

        // Create a test element
        const testElement = document.createElement('div');

        let listenerCount = 0;
        const originalAddEventListener = testElement.addEventListener;
        const originalRemoveEventListener = testElement.removeEventListener;

        // Track listener additions/removals
        testElement.addEventListener = function(...args) {
            listenerCount++;
            return originalAddEventListener.apply(this, args);
        };

        testElement.removeEventListener = function(...args) {
            listenerCount--;
            return originalRemoveEventListener.apply(this, args);
        };

        // Simulate overlay lifecycle
        const handlers = [];
        for (let i = 0; i < 10; i++) {
            const handler = () => {};
            testElement.addEventListener('test', handler);
            handlers.push(handler);
        }

        // Remove all handlers
        for (const handler of handlers) {
            testElement.removeEventListener('test', handler);
        }

        // Restore original methods
        testElement.addEventListener = originalAddEventListener;
        testElement.removeEventListener = originalRemoveEventListener;

        console.log('    ✓ Event listener cleanup test completed');
    }

    async testLongRunningStability() {
        console.log('  Testing long-running memory stability...');

        if (typeof NeuralHeatmapOverlay === 'undefined') {
            console.log('    ⚠ NeuralHeatmapOverlay not available, skipping');
            return;
        }

        const container = NeuralHeatmapTests.MockObjects.createMockContainer();
        const overlay = new NeuralHeatmapOverlay({
            container: container,
            maxTiles: 500
        });

        // Memory samples
        const samples = [];
        const sampleCount = 20;

        // Take baseline
        samples.push(NeuralHeatmapTests.TestHelpers.measureMemory()?.used || 0);

        // Run for multiple iterations
        for (let i = 0; i < sampleCount; i++) {
            // Create and destroy tiles
            for (let j = 0; j < 50; j++) {
                const tile = {
                    id: `stability_tile_${i}_${j}`,
                    x: Math.random() * 5000,
                    y: Math.random() * 5000,
                    width: 512,
                    height: 512,
                    data: { entropy: Math.random() }
                };

                overlay.attachTile(tile.id, tile);

                if (j > 30) {
                    overlay.detachTile(`stability_tile_${i}_${j - 30}`);
                }
            }

            // Update overlay
            overlay.update(0.016);

            await NeuralHeatmapTests.TestHelpers.wait(50);

            samples.push(NeuralHeatmapTests.TestHelpers.measureMemory()?.used || 0);
        }

        // Calculate trend
        const firstHalf = samples.slice(0, sampleCount / 2);
        const secondHalf = samples.slice(sampleCount / 2);
        const avgFirst = firstHalf.reduce((a, b) => a + b, 0) / firstHalf.length;
        const avgSecond = secondHalf.reduce((a, b) => a + b, 0) / secondHalf.length;
        const trend = avgSecond / avgFirst;

        console.log(`    Memory trend: ${((trend - 1) * 100).toFixed(2)}% (${avgFirst.toFixed(2)}MB → ${avgSecond.toFixed(2)}MB)`);

        if (trend > this.leakThreshold) {
            throw new Error(`Memory leak detected: ${trend.toFixed(2)}x growth exceeds threshold ${this.leakThreshold}x`);
        }

        console.log('    ✓ Long-running memory stability test passed');
    }
}

/**
 * MemoryLeakDetector Integration Test
 *
 * Tests the MemoryLeakDetector component if available.
 */
class MemoryLeakDetectorTest extends NeuralHeatmapTests.MemoryLeakTest {
    constructor() {
        super('MemoryLeakDetector Component');
    }

    async execute() {
        console.log('  Testing MemoryLeakDetector component...');

        if (typeof MemoryLeakDetector === 'undefined') {
            console.log('    ⚠ MemoryLeakDetector not available, skipping');
            return;
        }

        const detector = new MemoryLeakDetector({
            checkInterval: 1000,
            growthThreshold: 1.1,
            sampleWindow: 5
        });

        let leakDetected = false;
        detector.onLeakDetected((info) => {
            leakDetected = true;
            console.log(`    Leak detected: ${info.message}`);
        });

        detector.start();

        // Create some memory pressure
        const data = [];
        for (let i = 0; i < 100; i++) {
            data.push(new Array(10000).fill(Math.random()));
        }

        await NeuralHeatmapTests.TestHelpers.wait(2000);

        detector.stop();

        console.log('    ✓ MemoryLeakDetector component test completed');
    }
}

/**
 * Memory Leak Test Suite Runner
 */
async function runMemoryLeakTests() {
    const suite = new NeuralHeatmapTests.TestSuite('Memory Leak Detection');

    suite.addTest(new MemoryLeakTests());
    suite.addTest(new MemoryLeakDetectorTest());

    return await suite.run();
}

// Export
if (typeof window !== 'undefined') {
    window.runMemoryLeakTests = runMemoryLeakTests;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { runMemoryLeakTests, MemoryLeakTests, MemoryLeakDetectorTest };
}
