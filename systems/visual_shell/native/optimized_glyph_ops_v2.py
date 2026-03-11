#!/usr/bin/env python3
"""
Optimized Glyph Operations v2 - Numba-Accelerated

Key optimizations over v1:
1. Numba JIT compilation for hot paths
2. Cache-friendly memory access patterns
3. SIMD-friendly data layouts
4. Eliminated Python object overhead
"""

import numpy as np
from numba import jit, njit, prange, uint8, uint16, uint32, int32, float32, bool_, void

# ============================================================================
# Numba-Accelerated Color Operations
# ============================================================================

@njit(uint32(uint32, uint32), cache=True)
def blend_colors_packed(fg: uint32, bg: uint32) -> uint32:
    """
    Fast packed color blending using integer math.
    
    Colors are packed as: R|G|B|A (8 bits each, MSB to LSB)
    Uses bit manipulation to avoid float conversion.
    """
    # Unpack foreground
    r1 = (fg >> 24) & 0xFF
    g1 = (fg >> 16) & 0xFF
    b1 = (fg >> 8) & 0xFF
    a1 = fg & 0xFF
    
    # Unpack background
    r2 = (bg >> 24) & 0xFF
    g2 = (bg >> 16) & 0xFF
    b2 = (bg >> 8) & 0xFF
    a2 = bg & 0xFF
    
    # Fast alpha blending with integer math
    inv_a1 = 255 - a1
    
    # Blend RGB using fixed-point math (8 fractional bits)
    r_out = (r1 * a1 + r2 * inv_a1 + 128) >> 8
    g_out = (g1 * a1 + g2 * inv_a1 + 128) >> 8
    b_out = (b1 * a1 + b2 * inv_a1 + 128) >> 8
    
    # Output alpha (simplified)
    a_out = a1 + ((a2 * inv_a1 + 128) >> 8)
    
    return (r_out << 24) | (g_out << 16) | (b_out << 8) | a_out


@njit(void(uint32[:], uint32[:], uint32[:]), parallel=True, cache=True)
def blend_colors_batch_packed(fg: np.ndarray, bg: np.ndarray, out: np.ndarray) -> None:
    """
    Parallel batch blending using Numba.
    
    Args:
        fg: Foreground colors (N,) as packed uint32
        bg: Background colors (N,) as packed uint32
        out: Output colors (N,) as packed uint32
    """
    n = len(fg)
    for i in prange(n):
        out[i] = blend_colors_packed(fg[i], bg[i])


@njit(void(uint8[:, :], uint8[:, :]), parallel=True, cache=True)
def blend_colors_rgba_batch(fg: np.ndarray, bg: np.ndarray) -> None:
    """
    In-place alpha blending of RGBA arrays.
    
    Blends fg over bg, storing result in bg.
    
    Args:
        fg: Foreground colors (N, 4) as uint8 RGBA
        bg: Background colors (N, 4) as uint8 RGBA (modified in place)
    """
    n = len(fg)
    for i in prange(n):
        a1 = fg[i, 3]
        inv_a1 = 255 - a1
        
        bg[i, 0] = (fg[i, 0] * a1 + bg[i, 0] * inv_a1 + 128) >> 8
        bg[i, 1] = (fg[i, 1] * a1 + bg[i, 1] * inv_a1 + 128) >> 8
        bg[i, 2] = (fg[i, 2] * a1 + bg[i, 2] * inv_a1 + 128) >> 8
        bg[i, 3] = a1 + ((bg[i, 3] * inv_a1 + 128) >> 8)


# ============================================================================
# Numba-Accelerated Hilbert Curve Operations
# ============================================================================

@njit((int32, int32), cache=True)
def hilbert_d2xy_fast(n: int, d: int) -> tuple:
    """
    Fast Hilbert index to coordinate conversion.
    
    Uses pure integer math with no memory access.
    """
    x = 0
    y = 0
    s = 1
    while s < n:
        rx = 1 & (d >> 1)
        ry = 1 & (d ^ rx)
        
        # Rotation
        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            # Swap x and y
            t = x
            x = y
            y = t
        
        x += s * rx
        y += s * ry
        d >>= 2
        s <<= 1
    
    return x, y


@njit(void(int32, int32[:], uint16[:], uint16[:]), parallel=True, cache=True)
def hilbert_d2xy_batch(n: int, indices: np.ndarray, out_x: np.ndarray, out_y: np.ndarray) -> None:
    """
    Batch Hilbert index to coordinate conversion.
    
    Args:
        n: Grid size (power of 2)
        indices: Hilbert indices (N,) as int32
        out_x: Output X coordinates (N,) as uint16
        out_y: Output Y coordinates (N,) as uint16
    """
    for i in prange(len(indices)):
        x, y = hilbert_d2xy_fast(n, indices[i])
        out_x[i] = x
        out_y[i] = y


@njit(uint16[:, :](int32), cache=True)
def build_hilbert_lut_compact(order: int) -> np.ndarray:
    """
    Build a compact Hilbert LUT with optimal memory layout.
    
    Returns:
        LUT array (N*N, 2) as uint16
    """
    n = 1 << order
    total = n * n
    lut = np.zeros((total, 2), dtype=np.uint16)
    
    for d in range(total):
        x, y = hilbert_d2xy_fast(n, d)
        lut[d, 0] = x
        lut[d, 1] = y
    
    return lut


class HilbertCurveV2:
    """
    Optimized Hilbert curve with Numba-accelerated operations.
    """
    
    _cache: dict[int, "HilbertCurveV2"] = {}
    
    def __init__(self, order: int = 8):
        self.order = order
        self.size = 1 << order
        self._lut = None
        
        # Build LUT for reasonable sizes
        if order <= 10:
            self._lut = build_hilbert_lut_compact(order)
    
    def d_to_xy(self, d: int) -> tuple[int, int]:
        """Convert single index to coordinates."""
        if self._lut is not None and d < len(self._lut):
            return int(self._lut[d, 0]), int(self._lut[d, 1])
        return hilbert_d2xy_fast(self.size, d)
    
    def d_to_xy_batch(self, indices: np.ndarray) -> np.ndarray:
        """Convert batch of indices to coordinates."""
        n = len(indices)
        result = np.zeros((n, 2), dtype=np.uint16)
        
        if self._lut is not None:
            # Use LUT with bounds checking
            safe_indices = np.clip(indices, 0, len(self._lut) - 1).astype(np.int32)
            result = self._lut[safe_indices].copy()
        else:
            # Use batch computation
            hilbert_d2xy_batch(self.size, indices.astype(np.int32), result[:, 0], result[:, 1])
        
        return result
    
    @classmethod
    def get_cached(cls, order: int = 8) -> "HilbertCurveV2":
        """Get or create a cached instance."""
        if order not in cls._cache:
            cls._cache[order] = cls(order)
        return cls._cache[order]


# ============================================================================
# Numba-Accelerated Pixel Buffer Operations
# ============================================================================

@njit(void(uint8[:]), parallel=True, cache=True)
def premultiply_alpha_inplace_numba(rgba: np.ndarray) -> None:
    """
    In-place alpha premultiplication using Numba.
    
    Args:
        rgba: Flat pixel array (N*4,) as uint8 RGBA
    """
    n = len(rgba) // 4
    for i in prange(n):
        base = i * 4
        a = rgba[base + 3]
        if a < 255:
            rgba[base + 0] = (rgba[base + 0] * a + 128) >> 8
            rgba[base + 1] = (rgba[base + 1] * a + 128) >> 8
            rgba[base + 2] = (rgba[base + 2] * a + 128) >> 8


@njit(uint8[:, :](uint8[:, :]), parallel=True, cache=True)
def premultiply_alpha_2d(rgba: np.ndarray) -> np.ndarray:
    """
    Alpha premultiplication for 2D array.
    
    Args:
        rgba: Pixel array (N, 4) as uint8 RGBA
    
    Returns:
        Premultiplied pixels (N, 4) as uint8
    """
    n = len(rgba)
    out = np.empty((n, 4), dtype=np.uint8)
    
    for i in prange(n):
        a = rgba[i, 3]
        out[i, 0] = (rgba[i, 0] * a + 128) >> 8
        out[i, 1] = (rgba[i, 1] * a + 128) >> 8
        out[i, 2] = (rgba[i, 2] * a + 128) >> 8
        out[i, 3] = rgba[i, 3]
    
    return out


@njit(void(uint8[:, :]), parallel=True, cache=True)
def unpremultiply_alpha_inplace(rgba: np.ndarray) -> None:
    """
    In-place alpha un-premultiplication.
    
    Args:
        rgba: Pixel array (N, 4) as uint8 RGBA (modified in place)
    """
    n = len(rgba)
    for i in prange(n):
        a = rgba[i, 3]
        if a > 0:
            rgba[i, 0] = min(255, (rgba[i, 0] * 255 + a // 2) // a)
            rgba[i, 1] = min(255, (rgba[i, 1] * 255 + a // 2) // a)
            rgba[i, 2] = min(255, (rgba[i, 2] * 255 + a // 2) // a)


# ============================================================================
# Numba-Accelerated Foveated Rendering
# ============================================================================

@njit(uint8[:](float32[:, :], float32, float32, float32, float32), cache=True)
def classify_regions_numba(points: np.ndarray, fx: float, fy: float, foveal_r_sq: float, parafoveal_r_sq: float) -> np.ndarray:
    """
    Classify batch of points into visual regions.
    
    Args:
        points: Point array (N, 2) as float32
        fx, fy: Focus point coordinates
        foveal_r_sq: Foveal radius squared
        parafoveal_r_sq: Parafoveal radius squared
    
    Returns:
        Region classification (N,) as uint8 (0=foveal, 1=parafoveal, 2=peripheral)
    """
    n = len(points)
    regions = np.empty(n, dtype=np.uint8)
    
    for i in range(n):
        dx = points[i, 0] - fx
        dy = points[i, 1] - fy
        dist_sq = dx * dx + dy * dy
        
        if dist_sq <= foveal_r_sq:
            regions[i] = 0
        elif dist_sq <= parafoveal_r_sq:
            regions[i] = 1
        else:
            regions[i] = 2
    
    return regions


@njit(int32[:](float32[:, :], float32, float32, float32), cache=True)
def get_foveal_indices(points: np.ndarray, fx: float, fy: float, radius_sq: float) -> np.ndarray:
    """
    Get indices of points within foveal region.
    
    Args:
        points: Point array (N, 2) as float32
        fx, fy: Focus point coordinates
        radius_sq: Foveal radius squared
    
    Returns:
        Indices of points in foveal region
    """
    n = len(points)
    count = 0
    
    # First pass: count matches
    for i in range(n):
        dx = points[i, 0] - fx
        dy = points[i, 1] - fy
        if dx * dx + dy * dy <= radius_sq:
            count += 1
    
    # Allocate result
    indices = np.empty(count, dtype=np.int32)
    
    # Second pass: fill indices
    j = 0
    for i in range(n):
        dx = points[i, 0] - fx
        dy = points[i, 1] - fy
        if dx * dx + dy * dy <= radius_sq:
            indices[j] = i
            j += 1
    
    return indices


class FoveatedRendererV2:
    """
    Optimized foveated renderer with Numba acceleration.
    """
    
    def __init__(self, foveal_radius: float = 50.0, parafoveal_radius: float = 150.0):
        self.foveal_r_sq = foveal_radius ** 2
        self.parafoveal_r_sq = parafoveal_radius ** 2
        self.foveal_r = foveal_radius
        self.parafoveal_r = parafoveal_radius
    
    def classify_batch(self, points: np.ndarray, focus: tuple[float, float]) -> np.ndarray:
        """Classify batch of points."""
        fx, fy = focus
        return classify_regions_numba(
            points.astype(np.float32),
            np.float32(fx),
            np.float32(fy),
            np.float32(self.foveal_r_sq),
            np.float32(self.parafoveal_r_sq)
        )
    
    def get_foveal_points(self, points: np.ndarray, focus: tuple[float, float]) -> np.ndarray:
        """Get indices of foveal points."""
        fx, fy = focus
        return get_foveal_indices(
            points.astype(np.float32),
            np.float32(fx),
            np.float32(fy),
            np.float32(self.foveal_r_sq)
        )


# ============================================================================
# RGBA/BGRA Conversion
# ============================================================================

@njit(void(uint8[:, :]), parallel=True, cache=True)
def rgba_to_bgra_inplace_numba(rgba: np.ndarray) -> None:
    """
    In-place RGBA to BGRA conversion.
    """
    n = len(rgba)
    for i in prange(n):
        r = rgba[i, 0]
        rgba[i, 0] = rgba[i, 2]  # B -> position 0
        rgba[i, 2] = r           # R -> position 2


# ============================================================================
# Convenience Functions
# ============================================================================

def create_optimized_pipeline_v2(width: int, height: int) -> dict:
    """
    Create an optimized rendering pipeline using v2 components.
    
    Args:
        width: Terminal width in cells
        height: Terminal height in cells
    
    Returns:
        Dictionary with optimized rendering components
    """
    return {
        "hilbert": HilbertCurveV2.get_cached(order=8),
        "foveated": FoveatedRendererV2(),
        "pixel_buffer": np.zeros((width * height, 4), dtype=np.uint8),
    }


# Pre-compile Numba functions on module load
def _warmup_numba():
    """Pre-compile Numba functions for consistent benchmark timing."""
    # Color blending
    blend_colors_packed(0xFF8080FF, 0x8080FFFF)
    
    fg = np.array([0xFF8080FF], dtype=np.uint32)
    bg = np.array([0x8080FFFF], dtype=np.uint32)
    out = np.zeros(1, dtype=np.uint32)
    blend_colors_batch_packed(fg, bg, out)
    
    # Hilbert
    hilbert_d2xy_fast(256, 12345)
    
    indices = np.array([0, 1, 2], dtype=np.int32)
    out_x = np.zeros(3, dtype=np.uint16)
    out_y = np.zeros(3, dtype=np.uint16)
    hilbert_d2xy_batch(256, indices, out_x, out_y)
    
    # Premultiply
    rgba = np.array([[255, 128, 64, 200]], dtype=np.uint8)
    premultiply_alpha_2d(rgba)
    
    # Foveated
    points = np.array([[100.0, 200.0]], dtype=np.float32)
    classify_regions_numba(points, 50.0, 50.0, 2500.0, 22500.0)


# Run warmup on import
_warmup_numba()
