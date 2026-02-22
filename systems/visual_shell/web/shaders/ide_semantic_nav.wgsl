// ============================================
// GEOMETRY OS - IDE SEMANTIC NAV SHADER
// Phase J.2: Neural IDE Visual Builder
// ============================================
//
// Fragment shader for rendering semantic navigation tiles
// Placeholder implementation with green tint
//
// Planned features:
// - Code structure tree (functions, classes)
// - Symbol search
// - Go-to definition visualization
// - Reference highlighting
// - Minimap integration
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
const BASE_COLOR: vec4<f32> = vec4<f32>(0.08, 0.15, 0.12, 1.0);  // Green tint
const BORDER_COLOR: vec4<f32> = vec4<f32>(0.3, 0.5, 0.4, 1.0);
const HEADER_COLOR: vec4<f32> = vec4<f32>(0.1, 0.22, 0.15, 1.0);
const PLACEHOLDER_TEXT_COLOR: vec4<f32> = vec4<f32>(0.4, 0.65, 0.5, 0.8);

// Symbol colors (for future use)
const FUNCTION_COLOR: vec4<f32> = vec4<f32>(0.3, 0.7, 0.5, 1.0);
const CLASS_COLOR: vec4<f32> = vec4<f32>(0.5, 0.6, 0.8, 1.0);
const VARIABLE_COLOR: vec4<f32> = vec4<f32>(0.6, 0.6, 0.4, 1.0);

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

/// Render semantic icon (hierarchy/tree shape)
fn render_nav_icon(local_pos: vec2<f32>, center: vec2<f32>, size: f32) -> f32 {
    let half_size = size * 0.5;

    // Top node
    let top_node_center = vec2<f32>(center.x, center.y - half_size * 0.5);
    if (distance(local_pos, top_node_center) < size * 0.2) {
        return 0.7;
    }

    // Left child node
    let left_center = vec2<f32>(center.x - half_size * 0.4, center.y + half_size * 0.3);
    if (distance(local_pos, left_center) < size * 0.15) {
        return 0.6;
    }

    // Right child node
    let right_center = vec2<f32>(center.x + half_size * 0.4, center.y + half_size * 0.3);
    if (distance(local_pos, right_center) < size * 0.15) {
        return 0.6;
    }

    // Connecting lines
    if (local_pos.x >= center.x - 0.5 && local_pos.x <= center.x + 0.5) {
        if (local_pos.y >= center.y - half_size * 0.3 &&
            local_pos.y <= center.y - half_size * 0.1) {
            return 0.4;
        }
    }

    // V-lines to children
    if (local_pos.y >= center.y && local_pos.y <= center.y + half_size * 0.2) {
        let x_offset = abs(local_pos.x - center.x);
        if (x_offset <= (local_pos.y - center.y) + 1.0) {
            return 0.4;
        }
    }

    return 0.0;
}

// --- FRAGMENT SHADER ---

@fragment
fn fs_main(input: VertexOutput) -> FragmentOutput {
    var output: FragmentOutput;

    let tile_size = tile_bounds.zw;
    let pixel_pos = input.uv * tile_size;

    // Start with green base color
    var final_color = BASE_COLOR;

    // --- HEADER BAR ---
    let header_height = 24.0;
    if (pixel_pos.y < header_height) {
        final_color = HEADER_COLOR;

        // Search bar placeholder
        let search_bar_height = 18.0;
        let search_bar_y = 3.0;
        let search_margin = 8.0;

        if (pixel_pos.y >= search_bar_y &&
            pixel_pos.y < search_bar_y + search_bar_height &&
            pixel_pos.x >= search_margin &&
            pixel_pos.x < tile_size.x - search_margin) {
            final_color = vec4<f32>(0.06, 0.12, 0.09, 1.0);

            // Search icon placeholder
            if (pixel_pos.x >= search_margin + 4.0 &&
                pixel_pos.x < search_margin + 16.0) {
                let icon_center = vec2<f32>(
                    search_margin + 10.0,
                    search_bar_y + search_bar_height * 0.5
                );
                let d = distance(pixel_pos, icon_center);
                if (d < 4.0) {
                    final_color = vec4<f32>(0.3, 0.5, 0.4, 1.0);
                }
            }
        }

        // Header bottom border
        if (pixel_pos.y >= header_height - 1.0) {
            final_color = BORDER_COLOR;
        }
    }

    // --- CENTER ICON (placeholder indicator) ---
    let center = tile_size * 0.5;
    let icon_size = min(tile_size.x, tile_size.y) * 0.25;
    let icon_alpha = render_nav_icon(pixel_pos, center, icon_size);

    if (icon_alpha > 0.0) {
        let icon_color = vec4<f32>(0.35, 0.6, 0.45, icon_alpha);
        final_color = vec4<f32>(
            mix(final_color.rgb, icon_color.rgb, icon_alpha),
            1.0
        );
    }

    // --- SIMULATED SYMBOL TREE ---
    // Draw placeholder tree structure
    let tree_start_y = header_height + 15.0;
    let line_height = 20.0;
    let indent_width = 16.0;

    // Root level symbols
    let symbols = array<vec3<f32>, 4>(
        vec3<f32>(0.0, 80.0, 0.0),   // indent, width, type (0=class)
        vec3<f32>(1.0, 120.0, 1.0),  // indent, width, type (1=function)
        vec3<f32>(1.0, 100.0, 1.0),
        vec3<f32>(1.0, 90.0, 2.0)    // type (2=variable)
    );

    for (var i = 0u; i < 4u; i++) {
        let sym = symbols[i];
        let indent = sym.x * indent_width;
        let width = sym.y;
        let sym_type = sym.z;
        let line_y = tree_start_y + f32(i) * line_height;

        if (pixel_pos.y >= line_y && pixel_pos.y < line_y + 14.0 &&
            pixel_pos.x >= 8.0 + indent &&
            pixel_pos.x < 8.0 + indent + width) {

            // Color based on symbol type
            var sym_color: vec4<f32>;
            if (sym_type == 0.0) {
                sym_color = CLASS_COLOR;
            } else if (sym_type == 1.0) {
                sym_color = FUNCTION_COLOR;
            } else {
                sym_color = VARIABLE_COLOR;
            }

            final_color = vec4<f32>(
                sym_color.rgb * 0.5,
                0.6
            );
        }
    }

    // --- DECORATIVE ELEMENTS ---
    // Subtle vertical tree lines
    let tree_line_x = 16.0;
    if (abs(pixel_pos.x - tree_line_x) < 0.5 &&
        pixel_pos.y > header_height + 10.0 &&
        pixel_pos.y < tree_start_y + 4.0 * line_height) {
        final_color = vec4<f32>(0.2, 0.35, 0.25, 1.0);
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
