// ============================================
// GEOMETRY OS - IDE FILE BROWSER SHADER
// Phase J.2: Neural IDE Visual Builder
// ============================================
//
// Fragment shader for rendering file browser tiles with:
// - Tree structure visualization
// - Folder/file icons with distinct colors
// - Selection highlighting
// - Scrollable content
//
// ============================================

// --- CONSTANTS ---
const INDENT_WIDTH: f32 = 16.0;
const LINE_HEIGHT: f32 = 20.0;
const ICON_SIZE: f32 = 16.0;
const ICON_PADDING: f32 = 4.0;
const TEXT_START_X: f32 = 24.0;  // ICON_SIZE + ICON_PADDING
const MAX_VISIBLE_ROWS: u32 = 30u;
const MAX_NAME_LENGTH: u32 = 40u;

// Node type bits in tree_nodes
const NODE_TYPE_MASK: u32 = 0x70u;  // bits 4-6
const NODE_DEPTH_MASK: u32 = 0x0Fu; // lower 4 bits
const NODE_EXPANDED_BIT: u32 = 0x80u; // bit 7

// Node types
const NODE_FOLDER: u32 = 0u;
const NODE_FILE: u32 = 1u;
const NODE_PYTHON: u32 = 2u;
const NODE_JAVASCRIPT: u32 = 3u;
const NODE_WGSL: u32 = 4u;
const NODE_MARKDOWN: u32 = 5u;

// --- BINDINGS ---

// Uniforms (bind group 0)
@group(0) @binding(0) var<uniform> tile_bounds: vec4<f32>;     // (x, y, width, height)
@group(0) @binding(1) var<uniform> zoom_level: f32;
@group(0) @binding(2) var<uniform> scroll_offset: f32;         // Vertical scroll in lines
@group(0) @binding(3) var<uniform> selected_idx: u32;          // Selected node index
@group(0) @binding(4) var<uniform> node_count: u32;            // Total visible nodes
@group(0) @binding(5) var<uniform> time: f32;

// Storage buffers (bind group 0)
@group(0) @binding(6) var<storage, read> tree_nodes: array<u32>;  // depth in lower 4 bits, type in bits 4-6, expanded in bit 7
@group(0) @binding(7) var<storage, read> node_names: array<u32>;  // Packed name data (4 chars per u32)

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
const BG_COLOR: vec4<f32> = vec4<f32>(0.10, 0.10, 0.12, 1.0);
const SELECTION_BG: vec4<f32> = vec4<f32>(0.15, 0.25, 0.40, 1.0);
const HOVER_BG: vec4<f32> = vec4<f32>(0.12, 0.14, 0.18, 1.0);

// Icon colors by type
const FOLDER_COLOR: vec4<f32> = vec4<f32>(0.9, 0.75, 0.2, 1.0);    // Yellow/gold
const FILE_COLOR: vec4<f32> = vec4<f32>(0.5, 0.65, 0.85, 1.0);     // Blue
const PYTHON_COLOR: vec4<f32> = vec4<f32>(0.3, 0.7, 0.5, 1.0);     // Green
const JAVASCRIPT_COLOR: vec4<f32> = vec4<f32>(0.95, 0.85, 0.3, 1.0); // Yellow
const WGSL_COLOR: vec4<f32> = vec4<f32>(0.6, 0.3, 0.8, 1.0);       // Purple
const MARKDOWN_COLOR: vec4<f32> = vec4<f32>(0.6, 0.6, 0.6, 1.0);   // Gray

const TEXT_COLOR: vec4<f32> = vec4<f32>(0.85, 0.85, 0.85, 1.0);
const BORDER_COLOR: vec4<f32> = vec4<f32>(0.25, 0.25, 0.28, 1.0);

// --- VERTEX SHADER ---

@vertex
fn vs_main(input: VertexInput) -> VertexOutput {
    var output: VertexOutput;

    // Generate full-screen quad triangle strip
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

/// Get node depth from tree_nodes entry
fn get_node_depth(node_data: u32) -> u32 {
    return node_data & NODE_DEPTH_MASK;
}

/// Get node type from tree_nodes entry
fn get_node_type(node_data: u32) -> u32 {
    return (node_data & NODE_TYPE_MASK) >> 4u;
}

/// Check if node is expanded
fn is_node_expanded(node_data: u32) -> bool {
    return (node_data & NODE_EXPANDED_BIT) != 0u;
}

/// Unpack a u32 into 4 bytes (characters)
fn unpack_chars(packed: u32) -> vec4<u32> {
    return vec4<u32>(
        (packed >> 0u) & 0xFFu,
        (packed >> 8u) & 0xFFu,
        (packed >> 16u) & 0xFFu,
        (packed >> 24u) & 0xFFu
    );
}

/// Get icon color based on node type
fn get_icon_color(node_type: u32) -> vec4<f32> {
    switch (node_type) {
        case NODE_FOLDER: {
            return FOLDER_COLOR;
        }
        case NODE_FILE: {
            return FILE_COLOR;
        }
        case NODE_PYTHON: {
            return PYTHON_COLOR;
        }
        case NODE_JAVASCRIPT: {
            return JAVASCRIPT_COLOR;
        }
        case NODE_WGSL: {
            return WGSL_COLOR;
        }
        case NODE_MARKDOWN: {
            return MARKDOWN_COLOR;
        }
        default: {
            return FILE_COLOR;
        }
    }
}

/// Render folder icon (simplified rectangle with tab)
fn render_folder_icon(local_pos: vec2<f32>, color: vec4<f32>) -> vec4<f32> {
    let icon_x = local_pos.x - ICON_PADDING;
    let icon_y = local_pos.y - 2.0;

    // Check bounds of icon area
    if (icon_x < 0.0 || icon_x >= ICON_SIZE || icon_y < 0.0 || icon_y >= ICON_SIZE) {
        return vec4<f32>(0.0);
    }

    // Folder body (main rectangle)
    if (icon_x >= 1.0 && icon_x < 15.0 && icon_y >= 4.0 && icon_y < 14.0) {
        return color;
    }

    // Folder tab (top left triangle-ish)
    if (icon_x >= 1.0 && icon_x < 6.0 && icon_y >= 2.0 && icon_y < 4.0) {
        return color;
    }

    return vec4<f32>(0.0);
}

/// Render file icon (simplified rectangle with fold)
fn render_file_icon(local_pos: vec2<f32>, color: vec4<f32>) -> vec4<f32> {
    let icon_x = local_pos.x - ICON_PADDING;
    let icon_y = local_pos.y - 2.0;

    if (icon_x < 0.0 || icon_x >= ICON_SIZE || icon_y < 0.0 || icon_y >= ICON_SIZE) {
        return vec4<f32>(0.0);
    }

    // File body
    if (icon_x >= 2.0 && icon_x < 14.0 && icon_y >= 1.0 && icon_y < 15.0) {
        // Top-right corner fold
        if (icon_x >= 10.0 && icon_y < 5.0) {
            if (icon_x >= 10.0 + (4.0 - icon_y)) {
                return vec4<f32>(0.0); // Fold area
            }
        }
        return color;
    }

    return vec4<f32>(0.0);
}

/// Render icon based on node type
fn render_icon(local_pos: vec2<f32>, node_type: u32, color: vec4<f32>) -> vec4<f32> {
    if (node_type == NODE_FOLDER) {
        return render_folder_icon(local_pos, color);
    } else {
        return render_file_icon(local_pos, color);
    }
}

/// Render a simple text character block
fn render_text_block(local_pos: vec2<f32>) -> f32 {
    // Simple rectangle for character visibility
    if (local_pos.x >= 1.0 && local_pos.x < 5.0 &&
        local_pos.y >= 4.0 && local_pos.y < 12.0) {
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

    // Start with background
    var final_color = BG_COLOR;

    // Calculate which row we're viewing
    let effective_line_height = LINE_HEIGHT * zoom_level;
    let row_f = (pixel_pos.y / effective_line_height) + scroll_offset;
    let row = u32(floor(row_f));

    // Check if row is valid
    if (row < node_count && row < MAX_VISIBLE_ROWS) {
        let node_data = tree_nodes[row];
        let node_depth = get_node_depth(node_data);
        let node_type = get_node_type(node_data);
        let icon_color = get_icon_color(node_type);

        // Calculate indentation
        let indent_x = f32(node_depth) * INDENT_WIDTH * zoom_level;
        let row_start_y = (f32(row) - scroll_offset) * effective_line_height;

        // Check for selection
        if (row == selected_idx) {
            final_color = SELECTION_BG;
        }

        // Calculate local position within this row
        let local_row_y = pixel_pos.y - row_start_y;

        // --- ICON RENDERING ---
        let icon_x = indent_x + ICON_PADDING;
        if (pixel_pos.x >= icon_x && pixel_pos.x < icon_x + ICON_SIZE &&
            local_row_y >= 2.0 && local_row_y < ICON_SIZE + 2.0) {
            let icon_local_pos = vec2<f32>(pixel_pos.x - indent_x, local_row_y);
            let icon_result = render_icon(icon_local_pos, node_type, icon_color);
            if (icon_result.a > 0.0) {
                final_color = icon_result;
                output.color = final_color;
                return output;
            }
        }

        // --- TEXT RENDERING ---
        let text_start_x = indent_x + TEXT_START_X;
        if (pixel_pos.x >= text_start_x) {
            // Calculate which character column
            let char_col = u32((pixel_pos.x - text_start_x) / (6.0 * zoom_level));
            if (char_col < MAX_NAME_LENGTH) {
                let name_offset = row * 10u + char_col / 4u; // 10 u32s per name (40 chars max)
                let char_sub_index = char_col % 4u;

                if (name_offset < (node_count * 10u + node_count * 10u)) { // Bounds check
                    let packed = node_names[name_offset];
                    let chars = unpack_chars(packed);
                    let char_code = chars[char_sub_index];

                    // If non-space character, render dim text indicator
                    if (char_code != 0u && char_code != 32u) {
                        let char_local_x = (pixel_pos.x - text_start_x) - f32(char_col) * 6.0 * zoom_level;
                        let char_local_y = local_row_y;
                        let char_alpha = render_text_block(vec2<f32>(char_local_x, char_local_y));
                        if (char_alpha > 0.0) {
                            final_color = vec4<f32>(
                                mix(final_color.rgb, TEXT_COLOR.rgb, char_alpha),
                                1.0
                            );
                        }
                    }
                }
            }
        }

        // --- TREE LINES ---
        // Draw vertical connecting lines for tree structure
        if (node_depth > 0u) {
            for (var d = 0u; d < node_depth; d++) {
                let line_x = f32(d) * INDENT_WIDTH * zoom_level + 8.0;
                if (abs(pixel_pos.x - line_x) < 1.0) {
                    final_color = vec4<f32>(
                        mix(final_color.rgb, vec3<f32>(0.3, 0.3, 0.35), 0.5),
                        1.0
                    );
                }
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

    // --- SCROLLBAR (if content exceeds visible area) ---
    if (node_count > MAX_VISIBLE_ROWS) {
        let scrollbar_width = 8.0;
        let scrollbar_x = tile_size.x - scrollbar_width - 2.0;

        if (pixel_pos.x >= scrollbar_x) {
            // Scrollbar track
            final_color = vec4<f32>(0.15, 0.15, 0.18, 1.0);

            // Scrollbar thumb
            let thumb_height = (f32(MAX_VISIBLE_ROWS) / f32(node_count)) * tile_size.y;
            let thumb_y = (scroll_offset / f32(node_count)) * tile_size.y;

            if (pixel_pos.y >= thumb_y && pixel_pos.y < thumb_y + thumb_height) {
                final_color = vec4<f32>(0.4, 0.4, 0.45, 1.0);
            }
        }
    }

    output.color = final_color;
    return output;
}
