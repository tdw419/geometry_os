/**
 * MotionQualityScaler - Dynamic quality adjustment based on movement
 *
 * Phase 47, Task 4: Tectonic Saccadic Optimization
 *
 * Reduces rendering quality during fast movements to maintain performance:
 * 1. Velocity-based quality scaling
 * 2. Motion blur during saccades
 * 3. Phase-aware quality restoration
 * 4. Configurable quality thresholds
 *
 * @class MotionQualityScaler
 */
class MotionQualityScaler {
    constructor(config = {}) {
        this.config = {
            minQuality: 0.2,           // Minimum quality factor
            maxQuality: 1.0,           // Maximum quality factor
            speedThreshold: 100,       // pixels/sec - no scaling below this
            speedLimit: 2000,          // pixels/sec - min quality above this
            maxBlur: 8,                // Maximum blur amount (pixels)
            saccadeBlur: 4,            // Blur during saccade
            settlingRecovery: 0.1,     // Quality recovery per ms during settling
            ...config
        };

        // Current phase (from saccadic controller)
        this.phase = 'fixation';
        this.settlingProgress = 0;    // 0-1
    }

    /**
     * Set current phase (from saccadic controller)
     * @param {string} phase - 'idle', 'saccade', 'settling', or 'fixation'
     * @param {number} progress - Settling progress (0-1)
     */
    setPhase(phase, progress = 0) {
        this.phase = phase;
        this.settlingProgress = Math.max(0, Math.min(1, progress));
    }

    /**
     * Get quality factor based on velocity
     * @param {Object} velocity - Velocity object with x, y, and magnitude
     * @returns {number} Quality factor (0-1)
     */
    getQuality(velocity) {
        const speed = velocity.magnitude || Math.sqrt(velocity.x ** 2 + velocity.y ** 2);

        // Apply phase-based adjustments
        let quality = this._calculateSpeedQuality(speed);

        if (this.phase === 'saccade') {
            // Reduce quality during saccade (motion blur masks detail loss)
            quality *= 0.5;
        } else if (this.phase === 'settling') {
            // Gradually restore quality during settling
            // settlingProgress goes from 0 to 1
            // At start (0): quality * 0.7, at end (1): approach full quality
            quality = quality * 0.7 + (1 - this.settlingProgress) * 0.3;
        }

        return Math.max(this.config.minQuality, Math.min(this.config.maxQuality, quality));
    }

    /**
     * Calculate quality based on speed only
     * @param {number} speed - Speed in pixels per second
     * @returns {number} Quality factor (0-1)
     * @private
     */
    _calculateSpeedQuality(speed) {
        if (speed < this.config.speedThreshold) {
            return this.config.maxQuality;
        }

        // Normalize speed to 0-1 range
        const normalizedSpeed = Math.min(
            (speed - this.config.speedThreshold) /
            (this.config.speedLimit - this.config.speedThreshold),
            1
        );

        // Linear interpolation from maxQuality to minQuality
        return this.config.maxQuality - normalizedSpeed * (this.config.maxQuality - this.config.minQuality);
    }

    /**
     * Get render options with quality and blur
     * @param {Object} velocity - Velocity object with x, y, and magnitude
     * @param {string} phase - Override phase (optional)
     * @returns {Object} Render options with quality, alpha, and blur
     */
    getRenderOptions(velocity, phase = null) {
        const effectivePhase = phase || this.phase;
        const quality = this.getQuality(velocity);

        const options = {
            quality: quality,
            alpha: quality * 0.8,
            blur: 0
        };

        // Add motion blur during saccade
        if (effectivePhase === 'saccade') {
            options.blur = this.config.saccadeBlur;
        } else {
            // Add velocity-based blur during fast movement
            const speed = velocity.magnitude || Math.sqrt(velocity.x ** 2 + velocity.y ** 2);
            if (speed > this.config.speedThreshold * 2) {
                const blurRatio = Math.min(
                    (speed - this.config.speedThreshold * 2) / this.config.speedLimit,
                    1
                );
                options.blur = blurRatio * this.config.maxBlur * 0.5;
            }
        }

        return options;
    }

    /**
     * Determine if rendering should be simplified
     * @param {Object} velocity - Velocity object
     * @returns {boolean} True if should use simplified rendering
     */
    shouldSimplify(velocity) {
        const quality = this.getQuality(velocity);
        return quality < 0.6;
    }

    /**
     * Determine if rendering should be skipped entirely
     * @param {Object} velocity - Velocity object
     * @returns {boolean} True if should skip rendering
     */
    shouldSkip(velocity) {
        const quality = this.getQuality(velocity);
        return quality < 0.3 && this.phase === 'saccade';
    }

    /**
     * Get current configuration
     * @returns {Object} Current configuration
     */
    getConfig() {
        return { ...this.config };
    }

    /**
     * Update configuration
     * @param {Object} updates - Configuration updates
     */
    updateConfig(updates) {
        Object.assign(this.config, updates);
    }

    /**
     * Reset to initial state
     */
    reset() {
        this.phase = 'fixation';
        this.settlingProgress = 0;
    }

    /**
     * Get current state
     * @returns {Object} Current state
     */
    getState() {
        return {
            phase: this.phase,
            settlingProgress: this.settlingProgress,
            config: { ...this.config }
        };
    }
}

// Export for different environments
if (typeof window !== 'undefined') {
    window.MotionQualityScaler = MotionQualityScaler;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { MotionQualityScaler };
}
