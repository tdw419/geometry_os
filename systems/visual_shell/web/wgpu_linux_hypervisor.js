/**
 * Geometry OS: WGPU Linux Hypervisor
 *
 * Main orchestrator for running Linux in browser via WebGPU.
 */

import { GPUExecutionSystem } from './gpu_execution_system.js';
import { WGPUKernelLoader } from './wgpu_kernel_loader.js';
import { CanvasRenderer } from './display/canvas_renderer.js';
import { WGPUInputHandler } from './wgpu_input_handler.js';
import { DTBGenerator } from './dtb_generator.js';
import { SBIHandler } from './sbi_handler.js';

export class WGPULinuxHypervisor {
    constructor(options = {}) {
        this.options = {
            width: options.width || 1024,
            height: options.height || 1024,
            cyclesPerFrame: options.cyclesPerFrame || 100000,
            displayMode: options.displayMode || 'canvas',
            dictionary: options.dictionary || {},
            dtbAddr: options.dtbAddr || 0x04000000 // 64MB offset
        };

        this.device = null;
        this.gpuSystem = null;
        this.kernelLoader = null;
        this.display = null;
        this.inputHandler = null;
        this.dtbGenerator = new DTBGenerator();
        this.sbiHandler = new SBIHandler(this);

        this.kernelId = 'main';
        this.running = false;
        this.animationId = null;

        // Cache state for CPU inspection
        this.cachedState = null;
        
        // UART tracking
        this.lastUartHead = 0;

        // Cycle counter for timer
        this.cycleCount = 0n;
    }

    /**
     * Initialize WebGPU and all subsystems
     */
    async init() {
        // Get WebGPU adapter and device
        const adapter = await navigator.gpu.requestAdapter();
        if (!adapter) {
            throw new Error('WebGPU not supported');
        }

        this.device = await adapter.requestDevice();

        // Initialize GPU execution system
        this.gpuSystem = new GPUExecutionSystem(this.device, this.options.dictionary || {});
        await this.gpuSystem.initialize();

        // Initialize kernel loader
        this.kernelLoader = new WGPUKernelLoader(this.device);

        // Initialize display
        this.display = new CanvasRenderer(this.options.width, this.options.height);

        console.log('✅ WGPULinuxHypervisor initialized');
    }

    /**
     * Attach display to DOM element
     */
    attachTo(container) {
        this.display.attachTo(container);

        // Initialize input handler after canvas is in DOM
        const kernel = this.gpuSystem.kernels.get(this.kernelId);
        if (kernel) {
            this.inputHandler = new WGPUInputHandler(
                this.display.canvas,
                this.device,
                kernel.memoryBuffer,
                this.kernelId
            );

            // Wire character input to SBI
            this.inputHandler.onCharacter = (char) => {
                if (this.sbiHandler) {
                    this.sbiHandler.queueInput(char.charCodeAt(0));
                    console.log(`[Hypervisor] Queued input to SBI: '${char}' (0x${char.charCodeAt(0).toString(16)})`);
                }
            };
        }
    }

    /**
     * Load kernel from buffer
     */
    async loadKernel(buffer) {
        const kernelInfo = await this.kernelLoader.loadFromBuffer(buffer);

        // Deploy to GPU (creates memory buffer, state buffer, etc.)
        await this.gpuSystem.deploy(
            'data:text/plain,', // Empty expanded code, kernel goes in memory
            this.kernelId
        );

        // Write kernel to memory at 0x00000000
        const kernel = this.gpuSystem.kernels.get(this.kernelId);
        this.kernelLoader.writeToMemory(kernel.memoryBuffer, kernelInfo.data, 0);

        // Initialize input handler after deployment (needs memoryBuffer)
        if (this.display && this.display.canvas) {
            this.inputHandler = new WGPUInputHandler(
                this.display.canvas,
                this.device,
                kernel.memoryBuffer,
                this.kernelId
            );
        }

        // Setup DTB
        await this.setupDTB();

        // Setup syscall handler
        this._setupSyscallBridge();

        // Cache initial state
        this.cachedState = await this.gpuSystem.readState(this.kernelId);

        console.log(`✅ Kernel loaded: ${kernelInfo.size} bytes`);
    }

    /**
     * Load kernel from .rts.png URL
     */
    async loadKernelFromRTS(url) {
        // Fetch metadata first
        let metadata = null;
        try {
            const metaUrl = url.endsWith('.rts.png') ? url.replace('.rts.png', '.rts.meta.json') : url + '.meta.json';
            const metaResponse = await fetch(metaUrl);
            if (metaResponse.ok) {
                metadata = await metaResponse.json();
                console.log(`[Hypervisor] Loaded metadata from ${metaUrl}`);
            }
        } catch (e) {
            console.warn(`[Hypervisor] Could not load metadata for ${url}, assuming single blob`);
        }

        const kernelInfo = await this.kernelLoader.loadFromRTS(url, metadata);

        // Deploy to GPU
        await this.gpuSystem.deploy(
            'data:text/plain,',
            this.kernelId
        );

        // Write extracted kernel data to memory at 0x00000000
        const kernel = this.gpuSystem.kernels.get(this.kernelId);
        this.kernelLoader.writeToMemory(kernel.memoryBuffer, kernelInfo.data, 0);

        // Handle initrd if present in sections
        if (kernelInfo.sections && kernelInfo.sections.initrd) {
            const initrdAddr = 0x06000000; // 96MB
            this.kernelLoader.writeToMemory(kernel.memoryBuffer, kernelInfo.sections.initrd, initrdAddr);
            this.initrdInfo = {
                start: initrdAddr,
                end: initrdAddr + kernelInfo.sections.initrd.byteLength
            };
            console.log(`[Hypervisor] Initrd loaded at 0x${initrdAddr.toString(16)} (${kernelInfo.sections.initrd.byteLength} bytes)`);
        } else {
            this.initrdInfo = null;
        }

        // Initialize input handler
        if (this.display && this.display.canvas) {
            this.inputHandler = new WGPUInputHandler(
                this.display.canvas,
                this.device,
                kernel.memoryBuffer,
                this.kernelId
            );
        }

        // Setup DTB
        await this.setupDTB();

        // Setup syscall handler
        this._setupSyscallBridge();

        // Cache initial state
        this.cachedState = await this.gpuSystem.readState(this.kernelId);

        console.log(`✅ RTS kernel loaded into GPU heap: ${kernelInfo.size} bytes`);
    }

    /**
     * Get DTB information for verification
     */
    async getDTBInfo() {
        const kernel = this.gpuSystem.kernels.get(this.kernelId);
        if (!kernel) return null;

        // Read DTB header (40 bytes) from memory
        const headerData = await this.gpuSystem.readMemory(this.kernelId, this.options.dtbAddr, 40);
        if (!headerData) return null;

        const view = new DataView(headerData.buffer);
        return {
            magic: view.getUint32(0),
            size: view.getUint32(4),
            version: view.getUint32(20),
            address: this.options.dtbAddr
        };
    }

    /**
     * Setup Device Tree Blob
     */
    async setupDTB() {
        console.log('🌳 Generating Device Tree Blob...');
        const dtbData = this.dtbGenerator.generate({
            initrd: this.initrdInfo
        });
        
        const kernel = this.gpuSystem.kernels.get(this.kernelId);
        if (!kernel) return;

        // Write DTB to memory
        this.device.queue.writeBuffer(kernel.memoryBuffer, this.options.dtbAddr, dtbData);

        // Set a1 register to DTB address (RISC-V boot protocol)
        // a1 is register x11
        const a1Data = new Uint32Array([this.options.dtbAddr]);
        this.device.queue.writeBuffer(kernel.stateBuffer, 11 * 4, a1Data);

        console.log(`✅ DTB deployed at 0x${this.options.dtbAddr.toString(16)} (a1 set)`);
    }

    /**
     * Setup the syscall bridge between GPU and JS
     * @private
     */
    _setupSyscallBridge() {
        this.gpuSystem.handleSyscall = async (num, args) => {
            if (num === 64) { // sys_write
                const fd = args[0];
                const buf = args[1];
                const count = args[2];
                
                if (fd === 1 || fd === 2) { // stdout/stderr
                    const data = await this.gpuSystem.readMemory(this.kernelId, buf, count);
                    const text = new TextDecoder().decode(data);
                    if (this.onConsoleOutput) {
                        for (const char of text) {
                            this.onConsoleOutput(char);
                        }
                    }
                }
            } else if (num === 93) { // sys_exit
                console.log(`[Hypervisor] Kernel exited with code ${args[0]}`);
                this.stop();
            }
        };
    }

    /**
     * Execute N clock cycles
     */
    async tick(cycles = 1) {
        const startTime = performance.now();
        
        // The shader now executes 100 cycles per invocation
        // So we dispatch (cycles / 100) workgroups or invocations
        const actualCycles = Math.max(1, Math.floor(cycles / 100)) * 100;
        
        await this.gpuSystem.tick(this.kernelId, actualCycles);
        this.cycleCount += BigInt(actualCycles);

        // Calculate MIPS
        const endTime = performance.now();
        const duration = (endTime - startTime) / 1000; // seconds
        if (duration > 0) {
            this.mips = (actualCycles / duration) / 1000000;
        }

        // Check for syscalls triggered in this batch
        if (this.gpuSystem._checkSyscalls) {
            await this.gpuSystem._checkSyscalls(this.kernelId);
        }

        // Check for SBI calls
        await this._checkSBICalls();

        // Check timer interrupt
        await this._checkTimerInterrupt();

        // Check for UART output
        await this._checkUART();

        // Update cached state after tick
        this.cachedState = await this.gpuSystem.readState(this.kernelId);
    }

    /**
     * Check for new UART characters in GPU memory
     * @private
     */
    async _checkUART() {
        const UART_FIFO_BASE = 0x05000400;
        const UART_FIFO_PTR = 0x050004FC;

        // 1. Read the counter (head)
        const headData = await this.gpuSystem.readMemory(this.kernelId, UART_FIFO_PTR, 4);
        if (!headData) return;

        const head = new Uint32Array(headData.buffer)[0];

        if (head > this.lastUartHead) {
            const count = head - this.lastUartHead;

            // 2. Read the buffer (max 256 chars)
            const bufData = await this.gpuSystem.readMemory(this.kernelId, UART_FIFO_BASE, 256);
            if (!bufData) return;

            let output = '';
            for (let i = 0; i < Math.min(count, 256); i++) {
                const idx = (this.lastUartHead + i) % 256;
                output += String.fromCharCode(bufData[idx]);
            }

            if (this.onConsoleOutput && output) {
                this.onConsoleOutput(output);
            }

            this.lastUartHead = head;
        }
    }

    /**
     * Check for SBI calls from GPU
     * @private
     */
    async _checkSBICalls() {
        const SBI_BRIDGE_FLAG = 0x05010000;

        // Read the flag
        const flagData = await this.gpuSystem.readMemory(this.kernelId, SBI_BRIDGE_FLAG, 4);
        if (!flagData) return;

        const flag = new Uint32Array(flagData.buffer)[0];
        if (flag === 0) return; // No SBI call pending

        // Read the SBI request
        const reqData = await this.gpuSystem.readMemory(this.kernelId, SBI_BRIDGE_FLAG, 40);
        const view = new DataView(reqData.buffer);

        const eid = view.getUint32(4, true);
        const fid = view.getUint32(8, true);
        const args = [
            view.getUint32(12, true),
            view.getUint32(16, true),
            view.getUint32(20, true),
            view.getUint32(24, true),
            view.getUint32(28, true),
            view.getUint32(32, true)
        ];

        console.log(`[Hypervisor] SBI call: EID=0x${eid.toString(16)}, FID=0x${fid.toString(16)}`);

        // Handle the call
        const [error, value] = this.sbiHandler.handle(eid, fid, args);

        // Write return values
        const retData = new Uint32Array([error >>> 0, value]);
        const kernel = this.gpuSystem.kernels.get(this.kernelId);
        if (kernel) {
            this.device.queue.writeBuffer(kernel.memoryBuffer, 0x05010024, retData);
        }

        // Clear flag
        const clearFlag = new Uint32Array([0]);
        if (kernel) {
            this.device.queue.writeBuffer(kernel.memoryBuffer, SBI_BRIDGE_FLAG, clearFlag);
        }

        // Resume execution by updating PC from SEPC
        const state = await this.gpuSystem.readState(this.kernelId);
        if (state && state.sepc) {
            // Set return values in a0/a1
            const retRegs = new Uint32Array([error >>> 0, value]);
            this.device.queue.writeBuffer(kernel.stateBuffer, 10 * 4, retRegs);

            // Clear SCAUSE to indicate handled
            const clearCause = new Uint32Array([0]);
            this.device.queue.writeBuffer(kernel.stateBuffer, 41 * 4, clearCause);
        }
    }

    /**
     * Check for timer interrupt
     * @private
     */
    async _checkTimerInterrupt() {
        if (!this.sbiHandler.timerSet) return;

        const state = this.cachedState;
        if (!state) return;

        const currentTime = this.cycleCount;

        if (this.sbiHandler.checkTimerInterrupt(currentTime)) {
            console.log('[Hypervisor] Timer interrupt firing!');

            const kernel = this.gpuSystem.kernels.get(this.kernelId);
            if (kernel) {
                const sipSet = new Uint32Array([0x20]); // STIP bit
                this.device.queue.writeBuffer(kernel.stateBuffer, 45 * 4, sipSet);
            }
        }
    }

    /**
     * Get current CPU state
     */
    getState() {
        return this.cachedState || {
            registers: new Array(32).fill(0),
            pc: 0,
            halted: false,
            satp: 0,
            mode: 0
        };
    }

    /**
     * Read framebuffer and render
     */
    async render() {
        const fbData = await this.gpuSystem.readFramebuffer(this.kernelId);
        if (fbData) {
            this.display.render(fbData);
        }
    }

    /**
     * Start execution loop
     */
    start(cyclesPerFrame = this.options.cyclesPerFrame) {
        if (this.running) return;
        this.running = true;

        const loop = async () => {
            if (!this.running) return;

            // Execute cycles
            await this.tick(cyclesPerFrame);

            // Render framebuffer
            await this.render();

            // Schedule next frame
            this.animationId = requestAnimationFrame(loop);
        };

        loop();
    }

    /**
     * Stop execution loop
     */
    stop() {
        this.running = false;
        if (this.animationId) {
            cancelAnimationFrame(this.animationId);
            this.animationId = null;
        }
    }

    /**
     * Send input event
     */
    sendInput(event) {
        if (this.inputHandler) {
            this.inputHandler.focus();
        }
    }

    /**
     * Capture current screen
     */
    capture() {
        return this.display.capture();
    }

    /**
     * Setup MMU page tables (identity map first 16MB)
     */
    async setupMMU() {
        // Create identity page tables at 0x03000000 (48MB offset)
        // Map VA 0x00000000-0x00FFFFFF -> PA 0x00000000-0x00FFFFFF
        
        const kernel = this.gpuSystem.kernels.get(this.kernelId);
        if (!kernel) return;

        const PT_ADDR = 0x03000000;
        
        // Sv32 Level 1 Page Table (Root)
        // Each entry maps 4MB. We need 4 entries for 16MB.
        const l1Table = new Uint32Array(1024); // 4KB table
        
        for (let i = 0; i < 4; i++) {
            const ppn = (i * 0x400000) >> 12;
            // PTE format: [PPN:22][RSW:2][D:1][A:1][G:1][U:1][X:1][W:1][R:1][V:1]
            // V=1, R=1, W=1, X=1 (Leaf, Read/Write/Execute)
            l1Table[i] = (ppn << 10) | 0xCF; 
        }

        // Write page table to GPU memory
        this.device.queue.writeBuffer(kernel.memoryBuffer, PT_ADDR, l1Table);

        // Set satp to point to page tables (enable Sv32)
        const satp = (1 << 31) | (PT_ADDR >> 12); // Mode=1 (Sv32), PPN=PT_ADDR
        const satpData = new Uint32Array([satp]);
        this.device.queue.writeBuffer(kernel.stateBuffer, 34 * 4, satpData); // CSR_SATP

        console.log(`✅ MMU enabled (Sv32) with root PT at 0x${PT_ADDR.toString(16)}`);
    }

    /**
     * Inject keyboard input
     * @param {string} key - Key character
     * @param {boolean} pressed - Whether key is pressed
     */
    async injectKeyboard(key, pressed = true) {
        if (this.gpuSystem) {
            await this.gpuSystem.injectInput(this.kernelId, 'keyboard', {
                key,
                pressed
            });
        }
    }

    /**
     * Inject mouse input
     * @param {number} x - Mouse X position
     * @param {number} y - Mouse Y position
     * @param {number} buttons - Button state (bitmask)
     */
    async injectMouse(x, y, buttons = 0) {
        if (this.gpuSystem) {
            await this.gpuSystem.injectInput(this.kernelId, 'mouse', {
                x,
                y,
                buttons
            });
        }
    }
}

if (typeof window !== 'undefined') {
    window.WGPULinuxHypervisor = WGPULinuxHypervisor;
}
