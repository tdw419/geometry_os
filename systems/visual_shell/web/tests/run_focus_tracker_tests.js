/**
 * Test Runner for FocusTracker
 *
 * Run this file to execute all FocusTracker tests.
 * Can be run in browser console or Node.js with jsdom.
 */

// Test runner function
async function runFocusTrackerTests() {
    console.log('🚀 Starting FocusTracker test execution...\n');

    // Load dependencies
    if (typeof FocusTracker === 'undefined') {
        // Try to load from file
        try {
            if (typeof require !== 'undefined') {
                const { FocusTracker } = require('../focus_tracker.js');
                global.FocusTracker = FocusTracker;
            } else {
                // Browser: assumes script already loaded
                console.error('FocusTracker not loaded. Include focus_tracker.js first.');
                return false;
            }
        } catch (e) {
            console.error('Failed to load FocusTracker:', e.message);
            return false;
        }
    }

    // Load test class
    let FocusTrackerTests;
    if (typeof window !== 'undefined' && window.FocusTrackerTests) {
        FocusTrackerTests = window.FocusTrackerTests;
    } else if (typeof module !== 'undefined') {
        const { FocusTrackerTests: Tests } = require('./test_focus_tracker.js');
        FocusTrackerTests = Tests;
    }

    // Create and run tests
    const tests = new FocusTrackerTests();
    const passed = await tests.execute();

    console.log('\n' + '='.repeat(50));
    if (passed) {
        console.log('✅ All FocusTracker tests PASSED!');
    } else {
        console.log('❌ Some FocusTracker tests FAILED!');
    }
    console.log('='.repeat(50) + '\n');

    return passed;
}

// Export
if (typeof window !== 'undefined') {
    window.runFocusTrackerTests = runFocusTrackerTests;
    // Auto-run in browser
    if (document.readyState === 'complete') {
        runFocusTrackerTests();
    } else {
        window.addEventListener('load', runFocusTrackerTests);
    }
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { runFocusTrackerTests };
}
