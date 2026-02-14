/**
 * Geometry OS: GPU Execution System
 * 
 * Completes the GPU pipeline: Semantic Texture -> Expanded Code -> Parallel Execution.
 * Integrates WebGPUSemanticManager with the Visual CPU RISC-V shader.
 */

class GPUExecutionSystem {
    constructor(device, dictionary) {
        this.device = device;
        this.dictionary = dictionary;
        this.semanticManager = new WebGPUSemanticManager(device, dictionary);

        this.kernels = new Map(); // id -> kernel state
        this.initialized = false;

        // Syscall hook
        this.handleSyscall = null;
    }

    async initialize() {
        if (this.initialized) return;

        await this.semanticManager.initialize();

        // Load RISC-V Execution Shader
        const shaderCode = await fetch('shaders/visual_cpu_riscv.wgsl').then(r => r.text());
        this.shaderModule = this.device.createShaderModule({
            label: 'Visual CPU RISC-V Shader',
            code: shaderCode
        });

        this.pipeline = this.device.createComputePipeline({
            label: 'RISC-V Execution Pipeline',
            layout: 'auto',
            compute: {
                module: this.shaderModule,
                entryPoint: 'main'
            }
        });

        this.initialized = true;
        console.log('✅ GPUExecutionSystem: RISC-V pipeline ready');
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
     * Deploy a kernel to the GPU substrate
     * @param {string} rtsUrl - URL to the semantic .rts.png
     * @param {string} id - Instance ID
     */
    async deploy(rtsUrl, id) {
        if (!this.initialized) await this.initialize();

        console.log(`🚀 Deploying GPU Kernel: ${id}`);

        // 1. Load and Expand the Texture
        const texture = await this._loadTexture(rtsUrl);
        const expandedBuffer = await this.semanticManager.expand(texture);

        // 2. Create System Memory (Storage Buffer)
        const memoryBuffer = this.device.createBuffer({
            size: 64 * 1024 * 1024, // 64MB Heap (includes FB at 16MB, MMIO at 32MB)
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST
        });

        // 3. Create CPU State Buffer (46 u32s: 32 regs + PC + Halt + CSRs + Trap state)
        const stateBuffer = this.device.createBuffer({
            size: 46 * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST
        });

        // 4. Create Bind Group
        const bindGroup = this.device.createBindGroup({
            layout: this.pipeline.getBindGroupLayout(0),
            entries: [
                { binding: 0, resource: { buffer: expandedBuffer } },
                { binding: 1, resource: { buffer: memoryBuffer } },
                { binding: 2, resource: { buffer: stateBuffer } }
            ]
        });

        this.kernels.set(id, {
            expandedBuffer,
            memoryBuffer,
            stateBuffer,
            bindGroup,
            tickCount: 0
        });

        console.log(`✅ GPU Kernel ${id} active on substrate.`);
    }

    /**
     * Run X clock cycles for a kernel
     */
    async tick(id, cycles = 1) {
        const kernel = this.kernels.get(id);
        if (!kernel) return;

        const commandEncoder = this.device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();
        passEncoder.setPipeline(this.pipeline);
        passEncoder.setBindGroup(0, kernel.bindGroup);

        // Dispatch 1 workgroup for 1 core (POC level)
        // Future: Multiple workgroups for parallel execution of different threads
        for (let i = 0; i < cycles; i++) {
            passEncoder.dispatchWorkgroups(1, 1, 1);
        }

        passEncoder.end();
        this.device.queue.submit([commandEncoder.finish()]);

        kernel.tickCount += cycles;

        // Check for syscalls (PC-based or Register-based)
        // In a real implementation, the shader would set a 'syscall' flag in the state buffer
        await this._checkSyscalls(id);
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

        // We need a mechanism to know IF a ecall was actually executed.
        // For now, we'll assume a specific PC or a 'trap' bit in state[33]
        // If state[33] == 2, it's a syscall trap
        if (state.halted && state.registers[17] > 0) {
            const args = [
                state.registers[10], // a0
                state.registers[11], // a1
                state.registers[12], // a2
                state.registers[13], // a3
                state.registers[14], // a4
                state.registers[15]  // a5
            ];
            await this.handleSyscall(syscallNum, args);
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
            mode: states[37]          // Privilege mode (0=user, 1=supervisor)
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
}

if (typeof window !== 'undefined') {
    window.GPUExecutionSystem = GPUExecutionSystem;
}
