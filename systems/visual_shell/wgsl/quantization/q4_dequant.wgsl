/**
 * Q4_0 Dequantization Shader
 *
 * GGUF-style Q4_0 quantization format dequantization for LLM weights.
 * 8:1 compression ratio with minimal loss in inference quality.
 *
 * Format:
 * - Block size: 32 weights
 * - Storage per block: 18 bytes (2 bytes fp16 scale + 16 bytes packed 4-bit weights)
 * - Dequantization: value = scale × (weight_4bit - 8)
 */

// Q4_0 format constants
const Q4_BLOCK_SIZE: u32 = 32u;
const Q4_BYTES_PER_BLOCK: u32 = 18u;

// ═══════════════════════════════════════════════════════════════════════════════
// HELPER FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════════

fn unpackFloat16(bits: u32) -> f32 {
    /**
     * Unpack fp16 bits to f32.
     * Direct bit manipulation for precise reconstruction.
     */
    let fp16 = u16(bits & 0xFFFFu);
    let sign = (i32(fp16) >> 15) & 1;
    let exponent = (i32(fp16) >> 10) & 31;
    let mantissa = fp16 & 1023u;

    if (exponent == 0) {
        // Subnormal number
        if (mantissa == 0) {
            return select(-0.0, 0.0, sign == 0u);
        }
        let m = f32(mantissa) / 1024.0;
        return select(-m, m, sign == 0u) * 2.0 - 14.0;
    } else if (exponent == 31) {
        // Infinity or NaN
        return select(f32(-infinity), f32(infinity), sign == 0u);
    } else {
        // Normal number
        let m = f32(mantissa) / 1024.0 + 1.0;
        let e = f32(exponent) - 15.0;
        return select(-m, m, sign == 0u) * pow(2.0, e);
    }
}

fn unpack_nibble(data: array<u32>, byte_idx: u32, is_high: bool) -> u32 {
    /**
     * Extract 4-bit nibble from packed data.
     *
     * Args:
     *   data: Array of u32 containing packed bytes
     *   byte_idx: Index of byte containing the nibble
     *   is_high: True if extracting high nibble, False for low
     *
     * Returns:
     *   4-bit value (0-15)
     */
    // Calculate which u32 element contains the byte
    let word_idx = byte_idx / 4u;
    let word = data[word_idx];

    // Position within the u32
    let byte_pos_in_word = byte_idx % 4u;

    // Shift to extract the byte
    let shifted_word = word >> (byte_pos_in_word * 8u);
    let byte = u8(shifted_word & 255u);

    // Extract nibble
    if (is_high) {
        return u32(byte >> 4u);
    } else {
        return u32(byte & 15u);
    }
}

// ═══════════════════════════════════════════════════════════════════════════════
// MAIN DEQUANTIZATION FUNCTION
// ═══════════════════════════════════════════════════════════════════════════════

fn dequantize_q4_block(quant_data: array<u32>, block_start: u32, output: ptr<function, array<f32, 32>>) {
    /**
     * Dequantize one Q4_0 block to float32.
     *
     * Args:
     *   quant_data: Packed quantization data (scale + weights)
     *   block_start: Start index in quant_data
     *   output: Pointer to output array (32 f32 values)
     *
     * Format:
     *   - bytes 0-1: fp16 scale
     *   - bytes 2-17: 16 bytes of packed 4-bit weights (32 nibbles = 32 weights)
     *   - bytes 18+: next block
     */

    // Extract fp16 scale from first 2 bytes
    let scale_bytes = array<u32, 1u>();
    scale_bytes[0u] = quant_data[block_start];

    // Reconstruct scale from two bytes
    let scale_bits = (scale_bytes[0u] >> 16u) & 65535u;
    let scale = unpackFloat16(scale_bits);

    // Process each 4-bit weight
    var output_array = *output;

    // Each byte contains 2 weights (high and low nibble)
    for (var i: u32 = 0u; i < 16u; i++) {
        let byte_idx = i + 1u; // Skip scale bytes (bytes 0-1)

        // High nibble (first 4 bits of byte)
        let high_nibble = unpack_nibble(quant_data, byte_idx, true);
        let high_weight = scale * f32(high_nibble - 8i);
        output_array[i * 2u] = high_weight;

        // Low nibble (second 4 bits of byte)
        let low_nibble = unpack_nibble(quant_data, byte_idx, false);
        let low_weight = scale * f32(low_nibble - 8i);
        output_array[i * 2u + 1u] = low_weight;
    }
}