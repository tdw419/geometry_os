#!/usr/bin/env python3
"""
Optimized Performance Benchmark for Native Glyph Shell

Tests all key modules with v2 Numba-accelerated implementations.
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
    iterations: int
    avg_time_us: float
    p50_us: float
    p95_us: float
    target_us: float | None = None
    passed: bool = True
    category: str = "general"


class OptimizedBenchmark:
    """Benchmark suite for optimized implementations."""

    def __init__(self, warmup: int = 10, iterations: int = 1000):
        self.warmup = warmup
        self.iterations = iterations
        self.results: list[BenchmarkResult] = []

    def _run_benchmark(self, name: str, func, *args, target_us: float | None = None, 
                       category: str = "general") -> BenchmarkResult:
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
            category=category,
        )
        self.results.append(result)
        return result

    def run_all(self) -> dict:
        """Run all benchmarks and return results dict."""
        print("=" * 60)
        print("NATIVE GLYPH SHELL - OPTIMIZED PERFORMANCE BENCHMARK")
        print(f"Numba Acceleration: {'✅ Enabled' if HAS_NUMBA else '❌ Disabled'}")
        print("=" * 60)

        # 1. Color blending
        print("\n[1/5] Color Blending...")
        
        if HAS_NUMBA:
            # Single color blend (packed)
            fg = np.uint32(0xCC804DB3)
            bg = np.uint32(0x336699FF)
            self._run_benchmark("color_blend_packed", 
                              lambda: blend_colors_packed(fg, bg), 
                              target_us=0.5, category="color")

            # Batch color blend (10K)
            n = 10000
            fg_batch = np.random.randint(0, 0xFFFFFFFF, n, dtype=np.uint32)
            bg_batch = np.random.randint(0, 0xFFFFFFFF, n, dtype=np.uint32)
            out_batch = np.zeros(n, dtype=np.uint32)
            self._run_benchmark("color_blend_batch_10k", 
                              lambda: blend_colors_batch_packed(fg_batch, bg_batch, out_batch), 
                              target_us=100.0, category="color")

        # 2. Hilbert mapping
        print("[2/5] Hilbert Curve Mapping...")
        
        if HAS_NUMBA:
            self._run_benchmark("hilbert_d2xy_jit", 
                              lambda: hilbert_d2xy_fast(256, 12345), 
                              target_us=0.5, category="hilbert")
            
            curve = HilbertCurveV2(order=8)
            self._run_benchmark("hilbert_d2xy_lut", 
                              lambda: curve.d_to_xy(12345), 
                              target_us=0.2, category="hilbert")

        # 3. Pixel operations
        print("[3/5] Pixel Buffer Operations...")
        
        size = 256 * 256
        rgba_np = np.random.randint(0, 256, (size, 4), dtype=np.uint8)

        if HAS_NUMBA:
            self._run_benchmark("premultiply_numba", 
                              lambda: premultiply_alpha_2d(rgba_np.copy()), 
                              target_us=500.0, category="pixel")

            self._run_benchmark("rgba_to_bgra_numba",
                              lambda: rgba_to_bgra_inplace_numba(rgba_np.copy()),
                              target_us=200.0, category="pixel")

        # 4. Foveated rendering
        print("[4/5] Foveated Rendering...")
        
        if HAS_NUMBA:
            points = np.random.rand(1000, 2).astype(np.float32) * 1920
            self._run_benchmark("region_batch_1000", 
                              lambda: classify_regions_numba(
                                  points, np.float32(960.0), np.float32(540.0),
                                  np.float32(50.0**2), np.float32(150.0**2)
                              ), 
                              target_us=50.0, category="foveated")

            points_10k = np.random.rand(10000, 2).astype(np.float32) * 1920
            self._run_benchmark("region_batch_10k",
                              lambda: classify_regions_numba(
                                  points_10k, np.float32(960.0), np.float32(540.0),
                                  np.float32(50.0**2), np.float32(150.0**2)
                              ),
                              target_us=100.0, category="foveated")

        # 5. End-to-end pipeline
        print("[5/5] End-to-End Pipeline...")
        
        if HAS_NUMBA:
            def pipeline_100():
                fg = np.uint32(0xCC804DB3)
                bg = np.uint32(0x336699FF)
                for i in range(100):
                    x, y = hilbert_d2xy_fast(256, i)
                    result = blend_colors_packed(fg, bg)
                return result

            self._run_benchmark("pipeline_100_cells", pipeline_100, 
                              target_us=200.0, category="pipeline")

            def pipeline_1000():
                fg = np.uint32(0xCC804DB3)
                bg = np.uint32(0x336699FF)
                for i in range(1000):
                    x, y = hilbert_d2xy_fast(256, i)
                    result = blend_colors_packed(fg, bg)
                return result

            self._run_benchmark("pipeline_1000_cells", pipeline_1000,
                              target_us=1500.0, category="pipeline")

        return self._to_dict()

    def _to_dict(self) -> dict:
        """Convert results to dictionary."""
        return {
            "timestamp": time.time(),
            "numba_enabled": HAS_NUMBA,
            "results": [asdict(r) for r in self.results],
        }

    def print_results(self):
        """Print benchmark results."""
        print("\n" + "=" * 90)
        print("OPTIMIZED BENCHMARK RESULTS")
        print("=" * 90)
        print(f"{'Benchmark':<30} {'Avg (µs)':<12} {'P50 (µs)':<12} {'P95 (µs)':<12} {'Target':<10} {'Status'}")
        print("-" * 90)

        # Group by category
        categories = {}
        for r in self.results:
            if r.category not in categories:
                categories[r.category] = []
            categories[r.category].append(r)

        for category, results in categories.items():
            print(f"\n[{category.upper()}]")
            for r in results:
                target_str = f"{r.target_us:.1f}" if r.target_us else "N/A"
                status = "✅ PASS" if r.passed else "❌ FAIL"
                print(f"  {r.name:<28} {r.avg_time_us:<12.2f} {r.p50_us:<12.2f} {r.p95_us:<12.2f} {target_str:<10} {status}")

        print("-" * 90)
        passed = sum(1 for r in self.results if r.passed)
        print(f"\nSummary: {passed}/{len(self.results)} benchmarks passed targets")


def main():
    """Run the optimized benchmark."""
    print("\n" + "█" * 60)
    print("█  NATIVE GLYPH SHELL - OPTIMIZED BENCHMARK v2        █")
    print("█" * 60 + "\n")

    if not HAS_NUMBA:
        print("❌ Numba is required for optimized benchmarks")
        return []

    # Run benchmarks
    bench = OptimizedBenchmark(warmup=10, iterations=1000)
    results = bench.run_all()
    bench.print_results()

    # Save results
    output_dir = Path(__file__).parent / "results"
    output_dir.mkdir(exist_ok=True)
    output_file = output_dir / f"optimized_{int(time.time())}.json"
    with open(output_file, "w") as f:
        json.dump(results, f, indent=2)

    print(f"\n📊 Results saved to: {output_file}")

    # Performance summary
    print("\n" + "=" * 60)
    print("PERFORMANCE TARGETS SUMMARY")
    print("=" * 60)
    
    targets = {
        "color_blend_packed": ("Single cell color blend", "< 1 µs"),
        "color_blend_batch_10k": ("10K batch color blend", "< 100 µs"),
        "hilbert_d2xy_jit": ("Hilbert curve lookup", "< 1 µs"),
        "hilbert_d2xy_lut": ("Hilbert LUT lookup", "< 0.2 µs"),
        "premultiply_numba": ("64K pixel premultiply", "< 500 µs"),
        "rgba_to_bgra_numba": ("64K pixel conversion", "< 200 µs"),
        "region_batch_1000": ("1K point classification", "< 50 µs"),
        "region_batch_10k": ("10K point classification", "< 100 µs"),
        "pipeline_100_cells": ("100 cell render pipeline", "< 200 µs"),
        "pipeline_1000_cells": ("1000 cell render pipeline", "< 1500 µs"),
    }
    
    for r in bench.results:
        if r.name in targets:
            desc, target = targets[r.name]
            status = "✅" if r.passed else "❌"
            print(f"  {status} {desc}: {r.avg_time_us:.2f} µs (target: {target})")

    return bench.results


if __name__ == "__main__":
    main()
