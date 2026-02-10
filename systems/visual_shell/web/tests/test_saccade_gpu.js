/**
 * Tests for SaccadeGPU - GPU-accelerated saccade calculations
 *
 * Phase 47: Tectonic Saccadic Optimization
 */

// Mock fetch for inline shader
if (typeof fetch === 'undefined') {
    global.fetch = async () => {
        throw new Error('Using inline shader');
    };
}

// Import SaccadeGPU
const { SaccadeGPU } = require('../saccade_gpu.js');

class SaccadeGPUTester {
    constructor() {
        this.results = [];
        this.passed = 0;
        this.failed = 0;
    }

    /**
     * Create test state
     */
    createTestState(overrides = {}) {
        return {
            position: { x: 0, y: 0 },
            target: { x: 100, y: 100 },
            startPos: { x: 0, y: 0 },
            velocity: { x: 0, y: 0 },
            settlingFactor: 0,
            phase: 1,  // saccade
            saccadeStartTime: Date.now(),
            settlingStartTime: Date.now(),
            ...overrides
        };
    }

    /**
     * Assert equality with tolerance
     */
    assertClose(actual, expected, tolerance = 0.001, message) {
        if (typeof actual === 'object' && actual !== null) {
            for (const key in actual) {
                this.assertClose(actual[key], expected[key], tolerance, `${message}.${key}`);
            }
        } else {
            const diff = Math.abs(actual - expected);
            if (diff > tolerance) {
                this.failed++;
                this.results.push({
                    test: message,
                    status: 'FAILED',
                    expected,
                    actual,
                    diff
                });
                return false;
            }
        }
        return true;
    }

    /**
     * Assert condition
     */
    assert(condition, message) {
        if (!condition) {
            this.failed++;
            this.results.push({
                test: message,
                status: 'FAILED',
                expected: true,
                actual: false
            });
            return false;
        }
        this.passed++;
        return true;
    }

    /**
     * Test initialization
     */
    async testInitialization() {
        console.log('Testing initialization...');
        const gpu = new SaccadeGPU();
        this.assert(!gpu._initialized, 'Should not be initialized before init()');
        this.assert(gpu.useCPUFallback === false, 'Should not use CPU fallback initially');

        const success = await gpu.init();
        this.assert(gpu._initialized, 'Should be initialized after init()');

        // Clean up
        gpu.destroy();
    }

    /**
     * Test saccade phase calculation
     */
    async testSaccadePhase() {
        console.log('Testing saccade phase...');
        const gpu = new SaccadeGPU({ saccadeDuration: 100 });
        await gpu.init();

        const now = Date.now();
        const state = this.createTestState({
            phase: 1,
            saccadeStartTime: now
        });

        // Compute at t=0 (should be at start)
        let result = await gpu.compute(state, now, 16);
        this.assertClose(result.position, state.startPos, 1, 'Position at t=0');
        this.assert(result.phase === 1, 'Should still be in saccade phase');

        // Compute at t=50ms (halfway)
        result = await gpu.compute(state, now + 50, 16);
        const expectedX = 0 + (100 - 0) * (1 - Math.pow(0.5, 3)); // ease-out cubic at 0.5
        this.assertClose(result.position.x, expectedX, 10, 'Position at t=50ms');

        // Compute at t=100ms (complete)
        result = await gpu.compute(state, now + 100, 16);
        this.assert(result.phase === 2, 'Should transition to settling phase');
        this.assertClose(result.settlingFactor, 0, 0.01, 'Settling factor reset');

        gpu.destroy();
    }

    /**
     * Test settling phase exponential calculation
     */
    async testSettlingPhase() {
        console.log('Testing settling phase...');
        const gpu = new SaccadeGPU({ settlingDuration: 200 });
        await gpu.init();

        const now = Date.now();
        const state = this.createTestState({
            phase: 2,
            settlingStartTime: now,
            position: { x: 95, y: 95 },
            target: { x: 100, y: 100 }
        });

        // Compute at t=0 (factor = 1 - e^0 = 0)
        let result = await gpu.compute(state, now, 16);
        this.assertClose(result.settlingFactor, 0, 0.01, 'Settling factor at t=0');

        // Compute at t=100ms (halfway, factor = 1 - e^-2.5)
        result = await gpu.compute(state, now + 100, 16);
        const expectedFactor = 1 - Math.exp(-2.5);
        this.assertClose(result.settlingFactor, expectedFactor, 0.05, 'Settling factor at t=100ms');

        // Compute at t=200ms (complete)
        result = await gpu.compute(state, now + 200, 16);
        this.assertClose(result.settlingFactor, 1, 0.01, 'Settling factor at completion');
        this.assert(result.phase === 3, 'Should transition to fixation phase');

        gpu.destroy();
    }

    /**
     * Test fixation phase micro-tremors
     */
    async testFixationPhase() {
        console.log('Testing fixation phase...');
        const gpu = new SaccadeGPU({ tremorAmount: 0.5 });
        await gpu.init();

        const now = Date.now();
        const state = this.createTestState({
            phase: 3,
            position: { x: 100, y: 100 }
        });

        // Multiple updates should produce small variations
        const positions = [];
        for (let i = 0; i < 10; i++) {
            const result = await gpu.compute(state, now + i * 16, 16);
            positions.push({ x: result.position.x, y: result.position.y });
        }

        // Check that positions vary within tremor range
        const xs = positions.map(p => p.x);
        const ys = positions.map(p => p.y);
        const xRange = Math.max(...xs) - Math.min(...xs);
        const yRange = Math.max(...ys) - Math.min(...ys);

        this.assert(xRange < 1.0, `X tremor range ${xRange} should be < 1.0`);
        this.assert(yRange < 1.0, `Y tremor range ${yRange} should be < 1.0`);
        this.assert(xRange > 0, 'X should have some variation');
        this.assert(yRange > 0, 'Y should have some variation');

        gpu.destroy();
    }

    /**
     * Test CPU fallback
     */
    async testCPUFallback() {
        console.log('Testing CPU fallback...');
        const gpu = new SaccadeGPU();
        gpu.useCPUFallback = true;
        await gpu.init();

        const now = Date.now();
        const state = this.createTestState({
            phase: 2,
            settlingStartTime: now
        });

        const result = await gpu.compute(state, now, 16);
        this.assert(!result.usedGPU, 'Should use CPU fallback');
        this.assert(result.computeTime !== undefined, 'Should return compute time');

        gpu.destroy();
    }

    /**
     * Benchmark GPU vs CPU
     */
    async benchmark(iterations = 1000) {
        console.log(`\nRunning benchmark with ${iterations} iterations...`);

        const gpu = new SaccadeGPU();
        await gpu.init();

        const results = {
            gpu: { times: [], totalTime: 0 },
            cpu: { times: [], totalTime: 0 }
        };

        const now = Date.now();
        const state = this.createTestState({
            phase: 2,
            settlingStartTime: now,
            position: { x: 50, y: 50 },
            target: { x: 100, y: 100 }
        });

        // Benchmark GPU (or CPU if unavailable)
        if (gpu.isUsingGPU()) {
            for (let i = 0; i < iterations; i++) {
                const result = await gpu.compute(state, now + i, 16);
                results.gpu.times.push(result.computeTime);
                results.gpu.totalTime += result.computeTime;
            }
            console.log(`GPU: avg ${(results.gpu.totalTime / iterations).toFixed(3)}ms`);
        } else {
            console.log('GPU not available, skipping GPU benchmark');
        }

        // Benchmark CPU fallback
        gpu.useCPUFallback = true;
        // Clear previous times
        results.cpu.times = [];
        results.cpu.totalTime = 0;

        for (let i = 0; i < iterations; i++) {
            const result = await gpu.compute(state, now + i, 16);
            results.cpu.times.push(result.computeTime);
            results.cpu.totalTime += result.computeTime;
        }
        console.log(`CPU: avg ${(results.cpu.totalTime / iterations).toFixed(3)}ms`);

        // Calculate improvement
        if (results.gpu.times.length > 0) {
            const avgGPU = results.gpu.totalTime / iterations;
            const avgCPU = results.cpu.totalTime / iterations;
            const improvement = avgCPU - avgGPU;
            const percentImprovement = (improvement / avgCPU) * 100;

            console.log(`\nImprovement: ${improvement.toFixed(3)}ms (${percentImprovement.toFixed(1)}%)`);

            if (improvement >= 5) {
                console.log('✓ Target 5ms improvement achieved!');
            } else {
                console.log(`✗ Target 5ms improvement not met (current: ${improvement.toFixed(3)}ms)`);
            }

            return { avgGPU, avgCPU, improvement, percentImprovement };
        }

        gpu.destroy();
    }

    /**
     * Run all tests
     */
    async runAll() {
        console.log('=== SaccadeGPU Test Suite ===\n');

        await this.testInitialization();
        await this.testSaccadePhase();
        await this.testSettlingPhase();
        await this.testFixationPhase();
        await this.testCPUFallback();

        console.log('\n=== Test Results ===');
        console.log(`Passed: ${this.passed}`);
        console.log(`Failed: ${this.failed}`);

        if (this.results.length > 0) {
            console.log('\nFailures:');
            this.results.forEach(r => {
                console.log(`  ${r.test}: ${r.status}`);
                console.log(`    Expected: ${JSON.stringify(r.expected)}`);
                console.log(`    Actual: ${JSON.stringify(r.actual)}`);
            });
        }

        console.log(`\n${this.failed === 0 ? '✓ All tests passed!' : '✗ Some tests failed'}`);

        return { passed: this.passed, failed: this.failed };
    }
}

// Run tests if executed directly
if (typeof require !== 'undefined' && require.main === module) {
    const tester = new SaccadeGPUTester();
    tester.runAll().then(() => {
        return tester.benchmark(1000);
    }).then(results => {
        if (results) {
            console.log('\nBenchmark complete');
        }
        process.exit(tester.failed > 0 ? 1 : 0);
    });
}

// Export for browser
if (typeof window !== 'undefined') {
    window.SaccadeGPUTester = SaccadeGPUTester;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SaccadeGPUTester };
}
