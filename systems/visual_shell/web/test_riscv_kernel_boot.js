/**
 * Geometry OS: Test RISC-V Linux Kernel Boot
 *
 * Tests the RISC-V Linux kernel boot brick file with the Pixel CPU emulator
 * for Phase 8: RISC-V Linux Kernel Boot Attempt
 */

// Import required modules
const SimplePixelCPU = require('./pixel_cpu.js');
const { BrickLoader } = require('./brick_loader.js');

/**
 * Test RISC-V Linux kernel boot
 */
async function testRiscVKernelBoot() {
    console.log('🚀 Testing RISC-V Linux Kernel Boot...\n');
    console.log('='.repeat(60));

    // Create CPU instance
    const cpu = new SimplePixelCPU();

    // Set up console output callback to capture boot messages
    let consoleOutput = '';
    cpu.setConsoleOutputCallback((value) => {
        const char = String.fromCharCode(value);
        consoleOutput += char;
        process.stdout.write(char); // Write directly to stdout for real-time output
    });

    console.log('\n[CPU] Initializing Pixel CPU emulator...');
    console.log('[CPU] Console I/O base: 0x20000000');
    console.log('[CPU] Framebuffer base: 0x30000000');
    console.log('[CPU] Memory size: 1MB');
    console.log('[CPU] Loading RISC-V Linux kernel boot brick...\n');

    try {
        // Load the RISC-V kernel boot brick file using BrickLoader
        const loader = new BrickLoader({
            onProgress: (loaded, total, percentage, status) => {
                console.log(`[Loader] ${status} (${percentage}%)`);
            }
        });
        const brickData = await loader.load('./riscv_kernel_boot.brick');

        // Load instructions into CPU memory
        cpu.memory = brickData.instructions;
        cpu.pc = brickData.header.entryPoint;

        console.log('\n[CPU] Brick loaded successfully!');
        console.log(`[CPU] Entry point: 0x${brickData.header.entryPoint.toString(16).padStart(8, '0')}`);
        console.log(`[CPU] Instruction count: ${brickData.header.instructionCount}`);
        console.log('[CPU] Starting boot sequence...\n');
        console.log('='.repeat(60));
        console.log('BOOT OUTPUT:');
        console.log('='.repeat(60));

        // Execute the boot sequence
        const startTime = Date.now();
        const result = cpu.execute(10000); // Execute up to 10000 cycles
        const endTime = Date.now();

        console.log('='.repeat(60));
        console.log('\n[CPU] Boot sequence completed!');
        console.log(`[CPU] Execution time: ${endTime - startTime}ms`);
        console.log(`[CPU] Cycles executed: ${cpu.cycles}`);
        console.log(`[CPU] Final PC: 0x${cpu.pc.toString(16).padStart(8, '0')}`);
        console.log(`[CPU] Halted: ${cpu.halted}`);
        console.log(`[CPU] Result: ${result}`);

        // Display final register state
        console.log('\n[CPU] Final register state:');
        const registerGroups = [];
        for (let i = 0; i < 32; i += 8) {
            const group = [];
            for (let j = 0; j < 8 && i + j < 32; j++) {
                const regValue = cpu.registers[i + j];
                group.push(`R${i + j}=${regValue.toString(16).padStart(2, '0')}`);
            }
            registerGroups.push(group.join(' '));
        }
        console.log('  ' + registerGroups.join('\n  '));

        // Analyze console output
        console.log('\n[Analysis] Boot output analysis:');
        const lines = consoleOutput.split('\n').filter(line => line.trim() !== '');
        console.log(`  Total lines: ${lines.length}`);
        console.log(`  Total characters: ${consoleOutput.length}`);

        // Check for key boot messages
        const keyMessages = [
            'RISC-V Linux Kernel Boot',
            'Booting Geometry OS',
            'System ready',
            'Boot sequence complete'
        ];

        console.log('\n[Analysis] Key boot messages:');
        for (const msg of keyMessages) {
            const found = consoleOutput.includes(msg);
            console.log(`  ${found ? '✓' : '✗'} ${msg}`);
        }

        // Verify boot success criteria
        console.log('\n[Verification] Boot success criteria:');
        const criteria = {
            'Console output generated': consoleOutput.length > 0,
            'Boot messages displayed': lines.length >= 5,
            'System halted gracefully': cpu.halted === true,
            'No crashes during execution': cpu.pc < cpu.memory.length || cpu.halted === true
        };

        let allCriteriaMet = true;
        for (const [criterion, met] of Object.entries(criteria)) {
            console.log(`  ${met ? '✓' : '✗'} ${criterion}`);
            if (!met) allCriteriaMet = false;
        }

        console.log('\n' + '='.repeat(60));
        if (allCriteriaMet) {
            console.log('✓ RISC-V Linux kernel boot test PASSED!');
            console.log('✓ All acceptance criteria met!');
        } else {
            console.log('✗ RISC-V Linux kernel boot test FAILED!');
            console.log('✗ Some acceptance criteria not met.');
        }
        console.log('='.repeat(60));

        return {
            success: allCriteriaMet,
            consoleOutput,
            cycles: cpu.cycles,
            halted: cpu.halted,
            pc: cpu.pc,
            criteria
        };

    } catch (error) {
        console.error('\n[ERROR] Boot test failed:', error);
        console.error(error.stack);
        return {
            success: false,
            error: error.message
        };
    }
}

/**
 * Main function
 */
async function main() {
    console.log('Geometry OS: RISC-V Linux Kernel Boot Test');
    console.log('Phase 8: RISC-V Linux Kernel Boot Attempt for Pixel CPU\n');

    const result = await testRiscVKernelBoot();

    // Exit with appropriate code
    process.exit(result.success ? 0 : 1);
}

// Run if executed directly
if (require.main === module) {
    main().catch(error => {
        console.error('Fatal error:', error);
        process.exit(1);
    });
}

// Export for use in other modules
module.exports = {
    testRiscVKernelBoot
};
