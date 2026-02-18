/**
 * PeripheralSubsampler Tests
 *
 * Tests the peripheral region subsampling logic that reduces
 * GPU load by rendering at lower resolution outside the foveal region.
 */

class PeripheralSubsamplerTests extends TestCase {
    constructor() {
        super('PeripheralSubsampler', { timeout: 10000 });
    }

    async execute() {
        await this.testInitialization();
        await this.testFovealRegionDetection();
        await this.testResolutionScaling();
        await this.testSaccadeTransition();
    }

    async testInitialization() {
        console.log('  Testing PeripheralSubsampler initialization...');

        const sampler = new PeripheralSubsampler({
            fovealRadius: 50,
            parafovealRadius: 150
        });

        if (sampler.config.fovealRadius !== 50) {
            throw new Error('Expected fovealRadius to be 50');
        }

        if (sampler.getResolution(0, 0, 0, 0) !== 1.0) {
            throw new Error('Expected full resolution at focus point');
        }

        console.log('    ✓ PeripheralSubsampler initializes correctly');
    }

    async testFovealRegionDetection() {
        console.log('  Testing foveal region detection...');

        const sampler = new PeripheralSubsampler({
            fovealRadius: 50,
            parafovealRadius: 150,
            peripheralRadius: 400
        });

        const focusX = 500, focusY = 500;

        // Inside foveal
        const foveal = sampler.getRegion(500, 500, focusX, focusY);
        if (foveal !== 'foveal') {
            throw new Error('Expected foveal region at focus point');
        }

        // Parafoveal
        const parafoveal = sampler.getRegion(600, 500, focusX, focusY);
        if (parafoveal !== 'parafoveal') {
            throw new Error(`Expected parafoveal at 100px, got ${parafoveal}`);
        }

        // Peripheral
        const peripheral = sampler.getRegion(1000, 500, focusX, focusY);
        if (peripheral !== 'peripheral') {
            throw new Error(`Expected peripheral at 500px, got ${peripheral}`);
        }

        console.log('    ✓ Foveal region detection works correctly');
    }

    async testResolutionScaling() {
        console.log('  Testing resolution scaling...');

        const sampler = new PeripheralSubsampler({
            fovealRadius: 50,
            parafovealRadius: 150,
            peripheralRadius: 400,
            fovealResolution: 1.0,
            parafovealResolution: 0.5,
            peripheralResolution: 0.25
        });

        const focusX = 500, focusY = 500;

        // Foveal = full resolution
        const fovealRes = sampler.getResolution(500, 500, focusX, focusY);
        if (fovealRes !== 1.0) {
            throw new Error(`Expected foveal resolution 1.0, got ${fovealRes}`);
        }

        // Parafoveal = 0.5 resolution
        const parafovealRes = sampler.getResolution(600, 500, focusX, focusY);
        if (parafovealRes !== 0.5) {
            throw new Error(`Expected parafoveal resolution 0.5, got ${parafovealRes}`);
        }

        // Peripheral = 0.25 resolution
        const peripheralRes = sampler.getResolution(1000, 500, focusX, focusY);
        if (peripheralRes !== 0.25) {
            throw new Error(`Expected peripheral resolution 0.25, got ${peripheralRes}`);
        }

        console.log('    ✓ Resolution scaling works correctly');
    }

    async testSaccadeTransition() {
        console.log('  Testing saccade transition...');

        const sampler = new PeripheralSubsampler();
        const focusX = 500, focusY = 500;

        // Before saccade
        sampler.setFocus(focusX, focusY);
        const before = sampler.getResolution(500, 500, focusX, focusY);

        // During saccade (focus moves)
        const newFocusX = 1000, newFocusY = 500;
        sampler.setFocus(newFocusX, newFocusY);
        const after = sampler.getResolution(1000, 1000, newFocusX, newFocusY);

        if (before !== 1.0 || after !== 1.0) {
            throw new Error('Focus point should always have full resolution');
        }

        console.log('    ✓ Saccade transition works correctly');
    }
}

// Export
if (typeof window !== 'undefined') {
    window.PeripheralSubsamplerTests = PeripheralSubsamplerTests;
}
