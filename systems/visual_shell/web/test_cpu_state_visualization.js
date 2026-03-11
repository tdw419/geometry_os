/**
 * Test: CPU State Visualization (Phase 4)
 *
 * Tests the CPU state overlay, interactive controls, and step execution
 * functionality for the Pixel CPU - PixiJS integration.
 */

// Load required modules
let SimplePixelCPU, PixelCPUIntegration;
if (typeof require !== 'undefined') {
    SimplePixelCPU = require('./pixel_cpu.js');
    PixelCPUIntegration = require('./pixel_cpu_integration.js');
}

/**
 * Test SimplePixelCPU step method
 */
function testCpuStep() {
    console.log('\n=== Testing SimplePixelCPU.step() ===');

    const cpu = new SimplePixelCPU();

    // Create a simple program: MOV R1, 5; ADD R0, R1, R1; RET
    cpu.memory = [
        0x01010000, // MOV R1, R1 (no-op for testing)
        0x02000001, // ADD R0, R0, R1
        0x12000000, // RET
    ];

    // Test initial state
    let state = cpu.getState();
    console.log('Initial state:', state);
    console.assert(state.pc === 0, 'PC should start at 0');
    console.assert(state.cycles === 0, 'Cycles should start at 0');
    console.assert(!state.halted, 'CPU should not be halted');

    // Test step execution
    let stepResult = cpu.step();
    console.log('Step 1 result:', stepResult);
    console.assert(stepResult.pc === 1, 'PC should be 1 after first step');
    console.assert(stepResult.cycles === 1, 'Cycles should be 1 after first step');
    console.assert(stepResult.opcode === 1, 'First opcode should be MOV (1)');

    stepResult = cpu.step();
    console.log('Step 2 result:', stepResult);
    console.assert(stepResult.pc === 2, 'PC should be 2 after second step');
    console.assert(stepResult.cycles === 2, 'Cycles should be 2 after second step');
    console.assert(stepResult.opcode === 2, 'Second opcode should be ADD (2)');

    stepResult = cpu.step();
    console.log('Step 3 result:', stepResult);
    console.assert(stepResult.pc === 3, 'PC should be 3 after third step');
    console.assert(stepResult.halted === true, 'CPU should be halted after RET');

    // Test step after halt
    stepResult = cpu.step();
    console.log('Step after halt:', stepResult);
    console.assert(stepResult.pc === 3, 'PC should not advance after halt');
    console.assert(stepResult.instruction === null, 'Instruction should be null after halt');

    console.log('✓ SimplePixelCPU.step() tests passed');
}

/**
 * Test PixelCPUIntegration state overlay creation
 */
function testStateOverlayCreation() {
    console.log('\n=== Testing CPU State Overlay Creation ===');

    // Mock InfiniteMap for testing
    const mockInfiniteMap = {
        world: {
            addChild: function (child) {
                console.log('  Added child to world:', child.constructor.name);
            }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Create state overlay
    integration.createStateOverlay();

    // Verify overlay was created
    console.assert(integration.stateOverlay !== null, 'State overlay should be created');
    console.assert(integration.stateOverlay.x === -400, 'Overlay X position should be -400');
    console.assert(integration.stateOverlay.y === -200, 'Overlay Y position should be -200');
    console.assert(integration.stateOverlay.zIndex === 1000, 'Overlay Z-index should be 1000');

    // Verify text elements were created
    console.assert(integration.registerText !== null, 'Register text should be created');
    console.assert(integration.pcText !== null, 'PC text should be created');
    console.assert(integration.cyclesText !== null, 'Cycles text should be created');
    console.assert(integration.statusText !== null, 'Status text should be created');
    console.assert(integration.memoryText !== null, 'Memory text should be created');

    console.log('✓ CPU state overlay creation tests passed');
}

/**
 * Test PixelCPUIntegration step method
 */
function testIntegrationStep() {
    console.log('\n=== Testing PixelCPUIntegration.step() ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);

    // Load a simple brick program
    integration.cpu.memory = [
        0x01000000, // MOV R0, R0
        0x02000001, // ADD R0, R0, R1
        0x12000000, // RET
    ];
    integration.running = true;

    // Test step execution
    let stepResult = integration.step();
    console.log('Step 1:', stepResult);
    console.assert(stepResult !== undefined, 'Step should return a result');
    console.assert(integration.cpu.pc === 1, 'PC should be 1 after step');
    console.assert(integration.cpu.cycles === 1, 'Cycles should be 1 after step');

    // Test step when not running
    integration.running = false;
    stepResult = integration.step();
    console.log('Step when not running:', stepResult);
    console.assert(integration.cpu.pc === 1, 'PC should not change when not running');

    console.log('✓ PixelCPUIntegration.step() tests passed');
}

/**
 * Test interactive controls
 */
function testInteractiveControls() {
    console.log('\n=== Testing Interactive Controls ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.running = true;
    integration.paused = false;

    // Test pause
    integration.pause();
    console.assert(integration.paused === true, 'CPU should be paused');
    console.log('✓ Pause works');

    // Test resume
    integration.resume();
    console.assert(integration.paused === false, 'CPU should be resumed');
    console.log('✓ Resume works');

    // Test reset
    integration.cpu.registers[0] = 12345;
    integration.cpu.pc = 100;
    integration.cpu.cycles = 500;
    integration.running = true;
    integration.paused = true;

    integration.reset();
    console.assert(integration.cpu.registers[0] === 0, 'Registers should be reset');
    console.assert(integration.cpu.pc === 0, 'PC should be reset');
    console.assert(integration.cpu.cycles === 0, 'Cycles should be reset');
    console.assert(integration.running === false, 'Running flag should be reset');
    console.assert(integration.paused === false, 'Paused flag should be reset');
    console.log('✓ Reset works');

    console.log('✓ Interactive controls tests passed');
}

/**
 * Test state visualization updates
 */
function testStateVisualizationUpdates() {
    console.log('\n=== Testing State Visualization Updates ===');

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
    integration.lastExecutionTime = 2.5;
    integration.lastFramebufferUpdateTime = 1.2;
    integration.framebufferUpdateCount = 42;

    // Test updateStateVisualization
    const startTime = performance.now();
    integration.updateStateVisualization();
    const updateTime = performance.now() - startTime;

    console.log('State visualization update time:', updateTime.toFixed(3), 'ms');
    console.assert(updateTime < 2, `Update should complete in <2ms (took ${updateTime.toFixed(3)}ms)`);

    // Verify text was updated
    console.assert(integration.registerText.text.includes('0x12345678'), 'Register text should show R0 value');
    console.assert(integration.pcText.text.includes('0x100'), 'PC text should show PC value');
    console.assert(integration.cyclesText.text.includes('1234'), 'Cycles text should show cycles value');
    console.assert(integration.statusText.text.includes('Yes'), 'Status text should show running state');

    console.log('✓ State visualization updates tests passed');
}

/**
 * Test overlay styling and colors
 */
function testOverlayStyling() {
    console.log('\n=== Testing Overlay Styling and Colors ===');

    const mockInfiniteMap = {
        world: {
            addChild: function (child) { }
        }
    };

    const integration = new PixelCPUIntegration(mockInfiniteMap);
    integration.createStateOverlay();

    // Verify text styling
    console.assert(integration.registerText.style.fill === 0xFFFFFF, 'Register text should be white (#FFFFFF)');
    console.assert(integration.pcText.style.fill === 0xFF6600, 'PC text should be orange (#FF6600)');
    console.assert(integration.cyclesText.style.fill === 0x00CC66, 'Cycles text should be green (#00CC66)');

    // Verify font families
    console.assert(integration.registerText.style.fontFamily.includes('monospace'), 'Register text should use monospace font');
    console.assert(integration.pcText.style.fontFamily.includes('monospace'), 'PC text should use monospace font');
    console.assert(integration.cyclesText.style.fontFamily.includes('monospace'), 'Cycles text should use monospace font');

    console.log('✓ Overlay styling and colors tests passed');
}

/**
 * Run all tests
 */
function runAllTests() {
    console.log('\n========================================');
    console.log('Phase 4: CPU State Visualization Tests');
    console.log('========================================');

    try {
        testCpuStep();
        testStateOverlayCreation();
        testIntegrationStep();
        testInteractiveControls();
        testStateVisualizationUpdates();
        testOverlayStyling();

        console.log('\n========================================');
        console.log('✓ All Phase 4 tests passed!');
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
        testCpuStep,
        testStateOverlayCreation,
        testIntegrationStep,
        testInteractiveControls,
        testStateVisualizationUpdates,
        testOverlayStyling,
        runAllTests
    };
}

// Run tests if executed directly
if (typeof window === 'undefined' && require.main === module) {
    runAllTests();
}
