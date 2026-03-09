/**
 * RippleRenderer - Visualizes physical ripples (waves/collapse) on the infinite map.
 * 
 * Renders expanding cyan rings for expansion waves (modification)
 * and imploding orange rings for void collapse (deletion).
 */

class RippleRenderer {
    constructor(app, layer) {
        this.app = app;
        this.layer = layer;
        this.activeRipples = new Set();
    }

    /**
     * Emit a visual ripple.
     * @param {Object} data - Ripple data {x, y, z, force, radius}
     */
    emitRipple(data) {
        const ripple = {
            id: `ripple_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
            x: data.x,
            y: data.y,
            z: data.z || 0,
            force: data.force,
            maxRadius: data.radius || 200,
            startTime: Date.now(),
            duration: 1500, // 1.5 seconds
            graphics: new PIXI.Graphics()
        };

        // Expansion (cyan) or Collapse (orange)
        ripple.color = data.force > 0 ? 0x00ffff : 0xff8800;
        
        this.layer.addChild(ripple.graphics);
        this.activeRipples.add(ripple);
    }

    /**
     * Update animations for all active ripples.
     */
    update() {
        const now = Date.now();
        
        this.activeRipples.forEach(ripple => {
            const elapsed = now - ripple.startTime;
            const progress = elapsed / ripple.duration;

            if (progress >= 1) {
                this.layer.removeChild(ripple.graphics);
                ripple.graphics.destroy({ children: true });
                this.activeRipples.delete(ripple);
                return;
            }

            ripple.graphics.clear();

            if (ripple.force > 0) {
                // EXPANSION WAVE: Expanding rings
                const currentRadius = progress * ripple.maxRadius;
                const alpha = 1.0 - progress;
                
                // Draw 2-3 concentric rings
                for (let i = 0; i < 3; i++) {
                    const r = currentRadius * (1.0 - i * 0.2);
                    if (r > 0) {
                        ripple.graphics.circle(ripple.x, ripple.y, r);
                        ripple.graphics.stroke({ 
                            color: ripple.color, 
                            width: 2, 
                            alpha: alpha * (1.0 - i * 0.3) 
                        });
                    }
                }
            } else {
                // VOID COLLAPSE: Imploding rings
                const currentRadius = (1.0 - progress) * ripple.maxRadius;
                const alpha = progress; // Fades in as it collapses? Or fades out?
                
                // Draw 2 concentric rings imploding
                for (let i = 0; i < 2; i++) {
                    const r = currentRadius * (1.0 + i * 0.3);
                    ripple.graphics.circle(ripple.x, ripple.y, r);
                    ripple.graphics.stroke({ 
                        color: ripple.color, 
                        width: 3, 
                        alpha: (1.0 - progress) * (1.0 - i * 0.4) 
                    });
                }
                
                // Draw a small "void" point in center
                ripple.graphics.circle(ripple.x, ripple.y, 5 * (1.0 - progress));
                ripple.graphics.fill({ color: ripple.color, alpha: 1.0 - progress });
            }
        });
    }
}

// Export for browser and module systems
if (typeof module !== 'undefined' && module.exports) {
    module.exports = RippleRenderer;
}
if (typeof window !== 'undefined') {
    window.RippleRenderer = RippleRenderer;
}
