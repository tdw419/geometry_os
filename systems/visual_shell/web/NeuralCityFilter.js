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
 *
 * Task 3: Material Palette
 * - Material colors representing neural network quantization levels
 * - Gold: F32 (Full precision weights)
 * - Steel: Q8 (8-bit quantization)
 * - Rust: Q4 (4-bit quantization)
 * - Dust: Sparse/Zero weights
 * Task 5: Metabolism Ambient Lighting
 * - uMetabolismIPC: Instructions per cycle (0.0 to 1.0) - controls city brightness
 * - uThrottleLevel: Throttle intensity (0.0=NONE, 0.5=MODERATE, 1.0=AGGRESSIVE)
 */

class NeuralCityFilter extends (typeof PIXI !== 'undefined' ? PIXI.Filter : Object) {
    constructor(options = {}) {
        // Material palette colors (RGBA)
        // Represents different quantization levels in neural network weights
        const materials = {
            gold: [1.0, 0.84, 0.0, 1.0],    // F32 - Full precision
            steel: [0.69, 0.75, 0.77, 1.0], // Q8 - 8-bit quantization
            rust: [0.72, 0.45, 0.20, 1.0],  // Q4 - 4-bit quantization
            dust: [0.66, 0.66, 0.66, 1.0]   // Sparse/Zero weights
        };

        // Uniforms for the WGSL shader
        const uniforms = {
            uResolution: [typeof window !== 'undefined' ? window.innerWidth : 800,
                          typeof window !== 'undefined' ? window.innerHeight : 600],
            uTime: 0,
            uFocusX: options.focusX !== undefined ? options.focusX : 0.5,
            uFocusY: options.focusY !== undefined ? options.focusY : 0.5,
            uZoom: options.zoom !== undefined ? options.zoom : 1.0,
            uFocusDistrict: [0, 0],
            uHiResValid: 0.0,
            uHiResBlend: 0.0,
            uLowResTexture: options.lowResTexture || null,
            uHiResTexture: options.hiResTexture || null,
            // Task 2: The Void Shader Logic - Safety mask uniforms
            uSafetyMask: new Float32Array(32 * 32), // Default: no quarantines (all zeros)
            uMaskSize: 32,
            uQuarantineActive: 0.0,
            // Task 5: Metabolism Ambient Lighting
            uMetabolismIPC: 0.5,      // 0.0 to 1.0 (instructions per cycle)
            uThrottleLevel: 0.0,      // 0.0=NONE, 0.5=MODERATE, 1.0=AGGRESSIVE
            // Task 3: Material Palette uniforms
            uMaterialGold: materials.gold,
            uMaterialSteel: materials.steel,
            uMaterialRust: materials.rust,
            uMaterialDust: materials.dust,
            // Task 3: The Pulse system
            uPulseX: new Float32Array(64),
            uPulseY: new Float32Array(64),
            uPulseAge: new Float32Array(64),
            uPulseType: new Float32Array(64), // 0.0=Neural, 1.0=Silicon
            uPulseCount: 0,
            // Task 5: Synaptic Query Highlights
            uHighlightX: new Float32Array(16),
            uHighlightY: new Float32Array(16),
            uHighlightCount: 0,
            // Task 1: Tectonic Drift (V15)
            uDriftTexture: options.driftTexture || null,
            // Task 3: MutationPulse for building morph animations
            uMutationPulse: 0,         // Pulse intensity (0-1)
            uMutationFocusX: 0.5,      // Focus X for morph
            uMutationFocusY: 0.5,      // Focus Y for morph
            uDistrictUpgrade: 0,       // District upgrade flag
            uUpgradeFrom: [0, 0, 0, 0], // From material color
            uUpgradeTo: [0, 0, 0, 0],   // To material color
            uMutationScale: 1.0        // Building scale during morph
        };

        // Note: PIXI v8 uses Filter.from() or a similar constructor
        // We'll assume standard PIXI.Filter structure for now
        super(null, null, uniforms);

        this.uniforms = uniforms;
        this.materials = materials;
        this.filter = null;

        // Mutation animation state
        this.mutationDecay = 0.95;  // Decay per frame
        this.upgradeBlendDuration = 1000; // ms
        this._upgradeStartTime = null;
        this._upgradeDistrictId = null;

        console.log('✓ NeuralCityFilter initialized');
    }


    /**
     * Update filter time uniform with delta
     * @param {number} delta - Delta time in milliseconds
     */
    update(delta) {
        // Decay mutation pulse
        if (this.uniforms.uMutationPulse > 0) {
            this.uniforms.uMutationPulse *= this.mutationDecay;
            if (this.uniforms.uMutationPulse < 0.01) {
                this.uniforms.uMutationPulse = 0;
            }
        }

        // Decay mutation scale back to normal
        if (this.uniforms.uMutationScale > 1.0) {
            this.uniforms.uMutationScale -= 0.01;
            if (this.uniforms.uMutationScale < 1.0) {
                this.uniforms.uMutationScale = 1.0;
            }
        }

        // Handle district upgrade blend
        if (this.uniforms.uDistrictUpgrade > 0 && this._upgradeStartTime) {
            const elapsed = Date.now() - this._upgradeStartTime;
            if (elapsed >= this.upgradeBlendDuration) {
                this.uniforms.uDistrictUpgrade = 0;
                this._upgradeStartTime = null;
            }
        }

        // Update time uniform
        this.uniforms.uTime += delta * 0.01;
    }

    updateTime(time) {
        this.uniforms.uTime = time;
    }

    setFocusDistrict(x, y) {
        this.uniforms.uFocusDistrict = [x, y];
    }

    /**
     * Set focus position
     * @param {number} x - Focus X position (0-1)
     * @param {number} y - Focus Y position (0-1)
     */
    setFocus(x, y) {
        this.uniforms.uFocusX = x;
        this.uniforms.uFocusY = y;
    }

    /**
     * Set zoom level
     * @param {number} zoom - Zoom level
     */
    setZoom(zoom) {
        this.uniforms.uZoom = zoom;
    }

    /**
     * Set hi-res blend value with clamping to 0-1
     * @param {number} value - Blend value (0-1)
     */
    setHiResBlend(value) {
        this.uniforms.uHiResBlend = Math.max(0, Math.min(1, value));
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

    /**
     * Set synaptic query highlight points
     * @param {Float32Array} x - X coordinates
     * @param {Float32Array} y - Y coordinates
     * @param {number} count - Number of points
     */
    setHighlights(x, y, count) {
        this.uniforms.uHighlightX = x;
        this.uniforms.uHighlightY = y;
        this.uniforms.uHighlightCount = count;
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

    /**
     * Get material color by name
     * @param {string} materialName - Name of material ("gold", "steel", "rust", "dust")
     * @returns {number[]} RGBA color array
     */
    getMaterialColor(materialName) {
        return this.materials[materialName] || this.materials.dust;
    }

    /**
     * Get PIXI.Filter-compatible object
     * @returns {Object} Filter object with uniforms
     */
    getFilter() {
        return {
            uniforms: this.uniforms
        };
    }

    /**
     * Trigger a mutation pulse at specific location
     * Creates a "heal" animation where building glows and scales
     * @param {number} x - Focus X position (0-1)
     * @param {number} y - Focus Y position (0-1)
     */
    triggerMutation(x, y) {
        this.uniforms.uMutationPulse = 1.0;
        this.uniforms.uMutationFocusX = x;
        this.uniforms.uMutationFocusY = y;
        this.uniforms.uMutationScale = 1.2; // Scale up during morph
    }

    /**
     * Start a district-level upgrade animation
     * Interpolates entire district from one material to another
     * @param {string} districtId - District identifier (e.g., "5_12")
     * @param {string} fromMaterial - Source material name
     * @param {string} toMaterial - Target material name
     */
    startDistrictUpgrade(districtId, fromMaterial, toMaterial) {
        const fromColor = this.getMaterialColor(fromMaterial);
        const toColor = this.getMaterialColor(toMaterial);

        this.uniforms.uDistrictUpgrade = 1;
        this.uniforms.uUpgradeFrom = fromColor;
        this.uniforms.uUpgradeTo = toColor;
        this.uniforms.uMutationPulse = 0.8;

        this._upgradeStartTime = Date.now();
        this._upgradeDistrictId = districtId;
    }

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
