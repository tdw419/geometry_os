/**
 * SaccadeGPU - GPU-accelerated saccade calculations using WebGPU
 *
 * Phase 47: Tectonic Saccadic Optimization
 *
 * Provides:
 * - GPU compute pipeline for saccade calculations
 * - Double-buffered state management
 * - Automatic fallback to CPU when WebGPU unavailable
 * - Benchmark utilities
 */

class SaccadeGPU {
    constructor(config = {}) {
        this.config = {
            saccadeDuration: 150,
            settlingDuration: 200,
            saccadeThreshold: 100,
            tremorAmount: 0.5,
            ...config
        };

        // WebGPU objects
        this.device = null;
        this.context = null;
        this.computePipeline = null;
        this.stateBufferA = null;  // Double-buffered
        this.stateBufferB = null;
        this.inputBuffer = null;
        this.outputBuffer = null;
        this.bindGroupA = null;  // Read from A, write to B
        this.bindGroupB = null;  // Read from B, write to A
        this.readBuffer = false;  // Which buffer to read from

        // Shader module
        this.shaderModule = null;

        // Fallback flag
        this.useCPUFallback = false;

        // Initialize
        this._initialized = false;
    }

    /**
     * Initialize WebGPU device and compute pipeline
     */
    async init() {
        try {
            // Check for WebGPU support
            if (!navigator.gpu) {
                console.warn('WebGPU not supported, using CPU fallback');
                this.useCPUFallback = true;
                this._initialized = true;
                return false;
            }

            // Request adapter and device
            const adapter = await navigator.gpu.requestAdapter({
                powerPreference: 'high-performance'
            });

            if (!adapter) {
                console.warn('No GPU adapter found, using CPU fallback');
                this.useCPUFallback = true;
                this._initialized = true;
                return false;
            }

            this.device = await adapter.requestDevice();

            // Load shader
            const shaderCode = await this._loadShader();
            this.shaderModule = this.device.createShaderModule({
                code: shaderCode
            });

            // Create buffers (double-buffered for continuous updates)
            const stateBufferSize = 8 * 4 + 8 + 4; // vec2(4)*4 + f64*2 + u32*4 = ~64 bytes
            const bufferSize = 256;  // Round up for alignment

            this.stateBufferA = this.device.createBuffer({
                size: bufferSize,
                usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST | GPUBufferUsage.COPY_SRC,
                mappedAtCreation: false
            });

            this.stateBufferB = this.device.createBuffer({
                size: bufferSize,
                usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST | GPUBufferUsage.COPY_SRC,
                mappedAtCreation: false
            });

            this.inputBuffer = this.device.createBuffer({
                size: bufferSize,
                usage: GPUBufferUsage.UNIFORM | GPUBufferUsage.COPY_DST,
            });

            this.outputBuffer = this.device.createBuffer({
                size: bufferSize,
                usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC,
            });

            this.stagingBuffer = this.device.createBuffer({
                size: bufferSize,
                usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST,
            });

            // Create compute pipeline
            this.computePipeline = this.device.createComputePipeline({
                layout: 'auto',
                compute: {
                    module: this.shaderModule,
                    entryPoint: 'computeSaccade',
                },
            });

            // Create bind groups (double-buffered)
            this.bindGroupA = this.device.createBindGroup({
                layout: this.computePipeline.getBindGroupLayout(0),
                entries: [
                    { binding: 0, resource: { buffer: this.stateBufferA } },
                    { binding: 1, resource: { buffer: this.stateBufferB } },
                    { binding: 2, resource: { buffer: this.inputBuffer } },
                ],
            });

            this.bindGroupB = this.device.createBindGroup({
                layout: this.computePipeline.getBindGroupLayout(0),
                entries: [
                    { binding: 0, resource: { buffer: this.stateBufferB } },
                    { binding: 1, resource: { buffer: this.stateBufferA } },
                    { binding: 2, resource: { buffer: this.inputBuffer } },
                ],
            });

            this._initialized = true;
            return true;

        } catch (error) {
            console.warn('WebGPU initialization failed, using CPU fallback:', error);
            this.useCPUFallback = true;
            this._initialized = true;
            return false;
        }
    }

    /**
     * Load WGSL shader code
     */
    async _loadShader() {
        try {
            const response = await fetch('./saccade_compute.wgsl');
            return await response.text();
        } catch (error) {
            console.error('Failed to load shader:', error);
            // Fallback to inline shader
            return this._getInlineShader();
        }
    }

    /**
     * Get inline shader as fallback
     */
    _getInlineShader() {
        return `
struct SaccadeState {
    position: vec2f,
    target: vec2f,
    startPos: vec2f,
    velocity: vec2f,
    settlingFactor: f32,
    phase: u32,
    saccadeStartTime: f64,
    settlingStartTime: f64,
};

struct SaccadeConfig {
    saccadeDuration: f32,
    settlingDuration: f32,
    saccadeThreshold: f32,
    tremorAmount: f32,
};

@group(0) @binding(0) var<storage, read> inputState: SaccadeState;
@group(0) @binding(1) var<storage, read_write> outputState: SaccadeState;
@group(0) @binding(2) var<uniform> config: SaccadeConfig;

fn easeOutCubic(t: f32) -> f32 {
    let one_minus_t = 1.0 - t;
    return 1.0 - (one_minus_t * one_minus_t * one_minus_t);
}

fn exponentialSettling(t: f32) -> f32 {
    return 1.0 - exp(-5.0 * t);
}

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    outputState.position = inputState.position;
    outputState.target = inputState.target;
    outputState.startPos = inputState.startPos;
    outputState.settlingFactor = inputState.settlingFactor;
    outputState.phase = inputState.phase;
    outputState.saccadeStartTime = inputState.saccadeStartTime;
    outputState.settlingStartTime = inputState.settlingStartTime;

    let currentTime = f64(inputState.phase);  // Pass current time through phase for now

    if (inputState.phase == 1u) {  // saccade
        let elapsed = f32(currentTime - inputState.saccadeStartTime);
        let progress = min(elapsed / config.saccadeDuration, 1.0);
        let eased = easeOutCubic(progress);
        let direction = inputState.target - inputState.startPos;
        outputState.position = inputState.startPos + direction * eased;
        outputState.velocity = direction * eased / max(elapsed / 1000.0, 0.001);

        if (progress >= 1.0) {
            outputState.phase = 2u;
            outputState.settlingStartTime = currentTime;
            outputState.settlingFactor = 0.0;
        }
    } else if (inputState.phase == 2u) {  // settling
        let elapsed = f32(currentTime - inputState.settlingStartTime);
        let progress = elapsed / config.settlingDuration;
        outputState.settlingFactor = exponentialSettling(progress);
        let decayFactor = exp(-5.0 * progress);
        let direction = inputState.target - inputState.position;
        outputState.velocity = direction * (1.0 - decayFactor) * 10.0;

        if (progress >= 1.0) {
            outputState.phase = 3u;
            outputState.settlingFactor = 1.0;
        }
    } else if (inputState.phase == 3u) {  // fixation
        let timeHash = fract(f32(currentTime) * 0.0001);
        let tremorX = (timeHash - 0.5) * config.tremorAmount;
        let tremorY = (fract(timeHash * 1.618) - 0.5) * config.tremorAmount;
        outputState.position = inputState.position + vec2f(tremorX, tremorY);
        outputState.velocity = vec2f(0.0, 0.0);
    }
}
`;
    }

    /**
     * Compute saccade update using GPU
     */
    async compute(state, currentTime, deltaTime) {
        if (!this._initialized) {
            await this.init();
        }

        if (this.useCPUFallback) {
            return this._computeCPU(state, currentTime, deltaTime);
        }

        const startTime = performance.now();

        try {
            // Write input data
            const inputData = new Float32Array([
                state.position.x, state.position.y,
                state.target.x, state.target.y,
                state.startPos.x, state.startPos.y,
                state.velocity.x, state.velocity.y,
                state.settlingFactor,
                state.phase,
                currentTime,
                deltaTime
            ]);

            this.device.queue.writeBuffer(this.inputBuffer, 0, inputData);

            // Select buffers based on current read state
            const bindGroup = this.readBuffer ? this.bindGroupB : this.bindGroupA;
            const readBuffer = this.readBuffer ? this.stateBufferB : this.stateBufferA;
            const writeBuffer = this.readBuffer ? this.stateBufferA : this.stateBufferB;

            // Also write current state to read buffer
            this.device.queue.writeBuffer(readBuffer, 0, inputData);

            // Create command encoder
            const commandEncoder = this.device.createCommandEncoder();
            const passEncoder = commandEncoder.beginComputePass();
            passEncoder.setPipeline(this.computePipeline);
            passEncoder.setBindGroup(0, bindGroup);
            passEncoder.dispatchWorkgroups(1);
            passEncoder.end();

            // Copy output to staging buffer
            commandEncoder.copyBufferToBuffer(writeBuffer, 0, this.stagingBuffer, 0, 256);

            // Submit commands
            this.device.queue.submit([commandEncoder.finish()]);

            // Map staging buffer and read results
            await this.stagingBuffer.mapAsync(GPUMapMode.READ);
            const resultData = new Float32Array(this.stagingBuffer.getMappedRange().slice(0));
            this.stagingBuffer.unmap();

            // Toggle read buffer
            this.readBuffer = !this.readBuffer;

            const elapsed = performance.now() - startTime;

            return {
                position: { x: resultData[0], y: resultData[1] },
                target: { x: resultData[2], y: resultData[3] },
                startPos: { x: resultData[4], y: resultData[5] },
                velocity: { x: resultData[6], y: resultData[7] },
                settlingFactor: resultData[8],
                phase: Math.round(resultData[9]),
                computeTime: elapsed,
                usedGPU: true
            };

        } catch (error) {
            console.warn('GPU compute failed, falling back to CPU:', error);
            this.useCPUFallback = true;
            return this._computeCPU(state, currentTime, deltaTime);
        }
    }

    /**
     * CPU fallback implementation
     */
    _computeCPU(state, currentTime, deltaTime) {
        const startTime = performance.now();

        const result = { ...state };

        switch (state.phase) {
            case 1: // saccade
                const elapsedSaccade = currentTime - state.saccadeStartTime;
                const progress = Math.min(elapsedSaccade / this.config.saccadeDuration, 1);
                const eased = 1 - Math.pow(1 - progress, 3);
                const direction = {
                    x: state.target.x - state.startPos.x,
                    y: state.target.y - state.startPos.y
                };
                result.position = {
                    x: state.startPos.x + direction.x * eased,
                    y: state.startPos.y + direction.y * eased
                };
                result.velocity = {
                    x: direction.x * eased / Math.max(elapsedSaccade / 1000, 0.001),
                    y: direction.y * eased / Math.max(elapsedSaccade / 1000, 0.001)
                };
                if (progress >= 1) {
                    result.phase = 2; // settling
                    result.settlingStartTime = currentTime;
                    result.settlingFactor = 0;
                }
                break;

            case 2: // settling
                const elapsedSettling = currentTime - state.settlingStartTime;
                const progressSettling = elapsedSettling / this.config.settlingDuration;
                result.settlingFactor = 1 - Math.exp(-5 * progressSettling);
                const decayFactor = Math.exp(-5 * progressSettling);
                const dir = {
                    x: state.target.x - state.position.x,
                    y: state.target.y - state.position.y
                };
                result.velocity = {
                    x: dir.x * (1 - decayFactor) * 10,
                    y: dir.y * (1 - decayFactor) * 10
                };
                if (progressSettling >= 1) {
                    result.phase = 3; // fixation
                    result.settlingFactor = 1;
                }
                break;

            case 3: // fixation
                const timeHash = (currentTime * 0.0001) % 1;
                result.position = {
                    x: state.position.x + (timeHash - 0.5) * this.config.tremorAmount,
                    y: state.position.y + ((timeHash * 1.618) % 1 - 0.5) * this.config.tremorAmount
                };
                result.velocity = { x: 0, y: 0 };
                break;
        }

        const elapsed = performance.now() - startTime;

        return {
            ...result,
            computeTime: elapsed,
            usedGPU: false
        };
    }

    /**
     * Check if using GPU
     */
    isUsingGPU() {
        return !this.useCPUFallback && this.device !== null;
    }

    /**
     * Get GPU info
     */
    async getGPUInfo() {
        if (this.useCPUFallback) {
            return { available: false, usingCPU: true };
        }

        if (!this.device) {
            await this.init();
        }

        if (!this.device) {
            return { available: false, usingCPU: true };
        }

        const adapter = await this.device.adapter;
        return {
            available: true,
            usingCPU: false,
            adapter: {
                vendor: await adapter.requestVendorInfo(),
                architecture: await adapter.requestAdapterInfo(),
            }
        };
    }

    /**
     * Cleanup resources
     */
    destroy() {
        if (this.stateBufferA) this.stateBufferA.destroy();
        if (this.stateBufferB) this.stateBufferB.destroy();
        if (this.inputBuffer) this.inputBuffer.destroy();
        if (this.outputBuffer) this.outputBuffer.destroy();
        if (this.stagingBuffer) this.stagingBuffer.destroy();
        this.device = null;
        this._initialized = false;
    }
}

// Export
if (typeof window !== 'undefined') {
    window.SaccadeGPU = SaccadeGPU;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SaccadeGPU };
}
