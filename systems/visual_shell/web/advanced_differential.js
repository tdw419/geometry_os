/**
 * AdvancedDifferential - Statistical significance analysis for model comparisons
 *
 * Provides advanced differential visualization with:
 * - Statistical significance testing (t-test, p-value calculation)
 * - Correlation analysis with confidence intervals
 * - Significance indicators (*** p<0.001, ** p<0.01, * p<0.05)
 * - Threshold-based filtering with visual cues
 *
 * Part of: Neural Heatmap Phase 2.1.2 - Enhanced Visualization Modes
 * @see docs/plans/2026-02-07-neural-heatmap-phase-2-1-2-enhanced-modes.md
 */

class AdvancedDifferential {
    /**
     * Create a new AdvancedDifferential analyzer
     * @param {MultiModelTracker} multiModelTracker - Multi-model tracker instance
     * @param {Object} options - Configuration options
     * @param {number} options.significanceThreshold - P-value threshold (default: 0.05)
     * @param {number} options.minSampleSize - Minimum samples for statistical test (default: 5)
     * @param {number} options.confidenceLevel - Confidence interval level (default: 0.95)
     * @param {boolean} options.showIndicators - Show significance indicators (default: true)
     */
    constructor(multiModelTracker, options = {}) {
        if (!multiModelTracker) {
            throw new Error('AdvancedDifferential requires a multiModelTracker');
        }

        this.multiModelTracker = multiModelTracker;
        this.options = {
            significanceThreshold: 0.05,
            minSampleSize: 5,
            confidenceLevel: 0.95,
            showIndicators: true,
            ...options
        };

        // Cached statistical results
        this.statsCache = new Map();
        this.cacheTimestamp = 0;
        this.cacheTTL = 1000; // Cache validity in ms

        // Significance level mappings
        this.significanceLevels = {
            'high': { threshold: 0.001, indicator: '***', color: 0xFF0000 },
            'medium': { threshold: 0.01, indicator: '**', color: 0xFF6600 },
            'low': { threshold: 0.05, indicator: '*', color: 0xFFCC00 },
            'none': { threshold: 1.0, indicator: '', color: 0x888888 }
        };

        console.log('[AdvancedDifferential] Initialized');
    }

    /**
     * Calculate t-statistic for two samples
     * @param {Array} sample1 - First sample values
     * @param {Array} sample2 - Second sample values
     * @returns {Object} { tValue, degreesOfFreedom, pValue (two-tailed) }
     * @private
     */
    _calculateTTest(sample1, sample2) {
        const n1 = sample1.length;
        const n2 = sample2.length;

        if (n1 < this.options.minSampleSize || n2 < this.options.minSampleSize) {
            return { tValue: 0, degreesOfFreedom: 0, pValue: 1.0, reliable: false };
        }

        // Calculate means
        const mean1 = sample1.reduce((a, b) => a + b, 0) / n1;
        const mean2 = sample2.reduce((a, b) => a + b, 0) / n2;

        // Calculate variances
        const var1 = sample1.reduce((sum, x) => sum + Math.pow(x - mean1, 2), 0) / (n1 - 1);
        const var2 = sample2.reduce((sum, x) => sum + Math.pow(x - mean2, 2), 0) / (n2 - 1);

        // Pooled standard error (assuming unequal variances - Welch's t-test)
        const se = Math.sqrt(var1 / n1 + var2 / n2);

        if (se === 0) {
            return { tValue: 0, degreesOfFreedom: n1 + n2 - 2, pValue: 1.0, reliable: false };
        }

        // T-statistic
        const tValue = (mean1 - mean2) / se;

        // Degrees of freedom (Welch-Satterthwaite equation)
        const df = Math.pow(var1 / n1 + var2 / n2, 2) /
                  (Math.pow(var1 / n1, 2) / (n1 - 1) + Math.pow(var2 / n2, 2) / (n2 - 1));

        // Approximate two-tailed p-value using error function approximation
        const pValue = this._approximatePValue(Math.abs(tValue), df);

        return {
            tValue,
            degreesOfFreedom: Math.round(df),
            pValue,
            reliable: true,
            mean1,
            mean2,
            stdError: se
        };
    }

    /**
     * Approximate two-tailed p-value from t-statistic
     * Uses approximation of the error function
     * @param {number} t - Absolute t-statistic
     * @param {number} df - Degrees of freedom
     * @returns {number} Approximate p-value
     * @private
     */
    _approximatePValue(t, df) {
        // For large df, use normal approximation
        if (df > 100) {
            // Z-score approximation
            const z = t;
            // Approximation of complementary error function
            const a = Math.abs(z) / Math.sqrt(2);
            const erfc = 0.5 * (1 - this._erf(a));
            return 2 * erfc;
        }

        // For smaller df, use simplified approximation
        // This is a conservative approximation
        const factor = 1 / (1 + 0.5 * t * t / df);
        const approxP = 2 * (1 - this._incompleteBeta(0.5 * df, 0.5, df / (df + t * t)));

        return Math.min(Math.max(approxP, 0), 1);
    }

    /**
     * Error function approximation
     * @param {number} x - Input value
     * @returns {number} erf(x)
     * @private
     */
    _erf(x) {
        // Abramowitz and Stegun approximation 7.1.26
        const a1 = 0.254829592;
        const a2 = -0.284496736;
        const a3 = 1.421413741;
        const a4 = -1.453152027;
        const a5 = 1.061405429;
        const p = 0.3275911;

        const sign = x < 0 ? -1 : 1;
        x = Math.abs(x);

        const t = 1.0 / (1.0 + p * x);
        const y = 1.0 - (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * Math.exp(-x * x);

        return sign * y;
    }

    /**
     * Incomplete beta function approximation
     * @param {number} a - Alpha parameter
     * @param {number} b - Beta parameter
     * @param {number} x - Upper limit
     * @returns {number} Incomplete beta
     * @private
     */
    _incompleteBeta(a, b, x) {
        // Simple approximation for common use cases
        if (x === 0) return 0;
        if (x === 1) return 1;
        if (a === 0.5 && b === 0.5) {
            // Special case: use error function
            return 1 - this._erf(Math.sqrt(0.5) * Math.abs(2 * x - 1));
        }
        // Linear approximation as fallback
        return x;
    }

    /**
     * Calculate confidence interval for correlation coefficient
     * @param {number} r - Correlation coefficient
     * @param {number} n - Sample size
     * @returns {Object} { lower, upper, FisherZ }
     * @private
     */
    _correlationConfidenceInterval(r, n) {
        // Fisher's Z transformation
        const FisherZ = 0.5 * Math.log((1 + r) / (1 - r));

        // Standard error of Z
        const seZ = 1 / Math.sqrt(n - 3);

        // Z critical value for confidence level
        const zCritical = this._getZCritical(this.options.confidenceLevel);

        // Confidence interval in Z space
        const zLower = FisherZ - zCritical * seZ;
        const zUpper = FisherZ + zCritical * seZ;

        // Transform back to r space
        const lower = (Math.exp(2 * zLower) - 1) / (Math.exp(2 * zLower) + 1);
        const upper = (Math.exp(2 * zUpper) - 1) / (Math.exp(2 * zUpper) + 1);

        return {
            lower: Math.max(-1, Math.min(1, lower)),
            upper: Math.max(-1, Math.min(1, upper)),
            FisherZ,
            standardError: seZ
        };
    }

    /**
     * Get critical Z value for confidence level
     * @param {number} confidenceLevel - Confidence level (0-1)
     * @returns {number} Critical Z value
     * @private
     */
    _getZCritical(confidenceLevel) {
        // Approximate critical values for common confidence levels
        const criticalValues = {
            0.90: 1.645,
            0.95: 1.96,
            0.99: 2.576
        };
        return criticalValues[confidenceLevel] || 1.96;
    }

    /**
     * Perform comprehensive statistical comparison between two models
     * @param {string} modelId1 - First model ID
     * @param {string} modelId2 - Second model ID
     * @returns {Object} Statistical analysis results
     */
    compareModels(modelId1, modelId2) {
        const cacheKey = `${modelId1}_${modelId2}`;
        const now = performance.now();

        // Check cache
        if (this.statsCache.has(cacheKey)) {
            const cached = this.statsCache.get(cacheKey);
            if (now - cached.timestamp < this.cacheTTL) {
                return cached.results;
            }
        }

        // Get differential activity
        const differentials = this.multiModelTracker.getDifferentialActivity(modelId1, modelId2);
        const activity1 = this.multiModelTracker.getModelActivity(modelId1);
        const activity2 = this.multiModelTracker.getModelActivity(modelId2);

        // Extract intensity values for t-test
        const intensities1 = activity1.map(c => c.intensity);
        const intensities2 = activity2.map(c => c.intensity);

        // Calculate t-test
        const tTest = this._calculateTTest(intensities1, intensities2);

        // Get correlation
        const correlation = this.multiModelTracker.getCorrelation(modelId1, modelId2);

        // Calculate confidence interval
        const totalSamples = intensities1.length + intensities2.length;
        const confidenceInterval = this._correlationConfidenceInterval(correlation, totalSamples);

        // Categorize significance
        const significance = this._categorizeSignificance(tTest.pValue);

        // Analyze spatial differences
        const spatialAnalysis = this._analyzeSpatialDifferences(differentials);

        // Compile results
        const results = {
            modelId1,
            modelId2,
            modelInfo1: this.multiModelTracker.getModelInfo(modelId1),
            modelInfo2: this.multiModelTracker.getModelInfo(modelId2),

            // T-test results
            tTest: {
                tValue: tTest.tValue,
                degreesOfFreedom: tTest.degreesOfFreedom,
                pValue: tTest.pValue,
                reliable: tTest.reliable,
                mean1: tTest.mean1,
                mean2: tTest.mean2,
                meanDifference: tTest.mean1 - tTest.mean2,
                standardError: tTest.stdError
            },

            // Correlation analysis
            correlation: {
                coefficient: correlation,
                confidenceInterval,
                significant: Math.abs(correlation) > 0.3 && correlation !== 0
            },

            // Significance categorization
            significance: {
                level: significance.level,
                pValue: tTest.pValue,
                indicator: significance.indicator,
                isSignificant: tTest.pValue < this.options.significanceThreshold
            },

            // Spatial analysis
            spatial: spatialAnalysis,

            // Sample info
            samples: {
                model1: intensities1.length,
                model2: intensities2.length,
                total: totalSamples
            }
        };

        // Cache results
        this.statsCache.set(cacheKey, {
            timestamp: now,
            results
        });

        return results;
    }

    /**
     * Categorize significance level based on p-value
     * @param {number} pValue - P-value
     * @returns {Object} Significance level info
     * @private
     */
    _categorizeSignificance(pValue) {
        if (pValue < this.significanceLevels.high.threshold) {
            return { level: 'high', ...this.significanceLevels.high };
        } else if (pValue < this.significanceLevels.medium.threshold) {
            return { level: 'medium', ...this.significanceLevels.medium };
        } else if (pValue < this.significanceLevels.low.threshold) {
            return { level: 'low', ...this.significanceLevels.low };
        } else {
            return { level: 'none', ...this.significanceLevels.none };
        }
    }

    /**
     * Analyze spatial distribution of differences
     * @param {Array} differentials - Differential cells
     * @returns {Object} Spatial analysis results
     * @private
     */
    _analyzeSpatialDifferences(differentials) {
        if (differentials.length === 0) {
            return {
                totalDifferences: 0,
                significantDifferences: 0,
                meanAbsoluteDelta: 0,
                maxDelta: 0,
                clusters: []
            };
        }

        // Calculate statistics
        const absoluteDeltas = differentials.map(d => Math.abs(d.delta));
        const meanAbsoluteDelta = absoluteDeltas.reduce((a, b) => a + b, 0) / absoluteDeltas.length;
        const maxDelta = Math.max(...absoluteDeltas);

        // Count significant differences
        const significantDifferences = differentials.filter(d => Math.abs(d.delta) > 0.1).length;

        // Simple clustering (group nearby differences)
        const clusters = this._findDifferentialClusters(differentials);

        return {
            totalDifferences: differentials.length,
            significantDifferences,
            meanAbsoluteDelta,
            maxDelta,
            clusters
        };
    }

    /**
     * Find clusters of differential activity
     * @param {Array} differentials - Differential cells
     * @returns {Array} Array of clusters
     * @private
     */
    _findDifferentialClusters(differentials) {
        const clusters = [];
        const visited = new Set();
        const clusterThreshold = 50; // Pixels

        for (let i = 0; i < differentials.length; i++) {
            const key = `${differentials[i].x},${differentials[i].y}`;
            if (visited.has(key)) continue;

            const cluster = {
                cells: [differentials[i]],
                meanDelta: differentials[i].delta,
                center: { x: differentials[i].x, y: differentials[i].y }
            };

            // Find nearby cells
            for (let j = i + 1; j < differentials.length; j++) {
                const key2 = `${differentials[j].x},${differentials[j].y}`;
                if (visited.has(key2)) continue;

                const dx = differentials[j].x - cluster.center.x;
                const dy = differentials[j].y - cluster.center.y;
                const distance = Math.sqrt(dx * dx + dy * dy);

                if (distance < clusterThreshold) {
                    cluster.cells.push(differentials[j]);
                    cluster.meanDelta += differentials[j].delta;
                    visited.add(key2);
                }
            }

            if (cluster.cells.length > 1) {
                cluster.meanDelta /= cluster.cells.length;
                // Update center to centroid
                cluster.center.x = cluster.cells.reduce((s, c) => s + c.x, 0) / cluster.cells.length;
                cluster.center.y = cluster.cells.reduce((s, c) => s + c.y, 0) / cluster.cells.length;
                clusters.push(cluster);
            }

            visited.add(key);
        }

        return clusters;
    }

    /**
     * Get filtered differential cells based on significance threshold
     * @param {string} modelId1 - First model ID
     * @param {string} modelId2 - Second model ID
     * @param {Object} options - Filter options
     * @returns {Array} Filtered differential cells with significance info
     */
    getSignificantDifferentials(modelId1, modelId2, options = {}) {
        const filterOptions = {
            pValueThreshold: this.options.significanceThreshold,
            deltaThreshold: 0.1,
            includeIndicators: this.options.showIndicators,
            ...options
        };

        const comparison = this.compareModels(modelId1, modelId2);
        const differentials = this.multiModelTracker.getDifferentialActivity(modelId1, modelId2);

        // Filter by significance
        if (comparison.tTest.pValue > filterOptions.pValueThreshold) {
            return []; // Not significant overall
        }

        // Filter individual cells by delta threshold and add significance info
        return differentials
            .filter(d => Math.abs(d.delta) >= filterOptions.deltaThreshold)
            .map(d => ({
                ...d,
                significance: comparison.significance.level,
                indicator: filterOptions.includeIndicators ? comparison.significance.indicator : '',
                color: comparison.significance.color
            }));
    }

    /**
     * Generate a summary report for model comparison
     * @param {string} modelId1 - First model ID
     * @param {string} modelId2 - Second model ID
     * @returns {string} Formatted summary report
     */
    generateSummaryReport(modelId1, modelId2) {
        const results = this.compareModels(modelId1, modelId2);

        const lines = [
            `## Statistical Comparison Report`,
            ``,
            `**Models:**`,
            `- ${results.modelInfo1?.name || modelId1}`,
            `- ${results.modelInfo2?.name || modelId2}`,
            ``,
            `**T-Test Results:**`,
            `- t-statistic: ${results.tTest.tValue.toFixed(4)}`,
            `- Degrees of freedom: ${results.tTest.degreesOfFreedom}`,
            `- P-value: ${results.tTest.pValue.toExponential(4)}`,
            `- Mean difference: ${results.tTest.meanDifference.toFixed(4)}`,
            `- Significant: ${results.significance.isSignificant ? 'Yes' : 'No'} ${results.significance.indicator}`,
            ``,
            `**Correlation Analysis:**`,
            `- Correlation coefficient: ${results.correlation.coefficient.toFixed(4)}`,
            `- 95% CI: [${results.correlation.confidenceInterval.lower.toFixed(4)}, ${results.correlation.confidenceInterval.upper.toFixed(4)}]`,
            ``,
            `**Spatial Analysis:**`,
            `- Total differences: ${results.spatial.totalDifferences}`,
            `- Significant differences: ${results.spatial.significantDifferences}`,
            `- Mean absolute delta: ${results.spatial.meanAbsoluteDelta.toFixed(4)}`,
            `- Max delta: ${results.spatial.maxDelta.toFixed(4)}`,
            `- Clusters found: ${results.spatial.clusters.length}`
        ];

        return lines.join('\n');
    }

    /**
     * Highlight significant differentials on the heatmap with visual indicators
     * @param {PIXI.Container} container - Container to add highlights to
     * @param {string} modelId1 - First model ID
     * @param {string} modelId2 - Second model ID
     * @param {Object} options - Highlight options
     * @returns {PIXI.Container} Container with differential highlights
     */
    highlightDifferentials(container, modelId1, modelId2, options = {}) {
        if (typeof PIXI === 'undefined') {
            console.warn('[AdvancedDifferential] PIXI not available for highlighting');
            return null;
        }

        const highlightOptions = {
            pValueThreshold: options.pValueThreshold || this.options.significanceThreshold,
            deltaThreshold: options.deltaThreshold || 0.1,
            showIndicators: options.showIndicators !== false,
            mode: options.mode || 'both', // 'outline', 'fill', 'both'
            animate: options.animate !== false,
            gridSize: options.gridSize || 100,
            ...options
        };

        // Get significant differentials
        const differentials = this.getSignificantDifferentials(modelId1, modelId2, {
            pValueThreshold: highlightOptions.pValueThreshold,
            deltaThreshold: highlightOptions.deltaThreshold,
            includeIndicators: highlightOptions.showIndicators
        });

        // Create or get highlight container
        let highlightContainer = container.getChildByName('differentialHighlights');
        if (!highlightContainer) {
            highlightContainer = new PIXI.Container();
            highlightContainer.name = 'differentialHighlights';
            highlightContainer.zIndex = 202; // Above heatmap
            container.addChild(highlightContainer);
        }

        // Clear previous highlights
        highlightContainer.removeChildren();

        // Create visual indicators for each differential cell
        for (const diff of differentials) {
            const indicator = this._createDifferentialIndicator(diff, highlightOptions);
            if (indicator) {
                highlightContainer.addChild(indicator);
            }
        }

        console.log(`[AdvancedDifferential] Highlighted ${differentials.length} significant differentials`);
        return highlightContainer;
    }

    /**
     * Create a visual indicator for a differential cell
     * @private
     */
    _createDifferentialIndicator(differential, options) {
        const graphics = new PIXI.Graphics();
        const size = options.gridSize;
        const color = differential.color || 0xFF6600;
        const intensity = Math.min(Math.abs(differential.delta) * 5, 1); // Scale delta to 0-1
        const alpha = 0.3 + intensity * 0.5; // Higher delta = more opaque

        graphics.x = differential.x;
        graphics.y = differential.y;

        const mode = options.mode;

        // Fill mode
        if (mode === 'fill' || mode === 'both') {
            graphics.beginFill(color, alpha * 0.4);
            graphics.drawRect(0, 0, size, size);
            graphics.endFill();
        }

        // Outline mode
        if (mode === 'outline' || mode === 'both') {
            const lineWidth = 1 + intensity * 3; // Scale line width by delta
            graphics.lineStyle(lineWidth, color, alpha);
            graphics.drawRect(0, 0, size, size);
        }

        // Add significance indicator
        if (options.showIndicators && differential.indicator) {
            const indicatorSize = size * 0.15;
            const indicatorX = size - indicatorSize - 5;
            const indicatorY = size - indicatorSize - 5;

            // Draw indicator based on significance level
            const numStars = differential.indicator.length;
            for (let i = 0; i < numStars; i++) {
                graphics.beginFill(color, 0.9);
                const starX = indicatorX - (i * indicatorSize * 1.2);
                this._drawStar(graphics, starX, indicatorY, indicatorSize / 2, 5, 0.5);
                graphics.endFill();
            }
        }

        // Add animation if enabled
        if (options.animate && intensity > 0.5) {
            graphics.alpha = 0.5;
            const animSpeed = 0.02 + (intensity * 0.03);
            let direction = 1;

            graphics.updateAnimation = () => {
                graphics.alpha += animSpeed * direction;
                if (graphics.alpha >= 0.9) direction = -1;
                if (graphics.alpha <= 0.3) direction = 1;
            };

            // Store for animation loop
            if (!this._animatedIndicators) {
                this._animatedIndicators = [];
            }
            this._animatedIndicators.push(graphics);
        }

        return graphics;
    }

    /**
     * Draw a star shape
     * @private
     */
    _drawStar(graphics, x, y, radius, points, innerRatio) {
        const innerRadius = radius * innerRatio;
        const step = Math.PI / points;

        graphics.moveTo(x, y - radius);

        for (let i = 0; i < points * 2; i++) {
            const r = i % 2 === 0 ? radius : innerRadius;
            const angle = i * step - Math.PI / 2;
            graphics.lineTo(
                x + Math.cos(angle) * r,
                y + Math.sin(angle) * r
            );
        }

        graphics.closePath();
    }

    /**
     * Update animations for all animated indicators
     */
    updateAnimations() {
        if (this._animatedIndicators) {
            for (const indicator of this._animatedIndicators) {
                if (indicator.updateAnimation) {
                    indicator.updateAnimation();
                }
            }
        }
    }

    /**
     * Clear all highlights and stop animations
     */
    clearHighlights() {
        if (this._animatedIndicators) {
            this._animatedIndicators = [];
        }

        // Find and clear highlight containers
        const containers = [
            this.multiModelTracker?.container?.parent?.getChildByName('differentialHighlights')
        ].filter(Boolean);

        for (const container of containers) {
            if (container) {
                container.removeChildren();
            }
        }

        console.log('[AdvancedDifferential] Highlights cleared');
    }

    /**
     * Filter differential cells by threshold with visual cues
     * @param {Array} differentials - Differential cells to filter
     * @param {Object} thresholds - Threshold criteria
     * @returns {Object} Filtered results with visual cue information
     */
    filterByThreshold(differentials, thresholds = {}) {
        const filterCriteria = {
            pValue: thresholds.pValue || this.options.significanceThreshold,
            delta: thresholds.delta || 0.1,
            correlation: thresholds.correlation || 0,
            ...thresholds
        };

        const filtered = {
            high: [],      // p < 0.01, |delta| > 0.2
            medium: [],    // p < 0.05, |delta| > 0.1
            low: [],       // p < 0.10, |delta| > 0.05
            filtered: [],  // All significant
            total: differentials.length
        };

        for (const diff of differentials) {
            const absDelta = Math.abs(diff.delta || 0);
            const pValue = diff.pValue || 1;

            // Determine significance level
            if (pValue < 0.01 && absDelta > 0.2) {
                filtered.high.push({ ...diff, level: 'high', visualCue: '***' });
            } else if (pValue < 0.05 && absDelta > 0.1) {
                filtered.medium.push({ ...diff, level: 'medium', visualCue: '**' });
            } else if (pValue < 0.10 && absDelta > 0.05) {
                filtered.low.push({ ...diff, level: 'low', visualCue: '*' });
            }

            // Add to filtered if meets any threshold
            if (pValue < filterCriteria.pValue && absDelta >= filterCriteria.delta) {
                filtered.filtered.push({
                    ...diff,
                    visualCue: this._getVisualCue(pValue, absDelta),
                    color: this._getVisualColor(pValue, absDelta)
                });
            }
        }

        return filtered;
    }

    /**
     * Get visual cue indicator based on p-value and delta
     * @private
     */
    _getVisualCue(pValue, delta) {
        if (pValue < 0.001 && delta > 0.3) return '***';
        if (pValue < 0.01 && delta > 0.2) return '**';
        if (pValue < 0.05 && delta > 0.1) return '*';
        return '';
    }

    /**
     * Get visual color based on p-value and delta
     * @private
     */
    _getVisualColor(pValue, delta) {
        if (pValue < 0.01) return 0xFF0000;    // Red - highly significant
        if (pValue < 0.05) return 0xFF6600;    // Orange - significant
        if (pValue < 0.10) return 0xFFCC00;    // Yellow - marginal
        return 0x888888;                       // Gray - not significant
    }

    /**
     * Clear the statistics cache
     */
    clearCache() {
        this.statsCache.clear();
        this.cacheTimestamp = 0;
        console.log('[AdvancedDifferential] Cache cleared');
    }

    /**
     * Get current statistics
     * @returns {Object} Statistics
     */
    getStats() {
        return {
            cacheSize: this.statsCache.size,
            cacheAge: performance.now() - this.cacheTimestamp,
            options: { ...this.options }
        };
    }

    /**
     * Destroy the analyzer
     */
    destroy() {
        this.clearCache();
        this.clearHighlights();
        console.log('[AdvancedDifferential] Destroyed');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.AdvancedDifferential = AdvancedDifferential;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { AdvancedDifferential };
}
