#!/usr/bin/env python3
"""
Verification script for Native Glyph Shell optimizations.

Run this to verify that all optimizations are working correctly.
"""

import json
import sys
from pathlib import Path

import numpy as np

# Add paths
sys.path.insert(0, str(Path(__file__).parent.parent / "native"))
sys.path.insert(0, str(Path(__file__).parent))

from optimized_glyph_ops import (
    FastGlyphCache,
    FoveatedRendererOptimized,
    HilbertCurveOptimized,
    blend_colors_batch,
    premultiply_alpha_vectorized,
    rgba_to_bgra_vectorized,
)
from quick_benchmark import Color, ColorOptimized


def verify_hilbert():
    """Verify Hilbert curve optimization."""
    print("  [Hilbert] Testing coordinate mapping...")

    hilbert = HilbertCurveOptimized(order=8)

    # Test single coordinate
    x, y = hilbert.d_to_xy(12345)
    assert 0 <= x < 256 and 0 <= y < 256, f"Invalid coordinates: ({x}, {y})"

    # Test batch mapping
    indices = np.array([0, 1, 100, 12345, 65535], dtype=np.uint32)
    coords = hilbert.d_to_xy_batch(indices)
    assert coords.shape == (5, 2), f"Invalid batch shape: {coords.shape}"

    # Verify consistency
    for i, d in enumerate(indices):
        x1, y1 = hilbert.d_to_xy(d)
        x2, y2 = coords[i]
        assert (x1, y1) == (x2, y2), f"Inconsistent at d={d}: ({x1},{y1}) vs ({x2},{y2})"

    print("  [Hilbert] ✅ All tests passed")
    return True


def verify_premultiply():
    """Verify alpha premultiplication."""
    print("  [Premultiply] Testing alpha operations...")

    # Test vectorized version
    pixels = np.array([
        [255, 255, 255, 255],  # Opaque white -> unchanged
        [255, 255, 255, 128],  # Semi-transparent white -> ~128
        [0, 0, 0, 0],          # Transparent -> black
        [128, 64, 32, 128],    # Semi-transparent color
    ], dtype=np.uint8)

    result = premultiply_alpha_vectorized(pixels)

    # Check opaque case (unchanged)
    assert np.allclose(result[0, :3], [255, 255, 255], atol=1), "Opaque should be unchanged"

    # Check semi-transparent (approximately half)
    assert np.allclose(result[1, :3], [128, 128, 128], atol=2), "Semi-transparent should be halved"

    # Check transparent (black)
    assert np.allclose(result[2, :3], [0, 0, 0], atol=1), "Transparent should be black"

    print("  [Premultiply] ✅ All tests passed")
    return True


def verify_bgra_swap():
    """Verify RGBA to BGRA conversion."""
    print("  [BGRA Swap] Testing channel swap...")

    pixels = np.array([
        [255, 0, 0, 255],    # Red -> B=255 (blue)
        [0, 255, 0, 255],    # Green -> unchanged
        [0, 0, 255, 255],    # Blue -> R=255 (red)
        [128, 64, 32, 255],  # Mixed -> 32, 64, 128
    ], dtype=np.uint8)

    result = rgba_to_bgra_vectorized(pixels)

    # Red pixel should become blue
    assert result[0, 0] == 0 and result[0, 2] == 255, "Red should become blue"

    # Green pixel should stay green
    assert result[1, 1] == 255, "Green should be unchanged"

    # Blue pixel should become red
    assert result[2, 0] == 255 and result[2, 2] == 0, "Blue should become red"

    # Mixed pixel
    assert result[3, 0] == 32 and result[3, 2] == 128, "Mixed should swap"

    print("  [BGRA Swap] ✅ All tests passed")
    return True


def verify_foveated():
    """Verify foveated rendering."""
    print("  [Foveated] Testing region classification...")

    foveated = FoveatedRendererOptimized(foveal_radius=50.0, parafoveal_radius=150.0)

    # Test single classification
    assert foveated.classify_region(100, 100, 100, 100) == 0, "Center should be foveal"
    assert foveated.classify_region(200, 100, 100, 100) == 1, "Nearby should be parafoveal"
    assert foveated.classify_region(400, 100, 100, 100) == 2, "Far should be peripheral"

    # Test batch classification
    points = np.array([
        [100, 100],  # Foveal
        [150, 100],  # Edge of foveal
        [200, 100],  # Parafoveal
        [400, 100],  # Peripheral
    ], dtype=np.float32)

    regions = foveated.classify_batch(points, (100.0, 100.0))
    assert regions[0] == 0, "Point 0 should be foveal"
    assert regions[2] == 1, "Point 2 should be parafoveal"
    assert regions[3] == 2, "Point 3 should be peripheral"

    print("  [Foveated] ✅ All tests passed")
    return True


def verify_color_blending():
    """Verify color blending."""
    print("  [Color Blend] Testing color operations...")

    # Test optimized color blend
    c1 = ColorOptimized.from_rgba(255, 0, 0, 128)   # Semi-transparent red
    c2 = ColorOptimized.from_rgba(0, 0, 255, 255)   # Opaque blue

    result = c1.blend_over_fast(c2)
    r, g, b, a = ColorOptimized.unpack(result.packed)

    # Result should be reddish-blue
    assert r > 100, f"Red channel should be significant: {r}"
    assert b > 100, f"Blue channel should be significant: {b}"

    # Test batch blending
    colors1 = np.array([[1.0, 0.0, 0.0, 0.5]], dtype=np.float32)
    colors2 = np.array([[0.0, 0.0, 1.0, 1.0]], dtype=np.float32)

    result = blend_colors_batch(colors1, colors2)
    assert result.shape == (1, 4), f"Invalid batch result shape: {result.shape}"

    print("  [Color Blend] ✅ All tests passed")
    return True


def verify_glyph_cache():
    """Verify glyph cache."""
    print("  [Glyph Cache] Testing cache operations...")

    cache = FastGlyphCache(max_glyphs=256)

    # Create test glyph (flattened to match cache storage format)
    glyph = np.random.randint(0, 256, (8 * 8 * 4,), dtype=np.uint8)

    # Put and get
    cache.put(65, 255, 0, glyph)  # 'A' with white fg, black bg

    result = cache.get(65, 255, 0)
    assert result is not None, "Glyph should be cached"
    assert result.shape == (256,), f"Invalid glyph shape: {result.shape}"

    # Test miss
    assert cache.get(66, 255, 0) is None, "Uncached glyph should return None"

    print("  [Glyph Cache] ✅ All tests passed")
    return True


def run_verification():
    """Run all verification tests."""
    print("=" * 60)
    print("NATIVE GLYPH SHELL - OPTIMIZATION VERIFICATION")
    print("=" * 60)
    print()

    tests = [
        ("Hilbert Curve", verify_hilbert),
        ("Alpha Premultiply", verify_premultiply),
        ("BGRA Swap", verify_bgra_swap),
        ("Foveated Rendering", verify_foveated),
        ("Color Blending", verify_color_blending),
        ("Glyph Cache", verify_glyph_cache),
    ]

    results = []
    for name, test_func in tests:
        try:
            test_func()
            results.append((name, True))
        except Exception as e:
            print(f"  ❌ FAILED: {e}")
            results.append((name, False))

    print()
    print("=" * 60)
    print("SUMMARY")
    print("=" * 60)

    passed = sum(1 for _, ok in results if ok)
    total = len(results)

    for name, ok in results:
        status = "✅ PASS" if ok else "❌ FAIL"
        print(f"  {name:<25} {status}")

    print()
    print(f"Result: {passed}/{total} tests passed")

    if passed == total:
        print("\n🎉 All optimizations verified successfully!")
        return 0
    else:
        print("\n⚠️  Some optimizations failed verification")
        return 1


if __name__ == "__main__":
    exit(run_verification())
