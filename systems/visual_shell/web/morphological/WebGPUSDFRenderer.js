/**
 * Geometry OS: WebGPU SDF Renderer
 *
 * GPU-accelerated signed distance field generation for morphological glyphs.
 * Uses compute shaders for parallel SDF computation.
 */

class WebGPUSDFRenderer {
    constructor() {
        this.device = null;
        this.pipeline = null;
        this.bindGroupLayout = null;
        this.bindGroup = null;

        // Buffers
        this.paramsBuffer = null;
        this.sequenceBuffer = null;
        this.metricsBuffer = null;
        this.outputTexture = null;

        // State
        this.initialized = false;
        this.size = 16;
    }

    /**
     * Initialize WebGPU device and create pipeline.
     */
    async init() {
        if (!navigator.gpu) {
            console.warn('[WebGPUSDFRenderer] WebGPU not supported, falling back to Canvas2D');
            return false;
        }

        try {
            const adapter = await navigator.gpu.requestAdapter();
            if (!adapter) {
                console.warn('[WebGPUSDFRenderer] No GPU adapter found');
                return false;
            }

            this.device = await adapter.requestDevice();
            await this._createPipeline();

            this.initialized = true;
            console.log('[WebGPUSDFRenderer] Initialized');
            return true;
        } catch (e) {
            console.error('[WebGPUSDFRenderer] Initialization failed:', e);
            return false;
        }
    }

    /**
     * Create compute pipeline for SDF generation.
     */
    async _createPipeline() {
        // Load shader
        const shaderCode = await this._loadShader('shaders/sdf_generator.wgsl');

        const shaderModule = this.device.createShaderModule({
            code: shaderCode
        });

        // Create bind group layout
        this.bindGroupLayout = this.device.createBindGroupLayout({
            entries: [
                {
                    binding: 0,
                    visibility: GPUShaderStage.COMPUTE,
                    buffer: { type: 'uniform' }
                },
                {
                    binding: 1,
                    visibility: GPUShaderStage.COMPUTE,
                    buffer: { type: 'read-only-storage' }
                },
                {
                    binding: 2,
                    visibility: GPUShaderStage.COMPUTE,
                    buffer: { type: 'storage' }
                },
                {
                    binding: 3,
                    visibility: GPUShaderStage.COMPUTE,
                    storageTexture: {
                        access: 'write-only',
                        format: 'r32float'
                    }
                }
            ]
        });

        // Create pipeline
        this.pipeline = this.device.createComputePipeline({
            layout: this.device.createPipelineLayout({
                bindGroupLayouts: [this.bindGroupLayout]
            }),
            compute: {
                module: shaderModule,
                entryPoint: 'main'
            }
        });

        // Create buffers
        this._createBuffers();
    }

    /**
     * Create GPU buffers.
     */
    _createBuffers() {
        // Params buffer (16 bytes aligned)
        this.paramsBuffer = this.device.createBuffer({
            size: 16,
            usage: GPUBufferUsage.UNIFORM | GPUBufferUsage.COPY_DST
        });

        // Sequence buffer (max 256 points * 8 bytes = 2048 bytes)
        this.sequenceBuffer = this.device.createBuffer({
            size: 256 * 8,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
        });

        // Metrics buffer (28 bytes, padded to 32)
        this.metricsBuffer = this.device.createBuffer({
            size: 32,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC
        });

        // Output texture
        this.outputTexture = this.device.createTexture({
            size: [this.size, this.size],
            format: 'r32float',
            usage: GPUTextureUsage.STORAGE_BINDING | GPUTextureUsage.COPY_SRC | GPUTextureUsage.TEXTURE_BINDING
        });
    }

    /**
     * Load shader from URL.
     */
    async _loadShader(url) {
        // For now, return embedded shader
        // In production, fetch from URL
        return `
struct SequenceParams {
    numPoints: u32,
    size: f32,
    smoothing: f32,
    padding: f32,
}

struct GlyphMetrics {
    minX: f32, maxX: f32, minY: f32, maxY: f32,
    centroidX: f32, centroidY: f32, _pad: f32,
}

@group(0) @binding(0) var<uniform> params: SequenceParams;
@group(0) @binding(1) var<storage, read> hilbertSequence: array<vec2<f32>>;
@group(0) @binding(2) var<storage, read_write> metrics: GlyphMetrics;
@group(0) @binding(3) var output: texture_storage_2d<r32float, write>;

fn pointToSegmentDistance(p: vec2<f32>, a: vec2<f32>, b: vec2<f32>) -> f32 {
    let ab = b - a;
    let ap = p - a;
    let abLenSq = dot(ab, ab);
    if (abLenSq < 0.0001) { return length(ap); }
    let t = clamp(dot(ap, ab) / abLenSq, 0.0, 1.0);
    return length(p - (a + t * ab));
}

fn computeCurveDistance(p: vec2<f32>, numPoints: u32) -> f32 {
    var minDist = 1e10;
    for (var i = 0u; i < numPoints - 1u; i++) {
        let dist = pointToSegmentDistance(p, hilbertSequence[i], hilbertSequence[i + 1u]);
        minDist = min(minDist, dist);
    }
    return minDist;
}

fn computeWindingNumber(p: vec2<f32>, numPoints: u32) -> f32 {
    var winding = 0.0;
    for (var i = 0u; i < numPoints; i++) {
        let j = (i + 1u) % numPoints;
        let a = hilbertSequence[i];
        let b = hilbertSequence[j];
        if ((a.y <= p.y && b.y > p.y) || (a.y > p.y && b.y <= p.y)) {
            let cross = (b.x - a.x) * (p.y - a.y) - (p.x - a.x) * (b.y - a.y);
            if ((a.y <= p.y) != (b.y <= p.y)) {
                winding += select(-1.0, 1.0, cross > 0.0);
            }
        }
    }
    return winding;
}

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let x = global_id.x;
    let y = global_id.y;
    let size = u32(params.size);
    if (x >= size || y >= size) { return; }

    let p = vec2<f32>(f32(x) + 0.5, f32(y) + 0.5);
    var dist = computeCurveDistance(p, params.numPoints);

    let winding = computeWindingNumber(p, params.numPoints);
    if (winding != 0.0) { dist = -dist; }

    let maxDist = params.size * 0.5;
    let normalized = clamp((dist / maxDist + 1.0) * 0.5, 0.0, 1.0);

    textureStore(output, vec2<i32>(i32(x), i32(y)), vec4<f32>(normalized, 0.0, 0.0, 1.0));
}
`;
    }

    /**
     * Generate SDF from Hilbert sequence.
     *
     * @param {Float32Array} sequence - Array of x,y pairs (256 elements max)
     * @param {number} numPoints - Number of valid points in sequence
     * @param {Object} options - { smoothing, padding }
     * @returns {Promise<Float32Array>} SDF distance field
     */
    async generateSDF(sequence, numPoints, options = {}) {
        if (!this.initialized) {
            return this._fallbackSDF(sequence, numPoints);
        }

        const smoothing = options.smoothing || 0.5;
        const padding = options.padding || 0.0;

        // Update params buffer
        const paramsData = new ArrayBuffer(16);
        const paramsView = new DataView(paramsData);
        paramsView.setUint32(0, numPoints, true);
        paramsView.setFloat32(4, this.size, true);
        paramsView.setFloat32(8, smoothing, true);
        paramsView.setFloat32(12, padding, true);
        this.device.queue.writeBuffer(this.paramsBuffer, 0, paramsData);

        // Update sequence buffer
        this.device.queue.writeBuffer(this.sequenceBuffer, 0, sequence);

        // Create bind group
        const bindGroup = this.device.createBindGroup({
            layout: this.bindGroupLayout,
            entries: [
                { binding: 0, buffer: this.paramsBuffer },
                { binding: 1, buffer: this.sequenceBuffer },
                { binding: 2, buffer: this.metricsBuffer },
                { binding: 3, resource: this.outputTexture.createView() }
            ]
        });

        // Dispatch compute
        const commandEncoder = this.device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();
        passEncoder.setPipeline(this.pipeline);
        passEncoder.setBindGroup(0, bindGroup);
        passEncoder.dispatchWorkgroups(1, 1, 1); // 16x16 = 1 workgroup
        passEncoder.end();

        // Read back results
        const readBuffer = this.device.createBuffer({
            size: this.size * this.size * 4,
            usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST
        });

        commandEncoder.copyTextureToBuffer(
            { texture: this.outputTexture },
            { buffer: readBuffer, bytesPerRow: this.size * 4 },
            [this.size, this.size]
        );

        this.device.queue.submit([commandEncoder.finish()]);

        // Map and read
        await readBuffer.mapAsync(GPUMapMode.READ);
        const result = new Float32Array(readBuffer.getMappedRange().slice(0));
        readBuffer.unmap();
        readBuffer.destroy();

        return result;
    }

    /**
     * Fallback SDF generation using Canvas2D.
     */
    _fallbackSDF(sequence, numPoints) {
        const sdf = new Float32Array(this.size * this.size);

        for (let y = 0; y < this.size; y++) {
            for (let x = 0; x < this.size; x++) {
                const px = x + 0.5;
                const py = y + 0.5;

                let minDist = Infinity;

                for (let i = 0; i < numPoints - 1; i++) {
                    const x1 = sequence[i * 2];
                    const y1 = sequence[i * 2 + 1];
                    const x2 = sequence[(i + 1) * 2];
                    const y2 = sequence[(i + 1) * 2 + 1];

                    const dist = this._pointToSegment(px, py, x1, y1, x2, y2);
                    minDist = Math.min(minDist, dist);
                }

                sdf[y * this.size + x] = Math.max(0, 1 - minDist / 8);
            }
        }

        return sdf;
    }

    /**
     * Point to line segment distance (fallback).
     */
    _pointToSegment(px, py, x1, y1, x2, y2) {
        const dx = x2 - x1;
        const dy = y2 - y1;
        const lenSq = dx * dx + dy * dy;

        if (lenSq < 0.0001) {
            return Math.sqrt((px - x1) ** 2 + (py - y1) ** 2);
        }

        const t = Math.max(0, Math.min(1, ((px - x1) * dx + (py - y1) * dy) / lenSq));
        const closestX = x1 + t * dx;
        const closestY = y1 + t * dy;

        return Math.sqrt((px - closestX) ** 2 + (py - closestY) ** 2);
    }

    /**
     * Check if WebGPU is available.
     */
    isAvailable() {
        return this.initialized;
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = WebGPUSDFRenderer;
}
