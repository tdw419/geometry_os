/**
 * Geometry OS: WASM Hypervisor
 *
 * A Tectonic Building that emulates a traditional CPU (RISC-V/x86)
 * using WebAssembly, allowing Linux to run as a visual cartridge.
 *
 * Architecture:
 * - WasmMemory: 64MB+ linear memory for guest OS
 * - CpuEmulator: RISC-V/x86 instruction interpreter
 * - CartridgeLoader: Load OS images as resonance textures
 * - VfsBridge: Virtual filesystem for cartridge I/O
 *
 * Epoch 4: The Cartridge Ecosystem
 */

import { TectonicBuilding } from './TectonicBuilding.js';

// ============================================
// CONSTANTS
// ============================================

const MEMORY_SIZE = 64 * 1024 * 1024;  // 64MB default
const PAGE_SIZE = 65536;  // 64KB WebAssembly page
const STACK_START = 0x7FFF0000;
const HEAP_START = 0x10000;

// RISC-V Opcodes (subset)
const RV_OPCODES = {
    LUI: 0x37,
    AUIPC: 0x17,
    JAL: 0x6F,
    JALR: 0x67,
    BRANCH: 0x63,
    LOAD: 0x03,
    STORE: 0x23,
    IMM: 0x13,
    REG: 0x33,
    FENCE: 0x0F,
    SYSTEM: 0x73
};

// ============================================
// WASM MEMORY
// ============================================

export class WasmMemory {
    /**
     * @param {number} size - Memory size in bytes
     */
    constructor(size = MEMORY_SIZE) {
        this.size = size;
        this.pages = Math.ceil(size / PAGE_SIZE);

        // Create WebAssembly memory
        this.memory = new WebAssembly.Memory({
            initial: this.pages,
            maximum: this.pages * 4
        });

        // Views for different access widths
        this.u8 = new Uint8Array(this.memory.buffer);
        this.u16 = new Uint16Array(this.memory.buffer);
        this.u32 = new Uint32Array(this.memory.buffer);
        this.i32 = new Int32Array(this.memory.buffer);
        this.f32 = new Float32Array(this.memory.buffer);
        this.f64 = new Float64Array(this.memory.buffer);

        // Memory regions
        this.regions = {
            text: { start: 0x0, end: HEAP_START - 1 },
            heap: { start: HEAP_START, end: STACK_START - 1 },
            stack: { start: STACK_START, end: 0xFFFFFFFF }
        };
    }

    // ============================================
    // LOAD OPERATIONS
    // ============================================

    load8(addr) {
        return this.u8[addr];
    }

    load16(addr) {
        return this.u16[addr >> 1];
    }

    load32(addr) {
        return this.u32[addr >> 2];
    }

    load64(addr) {
        const low = this.u32[addr >> 2];
        const high = this.u32[(addr >> 2) + 1];
        return BigInt(low) | (BigInt(high) << 32n);
    }

    loadFloat(addr) {
        return this.f32[addr >> 2];
    }

    loadDouble(addr) {
        return this.f64[addr >> 3];
    }

    // ============================================
    // STORE OPERATIONS
    // ============================================

    store8(addr, value) {
        this.u8[addr] = value & 0xFF;
    }

    store16(addr, value) {
        this.u16[addr >> 1] = value & 0xFFFF;
    }

    store32(addr, value) {
        this.u32[addr >> 2] = value >>> 0;
    }

    store64(addr, value) {
        const v = BigInt(value);
        this.u32[addr >> 2] = Number(v & 0xFFFFFFFFn);
        this.u32[(addr >> 2) + 1] = Number((v >> 32n) & 0xFFFFFFFFn);
    }

    storeFloat(addr, value) {
        this.f32[addr >> 2] = value;
    }

    storeDouble(addr, value) {
        this.f64[addr >> 3] = value;
    }

    // ============================================
    // BLOCK OPERATIONS
    // ============================================

    loadBytes(addr, length) {
        return this.u8.slice(addr, addr + length);
    }

    storeBytes(addr, data) {
        for (let i = 0; i < data.length; i++) {
            this.u8[addr + i] = data[i];
        }
    }

    // ============================================
    // STRING OPERATIONS
    // ============================================

    loadString(addr, maxLen = 256) {
        const bytes = [];
        for (let i = 0; i < maxLen; i++) {
            const b = this.u8[addr + i];
            if (b === 0) break;
            bytes.push(b);
        }
        return new TextDecoder().decode(new Uint8Array(bytes));
    }

    storeString(addr, str) {
        const bytes = new TextEncoder().encode(str);
        this.storeBytes(addr, bytes);
        this.u8[addr + bytes.length] = 0;  // Null terminator
    }

    // ============================================
    // UTILITIES
    // ============================================

    grow(pages) {
        const result = this.memory.grow(pages);
        if (result === -1) {
            throw new Error('Failed to grow memory');
        }
        // Update views
        this.u8 = new Uint8Array(this.memory.buffer);
        this.u16 = new Uint16Array(this.memory.buffer);
        this.u32 = new Uint32Array(this.memory.buffer);
        this.i32 = new Int32Array(this.memory.buffer);
        this.f32 = new Float32Array(this.memory.buffer);
        this.f64 = new Float64Array(this.memory.buffer);
        return result;
    }

    dump(addr, length = 64) {
        const bytes = this.loadBytes(addr, length);
        const lines = [];
        for (let i = 0; i < bytes.length; i += 16) {
            const hex = Array.from(bytes.slice(i, i + 16))
                .map(b => b.toString(16).padStart(2, '0'))
                .join(' ');
            lines.push(`${(addr + i).toString(16).padStart(8, '0')}: ${hex}`);
        }
        return lines.join('\n');
    }
}

// ============================================
// RISC-V CPU EMULATOR
// ============================================

export class RiscVEmulator {
    /**
     * @param {WasmMemory} memory - Memory instance
     */
    constructor(memory) {
        this.memory = memory;

        // 32 general purpose registers (x0 always 0)
        this.regs = new Uint32Array(32);

        // Program counter
        this.pc = 0;

        // Control and Status Registers
        this.csrs = new Uint32Array(4096);

        // Execution state
        this.running = false;
        this.halted = false;
        this.cycles = 0;
        this.instructionsExecuted = 0;

        // Interrupts
        this.interrupts = [];
        this.interruptHandler = null;

        // I/O callbacks
        this.onOutput = null;
        this.onInput = null;
    }

    // ============================================
    // REGISTER ACCESS
    // ============================================

    getReg(r) {
        return r === 0 ? 0 : this.regs[r];
    }

    setReg(r, value) {
        if (r !== 0) {
            this.regs[r] = value >>> 0;
        }
    }

    // ============================================
    // INSTRUCTION FETCH
    // ============================================

    fetch32() {
        const instr = this.memory.load32(this.pc);
        return instr;
    }

    // ============================================
    // INSTRUCTION DECODE
    // ============================================

    decode(instr) {
        const opcode = instr & 0x7F;
        const rd = (instr >> 7) & 0x1F;
        const funct3 = (instr >> 12) & 0x07;
        const rs1 = (instr >> 15) & 0x1F;
        const rs2 = (instr >> 20) & 0x1F;
        const funct7 = (instr >> 25) & 0x7F;

        // Immediate formats
        const immI = this.signExtend((instr >> 20), 12);
        const immS = this.signExtend(
            ((instr >> 25) << 5) | ((instr >> 7) & 0x1F),
            12
        );
        const immB = this.signExtend(
            (((instr >> 31) & 1) << 12) |
            (((instr >> 7) & 1) << 11) |
            (((instr >> 25) & 0x3F) << 5) |
            (((instr >> 8) & 0x0F) << 1),
            13
        );
        const immU = instr & 0xFFFFF000;
        const immJ = this.signExtend(
            (((instr >> 31) & 1) << 20) |
            (((instr >> 12) & 0xFF) << 12) |
            (((instr >> 20) & 1) << 11) |
            (((instr >> 21) & 0x3FF) << 1),
            21
        );

        return { opcode, rd, funct3, funct7, rs1, rs2, immI, immS, immB, immU, immJ };
    }

    signExtend(value, bits) {
        const signBit = 1 << (bits - 1);
        if (value & signBit) {
            return value - (1 << bits);
        }
        return value;
    }

    // ============================================
    // INSTRUCTION EXECUTE
    // ============================================

    execute(decoded) {
        const { opcode, rd, funct3, funct7, rs1, rs2, immI, immS, immB, immU, immJ } = decoded;

        let nextPc = this.pc + 4;
        let branchTaken = false;

        switch (opcode) {
            case RV_OPCODES.LUI:
                this.setReg(rd, immU);
                break;

            case RV_OPCODES.AUIPC:
                this.setReg(rd, (this.pc + immI) >>> 0);
                break;

            case RV_OPCODES.JAL:
                this.setReg(rd, this.pc + 4);
                nextPc = (this.pc + immJ) >>> 0;
                break;

            case RV_OPCODES.JALR:
                const jalrTarget = (this.getReg(rs1) + immI) >>> 0;
                this.setReg(rd, this.pc + 4);
                nextPc = jalrTarget & ~1;
                break;

            case RV_OPCODES.BRANCH:
                const v1 = this.getReg(rs1);
                const v2 = this.getReg(rs2);
                let takeBranch = false;

                switch (funct3) {
                    case 0x0: takeBranch = v1 === v2; break;  // BEQ
                    case 0x1: takeBranch = v1 !== v2; break;  // BNE
                    case 0x4: takeBranch = v1 < v2; break;    // BLT
                    case 0x5: takeBranch = v1 >= v2; break;   // BGE
                    case 0x6: takeBranch = (v1 >>> 0) < (v2 >>> 0); break;  // BLTU
                    case 0x7: takeBranch = (v1 >>> 0) >= (v2 >>> 0); break; // BGEU
                }

                if (takeBranch) {
                    nextPc = (this.pc + immB) >>> 0;
                }
                break;

            case RV_OPCODES.LOAD:
                const loadAddr = (this.getReg(rs1) + immI) >>> 0;
                switch (funct3) {
                    case 0x0: this.setReg(rd, this.memory.load8(loadAddr)); break;   // LB
                    case 0x1: this.setReg(rd, this.memory.load16(loadAddr)); break;  // LH
                    case 0x2: this.setReg(rd, this.memory.load32(loadAddr)); break;  // LW
                    case 0x4: this.setReg(rd, this.signExtend(this.memory.load8(loadAddr), 8)); break;   // LBU
                    case 0x5: this.setReg(rd, this.signExtend(this.memory.load16(loadAddr), 16)); break; // LHU
                }
                break;

            case RV_OPCODES.STORE:
                const storeAddr = (this.getReg(rs1) + immS) >>> 0;
                switch (funct3) {
                    case 0x0: this.memory.store8(storeAddr, this.getReg(rs2)); break;   // SB
                    case 0x1: this.memory.store16(storeAddr, this.getReg(rs2)); break;  // SH
                    case 0x2: this.memory.store32(storeAddr, this.getReg(rs2)); break;  // SW
                }
                break;

            case RV_OPCODES.IMM:
                const immVal = this.getReg(rs1);
                switch (funct3) {
                    case 0x0: this.setReg(rd, immVal + immI); break;      // ADDI
                    case 0x2: this.setReg(rd, immVal < immI ? 1 : 0); break; // SLTI
                    case 0x3: this.setReg(rd, (immVal >>> 0) < (immI >>> 0) ? 1 : 0); break; // SLTIU
                    case 0x4: this.setReg(rd, immVal ^ immI); break;      // XORI
                    case 0x6: this.setReg(rd, immVal | immI); break;      // ORI
                    case 0x7: this.setReg(rd, immVal & immI); break;      // ANDI
                    case 0x1: this.setReg(rd, immVal << (immI & 0x1F)); break;  // SLLI
                    case 0x5:
                        if (funct7 & 0x20) {
                            this.setReg(rd, immVal >>> (immI & 0x1F));  // SRLI
                        } else {
                            this.setReg(rd, immVal >> (immI & 0x1F));   // SRAI
                        }
                        break;
                }
                break;

            case RV_OPCODES.REG:
                const regVal1 = this.getReg(rs1);
                const regVal2 = this.getReg(rs2);
                switch (funct3) {
                    case 0x0:
                        if (funct7 & 0x20) {
                            this.setReg(rd, regVal1 - regVal2);  // SUB
                        } else {
                            this.setReg(rd, regVal1 + regVal2);  // ADD
                        }
                        break;
                    case 0x1: this.setReg(rd, regVal1 << (regVal2 & 0x1F)); break;  // SLL
                    case 0x2: this.setReg(rd, regVal1 < regVal2 ? 1 : 0); break;   // SLT
                    case 0x3: this.setReg(rd, (regVal1 >>> 0) < (regVal2 >>> 0) ? 1 : 0); break; // SLTU
                    case 0x4: this.setReg(rd, regVal1 ^ regVal2); break;  // XOR
                    case 0x5:
                        if (funct7 & 0x20) {
                            this.setReg(rd, regVal1 >> (regVal2 & 0x1F));   // SRA
                        } else {
                            this.setReg(rd, regVal1 >>> (regVal2 & 0x1F));  // SRL
                        }
                        break;
                    case 0x6: this.setReg(rd, regVal1 | regVal2); break;  // OR
                    case 0x7: this.setReg(rd, regVal1 & regVal2); break;  // AND
                }
                break;

            case RV_OPCODES.SYSTEM:
                // ECALL, EBREAK
                if (immI === 0) {
                    // ECALL - system call
                    this.handleEcall();
                } else if (immI === 1) {
                    // EBREAK - breakpoint
                    this.halted = true;
                }
                break;

            default:
                console.warn(`Unknown opcode: 0x${opcode.toString(16)}`);
        }

        this.pc = nextPc;
        this.instructionsExecuted++;
    }

    handleEcall() {
        // System call handling
        const syscallNum = this.getReg(17);  // a7
        const a0 = this.getReg(10);
        const a1 = this.getReg(11);
        const a2 = this.getReg(12);

        switch (syscallNum) {
            case 64:  // write
                if (a0 === 1 || a0 === 2) {  // stdout or stderr
                    const str = this.memory.loadString(a1, a2);
                    if (this.onOutput) {
                        this.onOutput(str);
                    }
                }
                this.setReg(10, a2);  // Return bytes written
                break;

            case 93:  // exit
                this.halted = true;
                break;

            default:
                console.warn(`Unknown syscall: ${syscallNum}`);
        }
    }

    // ============================================
    // EXECUTION LOOP
    // ============================================

    step() {
        if (this.halted) return false;

        const instr = this.fetch32();
        const decoded = this.decode(instr);
        this.execute(decoded);

        return !this.halted;
    }

    run(maxCycles = 1000000) {
        this.running = true;
        this.cycles = 0;

        while (this.running && !this.halted && this.cycles < maxCycles) {
            this.step();
            this.cycles++;

            // Check for interrupts
            if (this.interrupts.length > 0 && this.interruptHandler) {
                this.interruptHandler(this.interrupts.shift());
            }
        }

        this.running = false;
        return this.instructionsExecuted;
    }

    reset() {
        this.regs.fill(0);
        this.pc = 0;
        this.csrs.fill(0);
        this.running = false;
        this.halted = false;
        this.cycles = 0;
        this.instructionsExecuted = 0;
        this.interrupts = [];
    }

    // ============================================
    // STATE
    // ============================================

    getState() {
        return {
            pc: this.pc,
            regs: Array.from(this.regs),
            running: this.running,
            halted: this.halted,
            cycles: this.cycles,
            instructionsExecuted: this.instructionsExecuted
        };
    }

    loadState(state) {
        this.pc = state.pc;
        for (let i = 0; i < 32; i++) {
            this.regs[i] = state.regs[i];
        }
        this.running = state.running;
        this.halted = state.halted;
        this.cycles = state.cycles;
        this.instructionsExecuted = state.instructionsExecuted;
    }
}

// ============================================
// CARTRIDGE LOADER
// ============================================

export class CartridgeLoader {
    /**
     * @param {RiscVEmulator} cpu - CPU instance
     */
    constructor(cpu) {
        this.cpu = cpu;
        this.memory = cpu.memory;
        this.cartridges = new Map();
    }

    /**
     * Load a binary cartridge (ELF, raw binary).
     * @param {string} name - Cartridge name
     * @param {ArrayBuffer} data - Binary data
     */
    async loadBinary(name, data) {
        const bytes = new Uint8Array(data);

        // Simple raw binary loader (assumes load at 0x0)
        this.memory.storeBytes(0, bytes);

        // Set up stack
        this.cpu.setReg(2, STACK_START);  // sp
        this.cpu.pc = 0;

        this.cartridges.set(name, {
            name,
            type: 'binary',
            size: bytes.length,
            entryPoint: 0
        });

        console.log(`[CartridgeLoader] Loaded '${name}': ${bytes.length} bytes`);
        return true;
    }

    /**
     * Load from URL.
     * @param {string} name - Cartridge name
     * @param {string} url - Binary URL
     */
    async loadFromUrl(name, url) {
        const response = await fetch(url);
        const data = await response.arrayBuffer();
        return this.loadBinary(name, data);
    }

    /**
     * Create a simple test cartridge.
     * @param {string} name - Cartridge name
     */
    createTestCartridge(name = 'test') {
        // Simple "Hello World" in RISC-V
        // This is a minimal program that writes "Hi" to stdout
        const program = [
            // li a7, 64 (ecall write)
            0x08800893,  // addi x17, x0, 64
            // li a0, 1 (stdout)
            0x00100513,  // addi x10, x0, 1
            // la a1, msg
            0x00001597,  // auipc x11, 0
            0x01058593,  // addi x11, x11, 16
            // li a2, 2 (length)
            0x00200613,  // addi x12, x0, 2
            // ecall
            0x00000073,  // ecall
            // li a7, 93 (exit)
            0x05d00893,  // addi x17, x0, 93
            // li a0, 0
            0x00000513,  // addi x10, x0, 0
            // ecall
            0x00000073,  // ecall
            // msg: "Hi\0"
            0x00006948   // "Hi" as little-endian
        ];

        for (let i = 0; i < program.length; i++) {
            this.memory.store32(i * 4, program[i]);
        }

        this.cpu.setReg(2, STACK_START);
        this.cpu.pc = 0;

        this.cartridges.set(name, {
            name,
            type: 'test',
            size: program.length * 4,
            entryPoint: 0
        });

        console.log(`[CartridgeLoader] Created test cartridge '${name}'`);
        return true;
    }

    listCartridges() {
        return Array.from(this.cartridges.values());
    }
}

// ============================================
// WASM HYPERVISOR
// ============================================

export class WasmHypervisor {
    /**
     * @param {Object} options - Configuration options
     */
    constructor(options = {}) {
        this.options = {
            memorySize: options.memorySize || MEMORY_SIZE,
            maxCycles: options.maxCycles || 10000000,
            ...options
        };

        // Components
        this.memory = new WasmMemory(this.options.memorySize);
        this.cpu = new RiscVEmulator(this.memory);
        this.loader = new CartridgeLoader(this.cpu);

        // State
        this.running = false;
        this.currentCartridge = null;

        // Output buffer
        this.outputBuffer = '';

        // Set up output callback
        this.cpu.onOutput = (str) => {
            this.outputBuffer += str;
            if (this.options.onOutput) {
                this.options.onOutput(str);
            }
        };
    }

    // ============================================
    // CARTRIDGE MANAGEMENT
    // ============================================

    async loadCartridge(name, source) {
        if (source instanceof ArrayBuffer) {
            return this.loader.loadBinary(name, source);
        } else if (typeof source === 'string' && source.startsWith('http')) {
            return this.loader.loadFromUrl(name, source);
        } else {
            throw new Error('Unknown cartridge source type');
        }
    }

    createTestCartridge(name = 'test') {
        return this.loader.createTestCartridge(name);
    }

    // ============================================
    // EXECUTION
    // ============================================

    start(cartridgeName) {
        this.currentCartridge = cartridgeName;
        this.running = true;
        this.outputBuffer = '';

        console.log(`[WasmHypervisor] Starting cartridge '${cartridgeName}'`);

        const result = this.cpu.run(this.options.maxCycles);

        this.running = false;
        return {
            cycles: this.cpu.cycles,
            instructions: this.cpu.instructionsExecuted,
            output: this.outputBuffer,
            halted: this.cpu.halted
        };
    }

    step() {
        return this.cpu.step();
    }

    pause() {
        this.running = false;
        this.cpu.running = false;
    }

    reset() {
        this.cpu.reset();
        this.running = false;
        this.currentCartridge = null;
        this.outputBuffer = '';
    }

    // ============================================
    // STATE
    // ============================================

    getState() {
        return {
            cpu: this.cpu.getState(),
            cartridge: this.currentCartridge,
            running: this.running,
            output: this.outputBuffer
        };
    }

    loadState(state) {
        this.cpu.loadState(state.cpu);
        this.currentCartridge = state.cartridge;
        this.running = state.running;
        this.outputBuffer = state.output || '';
    }

    // ============================================
    // DEBUGGING
    // ============================================

    dumpRegisters() {
        const regs = ['zero', 'ra', 'sp', 'gp', 'tp', 't0', 't1', 't2',
                      's0', 's1', 'a0', 'a1', 'a2', 'a3', 'a4', 'a5',
                      'a6', 'a7', 's2', 's3', 's4', 's5', 's6', 's7',
                      's8', 's9', 's10', 's11', 't3', 't4', 't5', 't6'];

        const lines = [];
        for (let i = 0; i < 32; i++) {
            lines.push(`${regs[i].padEnd(4)} (x${i.toString().padStart(2, '0')}): 0x${this.cpu.regs[i].toString(16).padStart(8, '0')}`);
        }
        lines.push(`pc:    0x${this.cpu.pc.toString(16).padStart(8, '0')}`);
        return lines.join('\n');
    }

    dumpMemory(addr, length = 64) {
        return this.memory.dump(addr, length);
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { WasmMemory, RiscVEmulator, CartridgeLoader, WasmHypervisor };
}
