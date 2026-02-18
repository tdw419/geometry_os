/**
 * AnomalyDetector - Detect anomalous neural activity patterns
 *
 * Identifies unusual activity patterns using statistical methods
 * including z-score analysis, isolation detection, and clustering.
 *
 * Part of: Neural Heatmap Phase 2.1.4 - Advanced Correlation Analytics
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-1-4-correlation-analytics.md
 */

class AnomalyDetector {
    /**
     * Create a new AnomalyDetector
     * @param {Object} options - Configuration options
     * @param {number} options.zScoreThreshold - Z-score threshold for anomalies (default: 3.0)
     * @param {number} options.minSamples - Minimum samples before detection (default: 30)
     * @param {number} options.clusterSize - Max neighbors for isolation check (default: 5)
     * @param {number} options.isolationRadius - Distance for spatial neighbors (default: 50)
     * @param {number} options.anomalyHistorySize - Max anomalies to store (default: 100)
     */
    constructor(options = {}) {
        this.options = {
            zScoreThreshold: 3.0,
            minSamples: 30,
            clusterSize: 5,
            isolationRadius: 50,
            anomalyHistorySize: 100,
            ...options
        };

        // Baseline statistics for each model: Map<modelId, baseline>
        this.baselines = new Map();

        // Recent anomalies detected
        this.recentAnomalies = [];

        // Anomaly history by type
        this.anomalyHistory = {
            z_score: [],
            spatial_isolation: [],
            temporal: [],
            burst: []
        };

        // Statistics
        this.stats = {
            totalAnomalies: 0,
            byType: { z_score: 0, spatial_isolation: 0, temporal: 0, burst: 0 },
            lastDetection: null
        };

        console.log('[AnomalyDetector] Initialized');
    }

    /**
     * Update baseline statistics for a model
     * @param {string} modelId - Model identifier
     * @param {Array} activities - Recent activity data with intensity values
     * @param {boolean} force - Force update even with fewer samples
     */
    updateBaseline(modelId, activities, force = false) {
        const effectiveMinSamples = force ? 5 : this.options.minSamples;

        if (activities.length < effectiveMinSamples) {
            return false;
        }

        const intensities = activities.map(a => a.intensity || a);
        const locations = activities.map(a => a.location || { x: a.x || 0, y: a.y || 0 });

        this.baselines.set(modelId, {
            mean: this._computeMean(intensities),
            stdDev: this._computeStdDev(intensities),
            variance: this._computeVariance(intensities, this._computeMean(intensities)),
            min: Math.min(...intensities),
            max: Math.max(...intensities),
            median: this._computeMedian(intensities),
            percentile25: this._computePercentile(intensities, 25),
            percentile75: this._computePercentile(intensities, 75),
            sampleCount: intensities.length,
            lastUpdate: performance.now(),
            spatialSpread: this._computeSpatialSpread(locations)
        });

        return true;
    }

    /**
     * Detect anomalies using multiple methods
     * @param {string} modelId - Model to check
     * @param {Array} currentActivities - Current activity data
     * @returns {Array} All detected anomalies
     */
    detectAnomalies(modelId, currentActivities) {
        const allAnomalies = [];

        // Z-score anomalies
        const zScoreAnomalies = this.detectZScoreAnomalies(modelId, currentActivities);
        allAnomalies.push(...zScoreAnomalies);

        // Spatial isolation anomalies
        const spatialAnomalies = this.detectSpatialAnomalies(currentActivities);
        allAnomalies.push(...spatialAnomalies);

        // Temporal anomalies
        const temporalAnomalies = this.detectTemporalAnomalies(modelId, currentActivities);
        allAnomalies.push(...temporalAnomalies);

        // Store recent anomalies
        for (const anomaly of allAnomalies) {
            this._addAnomaly(anomaly);
        }

        if (allAnomalies.length > 0) {
            this.stats.lastDetection = performance.now();
        }

        return allAnomalies;
    }

    /**
     * Detect anomalies using z-score analysis
     * @param {string} modelId - Model to check
     * @param {Array} currentActivities - Current activity data
     * @returns {Array} Detected z-score anomalies
     */
    detectZScoreAnomalies(modelId, currentActivities) {
        const baseline = this.baselines.get(modelId);
        if (!baseline) {
            return [];
        }

        const anomalies = [];
        const threshold = this.options.zScoreThreshold;

        for (const activity of currentActivities) {
            const intensity = activity.intensity ?? activity;
            const stdDev = baseline.stdDev || 0.001; // Avoid division by zero

            const zScore = (intensity - baseline.mean) / stdDev;
            const absZScore = Math.abs(zScore);

            if (absZScore >= threshold) {
                const anomaly = {
                    type: 'z_score',
                    id: this._generateAnomalyId(),
                    modelId: modelId,
                    intensity: intensity,
                    zScore: zScore,
                    absZScore: absZScore,
                    location: activity.location || { x: activity.x || 0, y: activity.y || 0 },
                    timestamp: activity.timestamp || performance.now(),
                    severity: this._getZScoreSeverity(absZScore),
                    description: this._getZScoreDescription(absZScore, intensity, baseline)
                };

                anomalies.push(anomaly);
                this.stats.byType.z_score++;
            }
        }

        return anomalies;
    }

    /**
     * Detect spatial anomalies (isolated high-intensity regions)
     * @param {Array} activities - Current activity data
     * @returns {Array} Detected spatial anomalies
     */
    detectSpatialAnomalies(activities) {
        const anomalies = [];
        const processed = new Set();

        for (const activity of activities) {
            const location = activity.location || { x: activity.x || 0, y: activity.y || 0 };
            const key = `${location.x},${location.y}`;

            if (processed.has(key)) continue;

            // Find nearby activities
            const nearby = activities.filter(a => {
                const aLoc = a.location || { x: a.x || 0, y: a.y || 0 };
                const dx = aLoc.x - location.x;
                const dy = aLoc.y - location.y;
                return Math.sqrt(dx * dx + dy * dy) < this.options.isolationRadius;
            });

            const intensity = activity.intensity ?? activity;

            // If isolated (low nearby count but high intensity)
            if (nearby.length < this.options.clusterSize && intensity > 0.6) {
                const anomaly = {
                    type: 'spatial_isolation',
                    id: this._generateAnomalyId(),
                    intensity: intensity,
                    location: location,
                    nearbyCount: nearby.length,
                    isolationRadius: this.options.isolationRadius,
                    timestamp: activity.timestamp || performance.now(),
                    severity: intensity > 0.8 ? 'high' : 'medium',
                    description: `High intensity (${intensity.toFixed(2)}) in isolated region (${nearby.length} neighbors within ${this.options.isolationRadius}px)`
                };

                anomalies.push(anomaly);
                this.stats.byType.spatial_isolation++;

                // Mark all nearby as processed
                nearby.forEach(a => {
                    const aLoc = a.location || { x: a.x || 0, y: a.y || 0 };
                    processed.add(`${aLoc.x},${aLoc.y}`);
                });
            }

            processed.add(key);
        }

        return anomalies;
    }

    /**
     * Detect temporal anomalies (unusual timing patterns)
     * @param {string} modelId - Model to check
     * @param {Array} activities - Current activity data
     * @returns {Array} Detected temporal anomalies
     */
    detectTemporalAnomalies(modelId, activities) {
        if (activities.length < 5) {
            return [];
        }

        const anomalies = [];

        // Sort by timestamp
        const sorted = [...activities].sort((a, b) => {
            const t1 = a.timestamp || 0;
            const t2 = b.timestamp || 0;
            return t1 - t2;
        });

        // Compute intervals between consecutive events
        const intervals = [];
        for (let i = 1; i < sorted.length; i++) {
            const interval = (sorted[i].timestamp || 0) - (sorted[i - 1].timestamp || 0);
            intervals.push({
                interval: interval,
                event: sorted[i],
                index: i
            });
        }

        if (intervals.length < 3) {
            return [];
        }

        // Compute interval statistics
        const intervalValues = intervals.map(i => i.interval);
        const meanInterval = this._computeMean(intervalValues);
        const stdInterval = this._computeStdDev(intervalValues);

        // Find outliers (intervals far from mean)
        const threshold = 2.5; // Z-score threshold for intervals

        for (const item of intervals) {
            const zScore = stdInterval > 0
                ? (item.interval - meanInterval) / stdInterval
                : 0;

            if (Math.abs(zScore) > threshold) {
                const anomaly = {
                    type: 'temporal',
                    id: this._generateAnomalyId(),
                    modelId: modelId,
                    interval: item.interval,
                    zScore: zScore,
                    expectedRange: [
                        Math.max(0, meanInterval - 2 * stdInterval),
                        meanInterval + 2 * stdInterval
                    ],
                    timestamp: item.event.timestamp || performance.now(),
                    location: item.event.location || { x: item.event.x || 0, y: item.event.y || 0 },
                    severity: Math.abs(zScore) > 4 ? 'high' : 'medium',
                    description: this._getTemporalDescription(item.interval, meanInterval, stdInterval)
                };

                anomalies.push(anomaly);
                this.stats.byType.temporal++;
            }
        }

        return anomalies;
    }

    /**
     * Detect burst anomalies (many events in short time)
     * @param {string} modelId - Model to check
     * @param {Array} activities - Recent activities
     * @param {number} burstWindow - Time window in ms (default: 500)
     * @param {number} burstCount - Min events for burst (default: 10)
     * @returns {Array} Detected bursts
     */
    detectBursts(modelId, activities, burstWindow = 500, burstCount = 10) {
        const anomalies = [];

        if (activities.length < burstCount) {
            return [];
        }

        // Sort by timestamp
        const sorted = [...activities].sort((a, b) => {
            const t1 = a.timestamp || 0;
            const t2 = b.timestamp || 0;
            return t1 - t2;
        });

        // Use sliding window to detect bursts
        for (let i = 0; i <= sorted.length - burstCount; i++) {
            const windowEnd = i + burstCount;
            const windowEvents = sorted.slice(i, windowEnd);

            const timeSpan = (windowEvents[windowEvents.length - 1].timestamp || 0) -
                          (windowEvents[0].timestamp || 0);

            if (timeSpan <= burstWindow) {
                const avgIntensity = windowEvents.reduce((s, e) => s + (e.intensity ?? e), 0) / windowEvents.length;

                const anomaly = {
                    type: 'burst',
                    id: this._generateAnomalyId(),
                    modelId: modelId,
                    eventCount: windowEvents.length,
                    timeSpan: timeSpan,
                    avgIntensity: avgIntensity,
                    eventsPerSecond: (windowEvents.length / timeSpan) * 1000,
                    timestamp: windowEvents[0].timestamp || performance.now(),
                    severity: windowEvents.length > burstCount * 2 ? 'high' : 'medium',
                    description: `${windowEvents.length} events in ${timeSpan.toFixed(0)}ms (${(windowEvents.length / timeSpan * 1000).toFixed(0)} events/sec)`
                };

                anomalies.push(anomaly);
                this.stats.byType.burst++;

                // Skip ahead to avoid overlapping bursts
                i += burstCount - 1;
            }
        }

        return anomalies;
    }

    /**
     * Get anomaly summary
     * @returns {Object} Summary of all anomalies
     */
    getAnomalySummary() {
        // Group recent anomalies by model and type
        const byModel = {};
        const byType = {};
        const bySeverity = { high: 0, medium: 0, low: 0 };

        for (const anomaly of this.recentAnomalies) {
            // By model
            if (!byModel[anomaly.modelId]) {
                byModel[anomaly.modelId] = [];
            }
            byModel[anomaly.modelId].push(anomaly);

            // By type
            if (!byType[anomaly.type]) {
                byType[anomaly.type] = [];
            }
            byType[anomaly.type].push(anomaly);

            // By severity
            if (anomaly.severity) {
                bySeverity[anomaly.severity] = (bySeverity[anomaly.severity] || 0) + 1;
            }
        }

        return {
            totalAnomalies: this.recentAnomalies.length,
            byModel: this._countByProperty(this.recentAnomalies, 'modelId'),
            byType: this._countByProperty(this.recentAnomalies, 'type'),
            bySeverity: bySeverity,
            recent: this.recentAnomalies.slice(-20),
            stats: { ...this.stats }
        };
    }

    /**
     * Get anomalies for a specific model
     * @param {string} modelId - Model identifier
     * @param {number} limit - Max results (default: 50)
     * @returns {Array} Anomalies for the model
     */
    getAnomaliesForModel(modelId, limit = 50) {
        return this.recentAnomalies
            .filter(a => a.modelId === modelId)
            .slice(-limit)
            .reverse(); // Most recent first
    }

    /**
     * Get baseline statistics for a model
     * @param {string} modelId - Model identifier
     * @returns {Object|null} Baseline statistics
     */
    getBaseline(modelId) {
        return this.baselines.get(modelId) || null;
    }

    /**
     * Get all baselines
     * @returns {Object} Map of modelId -> baseline
     */
    getAllBaselines() {
        return Object.fromEntries(this.baselines);
    }

    /**
     * Clear anomaly history
     * @param {string} type - Optional type to clear (z_score, spatial_isolation, temporal, burst)
     */
    clearAnomalies(type = null) {
        if (type) {
            this.recentAnomalies = this.recentAnomalies.filter(a => a.type !== type);
            this.anomalyHistory[type] = [];
        } else {
            this.recentAnomalies = [];
            for (const key in this.anomalyHistory) {
                this.anomalyHistory[key] = [];
            }
        }

        console.log('[AnomalyDetector] Cleared', type ? `type: ${type}` : 'all anomalies');
    }

    /**
     * Clear all baselines
     */
    clearBaselines() {
        this.baselines.clear();
        console.log('[AnomalyDetector] Cleared all baselines');
    }

    /**
     * Reset detector completely
     */
    reset() {
        this.baselines.clear();
        this.recentAnomalies = [];
        for (const key in this.anomalyHistory) {
            this.anomalyHistory[key] = [];
        }
        this.stats.totalAnomalies = 0;
        this.stats.byType = { z_score: 0, spatial_isolation: 0, temporal: 0, burst: 0 };
        this.stats.lastDetection = null;
        console.log('[AnomalyDetector] Reset');
    }

    // ========== Private Methods ==========

    /**
     * Add anomaly to history
     * @private
     */
    _addAnomaly(anomaly) {
        this.recentAnomalies.push(anomaly);

        // Trim to max size
        if (this.recentAnomalies.length > this.options.anomalyHistorySize) {
            const removed = this.recentAnomalies.shift();
            // Also remove from type-specific history
            const typeHistory = this.anomalyHistory[removed.type];
            if (typeHistory && typeHistory.length > 0 && typeHistory[0] === removed) {
                typeHistory.shift();
            }
        }

        // Add to type-specific history
        if (!this.anomalyHistory[anomaly.type]) {
            this.anomalyHistory[anomaly.type] = [];
        }
        this.anomalyHistory[anomaly.type].push(anomaly);

        this.stats.totalAnomalies++;
    }

    /**
     * Generate unique anomaly ID
     * @private
     */
    _generateAnomalyId() {
        return `anomaly_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
    }

    /**
     * Get severity level for z-score
     * @private
     */
    _getZScoreSeverity(absZScore) {
        if (absZScore >= 5) return 'critical';
        if (absZScore >= 4) return 'high';
        if (absZScore >= 3) return 'medium';
        return 'low';
    }

    /**
     * Get human-readable description for z-score anomaly
     * @private
     */
    _getZScoreDescription(absZScore, intensity, baseline) {
        const direction = intensity > baseline.mean ? 'above' : 'below';
        const sigmaStr = absZScore >= 5 ? '5+ sigma' : `${absZScore.toFixed(1)} sigma`;

        return `Intensity ${direction} baseline by ${sigmaStr} ` +
               `(value: ${intensity.toFixed(3)}, baseline: ${baseline.mean.toFixed(3)} ± ${baseline.stdDev.toFixed(3)})`;
    }

    /**
     * Get description for temporal anomaly
     * @private
     */
    _getTemporalDescription(interval, mean, std) {
        const ratio = interval / mean;
        if (ratio > 2) {
            return `Long pause: ${interval.toFixed(0)}ms (${(ratio).toFixed(1)}x normal interval)`;
        } else if (ratio < 0.5) {
            return `Rapid succession: ${interval.toFixed(0)}ms (${(ratio).toFixed(1)}x normal interval)`;
        } else {
            return `Irregular timing: ${interval.toFixed(0)}ms (expected: ${mean.toFixed(0)} ± ${(2*std).toFixed(0)}ms)`;
        }
    }

    /**
     * Compute spatial spread of locations
     * @private
     */
    _computeSpatialSpread(locations) {
        if (locations.length === 0) return 0;

        const centerX = this._computeMean(locations.map(l => l.x));
        const centerY = this._computeMean(locations.map(l => l.y));

        const avgDistance = locations.reduce((sum, l) => {
            const dx = l.x - centerX;
            const dy = l.y - centerY;
            return sum + Math.sqrt(dx * dx + dy * dy);
        }, 0) / locations.length;

        return avgDistance;
    }

    /**
     * Count array elements by property
     * @private
     */
    _countByProperty(array, prop) {
        const counts = {};
        for (const item of array) {
            const key = item[prop] || 'unknown';
            counts[key] = (counts[key] || 0) + 1;
        }
        return counts;
    }

    /**
     * Compute mean
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
     * Compute median
     * @private
     */
    _computeMedian(values) {
        if (values.length === 0) return 0;
        const sorted = [...values].sort((a, b) => a - b);
        const mid = Math.floor(sorted.length / 2);
        return sorted.length % 2 === 0
            ? (sorted[mid - 1] + sorted[mid]) / 2
            : sorted[mid];
    }

    /**
     * Compute percentile
     * @private
     */
    _computePercentile(values, percentile) {
        if (values.length === 0) return 0;
        const sorted = [...values].sort((a, b) => a - b);
        const index = Math.ceil((percentile / 100) * sorted.length) - 1;
        return sorted[Math.max(0, Math.min(index, sorted.length - 1))];
    }

    /**
     * Get analyzer statistics
     * @returns {Object} Statistics
     */
    getStats() {
        return {
            ...this.stats,
            modelCount: this.baselines.size,
            recentAnomalyCount: this.recentAnomalies.length
        };
    }

    /**
     * Destroy detector and release resources
     */
    destroy() {
        this.reset();
        console.log('[AnomalyDetector] Destroyed');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.AnomalyDetector = AnomalyDetector;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { AnomalyDetector };
}
