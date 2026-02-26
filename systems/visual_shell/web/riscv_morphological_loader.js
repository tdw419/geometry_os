/**
 * Geometry OS: RISCV Morphological Loader
 *
 * Decodes morphological glyph textures (.rts.png) into RISC-V instructions.
 * Each pixel's R channel holds a charset index (visual glyph), G/B channels
 * hold a TokenID (execution lookup). A channel indicates executability (0xFF = exec).
 *
 * Output format: Uint32Array ready for GPU upload.
 */

export class RISCVOrphologicalLoader {
    /**
     * NOP instruction for invalid/non-executable pixels
     * RISC-V: addi x0, x0, 0
     */
    static NOP = 0x00000013;

    constructor() {
        // Stateless loader
    }

    /**
     * Load and decode a morphological texture into RISC-V instructions
     * @param {string} url - URL to the .rts.png file (without .meta.json extension)
     * @returns {Promise<{instructions: Uint32Array, glyphIndices: Uint8Array, metadata: object, pixelCount: number}>}
     */
    async load(url) {
        console.log(`[RISCVOrphologicalLoader] Loading: ${url}`);

        // 1. Fetch the .rts.png texture
        const textureResponse = await fetch(url);
        if (!textureResponse.ok) {
            throw new Error(`Failed to fetch texture: ${url}`);
        }

        const blob = await textureResponse.blob();
        const imageBitmap = await createImageBitmap(blob);

        // 2. Fetch the .meta.json metadata
        const metaUrl = url + '.meta.json';
        const metaResponse = await fetch(metaUrl);
        if (!metaResponse.ok) {
            throw new Error(`Failed to fetch metadata: ${metaUrl}`);
        }

        const metadata = await metaResponse.json();

        // 3. Validate metadata type
        if (metadata.type !== 'riscv-morphological') {
            throw new Error(`Invalid texture type: expected 'riscv-morphological', got '${metadata.type}'`);
        }

        // 4. Validate dictionary
        if (!metadata.dictionary || !metadata.dictionary.instructions) {
            throw new Error('Empty or missing dictionary in metadata');
        }

        const dictionary = metadata.dictionary.instructions;
        console.log(`[RISCVOrphologicalLoader] Dictionary size: ${dictionary.length} entries`);

        // 5. Extract pixels from ImageBitmap via Canvas
        const canvas = new OffscreenCanvas(imageBitmap.width, imageBitmap.height);
        const ctx = canvas.getContext('2d');
        ctx.drawImage(imageBitmap, 0, 0);

        const imageData = ctx.getImageData(0, 0, imageBitmap.width, imageBitmap.height);
        const pixels = imageData.data; // RGBA format, Uint8ClampedArray

        const pixelCount = imageBitmap.width * imageBitmap.height;

        // 6. Decode pixels to instructions
        const result = this._decodePixels(pixels, dictionary, pixelCount);

        console.log(`[RISCVOrphologicalLoader] Decoded ${result.instructions.length} instructions from ${pixelCount} pixels`);

        return {
            instructions: result.instructions,
            glyphIndices: result.glyphIndices,
            metadata: metadata,
            pixelCount: pixelCount
        };
    }

    /**
     * Decode TokenID from RGBA pixel values
     * TokenID = (G << 8) | B
     * @param {number} r - Red channel (0-255), charset index
     * @param {number} g - Green channel (0-255), TokenID high byte
     * @param {number} b - Blue channel (0-255), TokenID low byte
     * @param {number} a - Alpha channel (0-255), 0xFF = executable
     * @returns {number} TokenID (0-65535)
     */
    decodeTokenID(r, g, b, a) {
        return (g << 8) | b;
    }

    /**
     * Lookup instruction from dictionary by TokenID
     * Returns NOP for invalid TokenID or non-executable pixel
     * @param {number} tokenID - Token ID (0-65535)
     * @param {number[]} dictionary - Array of u32 RISC-V instructions
     * @param {number} alpha - Alpha channel value (0xFF = executable)
     * @returns {number} RISC-V instruction (u32)
     */
    lookupInstruction(tokenID, dictionary, alpha) {
        // Non-executable pixel (A != 0xFF) returns NOP
        if (alpha !== 0xFF) {
            return RISCVOrphologicalLoader.NOP;
        }

        // Out of bounds TokenID returns NOP
        if (tokenID < 0 || tokenID >= dictionary.length) {
            return RISCVOrphologicalLoader.NOP;
        }

        const instruction = dictionary[tokenID];

        // Undefined instruction returns NOP
        if (instruction === undefined || instruction === null) {
            return RISCVOrphologicalLoader.NOP;
        }

        return instruction;
    }

    /**
     * Decode all pixels to instructions
     * @private
     * @param {Uint8ClampedArray} pixels - RGBA pixel data
     * @param {number[]} dictionary - Instruction dictionary
     * @param {number} pixelCount - Number of pixels
     * @returns {{instructions: Uint32Array, glyphIndices: Uint8Array}}
     */
    _decodePixels(pixels, dictionary, pixelCount) {
        const instructions = new Uint32Array(pixelCount);
        const glyphIndices = new Uint8Array(pixelCount);

        for (let i = 0; i < pixelCount; i++) {
            const offset = i * 4;
            const r = pixels[offset];     // Charset index (glyph)
            const g = pixels[offset + 1]; // TokenID high byte
            const b = pixels[offset + 2]; // TokenID low byte
            const a = pixels[offset + 3]; // Executable flag

            // Store glyph index for visual rendering
            glyphIndices[i] = r;

            // Decode TokenID and lookup instruction
            const tokenID = this.decodeTokenID(r, g, b, a);
            instructions[i] = this.lookupInstruction(tokenID, dictionary, a);
        }

        return { instructions, glyphIndices };
    }
}

// Export to window for browser compatibility (matches project pattern)
if (typeof window !== 'undefined') {
    window.RISCVOrphologicalLoader = RISCVOrphologicalLoader;
}
