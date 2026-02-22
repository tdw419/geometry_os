/**
 * TemporalAnalyzer - Detect temporal patterns in neural activity
 *
 * Identifies periodic patterns, trends, and state changes in
 * neural activity over time using signal processing techniques.
 *
 * Part of: Neural Heatmap Phase 2.1.4 - Advanced Correlation Analytics
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-1-4-correlation-analytics.md
 *
 * Phase 2.2: Web Workers Performance Optimization
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-2-web-workers.md
 */

class TemporalAnalyzer {
    /**
     * Create a new TemporalAnalyzer
     * @param {Object} options - Configuration options
     * @param {number} options.historySize - Maximum events to store (default: 1000)
     * @param {number} options.minPatternLength - Minimum samples for pattern detection (default: 10)
     * @param {number} options.autocorrLag - Maximum lag for autocorrelation (default: 100)
     */
    constructor(options = {}) {
        this.options = {
            historySize: 1000,
            minPatternLength: 10,
            autocorrLag: 100,
            stateChangeThreshold: 0.5,
            enableWorkers: true, // Enable Web Workers for parallel processing
            ...options
        };

        // Activity timeline: Array<{timestamp, modelId, intensity, location, layer}>
        this.timeline = [];

        // Per-model timelines for faster access
        this.modelTimelines = new Map();

        // Detected patterns cache
        this.patternsCache = new Map();
        this.cacheExpiry = 5000; // 5 seconds
        this.lastCacheClear = 0;

        // Statistics
        this.stats = {
            totalEvents: 0,
            patternsDetected: 0,
            stateChangesDetected: 0
        };

        // Worker manager for parallel processing
        this.workerManager = null;

        // Initialize workers if enabled and available
        if (this.options.enableWorkers && typeof WorkerManager !== 'undefined') {
            try {
                this.workerManager = new WorkerManager({
                    maxWorkers: 4,
                    minWorkers: 2,
                    enableFallback: true
                });

                // Sync timeline to workers
                this._syncTimelineToWorkers();

                console.log('[TemporalAnalyzer] Initialized with Web Workers support');
            } catch (error) {
                console.warn('[TemporalAnalyzer] Failed to initialize workers:', error);
                this.workerManager = null;
            }
        } else {
            console.log('[TemporalAnalyzer] Initialized (synchronous mode)');
        }
    }

    /**
     * Record activity event
     * @param {string} modelId - Model identifier
     * @param {number} intensity - Activity intensity (0-1)
     * @param {Object} location - Spatial location {x, y}
     * @param {string} layer - Layer name (optional)
     * @param {number} timestamp - Event timestamp
     */
    recordEvent(modelId, intensity, location, layer = null, timestamp = performance.now()) {
        const event = {
            timestamp,
            modelId,
            intensity,
            location: { ...location },
            layer
        };

        this.timeline.push(event);

        // Add to per-model timeline
        if (!this.modelTimelines.has(modelId)) {
            this.modelTimelines.set(modelId, []);
        }
        this.modelTimelines.get(modelId).push(event);

        // Trim histories
        if (this.timeline.length > this.options.historySize) {
            const removed = this.timeline.shift();
            this._trimModelTimeline(removed.modelId);
        }

        this.stats.totalEvents++;
        this._invalidateCache();

        // Sync to workers if available
        if (this.workerManager && this.workerManager.isAvailable()) {
            this.workerManager.updateWorkerData('temporal', 'add_event', {
                modelId,
                intensity,
                location,
                layer,
                timestamp
            });
        }
    }

    /**
     * Record batch of events
     * @param {Array} events - Array of event objects
     */
    recordBatch(events) {
        for (const event of events) {
            this.recordEvent(
                event.modelId,
                event.intensity,
                event.location,
                event.layer,
                event.timestamp
            );
        }
    }

    /**
     * Detect periodic patterns using autocorrelation
     * @param {string} modelId - Model to analyze
     * @param {string} layer - Optional layer filter
     * @returns {Promise<Array>} Detected periodic patterns
     */
    async detectPeriodicPatterns(modelId, layer = null) {
        if (this.workerManager && this.workerManager.isAvailable()) {
            try {
                const patterns = await this.workerManager.detectPeriodicPatterns(modelId, layer);
                if (patterns && patterns.length > 0) {
                    return patterns;
                }
            } catch (error) {
                console.warn('[TemporalAnalyzer] Worker detectPeriodicPatterns failed:', error);
                // Fall through to synchronous implementation
            }
        }

        // Synchronous implementation (original)
        const events = this._getFilteredEvents(modelId, layer);
        if (events.length < this.options.minPatternLength) {
            return [];
        }

        // Extract intensity sequence
        const intensities = events.map(e => e.intensity);

        // Compute autocorrelation
        const autocorr = this._computeAutocorrelation(intensities);

        // Find peaks in autocorrelation (periodic patterns)
        const periods = this._findPeriods(autocorr);

        return periods.map(period => ({
            type: 'periodic',
            period: period.period,
            frequency: 1000 / period.period, // Hz assuming ms timestamps
            confidence: period.strength,
            phase: period.phase,
            modelId: modelId,
            layer: layer,
            sampleSize: intensities.length,
            detectedAt: performance.now()
        }));
    }

    /**
     * Detect trends (increasing/decreasing activity)
     * @param {string} modelId - Model to analyze
     * @param {string} layer - Optional layer filter
     * @returns {Promise<Array>} Detected trends
     */
    async detectTrends(modelId, layer = null) {
        if (this.workerManager && this.workerManager.isAvailable()) {
            try {
                const trends = await this.workerManager.detectTrends(modelId, layer);
                if (trends && trends.length > 0) {
                    return trends;
                }
            } catch (error) {
                console.warn('[TemporalAnalyzer] Worker detectTrends failed:', error);
                // Fall through to synchronous implementation
            }
        }

        // Synchronous implementation
        const events = this._getFilteredEvents(modelId, layer);
        if (events.length < 20) {
            return [];
        }

        const intensities = events.map(e => e.intensity);
        const slope = this._computeLinearSlope(intensities);
        const r2 = this._computeR2(intensities, slope);

        return [{
            type: 'trend',
            direction: slope > 0.01 ? 'increasing' : slope < -0.01 ? 'decreasing' : 'stable',
            slope: slope,
            intercept: this._computeMean(intensities) - slope * (intensities.length - 1) / 2,
            r2: r2,
            confidence: Math.min(Math.abs(slope) * 10, 1),
            modelId: modelId,
            layer: layer,
            sampleSize: intensities.length,
            detectedAt: performance.now()
        }];
    }

    /**
     * Detect state changes (sudden activity shifts)
     * @param {string} modelId - Model to analyze
     * @param {number} threshold - Minimum change to trigger (default: from options)
     * @param {string} layer - Optional layer filter
     * @returns {Array} Detected state changes
     */
    detectStateChanges(modelId, threshold = null, layer = null) {
        const events = this._getFilteredEvents(modelId, layer);
        const changes = [];
        const thresh = threshold ?? this.options.stateChangeThreshold;

        for (let i = 1; i < events.length; i++) {
            const delta = events[i].intensity - events[i-1].intensity;

            if (Math.abs(delta) > thresh) {
                changes.push({
                    type: 'state_change',
                    timestamp: events[i].timestamp,
                    fromIntensity: events[i-1].intensity,
                    toIntensity: events[i].intensity,
                    delta: delta,
                    direction: delta > 0 ? 'increase' : 'decrease',
                    magnitude: Math.abs(delta),
                    location: events[i].location,
                    layer: events[i].layer,
                    modelId: modelId
                });

                this.stats.stateChangesDetected++;
            }
        }

        return changes;
    }

    /**
     * Detect bursts of activity
     * @param {string} modelId - Model to analyze
     * @param {number} windowSize - Time window in ms (default: 1000)
     * @param {number} threshold - Intensity threshold (default: 0.5)
     * @returns {Promise<Array>} Detected bursts
     */
    async detectBursts(modelId, windowSize = 1000, threshold = 0.5) {
        if (this.workerManager && this.workerManager.isAvailable()) {
            try {
                const bursts = await this.workerManager.detectBursts(modelId, windowSize, threshold);
                if (bursts) {
                    return bursts;
                }
            } catch (error) {
                console.warn('[TemporalAnalyzer] Worker detectBursts failed:', error);
                // Fall through to synchronous implementation
            }
        }

        // Synchronous implementation
        const events = this.modelTimelines.get(modelId) || [];
        if (events.length < 3) return [];

        const bursts = [];
        let burstStart = null;
        let burstEvents = [];

        for (let i = 0; i < events.length; i++) {
            const event = events[i];

            if (event.intensity > threshold) {
                if (burstStart === null) {
                    burstStart = event.timestamp;
                    burstEvents = [event];
                } else {
                    // Check if within window
                    if (event.timestamp - burstStart <= windowSize) {
                        burstEvents.push(event);
                    } else {
                        // End previous burst
                        if (burstEvents.length >= 3) {
                            bursts.push({
                                type: 'burst',
                                startTime: burstStart,
                                endTime: burstEvents[burstEvents.length - 1].timestamp,
                                duration: burstEvents[burstEvents.length - 1].timestamp - burstStart,
                                eventCount: burstEvents.length,
                                avgIntensity: burstEvents.reduce((s, e) => s + e.intensity, 0) / burstEvents.length,
                                maxIntensity: Math.max(...burstEvents.map(e => e.intensity)),
                                events: [...burstEvents],
                                modelId: modelId
                            });
                        }
                        burstStart = event.timestamp;
                        burstEvents = [event];
                    }
                }
            } else if (burstStart !== null && event.timestamp - burstStart > windowSize) {
                // End burst due to timeout
                if (burstEvents.length >= 3) {
                    bursts.push({
                        type: 'burst',
                        startTime: burstStart,
                        endTime: burstEvents[burstEvents.length - 1].timestamp,
                        duration: burstEvents[burstEvents.length - 1].timestamp - burstStart,
                        eventCount: burstEvents.length,
                        avgIntensity: burstEvents.reduce((s, e) => s + e.intensity, 0) / burstEvents.length,
                        maxIntensity: Math.max(...burstEvents.map(e => e.intensity)),
                        events: [...burstEvents],
                        modelId: modelId
                    });
                }
                burstStart = null;
                burstEvents = [];
            }
        }

        // Check for ongoing burst
        if (burstEvents.length >= 3) {
            bursts.push({
                type: 'burst',
                startTime: burstStart,
                endTime: burstEvents[burstEvents.length - 1].timestamp,
                duration: burstEvents[burstEvents.length - 1].timestamp - burstStart,
                eventCount: burstEvents.length,
                avgIntensity: burstEvents.reduce((s, e) => s + e.intensity, 0) / burstEvents.length,
                maxIntensity: Math.max(...burstEvents.map(e => e.intensity)),
                events: [...burstEvents],
                modelId: modelId
            });
        }

        return bursts;
    }

    /**
     * Get activity summary over time windows
     * @param {string} modelId - Model to analyze
     * @param {number} windowSize - Events per window (default: 100)
     * @returns {Array} Array of window summaries
     */
    getTimeWindows(modelId, windowSize = 100) {
        const events = this.modelTimelines.get(modelId) || [];
        const windows = [];

        for (let i = 0; i < events.length; i += windowSize) {
            const windowEvents = events.slice(i, i + windowSize);

            if (windowEvents.length === 0) continue;

            const intensities = windowEvents.map(e => e.intensity);

            windows.push({
                index: Math.floor(i / windowSize),
                start: windowEvents[0].timestamp,
                end: windowEvents[windowEvents.length - 1].timestamp,
                duration: windowEvents[windowEvents.length - 1].timestamp - windowEvents[0].timestamp,
                eventCount: windowEvents.length,
                avgIntensity: this._computeMean(intensities),
                maxIntensity: Math.max(...intensities),
                minIntensity: Math.min(...intensities),
                stdDev: this._computeStdDev(intensities)
            });
        }

        return windows;
    }

    /**
     * Get complete temporal analysis for a model
     * @param {string} modelId - Model to analyze
     * @returns {Object} Complete analysis with all pattern types
     */
    analyzeModel(modelId) {
        return {
            modelId: modelId,
            periodic: this.detectPeriodicPatterns(modelId),
            trends: this.detectTrends(modelId),
            stateChanges: this.detectStateChanges(modelId),
            bursts: this.detectBursts(modelId),
            timeWindows: this.getTimeWindows(modelId),
            summary: this._getModelSummary(modelId),
            analyzedAt: performance.now()
        };
    }

    /**
     * Get events for a specific model, optionally filtered by layer
     * @private
     */
    _getFilteredEvents(modelId, layer) {
        const events = this.modelTimelines.get(modelId) || [];
        if (layer) {
            return events.filter(e => e.layer === layer);
        }
        return events;
    }

    /**
     * Compute autocorrelation of a sequence
     * @private
     */
    _computeAutocorrelation(sequence) {
        const n = sequence.length;
        const maxLag = Math.min(this.options.autocorrLag, Math.floor(n / 2));
        const mean = this._computeMean(sequence);
        const variance = this._computeVariance(sequence, mean);

        if (variance === 0) {
            return new Array(maxLag + 1).fill(0);
        }

        const autocorr = [];
        autocorr[0] = 1; // Lag 0 is always 1

        for (let lag = 1; lag <= maxLag; lag++) {
            let sum = 0;
            for (let i = 0; i < n - lag; i++) {
                sum += (sequence[i] - mean) * (sequence[i + lag] - mean);
            }
            autocorr[lag] = sum / ((n - lag) * variance);
        }

        return autocorr;
    }

    /**
     * Find periods in autocorrelation sequence
     * @private
     */
    _findPeriods(autocorr) {
        const periods = [];
        const threshold = 0.3; // Minimum correlation to be considered a peak

        for (let lag = 2; lag < autocorr.length; lag++) {
            if (autocorr[lag] > threshold) {
                // Check if this is a local maximum
                if (autocorr[lag] > autocorr[lag - 1] && autocorr[lag] > autocorr[lag + 1]) {
                    // Estimate phase from nearby values
                    const phase = Math.atan2(
                        autocorr[lag + 1] - autocorr[lag - 1],
                        2 // Simplified denominator
                    );

                    periods.push({
                        period: lag,
                        strength: autocorr[lag],
                        phase: phase
                    });

                    this.stats.patternsDetected++;
                }
            }
        }

        return periods;
    }

    /**
     * Trim per-model timeline when main timeline is trimmed
     * @private
     */
    _trimModelTimeline(modelId) {
        const timeline = this.modelTimelines.get(modelId);
        if (timeline && timeline.length > 0) {
            timeline.shift();
        }
    }

    /**
     * Invalidate pattern cache
     * @private
     */
    _invalidateCache() {
        const now = performance.now();
        if (now - this.lastCacheClear > this.cacheExpiry) {
            this.patternsCache.clear();
            this.lastCacheClear = now;
        }
    }

    /**
     * Generate summary for a model
     * @private
     */
    _getModelSummary(modelId) {
        const events = this.modelTimelines.get(modelId) || [];
        if (events.length === 0) {
            return null;
        }

        const intensities = events.map(e => e.intensity);

        return {
            totalEvents: events.length,
            avgIntensity: this._computeMean(intensities),
            maxIntensity: Math.max(...intensities),
            minIntensity: Math.min(...intensities),
            stdDev: this._computeStdDev(intensities),
            timeSpan: events[events.length - 1].timestamp - events[0].timestamp,
            layers: [...new Set(events.map(e => e.layer).filter(Boolean))]
        };
    }

    /**
     * Compute mean of array
     * @private
     */
    _computeMean(values) {
        if (values.length === 0) return 0;
        return values.reduce((s, v) => s + v, 0) / values.length;
    }

    /**
     * Compute variance
     * @private
     */
    _computeVariance(values, mean) {
        if (values.length === 0) return 0;
        return values.reduce((s, v) => s + (v - mean) ** 2, 0) / values.length;
    }

    /**
     * Compute standard deviation
     * @private
     */
    _computeStdDev(values) {
        const mean = this._computeMean(values);
        return Math.sqrt(this._computeVariance(values, mean));
    }

    /**
     * Compute linear slope using least squares
     * @private
     */
    _computeLinearSlope(sequence) {
        const n = sequence.length;
        let sumX = 0, sumY = 0, sumXY = 0, sumX2 = 0;

        for (let i = 0; i < n; i++) {
            sumX += i;
            sumY += sequence[i];
            sumXY += i * sequence[i];
            sumX2 += i * i;
        }

        const denominator = n * sumX2 - sumX * sumX;
        return denominator === 0 ? 0 : (n * sumXY - sumX * sumY) / denominator;
    }

    /**
     * Compute R-squared for linear fit
     * @private
     */
    _computeR2(sequence, slope) {
        const n = sequence.length;
        const mean = this._computeMean(sequence);

        let ssTot = 0;
        let ssRes = 0;

        for (let i = 0; i < n; i++) {
            const predicted = slope * (i - (n - 1) / 2) + mean;
            ssTot += (sequence[i] - mean) ** 2;
            ssRes += (sequence[i] - predicted) ** 2;
        }

        return ssTot === 0 ? 1 : 1 - ssRes / ssTot;
    }

    /**
     * Get statistics
     * @returns {Object} Analyzer statistics
     */
    getStats() {
        return {
            ...this.stats,
            modelCount: this.modelTimelines.size,
            totalEvents: this.timeline.length,
            cacheSize: this.patternsCache.size
        };
    }

    /**
     * Get all tracked model IDs
     * @returns {Array} Model IDs
     */
    getModelIds() {
        return Array.from(this.modelTimelines.keys());
    }

    /**
     * Clear all history and patterns
     */
    clear() {
        this.timeline = [];
        this.modelTimelines.clear();
        this.patternsCache.clear();
        this.stats.totalEvents = 0;
        this.stats.patternsDetected = 0;
        this.stats.stateChangesDetected = 0;
        console.log('[TemporalAnalyzer] Cleared');
    }

    /**
     * Destroy analyzer and release resources
     */
    /**
     * Sync timeline to workers
     * @private
     */
    _syncTimelineToWorkers() {
        if (!this.workerManager || !this.workerManager.isAvailable()) return;

        this.workerManager.updateWorkerData('temporal', 'update_timeline', {
            events: this.timeline
        });
    }

    /**
     * Get worker statistics if available
     * @returns {Object} Worker statistics or null
     */
    getWorkerStats() {
        if (this.workerManager) {
            return this.workerManager.getStats();
        }
        return null;
    }

    destroy() {
        if (this.workerManager) {
            this.workerManager.terminate();
            this.workerManager = null;
        }
        this.clear();
        console.log('[TemporalAnalyzer] Destroyed');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.TemporalAnalyzer = TemporalAnalyzer;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { TemporalAnalyzer };
}
