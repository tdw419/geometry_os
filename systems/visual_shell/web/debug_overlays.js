/**
 * DebugOverlayManager - Visual debugging tools for Phase 47 systems
 *
 * Phase 47 Improvements - Task 5.1: Visual Debugging Tools
 *
 * Features:
 * - Saccade path visualization (eye movement trajectory)
 * - LOD heatmap display (color-coded tile LOD levels)
 * - Prefetch prediction display (show pre-fetched tiles)
 * - Attention heatmap viewer (gaze focus visualization)
 * - Keyboard toggle shortcuts (Ctrl+D)
 * - Minimal performance impact (<2% overhead)
 *
 * @class DebugOverlayManager
 */

class DebugOverlayManager {
    constructor(config = {}) {
        this.config = {
            enabled: false,
            showSaccadePath: true,
            showLODHeatmap: true,
            showPrefetchDisplay: true,
            showAttentionHeatmap: true,
            maxPathLength: 100,  // Maximum saccade path points to show
            heatmapResolution: 20,  // Size of heatmap cells in pixels
            colors: {
                saccadePath: '#00ff00',
                lodHigh: '#00ff00',    // Green for high LOD
                lodMedium: '#ffff00',  // Yellow for medium
                lodLow: '#ff9900',     // Orange for low
                lodMinimal: '#ff0000', // Red for minimal
                prefetch: '#00ffff',   // Cyan for prefetched
                attention: 'rgba(255, 0, 255, 0.3)',  // Magenta for attention
                ...config.colors
            },
            ...config
        };

        // State
        this.saccadePath = [];  // Array of {x, y, timestamp}
        this.lodData = new Map();  // Tile LOD data
        this.prefetchTiles = new Set();  // Currently prefetched tiles
        this.attentionData = [];  // Attention heatmap points
        this.canvas = null;
        this.ctx = null;

        // Managers (set via setManagers)
        this.saccadicController = null;
        this.lodTransitionManager = null;
        this.prefetcher = null;
        this.focusTracker = null;

        // Performance monitoring
        this.renderTime = 0;
        this.lastRenderTime = 0;

        // Initialize
        this._initCanvas();
        this._bindKeyboard();
    }

    /**
     * Initialize overlay canvas
     */
    _initCanvas() {
        if (typeof window === 'undefined') return;

        // Create canvas overlay
        this.canvas = document.createElement('canvas');
        this.canvas.id = 'debug-overlay-canvas';
        this.canvas.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 9999;
            display: none;
        `;
        document.body.appendChild(this.canvas);
        this.ctx = this.canvas.getContext('2d');

        // Resize handler
        window.addEventListener('resize', () => this._resizeCanvas());
        this._resizeCanvas();
    }

    /**
     * Resize canvas to window size
     */
    _resizeCanvas() {
        if (!this.canvas) return;
        this.canvas.width = window.innerWidth;
        this.canvas.height = window.innerHeight;
    }

    /**
     * Bind keyboard shortcuts
     */
    _bindKeyboard() {
        if (typeof window === 'undefined') return;

        window.addEventListener('keydown', (e) => {
            // Ctrl+D to toggle debug overlay
            if (e.ctrlKey && e.key === 'd') {
                e.preventDefault();
                this.toggle();
            }
            // Ctrl+Shift+D to toggle individual modes
            if (e.ctrlKey && e.shiftKey && e.key === 'D') {
                e.preventDefault();
                this.cycleMode();
            }
        });
    }

    /**
     * Set reference to managers
     */
    setManagers(managers) {
        if (managers.saccadicController) {
            this.saccadicController = managers.saccadicController;
            // Track saccade movements
            this.saccadicController.onSaccadeStart = (from, to) => {
                this._recordSaccadeMovement(from, to);
            };
        }
        if (managers.lodTransitionManager) {
            this.lodTransitionManager = managers.lodTransitionManager;
        }
        if (managers.prefetcher) {
            this.prefetcher = managers.prefetcher;
            this.prefetcher.on('prefetch', (data) => {
                this._updatePrefetchTiles(data.tiles);
            });
        }
        if (managers.focusTracker) {
            this.focusTracker = managers.focusTracker;
        }
    }

    /**
     * Record saccade movement for path visualization
     */
    _recordSaccadeMovement(from, to) {
        if (!this.config.showSaccadePath) return;

        const now = Date.now();
        this.saccadePath.push({
            from: { ...from },
            to: { ...to },
            timestamp: now
        });

        // Limit path length
        if (this.saccadePath.length > this.config.maxPathLength) {
            this.saccadePath.shift();
        }
    }

    /**
     * Update prefetch tile display
     */
    _updatePrefetchTiles(tiles) {
        if (!this.config.showPrefetchDisplay) return;

        this.prefetchTiles.clear();
        if (Array.isArray(tiles)) {
            tiles.forEach(tile => {
                this.prefetchTiles.add(`${tile.x}_${tile.y}`);
            });
        }
    }

    /**
     * Update LOD data for heatmap
     */
    updateLODData(tileX, tileY, lodLevel) {
        if (!this.config.showLODHeatmap) return;

        this.lodData.set(`${tileX}_${tileY}`, {
            level: lodLevel,
            timestamp: Date.now()
        });
    }

    /**
     * Update attention heatmap data
     */
    updateAttentionData(position) {
        if (!this.config.showAttentionHeatmap) return;

        this.attentionData.push({
            x: position.x,
            y: position.y,
            timestamp: Date.now(),
            weight: 1.0
        });

        // Decay old attention points
        const now = Date.now();
        const decayTime = 5000;  // 5 seconds
        this.attentionData = this.attentionData.filter(p => now - p.timestamp < decayTime);
    }

    /**
     * Toggle debug overlay
     */
    toggle() {
        this.config.enabled = !this.config.enabled;
        if (this.canvas) {
            this.canvas.style.display = this.config.enabled ? 'block' : 'none';
        }
        console.log(`Debug overlay ${this.config.enabled ? 'enabled' : 'disabled'}`);
        return this.config.enabled;
    }

    /**
     * Cycle through display modes
     */
    cycleMode() {
        const modes = ['all', 'saccade', 'lod', 'prefetch', 'attention'];

        // Simple cycle - in production, track current mode
        if (this.config.showSaccadePath && this.config.showLODHeatmap &&
            this.config.showPrefetchDisplay && this.config.showAttentionHeatmap) {
            // All on -> saccade only
            this.config.showLODHeatmap = false;
            this.config.showPrefetchDisplay = false;
            this.config.showAttentionHeatmap = false;
            console.log('Debug mode: saccade only');
        } else if (this.config.showSaccadePath) {
            // Saccade only -> LOD only
            this.config.showSaccadePath = false;
            this.config.showLODHeatmap = true;
            console.log('Debug mode: LOD only');
        } else if (this.config.showLODHeatmap) {
            // LOD only -> prefetch only
            this.config.showLODHeatmap = false;
            this.config.showPrefetchDisplay = true;
            console.log('Debug mode: prefetch only');
        } else if (this.config.showPrefetchDisplay) {
            // Prefetch only -> attention only
            this.config.showPrefetchDisplay = false;
            this.config.showAttentionHeatmap = true;
            console.log('Debug mode: attention only');
        } else {
            // All on
            this.config.showSaccadePath = true;
            this.config.showLODHeatmap = true;
            this.config.showPrefetchDisplay = true;
            this.config.showAttentionHeatmap = true;
            console.log('Debug mode: all');
        }
    }

    /**
     * Render debug overlays (call after main render)
     */
    render() {
        if (!this.config.enabled || !this.ctx) return;

        const startTime = performance.now();

        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);

        // Render in order: attention -> LOD -> prefetch -> saccade
        if (this.config.showAttentionHeatmap) {
            this._renderAttentionHeatmap();
        }

        if (this.config.showLODHeatmap) {
            this._renderLODHeatmap();
        }

        if (this.config.showPrefetchDisplay) {
            this._renderPrefetchDisplay();
        }

        if (this.config.showSaccadePath) {
            this._renderSaccadePath();
        }

        // Track render time
        this.renderTime = performance.now() - startTime;
    }

    /**
     * Render saccade path
     */
    _renderSaccadePath() {
        const ctx = this.ctx;
        const now = Date.now();

        ctx.strokeStyle = this.config.colors.saccadePath;
        ctx.lineWidth = 2;

        // Draw each saccade
        for (const movement of this.saccadePath) {
            const age = now - movement.timestamp;
            if (age > 2000) continue;  // Don't show old movements

            const alpha = 1 - age / 2000;  // Fade out over 2 seconds
            ctx.globalAlpha = alpha;

            ctx.beginPath();
            ctx.moveTo(movement.from.x, movement.from.y);
            ctx.lineTo(movement.to.x, movement.to.y);
            ctx.stroke();

            // Draw endpoint
            ctx.fillStyle = this.config.colors.saccadePath;
            ctx.beginPath();
            ctx.arc(movement.to.x, movement.to.y, 3, 0, Math.PI * 2);
            ctx.fill();
        }

        ctx.globalAlpha = 1;

        // Draw current position if controller available
        if (this.saccadicController) {
            const state = this.saccadicController.getState();
            ctx.fillStyle = '#ffffff';
            ctx.beginPath();
            ctx.arc(state.position.x, state.position.y, 5, 0, Math.PI * 2);
            ctx.fill();
        }
    }

    /**
     * Render LOD heatmap
     */
    _renderLODHeatmap() {
        const ctx = this.ctx;
        const cellSize = this.config.heatmapResolution;

        for (const [key, data] of this.lodData) {
            const [x, y] = key.split('_').map(Number);
            const screenX = x * cellSize;
            const screenY = y * cellSize;

            // Color based on LOD level
            let color;
            switch (data.level) {
                case 'full': case 'high':
                    color = this.config.colors.lodHigh;
                    break;
                case 'medium':
                    color = this.config.colors.lodMedium;
                    break;
                case 'low':
                    color = this.config.colors.lodLow;
                    break;
                default:
                    color = this.config.colors.lodMinimal;
            }

            ctx.fillStyle = color;
            ctx.globalAlpha = 0.3;
            ctx.fillRect(screenX, screenY, cellSize, cellSize);
        }

        ctx.globalAlpha = 1;
    }

    /**
     * Render prefetch display
     */
    _renderPrefetchDisplay() {
        const ctx = this.ctx;
        const cellSize = this.config.heatmapResolution;

        ctx.strokeStyle = this.config.colors.prefetch;
        ctx.lineWidth = 1;
        ctx.globalAlpha = 0.5;

        for (const key of this.prefetchTiles) {
            const [x, y] = key.split('_').map(Number);
            const screenX = x * cellSize;
            const screenY = y * cellSize;

            ctx.strokeRect(screenX, screenY, cellSize, cellSize);
        }

        ctx.globalAlpha = 1;
    }

    /**
     * Render attention heatmap
     */
    _renderAttentionHeatmap() {
        const ctx = this.ctx;
        const now = Date.now();

        // Create radial gradient for each attention point
        for (const point of this.attentionData) {
            const age = now - point.timestamp;
            const alpha = (1 - age / 5000) * 0.3;  // Fade over 5 seconds

            const gradient = ctx.createRadialGradient(
                point.x, point.y, 0,
                point.x, point.y, 100
            );
            gradient.addColorStop(0, `rgba(255, 0, 255, ${alpha})`);
            gradient.addColorStop(1, 'rgba(255, 0, 255, 0)');

            ctx.fillStyle = gradient;
            ctx.beginPath();
            ctx.arc(point.x, point.y, 100, 0, Math.PI * 2);
            ctx.fill();
        }
    }

    /**
     * Get current render statistics
     */
    getStats() {
        return {
            enabled: this.config.enabled,
            showSaccadePath: this.config.showSaccadePath,
            showLODHeatmap: this.config.showLODHeatmap,
            showPrefetchDisplay: this.config.showPrefetchDisplay,
            showAttentionHeatmap: this.config.showAttentionHeatmap,
            saccadePathLength: this.saccadePath.length,
            lodTilesCount: this.lodData.size,
            prefetchTilesCount: this.prefetchTiles.size,
            attentionPointsCount: this.attentionData.length,
            renderTimeMs: this.renderTime.toFixed(2)
        };
    }

    /**
     * Clear all debug data
     */
    clearData() {
        this.saccadePath = [];
        this.lodData.clear();
        this.prefetchTiles.clear();
        this.attentionData = [];
    }

    /**
     * Destroy overlay manager
     */
    destroy() {
        if (this.canvas && this.canvas.parentNode) {
            this.canvas.parentNode.removeChild(this.canvas);
        }
        this.clearData();
    }
}

// Export
if (typeof window !== 'undefined') {
    window.DebugOverlayManager = DebugOverlayManager;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { DebugOverlayManager };
}
