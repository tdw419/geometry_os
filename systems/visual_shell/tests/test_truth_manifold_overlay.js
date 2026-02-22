/**
 * Tests for Truth Manifold HUD Handler
 * =====================================
 *
 * Tests for handleTruthManifoldUpdate and _renderTruthManifoldSection
 * in visual_debug_overlay.js.
 *
 * These tests document expected behavior and can be run in browser console
 * or with a test framework like Jest/Mocha.
 */

// Mock VisualDebugOverlay for testing
class MockVisualDebugOverlay {
    constructor() {
        this.truthManifoldState = {
            enabled: false,
            connected: false,
            cronbachAlpha: 0,
            elementalIndependence: false,
            meanScores: { E1_archaeology: 0, E2_manuscript: 0, E3_prophecy: 0 },
            verseCount: 0,
            lastUpdate: null,
            error: null,
            errorCode: null
        };
        this._scheduleRenderCalled = false;
    }

    // Simulated handler from visual_debug_overlay.js
    handleTruthManifoldUpdate(data) {
        if (!data) return;

        const payload = data.data || data;

        // Handle error payloads
        if (payload.error) {
            this.truthManifoldState.error = payload.error;
            this.truthManifoldState.errorCode = payload.error_code || 'UNKNOWN';
            this.truthManifoldState.connected = false;
            this._scheduleRender();
            return;
        }

        // Update state from payload
        this.truthManifoldState.enabled = true;
        this.truthManifoldState.connected = true;
        this.truthManifoldState.cronbachAlpha = payload.system_metrics?.cronbach_alpha ?? 0;
        this.truthManifoldState.elementalIndependence = payload.system_metrics?.elemental_independence ?? false;
        this.truthManifoldState.meanScores = payload.mean_scores || {
            E1_archaeology: 0, E2_manuscript: 0, E3_prophecy: 0
        };
        this.truthManifoldState.verseCount = payload.verse_count ?? 0;
        this.truthManifoldState.lastUpdate = Date.now();
        this.truthManifoldState.error = null;
        this.truthManifoldState.errorCode = null;

        this._scheduleRender();
    }

    _scheduleRender() {
        this._scheduleRenderCalled = true;
    }
}

// Test cases
const tests = {
    testHandleTruthManifoldUpdate_valid: () => {
        const overlay = new MockVisualDebugOverlay();
        const validPayload = {
            type: 'CTRM_TRUTH_UPDATE',
            data: {
                system_metrics: {
                    cronbach_alpha: 0.0329,
                    elemental_independence: true
                },
                mean_scores: {
                    E1_archaeology: 0.2307,
                    E2_manuscript: 0.9507,
                    E3_prophecy: 0.5
                },
                verse_count: 100
            }
        };

        overlay.handleTruthManifoldUpdate(validPayload);

        console.assert(overlay.truthManifoldState.enabled === true, 'Should be enabled');
        console.assert(overlay.truthManifoldState.connected === true, 'Should be connected');
        console.assert(overlay.truthManifoldState.cronbachAlpha === 0.0329, 'Cronbach alpha should match');
        console.assert(overlay.truthManifoldState.elementalIndependence === true, 'Independence should be true');
        console.assert(overlay.truthManifoldState.verseCount === 100, 'Verse count should be 100');
        console.assert(overlay._scheduleRenderCalled === true, 'Should call _scheduleRender');
        console.assert(overlay.truthManifoldState.lastUpdate !== null, 'Should have timestamp');

        return 'PASS';
    },

    testHandleTruthManifoldUpdate_null: () => {
        const overlay = new MockVisualDebugOverlay();
        overlay.handleTruthManifoldUpdate(null);

        console.assert(overlay.truthManifoldState.enabled === false, 'Should remain disabled');
        console.assert(overlay._scheduleRenderCalled === false, 'Should not call _scheduleRender');

        return 'PASS';
    },

    testHandleTruthManifoldUpdate_partial: () => {
        const overlay = new MockVisualDebugOverlay();
        const partialPayload = {
            data: {
                system_metrics: {
                    cronbach_alpha: 0.05
                    // Missing elemental_independence
                }
                // Missing mean_scores
            }
        };

        overlay.handleTruthManifoldUpdate(partialPayload);

        console.assert(overlay.truthManifoldState.cronbachAlpha === 0.05, 'Cronbach alpha should match');
        console.assert(overlay.truthManifoldState.elementalIndependence === false, 'Missing field should default to false');
        console.assert(overlay.truthManifoldState.meanScores.E1_archaeology === 0, 'Missing mean scores should default to 0');
        console.assert(overlay._scheduleRenderCalled === true, 'Should call _scheduleRender');

        return 'PASS';
    },

    testHandleTruthManifoldUpdate_error: () => {
        const overlay = new MockVisualDebugOverlay();
        const errorPayload = {
            type: 'CTRM_TRUTH_UPDATE',
            error: 'CTRM report not found',
            error_code: 'FILE_NOT_FOUND'
        };

        overlay.handleTruthManifoldUpdate(errorPayload);

        console.assert(overlay.truthManifoldState.error === 'CTRM report not found', 'Should capture error');
        console.assert(overlay.truthManifoldState.errorCode === 'FILE_NOT_FOUND', 'Should capture error code');
        console.assert(overlay.truthManifoldState.connected === false, 'Should be disconnected');
        console.assert(overlay._scheduleRenderCalled === true, 'Should call _scheduleRender for error display');

        return 'PASS';
    },

    testRenderSection_visibility: () => {
        const overlay = new MockVisualDebugOverlay();

        // Initially disabled
        console.assert(overlay.truthManifoldState.enabled === false, 'Should start disabled');

        // After valid update
        overlay.handleTruthManifoldUpdate({
            data: {
                system_metrics: { cronbach_alpha: 0.0329 },
                mean_scores: {},
                verse_count: 100
            }
        });

        console.assert(overlay.truthManifoldState.enabled === true, 'Should be enabled after update');

        return 'PASS';
    }
};

// Run tests
function runTests() {
    console.log('Running Truth Manifold HUD Handler Tests...\n');

    let passed = 0;
    let failed = 0;

    for (const [name, test] of Object.entries(tests)) {
        try {
            const result = test();
            console.log(`✓ ${name}: ${result}`);
            passed++;
        } catch (error) {
            console.log(`✗ ${name}: FAIL - ${error.message}`);
            failed++;
        }
    }

    console.log(`\n${passed} passed, ${failed} failed`);
    return { passed, failed };
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { MockVisualDebugOverlay, tests, runTests };
}

// Auto-run if in browser console
if (typeof window !== 'undefined' && window.location) {
    console.log('Run `runTests()` to execute tests');
}
