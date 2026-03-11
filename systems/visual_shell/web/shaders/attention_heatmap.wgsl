// ============================================
// GEOMETRY OS - ATTENTION HEATMAP SHADER
// Phase 49.x: VisualBridge Integration
// ============================================
//
// Fragment shader that renders attention weights as a heatmap overlay
// with plasma colormap for visualization model focus areas.
//
// ============================================

// --- BINDINGS ---

@group(0) @binding(0) var<storage, read> attention: AttentionInput;

struct AttentionInput {
    weights: array<f32>,  // Attention weights [head][position]
};

@group(0) @binding(1) var<uniform> config: HeatmapConfig;

struct HeatmapConfig {
    head: u32,
    seq_len: u32,
    max_intensity: f32,
    color_mode: u32,  // 0=grayscale, 1=plasma, 2=attention-focus
};

// --- STRUCTURES ---

struct FragmentOutput {
    @location(0) color: vec4<f32>,
};

// --- VERTEX INPUT (for full-screen quad) ---

struct VertexInput {
    @builtin(vertex_index) vertex_index: u32,
};

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
};

// --- VERTEX SHADER ---

@vertex
fn main_vertex(vertex: VertexInput) -> VertexOutput {
    var output: VertexOutput;

    // Full-screen quad in NDC
    let positions = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0),  // Bottom left
        vec2<f32>(1.0, -1.0),   // Bottom right
        vec2<f32>(-1.0, 1.0),   // Top left
        vec2<f32>(-1.0, 1.0),   // Top left
        vec2<f32>(1.0, -1.0),   // Bottom right
        vec2<f32>(1.0, 1.0)     // Top right
    );

    output.position = vec4<f32>(positions[vertex.vertex_index].xy, 0.0, 1.0);
    output.uv = positions[vertex.vertex_index] * 0.5 + 0.5;  // Convert to 0-1 UV space

    return output;
}

// --- COLOR MAP FUNCTIONS ---

/// Convert value (0-1) to grayscale color
fn grayscale_color(t: f32) -> vec3<f32> {
    return vec3<f32>(t);
}

/// Convert value (0-1) to plasma colormap
/// Plasma colors: dark blue -> blue -> purple -> pink -> yellow -> white
fn plasma_color(t: f32) -> vec3<f32> {
    let t = saturate(t);

    // Plasma colormap based on matplotlib plasma
    if (t < 0.17) {
        // Dark blue to blue
        let s = t / 0.17;
        return vec3<f32>(s * 0.050, s * 0.0, s * 1.0);
    } else if (t < 0.33) {
        // Blue to purple
        let s = (t - 0.17) / 0.16;
        return vec3<f32>(s * 0.325, s * 0.0, s * 0.878);
    } else if (t < 0.50) {
        // Purple to pink
        let s = (t - 0.33) / 0.17;
        return vec3<f32>(0.325 + s * 0.525, s * 0.0, 0.878 - s * 0.525);
    } else if (t < 0.67) {
        // Pink to yellow
        let s = (t - 0.50) / 0.17;
        return vec3<f32>(0.850 + s * 0.150, s * 0.678, s * 0.352);
    } else {
        // Yellow to white
        let s = (t - 0.67) / 0.33;
        return vec3<f32>(1.0, 0.678 + s * 0.322, 0.352 + s * 0.648);
    }
}

/// Convert value (0-1) to attention-focus colormap
/// Attention focus: black -> red -> orange -> bright yellow
fn attention_focus_color(t: f32) -> vec3<f32> {
    let t = saturate(t);

    if (t < 0.2) {
        // Black to dark red
        let s = t / 0.2;
        return vec3<f32>(s * 0.5, 0.0, 0.0);
    } else if (t < 0.5) {
        // Dark red to orange
        let s = (t - 0.2) / 0.3;
        return vec3<f32>(0.5 + s * 0.5, s * 0.5, 0.0);
    } else {
        // Orange to bright yellow
        let s = (t - 0.5) / 0.5;
        return vec3<f32>(1.0, 0.5 + s * 0.5, s * 1.0);
    }
}

/// Apply color mapping based on mode
fn apply_colormap(val: f32, mode: u32) -> vec3<f32> {
    switch (mode) {
        case 0u: { // Grayscale
            return grayscale_color(val);
        }
        case 1u: { // Plasma
            return plasma_color(val);
        }
        case 2u: { // Attention focus
            return attention_focus_color(val);
        }
        default: {
            return grayscale_color(val);
        }
    }
}

// --- HELPER FUNCTIONS ---

/// Get attention weight for specific head and position
fn get_attention_weight(head: u32, pos: u32) -> f32 {
    let index = head * config.seq_len + pos;
    if (index < arrayLength(&attention.weights)) {
        return attention.weights[index];
    }
    return 0.0;
}

// --- FRAGMENT SHADER ---

@fragment
fn main_fragment(input: VertexOutput) -> FragmentOutput {
    var output: FragmentOutput;

    // Calculate UV position in sequence space
    let seq_pos = floor(input.uv.x * f32(config.seq_len));
    let normalized_pos = input.uv.x;

    // Get attention weight for current head and position
    let weight = get_attention_weight(config.head, u32(seq_pos));
    let normalized_weight = saturate(weight / config.max_intensity);

    // Apply color mapping
    let color = apply_colormap(normalized_weight, config.color_mode);

    // Apply alpha based on vertical position (fade from bottom to top)
    let alpha = input.uv.y;

    output.color = vec4<f32>(color, alpha * 0.7);

    return output;
}