// ============================================
// GEOMETRY OS - LEGIBLE BRAIN VISUALIZER
// Phase 40.1: Glyph-based Neural Introspection
// Renders the brain atlas as a field of glyphs from the font system.
// ============================================

struct Uniforms {
    resolution: vec2<f32>,
    time: f32,
    zoom: f32,
    camera_pos: vec2<f32>,
    layer_focus: f32, // Which layer is currently dominant in view
    confidence_threshold: f32,
    _pad: vec2<f32>,
};

struct GlyphMetrics {
    char_code: u32,
    uv_min_x: f32, uv_min_y: f32,
    uv_max_x: f32, uv_max_y: f32,
    width: f32, height: f32,
    bearing_x: f32, bearing_y: f32,
    advance: f32,
    _padding: f32,
};

@group(0) @binding(0) var<uniform> uniforms: Uniforms;
@group(0) @binding(1) var brain_atlas: texture_2d<f32>;
@group(0) @binding(2) var brain_sampler: sampler;
@group(0) @binding(3) var font_atlas: texture_2d<f32>;
@group(0) @binding(4) var font_sampler: sampler;
@group(0) @binding(5) var<storage, read> glyph_metrics: array<GlyphMetrics>;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) world_pos: vec2<f32>,
};

@vertex
fn vs_main(@builtin(vertex_index) vertex_index: u32) -> VertexOutput {
    var out: VertexOutput;
    let x = f32(i32(vertex_index) % 2 * 2 - 1);
    let y = f32(i32(vertex_index) / 2 * 2 - 1);
    out.position = vec4<f32>(x, y, 0.0, 1.0);
    out.uv = vec2<f32>(x * 0.5 + 0.5, 1.0 - (y * 0.5 + 0.5));
    
    // Map screen UV to world coordinates (for zooming into the brain map)
    out.world_pos = (out.uv - 0.5) * uniforms.resolution / uniforms.zoom + uniforms.camera_pos;
    
    return out;
}

// Map a brain activation level to a glyph index range
// Substrate (0-31): Simple dots/lines
// Memory (32-63): Boxy/data shapes
// Logic (64-95): Complex algorithmic shapes
// Spec (96-127): Structural/geometric
// Intent (128-159): Dense, glowing, purposeful
fn get_glyph_id(activation: f32, entropy: f32, cluster: f32) -> u32 {
    let stratum = floor(activation * 4.0); // 0 to 4
    let base_offset = u32(stratum) * 32u;
    
    // Use entropy to jitter the glyph selection within the stratum
    let entropy_jitter = u32(entropy * 31.0);
    
    // Cluster ID picks the family
    let cluster_offset = u32(cluster * 5.0) * 8u;
    
    return 32u + (base_offset + entropy_jitter + cluster_offset) % 128u;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // 1. Sample the Brain Atlas to see what's happening at this "geographic" location
    // We use world_pos normalized to [0,1] as atlas coordinates
    let atlas_uv = in.uv; // Simplified: 1:1 screen to atlas mapping for now
    let brain_sample = textureSample(brain_atlas, brain_sampler, atlas_uv);
    
    let activation = brain_sample.r;
    let entropy = brain_sample.g;
    let cluster = brain_sample.b;
    let confidence = brain_sample.a;

    // 2. Grid-based Glyph Selection
    // Divide screen into cells for glyphs
    let grid_size = 32.0; // 32x32 pixel cells
    let cell_coord = floor(in.position.xy / grid_size);
    let pixel_in_cell = fract(in.position.xy / grid_size);
    
    // Pick a glyph for this cell based on the brain state at the cell's center
    let cell_center_uv = (cell_coord * grid_size + grid_size * 0.5) / uniforms.resolution;
    let cell_brain_sample = textureSample(brain_atlas, brain_sampler, cell_center_uv);
    
    let cell_glyph_id = get_glyph_id(cell_brain_sample.r, cell_brain_sample.g, cell_brain_sample.b);
    let metrics = glyph_metrics[cell_glyph_id];
    
    // 3. Sample Font Atlas
    // Map pixel_in_cell to metrics.uv_min/max
    let glyph_uv = mix(
        vec2<f32>(metrics.uv_min_x, metrics.uv_min_y),
        vec2<f32>(metrics.uv_max_x, metrics.uv_max_y),
        pixel_in_cell
    );
    
    let font_sample = textureSample(font_atlas, font_sampler, glyph_uv);
    let glyph_mask = font_sample.a; // Alpha channel of the glyph

    // 4. Colorization (Geometry OS Semantic Colors)
    var color = vec3<f32>(0.1, 0.1, 0.1); // Default substrate color
    
    if (cell_brain_sample.r > 0.8) {
        color = vec3<f32>(1.0, 0.3, 0.3); // High Activity: Red/Cyan pulse
    } else if (cell_brain_sample.r > 0.5) {
        color = vec3<f32>(0.0, 0.9, 0.9); // Medium: Cyan
    } else if (cell_brain_sample.r > 0.2) {
        color = vec3<f32>(0.5, 0.5, 0.8); // Low: Purple
    }

    // Add glowing effect for high activation
    let glow = max(0.0, cell_brain_sample.r - 0.5) * 2.0;
    let final_color = color * glyph_mask * (1.0 + glow);
    
    // Background brain "mist"
    let mist = vec3<f32>(0.02, 0.05, 0.1) * cell_brain_sample.r;
    
    return vec4<f32>(final_color + mist * (1.0 - glyph_mask), 1.0);
}
