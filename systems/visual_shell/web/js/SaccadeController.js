/**
 * SaccadeController - Smooth camera orchestration for the Mind's Eye.
 *
 * Glides the camera to epicenters of physical activity (ripples)
 * using smooth ease-in-out interpolation.
 */

class SaccadeController {
    constructor(engine) {
        this.engine = engine;
        this.app = engine.config.app;
        
        // Active saccade state
        this.isAnimating = false;
        this.startTime = 0;
        this.duration = 1000;
        
        this.startPos = { x: 0, y: 0, scale: 1 };
        this.targetPos = { x: 0, y: 0, scale: 1 };
        
        // Cooldown to prevent nauseating camera jitter
        this.lastSaccadeTime = 0;
        this.minCooldown = 2000; // 2 seconds between saccades
    }

    /**
     * Trigger a camera saccade to a specific world coordinate.
     * @param {Object} data - {x, y, z, duration}
     */
    saccadeTo(data) {
        const now = Date.now();
        if (now - this.lastSaccadeTime < this.minCooldown) return;
        if (this.isAnimating) return;

        console.log(`👁️ Saccade triggered to: (${data.x.toFixed(1)}, ${data.y.toFixed(1)})`);

        // Capture current state
        this.startPos = {
            x: this.engine.world.x,
            y: this.engine.world.y,
            scale: this.engine.world.scale.x
        };

        // Calculate target x/y to center the point
        // World coordinates -> Screen center
        // screen_pos = world_pos * scale + world_offset
        // world_offset = screen_center - world_pos * scale
        
        const screenCenterX = window.innerWidth / 2;
        const screenCenterY = window.innerHeight / 2;
        
        this.targetPos = {
            x: screenCenterX - data.x * this.startPos.scale,
            y: screenCenterY - data.y * this.startPos.scale,
            scale: this.startPos.scale // Maintain current zoom for now
        };

        this.startTime = now;
        this.duration = data.duration || 1000;
        this.isAnimating = true;
        this.lastSaccadeTime = now;
    }

    /**
     * Update camera interpolation. Called from engine render loop.
     */
    update() {
        if (!this.isAnimating) return;

        const now = Date.now();
        const elapsed = now - this.startTime;
        const progress = Math.min(1.0, elapsed / this.duration);

        // Smooth ease-in-out curve
        const t = progress < 0.5 
            ? 2 * progress * progress 
            : 1 - Math.pow(-2 * progress + 2, 2) / 2;

        // Interpolate position
        this.engine.world.x = this.startPos.x + (this.targetPos.x - this.startPos.x) * t;
        this.engine.world.y = this.startPos.y + (this.targetPos.y - this.startPos.y) * t;

        if (progress >= 1.0) {
            this.isAnimating = false;
            console.log('👁️ Saccade complete');
        }
    }

    /**
     * Cancel active saccade (e.g. if user starts dragging).
     */
    cancel() {
        if (this.isAnimating) {
            this.isAnimating = false;
            console.log('👁️ Saccade cancelled by user');
        }
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.SaccadeController = SaccadeController;
}
