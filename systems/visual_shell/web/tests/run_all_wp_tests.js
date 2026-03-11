/**
 * Unified Test Runner for WordPress-Map Integration
 * Runs all test suites: Golden Path (7), Stress (3), Resilience (2)
 *
 * Usage in browser console:
 *   const script = document.createElement('script');
 *   script.src = '/systems/visual_shell/web/tests/run_all_wp_tests.js';
 *   document.head.appendChild(script);
 *   await new WPUnifiedTestRunner().runAll();
 */

class WPUnifiedTestRunner {
    constructor() {
        this.allResults = {
            functional: [],
            stress: [],
            resilience: []
        };
    }

    /**
     * Run all test phases and generate final report
     */
    async runAll() {
        // Print header box
        console.log('\n');
        console.log('%c╔════════════════════════════════════════════════════════════╗', 'color: #00ffcc;');
        console.log('%c║     GEOMETRY OS - WORDPRESS INTEGRATION TEST SUITE         ║', 'color: #00ffcc; font-weight: bold; font-size: 16px;');
        console.log('%c╚════════════════════════════════════════════════════════════╝', 'color: #00ffcc;');
        console.log('\n%cRunning all test phases...\n', 'color: #888;');

        // Phase 1: Functional Tests (WPIntegrationVerifier - 7 tests)
        console.log('%c══════════════════════ PHASE 1: FUNCTIONAL ══════════════════', 'color: #00ffcc; font-weight: bold;');
        if (typeof WPIntegrationVerifier !== 'undefined') {
            const verifier = new WPIntegrationVerifier();
            await verifier.runAll();
            this.allResults.functional = verifier.results || [];
        } else {
            console.log('%c⚠️ WPIntegrationVerifier not loaded. Load verification_wp_integration.js first.', 'color: #ffcc00;');
            this.allResults.functional = [];
        }

        // Phase 2: Stress Tests (WPBridgeStressTester - 3 tests)
        console.log('\n%c══════════════════════ PHASE 2: STRESS ══════════════════════', 'color: #ff4444; font-weight: bold;');
        if (typeof WPBridgeStressTester !== 'undefined') {
            const stressTester = new WPBridgeStressTester();
            await stressTester.runStressTests();
            this.allResults.stress = stressTester.results || [];
        } else {
            console.log('%c⚠️ WPBridgeStressTester not loaded. Load stress_test_wp_bridge.js first.', 'color: #ffcc00;');
            this.allResults.stress = [];
        }

        // Phase 3: Resilience Tests (WPBridgeResilienceTester - 2 tests)
        console.log('\n%c══════════════════════ PHASE 3: RESILIENCE ══════════════════', 'color: #00ffcc; font-weight: bold;');
        if (typeof WPBridgeResilienceTester !== 'undefined') {
            const resilienceTester = new WPBridgeResilienceTester();
            await resilienceTester.runResilienceTests();
            this.allResults.resilience = resilienceTester.results || [];
        } else {
            console.log('%c⚠️ WPBridgeResilienceTester not loaded. Load resilience_test_wp_bridge.js first.', 'color: #ffcc00;');
            this.allResults.resilience = [];
        }

        // Generate final report
        this.finalReport();
    }

    /**
     * Generate final aggregated report
     */
    finalReport() {
        // Print final header box
        console.log('\n');
        console.log('%c╔════════════════════════════════════════════════════════════╗', 'color: #00ffcc;');
        console.log('%c║              FINAL INTEGRATION REPORT                      ║', 'color: #00ffcc; font-weight: bold; font-size: 16px;');
        console.log('%c╚════════════════════════════════════════════════════════════╝', 'color: #00ffcc;');
        console.log('\n');

        // Report each phase
        this.report('Phase 1: Functional Tests', this.allResults.functional);
        this.report('Phase 2: Stress Tests', this.allResults.stress);
        this.report('Phase 3: Resilience Tests', this.allResults.resilience);

        // Calculate overall stats
        const allTests = [
            ...this.allResults.functional,
            ...this.allResults.stress,
            ...this.allResults.resilience
        ];
        const totalPassed = allTests.filter(r => r.success).length;
        const totalTests = allTests.length;

        // Print separator
        console.log('\n' + '─'.repeat(60));

        // Print overall result
        const overallColor = totalPassed === totalTests ? 'color: #00ff00' : 'color: #ff4444';
        console.log(`%cOVERALL: ${totalPassed}/${totalTests} TESTS PASSED`, `${overallColor}; font-weight: bold; font-size: 16px;`);

        // Print system status
        if (totalPassed === totalTests) {
            console.log('%c✅ SYSTEM STATUS: PRODUCTION READY', 'color: #00ff00; font-weight: bold; font-size: 14px;');
        } else {
            console.log('%c⚠️ SYSTEM STATUS: NEEDS ATTENTION', 'color: #ffcc00; font-weight: bold; font-size: 14px;');
        }

        console.log('─'.repeat(60) + '\n');
    }

    /**
     * Helper to report phase results with color
     */
    report(name, results) {
        const passed = results.filter(r => r.success).length;
        const total = results.length;

        if (total === 0) {
            console.log(`%c${name}: NO RESULTS (test class not loaded)`, 'color: #ffcc00;');
            return;
        }

        const allPassed = passed === total;
        const color = allPassed ? 'color: #00ff00' : 'color: #ff4444';
        const symbol = allPassed ? '✅' : '⚠️';

        console.log(`${symbol} %c${name}: ${passed}/${total} PASSED`, `${color}; font-weight: bold;`);
    }
}

// Export for both browser and Node.js
if (typeof window !== 'undefined') {
    window.WPUnifiedTestRunner = WPUnifiedTestRunner;
    console.log('%cWPUnifiedTestRunner loaded.', 'color: #00ffcc;');
    console.log('%cRun: await new WPUnifiedTestRunner().runAll();', 'color: #888;');
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { WPUnifiedTestRunner };
}
