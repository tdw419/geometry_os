// CRT Diagnostic Shader for Geometry OS
// Visualizes Phase Alignment Stability (PAS) through scanline distortion
// Detects desynchronization between Rust kernel and 3D viewport

struct CRTUniforms {
    time: f32,
    pas_score: f32,           // Phase Alignment Stability (0 = unstable, 1 = stable)
    scanline_intensity: f32,  // Base scanline effect intensity
    distortion_amount: f32,   // Maximum distortion when PAS = 0
    resolution: vec2<f32>,    // Output resolution (x, y)
}

@group(0) @binding(0) var<uniform> uniforms: CRTUniforms;
@group(0) @binding(1) var input_texture: texture_2d<f32>;
@group(0) @binding(2) var output_texture: texture_storage_2d<rgba8unorm, write>;

// Pseudo-random function for jitter and noise
fn random(coords: vec2<f32>) -> f32 {
    return fract(sin(dot(coords, vec2<f32>(12.9898, 78.233))) * 43758.5453);
}

// Barrel distortion helper
fn barrel_distort(uv: vec2<f32>, amount: f32) -> vec2<f32> {
    let center = uv - 0.5;
    let dist = length(center);
    let distorted = uv + center * dist * dist * amount;
    return distorted;
}

@compute @workgroup_size(8, 8)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let dims = textureDimensions(input_texture);
    let frag_coord = vec2<f32>(global_id.xy);

    // Bounds check
    if (frag_coord.x >= f32(dims.x) || frag_coord.y >= f32(dims.y)) {
        return;
    }

    // Calculate normalized coordinates
    let uv = frag_coord / uniforms.resolution;

    // Distortion increases as PAS decreases (instability = more distortion)
    let instability = 1.0 - uniforms.pas_score;
    let distortion = instability * uniforms.distortion_amount;

    // Apply barrel distortion
    let distorted_uv = barrel_distort(uv, distortion);

    // Sample with distortion - check bounds
    let sample_coords = vec2<i32>(distorted_uv * uniforms.resolution);

    var color = vec4<f32>(0.0, 0.0, 0.0, 1.0);
    let in_bounds = sample_coords.x >= 0 && sample_coords.x < i32(dims.x) &&
                    sample_coords.y >= 0 && sample_coords.y < i32(dims.y);

    if (in_bounds) {
        color = textureLoad(input_texture, sample_coords, 0);
    }

    // Scanline effect - intensity increases with instability
    let scanline_freq = 0.5;
    let scanline = sin(frag_coord.y * scanline_freq) * 0.5 + 0.5;
    let scanline_mod = 1.0 - (1.0 - scanline) * uniforms.scanline_intensity * instability;
    color.rgb *= scanline_mod;

    // Chromatic aberration (RGB phosphor separation) - increases with instability
    if (instability > 0.1 && in_bounds) {
        let separation = distortion * 3.0;
        let r_offset = vec2<i32>(i32(separation), 0);
        let b_offset = vec2<i32>(i32(-separation), 0);

        let r_coords = clamp(sample_coords + r_offset, vec2<i32>(0, 0), vec2<i32>(dims.x - 1, dims.y - 1));
        let b_coords = clamp(sample_coords + b_offset, vec2<i32>(0, 0), vec2<i32>(dims.x - 1, dims.y - 1));

        color.r = textureLoad(input_texture, r_coords, 0).r;
        color.b = textureLoad(input_texture, b_coords, 0).b;
    }

    // Vignette effect - darker at edges
    let center = uv - 0.5;
    let dist_from_center = length(center);
    let vignette = 1.0 - dist_from_center * 0.8;
    color.rgb *= vignette;

    // Horizontal sync jitter when PAS is very low (severe desync)
    if (uniforms.pas_score < 0.3) {
        let jitter_intensity = (0.3 - uniforms.pas_score) / 0.3;
        let jitter = (random(vec2<f32>(uv.x, floor(frag_coord.y / 4.0) + uniforms.time)) - 0.5) * jitter_intensity * 0.15;
        color.rgb += jitter;
    }

    // Random noise when unstable (simulates CRT static)
    if (uniforms.pas_score < 0.5) {
        let noise_intensity = (0.5 - uniforms.pas_score) * 0.1;
        let noise = (random(uv + uniforms.time * 0.1) - 0.5) * noise_intensity;
        color.rgb += noise;
    }

    // Slight green phosphor tint (authentic CRT look)
    color.rgb = color.rgb * vec3<f32>(0.95, 1.0, 0.9);

    textureStore(output_texture, vec2<i32>(global_id.xy), color);
}
