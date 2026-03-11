/**
 * Geometry OS: Framebuffer Integration Test
 *
 * Tests the Phase 2 framebuffer integration with dirty rectangle tracking
 * and partial texture updates.
 */

class FramebufferIntegrationTest {
    constructor() {
        this.infiniteMap = null;
        this.pixelCPUIntegration = null;
        this.testResults = [];
        this.performanceMetrics = [];
    }

    /**
     * Run all framebuffer integration tests
     */
    async runAllTests() {
        console.log('🧪 Starting Framebuffer Integration Tests...\n');

        try {
            // Test 1: Initialize PixelCPUIntegration
            await this.testInitialization();

            // Test 2: Test framebuffer creation
            await this.testFramebufferCreation();

            // Test 3: Test dirty rectangle tracking
            await this.testDirtyRectangleTracking();

            // Test 4: Test partial texture updates
            await this.testPartialTextureUpdates();

            // Test 5: Test resolution changes
            await this.testResolutionChanges();

            // Test 6: Test performance with <3ms target
            await this.testPerformanceTarget();

            // Print summary
            this.printTestSummary();

            return this.testResults;
        } catch (error) {
            console.error('❌ Test suite failed:', error);
            throw error;
        }
    }

    /**
     * Test 1: Initialize PixelCPUIntegration
     */
    async testInitialization() {
        console.log('Test 1: Initializing PixelCPUIntegration...');

        try {
            // Create a mock infinite map for testing
            this.infiniteMap = {
                world: new PIXI.Container(),
                app: {
                    screen: { width: 1920, height: 1080 }
                }
            };

            // Create PixelCPUIntegration instance
            this.pixelCPUIntegration = new PixelCPUIntegration(this.infiniteMap, {
                framebufferWidth: 640,
                framebufferHeight: 480,
                cyclesPerFrame: 1000
            });

            // Verify initialization
            const state = this.pixelCPUIntegration.getState();
            if (state && typeof state.pc === 'number') {
                this.recordTest('Initialization', true, 'PixelCPUIntegration initialized successfully');
                console.log('✅ Test 1 PASSED: PixelCPUIntegration initialized\n');
            } else {
                throw new Error('Invalid state after initialization');
            }
        } catch (error) {
            this.recordTest('Initialization', false, error.message);
            console.error('❌ Test 1 FAILED:', error.message, '\n');
            throw error;
        }
    }

    /**
     * Test 2: Test framebuffer creation
     */
    async testFramebufferCreation() {
        console.log('Test 2: Testing framebuffer creation...');

        try {
            // Create framebuffer texture
            this.pixelCPUIntegration.createFramebufferTexture();

            // Verify framebuffer texture was created
            if (this.pixelCPUIntegration.framebufferTexture &&
                this.pixelCPUIntegration.framebufferSprite) {
                this.recordTest('Framebuffer Creation', true, 'Framebuffer texture and sprite created');
                console.log('✅ Test 2 PASSED: Framebuffer created\n');
            } else {
                throw new Error('Framebuffer texture or sprite not created');
            }
        } catch (error) {
            this.recordTest('Framebuffer Creation', false, error.message);
            console.error('❌ Test 2 FAILED:', error.message, '\n');
            throw error;
        }
    }

    /**
     * Test 3: Test dirty rectangle tracking
     */
    async testDirtyRectangleTracking() {
        console.log('Test 3: Testing dirty rectangle tracking...');

        try {
            const cpu = this.pixelCPUIntegration.cpu;

            // Write some pixels to framebuffer
            const fbBase = cpu.framebufferBase;

            // Write pixel at (10, 10) - should create dirty rect
            cpu.writeMemory(fbBase + (10 * 640 + 10) * 4, 255);     // R
            cpu.writeMemory(fbBase + (10 * 640 + 10) * 4 + 1, 0);   // G
            cpu.writeMemory(fbBase + (10 * 640 + 10) * 4 + 2, 0);   // B
            cpu.writeMemory(fbBase + (10 * 640 + 10) * 4 + 3, 255); // A

            // Write pixel at (100, 100) - should create another dirty rect
            cpu.writeMemory(fbBase + (100 * 640 + 100) * 4, 0);     // R
            cpu.writeMemory(fbBase + (100 * 640 + 100) * 4 + 1, 255); // G
            cpu.writeMemory(fbBase + (100 * 640 + 100) * 4 + 2, 0);   // B
            cpu.writeMemory(fbBase + (100 * 640 + 100) * 4 + 3, 255); // A

            // Check dirty rectangles
            const dirtyRects = cpu.getDirtyRects();

            if (dirtyRects.length >= 2) {
                this.recordTest('Dirty Rectangle Tracking', true, `Tracked ${dirtyRects.length} dirty rectangles`);
                console.log(`✅ Test 3 PASSED: ${dirtyRects.length} dirty rectangles tracked\n`);
                console.log(`   Dirty rects:`, dirtyRects.map(r => `(${r.x},${r.y}) ${r.width}x${r.height}`).join(', '), '\n');
            } else {
                throw new Error(`Expected at least 2 dirty rectangles, got ${dirtyRects.length}`);
            }
        } catch (error) {
            this.recordTest('Dirty Rectangle Tracking', false, error.message);
            console.error('❌ Test 3 FAILED:', error.message, '\n');
            throw error;
        }
    }

    /**
     * Test 4: Test partial texture updates
     */
    async testPartialTextureUpdates() {
        console.log('Test 4: Testing partial texture updates...');

        try {
            const startTime = performance.now();

            // Update framebuffer (should only update dirty regions)
            this.pixelCPUIntegration.updateFramebuffer();

            const updateTime = performance.now() - startTime;

            // Verify dirty rectangles were cleared
            const dirtyRectsAfter = this.pixelCPUIntegration.cpu.getDirtyRects();

            if (dirtyRectsAfter.length === 0 && updateTime < 5) {
                this.recordTest('Partial Texture Updates', true, `Updated in ${updateTime.toFixed(2)}ms, dirty rects cleared`);
                console.log(`✅ Test 4 PASSED: Partial update completed in ${updateTime.toFixed(2)}ms\n`);
            } else {
                throw new Error(`Dirty rects not cleared (${dirtyRectsAfter.length} remaining) or update too slow (${updateTime.toFixed(2)}ms)`);
            }
        } catch (error) {
            this.recordTest('Partial Texture Updates', false, error.message);
            console.error('❌ Test 4 FAILED:', error.message, '\n');
            throw error;
        }
    }

    /**
     * Test 5: Test resolution changes
     */
    async testResolutionChanges() {
        console.log('Test 5: Testing resolution changes...');

        try {
            const resolutions = [
                { width: 640, height: 480 },
                { width: 800, height: 600 },
                { width: 1024, height: 768 }
            ];

            for (const res of resolutions) {
                this.pixelCPUIntegration.setFramebufferResolution(res.width, res.height);

                const currentRes = this.pixelCPUIntegration.getFramebufferResolution();

                if (currentRes.width !== res.width || currentRes.height !== res.height) {
                    throw new Error(`Resolution mismatch: expected ${res.width}x${res.height}, got ${currentRes.width}x${currentRes.height}`);
                }

                console.log(`   ✓ Resolution changed to ${res.width}x${res.height}`);
            }

            this.recordTest('Resolution Changes', true, 'Successfully tested all supported resolutions');
            console.log('✅ Test 5 PASSED: All resolution changes successful\n');
        } catch (error) {
            this.recordTest('Resolution Changes', false, error.message);
            console.error('❌ Test 5 FAILED:', error.message, '\n');
            throw error;
        }
    }

    /**
     * Test 6: Test performance with <3ms target
     */
    async testPerformanceTarget() {
        console.log('Test 6: Testing performance target (<3ms/frame)...');

        try {
            const cpu = this.pixelCPUIntegration.cpu;
            const iterations = 100;
            const updateTimes = [];

            // Reset to 640x480 for performance test
            this.pixelCPUIntegration.setFramebufferResolution(640, 480);

            for (let i = 0; i < iterations; i++) {
                // Write random pixels
                const x = Math.floor(Math.random() * 640);
                const y = Math.floor(Math.random() * 480);
                const fbBase = cpu.framebufferBase;
                const offset = (y * 640 + x) * 4;

                cpu.writeMemory(fbBase + offset, Math.floor(Math.random() * 256));
                cpu.writeMemory(fbBase + offset + 1, Math.floor(Math.random() * 256));
                cpu.writeMemory(fbBase + offset + 2, Math.floor(Math.random() * 256));
                cpu.writeMemory(fbBase + offset + 3, 255);

                // Measure update time
                const startTime = performance.now();
                this.pixelCPUIntegration.updateFramebuffer();
                const updateTime = performance.now() - startTime;

                updateTimes.push(updateTime);
            }

            // Calculate statistics
            const avgTime = updateTimes.reduce((a, b) => a + b, 0) / updateTimes.length;
            const maxTime = Math.max(...updateTimes);
            const minTime = Math.min(...updateTimes);
            const under3ms = updateTimes.filter(t => t < 3).length;

            this.performanceMetrics = {
                avgTime,
                maxTime,
                minTime,
                under3ms,
                totalIterations: iterations
            };

            console.log(`   Performance Statistics:`);
            console.log(`   - Average: ${avgTime.toFixed(3)}ms`);
            console.log(`   - Min: ${minTime.toFixed(3)}ms`);
            console.log(`   - Max: ${maxTime.toFixed(3)}ms`);
            console.log(`   - Under 3ms: ${under3ms}/${iterations} (${(under3ms / iterations * 100).toFixed(1)}%)`);

            if (avgTime < 3) {
                this.recordTest('Performance Target', true, `Average ${avgTime.toFixed(3)}ms < 3ms target`);
                console.log('✅ Test 6 PASSED: Performance target met\n');
            } else {
                this.recordTest('Performance Target', false, `Average ${avgTime.toFixed(3)}ms exceeds 3ms target`);
                console.log('⚠️  Test 6 WARNING: Average exceeds 3ms target\n');
            }
        } catch (error) {
            this.recordTest('Performance Target', false, error.message);
            console.error('❌ Test 6 FAILED:', error.message, '\n');
            throw error;
        }
    }

    /**
     * Record test result
     */
    recordTest(name, passed, message) {
        this.testResults.push({
            name,
            passed,
            message,
            timestamp: Date.now()
        });
    }

    /**
     * Print test summary
     */
    printTestSummary() {
        console.log('\n' + '='.repeat(60));
        console.log('FRAMEBUFFER INTEGRATION TEST SUMMARY');
        console.log('='.repeat(60) + '\n');

        const passed = this.testResults.filter(r => r.passed).length;
        const total = this.testResults.length;

        console.log(`Total Tests: ${total}`);
        console.log(`Passed: ${passed}`);
        console.log(`Failed: ${total - passed}`);
        console.log(`Success Rate: ${(passed / total * 100).toFixed(1)}%\n`);

        console.log('Test Results:');
        this.testResults.forEach((result, index) => {
            const status = result.passed ? '✅' : '❌';
            console.log(`${index + 1}. ${status} ${result.name}: ${result.message}`);
        });

        if (this.performanceMetrics.length > 0) {
            console.log('\nPerformance Metrics:');
            console.log(`- Average Update Time: ${this.performanceMetrics.avgTime.toFixed(3)}ms`);
            console.log(`- Min Update Time: ${this.performanceMetrics.minTime.toFixed(3)}ms`);
            console.log(`- Max Update Time: ${this.performanceMetrics.maxTime.toFixed(3)}ms`);
            console.log(`- Updates Under 3ms: ${this.performanceMetrics.under3ms}/${this.performanceMetrics.totalIterations}`);
        }

        console.log('\n' + '='.repeat(60) + '\n');
    }

    /**
     * Create a simple demo brick file for testing
     */
    createDemoBrick() {
        console.log('Creating demo brick file...');

        // Create a simple program that draws a gradient
        const instructions = [];

        // This is a placeholder - in a real scenario, you'd create
        // actual RISC-V instructions that write to the framebuffer
        console.log('Demo brick file creation not implemented - use existing .brick files');
    }
}

// Export for use in browser
if (typeof window !== 'undefined') {
    window.FramebufferIntegrationTest = FramebufferIntegrationTest;
}

// Export for Node.js testing
if (typeof module !== 'undefined' && module.exports) {
    module.exports = FramebufferIntegrationTest;
}
