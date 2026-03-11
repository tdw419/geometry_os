/**
 * MotionQualityScaler - Dynamic quality adjustment based on movement
 *
 * Phase 47: Tectonic Saccadic Optimization - Task 4
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
            minQuality: 0.2,          // Minimum quality factor
            maxQuality: 1.0,          // Maximum quality factor
            speedThreshold: 100,      // pixels/sec - no scaling below this
            speedLimit: 2000,         // pixels/sec - min quality above this
            maxBlur: 8,               // Maximum blur amount (pixels)
            saccadeBlur: 4,           // Blur during saccade
            settlingRecovery: 0.1,     // Quality recovery per ms during settling
            ...config
        };

        // Current phase (from saccadic controller)
        this.phase = 'fixation';
        this.settlingProgress = 0;    // 0-1
    }

    /**
     * Set current phase (from saccadic controller)
     */
    setPhase(phase, progress = 0) {
        this.phase = phase;
        this.settlingProgress = progress;
    }

    /**
     * Get quality factor based on velocity
     */
    getQuality(velocity) {
        const speed = velocity.magnitude || Math.sqrt(velocity.x ** 2 + velocity.y ** 2);

        // Apply phase-based adjustments
        let quality = this._calculateSpeedQuality(speed);

        if (this.phase === 'saccade') {
            // Reduce quality during saccade
            quality *= 0.5;
        } else if (this.phase === 'settling') {
            // Gradually restore quality during settling
            quality = quality * 0.7 + (1 - this.settlingProgress) * 0.3;
        }

        return Math.max(this.config.minQuality, Math.min(this.config.maxQuality, quality));
    }

    /**
     * Calculate quality based on speed
     */
    _calculateSpeedQuality(speed) {
        if (speed < this.config.speedThreshold) {
            return this.config.maxQuality;
        }

        const normalizedSpeed = Math.min(
            (speed - this.config.speedThreshold) /
            (this.config.speedLimit - this.config.speedThreshold),
            1
        );

        // Linear interpolation
        return this.config.maxQuality - normalizedSpeed * (this.config.maxQuality - this.config.minQuality);
    }

    /**
     * Get render options with quality and blur
     */
    getRenderOptions(velocity, phase = null) {
        const effectivePhase = phase || this.phase;
        const quality = this.getQuality(velocity);

        const options = {
            quality: quality,
            alpha: quality * 0.8,
            blur: 0
        };

        // Add motion blur during saccade or fast movement
        if (effectivePhase === 'saccade') {
            options.blur = this.config.saccadeBlur;
        } else {
            const speed = velocity.magnitude || Math.sqrt(velocity.x ** 2 + velocity.y ** 2);
            if (speed > this.config.speedThreshold * 2) {
                const blurRatio = Math.min((speed - this.config.speedThreshold * 2) / this.config.speedLimit, 1);
                options.blur = blurRatio * this.config.maxBlur * 0.5;
            }
        }

        return options;
    }

    /**
     * Should render simplified version?
     */
    shouldSimplify(velocity) {
        const quality = this.getQuality(velocity);
        return quality < 0.6;
    }

    /**
     * Should skip rendering entirely?
     */
    shouldSkip(velocity) {
        const quality = this.getQuality(velocity);
        return quality < 0.3 && this.phase === 'saccade';
    }
}

// Export
if (typeof window !== 'undefined') {
    window.MotionQualityScaler = MotionQualityScaler;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { MotionQualityScaler };
}
