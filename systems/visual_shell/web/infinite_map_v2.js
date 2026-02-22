/**
 * Geometry OS: Infinite Map V2 - Viewport-Driven Architecture
 * 
 * A production-grade infinite map implementation with:
 * - O(1) spatial queries via spatial hashing
 * - Viewport-driven chunk loading
 * - Sprite pooling for efficient rendering
 * - Level of detail (LOD) system
 * - WebSocket camera sync with compositor
 * 
 * Performance targets:
 * - 60 FPS at 1M tiles
 * - <10ms latency for chunk loading
 * - ~50MB memory footprint
 * 
 * @module infinite_map_v2
 */

/**
 * InfiniteMapV2 - Main class for the new infinite map architecture
 * 
 * @class InfiniteMapV2
 */
class InfiniteMapV2 {
    /**
     * @param {PIXI.Container} worldContainer - Parent container for map elements
     * @param {Object} config - Configuration options
     */
    constructor(worldContainer, config = {}) {
        this.world = worldContainer;
        this.config = {
            gridSize: 100,
            chunkSize: 16,
            maxCachedChunks: 64,
            preloadRadius: 1,
            initialSpritePoolSize: 500,
            maxSpritePoolSize: 2000,
            enableLOD: true,
            enableCameraSync: true,
            websocketUrl: 'ws://127.0.0.1:8765',
            apiEndpoint: '/api/chunk',
            ...config
        };

        // Core components
        this.spatialIndex = null;
        this.chunkManager = null;
        this.spritePool = null;
        this.tileSpriteManager = null;
        this.viewportManager = null;
        this.cameraController = null;
        this.lodSystem = null;
        this.lodRenderer = null;
        this.thinkingField = null; // Phase 25: Thinking Field

        // State
        this.active = false;
        this.lastUpdateTime = 0;
        this.updateInterval = 16; // ~60 FPS

        // Statistics
        this.stats = {
            frames: 0,
            fps: 0,
            lastFpsUpdate: 0,
            chunkLoadTime: 0,
            renderTime: 0
        };

        // Security overlays (compatibility with V1)
        this.securityOverlays = new Map();
        this.activationFlashes = new Map();

        console.log('🗺️  InfiniteMapV2 initialized', this.config);
    }

    /**
     * Initialize the infinite map
     */
    async initialize() {
        console.log('🗺️  Initializing InfiniteMapV2...');

        // 1. Create spatial index
        this.spatialIndex = new SpatialIndex({
            type: 'hex',
            cellSize: this.config.gridSize
        });

        // 2. Create chunk manager
        this.chunkManager = new ChunkManager({
            chunkSize: this.config.chunkSize,
            maxCachedChunks: this.config.maxCachedChunks,
            preloadRadius: this.config.preloadRadius,
            apiEndpoint: this.config.apiEndpoint
        });

        // 3. Create sprite pool
        this.spritePool = new SpritePool({
            container: this.world,
            initialSize: this.config.initialSpritePoolSize,
            maxSize: this.config.maxSpritePoolSize
        });
        this.spritePool.initialize();

        // 4. Create tile sprite manager
        this.tileSpriteManager = new TileSpriteManager({
            container: this.world,
            spritePool: this.spritePool,
            gridSize: this.config.gridSize
        });
        this.tileSpriteManager.initialize();

        // 5. Create viewport manager
        this.viewportManager = new ViewportManager({
            target: this.world,
            initialX: 0,
            initialY: 0,
            initialZoom: 1.0,
            enableSmoothing: true,
            websocketUrl: this.config.enableCameraSync ? this.config.websocketUrl : null
        });

        // 6. Create camera controller
        this.cameraController = new CameraController(this.viewportManager, {
            enableMouse: true,
            enableKeyboard: true,
            enableWheel: true,
            enableTouch: true
        });

        // 7. Create LOD system
        if (this.config.enableLOD) {
            this.lodSystem = new LODSystem({
                viewport: this.viewportManager,
                gridSize: this.config.gridSize
            });

            this.lodRenderer = new LODRenderer({
                container: this.world,
                lodSystem: this.lodSystem,
                spritePool: this.spritePool
            });
        }

        // 7b. Create ThinkingField (Phase 25)
        if (typeof ThinkingField !== 'undefined') {
            this.thinkingField = new ThinkingField(this.world, {
                tileSize: 32
            });
        } else {
            console.warn('⚠️ ThinkingField class not found. Thought visualization disabled.');
        }

        // 7c. Create Tectonic Saccadic Manager (Phase 47)
        if (typeof TectonicSaccadicManager !== 'undefined') {
            this.tectonicSaccadic = new TectonicSaccadicManager({
                viewport: this.viewportManager,
                gridSize: this.config.gridSize
            });

            // Set up prefetch listener
            this.tectonicSaccadic.on('prefetch', (data) => {
                this._handlePrefetchRequest(data);
            });

            console.log('👁️  Tectonic Saccadic Manager initialized');
        } else {
            console.warn('⚠️ TectonicSaccadicManager class not found. Saccadic optimization disabled.');
        }

        // 8. Set up event listeners
        this._setupEventListeners();

        // 9. Start the update loop
        this.active = true;
        this._startUpdateLoop();

        console.log('✅ InfiniteMapV2 initialized successfully');
        this._logStats();
    }

    /**
     * Set up event listeners
     */
    _setupEventListeners() {
        // Viewport move events
        this.viewportManager.on('move', () => {
            this._scheduleUpdate();
        });

        this.viewportManager.on('zoom', () => {
            this._scheduleUpdate();
        });

        // WebSocket events
        if (this.config.enableCameraSync) {
            this.viewportManager.on('connected', () => {
                console.log('✅ Connected to compositor');
            });

            this.viewportManager.on('disconnected', () => {
                console.log('⚠️  Disconnected from compositor');
            });

            this.viewportManager.on('camera_sync', (data) => {
                console.debug('📷 Camera sync:', data);
            });
        }
    }

    /**
     * Start the update loop
     */
    _startUpdateLoop() {
        const loop = async (timestamp) => {
            if (!this.active) return;

            const deltaTime = timestamp - this.lastUpdateTime;

            if (deltaTime >= this.updateInterval) {
                await this.update(deltaTime);
                this.lastUpdateTime = timestamp;
            }

            // Calculate FPS
            this.stats.frames++;
            if (timestamp - this.stats.lastFpsUpdate >= 1000) {
                this.stats.fps = this.stats.frames;
                this.stats.frames = 0;
                this.stats.lastFpsUpdate = timestamp;
            }

            requestAnimationFrame(loop);
        };

        requestAnimationFrame(loop);
    }

    /**
     * Main update method
     */
    async update(deltaTime) {
        const startTime = performance.now();

        // 1. Update viewport (camera smoothing)
        this.viewportManager.update(deltaTime);

        // 2. Update LOD system
        if (this.lodSystem) {
            this.lodSystem.update();
        }

        // 2b. Update Tectonic Saccadic Manager (Phase 47)
        if (this.tectonicSaccadic) {
            this.tectonicSaccadic.update(deltaTime);
        }

        // 3. Get visible bounds
        const viewport = this.viewportManager.getVisibleBoundsWithPadding(1.5);

        // 4. Load chunks for viewport
        const chunkLoadStart = performance.now();
        await this.chunkManager.loadChunksForViewport(viewport);
        this.stats.chunkLoadTime = performance.now() - chunkLoadStart;

        // 5. Get visible tiles
        const visibleTiles = this.chunkManager.getVisibleTiles(viewport);

        // 6. Render tiles with LOD
        const renderStart = performance.now();
        if (this.lodRenderer && this.lodSystem) {
            await this.lodRenderer.render(visibleTiles);
        } else {
            await this.tileSpriteManager.updateVisibleTiles(visibleTiles, viewport);
        }
        this.stats.renderTime = performance.now() - renderStart;

        // 7. Prune old chunks
        this.chunkManager.pruneChunks(viewport);

        // 8. Send camera update to compositor (disabled, Rust backend is source of truth)
        // if (this.config.enableCameraSync) {
        //     this.viewportManager.sendCameraUpdate();
        // }

        const totalTime = performance.now() - startTime;
        if (totalTime > 16) {
            console.warn(`⚠️  Frame time exceeded 16ms: ${totalTime.toFixed(2)}ms`);
        }
    }

    /**
     * Schedule an update
     */
    _scheduleUpdate() {
        // Updates are handled by the main loop
    }

    /**
     * Handle tile update from compositor
     */
    async handleTileUpdate(msg) {
        const { x, y, brick, timestamp } = msg;

        // Update chunk data
        this.chunkManager.updateTile(x, y, {
            x, y, brick, timestamp
        });

        // Render tile immediately if visible
        const viewport = this.viewportManager.getVisibleBounds();
        if (x >= viewport.minX && x <= viewport.maxX &&
            y >= viewport.minY && y <= viewport.maxY) {
            await this.tileSpriteManager.renderTile({
                x, y, brick, timestamp
            });
        }

        console.log(`📥 Tile update: ${brick} at (${x}, ${y})`);
    }

    /**
     * Handle prefetch request from Tectonic Saccadic Manager (Phase 47)
     */
    async _handlePrefetchRequest(data) {
        const { tiles, timestamp } = data;

        // Pre-load chunks for predicted tiles
        for (const tile of tiles) {
            const chunkX = Math.floor(tile.x / this.config.chunkSize);
            const chunkY = Math.floor(tile.y / this.config.chunkSize);

            // Request chunk load (will be cached)
            await this.chunkManager.loadChunk(chunkX, chunkY);

            // Mark tile as loaded in prefetcher
            if (this.tectonicSaccadic) {
                this.tectonicSaccadic.markTileLoaded(tile.tileX, tile.tileY, {
                    x: tile.x,
                    y: tile.y,
                    loaded: true
                });
            }
        }

        console.log(`🔮 Prefetched ${tiles.length} tiles`);
    }

    /**
     * Handle thought vector update (Phase 25)
     */
    handleThoughtUpdate(msg) {
        if (!this.thinkingField) return;

        const { task, payload } = msg;

        // Route thought commands
        if (task === 'thought_render') {
            this.thinkingField.renderThought(payload);
        } else if (task === 'thought_batch_render') {
            if (payload.results) {
                payload.results.forEach(result => {
                    // Since batch result structure might differ, assume we get processed thoughts or need access to raw data
                    // Note: VisualShellAgent _render_thought_batch returns status, but we need the pixel data.
                    // The agent should probably broadcast the RENDER events individually or we act on the props.
                    // For now, let's assume payload contains the rendered thought object directly or list of them
                });
                // Actually, let's just handle single renders for simplicity in the message loop
                // or expect 'payload' to be the full thought object for 'thought_render'
            }
        } else if (task === 'thought_clear') {
            this.thinkingField.clear();
        }
    }

    /**
     * Handle neural activation (compatibility with V1)
     */
    handleActivation(activation) {
        const { x, y, intensity, layer, token } = activation;
        const key = `${x},${y}`;

        // Remove existing flash if present
        const existing = this.activationFlashes.get(key);
        if (existing && existing.flash) {
            this.world.removeChild(existing.flash);
        }

        // Create activation flash
        const flash = new PIXI.Graphics();

        // Color based on layer
        const colors = [0x00FF00, 0x0000FF, 0xFF0000, 0xFFFF00, 0xFF00FF, 0x00FFFF];
        const color = colors[layer % colors.length] || 0xFFFFFF;

        // Size based on intensity
        const size = Math.max(5, Math.min(20, intensity * 15));

        flash.beginFill(color, intensity * 0.8);
        flash.drawCircle(0, 0, size);
        flash.endFill();

        // Position on grid
        flash.x = x * this.config.gridSize + this.config.gridSize / 2;
        flash.y = y * this.config.gridSize + this.config.gridSize / 2;

        // Add glow effect
        flash.filters = [new PIXI.filters.GlowFilter({
            distance: 10,
            outerStrength: 2,
            innerStrength: 1,
            color: color,
            quality: 0.5
        })];

        // Add to world
        flash.zIndex = 150;
        this.world.addChild(flash);

        // Store flash
        this.activationFlashes.set(key, {
            flash,
            timestamp: Date.now(),
            token
        });

        // Auto-remove after 2 seconds
        setTimeout(() => {
            if (this.activationFlashes.get(key)) {
                this.world.removeChild(flash);
                this.activationFlashes.delete(key);
            }
        }, 2000);

        console.log(`🧠 Activation flash: "${token}" at (${x}, ${y}) layer ${layer}`);
    }

    /**
     * Move camera to position
     */
    moveCamera(x, y, immediate = false) {
        this.viewportManager.moveCenter(x, y, immediate);
    }

    /**
     * Zoom camera
     */
    zoomCamera(zoom, immediate = false) {
        this.viewportManager.setZoom(zoom, immediate);
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            ...this.stats,
            viewport: this.viewportManager ? this.viewportManager.getStats() : null,
            chunkManager: this.chunkManager ? this.chunkManager.getStats() : null,
            spritePool: this.spritePool ? this.spritePool.getStats() : null,
            tileSpriteManager: this.tileSpriteManager ? this.tileSpriteManager.getStats() : null,
            lodSystem: this.lodSystem ? this.lodSystem.getStats() : null,
            lodRenderer: this.lodRenderer ? this.lodRenderer.getStats() : null,
            tectonicSaccadic: this.tectonicSaccadic ? this.tectonicSaccadic.getStats() : null
        };
    }

    /**
     * Log statistics
     */
    _logStats() {
        const stats = this.getStats();
        console.log('📊 InfiniteMapV2 Statistics:', {
            fps: stats.fps,
            chunkLoadTime: stats.chunkLoadTime.toFixed(2) + 'ms',
            renderTime: stats.renderTime.toFixed(2) + 'ms',
            viewport: stats.viewport,
            chunks: stats.chunkManager,
            sprites: stats.spritePool
        });
    }

    /**
     * Stop the infinite map
     */
    stop() {
        this.active = false;

        // Clean up components
        if (this.cameraController) {
            this.cameraController.destroy();
        }

        if (this.viewportManager) {
            this.viewportManager.destroy();
        }

        if (this.lodRenderer) {
            this.lodRenderer.destroy();
        }

        if (this.lodSystem) {
            this.lodSystem.destroy();
        }

        if (this.tectonicSaccadic) {
            this.tectonicSaccadic.destroy();
        }

        if (this.tileSpriteManager) {
            this.tileSpriteManager.destroy();
        }

        if (this.spritePool) {
            this.spritePool.destroy();
        }

        if (this.chunkManager) {
            this.chunkManager.clear();
        }

        // Clean up overlays
        for (const [key, overlay] of this.securityOverlays) {
            if (overlay.overlay) {
                this.world.removeChild(overlay.overlay);
            }
        }
        this.securityOverlays.clear();

        for (const [key, flash] of this.activationFlashes) {
            if (flash.flash) {
                this.world.removeChild(flash.flash);
            }
        }
        this.activationFlashes.clear();

        console.log('🗺️  InfiniteMapV2 stopped');
    }

    /**
     * Get tile at world coordinates
     */
    getTileAt(x, y) {
        return this.chunkManager.getTile(x, y);
    }

    /**
     * Get visible tiles
     */
    getVisibleTiles() {
        const viewport = this.viewportManager.getVisibleBounds();
        return this.chunkManager.getVisibleTiles(viewport);
    }

    /**
     * Force reload of a specific chunk
     */
    async reloadChunk(chunkX, chunkY) {
        this.chunkManager.unloadChunk(chunkX, chunkY);
        return await this.chunkManager.loadChunk(chunkX, chunkY);
    }
}

/**
 * InfiniteMapV2Factory - Factory for creating InfiniteMapV2 instances
 * 
 * @class InfiniteMapV2Factory
 */
class InfiniteMapV2Factory {
    /**
     * Create a default InfiniteMapV2 instance
     */
    static create(worldContainer, config = {}) {
        return new InfiniteMapV2(worldContainer, config);
    }

    /**
     * Create an InfiniteMapV2 optimized for performance
     */
    static createPerformance(worldContainer, config = {}) {
        return new InfiniteMapV2(worldContainer, {
            chunkSize: 32,
            maxCachedChunks: 128,
            preloadRadius: 2,
            initialSpritePoolSize: 1000,
            maxSpritePoolSize: 5000,
            enableLOD: true,
            enableCameraSync: false,
            ...config
        });
    }

    /**
     * Create an InfiniteMapV2 optimized for quality
     */
    static createQuality(worldContainer, config = {}) {
        return new InfiniteMapV2(worldContainer, {
            chunkSize: 8,
            maxCachedChunks: 256,
            preloadRadius: 3,
            initialSpritePoolSize: 2000,
            maxSpritePoolSize: 10000,
            enableLOD: true,
            enableCameraSync: true,
            ...config
        });
    }
}

// Export for use in other modules
if (typeof window !== 'undefined') {
    window.InfiniteMapV2 = InfiniteMapV2;
    window.InfiniteMapV2Factory = InfiniteMapV2Factory;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        InfiniteMapV2,
        InfiniteMapV2Factory
    };
}
