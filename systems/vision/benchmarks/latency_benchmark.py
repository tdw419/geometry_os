"""
Performance Benchmarks for Vision System.

Measures latency for various pipeline configurations.

Run with: python systems/vision/benchmarks/latency_benchmark.py
"""

import asyncio
import sys
from pathlib import Path

# Add project root to path
project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))
import time
from dataclasses import dataclass
from statistics import mean, median
from typing import List

from PIL import Image

from systems.vision.florence_model import MockFlorenceModel
from systems.vision.pipeline_executor import PipelineExecutor


@dataclass
class BenchmarkResult:
    """Result of a benchmark run."""
    name: str
    iterations: int
    mean_ms: float
    median_ms: float
    min_ms: float
    max_ms: float
    p95_ms: float


async def run_benchmark(
    executor: PipelineExecutor,
    image: Image.Image,
    steps: List[dict],
    iterations: int = 100
) -> BenchmarkResult:
    """Run a benchmark and return statistics."""
    latencies = []

    for _ in range(iterations):
        result = await executor.execute(image, steps)
        latencies.append(result.latency_ms)

    latencies.sort()
    p95_index = int(len(latencies) * 0.95)

    return BenchmarkResult(
        name=steps[0].get("op", "pipeline") if len(steps) == 1 else f"{len(steps)}-step pipeline",
        iterations=iterations,
        mean_ms=mean(latencies),
        median_ms=median(latencies),
        min_ms=min(latencies),
        max_ms=max(latencies),
        p95_ms=latencies[p95_index] if p95_index < len(latencies) else latencies[-1]
    )


def print_results(results: List[BenchmarkResult]) -> None:
    """Print benchmark results in a table."""
    print("\n" + "=" * 70)
    print("VISION SYSTEM LATENCY BENCHMARKS")
    print("=" * 70)
    print(f"{'Benchmark':<25} {'Mean':>8} {'Median':>8} {'P95':>8} {'Min':>8} {'Max':>8}")
    print("-" * 70)

    for r in results:
        print(f"{r.name:<25} {r.mean_ms:>7.1f} {r.median_ms:>7.1f} {r.p95_ms:>7.1f} {r.min_ms:>7.1f} {r.max_ms:>7.1f}")

    print("=" * 70)

    # Check targets
    print("\nTARGET CHECKS:")
    for r in results:
        if "detect" in r.name or "ocr" in r.name or "ground" in r.name:
            target = 50
            status = "✅" if r.p95_ms < target else "❌"
            print(f"  {status} Single op ({r.name}): P95={r.p95_ms:.1f}ms (target <{target}ms)")
        elif "pipeline" in r.name:
            if "3-step" in r.name:
                target = 100
            elif "5-step" in r.name:
                target = 150
            else:
                continue
            status = "✅" if r.p95_ms < target else "❌"
            print(f"  {status} {r.name}: P95={r.p95_ms:.1f}ms (target <{target}ms)")


async def main():
    """Run all benchmarks."""
    # Setup
    model = MockFlorenceModel()
    model.load()
    executor = PipelineExecutor(model)

    # Create sample image
    image = Image.new("RGB", (800, 600), color="white")

    iterations = 100
    results = []

    print(f"Running benchmarks with {iterations} iterations each...")

    # Single operation benchmarks
    print("  Benchmarking detect...")
    results.append(await run_benchmark(
        executor, image,
        [{"op": "detect", "classes": ["button"], "assign_to": "result"}],
        iterations
    ))

    print("  Benchmarking ocr...")
    results.append(await run_benchmark(
        executor, image,
        [{"op": "ocr", "assign_to": "result"}],
        iterations
    ))

    print("  Benchmarking ground...")
    results.append(await run_benchmark(
        executor, image,
        [{"op": "ground", "text": "Export", "assign_to": "result"}],
        iterations
    ))

    # Multi-step pipeline benchmarks
    print("  Benchmarking 3-step pipeline...")
    results.append(await run_benchmark(
        executor, image,
        [
            {"op": "detect", "classes": ["button"], "assign_to": "buttons"},
            {"op": "ground", "text": "Export", "assign_to": "export_btn"},
            {"op": "click_point", "source": "$export_btn", "assign_to": "click"}
        ],
        iterations
    ))

    print("  Benchmarking 5-step pipeline...")
    results.append(await run_benchmark(
        executor, image,
        [
            {"op": "detect", "classes": ["button", "input"], "assign_to": "elements"},
            {"op": "ground", "text": "Export", "assign_to": "export_btn"},
            {"op": "relative", "anchor": "$export_btn", "direction": "below", "source": "$elements", "assign_to": "nearby"},
            {"op": "contains", "source": "$elements", "text": "Cancel", "assign_to": "cancel_btn"},
            {"op": "click_point", "source": "$cancel_btn", "assign_to": "click"}
        ],
        iterations
    ))

    # Print results
    print_results(results)

    # Note about mock model
    print("\nNOTE: These benchmarks use MockFlorenceModel for testing.")
    print("Real performance will depend on Florence-2 model inference time.")


if __name__ == "__main__":
    asyncio.run(main())
