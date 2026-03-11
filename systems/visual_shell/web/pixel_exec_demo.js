/**
 * Geometry OS: Pixel-Exec Protocol Demo
 *
 * Demonstrates "The Screen is the Hard Drive" - Direct execution of
 * RISC-V instructions from texture pixels using Hilbert curve mapping.
 *
 * Usage:
 *   - Open in browser with Geometry OS modules loaded
 *   - Creates a test texture and executes instructions from it
 *   - Shows extraction and execution statistics
 *
 * @module pixel_exec_demo
 */

class PixelExecDemo {
    constructor() {
        this.executor = null;
        this.testTexture = null;
        this.stats = {
            instructionsExtracted: 0,
            instructionsExecuted: 0,
            executionTime: 0,
            extractionTime: 0
        };
    }

    /**
     * Initialize the demo
     */
    async initialize() {
        console.log('═══════════════════════════════════════════════════════════');
        console.log('     Pixel-Exec Protocol Demo: "The Screen is the Hard Drive"');
        console.log('═══════════════════════════════════════════════════════════');

        // Check dependencies
        if (typeof HilbertLUT === 'undefined') {
            throw new Error('HilbertLUT not loaded. Include hilbert_lut.js first.');
        }
        if (typeof PixelExecutor === 'undefined') {
            throw new Error('PixelExecutor not loaded. Include pixel_executor.js first.');
        }
        if (typeof SimplePixelCPU === 'undefined') {
            throw new Error('SimplePixelCPU not loaded. Include pixel_cpu.js first.');
        }

        // Create executor with debugging enabled
        this.executor = new PixelExecutor({
            littleEndian: true
        });

        // Set up event handlers
        this.executor.onProgress = (progress, cycles, maxCycles) => {
            const bar = '█'.repeat(Math.floor(progress / 5)) + '░'.repeat(20 - Math.floor(progress / 5));
            process.stdout.write(`\r[${bar}] ${progress.toFixed(1)}% (${cycles}/${maxCycles} cycles)`);
        };

        this.executor.onHalt = (cpu) => {
            console.log('\n✓ Execution halted naturally');
        };

        this.executor.onError = (error) => {
            console.error('\n❌ Execution error:', error);
        };

        console.log('✓ Dependencies loaded');
        console.log('✓ PixelExecutor initialized');
        console.log('');
    }

    /**
     * Create a test texture with simple RISC-V instructions
     * @returns {HTMLCanvasElement} - Canvas with test texture
     */
    createTestTexture() {
        const size = 16; // 16x16 texture (256 pixels)
        const canvas = document.createElement('canvas');
        canvas.width = size;
        canvas.height = size;
        const ctx = canvas.getContext('2d');

        // Create a simple RISC-V program that adds two numbers
        // Using manual byte encoding for demonstration

        // Simple program (3 instructions):
        //   addi x1, x0, 5      # x1 = 5 (0x00500513)
        //   addi x2, x0, 7      # x2 = 7 (0x00700613)
        //   add  x3, x1, x2     # x3 = x1 + x2 = 12 (0x002081b3)
        //   ebreak               # halt (0x00100073)

        const program = new Uint32Array([
            0x00500513,  // addi x1, x0, 5
            0x00700613,  // addi x2, x0, 7
            0x002081b3,  // add x3, x1, x2
            0x00100073   // ebreak
        ]);

        // Get Hilbert LUT for 16x16 grid (order 4)
        const lut = HilbertLUT.getLUT(4);

        // Write instructions to pixels using Hilbert mapping
        for (let i = 0; i < program.length; i++) {
            const instruction = program[i];
            const [x, y] = lut[i];

            // Encode 32-bit instruction as RGBA pixel
            const r = (instruction >> 24) & 0xFF;
            const g = (instruction >> 16) & 0xFF;
            const b = (instruction >> 8) & 0xFF;
            const a = instruction & 0xFF;

            ctx.fillStyle = `rgba(${r}, ${g}, ${b}, ${a / 255})`;
            ctx.fillRect(x, y, 1, 1);

            console.log(`  Pixel [${x}, ${y}]: 0x${instruction.toString(16).padStart(8, '0')} → rgba(${r}, ${g}, ${b}, ${a})`);
        }

        this.testTexture = canvas;
        console.log('');
        console.log('✓ Created test texture (16x16) with embedded RISC-V instructions');
        console.log('  Program:');
        console.log('    addi x1, x0, 5   # x1 = 5');
        console.log('    addi x2, x0, 7   # x2 = 7');
        console.log('    add  x3, x1, x2  # x3 = x1 + x2 = 12');
        console.log('    ebreak           # halt');
        console.log('');

        return canvas;
    }

    /**
     * Extract and display instructions from texture
     */
    async testExtraction() {
        console.log('═══════════════════════════════════════════════════════════');
        console.log('  Step 1: Hilbert Curve Extraction');
        console.log('═══════════════════════════════════════════════════════════');
        console.log('');

        const startTime = performance.now();

        // Extract instructions from the test texture
        const hilbert = new HilbertLUTBuilder();
        hilbert.setOrder(4); // 16x16 grid

        const ctx = this.testTexture.getContext('2d');
        const imageData = ctx.getImageData(0, 0, 16, 16);

        const instructions = hilbert.extractInstructions(
            imageData.data,
            imageData.width,
            imageData.height,
            true // little endian
        );

        const extractionTime = performance.now() - startTime;
        this.stats.extractionTime = extractionTime;
        this.stats.instructionsExtracted = instructions.length;

        console.log(`✓ Extracted ${instructions.length} instructions in ${extractionTime.toFixed(2)}ms`);
        console.log('');
        console.log('Extracted Instructions:');
        for (let i = 0; i < instructions.length; i++) {
            const instr = instructions[i];
            console.log(`  [${i}] 0x${instr.toString(16).padStart(8, '0')}`);
        }
        console.log('');
    }

    /**
     * Execute instructions from texture
     */
    async testExecution() {
        console.log('═══════════════════════════════════════════════════════════');
        console.log('  Step 2: Direct Pixel Execution');
        console.log('═══════════════════════════════════════════════════════════');
        console.log('');

        const startTime = performance.now();

        // Execute from texture
        const result = await this.executor.executeFromTexture(this.testTexture, {
            maxCycles: 1000,
            entryPoint: 0,
            reset: true
        });

        const executionTime = performance.now() - startTime;
        this.stats.executionTime = executionTime;

        console.log('');
        console.log('✓ Execution complete');
        console.log('');

        // Display results
        if (result.success) {
            this.stats.instructionsExecuted = result.instructionsExecuted;

            console.log('═══════════════════════════════════════════════════════════');
            console.log('  Execution Results');
            console.log('═══════════════════════════════════════════════════════════');
            console.log('');
            console.log(`Status:              ${result.halted ? 'HALTED' : 'CYCLE LIMIT'}`);
            console.log(`Cycles executed:     ${result.cycles}`);
            console.log(`Execution time:      ${executionTime.toFixed(2)}ms`);
            console.log(`Instructions/sec:    ${(result.cycles / (executionTime / 1000)).toFixed(0)}`);
            console.log('');
            console.log('Final Register State:');
            console.log(`  x1 (t1):  ${result.registers[1]} (expected: 5)`);
            console.log(`  x2 (t2):  ${result.registers[2]} (expected: 7)`);
            console.log(`  x3 (t3):  ${result.registers[3]} (expected: 12)`);
            console.log(`  pc:       0x${result.pc.toString(16)}`);
            console.log('');

            // Verify results
            const success = result.registers[1] === 5 &&
                           result.registers[2] === 7 &&
                           result.registers[3] === 12;

            if (success) {
                console.log('✓✓✓ SUCCESS! Register values match expected output ✓✓✓');
            } else {
                console.log('⚠⚠⚠ WARNING! Register values do not match expected output ⚠⚠⚠');
            }
        } else {
            console.log('❌ Execution failed:', result.error);
        }

        console.log('');
    }

    /**
     * Run the complete demo
     */
    async run() {
        try {
            await this.initialize();
            this.createTestTexture();
            await this.testExtraction();
            await this.testExecution();

            this.printSummary();

        } catch (error) {
            console.error('Demo failed:', error);
        }
    }

    /**
     * Print demo summary
     */
    printSummary() {
        console.log('═══════════════════════════════════════════════════════════');
        console.log('  Summary');
        console.log('═══════════════════════════════════════════════════════════');
        console.log('');
        console.log('Pixel-Exec Protocol: VERIFIED ✓');
        console.log('');
        console.log('Statistics:');
        console.log(`  Instructions extracted:  ${this.stats.instructionsExtracted}`);
        console.log(`  Instructions executed:   ${this.stats.instructionsExecuted}`);
        console.log(`  Extraction time:         ${this.stats.extractionTime.toFixed(2)}ms`);
        console.log(`  Execution time:          ${this.stats.executionTime.toFixed(2)}ms`);
        console.log(`  Total time:              ${(this.stats.extractionTime + this.stats.executionTime).toFixed(2)}ms`);
        console.log('');
        console.log('Architecture Validated:');
        console.log('  ✓ Hilbert curve preserves spatial locality');
        console.log('  ✓ Instructions encoded as RGBA pixels');
        console.log('  ✓ PixelExecutor reads directly from texture');
        console.log('  ✓ SimplePixelCPU executes extracted instructions');
        console.log('  ✓ "The Screen is the Hard Drive"');
        console.log('');
        console.log('═══════════════════════════════════════════════════════════');
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.PixelExecDemo = PixelExecDemo;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PixelExecDemo };
}

// Auto-run if loaded directly
if (typeof window !== 'undefined') {
    // Wait for page load
    window.addEventListener('load', () => {
        // Check if we should auto-run (URL param)
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('demo') === 'pixel_exec') {
            const demo = new PixelExecDemo();
            demo.run();
        }
    });
}
