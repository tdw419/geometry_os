/**
 * NeuralCityFilter - PIXI.js filter wrapper for neural_city_facade.wgsl
 *
 * Bridges between PIXI.Filter API and the WGSL shader uniforms.
 * Handles high-resolution texture swapping for foveated rendering.
 *
 * Task 2: The Void Shader Logic
 * - uSafetyMask: 32x32 grid marking quarantined districts
 * - uMaskSize: Size of the safety mask grid (default 32)
 * - uQuarantineActive: Whether any districts are quarantined
 *
 * Task 5: Metabolism Ambient Lighting
 * - uMetabolismIPC: Instructions per cycle (0.0 to 1.0) - controls city brightness
 * - uThrottleLevel: Throttle intensity (0.0=NONE, 0.5=MODERATE, 1.0=AGGRESSIVE)
 */

class NeuralCityFilter extends (typeof PIXI !== 'undefined' ? PIXI.Filter : Object) {
    constructor(options = {}) {
        // Uniforms for the WGSL shader
        const uniforms = {
            uResolution: [window.innerWidth, window.innerHeight],
            uTime: 0,
            uFocusDistrict: [0, 0],
            uHiResValid: 0.0,
            uLowResTexture: options.lowResTexture || null,
            uHiResTexture: options.hiResTexture || null,
            // Task 2: The Void Shader Logic - Safety mask uniforms
            uSafetyMask: new Float32Array(32 * 32), // Default: no quarantines (all zeros)
            uMaskSize: 32,
            uQuarantineActive: 0.0,
            // Task 5: Metabolism Ambient Lighting
            uMetabolismIPC: 0.5,      // 0.0 to 1.0 (instructions per cycle)
            uThrottleLevel: 0.0       // 0.0=NONE, 0.5=MODERATE, 1.0=AGGRESSIVE
        };

        // Note: PIXI v8 uses Filter.from() or a similar constructor
        // We'll assume standard PIXI.Filter structure for now
        super(null, null, uniforms);

        this.uniforms = uniforms;
        console.log('✓ NeuralCityFilter initialized');
    }

    updateTime(time) {
        this.uniforms.uTime = time;
    }

    setFocusDistrict(x, y) {
        this.uniforms.uFocusDistrict = [x, y];
    }

    /**
     * Set the high-resolution texture for the focused district
     * @param {PIXI.Texture} texture 
     */
    setHiResTexture(texture) {
        if (texture) {
            this.uniforms.uHiResTexture = texture;
            this.uniforms.uHiResValid = 1.0;
        } else {
            this.uniforms.uHiResValid = 0.0;
        }
    }

    setResolution(width, height) {
        this.uniforms.uResolution = [width, height];
    }

    /**
     * Set the safety mask for The Void shader logic
     * @param {Float32Array} mask - 32x32 grid where 1.0 = quarantined, 0.0 = safe
     */
    setSafetyMask(mask) {
        this.uniforms.uSafetyMask = mask;

        // Check if any districts are quarantined
        let hasQuarantine = false;
        for (let i = 0; i < mask.length; i++) {
            if (mask[i] > 0.5) {
                hasQuarantine = true;
                break;
            }
        }
        this.uniforms.uQuarantineActive = hasQuarantine ? 1.0 : 0.0;
    }

    /**
     * Set metabolism values for ambient lighting control
     * Task 5: Metabolism Ambient Lighting
     * @param {number} ipc - Instructions per cycle (0.0 to 1.0)
     * @param {string} throttleLevel - Throttle level: 'NONE', 'MODERATE', or 'AGGRESSIVE'
     */
    setMetabolism(ipc, throttleLevel) {
        // Clamp IPC to valid range [0.0, 1.0]
        this.uniforms.uMetabolismIPC = Math.max(0.0, Math.min(1.0, ipc));

        const throttleMap = {
            'NONE': 0.0,
            'MODERATE': 0.5,
            'AGGRESSIVE': 1.0
        };
        this.uniforms.uThrottleLevel = throttleMap[throttleLevel] || 0.0;
    }
}

// Export for Node.js tests
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { NeuralCityFilter };
}

// Export for browser
if (typeof window !== 'undefined') {
    window.NeuralCityFilter = NeuralCityFilter;
}
