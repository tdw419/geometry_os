export class GPUTensor {
    /**
     * @param {GPUDevice} device 
     * @param {GPUMemoryManager} memoryManager 
     * @param {Array<number>} shape - Dimensions (e.g. [height, width, channels])
     * @param {GPUBuffer} heapBuffer - Shared memory buffer
     */
    constructor(device, memoryManager, shape, heapBuffer) {
        this.device = device;
        this.memoryManager = memoryManager;
        this.shape = shape;
        this.heapBuffer = heapBuffer;

        this.size = shape.reduce((a, b) => a * b, 1);
        this.byteLength = this.size * 4; // float32 = 4 bytes

        // Allocate GPU memory
        // memoryManager.malloc returns offset
        this.offset = this.memoryManager.malloc(this.byteLength);
        if (this.offset === -1) {
            throw new Error(`[GPUTensor] Failed to allocate ${this.byteLength} bytes.`);
        }
    }

    /**
     * Upload data from CPU to GPU
     * @param {Float32Array} data 
     */
    async upload(data) {
        if (!this.heapBuffer) throw new Error("Heap buffer not bound");
        if (data.length * 4 !== this.byteLength) {
            console.warn(`[GPUTensor] Data size specific mismatch. Expected ${this.byteLength}, got ${data.length * 4}`);
        }

        // Write to buffer
        // Note: writeBuffer takes typed array view directly.
        // It writes to 'heapBuffer' at 'offset'.
        this.device.queue.writeBuffer(
            this.heapBuffer,
            this.offset,
            data
        );
    }

    /**
     * Download data from GPU to CPU
     * @returns {Promise<Float32Array>}
     */
    async download() {
        if (!this.heapBuffer) throw new Error("Heap buffer not bound");

        const stagingBuffer = this.device.createBuffer({
            size: this.byteLength,
            usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST
        });

        const commandEncoder = this.device.createCommandEncoder();
        commandEncoder.copyBufferToBuffer(
            this.heapBuffer,
            this.offset,
            stagingBuffer,
            0,
            this.byteLength
        );
        this.device.queue.submit([commandEncoder.finish()]);

        await stagingBuffer.mapAsync(GPUMapMode.READ);
        const copyArray = new Float32Array(stagingBuffer.getMappedRange());
        // Create copy because mapped range is detached on unmap
        const result = new Float32Array(copyArray);
        stagingBuffer.unmap();

        return result;
    }

    dispose() {
        if (this.offset !== -1) {
            this.memoryManager.free(this.offset);
            this.offset = -1;
        }
    }
}
