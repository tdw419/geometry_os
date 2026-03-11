/**
 * SaccadicController Tests
 *
 * Tests the SaccadicController for biologically-plausible eye movement simulation.
 * Follows TDD approach: tests written first, then implementation.
 *
 * Success criteria:
 * - Should initialize with default parameters
 * - Should trigger saccade on rapid movement
 * - Should settle exponentially after saccade
 * - Should calculate velocity vector
 * - Should predict future position based on velocity
 */

class SaccadicControllerTests extends TestCase {
    constructor() {
        super('SaccadicController', { timeout: 10000 });
    }

    async execute() {
        // Test 1: Initialization
        await this.testInitialization();

        // Test 2: Saccade trigger
        await this.testSaccadeTrigger();

        // Test 3: Settling phase
        await this.testSettlingPhase();

        // Test 4: Velocity calculation
        await this.testVelocityCalculation();

        // Test 5: Predictive positioning
        await this.testPredictivePositioning();
    }

    async testInitialization() {
        console.log('  Testing SaccadicController initialization...');

        if (typeof SaccadicController === 'undefined') {
            throw new Error('SaccadicController is not defined. Please implement the class first.');
        }

        const controller = new SaccadicController();

        if (controller.phase !== 'idle') {
            throw new Error(`Expected phase to be 'idle', got '${controller.phase}'`);
        }

        if (controller.velocity.x !== 0 || controller.velocity.y !== 0) {
            throw new Error(`Expected initial velocity to be {x: 0, y: 0}, got ${JSON.stringify(controller.velocity)}`);
        }

        console.log('    ✓ SaccadicController initializes correctly');
    }

    async testSaccadeTrigger() {
        console.log('  Testing saccade trigger on rapid movement...');

        const controller = new SaccadicController();
        controller.setTarget(1000, 1000);

        if (controller.phase !== 'saccade') {
            throw new Error(`Expected phase to be 'saccade' after setTarget(1000, 1000), got '${controller.phase}'`);
        }

        console.log('    ✓ Saccade triggered correctly');
    }

    async testSettlingPhase() {
        console.log('  Testing settling phase after saccade...');

        const controller = new SaccadicController();
        controller.setTarget(100, 100);

        // Update for one frame (should start settling)
        controller.update(16);

        if (controller.phase !== 'settling') {
            throw new Error(`Expected phase to be 'settling' after update, got '${controller.phase}'`);
        }

        if (controller.settlingFactor <= 0 || controller.settlingFactor >= 1) {
            throw new Error(`Expected settlingFactor to be between 0 and 1, got ${controller.settlingFactor}`);
        }

        console.log('    ✓ Settling phase works correctly');
    }

    async testVelocityCalculation() {
        console.log('  Testing velocity vector calculation...');

        const controller = new SaccadicController();
        controller.updatePosition(10, 10);
        controller.updatePosition(20, 20, 16); // 10 units in 16ms

        const velocity = controller.getVelocity();

        if (!velocity || velocity.magnitude <= 0) {
            throw new Error(`Expected velocity magnitude to be greater than 0, got ${velocity?.magnitude}`);
        }

        console.log(`    ✓ Velocity calculated correctly: ${JSON.stringify(velocity)}`);
    }

    async testPredictivePositioning() {
        console.log('  Testing predictive positioning...');

        const controller = new SaccadicController();
        controller.updatePosition(0, 0);
        controller.updatePosition(100, 0, 100); // 100 units/sec

        const predicted = controller.predictPosition(200); // 200ms future

        // Should predict x ≈ 200 (current position 100 + velocity * 0.2s)
        if (Math.abs(predicted.x - 200) > 10) {
            throw new Error(`Expected predicted.x to be approximately 200, got ${predicted.x}`);
        }

        // y should remain close to 0
        if (Math.abs(predicted.y) > 10) {
            throw new Error(`Expected predicted.y to be close to 0, got ${predicted.y}`);
        }

        console.log(`    ✓ Predictive positioning works: ${JSON.stringify(predicted)}`);
    }
}

// Export for test runner
if (typeof window !== 'undefined') {
    window.SaccadicControllerTests = SaccadicControllerTests;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SaccadicControllerTests };
}
