/**
 * TectonicSaccadicManager - Coordinates all saccadic optimization subsystems
 *
 * Phase 47: Tectonic Saccadic Optimization - Task 6
 *
 * Integrates:
 * 1. SaccadicController - Eye movement simulation
 * 2. LODTransitionManager - Smooth LOD transitions
 * 3. PredictivePrefetcher - Tile pre-fetching
 * 4. MotionQualityScaler - Quality scaling
 * 5. FocusTracker - Gaze point tracking
 * 6. VergenceController - Binocular vision simulation (Phase 47 Advanced)
 *
 * @class TectonicSaccadicManager
 */
class TectonicSaccadicManager {
    constructor(config = {}) {
        this.config = {
            viewport: null,
            gridSize: 100,
            enableSaccadic: true,
            enableSmoothLOD: true,
            enablePrefetch: true,
            enableQualityScaling: true,
            enableFocusTracking: true,
            enableVergence: false,  // Phase 47 Advanced: Vergence eye movements
            ...config
        };

        // Initialize subsystems
        this._initializeSubsystems();

        // State
        this.currentLOD = null;
        this.isInitialized = false;

        // Event listeners
        this.eventListeners = new Map();

        // Bind to viewport events
        if (this.config.viewport) {
            this._bindViewportEvents();
        }

        console.log('TectonicSaccadicManager initialized');
    }

    /**
     * Initialize all subsystems
     */
    _initializeSubsystems() {
        // Saccadic controller
        if (this.config.enableSaccadic) {
            this.saccadicController = new SaccadicController({
                saccadeThreshold: 100
            });
            this._bindSaccadicEvents();
        }

        // LOD transition manager
        if (this.config.enableSmoothLOD) {
            this.lodTransitionManager = new LODTransitionManager({
                defaultDuration: 300,
                defaultEasing: 'ease-out'
            });
        }

        // Predictive prefetcher
        if (this.config.enablePrefetch) {
            this.prefetcher = new PredictivePrefetcher({
                tileSize: this.config.gridSize,
                lookaheadTime: 500
            });
            this._bindPrefetchEvents();
        }

        // Motion quality scaler
        if (this.config.enableQualityScaling) {
            this.qualityScaler = new MotionQualityScaler({
                minQuality: 0.2,
                maxQuality: 1.0
            });
        }

        // Focus tracker
        if (this.config.enableFocusTracking) {
            // Don't bind events in tests (no window)
            const focusConfig = {
                width: typeof window !== 'undefined' ? window.innerWidth : 1000,
                height: typeof window !== 'undefined' ? window.innerHeight : 800
            };
            this.focusTracker = new FocusTracker(focusConfig);
            if (this.config.viewport) {
                this.focusTracker.setViewport(this.config.viewport);
            }
        }

        // Vergence controller (Phase 47 Advanced)
        if (this.config.enableVergence && typeof VergenceController !== 'undefined') {
            this.vergenceController = new VergenceController({
                ipd: 30,
                maxDepth: this.config.gridSize * 10
            });

            // Integrate with focus tracker
            if (this.focusTracker) {
                this.vergenceController.setFocusTracker(this.focusTracker);
            }

            // Integrate with viewport
            if (this.config.viewport) {
                this.vergenceController.setViewport(this.config.viewport);
            }

            // Forward vergence events
            this.vergenceController.on('depth-change', (data) => {
                this.emit('vergence-depth-change', data);
            });

            this.vergenceController.on('convergence-complete', (data) => {
                this.emit('vergence-convergence-complete', data);
            });

            console.log('👀 VergenceController integrated');
        }
    }

    /**
     * Bind saccadic controller events
     */
    _bindSaccadicEvents() {
        if (!this.saccadicController) return;

        this.saccadicController.onSaccadeStart = (from, to) => {
            this.emit('saccade-start', { from, to });
        };

        this.saccadicController.onSaccadeEnd = (position) => {
            this.emit('saccade-end', { position });
        };

        this.saccadicController.onSettlingComplete = (position) => {
            this.emit('settling-complete', { position });
        };
    }

    /**
     * Bind prefetcher events
     */
    _bindPrefetchEvents() {
        if (!this.prefetcher) return;

        this.prefetcher.on('prefetch', (data) => {
            // Prioritize tiles by focus point
            let tiles = data.tiles;
            if (this.focusTracker) {
                const focus = this.focusTracker.getWorldFocus();
                tiles = this.prefetcher.getPrioritizedTiles(tiles, focus);
            }

            this.emit('prefetch', { tiles, timestamp: data.timestamp });
        });
    }

    /**
     * Bind viewport events
     */
    _bindViewportEvents() {
        if (!this.config.viewport) return;

        // Check if viewport has event system
        if (typeof this.config.viewport.on === 'function') {
            this.config.viewport.on('move', (data) => {
                this.saccadicController?.updatePosition(data.x, data.y);
            });

            this.config.viewport.on('zoom', (data) => {
                this._handleZoomChange(data.zoom);
            });
        }
    }

    /**
     * Handle zoom change (triggers LOD transition)
     */
    _handleZoomChange(newZoom) {
        if (!this.lodTransitionManager) return;

        // Determine new LOD level
        const newLevel = this._getLODForZoom(newZoom);

        if (newLevel !== this.currentLOD) {
            const prevLevel = this.currentLOD;
            this.currentLOD = newLevel;

            this.lodTransitionManager.transitionTo(newLevel);
            this.emit('lod-change', { from: prevLevel, to: newLevel });
        }
    }

    /**
     * Get LOD level for zoom
     */
    _getLODForZoom(zoom) {
        if (zoom >= 2.0) return { name: 'full', quality: 1.0, alpha: 0.8 };
        if (zoom >= 1.0) return { name: 'medium', quality: 0.7, alpha: 0.6 };
        if (zoom >= 0.5) return { name: 'low', quality: 0.4, alpha: 0.4 };
        if (zoom >= 0.2) return { name: 'minimal', quality: 0.2, alpha: 0.3 };
        return { name: 'semantic', quality: 0.1, alpha: 0.2 };
    }

    /**
     * Set target position (triggers saccade)
     */
    setTarget(x, y) {
        if (this.saccadicController) {
            this.saccadicController.setTarget(x, y);
        }
    }

    /**
     * Update all subsystems (call every frame)
     */
    update(deltaTime) {
        // Update saccadic controller
        if (this.saccadicController) {
            this.saccadicController.update(deltaTime);

            // Update quality scaler phase
            const state = this.saccadicController.getState();
            if (this.qualityScaler) {
                this.qualityScaler.setPhase(state.phase, state.settlingFactor);
            }
        }

        // Update LOD transition
        if (this.lodTransitionManager) {
            this.lodTransitionManager.update(deltaTime);
        }

        // Update focus tracker
        if (this.focusTracker) {
            this.focusTracker.update(deltaTime);
        }

        // Update vergence controller (Phase 47 Advanced)
        if (this.vergenceController) {
            this.vergenceController.update(deltaTime);
        }

        // Trigger prefetch if moving
        if (this.prefetcher && this.saccadicController) {
            const velocity = this.saccadicController.getVelocity();
            const position = this.saccadicController.position;

            if (velocity.magnitude > 50) {
                const tiles = this.prefetcher.predictTiles(position, velocity);
                const focus = this.focusTracker?.getWorldFocus() || position;
                this.prefetcher.requestPrefetch(tiles, focus);
            }
        }
    }

    /**
     * Get unified render options
     */
    getRenderOptions(tilePosition = null) {
        let options = {
            quality: 1.0,
            alpha: 0.8,
            blur: 0,
            blendFactor: 1.0
        };

        // Apply LOD transition options
        if (this.lodTransitionManager && this.lodTransitionManager.isTransitioning()) {
            const lodOptions = this.lodTransitionManager.getRenderOptions();
            options.quality *= lodOptions.quality;
            options.alpha = Math.max(options.alpha, lodOptions.alpha);
            options.blendFactor = lodOptions.blendFactor;
        } else if (this.currentLOD) {
            options.quality = this.currentLOD.quality;
            options.alpha = this.currentLOD.alpha;
        }

        // Apply motion-based quality scaling
        if (this.qualityScaler && this.saccadicController) {
            const velocity = this.saccadicController.getVelocity();
            const motionOptions = this.qualityScaler.getRenderOptions(
                velocity,
                this.saccadicController.phase
            );
            options.quality *= motionOptions.quality;
            options.blur = Math.max(options.blur, motionOptions.blur);
        }

        // Apply focus-based priority if tile position provided
        if (tilePosition && this.focusTracker) {
            const focus = this.focusTracker.getWorldFocus();
            const dx = tilePosition.x - focus.x;
            const dy = tilePosition.y - focus.y;
            const dist = Math.sqrt(dx * dx + dy * dy);
            const attentionRadius = 300; // pixels

            if (dist < attentionRadius) {
                // Boost quality for tiles near focus
                options.quality *= 1 + (1 - dist / attentionRadius) * 0.2;
            }
        }

        // Apply vergence-based parallax offset (Phase 47 Advanced)
        if (tilePosition && this.vergenceController) {
            const parallaxShift = this.vergenceController.getParallaxShift('tiles');
            options.parallaxOffset = {
                x: parallaxShift.x,
                y: parallaxShift.y
            };

            // Add stereo options if enabled
            const stereoMatrices = this.vergenceController.getStereoMatrices();
            if (stereoMatrices) {
                options.stereo = stereoMatrices;
            }
        }

        // Clamp values
        options.quality = Math.max(0, Math.min(1, options.quality));
        options.alpha = Math.max(0, Math.min(1, options.alpha));

        return options;
    }

    /**
     * Get prioritized tiles for rendering
     */
    prioritizeTiles(tiles) {
        if (!this.focusTracker) {
            return tiles;
        }

        return this.focusTracker.sortByAttention(tiles);
    }

    /**
     * Mark tile as loaded
     */
    markTileLoaded(tileX, tileY, data) {
        this.prefetcher?.markTileLoaded(tileX, tileY, data);
    }

    /**
     * Get cached tile
     */
    getCachedTile(tileX, tileY) {
        return this.prefetcher?.getCachedTile(tileX, tileY);
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

    /**
     * Get statistics
     */
    getStats() {
        return {
            saccadic: this.saccadicController?.getState(),
            lod: {
                transitioning: this.lodTransitionManager?.isTransitioning(),
                currentLevel: this.currentLOD?.name
            },
            prefetch: this.prefetcher?.getStats(),
            focus: this.focusTracker?.getStats(),
            vergence: this.vergenceController?.getState()
        };
    }

    /**
     * Destroy the manager
     */
    destroy() {
        this.focusTracker?.destroy();
        this.vergenceController?.destroy();
        this.eventListeners.clear();
        console.log('TectonicSaccadicManager destroyed');
    }
}

// Export
if (typeof window !== 'undefined') {
    window.TectonicSaccadicManager = TectonicSaccadicManager;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { TectonicSaccadicManager };
}
