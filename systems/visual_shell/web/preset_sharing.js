/**
 * PresetSharing - Share and import presets across devices
 *
 * Phase 47 Advanced Features - Task 5.2: Preset Sharing
 *
 * Adds sharing capabilities to SaccadicPresets:
 * - JSON import/export with validation
 * - File-based preset storage
 * - Community preset library
 * - Preset synchronization
 * - Preset versioning
 *
 * @class PresetSharing
 */

class PresetSharing {
    constructor() {
        this.storageKey = 'phase47_presets';
        this.communityPresets = new Map();
        
        // Load community presets
        this._loadCommunityPresets();
    }

    /**
     * Load built-in community presets
     */
    _loadCommunityPresets() {
        // Community presets shared by users
        this.communityPresets.set('competitive', {
            name: 'Competitive',
            description: 'Low latency for competitive gaming',
            author: 'Community',
            version: '1.0',
            saccadeDuration: 100,
            settlingDuration: 150,
            saccadeThreshold: 120,
            lodTransitionDuration: 200,
            lodEasing: 'linear',
            prefetchLookahead: 300,
            minQuality: 0.4,
            maxQuality: 0.7,
            attentionRadius: 250,
            eyeSeparation: 40,
            parallaxIntensity: 0.2,
            enableGPU: true,
            enableStereo: false
        });

        this.communityPresets.set('cinematic', {
            name: 'Cinematic',
            description: 'High quality for content viewing',
            author: 'Community',
            version: '1.0',
            saccadeDuration: 200,
            settlingDuration: 300,
            saccadeThreshold: 60,
            lodTransitionDuration: 500,
            lodEasing: 'ease-in-out',
            prefetchLookahead: 1000,
            minQuality: 0.9,
            maxQuality: 1.0,
            attentionRadius: 500,
            eyeSeparation: 70,
            parallaxIntensity: 0.5,
            enableGPU: true,
            enableStereo: true
        });

        this.communityPresets.set('screenshot', {
            name: 'Screenshot',
            description: 'Maximum quality for capturing',
            author: 'Community',
            version: '1.0',
            saccadeDuration: 250,
            settlingDuration: 300,
            saccadeThreshold: 50,
            lodTransitionDuration: 600,
            lodEasing: 'ease-in-out',
            prefetchLookahead: 1200,
            minQuality: 1.0,
            maxQuality: 1.0,
            attentionRadius: 600,
            eyeSeparation: 80,
            parallaxIntensity: 0.6,
            enableGPU: true,
            enableStereo: false,
            enableDebug: false
        });
    }

    /**
     * Export preset to downloadable JSON file
     * @param {string} presetName - Name of preset to export
     */
    exportToDownload(presetName) {
        const { SaccadicPresets } = require('./saccadic_presets.js');
        const json = SaccadicPresets.exportPreset(presetName);
        
        // Create blob and download link
        const blob = new Blob([json], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        
        const a = document.createElement('a');
        a.href = url;
        a.download = `phase47_preset_${presetName}_${Date.now()}.json`;
        a.click();
        
        URL.revokeObjectURL(url);
        
        return json;
    }

    /**
     * Import preset from file
     * @param {File} file - File object from file input
     */
    async importFromFile(file) {
        const text = await file.text();
        
        try {
            const preset = JSON.parse(text);
            
            // Validate required fields
            const validation = this._validatePreset(preset);
            if (!validation.valid) {
                throw new Error(validation.error);
            }
            
            // Add version if not present
            if (!preset.version) {
                preset.version = '1.0';
            }
            
            // Add to SaccadicPresets
            const { SaccadicPresets } = require('./saccadic_presets.js');
            SaccadicPresets.presets[preset.name] = preset;
            
            return preset;
        } catch (e) {
            throw new Error(`Failed to import preset: ${e.message}`);
        }
    }

    /**
     * Validate preset structure
     */
    _validatePreset(preset) {
        const requiredFields = ['name', 'saccadeDuration', 'settlingDuration'];
        
        for (const field of requiredFields) {
            if (!preset[field]) {
                return { valid: false, error: `Missing required field: ${field}` };
            }
        }

        // Validate ranges
        if (preset.minQuality !== undefined) {
            if (preset.minQuality < 0 || preset.minQuality > 1) {
                return { valid: false, error: 'minQuality must be 0-1' };
            }
        }

        if (preset.maxQuality !== undefined) {
            if (preset.maxQuality < 0 || preset.maxQuality > 1) {
                return { valid: false, error: 'maxQuality must be 0-1' };
            }
        }

        return { valid: true };
    }

    /**
     * Save preset to local storage
     * @param {string} presetName - Name of preset
     */
    saveToStorage(presetName) {
        const { SaccadicPresets } = require('./saccadic_presets.js');
        const preset = SaccadicPresets.getPreset(presetName);
        
        if (!preset) {
            throw new Error(`Preset not found: ${presetName}`);
        }

        const customPresets = this._getStoredPresets();
        customPresets[presetName] = preset;
        
        localStorage.setItem(this.storageKey, JSON.stringify(customPresets));
    }

    /**
     * Load preset from local storage
     * @param {string} presetName - Name of preset
     */
    loadFromStorage(presetName) {
        const customPresets = this._getStoredPresets();
        const preset = customPresets[presetName];
        
        if (!preset) {
            throw new Error(`Preset not found in storage: ${presetName}`);
        }

        const { SaccadicPresets } = require('./saccadic_presets.js');
        SaccadicPresets.presets[presetName] = preset;
        
        return preset;
    }

    /**
     * Get stored presets from local storage
     */
    _getStoredPresets() {
        try {
            const data = localStorage.getItem(this.storageKey);
            if (data) {
                return JSON.parse(data);
            }
        } catch (e) {
            console.error('Failed to load presets from storage:', e);
        }
        return {};
    }

    /**
     * List all available presets (built-in + community + custom)
     */
    listAllPresets() {
        const { SaccadicPresets } = require('./saccadic_presets.js');
        const customPresets = this._getStoredPresets();
        
        const presets = [];
        
        // Built-in presets
        for (const [name, preset] of Object.entries(SaccadicPresets.presets)) {
            presets.push({
                name,
                source: 'builtin',
                ...preset
            });
        }
        
        // Community presets
        for (const [name, preset] of this.communityPresets) {
            presets.push({
                name,
                source: 'community',
                author: preset.author,
                version: preset.version,
                ...preset
            });
        }
        
        // Custom presets
        for (const [name, preset] of Object.entries(customPresets)) {
            presets.push({
                name,
                source: 'custom',
                ...preset
            });
        }
        
        return presets;
    }

    /**
     * Share preset (generate shareable URL/code)
     * @param {string} presetName - Name of preset
     */
    sharePreset(presetName) {
        const { SaccadicPresets } = require('./saccadic_presets.js');
        const json = SaccadicPresets.exportPreset(presetName);
        
        // In a real app, this would upload to a server and return a URL
        // For now, return base64 encoded JSON
        const encoded = btoa(json);
        
        return {
            name: presetName,
            shareCode: encoded,
            url: `data:application/json;base64,${encoded}`,
            qrUrl: `https://api.qrserver.com/v1/create-qr-code/?data=${encodeURIComponent(encoded)}`
        };
    }

    /**
     * Import preset from share code
     * @param {string} shareCode - Base64 encoded preset JSON
     */
    importFromShareCode(shareCode) {
        try {
            const json = atob(shareCode);
            const preset = JSON.parse(json);
            
            const validation = this._validatePreset(preset);
            if (!validation.valid) {
                throw new Error(validation.error);
            }
            
            const { SaccadicPresets } = require('./saccadic_presets.js');
            
            // Generate unique name if conflict
            let name = preset.name;
            let counter = 1;
            while (SaccadicPresets.presets[name]) {
                name = `${preset.name}_${counter}`;
                counter++;
            }
            preset.name = name;
            
            SaccadicPresets.presets[name] = preset;
            
            return preset;
        } catch (e) {
            throw new Error(`Failed to import shared preset: ${e.message}`);
        }
    }

    /**
     * Get community preset library
     */
    getCommunityLibrary() {
        return Array.from(this.communityPresets.entries()).map(([name, preset]) => ({
            name,
            ...preset
        }));
    }

    /**
     * Clear stored presets
     */
    clearStoredPresets() {
        localStorage.removeItem(this.storageKey);
    }
}

// Export
if (typeof window !== 'undefined') {
    window.PresetSharing = PresetSharing;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PresetSharing };
}
