/**
 * Geometry OS: SBI (Supervisor Binary Interface) Handler
 *
 * Implements RISC-V SBI v2.0 for kernel-to-hypervisor communication.
 * Handles timer, console, and system control functions.
 */

export class SBIHandler {
    constructor(hypervisor) {
        this.hypervisor = hypervisor;

        // Timer state
        this.timerValue = BigInt(0);
        this.timerSet = false;

        // Performance counter (for time simulation)
        this.cyclesPerMicrosecond = 1000n; // Adjust based on execution speed

        // Registered extensions
        this.extensions = new Map([
            [0x00, this._handleTimer.bind(this)],
            [0x01, this._handleConsole.bind(this)],
            [0x08, this._handleSystemReset.bind(this)],
            [0x10, this._handleBase.bind(this)]
        ]);

        // Callbacks
        this.onConsoleOutput = null;
        this.onShutdown = null;
        this.onReboot = null;
    }

    /**
     * Handle an SBI call
     * @param {number} eid - Extension ID
     * @param {number} fid - Function ID
     * @param {number[]} args - Arguments [a0, a1, a2, a3, a4, a5]
     * @returns {[number, number]} - [error_code, return_value]
     */
    handle(eid, fid, args) {
        const handler = this.extensions.get(eid);
        if (!handler) {
            console.warn(`[SBI] Unknown extension: 0x${eid.toString(16)}`);
            return [this.SBI_ERR_NOT_SUPPORTED, 0];
        }
        return handler(fid, args);
    }

    /**
     * Handle Timer extension (EID 0x00)
     * @private
     */
    _handleTimer(fid, args) {
        switch (fid) {
            case 0x00: { // sbi_set_timer
                // args[0] is the next timer event time (64-bit, in stime_value)
                // In RISC-V, this sets the timer comparison value
                this.timerValue = BigInt(args[0]) | (BigInt(args[1] || 0) << 32n);
                this.timerSet = true;
                console.log(`[SBI] Timer set to ${this.timerValue}`);
                return [this.SBI_SUCCESS, 0];
            }
            case 0x01: { // sbi_get_timer (legacy, not in v2.0 but useful)
                const low = Number(this.timerValue & 0xFFFFFFFFn);
                return [this.SBI_SUCCESS, low];
            }
            default:
                return [this.SBI_ERR_NOT_SUPPORTED, 0];
        }
    }

    /**
     * Handle Console extension (EID 0x01)
     * @private
     */
    _handleConsole(fid, args) {
        switch (fid) {
            case 0x00: { // sbi_console_putchar
                const ch = args[0] & 0xFF;
                const char = String.fromCharCode(ch);
                if (this.onConsoleOutput) {
                    this.onConsoleOutput(char);
                }
                return [this.SBI_SUCCESS, 0];
            }
            case 0x01: { // sbi_console_getchar
                // Check if we have input queued
                // For now, return -1 (no character available)
                // Input will come from WGPUInputHandler
                if (this._inputQueue && this._inputQueue.length > 0) {
                    return [this.SBI_SUCCESS, this._inputQueue.shift()];
                }
                return [this.SBI_SUCCESS, 0xFFFFFFFF]; // -1 = no char
            }
            default:
                return [this.SBI_ERR_NOT_SUPPORTED, 0];
        }
    }

    /**
     * Handle System Reset extension (EID 0x08)
     * @private
     */
    _handleSystemReset(fid, args) {
        switch (fid) {
            case 0x00: { // sbi_system_reset
                const resetType = args[0];
                const resetReason = args[1];

                // Reset types: 0=shutdown, 1=cold reboot, 2=warm reboot
                if (resetType === 0) {
                    console.log(`[SBI] System shutdown requested (reason: ${resetReason})`);
                    if (this.onShutdown) this.onShutdown(resetReason);
                } else {
                    console.log(`[SBI] System reboot requested (type: ${resetType}, reason: ${resetReason})`);
                    if (this.onReboot) this.onReboot(resetType, resetReason);
                }
                return [this.SBI_SUCCESS, 0];
            }
            default:
                return [this.SBI_ERR_NOT_SUPPORTED, 0];
        }
    }

    /**
     * Handle Base extension (EID 0x10)
     * @private
     */
    _handleBase(fid, args) {
        switch (fid) {
            case 0x00: // sbi_get_spec_version
                return [this.SBI_SUCCESS, 0x20000000]; // v2.0
            case 0x01: // sbi_get_impl_id
                return [this.SBI_SUCCESS, 0x47454F53]; // "GEOS" in hex
            case 0x02: // sbi_get_impl_version
                return [this.SBI_SUCCESS, 0x00010000]; // v1.0
            case 0x03: // sbi_probe_extension
                const eid = args[0];
                const supported = this.extensions.has(eid) ? 1 : 0;
                return [this.SBI_SUCCESS, supported];
            case 0x04: // sbi_get_mvendorid
                return [this.SBI_SUCCESS, 0];
            case 0x05: // sbi_get_marchid
                return [this.SBI_SUCCESS, 0x47455055]; // "GEPU"
            case 0x06: // sbi_get_mimpid
                return [this.SBI_SUCCESS, 0x0001];
            default:
                return [this.SBI_ERR_NOT_SUPPORTED, 0];
        }
    }

    /**
     * Check if timer interrupt should fire
     * @param {bigint} currentTime - Current time in stime units
     * @returns {boolean} - True if timer interrupt pending
     */
    checkTimerInterrupt(currentTime) {
        if (!this.timerSet) return false;
        if (currentTime >= this.timerValue) {
            this.timerSet = false;
            return true;
        }
        return false;
    }

    /**
     * Queue input character for getchar
     * @param {number} charCode - Character code to queue
     */
    queueInput(charCode) {
        if (!this._inputQueue) this._inputQueue = [];
        this._inputQueue.push(charCode);
    }

    // SBI error codes
    get SBI_SUCCESS() { return 0; }
    get SBI_ERR_FAILED() { return -1; }
    get SBI_ERR_NOT_SUPPORTED() { return -2; }
    get SBI_ERR_INVALID_PARAM() { return -3; }
}

if (typeof window !== 'undefined') {
    window.SBIHandler = SBIHandler;
}
