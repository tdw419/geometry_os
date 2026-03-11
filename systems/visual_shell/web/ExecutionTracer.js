/**
 * Geometry OS: Execution Tracer
 *
 * Records instruction sequences and execution patterns for the Pixel CPU.
 * Provides pattern extraction, frequency tracking, and trace visualization UI.
 * Performance target: <0.1ms overhead per instruction.
 */

class ExecutionTracer {
    /**
     * Create a new ExecutionTracer instance
     * @param {Object} config - Configuration options
     */
    constructor(config = {}) {
        this.config = {
            maxTraceLength: 10000,           // Maximum trace length
            patternLength: 5,                // Pattern length to identify
            minPatternFrequency: 10,         // Minimum frequency for pattern reporting
            enableVisualization: true,       // Enable trace visualization UI
            uiRefreshInterval: 100,         // UI refresh interval (ms)
            ...config
        };

        // Trace buffer - stores instruction execution records
        this.trace = [];

        // Pattern frequency map - tracks recurring instruction sequences
        this.patterns = new Map();

        // Performance tracking
        this.recordCount = 0;
        this.totalRecordTime = 0;
        this.maxRecordTime = 0;

        // Opcode name mapping for human-readable output
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

        // Visualization components
        this.uiContainer = null;
        this.traceText = null;
        this.patternsText = null;
        this.statsText = null;
        this.lastUIRefresh = 0;
        this.uiEnabled = false;

        // Circular buffer optimization for performance
        this.traceIndex = 0;
        this.isCircular = false;

        console.log('✓ ExecutionTracer initialized');
    }

    /**
     * Record instruction execution (optimized for <0.1ms overhead)
     * @param {number} pc - Program counter
     * @param {number} opcode - Instruction opcode
     * @param {number} dest - Destination register
     * @param {number} src1 - Source register 1
     * @param {number} src2 - Source register 2
     * @param {Array} registers - Array of register values
     */
    recordInstruction(pc, opcode, dest, src1, src2, registers) {
        const startTime = performance.now();

        // Create instruction record (minimal structure for performance)
        const record = {
            pc,
            opcode,
            dest,
            src1,
            src2,
            // Only copy first 8 registers for performance (most commonly used)
            r0: registers[0],
            r1: registers[1],
            r2: registers[2],
            r3: registers[3],
            r4: registers[4],
            r5: registers[5],
            r6: registers[6],
            r7: registers[7]
        };

        // Circular buffer insertion for O(1) performance
        if (this.trace.length < this.config.maxTraceLength) {
            this.trace.push(record);
        } else {
            // Circular buffer mode - overwrite oldest
            this.trace[this.traceIndex] = record;
            this.traceIndex = (this.traceIndex + 1) % this.config.maxTraceLength;
            this.isCircular = true;
        }

        // Update pattern frequency incrementally (optimized)
        this._updatePatternFrequency(opcode);

        // Performance tracking
        const recordTime = performance.now() - startTime;
        this.recordCount++;
        this.totalRecordTime += recordTime;
        this.maxRecordTime = Math.max(this.maxRecordTime, recordTime);

        // Check performance target
        if (recordTime > 0.1 && this.recordCount <= 10) {
            console.warn(`⚠ ExecutionTracer.recordInstruction() took ${recordTime.toFixed(3)}ms (target: <0.1ms)`);
        }
    }

    /**
     * Update pattern frequency incrementally (optimized for real-time)
     * @param {number} opcode - Current opcode to track
     * @private
     */
    _updatePatternFrequency(opcode) {
        // Track single opcode frequency (simple pattern)
        const key = opcode.toString();
        this.patterns.set(key, (this.patterns.get(key) || 0) + 1);
    }

    /**
     * Identify recurring patterns in the execution trace
     * @param {number} patternLength - Pattern length to identify (default from config)
     * @returns {Array} - Array of patterns with frequencies
     */
    identifyPatterns(patternLength = null) {
        const length = patternLength || this.config.patternLength;
        const patternMap = new Map();

        // Get effective trace length (accounting for circular buffer)
        const traceLength = this.isCircular ? this.config.maxTraceLength : this.trace.length;

        if (traceLength < length) {
            return [];
        }

        // Sliding window pattern detection
        for (let i = 0; i < traceLength - length; i++) {
            // Extract pattern opcodes
            const pattern = [];
            for (let j = 0; j < length; j++) {
                const idx = (this.isCircular && this.traceIndex + j >= this.config.maxTraceLength)
                    ? (this.traceIndex + j) % this.config.maxTraceLength
                    : i + j;
                pattern.push(this.trace[idx]?.opcode ?? 0);
            }

            // Create pattern key
            const key = pattern.join('-');

            // Count pattern frequency
            patternMap.set(key, (patternMap.get(key) || 0) + 1);
        }

        // Filter and sort patterns by frequency
        const patterns = [];
        for (const [key, count] of patternMap) {
            if (count >= this.config.minPatternFrequency) {
                patterns.push({
                    key,
                    count,
                    pattern: this._parsePatternKey(key)
                });
            }
        }

        return patterns.sort((a, b) => b.count - a.count);
    }

    /**
     * Parse pattern key to human-readable opcode names
     * @param {string} key - Pattern key (e.g., "1-2-3")
     * @returns {Array} - Array of opcode names
     * @private
     */
    _parsePatternKey(key) {
        return key.split('-').map(op => this.opcodeName(parseInt(op)) || `UNK(${op})`);
    }

    /**
     * Get opcode name for a given opcode
     * @param {number} opcode - Opcode value
     * @returns {string} - Opcode name
     */
    opcodeName(opcode) {
        return this.opcodeNames[opcode] || `UNK(${opcode})`;
    }

    /**
     * Get the execution trace
     * @param {number} limit - Maximum number of records to return
     * @returns {Array} - Array of instruction records
     */
    getTrace(limit = null) {
        if (limit === null) {
            return [...this.trace];
        }

        if (this.isCircular) {
            // Return most recent records from circular buffer
            const result = [];
            for (let i = 0; i < Math.min(limit, this.config.maxTraceLength); i++) {
                const idx = (this.traceIndex - 1 - i + this.config.maxTraceLength) % this.config.maxTraceLength;
                if (this.trace[idx]) {
                    result.unshift(this.trace[idx]);
                }
            }
            return result;
        }

        return this.trace.slice(-limit);
    }

    /**
     * Get pattern statistics
     * @returns {Object} - Pattern statistics object
     */
    getPatternStats() {
        return {
            totalPatterns: this.patterns.size,
            topPatterns: Array.from(this.patterns.entries())
                .sort((a, b) => b[1] - a[1])
                .slice(0, 10)
                .map(([key, count]) => ({
                    pattern: this._parsePatternKey(key),
                    count
                }))
        };
    }

    /**
     * Get performance statistics
     * @returns {Object} - Performance statistics object
     */
    getPerformanceStats() {
        return {
            recordCount: this.recordCount,
            totalRecordTime: this.totalRecordTime,
            averageRecordTime: this.recordCount > 0 ? this.totalRecordTime / this.recordCount : 0,
            maxRecordTime: this.maxRecordTime,
            traceLength: this.trace.length,
            isCircular: this.isCircular,
            maxTraceLength: this.config.maxTraceLength
        };
    }

    /**
     * Clear trace and patterns
     */
    clear() {
        this.trace = [];
        this.patterns.clear();
        this.traceIndex = 0;
        this.isCircular = false;
        this.recordCount = 0;
        this.totalRecordTime = 0;
        this.maxRecordTime = 0;
        console.log('✓ ExecutionTracer cleared');
    }

    /**
     * Enable or disable tracing
     * @param {boolean} enabled - Whether tracing is enabled
     */
    setEnabled(enabled) {
        this.enabled = enabled;
        console.log(`✓ ExecutionTracer ${enabled ? 'enabled' : 'disabled'}`);
    }

    /**
     * Create trace visualization UI
     * @param {Object} infiniteMap - Reference to InfiniteMap instance
     */
    createVisualizationUI(infiniteMap) {
        if (!this.config.enableVisualization || !infiniteMap) {
            return;
        }

        const container = new PIXI.Container();
        container.x = 320; // Position to the right of CPU state overlay
        container.y = 10;
        container.zIndex = 1000;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.85);
        bg.lineStyle(2, 0x00AAFF, 1.0);
        bg.drawRoundedRect(0, 0, 400, 450, 8);
        bg.endFill();
        container.addChild(bg);

        // Title bar
        const titleBar = new PIXI.Graphics();
        titleBar.beginFill(0x001133, 1.0);
        titleBar.drawRect(0, 0, 400, 30);
        titleBar.endFill();
        container.addChild(titleBar);

        // Title text
        const titleText = new PIXI.Text('🔍 Execution Trace', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 14,
            fontWeight: 'bold',
            fill: 0x00AAFF
        });
        titleText.x = 10;
        titleText.y = 6;
        container.addChild(titleText);

        // Stats section
        const statsLabel = new PIXI.Text('Performance:', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0xFFAA00
        });
        statsLabel.x = 10;
        statsLabel.y = 40;
        container.addChild(statsLabel);

        this.statsText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 10,
            fill: 0x00FF00
        });
        this.statsText.x = 10;
        this.statsText.y = 55;
        this.statsText.style.wordWrap = true;
        this.statsText.style.wordWrapWidth = 380;
        container.addChild(this.statsText);

        // Trace section
        const traceLabel = new PIXI.Text('Recent Instructions:', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0xFFAA00
        });
        traceLabel.x = 10;
        traceLabel.y = 150;
        container.addChild(traceLabel);

        this.traceText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 9,
            fill: 0xFFFFFF
        });
        this.traceText.x = 10;
        this.traceText.y = 165;
        this.traceText.style.wordWrap = true;
        this.traceText.style.wordWrapWidth = 380;
        this.traceText.style.maxHeight = 120;
        container.addChild(this.traceText);

        // Patterns section
        const patternsLabel = new PIXI.Text('Common Patterns:', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0xFFAA00
        });
        patternsLabel.x = 10;
        patternsLabel.y = 295;
        container.addChild(patternsLabel);

        this.patternsText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 9,
            fill: 0xFFFFFF
        });
        this.patternsText.x = 10;
        this.patternsText.y = 310;
        this.patternsText.style.wordWrap = true;
        this.patternsText.style.wordWrapWidth = 380;
        this.patternsText.style.maxHeight = 130;
        container.addChild(this.patternsText);

        // Add to infinite map world
        infiniteMap.world.addChild(container);
        this.uiContainer = container;
        this.uiEnabled = true;

        console.log('✓ ExecutionTracer visualization UI created');
    }

    /**
     * Update trace visualization UI
     * @param {number} timestamp - Current timestamp for throttling
     */
    updateVisualization(timestamp) {
        if (!this.uiEnabled || !this.uiContainer) {
            return;
        }

        // Throttle UI updates
        if (timestamp - this.lastUIRefresh < this.config.uiRefreshInterval) {
            return;
        }
        this.lastUIRefresh = timestamp;

        // Update stats
        const stats = this.getPerformanceStats();
        this.statsText.text = this._formatStats(stats);

        // Update recent trace (last 10 instructions)
        const recentTrace = this.getTrace(10);
        this.traceText.text = this._formatTrace(recentTrace);

        // Update patterns
        const patterns = this.identifyPatterns();
        this.patternsText.text = this._formatPatterns(patterns);
    }

    /**
     * Format performance stats for display
     * @param {Object} stats - Performance statistics
     * @returns {string} - Formatted stats string
     * @private
     */
    _formatStats(stats) {
        const avgTime = (stats.averageRecordTime * 1000).toFixed(2);
        const maxTime = (stats.maxRecordTime * 1000).toFixed(2);
        const statusColor = stats.averageRecordTime < 0.0001 ? '✓' : '⚠';

        return `${statusColor} Records: ${stats.recordCount}\n` +
            `  Avg: ${avgTime}μs (target: <100μs)\n` +
            `  Max: ${maxTime}μs\n` +
            `  Trace: ${stats.traceLength}/${stats.maxTraceLength}\n` +
            `  Mode: ${stats.isCircular ? 'Circular' : 'Linear'}`;
    }

    /**
     * Format trace records for display
     * @param {Array} trace - Trace records
     * @returns {string} - Formatted trace string
     * @private
     */
    _formatTrace(trace) {
        if (trace.length === 0) {
            return 'No instructions recorded';
        }

        return trace.slice(-10).map((record, idx) => {
            const opName = this.opcodeName(record.opcode);
            const pcHex = record.pc.toString(16).padStart(4, '0');
            return `${idx + 1}. [0x${pcHex}] ${opName} R${record.dest}, R${record.src1}, R${record.src2}`;
        }).join('\n');
    }

    /**
     * Format patterns for display
     * @param {Array} patterns - Pattern array
     * @returns {string} - Formatted patterns string
     * @private
     */
    _formatPatterns(patterns) {
        if (patterns.length === 0) {
            return 'No patterns detected yet';
        }

        return patterns.slice(0, 8).map((p, idx) => {
            const patternStr = p.pattern.join(' → ');
            return `${idx + 1}. ${patternStr} (${p.count}x)`;
        }).join('\n');
    }

    /**
     * Remove visualization UI
     */
    removeVisualizationUI() {
        if (this.uiContainer && this.uiContainer.parent) {
            this.uiContainer.parent.removeChild(this.uiContainer);
            this.uiContainer = null;
            this.uiEnabled = false;
            console.log('✓ ExecutionTracer visualization UI removed');
        }
    }

    /**
     * Export trace to JSON
     * @param {number} limit - Maximum number of records to export
     * @returns {string} - JSON string of trace
     */
    exportTrace(limit = null) {
        const trace = this.getTrace(limit);
        return JSON.stringify({
            trace,
            patterns: Array.from(this.patterns.entries()),
            stats: this.getPerformanceStats()
        }, null, 2);
    }

    /**
     * Import trace from JSON
     * @param {string} json - JSON string to import
     */
    importTrace(json) {
        try {
            const data = JSON.parse(json);
            this.trace = data.trace || [];
            this.patterns = new Map(data.patterns || []);
            console.log('✓ ExecutionTracer trace imported');
        } catch (error) {
            console.error('Failed to import trace:', error);
            throw error;
        }
    }
}

// Export for Node.js environments
if (typeof module !== 'undefined' && module.exports) {
    module.exports = ExecutionTracer;
}
