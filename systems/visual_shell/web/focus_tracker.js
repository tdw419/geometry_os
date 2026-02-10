/**
 * FocusTracker - Tracks user's gaze/attention point
 *
 * Maintains a focus point for priority rendering:
 * 1. Tracks mouse/touch position with smoothing
 * 2. Decays to center when idle
 * 3. Calculates attention weights for tiles
 * 4. Integrates with viewport for world coordinates
 *
 * @class FocusTracker
 */
class FocusTracker {
    constructor(config = {}) {
        this.config = {
            width: typeof window !== 'undefined' ? window.innerWidth : 1000,
            height: typeof window !== 'undefined' ? window.innerHeight : 800,
            smoothingFactor: 0.15,     // Mouse position smoothing (exponential moving average)
            decayRate: 0.05,           // Decay to center per 100ms
            decayDelay: 2000,           // ms before decay starts
            attentionRadius: 300,       // pixels - radius of high attention
            ...config
        };

        // Focus point (screen coordinates)
        this.focusPoint = {
            x: this.config.width / 2,
            y: this.config.height / 2
        };

        // Raw mouse position (target for smoothing)
        this.rawMouse = { ...this.focusPoint };

        // Current smoothed position
        this.currentPosition = { ...this.focusPoint };

        // Idle tracking
        this.lastMouseMoveTime = Date.now();
        this.isDecaying = false;

        // Viewport reference (for world coordinate conversion)
        this.viewport = null;

        // Event handler references (for cleanup)
        this._handleMouseMove = null;
        this._handleTouchMove = null;

        // Bind to window events (only in browser)
        if (typeof window !== 'undefined') {
            this._bindEvents();
        }
    }

    /**
     * Bind to mouse/touch events
     */
    _bindEvents() {
        this._handleMouseMove = (e) => {
            this.updateMouse(e.clientX, e.clientY);
        };

        this._handleTouchMove = (e) => {
            if (e.touches.length > 0) {
                this.updateTouch(e.touches);
            }
        };

        window.addEventListener('mousemove', this._handleMouseMove);
        window.addEventListener('touchmove', this._handleTouchMove, { passive: true });
    }

    /**
     * Update mouse position
     */
    updateMouse(x, y) {
        this.rawMouse = { x, y };
        this.lastMouseMoveTime = Date.now();
        this.isDecaying = false;
    }

    /**
     * Update touch position (uses centroid of touches)
     */
    updateTouch(touches) {
        if (touches.length === 0) return;

        // Calculate centroid of all touch points
        const sumX = touches.reduce((sum, t) => sum + t.clientX, 0);
        const sumY = touches.reduce((sum, t) => sum + t.clientY, 0);

        this.updateMouse(
            sumX / touches.length,
            sumY / touches.length
        );
    }

    /**
     * Start decaying to center
     */
    startDecay() {
        this.isDecaying = true;
    }

    /**
     * Update focus tracker (call every frame)
     */
    update(deltaTime) {
        // Smooth toward raw mouse position using exponential moving average
        // newPos = currentPos + (targetPos - currentPos) * smoothingFactor
        this.currentPosition.x += (this.rawMouse.x - this.currentPosition.x) * this.config.smoothingFactor;
        this.currentPosition.y += (this.rawMouse.y - this.currentPosition.y) * this.config.smoothingFactor;

        // Check for idle (no mouse movement for delay period)
        const idleTime = Date.now() - this.lastMouseMoveTime;
        if (idleTime > this.config.decayDelay) {
            this.isDecaying = true;
        }

        // Decay to center if idle
        if (this.isDecaying) {
            const centerX = this.config.width / 2;
            const centerY = this.config.height / 2;
            // Decay amount scales with deltaTime (per 100ms)
            const decayAmount = this.config.decayRate * deltaTime / 100;

            this.currentPosition.x += (centerX - this.currentPosition.x) * decayAmount;
            this.currentPosition.y += (centerY - this.currentPosition.y) * decayAmount;
        }

        this.focusPoint = { ...this.currentPosition };
    }

    /**
     * Get current focus point in screen coordinates
     */
    getCurrentFocus() {
        return { ...this.focusPoint };
    }

    /**
     * Get focus point in world coordinates
     */
    getWorldFocus() {
        if (!this.viewport) {
            return this.getCurrentFocus();
        }

        // Use viewport's screenToWorld conversion if available
        if (typeof this.viewport.screenToWorld === 'function') {
            return this.viewport.screenToWorld(
                this.focusPoint.x,
                this.focusPoint.y
            );
        }

        // Fallback: assume viewport has camera position
        if (this.viewport.getCamera) {
            const camera = this.viewport.getCamera();
            return {
                x: this.focusPoint.x + camera.x,
                y: this.focusPoint.y + camera.y
            };
        }

        return this.getCurrentFocus();
    }

    /**
     * Calculate attention weights for tiles
     *
     * Returns array of { tile, weight, distance } where:
     * - weight: 0-1, 1 at focus point, 0 at attention radius
     * - distance: pixels from focus point
     */
    getAttentionWeights(tiles) {
        const focus = this.getCurrentFocus();
        const radiusSq = this.config.attentionRadius ** 2;

        return tiles.map(tile => {
            // Calculate tile center
            const tileCenterX = tile.x + (tile.width || 100) / 2;
            const tileCenterY = tile.y + (tile.height || 100) / 2;

            const dx = tileCenterX - focus.x;
            const dy = tileCenterY - focus.y;
            const distSq = dx * dx + dy * dy;

            // Weight: 1 at focus, 0 at attention radius (linear falloff)
            const weight = Math.max(0, 1 - distSq / radiusSq);

            return {
                tile,
                weight,
                distance: Math.sqrt(distSq)
            };
        });
    }

    /**
     * Sort tiles by attention (highest first)
     */
    sortByAttention(tiles) {
        const weighted = this.getAttentionWeights(tiles);
        return weighted
            .sort((a, b) => b.weight - a.weight)
            .map(w => w.tile);
    }

    /**
     * Set viewport reference for world coordinate conversion
     */
    setViewport(viewport) {
        this.viewport = viewport;
    }

    /**
     * Get statistics about current state
     */
    getStats() {
        return {
            focusPoint: { ...this.focusPoint },
            idleTime: Date.now() - this.lastMouseMoveTime,
            isDecaying: this.isDecaying
        };
    }

    /**
     * Destroy the tracker and remove event listeners
     */
    destroy() {
        if (this._handleMouseMove) {
            window.removeEventListener('mousemove', this._handleMouseMove);
        }
        if (this._handleTouchMove) {
            window.removeEventListener('touchmove', this._handleTouchMove);
        }
        this._handleMouseMove = null;
        this._handleTouchMove = null;
    }
}

// Export
if (typeof window !== 'undefined') {
    window.FocusTracker = FocusTracker;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { FocusTracker };
}
