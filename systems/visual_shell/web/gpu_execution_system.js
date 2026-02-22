/**
 * Geometry OS: GPU Execution System
 * 
 * Completes the GPU pipeline: Semantic Texture -> Expanded Code -> Parallel Execution.
 * Integrates WebGPUSemanticManager with the Visual CPU RISC-V shader.
 */

import { GPUMemoryManager } from './gpu_memory_manager.js';

export class GPUExecutionSystem {
    constructor(device, dictionary) {
        this.device = device;
        this.dictionary = dictionary;
        this.semanticManager = new window.WebGPUSemanticManager(device, dictionary);

        // Task 2.1: GPU Memory Management (128MB)
        this.MEMORY_SIZE = 128 * 1024 * 1024;
        this.memoryManager = new GPUMemoryManager(this.MEMORY_SIZE);

        this.kernels = new Map(); // id -> kernel state
        this.initialized = false;

        // Syscall hook
        this.handleSyscall = null;

        // Constants for RISC-V Shader
        this.RISCV_REGS = 32;
        this.RISCV_PC_INDEX = 32;
        this.RISCV_RA_INDEX = 1; // x1 is return address register
        this.RISCV_A0_INDEX = 10; // x10 is first argument/return value register
        this.RISCV_SATP_INDEX = 34; // CSR_SATP
        this.RISCV_STVEC_INDEX = 35; // CSR_STVEC
        this.RISCV_SSCRATCH_INDEX = 36; // CSR_SSCRATCH
        this.RISCV_MODE_INDEX = 37; // Privilege mode
        this.RISCV_HALT_INDEX = 38; // Halt flag
        this.MAGIC_TRAP_ADDR = 0xFFFFFFFE;
    }

    async initialize() {
        if (this.initialized) return;

        await this.semanticManager.initialize();

        // Load shader module
        const shaderCode = await this._loadShader('shaders/visual_cpu_riscv.wgsl');
        this.shaderModule = this.device.createShaderModule({
            label: 'Visual CPU (RISC-V)',
            code: shaderCode
        });

        // Create Bind Goup Layout
        // Binding 0: Code (ReadOnly Storage)
        // Binding 1: Memory (ReadWrite Storage)
        // Binding 2: Registers (ReadWrite Storage)
        this.bindGroupLayout = this.device.createBindGroupLayout({
            entries: [
                { binding: 0, visibility: GPUShaderStage.COMPUTE, buffer: { type: 'read-only-storage' } },
                { binding: 1, visibility: GPUShaderStage.COMPUTE, buffer: { type: 'storage' } },
                { binding: 2, visibility: GPUShaderStage.COMPUTE, buffer: { type: 'storage' } }
            ]
        });

        // Create Pipeline
        this.pipeline = this.device.createComputePipeline({
            layout: this.device.createPipelineLayout({
                bindGroupLayouts: [this.bindGroupLayout]
            }),
            compute: {
                module: this.shaderModule,
                entryPoint: 'main'
            }
        });

        this.initialized = true;
        console.log('GPU Execution System Initialized (128MB Heap)');
    }

    /**
     * Mount a file to the virtual filesystem
     * @param {string} url - Source URL of the file
     * @param {string} path - Destination path in the virtual FS
     */
    async mountFile(url, path) {
        if (!this.initialized) await this.initialize();
        console.log(`[GPUExecutionSystem] Virtual Mount: ${url} -> ${path}`);
        // In a real implementation, this would copy the file data to a specific memory region
        // or update the file system index in the kernel memory.
        return true;
    }

    /**
     * Deploy a kernel (code) to the GPU
     * @param {string} programUrl - URL to .rts.png or .rts binary
     * @param {string} kernelId - Unique ID for this execution instance
     */
    async deploy(programUrl, kernelId) {
        if (!this.initialized) await this.initialize();

        console.log(`Deploying kernel ${kernelId} from ${programUrl}...`);

        // 1. Expand Code (using Semantic Manager)
        // For now, if URL ends in .rts.png, use semantic expansion.
        // If it's a raw binary, upload directly.
        let codeData;

        if (programUrl.endsWith('.png')) {
            codeData = await this.semanticManager.expandTexture(programUrl);
        } else {
            // Fallback for raw binary (mock for now or implement loader)
            console.warn('Raw binary loading not fully implemented, using empty buffer');
            codeData = new Uint32Array(1024);
        }

        // 2. Create GPU Buffers
        // Code Buffer
        const codeBuffer = this.device.createBuffer({
            size: Math.max(codeData.byteLength, 4096), // Min size
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
            mappedAtCreation: true
        });
        new Uint32Array(codeBuffer.getMappedRange()).set(codeData);
        codeBuffer.unmap();

        // Memory Buffer (128MB Shared Heap)
        // In a real multi-process OS, we might share this buffer or allocate regions.
        // For V1, each kernel gets its own 128MB universe (simpler).
        const memoryBuffer = this.device.createBuffer({
            size: this.MEMORY_SIZE,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST
        });

        // State Buffer (Registers + PC + CSRs)
        // 46 registers * 4 bytes = 184 bytes. Align to 256.
        const stateBuffer = this.device.createBuffer({
            size: 256 * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST | GPUBufferUsage.MAP_READ
        });

        // 3. Create Bind Group
        const bindGroup = this.device.createBindGroup({
            layout: this.bindGroupLayout,
            entries: [
                { binding: 0, resource: { buffer: codeBuffer } },
                { binding: 1, resource: { buffer: memoryBuffer } },
                { binding: 2, resource: { buffer: stateBuffer } }
            ]
        });

        // 4. Register Kernel
        this.kernels.set(kernelId, {
            codeBuffer,
            memoryBuffer,
            stateBuffer,
            bindGroup,
            pc: 0,
            cycleCount: 0
        });

        // 5. Initialize Memory Manager regions
        // Clear reserved regions if needed
        // For now, start with zeroed memory (default)

        return true;
    }

    /**
     * Execute cycles on the GPU
     * @param {string} kernelId
     * @param {number} cycles
     */
    async tick(kernelId, cycles = 1) {
        const kernel = this.kernels.get(kernelId);
        if (!kernel) throw new Error(`Kernel ${kernelId} not found`);

        const commandEncoder = this.device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();

        passEncoder.setPipeline(this.pipeline);
        passEncoder.setBindGroup(0, kernel.bindGroup);

        // Each dispatch executes 100 instructions (BATCH_SIZE in shader)
        // We dispatch multiple times in a single command buffer for speed.
        const dispatches = Math.max(1, Math.floor(cycles / 100));
        for (let i = 0; i < dispatches; i++) {
            passEncoder.dispatchWorkgroups(1);
        }

        passEncoder.end();
        this.device.queue.submit([commandEncoder.finish()]);

        kernel.cycleCount += dispatches * 100;
    }

    /**
     * Check if a syscall was triggered
     * @private
     */
    async _checkSyscalls(id) {
        if (!this.handleSyscall) return;

        const state = await this.readState(id);
        if (!state) return;

        // In RISC-V Linux, a7 (x17) is the syscall number
        const syscallNum = state.registers[17];

        // Check if we hit an ECALL trap (SCAUSE 8 or 11)
        const isEcall = state.scause === 8 || state.scause === 11;

        if (isEcall && syscallNum > 0) {
            const args = [
                state.registers[10], // a0
                state.registers[11], // a1
                state.registers[12], // a2
                state.registers[13], // a3
                state.registers[14], // a4
                state.registers[15]  // a5
            ];
            
            await this.handleSyscall(syscallNum, args);
            
            // Note: In a real OS, we'd need to clear the trap and resume
            // For now, we assume the JS handler manages the state or the kernel 
            // is in a polling loop.
        } else if (state.halted) {
            // Check for exit via a7=93 even if not a formal trap
            if (syscallNum === 93) {
                await this.handleSyscall(93, [state.registers[10]]);
            }
        }
    }

    async _loadTexture(url) {
        // Simple texture loading for WebGPU
        const img = new Image();
        img.src = url;
        await img.decode();

        const bitmap = await createImageBitmap(img);
        const texture = this.device.createTexture({
            size: [bitmap.width, bitmap.height],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.COPY_DST | GPUTextureUsage.RENDER_ATTACHMENT
        });

        this.device.queue.copyExternalImageToTexture(
            { source: bitmap },
            { texture: texture },
            [bitmap.width, bitmap.height]
        );

        return texture;
    }

    /**
     * Read framebuffer from GPU memory (Simulated VGA buffer at 16MB offset)
     * @param {string} id - Kernel ID
     */
    async readFramebuffer(id) {
        // Framebuffer Config: 1024 x 768 x 4 bytes (RGBA)
        // Offset: 16MB (16777216)
        const fbOffset = 16777216;
        const fbSize = 1024 * 768 * 4; // ~3MB

        return await this.readMemory(id, fbOffset, fbSize);
    }

    /**
     * Capture frame as base64 PNG (Helper for WebMCP)
     * @param {string} id 
     */
    async captureFrame(id) {
        const rawData = await this.readFramebuffer(id);
        if (!rawData) return null;

        // Convert raw RGBA to PNG via Canvas (if in browser)
        if (typeof document !== 'undefined') {
            const canvas = document.createElement('canvas');
            canvas.width = 1024;
            canvas.height = 768;
            const ctx = canvas.getContext('2d');
            const imageData = new ImageData(new Uint8ClampedArray(rawData), 1024, 768);
            ctx.putImageData(imageData, 0, 0);
            return canvas.toDataURL('image/png').split(',')[1];
        }
        return null;
    }

    /**
     * Inject Input Event into MMIO region (Offset 32MB)
     * MMIO Layout:
     *   0x02000000: status (bit 0 = pending)
     *   0x02000004: type (1=keyboard, 2=mouse, 3=touch)
     *   0x02000008: key_code (for keyboard)
     *   0x0200000C: mouse_x
     *   0x02000010: mouse_y
     *   0x02000014: flags (1=pressed, 2=released)
     *
     * @param {string} id - Kernel ID
     * @param {string} type - 'keyboard', 'mouse'
     * @param {object} data - {key, x, y, pressed, released}
     */
    async injectInput(id, type, data) {
        const MMIO_BASE = 0x02000000; // 32MB

        const kernel = this.kernels.get(id);
        if (!kernel) {
            console.warn(`[GPUExecutionSystem] Kernel not found: ${id}`);
            return;
        }

        // Build input packet
        let inputType = 0;
        let keyCode = 0;
        let mouseX = 0;
        let mouseY = 0;
        let flags = 0;

        if (type === 'keyboard') {
            inputType = 1;
            // Map common keys to scancodes
            keyCode = this.#keyToScancode(data.key || '');
            flags = data.pressed ? 1 : (data.released ? 2 : 1);
        } else if (type === 'mouse') {
            inputType = 2;
            mouseX = Math.floor(data.x) || 0;
            mouseY = Math.floor(data.y) || 0;
            flags = data.pressed ? 1 : (data.released ? 2 : 0);
        }

        // Write to MMIO region
        const mmioData = new Uint32Array([
            1,           // status = pending
            inputType,   // type
            keyCode,     // key
            mouseX,      // x
            mouseY,      // y
            flags        // flags
        ]);

        this.device.queue.writeBuffer(
            kernel.memoryBuffer,
            MMIO_BASE,
            mmioData
        );

        console.log(`[GPUExecutionSystem] Injected ${type} input:`, { inputType, keyCode, mouseX, mouseY, flags });
    }

    /**
     * Convert key string to scancode
     * @private
     */
    #keyToScancode(key) {
        const keyMap = {
            'Enter': 0x1C,
            'Escape': 0x01,
            'Backspace': 0x0E,
            'Tab': 0x0F,
            'Space': 0x39,
            'ArrowUp': 0x48,
            'ArrowDown': 0x50,
            'ArrowLeft': 0x4B,
            'ArrowRight': 0x4D,
            'Shift': 0x2A,
            'Control': 0x1D,
            'Alt': 0x38,
            'a': 0x1E, 'b': 0x30, 'c': 0x2E, 'd': 0x20, 'e': 0x12,
            'f': 0x21, 'g': 0x22, 'h': 0x23, 'i': 0x17, 'j': 0x24,
            'k': 0x25, 'l': 0x26, 'm': 0x32, 'n': 0x31, 'o': 0x18,
            'p': 0x19, 'q': 0x10, 'r': 0x13, 's': 0x1F, 't': 0x14,
            'u': 0x16, 'v': 0x2F, 'w': 0x11, 'x': 0x2D, 'y': 0x15,
            'z': 0x2C,
            '0': 0x0B, '1': 0x02, '2': 0x03, '3': 0x04, '4': 0x05,
            '5': 0x06, '6': 0x07, '7': 0x08, '8': 0x09, '9': 0x0A,
        };

        // Single character
        if (key.length === 1) {
            const lower = key.toLowerCase();
            return keyMap[lower] || key.charCodeAt(0);
        }

        return keyMap[key] || 0;
    }

    /**
     * Read back CPU states (Registers)
     * Extended state includes CSR registers for MMU support
     */
    async readState(id) {
        const kernel = this.kernels.get(id);
        if (!kernel) return null;

        const stateSize = 46 * 4;
        const stagingBuffer = this.device.createBuffer({
            size: stateSize,
            usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST
        });

        const commandEncoder = this.device.createCommandEncoder();
        commandEncoder.copyBufferToBuffer(kernel.stateBuffer, 0, stagingBuffer, 0, stateSize);
        this.device.queue.submit([commandEncoder.finish()]);

        await stagingBuffer.mapAsync(GPUMapMode.READ);
        const states = new Uint32Array(stagingBuffer.getMappedRange().slice());
        stagingBuffer.unmap();

        return {
            registers: Array.from(states.slice(0, 32)),
            pc: states[32],
            halted: states[38] > 0,  // CSR_HALT moved to index 38
            satp: states[34],         // Page table base + mode
            stvec: states[35],        // Trap handler address
            sscratch: states[36],      // Scratch register for traps
            mode: states[37],         // Privilege mode (0=user, 1=supervisor)
            // Trap CSRs
            sepc: states[40],         // Supervisor Exception Program Counter
            scause: states[41],       // Supervisor Cause Register
            stval: states[42],        // Supervisor Trap Value
            sstatus: states[43],      // Supervisor Status Register
            sie: states[44],          // Supervisor Interrupt Enable
            sip: states[45]           // Supervisor Interrupt Pending
        };
    }

    /**
     * Read memory from a kernel
     * @param {string} id - Kernel ID
     * @param {number} address - Address to read
     * @param {number} size - Bytes to read
     */
    async readMemory(id, address, size) {
        const kernel = this.kernels.get(id);
        if (!kernel) return null;

        const stagingBuffer = this.device.createBuffer({
            size: size,
            usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST
        });

        const commandEncoder = this.device.createCommandEncoder();
        commandEncoder.copyBufferToBuffer(kernel.memoryBuffer, address, stagingBuffer, 0, size);
        this.device.queue.submit([commandEncoder.finish()]);

        await stagingBuffer.mapAsync(GPUMapMode.READ);
        const data = stagingBuffer.getMappedRange().slice();
        stagingBuffer.unmap();

        return new Uint8Array(data);
    }

    /**
     * Invoke a function in the kernel (Task 2.2)
     * @param {string} kernelId
     * @param {number} address - Function address (PC)
     * @param {Array<number>} args - Arguments (A0-A7)
     * @returns {Promise<any>} - Return value (A0)
     */
    async invokeFunction(kernelId, address, args = []) {
        console.log(`[GPU] Invoking function at 0x${address.toString(16)} with args:`, args);

        const kernel = this.kernels.get(kernelId);
        if (!kernel) throw new Error(`Kernel ${kernelId} not found`);

        // 1. Prepare new state
        // Set PC
        this._writeRegister(kernel, this.RISCV_PC_INDEX, address);

        // Set RA (Magic Trap)
        this._writeRegister(kernel, this.RISCV_RA_INDEX, this.MAGIC_TRAP_ADDR);

        // Set Arguments (A0-A7)
        for (let i = 0; i < Math.min(args.length, 8); i++) {
            this._writeRegister(kernel, this.RISCV_A0_INDEX + i, args[i]);
        }

        // 2. Run until trap (Task 2.3)
        const endState = await this.runUntil(kernelId, this.MAGIC_TRAP_ADDR);

        // 3. Get Return Value (A0)
        // If runUntil returned state, we can read A0 from it roughly or re-read
        // But runUntil returns the state object which contains registers array.
        if (endState && endState.registers) {
            // A0 is index 10. But readState returns registers[0..31].
            // So registers[10] is A0.
            return endState.registers[10];
        }

        // Fallback re-read if runUntil timed out or didn't return state
        const state = await this.readState(kernelId);
        return state ? state.registers[10] : null;
    }

    /**
     * Run kernel until PC hits specific address or limit reached (Task 2.3)
     */
    async runUntil(kernelId, targetPC, maxCycles = 10000) {
        // const kernel = this.kernels.get(kernelId);
        let cycles = 0;
        const batchSize = 100; // Run 100 cycles per check

        while (cycles < maxCycles) {
            await this.tick(kernelId, batchSize);
            cycles += batchSize;

            // Check PC
            const state = await this.readState(kernelId);
            if (!state) return null;

            // Note: readState returns PC as 'pc' property
            if (state.pc === targetPC || state.pc === 0 || state.halted) {
                console.log(`[GPU] Run loop finished. PC: 0x${state.pc.toString(16)}, Cycles: ${cycles}`);
                return state;
            }
        }

        console.warn(`[GPU] Run loop timed out after ${cycles} cycles`);
        return null;
    }

    // Helper: Write single register
    _writeRegister(kernel, regIndex, value) {
        const data = new Uint32Array([value]);
        this.device.queue.writeBuffer(
            kernel.stateBuffer,
            regIndex * 4,
            data
        );
    }

    // Helper: Read single register
    async _readRegister(kernelId, regIndex) {
        const state = await this.readState(kernelId);
        return state.registers[regIndex];
    }

    async _loadShader(url) {
        const response = await fetch(url);
        return await response.text();
    }
}

if (typeof window !== 'undefined') {
    window.GPUExecutionSystem = GPUExecutionSystem;
}
