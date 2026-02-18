/**
 * Geometry OS: Test Brick Loading and Execution
 *
 * Tests the brick loader and CPU emulator with the generated test brick files.
 */

// Import modules
const { BrickLoader } = require('./brick_loader.js');

// Import SimplePixelCPU directly from the file
const fs = require('fs');
const pixelCPUCode = fs.readFileSync('./pixel_cpu.js', 'utf8');

// Evaluate the SimplePixelCPU class definition
eval(pixelCPUCode);

// SimplePixelCPU is now available globally

/**
 * Test brick loading and execution
 * @param {string} brickFile - Path to brick file
 * @param {string} testName - Test name
 */
async function testBrickLoading(brickFile, testName) {
    console.log(`\n🧪 Testing: ${testName}`);
    console.log(`   Brick file: ${brickFile}`);

    try {
        // Create CPU instance
        const cpu = new SimplePixelCPU();

        // Set console output callback
        let consoleOutput = '';
        cpu.setConsoleOutputCallback((char) => {
            consoleOutput += String.fromCharCode(char);
        });

        // Create brick loader
        const loader = new BrickLoader({
            validateChecksum: true,
            onProgress: (loaded, total, percentage, status) => {
                if (percentage % 20 === 0 || status.includes('complete')) {
                    console.log(`   Progress: ${percentage}% - ${status}`);
                }
            }
        });

        // Load brick file
        const brickData = await loader.load(brickFile);

        // Execute brick
        console.log(`   Executing ${brickData.instructions.length} instructions...`);
        const result = cpu.execute(1000);

        // Display console output
        if (consoleOutput) {
            console.log(`   Console output: "${consoleOutput}"`);
        }

        // Display CPU state
        const state = cpu.getState();
        console.log(`   Execution result: R0 = ${result}`);
        console.log(`   Cycles executed: ${state.cycles}`);
        console.log(`   Halted: ${state.halted}`);

        console.log(`✓ Test passed: ${testName}`);
        return true;
    } catch (error) {
        console.error(`✗ Test failed: ${testName}`);
        console.error(`   Error: ${error.message}`);
        return false;
    }
}

/**
 * Test brick header parsing
 * @param {string} brickFile - Path to brick file
 * @param {string} testName - Test name
 */
async function testBrickHeader(brickFile, testName) {
    console.log(`\n🧪 Testing: ${testName}`);
    console.log(`   Brick file: ${brickFile}`);

    try {
        // Create brick loader
        const loader = new BrickLoader();

        // Load brick file
        const brickData = await loader.load(brickFile);

        // Display header information
        const header = brickData.header;
        console.log(`   Header information:`);
        console.log(`     Magic: 0x${header.magic.toString(16).padStart(8, '0')}`);
        console.log(`     Version: ${header.version}`);
        console.log(`     Timestamp: ${new Date(header.timestamp * 1000).toISOString()}`);
        console.log(`     Instruction count: ${header.instructionCount}`);
        console.log(`     Entry point: 0x${header.entryPoint.toString(16).padStart(8, '0')}`);
        console.log(`     Checksum: 0x${header.checksum.toString(16).padStart(8, '0')}`);
        if (header.metadata) {
            console.log(`     Metadata:`, JSON.stringify(header.metadata, null, 2));
        }

        // Validate header
        if (header.magic !== 0x4252434B) {
            throw new Error(`Invalid magic number: 0x${header.magic.toString(16)}`);
        }
        if (header.version !== 2) {
            throw new Error(`Invalid version: ${header.version}`);
        }

        console.log(`✓ Test passed: ${testName}`);
        return true;
    } catch (error) {
        console.error(`✗ Test failed: ${testName}`);
        console.error(`   Error: ${error.message}`);
        return false;
    }
}

/**
 * Test brick file generation
 */
async function testBrickGeneration() {
    console.log(`\n🧪 Testing: Brick file generation`);

    try {
        const { createInstruction, createBrickFile, OPCODES } = require('./test_brick_generator.js');

        // Create simple instructions
        const instructions = [
            createInstruction(OPCODES.MOV, 1, 42, 0),  // R1 = 42
            createInstruction(OPCODES.MOV, 2, 10, 0),  // R2 = 10
            createInstruction(OPCODES.ADD, 3, 1, 2),   // R3 = R1 + R2 = 52
            createInstruction(OPCODES.RET)             // Return
        ];

        // Create brick file
        const brickData = createBrickFile(instructions, {
            name: 'Test Brick',
            description: 'Generated test brick',
            author: 'Geometry OS'
        });

        // Verify brick file size
        const expectedSize = 132 + (instructions.length * 4);
        if (brickData.byteLength !== expectedSize) {
            throw new Error(`Invalid brick file size: ${brickData.byteLength} (expected ${expectedSize})`);
        }

        console.log(`   Generated brick file: ${brickData.byteLength} bytes`);
        console.log(`   Instructions: ${instructions.length}`);
        console.log(`✓ Test passed: Brick file generation`);
        return true;
    } catch (error) {
        console.error(`✗ Test failed: Brick file generation`);
        console.error(`   Error: ${error.message}`);
        return false;
    }
}

/**
 * Main test function
 */
async function main() {
    console.log('🧪 Starting brick loading tests...\n');
    console.log('='.repeat(60));

    let passed = 0;
    let failed = 0;

    // Test 1: Brick header parsing
    const test1 = await testBrickHeader('hello_world.brick', 'Hello World Header');
    if (test1) passed++; else failed++;

    const test2 = await testBrickHeader('counter.brick', 'Counter Header');
    if (test2) passed++; else failed++;

    const test3 = await testBrickHeader('arithmetic.brick', 'Arithmetic Header');
    if (test3) passed++; else failed++;

    // Test 2: Brick loading and execution
    const test4 = await testBrickLoading('hello_world.brick', 'Hello World Execution');
    if (test4) passed++; else failed++;

    const test5 = await testBrickLoading('counter.brick', 'Counter Execution');
    if (test5) passed++; else failed++;

    const test6 = await testBrickLoading('arithmetic.brick', 'Arithmetic Execution');
    if (test6) passed++; else failed++;

    // Test 3: Brick file generation
    const test7 = await testBrickGeneration();
    if (test7) passed++; else failed++;

    // Summary
    console.log('\n' + '='.repeat(60));
    console.log('🧪 Test Summary:');
    console.log(`   Passed: ${passed}`);
    console.log(`   Failed: ${failed}`);
    console.log(`   Total: ${passed + failed}`);

    if (failed === 0) {
        console.log('\n✓ All tests passed!');
        process.exit(0);
    } else {
        console.log('\n✗ Some tests failed!');
        process.exit(1);
    }
}

// Run tests
main().catch((error) => {
    console.error('Fatal error:', error);
    process.exit(1);
});
