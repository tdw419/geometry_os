#!/usr/bin/env python3
"""
Quick Performance Benchmark for Native Glyph Shell

Focuses on key modules with reduced iteration counts for faster feedback.
"""

import json
import time
from dataclasses import dataclass
from pathlib import Path

import numpy as np


@dataclass
class BenchmarkResult:
    """Result of a single benchmark run."""
    name: str
    iterations: int
    avg_time_us: float
    p50_us: float
    p95_us: float
    target_us: float | None = None
    passed: bool = True


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
            return Color(a=0.0)
        return Color(
            r=(self.r * self.a + other.r * other.a * (1.0 - self.a)) / out_a,
            g=(self.g * self.a + other.g * other.a * (1.0 - self.a)) / out_a,
            b=(self.b * self.a + other.b * other.a * (1.0 - self.a)) / out_a,
            a=out_a,
        )


# ============================================================================
# Color Operations (Optimized)
# ============================================================================

@dataclass
class ColorOptimized:
    """RGBA color with optimized operations using integer math."""
    packed: int = 0x000000FF

    @classmethod
    def from_rgba(cls, r: int, g: int, b: int, a: int) -> "ColorOptimized":
        return cls(packed=(r << 24) | (g << 16) | (b << 8) | a)

    @staticmethod
    def unpack(packed: int) -> tuple[int, int, int, int]:
        return ((packed >> 24) & 0xFF, (packed >> 16) & 0xFF, (packed >> 8) & 0xFF, packed & 0xFF)

    def blend_over_fast(self, other: "ColorOptimized") -> "ColorOptimized":
        """Fast alpha blend using integer math."""
        r1, g1, b1, a1 = self.unpack(self.packed)
        r2, g2, b2, a2 = self.unpack(other.packed)
        alpha = a1
        inv_alpha = 255 - a1
        r = (r1 * alpha + r2 * inv_alpha) >> 8
        g = (g1 * alpha + g2 * inv_alpha) >> 8
        b = (b1 * alpha + b2 * inv_alpha) >> 8
        a = max(a1, a2)
        return ColorOptimized(packed=(r << 24) | (g << 16) | (b << 8) | a)


def blend_over_numpy(colors1: np.ndarray, colors2: np.ndarray) -> np.ndarray:
    """Vectorized alpha blend using NumPy."""
    a1 = colors1[:, 3:4]
    a2 = colors2[:, 3:4]
    out_a = a1 + a2 * (1.0 - a1)
    out_a = np.where(out_a == 0, 1.0, out_a)
    result = np.empty_like(colors1)
    result[:, :3] = (colors1[:, :3] * a1 + colors2[:, :3] * a2 * (1.0 - a1)) / out_a
    result[:, 3] = out_a.squeeze()
    return result


# ============================================================================
# Hilbert Curve Mapping
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
    if ry == 0:
        if rx == 1:
            x = n - 1 - x
            y = n - 1 - y
        x, y = y, x
    return x, y


# Optimized Hilbert with precomputed tables
class HilbertLUT:
    """Hilbert curve mapper with precomputed lookup table."""

    def __init__(self, order: int = 6):
        self.order = order
        self.size = 1 << order
        self.lut_xy = np.zeros((self.size * self.size, 2), dtype=np.uint16)
        self._build_lut()

    def _build_lut(self):
        for d in range(self.size * self.size):
            x, y = hilbert_d2xy_baseline(self.size, d)
            self.lut_xy[d] = [x, y]

    def d_to_xy(self, d: int) -> tuple[int, int]:
        if d < len(self.lut_xy):
            return int(self.lut_xy[d, 0]), int(self.lut_xy[d, 1])
        return hilbert_d2xy_baseline(self.size, d)


# ============================================================================
# Pixel Buffer Operations
# ============================================================================

def premultiply_alpha_baseline(rgba: bytearray) -> None:
    """Premultiply alpha - baseline (in-place)."""
    for i in range(0, len(rgba), 4):
        a = rgba[i + 3] / 255.0
        rgba[i] = int(rgba[i] * a)
        rgba[i + 1] = int(rgba[i + 1] * a)
        rgba[i + 2] = int(rgba[i + 2] * a)


def premultiply_alpha_optimized(rgba: bytearray) -> None:
    """Premultiply alpha - optimized with integer math (in-place)."""
    for i in range(0, len(rgba), 4):
        a = rgba[i + 3]
        rgba[i] = (rgba[i] * a + 128) >> 8
        rgba[i + 1] = (rgba[i + 1] * a + 128) >> 8
        rgba[i + 2] = (rgba[i + 2] * a + 128) >> 8


def premultiply_alpha_numpy(rgba: np.ndarray) -> np.ndarray:
    """Premultiply alpha using NumPy vectorization."""
    a = rgba[:, 3:4].astype(np.float32) / 255.0
    result = rgba.copy()
    result[:, :3] = (result[:, :3].astype(np.float32) * a).astype(np.uint8)
    return result


# ============================================================================
# Foveated Rendering
# ============================================================================

def calculate_region_baseline(x: float, y: float, fx: float, fy: float, foveal_r: float, parafoveal_r: float) -> str:
    """Determine visual region - baseline."""
    dist = ((x - fx) ** 2 + (y - fy) ** 2) ** 0.5
    if dist <= foveal_r:
        return "foveal"
    elif dist <= parafoveal_r:
        return "parafoveal"
    return "peripheral"


def calculate_region_fast(x: float, y: float, fx: float, fy: float, foveal_r_sq: float, parafoveal_r_sq: float) -> str:
    """Determine visual region - optimized (avoids sqrt)."""
    dist_sq = (x - fx) ** 2 + (y - fy) ** 2
    if dist_sq <= foveal_r_sq:
        return "foveal"
    elif dist_sq <= parafoveal_r_sq:
        return "parafoveal"
    return "peripheral"


def calculate_regions_batch(points: np.ndarray, focus: tuple[float, float], radii: tuple[float, float, float]) -> np.ndarray:
    """Calculate regions for batch of points using NumPy."""
    fx, fy = focus
    foveal_r, parafoveal_r, _ = radii
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

class QuickBenchmark:
    """Fast benchmark suite for key modules."""

    def __init__(self, warmup: int = 10, iterations: int = 500):
        self.warmup = warmup
        self.iterations = iterations
        self.results: list[BenchmarkResult] = []

    def _run_benchmark(self, name: str, func, *args, target_us: float | None = None) -> BenchmarkResult:
        """Run a single benchmark."""
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

        times_sorted = sorted(times)
        avg_time = sum(times) / self.iterations
        passed = target_us is None or avg_time <= target_us

        result = BenchmarkResult(
            name=name,
            iterations=self.iterations,
            avg_time_us=avg_time,
            p50_us=times_sorted[len(times_sorted) // 2],
            p95_us=times_sorted[int(len(times_sorted) * 0.95)],
            target_us=target_us,
            passed=passed,
        )
        self.results.append(result)
        return result

    def run_all(self) -> dict:
        """Run all benchmarks and return results dict."""
        print("=" * 60)
        print("NATIVE GLYPH SHELL - QUICK PERFORMANCE BENCHMARK")
        print("=" * 60)

        # 1. Color blending
        print("\n[1/5] Color Blending...")
        c1 = Color(0.8, 0.5, 0.3, 0.7)
        c2 = Color(0.2, 0.4, 0.6, 1.0)
        self._run_benchmark("color_blend_baseline", lambda: c1.blend_over(c2), target_us=1.0)

        c1_opt = ColorOptimized.from_rgba(204, 128, 77, 179)
        c2_opt = ColorOptimized.from_rgba(51, 102, 153, 255)
        self._run_benchmark("color_blend_optimized", lambda: c1_opt.blend_over_fast(c2_opt), target_us=0.5)

        colors1 = np.random.rand(1000, 4).astype(np.float32)
        colors2 = np.random.rand(1000, 4).astype(np.float32)
        self._run_benchmark("color_blend_numpy_1000", lambda: blend_over_numpy(colors1, colors2), target_us=100.0)

        # 2. Hilbert mapping
        print("[2/5] Hilbert Curve Mapping...")
        self._run_benchmark("hilbert_d2xy_baseline", lambda: hilbert_d2xy_baseline(256, 12345), target_us=1.0)
        lut = HilbertLUT(order=6)
        self._run_benchmark("hilbert_d2xy_lut", lambda: lut.d_to_xy(12345), target_us=0.1)

        # 3. Pixel operations
        print("[3/5] Pixel Buffer Operations...")
        size = 256 * 256 * 4
        rgba_data = bytearray(np.random.randint(0, 256, size, dtype=np.uint8))
        rgba_np = np.random.randint(0, 256, (256 * 256, 4), dtype=np.uint8)

        self._run_benchmark("premultiply_baseline", lambda: premultiply_alpha_baseline(bytearray(rgba_data)), target_us=5000.0)
        self._run_benchmark("premultiply_optimized", lambda: premultiply_alpha_optimized(bytearray(rgba_data)), target_us=2000.0)
        self._run_benchmark("premultiply_numpy", lambda: premultiply_alpha_numpy(rgba_np.copy()), target_us=1000.0)

        # 4. Foveated rendering
        print("[4/5] Foveated Rendering...")
        self._run_benchmark("region_baseline", lambda: calculate_region_baseline(500, 500, 960, 540, 50, 150), target_us=0.5)
        self._run_benchmark("region_fast", lambda: calculate_region_fast(500, 500, 960, 540, 50**2, 150**2), target_us=0.3)

        # 5. Batch foveated
        print("[5/5] Batch Foveated Rendering...")
        points = np.random.rand(1000, 2).astype(np.float32) * 1920
        self._run_benchmark("region_batch_1000", lambda: calculate_regions_batch(points, (960.0, 540.0), (50.0, 150.0, 400.0)), target_us=50.0)

        return self._to_dict()

    def _to_dict(self) -> dict:
        """Convert results to dictionary."""
        return {
            "timestamp": time.time(),
            "results": [
                {
                    "name": r.name,
                    "iterations": r.iterations,
                    "avg_time_us": r.avg_time_us,
                    "p50_us": r.p50_us,
                    "p95_us": r.p95_us,
                    "target_us": r.target_us,
                    "passed": r.passed,
                }
                for r in self.results
            ],
        }

    def print_results(self):
        """Print benchmark results."""
        print("\n" + "=" * 80)
        print("BENCHMARK RESULTS")
        print("=" * 80)
        print(f"{'Benchmark':<35} {'Avg (µs)':<12} {'P50 (µs)':<12} {'Target':<12} {'Status'}")
        print("-" * 80)

        for r in self.results:
            target_str = f"{r.target_us:.1f}" if r.target_us else "N/A"
            status = "✅ PASS" if r.passed else "❌ FAIL"
            print(f"{r.name:<35} {r.avg_time_us:<12.3f} {r.p50_us:<12.3f} {target_str:<12} {status}")

        print("-" * 80)
        passed = sum(1 for r in self.results if r.passed)
        print(f"\nSummary: {passed}/{len(self.results)} benchmarks passed targets")


def main():
    """Run the quick benchmark."""
    print("\n" + "█" * 60)
    print("█  NATIVE GLYPH SHELL - PERFORMANCE ANALYSIS          █")
    print("█" * 60 + "\n")

    # Run baseline benchmarks
    bench = QuickBenchmark(warmup=10, iterations=500)
    results = bench.run_all()
    bench.print_results()

    # Save results
    output_dir = Path(__file__).parent / "results"
    output_dir.mkdir(exist_ok=True)
    output_file = output_dir / f"baseline_{int(time.time())}.json"
    with open(output_file, "w") as f:
        json.dump(results, f, indent=2)

    print(f"\n📊 Baseline results saved to: {output_file}")

    # Identify bottlenecks
    bottlenecks = [r for r in bench.results if not r.passed]
    if bottlenecks:
        print("\n⚠️  BOTTLENECKS DETECTED:")
        for b in bottlenecks:
            print(f"  - {b.name}: {b.avg_time_us:.2f}µs (target: {b.target_us}µs)")

    return bench.results


if __name__ == "__main__":
    main()
