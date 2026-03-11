// Q4_0 format constants (aligned to 20 bytes = 5 pixels)
const Q4_BLOCK_SIZE: u32 = 32u;
const Q4_BYTES_PER_BLOCK: u32 = 20u;
const Q4_PIXELS_PER_BLOCK: u32 = 5u;

// ═══════════════════════════════════════════════════════════════════════════════
// HELPER FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════════

fn unpackFloat16(bits: u32) -> f32 {
    let sign = (bits >> 15u) & 1u;
    let exponent = (bits >> 10u) & 31u;
    let mantissa = bits & 1023u;

    if (exponent == 0u) {
        if (mantissa == 0u) { return 0.0; }
        return (f32(mantissa) / 1024.0) * pow(2.0, -14.0) * select(1.0, -1.0, sign == 1u);
    } else if (exponent == 31u) {
        return select(1e38, -1e38, sign == 1u); 
    } else {
        return (1.0 + f32(mantissa) / 1024.0) * pow(2.0, f32(exponent) - 15.0) * select(1.0, -1.0, sign == 1u);
    }
}

// ═══════════════════════════════════════════════════════════════════════════════
// MAIN DEQUANTIZATION FUNCTION (Texture-based)
// ═══════════════════════════════════════════════════════════════════════════════

fn dequantize_q4_block(block_idx: u32, output: ptr<function, array<f32, 32>>) {
    let pixel_start = block_idx * Q4_PIXELS_PER_BLOCK;
    
    // Load 5 pixels (20 bytes) from Hilbert atlas
    let p0 = textureLoad(brain_atlas, hilbert_d2xy(pixel_start, ATLAS_SIZE), 0);
    let p1 = textureLoad(brain_atlas, hilbert_d2xy(pixel_start + 1u, ATLAS_SIZE), 0);
    let p2 = textureLoad(brain_atlas, hilbert_d2xy(pixel_start + 2u, ATLAS_SIZE), 0);
    let p3 = textureLoad(brain_atlas, hilbert_d2xy(pixel_start + 3u, ATLAS_SIZE), 0);
    let p4 = textureLoad(brain_atlas, hilbert_d2xy(pixel_start + 4u, ATLAS_SIZE), 0);
    
    // Scale is stored in first 2 bytes of p0
    let scale_bits = p0.r | (p0.g << 8u);
    let scale = unpackFloat16(scale_bits);
    
    // 32 nibbles start at p0.b
    // Pixel 0: R(scale_low), G(scale_high), B(w0,w1), A(w2,w3)
    // Pixel 1: R(w4,w5), G(w6,w7), B(w8,w9), A(w10,w11)
    // ... and so on.
    
    var bytes: array<u32, 16>;
    bytes[0] = p0.b; bytes[1] = p0.a;
    bytes[2] = p1.r; bytes[3] = p1.g; bytes[4] = p1.b; bytes[5] = p1.a;
    bytes[6] = p2.r; bytes[7] = p2.g; bytes[8] = p2.b; bytes[9] = p2.a;
    bytes[10] = p3.r; bytes[11] = p3.g; bytes[12] = p3.b; bytes[13] = p3.a;
    bytes[14] = p4.r; bytes[15] = p4.g;
    
    for (var i: u32 = 0u; i < 16u; i++) {
        let b = bytes[i];
        (*output)[i * 2u] = scale * (f32((b >> 4u) & 15u) - 8.0);
        (*output)[i * 2u + 1u] = scale * (f32(b & 15u) - 8.0);
    }
}
