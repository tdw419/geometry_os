/**
 * Geometry OS: Bottleneck Detector
 *
 * Task 2.2: Performance bottleneck detection for Pixel CPU integration.
 * Identifies slow instructions (>1ms avg), memory operations (>0.5ms),
 * excessive jumps (>30%), and I/O operations (>0.1ms console, >2ms framebuffer).
 * Provides bottleneck visualization UI with <10ms full analysis time.
 *
 * Integrates with PerformanceMonitor (Task 1.1) for comprehensive analysis.
 */

class BottleneckDetector {
    /**
     * Create a new BottleneckDetector instance
     * @param {Object} config - Configuration options
     */
    constructor(config = {}) {
        this.config = {
            // Bottleneck thresholds (in milliseconds)
            slowInstructionThreshold: 1.0,      // >1ms average per instruction
            memoryOperationThreshold: 0.5,     // >0.5ms per memory operation
            excessiveJumpThreshold: 0.3,        // >30% jump instructions
            consoleIOThreshold: 0.1,           // >0.1ms per console I/O
            framebufferIOThreshold: 2.0,        // >2ms per framebuffer I/O

            // Analysis configuration
            analysisWindowSize: 1000,           // Number of samples in analysis window
            minSamplesForAnalysis: 10,          // Minimum samples needed for analysis
            maxAnalysisTime: 10.0,             // Maximum analysis time (ms)

            // UI configuration
            overlayWidth: 320,                  // Width of bottleneck overlay
            overlayHeight: 400,                 // Height of bottleneck overlay
            overlayX: 10,                      // X position
            overlayY: 760,                     // Y position (below performance monitor)
            showDetails: true,                 // Show detailed bottleneck info
            maxBottlenecks: 20,                // Maximum bottlenecks to display

            // Integration
            performanceMonitor: null,          // Reference to PerformanceMonitor instance

            ...config
        };

        // Bottleneck tracking
        this.bottlenecks = [];
        this.bottleneckHistory = [];
        this.analysisTime = 0;
        this.lastAnalysisTime = 0;

        // Instruction performance tracking (circular buffer)
        this.instructionTimes = new Float64Array(this.config.analysisWindowSize);
        this.instructionCounts = new Map();  // opcode -> {count, totalTime}
        this.memoryOperationTimes = [];
        this.jumpInstructionCount = 0;
        this.totalInstructionCount = 0;

        // I/O operation tracking
        this.consoleIOOperations = [];
        this.framebufferIOOperations = [];

        // Sample tracking
        this.sampleIndex = 0;
        this.sampleCount = 0;

        // Statistics
        this.totalAnalysisCount = 0;
        this.totalAnalysisTime = 0;
        this.maxAnalysisTime = 0;

        // Visual components
        this.overlay = null;
        this.bottleneckText = null;
        this.detailsText = null;
        this.chartGraphics = null;
        this.chartData = [];

        // Opcode names for display
        this.opcodeNames = {
            0: 'NOP',
            1: 'MOV',
            2: 'ADD',
            3: 'SUB',
            4: 'MUL',
            5: 'DIV',
            6: 'AND',
            7: 'OR',
            8: 'XOR',
            9: 'NOT',
            10: 'SHL',
            11: 'SHR',
            12: 'LOAD',
            13: 'STORE',
            14: 'JUMP',
            15: 'JZ',
            16: 'JNZ',
            17: 'CALL',
            18: 'RET',
            255: 'HALT'
        };

        console.log('✓ BottleneckDetector initialized');
    }

    /**
     * Set the PerformanceMonitor instance for integration
     * @param {PerformanceMonitor} monitor - PerformanceMonitor instance
     */
    setPerformanceMonitor(monitor) {
        this.config.performanceMonitor = monitor;
        console.log('✓ PerformanceMonitor linked to BottleneckDetector');
    }

    /**
     * Record an instruction execution with timing
     * @param {number} opcode - Instruction opcode
     * @param {number} executionTime - Time to execute this instruction (ms)
     * @param {boolean} isMemoryOp - Whether this is a memory operation
     * @param {boolean} isJump - Whether this is a jump instruction
     * @param {boolean} isConsoleIO - Whether this is console I/O
     * @param {boolean} isFramebufferIO - Whether this is framebuffer I/O
     */
    recordInstruction(opcode, executionTime, isMemoryOp = false, isJump = false, isConsoleIO = false, isFramebufferIO = false) {
        const idx = this.sampleIndex;

        // Store instruction time
        this.instructionTimes[idx] = executionTime;

        // Track opcode statistics
        if (!this.instructionCounts.has(opcode)) {
            this.instructionCounts.set(opcode, { count: 0, totalTime: 0 });
        }
        const stats = this.instructionCounts.get(opcode);
        stats.count++;
        stats.totalTime += executionTime;

        // Track memory operations
        if (isMemoryOp) {
            this.memoryOperationTimes.push({
                opcode,
                time: executionTime,
                timestamp: Date.now()
            });
            // Keep only recent memory operations
            if (this.memoryOperationTimes.length > this.config.analysisWindowSize) {
                this.memoryOperationTimes.shift();
            }
        }

        // Track jump instructions
        if (isJump) {
            this.jumpInstructionCount++;
        }
        this.totalInstructionCount++;

        // Track I/O operations
        if (isConsoleIO) {
            this.consoleIOOperations.push({
                opcode,
                time: executionTime,
                timestamp: Date.now()
            });
            if (this.consoleIOOperations.length > this.config.analysisWindowSize) {
                this.consoleIOOperations.shift();
            }
        }

        if (isFramebufferIO) {
            this.framebufferIOOperations.push({
                opcode,
                time: executionTime,
                timestamp: Date.now()
            });
            if (this.framebufferIOOperations.length > this.config.analysisWindowSize) {
                this.framebufferIOOperations.shift();
            }
        }

        // Update sample tracking
        this.sampleIndex = (this.sampleIndex + 1) % this.config.analysisWindowSize;
        this.sampleCount = Math.min(this.sampleCount + 1, this.config.analysisWindowSize);
    }

    /**
     * Run full bottleneck analysis (must complete in <10ms)
     * @returns {Object} - Analysis results
     */
    analyze() {
        const startTime = performance.now();

        // Clear previous bottlenecks
        this.bottlenecks = [];

        // Check if we have enough samples
        if (this.sampleCount < this.config.minSamplesForAnalysis) {
            const analysisTime = performance.now() - startTime;
            this._trackAnalysisTime(analysisTime);
            return {
                bottlenecks: [],
                analysisTime,
                hasEnoughSamples: false
            };
        }

        // Analyze different bottleneck types
        this._analyzeSlowInstructions();
        this._analyzeMemoryOperations();
        this._analyzeExcessiveJumps();
        this._analyzeConsoleIO();
        this._analyzeFramebufferIO();

        // Integrate with PerformanceMonitor if available
        this._integrateWithPerformanceMonitor();

        // Sort bottlenecks by severity (impact * frequency)
        this.bottlenecks.sort((a, b) => b.severity - a.severity);

        // Keep only top bottlenecks
        this.bottlenecks = this.bottlenecks.slice(0, this.config.maxBottlenecks);

        // Store in history
        this.bottleneckHistory.push({
            timestamp: Date.now(),
            bottlenecks: [...this.bottlenecks],
            analysisTime: performance.now() - startTime
        });
        if (this.bottleneckHistory.length > 100) {
            this.bottleneckHistory.shift();
        }

        const analysisTime = performance.now() - startTime;
        this._trackAnalysisTime(analysisTime);

        // Check if we exceeded analysis time target
        if (analysisTime > this.config.maxAnalysisTime) {
            console.warn(`⚠ BottleneckDetector analysis took ${analysisTime.toFixed(2)}ms (target: <${this.config.maxAnalysisTime}ms)`);
        }

        return {
            bottlenecks: this.bottlenecks,
            analysisTime,
            hasEnoughSamples: true,
            sampleCount: this.sampleCount
        };
    }

    /**
     * Analyze slow instructions (>1ms average)
     * @private
     */
    _analyzeSlowInstructions() {
        for (const [opcode, stats] of this.instructionCounts) {
            if (stats.count < 5) continue; // Need minimum samples

            const avgTime = stats.totalTime / stats.count;

            if (avgTime > this.config.slowInstructionThreshold) {
                const severity = (avgTime / this.config.slowInstructionThreshold) * stats.count;

                this.bottlenecks.push({
                    type: 'slow_instruction',
                    opcode,
                    opcodeName: this.opcodeNames[opcode] || `UNK(${opcode})`,
                    avgTime,
                    count: stats.count,
                    totalTime: stats.totalTime,
                    threshold: this.config.slowInstructionThreshold,
                    severity,
                    recommendation: this._getSlowInstructionRecommendation(opcode, avgTime)
                });
            }
        }
    }

    /**
     * Analyze memory operations (>0.5ms per operation)
     * @private
     */
    _analyzeMemoryOperations() {
        if (this.memoryOperationTimes.length === 0) return;

        const totalTime = this.memoryOperationTimes.reduce((sum, op) => sum + op.time, 0);
        const avgTime = totalTime / this.memoryOperationTimes.length;

        if (avgTime > this.config.memoryOperationThreshold) {
            const severity = (avgTime / this.config.memoryOperationThreshold) * this.memoryOperationTimes.length;

            this.bottlenecks.push({
                type: 'memory_operation',
                avgTime,
                count: this.memoryOperationTimes.length,
                totalTime,
                threshold: this.config.memoryOperationThreshold,
                severity,
                recommendation: 'Consider caching frequently accessed memory or optimizing memory access patterns'
            });
        }
    }

    /**
     * Analyze excessive jumps (>30% of instructions)
     * @private
     */
    _analyzeExcessiveJumps() {
        if (this.totalInstructionCount < 100) return;

        const jumpRatio = this.jumpInstructionCount / this.totalInstructionCount;

        if (jumpRatio > this.config.excessiveJumpThreshold) {
            const severity = (jumpRatio / this.config.excessiveJumpThreshold) * 10;

            this.bottlenecks.push({
                type: 'excessive_jumps',
                jumpCount: this.jumpInstructionCount,
                totalInstructions: this.totalInstructionCount,
                jumpRatio,
                threshold: this.config.excessiveJumpThreshold,
                severity,
                recommendation: 'Reduce branching, use loop unrolling or restructure control flow'
            });
        }
    }

    /**
     * Analyze console I/O operations (>0.1ms per operation)
     * @private
     */
    _analyzeConsoleIO() {
        if (this.consoleIOOperations.length === 0) return;

        const totalTime = this.consoleIOOperations.reduce((sum, op) => sum + op.time, 0);
        const avgTime = totalTime / this.consoleIOOperations.length;

        if (avgTime > this.config.consoleIOThreshold) {
            const severity = (avgTime / this.config.consoleIOThreshold) * this.consoleIOOperations.length;

            this.bottlenecks.push({
                type: 'console_io',
                avgTime,
                count: this.consoleIOOperations.length,
                totalTime,
                threshold: this.config.consoleIOThreshold,
                severity,
                recommendation: 'Reduce console output frequency or buffer output'
            });
        }
    }

    /**
     * Analyze framebuffer I/O operations (>2ms per operation)
     * @private
     */
    _analyzeFramebufferIO() {
        if (this.framebufferIOOperations.length === 0) return;

        const totalTime = this.framebufferIOOperations.reduce((sum, op) => sum + op.time, 0);
        const avgTime = totalTime / this.framebufferIOOperations.length;

        if (avgTime > this.config.framebufferIOThreshold) {
            const severity = (avgTime / this.config.framebufferIOThreshold) * this.framebufferIOOperations.length;

            this.bottlenecks.push({
                type: 'framebuffer_io',
                avgTime,
                count: this.framebufferIOOperations.length,
                totalTime,
                threshold: this.config.framebufferIOThreshold,
                severity,
                recommendation: 'Use dirty rectangle tracking or batch framebuffer updates'
            });
        }
    }

    /**
     * Integrate with PerformanceMonitor for enhanced analysis
     * @private
     */
    _integrateWithPerformanceMonitor() {
        if (!this.config.performanceMonitor) return;

        const stats = this.config.performanceMonitor.getStats();

        // Check for execution time anomalies
        if (stats.executionTime.current > stats.executionTime.mean * 2) {
            this.bottlenecks.push({
                type: 'execution_spike',
                executionTime: stats.executionTime.current,
                meanExecutionTime: stats.executionTime.mean,
                multiplier: stats.executionTime.current / stats.executionTime.mean,
                severity: stats.executionTime.current / stats.executionTime.mean,
                recommendation: 'Investigate recent code changes or resource contention'
            });
        }

        // Check for low FPS
        if (stats.fps < 30) {
            this.bottlenecks.push({
                type: 'low_fps',
                fps: stats.fps,
                threshold: 30,
                severity: (30 - stats.fps) / 30,
                recommendation: 'Optimize rendering or reduce computational load'
            });
        }
    }

    /**
     * Get recommendation for slow instruction
     * @param {number} opcode - Instruction opcode
     * @param {number} avgTime - Average execution time
     * @returns {string} - Recommendation
     * @private
     */
    _getSlowInstructionRecommendation(opcode, avgTime) {
        switch (opcode) {
            case 4: // MUL
            case 5: // DIV
                return 'Consider using bit shifts or lookup tables for multiplication/division';
            case 12: // LOAD
            case 13: // STORE
                return 'Cache frequently accessed data in registers';
            case 14: // JUMP
            case 15: // JZ
            case 16: // JNZ
                return 'Reduce branching with conditional moves or branchless algorithms';
            default:
                return 'Review algorithm complexity or consider alternative approach';
        }
    }

    /**
     * Track analysis time for performance monitoring
     * @param {number} analysisTime - Time taken for analysis
     * @private
     */
    _trackAnalysisTime(analysisTime) {
        this.totalAnalysisCount++;
        this.totalAnalysisTime += analysisTime;
        this.maxAnalysisTime = Math.max(this.maxAnalysisTime, analysisTime);
        this.lastAnalysisTime = analysisTime;
    }

    /**
     * Get current bottleneck statistics
     * @returns {Object} - Bottleneck statistics
     */
    getStats() {
        const avgAnalysisTime = this.totalAnalysisCount > 0
            ? this.totalAnalysisTime / this.totalAnalysisCount
            : 0;

        return {
            bottlenecks: this.bottlenecks,
            bottleneckCount: this.bottlenecks.length,
            analysisTime: this.lastAnalysisTime,
            avgAnalysisTime,
            maxAnalysisTime: this.maxAnalysisTime,
            totalAnalysisCount: this.totalAnalysisCount,
            sampleCount: this.sampleCount,
            instructionTypes: this.instructionCounts.size,
            memoryOperations: this.memoryOperationTimes.length,
            consoleIOOps: this.consoleIOOperations.length,
            framebufferIOOps: this.framebufferIOOperations.length,
            jumpRatio: this.totalInstructionCount > 0
                ? this.jumpInstructionCount / this.totalInstructionCount
                : 0
        };
    }

    /**
     * Get bottleneck history
     * @param {number} limit - Maximum number of history entries to return
     * @returns {Array} - Bottleneck history
     */
    getHistory(limit = 10) {
        return this.bottleneckHistory.slice(-limit);
    }

    /**
     * Clear all bottleneck data
     */
    clear() {
        this.bottlenecks = [];
        this.bottleneckHistory = [];
        this.instructionTimes = new Float64Array(this.config.analysisWindowSize);
        this.instructionCounts.clear();
        this.memoryOperationTimes = [];
        this.consoleIOOperations = [];
        this.framebufferIOOperations = [];
        this.jumpInstructionCount = 0;
        this.totalInstructionCount = 0;
        this.sampleIndex = 0;
        this.sampleCount = 0;
        this.totalAnalysisCount = 0;
        this.totalAnalysisTime = 0;
        this.maxAnalysisTime = 0;
        this.chartData = [];

        console.log('✓ BottleneckDetector cleared');
    }

    /**
     * Create bottleneck visualization UI overlay
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
        bg.lineStyle(2, 0xFF4444, 1);
        bg.drawRoundedRect(0, 0, this.config.overlayWidth, this.config.overlayHeight, 8);
        bg.endFill();
        container.addChild(bg);

        // Title bar
        const titleBar = new PIXI.Graphics();
        titleBar.beginFill(0x330000, 1.0);
        titleBar.drawRect(0, 0, this.config.overlayWidth, 30);
        titleBar.endFill();
        container.addChild(titleBar);

        // Title
        const title = new PIXI.Text('🚧 Bottleneck Detector', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 14,
            fontWeight: 'bold',
            fill: 0xFF4444
        });
        title.x = 10;
        title.y = 6;
        container.addChild(title);

        // Analysis time display
        this.analysisTimeText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 10,
            fill: 0x00FF00
        });
        this.analysisTimeText.x = 180;
        this.analysisTimeText.y = 8;
        container.addChild(this.analysisTimeText);

        // Bottleneck list
        this.bottleneckText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 10,
            fill: 0xFFFFFF
        });
        this.bottleneckText.x = 10;
        this.bottleneckText.y = 40;
        this.bottleneckText.style.wordWrap = true;
        this.bottleneckText.style.wordWrapWidth = this.config.overlayWidth - 20;
        this.bottleneckText.style.maxHeight = 200;
        container.addChild(this.bottleneckText);

        // Details section
        if (this.config.showDetails) {
            const detailsLabel = new PIXI.Text('Details:', {
                fontFamily: 'Arial, sans-serif',
                fontSize: 11,
                fontWeight: 'bold',
                fill: 0xFFAA00
            });
            detailsLabel.x = 10;
            detailsLabel.y = 250;
            container.addChild(detailsLabel);

            this.detailsText = new PIXI.Text('', {
                fontFamily: 'Monaco, Consolas, monospace',
                fontSize: 9,
                fill: 0xCCCCCC
            });
            this.detailsText.x = 10;
            this.detailsText.y = 265;
            this.detailsText.style.wordWrap = true;
            this.detailsText.style.wordWrapWidth = this.config.overlayWidth - 20;
            this.detailsText.style.maxHeight = 120;
            container.addChild(this.detailsText);
        }

        // Chart area
        this._createChart(container);

        // Add to infinite map
        infiniteMap.world.addChild(container);
        this.overlay = container;

        console.log('✓ BottleneckDetector overlay created');
    }

    /**
     * Create bottleneck severity chart
     * @param {Object} container - Container to add chart to
     * @private
     */
    _createChart(container) {
        const chartWidth = this.config.overlayWidth - 20;
        const chartHeight = 80;
        const chartX = 10;
        const chartY = 310;

        // Chart background
        const chartBg = new PIXI.Graphics();
        chartBg.beginFill(0x111111, 1);
        chartBg.lineStyle(1, 0x333333, 1);
        chartBg.drawRect(chartX, chartY, chartWidth, chartHeight);
        chartBg.endFill();
        container.addChild(chartBg);

        // Chart label
        const chartLabel = new PIXI.Text('Severity Chart', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 9,
            fill: 0x888888
        });
        chartLabel.x = chartX + 5;
        chartLabel.y = chartY + 2;
        container.addChild(chartLabel);

        // Chart graphics
        this.chartGraphics = new PIXI.Graphics();
        container.addChild(this.chartGraphics);

        this.chartConfig = {
            x: chartX,
            y: chartY,
            width: chartWidth,
            height: chartHeight
        };
    }

    /**
     * Update bottleneck overlay display
     */
    updateDisplay() {
        if (!this.overlay) return;

        const stats = this.getStats();

        // Update analysis time
        const timeColor = stats.analysisTime < this.config.maxAnalysisTime ? 0x00FF00 : 0xFF4444;
        this.analysisTimeText.style.fill = timeColor;
        this.analysisTimeText.text = `Analysis: ${stats.analysisTime.toFixed(2)}ms`;

        // Update bottleneck list
        this.bottleneckText.text = this._formatBottlenecks(stats.bottlenecks);

        // Update details
        if (this.detailsText) {
            this.detailsText.text = this._formatDetails(stats);
        }

        // Update chart
        this._updateChart(stats.bottlenecks);
    }

    /**
     * Format bottlenecks for display
     * @param {Array} bottlenecks - Array of bottleneck objects
     * @returns {string} - Formatted bottleneck string
     * @private
     */
    _formatBottlenecks(bottlenecks) {
        if (bottlenecks.length === 0) {
            return '✓ No bottlenecks detected';
        }

        return bottlenecks.slice(0, 10).map((b, idx) => {
            const icon = this._getBottleneckIcon(b.type);
            const timeStr = b.avgTime ? `${b.avgTime.toFixed(2)}ms` : '';
            const countStr = b.count ? `(${b.count}x)` : '';

            let label = '';
            switch (b.type) {
                case 'slow_instruction':
                    label = `${b.opcodeName} ${timeStr} ${countStr}`;
                    break;
                case 'memory_operation':
                    label = `Memory ${timeStr} ${countStr}`;
                    break;
                case 'excessive_jumps':
                    label = `Jumps ${(b.jumpRatio * 100).toFixed(1)}%`;
                    break;
                case 'console_io':
                    label = `Console I/O ${timeStr} ${countStr}`;
                    break;
                case 'framebuffer_io':
                    label = `Framebuffer ${timeStr} ${countStr}`;
                    break;
                case 'execution_spike':
                    label = `Spike ${b.multiplier.toFixed(1)}x`;
                    break;
                case 'low_fps':
                    label = `Low FPS ${b.fps.toFixed(1)}`;
                    break;
                default:
                    label = b.type;
            }

            return `${idx + 1}. ${icon} ${label}`;
        }).join('\n');
    }

    /**
     * Get icon for bottleneck type
     * @param {string} type - Bottleneck type
     * @returns {string} - Icon character
     * @private
     */
    _getBottleneckIcon(type) {
        const icons = {
            slow_instruction: '🐌',
            memory_operation: '💾',
            excessive_jumps: '↗️',
            console_io: '💬',
            framebuffer_io: '🖼️',
            execution_spike: '📈',
            low_fps: '📉'
        };
        return icons[type] || '⚠️';
    }

    /**
     * Format detailed statistics
     * @param {Object} stats - Statistics object
     * @returns {string} - Formatted details string
     * @private
     */
    _formatDetails(stats) {
        return `Samples: ${stats.sampleCount}\n` +
            `Instruction Types: ${stats.instructionTypes}\n` +
            `Memory Ops: ${stats.memoryOperations}\n` +
            `Console I/O: ${stats.consoleIOOps}\n` +
            `Framebuffer I/O: ${stats.framebufferIOOps}\n` +
            `Jump Ratio: ${(stats.jumpRatio * 100).toFixed(1)}%\n` +
            `Avg Analysis: ${stats.avgAnalysisTime.toFixed(2)}ms\n` +
            `Max Analysis: ${stats.maxAnalysisTime.toFixed(2)}ms`;
    }

    /**
     * Update bottleneck severity chart
     * @param {Array} bottlenecks - Array of bottleneck objects
     * @private
     */
    _updateChart(bottlenecks) {
        if (!this.chartGraphics || !this.chartConfig) return;

        const { x, y, width, height } = this.chartConfig;
        const chartGraphics = this.chartGraphics;

        chartGraphics.clear();

        if (bottlenecks.length === 0) {
            // Draw empty chart
            chartGraphics.beginFill(0x00FF00, 0.3);
            chartGraphics.drawRect(x, y + height - 5, width, 5);
            chartGraphics.endFill();
            return;
        }

        // Calculate max severity for scaling
        const maxSeverity = Math.max(...bottlenecks.map(b => b.severity), 1);
        const barWidth = Math.max(2, (width - 20) / Math.min(bottlenecks.length, 20));
        const barGap = 2;

        // Draw bars
        bottlenecks.slice(0, 20).forEach((b, idx) => {
            const barHeight = (b.severity / maxSeverity) * (height - 20);
            const barX = x + 10 + idx * (barWidth + barGap);
            const barY = y + height - 10 - barHeight;

            // Color based on severity
            let color;
            if (b.severity < 5) {
                color = 0x00FF00; // Green
            } else if (b.severity < 15) {
                color = 0xFFAA00; // Orange
            } else {
                color = 0xFF4444; // Red
            }

            chartGraphics.beginFill(color, 0.8);
            chartGraphics.drawRect(barX, barY, barWidth, barHeight);
            chartGraphics.endFill();
        });

        // Draw threshold line
        chartGraphics.lineStyle(1, 0xFF4444, 0.5);
        chartGraphics.moveTo(x, y + height - 10 - (height - 20) * 0.5);
        chartGraphics.lineTo(x + width, y + height - 10 - (height - 20) * 0.5);
    }

    /**
     * Export bottleneck report to JSON
     * @returns {Object} - Bottleneck report
     */
    exportReport() {
        return {
            timestamp: Date.now(),
            stats: this.getStats(),
            history: this.getHistory(20),
            config: {
                slowInstructionThreshold: this.config.slowInstructionThreshold,
                memoryOperationThreshold: this.config.memoryOperationThreshold,
                excessiveJumpThreshold: this.config.excessiveJumpThreshold,
                consoleIOThreshold: this.config.consoleIOThreshold,
                framebufferIOThreshold: this.config.framebufferIOThreshold
            }
        };
    }

    /**
     * Remove overlay UI
     */
    removeOverlay() {
        if (this.overlay && this.overlay.parent) {
            this.overlay.parent.removeChild(this.overlay);
            this.overlay = null;
            console.log('✓ BottleneckDetector overlay removed');
        }
    }
}

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = BottleneckDetector;
}
