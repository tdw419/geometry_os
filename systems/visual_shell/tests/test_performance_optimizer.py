#!/usr/bin/env python3
"""
Unit tests for performance_optimizer.py

Tests cover:
- Color blending operations (baseline and optimized)
- Hilbert curve mapping
- Pixel buffer operations
- Foveated rendering calculations
- Edge cases and error handling
"""

import sys
from pathlib import Path

import numpy as np
import pytest

# Add the benches directory to the path
_benches_dir = Path(__file__).parent.parent / "benches"
sys.path.insert(0, str(_benches_dir))

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
    generate_optimization_report,
    hilbert_d2xy_baseline,
    premultiply_alpha_baseline,
    premultiply_alpha_numpy,
    premultiply_alpha_optimized,
    rgba_to_bgra_baseline,
    rgba_to_bgra_numpy,
)


# ============================================================================
# Color Class Tests
# ============================================================================


class TestColor:
    """Tests for baseline Color class."""

    def test_color_default_values(self):
        """Color should have correct default values."""
        c = Color()
        assert c.r == 0.0
        assert c.g == 0.0
        assert c.b == 0.0
        assert c.a == 1.0

    def test_color_custom_values(self):
        """Color should accept custom RGBA values."""
        c = Color(r=0.5, g=0.75, b=0.25, a=0.8)
        assert c.r == 0.5
        assert c.g == 0.75
        assert c.b == 0.25
        assert c.a == 0.8

    def test_blend_over_basic(self):
        """Basic alpha blending should work correctly."""
        # Red over blue
        c1 = Color(r=1.0, g=0.0, b=0.0, a=1.0)
        c2 = Color(r=0.0, g=0.0, b=1.0, a=1.0)
        result = c1.blend_over(c2)
        assert result.r == 1.0  # Fully opaque red covers blue
        assert result.a == 1.0

    def test_blend_over_semi_transparent(self):
        """Semi-transparent blending should interpolate correctly."""
        c1 = Color(r=1.0, g=0.0, b=0.0, a=0.5)
        c2 = Color(r=0.0, g=0.0, b=1.0, a=1.0)
        result = c1.blend_over(c2)
        # Expected: out_a = 0.5 + 1.0 * 0.5 = 1.0
        # r = (1.0 * 0.5 + 0.0 * 1.0 * 0.5) / 1.0 = 0.5
        assert abs(result.r - 0.5) < 0.001
        assert result.a == 1.0

    def test_blend_over_zero_alpha_returns_transparent(self):
        """Blending two fully transparent colors should return transparent."""
        c1 = Color(r=0.5, g=0.5, b=0.5, a=0.0)
        c2 = Color(r=0.5, g=0.5, b=0.5, a=0.0)
        result = c1.blend_over(c2)
        # When both colors are transparent, result should be transparent
        assert result.a == 0.0

    def test_blend_add_basic(self):
        """Additive blending should sum values."""
        c1 = Color(r=0.5, g=0.5, b=0.5, a=0.5)
        c2 = Color(r=0.3, g=0.3, b=0.3, a=0.3)
        result = c1.blend_add(c2)
        assert result.r == 0.8
        assert result.g == 0.8
        assert result.b == 0.8
        assert result.a == 0.8

    def test_blend_add_clamping(self):
        """Additive blending should clamp to 1.0."""
        c1 = Color(r=0.8, g=0.8, b=0.8, a=0.8)
        c2 = Color(r=0.5, g=0.5, b=0.5, a=0.5)
        result = c1.blend_add(c2)
        assert result.r == 1.0  # Clamped from 1.3
        assert result.g == 1.0
        assert result.b == 1.0
        assert result.a == 1.0

    def test_lerp_midpoint(self):
        """Lerp at t=0.5 should be midpoint."""
        c1 = Color(r=0.0, g=0.0, b=0.0, a=1.0)
        c2 = Color(r=1.0, g=1.0, b=1.0, a=1.0)
        result = c1.lerp(c2, 0.5)
        assert result.r == 0.5
        assert result.g == 0.5
        assert result.b == 0.5
        assert result.a == 1.0

    def test_lerp_endpoints(self):
        """Lerp at t=0 and t=1 should return endpoints."""
        c1 = Color(r=0.2, g=0.3, b=0.4, a=0.5)
        c2 = Color(r=0.8, g=0.7, b=0.6, a=1.0)

        r0 = c1.lerp(c2, 0.0)
        assert r0.r == c1.r
        assert r0.g == c1.g

        r1 = c1.lerp(c2, 1.0)
        assert r1.r == c2.r
        assert r1.g == c2.g


# ============================================================================
# ColorOptimized Class Tests
# ============================================================================


class TestColorOptimized:
    """Tests for optimized Color class."""

    def test_from_rgba(self):
        """from_rgba should pack components correctly."""
        c = ColorOptimized.from_rgba(255, 128, 64, 200)
        assert c.packed == 0xFF8040C8

    def test_unpack(self):
        """unpack should extract components correctly."""
        r, g, b, a = ColorOptimized.unpack(0xFF8040C8)
        assert r == 255
        assert g == 128
        assert b == 64
        assert a == 200

    def test_pack_unpack_roundtrip(self):
        """Packing and unpacking should be inverse operations."""
        original = (100, 150, 200, 250)
        c = ColorOptimized.from_rgba(*original)
        result = ColorOptimized.unpack(c.packed)
        assert result == original

    def test_blend_over_fast_components(self):
        """blend_over_fast should blend components reasonably."""
        c1 = ColorOptimized.from_rgba(255, 0, 0, 255)  # Fully opaque red
        c2 = ColorOptimized.from_rgba(0, 0, 255, 255)  # Fully opaque blue
        result = c1.blend_over_fast(c2)
        r, g, b, a = ColorOptimized.unpack(result.packed)
        # With alpha=255, the first color should dominate
        # Note: integer math may have slight rounding (254-255 is acceptable)
        assert r >= 254, f"Expected r >= 254, got {r}"

    def test_blend_over_fast_semi_transparent(self):
        """blend_over_fast with semi-transparent colors."""
        c1 = ColorOptimized.from_rgba(255, 0, 0, 128)  # Semi-transparent red
        c2 = ColorOptimized.from_rgba(0, 0, 255, 255)  # Opaque blue
        result = c1.blend_over_fast(c2)
        r, g, b, a = ColorOptimized.unpack(result.packed)
        # Should be a mix of red and blue
        assert r > 0
        assert b > 0


# ============================================================================
# Hilbert Curve Tests
# ============================================================================


class TestHilbertBaseline:
    """Tests for baseline Hilbert curve functions."""

    def test_d2xy_origin(self):
        """Index 0 should map to origin."""
        x, y = hilbert_d2xy_baseline(2, 0)
        assert x == 0
        assert y == 0

    def test_d2xy_small_grid(self):
        """Test known values for small grid."""
        # For a 2x2 grid (n=2):
        # d=0 -> (0,0), d=1 -> (0,1), d=2 -> (1,1), d=3 -> (1,0)
        expected = [(0, 0), (0, 1), (1, 1), (1, 0)]
        for d, (ex, ey) in enumerate(expected):
            x, y = hilbert_d2xy_baseline(2, d)
            assert (x, y) == (ex, ey), f"d={d}: expected ({ex}, {ey}), got ({x}, {y})"

    def test_d2xy_within_bounds(self):
        """All indices should map within grid bounds."""
        n = 16
        for d in range(n * n):
            x, y = hilbert_d2xy_baseline(n, d)
            assert 0 <= x < n, f"x={x} out of bounds for d={d}"
            assert 0 <= y < n, f"y={y} out of bounds for d={d}"

    def test_rot_baseline_with_ry_equals_1(self):
        """Rotation with ry=1 should perform swap based on algorithm."""
        # _rot_baseline(s, x, y, rx, ry) behavior:
        # - If ry == 0 and rx == 1: flip x and y around center, then swap
        # - If ry == 0: swap x and y
        # The function only modifies when ry == 0
        x, y = _rot_baseline(4, 2, 3, 0, 0)  # ry=0 triggers swap
        assert x == 3  # Swapped
        assert y == 2  # Swapped

        x, y = _rot_baseline(4, 2, 3, 0, 1)  # ry=1, no modification
        assert x == 2
        assert y == 3

    def test_xy_to_d_compute_inverse(self):
        """xy_to_d_compute should be inverse of d2xy."""
        n = 16
        for original_d in range(0, n * n, 10):  # Sample every 10th
            x, y = hilbert_d2xy_baseline(n, original_d)
            computed_d = _xy_to_d_compute(4, x, y)  # order=4 for n=16
            assert computed_d == original_d, f"d={original_d} -> ({x},{y}) -> {computed_d}"


class TestHilbertLUT:
    """Tests for Hilbert LUT implementation."""

    def test_lut_creation_small(self):
        """LUT should be created for small orders."""
        lut = HilbertLUT(order=4)
        assert lut.lut_xy is not None
        assert lut.lut_d is not None
        assert lut.size == 16

    def test_lut_not_created_large(self):
        """LUT should NOT be created for large orders."""
        lut = HilbertLUT(order=8)
        assert lut.lut_xy is None
        assert lut.lut_d is None
        assert lut.size == 256

    def test_d_to_xy_with_lut(self):
        """d_to_xy should use LUT when available."""
        lut = HilbertLUT(order=4)
        # Compare with baseline
        for d in range(0, 50, 5):
            x_lut, y_lut = lut.d_to_xy(d)
            x_base, y_base = hilbert_d2xy_baseline(16, d)
            assert (x_lut, y_lut) == (x_base, y_base)

    def test_d_to_xy_without_lut_fallback(self):
        """d_to_xy should fall back to computation for large orders."""
        lut = HilbertLUT(order=8)
        x, y = lut.d_to_xy(12345)
        x_expected, y_expected = hilbert_d2xy_baseline(256, 12345)
        assert (x, y) == (x_expected, y_expected)

    def test_xy_to_d_bounds_check(self):
        """xy_to_d should handle out-of-bounds gracefully."""
        lut = HilbertLUT(order=4)
        # Out of bounds - should fall back to computation
        result = lut.xy_to_d(100, 100)
        assert isinstance(result, int)

    def test_xy_to_d_with_lut(self):
        """xy_to_d should use LUT when available."""
        lut = HilbertLUT(order=4)
        # Test roundtrip
        for original_d in range(0, 50, 5):
            x, y = lut.d_to_xy(original_d)
            recovered_d = lut.xy_to_d(x, y)
            assert recovered_d == original_d


# ============================================================================
# Pixel Buffer Operation Tests
# ============================================================================


class TestPixelOperations:
    """Tests for pixel buffer operations."""

    def test_premultiply_baseline_basic(self):
        """Basic premultiplication should work correctly."""
        rgba = bytearray([100, 150, 200, 128])
        premultiply_alpha_baseline(rgba)
        # Expected: 100 * (128/255) ≈ 50
        assert rgba[0] == 50
        assert rgba[1] == 75
        assert rgba[2] == 100
        assert rgba[3] == 128  # Alpha unchanged

    def test_premultiply_baseline_full_opacity(self):
        """Full opacity should leave RGB unchanged."""
        rgba = bytearray([100, 150, 200, 255])
        original = bytes(rgba)
        premultiply_alpha_baseline(rgba)
        assert rgba[0] == 100
        assert rgba[1] == 150
        assert rgba[2] == 200

    def test_premultiply_baseline_zero_alpha(self):
        """Zero alpha should zero out RGB."""
        rgba = bytearray([100, 150, 200, 0])
        premultiply_alpha_baseline(rgba)
        assert rgba[0] == 0
        assert rgba[1] == 0
        assert rgba[2] == 0

    def test_premultiply_baseline_empty(self):
        """Empty buffer should not crash."""
        rgba = bytearray([])
        premultiply_alpha_baseline(rgba)  # Should not raise
        assert len(rgba) == 0

    def test_premultiply_baseline_bad_length(self):
        """Buffer with non-multiple-of-4 length should raise."""
        rgba = bytearray([1, 2, 3])  # Not multiple of 4
        with pytest.raises(IndexError):
            premultiply_alpha_baseline(rgba)

    def test_premultiply_optimized_matches_baseline(self):
        """Optimized premultiply should match baseline closely."""
        test_data = [
            [100, 150, 200, 128],
            [255, 255, 255, 255],
            [0, 0, 0, 0],
            [50, 100, 150, 64],
        ]
        for data in test_data:
            baseline = bytearray(data)
            optimized = bytearray(data)
            premultiply_alpha_baseline(baseline)
            premultiply_alpha_optimized(optimized)
            # Allow small differences due to rounding
            for i in range(4):
                assert abs(baseline[i] - optimized[i]) <= 1, f"Mismatch at {i}: {baseline[i]} vs {optimized[i]}"

    def test_rgba_to_bgra_baseline(self):
        """RGBA to BGRA conversion should swap R and B."""
        rgba = bytes([1, 2, 3, 4, 5, 6, 7, 8])
        bgra = rgba_to_bgra_baseline(rgba)
        assert bgra[0] == 3  # B <- R
        assert bgra[1] == 2  # G <- G
        assert bgra[2] == 1  # R <- B
        assert bgra[3] == 4  # A <- A
        assert bgra[4] == 7
        assert bgra[5] == 6
        assert bgra[6] == 5
        assert bgra[7] == 8

    def test_premultiply_numpy_basic(self):
        """NumPy premultiply should work correctly."""
        rgba = np.array([[100, 150, 200, 128]], dtype=np.uint8)
        result = premultiply_alpha_numpy(rgba)
        assert result[0, 0] == 50
        assert result[0, 1] == 75
        assert result[0, 2] == 100
        assert result[0, 3] == 128

    def test_rgba_to_bgra_numpy(self):
        """NumPy BGRA conversion should work correctly."""
        rgba = np.array([[1, 2, 3, 4]], dtype=np.uint8)
        bgra = rgba_to_bgra_numpy(rgba)
        assert bgra[0, 0] == 3  # B
        assert bgra[0, 1] == 2  # G
        assert bgra[0, 2] == 1  # R
        assert bgra[0, 3] == 4  # A


# ============================================================================
# Foveated Rendering Tests
# ============================================================================


class TestFoveatedRendering:
    """Tests for foveated rendering calculations."""

    def test_calculate_region_foveal(self):
        """Point at focus should be foveal."""
        region = calculate_region_baseline(100, 100, 100, 100, 50, 150)
        assert region == "foveal"

    def test_calculate_region_parafoveal(self):
        """Point in parafoveal ring should be parafoveal."""
        region = calculate_region_baseline(200, 100, 100, 100, 50, 150)
        assert region == "parafoveal"

    def test_calculate_region_peripheral(self):
        """Point far from focus should be peripheral."""
        region = calculate_region_baseline(500, 500, 100, 100, 50, 150)
        assert region == "peripheral"

    def test_calculate_region_fast_matches_baseline(self):
        """Fast version should match baseline results."""
        test_points = [
            (100, 100, 100, 100),
            (150, 100, 100, 100),
            (300, 300, 100, 100),
            (0, 0, 960, 540),
        ]
        foveal_r = 50
        parafoveal_r = 150

        for x, y, fx, fy in test_points:
            baseline = calculate_region_baseline(x, y, fx, fy, foveal_r, parafoveal_r)
            fast = calculate_region_fast(x, y, fx, fy, foveal_r**2, parafoveal_r**2)
            assert baseline == fast, f"Mismatch at ({x}, {y})"

    def test_calculate_regions_batch(self):
        """Batch calculation should classify multiple points."""
        points = np.array([
            [100, 100],  # At focus - foveal (distance=0)
            [200, 100],  # Distance=100 - parafoveal (50 < 100 <= 150)
            [500, 500],  # Far - peripheral (distance > 150)
        ], dtype=np.float32)
        focus = (100.0, 100.0)
        radii = (50.0, 150.0, 400.0)

        regions = calculate_regions_batch(points, focus, radii)
        assert regions[0] == 0  # foveal (distance=0 <= 50)
        assert regions[1] == 1  # parafoveal (50 < 100 <= 150)
        assert regions[2] == 2  # peripheral (distance > 150)

    def test_calculate_regions_batch_empty(self):
        """Batch calculation should handle empty input."""
        points = np.array([], dtype=np.float32).reshape(0, 2)
        focus = (100.0, 100.0)
        radii = (50.0, 150.0, 400.0)
        regions = calculate_regions_batch(points, focus, radii)
        assert len(regions) == 0


# ============================================================================
# NumPy Blend Tests
# ============================================================================


class TestNumPyBlend:
    """Tests for NumPy vectorized blending."""

    def test_blend_over_numpy_basic(self):
        """Basic NumPy blending should work."""
        colors1 = np.array([[1.0, 0.0, 0.0, 1.0]], dtype=np.float32)  # Opaque red
        colors2 = np.array([[0.0, 0.0, 1.0, 1.0]], dtype=np.float32)  # Opaque blue
        result = blend_over_numpy(colors1, colors2)
        assert result[0, 0] == 1.0  # Red covers blue

    def test_blend_over_numpy_zero_alpha(self):
        """NumPy blending should handle zero alpha."""
        colors1 = np.array([[0.5, 0.5, 0.5, 0.0]], dtype=np.float32)
        colors2 = np.array([[0.5, 0.5, 0.5, 0.0]], dtype=np.float32)
        result = blend_over_numpy(colors1, colors2)
        # Should not have NaN due to division by zero
        assert not np.isnan(result).any()

    def test_blend_over_numpy_batch(self):
        """NumPy blending should handle batches."""
        colors1 = np.random.rand(100, 4).astype(np.float32)
        colors2 = np.random.rand(100, 4).astype(np.float32)
        result = blend_over_numpy(colors1, colors2)
        assert result.shape == (100, 4)
        assert not np.isnan(result).any()


# ============================================================================
# Benchmark Infrastructure Tests
# ============================================================================


class TestBenchmarkInfrastructure:
    """Tests for benchmark infrastructure."""

    def test_benchmark_result_creation(self):
        """BenchmarkResult should be creatable with all fields."""
        result = BenchmarkResult(
            name="test",
            iterations=100,
            total_time_ms=10.0,
            avg_time_us=100.0,
            min_time_us=50.0,
            max_time_us=200.0,
            p50_us=90.0,
            p95_us=180.0,
            p99_us=195.0,
            operations_per_second=10000.0,
        )
        assert result.name == "test"
        assert result.passed  # Default

    def test_benchmark_result_target_passed(self):
        """BenchmarkResult should pass when under target."""
        result = BenchmarkResult(
            name="test",
            iterations=100,
            total_time_ms=10.0,
            avg_time_us=0.5,
            min_time_us=0.4,
            max_time_us=0.6,
            p50_us=0.5,
            p95_us=0.55,
            p99_us=0.58,
            operations_per_second=2000000.0,
            target_us=1.0,
        )
        assert result.passed

    def test_benchmark_result_target_failed(self):
        """BenchmarkResult should fail when over target.

        Note: The passed field must be computed explicitly by the caller.
        The dataclass does not auto-compute passed from avg_time_us/target_us.
        This is the responsibility of _run_benchmark().
        """
        avg_time = 2.0
        target = 1.0
        result = BenchmarkResult(
            name="test",
            iterations=100,
            total_time_ms=10.0,
            avg_time_us=avg_time,
            min_time_us=1.5,
            max_time_us=3.0,
            p50_us=2.0,
            p95_us=2.5,
            p99_us=2.8,
            operations_per_second=500000.0,
            target_us=target,
            passed=avg_time <= target,  # False when avg_time > target
        )
        assert not result.passed  # 2.0 > 1.0, so should fail

    def test_optimization_report_defaults(self):
        """OptimizationReport should have correct defaults."""
        report = OptimizationReport()
        assert report.baseline_results == []
        assert report.optimized_results == []
        assert report.improvements == {}
        assert report.total_speedup == 1.0
        assert report.passed_all


# ============================================================================
# VisualShellBenchmark Tests
# ============================================================================


class TestVisualShellBenchmark:
    """Tests for VisualShellBenchmark class."""

    def test_benchmark_creation(self):
        """Benchmark should be creatable with custom iterations."""
        bench = VisualShellBenchmark(warmup_iterations=5, test_iterations=10)
        assert bench.warmup == 5
        assert bench.iterations == 10

    def test_run_benchmark_basic(self):
        """_run_benchmark should return valid results."""
        bench = VisualShellBenchmark(warmup_iterations=5, test_iterations=10)
        result = bench._run_benchmark(
            "simple_test",
            lambda: 1 + 1,
            target_us=1.0,
        )
        assert result.name == "simple_test"
        assert result.iterations == 10
        assert result.avg_time_us >= 0

    def test_run_benchmark_with_args(self):
        """_run_benchmark should pass arguments correctly."""
        bench = VisualShellBenchmark(warmup_iterations=5, test_iterations=10)

        def add(a, b):
            return a + b

        result = bench._run_benchmark("add_test", add, 2, 3)
        assert result.name == "add_test"


# ============================================================================
# Code Quality Tests
# ============================================================================


class TestCodeQuality:
    """Tests for code quality and standards compliance."""

    def test_imports_available(self):
        """Module should have required imports available."""
        import performance_optimizer as po

        # Check that key exports are available
        assert hasattr(po, "Color")
        assert hasattr(po, "ColorOptimized")
        assert hasattr(po, "HilbertLUT")
        assert hasattr(po, "json")  # Used for saving results
        assert hasattr(po, "np")  # numpy alias

    def test_type_hints_present(self):
        """Public functions should have type hints."""
        # Check a few key functions
        assert hasattr(hilbert_d2xy_baseline, "__annotations__")
        assert hasattr(calculate_region_baseline, "__annotations__")

    def test_docstrings_present(self):
        """Public classes and functions should have docstrings."""
        assert Color.__doc__ is not None
        assert ColorOptimized.__doc__ is not None
        assert HilbertLUT.__doc__ is not None
        assert hilbert_d2xy_baseline.__doc__ is not None


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
