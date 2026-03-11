/**
 * PursuitController - Smooth pursuit movements for tracking objects
 *
 * Phase 47 Advanced Features - Task 2.2: Pursuit Movements
 *
 * Implements smooth pursuit algorithm:
 * - Track moving objects with smooth eye movements
 * - Velocity prediction for anticipatory tracking
 * - Pursuit/saccade hybrid mode
 * - Catch-up saccades when target moves too fast
 *
 * @class PursuitController
 */

class PursuitController {
    constructor(config = {}) {
        this.config = {
            // Pursuit parameters
            pursuitGain: 0.9,             // How closely to follow target (0-1)
            pursuitVelocityThreshold: 50,  // Min velocity to trigger pursuit (pixels/sec)
            maxPursuitVelocity: 2000,      // Max pursuit velocity (pixels/sec)
            
            // Prediction parameters
            predictionTime: 100,           // Lookahead time for prediction (ms)
            velocitySmoothing: 0.3,        // Smoothing for velocity estimates
            
            // Catch-up saccade parameters
            catchUpThreshold: 200,         // Position error to trigger catch-up saccade (pixels)
            catchUpSpeed: 0.5,            // Speed of catch-up saccade
            
            // Transition parameters
            pursuitToSaccadeDelay: 150,    // Delay before switching to saccade (ms)
            
            ...config
        };

        // Current state
        this.phase = 'idle';  // idle, pursuing, saccade, recovering
        this.position = { x: 0, y: 0 };
        this.targetPosition = { x: 0, y: 0 };
        
        // Velocity tracking
        this.velocity = { x: 0, y: 0 };
        this.velocityHistory = [];
        
        // Target tracking
        this.targetObject = null;
        this.targetHistory = [];
        this.isTracking = false;
        
        // Timing
        this.lastUpdate = 0;
        this.lastPursuitTime = 0;
        this.pursuitStartTime = 0;
        
        // Callbacks
        this.onPursuitStart = null;
        this.onPursuitEnd = null;
        this.onCatchUpSaccade = null;
    }

    /**
     * Start tracking a target object
     * @param {Object} target - Target object with getPosition() method or {x, y} property
     */
    trackTarget(target) {
        this.targetObject = target;
        this.isTracking = true;
        this.pursuitStartTime = Date.now();
        
        // Initialize position from target
        const targetPos = this._getTargetPosition();
        this.position = { ...targetPos };
        
        this.phase = 'pursuing';
        
        if (this.onPursuitStart) {
            this.onPursuitStart(target);
        }
    }

    /**
     * Stop tracking current target
     */
    stopTracking() {
        this.isTracking = false;
        this.targetObject = null;
        this.targetHistory = [];
        
        if (this.phase === 'pursuing') {
            this.phase = 'idle';
            if (this.onPursuitEnd) {
                this.onPursuitEnd(this.position);
            }
        }
    }

    /**
     * Get current target position
     */
    _getTargetPosition() {
        if (!this.targetObject) {
            return this.position;
        }
        
        // Handle different target types
        if (typeof this.targetObject.getPosition === 'function') {
            return this.targetObject.getPosition();
        }
        
        if (this.targetObject.x !== undefined) {
            return { x: this.targetObject.x, y: this.targetObject.y };
        }
        
        return this.position;
    }

    /**
     * Update target position (manual update mode)
     */
    updateTargetPosition(x, y) {
        this.targetPosition = { x, y };
        
        // Add to history
        this.targetHistory.push({
            x, y,
            timestamp: Date.now()
        });
        
        // Keep history limited
        if (this.targetHistory.length > 10) {
            this.targetHistory.shift();
        }
    }

    /**
     * Calculate target velocity from history
     */
    _calculateVelocity() {
        if (this.targetHistory.length < 2) {
            return { x: 0, y: 0 };
        }
        
        // Get most recent two positions
        const recent = this.targetHistory[this.targetHistory.length - 1];
        const previous = this.targetHistory[this.targetHistory.length - 2];
        
        const dt = (recent.timestamp - previous.timestamp) / 1000;  // seconds
        if (dt === 0) return { x: 0, y: 0 };
        
        const vx = (recent.x - previous.x) / dt;
        const vy = (recent.y - previous.y) / dt;
        
        // Smooth with previous velocity
        const smoothedVx = this.velocity.x + (vx - this.velocity.x) * this.config.velocitySmoothing;
        const smoothedVy = this.velocity.y + (vy - this.velocity.y) * this.config.velocitySmoothing;
        
        return { x: smoothedVx, y: smoothedVy };
    }

    /**
     * Predict target position ahead in time
     * @param {number} aheadTime - Time to predict ahead (ms)
     */
    predictPosition(aheadTime = 100) {
        const seconds = aheadTime / 1000;
        const predictedX = this.position.x + this.velocity.x * seconds;
        const predictedY = this.position.y + this.velocity.y * seconds;
        
        return { x: predictedX, y: predictedY };
    }

    /**
     * Check if currently pursuing
     */
    isPursuing() {
        return this.phase === 'pursuing';
    }

    /**
     * Update pursuit controller
     * @param {number} deltaTime - Time since last update (ms)
     */
    update(deltaTime) {
        const now = Date.now();
        
        if (!this.isTracking || !this.targetObject) {
            // If in tracking mode with manual position updates
            if (this.targetHistory.length > 0) {
                this._updatePursuit(deltaTime);
            }
            return;
        }
        
        // Get current target position
        const targetPos = this._getTargetPosition();
        this.updateTargetPosition(targetPos.x, targetPos.y);
        
        // Update velocity
        this.velocity = this._calculateVelocity();
        
        // Calculate velocity magnitude
        const velocityMagnitude = Math.sqrt(
            this.velocity.x ** 2 + this.velocity.y ** 2
        );
        
        // Check if we should pursue or saccade
        if (velocityMagnitude < this.config.pursuitVelocityThreshold) {
            // Target is moving slowly or stopped
            if (this.phase === 'pursuing') {
                this.phase = 'idle';
                if (this.onPursuitEnd) {
                    this.onPursuitEnd(this.position);
                }
            }
        } else if (velocityMagnitude > this.config.maxPursuitVelocity) {
            // Target moving too fast - use catch-up saccade
            this._performCatchUpSaccade();
        } else {
            // Normal pursuit
            this._updatePursuit(deltaTime);
        }
        
        this.lastUpdate = now;
    }

    /**
     * Update pursuit movement
     */
    _updatePursuit(deltaTime) {
        const targetPos = this._getTargetPosition();
        
        // Calculate position error
        const dx = targetPos.x - this.position.x;
        const dy = targetPos.y - this.position.y;
        const distance = Math.sqrt(dx * dx + dy * dy);
        
        // Check if we need a catch-up saccade
        if (distance > this.config.catchUpThreshold) {
            this._performCatchUpSaccade();
            return;
        }
        
        // Smooth pursuit - move toward target with gain
        const gain = this.config.pursuitGain;
        const seconds = deltaTime / 1000;
        
        // Predictive pursuit: aim where target will be
        const predicted = this.predictPosition(this.config.predictionTime);
        
        // Blend between current target and prediction
        const blendX = targetPos.x * (1 - gain) + predicted.x * gain;
        const blendY = targetPos.y * (1 - gain) + predicted.y * gain;
        
        // Update position with pursuit gain
        this.position.x += (blendX - this.position.x) * gain;
        this.position.y += (blendY - this.position.y) * gain;
        
        this.phase = 'pursuing';
        this.lastPursuitTime = Date.now();
    }

    /**
     * Perform catch-up saccade
     */
    _performCatchUpSaccade() {
        const targetPos = this._getTargetPosition();
        
        this.phase = 'saccade';
        
        // Move quickly toward target
        const dx = targetPos.x - this.position.x;
        const dy = targetPos.y - this.position.y;
        
        this.position.x += dx * this.config.catchUpSpeed;
        this.position.y += dy * this.config.catchUpSpeed;
        
        if (this.onCatchUpSaccade) {
            this.onCatchUpSaccade(this.position, targetPos);
        }
        
        // After catch-up, return to pursuit
        setTimeout(() => {
            if (this.isTracking) {
                this.phase = 'pursuing';
            }
        }, this.config.pursuitToSaccadeDelay);
    }

    /**
     * Get current state
     */
    getState() {
        return {
            phase: this.phase,
            position: { ...this.position },
            targetPosition: { ...this.targetPosition },
            velocity: { ...this.velocity },
            isTracking: this.isTracking,
            targetObject: this.targetObject
        };
    }

    /**
     * Get pursuit statistics
     */
    getStats() {
        return {
            phase: this.phase,
            isTracking: this.isTracking,
            velocityMagnitude: Math.sqrt(
                this.velocity.x ** 2 + this.velocity.y ** 2
            ),
            pursuitDuration: this.isTracking ? 
                Date.now() - this.pursuitStartTime : 0,
            targetHistoryLength: this.targetHistory.length
        };
    }

    /**
     * Enable/disable pursuit/saccade hybrid mode
     */
    setHybridMode(enabled) {
        this.config.hybridMode = enabled;
    }

    /**
     * Destroy the controller
     */
    destroy() {
        this.stopTracking();
        this.targetHistory = [];
        this.velocityHistory = [];
    }
}

// Export
if (typeof window !== 'undefined') {
    window.PursuitController = PursuitController;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PursuitController };
}
