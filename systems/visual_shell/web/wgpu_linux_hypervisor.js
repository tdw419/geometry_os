/**
 * Geometry OS: WGPU Linux Hypervisor
 *
 * Main orchestrator for running Linux in browser via WebGPU.
 */

import { GPUExecutionSystem } from './gpu_execution_system.js';
import { WGPUKernelLoader } from './wgpu_kernel_loader.js';
import { CanvasRenderer } from './display/canvas_renderer.js';
import { WGPUInputHandler } from './wgpu_input_handler.js';

export class WGPULinuxHypervisor {
    constructor(options = {}) {
        this.options = {
            width: options.width || 1024,
            height: options.height || 1024,
            cyclesPerFrame: options.cyclesPerFrame || 10000,
            displayMode: options.displayMode || 'canvas',
            dictionary: options.dictionary || {}
        };

        this.device = null;
        this.gpuSystem = null;
        this.kernelLoader = null;
        this.display = null;
        this.inputHandler = null;

        this.kernelId = 'main';
        this.running = false;
        this.animationId = null;

        // Cache state for CPU inspection
        this.cachedState = null;
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

        // Cache initial state
        this.cachedState = await this.gpuSystem.readState(this.kernelId);

        console.log(`✅ Kernel loaded: ${kernelInfo.size} bytes`);
    }

    /**
     * Load kernel from .rts.png URL
     */
    async loadKernelFromRTS(url) {
        const kernelInfo = await this.kernelLoader.loadFromRTS(url);

        await this.gpuSystem.deploy(
            'data:text/plain,',
            this.kernelId
        );

        // For RTS textures, we'd need to extract pixel data to memory
        // This is a placeholder for full implementation
        console.log(`✅ RTS kernel loaded: ${kernelInfo.size} bytes`);
    }

    /**
     * Execute N clock cycles
     */
    async tick(cycles = 1) {
        await this.gpuSystem.tick(this.kernelId, cycles);
        // Update cached state after tick
        this.cachedState = await this.gpuSystem.readState(this.kernelId);
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
        // Create identity page tables at 0x03000000
        // Map VA 0x00000000-0x00FFFFFF -> PA 0x00000000-0x00FFFFFF
        // This is a simplified setup for kernel running

        const kernel = this.gpuSystem.kernels.get(this.kernelId);
        if (!kernel) return;

        // Set satp to point to page tables (enable Sv32)
        const satp = (1 << 31) | (0x03000000 >> 12); // Mode=1, PPN=page table address
        const satpData = new Uint32Array([satp]);
        this.device.queue.writeBuffer(kernel.stateBuffer, 34 * 4, satpData); // CSR_SATP

        console.log('✅ MMU enabled');
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
