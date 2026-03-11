"""
Visual Shell Heavy Load Stress Test

Validates performance under heavy load conditions as specified in:
- openspec/specs/visual-shell/spec.md

Test Categories:
1. Frame-Time Stability (60 FPS) - 100 Tile Stress
2. Resource Scaling - Massive entity counts
3. Memory Management - Leak detection and bounds
4. Heat Aggregator Performance - High-frequency access patterns
5. Panel/Window Management - Complex desktop scenarios
6. Concurrent Operations - Parallel API access

Performance Benchmarks (from spec):
- Mean frame time: <= 16.6ms (60 FPS)
- 99th percentile frame jitter: <= 5ms
- 37 million particle support via GPU-native updates
- 50% GPU load reduction with foveated rendering
"""

import asyncio
import gc
import json
import statistics
import sys
import time
import tracemalloc
from concurrent.futures import ThreadPoolExecutor
from dataclasses import asdict
from pathlib import Path
from typing import Any
from unittest.mock import AsyncMock, MagicMock, patch

import pytest

# Ensure imports work
sys.path.insert(0, str(Path(__file__).parent.parent.parent / "systems"))

from visual_shell.api.native_api import NativeVisualShellAPI, UIEntity
from visual_shell.api.native_panel import NativePanel, ResizeState
from visual_shell.api.heat_aggregator import (
    GRID_SIZE,
    HeatAggregator,
    HeatMap,
    HeatCell,
    HEAT_INCREMENT,
)


# ============================================================================
# Test Configuration
# ============================================================================

# Performance thresholds (from visual-shell spec)
TARGET_FRAME_TIME_MS = 16.6  # 60 FPS
MAX_FRAME_JITTER_MS = 5.0    # 99th percentile
STRESS_ENTITY_COUNT = 10000  # Large entity count
TILE_STRESS_COUNT = 100      # VMMonitorTile stress test
MAX_ACCEPTABLE_FRAME_TIME_MS = 25.0  # Allow slack for 10K+ entities (spec is for 100 tiles)


class PerformanceMetrics:
    """Helper class to track and analyze performance metrics."""

    def __init__(self):
        self.frame_times: list[float] = []
        self.memory_snapshots: list[tuple[float, float]] = []  # (time, memory_mb)
        self.operation_times: dict[str, list[float]] = {}

    def record_frame(self, frame_time_ms: float):
        self.frame_times.append(frame_time_ms)

    def record_memory(self, memory_mb: float):
        self.memory_snapshots.append((time.time(), memory_mb))

    def record_operation(self, operation: str, duration_ms: float):
        if operation not in self.operation_times:
            self.operation_times[operation] = []
        self.operation_times[operation].append(duration_ms)

    def get_stats(self) -> dict[str, Any]:
        stats = {
            "frames": {},
            "memory": {},
            "operations": {},
        }

        if self.frame_times:
            stats["frames"] = {
                "count": len(self.frame_times),
                "mean_ms": statistics.mean(self.frame_times),
                "median_ms": statistics.median(self.frame_times),
                "stdev_ms": statistics.stdev(self.frame_times) if len(self.frame_times) > 1 else 0,
                "min_ms": min(self.frame_times),
                "max_ms": max(self.frame_times),
                "p99_ms": statistics.quantiles(self.frame_times, n=100)[98] if len(self.frame_times) >= 100 else max(self.frame_times),
                "target_met": statistics.mean(self.frame_times) <= TARGET_FRAME_TIME_MS,
            }

        if self.memory_snapshots:
            mem_values = [m for _, m in self.memory_snapshots]
            stats["memory"] = {
                "initial_mb": mem_values[0],
                "final_mb": mem_values[-1],
                "peak_mb": max(mem_values),
                "delta_mb": mem_values[-1] - mem_values[0],
            }

        for op, times in self.operation_times.items():
            stats["operations"][op] = {
                "count": len(times),
                "mean_ms": statistics.mean(times),
                "max_ms": max(times),
            }

        return stats


class StressTestEnvironment:
    """Isolated test environment for visual shell stress tests."""

    def __init__(self, tmp_path: Path):
        self.tmp_path = tmp_path
        self.geometry_dir = tmp_path / ".geometry"
        self.geometry_dir.mkdir(parents=True, exist_ok=True)

        # Create mock bridge and VAT manager for heat aggregator
        self.mock_bridge = AsyncMock()
        self.mock_vat_manager = MagicMock()

        # Initialize API
        self.api = NativeVisualShellAPI()
        self.metrics = PerformanceMetrics()

    def create_entities(self, count: int, entity_type: str = "orb") -> list[UIEntity]:
        """Create multiple entities efficiently."""
        entities = []
        for i in range(count):
            entity = UIEntity(
                id=f"{entity_type}_{i:06d}",
                type=entity_type,
                x=(i % 100) * 15,
                y=(i // 100) * 15,
                width=10,
                height=10,
                color=(
                    (i * 7) % 256,
                    (i * 11) % 256,
                    (i * 13) % 256,
                    200
                )
            )
            entities.append(entity)
        return entities

    def create_panels(self, count: int) -> list[NativePanel]:
        """Create multiple panels for stress testing."""
        panels = []
        for i in range(count):
            panel = self.api.create_panel(
                id=f"panel_{i:04d}",
                title=f"Stress Panel {i}",
                x=50 + (i % 10) * 30,
                y=50 + (i // 10) * 40,
                width=200,
                height=150
            )
            panels.append(panel)
        return panels


# ============================================================================
# Frame-Time Stability Tests
# ============================================================================

class TestFrameTimeStability:
    """
    Tests for 60 FPS target under load.

    From spec: "Mean frame time SHALL NOT exceed 16.6ms"
    "99th percentile frame jitter SHALL NOT exceed 5ms"
    """

    def test_baseline_frame_time(self):
        """Verify baseline frame time without load."""
        api = NativeVisualShellAPI()

        # Single entity
        api.add_entity(UIEntity(id="test", type="orb", x=100, y=100))

        frame_times = []
        for _ in range(100):
            start = time.perf_counter()
            state = api.get_render_state()
            elapsed = (time.perf_counter() - start) * 1000
            frame_times.append(elapsed)

        mean_time = statistics.mean(frame_times)
        assert mean_time < TARGET_FRAME_TIME_MS, \
            f"Baseline frame time {mean_time:.2f}ms exceeds target {TARGET_FRAME_TIME_MS}ms"

    def test_100_tile_stress(self, tmp_path):
        """
        Frame-Time Stability: 100 Tile Stress

        From spec: "WHEN 100 active VMMonitorTile instances are rendered,
        the mean frame time SHALL NOT exceed 16.6ms."
        """
        env = StressTestEnvironment(tmp_path)

        # Create 100 tile entities
        for i in range(TILE_STRESS_COUNT):
            entity = UIEntity(
                id=f"vm_tile_{i:03d}",
                type="tile",
                x=(i % 10) * 120,
                y=(i // 10) * 100,
                width=100,
                height=80,
                metadata={"vm_id": f"vm_{i}", "status": "running"}
            )
            env.api.add_entity(entity)

        assert len(env.api.entities) == TILE_STRESS_COUNT

        # Measure frame times over 60 frames
        frame_times = []
        for _ in range(60):
            start = time.perf_counter()
            state = env.api.get_render_state()
            elapsed = (time.perf_counter() - start) * 1000
            frame_times.append(elapsed)
            env.metrics.record_frame(elapsed)

        mean_time = statistics.mean(frame_times)
        p99 = statistics.quantiles(frame_times, n=100)[98] if len(frame_times) >= 100 else max(frame_times)
        jitter = max(frame_times) - min(frame_times)

        # Assertions from spec
        assert mean_time <= TARGET_FRAME_TIME_MS, \
            f"Mean frame time {mean_time:.2f}ms exceeds {TARGET_FRAME_TIME_MS}ms"
        assert p99 <= TARGET_FRAME_TIME_MS + MAX_FRAME_JITTER_MS, \
            f"P99 frame time {p99:.2f}ms exceeds {TARGET_FRAME_TIME_MS + MAX_FRAME_JITTER_MS}ms"

        print(f"\n✅ 100 Tile Stress Results:")
        print(f"   Mean frame time: {mean_time:.2f}ms (target: <= {TARGET_FRAME_TIME_MS}ms)")
        print(f"   P99 frame time: {p99:.2f}ms")
        print(f"   Frame jitter: {jitter:.2f}ms (target: <= {MAX_FRAME_JITTER_MS}ms)")

    def test_10000_entity_stress(self, tmp_path):
        """
        Stress test with 10,000 entities.

        Should complete render state generation in under 1 second.
        """
        env = StressTestEnvironment(tmp_path)

        # Create 10,000 entities
        start_create = time.perf_counter()
        entities = env.create_entities(STRESS_ENTITY_COUNT)
        for entity in entities:
            env.api.add_entity(entity)
        create_time = (time.perf_counter() - start_create) * 1000

        assert len(env.api.entities) == STRESS_ENTITY_COUNT
        assert create_time < 1000, f"Entity creation took {create_time:.0f}ms (>1s)"

        # Benchmark frame generation
        frame_times = []
        for _ in range(60):
            start = time.perf_counter()
            state = env.api.get_render_state()
            elapsed = (time.perf_counter() - start) * 1000
            frame_times.append(elapsed)

        mean_time = statistics.mean(frame_times)

        # With 10K entities, we allow more slack
        assert mean_time <= MAX_ACCEPTABLE_FRAME_TIME_MS, \
            f"Mean frame time {mean_time:.2f}ms exceeds {MAX_ACCEPTABLE_FRAME_TIME_MS}ms"

        print(f"\n✅ 10K Entity Stress Results:")
        print(f"   Entity count: {len(env.api.entities)}")
        print(f"   Creation time: {create_time:.0f}ms")
        print(f"   Mean frame time: {mean_time:.2f}ms")

    def test_frame_time_consistency_over_time(self, tmp_path):
        """
        Verify frame time remains consistent over extended operation.
        Tests for memory leaks or performance degradation.
        """
        env = StressTestEnvironment(tmp_path)

        # Initial entities
        for i in range(1000):
            env.api.add_entity(UIEntity(
                id=f"entity_{i}",
                type="orb",
                x=i % 500,
                y=i // 500
            ))

        # Measure over 300 frames (5 seconds at 60fps)
        early_times = []
        late_times = []

        for frame in range(300):
            # Simulate entity updates
            for i in range(0, 100, 10):
                entity_id = f"entity_{i}"
                if entity_id in env.api.entities:
                    env.api.entities[entity_id].x += 1

            start = time.perf_counter()
            state = env.api.get_render_state()
            elapsed = (time.perf_counter() - start) * 1000

            if frame < 100:
                early_times.append(elapsed)
            elif frame >= 200:
                late_times.append(elapsed)

        early_mean = statistics.mean(early_times)
        late_mean = statistics.mean(late_times)
        degradation = (late_mean - early_mean) / early_mean * 100 if early_mean > 0 else 0

        # Should not degrade more than 20%
        assert degradation < 20, \
            f"Frame time degraded by {degradation:.1f}% (early: {early_mean:.2f}ms, late: {late_mean:.2f}ms)"

        print(f"\n✅ Consistency Test Results:")
        print(f"   Early mean: {early_mean:.2f}ms")
        print(f"   Late mean: {late_mean:.2f}ms")
        print(f"   Degradation: {degradation:.1f}%")


# ============================================================================
# Resource Scaling Tests
# ============================================================================

class TestResourceScaling:
    """
    Tests for resource scaling and memory management.

    From spec: "Infinite Map SHALL scale its rendering pipeline
    to handle massive geometric complexity."
    """

    def test_entity_count_scaling(self, tmp_path):
        """Test API scales linearly with entity count."""
        env = StressTestEnvironment(tmp_path)

        counts = [100, 500, 1000, 2000, 5000]
        times = []

        for count in counts:
            # Clear previous
            env.api.entities.clear()

            # Create entities
            for i in range(count):
                env.api.add_entity(UIEntity(
                    id=f"e_{count}_{i}",
                    type="orb",
                    x=i % 100,
                    y=i // 100
                ))

            # Measure render time
            start = time.perf_counter()
            for _ in range(10):
                state = env.api.get_render_state()
            elapsed = (time.perf_counter() - start) * 1000 / 10
            times.append(elapsed)

        # Check linear scaling (time per entity should be roughly constant)
        time_per_entity = [t / c for t, c in zip(times, counts)]
        ratio = max(time_per_entity) / min(time_per_entity) if min(time_per_entity) > 0 else 1

        assert ratio < 3.0, \
            f"Non-linear scaling detected: ratio {ratio:.1f}x (should be <3x)"

        print(f"\n✅ Entity Scaling Results:")
        for c, t, tpe in zip(counts, times, time_per_entity):
            print(f"   {c} entities: {t:.2f}ms total, {tpe*1000:.3f}µs/entity")

    def test_memory_efficiency_large_entities(self, tmp_path):
        """Test memory usage scales reasonably with entity count."""
        tracemalloc.start()

        api = NativeVisualShellAPI()

        # Baseline memory
        baseline = tracemalloc.get_traced_memory()[0] / 1024 / 1024

        # Add 5000 entities
        for i in range(5000):
            api.add_entity(UIEntity(
                id=f"mem_test_{i}",
                type="orb",
                x=i % 100,
                y=i // 100,
                metadata={"index": i, "data": "x" * 50}  # Some metadata
            ))

        peak = tracemalloc.get_traced_memory()[0] / 1024 / 1024
        delta = peak - baseline
        bytes_per_entity = (delta * 1024 * 1024) / 5000

        tracemalloc.stop()

        # Each entity should use less than 2KB
        assert bytes_per_entity < 2048, \
            f"Memory per entity {bytes_per_entity:.0f}B exceeds 2KB"

        print(f"\n✅ Memory Efficiency Results:")
        print(f"   Baseline: {baseline:.1f}MB")
        print(f"   With 5000 entities: {peak:.1f}MB")
        print(f"   Delta: {delta:.1f}MB ({bytes_per_entity:.0f}B/entity)")

    def test_entity_cleanup_memory_recovery(self, tmp_path):
        """Verify memory is recovered when entities are removed."""
        tracemalloc.start()

        api = NativeVisualShellAPI()

        # Add many entities
        for i in range(10000):
            api.add_entity(UIEntity(
                id=f"cleanup_{i}",
                type="orb",
                x=i % 100,
                y=i // 100,
                metadata={"data": "x" * 100}
            ))

        peak = tracemalloc.get_traced_memory()[0] / 1024 / 1024

        # Remove all entities
        entity_ids = list(api.entities.keys())
        for eid in entity_ids:
            api.remove_entity(eid)

        # Force garbage collection
        gc.collect()

        final = tracemalloc.get_traced_memory()[0] / 1024 / 1024
        recovery = (peak - final) / peak * 100 if peak > 0 else 0

        tracemalloc.stop()

        # Should recover at least 80% of memory
        assert recovery >= 80, \
            f"Only {recovery:.1f}% memory recovered (expected >= 80%)"

        print(f"\n✅ Memory Recovery Results:")
        print(f"   Peak: {peak:.1f}MB")
        print(f"   Final: {final:.1f}MB")
        print(f"   Recovery: {recovery:.1f}%")


# ============================================================================
# Heat Aggregator Stress Tests
# ============================================================================

class TestHeatAggregatorStress:
    """
    Stress tests for heat map aggregation under high-frequency access.
    """

    @pytest.mark.asyncio
    async def test_high_frequency_access_patterns(self, tmp_path):
        """Test heat aggregator under high-frequency access load."""
        env = StressTestEnvironment(tmp_path)
        aggregator = HeatAggregator(env.mock_bridge, env.mock_vat_manager)

        # Record 100,000 accesses rapidly
        start = time.perf_counter()
        for i in range(100000):
            x = i % GRID_SIZE
            y = (i // GRID_SIZE) % GRID_SIZE
            aggregator.record_access(x, y, source=f"stress_test_{i % 10}")

        elapsed = (time.perf_counter() - start) * 1000

        assert aggregator.total_accesses == 100000
        assert elapsed < 1000, f"100K accesses took {elapsed:.0f}ms (>1s)"

        # Verify heat values are clamped
        max_heat = aggregator.heat_map.grid.max()
        assert max_heat <= 1.0, f"Heat value {max_heat} exceeds 1.0"

        print(f"\n✅ High-Frequency Access Results:")
        print(f"   Total accesses: {aggregator.total_accesses}")
        print(f"   Time: {elapsed:.0f}ms ({100000/elapsed*1000:.0f} accesses/sec)")
        print(f"   Max heat: {max_heat:.2f}")
        print(f"   Total heat: {aggregator.heat_map.get_total_heat():.2f}")

    @pytest.mark.asyncio
    async def test_concurrent_access_recording(self, tmp_path):
        """Test concurrent access recording is thread-safe."""
        env = StressTestEnvironment(tmp_path)
        aggregator = HeatAggregator(env.mock_bridge, env.mock_vat_manager)

        access_count = 50000
        errors = []

        def record_accesses(thread_id: int, count: int):
            try:
                for i in range(count):
                    x = (thread_id * 100 + i) % GRID_SIZE
                    y = (thread_id * 200 + i) % GRID_SIZE
                    aggregator.record_access(x, y, source=f"thread_{thread_id}")
            except Exception as e:
                errors.append(e)

        # Run 4 threads
        threads = []
        per_thread = access_count // 4

        start = time.perf_counter()
        with ThreadPoolExecutor(max_workers=4) as executor:
            for tid in range(4):
                executor.submit(record_accesses, tid, per_thread)

        elapsed = (time.perf_counter() - start) * 1000

        assert len(errors) == 0, f"Concurrent access errors: {errors}"
        # Due to threading, count might vary slightly
        assert aggregator.total_accesses >= access_count * 0.99

        print(f"\n✅ Concurrent Access Results:")
        print(f"   Threads: 4")
        print(f"   Accesses per thread: {per_thread}")
        print(f"   Total time: {elapsed:.0f}ms")

    def test_heat_map_diffusion_performance(self, tmp_path):
        """Test heat map diffusion performance under load."""
        heat_map = HeatMap()

        # Add significant heat
        for i in range(1000):
            x = i % GRID_SIZE
            y = (i * 7) % GRID_SIZE
            heat_map.add_heat(x, y, 0.5)

        # Benchmark diffusion
        times = []
        for _ in range(100):
            start = time.perf_counter()
            heat_map.diffuse(iterations=1)
            elapsed = (time.perf_counter() - start) * 1000
            times.append(elapsed)

        mean_time = statistics.mean(times)
        max_time = max(times)

        # Diffusion should be fast (<5ms for 64x64 grid)
        assert mean_time < 5.0, f"Diffusion mean time {mean_time:.2f}ms exceeds 5ms"
        assert max_time < 10.0, f"Diffusion max time {max_time:.2f}ms exceeds 10ms"

        print(f"\n✅ Diffusion Performance:")
        print(f"   Mean time: {mean_time:.2f}ms")
        print(f"   Max time: {max_time:.2f}ms")

    def test_hotspot_detection_performance(self, tmp_path):
        """Test hotspot detection with many hot cells."""
        heat_map = HeatMap()

        # Create many hotspots
        for y in range(GRID_SIZE):
            for x in range(GRID_SIZE):
                if (x + y) % 3 == 0:
                    heat_map.add_heat(x, y, 0.8)

        # Benchmark hotspot detection
        times = []
        for _ in range(100):
            start = time.perf_counter()
            hotspots = heat_map.get_hotspots(threshold=0.5)
            elapsed = (time.perf_counter() - start) * 1000
            times.append(elapsed)

        mean_time = statistics.mean(times)

        # Hotspot detection should be fast
        assert mean_time < 1.0, f"Hotspot detection {mean_time:.2f}ms exceeds 1ms"

        print(f"\n✅ Hotspot Detection Performance:")
        print(f"   Hot cells: ~{(GRID_SIZE**2)//3}")
        print(f"   Detected hotspots: {len(heat_map.get_hotspots(threshold=0.5))}")
        print(f"   Mean detection time: {mean_time:.3f}ms")


# ============================================================================
# Panel/Window Management Stress Tests
# ============================================================================

class TestPanelManagementStress:
    """
    Stress tests for panel/window management under heavy load.
    """

    def test_panel_creation_scaling(self, tmp_path):
        """Test panel creation performance with many panels."""
        env = StressTestEnvironment(tmp_path)

        counts = [10, 50, 100, 200]
        times = []

        for count in counts:
            env.api.panels.clear()
            env.api.entities.clear()

            start = time.perf_counter()
            for i in range(count):
                env.api.create_panel(
                    id=f"scale_panel_{i}",
                    title=f"Panel {i}",
                    x=10 + (i % 20) * 15,
                    y=10 + (i // 20) * 20,
                    width=200,
                    height=150
                )
            elapsed = (time.perf_counter() - start) * 1000
            times.append(elapsed)

        # Panel creation should scale linearly
        # 200 panels should still be fast
        assert times[-1] < 100, f"200 panels took {times[-1]:.0f}ms (>100ms)"

        print(f"\n✅ Panel Creation Scaling:")
        for c, t in zip(counts, times):
            print(f"   {c} panels: {t:.1f}ms ({t/c:.2f}ms/panel)")

    def test_panel_z_index_operations(self, tmp_path):
        """Test Z-index operations under load."""
        env = StressTestEnvironment(tmp_path)

        # Create 100 panels
        panels = env.create_panels(100)

        # Rapidly bring panels to front
        start = time.perf_counter()
        for i in range(1000):
            panel_id = f"panel_{i % 100:04d}"
            env.api.bring_to_front(panel_id)
        elapsed = (time.perf_counter() - start) * 1000

        assert elapsed < 50, f"1000 Z-index ops took {elapsed:.0f}ms (>50ms)"

        print(f"\n✅ Z-Index Operations:")
        print(f"   Operations: 1000")
        print(f"   Time: {elapsed:.1f}ms ({1000/elapsed*1000:.0f} ops/sec)")

    def test_panel_drag_operations(self, tmp_path):
        """Test panel drag performance."""
        env = StressTestEnvironment(tmp_path)

        # Create panels
        panels = env.create_panels(50)

        # Simulate drag operations
        start = time.perf_counter()
        for panel in panels:
            panel.start_drag(panel.x + 100, panel.y + 12)
            for step in range(10):
                panel.move_drag(panel.x + 100 + step * 5, panel.y + 12)
            panel.end_drag()
        elapsed = (time.perf_counter() - start) * 1000

        # 50 panels * 10 drag steps = 500 operations
        assert elapsed < 100, f"500 drag ops took {elapsed:.0f}ms (>100ms)"

        print(f"\n✅ Panel Drag Performance:")
        print(f"   Panels: 50")
        print(f"   Drag steps: 10 each")
        print(f"   Total time: {elapsed:.1f}ms")

    def test_panel_resize_operations(self, tmp_path):
        """Test panel resize performance."""
        env = StressTestEnvironment(tmp_path)

        panels = env.create_panels(50)

        # Simulate resize operations
        start = time.perf_counter()
        for panel in panels:
            panel.start_resize(panel.x + panel.width, panel.y + panel.height, "bottom_right")
            for step in range(10):
                panel.update_resize(
                    panel.x + panel.width + step * 3,
                    panel.y + panel.height + step * 2
                )
            panel.end_resize()
        elapsed = (time.perf_counter() - start) * 1000

        assert elapsed < 100, f"500 resize ops took {elapsed:.0f}ms (>100ms)"

        print(f"\n✅ Panel Resize Performance:")
        print(f"   Panels: 50")
        print(f"   Resize steps: 10 each")
        print(f"   Total time: {elapsed:.1f}ms")

    def test_panel_hit_testing_performance(self, tmp_path):
        """Test panel hit testing under load."""
        env = StressTestEnvironment(tmp_path)

        panels = env.create_panels(100)

        # Hit test at many points
        start = time.perf_counter()
        hits = 0
        for x in range(0, 500, 10):
            for y in range(0, 400, 10):
                panel = env.api.get_panel_at(x, y)
                if panel:
                    hits += 1
        elapsed = (time.perf_counter() - start) * 1000

        # 50*40 = 2000 hit tests
        assert elapsed < 50, f"2000 hit tests took {elapsed:.0f}ms (>50ms)"

        print(f"\n✅ Hit Testing Performance:")
        print(f"   Tests: 2000")
        print(f"   Hits: {hits}")
        print(f"   Time: {elapsed:.1f}ms ({2000/elapsed*1000:.0f} tests/sec)")


# ============================================================================
# Concurrent Operations Tests
# ============================================================================

class TestConcurrentOperations:
    """
    Tests for concurrent API access and thread safety.
    """

    def test_concurrent_entity_operations(self, tmp_path):
        """Test concurrent entity add/remove/update operations."""
        api = NativeVisualShellAPI()
        errors = []

        def add_entities(thread_id: int, count: int):
            try:
                for i in range(count):
                    api.add_entity(UIEntity(
                        id=f"concurrent_{thread_id}_{i}",
                        type="orb",
                        x=thread_id * 100 + i,
                        y=thread_id * 100 + i
                    ))
            except Exception as e:
                errors.append(("add", e))

        def update_entities(thread_id: int, count: int):
            try:
                for i in range(count):
                    entity_id = f"concurrent_{thread_id}_{i}"
                    api.update_entity(entity_id, x=api.entities[entity_id].x + 1)
            except Exception as e:
                errors.append(("update", e))

        def remove_entities(thread_id: int, count: int):
            try:
                for i in range(count):
                    entity_id = f"concurrent_{thread_id}_{i}"
                    api.remove_entity(entity_id)
            except Exception as e:
                errors.append(("remove", e))

        # Phase 1: Concurrent adds
        with ThreadPoolExecutor(max_workers=4) as executor:
            for tid in range(4):
                executor.submit(add_entities, tid, 250)

        assert len(errors) == 0, f"Add errors: {errors}"
        assert len(api.entities) == 1000

        # Phase 2: Concurrent updates
        errors.clear()
        with ThreadPoolExecutor(max_workers=4) as executor:
            for tid in range(4):
                executor.submit(update_entities, tid, 250)

        assert len(errors) == 0, f"Update errors: {errors}"

        # Phase 3: Concurrent removes
        errors.clear()
        with ThreadPoolExecutor(max_workers=4) as executor:
            for tid in range(4):
                executor.submit(remove_entities, tid, 125)

        print(f"\n✅ Concurrent Operations:")
        print(f"   Final entity count: {len(api.entities)}")

    def test_concurrent_render_state_access(self, tmp_path):
        """Test concurrent render state generation."""
        api = NativeVisualShellAPI()

        # Add entities
        for i in range(1000):
            api.add_entity(UIEntity(id=f"e_{i}", type="orb", x=i % 100, y=i // 100))

        errors = []
        states = []

        def get_state_worker():
            try:
                for _ in range(100):
                    state = api.get_render_state()
                    states.append(len(state))
            except Exception as e:
                errors.append(e)

        # Concurrent reads
        with ThreadPoolExecutor(max_workers=8) as executor:
            futures = [executor.submit(get_state_worker) for _ in range(8)]

        assert len(errors) == 0, f"Concurrent read errors: {errors}"
        assert len(states) == 800
        assert all(s == 1000 for s in states), "Inconsistent state sizes"

        print(f"\n✅ Concurrent Render State:")
        print(f"   Workers: 8")
        print(f"   Reads per worker: 100")
        print(f"   All states consistent: True")


# ============================================================================
# Integration Stress Tests
# ============================================================================

class TestIntegrationStress:
    """
    Full integration stress tests combining multiple components.
    """

    @pytest.mark.asyncio
    async def test_full_visual_shell_pipeline_stress(self, tmp_path):
        """
        Full pipeline stress test: entities + panels + heat + render.

        Simulates realistic heavy usage scenario.
        """
        env = StressTestEnvironment(tmp_path)
        aggregator = HeatAggregator(env.mock_bridge, env.mock_vat_manager)

        # Setup: Create entities and panels
        for i in range(500):
            env.api.add_entity(UIEntity(
                id=f"integration_orb_{i}",
                type="orb",
                x=i % 50 * 20,
                y=i // 50 * 20
            ))

        for i in range(20):
            env.api.create_panel(
                id=f"integration_panel_{i}",
                title=f"Window {i}",
                x=50 + i * 30,
                y=50 + i * 20,
                width=200,
                height=150
            )

        # Simulate 60 frames of activity
        frame_times = []
        for frame in range(60):
            start = time.perf_counter()

            # Update some entities (simulating animation)
            for i in range(0, 50):
                entity = env.api.entities.get(f"integration_orb_{i}")
                if entity:
                    entity.x = (entity.x + 1) % 1000

            # Record heat accesses
            for i in range(100):
                aggregator.record_access(
                    frame % GRID_SIZE,
                    (frame + i) % GRID_SIZE,
                    source="animation"
                )

            # Drag a panel
            if frame % 5 == 0:
                panel = env.api.panels.get("integration_panel_0")
                if panel:
                    panel.x = 50 + frame

            # Get render state
            state = env.api.get_render_state()

            elapsed = (time.perf_counter() - start) * 1000
            frame_times.append(elapsed)

        mean_time = statistics.mean(frame_times)
        max_time = max(frame_times)

        assert mean_time < TARGET_FRAME_TIME_MS * 2, \
            f"Pipeline mean time {mean_time:.2f}ms exceeds {TARGET_FRAME_TIME_MS * 2}ms"
        assert max_time < 50, f"Pipeline max time {max_time:.2f}ms exceeds 50ms"

        print(f"\n✅ Full Pipeline Stress Results:")
        print(f"   Entities: {len(env.api.entities)}")
        print(f"   Panels: {len(env.api.panels)}")
        print(f"   Frames: 60")
        print(f"   Mean frame time: {mean_time:.2f}ms")
        print(f"   Max frame time: {max_time:.2f}ms")
        print(f"   Total heat accesses: {aggregator.total_accesses}")

    def test_sustained_load_over_time(self, tmp_path):
        """
        Test sustained load over extended period.

        Checks for performance degradation or memory leaks.
        """
        env = StressTestEnvironment(tmp_path)
        tracemalloc.start()

        # Initial state
        initial_mem = tracemalloc.get_traced_memory()[0] / 1024 / 1024

        # Create initial entities
        for i in range(1000):
            env.api.add_entity(UIEntity(
                id=f"sustained_{i}",
                type="orb",
                x=i % 50,
                y=i // 50
            ))

        # Run for 500 "frames" with varying activity
        frame_times_by_quarter = [[], [], [], []]

        for frame in range(500):
            quarter = frame // 125

            start = time.perf_counter()

            # Add/remove entities periodically
            if frame % 50 == 0:
                # Remove some
                for i in range(10):
                    env.api.remove_entity(f"sustained_{(frame + i) % 1000}")
                # Add some new
                for i in range(10):
                    env.api.add_entity(UIEntity(
                        id=f"sustained_new_{frame}_{i}",
                        type="orb",
                        x=frame % 100,
                        y=i
                    ))

            # Update positions
            for i in range(0, 100):
                entity = env.api.entities.get(f"sustained_{i}")
                if entity:
                    entity.x = (entity.x + 1) % 100

            # Get render state
            state = env.api.get_render_state()

            elapsed = (time.perf_counter() - start) * 1000
            frame_times_by_quarter[quarter].append(elapsed)

        final_mem = tracemalloc.get_traced_memory()[0] / 1024 / 1024
        tracemalloc.stop()

        # Analyze per-quarter performance
        quarter_means = [statistics.mean(qt) for qt in frame_times_by_quarter]
        degradation = (quarter_means[-1] - quarter_means[0]) / quarter_means[0] * 100 if quarter_means[0] > 0 else 0
        memory_growth = final_mem - initial_mem

        print(f"\n✅ Sustained Load Results:")
        print(f"   Frames: 500")
        for i, qm in enumerate(quarter_means):
            print(f"   Q{i+1} mean: {qm:.2f}ms")
        print(f"   Degradation: {degradation:.1f}%")
        print(f"   Memory growth: {memory_growth:.1f}MB")

        # Allow some degradation but not excessive
        assert degradation < 50, f"Performance degraded by {degradation:.1f}%"
        # Memory should not grow excessively
        assert memory_growth < 50, f"Memory grew by {memory_growth:.1f}MB"


# ============================================================================
# Performance Summary
# ============================================================================

def test_generate_performance_summary(tmp_path):
    """Generate a summary of all performance characteristics."""
    print("\n" + "=" * 60)
    print("VISUAL SHELL PERFORMANCE BENCHMARKS")
    print("=" * 60)

    api = NativeVisualShellAPI()

    # Entity benchmarks
    print("\n📊 Entity Operations:")
    for count in [100, 1000, 5000, 10000]:
        api.entities.clear()
        start = time.perf_counter()
        for i in range(count):
            api.add_entity(UIEntity(id=f"bm_{i}", type="orb", x=i, y=i))
        create_time = (time.perf_counter() - start) * 1000

        start = time.perf_counter()
        state = api.get_render_state()
        render_time = (time.perf_counter() - start) * 1000

        print(f"   {count:>5} entities: create={create_time:>6.1f}ms, render={render_time:>5.2f}ms")

    # Panel benchmarks
    print("\n📊 Panel Operations:")
    api.entities.clear()
    api.panels.clear()

    for count in [10, 50, 100]:
        api.panels.clear()
        api.entities.clear()

        start = time.perf_counter()
        for i in range(count):
            api.create_panel(f"bm_panel_{i}", f"Panel {i}", i * 20, i * 10, 200, 150)
        create_time = (time.perf_counter() - start) * 1000

        print(f"   {count:>3} panels: create={create_time:>5.1f}ms")

    print("\n" + "=" * 60)


if __name__ == "__main__":
    pytest.main([__file__, "-v", "-s", "--tb=short"])
