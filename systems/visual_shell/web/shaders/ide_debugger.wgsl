// ============================================
// GEOMETRY OS - IDE DEBUGGER SHADER
// Phase J.2: Neural IDE Visual Builder
// ============================================
//
// Fragment shader for rendering debugger tiles
// Placeholder implementation with purple tint
//
// Planned features:
// - Breakpoint visualization
// - Call stack display
// - Variable inspection
// - Step controls
// - Memory view
//
// ============================================

// --- BINDINGS ---

// Uniforms (bind group 0)
@group(0) @binding(0) var<uniform> tile_bounds: vec4<f32>;     // (x, y, width, height)
@group(0) @binding(1) var<uniform> zoom_level: f32;
@group(0) @binding(2) var<uniform> time: f32;

// --- STRUCTURES ---

struct FragmentOutput {
    @location(0) color: vec4<f32>,
};

struct VertexInput {
    @builtin(vertex_index) vertex_index: u32,
};

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) local_pos: vec2<f32>,
};

// --- COLOR CONSTANTS ---
const BASE_COLOR: vec4<f32> = vec4<f32>(0.15, 0.08, 0.25, 1.0);  // Purple tint
const BORDER_COLOR: vec4<f32> = vec4<f32>(0.4, 0.3, 0.55, 1.0);
const HEADER_COLOR: vec4<f32> = vec4<f32>(0.25, 0.15, 0.35, 1.0);
const PLACEHOLDER_TEXT_COLOR: vec4<f32> = vec4<f32>(0.6, 0.5, 0.75, 0.8);

// --- VERTEX SHADER ---

@vertex
fn vs_main(input: VertexInput) -> VertexOutput {
    var output: VertexOutput;

    let positions = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>( 1.0, -1.0),
        vec2<f32>(-1.0,  1.0),
        vec2<f32>(-1.0,  1.0),
        vec2<f32>( 1.0, -1.0),
        vec2<f32>( 1.0,  1.0)
    );

    let uvs = array<vec2<f32>, 6>(
        vec2<f32>(0.0, 1.0),
        vec2<f32>(1.0, 1.0),
        vec2<f32>(0.0, 0.0),
        vec2<f32>(0.0, 0.0),
        vec2<f32>(1.0, 1.0),
        vec2<f32>(1.0, 0.0)
    );

    let pos = positions[input.vertex_index];
    output.position = vec4<f32>(pos, 0.0, 1.0);
    output.uv = uvs[input.vertex_index];
    output.local_pos = pos;

    return output;
}

// --- HELPER FUNCTIONS ---

/// Check if point is in rectangle
fn in_rect(pos: vec2<f32>, origin: vec2<f32>, size: vec2<f32>) -> bool {
    return pos.x >= origin.x && pos.x < origin.x + size.x &&
           pos.y >= origin.y && pos.y < origin.y + size.y;
}

/// Render a simple placeholder icon (bug shape)
fn render_debug_icon(local_pos: vec2<f32>, center: vec2<f32>, size: f32) -> f32 {
    let d = distance(local_pos, center);
    let half_size = size * 0.5;

    // Simple circular bug icon
    if (d < half_size) {
        // Body
        if (d > half_size * 0.3) {
            return 0.6;
        }
        // Center
        return 0.8;
    }

    return 0.0;
}

// --- FRAGMENT SHADER ---

@fragment
fn fs_main(input: VertexOutput) -> FragmentOutput {
    var output: FragmentOutput;

    let tile_size = tile_bounds.zw;
    let pixel_pos = input.uv * tile_size;

    // Start with purple base color
    var final_color = BASE_COLOR;

    // --- HEADER BAR ---
    let header_height = 24.0;
    if (pixel_pos.y < header_height) {
        final_color = HEADER_COLOR;

        // Header bottom border
        if (pixel_pos.y >= header_height - 1.0) {
            final_color = BORDER_COLOR;
        }
    }

    // --- CENTER ICON (placeholder indicator) ---
    let center = tile_size * 0.5;
    let icon_size = min(tile_size.x, tile_size.y) * 0.3;
    let icon_alpha = render_debug_icon(pixel_pos, center, icon_size);

    if (icon_alpha > 0.0) {
        let icon_color = vec4<f32>(0.5, 0.4, 0.7, icon_alpha);
        final_color = vec4<f32>(
            mix(final_color.rgb, icon_color.rgb, icon_alpha),
            1.0
        );
    }

    // --- DECORATIVE ELEMENTS ---
    // Subtle grid pattern to indicate "under construction"
    let grid_size = 20.0;
    let grid_pos = mod(pixel_pos, vec2<f32>(grid_size));

    if (grid_pos.x < 1.0 || grid_pos.y < 1.0) {
        final_color = vec4<f32>(
            final_color.rgb * 1.1,
            1.0
        );
    }

    // --- PLACEHOLDER TEXT INDICATOR ---
    // Simulated "DEBUGGER" text area in center
    let text_area_width = 100.0;
    let text_area_height = 16.0;
    let text_start_x = (tile_size.x - text_area_width) * 0.5;
    let text_start_y = center.y + icon_size * 0.7;

    if (in_rect(pixel_pos, vec2<f32>(text_start_x, text_start_y),
                vec2<f32>(text_area_width, text_area_height))) {
        // Draw placeholder text bars
        let bar_width = 8.0;
        let bar_gap = 4.0;
        let local_text_x = pixel_pos.x - text_start_x;
        let bar_idx = u32(local_text_x / (bar_width + bar_gap));

        if (bar_idx < 8u) { // 8 characters worth
            let in_bar = mod(local_text_x, bar_width + bar_gap) < bar_width;
            let in_height = pixel_pos.y >= text_start_y + 4.0 &&
                           pixel_pos.y < text_start_y + 12.0;

            if (in_bar && in_height) {
                final_color = PLACEHOLDER_TEXT_COLOR;
            }
        }
    }

    // --- BORDER ---
    let border_width = 1.0;
    if (pixel_pos.x < border_width ||
        pixel_pos.x >= tile_size.x - border_width ||
        pixel_pos.y < border_width ||
        pixel_pos.y >= tile_size.y - border_width) {
        final_color = BORDER_COLOR;
    }

    output.color = final_color;
    return output;
}
