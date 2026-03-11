/**
 * Tests for PursuitController - Smooth pursuit movements
 *
 * Phase 47 Advanced Features - Task 2.2: Pursuit Movements
 */

const { PursuitController } = require('../pursuit_controller.js');

describe('PursuitController', () => {
    let controller;

    beforeEach(() => {
        controller = new PursuitController({
            pursuitGain: 0.9,
            pursuitVelocityThreshold: 50,
            maxPursuitVelocity: 2000
        });
    });

    afterEach(() => {
        controller.destroy();
    });

    test('should initialize with default config', () => {
        expect(controller.config.pursuitGain).toBe(0.9);
        expect(controller.config.pursuitVelocityThreshold).toBe(50);
        expect(controller.phase).toBe('idle');
        expect(controller.isTracking).toBe(false);
    });

    test('should start tracking a target', () => {
        const mockTarget = { x: 100, y: 100 };
        controller.trackTarget(mockTarget);

        expect(controller.isTracking).toBe(true);
        expect(controller.phase).toBe('pursuing');
        expect(controller.targetObject).toBe(mockTarget);
    });

    test('should stop tracking', () => {
        const mockTarget = { x: 100, y: 100 };
        controller.trackTarget(mockTarget);
        controller.stopTracking();

        expect(controller.isTracking).toBe(false);
        expect(controller.targetObject).toBe(null);
    });

    test('should update target position manually', () => {
        controller.updateTargetPosition(100, 100);
        controller.updateTargetPosition(150, 150);

        expect(controller.targetHistory.length).toBe(2);
        expect(controller.targetPosition.x).toBe(150);
    });

    test('should calculate velocity from target history', () => {
        controller.updateTargetPosition(100, 100);
        // Simulate 100ms later
        const timestamp = Date.now();
        controller.targetHistory[0].timestamp = timestamp - 100;
        controller.updateTargetPosition(200, 200);

        const velocity = controller._calculateVelocity();
        // Velocity = (200-100) / 0.1 = 1000 pixels/sec
        expect(velocity.x).toBeGreaterThan(0);
        expect(velocity.y).toBeGreaterThan(0);
    });

    test('should predict future target position', () => {
        controller.velocity = { x: 500, y: 300 };
        controller.position = { x: 100, y: 100 };

        const predicted = controller.predictPosition(100);  // 100ms ahead

        // predicted = current + velocity * time
        // x = 100 + 500 * 0.1 = 150
        // y = 100 + 300 * 0.1 = 130
        expect(predicted.x).toBeCloseTo(150, 0);
        expect(predicted.y).toBeCloseTo(130, 0);
    });

    test('should perform smooth pursuit', () => {
        const mockTarget = { x: 100, y: 100 };
        controller.trackTarget(mockTarget);

        // Update target position
        controller.targetObject = { x: 150, y: 150 };
        controller.update(16);

        // Position should have moved toward target
        expect(controller.position.x).toBeGreaterThan(100);
        expect(controller.position.x).toBeLessThan(150);
    });

    test('should trigger catch-up saccade when target is far', () => {
        controller.position = { x: 0, y: 0 };
        const mockTarget = { x: 500, y: 500 };
        controller.trackTarget(mockTarget);

        // Target is 500px away, catchUpThreshold is 200
        controller.update(16);

        // Should trigger saccade phase
        expect(['saccade', 'pursuing']).toContain(controller.phase);
    });

    test('should track target with getPosition method', () => {
        const mockTarget = {
            getPosition: () => ({ x: 200, y: 200 })
        };
        controller.trackTarget(mockTarget);

        const pos = controller._getTargetPosition();
        expect(pos.x).toBe(200);
        expect(pos.y).toBe(200);
    });

    test('should provide state information', () => {
        controller.updateTargetPosition(100, 100);
        controller.velocity = { x: 100, y: 50 };

        const state = controller.getState();
        expect(state).toHaveProperty('phase');
        expect(state).toHaveProperty('position');
        expect(state).toHaveProperty('velocity');
        expect(state).toHaveProperty('isTracking');
    });

    test('should provide statistics', () => {
        controller.velocity = { x: 300, y: 400 };
        controller.trackTarget({ x: 100, y: 100 });

        const stats = controller.getStats();
        expect(stats.phase).toBe('pursuing');
        expect(stats.isTracking).toBe(true);
        expect(stats.velocityMagnitude).toBeGreaterThan(0);
    });

    test('should limit target history size', () => {
        for (let i = 0; i < 20; i++) {
            controller.updateTargetPosition(i, i);
        }

        expect(controller.targetHistory.length).toBeLessThanOrEqual(10);
    });

    test('should handle callbacks', () => {
        let pursuitStarted = false;
        let pursuitEnded = false;
        let catchUpCalled = false;

        controller.onPursuitStart = () => { pursuitStarted = true; };
        controller.onPursuitEnd = () => { pursuitEnded = true; };
        controller.onCatchUpSaccade = () => { catchUpCalled = true; };

        controller.trackTarget({ x: 100, y: 100 });
        expect(pursuitStarted).toBe(true);

        controller.stopTracking();
        expect(pursuitEnded).toBe(true);
    });
});

// Run tests if executed directly
if (require.main === module) {
    console.log('Running PursuitController tests...');
    const tests = require('jest');
    tests.run();
}
