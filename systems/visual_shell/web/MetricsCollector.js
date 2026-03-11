/**
 * Geometry OS: MetricsCollector
 *
 * Real-time metrics collection for WordPress-Map integration health monitoring.
 * Tracks latency, sync operations, tile counts, and system events.
 * Uses a rolling window for latency samples and emits update events.
 */

class MetricsCollector {
    /**
     * Create a new MetricsCollector instance
     * @param {Object} config - Configuration options
     */
    constructor(config = {}) {
        this.config = {
            maxLatencySamples: 100,    // Max samples in rolling window
            ...config
        };

        // Rolling window for latency samples
        this.latencySamples = [];
        this.latencySum = 0;

        // Counters
        this.syncCount = 0;
        this.tileCount = 0;
        this.bufferDrops = 0;
        this.reconnectCount = 0;

        // Active latency measurements (id -> startTime)
        this.pendingMeasures = new Map();

        console.log('%c[MetricsCollector] Initialized', 'color: #00ffcc');
    }

    /**
     * Start a latency measurement
     * @param {string} id - Unique identifier for this measurement
     * @returns {number} - The start timestamp (t0)
     */
    startLatencyMeasure(id) {
        const t0 = performance.now();
        this.pendingMeasures.set(id, t0);
        return t0;
    }

    /**
     * End a latency measurement and record the result
     * @param {string} id - Unique identifier for the measurement
     * @param {number} t0 - The start timestamp returned by startLatencyMeasure
     * @returns {number} - The calculated latency in milliseconds
     */
    endLatencyMeasure(id, t0) {
        const latency = performance.now() - t0;
        this.pendingMeasures.delete(id);
        this.recordLatency(latency);
        return latency;
    }

    /**
     * Record a latency sample into the rolling window
     * @param {number} latency - Latency in milliseconds
     */
    recordLatency(latency) {
        // Add to rolling window
        this.latencySamples.push(latency);
        this.latencySum += latency;

        // Trim to max size
        if (this.latencySamples.length > this.config.maxLatencySamples) {
            const removed = this.latencySamples.shift();
            this.latencySum -= removed;
        }
    }

    /**
     * Increment the sync operation counter
     */
    recordSync() {
        this.syncCount++;
    }

    /**
     * Set the current tile count
     * @param {number} count - Number of active tiles
     */
    setTileCount(count) {
        this.tileCount = count;
    }

    /**
     * Increment the buffer drop counter
     */
    recordBufferDrop() {
        this.bufferDrops++;
    }

    /**
     * Increment the reconnect counter
     */
    recordReconnect() {
        this.reconnectCount++;
    }

    /**
     * Get a single metric value by key
     * @param {string} key - Metric name
     * @returns {*} - The metric value
     */
    getMetric(key) {
        switch (key) {
            case 'syncCount':
                return this.syncCount;
            case 'tileCount':
                return this.tileCount;
            case 'bufferDrops':
                return this.bufferDrops;
            case 'reconnectCount':
                return this.reconnectCount;
            case 'avgLatency':
                return this.getAverageLatency();
            case 'latencySamples':
                return this.latencySamples.length;
            default:
                return undefined;
        }
    }

    /**
     * Calculate the average latency from the rolling window
     * @returns {number} - Average latency in milliseconds, or 0 if no samples
     */
    getAverageLatency() {
        if (this.latencySamples.length === 0) {
            return 0;
        }
        return this.latencySum / this.latencySamples.length;
    }

    /**
     * Get all metrics as an object
     * @returns {Object} - All current metrics
     */
    getAllMetrics() {
        return {
            syncCount: this.syncCount,
            tileCount: this.tileCount,
            bufferDrops: this.bufferDrops,
            reconnectCount: this.reconnectCount,
            avgLatency: this.getAverageLatency(),
            latencySamples: this.latencySamples.length,
            timestamp: Date.now()
        };
    }

    /**
     * Emit a metrics update event
     * Dispatches 'geometryOS:metricsUpdate' CustomEvent with metrics detail
     */
    emitUpdate() {
        const metrics = this.getAllMetrics();
        window.dispatchEvent(new CustomEvent('geometryOS:metricsUpdate', {
            detail: metrics
        }));
    }

    /**
     * Reset all metrics to initial state
     */
    reset() {
        this.latencySamples = [];
        this.latencySum = 0;
        this.syncCount = 0;
        this.tileCount = 0;
        this.bufferDrops = 0;
        this.reconnectCount = 0;
        this.pendingMeasures.clear();

        console.log('%c[MetricsCollector] Reset', 'color: #00ffcc');
    }
}

// Export for testing in Node.js
if (typeof module !== 'undefined' && module.exports) {
    module.exports = MetricsCollector;
}
