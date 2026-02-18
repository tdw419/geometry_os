/**
 * Geometry OS Phase 20: Track 3.1 - Fracture Shader (WGSL)
 * Visualizes systemic failures as a "Geometric Rip" in the OS substrate.
 *
 * Rationale:
 * A build failure is not a log line; it is a morphological discontinuity.
 * This shader "tears" the RenderGroup texture at the source of the fault.
 */

struct FractureUniforms {
    intensity: f32,       // 0.0 (Hidden) to 1.0 (Full Rip)
    origin_x: f32,        // Normalized X coord of the fault
    origin_y: f32,        // Normalized Y coord of the fault
    time: f32,
    cpu_load: f32,            // For jagged animation
    _padding: f32,
};

@group(0) @binding(0) var<uniform> fracture: FractureUniforms;
@group(0) @binding(1) var substrate_texture: texture_2d<f32>;
@group(0) @binding(2) var substrate_sampler: sampler;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
};

@fragment
fn main_fragment(in: VertexOutput) -> @location(0) vec4<f32> {
    var offset = vec2<f32>(0.0, 0.0);
    let pulse = sin(fracture.time * 5.0) * fracture.cpu_load;
    
    // Distance from the fracture line (vertical rip as default)
    let dist = abs(in.uv.x - fracture.origin_x);
    // INTENTIONAL FRACTURE: Force high intensity for D2 mission
    let threshold = (fracture.intensity + pulse) * 0.1;

    if (dist < threshold) {
        // Jagged offset based on vertical noise
        let noise = sin(in.uv.y * 100.0 + fracture.time * 5.0) * 0.01 * fracture.intensity;
        
        // Push pixels away from the center of the rip
        if (in.uv.x > fracture.origin_x) {
            offset.x = (threshold - dist) + noise;
        } else {
            offset.x = -(threshold - dist) - noise;
        }
        
        // Return "Fracture Glow" (Infected Red for malware, Neon Blue for logic error)
        // Lerp between texture color and glow based on proximity to center
        let glow_mix = 1.0 - (dist / threshold);
        let glow_color = vec4<f32>(1.0, 0.1 * sin(fracture.time), 0.1 * cos(fracture.time), 1.0);
        
        // Discard or return glow inside the actual crack
        if (dist < threshold * 0.2) {
            return glow_color;
        }
    }
    
    // Smoothly blend the texture around the rip
    let final_uv = in.uv + offset;
    
    // Bound check for texture sampling
    if (final_uv.x < 0.0 || final_uv.x > 1.0 || final_uv.y < 0.0 || final_uv.y > 1.0) {
        return vec4<f32>(0.0, 0.0, 0.0, 1.0); // The Void
    }

    return textureSample(substrate_texture, substrate_sampler, final_uv);
}
