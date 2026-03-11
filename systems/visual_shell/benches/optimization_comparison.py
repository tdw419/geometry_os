#!/usr/bin/env python3
"""
Performance Optimization Comparison for Native Glyph Shell

Compares baseline vs optimized implementations for key modules.
Generates a detailed report with speedup metrics.
"""

import json
import time
from dataclasses import dataclass
from pathlib import Path

import numpy as np

# Import baseline implementations from quick_benchmark
import sys
sys.path.insert(0, str(Path(__file__).parent))

from quick_benchmark import (
    Color,
    ColorOptimized,
    HilbertLUT,
    blend_over_numpy,
    calculate_region_baseline,
    calculate_region_fast,
    calculate_regions_batch,
    hilbert_d2xy_baseline,
    premultiply_alpha_baseline,
    premultiply_alpha_numpy,
    premultiply_alpha_optimized,
)

# Import optimized implementations
sys.path.insert(0, str(Path(__file__).parent.parent / "native"))
from optimized_glyph_ops import (
    FastGlyphCache,
    FoveatedRendererOptimized,
    HilbertCurveOptimized,
    blend_colors_batch,
    blend_colors_int8,
    premultiply_alpha_inplace,
    premultiply_alpha_vectorized,
    rgba_to_bgra_inplace,
    rgba_to_bgra_vectorized,
    premultiply_alpha_bytearray,
    rgba_to_bgra_bytearray,
)


@dataclass
class ComparisonResult:
    """Result of baseline vs optimized comparison."""
    name: str
    baseline_us: float
    optimized_us: float
    speedup: float
    baseline_passed: bool
    optimized_passed: bool
    target_us: float | None


class OptimizationBenchmark:
    """Compare baseline vs optimized implementations."""

    def __init__(self, warmup: int = 10, iterations: int = 500):
        self.warmup = warmup
        self.iterations = iterations
        self.results: list[ComparisonResult] = []

    def _benchmark(self, func, *args) -> float:
        """Run benchmark and return average time in microseconds."""
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

    def compare(
        self,
        name: str,
        baseline_func,
        optimized_func,
        target_us: float | None = None,
        baseline_nop: bool = False,
    ) -> ComparisonResult:
        """Compare baseline vs optimized implementation."""
        baseline_us = 0.0 if baseline_nop else self._benchmark(baseline_func)
        optimized_us = self._benchmark(optimized_func)

        speedup = baseline_us / optimized_us if optimized_us > 0 and baseline_us > 0 else 1.0

        result = ComparisonResult(
            name=name,
            baseline_us=baseline_us,
            optimized_us=optimized_us,
            speedup=speedup,
            baseline_passed=target_us is None or baseline_us <= target_us,
            optimized_passed=target_us is None or optimized_us <= target_us,
            target_us=target_us,
        )
        self.results.append(result)
        return result

    def run_all(self) -> list[ComparisonResult]:
        """Run all comparisons."""
        print("=" * 80)
        print("NATIVE GLYPH SHELL - OPTIMIZATION COMPARISON")
        print("=" * 80)

        # 1. Color Blending
        print("\n[1/6] Color Blending Operations...")

        # Single color blend
        c1 = Color(0.8, 0.5, 0.3, 0.7)
        c2 = Color(0.2, 0.4, 0.6, 1.0)

        c1_opt = ColorOptimized.from_rgba(204, 128, 77, 179)
        c2_opt = ColorOptimized.from_rgba(51, 102, 153, 255)

        self.compare(
            "color_blend_single",
            lambda: c1.blend_over(c2),
            lambda: c1_opt.blend_over_fast(c2_opt),
            target_us=1.0,
        )

        # Batch color blending
        colors1 = np.random.rand(1000, 4).astype(np.float32)
        colors2 = np.random.rand(1000, 4).astype(np.float32)

        self.compare(
            "color_blend_batch_1000",
            lambda: blend_over_numpy(colors1.copy(), colors2.copy()),
            lambda: blend_colors_batch(colors1.copy(), colors2.copy()),
            target_us=100.0,
        )

        # 2. Hilbert Curve Mapping
        print("[2/6] Hilbert Curve Mapping...")

        # Build LUTs
        lut_baseline = HilbertLUT(order=6)
        lut_optimized = HilbertCurveOptimized(order=8)

        self.compare(
            "hilbert_d2xy_single",
            lambda: hilbert_d2xy_baseline(256, 12345),
            lambda: lut_optimized.d_to_xy(12345),
            target_us=1.0,
        )

        # Batch Hilbert
        indices = np.random.randint(0, 65536, 1000, dtype=np.uint32)
        self.compare(
            "hilbert_d2xy_batch_1000",
            lambda: [lut_baseline.d_to_xy(int(d)) for d in indices],
            lambda: lut_optimized.d_to_xy_batch(indices),
            target_us=500.0,
        )

        # 3. Pixel Buffer Operations
        print("[3/6] Pixel Buffer Operations...")

        size = 256 * 256  # 64K pixels
        rgba_np = np.random.randint(0, 256, (size, 4), dtype=np.uint8)

        self.compare(
            "premultiply_alpha_64k",
            lambda: premultiply_alpha_numpy(rgba_np.copy()),
            lambda: premultiply_alpha_vectorized(rgba_np.copy()),
            target_us=1000.0,
        )

        # In-place vs copy
        self.compare(
            "premultiply_inplace_64k",
            lambda: premultiply_alpha_numpy(rgba_np.copy()),
            lambda: (premultiply_alpha_inplace(rgba_np.copy()), None)[1],
            target_us=500.0,
        )

        # Bytearray operations (for PTY buffers)
        rgba_bytes = bytearray(np.random.randint(0, 256, size * 4, dtype=np.uint8))

        self.compare(
            "premultiply_bytearray_64k",
            lambda: premultiply_alpha_baseline(bytearray(rgba_bytes)),
            lambda: premultiply_alpha_bytearray(bytearray(rgba_bytes)),
            target_us=5000.0,
        )

        # 4. Channel Swapping
        print("[4/6] Channel Swapping...")

        self.compare(
            "rgba_to_bgra_64k",
            lambda: rgba_np[:, [2, 1, 0, 3]],  # NumPy indexing baseline
            lambda: rgba_to_bgra_vectorized(rgba_np.copy()),
            target_us=200.0,
        )

        self.compare(
            "rgba_to_bgra_inplace_64k",
            lambda: rgba_np[:, [2, 1, 0, 3]],
            lambda: (rgba_to_bgra_inplace(rgba_np.copy()), None)[1],
            target_us=100.0,
        )

        self.compare(
            "rgba_to_bgra_bytearray_64k",
            lambda: bytes(rgba_bytes)[2::4],  # Baseline bytes indexing
            lambda: (rgba_to_bgra_bytearray(bytearray(rgba_bytes)), None)[1],
            target_us=5000.0,
        )

        # 5. Foveated Rendering
        print("[5/6] Foveated Rendering...")

        foveated_opt = FoveatedRendererOptimized(foveal_radius=50.0, parafoveal_radius=150.0)
        points = np.random.rand(1000, 2).astype(np.float32) * 1920
        focus = (960.0, 540.0)

        self.compare(
            "foveated_classify_1000",
            lambda: calculate_regions_batch(points, focus, (50.0, 150.0, 400.0)),
            lambda: foveated_opt.classify_batch(points, focus),
            target_us=50.0,
        )

        # Detail level extraction
        self.compare(
            "foveated_detail_levels_1000",
            lambda: [
                np.where(calculate_regions_batch(points, focus, (50.0, 150.0, 400.0)) == i)[0]
                for i in range(3)
            ],
            lambda: foveated_opt.get_detail_levels(points, focus),
            target_us=100.0,
        )

        # 6. Glyph Cache
        print("[6/6] Glyph Cache Operations...")

        # Create test data
        test_glyph = np.random.randint(0, 256, (8, 8, 4), dtype=np.uint8)

        # Baseline: simple dict cache
        baseline_cache = {chr(i): test_glyph.copy() for i in range(256)}

        def dict_lookup_100():
            for i in range(100):
                _ = baseline_cache.get(chr(i % 256))
            return True

        # Optimized cache
        fast_cache = FastGlyphCache(max_glyphs=256, glyph_size=8 * 8 * 4)
        for i in range(256):
            fast_cache.put(i, 255, 0, test_glyph.ravel())

        def fast_cache_lookup_100():
            for i in range(100):
                _ = fast_cache.get(i, 255, 0)
            return True

        self.compare(
            "glyph_cache_lookup_100",
            dict_lookup_100,
            fast_cache_lookup_100,
            target_us=50.0,
        )

        return self.results

    def print_results(self):
        """Print comparison results."""
        print("\n" + "=" * 100)
        print("OPTIMIZATION COMPARISON RESULTS")
        print("=" * 100)
        print(f"{'Benchmark':<30} {'Baseline (µs)':<15} {'Optimized (µs)':<15} {'Speedup':<10} {'Target':<12} {'Status'}")
        print("-" * 100)

        for r in self.results:
            target_str = f"{r.target_us:.1f}" if r.target_us else "N/A"
            status = "✅" if r.optimized_passed else "⚠️"
            if r.baseline_us > 0:
                speedup_str = f"{r.speedup:.2f}x"
            else:
                speedup_str = "N/A"

            baseline_str = f"{r.baseline_us:.2f}" if r.baseline_us > 0 else "N/A"
            print(f"{r.name:<30} {baseline_str:<15} {r.optimized_us:<15.2f} {speedup_str:<10} {target_str:<12} {status}")

        print("-" * 100)

        # Summary
        speedups = [r.speedup for r in self.results if r.baseline_us > 0]
        avg_speedup = sum(speedups) / len(speedups) if speedups else 1.0
        passed = sum(1 for r in self.results if r.optimized_passed)

        print(f"\n📊 Summary:")
        print(f"   Average Speedup: {avg_speedup:.2f}x")
        print(f"   Tests Passed: {passed}/{len(self.results)}")

        # Identify best improvements
        best = sorted([r for r in self.results if r.baseline_us > 0], key=lambda r: r.speedup, reverse=True)[:3]
        print(f"\n🏆 Top Optimizations:")
        for i, r in enumerate(best, 1):
            print(f"   {i}. {r.name}: {r.speedup:.2f}x faster ({r.baseline_us:.1f}µs → {r.optimized_us:.1f}µs)")

    def save_results(self, output_dir: Path) -> Path:
        """Save results to JSON."""
        output_dir.mkdir(exist_ok=True)
        output_file = output_dir / f"optimization_comparison_{int(time.time())}.json"

        data = {
            "timestamp": time.time(),
            "comparisons": [
                {
                    "name": r.name,
                    "baseline_us": r.baseline_us,
                    "optimized_us": r.optimized_us,
                    "speedup": r.speedup,
                    "baseline_passed": r.baseline_passed,
                    "optimized_passed": r.optimized_passed,
                    "target_us": r.target_us,
                }
                for r in self.results
            ],
        }

        with open(output_file, "w") as f:
            json.dump(data, f, indent=2)

        return output_file


def main():
    """Run the optimization comparison."""
    print("\n" + "█" * 80)
    print("█  NATIVE GLYPH SHELL - PERFORMANCE OPTIMIZATION ANALYSIS             █")
    print("█" * 80 + "\n")

    # Run comparison
    bench = OptimizationBenchmark(warmup=10, iterations=500)
    bench.run_all()
    bench.print_results()

    # Save results
    output_dir = Path(__file__).parent / "results"
    output_file = bench.save_results(output_dir)
    print(f"\n💾 Results saved to: {output_file}")

    return 0


if __name__ == "__main__":
    exit(main())
