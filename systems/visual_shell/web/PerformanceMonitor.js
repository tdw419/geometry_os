/**
 * Geometry OS: Performance Monitor
 *
 * Real-time performance monitoring for Pixel CPU integration.
 * Tracks execution time, FPS, memory usage, and instruction/cycle counts
 * using a rolling window of 1000 samples with anomaly detection.
 */

class PerformanceMonitor {
    /**
     * Create a new PerformanceMonitor instance
     * @param {Object} config - Configuration options
     */
    constructor(config = {}) {
        this.config = {
            sampleWindowSize: 1000,      // Number of samples in rolling window
            anomalyThreshold: 2.0,       // Multiplier for anomaly detection (2x spike)
            fpsUpdateInterval: 500,     // Milliseconds between FPS updates
            memoryCheckInterval: 1000,  // Milliseconds between memory checks
            overlayWidth: 280,          // Width of performance overlay
            overlayHeight: 320,         // Height of performance overlay
            overlayX: 10,               // X position of overlay
            overlayY: 430,              // Y position of overlay (below CPU state)
            showGraphs: true,           // Show performance graphs
            showMetrics: true,          // Show metric values
            ...config
        };

        // Rolling window buffers (circular buffers for efficiency)
        this.sampleIndex = 0;
        this.sampleCount = 0;
        this.executionTimes = new Float64Array(this.config.sampleWindowSize);
        this.frameTimes = new Float64Array(this.config.sampleWindowSize);
        this.memoryUsage = new Float64Array(this.config.sampleWindowSize);
        this.instructionCounts = new Float64Array(this.config.sampleWindowSize);
        this.cycleCounts = new Float64Array(this.config.sampleWindowSize);

        // FPS tracking
        this.lastFrameTime = performance.now();
        this.fps = 60;
        this.fpsSamples = [];
        this.lastFpsUpdate = 0;

        // Memory tracking
        this.lastMemoryCheck = 0;
        this.currentMemoryUsage = 0;

        // Anomaly detection
        this.anomalies = [];
        this.maxAnomalies = 10;
        this.meanExecutionTime = 0;
        this.stdDevExecutionTime = 0;

        // Statistics
        this.totalFrames = 0;
        this.totalExecutionTime = 0;
        this.minExecutionTime = Infinity;
        this.maxExecutionTime = 0;
        this.totalInstructions = 0;
        this.totalCycles = 0;

        // Visual components
        this.overlay = null;
        this.fpsText = null;
        this.executionTimeText = null;
        this.memoryText = null;
        this.instructionText = null;
        this.cycleText = null;
        this.anomalyText = null;
        this.graphs = [];

        // Graph data
        this.executionTimeGraph = null;
        this.fpsGraph = null;

        // Performance of the monitor itself
        this.monitorOverhead = 0;

        console.log('✓ PerformanceMonitor initialized');
    }

    /**
     * Record a frame's performance metrics
     * @param {number} executionTime - Time spent executing CPU (ms)
     * @param {number} instructionCount - Number of instructions executed
     * @param {number} cycleCount - Number of cycles executed
     */
    recordFrame(executionTime, instructionCount = 0, cycleCount = 0) {
        const monitorStart = performance.now();

        // Calculate frame time
        const now = performance.now();
        const frameTime = now - this.lastFrameTime;
        this.lastFrameTime = now;

        // Update FPS
        this.updateFps(frameTime);

        // Check memory usage periodically
        if (now - this.lastMemoryCheck > this.config.memoryCheckInterval) {
            this.updateMemoryUsage();
            this.lastMemoryCheck = now;
        }

        // Store samples in rolling window
        const idx = this.sampleIndex;
        this.executionTimes[idx] = executionTime;
        this.frameTimes[idx] = frameTime;
        this.instructionCounts[idx] = instructionCount;
        this.cycleCounts[idx] = cycleCount;
        this.memoryUsage[idx] = this.currentMemoryUsage;

        // Update sample tracking
        this.sampleIndex = (this.sampleIndex + 1) % this.config.sampleWindowSize;
        this.sampleCount = Math.min(this.sampleCount + 1, this.config.sampleWindowSize);

        // Update statistics
        this.totalFrames++;
        this.totalExecutionTime += executionTime;
        this.totalInstructions += instructionCount;
        this.totalCycles += cycleCount;
        this.minExecutionTime = Math.min(this.minExecutionTime, executionTime);
        this.maxExecutionTime = Math.max(this.maxExecutionTime, executionTime);

        // Update mean and standard deviation for anomaly detection
        this.updateStatistics();

        // Check for anomalies
        this.checkForAnomalies(executionTime);

        // Track monitor overhead
        this.monitorOverhead = performance.now() - monitorStart;
    }

    /**
     * Update FPS calculation
     * @param {number} frameTime - Time since last frame (ms)
     */
    updateFps(frameTime) {
        const fps = 1000 / frameTime;
        this.fpsSamples.push(fps);
        if (this.fpsSamples.length > 60) {
            this.fpsSamples.shift();
        }

        // Update FPS display periodically
        const now = performance.now();
        if (now - this.lastFpsUpdate > this.config.fpsUpdateInterval) {
            this.fps = this.fpsSamples.reduce((a, b) => a + b, 0) / this.fpsSamples.length;
            this.lastFpsUpdate = now;
        }
    }

    /**
     * Update memory usage from performance API
     */
    updateMemoryUsage() {
        if (performance.memory) {
            this.currentMemoryUsage = performance.memory.usedJSHeapSize / (1024 * 1024); // MB
        } else {
            // Fallback: estimate based on sample count
            this.currentMemoryUsage = (this.sampleCount * 32) / (1024 * 1024); // ~32 bytes per sample
        }
    }

    /**
     * Update mean and standard deviation for anomaly detection
     */
    updateStatistics() {
        const count = this.sampleCount;
        if (count < 10) return; // Need minimum samples

        // Calculate mean
        let sum = 0;
        for (let i = 0; i < count; i++) {
            sum += this.executionTimes[i];
        }
        this.meanExecutionTime = sum / count;

        // Calculate standard deviation
        let variance = 0;
        for (let i = 0; i < count; i++) {
            const diff = this.executionTimes[i] - this.meanExecutionTime;
            variance += diff * diff;
        }
        this.stdDevExecutionTime = Math.sqrt(variance / count);
    }

    /**
     * Check for anomalies in execution time
     * @param {number} executionTime - Current execution time
     */
    checkForAnomalies(executionTime) {
        if (this.sampleCount < 10) return; // Need minimum samples

        const threshold = this.meanExecutionTime * this.config.anomalyThreshold;

        if (executionTime > threshold && executionTime > 1.0) {
            const anomaly = {
                timestamp: Date.now(),
                executionTime: executionTime,
                mean: this.meanExecutionTime,
                threshold: threshold,
                multiplier: executionTime / this.meanExecutionTime
            };

            this.anomalies.unshift(anomaly);
            if (this.anomalies.length > this.maxAnomalies) {
                this.anomalies.pop();
            }

            console.warn(`⚠ Performance anomaly detected: ${executionTime.toFixed(2)}ms (${anomaly.multiplier.toFixed(1)}x mean)`);
        }
    }

    /**
     * Get current performance statistics
     * @returns {Object} - Performance statistics
     */
    getStats() {
        const count = this.sampleCount;
        const avgExecutionTime = count > 0 ? this.totalExecutionTime / count : 0;
        const avgInstructions = count > 0 ? this.totalInstructions / count : 0;
        const avgCycles = count > 0 ? this.totalCycles / count : 0;

        return {
            fps: this.fps,
            executionTime: {
                current: count > 0 ? this.executionTimes[(this.sampleIndex - 1 + count) % count] : 0,
                average: avgExecutionTime,
                min: this.minExecutionTime,
                max: this.maxExecutionTime,
                mean: this.meanExecutionTime,
                stdDev: this.stdDevExecutionTime
            },
            memory: {
                current: this.currentMemoryUsage,
                average: count > 0 ? this.memoryUsage.reduce((a, b) => a + b, 0) / count : 0
            },
            instructions: {
                current: count > 0 ? this.instructionCounts[(this.sampleIndex - 1 + count) % count] : 0,
                average: avgInstructions,
                total: this.totalInstructions
            },
            cycles: {
                current: count > 0 ? this.cycleCounts[(this.sampleIndex - 1 + count) % count] : 0,
                average: avgCycles,
                total: this.totalCycles
            },
            samples: count,
            totalFrames: this.totalFrames,
            monitorOverhead: this.monitorOverhead,
            anomalies: this.anomalies
        };
    }

    /**
     * Get recent execution times for graphing
     * @param {number} count - Number of samples to return
     * @returns {Array} - Array of execution times
     */
    getExecutionTimeHistory(count = 100) {
        const result = [];
        const actualCount = Math.min(count, this.sampleCount);
        for (let i = 0; i < actualCount; i++) {
            const idx = (this.sampleIndex - 1 - i + this.config.sampleWindowSize) % this.config.sampleWindowSize;
            result.push(this.executionTimes[idx]);
        }
        return result;
    }

    /**
     * Get recent FPS history for graphing
     * @param {number} count - Number of samples to return
     * @returns {Array} - Array of FPS values
     */
    getFpsHistory(count = 100) {
        const result = [];
        const actualCount = Math.min(count, this.sampleCount);
        for (let i = 0; i < actualCount; i++) {
            const idx = (this.sampleIndex - 1 - i + this.config.sampleWindowSize) % this.config.sampleWindowSize;
            const frameTime = this.frameTimes[idx];
            result.push(frameTime > 0 ? 1000 / frameTime : 60);
        }
        return result;
    }

    /**
     * Create performance overlay UI
     * @param {Object} infiniteMap - Reference to InfiniteMap instance
     */
    createOverlay(infiniteMap) {
        const container = new PIXI.Container();
        container.x = this.config.overlayX;
        container.y = this.config.overlayY;
        container.zIndex = 1000;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.85);
        bg.lineStyle(2, 0x00AAFF, 1);
        bg.drawRoundedRect(0, 0, this.config.overlayWidth, this.config.overlayHeight, 8);
        bg.endFill();
        container.addChild(bg);

        // Title
        const title = new PIXI.Text('📊 Performance', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 14,
            fontWeight: 'bold',
            fill: 0x00AAFF
        });
        title.x = 10;
        title.y = 10;
        container.addChild(title);

        // FPS display
        this.fpsText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 11,
            fill: 0x00FF00
        });
        this.fpsText.x = 10;
        this.fpsText.y = 35;
        container.addChild(this.fpsText);

        // Execution time display
        this.executionTimeText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 11,
            fill: 0xFFFFFF
        });
        this.executionTimeText.x = 10;
        this.executionTimeText.y = 55;
        container.addChild(this.executionTimeText);

        // Memory display
        this.memoryText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 11,
            fill: 0xFFFFFF
        });
        this.memoryText.x = 10;
        this.memoryText.y = 75;
        container.addChild(this.memoryText);

        // Instruction display
        this.instructionText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 11,
            fill: 0xFFFFFF
        });
        this.instructionText.x = 10;
        this.instructionText.y = 95;
        container.addChild(this.instructionText);

        // Cycle display
        this.cycleText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 11,
            fill: 0xFFFFFF
        });
        this.cycleText.x = 10;
        this.cycleText.y = 115;
        container.addChild(this.cycleText);

        // Anomaly display
        this.anomalyText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 10,
            fill: 0xFF4444
        });
        this.anomalyText.x = 10;
        this.anomalyText.y = 135;
        container.addChild(this.anomalyText);

        // Create graphs if enabled
        if (this.config.showGraphs) {
            this.createGraphs(container);
        }

        // Add to infinite map
        infiniteMap.world.addChild(container);
        this.overlay = container;

        console.log('✓ Performance monitor overlay created');
    }

    /**
     * Create performance graphs
     * @param {Object} container - Container to add graphs to
     */
    createGraphs(container) {
        const graphWidth = this.config.overlayWidth - 20;
        const graphHeight = 60;

        // Execution time graph
        const execGraphContainer = new PIXI.Container();
        execGraphContainer.x = 10;
        execGraphContainer.y = 160;

        const execGraphBg = new PIXI.Graphics();
        execGraphBg.beginFill(0x111111, 1);
        execGraphBg.lineStyle(1, 0x333333, 1);
        execGraphBg.drawRect(0, 0, graphWidth, graphHeight);
        execGraphBg.endFill();
        execGraphContainer.addChild(execGraphBg);

        const execGraphLine = new PIXI.Graphics();
        execGraphContainer.addChild(execGraphLine);
        this.executionTimeGraph = execGraphLine;

        const execGraphLabel = new PIXI.Text('Exec Time (ms)', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 9,
            fill: 0x888888
        });
        execGraphLabel.x = 5;
        execGraphLabel.y = 2;
        execGraphContainer.addChild(execGraphLabel);

        container.addChild(execGraphContainer);

        // FPS graph
        const fpsGraphContainer = new PIXI.Container();
        fpsGraphContainer.x = 10;
        fpsGraphContainer.y = 230;

        const fpsGraphBg = new PIXI.Graphics();
        fpsGraphBg.beginFill(0x111111, 1);
        fpsGraphBg.lineStyle(1, 0x333333, 1);
        fpsGraphBg.drawRect(0, 0, graphWidth, graphHeight);
        fpsGraphBg.endFill();
        fpsGraphContainer.addChild(fpsGraphBg);

        const fpsGraphLine = new PIXI.Graphics();
        fpsGraphContainer.addChild(fpsGraphLine);
        this.fpsGraph = fpsGraphLine;

        const fpsGraphLabel = new PIXI.Text('FPS', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 9,
            fill: 0x888888
        });
        fpsGraphLabel.x = 5;
        fpsGraphLabel.y = 2;
        fpsGraphContainer.addChild(fpsGraphLabel);

        container.addChild(fpsGraphContainer);
    }

    /**
     * Update performance overlay display
     */
    updateDisplay() {
        if (!this.overlay) return;

        const stats = this.getStats();

        // Update text displays
        if (this.config.showMetrics) {
            const fpsColor = stats.fps >= 55 ? 0x00FF00 : (stats.fps >= 30 ? 0xFFAA00 : 0xFF4444);
            this.fpsText.style.fill = fpsColor;
            this.fpsText.text = `FPS: ${stats.fps.toFixed(1)}`;

            const execColor = stats.executionTime.current < 5 ? 0x00FF00 : (stats.executionTime.current < 10 ? 0xFFAA00 : 0xFF4444);
            this.executionTimeText.style.fill = execColor;
            this.executionTimeText.text = `Exec: ${stats.executionTime.current.toFixed(2)}ms ` +
                `(avg: ${stats.executionTime.average.toFixed(2)}ms)`;

            this.memoryText.text = `Memory: ${stats.memory.current.toFixed(2)}MB ` +
                `(avg: ${stats.memory.average.toFixed(2)}MB)`;

            this.instructionText.text = `Instr: ${stats.instructions.current} ` +
                `(avg: ${stats.instructions.average.toFixed(0)}/frame)`;

            this.cycleText.text = `Cycles: ${stats.cycles.current} ` +
                `(total: ${(stats.cycles.total / 1000000).toFixed(2)}M)`;

            // Show recent anomaly if any
            if (stats.anomalies.length > 0) {
                const latest = stats.anomalies[0];
                this.anomalyText.text = `⚠ Anomaly: ${latest.executionTime.toFixed(2)}ms ` +
                    `(${latest.multiplier.toFixed(1)}x)`;
            } else {
                this.anomalyText.text = '';
            }
        }

        // Update graphs if enabled
        if (this.config.showGraphs) {
            this.updateGraphs(stats);
        }
    }

    /**
     * Update performance graphs
     * @param {Object} stats - Current statistics
     */
    updateGraphs(stats) {
        const graphWidth = this.config.overlayWidth - 20;
        const graphHeight = 60;

        // Update execution time graph
        if (this.executionTimeGraph) {
            this.executionTimeGraph.clear();
            this.executionTimeGraph.lineStyle(1, 0x00AAFF, 1);

            const execHistory = this.getExecutionTimeHistory(100);
            const maxExecTime = Math.max(10, ...execHistory);
            const stepX = graphWidth / execHistory.length;

            this.executionTimeGraph.moveTo(0, graphHeight);
            for (let i = 0; i < execHistory.length; i++) {
                const x = i * stepX;
                const y = graphHeight - (execHistory[i] / maxExecTime) * (graphHeight - 4) - 2;
                this.executionTimeGraph.lineTo(x, y);
            }
            this.executionTimeGraph.lineTo(graphWidth, graphHeight);
        }

        // Update FPS graph
        if (this.fpsGraph) {
            this.fpsGraph.clear();
            this.fpsGraph.lineStyle(1, 0x00FF00, 1);

            const fpsHistory = this.getFpsHistory(100);
            const maxFps = 70;
            const stepX = graphWidth / fpsHistory.length;

            this.fpsGraph.moveTo(0, graphHeight);
            for (let i = 0; i < fpsHistory.length; i++) {
                const x = i * stepX;
                const y = graphHeight - (fpsHistory[i] / maxFps) * (graphHeight - 4) - 2;
                this.fpsGraph.lineTo(x, y);
            }
            this.fpsGraph.lineTo(graphWidth, graphHeight);
        }
    }

    /**
     * Reset all performance tracking
     */
    reset() {
        this.sampleIndex = 0;
        this.sampleCount = 0;
        this.executionTimes.fill(0);
        this.frameTimes.fill(0);
        this.memoryUsage.fill(0);
        this.instructionCounts.fill(0);
        this.cycleCounts.fill(0);

        this.lastFrameTime = performance.now();
        this.fps = 60;
        this.fpsSamples = [];
        this.lastFpsUpdate = 0;

        this.lastMemoryCheck = 0;
        this.currentMemoryUsage = 0;

        this.anomalies = [];
        this.meanExecutionTime = 0;
        this.stdDevExecutionTime = 0;

        this.totalFrames = 0;
        this.totalExecutionTime = 0;
        this.minExecutionTime = Infinity;
        this.maxExecutionTime = 0;
        this.totalInstructions = 0;
        this.totalCycles = 0;

        this.monitorOverhead = 0;

        console.log('🔄 Performance monitor reset');
    }

    /**
     * Export performance data as JSON
     * @returns {Object} - Performance data
     */
    exportData() {
        return {
            stats: this.getStats(),
            executionTimeHistory: this.getExecutionTimeHistory(this.sampleCount),
            fpsHistory: this.getFpsHistory(this.sampleCount),
            config: this.config,
            timestamp: Date.now()
        };
    }

    /**
     * Destroy the performance monitor and clean up resources
     */
    destroy() {
        if (this.overlay && this.overlay.parent) {
            this.overlay.parent.removeChild(this.overlay);
        }

        this.overlay = null;
        this.fpsText = null;
        this.executionTimeText = null;
        this.memoryText = null;
        this.instructionText = null;
        this.cycleText = null;
        this.anomalyText = null;
        this.executionTimeGraph = null;
        this.fpsGraph = null;
        this.graphs = [];

        console.log('✓ Performance monitor destroyed');
    }
}

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = PerformanceMonitor;
}
