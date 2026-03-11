/**
 * Test: CPU State Visualization (Phase 4) - Simplified
 *
 * Tests the core Phase 4 functionality without requiring PixiJS.
 */

// Load required modules
let SimplePixelCPU;
if (typeof require !== 'undefined') {
    SimplePixelCPU = require('./pixel_cpu.js');
}

/**
 * Test SimplePixelCPU step method
 */
function testCpuStep() {
    console.log('\n=== Testing SimplePixelCPU.step() ===');

    const cpu = new SimplePixelCPU();

    // Create a simple program
    cpu.memory = [
        0x00000001, // MOV R0, R0 (opcode 1)
        0x00000002, // ADD R0, R0, R1 (opcode 2)
        0x00000012, // RET (opcode 18)
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

    stepResult = cpu.step();
    console.log('Step 2 result:', stepResult);
    console.assert(stepResult.pc === 2, 'PC should be 2 after second step');
    console.assert(stepResult.cycles === 2, 'Cycles should be 2 after second step');

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
 * Test register change tracking in step
 */
function testRegisterChangeTracking() {
    console.log('\n=== Testing Register Change Tracking ===');

    const cpu = new SimplePixelCPU();

    // Create program that modifies registers
    cpu.memory = [
        0x00010101, // MOV R1, R1 (no change)
        0x00020202, // MOV R2, R2 (no change)
        0x00030303, // MOV R3, R3 (no change)
        0x00020102, // ADD R1, R2, R2 (changes R1)
        0x00030201, // SUB R2, R1, R1 (changes R2)
        0x00000012, // RET
    ];

    // Step through program
    let step1 = cpu.step();
    console.log('Step 1 (MOV R1, R1):', step1);
    console.assert(step1.registersChanged.length === 0, 'No registers should change');

    let step2 = cpu.step();
    console.log('Step 2 (MOV R2, R2):', step2);
    console.assert(step2.registersChanged.length === 0, 'No registers should change');

    let step3 = cpu.step();
    console.log('Step 3 (MOV R3, R3):', step3);
    console.assert(step3.registersChanged.length === 0, 'No registers should change');

    let step4 = cpu.step();
    console.log('Step 4 (ADD R1, R1, R2):', step4);
    console.assert(step4.registersChanged.length === 1, 'One register should change');
    console.assert(step4.registersChanged[0].index === 1, 'R1 should change');

    let step5 = cpu.step();
    console.log('Step 5 (SUB R2, R2, R1):', step5);
    console.assert(step5.registersChanged.length === 1, 'One register should change');
    console.assert(step5.registersChanged[0].index === 2, 'R2 should change');

    console.log('✓ Register change tracking tests passed');
}

/**
 * Test CPU state management
 */
function testCpuStateManagement() {
    console.log('\n=== Testing CPU State Management ===');

    const cpu = new SimplePixelCPU();

    // Test initial state
    let state = cpu.getState();
    console.assert(state.pc === 0, 'Initial PC should be 0');
    console.assert(state.cycles === 0, 'Initial cycles should be 0');
    console.assert(!state.halted, 'Initial halted should be false');
    console.assert(state.registers.length === 32, 'Should have 32 registers');
    console.assert(state.registers.every(r => r === 0), 'All registers should be 0');

    // Modify state
    cpu.pc = 100;
    cpu.cycles = 500;
    cpu.registers[0] = 0x12345678;
    cpu.halted = true;

    state = cpu.getState();
    console.assert(state.pc === 100, 'PC should be 100');
    console.assert(state.cycles === 500, 'Cycles should be 500');
    console.assert(state.halted === true, 'Halted should be true');
    console.assert(state.registers[0] === 0x12345678, 'R0 should be 0x12345678');

    // Test reset
    cpu.reset();
    state = cpu.getState();
    console.assert(state.pc === 0, 'PC should be 0 after reset');
    console.assert(state.cycles === 0, 'Cycles should be 0 after reset');
    console.assert(!state.halted, 'Halted should be false after reset');
    console.assert(state.registers.every(r => r === 0), 'All registers should be 0 after reset');

    console.log('✓ CPU state management tests passed');
}

/**
 * Test instruction decoding in step
 */
function testInstructionDecoding() {
    console.log('\n=== Testing Instruction Decoding ===');

    const cpu = new SimplePixelCPU();

    // Test different opcodes
    cpu.memory = [
        0x00000000, // NOP (opcode 0)
        0x00050505, // MOV R5, R5 (opcode 1)
        0x00050506, // ADD R5, R5, R6 (opcode 2)
        0x00050506, // SUB R5, R5, R6 (opcode 3)
        0x00000012, // RET (opcode 18)
        0x000000FF, // HALT (opcode 255)
    ];

    let step;

    step = cpu.step();
    console.log('NOP step:', step);
    console.assert(step.opcode === 0, 'NOP opcode should be 0');
    console.assert(step.pc === 1, 'PC should advance');

    step = cpu.step();
    console.log('MOV step:', step);
    console.assert(step.opcode === 1, 'MOV opcode should be 1');

    step = cpu.step();
    console.log('ADD step:', step);
    console.assert(step.opcode === 2, 'ADD opcode should be 2');

    step = cpu.step();
    console.log('SUB step:', step);
    console.assert(step.opcode === 3, 'SUB opcode should be 3');

    step = cpu.step();
    console.log('RET step:', step);
    console.assert(step.opcode === 18, 'RET opcode should be 18');
    console.assert(step.halted === true, 'RET should halt CPU');

    // Reset for HALT test
    cpu.reset();
    cpu.memory = [0xFF000000];
    step = cpu.step();
    console.log('HALT step:', step);
    console.assert(step.opcode === 255, 'HALT opcode should be 255');
    console.assert(step.halted === true, 'HALT should halt CPU');

    console.log('✓ Instruction decoding tests passed');
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
        testRegisterChangeTracking();
        testCpuStateManagement();
        testInstructionDecoding();

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
        testRegisterChangeTracking,
        testCpuStateManagement,
        testInstructionDecoding,
        runAllTests
    };
}

// Run tests if executed directly
if (typeof window === 'undefined' && require.main === module) {
    runAllTests();
}
