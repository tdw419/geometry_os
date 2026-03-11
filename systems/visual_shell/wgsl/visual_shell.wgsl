// Visual Shell WGSL Shader
// Renders neural state as morphological texture with glassmorphism effects

struct Uniforms {
    resolution: vec2<f32>,
    time: f32,
    confidence: f32,
};

@group(0) @binding(0)
var<uniform> uniforms: Uniforms;

@group(0) @binding(1)
var neural_texture: texture_2d<f32>;

@group(0) @binding(2)
var sampler_neural: sampler;

// Design token colors (can be made uniforms for dynamic updates)
const COLOR_BG: vec3<f32> = vec3<f32>(0.02, 0.02, 0.02); // #050505
const COLOR_HIGH_ACTIVITY: vec3<f32> = vec3<f32>(1.0, 0.3, 0.3); // #ff4d4d
const COLOR_MEDIUM_ACTIVITY: vec3<f32> = vec3<f32>(1.0, 0.84, 0.0); // #ffd700
const COLOR_LOW_ACTIVITY: vec3<f32> = vec3<f32>(0.25, 0.41, 0.88); // #4169e1
const COLOR_IDLE: vec3<f32> = vec3<f32>(0.18, 0.2, 0.21); // #2d3436

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
};

@vertex
fn vertex_main(
    @builtin(vertex_index) vertex_index: u32
) -> VertexOutput {
    var positions = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(1.0, 1.0)
    );
    
    var out: VertexOutput;
    out.position = vec4<f32>(positions[vertex_index], 0.0, 1.0);
    out.uv = (positions[vertex_index] + 1.0) * 0.5;
    out.uv.y = 1.0 - out.uv.y; // Flip Y for texture coordinates
    
    return out;
}

// Get color based on activation level
fn get_activation_color(activation: f32) -> vec3<f32> {
    if (activation >= 0.8) {
        return COLOR_HIGH_ACTIVITY;
    } else if (activation >= 0.5) {
        return COLOR_MEDIUM_ACTIVITY;
    } else if (activation >= 0.2) {
        return COLOR_LOW_ACTIVITY;
    } else {
        return COLOR_IDLE;
    }
}

// Apply glow effect
fn apply_glow(color: vec3<f32>, intensity: f32) -> vec3<f32> {
    return color + color * intensity * 0.5;
}

// Apply glassmorphism blur (simplified)
fn apply_glassmorphism(color: vec3<f32>, uv: vec2<f32>) -> vec3<f32> {
    let blur_radius = 2.0;
    var blurred: vec3<f32> = vec3<f32>(0.0);
    var count: f32 = 0.0;
    
    for (var dy: i32 = -2; dy <= 2; dy++) {
        for (var dx: i32 = -2; dx <= 2; dx++) {
            let offset = vec2<f32>(f32(dx), f32(dy)) / uniforms.resolution;
            let sample_uv = uv + offset;
            let sample_color = textureSample(neural_texture, sampler_neural, sample_uv);
            blurred += sample_color.rgb;
            count += 1.0;
        }
    }
    
    blurred /= count;
    
    // Blend original with blurred for glass effect
    let glass_opacity = 0.6;
    return mix(color, blurred, glass_opacity);
}

// Draw a circle
fn draw_circle(uv: vec2<f32>, center: vec2<f32>, radius: f32, color: vec3<f32>) -> vec4<f32> {
    let dist = distance(uv, center);
    let alpha = smoothstep(radius, radius - 0.01, dist);
    return vec4<f32>(color, alpha);
}

// Draw a glow around a circle
fn draw_glow(uv: vec2<f32>, center: vec2<f32>, radius: f32, color: vec3<f32>) -> vec4<f32> {
    let dist = distance(uv, center);
    let glow_radius = radius * 2.0;
    let alpha = smoothstep(glow_radius, radius, dist) * 0.5;
    return vec4<f32>(color, alpha);
}

@fragment
fn fragment_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Sample neural state texture
    let neural_sample = textureSample(neural_texture, sampler_neural, in.uv);
    
    // Extract neural components
    let activation = neural_sample.r;
    let entropy = neural_sample.g;
    let cluster_id = neural_sample.b;
    let confidence = neural_sample.a;
    
    // Get base color from activation
    var color = get_activation_color(activation);
    
    // Apply glow based on activation
    color = apply_glow(color, activation);
    
    // Apply glassmorphism
    color = apply_glassmorphism(color, in.uv);
    
    // Add subtle noise for morphological texture
    let noise = (fract(sin(dot(in.uv * uniforms.time, vec2<f32>(12.9898, 78.233))) * 43758.5453) - 0.5;
    color += noise * 0.02;
    
    // Set final alpha based on confidence
    let alpha = mix(0.3, 1.0, confidence);
    
    return vec4<f32>(color, alpha);
}
