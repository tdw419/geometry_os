// ============================================
// GEOMETRY OS - IDE OUTPUT PANEL SHADER
// Phase J.2: Neural IDE Visual Builder
// ============================================
//
// Fragment shader for rendering output panel tiles
// Placeholder implementation with yellow tint
//
// Planned features:
// - Build output display
// - Error/warning highlighting
// - Search/filter functionality
// - ANSI color support
// - Link detection
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
const BASE_COLOR: vec4<f32> = vec4<f32>(0.18, 0.16, 0.10, 1.0);  // Yellow/warm tint
const BORDER_COLOR: vec4<f32> = vec4<f32>(0.5, 0.45, 0.3, 1.0);
const HEADER_COLOR: vec4<f32> = vec4<f32>(0.25, 0.22, 0.12, 1.0);
const TAB_COLOR: vec4<f32> = vec4<f32>(0.3, 0.27, 0.15, 1.0);
const PLACEHOLDER_TEXT_COLOR: vec4<f32> = vec4<f32>(0.7, 0.65, 0.4, 0.8);

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

/// Render output icon placeholder (terminal/document shape)
fn render_output_icon(local_pos: vec2<f32>, center: vec2<f32>, size: f32) -> f32 {
    let half_size = size * 0.5;

    // Rectangle shape for document/output
    if (local_pos.x >= center.x - half_size &&
        local_pos.x < center.x + half_size &&
        local_pos.y >= center.y - half_size * 0.8 &&
        local_pos.y < center.y + half_size * 0.8) {
        return 0.6;
    }

    return 0.0;
}

// --- FRAGMENT SHADER ---

@fragment
fn fs_main(input: VertexOutput) -> FragmentOutput {
    var output: FragmentOutput;

    let tile_size = tile_bounds.zw;
    let pixel_pos = input.uv * tile_size;

    // Start with yellow/warm base color
    var final_color = BASE_COLOR;

    // --- HEADER BAR WITH TABS ---
    let header_height = 28.0;
    if (pixel_pos.y < header_height) {
        final_color = HEADER_COLOR;

        // Tab buttons
        let tab_width = 70.0;
        let tab_height = 22.0;
        let tab_y = 3.0;

        // Tab 1: Output
        if (pixel_pos.x >= 4.0 && pixel_pos.x < 4.0 + tab_width &&
            pixel_pos.y >= tab_y && pixel_pos.y < tab_y + tab_height) {
            final_color = TAB_COLOR;
        }

        // Tab 2: Problems
        if (pixel_pos.x >= 4.0 + tab_width + 2.0 &&
            pixel_pos.x < 4.0 + tab_width * 2.0 + 2.0 &&
            pixel_pos.y >= tab_y && pixel_pos.y < tab_y + tab_height) {
            final_color = vec4<f32>(TAB_COLOR.rgb * 0.8, 1.0);
        }

        // Header bottom border
        if (pixel_pos.y >= header_height - 1.0) {
            final_color = BORDER_COLOR;
        }
    }

    // --- CENTER ICON (placeholder indicator) ---
    let center = tile_size * 0.5;
    let icon_size = min(tile_size.x, tile_size.y) * 0.2;
    let icon_alpha = render_output_icon(pixel_pos, center, icon_size);

    if (icon_alpha > 0.0) {
        let icon_color = vec4<f32>(0.6, 0.55, 0.35, icon_alpha);
        final_color = vec4<f32>(
            mix(final_color.rgb, icon_color.rgb, icon_alpha),
            1.0
        );
    }

    // --- SIMULATED OUTPUT LINES ---
    // Draw placeholder text lines to simulate output
    let line_height = 16.0;
    let line_start_y = header_height + 10.0;
    let num_placeholder_lines = 5u;

    for (var i = 0u; i < num_placeholder_lines; i++) {
        let line_y = line_start_y + f32(i) * line_height;

        if (pixel_pos.y >= line_y && pixel_pos.y < line_y + 10.0) {
            // Vary line lengths for visual interest
            var line_length = 200.0 + f32(i) * 40.0;
            if (i == 2u) {
                line_length = 350.0; // Longer line
            }
            if (i == 3u) {
                line_length = 150.0; // Shorter line
            }

            if (pixel_pos.x >= 10.0 && pixel_pos.x < 10.0 + line_length) {
                // Alternate colors slightly
                let intensity = 0.5 + 0.1 * sin(f32(i) * 1.5);
                final_color = vec4<f32>(
                    0.55 * intensity,
                    0.5 * intensity,
                    0.35 * intensity,
                    0.7
                );
            }
        }
    }

    // --- DECORATIVE ELEMENTS ---
    // Subtle horizontal lines
    let hline_spacing = 40.0;
    let hline_pos = mod(pixel_pos.y, hline_spacing);

    if (hline_pos < 0.5 && pixel_pos.y > header_height) {
        final_color = vec4<f32>(
            final_color.rgb * 1.05,
            1.0
        );
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
