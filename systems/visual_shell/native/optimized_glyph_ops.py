#!/usr/bin/env python3
"""
Optimized Glyph Operations for Native Glyph Shell

Key optimizations:
1. NumPy vectorization for pixel operations
2. Pre-computed lookup tables for Hilbert curves
3. Batch processing for foveated rendering
4. Cached color blending results
"""

from functools import lru_cache

import numpy as np

# ============================================================================
# Optimized Color Operations
# ============================================================================

# Pre-computed blend factors for common alpha values (0-255)
_BLEND_LUT = np.array([i / 255.0 for i in range(256)], dtype=np.float32)


def blend_colors_batch(fg: np.ndarray, bg: np.ndarray) -> np.ndarray:
    """
    Batch blend foreground over background using vectorized operations.

    Args:
        fg: Foreground colors (N, 4) as float32 in [0, 1] range (RGBA)
        bg: Background colors (N, 4) as float32 in [0, 1] range (RGBA)

    Returns:
        Blended colors (N, 4) as float32
    """
    a_fg = fg[:, 3:4]
    a_bg = bg[:, 3:4]

    # Porter-Duff "over" compositing
    out_a = a_fg + a_bg * (1.0 - a_fg)
    out_a = np.where(out_a < 1e-6, 1.0, out_a)  # Avoid division by zero

    result = np.empty_like(fg)
    result[:, :3] = (fg[:, :3] * a_fg + bg[:, :3] * a_bg * (1.0 - a_fg)) / out_a
    result[:, 3] = out_a.ravel()

    return result


def blend_colors_int8(fg: np.ndarray, bg: np.ndarray) -> np.ndarray:
    """
    Fast integer-based blending for uint8 color arrays.

    Args:
        fg: Foreground colors (N, 4) as uint8 in [0, 255] range (RGBA)
        bg: Background colors (N, 4) as uint8 in [0, 255] range (RGBA)

    Returns:
        Blended colors (N, 4) as uint8
    """
    # Convert to float for blending
    fg_f = fg.astype(np.float32) / 255.0
    bg_f = bg.astype(np.float32) / 255.0

    result_f = blend_colors_batch(fg_f, bg_f)

    # Convert back to uint8
    return (result_f * 255.0 + 0.5).astype(np.uint8)


# ============================================================================
# Optimized Hilbert Curve Operations
# ============================================================================

class HilbertCurveOptimized:
    """
    Optimized Hilbert curve operations with extensive caching.

    Uses multiple strategies:
    - Pre-computed lookup tables for common sizes
    - Memoization for repeated calls
    - Vectorized batch operations
    """

    # Class-level cache for LUTs
    _lut_cache: dict[int, "HilbertCurveOptimized"] = {}

    def __init__(self, order: int = 8):
        self.order = order
        self.size = 1 << order
        self._lut_xy = None
        self._lut_xy_flat = None

        # Only build LUT for reasonable sizes
        if order <= 10:  # Up to 1024x1024 = 1M entries
            self._build_lut()

    def _build_lut(self):
        """Build the lookup tables."""
        n = self.size
        total = n * n

        # Flat array for faster indexing: [x0, y0, x1, y1, ...]
        self._lut_xy_flat = np.zeros(total * 2, dtype=np.uint16)
        self._lut_xy = self._lut_xy_flat.reshape(-1, 2)

        # Build using efficient algorithm
        for d in range(total):
            x, y = self._d2xy_compute(d)
            self._lut_xy[d, 0] = x
            self._lut_xy[d, 1] = y

    def _d2xy_compute(self, d: int) -> tuple[int, int]:
        """Compute d to xy without LUT."""
        n = self.size
        x = y = 0
        s = 1
        while s < n:
            rx = 1 & (d // 2)
            ry = 1 & (d ^ rx)
            x, y = self._rot(s, x, y, rx, ry)
            x += s * rx
            y += s * ry
            d //= 4
            s *= 2
        return x, y

    @staticmethod
    def _rot(n: int, x: int, y: int, rx: int, ry: int) -> tuple[int, int]:
        if ry == 0:
            if rx == 1:
                x = n - 1 - x
                y = n - 1 - y
            x, y = y, x
        return x, y

    def d_to_xy(self, d: int) -> tuple[int, int]:
        """Convert Hilbert index to coordinates."""
        if self._lut_xy is not None and d < len(self._lut_xy):
            return int(self._lut_xy[d, 0]), int(self._lut_xy[d, 1])
        return self._d2xy_compute(d)

    def d_to_xy_batch(self, indices: np.ndarray) -> np.ndarray:
        """
        Convert batch of indices to coordinates.

        Args:
            indices: Array of Hilbert indices (N,)

        Returns:
            Coordinates array (N, 2) as uint16
        """
        if self._lut_xy is not None:
            # Ensure indices are in bounds
            indices = np.clip(indices, 0, len(self._lut_xy) - 1)
            return self._lut_xy[indices].copy()

        # Fallback to computation
        result = np.zeros((len(indices), 2), dtype=np.uint16)
        for i, d in enumerate(indices):
            result[i] = self._d2xy_compute(d)
        return result

    @classmethod
    def get_cached(cls, order: int = 8) -> "HilbertCurveOptimized":
        """Get or create a cached Hilbert curve instance."""
        if order not in cls._lut_cache:
            cls._lut_cache[order] = cls(order)
        return cls._lut_cache[order]


# ============================================================================
# Optimized Pixel Buffer Operations
# ============================================================================

def premultiply_alpha_vectorized(rgba: np.ndarray) -> np.ndarray:
    """
    Premultiply alpha using full vectorization.

    Args:
        rgba: Pixel array (N, 4) as uint8 (RGBA)

    Returns:
        Premultiplied pixels (N, 4) as uint8
    """
    # Use uint16 to avoid overflow during multiplication
    rgb = rgba[:, :3].astype(np.uint16)
    alpha = rgba[:, 3:4].astype(np.uint16)

    # Multiply and shift (equivalent to divide by 255 with rounding)
    result = rgba.copy()
    result[:, :3] = ((rgb * alpha + 127) // 255).astype(np.uint8)

    return result


def premultiply_alpha_inplace(rgba: np.ndarray) -> None:
    """
    In-place alpha premultiplication using NumPy.

    Args:
        rgba: Pixel array (N, 4) as uint8, modified in place
    """
    # Use uint16 arithmetic to avoid overflow
    alpha = rgba[:, 3].astype(np.uint16)

    # Process all channels at once using broadcasting
    rgb = rgba[:, :3].astype(np.uint16)
    rgba[:, :3] = ((rgb * alpha[:, np.newaxis] + 127) // 255).astype(np.uint8)


def rgba_to_bgra_vectorized(rgba: np.ndarray) -> np.ndarray:
    """
    Convert RGBA to BGRA using NumPy views.

    Args:
        rgba: Pixel array (N, 4) as uint8 (RGBA)

    Returns:
        Converted pixels (N, 4) as uint8 (BGRA)
    """
    result = rgba.copy()
    # Swap R and B channels
    result[:, 0], result[:, 2] = rgba[:, 2].copy(), rgba[:, 0].copy()
    return result


def rgba_to_bgra_inplace(rgba: np.ndarray) -> None:
    """
    In-place RGBA to BGRA conversion.

    Args:
        rgba: Pixel array (N, 4) as uint8, modified in place
    """
    # Store R channel temporarily
    r = rgba[:, 0].copy()
    rgba[:, 0] = rgba[:, 2]  # B -> position 0
    rgba[:, 2] = r           # R -> position 2


# ============================================================================
# Optimized Foveated Rendering
# ============================================================================

class FoveatedRendererOptimized:
    """
    Optimized foveated rendering with batch processing.

    Classifies screen regions into:
    - Foveal (highest detail)
    - Parafoveal (medium detail)
    - Peripheral (low detail)
    """

    def __init__(self, foveal_radius: float = 50.0, parafoveal_radius: float = 150.0):
        self.foveal_r_sq = foveal_radius ** 2
        self.parafoveal_r_sq = parafoveal_radius ** 2
        self.foveal_r = foveal_radius
        self.parafoveal_r = parafoveal_radius

    def classify_region(self, x: float, y: float, fx: float, fy: float) -> int:
        """
        Classify a single point's region.

        Returns:
            0 = foveal, 1 = parafoveal, 2 = peripheral
        """
        dx = x - fx
        dy = y - fy
        dist_sq = dx * dx + dy * dy

        if dist_sq <= self.foveal_r_sq:
            return 0
        elif dist_sq <= self.parafoveal_r_sq:
            return 1
        return 2

    def classify_batch(self, points: np.ndarray, focus: tuple[float, float]) -> np.ndarray:
        """
        Classify a batch of points.

        Args:
            points: Array of points (N, 2) as float32
            focus: Focus point (fx, fy)

        Returns:
            Region classification (N,) as uint8 (0, 1, or 2)
        """
        fx, fy = focus

        # Vectorized distance calculation
        dx = points[:, 0] - fx
        dy = points[:, 1] - fy
        dist_sq = dx * dx + dy * dy

        # Classify
        regions = np.full(len(points), 2, dtype=np.uint8)  # Default: peripheral
        regions[dist_sq <= self.parafoveal_r_sq] = 1       # Parafoveal
        regions[dist_sq <= self.foveal_r_sq] = 0           # Foveal

        return regions

    def get_detail_levels(self, points: np.ndarray, focus: tuple[float, float]) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
        """
        Get indices for each detail level.

        Args:
            points: Array of points (N, 2) as float32
            focus: Focus point (fx, fy)

        Returns:
            Tuple of (foveal_indices, parafoveal_indices, peripheral_indices)
        """
        regions = self.classify_batch(points, focus)

        return (
            np.where(regions == 0)[0],
            np.where(regions == 1)[0],
            np.where(regions == 2)[0],
        )


# ============================================================================
# Optimized Terminal Glyph Cache
# ============================================================================

class GlyphCacheOptimized:
    """
    Optimized glyph cache with efficient lookup.

    Uses a combination of:
    - LRU cache for recent glyphs
    - Packed representation for memory efficiency
    """

    def __init__(self, max_size: int = 1024):
        self.max_size = max_size
        self._cache: dict[int, np.ndarray] = {}
        self._access_count: dict[int, int] = {}

    def _make_key(self, char: str, fg: int, bg: int, attrs: int = 0) -> int:
        """Create a packed key from glyph attributes."""
        # Pack: char (21 bits) + fg (8 bits) + bg (8 bits) + attrs (8 bits) = 45 bits
        return (ord(char) << 32) | (fg << 24) | (bg << 16) | attrs

    def get(self, char: str, fg: int, bg: int, attrs: int = 0) -> np.ndarray | None:
        """Get a cached glyph."""
        key = self._make_key(char, fg, bg, attrs)
        if key in self._cache:
            self._access_count[key] = self._access_count.get(key, 0) + 1
            return self._cache[key]
        return None

    def put(self, char: str, fg: int, bg: int, attrs: int, glyph: np.ndarray) -> None:
        """Store a glyph in the cache."""
        if len(self._cache) >= self.max_size:
            self._evict()

        key = self._make_key(char, fg, bg, attrs)
        self._cache[key] = glyph
        self._access_count[key] = 1

    def _evict(self) -> None:
        """Evict least recently used entries."""
        # Remove bottom 25% of entries by access count
        items = sorted(self._access_count.items(), key=lambda x: x[1])
        to_remove = len(items) // 4

        for key, _ in items[:to_remove]:
            del self._cache[key]
            del self._access_count[key]


# ============================================================================
# Convenience Functions
# ============================================================================

def create_optimized_pipeline(width: int, height: int) -> dict:
    """
    Create an optimized rendering pipeline for a terminal buffer.

    Args:
        width: Terminal width in cells
        height: Terminal height in cells

    Returns:
        Dictionary with optimized rendering components
    """
    return {
        "hilbert": HilbertCurveOptimized.get_cached(order=8),
        "foveated": FoveatedRendererOptimized(),
        "glyph_cache": GlyphCacheOptimized(max_size=width * height),
        "pixel_buffer": np.zeros((width * height, 4), dtype=np.uint8),
    }


# ============================================================================
# Bytearray Operations (for PTY buffer integration)
# ============================================================================

def premultiply_alpha_bytearray(rgba: bytearray) -> None:
    """
    In-place alpha premultiplication for bytearray.

    Uses NumPy internally for speed when dealing with large buffers.

    Args:
        rgba: Pixel buffer as bytearray (length must be multiple of 4)
    """
    # For large buffers, use NumPy (faster despite conversion overhead)
    n = len(rgba)
    if n > 4096:  # Use NumPy for buffers > 1K pixels
        arr = np.frombuffer(rgba, dtype=np.uint8).reshape(-1, 4)
        alpha = arr[:, 3].astype(np.uint16)
        rgb = arr[:, :3].astype(np.uint16)
        arr[:, :3] = ((rgb * alpha[:, np.newaxis] + 127) // 255).astype(np.uint8)
    else:
        # For small buffers, direct loop is faster (avoids NumPy overhead)
        for i in range(0, n, 4):
            a = rgba[i + 3]
            rgba[i] = (rgba[i] * a + 127) // 255
            rgba[i + 1] = (rgba[i + 1] * a + 127) // 255
            rgba[i + 2] = (rgba[i + 2] * a + 127) // 255


def rgba_to_bgra_bytearray(rgba: bytearray) -> None:
    """
    In-place RGBA to BGRA conversion for bytearray.

    Args:
        rgba: Pixel buffer as bytearray (length must be multiple of 4)
    """
    n = len(rgba)
    for i in range(0, n, 4):
        # Swap R and B
        rgba[i], rgba[i + 2] = rgba[i + 2], rgba[i]


def bytearray_to_numpy_view(rgba: bytearray) -> np.ndarray:
    """
    Create a NumPy view of a bytearray for fast operations.

    WARNING: The returned array shares memory with the bytearray.
    Modifying the array modifies the bytearray.

    Args:
        rgba: Pixel buffer as bytearray

    Returns:
        NumPy array view (N, 4) as uint8
    """
    return np.frombuffer(rgba, dtype=np.uint8).reshape(-1, 4)


# ============================================================================
# Fast Glyph Cache with Array Storage
# ============================================================================

class FastGlyphCache:
    """
    High-performance glyph cache using dict-based storage.

    Python's built-in dict is highly optimized and faster than
    custom array-based solutions for this use case.

    Optimizations:
    - Packed integer keys for minimal memory
    - LRU tracking for cache eviction
    - O(1) average lookup time
    """

    __slots__ = ['_cache', '_access', '_max_size']

    def __init__(self, max_glyphs: int = 256, glyph_size: int = 64):
        """
        Initialize the cache.

        Args:
            max_glyphs: Maximum number of glyphs to store
            glyph_size: Size of each glyph (ignored, kept for API compatibility)
        """
        self._cache: dict[int, np.ndarray] = {}
        self._access: dict[int, int] = {}
        self._max_size = max_glyphs

    @staticmethod
    def _pack_key(char_code: int, fg: int, bg: int) -> int:
        """Pack glyph attributes into a single integer key."""
        # char (21 bits) | fg (8 bits) | bg (8 bits)
        return (char_code << 16) | (fg << 8) | bg

    def get(self, char_code: int, fg: int, bg: int) -> np.ndarray | None:
        """Get a cached glyph."""
        key = self._pack_key(char_code, fg, bg)
        if key in self._cache:
            self._access[key] = self._access.get(key, 0) + 1
            return self._cache[key]
        return None

    def put(self, char_code: int, fg: int, bg: int, glyph: np.ndarray) -> None:
        """Store a glyph in the cache."""
        if len(self._cache) >= self._max_size:
            self._evict()

        key = self._pack_key(char_code, fg, bg)
        self._cache[key] = glyph
        self._access[key] = 1

    def _evict(self) -> None:
        """Evict least recently used entries."""
        # Remove bottom 25% by access count
        items = sorted(self._access.items(), key=lambda x: x[1])
        to_remove = len(items) // 4

        for key, _ in items[:to_remove]:
            del self._cache[key]
            del self._access[key]

    def clear(self) -> None:
        """Clear the cache."""
        self._cache.clear()
        self._access.clear()
