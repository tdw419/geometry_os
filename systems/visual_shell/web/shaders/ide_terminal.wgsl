// ============================================
// GEOMETRY OS - IDE TERMINAL SHADER
// Phase J.2: Neural IDE Visual Builder
// ============================================
//
// Fragment shader for rendering terminal tiles with:
// - ANSI color support (16 colors)
// - Block cursor with blink
// - Scrollback buffer visualization
// - Character grid rendering
//
// ============================================

// --- CONSTANTS ---
const CHAR_WIDTH: f32 = 8.0;
const CHAR_HEIGHT: f32 = 16.0;
const MAX_COLS: u32 = 100u;
const MAX_ROWS: u32 = 30u;
const CURSOR_BLINK_PERIOD: f32 = 1.0;
const SCROLLBAR_WIDTH: f32 = 10.0;

// --- BINDINGS ---

// Uniforms (bind group 0)
@group(0) @binding(0) var<uniform> tile_bounds: vec4<f32>;     // (x, y, width, height)
@group(0) @binding(1) var<uniform> zoom_level: f32;
@group(0) @binding(2) var<uniform> cursor_pos: vec2<f32>;      // (row, column)
@group(0) @binding(3) var<uniform> scroll_offset: f32;         // Vertical scroll in lines
@group(0) @binding(4) var<uniform> scrollback_lines: u32;      // Total lines in scrollback
@group(0) @binding(5) var<uniform> time: f32;

// Storage buffers (bind group 0)
@group(0) @binding(6) var<storage, read> terminal_buffer: array<u32>;  // Packed: char in lower 8 bits, color in bits 8-11
@group(0) @binding(7) var<storage, read> ansi_colors: array<u32>;      // 16 ANSI colors as RGBA packed

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
const BG_COLOR: vec4<f32> = vec4<f32>(0.05, 0.05, 0.08, 1.0);  // Very dark, almost black
const CURSOR_COLOR: vec4<f32> = vec4<f32>(0.7, 0.9, 0.7, 1.0); // Green-ish cursor
const DEFAULT_FG: vec4<f32> = vec4<f32>(0.85, 0.85, 0.85, 1.0);
const BORDER_COLOR: vec4<f32> = vec4<f32>(0.2, 0.2, 0.25, 1.0);
const SCROLLBAR_TRACK: vec4<f32> = vec4<f32>(0.1, 0.1, 0.12, 1.0);
const SCROLLBAR_THUMB: vec4<f32> = vec4<f32>(0.35, 0.35, 0.4, 1.0);

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

/// Unpack a u32 into 4 bytes (characters)
fn unpack_chars(packed: u32) -> vec4<u32> {
    return vec4<u32>(
        (packed >> 0u) & 0xFFu,
        (packed >> 8u) & 0xFFu,
        (packed >> 16u) & 0xFFu,
        (packed >> 24u) & 0xFFu
    );
}

/// Unpack ANSI color index from character data
/// Format: bits 8-11 contain color index (0-15)
fn get_color_index(char_data: u32) -> u32 {
    return (char_data >> 8u) & 0xFu;
}

/// Get character code from packed data (lower 8 bits)
fn get_char_code(char_data: u32) -> u32 {
    return char_data & 0xFFu;
}

/// Convert packed RGBA u32 to vec4<f32>
fn unpack_color(packed: u32) -> vec4<f32> {
    let r = f32((packed >> 0u) & 0xFFu) / 255.0;
    let g = f32((packed >> 8u) & 0xFFu) / 255.0;
    let b = f32((packed >> 16u) & 0xFFu) / 255.0;
    let a = f32((packed >> 24u) & 0xFFu) / 255.0;
    return vec4<f32>(r, g, b, a);
}

/// Get ANSI color from palette
fn get_ansi_color(color_idx: u32) -> vec4<f32> {
    if (color_idx < 16u) {
        return unpack_color(ansi_colors[color_idx]);
    }
    return DEFAULT_FG;
}

/// Get character at specific row and column from terminal buffer
fn get_terminal_char(row: u32, col: u32) -> u32 {
    if (row >= MAX_ROWS || col >= MAX_COLS) {
        return 0u;
    }

    // Each u32 holds 2 characters with color
    // Format: [char1 (8 bits) | color1 (4 bits) | char2 (8 bits) | color2 (4 bits) | unused (8 bits)]
    let index = row * ((MAX_COLS + 1u) / 2u) + col / 2u;
    let packed = terminal_buffer[index];

    if ((col % 2u) == 0u) {
        return (packed & 0xFFu) | (((packed >> 8u) & 0xFu) << 8u);
    } else {
        return ((packed >> 12u) & 0xFFu) | (((packed >> 20u) & 0xFu) << 8u);
    }
}

/// Calculate cursor blink effect
fn get_cursor_alpha(time: f32) -> f32 {
    let blink = sin(time * 6.28318 / CURSOR_BLINK_PERIOD);
    return step(0.0, blink);
}

/// Render a simple character block
fn render_char_block(char_code: u32, local_pos: vec2<f32>) -> f32 {
    if (char_code == 0u || char_code == 32u) {
        return 0.0;
    }

    // Character cell bounds (8x16)
    if (local_pos.x < 1.0 || local_pos.x >= 7.0 ||
        local_pos.y < 2.0 || local_pos.y >= 14.0) {
        return 0.0;
    }

    return 1.0;
}

/// Render block cursor
fn render_cursor(local_pos: vec2<f32>, alpha: f32) -> vec4<f32> {
    if (local_pos.x < 0.0 || local_pos.x >= CHAR_WIDTH ||
        local_pos.y < 0.0 || local_pos.y >= CHAR_HEIGHT) {
        return vec4<f32>(0.0);
    }

    // Full block cursor
    return vec4<f32>(CURSOR_COLOR.rgb * alpha, alpha);
}

// --- FRAGMENT SHADER ---

@fragment
fn fs_main(input: VertexOutput) -> FragmentOutput {
    var output: FragmentOutput;

    let tile_size = tile_bounds.zw;
    let pixel_pos = input.uv * tile_size;

    // Effective character size with zoom
    let effective_char_size = vec2<f32>(CHAR_WIDTH, CHAR_HEIGHT) * zoom_level;

    // Start with dark background
    var final_color = BG_COLOR;

    // Calculate character grid position
    let col_f = pixel_pos.x / effective_char_size.x;
    let row_f = (pixel_pos.y / effective_char_size.y) + scroll_offset;

    let col = u32(floor(col_f));
    let row = u32(floor(row_f));

    // Render terminal content
    if (col < MAX_COLS && row < MAX_ROWS) {
        // Local position within character cell
        let char_local_x = pixel_pos.x - f32(col) * effective_char_size.x;
        let char_local_y = pixel_pos.y - f32(row - u32(floor(scroll_offset))) * effective_char_size.y;
        let char_local_pos = vec2<f32>(char_local_x, char_local_y) / zoom_level;

        // Get character data
        let char_data = get_terminal_char(row, col);
        let char_code = get_char_code(char_data);
        let color_idx = get_color_index(char_data);
        let char_color = get_ansi_color(color_idx);

        // --- CURSOR RENDERING ---
        let cursor_row = u32(floor(cursor_pos.y));
        let cursor_col = u32(floor(cursor_pos.x));

        if (row == cursor_row && col == cursor_col) {
            let cursor_alpha = get_cursor_alpha(time);
            let cursor_result = render_cursor(char_local_pos, cursor_alpha);

            if (cursor_result.a > 0.0) {
                output.color = cursor_result;
                return output;
            }
        }

        // --- CHARACTER RENDERING ---
        if (char_code != 0u && char_code != 32u) {
            let char_alpha = render_char_block(char_code, char_local_pos);

            if (char_alpha > 0.0) {
                final_color = vec4<f32>(
                    mix(final_color.rgb, char_color.rgb, char_alpha),
                    1.0
                );
            }
        }
    }

    // --- SCROLLBAR ---
    if (scrollback_lines > MAX_ROWS) {
        let scrollbar_x = tile_size.x - SCROLLBAR_WIDTH - 2.0;

        if (pixel_pos.x >= scrollbar_x && pixel_pos.x < tile_size.x - 2.0) {
            // Scrollbar track
            final_color = SCROLLBAR_TRACK;

            // Calculate thumb position and size
            let visible_ratio = f32(MAX_ROWS) / f32(scrollback_lines);
            let thumb_height = visible_ratio * (tile_size.y - 4.0);
            let max_scroll = f32(scrollback_lines) - f32(MAX_ROWS);
            let scroll_ratio = scroll_offset / max_scroll;
            let thumb_y = 2.0 + scroll_ratio * (tile_size.y - 4.0 - thumb_height);

            if (pixel_pos.y >= thumb_y && pixel_pos.y < thumb_y + thumb_height) {
                final_color = SCROLLBAR_THUMB;
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

    // --- TOP BAR (prompt indicator area) ---
    let top_bar_height = 2.0;
    if (pixel_pos.y < top_bar_height) {
        final_color = vec4<f32>(0.15, 0.3, 0.15, 1.0); // Subtle green line at top
    }

    output.color = final_color;
    return output;
}
