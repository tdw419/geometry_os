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
     * Calculate parallax shift for a layer
     * @param {number} layerDepth - Depth of the layer (0 = closest, higher = farther)
     * @param {number} screenX - Screen X position
     * @returns {Object} { leftShift, rightShift }
     */
    getParallaxShift(layerDepth, screenX = 0) {
        const centerOffset = screenX - (this.config.width || window.innerWidth) / 2;
        
        // Calculate disparity based on layer depth relative to focal depth
        const depthDifference = layerDepth - this.focalDepth;
        const normalizedDepthDiff = depthDifference / this.config.maxDepth;
        
        // Parallax shift amount
        const shift = normalizedDepthDiff * this.config.eyeSeparation * this.config.parallaxIntensity;
        
        // Left and right eye shifts (opposite directions)
        return {
            leftShift: shift + centerOffset * 0.01,  // Subtle horizontal shift
            rightShift: -shift + centerOffset * 0.01,
            disparity: shift * 2  // Total disparity
        };
    }

    /**
     * Set depth for a specific layer
     * @param {string|number} layerId - Layer identifier
     * @param {number} depth - Depth value
     */
    setLayerDepth(layerId, depth) {
        this.layerDepths.set(layerId, depth);
    }

    /**
     * Get depth for a specific layer
     * @param {string|number} layerId - Layer identifier
     * @param {number} defaultDepth - Default depth if not set
     */
    getLayerDepth(layerId, defaultDepth = 1000) {
        return this.layerDepths.get(layerId) || defaultDepth;
    }

    /**
     * Get rendered position for an object from specific eye perspective
     * @param {Object} position - World position {x, y}
     * @param {number} layerDepth - Layer depth
     * @param {string} eye - 'left' or 'right'
     */
    getEyePerspectivePosition(position, layerDepth, eye) {
        const shift = this.getParallaxShift(layerDepth, position.x);
        const eyeShift = eye === 'left' ? shift.leftShift : shift.rightShift;
        
        return {
            x: position.x + eyeShift,
            y: position.y  // Parallax is typically horizontal only
        };
    }

    /**
     * Enable stereoscopic rendering mode
     * @param {boolean} enable - Enable or disable
     * @param {string} mode - 'sidebyside' or 'anaglyph'
     */
    enableStereoMode(enable, mode = 'sidebyside') {
        this.config.stereoscopicMode = enable;
        this.config.anaglyphMode = mode === 'anaglyph';
    }

    /**
     * Update vergence controller
     * @param {number} deltaTime - Time since last update in ms
     */
    update(deltaTime) {
        // Smoothly adjust focal depth to target
        const depthDiff = this.targetFocalDepth - this.focalDepth;
        this.focalDepth += depthDiff * this.config.convergenceSpeed;

        // Update eye positions based on current focal depth
        const positions = this.getEyePositions();
        this.leftEye = positions.left;
        this.rightEye = positions.right;

        // Auto-focus if focus tracker is available
        if (this.focusTracker) {
            // Only auto-focus periodically to avoid jitter
            if (Math.random() < 0.05) {  // 5% chance per frame
                this.autoFocus();
            }
        }
    }

    /**
     * Apply vergence to render options for a tile
     * @param {Object} tile - Tile object with position
     * @param {Object} baseOptions - Base render options
     */
    getVergenceRenderOptions(tile, baseOptions = {}) {
        const layerDepth = this.getLayerDepth(tile.layerId || 0, tile.depth || 1000);
        const shift = this.getParallaxShift(layerDepth, tile.x);

        return {
            ...baseOptions,
            // Apply slight offset based on eye (for stereo rendering)
            leftOffset: shift.leftShift,
            rightOffset: shift.rightShift,
            disparity: shift.disparity,
            depth: layerDepth,
            // Depth-based quality adjustment
            quality: baseOptions.quality || 1.0
        };
    }

    /**
     * Get stereoscopic render parameters
     * @returns {Object} { mode, eyeSeparation, leftOffset, rightOffset }
     */
    getStereoParams() {
        return {
            mode: this.config.anaglyphMode ? 'anaglyph' : 'sidebyside',
            enabled: this.config.stereoscopicMode,
            eyeSeparation: this.config.eyeSeparation,
            leftOffset: this.leftEye.x,
            rightOffset: this.rightEye.x,
            focalDepth: this.focalDepth
        };
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            focalDepth: this.focalDepth,
            targetFocalDepth: this.targetFocalDepth,
            leftEye: { ...this.leftEye },
            rightEye: { ...this.rightEye },
            convergence: this.getEyePositions().convergence,
            stereoscopicMode: this.config.stereoscopicMode,
            anaglyphMode: this.config.anaglyphMode,
            layerCount: this.layerDepths.size
        };
    }

    /**
     * Destroy the controller
     */
    destroy() {
        this.layerDepths.clear();
    }
}

// Export
if (typeof window !== 'undefined') {
    window.VergenceController = VergenceController;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { VergenceController };
}
