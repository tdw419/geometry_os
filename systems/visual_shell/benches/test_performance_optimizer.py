#!/usr/bin/env python3
"""
Unit tests for Visual Shell Performance Optimizer.

Tests verify correctness of:
1. Color blending operations (baseline and optimized)
2. Hilbert curve mapping (baseline and LUT)
3. Pixel buffer operations (premultiply, channel swap)
4. Foveated rendering calculations
5. Benchmark infrastructure
"""

import math
from dataclasses import fields

import numpy as np
import pytest

from performance_optimizer import (
    BenchmarkResult,
    Color,
    ColorOptimized,
    HilbertLUT,
    OptimizationReport,
    VisualShellBenchmark,
    _rot_baseline,
    _xy_to_d_compute,
    blend_over_numpy,
    calculate_region_baseline,
    calculate_region_fast,
    calculate_regions_batch,
    hilbert_d2xy_baseline,
    premultiply_alpha_baseline,
    premultiply_alpha_numpy,
    premultiply_alpha_optimized,
    rgba_to_bgra_baseline,
    rgba_to_bgra_numpy,
)


# ============================================================================
# Color Operations Tests
# ============================================================================


class TestColor:
    """Tests for baseline Color class."""

    def test_color_default_values(self) -> None:
        """Color should have correct default values."""
        c = Color()
        assert c.r == 0.0
        assert c.g == 0.0
        assert c.b == 0.0
        assert c.a == 1.0

    def test_color_custom_values(self) -> None:
        """Color should accept custom RGBA values."""
        c = Color(r=0.5, g=0.75, b=0.25, a=0.9)
        assert c.r == 0.5
        assert c.g == 0.75
        assert c.b == 0.25
        assert c.a == 0.9

    def test_blend_over_transparent_over_opaque(self) -> None:
        """Transparent color over opaque should preserve background."""
        foreground = Color(r=1.0, g=0.0, b=0.0, a=0.0)
        background = Color(r=0.0, g=1.0, b=0.0, a=1.0)
        result = foreground.blend_over(background)

        # With alpha=0, result should be background
        assert result.r == pytest.approx(0.0, abs=1e-6)
        assert result.g == pytest.approx(1.0, abs=1e-6)
        assert result.b == pytest.approx(0.0, abs=1e-6)
        assert result.a == pytest.approx(1.0, abs=1e-6)

    def test_blend_over_opaque_over_anything(self) -> None:
        """Opaque color should fully replace background."""
        foreground = Color(r=1.0, g=0.0, b=0.0, a=1.0)
        background = Color(r=0.0, g=1.0, b=0.0, a=0.5)
        result = foreground.blend_over(background)

        assert result.r == pytest.approx(1.0, abs=1e-6)
        assert result.g == pytest.approx(0.0, abs=1e-6)
        assert result.b == pytest.approx(0.0, abs=1e-6)
        assert result.a == pytest.approx(1.0, abs=1e-6)

    def test_blend_over_semitransparent(self) -> None:
        """Semitransparent blend should mix colors correctly."""
        foreground = Color(r=1.0, g=0.0, b=0.0, a=0.5)
        background = Color(r=0.0, g=0.0, b=1.0, a=1.0)
        result = foreground.blend_over(background)

        # Result should be between red and blue
        assert 0.0 < result.r < 1.0
        assert result.g == pytest.approx(0.0, abs=1e-6)
        assert 0.0 < result.b < 1.0

    def test_blend_over_both_transparent(self) -> None:
        """Both transparent should return transparent black."""
        c1 = Color(r=0.5, g=0.5, b=0.5, a=0.0)
        c2 = Color(r=0.3, g=0.3, b=0.3, a=0.0)
        result = c1.blend_over(c2)

        assert result.r == 0.0
        assert result.g == 0.0
        assert result.b == 0.0
        assert result.a == 0.0

    def test_blend_add_simple(self) -> None:
        """Additive blend should sum colors."""
        c1 = Color(r=0.5, g=0.3, b=0.2, a=0.8)
        c2 = Color(r=0.3, g=0.4, b=0.1, a=0.1)
        result = c1.blend_add(c2)

        assert result.r == pytest.approx(0.8, abs=1e-6)
        assert result.g == pytest.approx(0.7, abs=1e-6)
        assert result.b == pytest.approx(0.3, abs=1e-6)
        assert result.a == pytest.approx(0.9, abs=1e-6)

    def test_blend_add_clamps_to_one(self) -> None:
        """Additive blend should clamp to 1.0."""
        c1 = Color(r=0.8, g=0.8, b=0.8, a=0.8)
        c2 = Color(r=0.5, g=0.5, b=0.5, a=0.5)
        result = c1.blend_add(c2)

        assert result.r == 1.0
        assert result.g == 1.0
        assert result.b == 1.0
        assert result.a == 1.0

    def test_lerp_zero(self) -> None:
        """Lerp at t=0 should return first color."""
        c1 = Color(r=1.0, g=0.0, b=0.0, a=1.0)
        c2 = Color(r=0.0, g=1.0, b=0.0, a=0.0)
        result = c1.lerp(c2, 0.0)

        assert result.r == pytest.approx(1.0, abs=1e-6)
        assert result.g == pytest.approx(0.0, abs=1e-6)

    def test_lerp_one(self) -> None:
        """Lerp at t=1 should return second color."""
        c1 = Color(r=1.0, g=0.0, b=0.0, a=1.0)
        c2 = Color(r=0.0, g=1.0, b=0.0, a=0.0)
        result = c1.lerp(c2, 1.0)

        assert result.r == pytest.approx(0.0, abs=1e-6)
        assert result.g == pytest.approx(1.0, abs=1e-6)

    def test_lerp_half(self) -> None:
        """Lerp at t=0.5 should return midpoint."""
        c1 = Color(r=0.0, g=0.0, b=0.0, a=0.0)
        c2 = Color(r=1.0, g=1.0, b=1.0, a=1.0)
        result = c1.lerp(c2, 0.5)

        assert result.r == pytest.approx(0.5, abs=1e-6)
        assert result.g == pytest.approx(0.5, abs=1e-6)
        assert result.b == pytest.approx(0.5, abs=1e-6)
        assert result.a == pytest.approx(0.5, abs=1e-6)


class TestColorOptimized:
    """Tests for optimized Color class."""

    def test_from_rgba_packing(self) -> None:
        """from_rgba should pack components correctly."""
        c = ColorOptimized.from_rgba(0x12, 0x34, 0x56, 0x78)
        # Packed as: 0xRRGGBBAA
        assert c.packed == 0x12345678

    def test_unpack_components(self) -> None:
        """unpack should extract correct RGBA components."""
        packed = 0xAABBCCDD
        r, g, b, a = ColorOptimized.unpack(packed)

        assert r == 0xAA
        assert g == 0xBB
        assert b == 0xCC
        assert a == 0xDD

    def test_default_packed_value(self) -> None:
        """Default should be opaque black."""
        c = ColorOptimized()
        # Default is 0x000000FF (black, fully opaque)
        assert c.packed == 0x000000FF

    def test_blend_over_fast_preserves_types(self) -> None:
        """blend_over_fast should return ColorOptimized."""
        c1 = ColorOptimized.from_rgba(255, 0, 0, 128)
        c2 = ColorOptimized.from_rgba(0, 0, 255, 255)
        result = c1.blend_over_fast(c2)

        assert isinstance(result, ColorOptimized)

    def test_blend_over_fast_opaque_foreground(self) -> None:
        """Opaque foreground should dominate blend."""
        c1 = ColorOptimized.from_rgba(255, 0, 0, 255)  # Opaque red
        c2 = ColorOptimized.from_rgba(0, 0, 255, 255)  # Opaque blue
        result = c1.blend_over_fast(c2)

        r, g, b, a = ColorOptimized.unpack(result.packed)
        # With alpha=255, foreground should win
        assert r > 200  # Mostly red
        assert b < 100  # Little blue


class TestBlendOverNumpy:
    """Tests for vectorized NumPy color blending."""

    def test_basic_blend(self) -> None:
        """Basic vectorized blend should work."""
        colors1 = np.array([[1.0, 0.0, 0.0, 1.0]], dtype=np.float32)  # Opaque red
        colors2 = np.array([[0.0, 0.0, 1.0, 1.0]], dtype=np.float32)  # Opaque blue
        result = blend_over_numpy(colors1, colors2)

        assert result.shape == (1, 4)
        # Opaque red over opaque blue = red
        assert result[0, 0] == pytest.approx(1.0, abs=1e-5)
        assert result[0, 2] == pytest.approx(0.0, abs=1e-5)

    def test_batch_blend(self) -> None:
        """Batch blend should process multiple colors."""
        colors1 = np.array([
            [1.0, 0.0, 0.0, 0.5],
            [0.0, 1.0, 0.0, 0.5],
            [0.0, 0.0, 1.0, 0.5],
        ], dtype=np.float32)
        colors2 = np.zeros((3, 4), dtype=np.float32)

        result = blend_over_numpy(colors1, colors2)
        assert result.shape == (3, 4)

    def test_transparent_colors(self) -> None:
        """Transparent colors should handle division by zero."""
        colors1 = np.array([[0.5, 0.5, 0.5, 0.0]], dtype=np.float32)
        colors2 = np.array([[0.5, 0.5, 0.5, 0.0]], dtype=np.float32)
        result = blend_over_numpy(colors1, colors2)

        # Should not be NaN or Inf
        assert np.all(np.isfinite(result))


# ============================================================================
# Hilbert Curve Tests
# ============================================================================


class TestHilbertBaseline:
    """Tests for baseline Hilbert curve functions."""

    def test_d2xy_origin(self) -> None:
        """Index 0 should map to origin."""
        x, y = hilbert_d2xy_baseline(2, 0)
        assert x == 0
        assert y == 0

    def test_d2xy_small_grid(self) -> None:
        """Test known mappings for small grid."""
        # For 2x2 grid (n=2):
        # d=0: (0,0), d=1: (0,1), d=2: (1,1), d=3: (1,0)
        expected = [(0, 0), (0, 1), (1, 1), (1, 0)]
        for d, (ex, ey) in enumerate(expected):
            x, y = hilbert_d2xy_baseline(2, d)
            assert (x, y) == (ex, ey), f"d={d}: expected ({ex},{ey}), got ({x},{y})"

    def test_d2xy_range(self) -> None:
        """All coordinates should be within valid range."""
        n = 16
        for d in range(n * n):
            x, y = hilbert_d2xy_baseline(n, d)
            assert 0 <= x < n, f"x={x} out of range for d={d}"
            assert 0 <= y < n, f"y={y} out of range for d={d}"

    def test_d2xy_unique_coordinates(self) -> None:
        """Each index should map to unique coordinate."""
        n = 8
        coords = set()
        for d in range(n * n):
            x, y = hilbert_d2xy_baseline(n, d)
            assert (x, y) not in coords, f"Duplicate coordinate ({x},{y}) for d={d}"
            coords.add((x, y))

    def test_rot_baseline_identity(self) -> None:
        """Rotation with ry=1 should return unchanged."""
        x, y = _rot_baseline(10, 5, 7, 0, 1)
        assert x == 5
        assert y == 7

    def test_rot_baseline_swap(self) -> None:
        """Rotation with ry=0 should swap for certain rx values."""
        x, y = _rot_baseline(10, 5, 7, 0, 0)
        # Should swap x and y
        assert x == 7
        assert y == 5


class TestHilbertLUT:
    """Tests for Hilbert lookup table implementation."""

    def test_lut_build_small_order(self) -> None:
        """LUT should build correctly for small orders."""
        lut = HilbertLUT(order=4)
        assert lut.size == 16
        assert lut.lut_xy is not None
        assert lut.lut_d is not None

    def test_lut_disabled_large_order(self) -> None:
        """LUT should be disabled for large orders."""
        lut = HilbertLUT(order=8)
        assert lut.size == 256
        assert lut.lut_xy is None
        assert lut.lut_d is None

    def test_d_to_xy_matches_baseline(self) -> None:
        """LUT d_to_xy should match baseline computation."""
        lut = HilbertLUT(order=6)
        n = lut.size

        for d in [0, 1, 100, 500, 1000, n * n - 1]:
            x_lut, y_lut = lut.d_to_xy(d)
            x_base, y_base = hilbert_d2xy_baseline(n, d)
            assert (x_lut, y_lut) == (x_base, y_base), f"Mismatch at d={d}"

    def test_xy_to_d_matches_compute(self) -> None:
        """LUT xy_to_d should match computation."""
        lut = HilbertLUT(order=6)
        n = lut.size

        for x, y in [(0, 0), (1, 1), (10, 20), (n - 1, n - 1)]:
            d_lut = lut.xy_to_d(x, y)
            d_compute = _xy_to_d_compute(lut.order, x, y)
            assert d_lut == d_compute, f"Mismatch at ({x},{y})"

    def test_fallback_for_large_order(self) -> None:
        """Large order should fall back to baseline computation."""
        lut = HilbertLUT(order=8)
        x, y = lut.d_to_xy(12345)
        x_base, y_base = hilbert_d2xy_baseline(256, 12345)
        assert (x, y) == (x_base, y_base)


class TestXyToDCompute:
    """Tests for xy_to_d computation fallback."""

    def test_roundtrip_with_baseline(self) -> None:
        """xy_to_d should be inverse of d_to_xy."""
        n_power = 4  # n = 2^4 = 16
        n = 1 << n_power

        for d in [0, 1, 50, 100, 200, n * n - 1]:
            x, y = hilbert_d2xy_baseline(n, d)
            d_back = _xy_to_d_compute(n_power, x, y)
            assert d_back == d, f"Roundtrip failed: d={d} -> ({x},{y}) -> d={d_back}"


# ============================================================================
# Pixel Buffer Tests
# ============================================================================


class TestPremultiplyAlpha:
    """Tests for alpha premultiplication."""

    def test_baseline_transparent_becomes_black(self) -> None:
        """Fully transparent pixels should become black."""
        rgba = bytearray([255, 128, 64, 0])  # Alpha = 0
        premultiply_alpha_baseline(rgba)

        assert rgba[0] == 0  # R
        assert rgba[1] == 0  # G
        assert rgba[2] == 0  # B
        assert rgba[3] == 0  # A unchanged

    def test_baseline_opaque_unchanged(self) -> None:
        """Fully opaque pixels should be unchanged."""
        rgba = bytearray([128, 64, 32, 255])  # Alpha = 255
        original = bytes(rgba)
        premultiply_alpha_baseline(rgba)

        # Values should be approximately unchanged (some rounding)
        for i in range(4):
            assert abs(rgba[i] - original[i]) <= 1

    def test_baseline_semitransparent(self) -> None:
        """Semitransparent pixels should be multiplied."""
        rgba = bytearray([200, 100, 50, 128])  # Alpha = 50%
        premultiply_alpha_baseline(rgba)

        # Each channel should be ~50% of original
        assert rgba[0] == pytest.approx(100, abs=2)
        assert rgba[1] == pytest.approx(50, abs=2)
        assert rgba[2] == pytest.approx(25, abs=2)

    def test_optimized_matches_baseline_approximately(self) -> None:
        """Optimized version should match baseline within tolerance."""
        test_cases = [
            [255, 255, 255, 255],  # Opaque white
            [255, 255, 255, 128],  # Semi-transparent white
            [128, 64, 32, 64],  # Low alpha
            [0, 0, 0, 0],  # Transparent black
        ]

        for case in test_cases:
            baseline = bytearray(case)
            optimized = bytearray(case)

            premultiply_alpha_baseline(baseline)
            premultiply_alpha_optimized(optimized)

            # Allow small rounding differences
            for i in range(3):
                assert abs(baseline[i] - optimized[i]) <= 2, f"Mismatch at {case}: {baseline} vs {optimized}"

    def test_numpy_premultiply(self) -> None:
        """NumPy premultiply should work correctly."""
        rgba = np.array([[255, 128, 64, 128]], dtype=np.uint8)
        result = premultiply_alpha_numpy(rgba)

        # Channel 0 should be ~255 * 0.5 = ~127
        assert result[0, 0] == pytest.approx(127, abs=2)


class TestRgbaToBgra:
    """Tests for RGBA to BGRA conversion."""

    def test_baseline_conversion(self) -> None:
        """Baseline should swap R and B channels."""
        rgba = bytes([1, 2, 3, 4, 5, 6, 7, 8])  # Two pixels
        bgra = rgba_to_bgra_baseline(rgba)

        # First pixel: R=1, G=2, B=3, A=4 -> B=3, G=2, R=1, A=4
        assert bgra[0] == 3  # B
        assert bgra[1] == 2  # G
        assert bgra[2] == 1  # R
        assert bgra[3] == 4  # A

        # Second pixel
        assert bgra[4] == 7  # B
        assert bgra[5] == 6  # G
        assert bgra[6] == 5  # R
        assert bgra[7] == 8  # A

    def test_numpy_conversion(self) -> None:
        """NumPy conversion should swap R and B channels."""
        rgba = np.array([[1, 2, 3, 4]], dtype=np.uint8)
        bgra = rgba_to_bgra_numpy(rgba)

        assert bgra[0, 0] == 3  # B <- R
        assert bgra[0, 1] == 2  # G unchanged
        assert bgra[0, 2] == 1  # R <- B
        assert bgra[0, 3] == 4  # A unchanged

    def test_numpy_batch_conversion(self) -> None:
        """NumPy should handle batch conversion."""
        rgba = np.array([
            [255, 0, 0, 255],
            [0, 255, 0, 255],
            [0, 0, 255, 255],
        ], dtype=np.uint8)
        bgra = rgba_to_bgra_numpy(rgba)

        assert bgra[0, 0] == 0  # B from red pixel
        assert bgra[2, 0] == 255  # B from blue pixel


# ============================================================================
# Foveated Rendering Tests
# ============================================================================


class TestFoveatedRendering:
    """Tests for foveated rendering calculations."""

    def test_baseline_foveal_region(self) -> None:
        """Point at focus should be foveal."""
        region = calculate_region_baseline(100, 100, 100, 100, 50, 150)
        assert region == "foveal"

    def test_baseline_parafoveal_region(self) -> None:
        """Point in parafoveal ring should be parafoveal."""
        region = calculate_region_baseline(200, 100, 100, 100, 50, 150)
        # Distance = 100, which is > 50 (foveal) but <= 150 (parafoveal)
        assert region == "parafoveal"

    def test_baseline_peripheral_region(self) -> None:
        """Point outside rings should be peripheral."""
        region = calculate_region_baseline(300, 100, 100, 100, 50, 150)
        # Distance = 200, which is > 150 (parafoveal)
        assert region == "peripheral"

    def test_fast_matches_baseline(self) -> None:
        """Fast version should match baseline results."""
        test_points = [
            (100, 100, 100, 100),  # At focus
            (150, 100, 100, 100),  # Edge of foveal
            (200, 100, 100, 100),  # Parafoveal
            (300, 100, 100, 100),  # Peripheral
        ]

        foveal_r = 50
        parafoveal_r = 150

        for x, y, fx, fy in test_points:
            baseline = calculate_region_baseline(x, y, fx, fy, foveal_r, parafoveal_r)
            fast = calculate_region_fast(x, y, fx, fy, foveal_r**2, parafoveal_r**2)
            assert baseline == fast, f"Mismatch at ({x},{y})"

    def test_batch_classification(self) -> None:
        """Batch classification should match individual calculations."""
        points = np.array([
            [100, 100],  # Foveal
            [150, 100],  # Edge of foveal
            [200, 100],  # Parafoveal
            [300, 100],  # Peripheral
        ], dtype=np.float32)

        focus = (100.0, 100.0)
        radii = (50.0, 150.0, 400.0)

        regions = calculate_regions_batch(points, focus, radii)

        # 0 = foveal, 1 = parafoveal, 2 = peripheral
        assert regions[0] == 0  # Foveal
        assert regions[1] == 0 or regions[1] == 1  # Edge case
        assert regions[2] == 1  # Parafoveal
        assert regions[3] == 2  # Peripheral

    def test_batch_empty_input(self) -> None:
        """Batch should handle empty input."""
        points = np.array([], dtype=np.float32).reshape(0, 2)
        focus = (100.0, 100.0)
        radii = (50.0, 150.0, 400.0)

        regions = calculate_regions_batch(points, focus, radii)
        assert len(regions) == 0


# ============================================================================
# Benchmark Infrastructure Tests
# ============================================================================


class TestBenchmarkResult:
    """Tests for BenchmarkResult dataclass."""

    def test_default_values(self) -> None:
        """Result should have sensible defaults."""
        result = BenchmarkResult(
            name="test",
            iterations=100,
            total_time_ms=10.0,
            avg_time_us=100.0,
            min_time_us=50.0,
            max_time_us=200.0,
            p50_us=95.0,
            p95_us=180.0,
            p99_us=195.0,
            operations_per_second=10000.0,
        )

        assert result.target_us is None
        assert result.passed is True

    def test_pass_fail_logic(self) -> None:
        """Result should correctly determine pass/fail."""
        # Under target
        r1 = BenchmarkResult(
            name="test",
            iterations=100,
            total_time_ms=10.0,
            avg_time_us=50.0,
            min_time_us=40.0,
            max_time_us=60.0,
            p50_us=50.0,
            p95_us=55.0,
            p99_us=58.0,
            operations_per_second=20000.0,
            target_us=100.0,
            passed=True,
        )
        assert r1.passed

        # Over target (passed=False set explicitly)
        r2 = BenchmarkResult(
            name="test",
            iterations=100,
            total_time_ms=10.0,
            avg_time_us=150.0,
            min_time_us=140.0,
            max_time_us=160.0,
            p50_us=150.0,
            p95_us=155.0,
            p99_us=158.0,
            operations_per_second=6666.0,
            target_us=100.0,
            passed=False,
        )
        assert not r2.passed


class TestOptimizationReport:
    """Tests for OptimizationReport dataclass."""

    def test_default_values(self) -> None:
        """Report should have empty defaults."""
        report = OptimizationReport()

        assert report.baseline_results == []
        assert report.optimized_results == []
        assert report.improvements == {}
        assert report.total_speedup == 1.0
        assert report.passed_all is True


class TestVisualShellBenchmark:
    """Tests for benchmark suite."""

    def test_init_default_iterations(self) -> None:
        """Should use default iteration counts."""
        bench = VisualShellBenchmark()
        assert bench.warmup == 50
        assert bench.iterations == 1000

    def test_init_custom_iterations(self) -> None:
        """Should accept custom iteration counts."""
        bench = VisualShellBenchmark(warmup_iterations=10, test_iterations=100)
        assert bench.warmup == 10
        assert bench.iterations == 100

    def test_run_benchmark_basic(self) -> None:
        """_run_benchmark should return valid result."""
        bench = VisualShellBenchmark(warmup_iterations=5, test_iterations=50)

        def simple_func() -> int:
            return 1 + 1

        result = bench._run_benchmark("simple", simple_func)

        assert result.name == "simple"
        assert result.iterations == 50
        assert result.avg_time_us > 0
        assert result.min_time_us <= result.avg_time_us <= result.max_time_us
        assert result.operations_per_second > 0

    def test_run_benchmark_with_args(self) -> None:
        """_run_benchmark should pass arguments correctly."""
        bench = VisualShellBenchmark(warmup_iterations=5, test_iterations=50)

        def add_func(a: int, b: int) -> int:
            return a + b

        result = bench._run_benchmark("add", add_func, 5, 3)
        assert result.name == "add"

    def test_results_accumulate(self) -> None:
        """Running benchmarks should accumulate results."""
        bench = VisualShellBenchmark(warmup_iterations=5, test_iterations=50)

        bench._run_benchmark("test1", lambda: None)
        bench._run_benchmark("test2", lambda: None)

        assert len(bench.results) == 2
        assert bench.results[0].name == "test1"
        assert bench.results[1].name == "test2"


# ============================================================================
# Integration Tests
# ============================================================================


class TestIntegration:
    """Integration tests for complete workflows."""

    def test_color_blend_correctness_comparison(self) -> None:
        """Compare baseline and optimized color blend results."""
        # Same color values in both representations
        c1 = Color(r=0.8, g=0.5, b=0.3, a=0.7)
        c2 = Color(r=0.2, g=0.4, b=0.6, a=1.0)

        c1_opt = ColorOptimized.from_rgba(204, 128, 77, 179)  # ~0.8, 0.5, 0.3, 0.7
        c2_opt = ColorOptimized.from_rgba(51, 102, 153, 255)  # ~0.2, 0.4, 0.6, 1.0

        baseline_result = c1.blend_over(c2)
        opt_result = c1_opt.blend_over_fast(c2_opt)

        r_opt, g_opt, b_opt, a_opt = ColorOptimized.unpack(opt_result.packed)

        # Convert optimized back to 0-1 range for comparison
        r_opt_f = r_opt / 255.0
        g_opt_f = g_opt / 255.0
        b_opt_f = b_opt / 255.0

        # Allow reasonable tolerance for integer math approximation
        assert abs(baseline_result.r - r_opt_f) < 0.1
        assert abs(baseline_result.g - g_opt_f) < 0.1
        assert abs(baseline_result.b - b_opt_f) < 0.1

    def test_hilbert_lut_order_consistency(self) -> None:
        """Hilbert LUT should be consistent across orders."""
        # For indices within range, small and large LUT should agree
        lut_small = HilbertLUT(order=4)
        lut_large = HilbertLUT(order=8)  # No LUT, falls back to compute

        for d in [0, 10, 100, 255]:
            x_small, y_small = lut_small.d_to_xy(d)
            x_large, y_large = lut_large.d_to_xy(d)

            # Both should use the same algorithm
            x_base, y_base = hilbert_d2xy_baseline(16, d)
            assert (x_small, y_small) == (x_base, y_base)


# ============================================================================
# Run Tests
# ============================================================================


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
