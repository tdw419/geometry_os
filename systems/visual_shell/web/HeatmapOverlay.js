/**
 * HeatmapOverlay - Real-time heat map visualization for the Infinite Map.
 *
 * Visual Hotspot Debugger - Phase 2: Frontend Heat Overlay
 *
 * Features:
 * - Color gradient: Blue (cold) -> Cyan -> Green -> Yellow -> Red (hot)
 * - Semi-transparent overlay on Hilbert grid
 * - Animated pulse for hotspots
 * - Toggle with Ctrl+Shift+M
 * - Integration with HeatmapGraphicsPool for optimized rendering
 *
 * @class HeatmapOverlay
 * @see .planning/visual-hotspot-debugger-plan.md
 */

// Constants
const GRID_SIZE = 64;
const CELL_SIZE = 16; // Pixels per heat cell

// Color gradient lookup (from cold to hot)
const HEAT_COLORS = [
    { r: 0, g: 0, b: 255, a: 0.1 },    // Cold (blue, transparent)
    { r: 0, g: 255, b: 255, a: 0.3 },  // Cool (cyan)
    { r: 0, g: 255, b: 0, a: 0.5 },    // Warm (green)
    { r: 255, g: 255, b: 0, a: 0.7 },  // Hot (yellow)
    { r: 255, g: 0, b: 0, a: 0.9 },    // Very hot (red)
];

class HeatmapOverlay {
    /**
     * Create a new HeatmapOverlay
     * @param {PIXI.Application} app - The PixiJS application instance
     * @param {Object} viewport - The viewport manager
     * @param {PIXI.Container} worldContainer - The world container to add the overlay to
     */
    constructor(app, viewport, worldContainer) {
        this.app = app;
        this.viewport = viewport;
        this.worldContainer = worldContainer;

        // Heat data storage
        this.grid = new Float32Array(GRID_SIZE * GRID_SIZE);
        this.hotspots = [];

        // Graphics container for the overlay
        this.container = new PIXI.Container();
        this.container.alpha = 0.7;
        this.container.visible = false;
        this.container.sortableChildren = true;

        // Graphics pool for efficient rendering
        // Use HeatmapGraphicsPool if available, otherwise create simple pool
        if (typeof HeatmapGraphicsPool !== 'undefined') {
            this.graphicsPool = new HeatmapGraphicsPool({
                initialSize: 100,
                maxIdle: 200,
                preallocate: true,
                debug: false
            });
            this._usingPool = true;
        } else {
            // Fallback to simple array-based tracking
            this._graphicsCache = [];
            this._usingPool = false;
        }

        // Active graphics currently in use
        this._activeGraphics = [];

        // Animation state
        this.pulsePhase = 0;
        this.lastUpdate = 0;
        this._needsRender = false;

        // Configuration
        this.config = {
            threshold: 0.05,       // Minimum heat to render
            pulseSpeed: 0.1,       // Pulse animation speed
            maxHotspots: 10,       // Maximum hotspots to highlight
            debug: false
        };

        // Add to world container
        worldContainer.addChild(this.container);

        // Setup WebSocket handler for heat updates
        this._setupWebSocketHandler();

        // Track initialization
        this._initialized = true;

        if (this.config.debug) {
            console.log('[HeatmapOverlay] Initialized with', this._usingPool ? 'pool' : 'cache');
        }
    }

    /**
     * Setup WebSocket handler to receive heat map updates
     * @private
     */
    _setupWebSocketHandler() {
        // Listen for heat_map_update events from Visual Bridge
        if (typeof window !== 'undefined') {
            window.addEventListener('heat_map_update', (e) => {
                if (e.detail) {
                    this.updateHeatMap(e.detail);
                }
            });

            // Also listen for legacy event name
            window.addEventListener('HEAT_MAP_UPDATE', (e) => {
                if (e.detail) {
                    this.updateHeatMap(e.detail);
                }
            });
        }

        // Check for global visualBridge
        if (window.visualBridge) {
            window.visualBridge.on('heat_map_update', (data) => {
                this.updateHeatMap(data);
            });
        }
    }

    /**
     * Update heat map from WebSocket data
     * @param {Object} data - The heat map update data
     * @param {string} data.grid - Hex-encoded Float32Array of heat values
     * @param {Array} data.hotspots - Array of hotspot objects {x, y, intensity}
     * @param {number} data.timestamp - Update timestamp
     */
    updateHeatMap(data) {
        if (!data) return;

        // Decode hex-encoded grid
        if (data.grid) {
            try {
                const hexString = data.grid;
                const bytes = new Uint8Array(
                    hexString.match(/.{2}/g).map(b => parseInt(b, 16))
                );
                this.grid = new Float32Array(bytes.buffer);

                if (this.config.debug) {
                    console.log('[HeatmapOverlay] Updated grid with', this.grid.length, 'values');
                }
            } catch (err) {
                console.warn('[HeatmapOverlay] Failed to decode grid:', err);
            }
        }

        // Update hotspots
        this.hotspots = data.hotspots || [];
        this.lastUpdate = data.timestamp || Date.now();

        // Mark for re-render
        this._needsRender = true;
    }

    /**
     * Get interpolated color for heat value (0.0 - 1.0)
     * @param {number} value - Heat value between 0 and 1
     * @returns {Object} Color object with r, g, b, a properties
     */
    _getColorForHeat(value) {
        // Clamp value
        const v = Math.max(0, Math.min(1, value));

        if (v <= 0) return { ...HEAT_COLORS[0] };
        if (v >= 1) return { ...HEAT_COLORS[HEAT_COLORS.length - 1] };

        // Calculate interpolation
        const scaled = v * (HEAT_COLORS.length - 1);
        const index = Math.floor(scaled);
        const t = scaled - index;

        const c1 = HEAT_COLORS[index];
        const c2 = HEAT_COLORS[Math.min(index + 1, HEAT_COLORS.length - 1)];

        return {
            r: Math.round(c1.r + (c2.r - c1.r) * t),
            g: Math.round(c1.g + (c2.g - c1.g) * t),
            b: Math.round(c1.b + (c2.b - c1.b) * t),
            a: c1.a + (c2.a - c1.a) * t
        };
    }

    /**
     * Convert color object to PIXI number format
     * @param {Object} color - Color object with r, g, b properties
     * @returns {number} Color as 24-bit number
     */
    _colorToNumber(color) {
        return (color.r << 16) | (color.g << 8) | color.b;
    }

    /**
     * Acquire a graphics object from pool or cache
     * @returns {PIXI.Graphics}
     * @private
     */
    _acquireGraphics() {
        if (this._usingPool) {
            return this.graphicsPool.acquire();
        } else {
            // Simple fallback - create new or reuse
            let graphics;
            if (this._graphicsCache.length > 0) {
                graphics = this._graphicsCache.pop();
                graphics.clear();
            } else {
                graphics = new PIXI.Graphics();
            }
            return graphics;
        }
    }

    /**
     * Release a graphics object back to pool or cache
     * @param {PIXI.Graphics} graphics
     * @private
     */
    _releaseGraphics(graphics) {
        if (this._usingPool) {
            this.graphicsPool.release(graphics);
        } else {
            graphics.clear();
            graphics.removeFromParent();
            this._graphicsCache.push(graphics);
        }
    }

    /**
     * Release all active graphics
     * @private
     */
    _releaseAllGraphics() {
        for (const graphics of this._activeGraphics) {
            this._releaseGraphics(graphics);
        }
        this._activeGraphics = [];
    }

    /**
     * Render the heat map overlay
     * @private
     */
    _render() {
        // Clear previous graphics
        this.container.removeChildren();
        this._releaseAllGraphics();

        const threshold = this.config.threshold;

        // Render grid cells with heat > threshold
        for (let y = 0; y < GRID_SIZE; y++) {
            for (let x = 0; x < GRID_SIZE; x++) {
                const idx = y * GRID_SIZE + x;
                const heat = this.grid[idx];

                if (heat > threshold) {
                    const color = this._getColorForHeat(heat);
                    const graphics = this._acquireGraphics();

                    graphics.clear();
                    graphics.beginFill(
                        this._colorToNumber(color),
                        color.a
                    );

                    // Draw cell rectangle
                    graphics.drawRect(
                        x * CELL_SIZE,
                        y * CELL_SIZE,
                        CELL_SIZE,
                        CELL_SIZE
                    );
                    graphics.endFill();

                    this.container.addChild(graphics);
                    this._activeGraphics.push(graphics);
                }
            }
        }

        // Render hotspots with pulse effect
        for (const hotspot of this.hotspots.slice(0, this.config.maxHotspots)) {
            this._renderHotspot(hotspot);
        }

        this._needsRender = false;

        if (this.config.debug) {
            console.log('[HeatmapOverlay] Rendered', this._activeGraphics.length, 'cells');
        }
    }

    /**
     * Render a pulsing hotspot indicator
     * @param {Object} hotspot - Hotspot data {x, y, intensity}
     * @private
     */
    _renderHotspot(hotspot) {
        const graphics = this._acquireGraphics();
        const x = hotspot.x * CELL_SIZE + CELL_SIZE / 2;
        const y = hotspot.y * CELL_SIZE + CELL_SIZE / 2;

        // Pulsing circle with scale based on intensity
        const pulseScale = 1 + 0.3 * Math.sin(this.pulsePhase);
        const baseRadius = CELL_SIZE * 0.8;
        const radius = baseRadius * pulseScale * (hotspot.intensity || 1);

        graphics.clear();

        // Outer glow
        graphics.lineStyle(2, 0xffffff, 0.8);
        graphics.beginFill(0xff0000, 0.3);
        graphics.drawCircle(x, y, radius);
        graphics.endFill();

        // Inner bright spot
        graphics.beginFill(0xff4444, 0.6);
        graphics.drawCircle(x, y, radius * 0.5);
        graphics.endFill();

        this.container.addChild(graphics);
        this._activeGraphics.push(graphics);
    }

    /**
     * Animation tick (called from main loop)
     * @param {number} delta - Time since last frame in ms
     */
    tick(delta) {
        // Update pulse animation
        this.pulsePhase += delta * this.config.pulseSpeed;

        // Re-render hotspots for pulse effect if visible and has hotspots
        if (this.container.visible && this.hotspots.length > 0) {
            this._needsRender = true;
        }

        // Perform render if needed
        if (this._needsRender && this.container.visible) {
            this._render();
        }
    }

    /**
     * Toggle visibility of the heat map overlay
     * @returns {boolean} New visibility state
     */
    toggle() {
        this.container.visible = !this.container.visible;

        if (this.container.visible) {
            this._needsRender = true;
        }

        console.log(`[HeatmapOverlay] ${this.container.visible ? 'Enabled' : 'Disabled'}`);
        return this.container.visible;
    }

    /**
     * Set visibility of the heat map overlay
     * @param {boolean} visible - Desired visibility state
     */
    setVisible(visible) {
        this.container.visible = visible;

        if (visible) {
            this._needsRender = true;
        }
    }

    /**
     * Get heat value at specific world coordinates
     * @param {number} worldX - World X coordinate
     * @param {number} worldY - World Y coordinate
     * @returns {number} Heat value at the coordinates (0-1)
     */
    getHeatAt(worldX, worldY) {
        const gridX = Math.floor(worldX / CELL_SIZE) % GRID_SIZE;
        const gridY = Math.floor(worldY / CELL_SIZE) % GRID_SIZE;

        // Handle negative coordinates
        const normalizedX = (gridX + GRID_SIZE) % GRID_SIZE;
        const normalizedY = (gridY + GRID_SIZE) % GRID_SIZE;

        if (normalizedX >= 0 && normalizedX < GRID_SIZE &&
            normalizedY >= 0 && normalizedY < GRID_SIZE) {
            return this.grid[normalizedY * GRID_SIZE + normalizedX];
        }
        return 0;
    }

    /**
     * Get statistics about the current heat map
     * @returns {Object} Statistics object
     */
    getStats() {
        const visible = this.container.visible;
        const hotspotCount = this.hotspots.length;
        const totalCells = this.grid.length;
        const activeCells = this.grid.filter(v => v > this.config.threshold).length;
        const avgHeat = this.grid.reduce((a, b) => a + b, 0) / totalCells;
        const maxHeat = Math.max(...this.grid);

        return {
            visible,
            hotspotCount,
            totalCells,
            activeCells,
            avgHeat,
            maxHeat,
            lastUpdate: this.lastUpdate,
            graphicsCount: this._activeGraphics.length
        };
    }

    /**
     * Debug: Generate test heat pattern
     * Creates a radial gradient from center with test hotspots
     */
    debugTest() {
        console.log('[HeatmapOverlay] Running debug test...');

        // Create a radial gradient pattern centered on the grid
        for (let y = 0; y < GRID_SIZE; y++) {
            for (let x = 0; x < GRID_SIZE; x++) {
                const cx = GRID_SIZE / 2;
                const cy = GRID_SIZE / 2;
                const dist = Math.sqrt((x - cx) ** 2 + (y - cy) ** 2);
                const maxDist = Math.sqrt(cx ** 2 + cy ** 2);

                // Heat decreases with distance from center
                this.grid[y * GRID_SIZE + x] = Math.max(0, 1 - dist / maxDist);
            }
        }

        // Add some test hotspots
        this.hotspots = [
            { x: 32, y: 32, intensity: 1.0 },   // Center
            { x: 16, y: 16, intensity: 0.8 },   // Upper left
            { x: 48, y: 48, intensity: 0.7 },   // Lower right
            { x: 16, y: 48, intensity: 0.6 },   // Lower left
            { x: 48, y: 16, intensity: 0.5 }    // Upper right
        ];

        this.lastUpdate = Date.now();

        // Force render and show
        this._needsRender = true;
        this.container.visible = true;

        console.log('[HeatmapOverlay] Debug test activated - use Ctrl+Shift+M to toggle');
        console.log('[HeatmapOverlay] Stats:', this.getStats());
    }

    /**
     * Clear all heat data
     */
    clear() {
        this.grid.fill(0);
        this.hotspots = [];
        this.lastUpdate = Date.now();
        this._needsRender = true;
    }

    /**
     * Destroy the overlay and clean up resources
     */
    destroy() {
        this._releaseAllGraphics();

        if (this._usingPool && this.graphicsPool) {
            this.graphicsPool.destroy();
        }

        if (this.container) {
            this.container.destroy({ children: true });
        }

        this.grid = null;
        this.hotspots = null;
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.HeatmapOverlay = HeatmapOverlay;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { HeatmapOverlay, GRID_SIZE, CELL_SIZE, HEAT_COLORS };
}
