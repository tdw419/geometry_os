/**
 * NeuralPerceptionKernel Tests
 *
 * Tests the GPU-resident perception engine that interprets
 * visual patterns in RTS memory.
 */

class NeuralPerceptionKernelTests extends TestCase {
    constructor() {
        super('NeuralPerceptionKernel', { timeout: 10000 });
    }

    async execute() {
        await this.testInitialization();
        await this.testFeatureExtraction();
        await this.testPatternClassification();
        await this.testFractureDetection();
    }

    async testInitialization() {
        console.log('  Testing NeuralPerceptionKernel initialization...');

        const kernel = new NeuralPerceptionKernel();

        if (kernel.isReady !== false) {
            throw new Error('Expected isReady to be false before initialization');
        }

        if (typeof kernel.config !== 'object') {
            throw new Error('Expected config to be an object');
        }

        // Verify config defaults
        if (kernel.config.patchSize !== 16) {
            throw new Error('Expected default patchSize to be 16');
        }

        console.log('    NeuralPerceptionKernel initializes correctly');
    }

    async testFeatureExtraction() {
        console.log('  Testing feature extraction...');

        const kernel = new NeuralPerceptionKernel();

        // Create a test image patch (16x16 RGBA)
        const patch = new Uint8Array(16 * 16 * 4);
        for (let i = 0; i < patch.length; i += 4) {
            patch[i] = 128;     // R
            patch[i + 1] = 64;  // G
            patch[i + 2] = 32;  // B
            patch[i + 3] = 255; // A
        }

        const features = kernel.extractFeatures(patch);

        if (!features || features.length === 0) {
            throw new Error('Expected non-empty feature vector');
        }

        if (features.length !== 64) {
            throw new Error(`Expected 64 features, got ${features.length}`);
        }

        console.log('    Feature extraction works correctly');
    }

    async testPatternClassification() {
        console.log('  Testing pattern classification...');

        const kernel = new NeuralPerceptionKernel();

        // Create code-like pattern (high contrast, structured)
        const codePatch = new Uint8Array(16 * 16 * 4);
        for (let y = 0; y < 16; y++) {
            for (let x = 0; x < 16; x++) {
                const idx = (y * 16 + x) * 4;
                // Simulate code: alternating high/low
                const val = ((x + y) % 2 === 0) ? 255 : 0;
                codePatch[idx] = val;
                codePatch[idx + 1] = val;
                codePatch[idx + 2] = val;
                codePatch[idx + 3] = 255;
            }
        }

        const result = kernel.classify(codePatch);

        if (!result.type) {
            throw new Error('Expected classification result to have type');
        }

        if (typeof result.confidence !== 'number') {
            throw new Error('Expected confidence to be a number');
        }

        const validTypes = ['code', 'data', 'fracture', 'noise', 'unknown'];
        if (!validTypes.includes(result.type)) {
            throw new Error(`Invalid classification type: ${result.type}`);
        }

        console.log(`    Pattern classification: ${result.type} (${(result.confidence * 100).toFixed(1)}%)`);
    }

    async testFractureDetection() {
        console.log('  Testing fracture detection...');

        const kernel = new NeuralPerceptionKernel();

        // Create a fracture pattern (all black = dead pixels)
        const fracturePatch = new Uint8Array(16 * 16 * 4);
        // All zeros is a fracture indicator

        const result = kernel.classify(fracturePatch);

        if (result.type !== 'fracture') {
            throw new Error(`Expected fracture classification, got ${result.type}`);
        }

        console.log('    Fracture detection works correctly');
    }
}

// Export
if (typeof window !== 'undefined') {
    window.NeuralPerceptionKernelTests = NeuralPerceptionKernelTests;
}
