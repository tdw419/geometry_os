/**
 * WP Bridge Resilience Tester
 *
 * Resilience tests for WordPress-Geometry OS bridge.
 * Tests late joiner persistence and metrics persistence.
 *
 * Usage:
 *   1. Open the Mission Control page in WordPress.
 *   2. Paste this script into the browser console.
 *   3. Run: const tester = new WPBridgeResilienceTester(); await tester.runResilienceTests();
 */

class WPBridgeResilienceTester {
    constructor() {
        this.results = [];
    }

    /**
     * Run all resilience tests
     */
    async runResilienceTests() {
        console.log('%c🛡️ WP BRIDGE RESILIENCE TESTS', 'color: #00ffcc; font-size: 18px; font-weight: bold;');
        console.log('%cTesting late joiner persistence and metrics persistence...', 'color: #888;');

        await this.testLateJoinerPersistence();
        await this.testMetricsPersistence();

        this.report();
    }

    /**
     * Test 1: Late Joiner Persistence
     * Verifies that console output history is available for late-joining tiles
     */
    async testLateJoinerPersistence() {
        console.log('\n%cTest 1: Late Joiner Persistence', 'color: #ffcc00; font-weight: bold;');

        const tileId = 'persistence-test-tile-' + Date.now();
        const testMessage = 'RESILIENCE_TEST_MSG_' + Date.now();

        // Register tile
        window.geometryOS?.registerTile(tileId, {
            x: Math.floor(Math.random() * 5000),
            y: Math.floor(Math.random() * 5000),
            state: 'running'
        });

        // Dispatch console output event with test message
        window.dispatchEvent(new CustomEvent('geometryOS:consoleOutput', {
            detail: {
                tileId: tileId,
                text: testMessage,
                timestamp: Date.now()
            }
        }));

        // Wait for event to process
        await this.sleep(100);

        // Retrieve console history
        const history = window.geometryOS?.getConsoleOutput?.(tileId, 5);

        // Verify history is array and contains test message
        const isHistoryArray = Array.isArray(history);
        const containsMessage = isHistoryArray && history.some(entry =>
            (typeof entry === 'string' && entry.includes(testMessage)) ||
            (entry && entry.text && entry.text.includes(testMessage))
        );

        const success = isHistoryArray && containsMessage;
        const details = success
            ? `History retrieved with ${history.length} entries, contains test message`
            : `History issue - is array: ${isHistoryArray}, contains message: ${containsMessage}`;

        this.logResult('Late Joiner Persistence', success, details);

        // Cleanup
        window.geometryOS?.tileRegistry?.delete(tileId);
    }

    /**
     * Test 2: Metrics Persistence
     * Verifies that metrics persist across sync operations
     */
    async testMetricsPersistence() {
        console.log('\n%cTest 2: Metrics Persistence', 'color: #ffcc00; font-weight: bold;');

        // Get initial metrics
        const initialMetrics = window.geometryOS?.metrics?.getAllMetrics?.();

        if (!initialMetrics) {
            this.logResult('Metrics Persistence', false, 'Metrics not available (window.geometryOS.metrics.getAllMetrics)');
            return;
        }

        const initialSyncCount = initialMetrics.syncCount || 0;

        // Record a sync operation
        window.geometryOS?.metrics?.recordSync?.();

        // Wait for metrics to update
        await this.sleep(50);

        // Get new metrics
        const newMetrics = window.geometryOS?.metrics?.getAllMetrics?.();
        const newSyncCount = newMetrics?.syncCount || 0;

        // Verify sync count increased
        const success = newSyncCount > initialSyncCount;
        const details = success
            ? `Sync count persisted: ${initialSyncCount} -> ${newSyncCount}`
            : `Sync count did not increase: ${initialSyncCount} -> ${newSyncCount}`;

        this.logResult('Metrics Persistence', success, details);
    }

    /**
     * Log test result
     */
    logResult(name, success, details) {
        const symbol = success ? '✅' : '❌';
        console.log(`${symbol} ${name}: ${details}`);
        this.results.push({ name, success, details });
    }

    /**
     * Generate resilience test report
     */
    report() {
        console.log('\n' + '═'.repeat(50));
        console.log('%c🛡️ RESILIENCE TEST RESULTS', 'color: #00ffcc; font-size: 16px; font-weight: bold;');
        console.log('═'.repeat(50));

        const passed = this.results.filter(r => r.success).length;
        const total = this.results.length;
        const color = passed === total ? 'color: #00ff00' : 'color: #ff4444';

        this.results.forEach(r => {
            const symbol = r.success ? '✅' : '❌';
            console.log(`${symbol} ${r.name.padEnd(25)} | ${r.details}`);
        });

        console.log('─'.repeat(50));
        console.log(`%c${passed}/${total} RESILIENCE TESTS PASSED`, `${color}; font-weight: bold;`);
        console.log('═'.repeat(50));
    }

    /**
     * Sleep helper
     */
    sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
}

// Export for both browser and Node.js
if (typeof window !== 'undefined') {
    window.WPBridgeResilienceTester = WPBridgeResilienceTester;
    console.log('%cWPBridgeResilienceTester loaded.', 'color: #00ffcc;');
    console.log('%cRun: const tester = new WPBridgeResilienceTester(); await tester.runResilienceTests();', 'color: #888;');
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { WPBridgeResilienceTester };
}
