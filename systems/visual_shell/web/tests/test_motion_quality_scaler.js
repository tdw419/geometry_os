/**
 * Test suite for MotionQualityScaler (Phase 47, Task 4)
 *
 * Tests:
 * 1. Should maintain full quality when stationary
 * 2. Should reduce quality during fast movement
 * 3. Should respect minimum quality threshold
 * 4. Should apply motion blur during saccade
 * 5. Should restore quality after settling
 */

// Test runner compatibility
if (typeof module !== 'undefined' && module.exports) {
    // Node.js environment
    var MotionQualityScaler = require('../motion_quality_scaler.js').MotionQualityScaler;
}

describe('MotionQualityScaler', () => {
    let scaler;

    beforeEach(() => {
        scaler = new MotionQualityScaler();
    });

    afterEach(() => {
        scaler = null;
    });

    test('should maintain full quality when stationary', () => {
        const quality = scaler.getQuality({ x: 0, y: 0, magnitude: 0 });
        expect(quality).toBeCloseTo(1.0, 1);
    });

    test('should reduce quality during fast movement', () => {
        const quality = scaler.getQuality({ x: 1000, y: 0, magnitude: 1000 });
        expect(quality).toBeLessThan(1.0);
        expect(quality).toBeGreaterThan(0);
    });

    test('should respect minimum quality threshold', () => {
        scaler = new MotionQualityScaler({ minQuality: 0.3 });
        const quality = scaler.getQuality({ x: 10000, y: 0, magnitude: 10000 });
        expect(quality).toBeGreaterThanOrEqual(0.3);
    });

    test('should apply motion blur during saccade', () => {
        const options = scaler.getRenderOptions({ x: 500, y: 0, magnitude: 500 }, 'saccade');
        expect(options.blur).toBeGreaterThan(0);
        expect(options.blur).toBeLessThanOrEqual(scaler.config.maxBlur);
    });

    test('should restore quality after settling', () => {
        scaler.setPhase('saccade');
        scaler.setPhase('settling');
        const quality = scaler.getQuality({ x: 0, y: 0, magnitude: 0 });
        expect(quality).toBeGreaterThan(0.5);
    });
});
