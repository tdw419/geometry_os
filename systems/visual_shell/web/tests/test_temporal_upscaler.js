/**
 * Tests for TemporalUpscaler - Temporal accumulation and upscaling
 *
 * Phase 47 Advanced Features - Task 3.2: Temporal Upscaling
 */

const { TemporalUpscaler } = require('../temporal_upscaler.js');

describe('TemporalUpscaler', () => {
    let upscaler;

    beforeEach(() => {
        upscaler = new TemporalUpscaler({
            historyLength: 4,
            upscaleFactor: 1.5
        });
    });

    afterEach(() => {
        upscaler.destroy();
    });

    test('should initialize with default config', () => {
        expect(upscaler.config.historyLength).toBe(4);
        expect(upscaler.config.upscaleFactor).toBe(1.5);
        expect(upscaler.history.length).toBe(0);
    });

    test('should generate motion vectors from viewport movement', () => {
        const prevViewport = {
            center: { x: 960, y: 540 },
            width: 1920,
            height: 1080
        };
        
        const currViewport = {
            center: { x: 970, y: 540 },  // Moved right 10px
            width: 1920,
            height: 1080
        };
        
        const mv = upscaler.generateMotionVectors(prevViewport, currViewport);
        
        // Camera motion is opposite to viewport motion
        expect(mv.x).toBe(-10);
        expect(mv.y).toBe(0);
    });

    test('should clamp motion vectors to maximum', () => {
        upscaler.config.maxMotion = 20;
        
        const prevViewport = {
            center: { x: 0, y: 0 },
            width: 1920,
            height: 1080
        };
        
        const currViewport = {
            center: { x: 100, y: 100 },  // Large movement
            width: 1920,
            height: 1080
        };
        
        const mv = upscaler.generateMotionVectors(prevViewport, currViewport);
        
        // Should be clamped
        const magnitude = Math.sqrt(mv.x * mv.x + mv.y * mv.y);
        expect(magnitude).toBeLessThanOrEqual(20);
    });

    test('should accumulate frames into history', () => {
        const frame1 = { data: 'frame1' };
        const frame2 = { data: 'frame2' };
        
        upscaler.accumulateFrame(frame1);
        expect(upscaler.history.length).toBe(1);
        
        upscaler.accumulateFrame(frame2);
        expect(upscaler.history.length).toBe(2);
    });

    test('should limit history size', () => {
        upscaler.config.maxHistory = 3;
        
        for (let i = 0; i < 5; i++) {
            upscaler.accumulateFrame({ data: `frame${i}` });
        }
        
        expect(upscaler.history.length).toBe(3);
        expect(upscaler.history[0].frame.data).toBe('frame2');  // First two evicted
    });

    test('should get motion-compensated sample', () => {
        upscaler.history = [
            { frame: { motionVector: { x: 10, y: 5 } }, timestamp: Date.now() },
            { frame: { motionVector: { x: 10, y: 5 } }, timestamp: Date.now() }
        ];
        
        const sample = upscaler.getMotionCompensatedSample(100, 100, 1);
        
        // Should compensate for motion
        expect(sample.x).toBeGreaterThan(100);
    });

    test('should return original position for invalid history index', () => {
        const sample = upscaler.getMotionCompensatedSample(100, 100, 999);
        
        expect(sample.x).toBe(100);
        expect(sample.y).toBe(100);
    });

    test('should upsample frame with temporal data', () => {
        const frame = { data: 'test' };
        const result = upscaler.upscaleFrame(frame, 1.5);
        
        expect(result).toHaveProperty('data');
        expect(result).toHaveProperty('scale');
        expect(result.scale).toBe(1.5);
        expect(result).toHaveProperty('samples');
    });

    test('should update with frame and viewport', () => {
        const frame = { data: 'test' };
        const viewport = {
            center: { x: 960, y: 540 },
            width: 1920,
            height: 1080
        };
        
        const result = upscaler.update(frame, viewport);
        
        expect(result).toHaveProperty('motionVectors');
        expect(result).toHaveProperty('historyLength');
        expect(result).toHaveProperty('isStable');
    });

    test('should provide quality settings', () => {
        const quality = upscaler.getQualitySettings('quality');
        const balanced = upscaler.getQualitySettings('balanced');
        const performance = upscaler.getQualitySettings('performance');
        
        expect(quality.historyLength).toBeGreaterThan(balanced.historyLength);
        expect(quality.temporalWeight).toBeGreaterThan(balanced.temporalWeight);
        expect(performance.historyLength).toBeLessThan(balanced.historyLength);
    });

    test('should set quality mode', () => {
        upscaler.setQualityMode('quality');
        
        expect(upscaler.config.qualityMode).toBe('quality');
        expect(upscaler.config.historyLength).toBe(8);
    });

    test('should track statistics', () => {
        upscaler.accumulateFrame({ data: 'frame1' });
        upscaler.accumulateFrame({ data: 'frame2' });
        
        const stats = upscaler.getStats();
        
        expect(stats.historyLength).toBe(2);
        expect(stats).toHaveProperty('motionVectors');
        expect(stats).toHaveProperty('qualityMode');
    });

    test('should reset history buffer', () => {
        upscaler.accumulateFrame({ data: 'frame1' });
        upscaler.accumulateFrame({ data: 'frame2' });
        
        expect(upscaler.history.length).toBe(2);
        
        upscaler.reset();
        
        expect(upscaler.history.length).toBe(0);
        expect(upscaler.previousFrame).toBeNull();
        expect(upscaler.currentFrame).toBeNull();
    });

    test('should indicate stability when history is full', () => {
        for (let i = 0; i < upscaler.config.historyLength; i++) {
            upscaler.accumulateFrame({ data: `frame${i}` });
        }
        
        const stats = upscaler.getStats();
        expect(stats.isStable).toBe(true);
    });

    test('should indicate instability when history is building', () => {
        upscaler.accumulateFrame({ data: 'frame1' });
        
        const stats = upscaler.getStats();
        expect(stats.isStable).toBe(false);
    });

    test('should store motion vectors with frame', () => {
        const viewport = { center: { x: 960, y: 540 }, width: 1920, height: 1080 };
        
        upscaler.update({ data: 'frame1' }, viewport);
        upscaler.update({ data: 'frame2' }, { center: { x: 970, y: 540 }, width: 1920, height: 1080 });
        
        const latest = upscaler.history[upscaler.history.length - 1];
        expect(latest.frame).toHaveProperty('motionVector');
    });
});

// Run tests if executed directly
if (require.main === module) {
    console.log('Running TemporalUpscaler tests...');
    const tests = require('jest');
    tests.run();
}
