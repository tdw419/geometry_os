/**
 * SaccadicController - Biologically-plausible eye movement simulation
 *
 * Phase 47: Tectonic Saccadic Optimization - Task 1
 *
 * Simulates saccadic eye movements:
 * 1. Saccade phase: Quick jump to target (50-200ms)
 * 2. Settling phase: Exponential decay to final position (100-300ms)
 * 3. Fixation phase: Stable position with micro-tremors
 *
 * @class SaccadicController
 */
class SaccadicController {
    constructor(config = {}) {
        this.config = {
            saccadeDuration: 150,      // ms
            settlingDuration: 200,     // ms
            saccadeThreshold: 100,     // pixels - trigger saccade if movement exceeds this
            velocitySampleSize: 5,     // number of frames to average for velocity
            ...config
        };

        // State
        this.phase = 'idle';           // idle, saccade, settling, fixation
        this.position = { x: 0, y: 0 };
        this.target = { x: 0, y: 0 };
        this.startPos = { x: 0, y: 0 };
        this.velocity = { x: 0, y: 0, magnitude: 0 };
        this.velocityHistory = [];

        // Timing
        this.saccadeStartTime = 0;
        this.settlingStartTime = 0;
        this.settlingFactor = 0;       // 0-1, 1 = fully settled

        // Callbacks
        this.onSaccadeStart = null;
        this.onSaccadeEnd = null;
        this.onSettlingComplete = null;
    }

    /**
     * Set target position (triggers saccade if far enough)
     */
    setTarget(x, y) {
        this.target = { x, y };

        const distance = this._distance(this.position, this.target);

        if (distance > this.config.saccadeThreshold) {
            this._startSaccade();
        }
    }

    /**
     * Update position (called during continuous movement)
     */
    updatePosition(x, y, deltaTime = 16) {
        const prevPosition = { ...this.position };
        this.position = { x, y };

        // Calculate velocity
        const vx = (x - prevPosition.x) / deltaTime * 1000; // pixels per second
        const vy = (y - prevPosition.y) / deltaTime * 1000;
        const magnitude = Math.sqrt(vx * vx + vy * vy);

        this.velocity = { x: vx, y: vy, magnitude };

        // Add to history
        this.velocityHistory.push({ ...this.velocity, time: Date.now() });
        if (this.velocityHistory.length > this.config.velocitySampleSize) {
            this.velocityHistory.shift();
        }
    }

    /**
     * Get averaged velocity from history
     */
    getVelocity() {
        if (this.velocityHistory.length === 0) {
            return this.velocity;
        }

        const sum = this.velocityHistory.reduce((acc, v) => ({
            x: acc.x + v.x,
            y: acc.y + v.y,
            magnitude: acc.magnitude + v.magnitude
        }), { x: 0, y: 0, magnitude: 0 });

        const count = this.velocityHistory.length;
        return {
            x: sum.x / count,
            y: sum.y / count,
            magnitude: sum.magnitude / count
        };
    }

    /**
     * Predict position in the future based on current velocity
     */
    predictPosition(aheadTime = 200) {
        const velocity = this.getVelocity();
        return {
            x: this.position.x + velocity.x * aheadTime / 1000,
            y: this.position.y + velocity.y * aheadTime / 1000
        };
    }

    /**
     * Start saccade phase
     */
    _startSaccade() {
        this.phase = 'saccade';
        this.startPos = { ...this.position };
        this.saccadeStartTime = Date.now();

        if (this.onSaccadeStart) {
            this.onSaccadeStart(this.startPos, this.target);
        }
    }

    /**
     * Update loop (call every frame)
     */
    update(deltaTime) {
        const now = Date.now();

        switch (this.phase) {
            case 'saccade':
                this._updateSaccade(now);
                break;
            case 'settling':
                this._updateSettling(now, deltaTime);
                break;
            case 'fixation':
                this._updateFixation(deltaTime);
                break;
        }
    }

    /**
     * Update saccade phase (quick jump)
     */
    _updateSaccade(now) {
        const elapsed = now - this.saccadeStartTime;
        const progress = Math.min(elapsed / this.config.saccadeDuration, 1);

        // Ease-out cubic for saccade motion
        const eased = 1 - Math.pow(1 - progress, 3);

        this.position.x = this.startPos.x + (this.target.x - this.startPos.x) * eased;
        this.position.y = this.startPos.y + (this.target.y - this.startPos.y) * eased;

        if (progress >= 1) {
            this._startSettling(now);
        }
    }

    /**
     * Start settling phase
     */
    _startSettling(now) {
        this.phase = 'settling';
        this.settlingStartTime = now;
        this.settlingFactor = 0;

        if (this.onSaccadeEnd) {
            this.onSaccadeEnd(this.position);
        }
    }

    /**
     * Update settling phase (exponential decay)
     */
    _updateSettling(now, deltaTime) {
        const elapsed = now - this.settlingStartTime;
        const progress = elapsed / this.config.settlingDuration;

        // Exponential settling: factor = 1 - e^(-5t)
        this.settlingFactor = 1 - Math.exp(-5 * progress);

        if (progress >= 1) {
            this.phase = 'fixation';
            this.settlingFactor = 1;

            if (this.onSettlingComplete) {
                this.onSettlingComplete(this.position);
            }
        }
    }

    /**
     * Update fixation phase (stable with micro-tremors)
     */
    _updateFixation(deltaTime) {
        // Micro-tremors: tiny random movements
        const tremorAmount = 0.5;
        this.position.x += (Math.random() - 0.5) * tremorAmount;
        this.position.y += (Math.random() - 0.5) * tremorAmount;
    }

    /**
     * Calculate distance between two points
     */
    _distance(p1, p2) {
        const dx = p2.x - p1.x;
        const dy = p2.y - p1.y;
        return Math.sqrt(dx * dx + dy * dy);
    }

    /**
     * Get current state
     */
    getState() {
        return {
            phase: this.phase,
            position: { ...this.position },
            target: { ...this.target },
            velocity: this.getVelocity(),
            settlingFactor: this.settlingFactor
        };
    }
}

// Export
if (typeof window !== 'undefined') {
    window.SaccadicController = SaccadicController;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SaccadicController };
}
