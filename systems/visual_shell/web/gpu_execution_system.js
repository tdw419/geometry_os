/**
 * Geometry OS: GPU Execution System
 * 
 * Completes the GPU pipeline: Semantic Texture -> Expanded Code -> Parallel Execution.
 * Integrates WebGPUSemanticManager with the Visual CPU RISC-V shader.
 * Phase 27: Zero-Symbol Resonance Execution support added.
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
        this.resonanceInitialized = false;

        // Syscall hook
        this.handleSyscall = null;

        // Constants for RISC-V Shader
        this.RISCV_REGS_PER_CORE = 64; // Expanded for Tectonic
        this.RISCV_PC_INDEX = 32;
        this.RISCV_RA_INDEX = 1; // x1 is return address register
        this.RISCV_A0_INDEX = 10; // x10 is first argument/return value register
        this.RISCV_SATP_INDEX = 34; // CSR_SATP
        this.RISCV_STVEC_INDEX = 35; // CSR_STVEC
        this.RISCV_SSCRATCH_INDEX = 36; // CSR_SSCRATCH
        this.RISCV_MODE_INDEX = 37; // Privilege mode
        this.RISCV_HALT_INDEX = 38; // Halt flag
        this.RISCV_GUEST_BASE_INDEX = 46;
        this.RISCV_GUEST_SIZE_INDEX = 47;
        this.RISCV_GEOM_CACHE_INDEX = 48;
        this.MAGIC_TRAP_ADDR = 0xFFFFFFFE;
    }

    async initialize() {
        if (this.initialized) return;

        await this.semanticManager.initialize();

        // Load standard shader module
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

        // Create Standard Pipeline
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
        console.log('GPU Execution System Initialized (Standard Pipeline)');
    }

    /**
     * Initialize the Resonance (Holographic) pipeline
     */
    async initializeResonance() {
        if (this.resonanceInitialized) return;

        // Load post-symbolic shader module
        const shaderCode = await this._loadShader('shaders/visual_cpu_riscv_post_symbolic.wgsl');
        this.resonanceShaderModule = this.device.createShaderModule({
            label: 'Post-Symbolic CPU (RISC-V)',
            code: shaderCode
        });

        // Create Bind Group Layout for Resonance kernels
        // Binding 0: Texture (Holographic Atlas)
        this.resonanceBindGroupLayout = this.device.createBindGroupLayout({
            entries: [
                { 
                    binding: 0, 
                    visibility: GPUShaderStage.COMPUTE, 
                    texture: { sampleType: 'float', viewDimension: '2d' } 
                },
                { binding: 1, visibility: GPUShaderStage.COMPUTE, buffer: { type: 'storage' } },
                { binding: 2, visibility: GPUShaderStage.COMPUTE, buffer: { type: 'storage' } }
            ]
        });

        // Create Resonance Pipeline
        this.resonancePipeline = this.device.createComputePipeline({
            layout: this.device.createPipelineLayout({
                bindGroupLayouts: [this.resonanceBindGroupLayout]
            }),
            compute: {
                module: this.resonanceShaderModule,
                entryPoint: 'main'
            }
        });

        this.resonanceInitialized = true;
        console.log('GPU Execution System Initialized (Resonance Pipeline)');
    }

    /**
     * Deploy a Resonance (Holographic) kernel
     * @param {string} textureUrl - URL to the .rts.png resonance texture
     * @param {string} kernelId - Unique ID
     */
    async deployResonance(textureUrl, kernelId) {
        if (!this.resonanceInitialized) await this.initializeResonance();

        console.log(`[GPU] Deploying Resonance kernel ${kernelId} from ${textureUrl}...`);

        // 1. Load Texture
        const texture = await this._loadTexture(textureUrl);

        // 2. Create Buffers
        const memoryBuffer = this.device.createBuffer({
            size: this.MEMORY_SIZE,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST
        });

        const stateBuffer = this.device.createBuffer({
            size: 256 * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST | GPUBufferUsage.MAP_READ
        });

        // 3. Create Bind Group
        const bindGroup = this.device.createBindGroup({
            layout: this.resonanceBindGroupLayout,
            entries: [
                { binding: 0, resource: texture.createView() },
                { binding: 1, resource: { buffer: memoryBuffer } },
                { binding: 2, resource: { buffer: stateBuffer } }
            ]
        });

        // 4. Register Kernel
        this.kernels.set(kernelId, {
            memoryBuffer,
            stateBuffer,
            bindGroup,
            isResonance: true,
            pc: 0,
            cycleCount: 0
        });

        return true;
    }

    /**
     * Deploy a kernel (code) to the GPU
     */
    async deploy(programUrl, kernelId) {
        if (!this.initialized) await this.initialize();

        console.log(`Deploying kernel ${kernelId} from ${programUrl}...`);

        let codeData;
        if (programUrl.endsWith('.png')) {
            codeData = await this.semanticManager.expandTexture(programUrl);
        } else {
            console.warn('Raw binary loading not fully implemented, using empty buffer');
            codeData = new Uint32Array(1024);
        }

        const codeBuffer = this.device.createBuffer({
            size: Math.max(codeData.byteLength, 4096),
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
            mappedAtCreation: true
        });
        new Uint32Array(codeBuffer.getMappedRange()).set(codeData);
        codeBuffer.unmap();

        const memoryBuffer = this.device.createBuffer({
            size: this.MEMORY_SIZE,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST
        });

        const stateBuffer = this.device.createBuffer({
            size: 256 * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST | GPUBufferUsage.MAP_READ
        });

        const bindGroup = this.device.createBindGroup({
            layout: this.bindGroupLayout,
            entries: [
                { binding: 0, resource: { buffer: codeBuffer } },
                { binding: 1, resource: { buffer: memoryBuffer } },
                { binding: 2, resource: { buffer: stateBuffer } }
            ]
        });

        this.kernels.set(kernelId, {
            codeBuffer,
            memoryBuffer,
            stateBuffer,
            bindGroup,
            isResonance: false,
            pc: 0,
            cycleCount: 0
        });

        return true;
    }

    async deployWithInstructions(instructions, kernelId) {
        if (!this.initialized) await this.initialize();
        console.log(`[GPUExecutionSystem] Deploying kernel ${kernelId} with ${instructions.length} pre-expanded instructions...`);

        const codeBuffer = this.device.createBuffer({
            size: Math.max(instructions.byteLength, 4096),
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
            mappedAtCreation: true
        });
        new Uint32Array(codeBuffer.getMappedRange()).set(instructions);
        codeBuffer.unmap();

        const memoryBuffer = this.device.createBuffer({
            size: this.MEMORY_SIZE,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST
        });

        const stateBuffer = this.device.createBuffer({
            size: 256 * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST | GPUBufferUsage.MAP_READ
        });

        const bindGroup = this.device.createBindGroup({
            layout: this.bindGroupLayout,
            entries: [
                { binding: 0, resource: { buffer: codeBuffer } },
                { binding: 1, resource: { buffer: memoryBuffer } },
                { binding: 2, resource: { buffer: stateBuffer } }
            ]
        });

        this.kernels.set(kernelId, {
            codeBuffer,
            memoryBuffer,
            stateBuffer,
            bindGroup,
            isResonance: false,
            pc: 0,
            cycleCount: 0
        });

        return true;
    }

    async tick(kernelId, cycles = 1) {
        const kernel = this.kernels.get(kernelId);
        if (!kernel) throw new Error(`Kernel ${kernelId} not found`);

        const commandEncoder = this.device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();

        // Select proper pipeline
        if (kernel.isResonance) {
            passEncoder.setPipeline(this.resonancePipeline);
        } else {
            passEncoder.setPipeline(this.pipeline);
        }
        
        passEncoder.setBindGroup(0, kernel.bindGroup);

        // BATCH_SIZE matches shader loop
        const dispatches = Math.max(1, Math.floor(cycles / 10));
        for (let i = 0; i < dispatches; i++) {
            passEncoder.dispatchWorkgroups(1);
        }

        passEncoder.end();
        this.device.queue.submit([commandEncoder.finish()]);

        kernel.cycleCount += dispatches * 10;
    }

    async _checkSyscalls(id) {
        if (!this.handleSyscall) return;
        const state = await this.readState(id);
        if (!state) return;
        const syscallNum = state.registers[17];
        const isEcall = state.scause === 8 || state.scause === 11;
        if (isEcall && syscallNum > 0) {
            const args = [
                state.registers[10], state.registers[11], state.registers[12],
                state.registers[13], state.registers[14], state.registers[15]
            ];
            await this.handleSyscall(syscallNum, args);
        } else if (state.halted && syscallNum === 93) {
            await this.handleSyscall(93, [state.registers[10]]);
        }
    }

    async _loadTexture(url) {
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
            { source: bitmap }, { texture: texture }, [bitmap.width, bitmap.height]
        );
        return texture;
    }

    async readFramebuffer(id) {
        const fbOffset = 16777216;
        const fbSize = 1024 * 768 * 4;
        return await this.readMemory(id, fbOffset, fbSize);
    }

    async readState(id) {
        const kernel = this.kernels.get(id);
        if (!kernel) return null;
        const stateSize = this.RISCV_REGS_PER_CORE * 4;
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
            halted: states[38] > 0,
            satp: states[34],
            stvec: states[35],
            sscratch: states[36],
            mode: states[37],
            sepc: states[40],
            scause: states[41],
            stval: states[42],
            sstatus: states[43],
            sie: states[44],
            sip: states[45]
        };
    }

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

    async _loadShader(url) {
        const response = await fetch(url);
        return await response.text();
    }
}

if (typeof window !== 'undefined') {
    window.GPUExecutionSystem = GPUExecutionSystem;
}
