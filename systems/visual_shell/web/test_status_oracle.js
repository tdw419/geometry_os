/**
 * Geometry OS: Test Status Oracle
 * 
 * This module acts as the "source of truth" for garden health.
 * In a real implementation, this would query a CI/CD server or run local tests.
 * For Phase 30, it simulates test results and provides an API for updating status.
 */

class TestStatusOracle {
    constructor() {
        this.results = new Map(); // testId -> { status: 'passing'|'failing', lastRun: string, output: string }
        this.listeners = new Set();
    }

    /**
     * Get status for a specific test/garden
     */
    getStatus(testId) {
        return this.results.get(testId) || { status: 'unknown', lastRun: null };
    }

    /**
     * Update test result
     */
    updateResult(testId, status, output = '') {
        const result = {
            status,
            lastRun: new Date().toISOString(),
            output
        };
        this.results.set(testId, result);
        this._notifyListeners(testId, result);
        console.log(`🧪 Test Result: ${testId} = ${status}`);
    }

    /**
     * Simulate a test run (random failure for demo purposes)
     */
    runTest(testId) {
        console.log(`🏃 Running test: ${testId}...`);

        // Simulate async test duration
        return new Promise(resolve => {
            setTimeout(() => {
                const shouldPass = Math.random() > 0.3; // 70% success rate
                const status = shouldPass ? 'passing' : 'failing';
                const output = shouldPass ? 'All tests passed.' : 'AssertionError: expected true to be false';

                this.updateResult(testId, status, output);
                resolve(status);
            }, 1000);
        });
    }

    /**
     * Scan current codebase for tests (Mock)
     */
    async discoverTests() {
        // Return a mock list of tests found in the current "codebase" (map tiles)
        return [
            'systems/auth/test_login.js',
            'systems/payment/test_stripe.js',
            'systems/core/test_boot.js'
        ];
    }

    // --- Event Handling ---

    onChange(callback) {
        this.listeners.add(callback);
    }

    offChange(callback) {
        this.listeners.delete(callback);
    }

    _notifyListeners(testId, result) {
        for (const listener of this.listeners) {
            listener({ testId, result });
        }
    }
}

// Export
if (typeof window !== 'undefined') {
    window.TestStatusOracle = TestStatusOracle;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { TestStatusOracle };
}
