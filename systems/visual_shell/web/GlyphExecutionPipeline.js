/**
 * Glyph Execution Pipeline
 *
 * WebGPU compute pipeline that executes glyph microcode programs.
 * The pipeline loads the Hilbert atlas, runs the glyph_microcode.wgsl shader,
 * and outputs to a framebuffer texture.
 */

import { d2xy, opcodeToAtlasCoord } from './hilbert.js';

export class GlyphExecutionPipeline {
    constructor(device, options = {}) {
        this.device = device;
        this.gridSize = options.gridSize || 256;
        this.cellSize = options.cellSize || 64;
        this.atlasSize = this.gridSize * this.cellSize;

        // Execution state
        this.state = {
            pc: 0,
            sp: 0,
            flags: 0,
            halted: 0,
            cycles: 0
        };

        // Memory (64KB for now)
        this.memorySize = 64 * 1024;
        this.stackSize = 1024;
        this.maxProgramSize = 4096;

        // Textures
        this.atlasTexture = null;
        this.outputTexture = null;

        // Bindings
        this.bindGroup = null;
        this.pipeline = null;
    }

    /**
     * Initialize the pipeline with atlas texture.
     */
    async initialize(atlasUrl) {
        // Load atlas image
        const response = await fetch(atlasUrl);
        const blob = await response.blob();
        const imageBitmap = await createImageBitmap(blob);

        // Create atlas texture
        this.atlasTexture = this.device.createTexture({
            size: [imageBitmap.width, imageBitmap.height],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.TEXTURE_BINDING |
                   GPUTextureUsage.COPY_DST |
                   GPUTextureUsage.RENDER_ATTACHMENT
        });

        this.device.queue.copyExternalImageToTexture(
            { source: imageBitmap },
            { texture: this.atlasTexture },
            [imageBitmap.width, imageBitmap.height]
        );

        // Create output texture (framebuffer)
        this.outputTexture = this.device.createTexture({
            size: [1024, 768],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.STORAGE_BINDING |
                   GPUTextureUsage.TEXTURE_BINDING |
                   GPUTextureUsage.RENDER_ATTACHMENT
        });

        // Create buffers
        this.programBuffer = this.device.createBuffer({
            size: this.maxProgramSize * 24, // 24 bytes per glyph
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
        });

        this.stateBuffer = this.device.createBuffer({
            size: 20, // 5 x u32
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
        });

        this.memoryBuffer = this.device.createBuffer({
            size: this.memorySize * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
        });

        this.stackBuffer = this.device.createBuffer({
            size: this.stackSize * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
        });

        // Create compute pipeline
        await this.createPipeline();

        console.log('[GlyphExecutionPipeline] Initialized');
    }

    /**
     * Create the WebGPU compute pipeline.
     */
    async createPipeline() {
        // WGSL shader for glyph execution (minimal "synthetic silicon")
        const shaderCode = `
struct Glyph {
    opcode: u32,
    stratum: u32,
    p1: f32,
    p2: f32,
    target: u32,
};

struct ExecutionState {
    pc: u32,
    sp: u32,
    flags: u32,
    halted: u32,
    cycles: u32,
};

@group(0) @binding(0) var<storage, read> program: array<Glyph>;
@group(0) @binding(1) var<storage, read_write> state: ExecutionState;
@group(0) @binding(2) var<storage, read_write> memory: array<f32>;
@group(0) @binding(3) var<storage, read_write> stack: array<u32>;
@group(0) @binding(4) var output_texture: texture_storage_2d<rgba8unorm, write>;
@group(0) @binding(5) var atlas_texture: texture_2d<f32>;

// Hilbert d2xy for atlas lookup
fn d2xy(n: u32, d_in: u32) -> vec2<u32> {
    var x = 0u;
    var y = 0u;
    var s = 1u;
    var d = d_in;
    while (s < n) {
        let rx = 1u & (d / 2u);
        let ry = 1u & (d ^ rx);
        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let t = x;
            x = y;
            y = t;
        }
        x += s * rx;
        y += s * ry;
        d /= 4u;
        s *= 2u;
    }
    return vec2<u32>(x, y);
}

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    if (id.x != 0u || state.halted != 0u) { return; }

    let glyph = program[state.pc];
    state.pc += 1u;
    state.cycles += 1u;

    switch (glyph.opcode) {
        // Arithmetic (200-203)
        case 200u: { memory[glyph.target] = glyph.p1 + glyph.p2; }
        case 201u: { memory[glyph.target] = glyph.p1 - glyph.p2; }
        case 202u: { memory[glyph.target] = glyph.p1 * glyph.p2; }
        case 203u: { if (glyph.p2 != 0.0) { memory[glyph.target] = glyph.p1 / glyph.p2; } }

        // Memory (204-207)
        case 204u: { memory[glyph.target] = memory[u32(glyph.p1)]; }
        case 205u: { memory[u32(glyph.p1)] = glyph.p2; }
        case 206u: { memory[glyph.target] = glyph.p1; }
        case 207u: { memory[glyph.target] = 0.0; }

        // Control (208-211)
        case 208u: { state.pc = u32(glyph.p1); }
        case 209u: { if (memory[glyph.target] == 0.0) { state.pc = u32(glyph.p1); } }
        case 210u: { stack[state.sp] = state.pc; state.sp += 1u; state.pc = u32(glyph.p1); }
        case 211u: { state.sp -= 1u; state.pc = stack[state.sp]; }

        // System (212-215)
        case 212u: { state.halted = 1u; }
        case 213u: { /* SYNC - barrier */ }
        case 215u: {
            // DRAW: Blit glyph from atlas to output
            // p1 = opcode to draw, p2 = dest_x, target = dest_y
            let src_opcode = u32(glyph.p1);
            let dest_x = u32(glyph.p2);
            let dest_y = glyph.target;

            // Hilbert lookup for source
            let atlas_grid_size = 256u;
            let cell_size = 64u;
            let src_cell = d2xy(atlas_grid_size, src_opcode);
            let src_base_x = src_cell.x * cell_size;
            let src_base_y = src_cell.y * cell_size;

            // Blit 8x16 glyph (for now, scaled to 64x64)
            for (var dy = 0u; dy < 64u; dy++) {
                for (var dx = 0u; dx < 64u; dx++) {
                    let src_x = src_base_x + dx;
                    let src_y = src_base_y + dy;
                    let color = textureLoad(atlas_texture, vec2<i32>(i32(src_x), i32(src_y)), 0);
                    textureStore(output_texture, vec2<i32>(i32(dest_x + dx), i32(dest_y + dy)), color);
                }
            }
        }
        default: { /* NOP */ }
    }

    // Safety halt
    if (state.cycles > 10000u) { state.halted = 1u; }
}
`;

        const shaderModule = this.device.createShaderModule({ code: shaderCode });

        this.pipeline = this.device.createComputePipeline({
            layout: 'auto',
            compute: {
                module: shaderModule,
                entryPoint: 'main'
            }
        });

        // Create bind group
        this.bindGroup = this.device.createBindGroup({
            layout: this.pipeline.getBindGroupLayout(0),
            entries: [
                { binding: 0, resource: { buffer: this.programBuffer } },
                { binding: 1, resource: { buffer: this.stateBuffer } },
                { binding: 2, resource: { buffer: this.memoryBuffer } },
                { binding: 3, resource: { buffer: this.stackBuffer } },
                { binding: 4, resource: this.outputTexture.createView() },
                { binding: 5, resource: this.atlasTexture.createView() }
            ]
        });
    }

    /**
     * Load a glyph program from JSON.
     */
    loadProgram(programData) {
        const glyphs = programData.glyphs || {};
        const programArray = new Float32Array(this.maxProgramSize * 6);

        let i = 0;
        for (const [indexStr, glyph] of Object.entries(glyphs)) {
            const idx = parseInt(indexStr);
            programArray[idx * 6 + 0] = glyph.opcode || 0;
            programArray[idx * 6 + 1] = glyph.stratum || 0;
            programArray[idx * 6 + 2] = glyph.p1 || 0;
            programArray[idx * 6 + 3] = glyph.p2 || 0;
            programArray[idx * 6 + 4] = glyph.target || 0;
            programArray[idx * 6 + 5] = 0; // padding
            i = Math.max(i, idx + 1);
        }

        this.device.queue.writeBuffer(this.programBuffer, 0, programArray);

        // Reset state
        this.state = { pc: 0, sp: 0, flags: 0, halted: 0, cycles: 0 };
        this.updateState();

        console.log(`[GlyphExecutionPipeline] Loaded program with ${i} glyphs`);
    }

    /**
     * Update execution state on GPU.
     */
    updateState() {
        const stateArray = new Uint32Array([
            this.state.pc,
            this.state.sp,
            this.state.flags,
            this.state.halted,
            this.state.cycles
        ]);
        this.device.queue.writeBuffer(this.stateBuffer, 0, stateArray);
    }

    /**
     * Execute one step of the program.
     */
    step() {
        if (this.state.halted) return false;

        const commandEncoder = this.device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();
        passEncoder.setPipeline(this.pipeline);
        passEncoder.setBindGroup(0, this.bindGroup);
        passEncoder.dispatchWorkgroups(1);
        passEncoder.end();
        this.device.queue.submit([commandEncoder.finish()]);

        // Read back state (async, but we sync for simplicity)
        // In production, use readBuffer with proper async handling
        return !this.state.halted;
    }

    /**
     * Run program until halt or max cycles.
     */
    run(maxCycles = 1000) {
        for (let i = 0; i < maxCycles && !this.state.halted; i++) {
            this.step();
        }
        console.log(`[GlyphExecutionPipeline] Execution ${this.state.halted ? 'halted' : 'paused'} at cycle ${this.state.cycles}`);
    }

    /**
     * Get the output texture for rendering.
     */
    getOutputTexture() {
        return this.outputTexture;
    }

    /**
     * Check if execution is halted.
     */
    isHalted() {
        return this.state.halted !== 0;
    }
}

// Export for module loading
if (typeof window !== 'undefined') {
    window.GlyphExecutionPipeline = GlyphExecutionPipeline;
}
