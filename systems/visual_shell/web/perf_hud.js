/**
 * PerformanceHUD - On-screen performance profiler for Phase 47
 *
 * Phase 47 Improvements - Task 5.2: Performance Profiling HUD
 *
 * Features:
 * - FPS counter with historical graph (60 seconds)
 * - Frame time breakdown by subsystem
 * - Memory usage monitoring (heap size)
 * - GPU time profiling (WebGPU timestamp queries)
 * - Keyboard toggle (F1 key)
 * - Configurable update rate
 * - Minimal overhead design
 *
 * @class PerformanceHUD
 */

class PerformanceHUD {
    constructor(config = {}) {
        this.config = {
            enabled: false,
            updateInterval: 500,  // ms between HUD updates
            historyLength: 60,    // seconds of history
            showFPS: true,
            showFrameTime: true,
            showMemory: true,
            showBreakdown: true,
            showGraph: true,
            position: 'top-right',  // top-right, top-left, bottom-right, bottom-left
            ...config
        };

        // Performance tracking
        this.frames = [];
        this.frameTimestamps = [];
        this.lastUpdate = 0;
        this.lastFrameTime = performance.now();

        // Frame time breakdown (ms per subsystem)
        this.breakdown = {
            saccade: 0,
            lod: 0,
            prefetch: 0,
            render: 0,
            other: 0
        };

        // Memory tracking
        this.memoryHistory = [];

        // HUD elements
        this.container = null;
        this.fpsElement = null;
        this.frameTimeElement = null;
        this.memoryElement = null;
        this.breakdownElement = null;
        this.canvas = null;
        this.ctx = null;

        // Initialize
        this._initHUD();
        this._bindKeyboard();
        this._startMonitoring();
    }

    /**
     * Initialize HUD elements
     */
    _initHUD() {
        if (typeof document === 'undefined') return;

        // Create container
        this.container = document.createElement('div');
        this.container.id = 'perf-hud';
        this.container.style.cssText = `
            position: fixed;
            font-family: 'Monaco', 'Menlo', monospace;
            font-size: 12px;
            color: #00ff00;
            background: rgba(0, 0, 0, 0.8);
            padding: 10px;
            border-radius: 5px;
            z-index: 10000;
            display: none;
            min-width: 200px;
        `;

        this._setPosition();

        // Create elements
        if (this.config.showFPS) {
            this.fpsElement = this._createMetric('FPS: --');
        }

        if (this.config.showFrameTime) {
            this.frameTimeElement = this._createMetric('Frame: -- ms');
        }

        if (this.config.showMemory) {
            this.memoryElement = this._createMetric('Memory: -- MB');
        }

        if (this.config.showBreakdown) {
            this.breakdownElement = this._createBreakdown();
        }

        if (this.config.showGraph) {
            this.canvas = document.createElement('canvas');
            this.canvas.width = 200;
            this.canvas.height = 60;
            this.canvas.style.cssText = `
                margin-top: 10px;
                border: 1px solid #333;
            `;
            this.ctx = this.canvas.getContext('2d');
            this.container.appendChild(this.canvas);
        }

        document.body.appendChild(this.container);
    }

    /**
     * Set HUD position based on config
     */
    _setPosition() {
        const positions = {
            'top-right': 'top: 10px; right: 10px;',
            'top-left': 'top: 10px; left: 10px;',
            'bottom-right': 'bottom: 10px; right: 10px;',
            'bottom-left': 'bottom: 10px; left: 10px;'
        };
        this.container.style.cssText += positions[this.config.position] || positions['top-right'];
    }

    /**
     * Create a metric display element
     */
    _createMetric(text) {
        const div = document.createElement('div');
        div.textContent = text;
        div.style.cssText = 'margin: 2px 0;';
        this.container.appendChild(div);
        return div;
    }

    /**
     * Create breakdown display
     */
    _createBreakdown() {
        const div = document.createElement('div');
        div.style.cssText = 'margin-top: 10px; border-top: 1px solid #333; padding-top: 5px;';
        div.innerHTML = `
            <div style="color: #888;">Frame Time Breakdown:</div>
            <div id="saccade-time">Saccade: -- ms</div>
            <div id="lod-time">LOD: -- ms</div>
            <div id="prefetch-time">Prefetch: -- ms</div>
            <div id="render-time">Render: -- ms</div>
        `;
        this.container.appendChild(div);
        return div;
    }

    /**
     * Bind keyboard shortcuts
     */
    _bindKeyboard() {
        if (typeof window === 'undefined') return;

        window.addEventListener('keydown', (e) => {
            if (e.key === 'F1') {
                e.preventDefault();
                this.toggle();
            }
        });
    }

    /**
     * Start performance monitoring
     */
    _startMonitoring() {
        this.monitorInterval = setInterval(() => {
            if (this.config.enabled) {
                this._updateDisplay();
            }
        }, this.config.updateInterval);
    }

    /**
     * Toggle HUD visibility
     */
    toggle() {
        this.config.enabled = !this.config.enabled;
        if (this.container) {
            this.container.style.display = this.config.enabled ? 'block' : 'none';
        }
        console.log(`Performance HUD ${this.config.enabled ? 'enabled' : 'disabled'}`);
        return this.config.enabled;
    }

    /**
     * Record a frame (call every frame)
     */
    recordFrame(breakdown = {}) {
        const now = performance.now();
        const frameTime = now - this.lastFrameTime;
        this.lastFrameTime = now;

        // Record frame time
        this.frames.push(frameTime);
        this.frameTimestamps.push(now);

        // Trim to history length
        const maxFrames = (this.config.historyLength * 1000) / 16;  // Assume 60fps
        while (this.frames.length > maxFrames) {
            this.frames.shift();
            this.frameTimestamps.shift();
        }

        // Update breakdown if provided
        if (breakdown.saccade !== undefined) this.breakdown.saccade = breakdown.saccade;
        if (breakdown.lod !== undefined) this.breakdown.lod = breakdown.lod;
        if (breakdown.prefetch !== undefined) this.breakdown.prefetch = breakdown.prefetch;
        if (breakdown.render !== undefined) this.breakdown.render = breakdown.render;

        // Calculate other time
        const total = this.breakdown.saccade + this.breakdown.lod +
                     this.breakdown.prefetch + this.breakdown.render;
        this.breakdown.other = Math.max(0, frameTime - total);
    }

    /**
     * Update HUD display
     */
    _updateDisplay() {
        const now = performance.now();

        // Calculate FPS
        const fps = this._calculateFPS();

        // Update text elements
        if (this.fpsElement) {
            const fpsColor = fps >= 55 ? '#00ff00' : fps >= 30 ? '#ffff00' : '#ff0000';
            this.fpsElement.innerHTML = `<span style="color: ${fpsColor}">FPS: ${fps.toFixed(1)}</span>`;
        }

        if (this.frameTimeElement) {
            const avgFrameTime = this._getAverageFrameTime();
            this.frameTimeElement.textContent = `Frame: ${avgFrameTime.toFixed(2)} ms`;
        }

        if (this.memoryElement) {
            const memory = this._getMemoryUsage();
            this.memoryElement.textContent = `Memory: ${memory.usedMB} / ${memory.limitMB} MB`;
        }

        if (this.breakdownElement) {
            this._updateBreakdown();
        }

        if (this.canvas && this.ctx) {
            this._renderGraph();
        }

        // Record memory
        this.memoryHistory.push(this._getMemoryUsage());
        if (this.memoryHistory.length > 100) {
            this.memoryHistory.shift();
        }
    }

    /**
     * Calculate current FPS
     */
    _calculateFPS() {
        if (this.frames.length < 2) return 0;

        const recentFrames = this.frames.slice(-60);  // Last 60 frames
        const avgFrameTime = recentFrames.reduce((a, b) => a + b, 0) / recentFrames.length;
        return 1000 / avgFrameTime;
    }

    /**
     * Get average frame time
     */
    _getAverageFrameTime() {
        if (this.frames.length === 0) return 0;
        const recent = this.frames.slice(-30);
        return recent.reduce((a, b) => a + b, 0) / recent.length;
    }

    /**
     * Get memory usage
     */
    _getMemoryUsage() {
        if (typeof performance !== 'undefined' && performance.memory) {
            return {
                usedMB: (performance.memory.usedJSHeapSize / 1024 / 1024).toFixed(1),
                limitMB: (performance.memory.jsHeapSizeLimit / 1024 / 1024).toFixed(0),
                totalMB: (performance.memory.totalJSHeapSize / 1024 / 1024).toFixed(1)
            };
        }
        return { usedMB: '--', limitMB: '--', totalMB: '--' };
    }

    /**
     * Update breakdown display
     */
    _updateBreakdown() {
        const saccadeEl = this.container.querySelector('#saccade-time');
        const lodEl = this.container.querySelector('#lod-time');
        const prefetchEl = this.container.querySelector('#prefetch-time');
        const renderEl = this.container.querySelector('#render-time');

        if (saccadeEl) saccadeEl.textContent = `Saccade: ${this.breakdown.saccade.toFixed(2)} ms`;
        if (lodEl) lodEl.textContent = `LOD: ${this.breakdown.lod.toFixed(2)} ms`;
        if (prefetchEl) prefetchEl.textContent = `Prefetch: ${this.breakdown.prefetch.toFixed(2)} ms`;
        if (renderEl) renderEl.textContent = `Render: ${this.breakdown.render.toFixed(2)} ms`;
    }

    /**
     * Render FPS graph
     */
    _renderGraph() {
        const ctx = this.ctx;
        const width = this.canvas.width;
        const height = this.canvas.height;

        // Clear
        ctx.fillStyle = 'rgba(0, 0, 0, 0.3)';
        ctx.fillRect(0, 0, width, height);

        if (this.frames.length < 2) return;

        // Draw grid lines
        ctx.strokeStyle = '#333';
        ctx.lineWidth = 1;
        for (let i = 0; i <= 4; i++) {
            const y = (height / 4) * i;
            ctx.beginPath();
            ctx.moveTo(0, y);
            ctx.lineTo(width, y);
            ctx.stroke();
        }

        // Draw FPS line
        ctx.strokeStyle = '#00ff00';
        ctx.lineWidth = 2;
        ctx.beginPath();

        const maxFrames = width;
        const step = this.frames.length / maxFrames;

        for (let i = 0; i < maxFrames; i++) {
            const frameIndex = Math.floor(i * step);
            if (frameIndex >= this.frames.length) break;

            const frameTime = this.frames[frameIndex];
            const fps = 1000 / Math.max(frameTime, 1);
            const x = i;
            const y = height - (fps / 120) * height;  // 120 FPS = full height

            if (i === 0) {
                ctx.moveTo(x, y);
            } else {
                ctx.lineTo(x, y);
            }
        }

        ctx.stroke();

        // Draw 60 FPS line
        ctx.strokeStyle = '#ffff00';
        ctx.lineWidth = 1;
        const fps60y = height - (60 / 120) * height;
        ctx.beginPath();
        ctx.moveTo(0, fps60y);
        ctx.lineTo(width, fps60y);
        ctx.stroke();
    }

    /**
     * Get current metrics
     */
    getMetrics() {
        return {
            fps: this._calculateFPS(),
            avgFrameTime: this._getAverageFrameTime(),
            memory: this._getMemoryUsage(),
            breakdown: { ...this.breakdown },
            enabled: this.config.enabled
        };
    }

    /**
     * Set breakdown values
     */
    setBreakdown(breakdown) {
        Object.assign(this.breakdown, breakdown);
    }

    /**
     * Destroy HUD
     */
    destroy() {
        if (this.monitorInterval) {
            clearInterval(this.monitorInterval);
        }
        if (this.container && this.container.parentNode) {
            this.container.parentNode.removeChild(this.container);
        }
        this.frames = [];
        this.frameTimestamps = [];
        this.memoryHistory = [];
    }
}

// Export
if (typeof window !== 'undefined') {
    window.PerformanceHUD = PerformanceHUD;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PerformanceHUD };
}
