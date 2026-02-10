/**
 * Tests for FocusTracker (Phase 47: Task 5)
 *
 * Tests the focus point tracker that:
 * - Tracks mouse/touch position with exponential smoothing
 * - Decays to center when user is idle
 * - Calculates attention weights for tile prioritization
 * - Converts between screen and world coordinates
 *
 * Success criteria:
 * - Initialize with center focus point
 * - Smooth mouse movement updates
 * - Decay to center when idle
 * - Attention weight calculation
 * - Touch event handling
 */

class FocusTrackerTests {
    constructor() {
        this.name = 'FocusTracker Tests';
        this.passed = 0;
        this.failed = 0;
        this.results = [];
    }

    async execute() {
        console.log(`\n🧪 Running ${this.name}...`);

        // Test 1: Initialize with center focus point
        await this.testInitializeWithCenter();

        // Test 2: Track mouse movement with smoothing
        await this.testMouseSmoothing();

        // Test 3: Decay to center when idle
        await this.testDecayToCenter();

        // Test 4: Calculate attention weights
        await this.testAttentionWeights();

        // Test 5: Handle touch events
        await this.testTouchEvents();

        this.printResults();
        return this.failed === 0;
    }

    async testInitializeWithCenter() {
        console.log('  Test 1: Initialize with center focus point...');

        try {
            if (typeof FocusTracker === 'undefined') {
                throw new Error('FocusTracker not available');
            }

            const tracker = new FocusTracker({ width: 1000, height: 800 });
            const focus = tracker.getCurrentFocus();

            if (focus.x !== 500 || focus.y !== 400) {
                throw new Error(`Expected center point (500, 400), got (${focus.x}, ${focus.y})`);
            }

            this.passed++;
            this.results.push({ name: 'Initialize with center', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Initialize with center', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testMouseSmoothing() {
        console.log('  Test 2: Track mouse movement with smoothing...');

        try {
            const tracker = new FocusTracker({ width: 1000, height: 800, smoothingFactor: 0.5 });
            tracker.updateMouse(800, 600);
            tracker.update(16); // One frame

            const current = tracker.getCurrentFocus();

            // With smoothingFactor 0.5, position should move halfway from 500 to 800
            // Expected: 500 + (800 - 500) * 0.5 = 650
            if (current.x <= 500 || current.x >= 800) {
                throw new Error(`Expected smoothed position between 500 and 800, got ${current.x}`);
            }

            this.passed++;
            this.results.push({ name: 'Mouse smoothing', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Mouse smoothing', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testDecayToCenter() {
        console.log('  Test 3: Decay to center when idle...');

        try {
            const tracker = new FocusTracker({ width: 1000, height: 800, decayRate: 0.5, decayDelay: 0 });
            tracker.updateMouse(800, 600);
            tracker.update(16); // Move toward mouse first

            const beforeDecay = tracker.getCurrentFocus();
            tracker.startDecay();
            tracker.update(100); // 100ms of decay

            const afterDecay = tracker.getCurrentFocus();

            // Should have moved toward center (500)
            if (afterDecay.x >= beforeDecay.x) {
                throw new Error(`Expected position to move toward center, ${afterDecay.x} >= ${beforeDecay.x}`);
            }

            this.passed++;
            this.results.push({ name: 'Decay to center', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Decay to center', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testAttentionWeights() {
        console.log('  Test 4: Calculate attention weights...');

        try {
            const tracker = new FocusTracker({ width: 1000, height: 800, attentionRadius: 500 });
            tracker.updateMouse(500, 400);

            const tiles = [
                { x: 400, y: 350 },
                { x: 500, y: 400 },
                { x: 600, y: 450 }
            ];

            const weights = tracker.getAttentionWeights(tiles);

            // Center tile (500, 400) should have highest weight
            if (weights[1].weight <= weights[0].weight) {
                throw new Error(`Expected center tile to have highest weight, got ${weights[1].weight} <= ${weights[0].weight}`);
            }

            if (weights[1].distance > weights[0].distance) {
                throw new Error(`Expected center tile to be closest to focus`);
            }

            this.passed++;
            this.results.push({ name: 'Attention weights', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Attention weights', status: 'FAIL', error: error.message });
            console.log(`    ❌ FAIL: ${error.message}`);
        }
    }

    async testTouchEvents() {
        console.log('  Test 5: Handle touch events...');

        try {
            const tracker = new FocusTracker({ width: 1000, height: 800 });

            // Simulate touch event with centroid of multiple touches
            const touches = [
                { clientX: 450, clientY: 350 },
                { clientX: 550, clientY: 450 }
            ];

            tracker.updateTouch(touches);

            const focus = tracker.getCurrentFocus();

            // Expected centroid: (500, 400)
            if (focus.x < 490 || focus.x > 510 || focus.y < 390 || focus.y > 410) {
                throw new Error(`Expected touch centroid near (500, 400), got (${focus.x}, ${focus.y})`);
            }

            this.passed++;
            this.results.push({ name: 'Touch events', status: 'PASS' });
            console.log('    ✅ PASS');
        } catch (error) {
            this.failed++;
            this.results.push({ name: 'Touch events', status: 'FAIL', error: error.message });
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
    window.FocusTrackerTests = FocusTrackerTests;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { FocusTrackerTests };
}
