/**
 * Tests for LiveTileManager
 *
 * Run with: node test_live_tile_manager.js
 * Or in browser: Open test_live_tile_manager.html
 */

// Mock WebSocket for Node.js testing
class MockWebSocket {
    static CONNECTING = 0;
    static OPEN = 1;
    static CLOSING = 2;
    static CLOSED = 3;

    constructor(url) {
        this.url = url;
        this.readyState = MockWebSocket.CONNECTING;
        this.onopen = null;
        this.onmessage = null;
        this.onerror = null;
        this.onclose = null;
        this.sentMessages = [];

        // Simulate async connection
        setTimeout(() => {
            this.readyState = MockWebSocket.OPEN;
            if (this.onopen) this.onopen();
        }, 10);
    }

    send(data) {
        this.sentMessages.push(data);
    }

    close() {
        this.readyState = MockWebSocket.CLOSED;
        if (this.onclose) this.onclose();
    }

    // Test helper: simulate receiving a message
    simulateMessage(data) {
        if (this.onmessage) {
            this.onmessage({ data: JSON.stringify(data) });
        }
    }

    // Test helper: simulate error
    simulateError(err) {
        if (this.onerror) {
            this.onerror(err);
        }
    }
}

// Setup for testing
let LiveTileManager, LiveTile;
let testResults = [];
let assert;

if (typeof require !== 'undefined') {
    // Node.js environment
    global.WebSocket = MockWebSocket;

    // Load the LiveTileManager code
    const fs = require('fs');
    const path = require('path');
    const code = fs.readFileSync(path.join(__dirname, '../js/LiveTileManager.js'), 'utf8');

    // Create a mock module context for eval
    const mockModule = { exports: {} };
    const mockExports = mockModule.exports;

    // Execute in a context that has module and exports defined
    const func = new Function('module', 'exports', 'global', code);
    func(mockModule, mockExports, global);

    LiveTileManager = global.LiveTileManager || mockModule.exports.LiveTileManager;
    LiveTile = global.LiveTile || mockModule.exports.LiveTile;

    assert = (condition, message) => {
        testResults.push({ passed: condition, message });
        if (!condition) {
            console.log(`  FAIL: ${message}`);
        } else {
            console.log(`  PASS: ${message}`);
        }
    };
} else {
    // Browser environment - assume LiveTileManager is already loaded
    LiveTileManager = window.LiveTileManager;
    LiveTile = window.LiveTile;
    assert = (condition, message) => {
        testResults.push({ passed: condition, message });
        const li = document.createElement('li');
        li.className = condition ? 'pass' : 'fail';
        li.textContent = `${condition ? 'PASS' : 'FAIL'}: ${message}`;
        document.getElementById('results').appendChild(li);
    };
}

// Test utilities
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function createManager(wsUrl = 'ws://localhost:8768') {
    return new LiveTileManager(wsUrl);
}

// ===========================================
// TEST SUITE
// ===========================================

async function runTests() {
    console.log('\n=== LiveTileManager Test Suite ===\n');

    // Test 1: Creating manager with default settings
    console.log('Test 1: Creating manager with default settings');
    try {
        const manager = createManager();
        assert(manager !== null, 'Manager should be created');
        assert(manager.wsUrl === 'ws://localhost:8768', 'Default WebSocket URL should be set');
        assert(manager.tiles instanceof Map, 'Tiles should be a Map');
        assert(manager.connected === false, 'Should not be connected initially');
        testResults.push({ group: 'Initialization', passed: true });
    } catch (e) {
        assert(false, `Manager creation failed: ${e.message}`);
    }

    // Test 2: WebSocket connection
    console.log('\nTest 2: WebSocket connection');
    try {
        const manager = createManager();
        await manager.connect();
        assert(manager.connected === true, 'Should be connected after connect()');
        assert(manager.ws !== null, 'WebSocket should be created');
        testResults.push({ group: 'Connection', passed: true });
    } catch (e) {
        assert(false, `Connection failed: ${e.message}`);
    }

    // Test 3: Sending boot_tile command
    console.log('\nTest 3: Sending boot_tile command');
    try {
        const manager = createManager();
        await manager.connect();
        await sleep(20); // Wait for WebSocket to be fully ready

        const ws = manager.ws; // Capture WebSocket reference
        manager.bootTile('test-tile-1', '/path/to/alpine.rts');

        assert(manager.tiles.has('test-tile-1'), 'Tile should be added to tiles map');

        const tile = manager.getTile('test-tile-1');
        assert(tile !== undefined, 'Should be able to get tile');
        assert(tile.state === 'booting', 'Tile state should be booting');
        assert(tile.rtsPath === '/path/to/alpine.rts', 'RTS path should be stored');

        // Check message was sent
        const sentMessages = ws.sentMessages;
        assert(sentMessages.length > 0, 'Should have sent a message');
        const sentData = JSON.parse(sentMessages[sentMessages.length - 1]);
        assert(sentData.method === 'boot_tile', 'Should send boot_tile method');
        assert(sentData.params.tile_id === 'test-tile-1', 'Should include tile_id');
        assert(sentData.params.rts_path === '/path/to/alpine.rts', 'Should include rts_path');
        testResults.push({ group: 'Boot Command', passed: true });
    } catch (e) {
        assert(false, `Boot command failed: ${e.message}`);
    }

    // Test 4: Handling tile_booted event
    console.log('\nTest 4: Handling tile_booted event');
    try {
        const manager = createManager();
        await manager.connect();

        let bootedTile = null;
        manager.onTileBooted = (tile) => {
            bootedTile = tile;
        };

        // First boot the tile
        manager.bootTile('booted-tile', '/alpine.rts');

        // Simulate boot confirmation
        manager.ws.simulateMessage({
            type: 'tile_event',
            params: {
                event_type: 'tile_booted',
                tile_id: 'booted-tile',
                rts_path: '/alpine.rts'
            }
        });

        await sleep(10);

        const tile = manager.getTile('booted-tile');
        assert(tile.state === 'running', 'Tile state should be running');
        assert(bootedTile !== null, 'onTileBooted callback should be called');
        assert(bootedTile.tileId === 'booted-tile', 'Booted tile should have correct ID');
        testResults.push({ group: 'Boot Event', passed: true });
    } catch (e) {
        assert(false, `Boot event failed: ${e.message}`);
    }

    // Test 5: Handling framebuffer update
    console.log('\nTest 5: Handling framebuffer update');
    try {
        const manager = createManager();
        await manager.connect();

        let framebufferUpdated = false;
        manager.onFramebufferUpdate = (tile) => {
            framebufferUpdated = true;
        };

        // Setup tile
        manager.bootTile('fb-tile', '/alpine.rts');
        manager.ws.simulateMessage({
            type: 'tile_event',
            params: {
                event_type: 'tile_booted',
                tile_id: 'fb-tile'
            }
        });

        // Simulate framebuffer update
        const fbData = new Uint8Array(800 * 600 * 4);
        manager.ws.simulateMessage({
            type: 'tile_event',
            params: {
                event_type: 'tile_framebuffer',
                tile_id: 'fb-tile',
                data: fbData,
                width: 800,
                height: 600
            }
        });

        await sleep(10);

        const tile = manager.getTile('fb-tile');
        assert(tile.framebuffer !== null, 'Framebuffer should be stored');
        assert(tile.framebufferWidth === 800, 'Width should be 800');
        assert(tile.framebufferHeight === 600, 'Height should be 600');
        assert(framebufferUpdated === true, 'onFramebufferUpdate callback should be called');
        testResults.push({ group: 'Framebuffer', passed: true });
    } catch (e) {
        assert(false, `Framebuffer test failed: ${e.message}`);
    }

    // Test 6: Handling tile_metrics event
    console.log('\nTest 6: Handling tile_metrics event');
    try {
        const manager = createManager();
        await manager.connect();

        let metricsUpdated = false;
        manager.onMetricsUpdate = (tile) => {
            metricsUpdated = true;
        };

        // Setup tile
        manager.bootTile('metrics-tile', '/alpine.rts');
        manager.ws.simulateMessage({
            type: 'tile_event',
            params: {
                event_type: 'tile_booted',
                tile_id: 'metrics-tile'
            }
        });

        // Simulate metrics update
        manager.ws.simulateMessage({
            type: 'tile_event',
            params: {
                event_type: 'tile_metrics',
                tile_id: 'metrics-tile',
                metrics: {
                    cpuUsage: 45.5,
                    memoryUsage: 128,
                    uptime: 60,
                    cycles: 1000000
                }
            }
        });

        await sleep(10);

        const tile = manager.getTile('metrics-tile');
        assert(tile.metrics.cpuUsage === 45.5, 'CPU usage should be updated');
        assert(tile.metrics.memoryUsage === 128, 'Memory usage should be updated');
        assert(tile.metrics.uptime === 60, 'Uptime should be updated');
        assert(metricsUpdated === true, 'onMetricsUpdate callback should be called');
        testResults.push({ group: 'Metrics', passed: true });
    } catch (e) {
        assert(false, `Metrics test failed: ${e.message}`);
    }

    // Test 7: Handling tile_stopped event
    console.log('\nTest 7: Handling tile_stopped event');
    try {
        const manager = createManager();
        await manager.connect();

        let stoppedTile = null;
        manager.onTileStopped = (tile) => {
            stoppedTile = tile;
        };

        // Setup and boot tile
        manager.bootTile('stop-tile', '/alpine.rts');
        manager.ws.simulateMessage({
            type: 'tile_event',
            params: {
                event_type: 'tile_booted',
                tile_id: 'stop-tile'
            }
        });

        // Stop the tile
        manager.stopTile('stop-tile');

        // Simulate stop confirmation
        manager.ws.simulateMessage({
            type: 'tile_event',
            params: {
                event_type: 'tile_stopped',
                tile_id: 'stop-tile'
            }
        });

        await sleep(10);

        const tile = manager.getTile('stop-tile');
        assert(tile.state === 'stopped', 'Tile state should be stopped');
        assert(stoppedTile !== null, 'onTileStopped callback should be called');
        testResults.push({ group: 'Stop Event', passed: true });
    } catch (e) {
        assert(false, `Stop event test failed: ${e.message}`);
    }

    // Test 8: Handling console output
    console.log('\nTest 8: Handling console output');
    try {
        const manager = createManager();
        await manager.connect();

        // Setup tile
        manager.bootTile('console-tile', '/alpine.rts');
        manager.ws.simulateMessage({
            type: 'tile_event',
            params: {
                event_type: 'tile_booted',
                tile_id: 'console-tile'
            }
        });

        // Simulate console output
        manager.ws.simulateMessage({
            type: 'tile_event',
            params: {
                event_type: 'tile_console',
                tile_id: 'console-tile',
                text: 'Linux version 6.1.0...'
            }
        });

        manager.ws.simulateMessage({
            type: 'tile_event',
            params: {
                event_type: 'tile_console',
                tile_id: 'console-tile',
                text: 'Welcome to Alpine Linux!'
            }
        });

        await sleep(10);

        const tile = manager.getTile('console-tile');
        assert(tile.consoleOutput.length === 2, 'Should have 2 console lines');
        assert(tile.consoleOutput[0].text === 'Linux version 6.1.0...', 'First line should be correct');
        assert(tile.consoleOutput[1].text === 'Welcome to Alpine Linux!', 'Second line should be correct');
        testResults.push({ group: 'Console Output', passed: true });
    } catch (e) {
        assert(false, `Console output test failed: ${e.message}`);
    }

    // Test 9: Handling tile_error event
    console.log('\nTest 9: Handling tile_error event');
    try {
        const manager = createManager();
        await manager.connect();

        let capturedError = null;
        manager.onError = (err) => {
            capturedError = err;
        };

        // Setup tile
        manager.bootTile('error-tile', '/alpine.rts');
        manager.ws.simulateMessage({
            type: 'tile_event',
            params: {
                event_type: 'tile_booted',
                tile_id: 'error-tile'
            }
        });

        // Simulate error
        manager.ws.simulateMessage({
            type: 'tile_event',
            params: {
                event_type: 'tile_error',
                tile_id: 'error-tile',
                message: 'Kernel panic!'
            }
        });

        await sleep(10);

        const tile = manager.getTile('error-tile');
        assert(tile.state === 'error', 'Tile state should be error');
        assert(capturedError !== null, 'onError callback should be called');
        assert(capturedError.message === 'Kernel panic!', 'Error message should be captured');
        testResults.push({ group: 'Error Handling', passed: true });
    } catch (e) {
        assert(false, `Error handling test failed: ${e.message}`);
    }

    // Test 10: Disconnect
    console.log('\nTest 10: Disconnect');
    try {
        const manager = createManager();
        await manager.connect();
        assert(manager.connected === true, 'Should be connected');

        manager.disconnect();
        assert(manager.connected === false, 'Should not be connected after disconnect');
        assert(manager.ws === null, 'WebSocket should be null after disconnect');
        testResults.push({ group: 'Disconnect', passed: true });
    } catch (e) {
        assert(false, `Disconnect test failed: ${e.message}`);
    }

    // Test 11: LiveTile class
    console.log('\nTest 11: LiveTile class');
    try {
        const tile = new LiveTile('test-tile', '/test.rts');

        assert(tile.tileId === 'test-tile', 'Tile ID should be set');
        assert(tile.rtsPath === '/test.rts', 'RTS path should be set');
        assert(tile.state === 'stopped', 'Initial state should be stopped');
        assert(tile.framebuffer === null, 'Initial framebuffer should be null');
        assert(tile.consoleOutput.length === 0, 'Initial console output should be empty');

        // Test setState
        tile.setState('running');
        assert(tile.state === 'running', 'State should be updated');
        assert(tile.bootedAt !== null, 'Booted at should be set when state is running');

        // Test updateFramebuffer
        tile.updateFramebuffer(new ArrayBuffer(100), 10, 10);
        assert(tile.framebufferWidth === 10, 'Framebuffer width should be updated');
        assert(tile.framebufferHeight === 10, 'Framebuffer height should be updated');

        // Test updateMetrics
        tile.updateMetrics({ cpuUsage: 50 });
        assert(tile.metrics.cpuUsage === 50, 'Metrics should be updated');

        // Test getUptime
        const uptime = tile.getUptime();
        assert(uptime >= 0, 'Uptime should be non-negative');

        testResults.push({ group: 'LiveTile Class', passed: true });
    } catch (e) {
        assert(false, `LiveTile test failed: ${e.message}`);
    }

    // Test 12: getTilesByState
    console.log('\nTest 12: getTilesByState');
    try {
        const manager = createManager();
        await manager.connect();

        // Create multiple tiles in different states
        const tile1 = new LiveTile('tile-1', '/a.rts');
        tile1.setState('running');
        manager.tiles.set('tile-1', tile1);

        const tile2 = new LiveTile('tile-2', '/b.rts');
        tile2.setState('running');
        manager.tiles.set('tile-2', tile2);

        const tile3 = new LiveTile('tile-3', '/c.rts');
        tile3.setState('stopped');
        manager.tiles.set('tile-3', tile3);

        const runningTiles = manager.getTilesByState('running');
        assert(runningTiles.length === 2, 'Should have 2 running tiles');

        const stoppedTiles = manager.getTilesByState('stopped');
        assert(stoppedTiles.length === 1, 'Should have 1 stopped tile');

        testResults.push({ group: 'Get Tiles By State', passed: true });
    } catch (e) {
        assert(false, `getTilesByState test failed: ${e.message}`);
    }

    // Summary
    console.log('\n=== Test Summary ===');
    const passed = testResults.filter(r => r.passed).length;
    const total = testResults.length;
    console.log(`Passed: ${passed}/${total}`);

    if (passed === total) {
        console.log('\nAll tests passed!');
    } else {
        console.log('\nSome tests failed.');
    }

    return { passed, total, results: testResults };
}

// Run tests if executed directly
if (typeof require !== 'undefined' && require.main === module) {
    runTests().then(({ passed, total }) => {
        process.exit(passed === total ? 0 : 1);
    }).catch(err => {
        console.error('Test runner error:', err);
        process.exit(1);
    });
}

// Export for browser
if (typeof window !== 'undefined') {
    window.runLiveTileManagerTests = runTests;
}
