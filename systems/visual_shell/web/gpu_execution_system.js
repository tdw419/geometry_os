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

        // 3. Create CPU State Buffer (39 u32s: 32 regs + PC + Halt + satp + stvec + sscratch + mode)
        const stateBuffer = this.device.createBuffer({
            size: 39 * 4,
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
     * @param {string} id 
     * @param {string} type - 'keyboard', 'mouse'
     * @param {any} data 
     */
    async injectInput(id, type, data) {
        // MMIO Layout (Simple):
        // 0x02000000: Status/Command (1 byte)
        // 0x02000004: Data (4 bytes)

        const mmioOffset = 33554432; // 32MB

        let cmdCode = 0;
        let payload = 0;

        if (type === 'keyboard') {
            cmdCode = 1;
            payload = (data.key || '').charCodeAt(0);
        } else if (type === 'mouse') {
            cmdCode = 2;
            // Pack x/y into 32-bit (16-bit each)
            payload = ((data.x & 0xFFFF) << 16) | (data.y & 0xFFFF);
        }

        const kernel = this.kernels.get(id);
        if (!kernel) return;

        // Quick write via queue (no staging buffer needed for WriteBuffer)
        const cmdData = new Uint8Array([cmdCode]);
        this.device.queue.writeBuffer(kernel.memoryBuffer, mmioOffset, cmdData);

        const payloadData = new Uint32Array([payload]);
        this.device.queue.writeBuffer(kernel.memoryBuffer, mmioOffset + 4, payloadData);
    }

    /**
     * Read back CPU states (Registers)
     * Extended state includes CSR registers for MMU support
     */
    async readState(id) {
        const kernel = this.kernels.get(id);
        if (!kernel) return null;

        const stateSize = 39 * 4;
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
