/**
 * Test file for BottleneckDetector (Task 2.2)
 * 
 * Tests the BottleneckDetector class including:
 * - Slow instruction detection (>1ms avg)
 * - Memory operation detection (>0.5ms)
 * - Excessive jump detection (>30%)
 * - I/O operation detection (>0.1ms console, >2ms framebuffer)
 * - Bottleneck visualization UI
 * - PerformanceMonitor integration
 * - <10ms analysis time requirement
 */

// Load BottleneckDetector from file
let BottleneckDetector;

// Try to load from file in Node.js environment
if (typeof require !== 'undefined') {
    const fs = require('fs');
    const path = require('path');

    // Read the BottleneckDetector.js file
    const detectorPath = path.join(__dirname, 'BottleneckDetector.js');
    const detectorCode = fs.readFileSync(detectorPath, 'utf-8');

    // Simple approach: split by lines and remove the module.exports block
    const lines = detectorCode.split('\n');

    // Find the last non-empty line before module.exports
    let lastClassLine = -1;
    for (let i = lines.length - 1; i >= 0; i--) {
        const line = lines[i].trim();
        if (line && !line.startsWith('//') && line !== '}' && !line.includes('module.exports')) {
            lastClassLine = i;
            break;
        }
    }

    // Remove the module.exports block (last few lines)
    const nodeDetectorCode = lines.slice(0, lastClassLine + 1).join('\n');

    // Create a function context for the code
    const context = {
        performance: performance,
        console: console,
        module: { exports: {} },
        exports: {}
    };

    // Execute the code to define the class
    const func = new Function(
        'performance', 'console', 'module', 'exports',
        nodeDetectorCode
    );
    func(context.performance, context.console, context.module, context.exports);

    // The class should now be defined in global scope
    if (typeof BottleneckDetector === 'undefined') {
        // Try to get from module.exports
        BottleneckDetector = context.module.exports.BottleneckDetector || context.module.exports;
    }

    if (typeof BottleneckDetector === 'undefined') {
        throw new Error('Failed to load BottleneckDetector class');
    }
}

// Mock PIXI for testing without the actual library
class MockPIXI {
    static Container() {
        return { children: [], addChild: (c) => this.children.push(c), x: 0, y: 0 };
    }
    static Graphics() {
        return {
            beginFill: () => this,
            lineStyle: () => this,
            drawRect: () => this,
            drawRoundedRect: () => this,
            endFill: () => this,
            clear: () => this,
            moveTo: () => this,
            lineTo: () => this
        };
    }
    static Text(text, style) {
        this.text = text;
        this.style = style;
        return this;
    }
}

// Mock PerformanceMonitor
class MockPerformanceMonitor {
    constructor() {
        this.fps = 60;
        this.executionTime = { current: 5, mean: 5 };
        this.anomalies = [];
    }

    getStats() {
        return {
            fps: this.fps,
            executionTime: this.executionTime,
            anomalies: this.anomalies
        };
    }

    setLowFPS(fps) {
        this.fps = fps;
    }

    setExecutionSpike(current, mean) {
        this.executionTime = { current, mean };
    }
}

/**
 * Test 1: Slow Instruction Detection
 */
function testSlowInstructionDetection() {
    console.log('\n=== Test 1: Slow Instruction Detection ===');

    const detector = new BottleneckDetector();

    // Record slow MUL instructions (>1ms)
    for (let i = 0; i < 100; i++) {
        detector.recordInstruction(4, 1.5, false, false); // MUL at 1.5ms
    }

    // Record normal ADD instructions
    for (let i = 0; i < 500; i++) {
        detector.recordInstruction(2, 0.05, false, false); // ADD at 0.05ms
    }

    const result = detector.analyze();

    console.log(`Analysis time: ${result.analysisTime.toFixed(2)}ms`);
    console.log(`Bottlenecks found: ${result.bottlenecks.length}`);

    const slowMulBottleneck = result.bottlenecks.find(b => b.type === 'slow_instruction' && b.opcode === 4);
    if (slowMulBottleneck) {
        console.log(`✓ Slow MUL instruction detected: ${slowMulBottleneck.avgTime.toFixed(2)}ms avg`);
        console.log(`  Count: ${slowMulBottleneck.count}`);
        console.log(`  Severity: ${slowMulBottleneck.severity.toFixed(2)}`);
        console.log(`  Recommendation: ${slowMulBottleneck.recommendation}`);
    } else {
        console.log('✗ Slow MUL instruction not detected');
        return false;
    }

    if (result.analysisTime < 10) {
        console.log(`✓ Analysis time < 10ms requirement met: ${result.analysisTime.toFixed(2)}ms`);
    } else {
        console.log(`✗ Analysis time exceeded 10ms: ${result.analysisTime.toFixed(2)}ms`);
        return false;
    }

    return true;
}

/**
 * Test 2: Memory Operation Detection
 */
function testMemoryOperationDetection() {
    console.log('\n=== Test 2: Memory Operation Detection ===');

    const detector = new BottleneckDetector();

    // Record slow memory operations (>0.5ms)
    for (let i = 0; i < 50; i++) {
        detector.recordInstruction(12, 0.8, true, false); // LOAD at 0.8ms
        detector.recordInstruction(13, 0.7, true, false); // STORE at 0.7ms
    }

    const result = detector.analyze();

    console.log(`Analysis time: ${result.analysisTime.toFixed(2)}ms`);
    console.log(`Bottlenecks found: ${result.bottlenecks.length}`);

    const memoryBottleneck = result.bottlenecks.find(b => b.type === 'memory_operation');
    if (memoryBottleneck) {
        console.log(`✓ Memory operation bottleneck detected: ${memoryBottleneck.avgTime.toFixed(2)}ms avg`);
        console.log(`  Count: ${memoryBottleneck.count}`);
        console.log(`  Recommendation: ${memoryBottleneck.recommendation}`);
    } else {
        console.log('✗ Memory operation bottleneck not detected');
        return false;
    }

    return true;
}

/**
 * Test 3: Excessive Jump Detection
 */
function testExcessiveJumpDetection() {
    console.log('\n=== Test 3: Excessive Jump Detection ===');

    const detector = new BottleneckDetector();

    // Record 40% jump instructions (>30% threshold)
    for (let i = 0; i < 400; i++) {
        if (i % 10 < 4) {
            detector.recordInstruction(14, 0.1, false, true); // JUMP
        } else {
            detector.recordInstruction(2, 0.05, false, false); // ADD
        }
    }

    const result = detector.analyze();

    console.log(`Analysis time: ${result.analysisTime.toFixed(2)}ms`);
    console.log(`Bottlenecks found: ${result.bottlenecks.length}`);

    const jumpBottleneck = result.bottlenecks.find(b => b.type === 'excessive_jumps');
    if (jumpBottleneck) {
        console.log(`✓ Excessive jumps detected: ${(jumpBottleneck.jumpRatio * 100).toFixed(1)}%`);
        console.log(`  Jump count: ${jumpBottleneck.jumpCount}`);
        console.log(`  Total instructions: ${jumpBottleneck.totalInstructions}`);
        console.log(`  Recommendation: ${jumpBottleneck.recommendation}`);
    } else {
        console.log('✗ Excessive jumps not detected');
        return false;
    }

    return true;
}

/**
 * Test 4: Console I/O Detection
 */
function testConsoleIODetection() {
    console.log('\n=== Test 4: Console I/O Detection ===');

    const detector = new BottleneckDetector();

    // Record slow console I/O operations (>0.1ms)
    for (let i = 0; i < 30; i++) {
        detector.recordInstruction(12, 0.15, false, false, true, false); // LOAD with console I/O
    }

    const result = detector.analyze();

    console.log(`Analysis time: ${result.analysisTime.toFixed(2)}ms`);
    console.log(`Bottlenecks found: ${result.bottlenecks.length}`);

    const consoleBottleneck = result.bottlenecks.find(b => b.type === 'console_io');
    if (consoleBottleneck) {
        console.log(`✓ Console I/O bottleneck detected: ${consoleBottleneck.avgTime.toFixed(2)}ms avg`);
        console.log(`  Count: ${consoleBottleneck.count}`);
        console.log(`  Recommendation: ${consoleBottleneck.recommendation}`);
    } else {
        console.log('✗ Console I/O bottleneck not detected');
        return false;
    }

    return true;
}

/**
 * Test 5: Framebuffer I/O Detection
 */
function testFramebufferIODetection() {
    console.log('\n=== Test 5: Framebuffer I/O Detection ===');

    const detector = new BottleneckDetector();

    // Record slow framebuffer I/O operations (>2ms)
    for (let i = 0; i < 20; i++) {
        detector.recordInstruction(13, 2.5, false, false, false, true); // STORE with framebuffer I/O
    }

    const result = detector.analyze();

    console.log(`Analysis time: ${result.analysisTime.toFixed(2)}ms`);
    console.log(`Bottlenecks found: ${result.bottlenecks.length}`);

    const framebufferBottleneck = result.bottlenecks.find(b => b.type === 'framebuffer_io');
    if (framebufferBottleneck) {
        console.log(`✓ Framebuffer I/O bottleneck detected: ${framebufferBottleneck.avgTime.toFixed(2)}ms avg`);
        console.log(`  Count: ${framebufferBottleneck.count}`);
        console.log(`  Recommendation: ${framebufferBottleneck.recommendation}`);
    } else {
        console.log('✗ Framebuffer I/O bottleneck not detected');
        return false;
    }

    return true;
}

/**
 * Test 6: PerformanceMonitor Integration
 */
function testPerformanceMonitorIntegration() {
    console.log('\n=== Test 6: PerformanceMonitor Integration ===');

    const detector = new BottleneckDetector();
    const mockMonitor = new MockPerformanceMonitor();

    detector.setPerformanceMonitor(mockMonitor);

    // Record some instructions
    for (let i = 0; i < 100; i++) {
        detector.recordInstruction(2, 0.1, false, false);
    }

    // Simulate low FPS in PerformanceMonitor
    mockMonitor.setLowFPS(25);

    const result = detector.analyze();

    console.log(`Analysis time: ${result.analysisTime.toFixed(2)}ms`);
    console.log(`Bottlenecks found: ${result.bottlenecks.length}`);

    const lowFpsBottleneck = result.bottlenecks.find(b => b.type === 'low_fps');
    if (lowFpsBottleneck) {
        console.log(`✓ Low FPS bottleneck detected: ${lowFpsBottleneck.fps.toFixed(1)} FPS`);
        console.log(`  Recommendation: ${lowFpsBottleneck.recommendation}`);
    } else {
        console.log('✗ Low FPS bottleneck not detected');
        return false;
    }

    // Simulate execution spike
    mockMonitor.setExecutionSpike(15, 5);
    const result2 = detector.analyze();

    const spikeBottleneck = result2.bottlenecks.find(b => b.type === 'execution_spike');
    if (spikeBottleneck) {
        console.log(`✓ Execution spike detected: ${spikeBottleneck.multiplier.toFixed(1)}x`);
        console.log(`  Recommendation: ${spikeBottleneck.recommendation}`);
    } else {
        console.log('✗ Execution spike not detected');
        return false;
    }

    return true;
}

/**
 * Test 7: Analysis Time Performance
 */
function testAnalysisTimePerformance() {
    console.log('\n=== Test 7: Analysis Time Performance (<10ms) ===');

    const detector = new BottleneckDetector();

    // Record a large number of instructions
    for (let i = 0; i < 10000; i++) {
        const opcode = i % 19;
        const isMemory = opcode === 12 || opcode === 13;
        const isJump = opcode >= 14 && opcode <= 18;
        detector.recordInstruction(opcode, 0.1 + Math.random() * 0.2, isMemory, isJump);
    }

    // Run multiple analyses to measure average time
    const iterations = 10;
    const times = [];

    for (let i = 0; i < iterations; i++) {
        const start = performance.now();
        detector.analyze();
        const end = performance.now();
        times.push(end - start);
    }

    const avgTime = times.reduce((a, b) => a + b, 0) / times.length;
    const maxTime = Math.max(...times);

    console.log(`Sample count: ${detector.sampleCount}`);
    console.log(`Average analysis time: ${avgTime.toFixed(3)}ms`);
    console.log(`Max analysis time: ${maxTime.toFixed(3)}ms`);
    console.log(`Min analysis time: ${Math.min(...times).toFixed(3)}ms`);

    if (avgTime < 10) {
        console.log(`✓ Average analysis time < 10ms requirement met`);
        return true;
    } else {
        console.log(`✗ Average analysis time exceeded 10ms`);
        return false;
    }
}

/**
 * Test 8: Bottleneck Statistics and History
 */
function testBottleneckStatistics() {
    console.log('\n=== Test 8: Bottleneck Statistics and History ===');

    const detector = new BottleneckDetector();

    // Record various bottlenecks
    for (let i = 0; i < 50; i++) {
        detector.recordInstruction(4, 1.2, false, false); // Slow MUL
        detector.recordInstruction(12, 0.6, true, false); // Slow memory
    }

    const result1 = detector.analyze();
    const result2 = detector.analyze();
    const result3 = detector.analyze();

    const stats = detector.getStats();
    console.log(`Total analyses: ${stats.totalAnalysisCount}`);
    console.log(`Average analysis time: ${stats.avgAnalysisTime.toFixed(3)}ms`);
    console.log(`Max analysis time: ${stats.maxAnalysisTime.toFixed(3)}ms`);
    console.log(`Current bottlenecks: ${stats.bottleneckCount}`);
    console.log(`Instruction types: ${stats.instructionTypes}`);
    console.log(`Memory operations: ${stats.memoryOperations}`);
    console.log(`Jump ratio: ${(stats.jumpRatio * 100).toFixed(1)}%`);

    const history = detector.getHistory(5);
    console.log(`History entries: ${history.length}`);

    if (history.length >= 3) {
        console.log(`✓ History tracking working correctly`);
        return true;
    } else {
        console.log(`✗ History tracking not working`);
        return false;
    }
}

/**
 * Test 9: Export Report
 */
function testExportReport() {
    console.log('\n=== Test 9: Export Report ===');

    const detector = new BottleneckDetector();

    // Record some bottlenecks
    for (let i = 0; i < 50; i++) {
        detector.recordInstruction(4, 1.2, false, false);
    }

    detector.analyze();

    const report = detector.exportReport();

    console.log(`Report timestamp: ${new Date(report.timestamp).toISOString()}`);
    console.log(`Report stats:`, report.stats);
    console.log(`Report history entries: ${report.history.length}`);
    console.log(`Config thresholds:`, report.config);

    if (report.stats && report.history && report.config) {
        console.log(`✓ Report export working correctly`);
        return true;
    } else {
        console.log(`✗ Report export not working`);
        return false;
    }
}

/**
 * Test 10: Clear Functionality
 */
function testClearFunctionality() {
    console.log('\n=== Test 10: Clear Functionality ===');

    const detector = new BottleneckDetector();

    // Record some data
    for (let i = 0; i < 100; i++) {
        detector.recordInstruction(2, 0.1, false, false);
    }

    const statsBefore = detector.getStats();
    console.log(`Before clear - Samples: ${statsBefore.sampleCount}, Analyses: ${statsBefore.totalAnalysisCount}`);

    detector.clear();

    const statsAfter = detector.getStats();
    console.log(`After clear - Samples: ${statsAfter.sampleCount}, Analyses: ${statsAfter.totalAnalysisCount}`);

    if (statsAfter.sampleCount === 0 && statsAfter.totalAnalysisCount === 0) {
        console.log(`✓ Clear functionality working correctly`);
        return true;
    } else {
        console.log(`✗ Clear functionality not working`);
        return false;
    }
}

/**
 * Run all tests
 */
function runAllTests() {
    console.log('\n========================================');
    console.log('BottleneckDetector Test Suite (Task 2.2)');
    console.log('========================================');

    const tests = [
        { name: 'Slow Instruction Detection', fn: testSlowInstructionDetection },
        { name: 'Memory Operation Detection', fn: testMemoryOperationDetection },
        { name: 'Excessive Jump Detection', fn: testExcessiveJumpDetection },
        { name: 'Console I/O Detection', fn: testConsoleIODetection },
        { name: 'Framebuffer I/O Detection', fn: testFramebufferIODetection },
        { name: 'PerformanceMonitor Integration', fn: testPerformanceMonitorIntegration },
        { name: 'Analysis Time Performance', fn: testAnalysisTimePerformance },
        { name: 'Bottleneck Statistics and History', fn: testBottleneckStatistics },
        { name: 'Export Report', fn: testExportReport },
        { name: 'Clear Functionality', fn: testClearFunctionality }
    ];

    const results = [];

    for (const test of tests) {
        try {
            const passed = test.fn();
            results.push({ name: test.name, passed });
        } catch (error) {
            console.error(`Error in ${test.name}:`, error);
            results.push({ name: test.name, passed: false, error: error.message });
        }
    }

    console.log('\n========================================');
    console.log('Test Results Summary');
    console.log('========================================');

    for (const result of results) {
        const status = result.passed ? '✓ PASS' : '✗ FAIL';
        console.log(`${status}: ${result.name}`);
        if (result.error) {
            console.log(`  Error: ${result.error}`);
        }
    }

    const passed = results.filter(r => r.passed).length;
    const total = results.length;
    console.log(`\nTotal: ${passed}/${total} tests passed`);

    if (passed === total) {
        console.log('✓ All tests passed!');
    } else {
        console.log('✗ Some tests failed');
    }

    return passed === total;
}

// Run tests if executed directly
if (typeof window === 'undefined' && typeof module !== 'undefined') {
    // Node.js environment
    runAllTests();
} else if (typeof window !== 'undefined') {
    // Browser environment - expose to global scope
    window.BottleneckDetectorTests = {
        runAllTests,
        testSlowInstructionDetection,
        testMemoryOperationDetection,
        testExcessiveJumpDetection,
        testConsoleIODetection,
        testFramebufferIODetection,
        testPerformanceMonitorIntegration,
        testAnalysisTimePerformance,
        testBottleneckStatistics,
        testExportReport,
        testClearFunctionality
    };

    console.log('BottleneckDetector tests loaded. Run window.BottleneckDetectorTests.runAllTests() to execute.');
}
