/**
 * Temporal Worker - Web Worker for parallel temporal pattern detection
 *
 * Offloads intensive temporal analysis computations to background threads,
 * including pattern detection, trend calculation, and burst detection.
 *
 * Part of: Neural Heatmap Phase 2.2 - Web Workers Performance Optimization
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-2-web-workers.md
 */

// Worker state
let timeline = [];
let modelTimelines = new Map();
let options = {
    minPatternLength: 10,
    autocorrLag: 100,
    stateChangeThreshold: 0.5
};

// Statistics
let stats = {
    totalEvents: 0,
    patternsDetected: 0,
    stateChangesDetected: 0,
    lastComputationTime: 0
};

/**
 * Compute mean of array
 */
function computeMean(values) {
    if (values.length === 0) return 0;
    return values.reduce((s, v) => s + v, 0) / values.length;
}

/**
 * Compute variance
 */
function computeVariance(values, mean) {
    if (values.length === 0) return 0;
    return values.reduce((s, v) => s + (v - mean) ** 2, 0) / values.length;
}

/**
 * Compute standard deviation
 */
function computeStdDev(values) {
    const mean = computeMean(values);
    return Math.sqrt(computeVariance(values, mean));
}

/**
 * Compute autocorrelation of a sequence
 */
function computeAutocorrelation(sequence) {
    const n = sequence.length;
    const maxLag = Math.min(options.autocorrLag, Math.floor(n / 2));
    const mean = computeMean(sequence);
    const variance = computeVariance(sequence, mean);

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
 */
function findPeriods(autocorr) {
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

                stats.patternsDetected++;
            }
        }
    }

    return periods;
}

/**
 * Compute linear slope using least squares
 */
function computeLinearSlope(sequence) {
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
 */
function computeR2(sequence, slope) {
    const n = sequence.length;
    const mean = computeMean(sequence);

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
 * Detect periodic patterns using autocorrelation
 */
function detectPeriodicPatterns(data) {
    const { modelId, layer = null } = data;
    const startTime = performance.now();

    const events = modelTimelines.get(modelId) || [];
    if (layer) {
        // Filter by layer
        return detectPeriodicPatternsFiltered(events.filter(e => e.layer === layer), modelId, layer, startTime);
    }

    if (events.length < options.minPatternLength) {
        self.postMessage({
            type: 'periodic_patterns',
            modelId,
            layer,
            patterns: [],
            computationTime: performance.now() - startTime
        });
        return;
    }

    // Extract intensity sequence
    const intensities = events.map(e => e.intensity);

    // Compute autocorrelation
    const autocorr = computeAutocorrelation(intensities);

    // Find peaks in autocorrelation (periodic patterns)
    const periods = findPeriods(autocorr);

    const patterns = periods.map(period => ({
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

    const elapsed = performance.now() - startTime;
    stats.lastComputationTime = elapsed;

    self.postMessage({
        type: 'periodic_patterns',
        modelId,
        layer,
        patterns,
        computationTime: elapsed
    });
}

/**
 * Helper for filtered pattern detection
 */
function detectPeriodicPatternsFiltered(events, modelId, layer, startTime) {
    if (events.length < options.minPatternLength) {
        self.postMessage({
            type: 'periodic_patterns',
            modelId,
            layer,
            patterns: [],
            computationTime: performance.now() - startTime
        });
        return;
    }

    const intensities = events.map(e => e.intensity);
    const autocorr = computeAutocorrelation(intensities);
    const periods = findPeriods(autocorr);

    const patterns = periods.map(period => ({
        type: 'periodic',
        period: period.period,
        frequency: 1000 / period.period,
        confidence: period.strength,
        phase: period.phase,
        modelId: modelId,
        layer: layer,
        sampleSize: intensities.length,
        detectedAt: performance.now()
    }));

    self.postMessage({
        type: 'periodic_patterns',
        modelId,
        layer,
        patterns,
        computationTime: performance.now() - startTime
    });
}

/**
 * Detect trends (increasing/decreasing activity)
 */
function detectTrends(data) {
    const { modelId, layer = null } = data;
    const startTime = performance.now();

    const events = modelTimelines.get(modelId) || [];
    if (layer) {
        events = events.filter(e => e.layer === layer);
    }

    if (events.length < 20) {
        self.postMessage({
            type: 'trends',
            modelId,
            layer,
            trends: [],
            computationTime: performance.now() - startTime
        });
        return;
    }

    const intensities = events.map(e => e.intensity);
    const slope = computeLinearSlope(intensities);
    const r2 = computeR2(intensities, slope);

    const trends = [{
        type: 'trend',
        direction: slope > 0.01 ? 'increasing' : slope < -0.01 ? 'decreasing' : 'stable',
        slope: slope,
        intercept: computeMean(intensities) - slope * (intensities.length - 1) / 2,
        r2: r2,
        confidence: Math.min(Math.abs(slope) * 10, 1),
        modelId: modelId,
        layer: layer,
        sampleSize: intensities.length,
        detectedAt: performance.now()
    }];

    const elapsed = performance.now() - startTime;
    stats.lastComputationTime = elapsed;

    self.postMessage({
        type: 'trends',
        modelId,
        layer,
        trends,
        computationTime: elapsed
    });
}

/**
 * Detect state changes (sudden activity shifts)
 */
function detectStateChanges(data) {
    const { modelId, threshold = null, layer = null } = data;
    const startTime = performance.now();

    const events = modelTimelines.get(modelId) || [];
    if (layer) {
        events = events.filter(e => e.layer === layer);
    }

    const changes = [];
    const thresh = threshold ?? options.stateChangeThreshold;

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

            stats.stateChangesDetected++;
        }
    }

    const elapsed = performance.now() - startTime;
    stats.lastComputationTime = elapsed;

    self.postMessage({
        type: 'state_changes',
        modelId,
        layer,
        changes,
        computationTime: elapsed
    });
}

/**
 * Detect bursts of activity
 */
function detectBursts(data) {
    const { modelId, windowSize = 1000, threshold = 0.5 } = data;
    const startTime = performance.now();

    const events = modelTimelines.get(modelId) || [];
    if (events.length < 3) {
        self.postMessage({
            type: 'bursts',
            modelId,
            bursts: [],
            computationTime: performance.now() - startTime
        });
        return;
    }

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
                        bursts.push(createBurst(burstStart, burstEvents, modelId));
                    }
                    burstStart = event.timestamp;
                    burstEvents = [event];
                }
            }
        } else if (burstStart !== null && event.timestamp - burstStart > windowSize) {
            // End burst due to timeout
            if (burstEvents.length >= 3) {
                bursts.push(createBurst(burstStart, burstEvents, modelId));
            }
            burstStart = null;
            burstEvents = [];
        }
    }

    // Check for ongoing burst
    if (burstEvents.length >= 3) {
        bursts.push(createBurst(burstStart, burstEvents, modelId));
    }

    const elapsed = performance.now() - startTime;
    stats.lastComputationTime = elapsed;

    self.postMessage({
        type: 'bursts',
        modelId,
        bursts,
        computationTime: elapsed
    });
}

/**
 * Create burst object from events
 */
function createBurst(startTime, events, modelId) {
    return {
        type: 'burst',
        startTime: startTime,
        endTime: events[events.length - 1].timestamp,
        duration: events[events.length - 1].timestamp - startTime,
        eventCount: events.length,
        avgIntensity: events.reduce((s, e) => s + e.intensity, 0) / events.length,
        maxIntensity: Math.max(...events.map(e => e.intensity)),
        events: [...events],
        modelId: modelId
    };
}

/**
 * Get activity summary over time windows
 */
function getTimeWindows(data) {
    const { modelId, windowSize = 100 } = data;
    const startTime = performance.now();

    const events = modelTimelines.get(modelId) || [];
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
            avgIntensity: computeMean(intensities),
            maxIntensity: Math.max(...intensities),
            minIntensity: Math.min(...intensities),
            stdDev: computeStdDev(intensities)
        });
    }

    const elapsed = performance.now() - startTime;
    stats.lastComputationTime = elapsed;

    self.postMessage({
        type: 'time_windows',
        modelId,
        windows,
        computationTime: elapsed
    });
}

/**
 * Perform complete temporal analysis for a model
 */
function analyzeModel(data) {
    const { modelId } = data;
    const startTime = performance.now();

    const events = modelTimelines.get(modelId) || [];

    // Run all analyses
    const intensities = events.map(e => e.intensity);

    // Periodic patterns
    let patterns = [];
    if (events.length >= options.minPatternLength) {
        const autocorr = computeAutocorrelation(intensities);
        const periods = findPeriods(autocorr);
        patterns = periods.map(p => ({
            type: 'periodic',
            period: p.period,
            frequency: 1000 / p.period,
            confidence: p.strength,
            phase: p.phase,
            modelId: modelId,
            sampleSize: intensities.length
        }));
    }

    // Trends
    let trends = [];
    if (events.length >= 20) {
        const slope = computeLinearSlope(intensities);
        const r2 = computeR2(intensities, slope);
        trends = [{
            type: 'trend',
            direction: slope > 0.01 ? 'increasing' : slope < -0.01 ? 'decreasing' : 'stable',
            slope: slope,
            r2: r2,
            confidence: Math.min(Math.abs(slope) * 10, 1),
            sampleSize: intensities.length
        }];
    }

    // State changes
    const changes = [];
    for (let i = 1; i < events.length; i++) {
        const delta = events[i].intensity - events[i-1].intensity;
        if (Math.abs(delta) > options.stateChangeThreshold) {
            changes.push({
                timestamp: events[i].timestamp,
                delta: delta,
                direction: delta > 0 ? 'increase' : 'decrease',
                magnitude: Math.abs(delta)
            });
        }
    }

    // Summary
    const summary = {
        totalEvents: events.length,
        avgIntensity: computeMean(intensities),
        maxIntensity: intensities.length > 0 ? Math.max(...intensities) : 0,
        minIntensity: intensities.length > 0 ? Math.min(...intensities) : 0,
        stdDev: computeStdDev(intensities),
        timeSpan: events.length > 0 ? events[events.length - 1].timestamp - events[0].timestamp : 0,
        layers: [...new Set(events.map(e => e.layer).filter(Boolean))]
    };

    const elapsed = performance.now() - startTime;
    stats.lastComputationTime = elapsed;

    self.postMessage({
        type: 'full_analysis',
        modelId,
        analysis: {
            modelId: modelId,
            periodic: patterns,
            trends: trends,
            stateChanges: changes,
            summary: summary,
            analyzedAt: performance.now()
        },
        computationTime: elapsed
    });
}

/**
 * Update timeline with new events
 */
function updateTimeline(data) {
    const { events } = data;

    timeline = events;

    // Rebuild model timelines
    modelTimelines.clear();
    for (const event of events) {
        if (!modelTimelines.has(event.modelId)) {
            modelTimelines.set(event.modelId, []);
        }
        modelTimelines.get(event.modelId).push(event);
    }

    stats.totalEvents = events.length;

    self.postMessage({
        type: 'timeline_updated',
        eventCount: events.length,
        modelCount: modelTimelines.size
    });
}

/**
 * Add a single event to the timeline
 */
function addEvent(data) {
    const { modelId, intensity, location, layer = null, timestamp = performance.now() } = data;

    const event = {
        timestamp,
        modelId,
        intensity,
        location: { ...location },
        layer
    };

    timeline.push(event);

    // Add to per-model timeline
    if (!modelTimelines.has(modelId)) {
        modelTimelines.set(modelId, []);
    }
    modelTimelines.get(modelId).push(event);

    stats.totalEvents++;

    self.postMessage({
        type: 'event_added',
        totalEvents: timeline.length
    });
}

/**
 * Get worker statistics
 */
function getStats() {
    self.postMessage({
        type: 'stats',
        stats: {
            ...stats,
            modelCount: modelTimelines.size,
            totalEvents: timeline.length
        }
    });
}

/**
 * Clear all history and stats
 */
function clearHistory() {
    timeline = [];
    modelTimelines.clear();
    stats = {
        totalEvents: 0,
        patternsDetected: 0,
        stateChangesDetected: 0,
        lastComputationTime: 0
    };

    self.postMessage({
        type: 'cleared'
    });
}

/**
 * Update worker options
 */
function updateOptions(data) {
    options = { ...options, ...data };

    self.postMessage({
        type: 'options_updated',
        options
    });
}

// Message handler
self.addEventListener('message', (event) => {
    const { type, data } = event.data;

    try {
        switch (type) {
            case 'detect_periodic_patterns':
                detectPeriodicPatterns(data);
                break;

            case 'detect_trends':
                detectTrends(data);
                break;

            case 'detect_state_changes':
                detectStateChanges(data);
                break;

            case 'detect_bursts':
                detectBursts(data);
                break;

            case 'get_time_windows':
                getTimeWindows(data);
                break;

            case 'analyze_model':
                analyzeModel(data);
                break;

            case 'update_timeline':
                updateTimeline(data);
                break;

            case 'add_event':
                addEvent(data);
                break;

            case 'get_stats':
                getStats();
                break;

            case 'clear':
                clearHistory();
                break;

            case 'update_options':
                updateOptions(data);
                break;

            default:
                console.warn(`[TemporalWorker] Unknown message type: ${type}`);
        }
    } catch (error) {
        self.postMessage({
            type: 'error',
            error: {
                message: error.message,
                stack: error.stack,
                messageType: type
            }
        });
    }
});

// Signal worker is ready
self.postMessage({
    type: 'ready'
});
