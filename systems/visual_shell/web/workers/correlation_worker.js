/**
 * Correlation Worker - Web Worker for parallel correlation matrix computation
 *
 * Offloads intensive correlation calculations to background threads,
 * keeping the UI responsive during neural heatmap analytics processing.
 *
 * Part of: Neural Heatmap Phase 2.2 - Web Workers Performance Optimization
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-2-web-workers.md
 */

// Worker state
let layerHistory = new Map();
let stats = {
    correlationsComputed: 0,
    lastComputationTime: 0
};

/**
 * Compute temporal correlation between two layer histories
 * Uses Pearson correlation coefficient
 */
function computeTemporalCorrelation(history1, history2) {
    // Align sequences by index (assume same sampling rate)
    const n = Math.min(history1.length, history2.length);
    if (n < 2) return 0;

    let sumX = 0, sumY = 0, sumXY = 0, sumX2 = 0, sumY2 = 0;

    for (let i = 0; i < n; i++) {
        const x = history1[i].intensity;
        const y = history2[i].intensity;

        sumX += x;
        sumY += y;
        sumXY += x * y;
        sumX2 += x * x;
        sumY2 += y * y;
    }

    const numerator = n * sumXY - sumX * sumY;
    const denominator = Math.sqrt((n * sumX2 - sumX * sumX) * (n * sumY2 - sumY * sumY));

    return denominator === 0 ? 0 : numerator / denominator;
}

/**
 * Compute correlation matrix for a chunk of layer pairs
 * Supports incremental computation and partial result streaming
 */
function computeCorrelationChunk(data) {
    const { modelIds, layerNames, startIdx, endIdx, chunkId, totalChunks } = data;
    const startTime = performance.now();

    const results = [];
    let maxCorrelation = -Infinity;
    let minCorrelation = Infinity;
    let sumCorrelation = 0;
    let count = 0;

    // Process only the assigned chunk
    for (let i = startIdx; i < endIdx; i++) {
        for (let j = 0; j < layerNames.length; j++) {
            const m1 = modelIds[i % modelIds.length];
            const l1 = layerNames[Math.floor(i / modelIds.length) % layerNames.length];
            const m2 = modelIds[j % modelIds.length];
            const l2 = layerNames[j];

            const key1 = `${m1}:${l1}`;
            const key2 = `${m2}:${l2}`;

            const history1 = layerHistory.get(key1);
            const history2 = layerHistory.get(key2);

            if (history1 && history2 && history1.length >= 2 && history2.length >= 2) {
                const corr = computeTemporalCorrelation(history1, history2);

                results.push({
                    key: `${key1}|${key2}`,
                    model1: m1,
                    layer1: l1,
                    model2: m2,
                    layer2: l2,
                    correlation: corr
                });

                if (corr !== 0) {
                    maxCorrelation = Math.max(maxCorrelation, corr);
                    minCorrelation = Math.min(minCorrelation, corr);
                    sumCorrelation += Math.abs(corr);
                    count++;
                }

                stats.correlationsComputed++;
            }
        }
    }

    const elapsed = performance.now() - startTime;
    stats.lastComputationTime = elapsed;

    // Send partial results for progressive loading
    self.postMessage({
        type: 'partial',
        chunkId,
        totalChunks,
        results,
        summary: {
            maxCorrelation: count > 0 ? maxCorrelation : 0,
            minCorrelation: count > 0 ? minCorrelation : 0,
            avgCorrelation: count > 0 ? sumCorrelation / count : 0,
            correlationCount: count,
            computationTime: elapsed
        },
        progress: {
            chunkId,
            totalChunks,
            percentComplete: Math.round((chunkId + 1) / totalChunks * 100)
        }
    });
}

/**
 * Find high correlation layer pairs (above threshold)
 */
function findHighCorrelations(data) {
    const { threshold = 0.7, limit = 50 } = data;
    const startTime = performance.now();

    const results = [];
    const keys = Array.from(layerHistory.keys());

    for (let i = 0; i < keys.length; i++) {
        for (let j = i + 1; j < keys.length; j++) {
            const key1 = keys[i];
            const key2 = keys[j];

            const history1 = layerHistory.get(key1);
            const history2 = layerHistory.get(key2);

            if (!history1 || !history2 || history1.length < 2 || history2.length < 2) {
                continue;
            }

            const corr = computeTemporalCorrelation(history1, history2);

            if (Math.abs(corr) >= threshold) {
                const [m1, l1] = key1.split(':');
                const [m2, l2] = key2.split(':');

                results.push({
                    model1: m1,
                    layer1: l1,
                    model2: m2,
                    layer2: l2,
                    correlation: corr,
                    sampleSize: Math.min(history1.length, history2.length)
                });

                if (results.length >= limit) {
                    break;
                }
            }
        }

        if (results.length >= limit) {
            break;
        }
    }

    // Sort by correlation strength
    results.sort((a, b) => Math.abs(b.correlation) - Math.abs(a.correlation));

    const elapsed = performance.now() - startTime;

    self.postMessage({
        type: 'high_correlations',
        results,
        computationTime: elapsed
    });
}

/**
 * Find divergent layer pairs (low correlation)
 */
function findDivergentLayers(data) {
    const { threshold = 0.2, limit = 50 } = data;
    const startTime = performance.now();

    const results = [];
    const keys = Array.from(layerHistory.keys());

    for (let i = 0; i < keys.length; i++) {
        for (let j = i + 1; j < keys.length; j++) {
            const key1 = keys[i];
            const key2 = keys[j];

            const history1 = layerHistory.get(key1);
            const history2 = layerHistory.get(key2);

            if (!history1 || !history2 || history1.length < 2 || history2.length < 2) {
                continue;
            }

            const corr = computeTemporalCorrelation(history1, history2);

            if (Math.abs(corr) <= threshold) {
                const [m1, l1] = key1.split(':');
                const [m2, l2] = key2.split(':');

                results.push({
                    model1: m1,
                    layer1: l1,
                    model2: m2,
                    layer2: l2,
                    correlation: corr,
                    sampleSize: Math.min(history1.length, history2.length)
                });

                if (results.length >= limit) {
                    break;
                }
            }
        }

        if (results.length >= limit) {
            break;
        }
    }

    // Sort by correlation (lowest first)
    results.sort((a, b) => Math.abs(a.correlation) - Math.abs(b.correlation));

    const elapsed = performance.now() - startTime;

    self.postMessage({
        type: 'divergent_layers',
        results,
        computationTime: elapsed
    });
}

/**
 * Update layer history with new data
 */
function updateLayerHistory(data) {
    const { history } = data;

    // Convert array back to Map
    layerHistory = new Map(history);

    self.postMessage({
        type: 'history_updated',
        layerCount: layerHistory.size
    });
}

/**
 * Add a single layer activity record
 */
function addLayerActivity(data) {
    const { modelId, layerName, bounds, intensity, timestamp } = data;
    const key = `${modelId}:${layerName}`;

    if (!layerHistory.has(key)) {
        layerHistory.set(key, []);
    }

    const history = layerHistory.get(key);
    history.push({
        timestamp,
        intensity,
        bounds: { ...bounds },
        spatialMap: {
            centerX: bounds.x + bounds.width / 2,
            centerY: bounds.y + bounds.height / 2,
            area: bounds.width * bounds.height,
            aspectRatio: bounds.width / (bounds.height || 1)
        },
        modelId,
        layerName
    });

    self.postMessage({
        type: 'activity_added',
        key,
        recordCount: history.length
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
            layerCount: layerHistory.size,
            totalRecords: Array.from(layerHistory.values()).reduce((sum, h) => sum + h.length, 0)
        }
    });
}

/**
 * Clear all history and stats
 */
function clearHistory() {
    layerHistory.clear();
    stats = {
        correlationsComputed: 0,
        lastComputationTime: 0
    };

    self.postMessage({
        type: 'cleared'
    });
}

// Message handler
self.addEventListener('message', (event) => {
    const { type, data } = event.data;

    try {
        switch (type) {
            case 'compute_correlation_chunk':
                computeCorrelationChunk(data);
                break;

            case 'find_high_correlations':
                findHighCorrelations(data);
                break;

            case 'find_divergent_layers':
                findDivergentLayers(data);
                break;

            case 'update_history':
                updateLayerHistory(data);
                break;

            case 'add_activity':
                addLayerActivity(data);
                break;

            case 'get_stats':
                getStats();
                break;

            case 'clear':
                clearHistory();
                break;

            default:
                console.warn(`[CorrelationWorker] Unknown message type: ${type}`);
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
