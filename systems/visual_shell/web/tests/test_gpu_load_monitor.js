/**
 * GPULoadMonitor Tests
 *
 * Tests WebGPU timestamp query support for measuring GPU execution time.
 * Falls back to CPU estimation when timestamp queries are unavailable.
 */

class GPULoadMonitorTests extends TestCase {
    constructor() {
        super('GPULoadMonitor', { timeout: 10000 });
    }

    async execute() {
        await this.testInitialization();
        await this.testStartStopMeasurement();
        await this.testLoadCalculation();
        await this.testBaselineComparison();
    }

    async testInitialization() {
        console.log('  Testing GPULoadMonitor initialization...');

        const monitor = new GPULoadMonitor();

        if (monitor.isMeasuring !== false) {
            throw new Error('Expected isMeasuring to be false initially');
        }

        if (typeof monitor.supportsTimestampQueries !== 'boolean') {
            throw new Error('Expected supportsTimestampQueries to be boolean');
        }

        console.log('    ✓ GPULoadMonitor initializes correctly');
    }

    async testStartStopMeasurement() {
        console.log('  Testing start/stop measurement...');

        const monitor = new GPULoadMonitor();

        monitor.startFrame();
        if (!monitor.isMeasuring) {
            throw new Error('Expected isMeasuring to be true after startFrame()');
        }

        const gpuTime = monitor.endFrame();
        if (typeof gpuTime !== 'number' || gpuTime < 0) {
            throw new Error('Expected endFrame() to return non-negative number');
        }

        if (monitor.isMeasuring) {
            throw new Error('Expected isMeasuring to be false after endFrame()');
        }

        console.log('    ✓ Start/stop measurement works correctly');
    }

    async testLoadCalculation() {
        console.log('  Testing load calculation...');

        const monitor = new GPULoadMonitor();

        // Simulate 10 frames
        for (let i = 0; i < 10; i++) {
            monitor.startFrame();
            await new Promise(r => setTimeout(r, 1)); // Simulate work
            monitor.endFrame();
        }

        const stats = monitor.getStats();

        if (typeof stats.meanGpuTime !== 'number') {
            throw new Error('Expected stats to include meanGpuTime');
        }

        if (typeof stats.frameCount !== 'number' || stats.frameCount !== 10) {
            throw new Error('Expected frameCount to be 10');
        }

        console.log(`    ✓ Load calculation works (mean: ${stats.meanGpuTime.toFixed(2)}ms)`);
    }

    async testBaselineComparison() {
        console.log('  Testing baseline comparison...');

        const monitor = new GPULoadMonitor();

        // Record baseline (full resolution)
        monitor.setBaseline(16.0); // 16ms baseline

        // Simulate foveated (reduced load)
        for (let i = 0; i < 10; i++) {
            monitor.startFrame();
            monitor.endFrame();
        }

        const reduction = monitor.getLoadReduction();

        if (typeof reduction.percentReduction !== 'number') {
            throw new Error('Expected percentReduction in result');
        }

        console.log(`    ✓ Baseline comparison works (${reduction.percentReduction.toFixed(1)}% reduction)`);
    }
}

// Export
if (typeof window !== 'undefined') {
    window.GPULoadMonitorTests = GPULoadMonitorTests;
}
