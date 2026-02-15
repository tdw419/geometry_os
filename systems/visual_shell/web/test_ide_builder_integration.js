/**
 * IDE Builder Integration Tests
 * Phase J.2: Neural IDE Visual Builder - Task 7.1
 *
 * Comprehensive integration tests covering the full workflow:
 * - Tile placement and rendering
 * - Connection management
 * - Semantic queries
 * - Cartridge export/import
 * - Performance benchmarks
 *
 * @module test_ide_builder_integration
 */

/**
 * IDEIntegrationTests - Integration test suite for Neural IDE Builder
 */
class IDEIntegrationTests {
    // ─────────────────────────────────────────────────────────────
    // Private Fields
    // ─────────────────────────────────────────────────────────────

    /** @type {Object[]} - Test results */
    #results = [];

    /** @type {number} - Passed test count */
    #passed = 0;

    /** @type {number} - Failed test count */
    #failed = 0;

    /** @type {Object|null} - IDEAssemblyEngine instance */
    #engine = null;

    /** @type {Object|null} - TileConnectionManager instance */
    #connectionManager = null;

    /** @type {Object|null} - IDESemanticOverlay instance */
    #semanticOverlay = null;

    /** @type {Object|null} - IDETileRenderer instance */
    #tileRenderer = null;

    // ─────────────────────────────────────────────────────────────
    // Constructor
    // ─────────────────────────────────────────────────────────────

    /**
     * Create a new IDEIntegrationTests instance
     */
    constructor() {
        // Components will be initialized in setup()
    }

    // ─────────────────────────────────────────────────────────────
    // Test Framework Methods
    // ─────────────────────────────────────────────────────────────

    /**
     * Run a test and track results
     * @param {string} name - Test name
     * @param {Function} fn - Test function (can be async)
     * @returns {Object} - Test result
     */
    async test(name, fn) {
        const startTime = performance.now();
        let status = 'passed';
        let error = null;

        try {
            await fn();
            this.#passed++;
        } catch (e) {
            status = 'failed';
            error = e.message || String(e);
            this.#failed++;
        }

        const duration = performance.now() - startTime;
        const result = {
            name,
            status,
            duration: Math.round(duration * 100) / 100,
            error
        };

        this.#results.push(result);

        // Log result for console visibility
        const icon = status === 'passed' ? '✓' : '✗';
        const color = status === 'passed' ? 'color: green' : 'color: red';
        console.log(`%c${icon} ${name} (${duration.toFixed(2)}ms)`, color);

        return result;
    }

    /**
     * Assertion helper
     * @param {boolean} condition - Condition to assert
     * @param {string} message - Error message if assertion fails
     * @throws {Error} If condition is false
     */
    assert(condition, message) {
        if (!condition) {
            throw new Error(message || 'Assertion failed');
        }
    }

    /**
     * Assert equality
     * @param {*} actual - Actual value
     * @param {*} expected - Expected value
     * @param {string} message - Error message if assertion fails
     */
    assertEqual(actual, expected, message) {
        if (actual !== expected) {
            throw new Error(message || `Expected ${expected}, got ${actual}`);
        }
    }

    /**
     * Assert deep equality
     * @param {*} actual - Actual value
     * @param {*} expected - Expected value
     * @param {string} message - Error message if assertion fails
     */
    assertDeepEqual(actual, expected, message) {
        if (JSON.stringify(actual) !== JSON.stringify(expected)) {
            throw new Error(message || `Deep equality failed: ${JSON.stringify(actual)} !== ${JSON.stringify(expected)}`);
        }
    }

    /**
     * Assert that value is an array with specific length
     * @param {*} value - Value to check
     * @param {number} length - Expected length
     * @param {string} message - Error message
     */
    assertArrayLength(value, length, message) {
        if (!Array.isArray(value)) {
            throw new Error(message || `Expected array, got ${typeof value}`);
        }
        if (value.length !== length) {
            throw new Error(message || `Expected array length ${length}, got ${value.length}`);
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Setup
    // ─────────────────────────────────────────────────────────────

    /**
     * Set up test components
     * Creates fresh instances for each test run
     */
    setup() {
        // Create TileConnectionManager
        this.#connectionManager = new TileConnectionManager();

        // Create IDETileRenderer (without PixiJS app for testing)
        this.#tileRenderer = new IDETileRenderer(null, null);

        // Create IDESemanticOverlay
        this.#semanticOverlay = new IDESemanticOverlay(
            this.#connectionManager,
            this.#tileRenderer
        );

        // Create IDEAssemblyEngine
        this.#engine = new IDEAssemblyEngine(
            null, // builderPanel (not needed for tests)
            this.#connectionManager,
            this.#semanticOverlay,
            this.#tileRenderer
        );

        console.log('Test components initialized');
    }

    /**
     * Tear down test components
     */
    teardown() {
        if (this.#engine) {
            this.#engine.clear();
        }
        if (this.#connectionManager) {
            this.#connectionManager.clear();
        }
        if (this.#semanticOverlay) {
            this.#semanticOverlay.clear();
        }
        if (this.#tileRenderer) {
            this.#tileRenderer.clear();
        }
    }

    // ─────────────────────────────────────────────────────────────
    // Test Cases
    // ─────────────────────────────────────────────────────────────

    /**
     * Test 1: Full Assembly Workflow
     * Place 4 tiles, connect them, verify counts
     */
    async testFullAssembly() {
        // Place 4 IDE tiles
        const codeEditor = this.#engine.placeIDETile('code_editor', 100, 100);
        this.assert(codeEditor.success, 'Failed to place code_editor');
        this.assert(codeEditor.tile_id, 'Missing tile_id');

        const fileBrowser = this.#engine.placeIDETile('file_browser', 300, 100);
        this.assert(fileBrowser.success, 'Failed to place file_browser');

        const terminal = this.#engine.placeIDETile('terminal', 100, 300);
        this.assert(terminal.success, 'Failed to place terminal');

        const debugger_ = this.#engine.placeIDETile('debugger', 300, 300);
        this.assert(debugger_.success, 'Failed to place debugger');

        // Verify tile count
        this.assertEqual(this.#engine.tileCount, 4, 'Expected 4 tiles');

        // Create 3 valid connections
        // 1. file_browser -> code_editor (data_flow)
        const conn1 = this.#engine.connectIDETiles(
            fileBrowser.tile_id,
            codeEditor.tile_id,
            'data_flow'
        );
        this.assert(conn1.success, `Connection 1 failed: ${conn1.error}`);

        // 2. code_editor -> terminal (command_flow)
        const conn2 = this.#engine.connectIDETiles(
            codeEditor.tile_id,
            terminal.tile_id,
            'command_flow'
        );
        this.assert(conn2.success, `Connection 2 failed: ${conn2.error}`);

        // 3. code_editor -> debugger (debug_flow)
        const conn3 = this.#engine.connectIDETiles(
            codeEditor.tile_id,
            debugger_.tile_id,
            'debug_flow'
        );
        this.assert(conn3.success, `Connection 3 failed: ${conn3.error}`);

        // Verify connection count
        const connections = this.#connectionManager.getAllConnections();
        this.assertArrayLength(connections, 3, 'Expected 3 connections');

        // Verify connection types
        this.assertEqual(connections[0].type, 'data_flow');
        this.assertEqual(connections[1].type, 'command_flow');
        this.assertEqual(connections[2].type, 'debug_flow');

        // Verify preview contains correct data
        const preview = this.#engine.preview();
        this.assertEqual(preview.tile_count, 4, 'Preview tile_count mismatch');
        this.assertEqual(preview.connection_count, 3, 'Preview connection_count mismatch');
    }

    /**
     * Test 2: Semantic Queries
     * Set component state, query definitions and related
     */
    async testSemanticQueries() {
        // Place tiles with semantic state
        const tile1 = this.#engine.placeIDETile('code_editor', 100, 100, {
            openFiles: ['src/main.py', 'src/utils.py'],
            definitions: ['class Application', 'function process_data'],
            semanticState: {
                language: 'python'
            }
        });

        const tile2 = this.#engine.placeIDETile('code_editor', 300, 100, {
            openFiles: ['src/app.js'],
            definitions: ['class Router', 'function Application()']
        });

        // Query for 'Application' definition
        const appResults = this.#semanticOverlay.queryDefinition('Application');
        this.assert(appResults.length >= 1, 'Expected at least 1 result for Application');

        // Query for 'main' (should match main.py)
        const mainResults = this.#semanticOverlay.queryDefinition('main');
        this.assert(mainResults.length >= 1, 'Expected at least 1 result for main');

        // Query related for 'process' (fuzzy match)
        const relatedResults = this.#semanticOverlay.queryRelated('process');
        this.assert(relatedResults.length >= 1, 'Expected related results for process');

        // Verify component state retrieval
        const state = this.#semanticOverlay.getComponentState(tile1.tile_id);
        this.assert(state !== null, 'Expected component state');
        this.assertArrayLength(state.openFiles, 2, 'Expected 2 open files');

        // Verify definitions exist in state
        this.assertArrayLength(state.definitions, 2, 'Expected 2 definitions');
        this.assert(state.definitions.includes('class Application'), 'Missing class Application');

        // Verify semantic index works
        const componentCount = this.#semanticOverlay.getComponentCount();
        this.assertEqual(componentCount, 2, 'Expected 2 tracked components');
    }

    /**
     * Test 3: Cartridge Roundtrip
     * Create assembly, export, import to new engine, verify state
     */
    async testCartridgeRoundtrip() {
        // Create a complete assembly
        const tile1 = this.#engine.placeIDETile('code_editor', 50, 50, {
            content: { code: 'print("hello")' },
            openFiles: ['main.py'],
            definitions: ['function main()']
        });

        const tile2 = this.#engine.placeIDETile('terminal', 250, 50, {
            content: { cwd: '/home/user' }
        });

        // Connect tiles
        this.#engine.connectIDETiles(tile1.tile_id, tile2.tile_id, 'command_flow');

        // Export cartridge
        const cartridge = this.#engine.exportCartridge();

        // Verify cartridge structure
        this.assertEqual(cartridge.format, 'neural-ide-v1', 'Invalid cartridge format');
        this.assertEqual(cartridge.version, '1.0.0', 'Invalid cartridge version');
        this.assert(cartridge.created, 'Missing created timestamp');
        this.assertEqual(cartridge.metadata.tileCount, 2, 'Metadata tileCount mismatch');
        this.assertEqual(cartridge.metadata.connectionCount, 1, 'Metadata connectionCount mismatch');

        // Verify shader refs
        this.assertArrayLength(cartridge.shaderRefs, 2, 'Expected 2 shader refs');
        this.assert(cartridge.shaderRefs.includes('ide_code_editor'), 'Missing code_editor shader ref');
        this.assert(cartridge.shaderRefs.includes('ide_terminal'), 'Missing terminal shader ref');

        // Create new engine and import cartridge
        const newConnectionManager = new TileConnectionManager();
        const newTileRenderer = new IDETileRenderer(null, null);
        const newSemanticOverlay = new IDESemanticOverlay(newConnectionManager, newTileRenderer);
        const newEngine = new IDEAssemblyEngine(
            null,
            newConnectionManager,
            newSemanticOverlay,
            newTileRenderer
        );

        // Import cartridge
        const importResult = newEngine.importCartridge(cartridge);
        this.assert(importResult.success, `Import failed: ${importResult.error}`);

        // Verify imported state
        this.assertEqual(newEngine.tileCount, 2, 'Imported tile count mismatch');

        const importedConnections = newConnectionManager.getAllConnections();
        this.assertArrayLength(importedConnections, 1, 'Imported connections count mismatch');

        // Verify tile content preserved
        const importedTile1 = newEngine.getTile(tile1.tile_id);
        this.assert(importedTile1 !== null, 'Imported tile1 not found');
        this.assertEqual(importedTile1.type, 'code_editor', 'Tile type not preserved');
        this.assertEqual(importedTile1.x, 50, 'Tile x position not preserved');
        this.assertEqual(importedTile1.y, 50, 'Tile y position not preserved');
        this.assertDeepEqual(importedTile1.content, { code: 'print("hello")' }, 'Content not preserved');

        // Verify semantic state preserved
        const importedSemantic = newSemanticOverlay.getComponentState(tile1.tile_id);
        this.assert(importedSemantic !== null, 'Semantic state not imported');
        this.assertArrayLength(importedSemantic.openFiles, 1, 'Open files not preserved');
        this.assertArrayLength(importedSemantic.definitions, 1, 'Definitions not preserved');

        // Clean up new engine
        newEngine.clear();
    }

    /**
     * Test 4: Invalid Connection Rejection
     * Try invalid connections, verify rejected
     */
    async testInvalidConnections() {
        // Place tiles
        const terminal = this.#engine.placeIDETile('terminal', 100, 100);
        const debugger_ = this.#engine.placeIDETile('debugger', 300, 100);

        this.assert(terminal.success, 'Failed to place terminal');
        this.assert(debugger_.success, 'Failed to place debugger');

        // Try to connect terminal -> debugger with data_flow
        // This should fail because terminal's data_flow only allows output_panel
        const result = this.#engine.connectIDETiles(
            terminal.tile_id,
            debugger_.tile_id,
            'data_flow'
        );

        // Verify rejection
        this.assert(!result.success, 'Expected connection to be rejected');
        this.assert(result.error, 'Expected error message');

        // Verify error message mentions not allowed
        this.assert(
            result.error.includes('not allowed') || result.error.includes('Allowed targets'),
            `Unexpected error message: ${result.error}`
        );

        // Verify no connections were created
        const connections = this.#connectionManager.getAllConnections();
        this.assertArrayLength(connections, 0, 'Expected 0 connections after rejected attempt');

        // Test invalid connection type
        const codeEditor = this.#engine.placeIDETile('code_editor', 100, 300);
        const fileBrowser = this.#engine.placeIDETile('file_browser', 300, 300);

        // Try invalid connection type from code_editor to file_browser
        const invalidResult = this.#engine.connectIDETiles(
            codeEditor.tile_id,
            fileBrowser.tile_id,
            'data_flow'
        );

        // code_editor data_flow allows output_panel, not file_browser
        this.assert(!invalidResult.success, 'Expected invalid connection to be rejected');
    }

    /**
     * Test 5: Performance Benchmark
     * Full assembly + export, assert <5000ms
     */
    async testPerformance() {
        const startTime = performance.now();

        // Create a larger assembly (10 tiles)
        const tiles = [];
        const tileTypes = ['code_editor', 'file_browser', 'terminal', 'debugger', 'output_panel'];

        for (let i = 0; i < 10; i++) {
            const type = tileTypes[i % tileTypes.length];
            const x = (i % 5) * 200 + 50;
            const y = Math.floor(i / 5) * 200 + 50;

            const result = this.#engine.placeIDETile(type, x, y, {
                content: { index: i },
                openFiles: [`file_${i}.py`],
                definitions: [`function func_${i}()`]
            });

            this.assert(result.success, `Failed to place tile ${i}`);
            tiles.push(result.tile_id);
        }

        // Create multiple connections
        for (let i = 0; i < 7; i++) {
            const sourceIdx = i % tiles.length;
            const targetIdx = (i + 1) % tiles.length;

            // Use valid connection types based on rules
            const sourceTile = this.#engine.getTile(tiles[sourceIdx]);
            let connType = 'data_flow';

            // Adjust connection type based on source type
            if (sourceTile.type === 'code_editor') {
                connType = i % 2 === 0 ? 'command_flow' : 'debug_flow';
            }

            // Only connect if types are compatible
            const targetTile = this.#engine.getTile(tiles[targetIdx]);
            if (targetTile.type === 'terminal' && connType === 'command_flow') {
                this.#engine.connectIDETiles(tiles[sourceIdx], tiles[targetIdx], connType);
            } else if (targetTile.type === 'debugger' && connType === 'debug_flow') {
                this.#engine.connectIDETiles(tiles[sourceIdx], tiles[targetIdx], connType);
            }
        }

        // Export cartridge
        const cartridge = this.#engine.exportCartridge();
        this.assert(cartridge !== null, 'Export failed');

        // Perform semantic queries
        for (let i = 0; i < 5; i++) {
            this.#semanticOverlay.queryDefinition(`func_${i}`);
            this.#semanticOverlay.queryRelated(`file`);
        }

        // Get preview
        const preview = this.#engine.preview();
        this.assert(preview !== null, 'Preview failed');

        const endTime = performance.now();
        const totalDuration = endTime - startTime;

        // Assert performance < 5000ms
        this.assert(
            totalDuration < 5000,
            `Performance test took ${totalDuration.toFixed(2)}ms (expected < 5000ms)`
        );

        console.log(`Performance test completed in ${totalDuration.toFixed(2)}ms`);
    }

    // ─────────────────────────────────────────────────────────────
    // Run All Tests
    // ─────────────────────────────────────────────────────────────

    /**
     * Run all integration tests
     * @returns {Object} - Test results summary
     */
    async runAll() {
        console.log('=== Neural IDE Builder Integration Tests ===\n');

        // Reset state
        this.#results = [];
        this.#passed = 0;
        this.#failed = 0;

        // Set up fresh components
        this.setup();

        // Run each test with fresh state
        await this.test('1. Full Assembly Workflow', async () => {
            await this.testFullAssembly();
        });

        this.teardown();
        this.setup();

        await this.test('2. Semantic Queries', async () => {
            await this.testSemanticQueries();
        });

        this.teardown();
        this.setup();

        await this.test('3. Cartridge Roundtrip', async () => {
            await this.testCartridgeRoundtrip();
        });

        this.teardown();
        this.setup();

        await this.test('4. Invalid Connection Rejection', async () => {
            await this.testInvalidConnections();
        });

        this.teardown();
        this.setup();

        await this.test('5. Performance Benchmark', async () => {
            await this.testPerformance();
        });

        // Final teardown
        this.teardown();

        return this.getSummary();
    }

    /**
     * Get test results summary
     * @returns {Object} - Summary with passed, failed, total, results
     */
    getSummary() {
        return {
            passed: this.#passed,
            failed: this.#failed,
            total: this.#results.length,
            results: this.#results,
            allPassed: this.#failed === 0
        };
    }

    /**
     * Get detailed results
     * @returns {Object[]} - Array of test results
     */
    getResults() {
        return [...this.#results];
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { IDEIntegrationTests };
}
