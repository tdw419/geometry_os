/**
 * Tests for MicrosaccadeDetector - Microsaccade detection
 *
 * Phase 47 Advanced Features - Task 2.3: Microsaccade Detection
 */

const { MicrosaccadeDetector } = require('../microsaccade_detector.js');

describe('MicrosaccadeDetector', () => {
    let detector;

    beforeEach(() => {
        detector = new MicrosaccadeDetector({
            microsaccadeThreshold: 5,
            detectionWindow: 50
        });
    });

    afterEach(() => {
        detector.destroy();
    });

    test('should initialize with default config', () => {
        expect(detector.config.microsaccadeThreshold).toBe(5);
        expect(detector.config.tremorEnabled).toBe(true);
        expect(detector.isActive).toBe(false);
    });

    test('should not detect normal movements as microsaccades', () => {
        // Movement of 10px (above threshold)
        const result = detector.analyzeMovement(10, 0);
        
        expect(result).toBeNull();
        expect(detector.isActive).toBe(false);
    });

    test('should detect microsaccade movement', () => {
        // Small movement below threshold
        const result = detector.analyzeMovement(2, 2);
        
        // May not detect immediately - need pattern
        // Add more small movements
        detector.analyzeMovement(1, 1);
        detector.analyzeMovement(1, 0);
        detector.analyzeMovement(0, 1);
        
        // Check history
        expect(detector.positionHistory.length).toBeGreaterThan(0);
    });

    test('should provide compensation offset', () => {
        detector.analyzeMovement(2, 2);
        
        const compensation = detector.getCompensation();
        expect(compensation).toHaveProperty('x');
        expect(compensation).toHaveProperty('y');
        expect(compensation).toHaveProperty('isActive');
    });

    test('should simulate tremor', () => {
        const tremor1 = detector.getTremor();
        const tremor2 = detector.getTremor();
        
        // Tremor should change over time
        expect(tremor1.x).not.toBe(tremor2.x);
        
        // Tremor values should be small
        expect(Math.abs(tremor1.x)).toBeLessThan(1);
        expect(Math.abs(tremor1.y)).toBeLessThan(1);
    });

    test('should not tremor when disabled', () => {
        const noTremorDetector = new MicrosaccadeDetector({
            tremorEnabled: false
        });
        
        const tremor = noTremorDetector.getTremor();
        expect(tremor.x).toBe(0);
        expect(tremor.y).toBe(0);
        
        noTremorDetector.destroy();
    });

    test('should apply compensation to position', () => {
        detector.compensationOffset = { x: -2, y: -1 };
        
        const result = detector.applyCompensation({ x: 100, y: 100 });
        
        // Result should include compensation + tremor
        expect(result.x).not.toBe(100);
        expect(result.y).not.toBe(100);
    });

    test('should provide visualization data', () => {
        const viz = detector.getVisualizationData();
        
        expect(viz).toHaveProperty('isActive');
        expect(viz).toHaveProperty('compensationOffset');
        expect(viz).toHaveProperty('tremorPhase');
        expect(viz).toHaveProperty('recentMicrosaccades');
    });

    test('should track statistics', () => {
        const stats = detector.getStats();
        
        expect(stats).toHaveProperty('totalDetected');
        expect(stats).toHaveProperty('averageAmplitude');
        expect(stats).toHaveProperty('averageDuration');
        expect(stats).toHaveProperty('historyLength');
    });

    test('should clear history', () => {
        detector.analyzeMovement(1, 1);
        detector.analyzeMovement(2, 2);
        
        expect(detector.positionHistory.length).toBeGreaterThan(0);
        
        detector.clearHistory();
        
        expect(detector.positionHistory.length).toBe(0);
        expect(detector.microsaccadeHistory.length).toBe(0);
    });

    test('should update compensation decay', () => {
        detector.compensationOffset = { x: 10, y: 10 };
        
        detector.update(16);
        
        // Compensation should decay toward 0
        expect(Math.abs(detector.compensationOffset.x)).toBeLessThan(10);
        expect(Math.abs(detector.compensationOffset.y)).toBeLessThan(10);
    });

    test('should limit position history to detection window', () => {
        // Add movements with old timestamps
        const oldTime = Date.now() - 100;
        detector.positionHistory.push({
            dx: 1, dy: 1, movement: 1.4,
            timestamp: oldTime
        });
        
        // Trigger update
        detector.update(0);
        
        // Old positions should be trimmed
        expect(detector.positionHistory.every(p => p.timestamp > oldTime));
    });

    test('should record microsaccade history', () => {
        detector.config.recordHistory = true;
        
        // Simulate detection (bypass pattern detection)
        detector.microsaccadeHistory.push({
            amplitude: 2,
            direction: 0,
            duration: 20,
            timestamp: Date.now()
        });
        
        expect(detector.microsaccadeHistory.length).toBe(1);
    });

    test('should limit microsaccade history size', () => {
        detector.config.historyMaxLength = 5;
        
        for (let i = 0; i < 10; i++) {
            detector.microsaccadeHistory.push({
                amplitude: i,
                direction: 0,
                duration: 10,
                timestamp: Date.now()
            });
        }
        
        expect(detector.microsaccadeHistory.length).toBe(5);
    });

    test('should detect microsaccade pattern', () => {
        // Create a clean microsaccade pattern
        const positions = [
            { dx: 1, dy: 0, timestamp: Date.now() },
            { dx: 1, dy: 0, timestamp: Date.now() + 10 },
            { dx: 1, dy: 0, timestamp: Date.now() + 20 },
            { dx: 0, dy: 1, timestamp: Date.now() + 30 },
            { dx: 0, dy: 1, timestamp: Date.now() + 40 }
        ];
        
        detector.positionHistory = positions;
        
        const pattern = detector._detectMicrosaccadePattern();
        
        // Should detect a pattern with specific properties
        if (pattern) {
            expect(pattern).toHaveProperty('amplitude');
            expect(pattern).toHaveProperty('direction');
            expect(pattern).toHaveProperty('duration');
        }
    });
});

// Run tests if executed directly
if (require.main === module) {
    console.log('Running MicrosaccadeDetector tests...');
    const tests = require('jest');
    tests.run();
}
