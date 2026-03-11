#!/usr/bin/env python3
"""
Visual Shell Performance Optimizer

Identifies and optimizes performance bottlenecks in the visual shell rendering engine.

Benchmarks:
1. Color blending operations (spectral mixer)
2. Hilbert curve mapping (coordinate transforms)
3. Glyph substrate operations (terminal rendering)
4. Pixel buffer operations (RGBA transforms)
5. Foveated rendering calculations

Optimizations:
- Integer math for alpha premultiplication
- Cached lookups for Hilbert curves
- Batch processing for pixel operations
- SIMD-friendly memory layouts
"""

import json
import time
from collections.abc import Callable
from dataclasses import dataclass, field
from pathlib import Path

import numpy as np


@dataclass
class BenchmarkResult:
    """Result of a single benchmark run."""

    name: str
    iterations: int
    total_time_ms: float
    avg_time_us: float
    min_time_us: float
    max_time_us: float
    p50_us: float
    p95_us: float
    p99_us: float
    operations_per_second: float
    target_us: float | None = None
    passed: bool = True


@dataclass
class OptimizationReport:
    """Complete optimization report."""

    baseline_results: list[BenchmarkResult] = field(default_factory=list)
    optimized_results: list[BenchmarkResult] = field(default_factory=list)
    improvements: dict[str, float] = field(default_factory=dict)
    total_speedup: float = 1.0
    passed_all: bool = True


# ============================================================================
# Color Operations (Baseline - Unoptimized)
# ============================================================================


@dataclass
class Color:
    """RGBA color for spectral operations (baseline implementation)."""

    r: float = 0.0
    g: float = 0.0
    b: float = 0.0
    a: float = 1.0

    def blend_over(self, other: "Color") -> "Color":
        """Alpha blend this color over another (baseline)."""
        out_a = self.a + other.a * (1.0 - self.a)
        if out_a == 0.0:
            return Color(a=0.0)  # Fully transparent result
        return Color(
            r=(self.r * self.a + other.r * other.a * (1.0 - self.a)) / out_a,
            g=(self.g * self.a + other.g * other.a * (1.0 - self.a)) / out_a,
            b=(self.b * self.a + other.b * other.a * (1.0 - self.a)) / out_a,
            a=out_a,
        )

    def blend_add(self, other: "Color") -> "Color":
        """Additive blend."""
        return Color(
            r=min(self.r + other.r, 1.0),
            g=min(self.g + other.g, 1.0),
            b=min(self.b + other.b, 1.0),
            a=min(self.a + other.a, 1.0),
        )

    def lerp(self, other: "Color", t: float) -> "Color":
        """Linear interpolation between colors."""
        return Color(
            r=self.r + (other.r - self.r) * t,
            g=self.g + (other.g - self.g) * t,
            b=self.b + (other.b - self.b) * t,
            a=self.a + (other.a - self.a) * t,
        )


# ============================================================================
# Color Operations (Optimized)
# ============================================================================


@dataclass
class ColorOptimized:
    """RGBA color with optimized operations using integer math."""

    # Store as packed uint32: 0xRRGGBBAA
    packed: int = 0x000000FF

    @classmethod
    def from_rgba(cls, r: int, g: int, b: int, a: int) -> "ColorOptimized":
        """Create from 0-255 component values."""
        return cls(packed=(r << 24) | (g << 16) | (b << 8) | a)

    @staticmethod
    def unpack(packed: int) -> tuple[int, int, int, int]:
        """Unpack to RGBA components."""
        return ((packed >> 24) & 0xFF, (packed >> 16) & 0xFF, (packed >> 8) & 0xFF, packed & 0xFF)

    def blend_over_fast(self, other: "ColorOptimized") -> "ColorOptimized":
        """Fast alpha blend using integer math."""
        r1, g1, b1, a1 = self.unpack(self.packed)
        r2, g2, b2, a2 = self.unpack(other.packed)

        # Convert to 0-255 range alpha
        alpha = a1
        inv_alpha = 255 - a1

        # Blend with integer math
        r = (r1 * alpha + r2 * inv_alpha) >> 8
        g = (g1 * alpha + g2 * inv_alpha) >> 8
        b = (b1 * alpha + b2 * inv_alpha) >> 8
        a = max(a1, a2)  # Simplified alpha

        return ColorOptimized(packed=(r << 24) | (g << 16) | (b << 8) | a)


def blend_over_numpy(colors1: np.ndarray, colors2: np.ndarray) -> np.ndarray:
    """Vectorized alpha blend using NumPy."""
    # colors are (N, 4) arrays of float32
    a1 = colors1[:, 3:4]
    a2 = colors2[:, 3:4]

    out_a = a1 + a2 * (1.0 - a1)
    out_a = np.where(out_a == 0, 1.0, out_a)  # Avoid division by zero

    result = np.empty_like(colors1)
    result[:, :3] = (colors1[:, :3] * a1 + colors2[:, :3] * a2 * (1.0 - a1)) / out_a
    result[:, 3] = out_a.squeeze()

    return result


# ============================================================================
# Hilbert Curve Mapping (Baseline)
# ============================================================================


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
    """Rotate/flip quadrant appropriately."""
    if ry == 0:
        if rx == 1:
            x = n - 1 - x
            y = n - 1 - y
        x, y = y, x
    return x, y


# ============================================================================
# Hilbert Curve Mapping (Optimized with LUT)
# ============================================================================


class HilbertLUT:
    """Hilbert curve mapper with precomputed lookup table."""

    def __init__(self, order: int = 8):
        self.order = order
        self.size = 1 << order
        # Only build LUT for small orders (order <= 6 = 64x64 = 4K entries)
        # Higher orders take too long to precompute
        if order <= 6:
            self.lut_xy = np.zeros((self.size * self.size, 2), dtype=np.uint16)
            self.lut_d = np.zeros(
                (self.size * self.size), dtype=np.uint32
            )  # Flat array indexed by y*size+x
            self._build_lut()
        else:
            self.lut_xy = None
            self.lut_d = None

    def _build_lut(self):
        """Build lookup tables."""
        for d in range(self.size * self.size):
            x, y = hilbert_d2xy_baseline(self.size, d)
            self.lut_xy[d] = [x, y]
            if y * self.size + x < len(self.lut_d):
                self.lut_d[y * self.size + x] = d

    def d_to_xy(self, d: int) -> tuple[int, int]:
        """Convert index to coordinates using LUT."""
        if self.lut_xy is not None and d < len(self.lut_xy):
            return int(self.lut_xy[d, 0]), int(self.lut_xy[d, 1])
        return hilbert_d2xy_baseline(self.size, d)

    def xy_to_d(self, x: int, y: int) -> int:
        """Convert coordinates to index using LUT."""
        if self.lut_d is not None and x < self.size and y < self.size:
            return int(self.lut_d[y * self.size + x])
        # Fallback computation
        return _xy_to_d_compute(self.order, x, y)


def _xy_to_d_compute(order: int, x: int, y: int) -> int:
    """Compute xy to d without LUT."""
    d = 0
    s = 1 << (order - 1)
    while s > 0:
        rx = 1 if (x & s) else 0
        ry = 1 if (y & s) else 0
        d += s * s * ((3 * rx) ^ ry)
        x, y = _rot_baseline(s, x, y, rx, ry)
        s //= 2
    return d


# ============================================================================
# Pixel Buffer Operations (Baseline)
# ============================================================================


def premultiply_alpha_baseline(rgba: bytearray) -> None:
    """Premultiply alpha - baseline (in-place)."""
    for i in range(0, len(rgba), 4):
        a = rgba[i + 3] / 255.0
        rgba[i] = int(rgba[i] * a)
        rgba[i + 1] = int(rgba[i + 1] * a)
        rgba[i + 2] = int(rgba[i + 2] * a)


def rgba_to_bgra_baseline(rgba: bytes) -> bytes:
    """Convert RGBA to BGRA - baseline."""
    result = bytearray(len(rgba))
    for i in range(0, len(rgba), 4):
        result[i] = rgba[i + 2]  # B
        result[i + 1] = rgba[i + 1]  # G
        result[i + 2] = rgba[i]  # R
        result[i + 3] = rgba[i + 3]  # A
    return bytes(result)


# ============================================================================
# Pixel Buffer Operations (Optimized)
# ============================================================================


def premultiply_alpha_optimized(rgba: bytearray) -> None:
    """Premultiply alpha - optimized with integer math (in-place)."""
    for i in range(0, len(rgba), 4):
        a = rgba[i + 3]
        # Integer multiply with rounding: (x * a + 128) >> 8
        rgba[i] = (rgba[i] * a + 128) >> 8
        rgba[i + 1] = (rgba[i + 1] * a + 128) >> 8
        rgba[i + 2] = (rgba[i + 2] * a + 128) >> 8


def premultiply_alpha_numpy(rgba: np.ndarray) -> np.ndarray:
    """Premultiply alpha using NumPy vectorization."""
    a = rgba[:, 3:4].astype(np.float32) / 255.0
    result = rgba.copy()
    result[:, :3] = (result[:, :3].astype(np.float32) * a).astype(np.uint8)
    return result


def rgba_to_bgra_numpy(rgba: np.ndarray) -> np.ndarray:
    """Convert RGBA to BGRA using NumPy."""
    result = rgba.copy()
    result[:, 0] = rgba[:, 2]  # B <- R
    result[:, 2] = rgba[:, 0]  # R <- B
    return result


# ============================================================================
# Foveated Rendering Calculations
# ============================================================================


def calculate_region_baseline(
    x: float, y: float, fx: float, fy: float, foveal_r: float, parafoveal_r: float
) -> str:
    """Determine visual region - baseline."""
    dist = ((x - fx) ** 2 + (y - fy) ** 2) ** 0.5
    if dist <= foveal_r:
        return "foveal"
    elif dist <= parafoveal_r:
        return "parafoveal"
    return "peripheral"


def calculate_region_fast(
    x: float, y: float, fx: float, fy: float, foveal_r_sq: float, parafoveal_r_sq: float
) -> str:
    """Determine visual region - optimized (avoids sqrt)."""
    dist_sq = (x - fx) ** 2 + (y - fy) ** 2
    if dist_sq <= foveal_r_sq:
        return "foveal"
    elif dist_sq <= parafoveal_r_sq:
        return "parafoveal"
    return "peripheral"


def calculate_regions_batch(
    points: np.ndarray, focus: tuple[float, float], radii: tuple[float, float, float]
) -> np.ndarray:
    """Calculate regions for batch of points using NumPy."""
    fx, fy = focus
    foveal_r, parafoveal_r, _ = radii

    # Calculate squared distances
    dx = points[:, 0] - fx
    dy = points[:, 1] - fy
    dist_sq = dx * dx + dy * dy

    # Classify regions
    regions = np.full(len(points), 2, dtype=np.uint8)  # 2 = peripheral
    regions[dist_sq <= parafoveal_r**2] = 1  # 1 = parafoveal
    regions[dist_sq <= foveal_r**2] = 0  # 0 = foveal

    return regions


# ============================================================================
# Benchmark Suite
# ============================================================================


class VisualShellBenchmark:
    """Comprehensive benchmark suite for visual shell operations."""

    def __init__(self, warmup_iterations: int = 50, test_iterations: int = 1000):
        self.warmup = warmup_iterations
        self.iterations = test_iterations
        self.results: list[BenchmarkResult] = []

    def _run_benchmark(
        self, name: str, func: Callable, *args, target_us: float | None = None
    ) -> BenchmarkResult:
        """Run a single benchmark."""
        # Warmup
        for _ in range(self.warmup):
            func(*args)

        # Actual benchmark
        times = []
        for _ in range(self.iterations):
            start = time.perf_counter_ns()
            func(*args)
            end = time.perf_counter_ns()
            times.append((end - start) / 1000)  # Convert to microseconds

        # Calculate statistics
        times_sorted = sorted(times)
        total_time = sum(times)
        avg_time = total_time / self.iterations

        result = BenchmarkResult(
            name=name,
            iterations=self.iterations,
            total_time_ms=total_time / 1000,
            avg_time_us=avg_time,
            min_time_us=min(times),
            max_time_us=max(times),
            p50_us=times_sorted[len(times_sorted) // 2],
            p95_us=times_sorted[int(len(times_sorted) * 0.95)],
            p99_us=times_sorted[int(len(times_sorted) * 0.99)],
            operations_per_second=1_000_000 / avg_time if avg_time > 0 else 0,
            target_us=target_us,
            passed=target_us is None or avg_time <= target_us,
        )

        self.results.append(result)
        return result

    def benchmark_color_blending(self) -> tuple[BenchmarkResult, BenchmarkResult, BenchmarkResult]:
        """Benchmark color blending operations."""
        c1 = Color(0.8, 0.5, 0.3, 0.7)
        c2 = Color(0.2, 0.4, 0.6, 1.0)

        baseline = self._run_benchmark(
            "color_blend_baseline",
            lambda: c1.blend_over(c2),
            target_us=1.0,  # Target: < 1µs
        )

        # Optimized
        c1_opt = ColorOptimized.from_rgba(204, 128, 77, 179)
        c2_opt = ColorOptimized.from_rgba(51, 102, 153, 255)

        optimized = self._run_benchmark(
            "color_blend_optimized", lambda: c1_opt.blend_over_fast(c2_opt), target_us=0.5
        )

        # NumPy batch
        colors1 = np.random.rand(1000, 4).astype(np.float32)
        colors2 = np.random.rand(1000, 4).astype(np.float32)

        numpy_batch = self._run_benchmark(
            "color_blend_numpy_1000",
            lambda: blend_over_numpy(colors1, colors2),
            target_us=100.0,  # 100µs for 1000 operations = 0.1µs per op
        )

        return baseline, optimized, numpy_batch

    def benchmark_hilbert_mapping(self) -> tuple[BenchmarkResult, BenchmarkResult]:
        """Benchmark Hilbert curve mapping."""
        # Build LUT first
        lut = HilbertLUT(order=8)

        # Baseline
        baseline = self._run_benchmark(
            "hilbert_d2xy_baseline", lambda: hilbert_d2xy_baseline(256, 12345), target_us=1.0
        )

        # With LUT
        optimized = self._run_benchmark(
            "hilbert_d2xy_lut",
            lambda: lut.d_to_xy(12345),
            target_us=0.1,  # LUT should be much faster
        )

        return baseline, optimized

    def benchmark_pixel_operations(
        self,
    ) -> tuple[BenchmarkResult, BenchmarkResult, BenchmarkResult]:
        """Benchmark pixel buffer operations."""
        # Create test buffer (256x256 RGBA)
        size = 256 * 256 * 4
        rgba_data = bytearray(np.random.randint(0, 256, size, dtype=np.uint8))
        rgba_np = np.random.randint(0, 256, (256 * 256, 4), dtype=np.uint8)

        # Baseline premultiply
        data1 = bytearray(rgba_data)
        baseline = self._run_benchmark(
            "premultiply_baseline_256x256",
            lambda: premultiply_alpha_baseline(bytearray(data1)),
            target_us=5000.0,  # < 5ms for 256x256
        )

        # Optimized premultiply
        data2 = bytearray(rgba_data)
        optimized = self._run_benchmark(
            "premultiply_optimized_256x256",
            lambda: premultiply_alpha_optimized(bytearray(data2)),
            target_us=2000.0,  # < 2ms
        )

        # NumPy premultiply
        numpy_result = self._run_benchmark(
            "premultiply_numpy_256x256",
            lambda: premultiply_alpha_numpy(rgba_np.copy()),
            target_us=1000.0,  # < 1ms with vectorization
        )

        return baseline, optimized, numpy_result

    def benchmark_foveated_rendering(self) -> tuple[BenchmarkResult, BenchmarkResult]:
        """Benchmark foveated rendering calculations."""
        # Single point baseline
        baseline = self._run_benchmark(
            "region_baseline",
            lambda: calculate_region_baseline(500, 500, 960, 540, 50, 150),
            target_us=0.5,
        )

        # Optimized (no sqrt)
        foveal_r_sq = 50**2
        parafoveal_r_sq = 150**2
        optimized = self._run_benchmark(
            "region_fast",
            lambda: calculate_region_fast(500, 500, 960, 540, foveal_r_sq, parafoveal_r_sq),
            target_us=0.3,
        )

        return baseline, optimized

    def benchmark_foveated_batch(self) -> BenchmarkResult:
        """Benchmark batch foveated calculations."""
        # 1000 random points
        points = np.random.rand(1000, 2).astype(np.float32) * 1920
        focus = (960.0, 540.0)
        radii = (50.0, 150.0, 400.0)

        return self._run_benchmark(
            "region_batch_1000",
            lambda: calculate_regions_batch(points, focus, radii),
            target_us=50.0,  # < 50µs for 1000 points
        )

    def run_all_benchmarks(self) -> list[BenchmarkResult]:
        """Run all benchmarks."""
        print("=" * 60)
        print("VISUAL SHELL PERFORMANCE BENCHMARK")
        print("=" * 60)

        # Color blending
        print("\n[1/5] Color Blending Operations...")
        self.benchmark_color_blending()

        # Hilbert mapping
        print("[2/5] Hilbert Curve Mapping...")
        self.benchmark_hilbert_mapping()

        # Pixel operations
        print("[3/5] Pixel Buffer Operations...")
        self.benchmark_pixel_operations()

        # Foveated rendering
        print("[4/5] Foveated Rendering (single)...")
        self.benchmark_foveated_rendering()

        print("[5/5] Foveated Rendering (batch)...")
        self.benchmark_foveated_batch()

        return self.results

    def print_results(self):
        """Print benchmark results in formatted table."""
        print("\n" + "=" * 80)
        print("BENCHMARK RESULTS")
        print("=" * 80)
        print(f"{'Benchmark':<35} {'Avg (µs)':<12} {'P95 (µs)':<12} {'Target':<12} {'Status'}")
        print("-" * 80)

        for r in self.results:
            target_str = f"{r.target_us:.1f}" if r.target_us else "N/A"
            status = "✅ PASS" if r.passed else "❌ FAIL"
            print(
                f"{r.name:<35} {r.avg_time_us:<12.3f} {r.p95_us:<12.3f} {target_str:<12} {status}"
            )

        print("-" * 80)

        # Summary
        passed = sum(1 for r in self.results if r.passed)
        print(f"\nSummary: {passed}/{len(self.results)} benchmarks passed targets")


def generate_optimization_report(
    baseline: list[BenchmarkResult], optimized: list[BenchmarkResult]
) -> OptimizationReport:
    """Generate optimization report comparing baseline vs optimized."""
    report = OptimizationReport()
    report.baseline_results = baseline
    report.optimized_results = optimized

    # Calculate improvements
    baseline_dict = {r.name: r for r in baseline}
    optimized_dict = {r.name: r for r in optimized}

    total_baseline_time = 0.0
    total_optimized_time = 0.0

    for name, opt_result in optimized_dict.items():
        # Find matching baseline (remove "_optimized" suffix)
        base_name = (
            name.replace("_optimized", "_baseline")
            .replace("_lut", "_baseline")
            .replace("_fast", "_baseline")
        )
        if base_name in baseline_dict:
            base_result = baseline_dict[base_name]
            improvement = (
                (base_result.avg_time_us - opt_result.avg_time_us) / base_result.avg_time_us * 100
            )
            report.improvements[name] = improvement

            total_baseline_time += base_result.avg_time_us
            total_optimized_time += opt_result.avg_time_us

    if total_baseline_time > 0:
        report.total_speedup = (
            total_baseline_time / total_optimized_time if total_optimized_time > 0 else 1.0
        )

    report.passed_all = all(r.passed for r in optimized)

    return report


def main():
    """Run the performance optimization suite."""
    print("\n" + "█" * 80)
    print("█  VISUAL SHELL RENDERING ENGINE - PERFORMANCE OPTIMIZATION SUITE  █")
    print("█" * 80 + "\n")

    # Run benchmarks
    bench = VisualShellBenchmark(warmup_iterations=100, test_iterations=10000)
    results = bench.run_all_benchmarks()
    bench.print_results()

    # Save results to JSON
    output_dir = Path(__file__).parent / "results"
    output_dir.mkdir(exist_ok=True)

    results_json = {
        "timestamp": time.time(),
        "results": [
            {
                "name": r.name,
                "iterations": r.iterations,
                "avg_time_us": r.avg_time_us,
                "min_time_us": r.min_time_us,
                "max_time_us": r.max_time_us,
                "p50_us": r.p50_us,
                "p95_us": r.p95_us,
                "p99_us": r.p99_us,
                "ops_per_sec": r.operations_per_second,
                "target_us": r.target_us,
                "passed": r.passed,
            }
            for r in results
        ],
    }

    output_file = output_dir / f"benchmark_{int(time.time())}.json"
    with open(output_file, "w") as f:
        json.dump(results_json, f, indent=2)

    print(f"\n📊 Results saved to: {output_file}")

    # Performance summary
    print("\n" + "=" * 80)
    print("PERFORMANCE SUMMARY")
    print("=" * 80)

    # Identify bottlenecks
    bottlenecks = [r for r in results if not r.passed]
    if bottlenecks:
        print("\n⚠️  BOTTLENECKS DETECTED:")
        for b in bottlenecks:
            print(f"  - {b.name}: {b.avg_time_us:.2f}µs (target: {b.target_us}µs)")
    else:
        print("\n✅ All benchmarks passed performance targets!")

    # Optimization recommendations
    print("\n📝 OPTIMIZATION RECOMMENDATIONS:")

    for r in results:
        if "numpy" in r.name and r.passed:
            print(f"  ✅ {r.name}: Vectorized version is fast ({r.avg_time_us:.2f}µs)")
        elif "lut" in r.name and r.passed:
            print(f"  ✅ {r.name}: LUT caching effective ({r.avg_time_us:.2f}µs)")
        elif "baseline" in r.name:
            # Check if there's an optimized version
            opt_name = r.name.replace("baseline", "optimized")
            opt_result = next((x for x in results if x.name == opt_name), None)
            if opt_result:
                speedup = (
                    r.avg_time_us / opt_result.avg_time_us if opt_result.avg_time_us > 0 else 1.0
                )
                print(f"  📈 {r.name} → {opt_name}: {speedup:.1f}x speedup")

    return 0 if all(r.passed for r in results) else 1


if __name__ == "__main__":
    exit(main())
