/**
 * DebugOverlays - Visual debugging tools for Phase 47 systems
 *
 * Phase 47: Tectonic Saccadic Optimization - Visual Debugging
 *
 * Provides toggleable visual overlays for debugging:
 * - Saccade path visualization (eye movement trajectory)
 * - LOD heatmap display (color-coded tile LOD levels)
 * - Prefetch prediction display (pre-fetched tiles)
 * - Attention heatmap viewer (gaze focus visualization)
 *
 * Requirements:
 * - Keyboard toggle shortcuts
 * - Minimal performance impact (<2% overhead)
 * - Integrates with existing Phase 47 modules
 *
 * @class DebugOverlays
 */

class DebugOverlays {
    constructor(config = {}) {
        this.config = {
            saccadePath: {
                enabled: false,
                color: '#00ff00',
                lineWidth: 2,
                maxPoints: 100,
                fadeTime: 5000
            },
            lodHeatmap: {
                enabled: false,
                // Color gradients for each LOD level
                colors: {
                    full: 'rgba(0, 255, 0, 0.3)',
                    medium: 'rgba(255, 255, 0, 0.3)',
                    low: 'rgba(255, 165, 0, 0.3)',
                    minimal: 'rgba(255, 0, 0, 0.3)',
                    semantic: 'rgba(128, 0, 128, 0.3)'
                },
                showLabels: true,
                showTransitions: true
            },
            prefetchDisplay: {
                enabled: false,
                pendingColor: 'rgba(0, 100, 255, 0.4)',
                loadedColor: 'rgba(0, 255, 100, 0.2)',
                showBounds: true,
                showPriority: true
            },
            attentionHeatmap: {
                enabled: false,
                maxSamples: 1000,
                decayRate: 0.99,
                colorMap: 'heat', // 'heat', 'grayscale', 'rainbow'
                resolution: 10 // pixels per sample
            },
            performance: {
                enabled: false,
                updateInterval: 500,
                showFps: true,
                showFrameTime: true,
                showMemory: true
            },
            ...config
        };

        // Canvas for overlays
        this.canvas = null;
        this.ctx = null;
        this.container = null;

        // Module references
        this.saccadicController = null;
        this.lodSystem = null;
        this.predictivePrefetcher = null;
        this.focusTracker = null;
        this.viewport = null;

        // Saccade path data
        this.saccadePath = [];
        this.saccadeHistory = [];

        // Attention heatmap data
        this.attentionSamples = [];

        // Performance tracking
        this.frameCount = 0;
        this.lastFpsUpdate = Date.now();
        this.fps = 0;

        // Keyboard shortcuts
        this.shortcuts = {
            'KeyS': 'saccadePath',
            'KeyL': 'lodHeatmap',
            'KeyP': 'prefetchDisplay',
            'KeyA': 'attentionHeatmap',
            'KeyF': 'performance',
            'KeyD': 'all'
        };

        // Event listeners
        this.eventListeners = new Map();
        this._boundKeyDown = null;

        // State
        this.isEnabled = false;
        this.isVisible = true;
        this.lastUpdate = 0;
        this.updateThrottle = 100; // Update at most 10fps for overlays

        // Initialize
        this._init();
    }

    /**
     * Initialize the overlay system
     */
    _init() {
        this._createCanvas();
        this._bindKeyboard();
        this._setupResizeHandler();
    }

    /**
     * Create overlay canvas
     */
    _createCanvas() {
        // Create canvas
        this.canvas = document.createElement('canvas');
        this.canvas.id = 'debug-overlays-canvas';
        this.canvas.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            pointer-events: none;
            z-index: 10000;
            display: none;
        `;

        // Set size
        this._resizeCanvas();

        // Get context
        this.ctx = this.canvas.getContext('2d');

        // Add to document
        document.body.appendChild(this.canvas);
    }

    /**
     * Resize canvas to match viewport
     */
    _resizeCanvas() {
        this.canvas.width = window.innerWidth;
        this.canvas.height = window.innerHeight;
    }

    /**
     * Bind keyboard shortcuts
     */
    _bindKeyboard() {
        this._boundKeyDown = (e) => this._handleKeyDown(e);
        window.addEventListener('keydown', this._boundKeyDown);
    }

    /**
     * Handle keyboard shortcuts
     */
    _handleKeyDown(e) {
        // Only toggle when Alt key is pressed (to avoid conflicts)
        if (!e.altKey) return;

        const overlay = this.shortcuts[e.code];
        if (!overlay) return;

        e.preventDefault();

        if (overlay === 'all') {
            // Toggle all overlays
            const newState = !this.isEnabled;
            this.enableAll(newState);
        } else {
            // Toggle specific overlay
            this.toggle(overlay);
        }
    }

    /**
     * Setup resize handler
     */
    _setupResizeHandler() {
        this._boundResize = () => this._resizeCanvas();
        window.addEventListener('resize', this._boundResize);
    }

    /**
     * Set module references
     */
    setModules(modules) {
        if (modules.saccadicController) {
            this.saccadicController = modules.saccadicController;
            this._attachSaccadeListeners();
        }
        if (modules.lodSystem) {
            this.lodSystem = modules.lodSystem;
        }
        if (modules.predictivePrefetcher) {
            this.predictivePrefetcher = modules.predictivePrefetcher;
            this._attachPrefetchListeners();
        }
        if (modules.focusTracker) {
            this.focusTracker = modules.focusTracker;
        }
        if (modules.viewport) {
            this.viewport = modules.viewport;
        }
    }

    /**
     * Attach saccade event listeners
     */
    _attachSaccadeListeners() {
        if (!this.saccadicController) return;

        // Track saccade starts
        this.saccadicController.onSaccadeStart = (start, target) => {
            if (this.config.saccadePath.enabled) {
                this.saccadePath.push({
                    type: 'saccade',
                    start: { ...start },
                    target: { ...target },
                    timestamp: Date.now()
                });
                this._trimPath();
            }
        };

        // Track position changes
        const originalUpdate = this.saccadicController.update.bind(this.saccadicController);
        this.saccadicController.update = (deltaTime) => {
            originalUpdate(deltaTime);
            if (this.config.saccadePath.enabled) {
                const state = this.saccadicController.getState();
                this.saccadePath.push({
                    type: 'position',
                    position: { ...state.position },
                    phase: state.phase,
                    timestamp: Date.now()
                });
                this._trimPath();
            }
        };
    }

    /**
     * Attach prefetch event listeners
     */
    _attachPrefetchListeners() {
        if (!this.predictivePrefetcher) return;

        this.predictivePrefetcher.on('prefetch', (data) => {
            if (this.config.prefetchDisplay.enabled) {
                // Store prefetch data for visualization
                this._lastPrefetchData = {
                    tiles: data.tiles || [],
                    timestamp: data.timestamp || Date.now()
                };
            }
        });
    }

    /**
     * Trim path to max points
     */
    _trimPath() {
        if (this.saccadePath.length > this.config.saccadePath.maxPoints) {
            this.saccadePath = this.saccadePath.slice(-this.config.saccadePath.maxPoints);
        }
    }

    /**
     * Toggle a specific overlay
     */
    toggle(overlayName) {
        if (this.config[overlayName]) {
            this.config[overlayName].enabled = !this.config[overlayName].enabled;
            this.emit('toggle', { overlay: overlayName, enabled: this.config[overlayName].enabled });
            this._updateVisibility();
        }
    }

    /**
     * Enable all overlays
     */
    enableAll(enabled = true) {
        Object.keys(this.config).forEach(key => {
            if (typeof this.config[key] === 'object' && 'enabled' in this.config[key]) {
                this.config[key].enabled = enabled;
            }
        });
        this.isEnabled = enabled;
        this._updateVisibility();
        this.emit('toggleAll', { enabled });
    }

    /**
     * Update canvas visibility
     */
    _updateVisibility() {
        const anyEnabled = Object.keys(this.config).some(key => {
            const config = this.config[key];
            return typeof config === 'object' && config.enabled;
        });

        this.canvas.style.display = (anyEnabled && this.isVisible) ? 'block' : 'none';
    }

    /**
     * Show/hide overlays
     */
    setVisible(visible) {
        this.isVisible = visible;
        this._updateVisibility();
    }

    /**
     * Update loop (call every frame)
     */
    update(deltaTime) {
        // Throttle updates for performance
        const now = Date.now();
        if (now - this.lastUpdate < this.updateThrottle) {
            return;
        }
        this.lastUpdate = now;

        // Clear canvas
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);

        // Update FPS counter
        this._updateFps(deltaTime);

        // Draw enabled overlays
        if (this.config.saccadePath.enabled) {
            this._drawSaccadePath();
        }

        if (this.config.lodHeatmap.enabled) {
            this._drawLodHeatmap();
        }

        if (this.config.prefetchDisplay.enabled) {
            this._drawPrefetchDisplay();
        }

        if (this.config.attentionHeatmap.enabled) {
            this._updateAndDrawAttentionHeatmap();
        }

        if (this.config.performance.enabled) {
            this._drawPerformanceStats();
        }
    }

    /**
     * Update FPS counter
     */
    _updateFps(deltaTime) {
        this.frameCount++;
        const now = Date.now();
        const elapsed = now - this.lastFpsUpdate;

        if (elapsed >= this.config.performance.updateInterval) {
            this.fps = Math.round(this.frameCount * 1000 / elapsed);
            this.frameCount = 0;
            this.lastFpsUpdate = now;
        }
    }

    /**
     * Draw saccade path overlay
     */
    _drawSaccadePath() {
        const ctx = this.ctx;
        const config = this.config.saccadePath;
        const now = Date.now();

        ctx.save();
        ctx.strokeStyle = config.color;
        ctx.lineWidth = config.lineWidth;
        ctx.lineCap = 'round';
        ctx.lineJoin = 'round';

        // Filter out old points
        const recentPath = this.saccadePath.filter(
            point => now - point.timestamp < config.fadeTime
        );

        if (recentPath.length < 2) {
            ctx.restore();
            return;
        }

        // Draw path
        ctx.beginPath();
        for (let i = 0; i < recentPath.length; i++) {
            const point = recentPath[i];
            const pos = point.position || point.start;

            if (i === 0) {
                ctx.moveTo(pos.x, pos.y);
            } else {
                ctx.lineTo(pos.x, pos.y);
            }
        }
        ctx.stroke();

        // Draw phase indicators
        recentPath.forEach((point, i) => {
            if (point.type === 'saccade') {
                // Draw saccade start marker
                ctx.fillStyle = '#00ff00';
                ctx.beginPath();
                ctx.arc(point.start.x, point.start.y, 4, 0, Math.PI * 2);
                ctx.fill();

                // Draw saccade target marker
                ctx.fillStyle = '#ff0000';
                ctx.beginPath();
                ctx.arc(point.target.x, point.target.y, 4, 0, Math.PI * 2);
                ctx.fill();

                // Draw line between them
                ctx.strokeStyle = 'rgba(255, 255, 255, 0.5)';
                ctx.setLineDash([5, 5]);
                ctx.beginPath();
                ctx.moveTo(point.start.x, point.start.y);
                ctx.lineTo(point.target.x, point.target.y);
                ctx.stroke();
                ctx.setLineDash([]);
            }
        });

        // Draw current position
        if (this.saccadicController) {
            const state = this.saccadicController.getState();
            ctx.fillStyle = '#ffffff';
            ctx.beginPath();
            ctx.arc(state.position.x, state.position.y, 6, 0, Math.PI * 2);
            ctx.fill();

            // Draw phase indicator
            ctx.fillStyle = '#000000';
            ctx.font = '10px monospace';
            ctx.fillText(state.phase, state.position.x + 10, state.position.y);
        }

        ctx.restore();
    }

    /**
     * Draw LOD heatmap overlay
     */
    _drawLodHeatmap() {
        const ctx = this.ctx;
        const config = this.config.lodHeatmap;

        if (!this.lodSystem || !this.viewport) {
            return;
        }

        ctx.save();

        // Get current viewport bounds
        const camera = this.viewport.getCamera();
        const bounds = this.viewport.getWorldBounds();

        // Get tiles in viewport
        const tileSize = 100;
        const startTileX = Math.floor(bounds.minX / tileSize);
        const startTileY = Math.floor(bounds.minY / tileSize);
        const endTileX = Math.ceil(bounds.maxX / tileSize);
        const endTileY = Math.ceil(bounds.maxY / tileSize);

        // Draw tiles with LOD colors
        for (let tx = startTileX; tx <= endTileX; tx++) {
            for (let ty = startTileY; ty <= endTileY; ty++) {
                // Convert tile to screen coordinates
                const screenPos = this.viewport.worldToScreen(
                    tx * tileSize,
                    ty * tileSize
                );

                // Skip if outside screen
                if (screenPos.x < -tileSize || screenPos.x > this.canvas.width ||
                    screenPos.y < -tileSize || screenPos.y > this.canvas.height) {
                    continue;
                }

                // Determine LOD level for this tile
                const lodLevel = this._getTileLodLevel(tx, ty);
                const color = config.colors[lodLevel] || 'rgba(128, 128, 128, 0.3)';

                // Draw tile
                ctx.fillStyle = color;
                ctx.fillRect(
                    Math.round(screenPos.x),
                    Math.round(screenPos.y),
                    Math.round(tileSize * camera.zoom),
                    Math.round(tileSize * camera.zoom)
                );

                // Draw labels if enabled
                if (config.showLabels) {
                    ctx.fillStyle = '#ffffff';
                    ctx.font = '10px monospace';
                    ctx.fillText(
                        lodLevel,
                        screenPos.x + 2,
                        screenPos.y + 12
                    );
                }
            }
        }

        // Draw transition zones if enabled
        if (config.showTransitions && this.lodSystem.currentLevel) {
            const current = this.lodSystem.currentLevel;
            ctx.strokeStyle = 'rgba(255, 255, 255, 0.5)';
            ctx.lineWidth = 2;
            ctx.strokeRect(
                10,
                10,
                200,
                60
            );

            ctx.fillStyle = '#ffffff';
            ctx.font = '12px monospace';
            ctx.fillText(`LOD: ${current.name}`, 20, 30);
            ctx.fillText(`Zoom: ${this.lodSystem.currentZoom.toFixed(2)}x`, 20, 45);
            ctx.fillText(`Quality: ${(current.getQualityFactor() * 100).toFixed(0)}%`, 20, 60);
        }

        ctx.restore();
    }

    /**
     * Get LOD level for a tile
     */
    _getTileLodLevel(tileX, tileY) {
        if (!this.lodSystem || !this.lodSystem.currentLevel) {
            return 'full';
        }

        // Check if tile is in transition zone
        const current = this.lodSystem.currentLevel;
        return current.name || 'full';
    }

    /**
     * Draw prefetch prediction display
     */
    _drawPrefetchDisplay() {
        const ctx = this.ctx;
        const config = this.config.prefetchDisplay;

        if (!this._lastPrefetchData || !this.viewport) {
            return;
        }

        ctx.save();

        const tiles = this._lastPrefetchData.tiles;
        const camera = this.viewport.getCamera();

        // Draw each prefetched tile
        tiles.forEach(tile => {
            const screenPos = this.viewport.worldToScreen(tile.x, tile.y);

            // Skip if outside screen
            if (screenPos.x < -100 || screenPos.x > this.canvas.width + 100 ||
                screenPos.y < -100 || screenPos.y > this.canvas.height + 100) {
                return;
            }

            const screenSize = 100 * camera.zoom;

            // Draw tile bounds
            ctx.strokeStyle = config.pendingColor;
            ctx.lineWidth = 1;
            ctx.strokeRect(
                screenPos.x,
                screenPos.y,
                screenSize,
                screenSize
            );

            // Fill with semi-transparent color
            ctx.fillStyle = config.pendingColor;
            ctx.fillRect(
                screenPos.x,
                screenPos.y,
                screenSize,
                screenSize
            );

            // Show priority if enabled
            if (config.showPriority && tile.priority !== undefined) {
                ctx.fillStyle = '#ffffff';
                ctx.font = '10px monospace';
                ctx.fillText(
                    tile.priority.toFixed(2),
                    screenPos.x + 2,
                    screenPos.y + 12
                );
            }
        });

        // Draw viewport bounds if enabled
        if (config.showBounds && this.viewport) {
            const bounds = this.viewport.getWorldBounds();
            ctx.strokeStyle = 'rgba(255, 255, 0, 0.5)';
            ctx.lineWidth = 2;
            ctx.setLineDash([10, 5]);
            ctx.strokeRect(
                0,
                0,
                this.canvas.width,
                this.canvas.height
            );
            ctx.setLineDash([]);
        }

        // Draw stats
        ctx.fillStyle = '#ffffff';
        ctx.font = '12px monospace';
        ctx.fillText(
            `Prefetching: ${tiles.length} tiles`,
            10,
            this.canvas.height - 20
        );

        ctx.restore();
    }

    /**
     * Update and draw attention heatmap
     */
    _updateAndDrawAttentionHeatmap() {
        const ctx = this.ctx;
        const config = this.config.attentionHeatmap;

        // Sample current focus point
        if (this.focusTracker) {
            const focus = this.focusTracker.getCurrentFocus();
            this.attentionSamples.push({
                x: focus.x,
                y: focus.y,
                timestamp: Date.now()
            });
        }

        // Trim samples
        if (this.attentionSamples.length > config.maxSamples) {
            this.attentionSamples = this.attentionSamples.slice(-config.maxSamples);
        }

        // Decay old samples
        const now = Date.now();
        this.attentionSamples = this.attentionSamples.filter(sample => {
            const age = now - sample.timestamp;
            return age < 10000; // Keep samples for 10 seconds
        });

        // Draw heatmap
        ctx.save();

        // Create heatmap grid
        const resolution = config.resolution;
        const gridWidth = Math.ceil(this.canvas.width / resolution);
        const gridHeight = Math.ceil(this.canvas.height / resolution);
        const heatmap = new Array(gridWidth * gridHeight).fill(0);

        // Accumulate samples
        this.attentionSamples.forEach(sample => {
            const gx = Math.floor(sample.x / resolution);
            const gy = Math.floor(sample.y / resolution);
            if (gx >= 0 && gx < gridWidth && gy >= 0 && gy < gridHeight) {
                heatmap[gy * gridWidth + gx] += 1;
            }
        });

        // Normalize and draw
        const maxVal = Math.max(...heatmap, 1);
        const imageData = ctx.createImageData(this.canvas.width, this.canvas.height);
        const data = imageData.data;

        for (let y = 0; y < this.canvas.height; y++) {
            for (let x = 0; x < this.canvas.width; x++) {
                const gx = Math.floor(x / resolution);
                const gy = Math.floor(y / resolution);
                const idx = gy * gridWidth + gx;
                const intensity = heatmap[idx] / maxVal;

                if (intensity > 0) {
                    const pixelIdx = (y * this.canvas.width + x) * 4;
                    const color = this._getHeatmapColor(intensity, config.colorMap);
                    data[pixelIdx] = color.r;
                    data[pixelIdx + 1] = color.g;
                    data[pixelIdx + 2] = color.b;
                    data[pixelIdx + 3] = Math.floor(intensity * 180);
                }
            }
        }

        ctx.putImageData(imageData, 0, 0);

        // Draw focus point
        if (this.focusTracker) {
            const focus = this.focusTracker.getCurrentFocus();
            ctx.strokeStyle = '#ffffff';
            ctx.lineWidth = 2;
            ctx.beginPath();
            ctx.arc(focus.x, focus.y, 20, 0, Math.PI * 2);
            ctx.stroke();

            // Draw crosshair
            ctx.beginPath();
            ctx.moveTo(focus.x - 30, focus.y);
            ctx.lineTo(focus.x + 30, focus.y);
            ctx.moveTo(focus.x, focus.y - 30);
            ctx.lineTo(focus.x, focus.y + 30);
            ctx.stroke();
        }

        ctx.restore();
    }

    /**
     * Get heatmap color for intensity
     */
    _getHeatmapColor(intensity, colorMap) {
        switch (colorMap) {
            case 'grayscale':
                return {
                    r: Math.floor(intensity * 255),
                    g: Math.floor(intensity * 255),
                    b: Math.floor(intensity * 255)
                };
            case 'rainbow':
                // HSV to RGB conversion
                const hue = (1 - intensity) * 240; // Blue (cold) to Red (hot)
                return this._hsvToRgb(hue / 360, 1, intensity);
            case 'heat':
            default:
                // Black -> Red -> Yellow -> White
                if (intensity < 0.33) {
                    return {
                        r: Math.floor(intensity * 3 * 255),
                        g: 0,
                        b: 0
                    };
                } else if (intensity < 0.66) {
                    return {
                        r: 255,
                        g: Math.floor((intensity - 0.33) * 3 * 255),
                        b: 0
                    };
                } else {
                    return {
                        r: 255,
                        g: 255,
                        b: Math.floor((intensity - 0.66) * 3 * 255)
                    };
                }
        }
    }

    /**
     * Convert HSV to RGB
     */
    _hsvToRgb(h, s, v) {
        let r, g, b;
        const i = Math.floor(h * 6);
        const f = h * 6 - i;
        const p = v * (1 - s);
        const q = v * (1 - f * s);
        const t = v * (1 - (1 - f) * s);

        switch (i % 6) {
            case 0: r = v; g = t; b = p; break;
            case 1: r = q; g = v; b = p; break;
            case 2: r = p; g = v; b = t; break;
            case 3: r = p; g = q; b = v; break;
            case 4: r = t; g = p; b = v; break;
            case 5: r = v; g = p; b = q; break;
        }

        return {
            r: Math.floor(r * 255),
            g: Math.floor(g * 255),
            b: Math.floor(b * 255)
        };
    }

    /**
     * Draw performance stats
     */
    _drawPerformanceStats() {
        const ctx = this.ctx;
        const config = this.config.performance;

        ctx.save();

        // Background
        ctx.fillStyle = 'rgba(0, 0, 0, 0.7)';
        ctx.fillRect(10, 10, 200, 100);

        // Text
        ctx.fillStyle = '#00ff00';
        ctx.font = '12px monospace';

        let y = 30;

        if (config.showFps) {
            ctx.fillText(`FPS: ${this.fps}`, 20, y);
            y += 20;
        }

        if (config.showFrameTime) {
            ctx.fillText(`Frame: ${Math.round(1000 / this.fps)}ms`, 20, y);
            y += 20;
        }

        if (config.showMemory && performance.memory) {
            const mb = Math.round(performance.memory.usedJSHeapSize / 1048576);
            ctx.fillText(`Memory: ${mb}MB`, 20, y);
            y += 20;
        }

        // Overlay status
        ctx.fillStyle = '#ffff00';
        ctx.fillText('Overlays:', 20, y);
        y += 15;
        ctx.fillStyle = '#ffffff';
        ctx.font = '10px monospace';

        Object.keys(this.config).forEach(key => {
            const c = this.config[key];
            if (typeof c === 'object' && 'enabled' in c) {
                const status = c.enabled ? 'ON' : 'off';
                const color = c.enabled ? '#00ff00' : '#666666';
                ctx.fillStyle = color;
                ctx.fillText(`  ${key}: ${status}`, 20, y);
                y += 12;
            }
        });

        ctx.restore();
    }

    /**
     * Get current state
     */
    getState() {
        return {
            enabled: this.isEnabled,
            overlays: Object.keys(this.config).reduce((acc, key) => {
                const c = this.config[key];
                if (typeof c === 'object' && 'enabled' in c) {
                    acc[key] = c.enabled;
                }
                return acc;
            }, {}),
            fps: this.fps
        };
    }

    /**
     * Export overlay data for analysis
     */
    exportData() {
        return {
            timestamp: Date.now(),
            saccadePath: this.saccadePath,
            attentionSamples: this.attentionSamples,
            state: this.getState()
        };
    }

    /**
     * Clear all overlay data
     */
    clearData() {
        this.saccadePath = [];
        this.attentionSamples = [];
        this._lastPrefetchData = null;
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
     * Destroy the overlay system
     */
    destroy() {
        if (this._boundKeyDown) {
            window.removeEventListener('keydown', this._boundKeyDown);
        }
        if (this._boundResize) {
            window.removeEventListener('resize', this._boundResize);
        }
        if (this.canvas && this.canvas.parentNode) {
            this.canvas.parentNode.removeChild(this.canvas);
        }
        this.eventListeners.clear();
    }
}

// Export
if (typeof window !== 'undefined') {
    window.DebugOverlays = DebugOverlays;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { DebugOverlays };
}
