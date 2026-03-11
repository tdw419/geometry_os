/**
 * Phase 7: Unit Tests for Pixel CPU - PixiJS Integration
 *
 * Comprehensive unit tests covering:
 * - CPU execution
 * - Memory-mapped I/O
 * - Visual components (framebuffer, console, state visualization)
 */

// Load required modules
let SimplePixelCPU, PixelCPUIntegration;
if (typeof require !== 'undefined') {
    SimplePixelCPU = require('./pixel_cpu.js');
    PixelCPUIntegration = require('./pixel_cpu_integration.js');
}

/**
 * Test Suite: Constructor and Initialization
 */
function testConstructor() {
    console.log('\n=== Testing Constructor and Initialization ===');

    // Mock InfiniteMap
    const mockInfiniteMap = {
        world: {
            addChild: function (child) {
                console.log('  Added child to world:', child.constructor.name);
            }
        }
    };

    // Test default constructor
    const integration = new PixelCPUIntegration(mockInfiniteMap);
    console.assert(integration.infiniteMap === mockInfiniteMap, 'infiniteMap should be set');
    console.assert(integration.cpu !== null, 'CPU should be initialized');
    console.assert(integration.config.cyclesPerFrame === 1000, 'Default cyclesPerFrame should be 1000');
    console.assert(integration.config.framebufferBase === 0x30000000, 'Default framebufferBase should be 0x30000000');
    console.assert(integration.config.consoleBase === 0x20000000, 'Default consoleBase should be 0x20000000');
    console.assert(integration.config.framebufferWidth === 640, 'Default framebufferWidth should be 640');
    console.assert(integration.config.framebufferHeight === 480, 'Default framebufferHeight should be 480');
    console.assert(integration.config.consoleMaxLines === 24, 'Default consoleMaxLines should be 24');
    console.assert(integration.config.consoleMaxHistory === 1000, 'Default consoleMaxHistory should be 1000');
    console.assert(integration.consoleBuffer === '', 'Console buffer should be empty');
    console.assert(integration.consoleHistory.length === 0, 'Console history should be empty');
    console.assert(integration.running === false, 'Running should be false');
    console.assert(integration.paused === false, 'Paused should be false');
    console.assert(integration.performanceWarnings === 0, 'Performance warnings should be 0');

    console.log('✓ Constructor tests passed');
}

/**
 * Test Suite: Configuration
 */
function testConfiguration() {
    console.log('\n=== Testing Configuration ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    // Test custom configuration
    const customConfig = {
        cyclesPerFrame: 500,
        framebufferWidth: 320,
        framebufferHeight: 240,
        consoleMaxLines: 12,
        consoleMaxHistory: 500
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap, customConfig);

    console.assert(integration.config.cyclesPerFrame === 500, 'Custom cyclesPerFrame should be 500');
    console.assert(integration.config.framebufferWidth === 320, 'Custom framebufferWidth should be 320');
    console.assert(integration.config.framebufferHeight === 240, 'Custom framebufferHeight should be 240');
    console.assert(integration.config.consoleMaxLines === 12, 'Custom consoleMaxLines should be 12');
    console.assert(integration.config.consoleMaxHistory === 500, 'Custom consoleMaxHistory should be 500');

    console.log('✓ Configuration tests passed');
}

/**
 * Test Suite: CPU Execution
 */
function testCpuExecution() {
    console.log('\n=== Testing CPU Execution ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Test executeFrame when not running
    integration.executeFrame();
    console.assert(integration.cpu.cycles === 0, 'CPU should not execute when not running');

    // Test executeFrame when running
    integration.running = true;
    integration.cpu.memory = [
        0x01000000, // MOV R0, R0
        0x02000001, // ADD R0, R0, R1
        0x12000000, // RET
    ];

    const startTime = performance.now();
    integration.executeFrame();
    const executionTime = performance.now() - startTime;

    console.assert(integration.cpu.cycles > 0, 'CPU should have executed cycles');
    console.assert(executionTime < 5, `Execution should complete in <5ms (took ${executionTime.toFixed(2)}ms)`);
    console.assert(integration.lastExecutionTime === executionTime, 'lastExecutionTime should be updated');

    // Test executeFrame when paused
    const cyclesBeforePause = integration.cpu.cycles;
    integration.paused = true;
    integration.executeFrame();
    console.assert(integration.cpu.cycles === cyclesBeforePause, 'CPU should not execute when paused');

    console.log('✓ CPU execution tests passed');
}

/**
 * Test Suite: Step Execution
 */
function testStepExecution() {
    console.log('\n=== Testing Step Execution ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Test step when not running
    const result = integration.step();
    console.assert(result === undefined, 'Step should return undefined when not running');

    // Test step when running
    integration.running = true;
    integration.cpu.memory = [
        0x01000000, // MOV R0, R0
        0x02000001, // ADD R0, R0, R1
        0x12000000, // RET
    ];

    const stepResult1 = integration.step();
    console.assert(stepResult1 !== undefined, 'Step should return result when running');
    console.assert(integration.cpu.pc === 1, 'PC should be 1 after first step');
    console.assert(integration.cpu.cycles === 1, 'Cycles should be 1 after first step');

    const stepResult2 = integration.step();
    console.assert(integration.cpu.pc === 2, 'PC should be 2 after second step');
    console.assert(integration.cpu.cycles === 2, 'Cycles should be 2 after second step');

    console.log('✓ Step execution tests passed');
}

/**
 * Test Suite: Memory-Mapped I/O - Console
 */
function testConsoleMemoryMappedIO() {
    console.log('\n=== Testing Memory-Mapped I/O - Console ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Test writing printable characters
    integration.writeConsole(72); // 'H'
    integration.writeConsole(101); // 'e'
    integration.writeConsole(108); // 'l'
    integration.writeConsole(108); // 'l'
    integration.writeConsole(111); // 'o'

    console.assert(integration.consoleBuffer === 'Hello', 'Console buffer should contain "Hello"');
    console.assert(integration.consoleDirty === true, 'Console should be marked dirty');

    // Test newline
    integration.writeConsole(10); // LF
    console.assert(integration.consoleBuffer === 'Hello\n', 'Console buffer should contain newline');
    console.assert(integration.consoleHistory.length === 1, 'History should have 1 entry');
    console.assert(integration.consoleHistory[0] === 'Hello', 'History should contain "Hello"');

    // Test backspace
    integration.writeConsole(8); // Backspace
    console.assert(integration.consoleBuffer === 'Hello', 'Backspace should remove newline');

    // Test tab
    integration.writeConsole(9); // Tab
    console.assert(integration.consoleBuffer === 'Hello    ', 'Tab should expand to 4 spaces');

    // Test control character
    integration.writeConsole(1); // SOH
    console.assert(integration.consoleBuffer.includes('[01]'), 'Control character should show as hex');

    // Test history limit
    integration.consoleBuffer = '';
    integration.consoleHistory = [];
    for (let i = 0; i < 1100; i++) {
        integration.writeConsole(65); // 'A'
        integration.writeConsole(10); // LF
    }
    console.assert(integration.consoleHistory.length === 1000, 'History should be limited to 1000');

    console.log('✓ Console memory-mapped I/O tests passed');
}

/**
 * Test Suite: Console Scrolling
 */
function testConsoleScrolling() {
    console.log('\n=== Testing Console Scrolling ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Write some lines
    for (let i = 0; i < 30; i++) {
        integration.writeConsole(65 + i); // A-Z, then wrap
        integration.writeConsole(10); // LF
    }

    console.assert(integration.consoleScrollPosition === 0, 'Scroll position should start at 0');

    // Test scroll up
    integration.scrollConsoleUp(5);
    console.assert(integration.consoleScrollPosition === 5, 'Scroll position should be 5');
    console.assert(integration.consoleDirty === true, 'Console should be marked dirty');

    // Test scroll down
    integration.scrollConsoleDown(2);
    console.assert(integration.consoleScrollPosition === 3, 'Scroll position should be 3');

    // Test scroll to bottom
    integration.scrollConsoleToBottom();
    console.assert(integration.consoleScrollPosition === 0, 'Scroll position should be 0');

    // Test scroll to top
    integration.scrollConsoleToTop();
    console.assert(integration.consoleScrollPosition > 0, 'Scroll position should be at top');

    console.log('✓ Console scrolling tests passed');
}

/**
 * Test Suite: Framebuffer Operations
 */
function testFramebufferOperations() {
    console.log('\n=== Testing Framebuffer Operations ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) {
                console.log('  Added child to world:', child.constructor.name);
            }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Test createFramebufferTexture
    integration.createFramebufferTexture();
    console.assert(integration.framebufferTexture !== null, 'Framebuffer texture should be created');
    console.assert(integration.framebufferSprite !== null, 'Framebuffer sprite should be created');
    console.assert(integration.framebufferSprite.x === 100, 'Sprite X position should be 100');
    console.assert(integration.framebufferSprite.y === 100, 'Sprite Y position should be 100');
    console.assert(integration.framebufferSprite.width === 640, 'Sprite width should be 640');
    console.assert(integration.framebufferSprite.height === 480, 'Sprite height should be 480');
    console.assert(integration.framebufferSprite.zIndex === 500, 'Sprite Z-index should be 500');

    // Test setFramebufferResolution
    integration.setFramebufferResolution(800, 600);
    console.assert(integration.config.framebufferWidth === 800, 'Framebuffer width should be 800');
    console.assert(integration.config.framebufferHeight === 600, 'Framebuffer height should be 600');

    // Test getFramebufferResolution
    const resolution = integration.getFramebufferResolution();
    console.assert(resolution.width === 800, 'Resolution width should be 800');
    console.assert(resolution.height === 600, 'Resolution height should be 600');

    // Test clearFramebuffer
    integration.clearFramebuffer();
    console.assert(integration.framebufferUpdateCount > 0, 'Framebuffer update count should increment');

    console.log('✓ Framebuffer operations tests passed');
}

/**
 * Test Suite: Framebuffer Update Performance
 */
function testFramebufferUpdatePerformance() {
    console.log('\n=== Testing Framebuffer Update Performance ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createFramebufferTexture();

    // Write some data to framebuffer
    const fbBase = integration.config.framebufferBase;
    for (let i = 0; i < 100; i++) {
        integration.cpu.writeMemory(fbBase + i * 4, 255); // R
        integration.cpu.writeMemory(fbBase + i * 4 + 1, 128); // G
        integration.cpu.writeMemory(fbBase + i * 4 + 2, 64); // B
        integration.cpu.writeMemory(fbBase + i * 4 + 3, 255); // A
    }

    // Mark dirty rectangles
    integration.cpu.dirtyRects = [
        { x: 0, y: 0, width: 10, height: 10 }
    ];

    // Test update performance
    const startTime = performance.now();
    integration.updateFramebuffer();
    const updateTime = performance.now() - startTime;

    console.assert(updateTime < 3, `Framebuffer update should complete in <3ms (took ${updateTime.toFixed(2)}ms)`);
    console.assert(integration.lastFramebufferUpdateTime === updateTime, 'lastFramebufferUpdateTime should be updated');
    console.assert(integration.framebufferUpdateCount > 0, 'Framebuffer update count should increment');

    console.log('✓ Framebuffer update performance tests passed');
}

/**
 * Test Suite: Console Tile Creation
 */
function testConsoleTileCreation() {
    console.log('\n=== Testing Console Tile Creation ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) {
                console.log('  Added child to world:', child.constructor.name);
            }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Test createConsoleTile
    integration.createConsoleTile();
    console.assert(integration.consoleTile !== null, 'Console tile should be created');
    console.assert(integration.consoleText !== null, 'Console text should be created');
    console.assert(integration.consoleTile.x === 0, 'Console tile X position should be 0');
    console.assert(integration.consoleTile.y === 800, 'Console tile Y position should be 800');
    console.assert(integration.consoleTile.zIndex === 600, 'Console tile Z-index should be 600');

    console.log('✓ Console tile creation tests passed');
}

/**
 * Test Suite: Console Update Performance
 */
function testConsoleUpdatePerformance() {
    console.log('\n=== Testing Console Update Performance ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createConsoleTile();

    // Write some data to console
    for (let i = 0; i < 50; i++) {
        integration.writeConsole(65 + (i % 26)); // A-Z
        integration.writeConsole(32); // Space
    }
    integration.writeConsole(10); // LF

    // Test update performance
    const startTime = performance.now();
    integration.updateConsoleDisplay();
    const updateTime = performance.now() - startTime;

    console.assert(updateTime < 1, `Console update should complete in <1ms (took ${updateTime.toFixed(3)}ms)`);
    console.assert(integration.lastConsoleUpdateTime === updateTime, 'lastConsoleUpdateTime should be updated');
    console.assert(integration.consoleUpdateCount > 0, 'Console update count should increment');
    console.assert(integration.consoleDirty === false, 'Console dirty flag should be cleared');

    console.log('✓ Console update performance tests passed');
}

/**
 * Test Suite: CPU State Overlay Creation
 */
function testCpuStateOverlayCreation() {
    console.log('\n=== Testing CPU State Overlay Creation ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) {
                console.log('  Added child to world:', child.constructor.name);
            }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Test createStateOverlay
    integration.createStateOverlay();
    console.assert(integration.stateOverlay !== null, 'State overlay should be created');
    console.assert(integration.stateOverlay.x === -400, 'Overlay X position should be -400');
    console.assert(integration.stateOverlay.y === -200, 'Overlay Y position should be -200');
    console.assert(integration.stateOverlay.zIndex === 1000, 'Overlay Z-index should be 1000');

    // Verify text elements
    console.assert(integration.registerText !== null, 'Register text should be created');
    console.assert(integration.pcText !== null, 'PC text should be created');
    console.assert(integration.cyclesText !== null, 'Cycles text should be created');
    console.assert(integration.statusText !== null, 'Status text should be created');
    console.assert(integration.memoryText !== null, 'Memory text should be created');

    console.log('✓ CPU state overlay creation tests passed');
}

/**
 * Test Suite: State Visualization Performance
 */
function testStateVisualizationPerformance() {
    console.log('\n=== Testing State Visualization Performance ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createStateOverlay();

    // Set up CPU state
    integration.cpu.registers[0] = 0x12345678;
    integration.cpu.registers[1] = 0xABCDEF00;
    integration.cpu.pc = 0x100;
    integration.cpu.cycles = 1234;
    integration.running = true;
    integration.paused = false;

    // Test update performance
    const startTime = performance.now();
    integration.updateStateVisualization();
    const updateTime = performance.now() - startTime;

    console.assert(updateTime < 2, `State visualization update should complete in <2ms (took ${updateTime.toFixed(3)}ms)`);

    // Verify text was updated
    console.assert(integration.registerText.text.includes('0x12345678'), 'Register text should show R0 value');
    console.assert(integration.pcText.text.includes('0x100'), 'PC text should show PC value');
    console.assert(integration.cyclesText.text.includes('1234'), 'Cycles text should show cycles value');

    console.log('✓ State visualization performance tests passed');
}

/**
 * Test Suite: Control Methods
 */
function testControlMethods() {
    console.log('\n=== Testing Control Methods ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Test pause
    integration.running = true;
    integration.paused = false;
    integration.pause();
    console.assert(integration.paused === true, 'CPU should be paused');

    // Test resume
    integration.resume();
    console.assert(integration.paused === false, 'CPU should be resumed');

    // Test reset
    integration.cpu.registers[0] = 12345;
    integration.cpu.pc = 100;
    integration.cpu.cycles = 500;
    integration.running = true;
    integration.paused = true;
    integration.consoleBuffer = 'test';
    integration.consoleHistory = ['line1', 'line2'];

    integration.reset();

    console.assert(integration.cpu.registers[0] === 0, 'Registers should be reset');
    console.assert(integration.cpu.pc === 0, 'PC should be reset');
    console.assert(integration.cpu.cycles === 0, 'Cycles should be reset');
    console.assert(integration.running === false, 'Running flag should be reset');
    console.assert(integration.paused === false, 'Paused flag should be reset');
    console.assert(integration.consoleBuffer === '', 'Console buffer should be reset');
    console.assert(integration.consoleHistory.length === 0, 'Console history should be reset');
    console.assert(integration.performanceWarnings === 0, 'Performance warnings should be reset');

    console.log('✓ Control methods tests passed');
}

/**
 * Test Suite: State Retrieval
 */
function testStateRetrieval() {
    console.log('\n=== Testing State Retrieval ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Set up state
    integration.running = true;
    integration.paused = false;
    integration.lastExecutionTime = 2.5;
    integration.lastFramebufferUpdateTime = 1.2;
    integration.framebufferUpdateCount = 42;
    integration.lastConsoleUpdateTime = 0.5;
    integration.consoleUpdateCount = 100;
    integration.consoleBuffer = 'test';
    integration.consoleHistory = ['line1', 'line2'];
    integration.performanceWarnings = 5;

    // Test getState
    const state = integration.getState();

    console.assert(state.running === true, 'State should include running flag');
    console.assert(state.paused === false, 'State should include paused flag');
    console.assert(state.lastExecutionTime === 2.5, 'State should include lastExecutionTime');
    console.assert(state.lastFramebufferUpdateTime === 1.2, 'State should include lastFramebufferUpdateTime');
    console.assert(state.framebufferUpdateCount === 42, 'State should include framebufferUpdateCount');
    console.assert(state.lastConsoleUpdateTime === 0.5, 'State should include lastConsoleUpdateTime');
    console.assert(state.consoleUpdateCount === 100, 'State should include consoleUpdateCount');
    console.assert(state.consoleBufferLength === 4, 'State should include consoleBufferLength');
    console.assert(state.consoleHistoryLength === 2, 'State should include consoleHistoryLength');
    console.assert(state.performanceWarnings === 5, 'State should include performanceWarnings');

    console.log('✓ State retrieval tests passed');
}

/**
 * Test Suite: Performance Statistics
 */
function testPerformanceStatistics() {
    console.log('\n=== Testing Performance Statistics ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    integration.lastExecutionTime = 2.5;
    integration.lastFramebufferUpdateTime = 1.2;
    integration.framebufferUpdateCount = 42;
    integration.performanceWarnings = 5;

    // Test getPerformanceStats
    const stats = integration.getPerformanceStats();

    console.assert(stats.lastExecutionTime === 2.5, 'Stats should include lastExecutionTime');
    console.assert(stats.lastFramebufferUpdateTime === 1.2, 'Stats should include lastFramebufferUpdateTime');
    console.assert(stats.framebufferUpdateCount === 42, 'Stats should include framebufferUpdateCount');
    console.assert(stats.performanceWarnings === 5, 'Stats should include performanceWarnings');

    console.log('✓ Performance statistics tests passed');
}

/**
 * Test Suite: Edge Cases and Error Handling
 */
function testEdgeCasesAndErrorHandling() {
    console.log('\n=== Testing Edge Cases and Error Handling ===');

    // Test constructor without infiniteMap
    try {
        new PixelCPUIntegration(null);
        console.assert(false, 'Should throw TypeError when infiniteMap is null');
    } catch (error) {
        console.assert(error instanceof TypeError, 'Should throw TypeError');
        console.assert(error.message.includes('infiniteMap'), 'Error message should mention infiniteMap');
    }

    // Test executeFrame with zero cycles
    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap, {
        cyclesPerFrame: 0
    });

    integration.running = true;
    integration.executeFrame();
    console.assert(integration.cpu.cycles === 0, 'CPU should not execute with zero cycles');

    // Test writeConsole with null character
    integration.writeConsole(0);
    console.assert(integration.consoleBuffer.includes('[00]'), 'Null character should show as hex');

    // Test scrollConsoleDown beyond zero
    integration.consoleScrollPosition = 0;
    integration.scrollConsoleDown(10);
    console.assert(integration.consoleScrollPosition === 0, 'Scroll position should not go below zero');

    // Test updateFramebuffer without texture
    const integration2 = new PixelCPUIntegration(mockInfiniteMap);
    integration2.updateFramebuffer(); // Should not throw

    // Test updateConsole without tile
    integration2.updateConsole(); // Should not throw

    // Test updateStateVisualization without overlay
    integration2.updateStateVisualization(); // Should not throw

    console.log('✓ Edge cases and error handling tests passed');
}

/**
 * Run all unit tests
 */
function runAllUnitTests() {
    console.log('\n========================================');
    console.log('Phase 7: Unit Tests for Pixel CPU Integration');
    console.log('========================================');

    try {
        testConstructor();
        testConfiguration();
        testCpuExecution();
        testStepExecution();
        testConsoleMemoryMappedIO();
        testConsoleScrolling();
        testFramebufferOperations();
        testFramebufferUpdatePerformance();
        testConsoleTileCreation();
        testConsoleUpdatePerformance();
        testCpuStateOverlayCreation();
        testStateVisualizationPerformance();
        testControlMethods();
        testStateRetrieval();
        testPerformanceStatistics();
        testEdgeCasesAndErrorHandling();

        console.log('\n========================================');
        console.log('✓ All Phase 7 unit tests passed!');
        console.log('========================================\n');

        return true;
    } catch (error) {
        console.error('\n✗ Test failed:', error);
        console.error(error.stack);
        return false;
    }
}

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        testConstructor,
        testConfiguration,
        testCpuExecution,
        testStepExecution,
        testConsoleMemoryMappedIO,
        testConsoleScrolling,
        testFramebufferOperations,
        testFramebufferUpdatePerformance,
        testConsoleTileCreation,
        testConsoleUpdatePerformance,
        testCpuStateOverlayCreation,
        testStateVisualizationPerformance,
        testControlMethods,
        testStateRetrieval,
        testPerformanceStatistics,
        testEdgeCasesAndErrorHandling,
        runAllUnitTests
    };
}

// Run tests if executed directly
if (typeof window === 'undefined' && require.main === module) {
    runAllUnitTests();
}
