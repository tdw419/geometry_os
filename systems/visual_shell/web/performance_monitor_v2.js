/**
 * PerformanceMonitor - Comprehensive performance tracking for Neural Heatmap
 *
 * Phase 2.1.1 Implementation
 *
 * Tracks:
 * - Frame rate (FPS)
 * - Memory usage (where available)
 * - Render time per frame
 * - GPU memory (WebGL)
 * - Custom metrics
 *
 * @class PerformanceMonitor
 */

class PerformanceMonitor {
    /**
     * Create a new PerformanceMonitor
     * @param {Object} options - Configuration options
     * @param {Array<string>} options.metrics - Metrics to track ['fps', 'memory', 'gpu', 'latency']
     * @param {boolean} options.alerts - Enable threshold alerts (default: true)
     * @param {number} options.historySize - Number of samples to keep (default: 1000)
     * @param {Object} options.thresholds - Alert thresholds
     * @param {number} options.thresholds.minFps - Minimum acceptable FPS (default: 30)
     * @param {number} options.thresholds.maxMemory - Max memory MB (default: 500)
     * @param {number} options.thresholds.maxRenderTime - Max render time ms (default: 16)
     */
    constructor(options = {}) {
        this.options = {
            metrics: ['fps', 'memory', 'gpu', 'latency'],
            alerts: true,
            historySize: 1000,
            thresholds: {
                minFps: 30,
                maxMemory: 500,
                maxRenderTime: 16
            },
            ...options
        };

        // Sample history: Map<metricName, Array<samples>>
        this.history = new Map();
        this._initializeMetrics();

        // Current values
        this.current = {
            fps: 0,
            memory: 0,
            gpuMemory: 0,
            renderTime: 0,
            custom: {}
        };

        // Timing
        this._frameCount = 0;
        this._lastFpsUpdate = performance.now();
        this._frameStartTime = 0;

        // Alert state
        this._alertState = new Map();
        this._alertCallbacks = [];

        // Memory API
        this._memoryAPI = null;
        this._detectMemoryAPI();

        // WebGL context (for GPU memory)
        this._glContext = null;

        console.log('[PerformanceMonitor] Initialized tracking:', this.options.metrics);
    }

    /**
     * Initialize metric histories
     * @private
     */
    _initializeMetrics() {
        const baseMetrics = ['fps', 'memory', 'gpuMemory', 'renderTime', 'latency'];
        for (const metric of baseMetrics) {
            this.history.set(metric, []);
        }
    }

    /**
     * Detect available memory API
     * @private
     */
    _detectMemoryAPI() {
        // Try Chrome memory API
        if (performance.memory) {
            this._memoryAPI = performance.memory;
            console.log('[PerformanceMonitor] Using performance.memory API');
        }
        // Try Firefox memory API (experimental)
        else if (window.console && console.memory) {
            this._memoryAPI = console.memory;
            console.log('[PerformanceMonitor] Using console.memory API');
        }
    }

    /**
     * Set WebGL context for GPU memory tracking
     * @param {WebGLRenderingContext} gl - WebGL context
     */
    setWebGLContext(gl) {
        this._glContext = gl;

        // Try to get memory info
        if (gl.getExtension('WEBGL_memory_info')) {
            const memExt = gl.getExtension('WEBGL_memory_info');
            console.log('[PerformanceMonitor] WebGL memory info available');
        }
    }

    /**
     * Mark start of frame
     */
    beginFrame() {
        this._frameStartTime = performance.now();
    }

    /**
     * Mark end of frame and update metrics
     */
    endFrame() {
        if (this._frameStartTime === 0) return;

        const frameTime = performance.now() - this._frameStartTime;
        this.recordMetric('renderTime', frameTime);

        this._frameCount++;
        const now = performance.now();

        // Update FPS every second
        if (now - this._lastFpsUpdate >= 1000) {
            const fps = this._frameCount;
            this.recordMetric('fps', fps);
            this.current.fps = fps;
            this._frameCount = 0;
            this._lastFpsUpdate = now;
        }

        // Update memory
        if (this.options.metrics.includes('memory')) {
            this._updateMemory();
        }

        // Update GPU memory
        if (this.options.metrics.includes('gpu') && this._glContext) {
            this._updateGPUMemory();
        }

        this._frameStartTime = 0;
    }

    /**
     * Update memory metric
     * @private
     */
    _updateMemory() {
        if (!this._memoryAPI) {
            this.current.memory = 0;
            return;
        }

        const usedJSHeapSize = this._memoryAPI.usedJSHeapSize || 0;
        const memoryMB = usedJSHeapSize / (1024 * 1024);
        this.recordMetric('memory', memoryMB);
        this.current.memory = memoryMB;

        // Check threshold
        if (this.options.alerts && memoryMB > this.options.thresholds.maxMemory) {
            this._triggerAlert('memory', memoryMB, this.options.thresholds.maxMemory);
        }
    }

    /**
     * Update GPU memory metric
     * @private
     */
    _updateGPUMemory() {
        if (!this._glContext) return;

        // Try to get GPU memory info
        let gpuMemory = 0;
        const debugInfo = this._glContext.getExtension('WEBGL_debug_renderer_info');

        if (debugInfo) {
            // Store renderer info (not actual memory usage, but useful)
            this.gpuRenderer = this._glContext.getParameter(debugInfo.UNMASKED_RENDERER_WEBGL);
        }

        // Actual memory tracking requires specific extensions
        const memInfo = this._glContext.getExtension('WEBGL_memory_info');
        if (memInfo) {
            // @ts-ignore - extension specific
            gpuMemory = this._glContext.getParameter(memInfo.MEMORY_INFO_CURRENT_AVAILABLE_MEMORY);
        }

        this.recordMetric('gpuMemory', gpuMemory);
        this.current.gpuMemory = gpuMemory;
    }

    /**
     * Record a custom metric value
     * @param {string} name - Metric name
     * @param {number} value - Metric value
     */
    recordMetric(name, value) {
        if (!this.history.has(name)) {
            this.history.set(name, []);
        }

        const samples = this.history.get(name);
        samples.push({ value, timestamp: performance.now() });

        // Trim to history size
        while (samples.length > this.options.historySize) {
            samples.shift();
        }

        // Check thresholds for known metrics
        if (this.options.alerts) {
            this._checkThresholds(name, value);
        }
    }

    /**
     * Check metric against thresholds
     * @private
     */
    _checkThresholds(name, value) {
        if (name === 'fps' && value < this.options.thresholds.minFps) {
            this._triggerAlert('fps', value, this.options.thresholds.minFps, 'below');
        }
        if (name === 'renderTime' && value > this.options.thresholds.maxRenderTime) {
            this._triggerAlert('renderTime', value, this.options.thresholds.maxRenderTime);
        }
    }

    /**
     * Trigger an alert
     * @private
     */
    _triggerAlert(metric, value, threshold, direction = 'above') {
        const alertKey = `${metric}_${direction}`;
        const now = Date.now();

        // Debounce alerts (same alert once per minute)
        const lastAlert = this._alertState.get(alertKey);
        if (lastAlert && now - lastAlert < 60000) {
            return;
        }

        this._alertState.set(alertKey, now);

        const alert = {
            metric,
            value,
            threshold,
            direction,
            timestamp: now
        };

        console.warn(`[PerformanceMonitor] Alert: ${metric} is ${direction} threshold`, alert);

        for (const callback of this._alertCallbacks) {
            try {
                callback(alert);
            } catch (e) {
                console.error('[PerformanceMonitor] Alert callback error:', e);
            }
        }
    }

    /**
     * Subscribe to alerts
     * @param {Function} callback - Alert callback
     */
    onAlert(callback) {
        this._alertCallbacks.push(callback);
    }

    /**
     * Get statistics for a metric
     * @param {string} metricName - Name of metric
     * @returns {Object|null} Statistics or null if metric not found
     */
    getStats(metricName) {
        const samples = this.history.get(metricName);
        if (!samples || samples.length === 0) return null;

        const values = samples.map(s => s.value);

        // Sort for percentiles
        const sorted = [...values].sort((a, b) => a - b);

        return {
            count: values.length,
            min: sorted[0],
            max: sorted[sorted.length - 1],
            avg: values.reduce((a, b) => a + b, 0) / values.length,
            p50: sorted[Math.floor(sorted.length * 0.5)],
            p95: sorted[Math.floor(sorted.length * 0.95)],
            p99: sorted[Math.floor(sorted.length * 0.99)],
            current: values[values.length - 1]
        };
    }

    /**
     * Get all statistics
     * @returns {Object} All metric statistics
     */
    getAllStats() {
        const stats = {};
        for (const [name] of this.history) {
            stats[name] = this.getStats(name);
        }
        return stats;
    }

    /**
     * Get recent history for a metric
     * @param {string} metricName - Metric name
     * @param {number} count - Number of samples (default: 100)
     * @returns {Array} Recent samples
     */
    getHistory(metricName, count = 100) {
        const samples = this.history.get(metricName);
        if (!samples) return [];
        return samples.slice(-count);
    }

    /**
     * Create a snapshot of current state
     * @returns {Object} Performance snapshot
     */
    snapshot() {
        return {
            timestamp: performance.now(),
            current: { ...this.current },
            stats: this.getAllStats()
        };
    }

    /**
     * Reset all metrics
     */
    reset() {
        for (const samples of this.history.values()) {
            samples.length = 0;
        }
        this._alertState.clear();
        console.log('[PerformanceMonitor] Reset');
    }

    /**
     * Destroy monitor
     */
    destroy() {
        this.history.clear();
        this._alertCallbacks.length = 0;
        this._alertState.clear();
    }
}

// Export
if (typeof window !== 'undefined') {
    window.PerformanceMonitor = PerformanceMonitor;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PerformanceMonitor };
}
