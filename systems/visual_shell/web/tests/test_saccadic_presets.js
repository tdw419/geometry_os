/**
 * Tests for SaccadicPresets - Configuration presets
 *
 * Phase 47 Advanced Features - Task 5.1: Configuration Presets
 */

const { SaccadicPresets } = require('../saccadic_presets.js');

describe('SaccadicPresets', () => {
    // Mock TectonicSaccadicManager
    class MockManager {
        constructor() {
            this.saccadicController = { config: {} };
            this.lodTransitionManager = { config: {} };
            this.prefetcher = { config: {} };
            this.qualityScaler = { config: {} };
            this.focusTracker = { config: {} };
        }
    }

    test('should have all built-in presets', () => {
        const presets = SaccadicPresets.listPresets();
        const names = presets.map(p => p.name);

        expect(names).toContain('quality');
        expect(names).toContain('balanced');
        expect(names).toContain('performance');
        expect(names).toContain('ultra');
    });

    test('should get preset details', () => {
        const quality = SaccadicPresets.getPreset('quality');
        
        expect(quality).toHaveProperty('name');
        expect(quality).toHaveProperty('description');
        expect(quality.saccadeDuration).toBe(150);
        expect(quality.minQuality).toBe(0.8);
    });

    test('should validate correct preset', () => {
        const validPreset = {
            saccadeDuration: 150,
            settlingDuration: 200,
            saccadeThreshold: 100,
            lodTransitionDuration: 300,
            prefetchLookahead: 500,
            minQuality: 0.5,
            maxQuality: 1.0
        };

        const result = SaccadicPresets.validatePreset(validPreset);
        expect(result.valid).toBe(true);
    });

    test('should reject preset with missing fields', () => {
        const invalidPreset = {
            saccadeDuration: 150
            // Missing required fields
        };

        const result = SaccadicPresets.validatePreset(invalidPreset);
        expect(result.valid).toBe(false);
        expect(result.error).toContain('Missing or invalid field');
    });

    test('should reject preset with invalid quality range', () => {
        const invalidPreset = {
            saccadeDuration: 150,
            settlingDuration: 200,
            saccadeThreshold: 100,
            lodTransitionDuration: 300,
            prefetchLookahead: 500,
            minQuality: 1.5,  // Invalid: > 1
            maxQuality: 1.0
        };

        const result = SaccadicPresets.validatePreset(invalidPreset);
        expect(result.valid).toBe(false);
    });

    test('should reject preset where min > max quality', () => {
        const invalidPreset = {
            saccadeDuration: 150,
            settlingDuration: 200,
            saccadeThreshold: 100,
            lodTransitionDuration: 300,
            prefetchLookahead: 500,
            minQuality: 0.8,  // > maxQuality
            maxQuality: 0.5
        };

        const result = SaccadicPresets.validatePreset(invalidPreset);
        expect(result.valid).toBe(false);
    });

    test('should apply preset to manager', () => {
        const manager = new MockManager();
        const result = SaccadicPresets.applyPreset('quality', manager);

        expect(result).toBe(true);
        expect(manager.saccadicController.config.saccadeDuration).toBe(150);
        expect(manager.saccadicController.config.minQuality).toBe(0.8);
    });

    test('should throw error for unknown preset when applying', () => {
        const manager = new MockManager();

        expect(() => {
            SaccadicPresets.applyPreset('unknown', manager);
        }).toThrow('Unknown preset');
    });

    test('should export preset to JSON', () => {
        const json = SaccadicPresets.exportPreset('balanced');
        const parsed = JSON.parse(json);

        expect(parsed.name).toBe('Balanced');
        expect(parsed).toHaveProperty('saccadeDuration');
    });

    test('should import preset from JSON', () => {
        const json = JSON.stringify({
            saccadeDuration: 200,
            settlingDuration: 250,
            saccadeThreshold: 80,
            lodTransitionDuration: 350,
            prefetchLookahead: 600,
            minQuality: 0.6,
            maxQuality: 0.9
        });

        const preset = SaccadicPresets.importPreset(json, 'myPreset');

        expect(preset.name).toBe('myPreset');
        expect(preset.saccadeDuration).toBe(200);
    });

    test('should throw error when importing invalid JSON', () => {
        expect(() => {
            SaccadicPresets.importPreset('invalid json', 'test');
        }).toThrow('Invalid JSON');
    });

    test('should throw error when importing invalid preset', () => {
        const invalidJson = JSON.stringify({
            saccadeDuration: 150
            // Missing required fields
        });

        expect(() => {
            SaccadicPresets.importPreset(invalidJson, 'test');
        }).toThrow('Invalid preset');
    });

    test('should create custom preset', () => {
        const config = {
            description: 'My custom preset',
            saccadeDuration: 180,
            settlingDuration: 220,
            saccadeThreshold: 90,
            lodTransitionDuration: 320,
            prefetchLookahead: 550,
            minQuality: 0.7,
            maxQuality: 0.95
        };

        const preset = SaccadicPresets.createPreset('custom', config);

        expect(preset.name).toBe('custom');
        expect(preset.saccadeDuration).toBe(180);
    });

    test('should delete custom preset', () => {
        SaccadicPresets.createPreset('temp', {
            saccadeDuration: 150,
            settlingDuration: 200,
            saccadeThreshold: 100,
            lodTransitionDuration: 300,
            prefetchLookahead: 500,
            minQuality: 0.5,
            maxQuality: 1.0
        });

        expect(SaccadicPresets.getPreset('temp')).not.toBeNull();

        SaccadicPresets.deletePreset('temp');

        expect(SaccadicPresets.getPreset('temp')).toBeNull();
    });

    test('should not allow deleting built-in presets', () => {
        expect(() => {
            SaccadicPresets.deletePreset('quality');
        }).toThrow('Cannot delete built-in preset');
    });

    test('should compare two presets', () => {
        const differences = SaccadicPresets.comparePresets('quality', 'performance');

        expect(Array.isArray(differences)).toBe(true);
        expect(differences.length).toBeGreaterThan(0);

        const saccadeDurationDiff = differences.find(d => d.key === 'saccadeDuration');
        expect(saccadeDurationDiff).toBeDefined();
        expect(saccadeDurationDiff.quality).not.toBe(saccadeDurationDiff.performance);
    });
});

// Run tests if executed directly
if (require.main === module) {
    console.log('Running SaccadicPresets tests...');
    const tests = require('jest');
    tests.run();
}
