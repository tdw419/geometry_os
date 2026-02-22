// test_evolution_safety_bridge.js
// Run with: node test_evolution_safety_bridge.js

const assert = require('assert');

// Mock fetch for Node.js
global.fetch = async (url, options) => {
    const mockResponses = {
        'http://localhost:31338/api/v1/safety/get_metabolism': {
            ok: true,
            json: async () => ({
                cpu_percent: 35.8,
                memory_available_mb: 4096,
                gpu_temp_c: 62.0,
                throttle_level: 'none'
            })
        },
        'http://localhost:31338/api/v1/safety/check_rts_integrity': {
            ok: true,
            json: async () => ({
                file_path: '/test/file.rts.png',
                sha256_ok: true,
                hilbert_coherence: 0.998,
                entropy: 7.98,
                checks_passed: true
            })
        },
        'http://localhost:31338/api/v1/safety/predict_health': {
            ok: true,
            json: async () => ({
                file_path: '/test/file.rts.png',
                predicted_health_score: 0.92,
                horizon_hours: 24,
                recommended_action: 'none'
            })
        },
        'http://localhost:31338/api/v1/safety/heal_rts': {
            ok: true,
            json: async () => ({
                file_path: '/test/file.rts.png',
                action: 'defragment',
                success: true
            })
        },
        'http://localhost:31338/api/v1/safety/get_prognostics': {
            ok: true,
            json: async () => ({
                file_path: '/test/file.rts.png',
                historical_health: [0.95, 0.94, 0.92, 0.91],
                predictions: {
                    '24h': 0.90,
                    '48h': 0.87,
                    '72h': 0.85
                }
            })
        }
    };

    // Parse URL without body for GET requests
    const urlStr = typeof url === 'string' ? url : url.toString();
    for (const [pattern, response] of Object.entries(mockResponses)) {
        if (urlStr.includes(pattern.split('localhost:31338')[1])) {
            return response;
        }
    }
    return { ok: false, status: 404 };
};

// Load the module (will fail initially)
let EvolutionSafetyBridge;
try {
    EvolutionSafetyBridge = require('./evolution_safety_bridge.js');
} catch (e) {
    console.log('Expected error (module does not exist yet):', e.message);
}

// Test 1: Module exists and has required methods
async function test_module_exists() {
    assert(EvolutionSafetyBridge, 'EvolutionSafetyBridge should exist');
    assert(typeof EvolutionSafetyBridge.safety_get_metabolism === 'function', 'Should have safety_get_metabolism');
    assert(typeof EvolutionSafetyBridge.safety_check_rts_integrity === 'function', 'Should have safety_check_rts_integrity');
    assert(typeof EvolutionSafetyBridge.safety_predict_health === 'function', 'Should have safety_predict_health');
    assert(typeof EvolutionSafetyBridge.safety_heal_rts === 'function', 'Should have safety_heal_rts');
    assert(typeof EvolutionSafetyBridge.safety_get_prognostics === 'function', 'Should have safety_get_prognostics');
    console.log('PASS: test_module_exists');
}

// Test 2: safety_get_metabolism returns valid data
async function test_get_metabolism() {
    const result = await EvolutionSafetyBridge.safety_get_metabolism();
    assert(result.cpu_percent !== undefined, 'Should have cpu_percent');
    assert(result.throttle_level !== undefined, 'Should have throttle_level');
    assert(['none', 'moderate', 'aggressive'].includes(result.throttle_level), 'throttle_level should be valid');
    console.log('PASS: test_get_metabolism');
}

// Test 3: safety_check_rts_integrity returns valid data
async function test_check_rts_integrity() {
    const result = await EvolutionSafetyBridge.safety_check_rts_integrity('/test/file.rts.png');
    assert(result.checks_passed !== undefined, 'Should have checks_passed');
    assert(result.sha256_ok !== undefined, 'Should have sha256_ok');
    console.log('PASS: test_check_rts_integrity');
}

// Test 4: safety_predict_health returns valid data
async function test_predict_health() {
    const result = await EvolutionSafetyBridge.safety_predict_health('/test/file.rts.png', 24);
    assert(result.predicted_health_score !== undefined || result.predicted_health !== undefined, 'Should have predicted_health_score');
    console.log('PASS: test_predict_health');
}

// Test 5: safety_heal_rts returns valid data
async function test_heal_rts() {
    const result = await EvolutionSafetyBridge.safety_heal_rts('/test/file.rts.png', 'defragment');
    assert(result.success !== undefined, 'Should have success');
    console.log('PASS: test_heal_rts');
}

// Test 6: safety_get_prognostics returns valid data
async function test_get_prognostics() {
    const result = await EvolutionSafetyBridge.safety_get_prognostics('/test/file.rts.png');
    assert(result.historical_health !== undefined, 'Should have historical_health');
    console.log('PASS: test_get_prognostics');
}

// Test 7: Error handling for non-existent endpoint
async function test_error_handling() {
    // Mock an error response
    const originalFetch = global.fetch;
    global.fetch = async () => ({ ok: false, status: 500 });

    const result = await EvolutionSafetyBridge.safety_get_metabolism();
    assert(result.error !== undefined, 'Should return error object');
    assert(result.throttle_level === 'none', 'Should default to throttle_level=none on error');

    global.fetch = originalFetch;
    console.log('PASS: test_error_handling');
}

// Test 8: Browser export (window.EvolutionSafetyBridge)
async function test_browser_export() {
    // Simulate browser environment
    // Clear the module cache to re-execute the code with window defined
    delete require.cache[require.resolve('./evolution_safety_bridge.js')];
    global.window = {};
    require('./evolution_safety_bridge.js');
    assert(global.window.EvolutionSafetyBridge !== undefined, 'Should export to window.EvolutionSafetyBridge');
    console.log('PASS: test_browser_export');
}

// Run tests
(async () => {
    try {
        await test_module_exists();
        await test_get_metabolism();
        await test_check_rts_integrity();
        await test_predict_health();
        await test_heal_rts();
        await test_get_prognostics();
        await test_error_handling();
        await test_browser_export();
        console.log('\nAll tests passed!');
    } catch (e) {
        console.error('\nTest failed:', e.message);
        console.error(e.stack);
        process.exit(1);
    }
})();
