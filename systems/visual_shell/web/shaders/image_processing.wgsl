// ============================================
// GEOMETRY OS - IMAGE PROCESSING KERNELS
// Phase 3: GPU Pattern Detection
// ============================================

// --- BINDINGS ---
// 0: Source Image (ReadOnly Storage) - Treated as Linear Array
@group(0) @binding(0) var<storage, read> input_buffer: array<f32>;

// 1: Destination Image (ReadWrite Storage) - Linear Array
@group(0) @binding(1) var<storage, read_write> output_buffer: array<f32>;

// 2: Uniforms (Width, Height, Threshold)
struct Uniforms {
    width: u32,
    height: u32,
    threshold: f32,
    mode: u32, // 0=Sobel, 1=Grayscale, 2=Blur
};

@group(0) @binding(2) var<uniform> uniforms: Uniforms;

// --- UTILITIES ---

fn get_pixel(x: u32, y: u32) -> f32 {
    if (x >= uniforms.width || y >= uniforms.height) {
        return 0.0;
    }
    let idx = y * uniforms.width + x;
    return input_buffer[idx];
}

fn set_pixel(x: u32, y: u32, val: f32) {
    if (x >= uniforms.width || y >= uniforms.height) {
        return;
    }
    let idx = y * uniforms.width + x;
    output_buffer[idx] = val;
}

// --- KERNELS ---

// Sobel X Kernel:
// -1  0  1
// -2  0  2
// -1  0  1

// Sobel Y Kernel:
// -1 -2 -1
//  0  0  0
//  1  2  1

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    let x = id.x;
    let y = id.y;

    if (x >= uniforms.width || y >= uniforms.height) {
        return;
    }
    
    // Grayscale Mode
    if (uniforms.mode == 1u) {
        // Assume input is packed RGBA float? Or just planar?
        // This simple kernel assumes single channel float input (already grayscale or extracted channel)
        // If input is RGBA, strides would be different.
        // For Milestone 3, we assume pre-processed grayscale or operating on component.
        // Let's implement a passthrough for test.
        let val = get_pixel(x, y);
        set_pixel(x, y, val);
        return;
    }

    // Sobel Edge Detection
    if (uniforms.mode == 0u) {
        let p00 = get_pixel(x - 1u, y - 1u);
        let p10 = get_pixel(x, y - 1u);
        let p20 = get_pixel(x + 1u, y - 1u);
        
        let p01 = get_pixel(x - 1u, y);
        let p21 = get_pixel(x + 1u, y);
        
        let p02 = get_pixel(x - 1u, y + 1u);
        let p12 = get_pixel(x, y + 1u);
        let p22 = get_pixel(x + 1u, y + 1u);

        let gx = (p20 + 2.0 * p21 + p22) - (p00 + 2.0 * p01 + p02);
        let gy = (p02 + 2.0 * p12 + p22) - (p00 + 2.0 * p10 + p20);

        let mag = sqrt(gx * gx + gy * gy);
        
        // Threshold
        var result = mag;
        if (mag < uniforms.threshold) {
            result = 0.0;
        } else {
            result = 1.0; // Binarize for simple edge map
        }
        
        set_pixel(x, y, result);
    }
}
