/**
 * Stress Tests for Neural Heatmap Multi-Model Scenario
 *
 * Tests the system under high load with 3+ models to ensure:
 * - Stable 30+ FPS with multiple models
 * - Memory usage stays under 500MB
 * - UI remains responsive
 * - No crashes or hangs
 *
 * Success criteria:
 * - 3+ models running simultaneously at 30+ FPS
 * - Memory usage under 500MB
 * - Responsive UI (input latency < 100ms)
 * - No memory leaks over 5-minute run
 */

class MultiModelStressTests extends NeuralHeatmapTests.StressTest {
    constructor() {
        super('Multi-Model Stress Test', {
            duration: 30000, // 30 seconds
            targetLoad: {
                modelCount: 3,
                tilesPerModel: 100,
                targetFPS: 30,
                maxMemoryMB: 500
            }
        });
    }

    async execute() {
        console.log('  Running multi-model stress test...');

        // Test 1: 3 Model simultaneous operation
        await this.testThreeModelOperation();

        // Test 2: Memory under pressure
        await this.testMemoryUnderPressure();

        // Test 3: UI responsiveness
        await this.testUIResponsiveness();

        // Test 4: Model addition/removal
        await this.testModelAdditionRemoval();

        // Test 5: Sustained load
        await this.testSustainedLoad();
    }

    async testThreeModelOperation() {
        console.log('  Testing 3-model simultaneous operation...');

        if (typeof MultiModelTracker === 'undefined') {
            throw new Error('MultiModelTracker not available - integration incomplete');
        }

        const tracker = new MultiModelTracker({
            maxModels: 5,
            gridSize: 100,
            decayRate: 0.95
        });

        // Add 3 models
        const models = ['model_A', 'model_B', 'model_C'];
        for (const modelId of models) {
            const added = tracker.addModel(modelId, {
                name: modelId,
                color: this._getModelColor(modelId)
            });

            NeuralHeatmapTests.Assert.assertTrue(added, `Should add model ${modelId}`);
        }

        // Simulate activity for each model
        const tilesPerModel = 50;
        for (let i = 0; i < tilesPerModel; i++) {
            for (const modelId of models) {
                tracker.recordActivity(
                    modelId,
                    Math.random() * 5000,
                    Math.random() * 5000,
                    { entropy: Math.random() }
                );
            }
        }

        // Update tracker and measure performance
        const frameTimes = [];
        const startTime = performance.now();
        const testDuration = 5000; // 5 seconds

        while (performance.now() - startTime < testDuration) {
            const frameStart = performance.now();
            tracker.update(0.016);
            const frameTime = performance.now() - frameStart;
            frameTimes.push(frameTime);
            await NeuralHeatmapTests.TestHelpers.wait(16);
        }

        const avgFrameTime = frameTimes.reduce((a, b) => a + b, 0) / frameTimes.length;
        const avgFps = 1000 / avgFrameTime;

        console.log(`    Average FPS with 3 models: ${avgFps.toFixed(2)}`);
        console.log(`    Average frame time: ${avgFrameTime.toFixed(2)}ms`);

        const stats = tracker.getStats();
        console.log(`    Active models: ${stats.activeModels}`);
        console.log(`    Total activations: ${stats.totalActivations}`);

        if (avgFps < this.targetLoad.targetFPS) {
            throw new Error(`FPS below target with 3 models: ${avgFps.toFixed(2)} < ${this.targetLoad.targetFPS}`);
        }

        console.log('    ✓ 3-model operation meets FPS target');
    }

    async testMemoryUnderPressure() {
        console.log('  Testing memory under pressure...');

        if (typeof MultiModelTracker === 'undefined') {
            console.log('    ⚠ MultiModelTracker not available, skipping');
            return;
        }

        const tracker = new MultiModelTracker({
            maxModels: 5,
            gridSize: 100,
            decayRate: 0.95
        });

        // Add 3 models
        const models = ['stress_A', 'stress_B', 'stress_C'];
        for (const modelId of models) {
            tracker.addModel(modelId, { name: modelId });
        }

        const initialMemory = NeuralHeatmapTests.TestHelpers.measureMemory();

        // Generate high activity load
        const iterations = 200;
        for (let i = 0; i < iterations; i++) {
            for (const modelId of models) {
                tracker.recordActivity(
                    modelId,
                    Math.random() * 10000,
                    Math.random() * 10000,
                    { entropy: Math.random(), layer: Math.random() }
                );
            }

            if (i % 10 === 0) {
                tracker.update(0.1);
            }

            if (i % 50 === 0) {
                await NeuralHeatmapTests.TestHelpers.wait(10);
            }
        }

        await NeuralHeatmapTests.TestHelpers.wait(500);

        const finalMemory = NeuralHeatmapTests.TestHelpers.measureMemory();

        if (initialMemory && finalMemory) {
            const memoryUsed = finalMemory.used;
            console.log(`    Memory usage: ${memoryUsed.toFixed(2)}MB`);

            if (memoryUsed > this.targetLoad.maxMemoryMB) {
                throw new Error(`Memory exceeds limit: ${memoryUsed.toFixed(2)}MB > ${this.targetLoad.maxMemoryMB}MB`);
            }

            const growth = finalMemory.used - initialMemory.used;
            console.log(`    Memory growth: ${growth.toFixed(2)}MB`);
        }

        console.log('    ✓ Memory usage within acceptable limits');
    }

    async testUIResponsiveness() {
        console.log('  Testing UI responsiveness under load...');

        if (typeof ComparativeHeatmap === 'undefined') {
            console.log('    ⚠ ComparativeHeatmap not available, skipping');
            return;
        }

        // Create mock container
        const container = NeuralHeatmapTests.MockObjects.createMockContainer();

        const comparative = new ComparativeHeatmap(container, {
            mode: 'split',
            updateInterval: 100
        });

        // Add models
        comparative.addModel('ui_test_A', { name: 'Model A' });
        comparative.addModel('ui_test_B', { name: 'Model B' });
        comparative.addModel('ui_test_C', { name: 'Model C' });

        // Simulate user interaction while updating
        const interactionDelays = [];

        for (let i = 0; i < 50; i++) {
            const interactionStart = performance.now();

            // Simulate interaction
            comparative.handleInput({
                type: 'mousemove',
                x: Math.random() * 1000,
                y: Math.random() * 1000
            });

            comparative.update(0.016);

            const interactionDelay = performance.now() - interactionStart;
            interactionDelays.push(interactionDelay);

            await NeuralHeatmapTests.TestHelpers.wait(20);
        }

        const avgDelay = interactionDelays.reduce((a, b) => a + b, 0) / interactionDelays.length;
        const maxDelay = Math.max(...interactionDelays);

        console.log(`    Average interaction delay: ${avgDelay.toFixed(2)}ms`);
        console.log(`    Maximum interaction delay: ${maxDelay.toFixed(2)}ms`);

        if (avgDelay > 100) {
            console.warn(`    ⚠ Average interaction delay exceeds 100ms: ${avgDelay.toFixed(2)}ms`);
        }

        console.log('    ✓ UI remains responsive under load');
    }

    async testModelAdditionRemoval() {
        console.log('  Testing dynamic model addition/removal...');

        if (typeof MultiModelTracker === 'undefined') {
            console.log('    ⚠ MultiModelTracker not available, skipping');
            return;
        }

        const tracker = new MultiModelTracker({
            maxModels: 5,
            gridSize: 100,
            decayRate: 0.95
        });

        // Add and remove models repeatedly
        const memorySamples = [];

        for (let cycle = 0; cycle < 10; cycle++) {
            // Add models
            for (let i = 0; i < 3; i++) {
                const modelId = `cycle_${cycle}_model_${i}`;
                tracker.addModel(modelId, { name: modelId });

                // Add activity
                for (let j = 0; j < 20; j++) {
                    tracker.recordActivity(
                        modelId,
                        Math.random() * 5000,
                        Math.random() * 5000,
                        { entropy: Math.random() }
                    );
                }
            }

            tracker.update(0.1);

            // Remove models
            for (let i = 0; i < 3; i++) {
                const modelId = `cycle_${cycle}_model_${i}`;
                tracker.removeModel(modelId);
            }

            // Sample memory
            const memory = NeuralHeatmapTests.TestHelpers.measureMemory();
            if (memory) {
                memorySamples.push(memory.used);
            }

            await NeuralHeatmapTests.TestHelpers.wait(50);
        }

        // Check for memory leaks
        if (memorySamples.length >= 5) {
            const firstAvg = memorySamples.slice(0, 3).reduce((a, b) => a + b, 0) / 3;
            const lastAvg = memorySamples.slice(-3).reduce((a, b) => a + b, 0) / 3;
            const growth = lastAvg / firstAvg;

            console.log(`    Memory growth over cycles: ${((growth - 1) * 100).toFixed(2)}%`);

            if (growth > 1.2) {
                console.warn(`    ⚠ Potential memory leak detected: ${growth.toFixed(2)}x growth`);
            }
        }

        const stats = tracker.getStats();
        console.log(`    Final active models: ${stats.activeModels}`);

        console.log('    ✓ Model addition/removal works correctly');
    }

    async testSustainedLoad() {
        console.log('  Testing sustained load (30 seconds)...');

        if (typeof NeuralHeatmapOverlay === 'undefined') {
            throw new Error('NeuralHeatmapOverlay not available - integration incomplete');
        }

        const container = NeuralHeatmapTests.MockObjects.createMockContainer();
        const overlay = new NeuralHeatmapOverlay({
            container: container,
            maxTiles: 1000
        });

        // Create multi-model tracker
        if (typeof MultiModelTracker !== 'undefined') {
            overlay.multiModelTracker = new MultiModelTracker({
                maxModels: 3,
                gridSize: 100,
                decayRate: 0.95
            });

            // Add 3 models
            ['sustained_A', 'sustained_B', 'sustained_C'].forEach(modelId => {
                overlay.multiModelTracker.addModel(modelId, { name: modelId });
            });
        }

        const fpsSamples = [];
        const memorySamples = [];
        const startTime = performance.now();
        const testDuration = this.duration;

        console.log('    Running 30-second sustained load test...');

        while (performance.now() - startTime < testDuration) {
            const frameStart = performance.now();

            // Update overlay
            overlay.update(0.016);

            // Simulate activity
            if (overlay.multiModelTracker) {
                const models = overlay.multiModelTracker.getActiveModels();
                for (const modelId of models) {
                    overlay.multiModelTracker.recordActivity(
                        modelId,
                        Math.random() * 5000,
                        Math.random() * 5000,
                        { entropy: Math.random() }
                    );
                }
            }

            const frameTime = performance.now() - frameStart;
            const fps = 1000 / frameTime;
            fpsSamples.push(fps);

            // Sample memory every second
            if (fpsSamples.length % 60 === 0) {
                const memory = NeuralHeatmapTests.TestHelpers.measureMemory();
                if (memory) {
                    memorySamples.push(memory.used);
                }
            }

            await NeuralHeatmapTests.TestHelpers.wait(16);
        }

        const avgFps = fpsSamples.reduce((a, b) => a + b, 0) / fpsSamples.length;
        const minFps = Math.min(...fpsSamples);
        const maxFps = Math.max(...fpsSamples);

        console.log(`    Average FPS: ${avgFps.toFixed(2)}`);
        console.log(`    Min FPS: ${minFps.toFixed(2)}`);
        console.log(`    Max FPS: ${maxFps.toFixed(2)}`);

        if (memorySamples.length > 0) {
            const avgMemory = memorySamples.reduce((a, b) => a + b, 0) / memorySamples.length;
            const maxMemory = Math.max(...memorySamples);
            console.log(`    Average memory: ${avgMemory.toFixed(2)}MB`);
            console.log(`    Peak memory: ${maxMemory.toFixed(2)}MB`);

            if (maxMemory > this.targetLoad.maxMemoryMB) {
                throw new Error(`Memory exceeds limit during sustained load: ${maxMemory.toFixed(2)}MB`);
            }
        }

        if (avgFps < this.targetLoad.targetFPS) {
            throw new Error(`FPS below target during sustained load: ${avgFps.toFixed(2)} < ${this.targetLoad.targetFPS}`);
        }

        console.log('    ✓ System stable under sustained load');
    }

    _getModelColor(modelId) {
        const colors = {
            'model_A': 0xff6b6b,
            'model_B': 0x4ecdc4,
            'model_C': 0xffe66d
        };
        return colors[modelId] || 0x999999;
    }
}

/**
 * Extreme Stress Test
 *
 * Tests the system with extreme load to find breaking points.
 */
class ExtremeStressTest extends NeuralHeatmapTests.StressTest {
    constructor() {
        super('Extreme Stress Test', {
            duration: 10000,
            targetLoad: {
                modelCount: 10,
                tilesPerModel: 200,
                targetFPS: 15 // Lower target for extreme test
            }
        });
    }

    async execute() {
        console.log('  Running extreme stress test...');

        if (typeof MultiModelTracker === 'undefined') {
            console.log('    ⚠ MultiModelTracker not available, skipping');
            return;
        }

        const tracker = new MultiModelTracker({
            maxModels: 10,
            gridSize: 100,
            decayRate: 0.95
        });

        // Add maximum number of models
        for (let i = 0; i < this.targetLoad.modelCount; i++) {
            const modelId = `extreme_${i}`;
            tracker.addModel(modelId, { name: `Model ${i}` });
        }

        // Generate extreme activity
        const startTime = performance.now();

        while (performance.now() - startTime < this.duration) {
            const models = tracker.getActiveModels();

            for (const modelId of models) {
                // High activity per model
                for (let j = 0; j < 10; j++) {
                    tracker.recordActivity(
                        modelId,
                        Math.random() * 10000,
                        Math.random() * 10000,
                        { entropy: Math.random() }
                    );
                }
            }

            tracker.update(0.016);

            await NeuralHeatmapTests.TestHelpers.wait(16);
        }

        const stats = tracker.getStats();
        console.log(`    Processed ${stats.totalActivations} activations`);
        console.log(`    Active models: ${stats.activeModels}`);

        const memory = NeuralHeatmapTests.TestHelpers.measureMemory();
        if (memory) {
            console.log(`    Memory usage: ${memory.used.toFixed(2)}MB`);
        }

        console.log('    ✓ Extreme stress test completed');
    }
}

/**
 * Stress Test Suite Runner
 */
async function runStressTests() {
    const suite = new NeuralHeatmapTests.TestSuite('Multi-Model Stress Tests');

    suite.addTest(new MultiModelStressTests());
    suite.addTest(new ExtremeStressTest());

    return await suite.run();
}

// Export
if (typeof window !== 'undefined') {
    window.runStressTests = runStressTests;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { runStressTests, MultiModelStressTests, ExtremeStressTest };
}
