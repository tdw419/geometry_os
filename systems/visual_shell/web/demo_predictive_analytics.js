/**
 * Demo: Predictive Analytics Engine
 *
 * Demonstrates the predictive analytics capabilities for neural activity forecasting.
 * Part of: Neural Heatmap Phase 2.3
 *
 * Run this demo by adding ?demo=predictive to the URL
 */

class DemoPredictiveAnalytics {
    constructor() {
        this.analytics = null;
        this.visualizer = null;
        this.demoInterval = null;
        this.dataPoints = 0;
    }

    /**
     * Initialize the demo
     */
    async init() {
        console.log('=== Predictive Analytics Demo ===\n');

        // Initialize predictive analytics
        if (typeof PredictiveAnalytics === 'undefined') {
            console.error('PredictiveAnalytics not available. Please include predictive_analytics.js');
            return;
        }

        this.analytics = new PredictiveAnalytics({
            lookbackWindow: 20,
            predictionHorizon: 10,
            enableOnlineLearning: true
        });

        console.log('✓ Predictive Analytics initialized');
        console.log('  TensorFlow.js available:', this.analytics.tfAvailable);

        // Generate initial synthetic data
        console.log('\nGenerating synthetic neural activity data...');
        await this.generateSyntheticData();

        // Create visualization overlay
        this.createVisualization();

        // Start live data feed
        console.log('\nStarting live data feed...');
        this.startLiveDataFeed();

        // Run predictions
        console.log('\nRunning forecasts...');
        await this.runForecasts();

        // Display statistics
        this.displayStatistics();

        console.log('\nDemo running. Predictions will update every 5 seconds.');
        console.log('Open browser console to see detailed logs.');
    }

    /**
     * Generate synthetic neural activity data
     */
    async generateSyntheticData() {
        const patterns = [
            // Sine wave pattern
            (t) => 0.5 + Math.sin(t * 0.5) * 0.3,
            // Increasing trend
            (t) => 0.3 + (t % 50) / 50 * 0.4,
            // Burst pattern
            (t) => Math.random() > 0.9 ? 0.9 : 0.2 + Math.random() * 0.2
        ];

        // Generate 100 data points with mixed patterns
        for (let i = 0; i < 100; i++) {
            const patternIndex = Math.floor(i / 33) % patterns.length;
            const baseValue = patterns[patternIndex](i);
            const noise = (Math.random() - 0.5) * 0.1;
            const value = Math.max(0, Math.min(1, baseValue + noise));

            this.analytics.recordData('demo-neural-activity', value, [value, Math.random()]);
            this.dataPoints++;
        }

        console.log(`  Generated ${this.dataPoints} data points`);
    }

    /**
     * Create visualization overlay
     */
    createVisualization() {
        if (typeof PIXI === 'undefined') {
            console.log('  (PIXI not available, skipping visualization)');
            return;
        }

        // Create container
        const container = new PIXI.Container();
        container.x = 20;
        container.y = 20;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x0a0a1a, 0.95);
        bg.lineStyle(1, 0xFF00FF, 0.3);
        bg.drawRoundedRect(0, 0, 400, 500, 10);
        bg.endFill();
        container.addChild(bg);

        // Title
        const title = new PIXI.Text('Predictive Analytics Demo', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 16,
            fontWeight: 'bold',
            fill: 0xFF00FF
        });
        title.x = 15;
        title.y = 15;
        container.addChild(title);

        // Stats text
        this.statsText = new PIXI.Text('', {
            fontFamily: 'Courier New, monospace',
            fontSize: 11,
            fill: 0x00FF88
        });
        this.statsText.x = 15;
        this.statsText.y = 45;
        container.addChild(this.statsText);

        // Prediction display
        this.predictionText = new PIXI.Text('', {
            fontFamily: 'Courier New, monospace',
            fontSize: 10,
            fill: 0x9370DB
        });
        this.predictionText.x = 15;
        this.predictionText.y = 200;
        container.addChild(this.predictionText);

        // Add to stage if available
        if (window.app && window.app.app && window.app.app.stage) {
            window.app.app.stage.addChild(container);
        }

        this.container = container;
        console.log('  Visualization created');
    }

    /**
     * Start live data feed simulation
     */
    startLiveDataFeed() {
        this.demoInterval = setInterval(() => {
            const time = Date.now() / 1000;
            const value = 0.5 + Math.sin(time * 0.5) * 0.2 + (Math.random() - 0.5) * 0.1;

            this.analytics.recordData('demo-neural-activity', value, [value, Math.random()]);
            this.dataPoints++;

            // Update visualization
            this.updateVisualization();

            // Generate new prediction every 5 seconds
            if (this.dataPoints % 25 === 0) {
                this.runForecasts();
            }

        }, 200); // New data point every 200ms
    }

    /**
     * Run forecasts
     */
    async runForecasts() {
        try {
            const predictions = await this.analytics.forecast('demo-neural-activity', {
                horizon: 10,
                confidence: 0.95
            });

            console.log('\n📊 Forecast Results:');
            console.log(`  Model: ${predictions.modelId}`);
            console.log(`  Method: ${predictions.method}`);
            console.log(`  Confidence: ${predictions.confidence}`);

            predictions.values.forEach((value, i) => {
                const marker = value.isAnomaly ? '⚠️ ' : '  ';
                console.log(`  ${marker}t+${value.step}: ${value.mean.toFixed(3)} ± [${value.confidence.lower.toFixed(3)}, ${value.confidence.upper.toFixed(3)}]`);
            });

            this.currentPredictions = predictions;
            this.updateVisualization();

        } catch (error) {
            console.error('Forecast failed:', error);
        }
    }

    /**
     * Update visualization
     */
    updateVisualization() {
        if (!this.container) return;

        // Update stats
        const stats = this.analytics.getStatistics('demo-neural-activity');
        const metrics = this.analytics.getMetrics();

        let statsStr = 'Statistics:\n';
        statsStr += `━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n`;
        statsStr += `Data Points: ${stats?.dataPoints || 0}\n`;
        statsStr += `Mean: ${stats?.mean.toFixed(4) || 'N/A'}\n`;
        statsStr += `Std Dev: ${stats?.std.toFixed(4) || 'N/A'}\n`;
        statsStr += `Range: [${stats?.min.toFixed(3) || 'N/A'}, ${stats?.max.toFixed(3) || 'N/A'}]\n\n`;

        statsStr += 'Model Metrics:\n';
        statsStr += `━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n`;
        statsStr += `Models: ${metrics.models}\n`;
        statsStr += `Predictions: ${metrics.predictionsMade}\n`;
        statsStr += `Avg Time: ${metrics.avgPredictionTime.toFixed(1)}ms\n`;
        statsStr += `Anomalies: ${metrics.anomaliesDetected}\n`;

        this.statsText.text = statsStr;

        // Update predictions display
        if (this.currentPredictions) {
            let predStr = 'Current Forecast (95% CI):\n';
            predStr += '━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n';

            this.currentPredictions.values.slice(0, 5).forEach((value, i) => {
                const bar = this.createBar(value.mean, 30);
                const anomaly = value.isAnomaly ? ' ⚠️' : '';
                predStr += `t+${value.step}: ${bar} ${value.mean.toFixed(2)}${anomaly}\n`;
            });

            if (this.currentPredictions.values.length > 5) {
                predStr += `... and ${this.currentPredictions.values.length - 5} more\n`;
            }

            this.predictionText.text = predStr;
        }
    }

    /**
     * Create text bar for visualization
     */
    createBar(value, width) {
        const filled = Math.round(value * width);
        const empty = width - filled;
        return '█'.repeat(filled) + '░'.repeat(empty);
    }

    /**
     * Display statistics in console
     */
    displayStatistics() {
        const stats = this.analytics.getStatistics('demo-neural-activity');
        const metrics = this.analytics.getMetrics();

        console.log('\n📈 Statistics:');
        console.log(`  Data Points: ${stats.dataPoints}`);
        console.log(`  Mean: ${stats.mean.toFixed(4)}`);
        console.log(`  Std Dev: ${stats.std.toFixed(4)}`);
        console.log(`  Range: [${stats.min.toFixed(3)}, ${stats.max.toFixed(3)}]`);

        console.log('\n⚡ Model Metrics:');
        console.log(`  Models Trained: ${metrics.modelsTrained}`);
        console.log(`  Predictions Made: ${metrics.predictionsMade}`);
        console.log(`  Anomalies Detected: ${metrics.anomaliesDetected}`);
        console.log(`  Avg Prediction Time: ${metrics.avgPredictionTime.toFixed(1)}ms`);
    }

    /**
     * Stop the demo
     */
    stop() {
        if (this.demoInterval) {
            clearInterval(this.demoInterval);
            this.demoInterval = null;
        }

        if (this.analytics) {
            this.analytics.destroy();
        }

        if (this.container) {
            this.container.destroy();
        }

        console.log('Demo stopped.');
    }
}

// Auto-start if flag is set
if (typeof window !== 'undefined' && window.location.search.includes('demo=predictive')) {
    window.onload = async () => {
        // Wait for other scripts to load
        await new Promise(resolve => setTimeout(resolve, 1000));

        const demo = new DemoPredictiveAnalytics();
        await demo.init();

        // Expose globally for console access
        window.demoPredictive = demo;
        console.log('\n💡 Tip: Access demo via window.demoPredictive');
        console.log('   - demoPredictive.stop() to stop');
        console.log('   - demoPredictive.runForecasts() to manually forecast');
    };
}

// Export for module systems
if (typeof window !== 'undefined') {
    window.DemoPredictiveAnalytics = DemoPredictiveAnalytics;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { DemoPredictiveAnalytics };
}
