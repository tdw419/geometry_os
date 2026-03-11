/**
 * Geometry OS: GPU Memory Manager
 *
 * Manages dynamic memory allocation within the GPU's linear memory buffer.
 * Implements a simple First-Fit allocator for the 128MB GPU heap.
 *
 * Memory Map:
 * 0x00000000 - 0x01000000 (00-16MB): Code & Static Data (User/Kernel) - MANAGED
 * 0x01000000 - 0x02000000 (16-32MB): Framebuffer (RGBA8888) - RESERVED
 * 0x02000000 - 0x03000000 (32-48MB): MMIO & Peripherals - RESERVED
 * 0x03000000 - 0x03100000 (48-49MB): Page Tables (L1) - RESERVED
 * 0x03100000 - 0x08000000 (49-128MB): Extended Heap - MANAGED
 */

export class GPUMemoryManager {
    constructor(size = 128 * 1024 * 1024) {
        this.size = size;
        this.blocks = [
            { start: 0, size: size, free: true }
        ];

        // Reserved regions protection
        this.reserved = [
            { start: 0x01000000, size: 0x01000000, name: 'FRAMEBUFFER' }, // 16-32MB
            { start: 0x02000000, size: 0x01000000, name: 'MMIO' },        // 32-48MB
            { start: 0x03000000, size: 0x00100000, name: 'PAGE_TABLE_L1' } // 48-49MB (1MB reserved)
        ];

        // Mark reserved regions as used
        for (const r of this.reserved) {
            this.occupy(r.start, r.size);
        }
    }

    /**
     * Allocate memory block
     * @param {number} size - Bytes to allocate
     * @returns {number} - Offset address, or -1 if failed
     */
    malloc(size) {
        // Align to 16 bytes
        const alignedSize = (size + 15) & ~15;

        for (let i = 0; i < this.blocks.length; i++) {
            const block = this.blocks[i];

            // Basic First-Fit
            // Optimization: If allocating code (<16MB), try to find block in low memory first?
            // For now, simple first-fit.

            if (block.free && block.size >= alignedSize) {
                // Split block
                const remaining = block.size - alignedSize;
                const start = block.start;

                block.free = false;
                block.size = alignedSize;
                // block.start remains same

                if (remaining > 0) {
                    this.blocks.splice(i + 1, 0, {
                        start: start + alignedSize,
                        size: remaining,
                        free: true
                    });
                }

                console.log(`[GPU Memory] Allocated ${size} bytes at 0x${start.toString(16)}`);
                return start;
            }
        }

        console.error(`[GPU Memory] OOM: Failed to allocate ${size} bytes`);
        return -1;
    }

    /**
     * Free memory block
     * @param {number} ptr - Offset address
     */
    free(ptr) {
        const index = this.blocks.findIndex(b => b.start === ptr);
        if (index === -1) {
            console.error(`[GPU Memory] Free error: Pointer 0x${ptr.toString(16)} not found`);
            return;
        }

        const block = this.blocks[index];
        if (block.free) {
            console.warn(`[GPU Memory] Double free at 0x${ptr.toString(16)}`);
            return;
        }

        block.free = true;
        console.log(`[GPU Memory] Freed block at 0x${ptr.toString(16)}`);

        // Coalesce with next
        if (index + 1 < this.blocks.length && this.blocks[index + 1].free) {
            const next = this.blocks[index + 1];
            block.size += next.size;
            // Remove next
            this.blocks.splice(index + 1, 1);
        }

        // Coalesce with prev
        if (index > 0 && this.blocks[index - 1].free) {
            const prev = this.blocks[index - 1];
            prev.size += block.size;
            // Remove current (merged into prev)
            this.blocks.splice(index, 1);
        }
    }

    /**
     * Mark a specific region as occupied (internal use)
     * e.g. for reserving hardware buffers
     */
    occupy(start, size) {
        const end = start + size;
        let i = 0;

        while (i < this.blocks.length) {
            const block = this.blocks[i];
            const blockEnd = block.start + block.size;

            // Check overlap
            if (Math.max(start, block.start) < Math.min(end, blockEnd)) {

                if (!block.free) {
                    console.warn(`[GPU Memory] Reserved region collision at 0x${block.start.toString(16)}`);
                    i++;
                    continue;
                }

                // We need to carve out [start, end] from [block.start, blockEnd]
                // Case 1: Overlap is strictly inside block
                // [   Block   ]
                //    [ Res ]
                // -> [Free][Res][Free]

                const preSize = start - block.start;
                const postSize = blockEnd - end;

                if (preSize > 0 && postSize > 0) {
                    // Split into 3
                    this.blocks.splice(i, 1,
                        { start: block.start, size: preSize, free: true },
                        { start: start, size: size, free: false, reserved: true },
                        { start: end, size: postSize, free: true }
                    );
                    i += 3;
                    continue;
                }

                // Case 2: Overlap is at start
                if (preSize <= 0 && postSize > 0) {
                    this.blocks.splice(i, 1,
                        { start: start, size: size, free: false, reserved: true },
                        { start: end, size: postSize, free: true }
                    );
                    i += 2;
                    continue;
                }

                // Case 3: Overlap is at end
                if (preSize > 0 && postSize <= 0) {
                    this.blocks.splice(i, 1,
                        { start: block.start, size: preSize, free: true },
                        { start: start, size: size, free: false, reserved: true }
                    );
                    i += 2;
                    continue;
                }

                // Case 4: Exact match/Cover
                block.free = false;
                block.reserved = true;
                i++;
            } else {
                i++;
            }
        }
    }

    /**
     * Get fragmentation stats
     */
    getStats() {
        const total = this.size;
        const used = this.blocks.filter(b => !b.free).reduce((acc, b) => acc + b.size, 0);
        const free = total - used;
        const largestFree = Math.max(...this.blocks.filter(b => b.free).map(b => b.size), 0);

        return {
            total: this.#formatBytes(total),
            used: this.#formatBytes(used),
            free: this.#formatBytes(free),
            utilization: ((used / total) * 100).toFixed(1) + '%',
            largestFree: this.#formatBytes(largestFree),
            blocks: this.blocks.length
        };
    }

    #formatBytes(bytes) {
        if (bytes < 1024) return bytes + ' B';
        else if (bytes < 1048576) return (bytes / 1024).toFixed(1) + ' KB';
        else return (bytes / 1048576).toFixed(1) + ' MB';
    }
}
