/**
 * Tests for VergenceController - Binocular vision simulation
 *
 * Phase 47 Advanced Features - Task 2.1: Vergence Eye Movements
 */

const { VergenceController } = require('../vergence_controller.js');

// Mock DOM for Node.js
global.window = {
    innerWidth: 1920,
    innerHeight: 1080
};

describe('VergenceController', () => {
    let controller;

    beforeEach(() => {
        controller = new VergenceController({
            eyeSeparation: 50,
            minDepth: 0,
            maxDepth: 10000,
            convergenceSpeed: 0.1
        });
    });

    afterEach(() => {
        controller.destroy();
    });

    test('should initialize with default config', () => {
        expect(controller.config.eyeSeparation).toBe(50);
        expect(controller.config.minDepth).toBe(0);
        expect(controller.config.maxDepth).toBe(10000);
        expect(controller.focalDepth).toBe(5000);  // Half of maxDepth
    });

    test('should set and get focal depth', () => {
        controller.setFocalDepth(2000);
        expect(controller.targetFocalDepth).toBe(2000);

        // Update to converge
        controller.update(100);
        expect(controller.focalDepth).toBeGreaterThan(4500);  // Moved toward 2000
        expect(controller.focalDepth).toBeLessThan(5000);
    });

    test('should clamp focal depth to min/max', () => {
        controller.setFocalDepth(-100);
        expect(controller.targetFocalDepth).toBe(0);

        controller.setFocalDepth(20000);
        expect(controller.targetFocalDepth).toBe(10000);
    });

    test('should calculate eye positions based on depth', () => {
        const positions = controller.getEyePositions(1000);  // Close

        expect(positions.left).toHaveProperty('x');
        expect(positions.left).toHaveProperty('y');
        expect(positions.right).toHaveProperty('x');
        expect(positions.right).toHaveProperty('y');
        
        // For close objects, eyes should converge (move toward center)
        expect(positions.convergence).toBeGreaterThan(0.5);
    });

    test('should calculate parallax shift for layers', () => {
        const shift = controller.getParallaxShift(500, 100);  // Layer at 500, screen x=100

        expect(shift).toHaveProperty('leftShift');
        expect(shift).toHaveProperty('rightShift');
        expect(shift).toHaveProperty('disparity');
        
        // Left and right shifts should be opposite
        expect(shift.leftShift).toBeGreaterThan(0);
        expect(shift.rightShift).toBeLessThan(0);
    });

    test('should set and get layer depths', () => {
        controller.setLayerDepth('background', 2000);
        controller.setLayerDepth('foreground', 100);

        expect(controller.getLayerDepth('background')).toBe(2000);
        expect(controller.getLayerDepth('foreground')).toBe(100);
        expect(controller.getLayerDepth('unknown', 500)).toBe(500);  // Default
    });

    test('should get eye perspective position', () => {
        const pos = controller.getEyePerspectivePosition(
            { x: 100, y: 200 },
            500,
            'left'
        );

        expect(pos.x).not.toBe(100);  // Should be shifted
        expect(pos.y).toBe(200);  // Y should be unchanged
    });

    test('should enable stereoscopic mode', () => {
        controller.enableStereoMode(true, 'sidebyside');
        expect(controller.config.stereoscopicMode).toBe(true);

        controller.enableStereoMode(true, 'anaglyph');
        expect(controller.config.anaglyphMode).toBe(true);
    });

    test('should converge focal depth over time', () => {
        controller.setFocalDepth(1000);
        
        // Initial state
        expect(controller.focalDepth).toBe(5000);

        // Update multiple times
        for (let i = 0; i < 50; i++) {
            controller.update(16);
        }

        // Should have moved significantly toward target
        expect(controller.focalDepth).toBeLessThan(2000);
    });

    test('should get stereo parameters', () => {
        controller.enableStereoMode(true);
        const params = controller.getStereoParams();

        expect(params.enabled).toBe(true);
        expect(params.mode).toBe('sidebyside');
        expect(params.eyeSeparation).toBe(50);
    });

    test('should provide statistics', () => {
        const stats = controller.getStats();

        expect(stats).toHaveProperty('focalDepth');
        expect(stats).toHaveProperty('leftEye');
        expect(stats).toHaveProperty('rightEye');
        expect(stats).toHaveProperty('convergence');
        expect(stats.layerCount).toBe(0);
    });

    test('should estimate depth from screen position', () => {
        const mockViewport = {
            screenToWorld: (x, y) => ({ x: x * 2, y: y * 2 }),
            getCenter: () => ({ x: 960, y: 540 }),
            getZoom: () => 1.0
        };
        controller.setViewport(mockViewport);

        const depth = controller.estimateDepth(500, 300, 1.0);
        expect(depth).toBeGreaterThan(0);
        expect(depth).toBeLessThanOrEqual(10000);
    });

    test('should handle focus tracker integration', () => {
        const mockTracker = {
            getCurrentFocus: () => ({ x: 500, y: 300 })
        };
        controller.setFocusTracker(mockTracker);
        controller.setViewport({
            screenToWorld: (x, y) => ({ x, y }),
            getCenter: () => ({ x: 960, y: 540 }),
            getZoom: () => 1.0
        });

        controller.autoFocus();
        expect(controller.targetFocalDepth).toBeGreaterThan(0);
    });
});

// Run tests if executed directly
if (require.main === module) {
    console.log('Running VergenceController tests...');
    const tests = require('jest');
    tests.run();
}
