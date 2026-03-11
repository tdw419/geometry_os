/**
 * Test: SBI Handler
 *
 * Validates SBI call handling for timer, console, and system reset.
 */

// Node.js compatibility check
if (typeof window === 'undefined') {
    global.console = console;
}

// Import or define SBIHandler
let SBIHandler;

if (typeof require !== 'undefined') {
    // Node.js - would need to export properly
    console.log('Running in Node.js - skipping ES module import');
} else {
    // Browser
    SBIHandler = window.SBIHandler;
}

/**
 * Test helper: assert equal values
 * @param {*} actual - Actual value
 * @param {*} expected - Expected value
 * @param {string} msg - Test message
 */
function assertEqual(actual, expected, msg) {
    if (actual !== expected) {
        throw new Error(`${msg}: expected ${expected}, got ${actual}`);
    }
}

/**
 * Run all SBI handler tests
 * @returns {boolean} - True if all tests passed
 */
function runTests() {
    let testsPassed = 0;
    let testsFailed = 0;

    const tests = [
        testSBIConstruction,
        testBaseExtension,
        testTimerExtension,
        testConsoleExtension,
        testUnknownExtension
    ];

    for (const test of tests) {
        try {
            test();
            testsPassed++;
            console.log(` ${test.name}`);
        } catch (e) {
            testsFailed++;
            console.error(` ${test.name}: ${e.message}`);
        }
    }

    console.log(`\n${testsPassed}/${tests.length} tests passed`);
    return testsFailed === 0;
}

/**
 * Test SBI handler construction
 * Verifies that all 4 extensions are registered
 */
function testSBIConstruction() {
    const handler = new SBIHandler({});
    assertEqual(handler.extensions.size, 4, 'Extension count');
}

/**
 * Test Base extension (EID 0x10)
 * Verifies:
 * - get_spec_version returns 0x20000000 (SBI v2.0)
 * - probe_extension returns 1 for timer extension
 * - probe_extension returns 0 for unknown extension
 */
function testBaseExtension() {
    const handler = new SBIHandler({});

    // get_spec_version (FID 0x00)
    const [err1, version] = handler.handle(0x10, 0x00, []);
    assertEqual(err1, 0, 'Base: get_spec_version error');
    assertEqual(version, 0x20000000, 'Base: spec version is 2.0');

    // probe_extension for timer (EID 0x00)
    const [err2, supported] = handler.handle(0x10, 0x03, [0x00]);
    assertEqual(err2, 0, 'Base: probe timer error');
    assertEqual(supported, 1, 'Base: timer extension supported');

    // probe_extension for unknown
    const [err3, unsupported] = handler.handle(0x10, 0x03, [0xFF]);
    assertEqual(unsupported, 0, 'Base: unknown extension not supported');
}

/**
 * Test Timer extension (EID 0x00)
 * Verifies:
 * - set_timer sets the timer value and flag
 * - checkTimerInterrupt returns false before timer expires
 * - checkTimerInterrupt returns true when timer expires
 * - Timer flag is cleared after interrupt
 */
function testTimerExtension() {
    const handler = new SBIHandler({});

    // set_timer
    const [err, val] = handler.handle(0x00, 0x00, [1000, 0]);
    assertEqual(err, 0, 'Timer: set_timer error');
    assertEqual(handler.timerSet, true, 'Timer: timer is set');
    assertEqual(handler.timerValue, 1000n, 'Timer: value is correct');

    // Check timer interrupt before expiry
    assertEqual(handler.checkTimerInterrupt(500n), false, 'Timer: no interrupt yet');

    // Check timer interrupt at expiry
    assertEqual(handler.checkTimerInterrupt(1000n), true, 'Timer: interrupt fires');
    assertEqual(handler.timerSet, false, 'Timer: cleared after interrupt');
}

/**
 * Test Console extension (EID 0x01)
 * Verifies:
 * - putchar triggers callback with correct character
 * - getchar returns -1 (0xFFFFFFFF) when no input available
 */
function testConsoleExtension() {
    const handler = new SBIHandler({});
    let output = '';

    handler.onConsoleOutput = (ch) => { output += ch; };

    // console_putchar
    const [err, val] = handler.handle(0x01, 0x00, [65]); // 'A'
    assertEqual(err, 0, 'Console: putchar error');
    assertEqual(output, 'A', 'Console: output received');

    // console_getchar (no input)
    const [err2, val2] = handler.handle(0x01, 0x01, []);
    assertEqual(err2, 0, 'Console: getchar error');
    assertEqual(val2, 0xFFFFFFFF, 'Console: no char available');
}

/**
 * Test unknown extension handling
 * Verifies that unknown EID returns NOT_SUPPORTED (-2)
 */
function testUnknownExtension() {
    const handler = new SBIHandler({});

    const [err, val] = handler.handle(0xFF, 0x00, []);
    assertEqual(err, -2, 'Unknown: returns NOT_SUPPORTED');
}

// Export for browser use
if (typeof window !== 'undefined') {
    window.runSBITests = runTests;
    console.log('SBI tests loaded. Run with: window.runSBITests()');
} else {
    // Node.js
    runTests();
}
