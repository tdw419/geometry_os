/**
 * SaccadicPresets - Configuration presets for Phase 47 systems
 *
 * Phase 47 Advanced Features - Task 5.1: Configuration Presets
 *
 * Provides ready-to-use configurations:
 * - Quality: Maximum visual quality
 * - Balanced: Good quality/performance trade-off
 * - Performance: Maximize FPS
 * - Ultra: Maximum settings with debug features
 *
 * @class SaccadicPresets
 */

class SaccadicPresets {
    static presets = {
        // Quality preset - Maximum visual quality
        quality: {
            name: 'Quality',
            description: 'Maximum visual quality with all features enabled',
            
            // SaccadicController
            saccadeDuration: 150,
            settlingDuration: 250,
            saccadeThreshold: 80,
            
            // SmoothLODTransition
            lodTransitionDuration: 400,
            lodEasing: 'ease-in-out',
            
            // PredictivePrefetcher
            prefetchLookahead: 800,
            prefetchPadding: 0.8,
            prefetchDistance: 4,
            
            // MotionQualityScaler
            minQuality: 0.8,
            maxQuality: 1.0,
            motionBlurAmount: 0.3,
            
            // FocusTracker
            attentionRadius: 400,
            smoothingFactor: 0.1,
            
            // VergenceController
            eyeSeparation: 60,
            parallaxIntensity: 0.4,
            
            // General
            enableGPU: true,
            enableStereo: false,
            enableDebug: false
        },
        
        // Balanced preset - Good quality/performance trade-off
        balanced: {
            name: 'Balanced',
            description: 'Balanced quality and performance for most use cases',
            
            // SaccadicController
            saccadeDuration: 150,
            settlingDuration: 200,
            saccadeThreshold: 100,
            
            // SmoothLODTransition
            lodTransitionDuration: 300,
            lodEasing: 'ease-out',
            
            // PredictivePrefetcher
            prefetchLookahead: 500,
            prefetchPadding: 0.5,
            prefetchDistance: 3,
            
            // MotionQualityScaler
            minQuality: 0.5,
            maxQuality: 1.0,
            motionBlurAmount: 0.2,
            
            // FocusTracker
            attentionRadius: 300,
            smoothingFactor: 0.15,
            
            // VergenceController
            eyeSeparation: 50,
            parallaxIntensity: 0.3,
            
            // General
            enableGPU: true,
            enableStereo: false,
            enableDebug: false
        },
        
        // Performance preset - Maximize FPS
        performance: {
            name: 'Performance',
            description: 'Maximum FPS with reduced visual quality',
            
            // SaccadicController
            saccadeDuration: 100,
            settlingDuration: 150,
            saccadeThreshold: 120,
            
            // SmoothLODTransition
            lodTransitionDuration: 200,
            lodEasing: 'linear',
            
            // PredictivePrefetcher
            prefetchLookahead: 300,
            prefetchPadding: 0.3,
            prefetchDistance: 2,
            
            // MotionQualityScaler
            minQuality: 0.2,
            maxQuality: 0.7,
            motionBlurAmount: 0.1,
            
            // FocusTracker
            attentionRadius: 200,
            smoothingFactor: 0.2,
            
            // VergenceController
            eyeSeparation: 30,
            parallaxIntensity: 0.2,
            
            // General
            enableGPU: true,
            enableStereo: false,
            enableDebug: false
        },
        
        // Ultra preset - Maximum settings with debug features
        ultra: {
            name: 'Ultra',
            description: 'Maximum quality with all debug features enabled',
            
            // SaccadicController
            saccadeDuration: 200,
            settlingDuration: 300,
            saccadeThreshold: 50,
            
            // SmoothLODTransition
            lodTransitionDuration: 500,
            lodEasing: 'ease-in-out',
            
            // PredictivePrefetcher
            prefetchLookahead: 1000,
            prefetchPadding: 1.0,
            prefetchDistance: 5,
            
            // MotionQualityScaler
            minQuality: 0.9,
            maxQuality: 1.0,
            motionBlurAmount: 0.5,
            
            // FocusTracker
            attentionRadius: 500,
            smoothingFactor: 0.05,
            
            // VergenceController
            eyeSeparation: 70,
            parallaxIntensity: 0.5,
            
            // General
            enableGPU: true,
            enableStereo: true,
            enableDebug: true
        },
        
        // Custom preset - User-defined
        custom: {
            name: 'Custom',
            description: 'Custom user configuration'
        }
    };

    /**
     * Apply a preset to a TectonicSaccadicManager
     * @param {string} presetName - Name of the preset
     * @param {TectonicSaccadicManager} manager - Manager instance
     */
    static applyPreset(presetName, manager) {
        const preset = this.presets[presetName];
        if (!preset) {
            throw new Error(`Unknown preset: ${presetName}`);
        }

        // Apply to SaccadicController
        if (manager.saccadicController) {
            manager.saccadicController.config.saccadeDuration = preset.saccadeDuration;
            manager.saccadicController.config.settlingDuration = preset.settlingDuration;
            manager.saccadicController.config.saccadeThreshold = preset.saccadeThreshold;
        }

        // Apply to LODTransitionManager
        if (manager.lodTransitionManager) {
            manager.lodTransitionManager.config.defaultDuration = preset.lodTransitionDuration;
            manager.lodTransitionManager.config.defaultEasing = preset.lodEasing;
        }

        // Apply to PredictivePrefetcher
        if (manager.prefetcher) {
            manager.prefetcher.config.lookaheadTime = preset.prefetchLookahead;
            manager.prefetcher.config.minPrefetchPadding = preset.prefetchPadding;
            manager.prefetcher.config.maxPrefetchDistance = preset.prefetchDistance;
        }

        // Apply to MotionQualityScaler
        if (manager.qualityScaler) {
            manager.qualityScaler.config.minQuality = preset.minQuality;
            manager.qualityScaler.config.maxQuality = preset.maxQuality;
        }

        // Apply to FocusTracker
        if (manager.focusTracker) {
            manager.focusTracker.config.attentionRadius = preset.attentionRadius;
            manager.focusTracker.config.smoothingFactor = preset.smoothingFactor;
        }

        return true;
    }

    /**
     * Validate a preset configuration
     * @param {Object} preset - Preset to validate
     */
    static validatePreset(preset) {
        const requiredFields = [
            'saccadeDuration', 'settlingDuration', 'saccadeThreshold',
            'lodTransitionDuration', 'prefetchLookahead', 'minQuality', 'maxQuality'
        ];

        for (const field of requiredFields) {
            if (typeof preset[field] !== 'number') {
                return { valid: false, error: `Missing or invalid field: ${field}` };
            }
        }

        // Validate ranges
        if (preset.minQuality < 0 || preset.minQuality > 1) {
            return { valid: false, error: 'minQuality must be between 0 and 1' };
        }

        if (preset.maxQuality < 0 || preset.maxQuality > 1) {
            return { valid: false, error: 'maxQuality must be between 0 and 1' };
        }

        if (preset.minQuality > preset.maxQuality) {
            return { valid: false, error: 'minQuality cannot be greater than maxQuality' };
        }

        return { valid: true };
    }

    /**
     * Export preset to JSON
     * @param {string} presetName - Name of preset to export
     */
    static exportPreset(presetName) {
        const preset = this.presets[presetName];
        if (!preset) {
            throw new Error(`Unknown preset: ${presetName}`);
        }

        return JSON.stringify(preset, null, 2);
    }

    /**
     * Import preset from JSON
     * @param {string} json - JSON string
     * @param {string} name - Name for imported preset
     */
    static importPreset(json, name = 'imported') {
        let preset;
        try {
            preset = JSON.parse(json);
        } catch (e) {
            throw new Error(`Invalid JSON: ${e.message}`);
        }

        const validation = this.validatePreset(preset);
        if (!validation.valid) {
            throw new Error(`Invalid preset: ${validation.error}`);
        }

        preset.name = name;
        this.presets[name] = preset;
        return preset;
    }

    /**
     * List all available presets
     */
    static listPresets() {
        return Object.keys(this.presets).map(name => ({
            name,
            ...this.presets[name]
        }));
    }

    /**
     * Get preset details
     * @param {string} presetName - Name of preset
     */
    static getPreset(presetName) {
        return this.presets[presetName] || null;
    }

    /**
     * Create a custom preset
     * @param {string} name - Name for new preset
     * @param {Object} config - Configuration object
     */
    static createPreset(name, config) {
        const validation = this.validatePreset(config);
        if (!validation.valid) {
            throw new Error(`Invalid preset: ${validation.error}`);
        }

        this.presets[name] = {
            name,
            description: config.description || 'Custom preset',
            ...config
        };

        return this.presets[name];
    }

    /**
     * Delete a custom preset
     * @param {string} name - Name of preset to delete
     */
    static deletePreset(name) {
        if (['quality', 'balanced', 'performance', 'ultra'].includes(name)) {
            throw new Error('Cannot delete built-in preset');
        }

        delete this.presets[name];
    }

    /**
     * Compare two presets
     * @param {string} preset1 - First preset name
     * @param {string} preset2 - Second preset name
     */
    static comparePresets(preset1, preset2) {
        const p1 = this.presets[preset1];
        const p2 = this.presets[preset2];

        if (!p1 || !p2) {
            throw new Error('One or both presets not found');
        }

        const differences = [];
        const allKeys = new Set([...Object.keys(p1), ...Object.keys(p2)]);

        for (const key of allKeys) {
            if (p1[key] !== p2[key]) {
                differences.push({
                    key,
                    [preset1]: p1[key],
                    [preset2]: p2[key]
                });
            }
        }

        return differences;
    }
}

// Export
if (typeof window !== 'undefined') {
    window.SaccadicPresets = SaccadicPresets;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SaccadicPresets };
}
