/**
 * SmoothLODTransition - Smooth cross-fade between LOD levels
 *
 * Phase 47: Tectonic Saccadic Optimization - Task 2
 *
 * Eliminates abrupt LOD switches by:
 * 1. Blending alpha between old and new render modes
 * 2. Interpolating quality settings
 * 3. Using configurable easing functions
 *
 * @class SmoothLODTransition
 */
class SmoothLODTransition {
    constructor(config = {}) {
        this.config = {
            fromLevel: null,      // Source LOD level
            toLevel: null,        // Target LOD level
            duration: 300,        // Transition duration in ms
            easing: 'ease-out',   // Easing function
            ...config
        };

        // State
        this.progress = 0;        // 0-1
        this.blendFactor = 0;     // 0-1, applied to alpha values
        this.isRunning = false;
        this.isComplete = false;
        this.startTime = 0;

        // Event listeners
        this.eventListeners = new Map();
    }

    /**
     * Start the transition
     */
    start() {
        this.isRunning = true;
        this.isComplete = false;
        this.progress = 0;
        this.blendFactor = 0;
        this.startTime = Date.now();
        this.emit('start');
    }

    /**
     * Update transition (call every frame)
     */
    update(deltaTime) {
        if (!this.isRunning || this.isComplete) {
            return;
        }

        const elapsed = Date.now() - this.startTime;
        this.progress = Math.min(elapsed / this.config.duration, 1);

        // Apply easing
        this.blendFactor = this._applyEasing(this.progress, this.config.easing);

        if (this.progress >= 1) {
            this.isComplete = true;
            this.isRunning = false;
            this.emit('complete');
        }
    }

    /**
     * Get current interpolated quality
     */
    getCurrentQuality() {
        const fromQ = this.config.fromLevel?.quality || 0.5;
        const toQ = this.config.toLevel?.quality || 0.5;
        return fromQ + (toQ - fromQ) * this.blendFactor;
    }

    /**
     * Get blend values for alpha compositing
     */
    getBlend() {
        const fromAlpha = this.config.fromLevel?.alpha || 0.5;
        const toAlpha = this.config.toLevel?.alpha || 0.5;

        return {
            fromAlpha: fromAlpha * (1 - this.blendFactor),
            toAlpha: toAlpha * this.blendFactor
        };
    }

    /**
     * Get current render options (interpolated)
     */
    getRenderOptions() {
        const quality = this.getCurrentQuality();
        const blend = this.getBlend();

        return {
            quality: quality,
            alpha: Math.max(blend.fromAlpha, blend.toAlpha),
            blendFactor: this.blendFactor,
            // Include both LOD level data for dual rendering
            fromLevel: this.config.fromLevel,
            toLevel: this.config.toLevel
        };
    }

    /**
     * Apply easing function
     */
    _applyEasing(t, easing) {
        switch (easing) {
            case 'linear':
                return t;
            case 'ease-in':
                return t * t;
            case 'ease-out':
                return 1 - Math.pow(1 - t, 2);
            case 'ease-in-out':
                return t < 0.5
                    ? 2 * t * t
                    : 1 - Math.pow(-2 * t + 2, 2) / 2;
            case 'exponential-out':
                return t === 1 ? 1 : 1 - Math.pow(2, -10 * t);
            default:
                return 1 - Math.pow(1 - t, 2);
        }
    }

    /**
     * Event handling
     */
    on(event, callback) {
        if (!this.eventListeners.has(event)) {
            this.eventListeners.set(event, new Set());
        }
        this.eventListeners.get(event).add(callback);
    }

    off(event, callback) {
        if (this.eventListeners.has(event)) {
            this.eventListeners.get(event).delete(callback);
        }
    }

    emit(event, data) {
        if (this.eventListeners.has(event)) {
            this.eventListeners.get(event).forEach(cb => cb(data));
        }
    }
}

/**
 * LODTransitionManager - Manages multiple LOD transitions
 *
 * @class LODTransitionManager
 */
class LODTransitionManager {
    constructor(config = {}) {
        this.config = {
            defaultDuration: 300,
            defaultEasing: 'ease-out',
            ...config
        };

        // Current transition
        this.currentTransition = null;
        this.currentLevel = null;

        // Previous level (for blending)
        this.previousLevel = null;
    }

    /**
     * Transition to new LOD level
     */
    transitionTo(newLevel, options = {}) {
        // Cancel current transition
        if (this.currentTransition && this.currentTransition.isRunning) {
            this.currentTransition.isComplete = true;
        }

        // Store previous level
        this.previousLevel = this.currentLevel;

        // Create new transition
        this.currentTransition = new SmoothLODTransition({
            fromLevel: this.previousLevel,
            toLevel: newLevel,
            duration: options.duration || this.config.defaultDuration,
            easing: options.easing || this.config.defaultEasing
        });

        this.currentLevel = newLevel;
        this.currentTransition.start();

        return this.currentTransition;
    }

    /**
     * Update transition manager
     */
    update(deltaTime) {
        if (this.currentTransition) {
            this.currentTransition.update(deltaTime);

            // Clean up completed transitions
            if (this.currentTransition.isComplete) {
                this.previousLevel = null;
            }
        }
    }

    /**
     * Get current render options
     */
    getRenderOptions() {
        if (this.currentTransition && this.currentTransition.isRunning) {
            return this.currentTransition.getRenderOptions();
        }

        // No active transition, use current level
        return {
            quality: this.currentLevel?.quality || 1.0,
            alpha: this.currentLevel?.alpha || 1.0,
            blendFactor: 1.0,
            fromLevel: null,
            toLevel: this.currentLevel
        };
    }

    /**
     * Check if currently transitioning
     */
    isTransitioning() {
        return this.currentTransition?.isRunning || false;
    }

    /**
     * Event handling (proxy to current transition)
     */
    on(event, callback) {
        if (this.currentTransition) {
            this.currentTransition.on(event, callback);
        }
    }
}

// Export
if (typeof window !== 'undefined') {
    window.SmoothLODTransition = SmoothLODTransition;
    window.LODTransitionManager = LODTransitionManager;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SmoothLODTransition, LODTransitionManager };
}
