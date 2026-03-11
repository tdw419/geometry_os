#!/usr/bin/env python3
"""
Performance Comparison Benchmark for Native Glyph Shell

Compares baseline implementations against optimized v2 versions.
"""

import json
import sys
import time
from dataclasses import dataclass, asdict
from pathlib import Path

import numpy as np

# Add native directory to path
sys.path.insert(0, str(Path(__file__).parent.parent / "native"))

# Import optimized v2 module
try:
    from optimized_glyph_ops_v2 import (
        blend_colors_packed,
        blend_colors_batch_packed,
        hilbert_d2xy_fast,
        HilbertCurveV2,
        premultiply_alpha_2d,
        premultiply_alpha_inplace_numba,
        classify_regions_numba,
        FoveatedRendererV2,
        rgba_to_bgra_inplace_numba,
    )
    HAS_NUMBA = True
except ImportError as e:
    print(f"Warning: Could not import Numba-optimized module: {e}")
    HAS_NUMBA = False


@dataclass
class BenchmarkResult:
    """Result of a single benchmark run."""
    name: str
    baseline_us: float
    optimized_us: float
    speedup: float
    target_us: float | None = None
    passed: bool = True


# ============================================================================
# Baseline Implementations (for comparison)
# ============================================================================

@dataclass
class Color:
    """RGBA color - baseline implementation."""
    r: float = 0.0
    g: float = 0.0
    b: float = 0.0
    a: float = 1.0

    def blend_over(self, other: "Color") -> "Color":
        """Alpha blend this color over another."""
        out_a = self.a + other.a * (1.0 - self.a)
        if out_a == 0.0:
            return Color(a=0.0)
        return Color(
            r=(self.r * self.a + other.r * other.a * (1.0 - self.a)) / out_a,
            g=(self.g * self.a + other.g * other.a * (1.0 - self.a)) / out_a,
            b=(self.b * self.a + other.b * other.a * (1.0 - self.a)) / out_a,
            a=out_a,
        )


def hilbert_d2xy_baseline(n: int, d: int) -> tuple[int, int]:
    """Convert Hilbert index to (x, y) - baseline implementation."""
    x = y = 0
    s = 1
    while s < n:
        rx = 1 & (d // 2)
        ry = 1 & (d ^ rx)
        x, y = _rot_baseline(s, x, y, rx, ry)
        x += s * rx
        y += s * ry
        d //= 4
        s *= 2
    return x, y


def _rot_baseline(n: int, x: int, y: int, rx: int, ry: int) -> tuple[int, int]:
    if ry == 0:
        if rx == 1:
            x = n - 1 - x
            y = n - 1 - y
        x, y = y, x
    return x, y


def premultiply_alpha_baseline(rgba: bytearray) -> None:
    """Premultiply alpha - baseline (in-place)."""
    for i in range(0, len(rgba), 4):
        a = rgba[i + 3] / 255.0
        rgba[i] = int(rgba[i] * a)
        rgba[i + 1] = int(rgba[i + 1] * a)
        rgba[i + 2] = int(rgba[i + 2] * a)


def premultiply_alpha_numpy(rgba: np.ndarray) -> np.ndarray:
    """Premultiply alpha using NumPy vectorization."""
    a = rgba[:, 3:4].astype(np.float32) / 255.0
    result = rgba.copy()
    result[:, :3] = (result[:, :3].astype(np.float32) * a).astype(np.uint8)
    return result


def classify_region_baseline(x: float, y: float, fx: float, fy: float, 
                             foveal_r: float, parafoveal_r: float) -> str:
    """Determine visual region - baseline."""
    dist = ((x - fx) ** 2 + (y - fy) ** 2) ** 0.5
    if dist <= foveal_r:
        return "foveal"
    elif dist <= parafoveal_r:
        return "parafoveal"
    return "peripheral"


def classify_regions_numpy(points: np.ndarray, focus: tuple[float, float], 
                          foveal_r: float, parafoveal_r: float) -> np.ndarray:
    """Calculate regions for batch of points using NumPy."""
    fx, fy = focus
    dx = points[:, 0] - fx
    dy = points[:, 1] - fy
    dist_sq = dx * dx + dy * dy
    regions = np.full(len(points), 2, dtype=np.uint8)
    regions[dist_sq <= parafoveal_r**2] = 1
    regions[dist_sq <= foveal_r**2] = 0
    return regions


# ============================================================================
# Benchmark Suite
# ============================================================================

class ComparisonBenchmark:
    """Benchmark suite comparing baseline vs optimized implementations."""

    def __init__(self, warmup: int = 10, iterations: int = 1000):
        self.warmup = warmup
        self.iterations = iterations
        self.results: list[BenchmarkResult] = []

    def _measure(self, func, *args) -> float:
        """Measure function execution time in microseconds."""
        # Warmup
        for _ in range(self.warmup):
            func(*args)

        # Benchmark
        times = []
        for _ in range(self.iterations):
            start = time.perf_counter_ns()
            func(*args)
            end = time.perf_counter_ns()
            times.append((end - start) / 1000)

        return sum(times) / len(times)

    def benchmark_color_blend(self):
        """Benchmark color blending operations."""
        print("\n[1/6] Color Blending...")

        # Baseline: Python objects
        c1 = Color(0.8, 0.5, 0.3, 0.7)
        c2 = Color(0.2, 0.4, 0.6, 1.0)
        baseline_time = self._measure(lambda: c1.blend_over(c2))

        if HAS_NUMBA:
            # Optimized: Numba packed integer
            fg = np.uint32(0xCC804DB3)  # Packed RGBA
            bg = np.uint32(0x336699FF)
            optimized_time = self._measure(lambda: blend_colors_packed(fg, bg))
        else:
            optimized_time = baseline_time

        speedup = baseline_time / optimized_time if optimized_time > 0 else 1.0
        self.results.append(BenchmarkResult(
            name="color_blend_single",
            baseline_us=baseline_time,
            optimized_us=optimized_time,
            speedup=speedup,
            target_us=0.5,
            passed=optimized_time <= 0.5,
        ))

        # Batch blending
        n = 10000
        colors1_np = np.random.rand(n, 4).astype(np.float32)
        colors2_np = np.random.rand(n, 4).astype(np.float32)
        
        # Baseline: NumPy vectorized
        baseline_batch = self._measure(
            lambda: ((lambda c1, c2: (
                c1[:, :3] * c1[:, 3:4] + c2[:, :3] * c2[:, 3:4] * (1 - c1[:, 3:4])
            ))(colors1_np.copy(), colors2_np.copy()))
        )

        if HAS_NUMBA:
            # Optimized: Numba parallel
            fg_batch = np.random.randint(0, 0xFFFFFFFF, n, dtype=np.uint32)
            bg_batch = np.random.randint(0, 0xFFFFFFFF, n, dtype=np.uint32)
            out_batch = np.zeros(n, dtype=np.uint32)
            optimized_batch = self._measure(
                lambda: blend_colors_batch_packed(fg_batch, bg_batch, out_batch)
            )
        else:
            optimized_batch = baseline_batch

        speedup = baseline_batch / optimized_batch if optimized_batch > 0 else 1.0
        self.results.append(BenchmarkResult(
            name="color_blend_batch_10k",
            baseline_us=baseline_batch,
            optimized_us=optimized_batch,
            speedup=speedup,
            target_us=100.0,
            passed=optimized_batch <= 100.0,
        ))

    def benchmark_hilbert(self):
        """Benchmark Hilbert curve operations."""
        print("[2/6] Hilbert Curve Mapping...")

        # Baseline: Pure Python
        baseline_time = self._measure(lambda: hilbert_d2xy_baseline(256, 12345))

        if HAS_NUMBA:
            # Optimized: Numba JIT
            optimized_time = self._measure(lambda: hilbert_d2xy_fast(256, 12345))
        else:
            optimized_time = baseline_time

        speedup = baseline_time / optimized_time if optimized_time > 0 else 1.0
        self.results.append(BenchmarkResult(
            name="hilbert_d2xy_single",
            baseline_us=baseline_time,
            optimized_us=optimized_time,
            speedup=speedup,
            target_us=0.5,
            passed=optimized_time <= 0.5,
        ))

        # LUT lookup
        if HAS_NUMBA:
            curve = HilbertCurveV2(order=8)
            lut_time = self._measure(lambda: curve.d_to_xy(12345))
            
            self.results.append(BenchmarkResult(
                name="hilbert_d2xy_lut",
                baseline_us=baseline_time,  # Compare to non-LUT baseline
                optimized_us=lut_time,
                speedup=baseline_time / lut_time if lut_time > 0 else 1.0,
                target_us=0.1,
                passed=lut_time <= 0.1,
            ))

    def benchmark_premultiply(self):
        """Benchmark alpha premultiplication."""
        print("[3/6] Alpha Premultiplication...")

        # Setup: 256x256 pixel buffer
        size = 256 * 256
        rgba_flat = bytearray(np.random.randint(0, 256, size * 4, dtype=np.uint8))
        rgba_2d = np.random.randint(0, 256, (size, 4), dtype=np.uint8)

        # Baseline: Python loop on bytearray
        baseline_time = self._measure(
            lambda: premultiply_alpha_baseline(bytearray(rgba_flat))
        )

        # NumPy baseline
        numpy_time = self._measure(lambda: premultiply_alpha_numpy(rgba_2d.copy()))

        if HAS_NUMBA:
            # Optimized: Numba parallel
            optimized_time = self._measure(lambda: premultiply_alpha_2d(rgba_2d.copy()))
        else:
            optimized_time = numpy_time

        self.results.append(BenchmarkResult(
            name="premultiply_python",
            baseline_us=baseline_time,
            optimized_us=baseline_time,  # No optimization for this
            speedup=1.0,
            target_us=5000.0,
            passed=False,  # Always fail to show need for NumPy/Numba
        ))

        self.results.append(BenchmarkResult(
            name="premultiply_numpy",
            baseline_us=baseline_time,
            optimized_us=numpy_time,
            speedup=baseline_time / numpy_time if numpy_time > 0 else 1.0,
            target_us=1000.0,
            passed=numpy_time <= 1000.0,
        ))

        if HAS_NUMBA:
            self.results.append(BenchmarkResult(
                name="premultiply_numba",
                baseline_us=baseline_time,
                optimized_us=optimized_time,
                speedup=baseline_time / optimized_time if optimized_time > 0 else 1.0,
                target_us=500.0,
                passed=optimized_time <= 500.0,
            ))

    def benchmark_foveated(self):
        """Benchmark foveated rendering."""
        print("[4/6] Foveated Rendering...")

        # Single point classification
        baseline_time = self._measure(
            lambda: classify_region_baseline(500, 500, 960, 540, 50, 150)
        )

        if HAS_NUMBA:
            # The Numba version for single points has overhead, use fast math
            fx, fy = 960.0, 540.0
            foveal_r_sq = 50.0 ** 2
            parafoveal_r_sq = 150.0 ** 2
            
            # Single point is actually slower with Numba due to call overhead
            # So we compare batch operations instead
            optimized_time = baseline_time
        else:
            optimized_time = baseline_time

        self.results.append(BenchmarkResult(
            name="region_single",
            baseline_us=baseline_time,
            optimized_us=optimized_time,
            speedup=1.0,
            target_us=0.5,
            passed=baseline_time <= 0.5,
        ))

        # Batch classification
        n = 10000
        points = np.random.rand(n, 2).astype(np.float32) * 1920
        
        # NumPy baseline
        numpy_time = self._measure(
            lambda: classify_regions_numpy(points, (960.0, 540.0), 50.0, 150.0)
        )

        if HAS_NUMBA:
            # Numba optimized
            optimized_batch = self._measure(
                lambda: classify_regions_numba(
                    points, np.float32(960.0), np.float32(540.0),
                    np.float32(50.0**2), np.float32(150.0**2)
                )
            )
        else:
            optimized_batch = numpy_time

        self.results.append(BenchmarkResult(
            name="region_batch_10k",
            baseline_us=numpy_time,
            optimized_us=optimized_batch,
            speedup=numpy_time / optimized_batch if optimized_batch > 0 else 1.0,
            target_us=50.0,
            passed=optimized_batch <= 50.0,
        ))

    def benchmark_rgba_bgra(self):
        """Benchmark RGBA to BGRA conversion."""
        print("[5/6] RGBA/BGRA Conversion...")

        n = 256 * 256
        rgba = np.random.randint(0, 256, (n, 4), dtype=np.uint8)

        # NumPy baseline
        def numpy_swap():
            result = rgba.copy()
            result[:, 0], result[:, 2] = rgba[:, 2].copy(), rgba[:, 0].copy()
            return result

        numpy_time = self._measure(numpy_swap)

        if HAS_NUMBA:
            # Numba in-place
            def numba_swap():
                arr = rgba.copy()
                rgba_to_bgra_inplace_numba(arr)
                return arr

            optimized_time = self._measure(numba_swap)
        else:
            optimized_time = numpy_time

        self.results.append(BenchmarkResult(
            name="rgba_to_bgra_64k",
            baseline_us=numpy_time,
            optimized_us=optimized_time,
            speedup=numpy_time / optimized_time if optimized_time > 0 else 1.0,
            target_us=200.0,
            passed=optimized_time <= 200.0,
        ))

    def benchmark_end_to_end(self):
        """Benchmark end-to-end glyph rendering pipeline."""
        print("[6/6] End-to-End Pipeline...")

        # Simulate rendering a terminal cell
        # Steps: Hilbert lookup -> color blend -> premultiply -> output

        # Baseline: Pure Python / basic NumPy
        def baseline_pipeline():
            # Simulate 100 cell renders
            for i in range(100):
                # 1. Get position from Hilbert curve
                x, y = hilbert_d2xy_baseline(256, i)
                # 2. Blend colors
                c1 = Color(0.8, 0.5, 0.3, 0.7)
                c2 = Color(0.2, 0.4, 0.6, 1.0)
                result = c1.blend_over(c2)
            return result

        baseline_time = self._measure(baseline_pipeline)

        if HAS_NUMBA:
            def optimized_pipeline():
                # Simulate 100 cell renders
                fg = np.uint32(0xCC804DB3)
                bg = np.uint32(0x336699FF)
                for i in range(100):
                    # 1. Get position from Hilbert curve
                    x, y = hilbert_d2xy_fast(256, i)
                    # 2. Blend colors
                    result = blend_colors_packed(fg, bg)
                return result

            optimized_time = self._measure(optimized_pipeline)
        else:
            optimized_time = baseline_time

        self.results.append(BenchmarkResult(
            name="pipeline_100_cells",
            baseline_us=baseline_time,
            optimized_us=optimized_time,
            speedup=baseline_time / optimized_time if optimized_time > 0 else 1.0,
            target_us=200.0,
            passed=optimized_time <= 200.0,
        ))

    def run_all(self) -> dict:
        """Run all benchmarks and return results dict."""
        print("=" * 60)
        print("NATIVE GLYPH SHELL - PERFORMANCE COMPARISON")
        print(f"Numba Acceleration: {'✅ Enabled' if HAS_NUMBA else '❌ Disabled'}")
        print("=" * 60)

        self.benchmark_color_blend()
        self.benchmark_hilbert()
        self.benchmark_premultiply()
        self.benchmark_foveated()
        self.benchmark_rgba_bgra()
        self.benchmark_end_to_end()

        return self._to_dict()

    def _to_dict(self) -> dict:
        """Convert results to dictionary."""
        return {
            "timestamp": time.time(),
            "numba_enabled": HAS_NUMBA,
            "results": [asdict(r) for r in self.results],
        }

    def print_results(self):
        """Print benchmark results in a formatted table."""
        print("\n" + "=" * 100)
        print("PERFORMANCE COMPARISON RESULTS")
        print("=" * 100)
        print(f"{'Benchmark':<30} {'Baseline (µs)':<15} {'Optimized (µs)':<15} {'Speedup':<10} {'Target':<10} {'Status'}")
        print("-" * 100)

        for r in self.results:
            target_str = f"{r.target_us:.1f}" if r.target_us else "N/A"
            status = "✅ PASS" if r.passed else "❌ FAIL"
            speedup_str = f"{r.speedup:.1f}x"
            print(f"{r.name:<30} {r.baseline_us:<15.2f} {r.optimized_us:<15.2f} {speedup_str:<10} {target_str:<10} {status}")

        print("-" * 100)
        passed = sum(1 for r in self.results if r.passed)
        print(f"\nSummary: {passed}/{len(self.results)} benchmarks passed targets")

        if HAS_NUMBA:
            avg_speedup = sum(r.speedup for r in self.results) / len(self.results)
            print(f"Average speedup: {avg_speedup:.1f}x")


def main():
    """Run the comparison benchmark."""
    print("\n" + "█" * 60)
    print("█  NATIVE GLYPH SHELL - PERFORMANCE ANALYSIS v2       █")
    print("█" * 60 + "\n")

    # Run comparison benchmarks
    bench = ComparisonBenchmark(warmup=10, iterations=1000)
    results = bench.run_all()
    bench.print_results()

    # Save results
    output_dir = Path(__file__).parent / "results"
    output_dir.mkdir(exist_ok=True)
    output_file = output_dir / f"comparison_{int(time.time())}.json"
    with open(output_file, "w") as f:
        json.dump(results, f, indent=2)

    print(f"\n📊 Results saved to: {output_file}")

    return bench.results


if __name__ == "__main__":
    main()
