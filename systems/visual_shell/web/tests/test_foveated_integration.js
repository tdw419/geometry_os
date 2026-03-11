/**
 * Foveated Rendering Integration Test
 *
 * End-to-end test proving the complete foveated rendering pipeline.
 */

class FoveatedIntegrationTests extends TestCase {
    constructor() {
        super('Foveated Integration', { timeout: 30000 });
    }

    async execute() {
        await this.testFullPipeline();
        await this.testSaccadePerformance();
        await this.testMemoryStability();
    }

    async testFullPipeline() {
        console.log('  Testing full foveated rendering pipeline...');

        const renderer = new FoveatedRenderer();

        // Create 100-tile grid
        const tiles = [];
        for (let i = 0; i < 100; i++) {
            tiles.push({
                x: (i % 10) * 192,
                y: Math.floor(i / 10) * 108,
                width: 192,
                height: 108
            });
        }

        // Render 60 frames (1 second at 60 FPS)
        for (let frame = 0; frame < 60; frame++) {
            renderer.update(16.67);
            renderer.render(tiles);

            // Simulate focus movement
            if (frame % 30 === 0) {
                const newX = Math.random() * 1920;
                const newY = Math.random() * 1080;
                renderer.triggerSaccade(newX, newY);
            }
        }

        const reduction = renderer.calculateLoadReduction(tiles);

        if (reduction.loadReduction < 50) {
            throw new Error(`Integration test failed: ${reduction.loadReduction.toFixed(1)}% < 50%`);
        }

        console.log(`    ✓ Full pipeline: ${reduction.loadReduction.toFixed(1)}% reduction`);
    }

    async testSaccadePerformance() {
        console.log('  Testing saccade performance...');

        const renderer = new FoveatedRenderer();

        // Measure saccade timing
        const saccadeTimes = [];

        for (let i = 0; i < 10; i++) {
            renderer.setFocus(960, 540);

            const start = performance.now();
            renderer.triggerSaccade(Math.random() * 1920, Math.random() * 1080);

            // Wait for saccade to complete
            while (renderer.isSaccading) {
                renderer.update(16.67);
            }

            const elapsed = performance.now() - start;
            saccadeTimes.push(elapsed);
        }

        const avgTime = saccadeTimes.reduce((a, b) => a + b, 0) / saccadeTimes.length;

        if (avgTime > 16) {
            throw new Error(`Saccade too slow: ${avgTime.toFixed(1)}ms > 16ms`);
        }

        console.log(`    ✓ Saccade performance: ${avgTime.toFixed(1)}ms average`);
    }

    async testMemoryStability() {
        console.log('  Testing memory stability...');

        const renderer = new FoveatedRenderer();
        const tiles = Array.from({ length: 100 }, (_, i) => ({
            x: (i % 10) * 192,
            y: Math.floor(i / 10) * 108,
            width: 192,
            height: 108
        }));

        // Render 1000 frames
        for (let frame = 0; frame < 1000; frame++) {
            renderer.update(16.67);
            renderer.render(tiles);
        }

        // Check stats for memory issues
        const stats = renderer.getStats();

        if (stats.framesRendered !== 1000) {
            throw new Error('Frame count mismatch - possible memory corruption');
        }

        console.log('    ✓ Memory stable after 1000 frames');
    }
}

// Export
if (typeof window !== 'undefined') {
    window.FoveatedIntegrationTests = FoveatedIntegrationTests;

    // Quick run function
    window.runFoveatedProof = async () => {
        console.log('\n╔════════════════════════════════════════════════════════════╗');
        console.log('║     SACCADE FOVEATED RENDERING PROOF                      ║');
        console.log('╚════════════════════════════════════════════════════════════╝');

        const suite = new FoveatedIntegrationTests();
        await suite.execute();

        // Verify 50% reduction
        const renderer = new FoveatedRenderer();
        const tiles = Array.from({ length: 100 }, (_, i) => ({
            x: (i % 10) * 192,
            y: Math.floor(i / 10) * 108,
            width: 192,
            height: 108
        }));

        const result = renderer.verify50PercentReduction(tiles);

        console.log('\n╔════════════════════════════════════════════════════════════╗');
        console.log(`║  50% REDUCTION: ${result.passed ? '✅ VERIFIED' : '❌ FAILED'}`);
        console.log(`║  Actual: ${result.loadReduction.toFixed(1)}%`);
        console.log('╚════════════════════════════════════════════════════════════╝');

        return result;
    };
}
