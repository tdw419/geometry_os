/**
 * Geometry OS: Pattern Recognizer
 *
 * Identifies recurring execution patterns in Pixel CPU instruction traces.
 * Implements sequence extraction, pattern matching, and pattern visualization UI.
 * Performance target: <5ms for 10,000 instructions.
 * Integrates with ExecutionTracer from Task 1.2.
 */

class PatternRecognizer {
    /**
     * Create a new PatternRecognizer instance
     * @param {Object} config - Configuration options
     */
    constructor(config = {}) {
        this.config = {
            minPatternLength: 2,           // Minimum pattern length to detect
            maxPatternLength: 8,           // Maximum pattern length to detect
            minPatternFrequency: 3,         // Minimum frequency for pattern reporting
            maxPatterns: 100,              // Maximum number of patterns to track
            enableVisualization: true,     // Enable pattern visualization UI
            uiRefreshInterval: 200,        // UI refresh interval (ms)
            enableAutoDetection: true,     // Automatically detect patterns on trace updates
            similarityThreshold: 0.8,      // Similarity threshold for fuzzy matching (0-1)
            ...config
        };

        // Pattern storage - maps pattern keys to pattern metadata
        this.patterns = new Map();

        // Sequence buffer for real-time pattern detection
        this.sequenceBuffer = [];

        // Pattern history for trend analysis
        this.patternHistory = [];

        // Performance tracking
        this.detectionCount = 0;
        this.totalDetectionTime = 0;
        this.maxDetectionTime = 0;

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
        this.patternListText = null;
        this.patternDetailsText = null;
        this.statsText = null;
        this.lastUIRefresh = 0;
        this.uiEnabled = false;

        // Pattern visualization graphics
        this.patternGraphics = null;
        this.patternBars = [];

        // Reference to ExecutionTracer for integration
        this.executionTracer = null;

        console.log('✓ PatternRecognizer initialized');
    }

    /**
     * Set the ExecutionTracer reference for integration
     * @param {ExecutionTracer} tracer - ExecutionTracer instance
     */
    setExecutionTracer(tracer) {
        this.executionTracer = tracer;
        console.log('✓ PatternRecognizer linked to ExecutionTracer');
    }

    /**
     * Extract instruction sequences from trace data
     * @param {Array} trace - Array of instruction records from ExecutionTracer
     * @param {number} length - Length of sequences to extract
     * @returns {Array} - Array of extracted sequences
     */
    extractSequences(trace, length = 5) {
        const startTime = performance.now();

        if (!trace || trace.length < length) {
            return [];
        }

        const sequences = [];
        const limit = Math.min(trace.length - length + 1, 10000); // Limit for performance

        // Extract sequences using sliding window
        for (let i = 0; i < limit; i++) {
            const sequence = [];
            for (let j = 0; j < length; j++) {
                const record = trace[i + j];
                sequence.push({
                    opcode: record.opcode,
                    pc: record.pc,
                    dest: record.dest,
                    src1: record.src1,
                    src2: record.src2
                });
            }
            sequences.push(sequence);
        }

        const extractionTime = performance.now() - startTime;
        if (extractionTime > 5) {
            console.warn(`⚠ PatternRecognizer.extractSequences() took ${extractionTime.toFixed(2)}ms (target: <5ms)`);
        }

        return sequences;
    }

    /**
     * Identify recurring patterns in instruction sequences
     * @param {Array} sequences - Array of instruction sequences
     * @param {Object} options - Detection options
     * @returns {Array} - Array of detected patterns with metadata
     */
    identifyPatterns(sequences, options = {}) {
        const startTime = performance.now();

        const {
            minPatternLength = this.config.minPatternLength,
            maxPatternLength = this.config.maxPatternLength,
            minFrequency = this.config.minPatternFrequency
        } = options;

        if (!sequences || sequences.length === 0) {
            return [];
        }

        const patternMap = new Map();
        const sequenceCount = sequences.length;

        // Detect patterns of various lengths
        for (let len = minPatternLength; len <= maxPatternLength; len++) {
            if (len > sequences[0].length) {
                break;
            }

            for (let i = 0; i < sequenceCount; i++) {
                const sequence = sequences[i];
                if (sequence.length < len) {
                    continue;
                }

                // Extract pattern of current length
                const pattern = [];
                for (let j = 0; j < len; j++) {
                    pattern.push(sequence[j].opcode);
                }

                // Create pattern key
                const key = pattern.join('-');

                // Count pattern occurrences
                const count = patternMap.get(key) || 0;
                patternMap.set(key, {
                    count: count + 1,
                    pattern: pattern,
                    occurrences: count ? [...(patternMap.get(key).occurrences), i] : [i],
                    length: len
                });
            }
        }

        // Filter patterns by minimum frequency and sort
        const patterns = [];
        for (const [key, data] of patternMap) {
            if (data.count >= minFrequency) {
                patterns.push({
                    key,
                    count: data.count,
                    pattern: data.pattern,
                    occurrences: data.occurrences,
                    length: data.length,
                    frequency: data.count / sequenceCount,
                    opcodeNames: data.pattern.map(op => this.opcodeNames[op] || `UNK(${op})`)
                });
            }
        }

        // Sort by frequency (descending) and then by length (descending)
        patterns.sort((a, b) => {
            if (b.count !== a.count) {
                return b.count - a.count;
            }
            return b.length - a.length;
        });

        // Limit number of patterns
        const result = patterns.slice(0, this.config.maxPatterns);

        // Update pattern storage
        for (const pattern of result) {
            const existing = this.patterns.get(pattern.key);
            if (existing) {
                existing.count = pattern.count;
                existing.lastSeen = Date.now();
            } else {
                this.patterns.set(pattern.key, {
                    ...pattern,
                    firstSeen: Date.now(),
                    lastSeen: Date.now()
                });
            }
        }

        // Performance tracking
        const detectionTime = performance.now() - startTime;
        this.detectionCount++;
        this.totalDetectionTime += detectionTime;
        this.maxDetectionTime = Math.max(this.maxDetectionTime, detectionTime);

        if (detectionTime > 5) {
            console.warn(`⚠ PatternRecognizer.identifyPatterns() took ${detectionTime.toFixed(2)}ms (target: <5ms)`);
        }

        return result;
    }

    /**
     * Match a sequence against known patterns
     * @param {Array} sequence - Instruction sequence to match
     * @param {boolean} fuzzy - Enable fuzzy matching
     * @returns {Object|null} - Best matching pattern or null
     */
    matchPattern(sequence, fuzzy = false) {
        if (!sequence || sequence.length === 0) {
            return null;
        }

        const sequenceOpcodes = sequence.map(s => s.opcode);
        const sequenceKey = sequenceOpcodes.join('-');

        // Exact match
        if (this.patterns.has(sequenceKey)) {
            return {
                pattern: this.patterns.get(sequenceKey),
                matchType: 'exact',
                confidence: 1.0
            };
        }

        // Fuzzy match
        if (fuzzy) {
            let bestMatch = null;
            let bestScore = 0;

            for (const [key, pattern] of this.patterns) {
                const score = this._calculateSimilarity(sequenceOpcodes, pattern.pattern);
                if (score >= this.config.similarityThreshold && score > bestScore) {
                    bestScore = score;
                    bestMatch = pattern;
                }
            }

            if (bestMatch) {
                return {
                    pattern: bestMatch,
                    matchType: 'fuzzy',
                    confidence: bestScore
                };
            }
        }

        return null;
    }

    /**
     * Calculate similarity between two opcode sequences
     * @param {Array} seq1 - First opcode sequence
     * @param {Array} seq2 - Second opcode sequence
     * @returns {number} - Similarity score (0-1)
     * @private
     */
    _calculateSimilarity(seq1, seq2) {
        const len1 = seq1.length;
        const len2 = seq2.length;

        // Use the shorter length for comparison
        const minLen = Math.min(len1, len2);

        let matches = 0;
        for (let i = 0; i < minLen; i++) {
            if (seq1[i] === seq2[i]) {
                matches++;
            }
        }

        // Normalize by length and penalize length differences
        const baseScore = matches / minLen;
        const lengthPenalty = 1 - (Math.abs(len1 - len2) / Math.max(len1, len2));

        return baseScore * lengthPenalty;
    }

    /**
     * Detect patterns from ExecutionTracer trace
     * @param {number} patternLength - Pattern length to detect
     * @returns {Array} - Array of detected patterns
     */
    detectFromTracer(patternLength = null) {
        if (!this.executionTracer) {
            console.warn('⚠ PatternRecognizer: No ExecutionTracer linked');
            return [];
        }

        const trace = this.executionTracer.getTrace();
        const length = patternLength || this.config.maxPatternLength;

        const sequences = this.extractSequences(trace, length);
        return this.identifyPatterns(sequences);
    }

    /**
     * Analyze pattern evolution over time
     * @returns {Object} - Pattern evolution analysis
     */
    analyzePatternEvolution() {
        const now = Date.now();
        const timeWindow = 60000; // 1 minute window

        const recentPatterns = [];
        for (const [key, pattern] of this.patterns) {
            if (now - pattern.lastSeen < timeWindow) {
                recentPatterns.push({
                    key,
                    count: pattern.count,
                    age: now - pattern.firstSeen,
                    lastSeen: pattern.lastSeen
                });
            }
        }

        // Sort by recency
        recentPatterns.sort((a, b) => b.lastSeen - a.lastSeen);

        return {
            totalPatterns: this.patterns.size,
            recentPatterns: recentPatterns.slice(0, 20),
            activePatterns: recentPatterns.length,
            oldestPattern: recentPatterns.length > 0 ?
                Math.max(...recentPatterns.map(p => p.age)) : 0
        };
    }

    /**
     * Get pattern statistics
     * @returns {Object} - Pattern statistics object
     */
    getPatternStats() {
        const patterns = Array.from(this.patterns.values());

        return {
            totalPatterns: patterns.length,
            totalOccurrences: patterns.reduce((sum, p) => sum + p.count, 0),
            averagePatternLength: patterns.length > 0 ?
                patterns.reduce((sum, p) => sum + p.length, 0) / patterns.length : 0,
            topPatterns: patterns
                .sort((a, b) => b.count - a.count)
                .slice(0, 10)
                .map(p => ({
                    pattern: p.opcodeNames.join(' → '),
                    count: p.count,
                    length: p.length,
                    frequency: p.frequency
                })),
            patternLengths: this._getPatternLengthDistribution(patterns)
        };
    }

    /**
     * Get pattern length distribution
     * @param {Array} patterns - Array of patterns
     * @returns {Object} - Length distribution
     * @private
     */
    _getPatternLengthDistribution(patterns) {
        const distribution = {};
        for (const pattern of patterns) {
            const len = pattern.length;
            distribution[len] = (distribution[len] || 0) + 1;
        }
        return distribution;
    }

    /**
     * Get performance statistics
     * @returns {Object} - Performance statistics object
     */
    getPerformanceStats() {
        return {
            detectionCount: this.detectionCount,
            totalDetectionTime: this.totalDetectionTime,
            averageDetectionTime: this.detectionCount > 0 ?
                this.totalDetectionTime / this.detectionCount : 0,
            maxDetectionTime: this.maxDetectionTime,
            targetTime: 5.0,
            withinTarget: this.maxDetectionTime < 5.0
        };
    }

    /**
     * Clear all patterns and reset state
     */
    clear() {
        this.patterns.clear();
        this.sequenceBuffer = [];
        this.patternHistory = [];
        this.detectionCount = 0;
        this.totalDetectionTime = 0;
        this.maxDetectionTime = 0;
        console.log('✓ PatternRecognizer cleared');
    }

    /**
     * Export patterns to JSON
     * @returns {Object} - JSON-serializable pattern data
     */
    exportPatterns() {
        return {
            patterns: Array.from(this.patterns.entries()).map(([key, pattern]) => ({
                key,
                ...pattern
            })),
            stats: this.getPatternStats(),
            performance: this.getPerformanceStats(),
            exportedAt: new Date().toISOString()
        };
    }

    /**
     * Import patterns from JSON
     * @param {Object} data - JSON pattern data
     */
    importPatterns(data) {
        if (!data || !data.patterns) {
            console.warn('⚠ PatternRecognizer: Invalid pattern data');
            return;
        }

        this.patterns.clear();
        for (const pattern of data.patterns) {
            this.patterns.set(pattern.key, pattern);
        }

        console.log(`✓ PatternRecognizer imported ${data.patterns.length} patterns`);
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
     * Create pattern visualization UI
     * @param {Object} infiniteMap - Reference to InfiniteMap instance
     */
    createVisualizationUI(infiniteMap) {
        if (!this.config.enableVisualization || !infiniteMap) {
            return;
        }

        const container = new PIXI.Container();
        container.x = 740; // Position to the right of ExecutionTracer
        container.y = 10;
        container.zIndex = 1000;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.85);
        bg.lineStyle(2, 0xFF00FF, 1.0);
        bg.drawRoundedRect(0, 0, 380, 500, 8);
        bg.endFill();
        container.addChild(bg);

        // Title bar
        const titleBar = new PIXI.Graphics();
        titleBar.beginFill(0x330033, 1.0);
        titleBar.drawRect(0, 0, 380, 30);
        titleBar.endFill();
        container.addChild(titleBar);

        // Title text
        const titleText = new PIXI.Text('🔮 Pattern Recognizer', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 14,
            fontWeight: 'bold',
            fill: 0xFF00FF
        });
        titleText.x = 10;
        titleText.y = 6;
        container.addChild(titleText);

        // Stats section
        const statsLabel = new PIXI.Text('Statistics:', {
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
        this.statsText.style.wordWrapWidth = 360;
        container.addChild(this.statsText);

        // Pattern list section
        const patternListLabel = new PIXI.Text('Top Patterns:', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0xFFAA00
        });
        patternListLabel.x = 10;
        patternListLabel.y = 130;
        container.addChild(patternListLabel);

        this.patternListText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 9,
            fill: 0xFFFFFF
        });
        this.patternListText.x = 10;
        this.patternListText.y = 145;
        this.patternListText.style.wordWrap = true;
        this.patternListText.style.wordWrapWidth = 360;
        this.patternListText.style.maxHeight = 150;
        container.addChild(this.patternListText);

        // Pattern details section
        const patternDetailsLabel = new PIXI.Text('Pattern Details:', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0xFFAA00
        });
        patternDetailsLabel.x = 10;
        patternDetailsLabel.y = 305;
        container.addChild(patternDetailsLabel);

        this.patternDetailsText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 9,
            fill: 0xFFFFFF
        });
        this.patternDetailsText.x = 10;
        this.patternDetailsText.y = 320;
        this.patternDetailsText.style.wordWrap = true;
        this.patternDetailsText.style.wordWrapWidth = 360;
        this.patternDetailsText.style.maxHeight = 170;
        container.addChild(this.patternDetailsText);

        // Pattern visualization bars container
        this.patternGraphics = new PIXI.Graphics();
        this.patternGraphics.x = 10;
        this.patternGraphics.y = 490;
        container.addChild(this.patternGraphics);

        // Add to infinite map world
        infiniteMap.world.addChild(container);
        this.uiContainer = container;
        this.uiEnabled = true;

        console.log('✓ PatternRecognizer visualization UI created');
    }

    /**
     * Update pattern visualization UI
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

        // Auto-detect patterns if enabled
        if (this.config.enableAutoDetection && this.executionTracer) {
            this.detectFromTracer();
        }

        // Update stats
        const stats = this.getPatternStats();
        const perf = this.getPerformanceStats();
        this.statsText.text = this._formatStats(stats, perf);

        // Update pattern list
        this.patternListText.text = this._formatPatternList(stats.topPatterns);

        // Update pattern details
        this.patternDetailsText.text = this._formatPatternDetails(stats);

        // Update pattern visualization bars
        this._updatePatternBars(stats.topPatterns.slice(0, 8));
    }

    /**
     * Format statistics for display
     * @param {Object} stats - Pattern statistics
     * @param {Object} perf - Performance statistics
     * @returns {string} - Formatted stats string
     * @private
     */
    _formatStats(stats, perf) {
        const avgTime = perf.averageDetectionTime.toFixed(2);
        const maxTime = perf.maxDetectionTime.toFixed(2);
        const statusColor = perf.withinTarget ? '✓' : '⚠';

        return `${statusColor} Patterns: ${stats.totalPatterns}\n` +
            `  Occurrences: ${stats.totalOccurrences}\n` +
            `  Avg Length: ${stats.averagePatternLength.toFixed(1)}\n` +
            `  Detection: ${avgTime}ms (target: <5ms)\n` +
            `  Max: ${maxTime}ms`;
    }

    /**
     * Format pattern list for display
     * @param {Array} patterns - Array of patterns
     * @returns {string} - Formatted pattern list string
     * @private
     */
    _formatPatternList(patterns) {
        if (patterns.length === 0) {
            return 'No patterns detected yet';
        }

        return patterns.map((p, idx) => {
            const patternStr = p.pattern.substring(0, 50) + (p.pattern.length > 50 ? '...' : '');
            return `${idx + 1}. ${patternStr} (${p.count}x)`;
        }).join('\n');
    }

    /**
     * Format pattern details for display
     * @param {Object} stats - Pattern statistics
     * @returns {string} - Formatted pattern details string
     * @private
     */
    _formatPatternDetails(stats) {
        const lengthDist = stats.patternLengths;
        const lengths = Object.keys(lengthDist).sort((a, b) => parseInt(a) - parseInt(b));

        if (lengths.length === 0) {
            return 'No pattern data available';
        }

        let details = 'Length Distribution:\n';
        for (const len of lengths) {
            const count = lengthDist[len];
            const bar = '█'.repeat(Math.min(count, 20));
            details += `  ${len}-op: ${count} ${bar}\n`;
        }

        return details;
    }

    /**
     * Update pattern visualization bars
     * @param {Array} patterns - Array of patterns to visualize
     * @private
     */
    _updatePatternBars(patterns) {
        if (!this.patternGraphics) {
            return;
        }

        this.patternGraphics.clear();
        this.patternBars = [];

        if (patterns.length === 0) {
            return;
        }

        const maxCount = Math.max(...patterns.map(p => p.count));
        const barWidth = 40;
        const barSpacing = 5;
        const maxHeight = 80;

        patterns.forEach((pattern, idx) => {
            const height = (pattern.count / maxCount) * maxHeight;
            const x = idx * (barWidth + barSpacing);
            const y = maxHeight - height;

            // Bar color based on frequency
            const hue = 280 + (idx * 20) % 60; // Purple to pink range
            const color = PIXI.utils.rgb2hex([
                0.5 + (idx * 0.1) % 0.5,
                0.2,
                0.8
            ]);

            this.patternGraphics.beginFill(color, 0.8);
            this.patternGraphics.lineStyle(1, 0xFFFFFF, 0.5);
            this.patternGraphics.drawRect(x, y, barWidth, height);
            this.patternGraphics.endFill();

            // Count label
            const countText = new PIXI.Text(pattern.count.toString(), {
                fontFamily: 'Arial, sans-serif',
                fontSize: 10,
                fill: 0xFFFFFF
            });
            countText.x = x + barWidth / 2;
            countText.y = y - 15;
            countText.anchor.x = 0.5;
            this.patternGraphics.addChild(countText);

            this.patternBars.push({ graphics: this.patternGraphics, text: countText });
        });
    }

    /**
     * Remove visualization UI
     */
    removeVisualizationUI() {
        if (this.uiContainer && this.uiContainer.parent) {
            this.uiContainer.parent.removeChild(this.uiContainer);
            this.uiContainer = null;
            this.uiEnabled = false;
            this.patternGraphics = null;
            this.patternBars = [];
            console.log('✓ PatternRecognizer visualization UI removed');
        }
    }

    /**
     * Enable or disable automatic pattern detection
     * @param {boolean} enabled - Whether auto-detection is enabled
     */
    setAutoDetection(enabled) {
        this.config.enableAutoDetection = enabled;
        console.log(`✓ PatternRecognizer auto-detection ${enabled ? 'enabled' : 'disabled'}`);
    }

    /**
     * Set configuration options
     * @param {Object} options - Configuration options to set
     */
    setConfig(options) {
        this.config = { ...this.config, ...options };
        console.log('✓ PatternRecognizer configuration updated');
    }

    /**
     * Get configuration options
     * @returns {Object} - Current configuration
     */
    getConfig() {
        return { ...this.config };
    }
}

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = PatternRecognizer;
}
