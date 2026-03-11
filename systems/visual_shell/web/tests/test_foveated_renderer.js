/**
 * FoveatedRenderer Tests
 *
 * Tests the main foveated rendering orchestrator that combines:
 * - SaccadeEngine for focus tracking
 * - PeripheralSubsampler for resolution scaling
 * - GPULoadMonitor for performance measurement
 */

class FoveatedRendererTests extends TestCase {
    constructor() {
        super('FoveatedRenderer', { timeout: 10000 });
    }

    async execute() {
        await this.testInitialization();
        await this.testFocusTracking();
        await this.testMultiResolutionPass();
        await this.test50PercentLoadReduction();
    }

    async testInitialization() {
        console.log('  Testing FoveatedRenderer initialization...');

        if (typeof FoveatedRenderer === 'undefined') {
            throw new Error('FoveatedRenderer is not defined. Please implement the class first.');
        }

        const renderer = new FoveatedRenderer();

        if (!renderer.saccadeEngine) {
            throw new Error('Expected saccadeEngine to be initialized');
        }

        if (!renderer.subsampler) {
            throw new Error('Expected subsampler to be initialized');
        }

        if (!renderer.loadMonitor) {
            throw new Error('Expected loadMonitor to be initialized');
        }

        console.log('    ✓ FoveatedRenderer initializes correctly');
    }

    async testFocusTracking() {
        console.log('  Testing focus tracking...');

        const renderer = new FoveatedRenderer();

        // Set focus
        renderer.setFocus(500, 500);

        if (renderer.getFocus().x !== 500 || renderer.getFocus().y !== 500) {
            throw new Error('Focus point not set correctly');
        }

        // Simulate saccade
        renderer.triggerSaccade(1000, 500);

        // Wait for saccade to complete
        await new Promise(r => setTimeout(r, 100));

        const newFocus = renderer.getFocus();
        if (newFocus.x === 500) {
            throw new Error('Focus should have moved after saccade');
        }

        console.log('    ✓ Focus tracking works correctly');
    }

    async testMultiResolutionPass() {
        console.log('  Testing multi-resolution pass...');

        const renderer = new FoveatedRenderer();

        // Create test tiles
        const tiles = [];
        for (let i = 0; i < 50; i++) {
            tiles.push({
                x: Math.random() * 1920,
                y: Math.random() * 1080,
                width: 64,
                height: 64
            });
        }

        // Set focus to center
        renderer.setFocus(960, 540);

        // Calculate pass requirements
        const pass = renderer.calculatePasses(tiles);

        if (!pass.foveal || !pass.peripheral) {
            throw new Error('Expected foveal and peripheral passes');
        }

        console.log(`    ✓ Multi-resolution pass: ${pass.foveal.length} foveal, ${pass.peripheral.length} peripheral`);
    }

    async test50PercentLoadReduction() {
        console.log('  Testing 50% load reduction target...');

        const renderer = new FoveatedRenderer();

        // Create 100 tiles spread across viewport
        const tiles = [];
        for (let i = 0; i < 100; i++) {
            tiles.push({
                x: (i % 10) * 192,
                y: Math.floor(i / 10) * 108,
                width: 192,
                height: 108
            });
        }

        // Set focus to center
        renderer.setFocus(960, 540);

        // Calculate load reduction
        const reduction = renderer.calculateLoadReduction(tiles);

        console.log(`    Load reduction: ${reduction.loadReduction.toFixed(1)}%`);
        console.log(`    Foveal: ${reduction.fovealPixels}, Parafoveal: ${reduction.parafovealPixels}, Peripheral: ${reduction.peripheralPixels}`);

        if (reduction.loadReduction < 50) {
            throw new Error(`Expected >= 50% load reduction, got ${reduction.loadReduction.toFixed(1)}%`);
        }

        console.log('    ✓ 50% load reduction target met!');
    }
}

// Export for test runner
if (typeof window !== 'undefined') {
    window.FoveatedRendererTests = FoveatedRendererTests;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { FoveatedRendererTests };
}
