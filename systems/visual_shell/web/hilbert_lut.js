/**
 * Geometry OS: Hilbert Curve LUT Module (JavaScript)
 *
 * Ports the Python HilbertLUT class to JavaScript for browser execution.
 * Provides precomputed Hilbert curve lookup tables for fast spatial mapping.
 *
 * The Hilbert curve preserves spatial locality, ensuring that nearby
 * linear indices map to nearby 2D coordinates. This is crucial
 * for the "Screen is the Hard Drive" architecture where code structure
 * should be visually coherent.
 *
 * @module hilbert_lut
 */

class HilbertLUT {
    /**
     * Convert Hilbert distance to (x, y) coordinates.
     * @param {number} n - Grid size (must be power of 2)
     * @param {number} d - Distance along the curve (0 to n²-1)
     * @returns {[number, number]} - [x, y] coordinates
     * @static
     */
    static d2xy(n, d) {
        let x = 0, y = 0;
        let s = 1;
        let tempD = d;

        while (s < n) {
            const rx = 1 & (tempD >> 1);
            const ry = 1 & (tempD ^ rx);

            // Rotate/flip quadrant
            if (ry === 0) {
                if (rx === 1) {
                    x = s - 1 - x;
                    y = s - 1 - y;
                }
                // Swap x and y
                [x, y] = [y, x];
            }

            // Add offset for this level
            x += s * rx;
            y += s * ry;

            tempD = tempD >> 2; // tempD //= 4
            s = s * 2;
        }

        return [x, y];
    }

    /**
     * Convert (x, y) coordinates to Hilbert distance.
     * @param {number} n - Grid size (must be power of 2)
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @returns {number} - Distance along the curve
     * @static
     */
    static xy2d(n, x, y) {
        let d = 0;
        let s = 1;
        let tempX = x;
        let tempY = y;

        while (s < n) {
            const rx = (tempX & s) > 0 ? 1 : 0;
            const ry = (tempY & s) > 0 ? 1 : 0;

            d += s * s * ((3 * rx) ^ ry);

            // Rotate/flip
            if (ry === 0) {
                if (rx === 1) {
                    tempX = s - 1 - tempX;
                    tempY = s - 1 - tempY;
                }
                [tempX, tempY] = [tempY, tempX];
            }

            s = s * 2;
        }

        return d;
    }

    /**
     * Generate a Hilbert LUT for a given order.
     * @param {number} order - Hilbert curve order (grid size = 2^order)
     * @returns {Array<Array<number>>} - Array of [x, y] coordinates indexed by distance
     * @static
     */
    static generateLUT(order) {
        const gridSize = 2 ** order;
        const totalPixels = gridSize * gridSize;
        const lut = new Array(totalPixels);

        console.log(`[*] Generating Hilbert LUT for order ${order} (grid ${gridSize}×${gridSize})...`);

        for (let d = 0; d < totalPixels; d++) {
            const [x, y] = this.d2xy(gridSize, d);
            lut[d] = [x, y];
        }

        console.log(`    Generated ${totalPixels} coordinates`);
        return lut;
    }

    /**
     * Cached LUT storage
     * @private
     */
    static _cache = new Map();

    /**
     * Get or generate a cached Hilbert LUT for a given order.
     * @param {number} order - Hilbert curve order (grid size = 2^order)
     * @returns {Array<Array<number>>} - Array of [x, y] coordinates indexed by distance
     * @static
     */
    static getLUT(order) {
        if (this._cache.has(order)) {
            console.log(`[*] Using cached Hilbert LUT for order ${order}`);
            return this._cache.get(order);
        }

        const lut = this.generateLUT(order);
        this._cache.set(order, lut);
        return lut;
    }

    /**
     * Clear the LUT cache
     * @static
     */
    static clearCache() {
        this._cache.clear();
        console.log('[*] Cleared Hilbert LUT cache');
    }

    /**
     * Get cache statistics
     * @returns {Object} Cache statistics
     * @static
     */
    static getCacheInfo() {
        return {
            cached: this._cache.size > 0,
            count: this._cache.size,
            orders: Array.from(this._cache.keys())
        };
    }

    /**
     * Calculate the required Hilbert order for a given image size.
     * @param {number} width - Image width in pixels
     * @param {number} height - Image height in pixels
     * @returns {number} - Required Hilbert order
     * @static
     */
    static calculateOrder(width, height) {
        const maxDim = Math.max(width, height);
        return Math.ceil(Math.log2(maxDim));
    }
}

/**
 * HilbertLUTBuilder - Utility for building and working with Hilbert curves
 */
class HilbertLUTBuilder {
    constructor(order = null) {
        this.order = order;
        this.lut = null;
        this.gridSize = null;

        if (order !== null) {
            this.setOrder(order);
        }
    }

    /**
     * Set the Hilbert curve order and generate LUT
     * @param {number} order - Hilbert curve order
     */
    setOrder(order) {
        this.order = order;
        this.gridSize = 2 ** order;
        this.lut = HilbertLUT.getLUT(order);
        return this;
    }

    /**
     * Map linear data index to 2D pixel coordinates
     * @param {number} index - Linear data index
     * @returns {[number, number]} - [x, y] pixel coordinates
     */
    indexToPixel(index) {
        if (!this.lut) {
            throw new Error('LUT not initialized. Call setOrder() first.');
        }
        return this.lut[index];
    }

    /**
     * Map 2D pixel coordinates to linear data index
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @returns {number} - Linear data index
     */
    pixelToIndex(x, y) {
        if (!this.gridSize) {
            throw new Error('Grid size not initialized. Call setOrder() first.');
        }
        return HilbertLUT.xy2d(this.gridSize, x, y);
    }

    /**
     * Map a byte array to pixel coordinates using Hilbert curve
     * @param {Uint8Array} data - Byte array to map
     * @param {number} bytesPerPixel - Bytes per pixel (default: 4 for RGBA)
     * @returns {Array} - Array of [x, y, r, g, b, a] pixel data
     */
    mapBytesToPixels(data, bytesPerPixel = 4) {
        const pixels = [];
        const pixelCount = Math.ceil(data.length / bytesPerPixel);

        for (let i = 0; i < pixelCount; i++) {
            const [x, y] = this.indexToPixel(i);
            const offset = i * bytesPerPixel;

            const pixel = [x, y];
            for (let j = 0; j < bytesPerPixel && offset + j < data.length; j++) {
                pixel.push(data[offset + j]);
            }

            pixels.push(pixel);
        }

        return pixels;
    }

    /**
     * Extract byte array from pixel coordinates using Hilbert curve
     * @param {Uint8ClampedArray} pixelData - RGBA pixel data from ImageData
     * @param {number} width - Image width
     * @param {number} height - Image height
     * @param {number} maxLength - Maximum bytes to extract (default: all)
     * @returns {Uint8Array} - Extracted byte array
     */
    extractBytesFromPixels(pixelData, width, height, maxLength = Infinity) {
        // Calculate required order for this image size
        const order = HilbertLUT.calculateOrder(width, height);
        const gridSize = 2 ** order;

        // Create LUT if needed
        if (this.lut === null || this.order !== order) {
            this.setOrder(order);
        }

        const bytes = [];
        const pixelCount = Math.min(gridSize * gridSize, maxLength, Math.floor(pixelData.length / 4));

        for (let d = 0; d < pixelCount; d++) {
            const [x, y] = this.lut[d];

            // Skip if out of bounds
            if (x >= width || y >= height) {
                break;
            }

            // Extract RGBA bytes from pixel
            const offset = (y * width + x) * 4;
            bytes.push(
                pixelData[offset],     // R
                pixelData[offset + 1], // G
                pixelData[offset + 2], // B
                pixelData[offset + 3]  // A
            );
        }

        return new Uint8Array(bytes);
    }

    /**
     * Extract RISC-V instructions (4-byte aligned) from pixel data
     * @param {Uint8ClampedArray} pixelData - RGBA pixel data from ImageData
     * @param {number} width - Image width
     * @param {number} height - Image height
     * @param {boolean} littleEndian - Use little-endian byte order (default: true)
     * @returns {Uint32Array} - Array of 32-bit RISC-V instructions
     */
    extractInstructions(pixelData, width, height, littleEndian = true) {
        // Extract raw bytes first
        const rawBytes = this.extractBytesFromPixels(pixelData, width, height);

        // Convert to 32-bit instructions (4 bytes each)
        const instructionCount = Math.floor(rawBytes.length / 4);
        const instructions = new Uint32Array(instructionCount);

        const dataView = new DataView(rawBytes.buffer);
        for (let i = 0; i < instructionCount; i++) {
            instructions[i] = dataView.getUint32(i * 4, littleEndian);
        }

        console.log(`[*] Extracted ${instructionCount} RISC-V instructions from ${width}×${height} texture`);
        return instructions;
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.HilbertLUT = HilbertLUT;
    window.HilbertLUTBuilder = HilbertLUTBuilder;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        HilbertLUT,
        HilbertLUTBuilder
    };
}
