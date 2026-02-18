/**
 * Geometry OS: Phase 20 - Track 1 (Final)
 * A/B Testing Framework for Layout Comparisons
 * 
 * Compares optimized layouts against original layouts to measure
 * cognitive load reduction, user preference, and task efficiency.
 * 
 * Metrics Tracked:
 * - Saccade distance reduction
 * - Time-to-target improvements
 * - Cognitive load scores
 * - User preference signals
 */

class LayoutABTestingFramework {
    constructor(options = {}) {
        this.config = {
            experimentDuration: options.experimentDuration || 60000, // 60 seconds
            minSampleSize: options.minSampleSize || 10,
            confidenceLevel: options.confidenceLevel || 0.95,
            trackInteractions: options.trackInteractions || true,
        };

        // Active experiments
        this.experiments = new Map();
        this.experimentHistory = [];

        // User interaction tracking
        this.interactions = [];
        this.interactionListeners = [];

        // Statistical helpers
        this.statistics = {
            tTest: this._tTest.bind(this),
            effectSize: this._cohenD.bind(this),
            confidenceInterval: this._confidenceInterval.bind(this),
        };

        console.log('[AB-TEST] Layout A/B Testing Framework initialized');
    }

    /**
     * Create a new A/B experiment
     * @param {string} experimentId - Unique experiment identifier
     * @param {object} controlLayout - Original layout (variant A)
     * @param {object} treatmentLayout - Optimized layout (variant B)
     * @param {object} options - Experiment options
     */
    createExperiment(experimentId, controlLayout, treatmentLayout, options = {}) {
        const experiment = {
            id: experimentId,
            name: options.name || `Experiment ${experimentId}`,
            hypothesis: options.hypothesis || 'Optimized layout reduces cognitive load',
            status: 'pending',
            createdAt: Date.now(),
            startedAt: null,
            endedAt: null,

            variants: {
                control: {
                    name: 'Original Layout',
                    layout: controlLayout,
                    metrics: [],
                    interactions: [],
                },
                treatment: {
                    name: 'Optimized Layout',
                    layout: treatmentLayout,
                    metrics: [],
                    interactions: [],
                },
            },

            // Which variant is currently active
            activeVariant: null,

            // Configuration
            config: {
                duration: options.duration || this.config.experimentDuration,
                autoSwitch: options.autoSwitch !== false,
                switchInterval: options.switchInterval || 30000, // 30 seconds per variant
            },

            // Results (populated on completion)
            results: null,
        };

        this.experiments.set(experimentId, experiment);
        console.log(`[AB-TEST] Created experiment: ${experimentId}`);

        return experiment;
    }

    /**
     * Start an experiment
     */
    startExperiment(experimentId) {
        const experiment = this.experiments.get(experimentId);
        if (!experiment) {
            console.error(`[AB-TEST] Experiment not found: ${experimentId}`);
            return false;
        }

        experiment.status = 'running';
        experiment.startedAt = Date.now();
        experiment.activeVariant = 'control';

        // Start with control layout
        this._applyVariant(experiment, 'control');

        // Set up auto-switching if enabled
        if (experiment.config.autoSwitch) {
            this._scheduleVariantSwitch(experiment);
        }

        // Set up experiment duration timer
        setTimeout(() => {
            this.endExperiment(experimentId);
        }, experiment.config.duration);

        console.log(`[AB-TEST] Started experiment: ${experimentId}`);
        return true;
    }

    /**
     * End an experiment and calculate results
     */
    endExperiment(experimentId) {
        const experiment = this.experiments.get(experimentId);
        if (!experiment || experiment.status !== 'running') {
            return null;
        }

        experiment.status = 'completed';
        experiment.endedAt = Date.now();

        // Calculate results
        experiment.results = this._calculateResults(experiment);

        // Store in history
        this.experimentHistory.push({
            id: experiment.id,
            name: experiment.name,
            results: experiment.results,
            completedAt: experiment.endedAt,
        });

        console.log(`[AB-TEST] Completed experiment: ${experimentId}`, experiment.results);

        // Emit completion event
        if (typeof window !== 'undefined') {
            window.dispatchEvent(new CustomEvent('AB_TEST_COMPLETE', {
                detail: { experimentId, results: experiment.results }
            }));
        }

        return experiment.results;
    }

    /**
     * Record a metric for the active variant
     */
    recordMetric(experimentId, metricName, value) {
        const experiment = this.experiments.get(experimentId);
        if (!experiment || experiment.status !== 'running') return;

        const variant = experiment.variants[experiment.activeVariant];
        variant.metrics.push({
            name: metricName,
            value: value,
            timestamp: Date.now(),
        });
    }

    /**
     * Record a user interaction
     */
    recordInteraction(experimentId, interactionType, details = {}) {
        const experiment = this.experiments.get(experimentId);
        if (!experiment || experiment.status !== 'running') return;

        const variant = experiment.variants[experiment.activeVariant];
        const interaction = {
            type: interactionType,
            details: details,
            timestamp: Date.now(),
            variant: experiment.activeVariant,
        };

        variant.interactions.push(interaction);
        this.interactions.push(interaction);
    }

    /**
     * Record saccade metrics from SaccadeEngine
     */
    recordSaccadeMetrics(experimentId, saccadeEngine) {
        if (!saccadeEngine) return;

        const metrics = saccadeEngine.getMetrics();
        this.recordMetric(experimentId, 'averagePairDistance', metrics.averagePairDistance);
        this.recordMetric(experimentId, 'layoutDensity', metrics.layoutDensity);
        this.recordMetric(experimentId, 'saccadeReduction', metrics.estimatedSaccadeReduction);
    }

    /**
     * Record LayoutGAN proposal metrics
     */
    recordLayoutGANMetrics(experimentId, proposal) {
        if (!proposal) return;

        this.recordMetric(experimentId, 'proposalConfidence', proposal.confidence);
        this.recordMetric(experimentId, 'semanticGroups', proposal.semanticGroups?.length || 0);
    }

    /**
     * Quick A/B test comparing current layout to a LayoutGAN proposal
     */
    async quickCompare(saccadeEngine, layoutGAN, durationMs = 10000) {
        if (!saccadeEngine || !layoutGAN) {
            console.error('[AB-TEST] SaccadeEngine and LayoutGAN required');
            return null;
        }

        const experimentId = `quick_${Date.now()}`;

        // Capture current layout as control
        const controlLayout = this._captureCurrentLayout(saccadeEngine);

        // Generate optimized layout as treatment
        const proposals = layoutGAN.generateProposals(saccadeEngine.elements);
        if (!proposals || proposals.length === 0) {
            console.error('[AB-TEST] No proposals generated');
            return null;
        }

        const treatmentLayout = this._proposalToLayout(proposals[0]);

        // Create experiment
        const experiment = this.createExperiment(experimentId, controlLayout, treatmentLayout, {
            name: 'Quick Layout Comparison',
            hypothesis: 'LayoutGAN proposal reduces cognitive load',
            duration: durationMs,
            switchInterval: durationMs / 2,
        });

        // Start experiment
        this.startExperiment(experimentId);

        // Return promise that resolves with results
        return new Promise((resolve) => {
            const handler = (e) => {
                if (e.detail.experimentId === experimentId) {
                    window.removeEventListener('AB_TEST_COMPLETE', handler);
                    resolve(e.detail.results);
                }
            };
            window.addEventListener('AB_TEST_COMPLETE', handler);
        });
    }

    // Private methods

    _applyVariant(experiment, variantName) {
        const variant = experiment.variants[variantName];
        experiment.activeVariant = variantName;

        console.log(`[AB-TEST] Applying variant: ${variantName}`);

        // Emit variant change event
        if (typeof window !== 'undefined') {
            window.dispatchEvent(new CustomEvent('AB_VARIANT_CHANGE', {
                detail: {
                    experimentId: experiment.id,
                    variant: variantName,
                    layout: variant.layout,
                }
            }));
        }
    }

    _scheduleVariantSwitch(experiment) {
        const switchTimer = setInterval(() => {
            if (experiment.status !== 'running') {
                clearInterval(switchTimer);
                return;
            }

            // Toggle variant
            const newVariant = experiment.activeVariant === 'control' ? 'treatment' : 'control';
            this._applyVariant(experiment, newVariant);
        }, experiment.config.switchInterval);
    }

    _captureCurrentLayout(saccadeEngine) {
        const layout = [];
        for (const [id, elem] of saccadeEngine.elements) {
            layout.push({
                id: id,
                x: elem.x,
                y: elem.y,
                width: elem.width,
                height: elem.height,
                importance: elem.importance,
                type: elem.type,
            });
        }
        return layout;
    }

    _proposalToLayout(proposal) {
        return proposal.deltas.map(delta => ({
            id: delta.elementId,
            x: delta.proposedX,
            y: delta.proposedY,
            dx: delta.dx,
            dy: delta.dy,
        }));
    }

    _calculateResults(experiment) {
        const control = experiment.variants.control;
        const treatment = experiment.variants.treatment;

        // Extract metric values by name
        const getMetricValues = (variant, metricName) => {
            return variant.metrics
                .filter(m => m.name === metricName)
                .map(m => m.value);
        };

        // Calculate statistics for each metric type
        const metricNames = [...new Set(control.metrics.map(m => m.name))];
        const comparisons = {};

        for (const metricName of metricNames) {
            const controlValues = getMetricValues(control, metricName);
            const treatmentValues = getMetricValues(treatment, metricName);

            if (controlValues.length < 2 || treatmentValues.length < 2) {
                comparisons[metricName] = { insufficient_data: true };
                continue;
            }

            const controlMean = this._mean(controlValues);
            const treatmentMean = this._mean(treatmentValues);
            const controlStd = this._std(controlValues);
            const treatmentStd = this._std(treatmentValues);

            // Statistical tests
            const tTestResult = this._tTest(controlValues, treatmentValues);
            const effectSize = this._cohenD(controlValues, treatmentValues);

            comparisons[metricName] = {
                control: {
                    mean: controlMean,
                    std: controlStd,
                    n: controlValues.length,
                },
                treatment: {
                    mean: treatmentMean,
                    std: treatmentStd,
                    n: treatmentValues.length,
                },
                difference: treatmentMean - controlMean,
                percentChange: ((treatmentMean - controlMean) / controlMean) * 100,
                tStatistic: tTestResult.t,
                pValue: tTestResult.p,
                effectSize: effectSize,
                significant: tTestResult.p < (1 - this.config.confidenceLevel),
            };
        }

        // Determine winner
        const significantImprovements = Object.values(comparisons)
            .filter(c => c.significant && c.difference > 0).length;
        const significantRegressions = Object.values(comparisons)
            .filter(c => c.significant && c.difference < 0).length;

        let winner = 'tie';
        if (significantImprovements > significantRegressions) {
            winner = 'treatment';
        } else if (significantRegressions > significantImprovements) {
            winner = 'control';
        }

        return {
            experimentId: experiment.id,
            duration: experiment.endedAt - experiment.startedAt,
            comparisons: comparisons,
            winner: winner,
            recommendation: this._generateRecommendation(winner, comparisons),
            summary: {
                controlInteractions: control.interactions.length,
                treatmentInteractions: treatment.interactions.length,
                metricsAnalyzed: metricNames.length,
                significantResults: Object.values(comparisons).filter(c => c.significant).length,
            },
        };
    }

    _generateRecommendation(winner, comparisons) {
        if (winner === 'treatment') {
            return 'Deploy the optimized layout. Significant improvements detected.';
        } else if (winner === 'control') {
            return 'Keep the original layout. Optimized layout showed regressions.';
        } else {
            return 'No significant difference. Consider running a longer experiment.';
        }
    }

    // Statistical helper functions

    _mean(arr) {
        return arr.reduce((a, b) => a + b, 0) / arr.length;
    }

    _std(arr) {
        const mean = this._mean(arr);
        const squaredDiffs = arr.map(x => Math.pow(x - mean, 2));
        return Math.sqrt(this._mean(squaredDiffs));
    }

    _tTest(sample1, sample2) {
        const n1 = sample1.length;
        const n2 = sample2.length;
        const mean1 = this._mean(sample1);
        const mean2 = this._mean(sample2);
        const var1 = this._variance(sample1);
        const var2 = this._variance(sample2);

        // Pooled standard error
        const se = Math.sqrt(var1 / n1 + var2 / n2);
        const t = (mean1 - mean2) / se;
        const df = n1 + n2 - 2;

        // Approximate p-value using normal distribution for large samples
        const p = 2 * (1 - this._normalCDF(Math.abs(t)));

        return { t, p, df };
    }

    _variance(arr) {
        const mean = this._mean(arr);
        return arr.reduce((sum, x) => sum + Math.pow(x - mean, 2), 0) / (arr.length - 1);
    }

    _cohenD(sample1, sample2) {
        const mean1 = this._mean(sample1);
        const mean2 = this._mean(sample2);
        const pooledStd = Math.sqrt(
            ((sample1.length - 1) * this._variance(sample1) +
                (sample2.length - 1) * this._variance(sample2)) /
            (sample1.length + sample2.length - 2)
        );
        return (mean2 - mean1) / pooledStd;
    }

    _confidenceInterval(arr, confidence = 0.95) {
        const mean = this._mean(arr);
        const std = this._std(arr);
        const n = arr.length;
        const z = 1.96; // 95% confidence
        const margin = z * (std / Math.sqrt(n));
        return { lower: mean - margin, upper: mean + margin };
    }

    _normalCDF(x) {
        // Approximation of the normal CDF
        const a1 = 0.254829592;
        const a2 = -0.284496736;
        const a3 = 1.421413741;
        const a4 = -1.453152027;
        const a5 = 1.061405429;
        const p = 0.3275911;

        const sign = x < 0 ? -1 : 1;
        x = Math.abs(x) / Math.sqrt(2);

        const t = 1.0 / (1.0 + p * x);
        const y = 1 - (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * Math.exp(-x * x);

        return 0.5 * (1 + sign * y);
    }

    /**
     * Get framework statistics
     */
    getStats() {
        return {
            activeExperiments: [...this.experiments.values()].filter(e => e.status === 'running').length,
            completedExperiments: this.experimentHistory.length,
            totalInteractions: this.interactions.length,
            config: this.config,
        };
    }

    /**
     * Get all experiment results
     */
    getExperimentHistory() {
        return this.experimentHistory;
    }
}

// Export for use in Visual Shell
if (typeof window !== 'undefined') {
    window.LayoutABTestingFramework = LayoutABTestingFramework;
}

// Node.js / ES Module export
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LayoutABTestingFramework };
}
