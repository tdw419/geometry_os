/**
 * Tests for VergenceController - Binocular vision simulation
 *
 * Phase 47 Advanced Features - Task 2.1: Vergence Eye Movements
 *
 * Tests the binocular vision simulation with:
 * - Left/right eye separation (IPD)
 * - Convergence/divergence based on focal depth
 * - Parallax effects for tile layers
 * - Stereoscopic rendering mode
 * - Event system for integration
 * - VergenceRenderer for stereo rendering
 */

// Browser-compatible test class
class VergenceControllerTests {
    constructor() {
        this.name = 'VergenceController Tests';
        this.passed = 0;
        this.failed = 0;
        this.results = [];
    }

    async execute() {
        console.log(`\n🧪 Running ${this.name}...`);

        // Test 1: Initialize with proper IPD separation
        await this.testInitializeWithIPD();

        // Test 2: Calculate convergence angle for different depths
        await this.testConvergenceAngle();

        // Test 3: Set focal depth and trigger convergence
        await this.testSetFocalDepth();

        // Test 4: Calculate parallax shift for layers
        await this.testParallaxShift();

        // Test 5: Get stereo matrices when stereo mode enabled
        await this.testStereoMatrices();

        // Test 6: Enable/disable stereo mode
        await this.testStereoMode();

        // Test 7: Set convergence point directly
        await this.testSetConvergencePoint();

        // Test 8: Smooth eye position updates
        await this.testEyePositionSmoothing();

        // Test 9: Integration with FocusTracker
        await this.testFocusTrackerIntegration();

        // Test 10: Layer depth management
        await this.testLayerDepths();

        // Test 11: Event emission
        await this.testEventEmission();

        // Test 12: Reset functionality
        await this.testReset();

        // Test 13: VergenceRenderer parallax application
        await this.testVergenceRenderer();

        // Test 14: Convergence complete event
        await this.testConvergenceCompleteEvent();

        this.printResults();
        return this.failed === 0;
    }

    async testInitializeWithIPD() {
        console.log('  Test 1: Initialize with proper IPD separation...');

        try {
            if (typeof VergenceController === 'undefined') {
                throw new Error('VergenceController not available');
            }

            const controller = new VergenceController({ ipd: 50 });
            const positions = controller.getEyePositions();

            // Left eye should be at center - IPD/2
            // Right eye should be at center + IPD/2
            const separation = positions.right.x - positions.left.x;

            if (Math.abs(separation - 50) > 1) {
                throw new Error(`Expected IPD of 50, got ${separation}`);
            }

            // Check that eyes are centered
            const center = positions.center;
            const screenCenter = controller.screenCenter;

            if (Math.abs(center.x - screenCenter.x) > 1) {
                throw new Error(`Expected eyes centered at ${screenCenter.x}, got ${center.x}`);
            }

            this.passed++;
            this.results.push({ name: 'Initialize with IPD', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Initialize with IPD', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testConvergenceAngle() {
        console.log('  Test 2: Calculate convergence angle for different depths...');

        try {
            const controller = new VergenceController({
                ipd: 50,
                minDepth: 0,
                maxDepth: 1000,
                focalDepth: 500
            });

            // Near depth (100) should have high convergence
            controller.setFocalDepth(100);
            const nearState = controller.getState();
            const nearAngle = nearState.convergenceAngle;

            // Far depth (900) should have low convergence
            controller.setFocalDepth(900);
            const farState = controller.getState();
            const farAngle = farState.convergenceAngle;

            if (nearAngle <= farAngle) {
                throw new Error(`Expected higher convergence at near depth, got ${nearAngle} <= ${farAngle}`);
            }

            this.passed++;
            this.results.push({ name: 'Convergence angle', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Convergence angle', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testSetFocalDepth() {
        console.log('  Test 3: Set focal depth and trigger convergence...');

        try {
            const controller = new VergenceController({
                ipd: 50,
                minDepth: 0,
                maxDepth: 1000,
                focalDepth: 500
            });

            // Set near depth (should trigger convergence)
            controller.setFocalDepth(200);
            const nearState = controller.getState();

            if (!nearState.isConverging) {
                throw new Error('Expected isConverging to be true when moving to near depth');
            }

            // Set far depth (should trigger divergence)
            controller.setFocalDepth(800);
            const farState = controller.getState();

            if (!farState.isDiverging) {
                throw new Error('Expected isDiverging to be true when moving to far depth');
            }

            this.passed++;
            this.results.push({ name: 'Set focal depth', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Set focal depth', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testParallaxShift() {
        console.log('  Test 4: Calculate parallax shift for layers...');

        try {
            const controller = new VergenceController({
                ipd: 50,
                parallaxIntensity: 0.5
            });

            // Set focal depth to middle
            controller.setFocalDepth(500);

            // Background layer (behind focal plane)
            const bgShift = controller.getParallaxShift('background');

            // Foreground layer (in front of focal plane)
            const fgShift = controller.getParallaxShift('foreground');

            // Foreground should have opposite shift direction from background
            // (relativeDepth should have opposite signs)
            if (Math.sign(bgShift.relativeDepth) === Math.sign(fgShift.relativeDepth)) {
                throw new Error(`Expected opposite relative depths, got bg=${bgShift.relativeDepth}, fg=${fgShift.relativeDepth}`);
            }

            // Background should have negative relative depth (behind focal plane)
            if (bgShift.relativeDepth >= 0) {
                throw new Error(`Expected background relative depth < 0, got ${bgShift.relativeDepth}`);
            }

            // Foreground should have positive relative depth (in front of focal plane)
            if (fgShift.relativeDepth <= 0) {
                throw new Error(`Expected foreground relative depth > 0, got ${fgShift.relativeDepth}`);
            }

            this.passed++;
            this.results.push({ name: 'Parallax shift', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Parallax shift', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testStereoMatrices() {
        console.log('  Test 5: Get stereo matrices when stereo mode enabled...');

        try {
            const controller = new VergenceController({
                ipd: 50,
                stereoMode: false
            });

            // Should return null when stereo disabled
            let matrices = controller.getStereoMatrices();
            if (matrices !== null) {
                throw new Error('Expected null matrices when stereo disabled');
            }

            // Enable stereo mode
            controller.enableStereoMode(true);
            matrices = controller.getStereoMatrices();

            if (!matrices) {
                throw new Error('Expected matrices when stereo enabled');
            }

            // Left eye should have negative offset
            if (matrices.left.offsetX >= 0) {
                throw new Error(`Expected negative left offset, got ${matrices.left.offsetX}`);
            }

            // Right eye should have positive offset
            if (matrices.right.offsetX <= 0) {
                throw new Error(`Expected positive right offset, got ${matrices.right.offsetX}`);
            }

            // Offsets should be symmetric
            if (Math.abs(matrices.left.offsetX + matrices.right.offsetX) > 0.1) {
                throw new Error(`Expected symmetric offsets, got L=${matrices.left.offsetX}, R=${matrices.right.offsetX}`);
            }

            this.passed++;
            this.results.push({ name: 'Stereo matrices', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Stereo matrices', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testStereoMode() {
        console.log('  Test 6: Enable/disable stereo mode...');

        try {
            const controller = new VergenceController({ stereoMode: false });

            // Initially disabled
            let state = controller.getState();
            if (state.stereoMode !== false) {
                throw new Error('Expected stereo mode initially disabled');
            }

            // Enable stereo
            controller.enableStereoMode(true);
            state = controller.getState();
            if (state.stereoMode !== true) {
                throw new Error('Expected stereo mode enabled');
            }

            // Disable stereo
            controller.enableStereoMode(false);
            state = controller.getState();
            if (state.stereoMode !== false) {
                throw new Error('Expected stereo mode disabled');
            }

            // Toggle stereo
            const toggledOn = controller.toggleStereoMode();
            if (!toggledOn) {
                throw new Error('Expected toggle to return true (enabled)');
            }

            const toggledOff = controller.toggleStereoMode();
            if (toggledOff) {
                throw new Error('Expected toggle to return false (disabled)');
            }

            this.passed++;
            this.results.push({ name: 'Stereo mode', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Stereo mode', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testSetConvergencePoint() {
        console.log('  Test 7: Set convergence point directly...');

        try {
            const controller = new VergenceController({
                ipd: 50,
                focalDepth: 500
            });

            const screenCenter = controller.screenCenter;

            // Set convergence point to upper-left quadrant
            controller.setConvergencePoint(screenCenter.x - 100, screenCenter.y - 100);

            const positions = controller.getEyePositions();

            // Eyes should have moved toward the convergence point
            // (y positions should be less than center y)
            if (positions.left.y >= screenCenter.y || positions.right.y >= screenCenter.y) {
                throw new Error(`Expected eyes to move up, got L.y=${positions.left.y}, R.y=${positions.right.y}`);
            }

            this.passed++;
            this.results.push({ name: 'Set convergence point', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Set convergence point', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testEyePositionSmoothing() {
        console.log('  Test 8: Smooth eye position updates...');

        try {
            const controller = new VergenceController({
                ipd: 50,
                smoothingFactor: 0.5
            });

            const initialLeft = controller.leftEye.x;

            // Trigger a large depth change
            controller.setFocalDepth(100);

            // Before update, target should have changed but current should not
            const beforeUpdate = controller.leftEye.x;
            if (beforeUpdate === controller.targetLeftEye.x) {
                throw new Error('Expected target position to differ from current');
            }

            // Update once (50% smoothing)
            controller.update(16);

            const afterUpdate = controller.leftEye.x;

            // Should have moved toward target but not reached it
            if (afterUpdate === initialLeft) {
                throw new Error('Expected eye position to change after update');
            }

            if (afterUpdate === controller.targetLeftEye.x) {
                throw new Error('Expected smoothed position, not instant');
            }

            this.passed++;
            this.results.push({ name: 'Eye position smoothing', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Eye position smoothing', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testFocusTrackerIntegration() {
        console.log('  Test 9: Integration with FocusTracker...');

        try {
            // Create a mock focus tracker
            const mockFocusTracker = {
                getCurrentFocus: () => ({ x: 600, y: 500 }),
                on: function(event, callback) {
                    this._callbacks = this._callbacks || {};
                    this._callbacks[event] = this._callbacks[event] || [];
                    this._callbacks[event].push(callback);
                },
                emit: function(event, data) {
                    if (this._callbacks && this._callbacks[event]) {
                        this._callbacks[event].forEach(cb => cb(data));
                    }
                }
            };

            const controller = new VergenceController({
                ipd: 50,
                maxDepth: 1000
            });

            controller.setFocusTracker(mockFocusTracker);

            // Emit a focus change event
            mockFocusTracker.emit('focus-change', { x: 700, y: 600 });

            // The controller should have adjusted its target focal depth
            // (focus point further from center = deeper depth)
            if (controller.targetFocalDepth === controller.config.focalDepth) {
                throw new Error('Expected focal depth to change after focus event');
            }

            this.passed++;
            this.results.push({ name: 'FocusTracker integration', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'FocusTracker integration', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testLayerDepths() {
        console.log('  Test 10: Layer depth management...');

        try {
            const controller = new VergenceController();

            // Default layer depths should be configured
            const bgDepth = controller.getLayerDepth('background');
            if (bgDepth !== -100) {
                throw new Error(`Expected background depth -100, got ${bgDepth}`);
            }

            const fgDepth = controller.getLayerDepth('foreground');
            if (fgDepth !== 100) {
                throw new Error(`Expected foreground depth 100, got ${fgDepth}`);
            }

            // Set a custom layer depth
            controller.setLayerDepth('custom', 50);
            const customDepth = controller.getLayerDepth('custom');
            if (customDepth !== 50) {
                throw new Error(`Expected custom depth 50, got ${customDepth}`);
            }

            // Use numeric depth directly
            const numericShift = controller.getParallaxShift(75);
            if (numericShift.depth !== 75) {
                throw new Error(`Expected depth 75, got ${numericShift.depth}`);
            }

            this.passed++;
            this.results.push({ name: 'Layer depths', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Layer depths', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testEventEmission() {
        console.log('  Test 11: Event emission...');

        try {
            const controller = new VergenceController();

            let depthChanged = false;
            let stereoChanged = false;

            controller.on('depth-change', () => { depthChanged = true; });
            controller.on('stereo-mode-change', () => { stereoChanged = true; });

            // Trigger depth change
            controller.setFocalDepth(200);

            if (!depthChanged) {
                throw new Error('Expected depth-change event to fire');
            }

            // Trigger stereo mode change
            controller.enableStereoMode(true);

            if (!stereoChanged) {
                throw new Error('Expected stereo-mode-change event to fire');
            }

            // Test event removal
            depthChanged = false;
            controller.off('depth-change');
            controller.setFocalDepth(300);

            if (depthChanged) {
                throw new Error('Expected event to not fire after removal');
            }

            this.passed++;
            this.results.push({ name: 'Event emission', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Event emission', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testReset() {
        console.log('  Test 12: Reset functionality...');

        try {
            const controller = new VergenceController({
                ipd: 50,
                focalDepth: 300
            });

            // Change state
            controller.setFocalDepth(700);
            controller.enableStereoMode(true);

            // Reset
            controller.reset();

            const state = controller.getState();

            // Should return to initial values
            if (state.focalDepth !== 300) {
                throw new Error(`Expected focal depth 300 after reset, got ${state.focalDepth}`);
            }

            if (state.stereoMode !== false) {
                throw new Error('Expected stereo mode disabled after reset');
            }

            if (state.isConverging || state.isDiverging) {
                throw new Error('Expected no convergence/divergence state after reset');
            }

            this.passed++;
            this.results.push({ name: 'Reset', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Reset', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testVergenceRenderer() {
        console.log('  Test 13: VergenceRenderer parallax application...');

        try {
            if (typeof VergenceRenderer === 'undefined') {
                throw new Error('VergenceRenderer not available');
            }

            const controller = new VergenceController();
            const renderer = new VergenceRenderer(controller);

            // Create a mock sprite
            const mockSprite = { x: 100, y: 100 };

            // Apply parallax
            const shift = renderer.applyParallax(mockSprite, 'foreground');

            // Sprite should have been modified
            if (mockSprite.x === 100 && mockSprite.y === 100) {
                throw new Error('Expected sprite position to change');
            }

            // Shift should be returned
            if (typeof shift.x !== 'number' || typeof shift.y !== 'number') {
                throw new Error('Expected shift values to be numbers');
            }

            // Test stereo render options
            controller.enableStereoMode(true);
            const stereoOptions = renderer.getStereoRenderOptions({ x: 0, y: 0 });

            if (!stereoOptions) {
                throw new Error('Expected stereo options when mode enabled');
            }

            if (!stereoOptions.left || !stereoOptions.right) {
                throw new Error('Expected left and right eye options');
            }

            this.passed++;
            this.results.push({ name: 'VergenceRenderer', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'VergenceRenderer', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testConvergenceCompleteEvent() {
        console.log('  Test 14: Convergence complete event...');

        try {
            const controller = new VergenceController({
                ipd: 50,
                smoothingFactor: 1.0  // Fast convergence for test
            });

            let convergenceComplete = false;
            controller.on('convergence-complete', () => {
                convergenceComplete = true;
            });

            // Trigger a depth change
            controller.setFocalDepth(200);

            // Update until convergence
            for (let i = 0; i < 10; i++) {
                controller.update(16);
            }

            if (!convergenceComplete) {
                throw new Error('Expected convergence-complete event to fire');
            }

            this.passed++;
            this.results.push({ name: 'Convergence complete event', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Convergence complete event', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    printResults() {
        console.log(`\n📊 ${this.name} Results:`);
        console.log(`   ✅ Passed: ${this.passed}`);
        console.log(`   ❌ Failed: ${this.failed}`);
        console.log(`   📈 Success Rate: ${((this.passed / (this.passed + this.failed)) * 100).toFixed(1)}%`);

        if (this.failed > 0) {
            console.log('\n❌ Failed Tests:');
            this.results.filter(r => r.status === 'FAIL').forEach(r => {
                console.log(`   - ${r.name}: ${r.error}`);
            });
        }
    }
}

// Export for test runner
if (typeof window !== 'undefined') {
    window.VergenceControllerTests = VergenceControllerTests;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { VergenceControllerTests };
}
