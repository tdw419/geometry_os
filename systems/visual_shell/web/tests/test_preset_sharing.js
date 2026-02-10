/**
 * Tests for PresetSharing - Share and import presets
 *
 * Phase 47 Advanced Features - Task 5.2: Preset Sharing
 */

const { PresetSharing } = require('../preset_sharing.js');

// Mock DOM for Node.js
global.document = {
    createElement: (tag) => ({
        href: '',
        download: '',
        click: () => {}
    })
};

global.URL = {
    createObjectURL: (blob) => 'blob:url',
    revokeObjectURL: () => {}
};

global.localStorage = {
    getItem: () => null,
    setItem: () => {},
    removeItem: () => {}
};

global.require = (id) => {
    if (id === './saccadic_presets.js') {
        return {
            SaccadicPresets: {
                presets: {
                    quality: {
                        name: 'Quality',
                        saccadeDuration: 150,
                        minQuality: 0.8,
                        maxQuality: 1.0
                    }
                },
                exportPreset: (name) => JSON.stringify({ name }),
                getPreset: (name) => ({ name }),
                presets: {}
            }
        };
    }
    return {};
};

describe('PresetSharing', () => {
    let sharing;

    beforeEach(() => {
        sharing = new PresetSharing();
    });

    test('should initialize with community presets', () => {
        const library = sharing.getCommunityLibrary();
        
        expect(library.length).toBeGreaterThan(0);
        expect(library.find(p => p.name === 'competitive')).toBeDefined();
    });

    test('should list all available presets', () => {
        const presets = sharing.listAllPresets();
        
        // Should include built-in, community, and custom presets
        const sources = presets.map(p => p.source);
        expect(sources).toContain('builtin');
        expect(sources).toContain('community');
    });

    test('should export preset to download', () => {
        const result = sharing.exportToDownload('quality');
        
        expect(result).toContain('Quality');
        // Should be valid JSON
        expect(() => JSON.parse(result)).not.toThrow();
    });

    test('should import preset from file', async () => {
        const mockFile = {
            text: async () => JSON.stringify({
                name: 'TestPreset',
                saccadeDuration: 120,
                settlingDuration: 180,
                saccadeThreshold: 90
            })
        };
        
        const preset = await sharing.importFromFile(mockFile);
        
        expect(preset.name).toBe('TestPreset');
        expect(preset.saccadeDuration).toBe(120);
    });

    test('should reject invalid preset from file', async () => {
        const mockFile = {
            text: async () => '{ invalid json'
        };
        
        await expect(sharing.importFromFile(mockFile)).rejects.toThrow();
    });

    test('should validate preset structure', () => {
        const validPreset = {
            name: 'Test',
            saccadeDuration: 150,
            settlingDuration: 200,
            saccadeThreshold: 100,
            minQuality: 0.5,
            maxQuality: 1.0
        };
        
        const result = sharing._validatePreset(validPreset);
        expect(result.valid).toBe(true);
    });

    test('should reject preset with missing required fields', () => {
        const invalidPreset = {
            name: 'Test'
            // Missing required fields
        };
        
        const result = sharing._validatePreset(invalidPreset);
        expect(result.valid).toBe(false);
    });

    test('should reject preset with invalid quality range', () => {
        const invalidPreset = {
            name: 'Test',
            saccadeDuration: 150,
            settlingDuration: 200,
            saccadeThreshold: 100,
            minQuality: 1.5,  // Invalid: > 1
            maxQuality: 1.0
        };
        
        const result = sharing._validatePreset(invalidPreset);
        expect(result.valid).toBe(false);
    });

    test('should generate share code for preset', () => {
        const share = sharing.sharePreset('quality');
        
        expect(share.name).toBe('quality');
        expect(share).toHaveProperty('shareCode');
        expect(share).toHaveProperty('url');
    });

    test('should import preset from share code', () => {
        // First export to get code
        const share = sharing.sharePreset('quality');
        
        // Then import back
        const preset = sharing.importFromShareCode(share.shareCode);
        
        expect(preset).not.toBeNull();
        expect(preset.name).toContain('quality');  // May have suffix if conflict
    });

    test('should handle share code decoding errors', () => {
        expect(() => {
            sharing.importFromShareCode('invalid-base64!!!');
        }).toThrow();
    });
});

// Run tests if executed directly
if (require.main === module) {
    console.log('Running PresetSharing tests...');
    const tests = require('jest');
    tests.run();
}
