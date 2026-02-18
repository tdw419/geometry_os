/**
 * Phase 7: Integration Tests for Pixel CPU - PixiJS Integration
 *
 * Comprehensive integration tests covering:
 * - Brick loading
 * - Full execution flow
 * - Display integration (framebuffer, console, state visualization)
 * - Interactive controls
 */

// Load required modules
let SimplePixelCPU, PixelCPUIntegration;
if (typeof require !== 'undefined') {
    SimplePixelCPU = require('./pixel_cpu.js');
    PixelCPUIntegration = require('./pixel_cpu_integration.js');
}

/**
 * Test Suite: Brick Loading
 */
function testBrickLoading() {
    console.log('\n=== Testing Brick Loading ===');

    // Mock InfiniteMap
    const mockInfiniteMap = {
        world: {
            addChild: function (child) {
                console.log('  Added child to world:', child.constructor.name);
            }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Mock brick loading (simulating successful load)
    const originalLoadBrick = integration.cpu.loadBrick;
    integration.cpu.loadBrick = async function (path) {
        console.log(`  Loading brick from: ${path}`);
        // Simulate loading a simple program
        this.memory = [
            0x01000000, // MOV R0, R0
            0x02000001, // ADD R0, R0, R1
            0x12000000, // RET
        ];
        return Promise.resolve();
    };

    // Test loadBrick
    const startTime = performance.now();
    integration.loadBrick('test.brick').then(() => {
        const loadTime = performance.now() - startTime;
        console.assert(loadTime < 100, `Brick load should complete in <100ms (took ${loadTime.toFixed(2)}ms)`);
        console.assert(integration.running === true, 'CPU should be running after load');
        console.assert(integration.paused === false, 'CPU should not be paused after load');
        console.assert(integration.framebufferTexture !== null, 'Framebuffer texture should be created');
        console.assert(integration.consoleTile !== null, 'Console tile should be created');
        console.assert(integration.stateOverlay !== null, 'State overlay should be created');

        // Restore original method
        integration.cpu.loadBrick = originalLoadBrick;

        console.log('✓ Brick loading tests passed');
    }).catch(error => {
        console.error('✗ Brick loading test failed:', error);
        throw error;
    });
}

/**
 * Test Suite: Full Execution Flow
 */
function testFullExecutionFlow() {
    console.log('\n=== Testing Full Execution Flow ===');

    // Mock InfiniteMap
    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Create visual components
    integration.createFramebufferTexture();
    integration.createConsoleTile();
    integration.createStateOverlay();

    // Load a program that writes to console and framebuffer
    integration.cpu.memory = [
        0x01000000, // MOV R0, R0
        0x02000001, // ADD R0, R0, R1
        0x12000000, // RET
    ];

    integration.running = true;
    integration.paused = false;

    // Execute for several frames
    for (let i = 0; i < 10; i++) {
        integration.executeFrame();
    }

    // Verify execution
    console.assert(integration.cpu.cycles > 0, 'CPU should have executed cycles');
    console.assert(integration.cpu.halted === true, 'CPU should be halted after RET');
    console.assert(integration.lastExecutionTime < 5, 'Execution time should be <5ms');

    // Verify visual updates
    console.assert(integration.framebufferUpdateCount >= 10, 'Framebuffer should have been updated');
    console.assert(integration.consoleUpdateCount >= 0, 'Console update count should be tracked');

    console.log('✓ Full execution flow tests passed');
}

/**
 * Test Suite: Display Integration
 */
function testDisplayIntegration() {
    console.log('\n=== Testing Display Integration ===');

    // Mock InfiniteMap
    const mockInfiniteMap = {
        world: {
            addChild: function (child) {
                console.log('  Added child to world:', child.constructor.name);
            }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Create all visual components
    integration.createFramebufferTexture();
    integration.createConsoleTile();
    integration.createStateOverlay();

    // Verify all components are created
    console.assert(integration.framebufferSprite !== null, 'Framebuffer sprite should exist');
    console.assert(integration.consoleTile !== null, 'Console tile should exist');
    console.assert(integration.stateOverlay !== null, 'State overlay should exist');

    // Verify component positions
    console.assert(integration.framebufferSprite.x === 100, 'Framebuffer should be at x=100');
    console.assert(integration.framebufferSprite.y === 100, 'Framebuffer should be at y=100');
    console.assert(integration.consoleTile.x === 0, 'Console should be at x=0');
    console.assert(integration.consoleTile.y === 800, 'Console should be at y=800');
    console.assert(integration.stateOverlay.x === -400, 'State overlay should be at x=-400');
    console.assert(integration.stateOverlay.y === -200, 'State overlay should be at y=-200');

    // Verify component z-indices
    console.assert(integration.framebufferSprite.zIndex === 500, 'Framebuffer z-index should be 500');
    console.assert(integration.consoleTile.zIndex === 600, 'Console z-index should be 600');
    console.assert(integration.stateOverlay.zIndex === 1000, 'State overlay z-index should be 1000');

    console.log('✓ Display integration tests passed');
}

/**
 * Test Suite: Interactive Controls
 */
function testInteractiveControls() {
    console.log('\n=== Testing Interactive Controls ===');

    // Mock InfiniteMap
    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createStateOverlay();

    // Set up running state
    integration.running = true;
    integration.paused = false;
    integration.cpu.memory = [
        0x01000000, // MOV R0, R0
        0x02000001, // ADD R0, R0, R1
        0x12000000, // RET,
    ];

    // Test pause control
    integration.pause();
    console.assert(integration.paused === true, 'CPU should be paused');
    const cyclesBeforePause = integration.cpu.cycles;
    integration.executeFrame();
    console.assert(integration.cpu.cycles === cyclesBeforePause, 'CPU should not execute when paused');

    // Test resume control
    integration.resume();
    console.assert(integration.paused === false, 'CPU should be resumed');
    integration.executeFrame();
    console.assert(integration.cpu.cycles > cyclesBeforePause, 'CPU should execute after resume');

    // Test step control
    const pcBeforeStep = integration.cpu.pc;
    integration.step();
    console.assert(integration.cpu.pc > pcBeforeStep, 'PC should advance after step');

    // Test reset control
    integration.cpu.registers[0] = 12345;
    integration.cpu.pc = 100;
    integration.cpu.cycles = 500;
    integration.consoleBuffer = 'test';
    integration.consoleHistory = ['line1', 'line2'];

    integration.reset();

    console.assert(integration.cpu.registers[0] === 0, 'Registers should be reset');
    console.assert(integration.cpu.pc === 0, 'PC should be reset');
    console.assert(integration.cpu.cycles === 0, 'Cycles should be reset');
    console.assert(integration.consoleBuffer === '', 'Console buffer should be reset');
    console.assert(integration.consoleHistory.length === 0, 'Console history should be reset');

    console.log('✓ Interactive controls tests passed');
}

/**
 * Test Suite: Console Output Integration
 */
function testConsoleOutputIntegration() {
    console.log('\n=== Testing Console Output Integration ===');

    // Mock InfiniteMap
    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createConsoleTile();

    // Simulate CPU writing to console via memory-mapped I/O
    const testString = 'Hello, Pixel CPU!';
    for (let i = 0; i < testString.length; i++) {
        integration.writeConsole(testString.charCodeAt(i));
    }
    integration.writeConsole(10); // Newline

    // Verify console buffer
    console.assert(integration.consoleBuffer === testString + '\n', 'Console buffer should contain the string');
    console.assert(integration.consoleHistory.length === 1, 'Console history should have 1 entry');
    console.assert(integration.consoleHistory[0] === testString, 'History should contain the string');

    // Update console display
    integration.updateConsoleDisplay();

    // Verify console text was updated
    console.assert(integration.consoleText.text.includes(testString), 'Console text should display the string');

    console.log('✓ Console output integration tests passed');
}

/**
 * Test Suite: Framebuffer Display Integration
 */
function testFramebufferDisplayIntegration() {
    console.log('\n=== Testing Framebuffer Display Integration ===');

    // Mock InfiniteMap
    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createFramebufferTexture();

    // Simulate CPU writing to framebuffer
    const fbBase = integration.config.framebufferBase;
    const width = integration.config.framebufferWidth;
    const height = integration.config.framebufferHeight;

    // Write a red pixel at (100, 100)
    const pixelOffset = (100 * width + 100) * 4;
    integration.cpu.writeMemory(fbBase + pixelOffset, 255); // R
    integration.cpu.writeMemory(fbBase + pixelOffset + 1, 0); // G
    integration.cpu.writeMemory(fbBase + pixelOffset + 2, 0); // B
    integration.cpu.writeMemory(fbBase + pixelOffset + 3, 255); // A

    // Mark dirty rectangle
    integration.cpu.dirtyRects = [
        { x: 100, y: 100, width: 1, height: 1 }
    ];

    // Update framebuffer
    integration.updateFramebuffer();

    // Verify framebuffer was updated
    console.assert(integration.framebufferUpdateCount > 0, 'Framebuffer update count should increment');
    console.assert(integration.lastFramebufferUpdateTime < 3, 'Framebuffer update should be <3ms');

    console.log('✓ Framebuffer display integration tests passed');
}

/**
 * Test Suite: State Visualization Integration
 */
function testStateVisualizationIntegration() {
    console.log('\n=== Testing State Visualization Integration ===');

    // Mock InfiniteMap
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
    integration.cpu.registers[2] = 0x00FF00FF;
    integration.cpu.registers[3] = 0xFF00FF00;
    integration.cpu.pc = 0x100;
    integration.cpu.cycles = 1234;
    integration.running = true;
    integration.paused = false;

    // Update state visualization
    integration.updateStateVisualization();

    // Verify state text was updated
    console.assert(integration.registerText.text.includes('0x12345678'), 'Register text should show R0 value');
    console.assert(integration.pcText.text.includes('0x100'), 'PC text should show PC value');
    console.assert(integration.cyclesText.text.includes('1234'), 'Cycles text should show cycles value');
    console.assert(integration.statusText.text.includes('Yes'), 'Status text should show running state');

    // Execute some cycles and verify updates
    integration.cpu.memory = [
        0x01000000, // MOV R0, R0
        0x02000001, // ADD R0, R0, R1
        0x12000000, // RET,
    ];

    for (let i = 0; i < 5; i++) {
        integration.executeFrame();
        integration.updateStateVisualization();
    }

    console.assert(integration.cpu.cycles > 1234, 'Cycles should have increased');

    console.log('✓ State visualization integration tests passed');
}

/**
 * Test Suite: Error Handling and Recovery
 */
function testErrorHandlingAndRecovery() {
    console.log('\n=== Testing Error Handling and Recovery ===');

    // Mock InfiniteMap
    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Test recovery from halt
    integration.cpu.memory = [
        0x12000000, // RET (immediate halt)
    ];
    integration.running = true;
    integration.paused = false;

    integration.executeFrame();
    console.assert(integration.cpu.halted === true, 'CPU should be halted');

    // Reset and try again
    integration.reset();
    integration.cpu.memory = [
        0x01000000, // MOV R0, R0
        0x02000001, // ADD R0, R0, R1
        0x12000000, // RET,
    ];
    integration.running = true;

    integration.executeFrame();
    console.assert(integration.cpu.cycles > 0, 'CPU should execute after reset');

    // Test recovery from pause
    integration.pause();
    const cyclesPaused = integration.cpu.cycles;
    integration.executeFrame();
    console.assert(integration.cpu.cycles === cyclesPaused, 'CPU should not execute when paused');

    integration.resume();
    integration.executeFrame();
    console.assert(integration.cpu.cycles > cyclesPaused, 'CPU should execute after resume');

    console.log('✓ Error handling and recovery tests passed');
}

/**
 * Test Suite: Multiple Execution Cycles
 */
function testMultipleExecutionCycles() {
    console.log('\n=== Testing Multiple Execution Cycles ===');

    // Mock InfiniteMap
    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createFramebufferTexture();
    integration.createConsoleTile();
    integration.createStateOverlay();

    // Create a loop program
    const loopProgram = [];
    for (let i = 0; i < 100; i++) {
        loopProgram.push(0x01000000); // MOV R0, R0
    }
    loopProgram.push(0x12000000); // RET

    integration.cpu.memory = loopProgram;
    integration.running = true;

    // Execute for multiple frames
    const frameTimes = [];
    for (let i = 0; i < 60; i++) {
        const startTime = performance.now();
        integration.executeFrame();
        const frameTime = performance.now() - startTime;
        frameTimes.push(frameTime);
    }

    // Calculate average frame time
    const avgFrameTime = frameTimes.reduce((a, b) => a + b, 0) / frameTimes.length;
    const maxFrameTime = Math.max(...frameTimes);

    console.log(`Average frame time: ${avgFrameTime.toFixed(2)}ms`);
    console.log(`Max frame time: ${maxFrameTime.toFixed(2)}ms`);

    console.assert(avgFrameTime < 16, `Average frame time should be <16ms for 60 FPS (was ${avgFrameTime.toFixed(2)}ms)`);
    console.assert(maxFrameTime < 20, `Max frame time should be <20ms (was ${maxFrameTime.toFixed(2)}ms)`);

    console.log('✓ Multiple execution cycles tests passed');
}

/**
 * Test Suite: Memory-Mapped I/O Integration
 */
function testMemoryMappedIOIntegration() {
    console.log('\n=== Testing Memory-Mapped I/O Integration ===');

    // Mock InfiniteMap
    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createConsoleTile();

    // Test console I/O via CPU
    const testMessage = 'Memory-mapped I/O test';
    for (let i = 0; i < testMessage.length; i++) {
        integration.writeConsole(testMessage.charCodeAt(i));
    }
    integration.writeConsole(10); // LF

    // Verify console received the message
    console.assert(integration.consoleBuffer.includes(testMessage), 'Console buffer should contain the message');
    console.assert(integration.consoleDirty === true, 'Console should be marked dirty');

    // Update display
    integration.updateConsoleDisplay();
    console.assert(integration.consoleText.text.includes(testMessage), 'Console text should display the message');

    // Test framebuffer I/O via CPU
    integration.createFramebufferTexture();
    const fbBase = integration.config.framebufferBase;

    // Write a pattern to framebuffer
    for (let y = 0; y < 10; y++) {
        for (let x = 0; x < 10; x++) {
            const offset = (y * integration.config.framebufferWidth + x) * 4;
            integration.cpu.writeMemory(fbBase + offset, 255); // R
            integration.cpu.writeMemory(fbBase + offset + 1, (y * 25) % 256); // G
            integration.cpu.writeMemory(fbBase + offset + 2, (x * 25) % 256); // B
            integration.cpu.writeMemory(fbBase + offset + 3, 255); // A
        }
    }

    // Mark dirty rectangle
    integration.cpu.dirtyRects = [
        { x: 0, y: 0, width: 10, height: 10 }
    ];

    // Update framebuffer
    integration.updateFramebuffer();
    console.assert(integration.framebufferUpdateCount > 0, 'Framebuffer should be updated');

    console.log('✓ Memory-mapped I/O integration tests passed');
}

/**
 * Test Suite: Full System Integration
 */
function testFullSystemIntegration() {
    console.log('\n=== Testing Full System Integration ===');

    // Mock InfiniteMap
    const mockInfiniteMap = {
        world: {
            addChild: function (child) {
                console.log('  Added child to world:', child.constructor.name);
            }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Initialize system
    integration.createFramebufferTexture();
    integration.createConsoleTile();
    integration.createStateOverlay();

    // Load a comprehensive program
    integration.cpu.memory = [
        0x01000000, // MOV R0, R0
        0x02000001, // ADD R0, R0, R1
        0x01010001, // MOV R1, R1
        0x02000001, // ADD R0, R0, R1
        0x12000000, // RET,
    ];

    integration.running = true;
    integration.paused = false;

    // Execute and verify all components work together
    let totalExecutionTime = 0;
    let totalFramebufferTime = 0;
    let totalConsoleTime = 0;
    let totalStateTime = 0;

    for (let i = 0; i < 30; i++) {
        // Execute CPU
        const execStart = performance.now();
        integration.executeFrame();
        totalExecutionTime += performance.now() - execStart;

        // Update framebuffer
        const fbStart = performance.now();
        integration.updateFramebuffer();
        totalFramebufferTime += performance.now() - fbStart;

        // Update console
        integration.updateConsole();
        totalConsoleTime += performance.now() - execStart; // Includes in executeFrame

        // Update state visualization
        const stateStart = performance.now();
        integration.updateStateVisualization();
        totalStateTime += performance.now() - stateStart;
    }

    // Calculate averages
    const avgExecutionTime = totalExecutionTime / 30;
    const avgFramebufferTime = totalFramebufferTime / 30;
    const avgStateTime = totalStateTime / 30;

    console.log(`Average execution time: ${avgExecutionTime.toFixed(2)}ms`);
    console.log(`Average framebuffer time: ${avgFramebufferTime.toFixed(2)}ms`);
    console.log(`Average state time: ${avgStateTime.toFixed(2)}ms`);

    // Verify performance targets
    console.assert(avgExecutionTime < 5, `Average execution time should be <5ms (was ${avgExecutionTime.toFixed(2)}ms)`);
    console.assert(avgFramebufferTime < 3, `Average framebuffer time should be <3ms (was ${avgFramebufferTime.toFixed(2)}ms)`);
    console.assert(avgStateTime < 2, `Average state time should be <2ms (was ${avgStateTime.toFixed(2)}ms)`);

    // Verify system state
    console.assert(integration.cpu.cycles > 0, 'CPU should have executed cycles');
    console.assert(integration.cpu.halted === true, 'CPU should be halted');
    console.assert(integration.running === true, 'Running flag should be set');
    console.assert(integration.framebufferUpdateCount > 0, 'Framebuffer should have been updated');

    console.log('✓ Full system integration tests passed');
}

/**
 * Run all integration tests
 */
function runAllIntegrationTests() {
    console.log('\n========================================');
    console.log('Phase 7: Integration Tests for Pixel CPU');
    console.log('========================================');

    return new Promise((resolve, reject) => {
        const tests = [
            testBrickLoading,
            testFullExecutionFlow,
            testDisplayIntegration,
            testInteractiveControls,
            testConsoleOutputIntegration,
            testFramebufferDisplayIntegration,
            testStateVisualizationIntegration,
            testErrorHandlingAndRecovery,
            testMultipleExecutionCycles,
            testMemoryMappedIOIntegration,
            testFullSystemIntegration
        ];

        let testIndex = 0;

        function runNextTest() {
            if (testIndex < tests.length) {
                const test = tests[testIndex];
                try {
                    const result = test();
                    if (result instanceof Promise) {
                        result.then(() => {
                            testIndex++;
                            runNextTest();
                        }).catch(error => {
                            console.error('\n✗ Test failed:', error);
                            console.error(error.stack);
                            reject(error);
                        });
                    } else {
                        testIndex++;
                        runNextTest();
                    }
                } catch (error) {
                    console.error('\n✗ Test failed:', error);
                    console.error(error.stack);
                    reject(error);
                }
            } else {
                console.log('\n========================================');
                console.log('✓ All Phase 7 integration tests passed!');
                console.log('========================================\n');
                resolve(true);
            }
        }

        runNextTest();
    });
}

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        testBrickLoading,
        testFullExecutionFlow,
        testDisplayIntegration,
        testInteractiveControls,
        testConsoleOutputIntegration,
        testFramebufferDisplayIntegration,
        testStateVisualizationIntegration,
        testErrorHandlingAndRecovery,
        testMultipleExecutionCycles,
        testMemoryMappedIOIntegration,
        testFullSystemIntegration,
        runAllIntegrationTests
    };
}

// Run tests if executed directly
if (typeof window === 'undefined' && require.main === module) {
    runAllIntegrationTests().then(() => {
        console.log('All integration tests completed successfully');
        process.exit(0);
    }).catch(error => {
        console.error('Integration tests failed:', error);
        process.exit(1);
    });
}
