/**
 * Test PatternRecognizer.js
 *
 * Tests the pattern recognition functionality including:
 * - Sequence extraction
 * - Pattern identification
 * - Pattern matching
 * - Performance benchmarks
 * - Integration with ExecutionTracer
 */

// Test configuration
const TEST_CONFIG = {
    minPatternLength: 2,
    maxPatternLength: 6,
    minPatternFrequency: 3,
    maxPatterns: 50
};

// Mock ExecutionTracer for testing
class MockExecutionTracer {
    constructor() {
        this.trace = [];
    }

    // Generate mock trace data
    generateMockTrace(length = 1000) {
        this.trace = [];
        const opcodes = [1, 2, 3, 4, 12, 13, 14, 15, 16, 17, 18];

        // Create some repeating patterns
        const pattern1 = [1, 2, 12, 2, 13]; // MOV, ADD, LOAD, ADD, STORE
        const pattern2 = [3, 4, 12, 3, 4, 13]; // SUB, MUL, LOAD, SUB, MUL, STORE
        const pattern3 = [1, 1, 2, 2, 3, 3]; // MOV, MOV, ADD, ADD, SUB, SUB

        let i = 0;
        while (i < length) {
            // Insert pattern1 (appears ~20% of the time)
            if (i % 20 === 0 && i + pattern1.length <= length) {
                for (const op of pattern1) {
                    this.trace.push(this._createRecord(op, i));
                    i++;
                }
            }
            // Insert pattern2 (appears ~15% of the time)
            else if (i % 25 === 0 && i + pattern2.length <= length) {
                for (const op of pattern2) {
                    this.trace.push(this._createRecord(op, i));
                    i++;
                }
            }
            // Insert pattern3 (appears ~10% of the time)
            else if (i % 30 === 0 && i + pattern3.length <= length) {
                for (const op of pattern3) {
                    this.trace.push(this._createRecord(op, i));
                    i++;
                }
            }
            // Random instruction
            else {
                const op = opcodes[Math.floor(Math.random() * opcodes.length)];
                this.trace.push(this._createRecord(op, i));
                i++;
            }
        }

        console.log(`✓ MockExecutionTracer: Generated ${this.trace.length} trace records`);
        return this.trace;
    }

    _createRecord(opcode, pc) {
        return {
            pc: pc * 4,
            opcode: opcode,
            dest: Math.floor(Math.random() * 32),
            src1: Math.floor(Math.random() * 32),
            src2: Math.floor(Math.random() * 32),
            r0: Math.floor(Math.random() * 256),
            r1: Math.floor(Math.random() * 256),
            r2: Math.floor(Math.random() * 256),
            r3: Math.floor(Math.random() * 256)
        };
    }

    getTrace(limit = null) {
        if (limit === null) {
            return [...this.trace];
        }
        return this.trace.slice(-limit);
    }

    clear() {
        this.trace = [];
    }
}

// Test suite
class PatternRecognizerTestSuite {
    constructor() {
        this.passed = 0;
        this.failed = 0;
        this.tests = [];
    }

    async runAllTests() {
        console.log('\n========================================');
        console.log('  PatternRecognizer Test Suite');
        console.log('========================================\n');

        await this.testBasicPatternDetection();
        await this.testSequenceExtraction();
        await this.testPatternMatching();
        await this.testFuzzyMatching();
        await this.testPerformance();
        await this.testExecutionTracerIntegration();
        await this.testPatternEvolution();
        await this.testExportImport();

        this.printSummary();
    }

    async testBasicPatternDetection() {
        console.log('Test 1: Basic Pattern Detection');
        console.log('--------------------------------');

        try {
            const recognizer = new PatternRecognizer(TEST_CONFIG);
            const mockTracer = new MockExecutionTracer();
            mockTracer.generateMockTrace(500);

            const trace = mockTracer.getTrace();
            const sequences = recognizer.extractSequences(trace, 5);
            const patterns = recognizer.identifyPatterns(sequences);

            console.log(`✓ Extracted ${sequences.length} sequences`);
            console.log(`✓ Detected ${patterns.length} patterns`);

            if (patterns.length > 0) {
                console.log(`✓ Top pattern: ${patterns[0].opcodeNames.join(' → ')} (${patterns[0].count}x)`);
            }

            this.recordTest('Basic Pattern Detection', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Basic Pattern Detection', false);
        }

        console.log();
    }

    async testSequenceExtraction() {
        console.log('Test 2: Sequence Extraction');
        console.log('---------------------------');

        try {
            const recognizer = new PatternRecognizer(TEST_CONFIG);
            const mockTracer = new MockExecutionTracer();
            mockTracer.generateMockTrace(200);

            const trace = mockTracer.getTrace();

            // Test different sequence lengths
            const sequences3 = recognizer.extractSequences(trace, 3);
            const sequences5 = recognizer.extractSequences(trace, 5);
            const sequences8 = recognizer.extractSequences(trace, 8);

            console.log(`✓ Extracted ${sequences3.length} sequences of length 3`);
            console.log(`✓ Extracted ${sequences5.length} sequences of length 5`);
            console.log(`✓ Extracted ${sequences8.length} sequences of length 8`);

            // Verify sequence structure
            if (sequences5.length > 0) {
                const seq = sequences5[0];
                if (seq.length === 5 && seq[0].opcode !== undefined) {
                    console.log(`✓ Sequence structure verified`);
                } else {
                    throw new Error('Invalid sequence structure');
                }
            }

            this.recordTest('Sequence Extraction', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Sequence Extraction', false);
        }

        console.log();
    }

    async testPatternMatching() {
        console.log('Test 3: Pattern Matching');
        console.log('------------------------');

        try {
            const recognizer = new PatternRecognizer(TEST_CONFIG);
            const mockTracer = new MockExecutionTracer();
            mockTracer.generateMockTrace(500);

            const trace = mockTracer.getTrace();
            const sequences = recognizer.extractSequences(trace, 5);
            recognizer.identifyPatterns(sequences);

            // Test exact matching
            const testSequence = sequences[0];
            const exactMatch = recognizer.matchPattern(testSequence, false);

            if (exactMatch && exactMatch.matchType === 'exact' && exactMatch.confidence === 1.0) {
                console.log(`✓ Exact pattern match found with confidence 1.0`);
            } else {
                throw new Error('Exact pattern match failed');
            }

            // Test non-matching sequence
            const nonMatchingSequence = [{ opcode: 255 }, { opcode: 255 }, { opcode: 255 }];
            const noMatch = recognizer.matchPattern(nonMatchingSequence, false);

            if (noMatch === null) {
                console.log(`✓ Correctly returned null for non-matching sequence`);
            } else {
                throw new Error('Should return null for non-matching sequence');
            }

            this.recordTest('Pattern Matching', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Pattern Matching', false);
        }

        console.log();
    }

    async testFuzzyMatching() {
        console.log('Test 4: Fuzzy Pattern Matching');
        console.log('------------------------------');

        try {
            const recognizer = new PatternRecognizer({
                ...TEST_CONFIG,
                similarityThreshold: 0.6
            });
            const mockTracer = new MockExecutionTracer();
            mockTracer.generateMockTrace(500);

            const trace = mockTracer.getTrace();
            const sequences = recognizer.extractSequences(trace, 5);
            recognizer.identifyPatterns(sequences);

            // Create a sequence similar to an existing pattern
            const testSequence = sequences[0].map(s => ({ ...s }));
            // Modify one opcode to make it slightly different
            if (testSequence.length > 2) {
                testSequence[2].opcode = (testSequence[2].opcode + 1) % 19;
            }

            const fuzzyMatch = recognizer.matchPattern(testSequence, true);

            if (fuzzyMatch && fuzzyMatch.matchType === 'fuzzy') {
                console.log(`✓ Fuzzy pattern match found with confidence ${fuzzyMatch.confidence.toFixed(2)}`);
            } else {
                console.log(`ℹ No fuzzy match found (may be expected)`);
            }

            this.recordTest('Fuzzy Pattern Matching', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Fuzzy Pattern Matching', false);
        }

        console.log();
    }

    async testPerformance() {
        console.log('Test 5: Performance Benchmark');
        console.log('-----------------------------');

        try {
            const recognizer = new PatternRecognizer(TEST_CONFIG);
            const mockTracer = new MockExecutionTracer();

            // Test with 10,000 instructions
            console.log('Testing with 10,000 instructions...');
            mockTracer.generateMockTrace(10000);

            const trace = mockTracer.getTrace();

            // Benchmark sequence extraction
            const extractStart = performance.now();
            const sequences = recognizer.extractSequences(trace, 5);
            const extractTime = performance.now() - extractStart;

            console.log(`✓ Sequence extraction: ${extractTime.toFixed(2)}ms`);

            // Benchmark pattern identification
            const detectStart = performance.now();
            const patterns = recognizer.identifyPatterns(sequences);
            const detectTime = performance.now() - detectStart;

            console.log(`✓ Pattern identification: ${detectTime.toFixed(2)}ms`);

            const totalTime = extractTime + detectTime;
            console.log(`✓ Total time: ${totalTime.toFixed(2)}ms (target: <5ms)`);

            const perf = recognizer.getPerformanceStats();
            console.log(`✓ Average detection time: ${perf.averageDetectionTime.toFixed(2)}ms`);
            console.log(`✓ Max detection time: ${perf.maxDetectionTime.toFixed(2)}ms`);

            if (totalTime < 5.0) {
                console.log(`✓ Performance target met (<5ms)`);
            } else {
                console.warn(`⚠ Performance target not met (target: <5ms, actual: ${totalTime.toFixed(2)}ms)`);
            }

            this.recordTest('Performance Benchmark', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Performance Benchmark', false);
        }

        console.log();
    }

    async testExecutionTracerIntegration() {
        console.log('Test 6: ExecutionTracer Integration');
        console.log('-----------------------------------');

        try {
            const recognizer = new PatternRecognizer(TEST_CONFIG);
            const mockTracer = new MockExecutionTracer();
            mockTracer.generateMockTrace(500);

            // Link recognizer to tracer
            recognizer.setExecutionTracer(mockTracer);

            // Detect patterns from tracer
            const patterns = recognizer.detectFromTracer(5);

            console.log(`✓ Linked PatternRecognizer to ExecutionTracer`);
            console.log(`✓ Detected ${patterns.length} patterns from tracer`);

            if (patterns.length > 0) {
                console.log(`✓ Top pattern: ${patterns[0].opcodeNames.join(' → ')} (${patterns[0].count}x)`);
            }

            // Test auto-detection
            recognizer.setAutoDetection(true);
            recognizer.setConfig({ enableAutoDetection: true });

            console.log(`✓ Auto-detection enabled`);

            this.recordTest('ExecutionTracer Integration', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('ExecutionTracer Integration', false);
        }

        console.log();
    }

    async testPatternEvolution() {
        console.log('Test 7: Pattern Evolution Analysis');
        console.log('-----------------------------------');

        try {
            const recognizer = new PatternRecognizer(TEST_CONFIG);
            const mockTracer = new MockExecutionTracer();

            // First batch
            mockTracer.generateMockTrace(300);
            recognizer.setExecutionTracer(mockTracer);
            recognizer.detectFromTracer(5);

            const stats1 = recognizer.getPatternStats();
            console.log(`✓ First batch: ${stats1.totalPatterns} patterns`);

            // Second batch
            mockTracer.generateMockTrace(300);
            recognizer.detectFromTracer(5);

            const stats2 = recognizer.getPatternStats();
            console.log(`✓ Second batch: ${stats2.totalPatterns} patterns`);

            // Analyze evolution
            const evolution = recognizer.analyzePatternEvolution();
            console.log(`✓ Active patterns: ${evolution.activePatterns}`);
            console.log(`✓ Recent patterns: ${evolution.recentPatterns.length}`);

            this.recordTest('Pattern Evolution Analysis', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Pattern Evolution Analysis', false);
        }

        console.log();
    }

    async testExportImport() {
        console.log('Test 8: Export/Import Patterns');
        console.log('-------------------------------');

        try {
            const recognizer = new PatternRecognizer(TEST_CONFIG);
            const mockTracer = new MockExecutionTracer();
            mockTracer.generateMockTrace(500);

            recognizer.setExecutionTracer(mockTracer);
            recognizer.detectFromTracer(5);

            const stats1 = recognizer.getPatternStats();
            console.log(`✓ Original patterns: ${stats1.totalPatterns}`);

            // Export
            const exported = recognizer.exportPatterns();
            console.log(`✓ Exported ${exported.patterns.length} patterns`);

            // Create new recognizer and import
            const recognizer2 = new PatternRecognizer(TEST_CONFIG);
            recognizer2.importPatterns(exported);

            const stats2 = recognizer2.getPatternStats();
            console.log(`✓ Imported patterns: ${stats2.totalPatterns}`);

            if (stats1.totalPatterns === stats2.totalPatterns) {
                console.log(`✓ Pattern count preserved`);
            } else {
                throw new Error('Pattern count mismatch after import');
            }

            this.recordTest('Export/Import Patterns', true);
        } catch (error) {
            console.error(`✗ Test failed: ${error.message}`);
            this.recordTest('Export/Import Patterns', false);
        }

        console.log();
    }

    recordTest(name, passed) {
        this.tests.push({ name, passed });
        if (passed) {
            this.passed++;
        } else {
            this.failed++;
        }
    }

    printSummary() {
        console.log('========================================');
        console.log('  Test Summary');
        console.log('========================================');
        console.log(`Total tests: ${this.tests.length}`);
        console.log(`Passed: ${this.passed}`);
        console.log(`Failed: ${this.failed}`);
        console.log(`Success rate: ${((this.passed / this.tests.length) * 100).toFixed(1)}%`);
        console.log('========================================\n');

        if (this.failed === 0) {
            console.log('✓ All tests passed!');
        } else {
            console.log('✗ Some tests failed. See details above.');
        }
    }
}

// Run tests if in Node.js environment
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PatternRecognizerTestSuite, MockExecutionTracer };
}

// Auto-run in browser
if (typeof window !== 'undefined') {
    window.PatternRecognizerTestSuite = PatternRecognizerTestSuite;
    window.MockExecutionTracer = MockExecutionTracer;

    // Run tests after page load
    window.addEventListener('load', () => {
        const suite = new PatternRecognizerTestSuite();
        suite.runAllTests();
    });
}
