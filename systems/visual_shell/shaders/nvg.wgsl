// NVG (Night Vision Goggle) Diagnostic Shader for Geometry OS
// Highlights hidden or encrypted data fragments

struct NVGUniforms {
    time: f32,
    gain: f32,
    noise_intensity: f32,
    hidden_threshold: f32,
}

@group(0) @binding(0) var<uniform> uniforms: NVGUniforms;
@group(0) @binding(1) var input_texture: texture_2d<f32>;
@group(0) @binding(2) var output_texture: texture_storage_2d<rgba8unorm, write>;

// Pseudo-random noise for grain effect
fn random(coords: vec2<i32>, time: f32) -> f32 {
    let dot = f32(coords.x * 12 + coords.y * 783) + time;
    return fract(sin(dot) * 43758.5453);
}

@compute @workgroup_size(8, 8)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let dims = textureDimensions(input_texture);
    let coords = vec2<i32>(global_id.xy);

    if (coords.x >= i32(dims.x) || coords.y >= i32(dims.y)) {
        return;
    }

    let input_color = textureLoad(input_texture, coords, 0);
    let luminance = dot(input_color.rgb, vec3<f32>(0.299, 0.587, 0.114));

    // Apply gain (amplification) for night vision effect
    var amplified = luminance * uniforms.gain;

    // Detect "hidden" data (low alpha or specific markers)
    let is_hidden = input_color.a < uniforms.hidden_threshold;
    if (is_hidden) {
        amplified *= 2.0; // Extra bright for hidden data
    }

    // Add noise grain
    let noise = random(coords, uniforms.time) * uniforms.noise_intensity;
    amplified += noise;

    // Clamp to valid range
    amplified = clamp(amplified, 0.0, 1.0);

    // NVG green monochrome output
    let green = vec3<f32>(0.1, amplified, 0.05);
    let alpha = select(0.8, 1.0, is_hidden);

    textureStore(output_texture, coords, vec4<f32>(green, alpha));
}
