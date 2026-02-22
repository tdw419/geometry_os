// ============================================
// GEOMETRY OS - IDE CODE EDITOR SHADER
// Phase J.2: Neural IDE Visual Builder
// ============================================
//
// Fragment shader for rendering code editor tiles with:
// - Syntax highlighting via storage buffer colors
// - Blinking cursor rendering
// - Line number bar support
// - Character grid rendering
//
// ============================================

// --- CONSTANTS ---
const CHAR_SIZE: vec2<f32> = vec2<f32>(8.0, 16.0);
const MAX_COLS: u32 = 80u;
const MAX_ROWS: u32 = 40u;
const LINE_NUMBER_BAR_WIDTH: f32 = 40.0;
const CURSOR_BLINK_PERIOD: f32 = 1.0;

// --- BINDINGS ---

// Uniforms (bind group 0)
@group(0) @binding(0) var<uniform> tile_bounds: vec4<f32>;     // (x, y, width, height)
@group(0) @binding(1) var<uniform> zoom_level: f32;
@group(0) @binding(2) var<uniform> cursor_pos: vec2<f32>;      // (line, column)
@group(0) @binding(3) var<uniform> scroll_offset: f32;         // Vertical scroll in lines
@group(0) @binding(4) var<uniform> line_count: u32;
@group(0) @binding(5) var<uniform> time: f32;                  // For cursor blink animation

// Storage buffers (bind group 0)
@group(0) @binding(6) var<storage, read> text_lines: array<u32>;     // Packed text data
@group(0) @binding(7) var<storage, read> syntax_colors: array<u32>;  // RGBA colors per character

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
const BG_COLOR: vec4<f32> = vec4<f32>(0.12, 0.12, 0.14, 1.0);
const LINE_NUMBER_BG: vec4<f32> = vec4<f32>(0.08, 0.08, 0.10, 1.0);
const LINE_NUMBER_TEXT: vec4<f32> = vec4<f32>(0.5, 0.5, 0.55, 1.0);
const CURSOR_COLOR: vec4<f32> = vec4<f32>(0.9, 0.9, 0.9, 1.0);
const DEFAULT_TEXT_COLOR: vec4<f32> = vec4<f32>(0.85, 0.85, 0.85, 1.0);
const SELECTION_BG: vec4<f32> = vec4<f32>(0.2, 0.3, 0.5, 0.5);

// --- VERTEX SHADER ---

@vertex
fn vs_main(input: VertexInput) -> VertexOutput {
    var output: VertexOutput;

    // Generate full-screen quad triangle strip
    let positions = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0), // 0: bottom-left
        vec2<f32>( 1.0, -1.0), // 1: bottom-right
        vec2<f32>(-1.0,  1.0), // 2: top-left
        vec2<f32>(-1.0,  1.0), // 3: top-left
        vec2<f32>( 1.0, -1.0), // 4: bottom-right
        vec2<f32>( 1.0,  1.0)  // 5: top-right
    );

    let uvs = array<vec2<f32>, 6>(
        vec2<f32>(0.0, 1.0), // 0: bottom-left
        vec2<f32>(1.0, 1.0), // 1: bottom-right
        vec2<f32>(0.0, 0.0), // 2: top-left
        vec2<f32>(0.0, 0.0), // 3: top-left
        vec2<f32>(1.0, 1.0), // 4: bottom-right
        vec2<f32>(1.0, 0.0)  // 5: top-right
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

/// Convert a u32 color (RGBA packed) to vec4<f32>
fn unpack_color(packed: u32) -> vec4<f32> {
    let r = f32((packed >> 0u) & 0xFFu) / 255.0;
    let g = f32((packed >> 8u) & 0xFFu) / 255.0;
    let b = f32((packed >> 16u) & 0xFFu) / 255.0;
    let a = f32((packed >> 24u) & 0xFFu) / 255.0;
    return vec4<f32>(r, g, b, a);
}

/// Get character at specific row and column
fn get_char_at(row: u32, col: u32) -> u32 {
    if (row >= MAX_ROWS || col >= MAX_COLS) {
        return 0u; // Out of bounds
    }

    // Each u32 holds 4 characters
    let chars_per_u32 = 4u;
    let index = row * MAX_COLS + col;
    let packed_index = index / chars_per_u32;
    let sub_index = index % chars_per_u32;

    let packed = text_lines[packed_index];
    let chars = unpack_chars(packed);
    return chars[sub_index];
}

/// Get syntax color at specific row and column
fn get_color_at(row: u32, col: u32) -> vec4<f32> {
    if (row >= MAX_ROWS || col >= MAX_COLS) {
        return DEFAULT_TEXT_COLOR;
    }

    let index = row * MAX_COLS + col;
    let packed = syntax_colors[index];
    return unpack_color(packed);
}

/// Check if a point is within a rectangular region
fn in_rect(pos: vec2<f32>, rect_origin: vec2<f32>, rect_size: vec2<f32>) -> bool {
    return pos.x >= rect_origin.x &&
           pos.x < rect_origin.x + rect_size.x &&
           pos.y >= rect_origin.y &&
           pos.y < rect_origin.y + rect_size.y;
}

/// Render a simple 8x8 bitmap character
/// Returns alpha value (0.0 or 1.0) for character presence
fn render_char(char_code: u32, char_pos: vec2<f32>) -> f32 {
    // Simplified character rendering
    // For full implementation, this would sample a font texture
    // Here we use a procedural approach for basic visibility

    if (char_code == 0u || char_code == 32u) {
        // Space or null - no rendering
        return 0.0;
    }

    // Simple procedural block character for visibility
    // Returns 1.0 if within character bounds
    let local_pos = char_pos;
    if (local_pos.x < 1.0 || local_pos.x >= 7.0 ||
        local_pos.y < 2.0 || local_pos.y >= 14.0) {
        return 0.0;
    }

    return 1.0;
}

/// Calculate cursor blink effect
fn get_cursor_alpha(time: f32) -> f32 {
    // Sine-based blinking: visible > 0, invisible < 0
    let blink = sin(time * 6.28318 / CURSOR_BLINK_PERIOD);
    return step(0.0, blink);
}

/// Render line number for a specific row
fn render_line_number(row: u32, local_pos: vec2<f32>) -> vec4<f32> {
    // Line number is 1-indexed for display
    let line_num = row + 1u;

    // Calculate digit positions
    let char_pos = local_pos;
    let digit_char_size = vec2<f32>(6.0, 12.0);

    // For simplicity, render as a subtle highlight
    // Full implementation would render actual digits
    if (char_pos.x >= 4.0 && char_pos.x < 36.0 &&
        char_pos.y >= 2.0 && char_pos.y < 14.0) {
        // Show dim text color for line number area
        let alpha = 0.6;
        return vec4<f32>(LINE_NUMBER_TEXT.rgb, LINE_NUMBER_TEXT.a * alpha);
    }

    return vec4<f32>(0.0);
}

// --- FRAGMENT SHADER ---

@fragment
fn fs_main(input: VertexOutput) -> FragmentOutput {
    var output: FragmentOutput;

    // Calculate tile dimensions in pixels
    let tile_size = tile_bounds.zw;

    // Convert UV to local pixel coordinates within the tile
    let pixel_pos = input.uv * tile_size;

    // Apply zoom for character grid calculation
    let effective_char_size = CHAR_SIZE * zoom_level;

    // ─── BACKGROUND ───
    // Start with dark background
    var final_color = BG_COLOR;

    // ─── LINE NUMBER BAR ───
    // Left side (first 40 pixels) is for line numbers
    let in_line_number_bar = pixel_pos.x < LINE_NUMBER_BAR_WIDTH;

    if (in_line_number_bar) {
        // Darker background for line number bar
        final_color = LINE_NUMBER_BG;

        // Calculate which row we're in
        let row_f = (pixel_pos.y / effective_char_size.y) + scroll_offset;
        let row = u32(floor(row_f));

        if (row < line_count && row < MAX_ROWS) {
            // Try to render line number
            let char_local_y = pixel_pos.y - f32(row - u32(floor(scroll_offset))) * effective_char_size.y;
            let line_num_color = render_line_number(row, vec2<f32>(pixel_pos.x, char_local_y));
            if (line_num_color.a > 0.0) {
                final_color = line_num_color;
            }
        }
    } else {
        // ─── CODE AREA ───

        // Adjust position for line number bar offset
        let code_pixel_pos = vec2<f32>(pixel_pos.x - LINE_NUMBER_BAR_WIDTH, pixel_pos.y);

        // Calculate character grid position with scroll offset
        let col_f = code_pixel_pos.x / effective_char_size.x;
        let row_f = (code_pixel_pos.y / effective_char_size.y) + scroll_offset;

        let col = u32(floor(col_f));
        let row = u32(floor(row_f));

        // Check bounds against MAX_COLS and MAX_ROWS
        if (col < MAX_COLS && row < MAX_ROWS) {
            // Local position within the character cell
            let char_local_x = code_pixel_pos.x - f32(col) * effective_char_size.x;
            let char_local_y = code_pixel_pos.y - f32(row - u32(floor(scroll_offset))) * effective_char_size.y;
            let char_local_pos = vec2<f32>(char_local_x, char_local_y);

            // Get character and its syntax color
            let char_code = get_char_at(row, col);
            let syntax_color = get_color_at(row, col);

            // ─── CURSOR RENDERING ───
            let cursor_row = u32(floor(cursor_pos.y));
            let cursor_col = u32(floor(cursor_pos.x));

            if (row == cursor_row && col == cursor_col) {
                // Cursor blink effect
                let cursor_alpha = get_cursor_alpha(time);

                // Render cursor as a vertical bar (2 pixels wide)
                if (char_local_x < 2.0) {
                    final_color = vec4<f32>(
                        mix(final_color.rgb, CURSOR_COLOR.rgb, cursor_alpha),
                        1.0
                    );
                    output.color = final_color;
                    return output;
                }
            }

            // ─── CHARACTER RENDERING ───
            if (char_code != 0u && char_code != 32u) { // Not null or space
                // Render character
                let char_alpha = render_char(char_code, char_local_pos);

                if (char_alpha > 0.0) {
                    // Apply syntax color
                    final_color = vec4<f32>(
                        mix(final_color.rgb, syntax_color.rgb, syntax_color.a * char_alpha),
                        1.0
                    );
                }
            }
        }
    }

    // ─── BORDER ───
    // Add subtle border around the tile
    let border_width = 1.0;
    if (pixel_pos.x < border_width ||
        pixel_pos.x >= tile_size.x - border_width ||
        pixel_pos.y < border_width ||
        pixel_pos.y >= tile_size.y - border_width) {
        let border_color = vec4<f32>(0.3, 0.3, 0.35, 1.0);
        final_color = border_color;
    }

    // ─── LINE NUMBER BAR DIVIDER ───
    // Add vertical line separating line numbers from code
    if (abs(pixel_pos.x - LINE_NUMBER_BAR_WIDTH) < 1.0) {
        let divider_color = vec4<f32>(0.25, 0.25, 0.28, 1.0);
        final_color = divider_color;
    }

    output.color = final_color;
    return output;
}
