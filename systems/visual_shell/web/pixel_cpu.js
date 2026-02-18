/**
 * Geometry OS: JavaScript Pixel CPU Emulator
 *
 * Ports the Python SimplePixelCPU class to JavaScript for browser execution
 * of .brick files containing RISC-V transpiled Pixel CPU instructions.
 */

class SimplePixelCPU {
    constructor() {
        this.memory = []; // Array of 32-bit instructions
        this.registers = new Array(32).fill(0); // 32 registers
        this.pc = 0; // Program counter
        this.cycles = 0; // Execution cycles
        this.halted = false; // Halt flag
        this.maxMemorySize = 1024 * 1024; // 1MB limit
        this.version = 2; // Default to version 2

        // Memory-mapped I/O regions
        this.consoleBase = 0x20000000; // Console I/O base address
        this.consoleSize = 64 * 1024; // 64KB console region
        this.framebufferBase = 0x30000000; // Framebuffer base address
        this.framebufferSize = 4 * 1024 * 1024; // 4MB framebuffer region

        // Console I/O buffers
        this.consoleOutput = null; // Callback for console output
        this.consoleInput = null; // Callback for console input

        // Instruction tracing callback
        this.instructionCallback = null; // Callback for instruction tracing

        // Memory access callback for memory analysis
        this.memoryAccessCallback = null; // Callback for memory access tracking

        // Framebuffer memory (4MB for 640x480x4 bytes)
        this.framebuffer = new Uint8Array(this.framebufferSize);

        // Framebuffer configuration
        this.framebufferWidth = 640;  // Default width
        this.framebufferHeight = 480; // Default height

        // Dirty rectangle tracking for optimized updates
        this.dirtyRects = [];
        this.maxDirtyRects = 32; // Maximum number of dirty rectangles to track
        this.minDirtyRectSize = 4; // Minimum dirty rectangle size (4x4 pixels)
    }

    /**
     * Load a .brick file into memory using BrickLoader
     * @param {string} url - URL to the .brick file
     * @param {Object} options - Loading options
     * @param {Function} options.onProgress - Progress callback (loaded, total, percentage, status)
     * @returns {Promise<Object>} - Parsed brick data with header
     */
    async loadBrick(url, options = {}) {
        try {
            // Import BrickLoader if available
            if (typeof BrickLoader !== 'undefined') {
                const loader = new BrickLoader({
                    maxMemorySize: this.maxMemorySize,
                    validateChecksum: true,
                    onProgress: options.onProgress
                });

                const brickData = await loader.load(url);

                // Load instructions into memory
                this.memory = brickData.instructions;

                // Reset PC to entry point from header
                // Note: Header entry point is in bytes, convert to instruction index
                this.version = brickData.header.version;
                this.pc = Math.floor(brickData.header.entryPoint / 4);

                console.log(`✓ Loaded ${this.memory.length} instructions from ${url} (Version ${this.version})`);
                console.log(`✓ Entry point: PC=${this.pc} (Byte offset 0x${brickData.header.entryPoint.toString(16).padStart(8, '0')})`);

                return brickData;
            } else {
                // Fallback to simple loading (for backward compatibility)
                console.warn('BrickLoader not available, using simple loading');
                return this.loadBrickSimple(url, options);
            }
        } catch (error) {
            console.error(`Failed to load brick file ${url}:`, error);
            throw error;
        }
    }

    /**
     * Simple brick file loading (fallback when BrickLoader is unavailable)
     * @param {string} url - URL to the .brick file
     * @param {Object} options - Loading options
     * @returns {Promise<Object>} - Parsed brick data
     */
    async loadBrickSimple(url, options = {}) {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`HTTP ${response.status}: ${response.statusText}`);
        }

        const buffer = await response.arrayBuffer();

        // Parse V2BrickHeader (first 132 bytes)
        const headerView = new DataView(buffer, 0, 132);

        // Read magic number
        const magic = headerView.getUint32(0, true);
        if (magic !== 0x4252434B) {
            throw new Error(`Invalid magic number: 0x${magic.toString(16)} (expected 0x4252434B)`);
        }

        // Read version
        const version = headerView.getUint32(4, true);
        if (version !== 2) {
            throw new Error(`Unsupported brick version: ${version} (expected 2)`);
        }

        // Read instruction count
        const instructionCount = Number(headerView.getBigUint64(16, true));

        // Read entry point
        const entryPoint = Number(headerView.getBigUint64(24, true));

        // Read checksum
        const checksum = headerView.getUint32(96, true);

        // Calculate expected size
        const expectedSize = 132 + (instructionCount * 4);
        if (buffer.byteLength < expectedSize) {
            throw new Error(
                `Brick file too small: ${buffer.byteLength} bytes ` +
                `(expected ${expectedSize} bytes)`
            );
        }

        // Validate instruction count
        if (instructionCount > this.maxMemorySize) {
            throw new Error(
                `Brick file too large: ${instructionCount} instructions ` +
                `(max ${this.maxMemorySize})`
            );
        }

        // Load instructions (after header)
        const dataView = new DataView(buffer, 132, instructionCount * 4);

        this.memory = [];
        for (let i = 0; i < instructionCount; i++) {
            const instruction = dataView.getUint32(i * 4, true);
            this.memory.push(instruction);
        }

        // Reset PC to entry point
        this.pc = entryPoint;

        console.log(`✓ Loaded ${this.memory.length} instructions from ${url}`);
        console.log(`✓ Entry point: 0x${this.pc.toString(16).padStart(8, '0')}`);

        return {
            header: {
                magic,
                version,
                timestamp: Number(headerView.getBigUint64(8, true)),
                instructionCount,
                entryPoint,
                checksum
            },
            instructions: this.memory,
            url
        };
    }

    /**
     * Execute instructions
     * @param {number} maxCycles - Maximum cycles to execute (default: 100)
     * @returns {number} - Value in register 0
     */
    execute(maxCycles = 100) {
        this.pc = 0;
        this.cycles = 0;
        this.halted = false;

        while (this.pc < this.memory.length && this.cycles < maxCycles && !this.halted) {
            const inst = this.memory[this.pc];

            // Decode instruction: [opcode, dest, src1, src2] as bytes
            // When read as little-endian 32-bit integer, bytes are in order
            const opcode = inst & 0xFF;
            const dest = (inst >> 8) & 0xFF;
            const src1 = (inst >> 16) & 0xFF;
            const src2 = (inst >> 24) & 0xFF;

            // Debug: Print instruction (first 5 cycles)
            if (this.cycles < 5) {
                console.log(`  Cycle ${this.cycles}: PC=${this.pc}, Inst=0x${inst.toString(16).padStart(8, '0')}, Opcode=${opcode}, Dest=${dest}, Src1=${src1}, Src2=${src2}`);
            }

            // Call instruction callback for execution tracing (if set)
            if (this.instructionCallback) {
                this.instructionCallback(this.pc, opcode, dest, src1, src2, this.registers);
            }

            // Execute instruction
            switch (opcode) {
                case 0: // NOP
                    break;

                case 1: // MOV: If src2 == 0, treat src1 as immediate value; otherwise register-to-register
                    if (src2 === 0) {
                        // Immediate move: MOV Rdest, #imm
                        this.registers[dest] = src1;
                        if (this.cycles < 5) {
                            console.log(`    MOV R${dest} <- #${src1} (value=${src1})`);
                        }
                    } else {
                        // Register move: MOV Rdest, Rsrc1
                        this.registers[dest] = this.registers[src1];
                        if (this.cycles < 5) {
                            console.log(`    MOV R${dest} <- R${src1} (value=${this.registers[src1]})`);
                        }
                    }
                    break;

                case 2: // ADD
                    this.registers[dest] = this.registers[src1] + this.registers[src2];
                    if (this.cycles < 5) {
                        console.log(`    ADD R${dest} <- R${src1} + R${src2} (${this.registers[src1]} + ${this.registers[src2]} = ${this.registers[dest]})`);
                    }
                    break;

                case 3: // SUB
                    this.registers[dest] = this.registers[src1] - this.registers[src2];
                    break;

                case 14: // JUMP: Unconditional jump to address
                    this.pc = src1; // Jump to address in src1
                    if (this.cycles < 5) {
                        console.log(`    JUMP -> ${src1}`);
                    }
                    break;

                case 15: // JZ: Jump if zero (dest register == 0)
                    if (this.registers[dest] === 0) {
                        this.pc = src1;
                        if (this.cycles < 5) {
                            console.log(`    JZ R${dest} -> ${src1} (taken)`);
                        }
                    } else {
                        if (this.cycles < 5) {
                            console.log(`    JZ R${dest} -> ${src1} (not taken)`);
                        }
                    }
                    break;

                case 16: // JNZ: Jump if not zero (dest register != 0)
                    if (this.registers[dest] !== 0) {
                        this.pc = src1;
                        if (this.cycles < 5) {
                            console.log(`    JNZ R${dest} -> ${src1} (taken)`);
                        }
                    } else {
                        if (this.cycles < 5) {
                            console.log(`    JNZ R${dest} -> ${src1} (not taken)`);
                        }
                    }
                    break;

                case 13: // STORE: Write register value to memory address
                    // Address is formed by combining src1 (upper 16 bits) and src2 (lower 8 bits)
                    // For console I/O at 0x20000000, we need special handling
                    let storeAddr;
                    if (src1 === 0x20 && src2 === 0x00) {
                        // Special case: console I/O base address
                        storeAddr = this.consoleBase;
                    } else {
                        storeAddr = ((src1 << 8) | src2) & 0xFFFFFF;
                    }
                    const storeValue = this.registers[dest] & 0xFF;
                    this.writeMemory(storeAddr, storeValue);
                    if (this.cycles < 5) {
                        console.log(`    STORE R${dest} -> [0x${storeAddr.toString(16).padStart(8, '0')}] (value=${storeValue})`);
                    }
                    break;

                case 18: // RET
                    console.log(`✓ RET instruction at cycle ${this.cycles}`);
                    return this.registers[0]; // Return result

                case 255: // HALT
                    console.log(`✓ HALT instruction at cycle ${this.cycles}`);
                    this.halted = true;
                    break;

                default:
                    console.warn(`⚠ Unknown opcode: ${opcode}`);
                    break;
            }

            this.pc++;
            this.cycles++;
        }

        console.log(`✓ Executed ${this.cycles} cycles, PC=${this.pc}, Halted=${this.halted}`);
        console.log(`✓ Registers: [${this.registers.slice(0, 8).join(', ')}]`);

        return this.registers[0]; // Return result in R0
    }

    /**
     * Execute a single instruction step
     * @returns {object} - Step result with state changes
     */
    step() {
        if (this.halted || this.pc >= this.memory.length) {
            return {
                pc: this.pc,
                cycles: this.cycles,
                halted: this.halted,
                instruction: null,
                registersChanged: []
            };
        }

        const inst = this.memory[this.pc];
        const oldRegisters = [...this.registers];

        let opcode, dest, src1, src2;

        if (this.version === 1) {
            // RISC-V Decoding (Partial)
            opcode = inst & 0x7F;
            const funct3 = (inst >> 12) & 0x07;
            const rd = (inst >> 7) & 0x1F;
            const rs1 = (inst >> 15) & 0x1F;
            const rs2 = (inst >> 20) & 0x1F;
            const imm_i = (inst >> 20); // 12-bit signed immediate
            const imm_b = ((inst >> 31) << 12) | (((inst >> 7) & 1) << 11) | (((inst >> 25) & 0x3F) << 5) | (((inst >> 8) & 0x0F) << 1);

            // Map RISC-V to symbolic dest/src for tracing compatibility
            dest = rd;
            src1 = rs1;
            src2 = imm_i; // For I-type

            // Execute RISC-V instructions
            switch (opcode) {
                case 0x13: // OP-IMM (addi, etc.)
                    if (funct3 === 0) { // ADDI
                        const sign = (inst >> 31) & 1;
                        let imm = (inst >> 20);
                        if (sign) imm |= 0xFFFFF000; // Sign extend
                        this.registers[rd] = (this.registers[rs1] + (imm >> 0)) | 0;
                    }
                    break;
                case 0x33: // OP (add, etc.)
                    if (funct3 === 0) { // ADD
                        this.registers[rd] = (this.registers[rs1] + this.registers[rs2]) | 0;
                    }
                    break;
                case 0x63: // BRANCH (beq, bne, etc.)
                    let branch = false;
                    const val1 = this.registers[rs1];
                    const val2 = this.registers[rs2];
                    if (funct3 === 0) branch = (val1 === val2); // BEQ
                    else if (funct3 === 1) branch = (val1 !== val2); // BNE

                    if (branch) {
                        // B-type imm is complex, for simple loops we'll support small relative jumps
                        let offset = imm_b >> 0;
                        if (offset & 0x1000) offset |= 0xFFFFE000; // Sign extend
                        this.pc += (offset / 4) - 1; // -1 because pc++ follows
                    }
                    break;
                case 0x73: // SYSTEM (ecall, etc.)
                    if (funct3 === 0) {
                        // Environment Call
                        const a7 = this.registers[17] || 0; // x17 = syscall number
                        const a0 = this.registers[10] || 0; // x10 = arg0

                        if (a7 === 93) { // sys_exit
                            this.halted = true;
                            console.log(`Program exited with code ${a0}`);
                        } else {
                            // Default: treat as console output of x10
                            if (this.consoleOutput) {
                                this.consoleOutput(a0);
                            }
                        }
                    }
                    break;
                default:
                    // unknown riscv opcode
                    break;
            }
        } else {
            // Legacy PixelCPU Decoding (Version 2)
            opcode = inst & 0xFF;
            dest = (inst >> 8) & 0xFF;
            src1 = (inst >> 16) & 0xFF;
            src2 = (inst >> 24) & 0xFF;

            // Execute Legacy instructions
            switch (opcode) {
                case 0: // NOP
                    break;
                case 1: // MOV
                    if (src2 === 0) this.registers[dest] = src1;
                    else this.registers[dest] = this.registers[src1];
                    break;
                case 2: // ADD
                    this.registers[dest] = (this.registers[src1] + this.registers[src2]) | 0;
                    break;
                case 3: // SUB
                    this.registers[dest] = (this.registers[src1] - this.registers[src2]) | 0;
                    break;
                case 14: // JUMP
                    this.pc = src1 - 1;
                    break;
                case 15: // JZ
                    if (this.registers[dest] === 0) this.pc = src1 - 1;
                    break;
                case 16: // JNZ
                    if (this.registers[dest] !== 0) this.pc = src1 - 1;
                    break;
                case 13: // STORE
                    let storeAddr = (src1 === 0x20 && src2 === 0x00) ? this.consoleBase : ((src1 << 8) | src2) & 0xFFFFFF;
                    this.writeMemory(storeAddr, this.registers[dest] & 0xFF);
                    break;
                case 18: // RET
                    this.halted = true;
                    break;
                case 255: // HALT
                    this.halted = true;
                    break;
            }
        }

        this.pc++;
        this.cycles++;

        // Find changed registers
        const registersChanged = [];
        for (let i = 0; i < 32; i++) {
            if (oldRegisters[i] !== this.registers[i]) {
                registersChanged.push({
                    index: i,
                    oldValue: oldRegisters[i],
                    newValue: this.registers[i]
                });
            }
        }

        return {
            pc: this.pc,
            cycles: this.cycles,
            halted: this.halted,
            instruction: inst,
            opcode: opcode,
            registersChanged: registersChanged
        };
    }

    /**
     * Get current CPU state for debugging/visualization
     * @returns {object} - CPU state
     */
    getState() {
        return {
            pc: this.pc,
            cycles: this.cycles,
            halted: this.halted,
            registers: [...this.registers],
            memorySize: this.memory.length
        };
    }

    /**
     * Reset CPU state
     */
    reset() {
        this.registers.fill(0);
        this.pc = 0;
        this.cycles = 0;
        this.halted = false;
        // Clear framebuffer
        this.framebuffer.fill(0);
    }

    /**
     * Read byte from memory address (with memory-mapped I/O support)
     * @param {number} addr - Memory address
     * @returns {number} - Byte value (0-255)
     */
    readMemory(addr) {
        // Console I/O region (0x20000000-0x2000FFFF)
        if (addr >= this.consoleBase && addr < this.consoleBase + this.consoleSize) {
            const offset = addr - this.consoleBase;

            // Console Input (offset 0x01)
            if (offset === 0x01) {
                if (this.consoleInput) {
                    return this.consoleInput();
                }
                return 0; // No input available
            }

            // Console Status (offset 0x02)
            if (offset === 0x02) {
                // Bit 0: Output Ready (always 1)
                // Bit 1: Input Available (0 for now)
                return 0x01;
            }

            // Other console addresses return 0
            return 0;
        }

        // Framebuffer region (0x30000000-0x3FFFFFFF)
        if (addr >= this.framebufferBase && addr < this.framebufferBase + this.framebufferSize) {
            const offset = addr - this.framebufferBase;
            const value = this.framebuffer[offset];

            // Call memory access callback if set
            if (this.memoryAccessCallback) {
                this.memoryAccessCallback(addr, 'read', value, this.pc);
            }

            return value;
        }

        // Program/Data memory (0x00000000-0x1FFFFFFF)
        // Convert byte address to word index and byte offset
        const wordIndex = Math.floor(addr / 4);
        const byteOffset = addr % 4;

        if (wordIndex >= 0 && wordIndex < this.memory.length) {
            const word = this.memory[wordIndex];
            // Extract the appropriate byte (little-endian)
            const value = (word >> (byteOffset * 8)) & 0xFF;

            // Call memory access callback if set
            if (this.memoryAccessCallback) {
                this.memoryAccessCallback(addr, 'read', value, this.pc);
            }

            return value;
        }

        throw new RangeError(`Memory read out of bounds: 0x${addr.toString(16)}`);
    }

    /**
     * Write byte to memory address (with memory-mapped I/O support)
     * @param {number} addr - Memory address
     * @param {number} value - Value to write (0-255)
     */
    writeMemory(addr, value) {
        // Validate value range
        if (value < 0 || value > 255) {
            throw new RangeError(`Value out of range: ${value} (must be 0-255)`);
        }

        // Console I/O region (0x20000000-0x2000FFFF)
        if (addr >= this.consoleBase && addr < this.consoleBase + this.consoleSize) {
            const offset = addr - this.consoleBase;

            // Console Output (offset 0x00)
            if (offset === 0x00) {
                if (this.consoleOutput) {
                    this.consoleOutput(value);
                }
                return;
            }

            // Console Status (offset 0x02) - read-only, ignore writes
            if (offset === 0x02) {
                return;
            }

            // Other console addresses - ignore writes
            return;
        }

        // Framebuffer region (0x30000000-0x3FFFFFFF)
        if (addr >= this.framebufferBase && addr < this.framebufferBase + this.framebufferSize) {
            const offset = addr - this.framebufferBase;
            this.framebuffer[offset] = value;
            // Track dirty region
            this.markDirty(offset);

            // Call memory access callback if set
            if (this.memoryAccessCallback) {
                this.memoryAccessCallback(addr, 'write', value, this.pc);
            }

            return;
        }

        // Program/Data memory (0x00000000-0x1FFFFFFF)
        // Convert byte address to word index and byte offset
        const wordIndex = Math.floor(addr / 4);
        const byteOffset = addr % 4;

        if (wordIndex >= 0 && wordIndex < this.memory.length) {
            const word = this.memory[wordIndex];
            // Clear the target byte and set new value (little-endian)
            const mask = ~(0xFF << (byteOffset * 8));
            this.memory[wordIndex] = (word & mask) | (value << (byteOffset * 8));

            // Call memory access callback if set
            if (this.memoryAccessCallback) {
                this.memoryAccessCallback(addr, 'write', value, this.pc);
            }

            return;
        }

        throw new RangeError(`Memory write out of bounds: 0x${addr.toString(16)}`);
    }

    /**
     * Set console output callback
     * @param {Function} callback - Function to call when console output occurs
     */
    setConsoleOutputCallback(callback) {
        this.consoleOutput = callback;
    }

    /**
     * Set console input callback
     * @param {Function} callback - Function to call when console input is requested
     */
    setConsoleInputCallback(callback) {
        this.consoleInput = callback;
    }

    /**
     * Set instruction callback for execution tracing
     * @param {Function} callback - Function to call when each instruction is executed
     *                             Callback receives: (pc, opcode, dest, src1, src2, registers)
     */
    setInstructionCallback(callback) {
        this.instructionCallback = callback;
    }

    /**
     * Set memory access callback for memory analysis
     * @param {Function} callback - Function to call when memory is accessed
     *                             Callback receives: (address, type, value, pc)
     *                             - address: Memory address accessed
     *                             - type: 'read' or 'write'
     *                             - value: Value read or written
     *                             - pc: Program counter at time of access
     */
    setMemoryAccessCallback(callback) {
        this.memoryAccessCallback = callback;
    }

    /**
     * Get framebuffer data
     * @returns {Uint8Array} - Framebuffer data
     */
    getFramebuffer() {
        return this.framebuffer;
    }

    /**
     * Mark a byte offset in framebuffer as dirty
     * @param {number} offset - Byte offset in framebuffer
     */
    markDirty(offset) {
        // Convert byte offset to pixel coordinates
        const bytesPerPixel = 4; // RGBA
        const pixelIndex = Math.floor(offset / bytesPerPixel);
        const x = pixelIndex % this.framebufferWidth;
        const y = Math.floor(pixelIndex / this.framebufferWidth);

        // Round to minimum dirty rectangle size
        const dirtyX = Math.floor(x / this.minDirtyRectSize) * this.minDirtyRectSize;
        const dirtyY = Math.floor(y / this.minDirtyRectSize) * this.minDirtyRectSize;

        // Check if this region is already dirty
        for (let i = 0; i < this.dirtyRects.length; i++) {
            const rect = this.dirtyRects[i];
            if (dirtyX >= rect.x && dirtyX < rect.x + rect.width &&
                dirtyY >= rect.y && dirtyY < rect.y + rect.height) {
                // Already covered by existing dirty rect
                return;
            }
        }

        // Add new dirty rectangle
        this.dirtyRects.push({
            x: dirtyX,
            y: dirtyY,
            width: this.minDirtyRectSize,
            height: this.minDirtyRectSize
        });

        // Merge overlapping or adjacent rectangles
        this.mergeDirtyRects();

        // Limit number of dirty rectangles
        if (this.dirtyRects.length > this.maxDirtyRects) {
            // Merge all into one full-screen update
            this.dirtyRects = [{
                x: 0,
                y: 0,
                width: this.framebufferWidth,
                height: this.framebufferHeight
            }];
        }
    }

    /**
     * Merge overlapping or adjacent dirty rectangles
     */
    mergeDirtyRects() {
        if (this.dirtyRects.length < 2) return;

        let merged = true;
        while (merged) {
            merged = false;
            for (let i = 0; i < this.dirtyRects.length; i++) {
                for (let j = i + 1; j < this.dirtyRects.length; j++) {
                    const r1 = this.dirtyRects[i];
                    const r2 = this.dirtyRects[j];

                    // Check if rectangles overlap or are adjacent
                    const overlapX = !(r1.x + r1.width < r2.x || r2.x + r2.width < r1.x);
                    const overlapY = !(r1.y + r1.height < r2.y || r2.y + r2.height < r1.y);

                    if (overlapX && overlapY) {
                        // Merge rectangles
                        const newX = Math.min(r1.x, r2.x);
                        const newY = Math.min(r1.y, r2.y);
                        const newWidth = Math.max(r1.x + r1.width, r2.x + r2.width) - newX;
                        const newHeight = Math.max(r1.y + r1.height, r2.y + r2.height) - newY;

                        this.dirtyRects[i] = { x: newX, y: newY, width: newWidth, height: newHeight };
                        this.dirtyRects.splice(j, 1);
                        merged = true;
                        break;
                    }
                }
                if (merged) break;
            }
        }
    }

    /**
     * Get current dirty rectangles
     * @returns {Array} - Array of dirty rectangle objects
     */
    getDirtyRects() {
        return this.dirtyRects;
    }

    /**
     * Clear all dirty rectangles
     */
    clearDirtyRects() {
        this.dirtyRects = [];
    }

    /**
     * Set framebuffer resolution
     * @param {number} width - Framebuffer width in pixels
     * @param {number} height - Framebuffer height in pixels
     */
    setFramebufferResolution(width, height) {
        // Validate resolution
        const validResolutions = [
            { width: 640, height: 480 },
            { width: 800, height: 600 },
            { width: 1024, height: 768 }
        ];

        const isValid = validResolutions.some(r => r.width === width && r.height === height);
        if (!isValid) {
            throw new Error(`Invalid resolution: ${width}x${height}. Valid resolutions: 640x480, 800x600, 1024x768`);
        }

        // Calculate required framebuffer size
        const requiredSize = width * height * 4; // RGBA = 4 bytes per pixel
        if (requiredSize > this.framebufferSize) {
            throw new Error(`Resolution ${width}x${height} requires ${requiredSize} bytes, but framebuffer is only ${this.framebufferSize} bytes`);
        }

        this.framebufferWidth = width;
        this.framebufferHeight = height;

        // Clear dirty rectangles on resolution change
        this.clearDirtyRects();

        console.log(`✓ Framebuffer resolution set to ${width}x${height}`);
    }

    /**
     * Get current framebuffer resolution
     * @returns {Object} - Resolution object with width and height
     */
    getFramebufferResolution() {
        return {
            width: this.framebufferWidth,
            height: this.framebufferHeight
        };
    }
}

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SimplePixelCPU;
}