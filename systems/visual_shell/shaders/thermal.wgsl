// Thermal Diagnostic Shader for Geometry OS
// Visualizes "hot" memory and CPU usage via heat-map gradients

struct ThermalUniforms {
    time: f32,
    intensity: f32,
    threshold_low: f32,
    threshold_high: f32,
}

@group(0) @binding(0) var<uniform> uniforms: ThermalUniforms;
@group(0) @binding(1) var input_texture: texture_2d<f32>;
@group(0) @binding(2) var output_texture: texture_storage_2d<rgba8unorm, write>;

// Heat gradient: black -> blue -> cyan -> green -> yellow -> red -> white
fn heat_color(value: f32) -> vec4<f32> {
    let v = clamp(value, 0.0, 1.0);

    if (v < 0.2) {
        // Black to blue
        return vec4<f32>(0.0, 0.0, v * 5.0, 1.0);
    } else if (v < 0.4) {
        // Blue to cyan
        let t = (v - 0.2) * 5.0;
        return vec4<f32>(0.0, t, 1.0, 1.0);
    } else if (v < 0.6) {
        // Cyan to green
        let t = (v - 0.4) * 5.0;
        return vec4<f32>(0.0, 1.0, 1.0 - t, 1.0);
    } else if (v < 0.8) {
        // Green to yellow
        let t = (v - 0.6) * 5.0;
        return vec4<f32>(t, 1.0, 0.0, 1.0);
    } else {
        // Yellow to red to white
        let t = (v - 0.8) * 5.0;
        return vec4<f32>(1.0, 1.0 - t * 0.5, t * 0.3, 1.0);
    }
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

    // Apply thermal mapping based on luminance (heat score from memory access)
    let heat_value = luminance * uniforms.intensity;
    let thermal_color = heat_color(heat_value);

    textureStore(output_texture, coords, thermal_color);
}
