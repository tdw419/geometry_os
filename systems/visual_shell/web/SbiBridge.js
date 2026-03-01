/**
 * Geometry OS: SBI Bridge Handler
 *
 * Handles SBI (Supervisor Binary Interface) calls from the GPU shader.
 * Reads from the SBI_BRIDGE memory region (0x05010000) after ECALL.
 *
 * Phase 18-01: Foundation for privileged mode support.
 *
 * SBI Register Conventions (per SBI specification):
 * - a7 (x17) = EID (Extension ID)
 * - a6 (x16) = FID (Function ID)
 * - a0-a5 (x10-x15) = Arguments
 * - a0 = Return error code (SBI_SUCCESS = 0, SBI_ERR_FAILURE = -1, etc.)
 * - a1 = Return value
 *
 * Memory Layout (from visual_cpu_riscv.wgsl):
 * - SBI_BRIDGE_FLAG: 0x05010000 - Flag to signal JS (1 = pending call)
 * - SBI_BRIDGE_EID:  0x05010004 - Extension ID
 * - SBI_BRIDGE_FID:  0x05010008 - Function ID
 * - SBI_BRIDGE_ARGS: 0x0501000C - 6 args = 24 bytes
 * - SBI_BRIDGE_RET:  0x05010024 - 2 returns = 8 bytes
 */

export class SbiBridge {
    /**
     * @param {GPUDevice} device - WebGPU device instance
     * @param {GPUBuffer} memoryBuffer - System memory buffer (64MB+)
     */
    constructor(device, memoryBuffer) {
        this.device = device;
        this.memoryBuffer = memoryBuffer;

        // Memory offsets (byte addresses, matching shader)
        this.SBI_BRIDGE_FLAG = 0x05010000;
        this.SBI_BRIDGE_EID  = 0x05010004;
        this.SBI_BRIDGE_FID  = 0x05010008;
        this.SBI_BRIDGE_ARGS = 0x0501000C;  // 6 args, 24 bytes
        this.SBI_BRIDGE_RET  = 0x05010024;  // 2 returns, 8 bytes

        // SBI Extension IDs
        this.SBI_EID_TIMER       = 0x00;  // Timer extension
        this.SBI_EID_CONSOLE     = 0x01;  // Console extension (legacy)
        this.SBI_EID_SRST        = 0x08;  // System Reset extension
        this.SBI_EID_BASE        = 0x10;  // Base extension

        // SBI Error codes
        this.SBI_SUCCESS         = 0;
        this.SBI_ERR_FAILURE     = -1;
        this.SBI_ERR_NOT_SUPPORTED = -2;
        this.SBI_ERR_INVALID_PARAM = -3;
        this.SBI_ERR_DENIED      = -4;
        this.SBI_ERR_INVALID_ADDRESS = -5;

        // Implementation info
        this.SBI_SPEC_VERSION    = 0x01000000;  // v1.0.0
        this.SBI_IMPL_ID         = 0x474F5300;  // "GOS\0" - Geometry OS
        this.SBI_IMPL_VERSION    = 0x00010000;  // v1.0.0

        // Console output buffer (for debugging)
        this.consoleBuffer = [];
    }

    /**
     * Poll for pending SBI call
     * Checks if SBI_BRIDGE_FLAG is set
     *
     * @returns {Promise<boolean>} True if SBI call is pending
     */
    async poll() {
        const flagData = await this._readMemory(this.SBI_BRIDGE_FLAG, 4);
        const flag = new Uint32Array(flagData)[0];
        return flag !== 0;
    }

    /**
     * Handle pending SBI call
     * Reads EID/FID/args, processes call, writes results
     *
     * @returns {Promise<Object>} Call details for logging/debugging
     */
    async handleCall() {
        // Read SBI call parameters (36 bytes total: 4 EID + 4 FID + 24 args)
        const paramData = await this._readMemory(this.SBI_BRIDGE_EID, 32);
        const params = new Uint32Array(paramData);

        const eid = params[0];
        const fid = params[1];
        const args = [
            params[2],  // a0
            params[3],  // a1
            params[4],  // a2
            params[5],  // a3
            params[6],  // a4
            params[7]   // a5
        ];

        // Process the call
        const result = this._processCall(eid, fid, args);

        // Write return values (error code + value)
        const retData = new Uint32Array([result.error, result.value]);
        this._writeMemory(this.SBI_BRIDGE_RET, retData.buffer);

        // Clear the flag to signal completion
        this._writeMemory(this.SBI_BRIDGE_FLAG, new Uint32Array([0]).buffer);

        return {
            eid,
            fid,
            args,
            result
        };
    }

    /**
     * Process an SBI call by extension
     *
     * @param {number} eid - Extension ID
     * @param {number} fid - Function ID
     * @param {number[]} args - Arguments
     * @returns {Object} { error, value }
     */
    _processCall(eid, fid, args) {
        switch (eid) {
            case this.SBI_EID_CONSOLE:
                return this._handleConsole(fid, args);

            case this.SBI_EID_SRST:
                return this._handleSystemReset(fid, args);

            case this.SBI_EID_BASE:
                return this._handleBase(fid, args);

            case this.SBI_EID_TIMER:
                // Timer extension - not fully implemented yet
                return { error: this.SBI_ERR_NOT_SUPPORTED, value: 0 };

            default:
                console.warn(`[SbiBridge] Unknown EID: 0x${eid.toString(16).padStart(2, '0')}`);
                return { error: this.SBI_ERR_NOT_SUPPORTED, value: 0 };
        }
    }

    /**
     * Handle Console extension (EID 0x01)
     * Legacy console I/O
     *
     * @param {number} fid - Function ID
     * @param {number[]} args - Arguments
     * @returns {Object} { error, value }
     */
    _handleConsole(fid, args) {
        switch (fid) {
            case 0x00: {  // putchar
                const ch = args[0] & 0xFF;
                const charStr = String.fromCharCode(ch);
                this.consoleBuffer.push(charStr);

                // Log to browser console for debugging
                // Newline flushes the buffer
                if (ch === 10) {  // '\n'
                    console.log(`[SBI Console] ${this.consoleBuffer.join('')}`);
                    this.consoleBuffer = [];
                }

                return { error: this.SBI_SUCCESS, value: ch };
            }

            case 0x01: {  // getchar
                // Not implemented - would need input queue
                return { error: this.SBI_ERR_NOT_SUPPORTED, value: -1 };
            }

            default:
                return { error: this.SBI_ERR_NOT_SUPPORTED, value: 0 };
        }
    }

    /**
     * Handle System Reset extension (EID 0x08)
     *
     * @param {number} fid - Function ID
     * @param {number[]} args - Arguments
     * @returns {Object} { error, value }
     */
    _handleSystemReset(fid, args) {
        switch (fid) {
            case 0x00: {  // system_reset
                const resetType = args[0];
                const resetReason = args[1];

                // Log the reset request (we don't actually reset the browser)
                console.log(`[SbiBridge] System reset requested: type=${resetType}, reason=${resetReason}`);

                // 0 = shutdown, 1 = cold reboot, 2 = warm reboot
                if (resetType === 0) {
                    console.log('[SbiBridge] Shutdown requested - GPU execution should halt');
                } else {
                    console.log('[SbiBridge] Reboot requested - would reset VM state');
                }

                // Return success but don't actually reset
                // The shader will see this and can halt execution
                return { error: this.SBI_SUCCESS, value: 0 };
            }

            default:
                return { error: this.SBI_ERR_NOT_SUPPORTED, value: 0 };
        }
    }

    /**
     * Handle Base extension (EID 0x10)
     * Provides SBI implementation information
     *
     * @param {number} fid - Function ID
     * @param {number[]} args - Arguments
     * @returns {Object} { error, value }
     */
    _handleBase(fid, args) {
        switch (fid) {
            case 0x00:  // get_sbi_spec_version
                return { error: this.SBI_SUCCESS, value: this.SBI_SPEC_VERSION };

            case 0x01:  // get_sbi_impl_id
                return { error: this.SBI_SUCCESS, value: this.SBI_IMPL_ID };

            case 0x02:  // get_sbi_impl_version
                return { error: this.SBI_SUCCESS, value: this.SBI_IMPL_VERSION };

            case 0x03: {  // probe_extension
                const probeEid = args[0];
                // Return 1 if extension is implemented, 0 otherwise
                const implemented = [
                    this.SBI_EID_TIMER,
                    this.SBI_EID_CONSOLE,
                    this.SBI_EID_SRST,
                    this.SBI_EID_BASE
                ].includes(probeEid) ? 1 : 0;
                return { error: this.SBI_SUCCESS, value: implemented };
            }

            case 0x04:  // get_mvendorid
                // Machine vendor ID - 0 for software emulation
                return { error: this.SBI_SUCCESS, value: 0 };

            case 0x05:  // get_marchid
                // Machine architecture ID - 0 for software emulation
                return { error: this.SBI_SUCCESS, value: 0 };

            case 0x06:  // get_mimpid
                // Machine implementation ID - 0 for software emulation
                return { error: this.SBI_SUCCESS, value: 0 };

            default:
                return { error: this.SBI_ERR_NOT_SUPPORTED, value: 0 };
        }
    }

    /**
     * Read from GPU memory using staging buffer pattern
     *
     * @param {number} offset - Byte offset
     * @param {number} size - Bytes to read
     * @returns {Promise<ArrayBuffer>} Data copy
     */
    async _readMemory(offset, size) {
        const stagingBuffer = this.device.createBuffer({
            size: size,
            usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST,
            label: 'SbiBridge-staging-read'
        });

        try {
            const commandEncoder = this.device.createCommandEncoder();
            commandEncoder.copyBufferToBuffer(this.memoryBuffer, offset, stagingBuffer, 0, size);
            this.device.queue.submit([commandEncoder.finish()]);

            await stagingBuffer.mapAsync(GPUMapMode.READ);

            const mappedRange = stagingBuffer.getMappedRange();
            const rawData = new Uint8Array(mappedRange);

            // Make a COPY
            const data = new Uint8Array(rawData.length);
            data.set(rawData);

            stagingBuffer.unmap();

            return data.buffer;
        } finally {
            stagingBuffer.destroy();
        }
    }

    /**
     * Write to GPU memory via queue
     *
     * @param {number} offset - Byte offset
     * @param {ArrayBuffer} data - Data to write
     */
    _writeMemory(offset, data) {
        const bytes = new Uint8Array(data);
        this.device.queue.writeBuffer(this.memoryBuffer, offset, bytes);
    }

    /**
     * Get accumulated console output
     *
     * @returns {string} Console output buffer
     */
    getConsoleOutput() {
        return this.consoleBuffer.join('');
    }

    /**
     * Clear console buffer
     */
    clearConsole() {
        this.consoleBuffer = [];
    }
}

// Export for both module and global scope
if (typeof window !== 'undefined') {
    window.SbiBridge = SbiBridge;
}
