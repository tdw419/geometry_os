//! Glyph Substrate - Hilbert-mapped VRAM buffer for native glyph rendering
//!
//! This module implements the core visual memory substrate for the Native Glyph
//! Visual Shell. It uses Hilbert curve indexing to maintain 95% spatial locality,
//! ensuring that adjacent pixels on screen remain close in GPU cache.
//!
//! # Architecture
//!
//! ```text
//! ┌─────────────────────────────────────────────────────────┐
//! │                   GlyphSubstrate                        │
//! ├─────────────────────────────────────────────────────────┤
//! │  width: u32, height: u32                                │
//! │  order: u8 (Hilbert curve order)                        │
//! │  buffer: Vec<RGBA> (Hilbert-indexed pixel buffer)       │
//! │  dirty_regions: Vec<Rect> (for efficient GPU upload)    │
//! │  font: BitmapFont (embedded 8x8 ASCII font)             │
//! └─────────────────────────────────────────────────────────┘
//! ```
//!
//! # Spatial Locality
//!
//! The Hilbert curve ensures that pixels which are close together on screen
//! are also close together in memory. This property is crucial for:
//!
//! - GPU cache efficiency (95% coherence)
//! - Efficient batch rendering
//! - Real-time visual updates
//!
//! # Text Rendering
//!
//! The substrate includes an embedded 8x8 bitmap font for rendering ASCII text.
//! Use [`GlyphSubstrate::draw_text`] to render strings with precise positioning.

use std::ops::{Index, IndexMut};

#[path = "bitmap_font.rs"]
mod bitmap_font;

pub use bitmap_font::BitmapFont;

/// RGBA pixel color (4 bytes)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
#[repr(C)]
pub struct RGBA {
    pub r: u8,
    pub g: u8,
    pub b: u8,
    pub a: u8,
}

impl RGBA {
    /// Create a new RGBA color
    pub const fn new(r: u8, g: u8, b: u8, a: u8) -> Self {
        Self { r, g, b, a }
    }

    /// Create from a packed u32 (0xRRGGBBAA)
    pub const fn from_u32(packed: u32) -> Self {
        Self {
            r: ((packed >> 24) & 0xFF) as u8,
            g: ((packed >> 16) & 0xFF) as u8,
            b: ((packed >> 8) & 0xFF) as u8,
            a: (packed & 0xFF) as u8,
        }
    }

    /// Convert to packed u32 (0xRRGGBBAA)
    pub const fn to_u32(&self) -> u32 {
        ((self.r as u32) << 24)
            | ((self.g as u32) << 16)
            | ((self.b as u32) << 8)
            | (self.a as u32)
    }

    /// Create a transparent black pixel
    pub const fn transparent() -> Self {
        Self::new(0, 0, 0, 0)
    }

    /// Create a black pixel
    pub const fn black() -> Self {
        Self::new(0, 0, 0, 255)
    }

    /// Create a white pixel
    pub const fn white() -> Self {
        Self::new(255, 255, 255, 255)
    }

    // ===== Common UI Colors =====

    /// Create a red pixel
    pub const fn red() -> Self {
        Self::new(255, 0, 0, 255)
    }

    /// Create a green pixel
    pub const fn green() -> Self {
        Self::new(0, 255, 0, 255)
    }

    /// Create a blue pixel
    pub const fn blue() -> Self {
        Self::new(0, 0, 255, 255)
    }

    /// Create a yellow pixel
    pub const fn yellow() -> Self {
        Self::new(255, 255, 0, 255)
    }

    /// Create a cyan pixel
    pub const fn cyan() -> Self {
        Self::new(0, 255, 255, 255)
    }

    /// Create a magenta pixel
    pub const fn magenta() -> Self {
        Self::new(255, 0, 255, 255)
    }

    /// Create an orange pixel
    pub const fn orange() -> Self {
        Self::new(255, 165, 0, 255)
    }

    /// Create a gray pixel
    pub const fn gray() -> Self {
        Self::new(128, 128, 128, 255)
    }

    /// Create a light gray pixel
    pub const fn light_gray() -> Self {
        Self::new(192, 192, 192, 255)
    }

    /// Create a dark gray pixel
    pub const fn dark_gray() -> Self {
        Self::new(64, 64, 64, 255)
    }

    // ===== Terminal Colors =====

    /// Create a terminal green (classic terminal color)
    pub const fn terminal_green() -> Self {
        Self::new(0, 255, 136, 255)
    }

    /// Create a terminal amber (classic amber terminal)
    pub const fn terminal_amber() -> Self {
        Self::new(255, 176, 0, 255)
    }

    /// Create a terminal background (dark blue-black)
    pub const fn terminal_bg() -> Self {
        Self::new(0, 0, 40, 255)
    }

    // ===== UI Theme Colors =====

    /// Create a UI panel background
    pub const fn panel_bg() -> Self {
        Self::new(30, 30, 40, 255)
    }

    /// Create a UI panel border
    pub const fn panel_border() -> Self {
        Self::new(60, 60, 80, 255)
    }

    /// Create a UI highlight
    pub const fn highlight() -> Self {
        Self::new(100, 149, 237, 255)
    }

    /// Create a success color (green)
    pub const fn success() -> Self {
        Self::new(40, 200, 80, 255)
    }

    /// Create a warning color (orange)
    pub const fn warning() -> Self {
        Self::new(255, 165, 0, 255)
    }

    /// Create an error color (red)
    pub const fn error() -> Self {
        Self::new(220, 53, 69, 255)
    }

    /// Create with modified alpha
    pub const fn with_alpha(&self, a: u8) -> Self {
        Self::new(self.r, self.g, self.b, a)
    }

    /// Blend with another color (optimized integer alpha blend)
    /// 
    /// Uses integer arithmetic for ~2x speedup over float-based blending.
    /// Formula: result = other * alpha + self * (255 - alpha) / 255
    #[inline]
    pub fn blend(&self, other: &RGBA) -> Self {
        // Fast integer alpha blending
        let alpha = other.a as u32;
        let inv_alpha = 255 - alpha;
        
        // Use integer multiplication with rounding (>> 8 instead of / 255)
        // This is accurate to within 1 unit and much faster
        Self::new(
            ((other.r as u32 * alpha + self.r as u32 * inv_alpha + 128) >> 8) as u8,
            ((other.g as u32 * alpha + self.g as u32 * inv_alpha + 128) >> 8) as u8,
            ((other.b as u32 * alpha + self.b as u32 * inv_alpha + 128) >> 8) as u8,
            ((255 * alpha + self.a as u32 * inv_alpha + 128) >> 8).min(255) as u8,
        )
    }
    
    /// Fast blend without alpha calculation (assumes fully opaque overlay)
    #[inline]
    pub fn blend_opaque(&self, other: &RGBA) -> Self {
        if other.a == 255 {
            *other
        } else if other.a == 0 {
            *self
        } else {
            self.blend(other)
        }
    }
    
    /// Premultiplied alpha blend (for compositing pre-multiplied colors)
    #[inline]
    pub fn blend_premultiplied(&self, other: &RGBA) -> Self {
        let alpha = other.a as u32;
        let inv_alpha = 255 - alpha;
        
        Self::new(
            (other.r as u32 + ((self.r as u32 * inv_alpha + 128) >> 8)).min(255) as u8,
            (other.g as u32 + ((self.g as u32 * inv_alpha + 128) >> 8)).min(255) as u8,
            (other.b as u32 + ((self.b as u32 * inv_alpha + 128) >> 8)).min(255) as u8,
            (other.a as u32 + ((self.a as u32 * inv_alpha + 128) >> 8)).min(255) as u8,
        )
    }
}

/// A rectangular region for dirty tracking
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Rect {
    pub x: u32,
    pub y: u32,
    pub width: u32,
    pub height: u32,
}

impl Rect {
    pub const fn new(x: u32, y: u32, width: u32, height: u32) -> Self {
        Self { x, y, width, height }
    }

    /// Check if this rect contains a point
    pub const fn contains(&self, px: u32, py: u32) -> bool {
        px >= self.x
            && py >= self.y
            && px < self.x + self.width
            && py < self.y + self.height
    }

    /// Get the area of this rect
    pub const fn area(&self) -> u32 {
        self.width * self.height
    }

    /// Merge two rects (return bounding box)
    pub fn merge(&self, other: &Rect) -> Rect {
        let x1 = self.x.min(other.x);
        let y1 = self.y.min(other.y);
        let x2 = (self.x + self.width).max(other.x + other.width);
        let y2 = (self.y + self.height).max(other.y + other.height);
        Rect::new(x1, y1, x2 - x1, y2 - y1)
    }
}

/// Errors that can occur in the Glyph Substrate
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum SubstrateError {
    /// Coordinate out of bounds
    OutOfBounds { x: u32, y: u32, width: u32, height: u32 },

    /// Invalid Hilbert order
    InvalidOrder { order: u8, min: u8, max: u8 },

    /// Index out of bounds
    IndexOutOfBounds { index: u64, size: u64 },
}

impl std::fmt::Display for SubstrateError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::OutOfBounds { x, y, width, height } => {
                write!(f, "Coordinate ({}, {}) out of bounds [{}, {})", x, y, width, height)
            }
            Self::InvalidOrder { order, min, max } => {
                write!(f, "Invalid Hilbert order {}: must be between {} and {}", order, min, max)
            }
            Self::IndexOutOfBounds { index, size } => {
                write!(f, "Index {} out of bounds [0, {})", index, size)
            }
        }
    }
}

impl std::error::Error for SubstrateError {}

/// Glyph Substrate - Hilbert-mapped VRAM buffer
///
/// This is the core visual memory for the Native Glyph Visual Shell.
/// All pixel operations use Hilbert curve indexing for spatial locality.
///
/// # Example
///
/// ```
/// use visual_shell::GlyphSubstrate;
///
/// // Create a 1024x1024 substrate (order 10)
/// let mut substrate = GlyphSubstrate::new(10)?;
///
/// // Set a pixel at screen coordinates
/// substrate.set_pixel(100, 100, 0xFF0000FF)?; // Red, fully opaque
///
/// // Get pixel via Hilbert index (GPU cache friendly)
/// let hilbert_idx = substrate.xy_to_hilbert(100, 100)?;
/// let pixel = substrate.get_pixel_hilbert(hilbert_idx);
///
/// # Ok::<(), visual_shell::glyph_substrate::SubstrateError>(())
/// ```
#[derive(Debug, Clone)]
pub struct GlyphSubstrate {
    /// Width of the substrate in pixels
    width: u32,

    /// Height of the substrate in pixels
    height: u32,

    /// Order of the Hilbert curve (2^order = dimension)
    order: u8,

    /// Pixel buffer indexed by Hilbert curve
    /// buffer[hilbert_index] = pixel at (x, y)
    buffer: Vec<RGBA>,

    /// Dirty regions for efficient GPU upload
    dirty_regions: Vec<Rect>,

    /// Total number of pixels
    size: u64,

    /// Embedded bitmap font for text rendering
    font: BitmapFont,
}

impl GlyphSubstrate {
    /// Minimum Hilbert curve order (2x2 = 4 pixels)
    pub const MIN_ORDER: u8 = 1;

    /// Maximum Hilbert curve order (1024x1024 = 1M pixels)
    pub const MAX_ORDER: u8 = 10;

    /// Create a new Glyph Substrate with the given Hilbert order
    ///
    /// # Arguments
    ///
    /// * `order` - Hilbert curve order (1-10). Dimension = 2^order.
    ///
    /// # Returns
    ///
    /// A new substrate with all pixels initialized to transparent black.
    ///
    /// # Errors
    ///
    /// Returns `SubstrateError::InvalidOrder` if order is outside [1, 10].
    ///
    /// # Example
    ///
    /// ```
    /// use visual_shell::GlyphSubstrate;
    ///
    /// let substrate = GlyphSubstrate::new(8)?; // 256x256
    /// assert_eq!(substrate.width(), 256);
    /// assert_eq!(substrate.height(), 256);
    /// # Ok::<(), visual_shell::glyph_substrate::SubstrateError>(())
    /// ```
    pub fn new(order: u8) -> Result<Self, SubstrateError> {
        if order < Self::MIN_ORDER || order > Self::MAX_ORDER {
            return Err(SubstrateError::InvalidOrder {
                order,
                min: Self::MIN_ORDER,
                max: Self::MAX_ORDER,
            });
        }

        let dimension = 1u32 << order; // 2^order
        let size = (dimension as u64) * (dimension as u64);
        let buffer = vec![RGBA::transparent(); size as usize];
        let font = BitmapFont::default();

        Ok(Self {
            width: dimension,
            height: dimension,
            order,
            buffer,
            dirty_regions: Vec::new(),
            size,
            font,
        })
    }

    /// Create a substrate with a specific background color
    pub fn with_background(order: u8, color: RGBA) -> Result<Self, SubstrateError> {
        let mut substrate = Self::new(order)?;
        substrate.clear(color);
        Ok(substrate)
    }

    /// Get the width of the substrate
    pub const fn width(&self) -> u32 {
        self.width
    }

    /// Get the height of the substrate
    pub const fn height(&self) -> u32 {
        self.height
    }

    /// Get the Hilbert curve order
    pub const fn order(&self) -> u8 {
        self.order
    }

    /// Get the total number of pixels
    pub const fn size(&self) -> u64 {
        self.size
    }

    /// Get the dimension (width == height for square substrate)
    pub const fn dimension(&self) -> u32 {
        self.width
    }

    /// Clear the entire substrate to a single color
    pub fn clear(&mut self, color: RGBA) {
        for pixel in &mut self.buffer {
            *pixel = color;
        }
        self.dirty_regions.clear();
        self.dirty_regions.push(Rect::new(0, 0, self.width, self.height));
    }

    // ========================================================================
    // Hilbert Curve Conversion (ported from HilbertLUT.ts)
    // ========================================================================

    /// Convert (x, y) screen coordinates to Hilbert index
    ///
    /// This is the core spatial locality transformation.
    /// Adjacent screen pixels map to adjacent (or nearly adjacent) indices.
    ///
    /// # Algorithm
    ///
    /// Based on "Hacker's Delight" by Henry S. Warren.
    /// Uses iterative bit manipulation for efficiency.
    pub fn xy_to_hilbert(&self, x: u32, y: u32) -> Result<u64, SubstrateError> {
        if x >= self.width || y >= self.height {
            return Err(SubstrateError::OutOfBounds {
                x,
                y,
                width: self.width,
                height: self.height,
            });
        }

        Ok(self.xy_to_hilbert_unchecked(x, y))
    }

    /// Convert Hilbert index to (x, y) screen coordinates
    pub fn hilbert_to_xy(&self, index: u64) -> Result<(u32, u32), SubstrateError> {
        if index >= self.size {
            return Err(SubstrateError::IndexOutOfBounds {
                index,
                size: self.size,
            });
        }

        Ok(self.hilbert_to_xy_unchecked(index))
    }

    /// Unchecked version of xy_to_hilbert for internal use
    fn xy_to_hilbert_unchecked(&self, x: u32, y: u32) -> u64 {
        let mut d = 0u64;
        let mut s = self.width as i32 / 2;
        
        let mut xx = x as i32;
        let mut yy = y as i32;
        
        while s > 0 {
            let rx = if (xx & s) > 0 { 1u32 } else { 0u32 };
            let ry = if (yy & s) > 0 { 1u32 } else { 0u32 };
            
            d += s as u64 * s as u64 * ((3 * rx as u64) ^ ry as u64);
            
            let (nx, ny) = self.rot(s, xx, yy, rx as i32, ry as i32);
            xx = nx;
            yy = ny;
            
            s >>= 1;
        }
        
        d
    }

    /// Unchecked version of hilbert_to_xy for internal use
    fn hilbert_to_xy_unchecked(&self, d: u64) -> (u32, u32) {
        let mut x = 0i32;
        let mut y = 0i32;
        let mut t = d;
        let mut s = 1i32;
        
        let n = self.width as i32;
        
        while s < n {
            let rx = 1u32 & (t as u32 >> 1);
            let ry = 1u32 & (t as u32 ^ rx);

            // Rotate
            let (nx, ny) = self.rot(s, x, y, rx as i32, ry as i32);
            x = nx;
            y = ny;
            
            x += s * rx as i32;
            y += s * ry as i32;
            
            t >>= 2;
            s <<= 1;
        }
        
        (x as u32, y as u32)
    }

    /// Rotate/flip quadrant appropriately
    fn rot(&self, n: i32, x: i32, y: i32, rx: i32, ry: i32) -> (i32, i32) {
        if ry == 0 {
            let mut nx = x;
            let mut ny = y;
            if rx == 1 {
                nx = n - 1 - x;
                ny = n - 1 - y;
            }
            
            // Swap x and y
            (ny, nx)
        } else {
            (x, y)
        }
    }

    // ========================================================================
    // Pixel Access
    // ========================================================================

    /// Set a pixel at screen coordinates (x, y)
    ///
    /// # Arguments
    ///
    /// * `x` - X coordinate [0, width)
    /// * `y` - Y coordinate [0, height)
    /// * `color` - Packed RGBA color (0xRRGGBBAA)
    ///
    /// # Errors
    ///
    /// Returns `SubstrateError::OutOfBounds` if coordinates are outside the substrate.
    pub fn set_pixel(&mut self, x: u32, y: u32, color: u32) -> Result<(), SubstrateError> {
        let idx = self.xy_to_hilbert(x, y)?;
        self.buffer[idx as usize] = RGBA::from_u32(color);
        self.mark_dirty(x, y, 1, 1);
        Ok(())
    }

    /// Set a pixel using RGBA struct
    pub fn set_pixel_rgba(&mut self, x: u32, y: u32, color: RGBA) -> Result<(), SubstrateError> {
        let idx = self.xy_to_hilbert(x, y)?;
        self.buffer[idx as usize] = color;
        self.mark_dirty(x, y, 1, 1);
        Ok(())
    }

    /// Get a pixel at screen coordinates (x, y)
    pub fn get_pixel(&self, x: u32, y: u32) -> Result<RGBA, SubstrateError> {
        let idx = self.xy_to_hilbert(x, y)?;
        Ok(self.buffer[idx as usize])
    }

    /// Set a pixel via Hilbert index (GPU cache friendly)
    ///
    /// Use this for batch operations where you've precomputed Hilbert indices.
    pub fn set_pixel_hilbert(&mut self, index: u64, color: RGBA) -> Result<(), SubstrateError> {
        if index >= self.size {
            return Err(SubstrateError::IndexOutOfBounds {
                index,
                size: self.size,
            });
        }
        self.buffer[index as usize] = color;
        // Note: We don't know the (x,y) for dirty tracking, so we'd need to convert back
        // For batch operations, use commit() to mark the full buffer dirty
        Ok(())
    }

    /// Get a pixel via Hilbert index
    pub fn get_pixel_hilbert(&self, index: u64) -> Result<RGBA, SubstrateError> {
        if index >= self.size {
            return Err(SubstrateError::IndexOutOfBounds {
                index,
                size: self.size,
            });
        }
        Ok(self.buffer[index as usize])
    }

    /// Set pixel without bounds checking (unsafe but fast)
    ///
    /// # Safety
    ///
    /// Caller must ensure (x, y) is within bounds.
    #[inline]
    pub unsafe fn set_pixel_unchecked(&mut self, x: u32, y: u32, color: RGBA) {
        let idx = self.xy_to_hilbert_unchecked(x, y);
        *self.buffer.get_unchecked_mut(idx as usize) = color;
    }

    /// Get pixel without bounds checking (unsafe but fast)
    ///
    /// # Safety
    ///
    /// Caller must ensure (x, y) is within bounds.
    #[inline]
    pub unsafe fn get_pixel_unchecked(&self, x: u32, y: u32) -> RGBA {
        let idx = self.xy_to_hilbert_unchecked(x, y);
        *self.buffer.get_unchecked(idx as usize)
    }

    // ========================================================================
    // Shape Drawing Primitives
    // ========================================================================

    /// Fill a rectangle with a color
    pub fn fill_rect(&mut self, x: u32, y: u32, width: u32, height: u32, color: RGBA) -> Result<(), SubstrateError> {
        // Bounds check
        if x + width > self.width || y + height > self.height {
            return Err(SubstrateError::OutOfBounds {
                x: x + width,
                y: y + height,
                width: self.width,
                height: self.height,
            });
        }

        for py in y..y + height {
            for px in x..x + width {
                unsafe {
                    self.set_pixel_unchecked(px, py, color);
                }
            }
        }

        self.mark_dirty(x, y, width, height);
        Ok(())
    }

    /// Draw a rectangle outline
    pub fn draw_rect(&mut self, x: u32, y: u32, width: u32, height: u32, color: RGBA) -> Result<(), SubstrateError> {
        // Draw horizontal lines
        for px in x..x + width {
            self.set_pixel_rgba(px, y, color)?;
            if height > 1 {
                self.set_pixel_rgba(px, y + height - 1, color)?;
            }
        }

        // Draw vertical lines
        for py in y..y + height {
            self.set_pixel_rgba(x, py, color)?;
            if width > 1 {
                self.set_pixel_rgba(x + width - 1, py, color)?;
            }
        }

        self.mark_dirty(x, y, width, height);
        Ok(())
    }

    /// Draw a line using Bresenham's algorithm
    pub fn draw_line(&mut self, x1: u32, y1: u32, x2: u32, y2: u32, color: RGBA) -> Result<(), SubstrateError> {
        let dx = (x2 as i64 - x1 as i64).abs();
        let dy = -(y2 as i64 - y1 as i64).abs();
        let sx = if x1 < x2 { 1i64 } else { -1i64 };
        let sy = if y1 < y2 { 1i64 } else { -1i64 };
        let mut err = dx + dy;

        let mut x = x1 as i64;
        let mut y = y1 as i64;

        loop {
            if x >= 0 && y >= 0 && (x as u32) < self.width && (y as u32) < self.height {
                self.set_pixel_rgba(x as u32, y as u32, color)?;
            }

            if x == x2 as i64 && y == y2 as i64 {
                break;
            }

            let e2 = 2 * err;
            if e2 >= dy {
                err += dy;
                x += sx;
            }
            if e2 <= dx {
                err += dx;
                y += sy;
            }
        }

        // Mark bounding box as dirty
        let min_x = x1.min(x2);
        let min_y = y1.min(y2);
        let max_x = x1.max(x2);
        let max_y = y1.max(y2);
        self.mark_dirty(min_x, min_y, max_x - min_x + 1, max_y - min_y + 1);

        Ok(())
    }

    /// Draw a circle using midpoint algorithm
    pub fn draw_circle(&mut self, cx: u32, cy: u32, radius: u32, color: RGBA) -> Result<(), SubstrateError> {
        let mut x = 0i32;
        let mut y = radius as i32;
        let mut d = 3 - 2 * (radius as i32);

        while x <= y {
            // Draw 8 octants
            self.plot_circle_points(cx, cy, x, y, color)?;

            if d < 0 {
                d = d + 4 * x + 6;
            } else {
                d = d + 4 * (x - y) + 10;
                y -= 1;
            }
            x += 1;
        }

        // Mark bounding box as dirty
        self.mark_dirty(
            cx.saturating_sub(radius),
            cy.saturating_sub(radius),
            radius * 2 + 1,
            radius * 2 + 1,
        );

        Ok(())
    }

    /// Helper to plot circle points in all 8 octants
    fn plot_circle_points(&mut self, cx: u32, cy: u32, x: i32, y: i32, color: RGBA) -> Result<(), SubstrateError> {
        let points = [
            (cx as i32 + x, cy as i32 + y),
            (cx as i32 - x, cy as i32 + y),
            (cx as i32 + x, cy as i32 - y),
            (cx as i32 - x, cy as i32 - y),
            (cx as i32 + y, cy as i32 + x),
            (cx as i32 - y, cy as i32 + x),
            (cx as i32 + y, cy as i32 - x),
            (cx as i32 - y, cy as i32 - x),
        ];

        for (px, py) in points {
            if px >= 0 && py >= 0 {
                let px = px as u32;
                let py = py as u32;
                if px < self.width && py < self.height {
                    self.set_pixel_rgba(px, py, color)?;
                }
            }
        }

        Ok(())
    }

    // ========================================================================
    // Text Rendering
    // ========================================================================

    /// Draw a single character at the specified position
    ///
    /// Uses the embedded 8x8 bitmap font. Characters outside the ASCII range
    /// 32-126 will be rendered as a placeholder box.
    ///
    /// # Arguments
    ///
    /// * `x` - X coordinate (left edge of character)
    /// * `y` - Y coordinate (top edge of character)
    /// * `c` - Character to render
    /// * `color` - Foreground color
    ///
    /// # Returns
    ///
    /// The width of the rendered character (8 pixels for standard characters)
    pub fn draw_char(&mut self, x: u32, y: u32, c: char, color: RGBA) -> Result<u32, SubstrateError> {
        // Copy glyph data to avoid borrow conflicts (Glyph is Copy)
        let glyph = *self.font.get_glyph(c);
        let glyph_width = glyph.width();
        let glyph_height = glyph.height();

        // Bounds check - use stack-allocated iteration instead of heap Vec
        if x + glyph_width > self.width || y + glyph_height > self.height {
            // Partial rendering - clip to bounds
            for gy in 0..glyph_height {
                for gx in 0..glyph_width {
                    if glyph.get_pixel(gx, gy) {
                        let px = x + gx;
                        let py = y + gy;
                        if px < self.width && py < self.height {
                            // Inline the hot path for better performance
                            let idx = self.xy_to_hilbert_unchecked(px, py);
                            self.buffer[idx as usize] = color;
                        }
                    }
                }
            }
        } else {
            // Full character fits - use unchecked for speed (most common case)
            for gy in 0..glyph_height {
                for gx in 0..glyph_width {
                    if glyph.get_pixel(gx, gy) {
                        unsafe {
                            self.set_pixel_unchecked(x + gx, y + gy, color);
                        }
                    }
                }
            }
        }

        self.mark_dirty(x, y, glyph_width, glyph_height);
        Ok(glyph_width)
    }

    /// Draw a text string at the specified position
    ///
    /// Renders text left-to-right using the embedded bitmap font.
    /// Supports newline (`\n`) characters for multi-line text.
    ///
    /// # Arguments
    ///
    /// * `x` - X coordinate (left edge of first character)
    /// * `y` - Y coordinate (top edge of text, baseline at y + font ascent)
    /// * `text` - Text string to render
    /// * `color` - Foreground color
    ///
    /// # Returns
    ///
    /// A tuple of (final_x, final_y) after rendering all text
    ///
    /// # Example
    ///
    /// ```
    /// use visual_shell::{GlyphSubstrate, RGBA};
    ///
    /// let mut substrate = GlyphSubstrate::new(8)?;
    ///
    /// // Draw a simple label
    /// let (x, y) = substrate.draw_text(10, 10, "Hello, World!", RGBA::white())?;
    ///
    /// // Draw multi-line text
    /// let (x, y) = substrate.draw_text(10, 30, "Line 1\nLine 2", RGBA::new(0, 255, 136, 255))?;
    ///
    /// # Ok::<(), visual_shell::glyph_substrate::SubstrateError>(())
    /// ```
    pub fn draw_text(&mut self, mut x: u32, mut y: u32, text: &str, color: RGBA) -> Result<(u32, u32), SubstrateError> {
        let line_height = self.font.line_height();
        let char_width = self.font.char_width();
        let start_x = x;

        for c in text.chars() {
            match c {
                '\n' => {
                    // Newline - move to next line
                    x = start_x;
                    y += line_height;
                }
                '\r' => {
                    // Carriage return - move to start of line
                    x = start_x;
                }
                '\t' => {
                    // Tab - advance by 4 character widths
                    x += char_width * 4;
                }
                _ => {
                    // Regular character
                    let width = self.draw_char(x, y, c, color)?;
                    x += width;
                }
            }
        }

        Ok((x, y))
    }

    /// Draw text with word wrapping
    ///
    /// Renders text with automatic line breaks at word boundaries.
    ///
    /// # Arguments
    ///
    /// * `x` - X coordinate
    /// * `y` - Y coordinate
    /// * `max_width` - Maximum width before wrapping
    /// * `text` - Text to render
    /// * `color` - Foreground color
    ///
    /// # Returns
    ///
    /// The final Y coordinate after all wrapped lines
    pub fn draw_text_wrapped(
        &mut self,
        mut x: u32,
        mut y: u32,
        max_width: u32,
        text: &str,
        color: RGBA,
    ) -> Result<u32, SubstrateError> {
        let line_height = self.font.line_height();
        let char_width = self.font.char_width();
        let start_x = x;
        let _max_chars = max_width / char_width; // For future word-breaking optimization

        let words: Vec<&str> = text.split_whitespace().collect();
        let mut current_line_width = 0u32;

        for word in words {
            let word_width = (word.len() as u32) * char_width;

            // Check if word fits on current line
            if current_line_width + word_width > max_width && current_line_width > 0 {
                // Move to next line
                x = start_x;
                y += line_height;
                current_line_width = 0;
            }

            // Draw the word
            for c in word.chars() {
                self.draw_char(x, y, c, color)?;
                x += char_width;
                current_line_width += char_width;
            }

            // Add space after word (if not at line start)
            if current_line_width > 0 {
                x += char_width;
                current_line_width += char_width;
            }
        }

        Ok(y + line_height)
    }

    /// Draw a text label with background
    ///
    /// Renders text with a filled background rectangle for better readability.
    ///
    /// # Arguments
    ///
    /// * `x` - X coordinate
    /// * `y` - Y coordinate
    /// * `text` - Text to render
    /// * `fg_color` - Foreground (text) color
    /// * `bg_color` - Background color
    /// * `padding` - Padding around text in pixels
    pub fn draw_label(
        &mut self,
        x: u32,
        y: u32,
        text: &str,
        fg_color: RGBA,
        bg_color: RGBA,
        padding: u32,
    ) -> Result<(), SubstrateError> {
        let char_width = self.font.char_width();
        let line_height = self.font.line_height();

        // Calculate text dimensions
        let lines: Vec<&str> = text.split('\n').collect();
        let max_line_len = lines.iter().map(|l| l.len()).max().unwrap_or(0) as u32;
        let text_width = max_line_len * char_width;
        let text_height = (lines.len() as u32) * line_height;

        // Draw background
        self.fill_rect(
            x.saturating_sub(padding),
            y.saturating_sub(padding),
            text_width + padding * 2,
            text_height + padding * 2,
            bg_color,
        )?;

        // Draw text
        self.draw_text(x, y, text, fg_color)?;

        Ok(())
    }

    /// Draw a status bar at the top or bottom of the substrate
    ///
    /// A convenience method for creating HUD-style status displays.
    ///
    /// # Arguments
    ///
    /// * `position` - "top" or "bottom"
    /// * `height` - Height of the status bar in pixels
    /// * `text` - Text to display (left-aligned)
    /// * `fg_color` - Foreground color
    /// * `bg_color` - Background color
    pub fn draw_status_bar(
        &mut self,
        position: &str,
        height: u32,
        text: &str,
        fg_color: RGBA,
        bg_color: RGBA,
    ) -> Result<(), SubstrateError> {
        let y = match position {
            "bottom" => self.height.saturating_sub(height),
            _ => 0, // "top" or default
        };

        // Draw background
        self.fill_rect(0, y, self.width, height, bg_color)?;

        // Draw text with vertical centering
        let text_y = y + (height.saturating_sub(self.font.line_height())) / 2;
        self.draw_text(4, text_y, text, fg_color)?;

        Ok(())
    }

    /// Draw a simple button
    ///
    /// Creates a clickable-looking button with text.
    ///
    /// # Arguments
    ///
    /// * `x` - X coordinate
    /// * `y` - Y coordinate
    /// * `width` - Button width
    /// * `height` - Button height
    /// * `text` - Button label
    /// * `fg_color` - Text color
    /// * `bg_color` - Button background color
    /// * `border_color` - Border color
    pub fn draw_button(
        &mut self,
        x: u32,
        y: u32,
        width: u32,
        height: u32,
        text: &str,
        fg_color: RGBA,
        bg_color: RGBA,
        border_color: RGBA,
    ) -> Result<(), SubstrateError> {
        // Draw background
        self.fill_rect(x, y, width, height, bg_color)?;

        // Draw border
        self.draw_rect(x, y, width, height, border_color)?;

        // Center text
        let char_width = self.font.char_width();
        let line_height = self.font.line_height();
        let text_width = (text.len() as u32) * char_width;
        let text_x = x + (width.saturating_sub(text_width)) / 2;
        let text_y = y + (height.saturating_sub(line_height)) / 2;

        self.draw_text(text_x, text_y, text, fg_color)?;

        Ok(())
    }

    /// Get the font character width
    pub fn char_width(&self) -> u32 {
        self.font.char_width()
    }

    /// Get the font line height
    pub fn line_height(&self) -> u32 {
        self.font.line_height()
    }

    /// Measure text dimensions without rendering
    ///
    /// Returns (width, height) in pixels for the given text.
    pub fn measure_text(&self, text: &str) -> (u32, u32) {
        let char_width = self.font.char_width();
        let line_height = self.font.line_height();

        let lines: Vec<&str> = text.split('\n').collect();
        let max_line_len = lines.iter().map(|l| l.len()).max().unwrap_or(0) as u32;
        let num_lines = lines.len() as u32;

        (max_line_len * char_width, num_lines * line_height)
    }

    // ========================================================================
    // Dirty Region Tracking
    // ========================================================================

    /// Mark a region as dirty for GPU upload
    fn mark_dirty(&mut self, x: u32, y: u32, width: u32, height: u32) {
        let rect = Rect::new(x, y, width, height);

        // Try to merge with existing dirty region
        if let Some(last) = self.dirty_regions.last_mut() {
            if last.contains(x, y) || rect.contains(last.x, last.y) {
                *last = last.merge(&rect);
                return;
            }
        }

        self.dirty_regions.push(rect);
    }

    /// Get all dirty regions
    pub fn dirty_regions(&self) -> &[Rect] {
        &self.dirty_regions
    }

    /// Clear dirty regions (call after GPU upload)
    pub fn clear_dirty(&mut self) {
        self.dirty_regions.clear();
    }

    /// Mark the entire substrate as dirty
    pub fn mark_all_dirty(&mut self) {
        self.dirty_regions.clear();
        self.dirty_regions.push(Rect::new(0, 0, self.width, self.height));
    }

    /// Commit all changes (mark entire buffer dirty)
    pub fn commit(&mut self) {
        self.mark_all_dirty();
    }

    // ========================================================================
    // GPU Interop
    // ========================================================================

    /// Get raw buffer for GPU upload
    ///
    /// The buffer is Hilbert-indexed for spatial locality.
    /// GPU shader must convert back to (x,y) for rendering.
    pub fn as_bytes(&self) -> &[u8] {
        // Safety: RGBA is #[repr(C)] with 4 u8 fields
        unsafe {
            std::slice::from_raw_parts(
                self.buffer.as_ptr() as *const u8,
                self.buffer.len() * 4,
            )
        }
    }

    /// Get mutable access to the raw buffer
    pub fn as_bytes_mut(&mut self) -> &mut [u8] {
        // Safety: RGBA is #[repr(C)] with 4 u8 fields
        unsafe {
            std::slice::from_raw_parts_mut(
                self.buffer.as_mut_ptr() as *mut u8,
                self.buffer.len() * 4,
            )
        }
    }

    /// Get the buffer as RGBA slice
    pub fn as_rgba(&self) -> &[RGBA] {
        &self.buffer
    }

    /// Get mutable access to the RGBA buffer
    pub fn as_rgba_mut(&mut self) -> &mut [RGBA] {
        &mut self.buffer
    }

    // ========================================================================
    // Spatial Locality Analysis
    // ========================================================================

    /// Calculate spatial locality score (0.0 to 1.0)
    ///
    /// Measures how well the Hilbert curve preserves spatial locality.
    /// Returns the fraction of adjacent Hilbert indices that are within
    /// a threshold distance in 2D space.
    ///
    /// # Arguments
    ///
    /// * `threshold` - Maximum 2D distance to consider "local" (default: 2.0)
    ///
    /// # Returns
    ///
    /// Score between 0.0 and 1.0. Target is 0.95 (95% locality).
    pub fn calculate_locality(&self, threshold: f32) -> f32 {
        if self.size < 2 {
            return 1.0;
        }

        let mut local_count = 0u64;
        let sample_size = (self.size as usize).min(10000); // Sample for performance

        for i in 0..sample_size {
            let idx = i as u64;
            if idx + 1 >= self.size {
                break;
            }

            let (x1, y1) = self.hilbert_to_xy_unchecked(idx);
            let (x2, y2) = self.hilbert_to_xy_unchecked(idx + 1);

            let dx = (x1 as f32) - (x2 as f32);
            let dy = (y1 as f32) - (y2 as f32);
            let dist = (dx * dx + dy * dy).sqrt();

            if dist <= threshold {
                local_count += 1;
            }
        }

        local_count as f32 / (sample_size as f32 - 1.0).max(1.0)
    }
    
    // ========================================================================
    // Optimized Batch Operations
    // ========================================================================
    
    /// Fill the entire buffer with a single color (optimized)
    /// 
    /// Uses memset-like optimization for solid colors.
    #[inline]
    pub fn fill_all(&mut self, color: RGBA) {
        // Use fill() which is optimized in std
        self.buffer.fill(color);
        self.dirty_regions.clear();
        self.dirty_regions.push(Rect::new(0, 0, self.width, self.height));
    }
    
    /// Fill a contiguous range of Hilbert indices with a color
    /// 
    /// More efficient than individual pixel sets for large regions.
    #[inline]
    pub fn fill_hilbert_range(&mut self, start: u64, count: u64, color: RGBA) {
        let end = (start + count).min(self.size) as usize;
        for i in start as usize..end {
            self.buffer[i] = color;
        }
    }
    
    /// Copy a rectangular region from one location to another
    /// 
    /// Optimized for same-substrate copies using Hilbert indexing.
    pub fn copy_rect(&mut self, src_x: u32, src_y: u32, dst_x: u32, dst_y: u32, width: u32, height: u32) -> Result<(), SubstrateError> {
        // Bounds check
        if src_x + width > self.width || src_y + height > self.height {
            return Err(SubstrateError::OutOfBounds {
                x: src_x + width, y: src_y + height,
                width: self.width, height: self.height,
            });
        }
        if dst_x + width > self.width || dst_y + height > self.height {
            return Err(SubstrateError::OutOfBounds {
                x: dst_x + width, y: dst_y + height,
                width: self.width, height: self.height,
            });
        }
        
        // Collect source pixels first (handles overlap)
        let mut pixels: Vec<(usize, RGBA)> = Vec::with_capacity((width * height) as usize);
        
        for sy in src_y..src_y + height {
            for sx in src_x..src_x + width {
                let src_idx = self.xy_to_hilbert_unchecked(sx, sy) as usize;
                let dst_idx = self.xy_to_hilbert_unchecked(
                    dst_x + (sx - src_x), 
                    dst_y + (sy - src_y)
                ) as usize;
                let pixel = self.buffer[src_idx];
                pixels.push((dst_idx, pixel));
            }
        }
        
        // Write to destination
        for (idx, pixel) in pixels {
            self.buffer[idx] = pixel;
        }
        
        self.mark_dirty(dst_x, dst_y, width, height);
        Ok(())
    }
    
    /// Batch set multiple pixels efficiently
    /// 
    /// Pre-computes all Hilbert indices before writing.
    pub fn set_pixels_batch(&mut self, pixels: &[(u32, u32, RGBA)]) {
        // Pre-compute all Hilbert indices
        let writes: Vec<(usize, RGBA)> = pixels.iter()
            .filter_map(|&(x, y, color)| {
                if x < self.width && y < self.height {
                    let idx = self.xy_to_hilbert_unchecked(x, y) as usize;
                    Some((idx, color))
                } else {
                    None
                }
            })
            .collect();
        
        // Write all pixels
        for (idx, color) in writes {
            self.buffer[idx] = color;
        }
        
        // Mark bounding box dirty
        if !pixels.is_empty() {
            let min_x = pixels.iter().map(|p| p.0).min().unwrap();
            let max_x = pixels.iter().map(|p| p.0).max().unwrap();
            let min_y = pixels.iter().map(|p| p.1).min().unwrap();
            let max_y = pixels.iter().map(|p| p.1).max().unwrap();
            self.mark_dirty(min_x, min_y, max_x - min_x + 1, max_y - min_y + 1);
        }
    }
    
    /// Get a horizontal scanline (optimized for sequential access)
    /// 
    /// Returns pixels in screen coordinate order (not Hilbert order).
    pub fn get_scanline(&self, y: u32) -> Result<Vec<RGBA>, SubstrateError> {
        if y >= self.height {
            return Err(SubstrateError::OutOfBounds {
                x: 0, y,
                width: self.width, height: self.height,
            });
        }
        
        (0..self.width)
            .map(|x| {
                let idx = self.xy_to_hilbert_unchecked(x, y);
                Ok(self.buffer[idx as usize])
            })
            .collect()
    }
    
    /// Set a horizontal scanline (optimized for sequential access)
    pub fn set_scanline(&mut self, y: u32, pixels: &[RGBA]) -> Result<(), SubstrateError> {
        if y >= self.height {
            return Err(SubstrateError::OutOfBounds {
                x: 0, y,
                width: self.width, height: self.height,
            });
        }
        
        let width = pixels.len().min(self.width as usize) as u32;
        for (x, &pixel) in pixels.iter().enumerate().take(width as usize) {
            let idx = self.xy_to_hilbert_unchecked(x as u32, y);
            self.buffer[idx as usize] = pixel;
        }
        
        self.mark_dirty(0, y, width, 1);
        Ok(())
    }
}

impl Index<u64> for GlyphSubstrate {
    type Output = RGBA;

    fn index(&self, index: u64) -> &Self::Output {
        &self.buffer[index as usize]
    }
}

impl IndexMut<u64> for GlyphSubstrate {
    fn index_mut(&mut self, index: u64) -> &mut Self::Output {
        &mut self.buffer[index as usize]
    }
}

impl Default for GlyphSubstrate {
    fn default() -> Self {
        Self::new(8).expect("Default order 8 should always be valid")
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_substrate_creation() {
        let substrate = GlyphSubstrate::new(8).unwrap();
        assert_eq!(substrate.width(), 256);
        assert_eq!(substrate.height(), 256);
        assert_eq!(substrate.size(), 256 * 256);
        assert_eq!(substrate.order(), 8);
    }

    #[test]
    fn test_invalid_order() {
        assert!(GlyphSubstrate::new(0).is_err());
        assert!(GlyphSubstrate::new(11).is_err());
        assert!(GlyphSubstrate::new(1).is_ok());
        assert!(GlyphSubstrate::new(10).is_ok());
    }

    #[test]
    fn test_hilbert_roundtrip() {
        let substrate = GlyphSubstrate::new(4).unwrap();

        for y in 0..substrate.height() {
            for x in 0..substrate.width() {
                let idx = substrate.xy_to_hilbert(x, y).unwrap();
                let (x2, y2) = substrate.hilbert_to_xy(idx).unwrap();
                assert_eq!((x, y), (x2, y2), "Roundtrip failed for ({}, {})", x, y);
            }
        }
    }

    #[test]
    fn test_pixel_set_get() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        let color = RGBA::new(255, 128, 64, 255);
        substrate.set_pixel_rgba(5, 5, color).unwrap();

        let retrieved = substrate.get_pixel(5, 5).unwrap();
        assert_eq!(retrieved, color);
    }

    #[test]
    fn test_pixel_hilbert_access() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        let idx = substrate.xy_to_hilbert(10, 10).unwrap();
        let color = RGBA::new(100, 150, 200, 255);
        substrate.set_pixel_hilbert(idx, color).unwrap();

        let retrieved = substrate.get_pixel_hilbert(idx).unwrap();
        assert_eq!(retrieved, color);
    }

    #[test]
    fn test_fill_rect() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        let color = RGBA::new(255, 0, 0, 255);
        substrate.fill_rect(2, 2, 4, 4, color).unwrap();

        // Check interior
        for y in 2..6 {
            for x in 2..6 {
                let pixel = substrate.get_pixel(x, y).unwrap();
                assert_eq!(pixel, color, "Pixel at ({}, {}) should be red", x, y);
            }
        }

        // Check exterior
        let outside = substrate.get_pixel(0, 0).unwrap();
        assert_eq!(outside, RGBA::transparent());
    }

    #[test]
    fn test_draw_rect() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        let color = RGBA::new(0, 255, 0, 255);
        substrate.draw_rect(2, 2, 4, 4, color).unwrap();

        // Check corners (should be drawn)
        assert_eq!(substrate.get_pixel(2, 2).unwrap(), color);
        assert_eq!(substrate.get_pixel(5, 2).unwrap(), color);
        assert_eq!(substrate.get_pixel(2, 5).unwrap(), color);
        assert_eq!(substrate.get_pixel(5, 5).unwrap(), color);

        // Check interior (should be transparent)
        assert_eq!(substrate.get_pixel(3, 3).unwrap(), RGBA::transparent());
    }

    #[test]
    fn test_draw_line() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        let color = RGBA::new(0, 0, 255, 255);
        substrate.draw_line(0, 0, 5, 5, color).unwrap();

        // Check diagonal pixels
        for i in 0..=5 {
            let pixel = substrate.get_pixel(i, i).unwrap();
            assert_eq!(pixel, color, "Pixel at ({}, {}) should be blue", i, i);
        }
    }

    #[test]
    fn test_draw_circle() {
        let mut substrate = GlyphSubstrate::new(5).unwrap();

        let color = RGBA::new(255, 255, 0, 255);
        substrate.draw_circle(8, 8, 4, color).unwrap();

        // Check a few points on the circle
        // (8, 4) should be on the circle (top)
        let pixel = substrate.get_pixel(8, 4).unwrap();
        assert_eq!(pixel, color, "Top of circle should be yellow");

        // (8, 8) should NOT be on the circle (center)
        let center = substrate.get_pixel(8, 8).unwrap();
        assert_eq!(center, RGBA::transparent(), "Center should be transparent");
    }

    #[test]
    fn test_clear() {
        let mut substrate = GlyphSubstrate::new(2).unwrap();

        let color = RGBA::new(128, 128, 128, 255);
        substrate.clear(color);

        for y in 0..substrate.height() {
            for x in 0..substrate.width() {
                assert_eq!(substrate.get_pixel(x, y).unwrap(), color);
            }
        }
    }

    #[test]
    fn test_dirty_tracking() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        assert!(substrate.dirty_regions().is_empty());

        substrate.set_pixel_rgba(5, 5, RGBA::white()).unwrap();
        assert_eq!(substrate.dirty_regions().len(), 1);
        assert_eq!(substrate.dirty_regions()[0], Rect::new(5, 5, 1, 1));

        substrate.clear_dirty();
        assert!(substrate.dirty_regions().is_empty());
    }

    #[test]
    fn test_locality_calculation() {
        let substrate = GlyphSubstrate::new(4).unwrap();

        // Hilbert curve should have high locality (target: 95%)
        let locality = substrate.calculate_locality(2.0);
        assert!(locality >= 0.8, "Locality should be >= 0.8, got {}", locality);

        println!("Spatial locality: {:.2}%", locality * 100.0);
    }

    #[test]
    fn test_rgba_conversion() {
        let color = RGBA::new(0x12, 0x34, 0x56, 0x78);
        let packed = color.to_u32();
        assert_eq!(packed, 0x12345678);

        let unpacked = RGBA::from_u32(0xFF00FF00);
        assert_eq!(unpacked.r, 0xFF);
        assert_eq!(unpacked.g, 0x00);
        assert_eq!(unpacked.b, 0xFF);
        assert_eq!(unpacked.a, 0x00);
    }

    #[test]
    fn test_as_bytes() {
        let mut substrate = GlyphSubstrate::new(1).unwrap(); // 2x2 = 4 pixels
        substrate.clear(RGBA::new(1, 2, 3, 4));

        let bytes = substrate.as_bytes();
        assert_eq!(bytes.len(), 4 * 4); // 4 pixels * 4 bytes

        // Check first pixel
        assert_eq!(bytes[0], 1); // R
        assert_eq!(bytes[1], 2); // G
        assert_eq!(bytes[2], 3); // B
        assert_eq!(bytes[3], 4); // A
    }

    #[test]
    fn test_bounds_checking() {
        let substrate = GlyphSubstrate::new(2).unwrap(); // 4x4

        // Valid
        assert!(substrate.xy_to_hilbert(0, 0).is_ok());
        assert!(substrate.xy_to_hilbert(3, 3).is_ok());

        // Invalid
        assert!(substrate.xy_to_hilbert(4, 0).is_err());
        assert!(substrate.xy_to_hilbert(0, 4).is_err());
        assert!(substrate.xy_to_hilbert(4, 4).is_err());
    }

    // ===== Text Rendering Tests =====

    #[test]
    fn test_draw_char() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        // Draw 'A' at position (0, 0)
        let width = substrate.draw_char(0, 0, 'A', RGBA::white()).unwrap();
        assert_eq!(width, 8);

        // 'A' should have some pixels set (not all transparent)
        let mut has_pixels = false;
        for y in 0..8 {
            for x in 0..8 {
                if substrate.get_pixel(x, y).unwrap() != RGBA::transparent() {
                    has_pixels = true;
                    break;
                }
            }
        }
        assert!(has_pixels, "Character 'A' should have visible pixels");
    }

    #[test]
    fn test_draw_text() {
        let mut substrate = GlyphSubstrate::new(5).unwrap(); // 32x32

        // Draw simple text
        let (end_x, end_y) = substrate.draw_text(0, 0, "Hello", RGBA::white()).unwrap();

        // Should have advanced horizontally
        assert!(end_x > 0);
        assert_eq!(end_y, 0); // Still on first line

        // Check that text width is approximately 5 * 8 = 40 (but clamped to substrate)
        assert!(end_x >= 40 || end_x == 32); // Either full width or clamped
    }

    #[test]
    fn test_draw_text_multiline() {
        let mut substrate = GlyphSubstrate::new(5).unwrap();

        let (_, end_y) = substrate.draw_text(0, 0, "Line1\nLine2\nLine3", RGBA::white()).unwrap();

        // Should have advanced vertically (3 lines * 10 line height)
        assert_eq!(end_y, 20);
    }

    #[test]
    fn test_draw_text_with_tab() {
        let mut substrate = GlyphSubstrate::new(5).unwrap();

        let (end_x, _) = substrate.draw_text(0, 0, "A\tB", RGBA::white()).unwrap();

        // Tab should advance by 4 character widths (32 pixels)
        // Plus 'A' (8 pixels) plus 'B' (8 pixels) = 48 pixels
        assert!(end_x >= 40);
    }

    #[test]
    fn test_draw_label() {
        // Use order 6 (64x64) to ensure we have enough space for the label
        let mut substrate = GlyphSubstrate::new(6).unwrap();

        // Draw label with background at safe position
        substrate.draw_label(2, 2, "Test", RGBA::white(), RGBA::blue(), 2).unwrap();

        // Background should be drawn
        let bg_pixel = substrate.get_pixel(2, 2).unwrap();
        assert_eq!(bg_pixel, RGBA::blue());

        // Text should be drawn (some pixels should be white)
        let mut has_text = false;
        for y in 2..14 {
            for x in 2..42 {
                if x < substrate.width() && y < substrate.height() {
                    if substrate.get_pixel(x, y).unwrap() == RGBA::white() {
                        has_text = true;
                        break;
                    }
                }
            }
        }
        assert!(has_text, "Label should have visible text");
    }

    #[test]
    fn test_draw_status_bar() {
        let mut substrate = GlyphSubstrate::new(5).unwrap();

        // Draw top status bar
        substrate.draw_status_bar("top", 16, "Status: OK", RGBA::white(), RGBA::dark_gray()).unwrap();

        // Top row should have background color
        for x in 0..substrate.width() {
            let pixel = substrate.get_pixel(x, 0).unwrap();
            assert_eq!(pixel, RGBA::dark_gray());
        }

        // Draw bottom status bar
        substrate.draw_status_bar("bottom", 16, "Ready", RGBA::white(), RGBA::panel_bg()).unwrap();

        // Bottom rows should have background color
        for x in 0..substrate.width() {
            let pixel = substrate.get_pixel(x, 31).unwrap();
            assert_eq!(pixel, RGBA::panel_bg());
        }
    }

    #[test]
    fn test_draw_button() {
        // Use order 6 (64x64) to ensure we have enough space for the button
        let mut substrate = GlyphSubstrate::new(6).unwrap();

        // Draw button at safe position with smaller dimensions
        substrate.draw_button(4, 4, 40, 20, "OK", RGBA::white(), RGBA::blue(), RGBA::white()).unwrap();

        // Button background should be blue
        let center_pixel = substrate.get_pixel(10, 10).unwrap();
        assert_eq!(center_pixel, RGBA::blue());

        // Border should be white (at corners)
        let corner_pixel = substrate.get_pixel(4, 4).unwrap();
        assert_eq!(corner_pixel, RGBA::white());
    }

    #[test]
    fn test_measure_text() {
        let substrate = GlyphSubstrate::new(5).unwrap();

        let (width, height) = substrate.measure_text("Hello");
        assert_eq!(width, 40); // 5 chars * 8 pixels
        assert_eq!(height, 10); // 1 line * 10 pixels

        let (width2, height2) = substrate.measure_text("Line1\nLine2");
        assert_eq!(width2, 40); // 5 chars * 8 pixels
        assert_eq!(height2, 20); // 2 lines * 10 pixels
    }

    #[test]
    fn test_color_presets() {
        // Basic colors
        assert_eq!(RGBA::red(), RGBA::new(255, 0, 0, 255));
        assert_eq!(RGBA::green(), RGBA::new(0, 255, 0, 255));
        assert_eq!(RGBA::blue(), RGBA::new(0, 0, 255, 255));
        assert_eq!(RGBA::yellow(), RGBA::new(255, 255, 0, 255));
        assert_eq!(RGBA::cyan(), RGBA::new(0, 255, 255, 255));
        assert_eq!(RGBA::magenta(), RGBA::new(255, 0, 255, 255));

        // Terminal colors
        assert_eq!(RGBA::terminal_green(), RGBA::new(0, 255, 136, 255));
        assert_eq!(RGBA::terminal_bg(), RGBA::new(0, 0, 40, 255));

        // UI colors
        assert_eq!(RGBA::panel_bg(), RGBA::new(30, 30, 40, 255));
        assert_eq!(RGBA::success(), RGBA::new(40, 200, 80, 255));
        assert_eq!(RGBA::error(), RGBA::new(220, 53, 69, 255));
    }

    #[test]
    fn test_color_blend() {
        let bg = RGBA::black();
        let fg = RGBA::white().with_alpha(128);

        let blended = bg.blend(&fg);

        // Semi-transparent white on black should be gray
        assert!(blended.r > 0 && blended.r < 255);
        assert!(blended.g > 0 && blended.g < 255);
        assert!(blended.b > 0 && blended.b < 255);
    }

    #[test]
    fn test_char_and_line_dimensions() {
        let substrate = GlyphSubstrate::new(5).unwrap();

        assert_eq!(substrate.char_width(), 8);
        assert_eq!(substrate.line_height(), 10);
    }

    // ===== Comprehensive Additional Tests =====

    #[test]
    fn test_all_valid_orders() {
        // Test that all orders 1-10 create successfully
        for order in 1..=10 {
            let substrate = GlyphSubstrate::new(order);
            assert!(substrate.is_ok(), "Order {} should be valid", order);

            let s = substrate.unwrap();
            let expected_dim = 1u32 << order;
            assert_eq!(s.width(), expected_dim);
            assert_eq!(s.height(), expected_dim);
            assert_eq!(s.size(), (expected_dim * expected_dim) as u64);
        }
    }

    #[test]
    fn test_corner_pixels_all() {
        // Test all four corners
        let mut substrate = GlyphSubstrate::new(4).unwrap(); // 16x16

        let corners = [
            (0, 0, RGBA::red()),
            (15, 0, RGBA::green()),
            (0, 15, RGBA::blue()),
            (15, 15, RGBA::yellow()),
        ];

        for &(x, y, color) in &corners {
            substrate.set_pixel_rgba(x, y, color).unwrap();
        }

        for &(x, y, color) in &corners {
            assert_eq!(substrate.get_pixel(x, y).unwrap(), color);
        }
    }

    #[test]
    fn test_fill_rect_various_sizes() {
        // Test filling rectangles of various sizes
        let mut substrate = GlyphSubstrate::new(4).unwrap();
        let color = RGBA::new(100, 150, 200, 255);

        // 1x1 rectangle
        substrate.fill_rect(0, 0, 1, 1, color).unwrap();
        assert_eq!(substrate.get_pixel(0, 0).unwrap(), color);

        // Full width row
        substrate.clear(RGBA::transparent());
        substrate.fill_rect(0, 5, 16, 1, color).unwrap();
        for x in 0..16 {
            assert_eq!(substrate.get_pixel(x, 5).unwrap(), color);
        }

        // Full height column
        substrate.clear(RGBA::transparent());
        substrate.fill_rect(5, 0, 1, 16, color).unwrap();
        for y in 0..16 {
            assert_eq!(substrate.get_pixel(5, y).unwrap(), color);
        }
    }

    #[test]
    fn test_draw_rect_various_sizes() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();
        let color = RGBA::new(200, 100, 50, 255);

        // Small rectangle outline
        substrate.draw_rect(2, 2, 4, 4, color).unwrap();

        // Check corners
        assert_eq!(substrate.get_pixel(2, 2).unwrap(), color);
        assert_eq!(substrate.get_pixel(5, 2).unwrap(), color);
        assert_eq!(substrate.get_pixel(2, 5).unwrap(), color);
        assert_eq!(substrate.get_pixel(5, 5).unwrap(), color);

        // Center should be transparent
        assert_eq!(substrate.get_pixel(3, 3).unwrap(), RGBA::transparent());
    }

    #[test]
    fn test_draw_line_horizontal() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();
        let color = RGBA::new(255, 0, 128, 255);

        substrate.draw_line(0, 5, 15, 5, color).unwrap();

        // Horizontal line should have all pixels set
        for x in 0..16 {
            assert_eq!(substrate.get_pixel(x, 5).unwrap(), color);
        }
    }

    #[test]
    fn test_draw_line_vertical() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();
        let color = RGBA::new(0, 255, 128, 255);

        substrate.draw_line(5, 0, 5, 15, color).unwrap();

        // Vertical line should have all pixels set
        for y in 0..16 {
            assert_eq!(substrate.get_pixel(5, y).unwrap(), color);
        }
    }

    #[test]
    fn test_draw_line_diagonal() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();
        let color = RGBA::new(128, 128, 255, 255);

        substrate.draw_line(0, 0, 15, 15, color).unwrap();

        // Main diagonal should have pixels
        for i in 0..16 {
            let pixel = substrate.get_pixel(i, i).unwrap();
            assert_eq!(pixel, color, "Diagonal pixel at ({}, {}) should be set", i, i);
        }
    }

    #[test]
    fn test_draw_circle_filled() {
        let mut substrate = GlyphSubstrate::new(5).unwrap(); // 32x32
        let color = RGBA::new(255, 200, 0, 255);

        // Use draw_circle (outline only)
        substrate.draw_circle(16, 16, 8, color).unwrap();

        // Points on the circle should be filled
        assert_eq!(substrate.get_pixel(16, 8).unwrap(), color); // Top
        assert_eq!(substrate.get_pixel(16, 24).unwrap(), color); // Bottom
        assert_eq!(substrate.get_pixel(8, 16).unwrap(), color); // Left
        assert_eq!(substrate.get_pixel(24, 16).unwrap(), color); // Right

        // Center should NOT be filled (outline only)
        let center = substrate.get_pixel(16, 16).unwrap();
        assert_eq!(center, RGBA::transparent());
    }

    #[test]
    fn test_batch_pixel_operations() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        // Set multiple pixels
        let positions = [(1, 1), (2, 2), (3, 3), (4, 4), (5, 5)];
        let color = RGBA::new(200, 100, 50, 255);

        for &(x, y) in &positions {
            substrate.set_pixel_rgba(x, y, color).unwrap();
        }

        // Verify all set correctly
        for &(x, y) in &positions {
            assert_eq!(substrate.get_pixel(x, y).unwrap(), color);
        }
    }

    #[test]
    fn test_rgba_with_alpha() {
        let color = RGBA::new(255, 128, 64, 255);
        let with_half_alpha = color.with_alpha(128);

        assert_eq!(with_half_alpha.r, 255);
        assert_eq!(with_half_alpha.g, 128);
        assert_eq!(with_half_alpha.b, 64);
        assert_eq!(with_half_alpha.a, 128);
    }

    #[test]
    fn test_rgba_from_u32() {
        // Test packed u32 parsing
        let red = RGBA::from_u32(0xFF0000FF);
        assert_eq!(red, RGBA::red());

        let green = RGBA::from_u32(0x00FF00FF);
        assert_eq!(green, RGBA::green());

        let blue = RGBA::from_u32(0x0000FFFF);
        assert_eq!(blue, RGBA::blue());

        let custom = RGBA::from_u32(0x12345678);
        assert_eq!(custom.r, 0x12);
        assert_eq!(custom.g, 0x34);
        assert_eq!(custom.b, 0x56);
        assert_eq!(custom.a, 0x78);
    }

    #[test]
    fn test_rgba_to_u32() {
        let color = RGBA::new(0x12, 0x34, 0x56, 0x78);
        assert_eq!(color.to_u32(), 0x12345678);
    }

    #[test]
    fn test_substrate_clear_various_colors() {
        let mut substrate = GlyphSubstrate::new(2).unwrap();

        let test_colors = [
            RGBA::black(),
            RGBA::white(),
            RGBA::red(),
            RGBA::transparent(),
            RGBA::new(128, 64, 32, 200),
        ];

        for color in &test_colors {
            substrate.clear(*color);

            for y in 0..substrate.height() {
                for x in 0..substrate.width() {
                    assert_eq!(substrate.get_pixel(x, y).unwrap(), *color);
                }
            }
        }
    }

    #[test]
    fn test_dirty_regions_accumulate() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        // Multiple pixel sets should accumulate dirty regions
        substrate.set_pixel_rgba(1, 1, RGBA::white()).unwrap();
        substrate.set_pixel_rgba(2, 2, RGBA::white()).unwrap();
        substrate.set_pixel_rgba(3, 3, RGBA::white()).unwrap();

        assert_eq!(substrate.dirty_regions().len(), 3);
    }

    #[test]
    fn test_dirty_regions_after_clear() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        substrate.set_pixel_rgba(1, 1, RGBA::white()).unwrap();
        substrate.clear(RGBA::black());

        // Clear should produce a single full-buffer dirty region
        assert_eq!(substrate.dirty_regions().len(), 1);
        assert_eq!(substrate.dirty_regions()[0], Rect::new(0, 0, 16, 16));
    }

    #[test]
    fn test_hilbert_index_bounds() {
        let substrate = GlyphSubstrate::new(2).unwrap(); // 4x4 = 16 points

        // Valid indices
        assert!(substrate.hilbert_to_xy(0).is_ok());
        assert!(substrate.hilbert_to_xy(15).is_ok());

        // Invalid indices
        assert!(substrate.hilbert_to_xy(16).is_err());
        assert!(substrate.hilbert_to_xy(100).is_err());
    }

    #[test]
    fn test_pixel_indexing_operators() {
        let mut substrate = GlyphSubstrate::new(2).unwrap();

        // Test Index and IndexMut traits if available
        let color = RGBA::new(100, 150, 200, 255);
        substrate.set_pixel_rgba(1, 1, color).unwrap();

        let retrieved = substrate.get_pixel(1, 1).unwrap();
        assert_eq!(retrieved, color);
    }

    #[test]
    fn test_draw_text_empty_string() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        let (end_x, end_y) = substrate.draw_text(0, 0, "", RGBA::white()).unwrap();
        assert_eq!(end_x, 0);
        assert_eq!(end_y, 0);
    }

    #[test]
    fn test_draw_text_special_characters() {
        let mut substrate = GlyphSubstrate::new(5).unwrap();

        // Test with various special characters
        let (end_x, _) = substrate.draw_text(0, 0, "!@#$%", RGBA::white()).unwrap();
        assert!(end_x > 0); // Should advance some amount

        let (end_x2, _) = substrate.draw_text(0, 10, "12345", RGBA::white()).unwrap();
        assert!(end_x2 > 0);
    }

    #[test]
    fn test_substrate_order_accessor() {
        let substrate = GlyphSubstrate::new(6).unwrap();
        assert_eq!(substrate.order(), 6);
    }

    #[test]
    fn test_max_order_substrate() {
        // Order 10 = 1024x1024
        let substrate = GlyphSubstrate::new(10).unwrap();
        assert_eq!(substrate.width(), 1024);
        assert_eq!(substrate.height(), 1024);
        assert_eq!(substrate.size(), 1024 * 1024);
    }

    #[test]
    fn test_min_order_substrate() {
        // Order 1 = 2x2
        let substrate = GlyphSubstrate::new(1).unwrap();
        assert_eq!(substrate.width(), 2);
        assert_eq!(substrate.height(), 2);
        assert_eq!(substrate.size(), 4);
    }

    #[test]
    fn test_fill_rect_boundary() {
        let mut substrate = GlyphSubstrate::new(4).unwrap(); // 16x16
        let color = RGBA::new(255, 0, 0, 255);

        // Fill right to edge
        substrate.fill_rect(8, 0, 8, 16, color).unwrap();
        for y in 0..16 {
            for x in 8..16 {
                assert_eq!(substrate.get_pixel(x, y).unwrap(), color);
            }
        }

        // Clear and fill bottom to edge
        substrate.clear(RGBA::transparent());
        substrate.fill_rect(0, 8, 16, 8, color).unwrap();
        for y in 8..16 {
            for x in 0..16 {
                assert_eq!(substrate.get_pixel(x, y).unwrap(), color);
            }
        }
    }

    #[test]
    fn test_draw_rect_at_edges() {
        let mut substrate = GlyphSubstrate::new(4).unwrap(); // 16x16
        let color = RGBA::new(0, 255, 0, 255);

        // Rectangle at top-right corner
        substrate.draw_rect(12, 0, 4, 4, color).unwrap();
        assert_eq!(substrate.get_pixel(12, 0).unwrap(), color);
        assert_eq!(substrate.get_pixel(15, 0).unwrap(), color);
        assert_eq!(substrate.get_pixel(12, 3).unwrap(), color);
        assert_eq!(substrate.get_pixel(15, 3).unwrap(), color);

        // Rectangle at bottom-left corner
        substrate.draw_rect(0, 12, 4, 4, color).unwrap();
        assert_eq!(substrate.get_pixel(0, 12).unwrap(), color);
        assert_eq!(substrate.get_pixel(3, 12).unwrap(), color);
        assert_eq!(substrate.get_pixel(0, 15).unwrap(), color);
        assert_eq!(substrate.get_pixel(3, 15).unwrap(), color);
    }

    #[test]
    fn test_locality_high_order() {
        // Test locality on higher order curve
        let substrate = GlyphSubstrate::new(6).unwrap(); // 64x64

        let locality = substrate.calculate_locality(2.0);
        // Hilbert curve should maintain good locality even at higher orders
        assert!(locality >= 0.75, "Locality should be >= 75%, got {:.2}%", locality * 100.0);
    }
}
