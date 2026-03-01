/**
 * Geometry OS: Core Execution Verifier
 *
 * Provides reliable async state readback from GPU execution.
 * Uses staging buffer pattern to avoid stale data reads.
 *
 * Phase 17-01: Verification harness foundation for all GPU execution testing.
 *
 * CRITICAL PATTERN (from executor.rs):
 * 1. Create staging buffer with MAP_READ | COPY_DST usage
 * 2. Copy from state buffer to staging buffer
 * 3. Submit command encoder
 * 4. AWAIT mapAsync(GPUMapMode.READ) before reading
 * 5. Return COPY of data (buffer will be unmapped)
 * 6. Destroy staging buffer to prevent leaks
 */

export class CoreExecutionVerifier {
    /**
     * @param {GPUDevice} device - WebGPU device instance
     */
    constructor(device) {
        this.device = device;

        // Constants matching visual_cpu_riscv.wgsl
        this.REGS_PER_CORE = 64;  // 32 general regs + CSRs + padding
        this.STATE_SIZE = this.REGS_PER_CORE * 4;  // 256 bytes per core

        // CSR indices (from shader)
        this.CSR_PC = 32;
        this.CSR_SATP = 34;
        this.CSR_STVEC = 35;
        this.CSR_SSCRATCH = 36;
        this.CSR_MODE = 37;
        this.CSR_HALT = 38;
        this.CSR_RESERVATION = 39;
        this.CSR_SEPC = 40;
        this.CSR_SCAUSE = 41;
        this.CSR_STVAL = 42;
        this.CSR_SSTATUS = 43;
        this.CSR_SIE = 44;
        this.CSR_SIP = 45;
        this.CSR_GUEST_BASE = 46;
        this.CSR_GUEST_SIZE = 47;
        this.CSR_GEOM_CACHE = 48;
        this.CSR_TRANS_FLAGS = 49;
    }

    /**
     * Read CPU state from GPU buffer (registers, PC, halted flag, CSRs)
     *
     * @param {GPUBuffer} stateBuffer - GPU buffer containing CPU state
     * @param {number} size - Number of bytes to read (default: 256 for one core)
     * @returns {Promise<Object>} State object with registers, pc, halted, and CSRs
     */
    async readState(stateBuffer, size = this.STATE_SIZE) {
        // Step 1: Create staging buffer with MAP_READ | COPY_DST
        const stagingBuffer = this.device.createBuffer({
            size: size,
            usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST,
            label: 'CoreExecutionVerifier-staging-state'
        });

        try {
            // Step 2: Copy from state buffer to staging buffer
            const commandEncoder = this.device.createCommandEncoder();
            commandEncoder.copyBufferToBuffer(stateBuffer, 0, stagingBuffer, 0, size);

            // Step 3: Submit command encoder
            this.device.queue.submit([commandEncoder.finish()]);

            // Step 4: AWAIT mapAsync before reading (CRITICAL!)
            await stagingBuffer.mapAsync(GPUMapMode.READ);

            // Step 5: Return COPY of data (buffer will be unmapped)
            const mappedRange = stagingBuffer.getMappedRange();
            const rawData = new Uint32Array(mappedRange);

            // Make a COPY - the buffer will be invalidated after unmap
            const data = new Uint32Array(rawData.length);
            data.set(rawData);

            // Unmap before destroy
            stagingBuffer.unmap();

            // Parse into structured state
            return this._parseState(data);
        } finally {
            // Step 6: Destroy staging buffer to prevent leaks
            stagingBuffer.destroy();
        }
    }

    /**
     * Read arbitrary GPU memory region
     *
     * @param {GPUBuffer} memoryBuffer - GPU buffer containing system memory
     * @param {number} offset - Byte offset into memory buffer
     * @param {number} size - Number of bytes to read
     * @returns {Promise<Uint8Array>} Copy of memory contents
     */
    async readMemory(memoryBuffer, offset, size) {
        // Step 1: Create staging buffer
        const stagingBuffer = this.device.createBuffer({
            size: size,
            usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST,
            label: 'CoreExecutionVerifier-staging-memory'
        });

        try {
            // Step 2: Copy from memory buffer to staging buffer
            const commandEncoder = this.device.createCommandEncoder();
            commandEncoder.copyBufferToBuffer(memoryBuffer, offset, stagingBuffer, 0, size);

            // Step 3: Submit command encoder
            this.device.queue.submit([commandEncoder.finish()]);

            // Step 4: AWAIT mapAsync before reading
            await stagingBuffer.mapAsync(GPUMapMode.READ);

            // Step 5: Return COPY of data
            const mappedRange = stagingBuffer.getMappedRange();
            const rawData = new Uint8Array(mappedRange);

            // Make a COPY
            const data = new Uint8Array(rawData.length);
            data.set(rawData);

            stagingBuffer.unmap();

            return data;
        } finally {
            // Step 6: Destroy staging buffer
            stagingBuffer.destroy();
        }
    }

    /**
     * Write to GPU memory (for test setup)
     *
     * @param {GPUBuffer} memoryBuffer - GPU buffer to write to
     * @param {number} offset - Byte offset into memory buffer
     * @param {ArrayBuffer|Uint8Array} data - Data to write
     * @returns {Promise<void>}
     */
    async writeMemory(memoryBuffer, offset, data) {
        const bytes = data instanceof Uint8Array ? data : new Uint8Array(data);

        // Write directly via queue (no staging buffer needed for writes)
        this.device.queue.writeBuffer(memoryBuffer, offset, bytes);
    }

    /**
     * Create test buffers for a given instruction array
     *
     * @param {Uint32Array} code - RISC-V instruction words
     * @param {number} memorySize - Size of system memory (default: 64MB)
     * @returns {Object} Object with codeBuffer, memoryBuffer, stateBuffer
     */
    createTestBuffers(code, memorySize = 64 * 1024 * 1024) {
        // Code buffer: read-only storage for instructions
        const codeBuffer = this.device.createBuffer({
            size: Math.max(code.byteLength, 4096),
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
            mappedAtCreation: true,
            label: 'CoreExecutionVerifier-code'
        });
        new Uint32Array(codeBuffer.getMappedRange()).set(code);
        codeBuffer.unmap();

        // Memory buffer: read-write storage for system memory
        const memoryBuffer = this.device.createBuffer({
            size: memorySize,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST,
            label: 'CoreExecutionVerifier-memory'
        });

        // State buffer: read-write storage for CPU state
        // Must have MAP_READ for direct access OR we use staging buffer
        const stateBuffer = this.device.createBuffer({
            size: this.STATE_SIZE,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST,
            label: 'CoreExecutionVerifier-state'
        });

        return {
            codeBuffer,
            memoryBuffer,
            stateBuffer
        };
    }

    /**
     * Parse raw state buffer into structured object
     *
     * @param {Uint32Array} data - Raw state data (64 u32 values)
     * @returns {Object} Structured state
     */
    _parseState(data) {
        // Extract general purpose registers (x0-x31)
        const registers = Array.from(data.slice(0, 32));

        // Extract CSRs
        const pc = data[this.CSR_PC];
        const halted = data[this.CSR_HALT] > 0;
        const satp = data[this.CSR_SATP];
        const stvec = data[this.CSR_STVEC];
        const sscratch = data[this.CSR_SSCRATCH];
        const mode = data[this.CSR_MODE];
        const sepc = data[this.CSR_SEPC];
        const scause = data[this.CSR_SCAUSE];
        const stval = data[this.CSR_STVAL];
        const sstatus = data[this.CSR_SSTATUS];
        const sie = data[this.CSR_SIE];
        const sip = data[this.CSR_SIP];
        const guestBase = data[this.CSR_GUEST_BASE];
        const guestSize = data[this.CSR_GUEST_SIZE];

        return {
            // General purpose registers
            registers,
            x0: 0,  // Always zero per RISC-V spec
            ra: registers[1],
            sp: registers[2],
            gp: registers[3],
            tp: registers[4],
            t0: registers[5],
            t1: registers[6],
            t2: registers[7],
            s0: registers[8],
            fp: registers[8],  // Alias
            s1: registers[9],
            a0: registers[10],
            a1: registers[11],
            a2: registers[12],
            a3: registers[13],
            a4: registers[14],
            a5: registers[15],
            a6: registers[16],
            a7: registers[17],
            s2: registers[18],
            s3: registers[19],
            s4: registers[20],
            s5: registers[21],
            s6: registers[22],
            s7: registers[23],
            s8: registers[24],
            s9: registers[25],
            s10: registers[26],
            s11: registers[27],
            t3: registers[28],
            t4: registers[29],
            t5: registers[30],
            t6: registers[31],

            // Program counter (instruction index, not byte address)
            pc,

            // Halted flag
            halted,

            // Control and Status Registers
            satp,
            stvec,
            sscratch,
            mode,  // 0=user, 1=supervisor
            sepc,
            scause,
            stval,
            sstatus,
            sie,
            sip,

            // Tectonic extensions
            guestBase,
            guestSize,

            // Raw access
            raw: data
        };
    }

    /**
     * Verify state readback returns expected values
     * Helper for testing
     *
     * @param {Object} state - State object from readState
     * @param {Object} expected - Expected values (partial match)
     * @returns {Object} Result with pass/fail and details
     */
    verifyState(state, expected) {
        const mismatches = [];

        if (expected.registers) {
            for (let i = 0; i < expected.registers.length; i++) {
                if (expected.registers[i] !== undefined &&
                    state.registers[i] !== expected.registers[i]) {
                    mismatches.push({
                        field: `registers[${i}]`,
                        expected: expected.registers[i],
                        actual: state.registers[i]
                    });
                }
            }
        }

        if (expected.pc !== undefined && state.pc !== expected.pc) {
            mismatches.push({
                field: 'pc',
                expected: expected.pc,
                actual: state.pc
            });
        }

        if (expected.halted !== undefined && state.halted !== expected.halted) {
            mismatches.push({
                field: 'halted',
                expected: expected.halted,
                actual: state.halted
            });
        }

        return {
            pass: mismatches.length === 0,
            mismatches,
            state
        };
    }
}

// Export for both module and global scope
if (typeof window !== 'undefined') {
    window.CoreExecutionVerifier = CoreExecutionVerifier;
}
