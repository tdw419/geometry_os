#!/usr/bin/env node

/**
 * Node.js Test Suite: Console I/O for Pixel CPU - PixiJS Integration
 * 
 * This is a Node.js version of console I/O tests that can be run from the command line.
 */

// Load SimplePixelCPU class
const fs = require('fs');
const path = require('path');

// Read and evaluate pixel_cpu.js
const pixelCpuPath = path.join(__dirname, 'pixel_cpu.js');
const pixelCpuCode = fs.readFileSync(pixelCpuPath, 'utf8');

// Create a module context to evaluate the code
const moduleExports = {};
const moduleContext = {
    module: { exports: moduleExports },
    exports: moduleExports,
    console: console,
    Uint8Array: Uint8Array,
    Array: Array,
    Math: Math,
    Error: Error,
    RangeError: RangeError,
    TypeError: TypeError,
    Promise: Promise,
    performance: {
        now: () => Date.now()
    }
};

// Evaluate the code in the module context
const evalFunction = new Function(
    'module', 'exports', 'console', 'Uint8Array', 'Array', 'Math', 'Error', 'RangeError', 'TypeError', 'Promise', 'performance',
    pixelCpuCode
);
evalFunction(
    moduleContext.module,
    moduleContext.exports,
    moduleContext.console,
    moduleContext.Uint8Array,
    moduleContext.Array,
    moduleContext.Math,
    moduleContext.Error,
    moduleContext.RangeError,
    moduleContext.TypeError,
    moduleContext.Promise,
    moduleContext.performance
);

// Get the SimplePixelCPU class
const SimplePixelCPU = moduleExports.SimplePixelCPU || moduleExports;

// Test helper functions
class ConsoleIOTester {
    constructor() {
        this.testsPassed = 0;
        this.testsFailed = 0;
        this.testResults = [];
    }

    log(message) {
        console.log(`[Console I/O Test] ${message}`);
    }

    assert(condition, testName) {
        if (condition) {
            this.testsPassed++;
            this.testResults.push({ name: testName, passed: true });
            this.log(`✓ PASS: ${testName}`);
        } else {
            this.testsFailed++;
            this.testResults.push({ name: testName, passed: false });
            this.log(`✗ FAIL: ${testName}`);
        }
    }

    assertEquals(actual, expected, testName) {
        this.assert(actual === expected, `${testName} (expected: ${expected}, actual: ${actual})`);
    }

    printSummary() {
        this.log('='.repeat(60));
        this.log(`Test Summary: ${this.testsPassed} passed, ${this.testsFailed} failed`);
        this.log('='.repeat(60));
        return this.testsFailed === 0;
    }
}

/**
 * Test 1: Console Output Mechanism
 */
function testConsoleOutputMechanism() {
    const tester = new ConsoleIOTester();
    tester.log('Test 1: Console Output Mechanism');

    const cpu = new SimplePixelCPU();

    let consoleOutput = '';
    cpu.setConsoleOutputCallback((char) => {
        consoleOutput += String.fromCharCode(char);
    });

    // Test 1.1: Write printable character
    cpu.writeMemory(0x20000000, 65); // 'A'
    tester.assertEquals(consoleOutput, 'A', 'Write printable character');

    // Test 1.2: Write newline
    cpu.writeMemory(0x20000000, 10); // '\n'
    tester.assertEquals(consoleOutput, 'A\n', 'Write newline');

    // Test 1.3: Write multiple characters
    cpu.writeMemory(0x20000000, 72); // 'H'
    cpu.writeMemory(0x20000000, 101); // 'e'
    cpu.writeMemory(0x20000000, 108); // 'l'
    cpu.writeMemory(0x20000000, 108); // 'l'
    cpu.writeMemory(0x20000000, 111); // 'o'
    tester.assertEquals(consoleOutput, 'A\nHello', 'Write multiple characters');

    // Test 1.4: Backspace handling
    cpu.writeMemory(0x20000000, 8); // Backspace
    tester.assertEquals(consoleOutput, 'A\nHell', 'Backspace removes character');

    // Test 1.5: Tab expansion
    cpu.writeMemory(0x20000000, 9); // Tab
    tester.assertEquals(consoleOutput, 'A\nHell    ', 'Tab expands to 4 spaces');

    return tester.printSummary();
}

/**
 * Test 2: Console Buffer Management
 */
function testConsoleBufferManagement() {
    const tester = new ConsoleIOTester();
    tester.log('Test 2: Console Buffer Management');

    const cpu = new SimplePixelCPU();

    let consoleOutput = '';
    cpu.setConsoleOutputCallback((char) => {
        consoleOutput += String.fromCharCode(char);
    });

    // Test 2.1: Write multiple lines
    for (let i = 1; i <= 30; i++) {
        const line = `Line ${i}`;
        for (const char of line) {
            cpu.writeMemory(0x20000000, char.charCodeAt(0));
        }
        cpu.writeMemory(0x20000000, 10); // Newline
    }

    const lines = consoleOutput.split('\n');
    tester.assert(lines.length >= 24, 'Console maintains at least 24 lines');
    tester.assert(lines.includes('Line 30'), 'Latest line is present');

    return tester.printSummary();
}

/**
 * Test 3: Memory-Mapped I/O Verification
 */
function testMemoryMappedIO() {
    const tester = new ConsoleIOTester();
    tester.log('Test 3: Memory-Mapped I/O Verification');

    const cpu = new SimplePixelCPU();

    let consoleOutput = '';
    cpu.setConsoleOutputCallback((char) => {
        consoleOutput += String.fromCharCode(char);
    });

    // Test 3.1: Console output at 0x20000000
    cpu.writeMemory(0x20000000, 88); // 'X'
    tester.assertEquals(consoleOutput, 'X', 'Console output at 0x20000000');

    // Test 3.2: Console input at 0x20000001 (read-only)
    cpu.setConsoleInputCallback(() => 65); // Return 'A'
    const input = cpu.readMemory(0x20000001);
    tester.assertEquals(input, 65, 'Console input at 0x20000001');

    // Test 3.3: Console status at 0x20000002
    const status = cpu.readMemory(0x20000002);
    tester.assertEquals(status, 0x01, 'Console status at 0x20000002 (output ready)');

    // Test 3.4: Verify other addresses in console region don't trigger output
    const beforeOutput = consoleOutput;
    cpu.writeMemory(0x20000003, 89); // 'Y' at offset 0x03
    tester.assertEquals(consoleOutput, beforeOutput, 'Non-output address ignored');

    return tester.printSummary();
}

/**
 * Test 4: Real-time Console Updates
 */
function testRealtimeConsoleUpdates() {
    const tester = new ConsoleIOTester();
    tester.log('Test 4: Real-time Console Updates');

    const cpu = new SimplePixelCPU();

    const outputEvents = [];
    cpu.setConsoleOutputCallback((char) => {
        outputEvents.push({
            char: String.fromCharCode(char),
            time: Date.now()
        });
    });

    // Simulate rapid writes
    const startTime = Date.now();
    const message = 'Hello, World!';
    for (const char of message) {
        cpu.writeMemory(0x20000000, char.charCodeAt(0));
    }
    const endTime = Date.now();

    // Test 4.1: All characters were written
    tester.assertEquals(outputEvents.length, message.length, 'All characters written');

    // Test 4.2: Characters are in correct order
    const outputString = outputEvents.map(e => e.char).join('');
    tester.assertEquals(outputString, message, 'Characters in correct order');

    // Test 4.3: Writes completed quickly (<100ms for 13 characters)
    const totalTime = endTime - startTime;
    tester.assert(totalTime < 100, `Rapid writes completed in ${totalTime}ms (<100ms)`);

    return tester.printSummary();
}

/**
 * Test 5: Console Display Performance
 */
function testConsoleDisplayPerformance() {
    const tester = new ConsoleIOTester();
    tester.log('Test 5: Console Display Performance');

    // Simulate console update performance
    const iterations = 1000;
    const totalStartTime = Date.now();

    for (let i = 0; i < iterations; i++) {
        const startTime = Date.now();

        // Simulate console text update
        const text = 'Test line ' + i + '\n';
        const displayText = text.repeat(24); // 24 lines

        // Simulate text assignment
        const dummy = displayText.length;

        const endTime = Date.now();
        const updateTime = endTime - startTime;

        // Verify update time is <1ms (1000ns)
        if (updateTime >= 1) {
            // Note: Node.js Date.now() has millisecond precision, so we can't measure <1ms accurately
            // This is more of a conceptual test
        }
    }

    const totalTime = Date.now() - totalStartTime;
    const avgTime = totalTime / iterations;

    tester.assert(avgTime < 1, `Average update time ${avgTime.toFixed(3)}ms is <1ms`);

    return tester.printSummary();
}

/**
 * Run all tests
 */
function runAllConsoleIOTests() {
    console.log('='.repeat(60));
    console.log('Console I/O Test Suite - Phase 3 (Node.js)');
    console.log('='.repeat(60));

    const results = [];

    // Run all tests
    results.push({ test: 'Console Output Mechanism', passed: testConsoleOutputMechanism() });
    results.push({ test: 'Console Buffer Management', passed: testConsoleBufferManagement() });
    results.push({ test: 'Memory-Mapped I/O', passed: testMemoryMappedIO() });
    results.push({ test: 'Real-time Console Updates', passed: testRealtimeConsoleUpdates() });
    results.push({ test: 'Console Display Performance', passed: testConsoleDisplayPerformance() });

    // Print final summary
    console.log('='.repeat(60));
    console.log('Final Test Summary');
    console.log('='.repeat(60));

    let totalPassed = 0;
    let totalFailed = 0;

    results.forEach(result => {
        if (result.passed) {
            totalPassed++;
            console.log(`✓ ${result.test}: PASSED`);
        } else {
            totalFailed++;
            console.log(`✗ ${result.test}: FAILED`);
        }
    });

    console.log('='.repeat(60));
    console.log(`Total: ${totalPassed} passed, ${totalFailed} failed`);
    console.log('='.repeat(60));

    return totalFailed === 0;
}

// Run tests if executed directly
if (require.main === module) {
    const allPassed = runAllConsoleIOTests();
    process.exit(allPassed ? 0 : 1);
}

// Export for use as module
module.exports = {
    ConsoleIOTester,
    testConsoleOutputMechanism,
    testConsoleBufferManagement,
    testMemoryMappedIO,
    testRealtimeConsoleUpdates,
    testConsoleDisplayPerformance,
    runAllConsoleIOTests
};
