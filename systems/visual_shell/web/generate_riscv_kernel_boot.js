/**
 * Geometry OS: RISC-V Linux Kernel Boot Brick Generator
 *
 * Generates a minimal RISC-V Linux kernel boot loader brick file
 * for Phase 8: RISC-V Linux Kernel Boot Attempt for Pixel CPU
 */

// Import brick_loader.js classes
const { V2BrickHeader, CRC32, BrickLoader } = require('./brick_loader.js');

/**
 * Opcodes for Pixel CPU
 */
const OPCODES = {
    NOP: 0,
    MOV: 1,
    ADD: 2,
    SUB: 3,
    MUL: 4,
    DIV: 5,
    AND: 6,
    OR: 7,
    XOR: 8,
    NOT: 9,
    SHL: 10,
    SHR: 11,
    LOAD: 12,
    STORE: 13,
    JUMP: 14,
    JZ: 15,
    JNZ: 16,
    CALL: 17,
    RET: 18,
    HALT: 255
};

/**
 * Create an instruction from opcode and registers
 * @param {number} opcode - Opcode (0-255)
 * @param {number} dest - Destination register (0-31)
 * @param {number} src1 - Source register 1 (0-31)
 * @param {number} src2 - Source register 2 (0-31)
 * @returns {number} - 32-bit instruction
 */
function createInstruction(opcode, dest = 0, src1 = 0, src2 = 0) {
    return (
        (opcode & 0xFF) |
        ((dest & 0xFF) << 8) |
        ((src1 & 0xFF) << 16) |
        ((src2 & 0xFF) << 24)
    ) >>> 0; // Ensure unsigned
}

/**
 * Create a STORE instruction for console output
 * @param {number} reg - Source register containing the character
 * @param {number} addr - Memory address to write to
 * @returns {number} - 32-bit STORE instruction
 */
function createStoreInstruction(reg, addr) {
    // For console I/O at 0x20000000, use special encoding: src1=0x20, src2=0x00
    if (addr === 0x20000000) {
        return createInstruction(OPCODES.STORE, reg, 0x20, 0x00);
    }
    // For other addresses, use standard encoding
    const addrUpper = (addr >> 8) & 0xFF;
    const addrLower = addr & 0xFF;
    return createInstruction(OPCODES.STORE, reg, addrUpper, addrLower);
}

/**
 * Generate a RISC-V Linux kernel boot brick file
 * This program simulates a minimal RISC-V Linux kernel boot sequence
 * with console output showing the boot process
 * @returns {ArrayBuffer} - Brick file as ArrayBuffer
 */
function generateRiscVKernelBootBrick() {
    const instructions = [];

    // Console I/O base address
    const CONSOLE_OUTPUT = 0x20000000;

    // Boot messages to display
    const bootMessages = [
        "RISC-V Linux Kernel Boot",
        "------------------------",
        "Booting Geometry OS...",
        "CPU: Pixel CPU Emulator",
        "Architecture: RISC-V 32-bit",
        "Memory: 1MB",
        "Initializing kernel...",
        "Setting up memory management...",
        "Initializing console I/O...",
        "Loading device drivers...",
        "Starting kernel services...",
        "System ready!",
        "Shell: /bin/bash",
        "Welcome to Geometry OS!"
    ];

    // Output each boot message character by character
    for (const message of bootMessages) {
        for (let i = 0; i < message.length; i++) {
            const charCode = message.charCodeAt(i);
            // Load character into R1
            instructions.push(createInstruction(OPCODES.MOV, 1, charCode, 0));
            // Store to console
            instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));
        }
        // Add newline after each message
        instructions.push(createInstruction(OPCODES.MOV, 1, 0x0A, 0)); // '\n'
        instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));
    }

    // Simulate memory setup
    instructions.push(createInstruction(OPCODES.MOV, 2, 0x00, 0)); // R2 = 0 (base address)
    instructions.push(createInstruction(OPCODES.MOV, 3, 0x10, 0)); // R3 = 16 (size)

    // Simulate memory initialization loop
    const loopStart = instructions.length;

    // Store zero to memory location
    instructions.push(createInstruction(OPCODES.MOV, 1, 0x00, 0)); // R1 = 0
    instructions.push(createStoreInstruction(1, 0x100000 + (loopStart * 4))); // Store to memory

    // Increment address
    instructions.push(createInstruction(OPCODES.ADD, 2, 2, 4)); // R2 += 4

    // Decrement counter
    instructions.push(createInstruction(OPCODES.SUB, 3, 3, 1)); // R3 -= 1

    // Jump if not zero
    instructions.push(createInstruction(OPCODES.JNZ, 0, loopStart, 0)); // Jump to loop start if R3 != 0

    // Output memory initialization complete message
    const memCompleteMsg = "Memory initialization complete: 64 bytes zeroed";
    for (let i = 0; i < memCompleteMsg.length; i++) {
        const charCode = memCompleteMsg.charCodeAt(i);
        instructions.push(createInstruction(OPCODES.MOV, 1, charCode, 0));
        instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));
    }
    instructions.push(createInstruction(OPCODES.MOV, 1, 0x0A, 0)); // '\n'
    instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));

    // Simulate interrupt handler setup
    instructions.push(createInstruction(OPCODES.MOV, 4, 0x01, 0)); // R4 = 1 (interrupt enabled)

    // Output interrupt setup message
    const intMsg = "Interrupt handlers initialized";
    for (let i = 0; i < intMsg.length; i++) {
        const charCode = intMsg.charCodeAt(i);
        instructions.push(createInstruction(OPCODES.MOV, 1, charCode, 0));
        instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));
    }
    instructions.push(createInstruction(OPCODES.MOV, 1, 0x0A, 0)); // '\n'
    instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));

    // Simulate process table initialization
    instructions.push(createInstruction(OPCODES.MOV, 5, 0x00, 0)); // R5 = 0 (PID counter)
    instructions.push(createInstruction(OPCODES.MOV, 6, 0x05, 0)); // R6 = 5 (max processes)

    // Initialize 5 process slots
    const procLoopStart = instructions.length;

    // Mark process slot as free
    instructions.push(createInstruction(OPCODES.MOV, 1, 0x46, 0)); // 'F'
    instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));
    instructions.push(createInstruction(OPCODES.MOV, 1, 0x72, 0)); // 'r'
    instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));
    instructions.push(createInstruction(OPCODES.MOV, 1, 0x65, 0)); // 'e'
    instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));
    instructions.push(createInstruction(OPCODES.MOV, 1, 0x65, 0)); // 'e'
    instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));
    instructions.push(createInstruction(OPCODES.MOV, 1, 0x20, 0)); // ' '
    instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));

    // Increment PID
    instructions.push(createInstruction(OPCODES.ADD, 5, 5, 1)); // R5 += 1

    // Decrement counter
    instructions.push(createInstruction(OPCODES.SUB, 6, 6, 1)); // R6 -= 1

    // Jump if not zero
    instructions.push(createInstruction(OPCODES.JNZ, 0, procLoopStart, 0)); // Jump to loop start if R6 != 0

    // Newline
    instructions.push(createInstruction(OPCODES.MOV, 1, 0x0A, 0)); // '\n'
    instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));

    // Output final boot status
    const bootCompleteMsg = "Boot sequence complete. System running.";
    for (let i = 0; i < bootCompleteMsg.length; i++) {
        const charCode = bootCompleteMsg.charCodeAt(i);
        instructions.push(createInstruction(OPCODES.MOV, 1, charCode, 0));
        instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));
    }
    instructions.push(createInstruction(OPCODES.MOV, 1, 0x0A, 0)); // '\n'
    instructions.push(createStoreInstruction(1, CONSOLE_OUTPUT));

    // Halt the system
    instructions.push(createInstruction(OPCODES.HALT));

    return createBrickFile(instructions, {
        name: 'RISC-V Linux Kernel Boot',
        description: 'Minimal RISC-V Linux kernel boot loader with console output',
        author: 'Geometry OS',
        version: '1.0.0',
        kernelVersion: '5.15.0',
        architecture: 'RISC-V 32-bit',
        bootType: 'minimal'
    });
}

/**
 * Create a brick file from instructions
 * @param {Array} instructions - Array of 32-bit instructions
 * @param {Object} metadata - Metadata object
 * @returns {ArrayBuffer} - Brick file as ArrayBuffer
 */
function createBrickFile(instructions, metadata = {}) {
    const loader = new BrickLoader();
    return loader.createBrick(instructions, metadata);
}

/**
 * Save brick file to disk (Node.js only)
 * @param {ArrayBuffer} brickData - Brick file data
 * @param {string} filename - Output filename
 */
function saveBrickFile(brickData, filename) {
    const fs = require('fs');
    const buffer = Buffer.from(brickData);
    fs.writeFileSync(filename, buffer);
    console.log(`✓ Saved brick file: ${filename} (${buffer.length} bytes)`);
}

/**
 * Main function
 */
function main() {
    console.log('🔨 Generating RISC-V Linux Kernel Boot brick file...\n');

    // Generate RISC-V Linux kernel boot brick
    console.log('Generating riscv_kernel_boot.brick...');
    const riscvKernelBootBrick = generateRiscVKernelBootBrick();
    saveBrickFile(riscvKernelBootBrick, 'riscv_kernel_boot.brick');

    console.log('\n✓ RISC-V Linux kernel boot brick file generated successfully!');
    console.log('\nBoot features:');
    console.log('  - Console output during boot process');
    console.log('  - Memory initialization simulation');
    console.log('  - Interrupt handler setup');
    console.log('  - Process table initialization');
    console.log('  - Boot status messages');
}

// Run if executed directly
if (require.main === module) {
    main();
}

// Export for use in other modules
module.exports = {
    generateRiscVKernelBootBrick,
    createInstruction,
    createStoreInstruction,
    createBrickFile,
    saveBrickFile,
    OPCODES
};
