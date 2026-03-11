// Visual Shell Performance Benchmark
//
// Validates visual shell performance against targets:
// - Spectral mixer operations: < 1µs per blend
// - Hilbert mapping: < 100ns per coordinate
// - Glyph substrate operations: < 500ns per glyph
// - PixelRTS bridge latency: < 5ms for 1k pixels

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};

// ============================================
// Spectral Mixer Types
// ============================================

/// RGBA color for spectral operations
#[derive(Debug, Clone, Copy, Default)]
pub struct Color {
    pub r: f32,
    pub g: f32,
    pub b: f32,
    pub a: f32,
}

impl Color {
    pub fn new(r: f32, g: f32, b: f32, a: f32) -> Self {
        Self { r, g, b, a }
    }

    pub fn from_u8(r: u8, g: u8, b: u8, a: u8) -> Self {
        Self {
            r: r as f32 / 255.0,
            g: g as f32 / 255.0,
            b: b as f32 / 255.0,
            a: a as f32 / 255.0,
        }
    }

    /// Alpha blend this color over another
    pub fn blend_over(&self, other: &Color) -> Color {
        let out_a = self.a + other.a * (1.0 - self.a);
        if out_a == 0.0 {
            return Color::default();
        }
        Color {
            r: (self.r * self.a + other.r * other.a * (1.0 - self.a)) / out_a,
            g: (self.g * self.a + other.g * other.a * (1.0 - self.a)) / out_a,
            b: (self.b * self.a + other.b * other.a * (1.0 - self.a)) / out_a,
            a: out_a,
        }
    }

    /// Additive blend
    pub fn blend_add(&self, other: &Color) -> Color {
        Color {
            r: (self.r + other.r).min(1.0),
            g: (self.g + other.g).min(1.0),
            b: (self.b + other.b).min(1.0),
            a: (self.a + other.a).min(1.0),
        }
    }

    /// Multiply blend
    pub fn blend_multiply(&self, other: &Color) -> Color {
        Color {
            r: self.r * other.r,
            g: self.g * other.g,
            b: self.b * other.b,
            a: self.a * other.a,
        }
    }

    /// Screen blend
    pub fn blend_screen(&self, other: &Color) -> Color {
        Color {
            r: 1.0 - (1.0 - self.r) * (1.0 - other.r),
            g: 1.0 - (1.0 - self.g) * (1.0 - other.g),
            b: 1.0 - (1.0 - self.b) * (1.0 - other.b),
            a: 1.0 - (1.0 - self.a) * (1.0 - other.a),
        }
    }

    /// Lerp between colors
    pub fn lerp(&self, other: &Color, t: f32) -> Color {
        Color {
            r: self.r + (other.r - self.r) * t,
            g: self.g + (other.g - self.g) * t,
            b: self.b + (other.b - self.b) * t,
            a: self.a + (other.a - self.a) * t,
        }
    }
}

/// Design tokens for theming
pub struct DesignTokens {
    pub background: Color,
    pub foreground: Color,
    pub primary: Color,
    pub secondary: Color,
    pub accent: Color,
    pub error: Color,
    pub success: Color,
    pub warning: Color,
}

impl Default for DesignTokens {
    fn default() -> Self {
        Self {
            background: Color::from_u8(12, 12, 12, 255),
            foreground: Color::from_u8(230, 230, 230, 255),
            primary: Color::from_u8(0, 122, 204, 255),
            secondary: Color::from_u8(45, 45, 45, 255),
            accent: Color::from_u8(255, 99, 71, 255),
            error: Color::from_u8(255, 85, 85, 255),
            success: Color::from_u8(85, 255, 85, 255),
            warning: Color::from_u8(255, 200, 85, 255),
        }
    }
}

// ============================================
// Hilbert Mapper Types
// ============================================

/// Hilbert curve mapper for 2D to 1D conversion
pub struct HilbertMapper {
    order: u32,
    size: u32,
}

impl HilbertMapper {
    pub fn new(order: u32) -> Self {
        Self {
            order,
            size: 1 << order,
        }
    }

    pub fn xy_to_d(&self, x: u32, y: u32) -> u32 {
        hilbert_xy2d(self.order, x, y)
    }

    pub fn d_to_xy(&self, d: u32) -> (u32, u32) {
        hilbert_d2xy(self.order, d)
    }
}

fn hilbert_d2xy(order: u32, d: u32) -> (u32, u32) {
    let mut x: u32 = 0;
    let mut y: u32 = 0;
    let mut s: u32 = 1;
    let mut d = d;

    for _ in 0..order {
        let rx = 1 & (d / 2);
        let ry = 1 & (d ^ rx);
        rot(s, &mut x, &mut y, rx, ry);
        x += s * rx;
        y += s * ry;
        d /= 4;
        s *= 2;
    }
    (x, y)
}

fn hilbert_xy2d(order: u32, x: u32, y: u32) -> u32 {
    let mut d: u32 = 0;
    let mut s: u32 = 1 << (order - 1);
    let mut x = x;
    let mut y = y;

    while s > 0 {
        let rx = if (x & s) != 0 { 1 } else { 0 };
        let ry = if (y & s) != 0 { 1 } else { 0 };
        d += s * s * ((3 * rx) ^ ry);
        rot(s, &mut x, &mut y, rx, ry);
        s /= 2;
    }
    d
}

fn rot(n: u32, x: &mut u32, y: &mut u32, rx: u32, ry: u32) {
    if ry == 0 {
        if rx == 1 {
            *x = n - 1 - *x;
            *y = n - 1 - *y;
        }
        std::mem::swap(x, y);
    }
}

// ============================================
// Glyph Substrate Types
// ============================================

/// A single glyph cell
#[derive(Debug, Clone, Copy)]
pub struct GlyphCell {
    pub char_code: char,
    pub fg_color: Color,
    pub bg_color: Color,
    pub style: GlyphStyle,
}

#[derive(Debug, Clone, Copy, Default)]
pub struct GlyphStyle {
    pub bold: bool,
    pub italic: bool,
    pub underline: bool,
    pub strikethrough: bool,
}

impl Default for GlyphCell {
    fn default() -> Self {
        Self {
            char_code: ' ',
            fg_color: Color::from_u8(230, 230, 230, 255),
            bg_color: Color::from_u8(12, 12, 12, 255),
            style: GlyphStyle::default(),
        }
    }
}

/// Glyph substrate for terminal rendering
#[derive(Clone)]
pub struct GlyphSubstrate {
    width: u32,
    height: u32,
    cells: Vec<GlyphCell>,
}

impl GlyphSubstrate {
    pub fn new(width: u32, height: u32) -> Self {
        Self {
            width,
            height,
            cells: vec![GlyphCell::default(); (width * height) as usize],
        }
    }

    pub fn set_cell(&mut self, x: u32, y: u32, cell: GlyphCell) {
        if x < self.width && y < self.height {
            self.cells[(y * self.width + x) as usize] = cell;
        }
    }

    pub fn get_cell(&self, x: u32, y: u32) -> Option<&GlyphCell> {
        if x < self.width && y < self.height {
            Some(&self.cells[(y * self.width + x) as usize])
        } else {
            None
        }
    }

    pub fn fill_rect(&mut self, x1: u32, y1: u32, x2: u32, y2: u32, cell: GlyphCell) {
        for y in y1..y2.min(self.height) {
            for x in x1..x2.min(self.width) {
                self.cells[(y * self.width + x) as usize] = cell;
            }
        }
    }
}

// ============================================
// Benchmarks
// ============================================

/// Benchmark color blending operations
fn bench_color_blending(c: &mut Criterion) {
    let mut group = c.benchmark_group("vshell_color");

    let fg = Color::from_u8(255, 128, 64, 200);
    let bg = Color::from_u8(32, 64, 128, 255);

    group.bench_function("blend_alpha", |b| {
        b.iter(|| {
            let result = fg.blend_over(&bg);
            black_box(result);
        });
    });

    group.bench_function("blend_add", |b| {
        b.iter(|| {
            let result = fg.blend_add(&bg);
            black_box(result);
        });
    });

    group.bench_function("blend_multiply", |b| {
        b.iter(|| {
            let result = fg.blend_multiply(&bg);
            black_box(result);
        });
    });

    group.bench_function("blend_screen", |b| {
        b.iter(|| {
            let result = fg.blend_screen(&bg);
            black_box(result);
        });
    });

    group.bench_function("lerp", |b| {
        b.iter(|| {
            let result = fg.lerp(&bg, 0.5);
            black_box(result);
        });
    });

    // Batch blending
    group.throughput(Throughput::Elements(1000));
    group.bench_function("blend_batch_1k", |b| {
        let colors: Vec<Color> = (0..1000)
            .map(|i| Color::from_u8((i % 256) as u8, ((i + 85) % 256) as u8, ((i + 170) % 256) as u8, 255))
            .collect();

        b.iter(|| {
            let mut result = bg;
            for color in &colors {
                result = color.blend_over(&result);
            }
            black_box(result);
        });
    });

    group.finish();
}

/// Benchmark design token operations
fn bench_design_tokens(c: &mut Criterion) {
    let mut group = c.benchmark_group("vshell_tokens");

    group.bench_function("create_tokens", |b| {
        b.iter(|| {
            let tokens = DesignTokens::default();
            black_box(tokens);
        });
    });

    let tokens = DesignTokens::default();
    group.bench_function("access_token", |b| {
        b.iter(|| {
            let primary = tokens.primary;
            let accent = tokens.accent;
            let blended = primary.blend_over(&accent);
            black_box(blended);
        });
    });

    group.finish();
}

/// Benchmark Hilbert mapping operations
fn bench_hilbert_mapping(c: &mut Criterion) {
    let mut group = c.benchmark_group("vshell_hilbert");

    let mapper = HilbertMapper::new(8); // 256x256

    group.throughput(Throughput::Elements(1000));
    group.bench_function("d2xy_1k", |b| {
        b.iter(|| {
            let mut coords = Vec::with_capacity(1000);
            for i in 0..1000u32 {
                coords.push(mapper.d_to_xy(i));
            }
            black_box(coords);
        });
    });

    group.bench_function("xy2d_1k", |b| {
        b.iter(|| {
            let mut indices = Vec::with_capacity(1000);
            for i in 0..1000u32 {
                let x = i % 256;
                let y = i / 256;
                indices.push(mapper.xy_to_d(x, y));
            }
            black_box(indices);
        });
    });

    group.bench_function("roundtrip_1k", |b| {
        b.iter(|| {
            let mut sum = 0u64;
            for i in 0..1000u32 {
                let (x, y) = mapper.d_to_xy(i);
                let d = mapper.xy_to_d(x, y);
                sum += d as u64;
            }
            black_box(sum);
        });
    });

    group.finish();
}

/// Benchmark glyph substrate operations
fn bench_glyph_substrate(c: &mut Criterion) {
    let mut group = c.benchmark_group("vshell_glyph");

    group.bench_function("create_80x24", |b| {
        b.iter(|| {
            let substrate = GlyphSubstrate::new(80, 24);
            black_box(substrate);
        });
    });

    group.bench_function("set_cell", |b| {
        let mut substrate = GlyphSubstrate::new(80, 24);
        let cell = GlyphCell {
            char_code: 'A',
            fg_color: Color::from_u8(255, 255, 255, 255),
            bg_color: Color::from_u8(0, 0, 0, 255),
            style: GlyphStyle::default(),
        };

        b.iter(|| {
            substrate.set_cell(40, 12, cell);
            black_box(&substrate);
        });
    });

    group.bench_function("get_cell", |b| {
        let substrate = GlyphSubstrate::new(80, 24);

        b.iter(|| {
            let cell = substrate.get_cell(40, 12);
            black_box(cell);
        });
    });

    // Fill operations
    group.throughput(Throughput::Elements(80 * 24));
    group.bench_function("fill_all_80x24", |b| {
        let mut substrate = GlyphSubstrate::new(80, 24);
        let cell = GlyphCell {
            char_code: 'X',
            ..GlyphCell::default()
        };

        b.iter(|| {
            substrate.fill_rect(0, 0, 80, 24, cell);
            black_box(&substrate);
        });
    });

    // Partial update simulation
    group.bench_function("partial_update_80x24", |b| {
        let mut substrate = GlyphSubstrate::new(80, 24);

        b.iter(|| {
            // Update a line of text
            for x in 0..40 {
                let cell = GlyphCell {
                    char_code: char::from((b'A' + (x % 26) as u8)),
                    ..GlyphCell::default()
                };
                substrate.set_cell(x, 12, cell);
            }
            black_box(&substrate);
        });
    });

    group.finish();
}

/// Benchmark visual state management
fn bench_visual_state(c: &mut Criterion) {
    let mut group = c.benchmark_group("vshell_state");

    /// Visual state for animation
    pub struct VisualState {
        pub glow_intensity: f32,
        pub resonance: f32,
        pub activity_level: f32,
        pub timestamp: f64,
    }

    impl Default for VisualState {
        fn default() -> Self {
            Self {
                glow_intensity: 0.0,
                resonance: 0.5,
                activity_level: 0.5,
                timestamp: 0.0,
            }
        }
    }

    group.bench_function("state_update", |b| {
        let mut state = VisualState::default();

        b.iter(|| {
            state.glow_intensity = (state.glow_intensity + 0.1).min(1.0);
            state.resonance = (state.resonance + 0.05).min(1.0);
            state.timestamp += 1.0 / 60.0;
            black_box(&state);
        });
    });

    group.bench_function("state_lerp", |b| {
        let state_a = VisualState {
            glow_intensity: 0.0,
            resonance: 0.0,
            activity_level: 0.0,
            timestamp: 0.0f64,
        };
        let state_b = VisualState {
            glow_intensity: 1.0,
            resonance: 1.0,
            activity_level: 1.0,
            timestamp: 1.0f64,
        };

        b.iter(|| {
            let t = 0.5f64;
            let interpolated = VisualState {
                glow_intensity: state_a.glow_intensity + (state_b.glow_intensity - state_a.glow_intensity) * t as f32,
                resonance: state_a.resonance + (state_b.resonance - state_a.resonance) * t as f32,
                activity_level: state_a.activity_level + (state_b.activity_level - state_a.activity_level) * t as f32,
                timestamp: state_a.timestamp + (state_b.timestamp - state_a.timestamp) * t,
            };
            black_box(interpolated);
        });
    });

    group.finish();
}

/// Benchmark pixel operations
fn bench_pixel_operations(c: &mut Criterion) {
    let mut group = c.benchmark_group("vshell_pixel");

    // RGBA to internal format conversion
    fn rgba_to_bgra(rgba: &[u8]) -> Vec<u8> {
        rgba.chunks_exact(4)
            .flat_map(|chunk| [chunk[2], chunk[1], chunk[0], chunk[3]])
            .collect()
    }

    // Premultiply alpha
    fn premultiply_alpha(rgba: &mut [u8]) {
        for pixel in rgba.chunks_exact_mut(4) {
            let a = pixel[3] as f32 / 255.0;
            pixel[0] = (pixel[0] as f32 * a) as u8;
            pixel[1] = (pixel[1] as f32 * a) as u8;
            pixel[2] = (pixel[2] as f32 * a) as u8;
        }
    }

    /// Optimized premultiply alpha using integer math (avoiding float conversion)
    fn premultiply_alpha_optimized(rgba: &mut [u8]) {
        for pixel in rgba.chunks_exact_mut(4) {
            let a = pixel[3] as u16;
            // Use integer multiplication with bit shift for rounding
            // result = (color * alpha + 128) >> 8
            pixel[0] = ((pixel[0] as u16 * a + 128) >> 8) as u8;
            pixel[1] = ((pixel[1] as u16 * a + 128) >> 8) as u8;
            pixel[2] = ((pixel[2] as u16 * a + 128) >> 8) as u8;
        }
    }

    /// SIMD-friendly batch processing (process 4 pixels at a time as u32)
    fn premultiply_alpha_batch(rgba: &mut [u8]) {
        // Process in chunks of 16 bytes (4 pixels)
        for chunk in rgba.chunks_exact_mut(16) {
            // Extract 4 pixels worth of data
            for i in 0..4 {
                let offset = i * 4;
                let a = chunk[offset + 3] as u16;
                chunk[offset] = ((chunk[offset] as u16 * a + 128) >> 8) as u8;
                chunk[offset + 1] = ((chunk[offset + 1] as u16 * a + 128) >> 8) as u8;
                chunk[offset + 2] = ((chunk[offset + 2] as u16 * a + 128) >> 8) as u8;
            }
        }
        // Handle remaining pixels
        let remainder_start = (rgba.len() / 16) * 16;
        for pixel in rgba[remainder_start..].chunks_exact_mut(4) {
            let a = pixel[3] as u16;
            pixel[0] = ((pixel[0] as u16 * a + 128) >> 8) as u8;
            pixel[1] = ((pixel[1] as u16 * a + 128) >> 8) as u8;
            pixel[2] = ((pixel[2] as u16 * a + 128) >> 8) as u8;
        }
    }

    let rgba_data: Vec<u8> = (0..256 * 256 * 4)
        .map(|i| (i % 256) as u8)
        .collect();

    group.throughput(Throughput::Bytes(256 * 256 * 4));
    group.bench_function("rgba_to_bgra_256x256", |b| {
        b.iter(|| {
            let bgra = rgba_to_bgra(&rgba_data);
            black_box(bgra);
        });
    });

    group.bench_function("premultiply_256x256", |b| {
        let mut data = rgba_data.clone();
        b.iter(|| {
            premultiply_alpha(&mut data);
            black_box(&data);
            data = rgba_data.clone();
        });
    });

    group.bench_function("premultiply_optimized_256x256", |b| {
        let mut data = rgba_data.clone();
        b.iter(|| {
            premultiply_alpha_optimized(&mut data);
            black_box(&data);
            data = rgba_data.clone();
        });
    });

    group.bench_function("premultiply_batch_256x256", |b| {
        let mut data = rgba_data.clone();
        b.iter(|| {
            premultiply_alpha_batch(&mut data);
            black_box(&data);
            data = rgba_data.clone();
        });
    });

    // Fill rect in buffer
    group.bench_function("fill_rect_rgba", |b| {
        let mut buffer = vec![0u8; 1024 * 1024 * 4];
        let fill_color = [255, 128, 64, 255];

        b.iter(|| {
            // Fill 256x256 region at (256, 256)
            let start_y = 256;
            let end_y = 512;
            let start_x = 256;
            let end_x = 512;
            let stride = 1024 * 4;

            for y in start_y..end_y {
                for x in start_x..end_x {
                    let offset = (y * stride + x * 4) as usize;
                    buffer[offset..offset + 4].copy_from_slice(&fill_color);
                }
            }
            black_box(&buffer);
        });
    });

    group.finish();
}

/// Benchmark integration workflow
fn bench_integration_workflow(c: &mut Criterion) {
    let mut group = c.benchmark_group("vshell_workflow");

    // Simulate a complete frame of visual shell rendering
    group.bench_function("frame_workflow", |b| {
        let tokens = DesignTokens::default();
        let mapper = HilbertMapper::new(8);

        b.iter(|| {
            let mut substrate = GlyphSubstrate::new(80, 24);
            // Update glyph substrate (simulated text output)
            for x in 0..40 {
                let cell = GlyphCell {
                    char_code: char::from((b'A' + (x % 26) as u8)),
                    fg_color: tokens.foreground,
                    bg_color: tokens.background,
                    style: GlyphStyle::default(),
                };
                substrate.set_cell(x, 12, cell);
            }

            // Apply visual effects
            let glow = tokens.accent.blend_over(&tokens.background);

            // Map to Hilbert space (for RTS texture)
            let mut hilbert_indices = Vec::with_capacity(80 * 24);
            for y in 0..24 {
                for x in 0..80 {
                    hilbert_indices.push(mapper.xy_to_d(x, y));
                }
            }

            black_box((substrate, glow, hilbert_indices));
        });
    });

    group.finish();
}

criterion_group!(
    benches,
    bench_color_blending,
    bench_design_tokens,
    bench_hilbert_mapping,
    bench_glyph_substrate,
    bench_visual_state,
    bench_pixel_operations,
    bench_integration_workflow,
);
criterion_main!(benches);
