/**
 * VergenceController - Binocular vision simulation for depth perception
 *
 * Phase 47 Advanced Features - Task 2.1: Vergence Eye Movements
 *
 * Simulates binocular vision with:
 * - Left/right eye separation (IPD - interpupillary distance)
 * - Convergence/divergence based on focal depth
 * - Parallax effects for tile layers
 * - Stereoscopic rendering mode
 * - Event system for integration with TectonicSaccadicManager
 *
 * @class VergenceController
 */

class VergenceController {
    constructor(config = {}) {
        this.config = {
            // Eye separation (inter-pupillary distance in pixels)
            ipd: 30,                     // pixels between eyes at screen plane

            // Depth range
            minDepth: 0,                 // closest visible depth
            maxDepth: 1000,              // farthest visible depth (pixels)
            focalDepth: 500,             // initial focal depth

            // Convergence settings
            convergenceRate: 0.1,        // how fast eyes converge
            divergenceThreshold: 0.95,   // when to start diverging

            // Parallax settings
            parallaxIntensity: 0.5,      // strength of parallax effect

            // Layer depth mapping (relative depth values)
            layerDepths: {
                background: -100,        // Background layer depth
                tiles: 0,                // Default tile layer depth
                foreground: 100,         // Foreground layer depth
                ui: 200                  // UI layer depth (closest)
            },

            // Smoothing
            smoothingFactor: 0.08,       // Eye position smoothing

            // Stereoscopic mode
            stereoMode: false,           // enable side-by-side rendering
            stereoSeparation: 1.0,       // stereo separation multiplier

            ...config
        };

        // Current focal depth (where eyes are converged)
        this.focalDepth = this.config.focalDepth;
        this.targetFocalDepth = this.focalDepth;

        // Eye positions (absolute screen coordinates)
        const centerX = typeof window !== 'undefined' ? window.innerWidth / 2 : 500;
        const centerY = typeof window !== 'undefined' ? window.innerHeight / 2 : 400;
        this.screenCenter = { x: centerX, y: centerY };

        this.leftEye = { x: centerX - this.config.ipd / 2, y: centerY };
        this.rightEye = { x: centerX + this.config.ipd / 2, y: centerY };
        this.targetLeftEye = { ...this.leftEye };
        this.targetRightEye = { ...this.rightEye };

        // Convergence state
        this.convergenceAngle = 0;
        this.isConverging = false;
        this.isDiverging = false;

        // Viewport reference
        this.viewport = null;

        // Focus tracker reference (for focal depth estimation)
        this.focusTracker = null;

        // Event listeners
        this.eventListeners = new Map();

        console.log('👀 VergenceController initialized', this.config);
    }

    /**
     * Calculate convergence angle based on current eye positions
     * @private
     */
    _updateConvergenceAngle() {
        const dx = this.rightEye.x - this.leftEye.x;
        const separation = Math.abs(dx);

        // Convergence angle depends on focal depth
        // Near focus = high convergence (large angle)
        // Far focus = low convergence (small angle, parallel)
        const depthRatio = this.focalDepth / this.config.maxDepth;
        this.convergenceAngle = (1 - depthRatio) * Math.PI / 4; // 0 to 45 degrees
    }

    /**
     * Update eye positions based on focal depth
     * @private
     */
    _updateConvergenceForDepth() {
        const centerX = this.screenCenter.x;
        const centerY = this.screenCenter.y;

        // Calculate convergence offset based on depth
        const depthRatio = this.focalDepth / this.config.maxDepth;
        const convergenceFactor = 1 - depthRatio; // 1 at near, 0 at far

        // Convergence moves eyes inward (toward each other)
        const convergenceOffset = this.config.ipd * convergenceFactor * 0.5;

        this.targetLeftEye = {
            x: centerX - this.config.ipd / 2 + convergenceOffset,
            y: centerY
        };
        this.targetRightEye = {
            x: centerX + this.config.ipd / 2 - convergenceOffset,
            y: centerY
        };
    }

    /**
     * Set focus tracker for depth estimation
     * @param {FocusTracker} tracker - Focus tracker instance
     */
    setFocusTracker(tracker) {
        this.focusTracker = tracker;

        // Listen to focus changes for adaptive depth
        if (tracker && typeof tracker.on === 'function') {
            tracker.on('focus-change', (focus) => {
                // Adjust focal depth based on focus point
                const distanceFromCenter = Math.sqrt(
                    Math.pow(focus.x - this.screenCenter.x, 2) +
                    Math.pow(focus.y - this.screenCenter.y, 2)
                );

                // Map distance to depth (closer to center = closer focus)
                const maxDistance = Math.min(this.screenCenter.x, this.screenCenter.y);
                const depthRatio = Math.min(1, distanceFromCenter / maxDistance);
                const targetDepth = this.config.minDepth +
                    depthRatio * (this.config.maxDepth - this.config.minDepth);

                this.setFocalDepth(targetDepth);
            });
        }
    }

    /**
     * Set viewport reference
     * @param {Object} viewport - Viewport manager instance
     */
    setViewport(viewport) {
        this.viewport = viewport;

        // Update screen center from viewport
        if (viewport && typeof viewport.getScreenSize === 'function') {
            const size = viewport.getScreenSize();
            this.screenCenter = {
                x: size.width / 2,
                y: size.height / 2
            };
        }
    }

    /**
     * Set the focal depth (convergence point)
     * @param {number} depth - Depth in pixels (0 = closest, maxDepth = farthest)
     */
    setFocalDepth(depth) {
        const clampedDepth = Math.max(
            this.config.minDepth,
            Math.min(this.config.maxDepth, depth)
        );

        // Detect convergence vs divergence
        this.isConverging = clampedDepth < this.focalDepth;
        this.isDiverging = clampedDepth > this.focalDepth;

        this.targetFocalDepth = clampedDepth;
        this._updateConvergenceForDepth();
        this._updateConvergenceAngle();

        this.emit('depth-change', {
            depth: this.targetFocalDepth,
            converging: this.isConverging,
            diverging: this.isDiverging,
            angle: this.convergenceAngle
        });
    }

    /**
     * Set convergence point directly in screen coordinates
     * @param {number} x - Screen X coordinate
     * @param {number} y - Screen Y coordinate
     * @param {number} depth - Optional depth override
     */
    setConvergencePoint(x, y, depth = null) {
        if (depth !== null) {
            this.setFocalDepth(depth);
        }

        // Calculate eye positions for convergence at point
        const dx = x - this.screenCenter.x;
        const dy = y - this.screenCenter.y;

        // Eyes rotate to converge on point
        const convergenceStrength = 1 - (this.focalDepth / this.config.maxDepth);

        this.targetLeftEye = {
            x: this.screenCenter.x - this.config.ipd / 2 + dx * convergenceStrength * 0.3,
            y: this.screenCenter.y + dy * convergenceStrength * 0.3
        };
        this.targetRightEye = {
            x: this.screenCenter.x + this.config.ipd / 2 + dx * convergenceStrength * 0.3,
            y: this.screenCenter.y + dy * convergenceStrength * 0.3
        };
    }

    /**
     * Get current focal depth
     */
    getFocalDepth() {
        return this.focalDepth;
    }

    /**
     * Estimate depth from screen position and zoom level
     */
    estimateDepth(screenX, screenY, zoom = 1.0) {
        if (!this.viewport) {
            return this.config.maxDepth / 2;
        }

        // Convert to world coordinates
        const worldPos = this.viewport.screenToWorld(screenX, screenY);
        
        // Depth based on distance from viewport center
        // (objects further from center are "deeper" in the scene)
        const center = this.viewport.getCenter();
        const dx = worldPos.x - center.x;
        const dy = worldPos.y - center.y;
        const distanceFromCenter = Math.sqrt(dx * dx + dy * dy);

        // Map distance to depth range
        const normalizedDistance = Math.min(distanceFromCenter / 1000, 1);
        const depth = this.config.minDepth + 
                     normalizedDistance * (this.config.maxDepth - this.config.minDepth);

        // Apply zoom inverse (higher zoom = closer depth)
        return depth / zoom;
    }

    /**
     * Auto-adjust focal depth based on focus tracker
     */
    autoFocus() {
        if (!this.focusTracker) return;

        const focus = this.focusTracker.getCurrentFocus();
        const zoom = this.viewport?.getZoom() || 1.0;
        
        const estimatedDepth = this.estimateDepth(focus.x, focus.y, zoom);
        this.setFocalDepth(estimatedDepth);
    }

    /**
     * Get left and right eye positions
     * @returns {Object} { left: {x, y}, right: {x, y}, center: {x, y} }
     */
    getEyePositions() {
        return {
            left: { ...this.leftEye },
            right: { ...this.rightEye },
            center: {
                x: (this.leftEye.x + this.rightEye.x) / 2,
                y: (this.leftEye.y + this.rightEye.y) / 2
            }
        };
    }

    /**
     * Calculate parallax shift for a layer based on depth
     * @param {string|number} layerDepth - Layer identifier or depth value
     * @param {Object} focusPoint - Optional focus point for relative parallax
     * @returns {Object} { x, y, depth, relativeDepth } Parallax offset in pixels
     */
    getParallaxShift(layerDepth, focusPoint = null) {
        // Resolve depth value
        let depth;
        if (typeof layerDepth === 'string') {
            depth = this.config.layerDepths[layerDepth] || 0;
        } else {
            depth = layerDepth;
        }

        // Use focus tracker position if available
        let focus;
        if (focusPoint) {
            focus = focusPoint;
        } else if (this.focusTracker) {
            focus = this.focusTracker.getCurrentFocus();
        } else {
            focus = { ...this.screenCenter };
        }

        // Calculate parallax offset
        // Objects closer than focus move opposite to eye movement
        // Objects farther than focus move with eye movement
        const depthRatio = depth / this.config.maxDepth;
        const focusDepthRatio = this.focalDepth / this.config.maxDepth;

        // Relative depth from focal plane
        const relativeDepth = depthRatio - focusDepthRatio;

        // Parallax shift based on eye position offset from center
        const eyeOffsetX = (this.leftEye.x + this.rightEye.x) / 2 - this.screenCenter.x;
        const eyeOffsetY = (this.leftEye.y + this.rightEye.y) / 2 - this.screenCenter.y;

        // Parallax intensity varies by depth
        const parallaxStrength = relativeDepth * this.config.parallaxIntensity;

        return {
            x: eyeOffsetX * parallaxStrength,
            y: eyeOffsetY * parallaxStrength,
            depth: depth,
            relativeDepth: relativeDepth
        };
    }

    /**
     * Set depth for a specific layer
     * @param {string} layerName - Layer identifier
     * @param {number} depth - Depth value
     */
    setLayerDepth(layerName, depth) {
        this.config.layerDepths[layerName] = depth;
    }

    /**
     * Get depth for a specific layer
     * @param {string|number} layerId - Layer identifier
     * @param {number} defaultDepth - Default depth if not set
     */
    getLayerDepth(layerId, defaultDepth = 1000) {
        if (typeof layerId === 'string') {
            return this.config.layerDepths[layerId] || defaultDepth;
        }
        return layerId || defaultDepth;
    }

    /**
     * Get stereo render matrices for left and right eyes
     * @returns {Object|null} { left, right } View/projection matrices or null if stereo disabled
     */
    getStereoMatrices() {
        if (!this.config.stereoMode) {
            return null;
        }

        const separation = this.config.ipd * this.config.stereoSeparation;
        const convergenceDistance = this.focalDepth;

        // Left eye: shifted left, rotated right
        const leftMatrix = {
            offsetX: -separation / 2,
            rotation: Math.atan(separation / (2 * convergenceDistance)),
            convergence: convergenceDistance
        };

        // Right eye: shifted right, rotated left
        const rightMatrix = {
            offsetX: separation / 2,
            rotation: -Math.atan(separation / (2 * convergenceDistance)),
            convergence: convergenceDistance
        };

        return { left: leftMatrix, right: rightMatrix };
    }

    /**
     * Enable or disable stereoscopic rendering mode
     * @param {boolean} enable - Enable stereo mode
     */
    enableStereoMode(enable) {
        this.config.stereoMode = enable;
        this.emit('stereo-mode-change', { enabled: enable });
    }

    /**
     * Toggle stereoscopic mode
     * @returns {boolean} New stereo mode state
     */
    toggleStereoMode() {
        this.enableStereoMode(!this.config.stereoMode);
        return this.config.stereoMode;
    }

    /**
     * Update vergence controller
     * @param {number} deltaTime - Time since last update in ms
     */
    update(deltaTime) {
        // Smoothly adjust focal depth to target
        const depthDiff = this.targetFocalDepth - this.focalDepth;
        if (Math.abs(depthDiff) > 0.1) {
            this.focalDepth += depthDiff * this.config.convergenceRate;
        }

        // Smooth eye position changes
        const smoothing = Math.min(1, this.config.smoothingFactor * deltaTime / 16);

        this.leftEye.x += (this.targetLeftEye.x - this.leftEye.x) * smoothing;
        this.leftEye.y += (this.targetLeftEye.y - this.leftEye.y) * smoothing;
        this.rightEye.x += (this.targetRightEye.x - this.rightEye.x) * smoothing;
        this.rightEye.y += (this.targetRightEye.y - this.rightEye.y) * smoothing;

        // Update convergence angle
        this._updateConvergenceAngle();

        // Detect convergence complete
        const leftDiff = Math.abs(this.targetLeftEye.x - this.leftEye.x);
        const rightDiff = Math.abs(this.targetRightEye.x - this.rightEye.x);
        const threshold = 0.5;

        if (leftDiff < threshold && rightDiff < threshold) {
            if (this.isConverging || this.isDiverging) {
                this.isConverging = false;
                this.isDiverging = false;
                this.emit('convergence-complete', {
                    depth: this.focalDepth,
                    angle: this.convergenceAngle
                });
            }
        }
    }

    /**
     * Get current vergence state
     * @returns {Object} Current state information
     */
    getState() {
        return {
            leftEye: { ...this.leftEye },
            rightEye: { ...this.rightEye },
            focalDepth: this.focalDepth,
            targetFocalDepth: this.targetFocalDepth,
            convergenceAngle: this.convergenceAngle,
            isConverging: this.isConverging,
            isDiverging: this.isDiverging,
            stereoMode: this.config.stereoMode,
            ipd: this.config.ipd
        };
    }

    /**
     * Event handling
     * @param {string} event - Event name
     * @param {Function} callback - Callback function
     */
    on(event, callback) {
        if (!this.eventListeners.has(event)) {
            this.eventListeners.set(event, new Set());
        }
        this.eventListeners.get(event).add(callback);
    }

    /**
     * Remove event listener
     * @param {string} event - Event name
     * @param {Function} callback - Callback function
     */
    off(event, callback) {
        if (this.eventListeners.has(event)) {
            this.eventListeners.get(event).delete(callback);
        }
    }

    /**
     * Emit event
     * @param {string} event - Event name
     * @param {Object} data - Event data
     */
    emit(event, data) {
        if (this.eventListeners.has(event)) {
            this.eventListeners.get(event).forEach(cb => cb(data));
        }
    }

    /**
     * Reset to initial state
     */
    reset() {
        this.focalDepth = this.config.focalDepth;
        this.targetFocalDepth = this.config.focalDepth;
        this.isConverging = false;
        this.isDiverging = false;
        this._calculateInitialPositions();
        this.emit('reset', {});
    }

    /**
     * Calculate initial positions
     * @private
     */
    _calculateInitialPositions() {
        const centerX = this.screenCenter.x;
        const centerY = this.screenCenter.y;

        // Initial positions: eyes at center with IPD separation
        this.targetLeftEye = {
            x: centerX - this.config.ipd / 2,
            y: centerY
        };
        this.targetRightEye = {
            x: centerX + this.config.ipd / 2,
            y: centerY
        };

        this.leftEye = { ...this.targetLeftEye };
        this.rightEye = { ...this.targetRightEye };

        this._updateConvergenceAngle();
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            ...this.getState(),
            targetLeftEye: { ...this.targetLeftEye },
            targetRightEye: { ...this.targetRightEye },
            screenCenter: { ...this.screenCenter },
            layerDepths: { ...this.config.layerDepths }
        };
    }

    /**
     * Destroy the controller
     */
    destroy() {
        this.eventListeners.clear();
        console.log('👀 VergenceController destroyed');
    }
}

/**
 * VergenceRenderer - Renders stereoscopic view for tile layers
 *
 * @class VergenceRenderer
 */
class VergenceRenderer {
    constructor(vergenceController, config = {}) {
        this.vergence = vergenceController;
        this.config = {
            enableAnaglyph: false,       // Red-cyan anaglyph mode
            anaglyphLeftColor: 0xFF0000, // Red channel
            anaglyphRightColor: 0x00FFFF,// Cyan channel
            enableSplit: false,          // Side-by-side split
            splitDirection: 'horizontal',// horizontal or vertical
            ...config
        };

        this.anaglyphFilter = null;

        console.log('🖼️  VergenceRenderer initialized');
    }

    /**
     * Apply parallax to a tile sprite
     * @param {Object} sprite - Tile sprite (or any object with x, y properties)
     * @param {string|number} layerDepth - Layer depth
     * @returns {Object} Parallax offset
     */
    applyParallax(sprite, layerDepth) {
        const shift = this.vergence.getParallaxShift(layerDepth);

        if (sprite) {
            sprite.x += shift.x;
            sprite.y += shift.y;
        }

        return shift;
    }

    /**
     * Get stereo render options for a tile
     * @param {Object} tilePosition - Tile world position
     * @returns {Object|null} Left and right eye render options
     */
    getStereoRenderOptions(tilePosition) {
        const matrices = this.vergence.getStereoMatrices();
        if (!matrices) {
            return null;
        }

        // Calculate parallax for this specific tile
        const shift = this.vergence.getParallaxShift(
            this.vergence.config.layerDepths.tiles
        );

        return {
            left: {
                offsetX: matrices.left.offsetX + shift.x,
                rotation: matrices.left.rotation
            },
            right: {
                offsetX: matrices.right.offsetX + shift.x,
                rotation: matrices.right.rotation
            }
        };
    }

    /**
     * Destroy the renderer
     */
    destroy() {
        this.anaglyphFilter = null;
        console.log('🖼️  VergenceRenderer destroyed');
    }
}

// Export
if (typeof window !== 'undefined') {
    window.VergenceController = VergenceController;
    window.VergenceRenderer = VergenceRenderer;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { VergenceController, VergenceRenderer };
}
