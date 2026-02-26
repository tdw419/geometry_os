/**
 * Geometry OS: GlyphExecutor Unit Tests
 *
 * Tests for the GlyphExecutor class that executes Resonance Glyphs
 * on the Infinite Map, bridging PixiJS visual layer to WebGPU compute.
 *
 * Run in browser console: runGlyphExecutorTests()
 */

/**
 * Test 1: Constructor
 * Verify options.maxCores defaults to 64, registry is empty on init
 */
function testConstructor() {
    const executor = new GlyphExecutor();

    // Verify default maxCores
    console.assert(
        executor.options.maxCores === 64,
        `Expected maxCores=64, got ${executor.options.maxCores}`
    );

    // Verify registry is empty
    console.assert(
        executor.registry.size === 0,
        `Expected empty registry, got size ${executor.registry.size}`
    );

    // Verify glyphSize default
    console.assert(
        executor.options.glyphSize === 16,
        `Expected glyphSize=16, got ${executor.options.glyphSize}`
    );

    // Verify regsPerCore default
    console.assert(
        executor.options.regsPerCore === 46,
        `Expected regsPerCore=46, got ${executor.options.regsPerCore}`
    );

    console.log('✅ testConstructor passed');
}

/**
 * Test 2: Constructor with custom options
 * Verify custom options are properly merged
 */
function testConstructorCustomOptions() {
    const executor = new GlyphExecutor({
        maxCores: 32,
        glyphSize: 8
    });

    console.assert(
        executor.options.maxCores === 32,
        `Expected maxCores=32, got ${executor.options.maxCores}`
    );

    console.assert(
        executor.options.glyphSize === 8,
        `Expected glyphSize=8, got ${executor.options.glyphSize}`
    );

    // Default should still be present for unspecified options
    console.assert(
        executor.options.regsPerCore === 46,
        `Expected regsPerCore=46 (default), got ${executor.options.regsPerCore}`
    );

    console.log('✅ testConstructorCustomOptions passed');
}

/**
 * Test 3: Registration
 * registerGlyph returns coreId, registry has entry, state accessible
 */
function testRegistration() {
    const executor = new GlyphExecutor();

    // Mock sprite object
    const mockSprite = {
        alpha: 1.0,
        scale: { set: () => {} },
        tint: 0xffffff
    };

    // Register a glyph at position (5, 10) with atlas coords (2, 3)
    const coreId = executor.registerGlyph(5, 10, mockSprite, 2, 3);

    // Verify coreId is a number
    console.assert(
        typeof coreId === 'number',
        `Expected coreId to be a number, got ${typeof coreId}`
    );

    // Verify coreId is 0 for first registration
    console.assert(
        coreId === 0,
        `Expected first coreId=0, got ${coreId}`
    );

    // Verify registry has entry
    console.assert(
        executor.registry.size === 1,
        `Expected registry size 1, got ${executor.registry.size}`
    );

    // Verify state is accessible via getExecutionState
    const state = executor.getExecutionState(5, 10);
    console.assert(
        state !== null,
        'Expected state to be accessible'
    );

    // Verify state properties
    console.assert(
        state.atlasX === 2,
        `Expected atlasX=2, got ${state.atlasX}`
    );
    console.assert(
        state.atlasY === 3,
        `Expected atlasY=3, got ${state.atlasY}`
    );
    console.assert(
        state.coreId === 0,
        `Expected coreId=0 in state, got ${state.coreId}`
    );
    console.assert(
        state.active === true,
        'Expected active=true'
    );

    console.log('✅ testRegistration passed');
}

/**
 * Test 4: Multiple registrations assign different coreIds
 */
function testMultipleRegistrations() {
    const executor = new GlyphExecutor();

    const mockSprite1 = { alpha: 1.0, scale: { set: () => {} }, tint: 0xffffff };
    const mockSprite2 = { alpha: 1.0, scale: { set: () => {} }, tint: 0xffffff };
    const mockSprite3 = { alpha: 1.0, scale: { set: () => {} }, tint: 0xffffff };

    const coreId1 = executor.registerGlyph(0, 0, mockSprite1, 0, 0);
    const coreId2 = executor.registerGlyph(1, 1, mockSprite2, 1, 0);
    const coreId3 = executor.registerGlyph(2, 2, mockSprite3, 2, 0);

    console.assert(
        executor.registry.size === 3,
        `Expected registry size 3, got ${executor.registry.size}`
    );

    // CoreIds should be 0, 1, 2 (round-robin assignment)
    console.assert(
        coreId1 === 0 && coreId2 === 1 && coreId3 === 2,
        `Expected coreIds [0,1,2], got [${coreId1},${coreId2},${coreId3}]`
    );

    console.log('✅ testMultipleRegistrations passed');
}

/**
 * Test 5: Unregistration
 * unregisterGlyph returns true, registry empty after
 */
function testUnregistration() {
    const executor = new GlyphExecutor();

    const mockSprite = {
        alpha: 1.0,
        scale: { set: () => {} },
        tint: 0xffffff
    };

    // Register then unregister
    executor.registerGlyph(5, 10, mockSprite, 2, 3);

    // Verify registered
    console.assert(
        executor.registry.size === 1,
        'Expected registry size 1 after registration'
    );

    // Unregister
    executor.unregisterGlyph(5, 10);

    // Verify registry is empty
    console.assert(
        executor.registry.size === 0,
        `Expected registry size 0 after unregister, got ${executor.registry.size}`
    );

    // Verify state is null after unregister
    const state = executor.getExecutionState(5, 10);
    console.assert(
        state === null || state === undefined,
        'Expected state to be null/undefined after unregister'
    );

    console.log('✅ testUnregistration passed');
}

/**
 * Test 6: Unregister non-existent glyph
 * Should handle gracefully without error
 */
function testUnregisterNonExistent() {
    const executor = new GlyphExecutor();

    // Should not throw
    let errorThrown = false;
    try {
        executor.unregisterGlyph(999, 999);
    } catch (e) {
        errorThrown = true;
    }

    console.assert(
        !errorThrown,
        'Unregistering non-existent glyph should not throw'
    );

    console.log('✅ testUnregisterNonExistent passed');
}

/**
 * Test 7: Active Glyphs
 * Multiple glyphs, deactivate one, verify getActiveGlyphs() count
 */
function testActiveGlyphs() {
    const executor = new GlyphExecutor();

    const mockSprite1 = { alpha: 1.0, scale: { set: () => {} }, tint: 0xffffff };
    const mockSprite2 = { alpha: 1.0, scale: { set: () => {} }, tint: 0xffffff };
    const mockSprite3 = { alpha: 1.0, scale: { set: () => {} }, tint: 0xffffff };

    // Register 3 glyphs
    executor.registerGlyph(0, 0, mockSprite1, 0, 0);
    executor.registerGlyph(1, 1, mockSprite2, 1, 0);
    executor.registerGlyph(2, 2, mockSprite3, 2, 0);

    // Get active glyphs
    let activeGlyphs = executor.getActiveGlyphs();

    console.assert(
        activeGlyphs.length === 3,
        `Expected 3 active glyphs, got ${activeGlyphs.length}`
    );

    // Deactivate the second glyph
    const state = executor.getExecutionState(1, 1);
    state.active = false;

    // Get active glyphs again - note: getActiveGlyphs returns all, filtering happens in execute()
    activeGlyphs = executor.getActiveGlyphs();

    // getActiveGlyphs() returns ALL glyphs (active + inactive)
    // The filtering for active happens in execute() method
    console.assert(
        activeGlyphs.length === 3,
        `Expected 3 glyphs in registry, got ${activeGlyphs.length}`
    );

    // Verify one is inactive
    const inactiveCount = activeGlyphs.filter(g => !g.active).length;
    console.assert(
        inactiveCount === 1,
        `Expected 1 inactive glyph, got ${inactiveCount}`
    );

    // Verify two are active
    const activeCount = activeGlyphs.filter(g => g.active).length;
    console.assert(
        activeCount === 2,
        `Expected 2 active glyphs, got ${activeCount}`
    );

    console.log('✅ testActiveGlyphs passed');
}

/**
 * Test 8: Re-registration at same position
 * Should return same coreId without creating new entry
 */
function testReRegistration() {
    const executor = new GlyphExecutor();

    const mockSprite1 = { alpha: 1.0, scale: { set: () => {} }, tint: 0xffffff };
    const mockSprite2 = { alpha: 1.0, scale: { set: () => {} }, tint: 0xffffff };

    // Register at position (5, 5)
    const coreId1 = executor.registerGlyph(5, 5, mockSprite1, 0, 0);

    // Try to register again at same position
    const coreId2 = executor.registerGlyph(5, 5, mockSprite2, 1, 1);

    // Should return same coreId
    console.assert(
        coreId1 === coreId2,
        `Expected same coreId on re-registration, got ${coreId1} then ${coreId2}`
    );

    // Registry should still have only 1 entry
    console.assert(
        executor.registry.size === 1,
        `Expected registry size 1, got ${executor.registry.size}`
    );

    console.log('✅ testReRegistration passed');
}

/**
 * Test 9: CoreId wraps around at maxCores
 */
function testCoreIdWraparound() {
    const maxCores = 4; // Use small number for testing
    const executor = new GlyphExecutor({ maxCores });

    const mockSprite = { alpha: 1.0, scale: { set: () => {} }, tint: 0xffffff };

    // Register maxCores + 1 glyphs
    for (let i = 0; i <= maxCores; i++) {
        executor.registerGlyph(i, 0, mockSprite, i, 0);
    }

    // Last registration should have coreId 0 (modulo wrap)
    const lastState = executor.getExecutionState(maxCores, 0);
    console.assert(
        lastState.coreId === 0,
        `Expected coreId 0 after wraparound, got ${lastState.coreId}`
    );

    console.log('✅ testCoreIdWraparound passed');
}

/**
 * Test 10: Auto execution state
 */
function testAutoExecutionState() {
    const executor = new GlyphExecutor();

    // Initially not auto-executing
    console.assert(
        executor.isAutoExecuting() === false,
        'Expected isAutoExecuting() to be false initially'
    );

    console.assert(
        executor.ticker === null,
        'Expected ticker to be null initially'
    );

    console.log('✅ testAutoExecutionState passed');
}

/**
 * Main test runner
 */
function runGlyphExecutorTests() {
    console.log('🧪 Running GlyphExecutor tests...');
    console.log('=====================================');

    let passed = 0;
    let failed = 0;

    const tests = [
        testConstructor,
        testConstructorCustomOptions,
        testRegistration,
        testMultipleRegistrations,
        testUnregistration,
        testUnregisterNonExistent,
        testActiveGlyphs,
        testReRegistration,
        testCoreIdWraparound,
        testAutoExecutionState
    ];

    for (const test of tests) {
        try {
            test();
            passed++;
        } catch (error) {
            console.error(`❌ ${test.name} FAILED:`, error);
            failed++;
        }
    }

    console.log('=====================================');
    console.log(`📊 Results: ${passed} passed, ${failed} failed`);

    if (failed === 0) {
        console.log('✅ All tests passed!');
    } else {
        console.log('❌ Some tests failed');
    }

    return failed === 0;
}

// Export for browser (window global)
if (typeof window !== 'undefined') {
    window.runGlyphExecutorTests = runGlyphExecutorTests;
    window.testGlyphExecutor = {
        testConstructor,
        testConstructorCustomOptions,
        testRegistration,
        testMultipleRegistrations,
        testUnregistration,
        testUnregisterNonExistent,
        testActiveGlyphs,
        testReRegistration,
        testCoreIdWraparound,
        testAutoExecutionState
    };
}

// Export for Node.js compatibility
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        runGlyphExecutorTests,
        testConstructor,
        testConstructorCustomOptions,
        testRegistration,
        testMultipleRegistrations,
        testUnregistration,
        testUnregisterNonExistent,
        testActiveGlyphs,
        testReRegistration,
        testCoreIdWraparound,
        testAutoExecutionState
    };
}
