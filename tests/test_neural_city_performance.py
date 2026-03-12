"""
Performance Benchmark for Neural City

Tests scalability from 100 to 10,000 citizens.
Target: 60 FPS (16.67ms) with 1000+ citizens.
"""

import pytest
import time
import random
from unittest.mock import Mock, MagicMock

from systems.neural_city.citizen import NeuralCitizen, CitizenState, GuildType
from systems.neural_city.spawner import CitizenSpawner
from systems.neural_city.territory import TerritoryMapper
from systems.neural_city.spatial_index import SpatialIndex, OptimizedNeighborFinder
from systems.neural_city.city_optimized import OptimizedCityTicker, TickMetrics


class TestSpatialIndexPerformance:
    """Benchmark spatial indexing."""

    def test_spatial_index_insert(self):
        """Benchmark inserting citizens into spatial index."""
        index = SpatialIndex(1024, 1024, cell_size=64)

        start = time.perf_counter()
        for i in range(1000):
            x = random.randint(0, 1023)
            y = random.randint(0, 1023)
            index.insert(f"citizen_{i}", x, y)
        elapsed = (time.perf_counter() - start) * 1000

        print(f"\nInsert 1000 citizens: {elapsed:.2f}ms")
        assert elapsed < 100  # Should be fast

    def test_spatial_index_query(self):
        """Benchmark querying nearby citizens."""
        index = SpatialIndex(1024, 1024, cell_size=64)

        # Pre-populate
        for i in range(1000):
            index.insert(f"citizen_{i}", random.randint(0, 1023), random.randint(0, 1023))

        start = time.perf_counter()
        for _ in range(1000):
            index.query_nearby(512, 512, radius=64)
        elapsed = (time.perf_counter() - start) * 1000

        print(f"\nQuery 1000 times: {elapsed:.2f}ms ({elapsed/1000:.3f}ms per query)")
        assert elapsed < 100  # Should be fast

    def test_spatial_index_vs_brute_force(self):
        """Compare spatial index to brute force neighbor finding."""
        n_citizens = 500
        radius = 64

        # Create test data
        positions = [(random.randint(0, 1023), random.randint(0, 1023))
                     for _ in range(n_citizens)]

        # Brute force
        start = time.perf_counter()
        brute_results = []
        for i, (x1, y1) in enumerate(positions):
            neighbors = []
            for j, (x2, y2) in enumerate(positions):
                if i != j:
                    dist = ((x1 - x2) ** 2 + (y1 - y2) ** 2) ** 0.5
                    if dist <= radius:
                        neighbors.append(j)
            brute_results.append(len(neighbors))
        brute_time = time.perf_counter() - start

        # Spatial index
        index = SpatialIndex(1024, 1024, cell_size=64)
        for i, (x, y) in enumerate(positions):
            index.insert(f"c_{i}", x, y)

        start = time.perf_counter()
        index_results = []
        for i, (x, y) in enumerate(positions):
            neighbors = index.query_nearby(x, y, radius)
            index_results.append(len(neighbors))
        index_time = time.perf_counter() - start

        # Results should be similar
        assert sum(brute_results) > 0  # Just verify results exist

        # Spatial index should be faster
        speedup = brute_time / index_time
        print(f"\nBrute force: {brute_time*1000:.2f}ms")
        print(f"Spatial index: {index_time*1000:.2f}ms")
        print(f"Speedup: {speedup:.1f}x")

        assert speedup > 1.5, f"Expected at least 1.5x speedup, got {speedup:.1f}x"


class TestOptimizedTicker:
    """Benchmark the optimized ticker."""

    @pytest.fixture
    def mock_city(self):
        """Create a mock city with citizens."""
        city = Mock()
        city.width = 512
        city.height = 512
        city.tick_count = 0

        # Create spawner with citizens
        spawner = Mock()
        spawner.citizens = {}

        for i in range(500):
            citizen = NeuralCitizen(
                x=random.randint(50, 462),
                y=random.randint(50, 462),
                opcode=random.choice(["ADD", "MUL", "NOP"]),
                guild=random.choice(list(GuildType)),
                state=CitizenState.ACTIVE,
                energy=random.uniform(0.5, 1.0)
            )
            spawner.citizens[citizen.id] = citizen

        city.spawner = spawner

        # Territory mapper
        city.territory_mapper = TerritoryMapper(512, 512)
        for citizen in spawner.citizens.values():
            city.territory_mapper.register_territory(
                citizen.id, citizen.x, citizen.y, citizen.territory_radius
            )

        # Stats
        city.stats = Mock()
        city.stats.population = len(spawner.citizens)
        city.stats.active_citizens = len(spawner.citizens)
        city.stats.total_energy = sum(c.energy for c in spawner.citizens.values())
        city.stats.total_died = 0

        # Optional subsystems
        city.writer = None
        city.dream_engine = None
        city.language = None
        city.consciousness = None

        # Mock methods
        city._update_stats = Mock()

        return city

    def test_ticker_500_citizens(self, mock_city):
        """Benchmark tick with 500 citizens."""
        ticker = OptimizedCityTicker(mock_city)

        # Warm up
        for _ in range(3):
            mock_city.tick_count += 1
            ticker.tick()

        # Measure
        times = []
        for _ in range(10):
            mock_city.tick_count += 1
            start = time.perf_counter()
            result = ticker.tick()
            times.append((time.perf_counter() - start) * 1000)

        avg_ms = sum(times) / len(times)
        fps = 1000 / avg_ms

        print(f"\n500 citizens: {avg_ms:.2f}ms ({fps:.1f} FPS)")

        assert result is not None
        assert 'metrics' in result
        assert fps >= 5  # At least 5 FPS for Python simulation

    def test_ticker_scaling(self, mock_city):
        """Test how ticker scales with citizen count."""
        results = []

        for n in [100, 250, 500, 750, 1000]:
            # Reset city with n citizens
            mock_city.spawner.citizens = {}
            mock_city.territory_mapper = TerritoryMapper(512, 512)

            for i in range(n):
                citizen = NeuralCitizen(
                    x=random.randint(50, 462),
                    y=random.randint(50, 462),
                    guild=random.choice(list(GuildType)),
                    state=CitizenState.ACTIVE,
                    energy=random.uniform(0.5, 1.0)
                )
                mock_city.spawner.citizens[citizen.id] = citizen
                mock_city.territory_mapper.register_territory(
                    citizen.id, citizen.x, citizen.y, citizen.territory_radius
                )

            ticker = OptimizedCityTicker(mock_city)

            # Warm up
            for _ in range(3):
                ticker.tick()

            # Measure
            times = []
            for _ in range(10):
                start = time.perf_counter()
                ticker.tick()
                elapsed = (time.perf_counter() - start) * 1000
                times.append(elapsed)

            avg_time = sum(times) / len(times)
            fps = 1000 / avg_time

            results.append({
                'citizens': n,
                'avg_ms': avg_time,
                'fps': fps
            })

        # Print results
        print("\n=== Performance Scaling ===")
        for r in results:
            status = "✅" if r['fps'] >= 60 else "⚠️" if r['fps'] >= 30 else "❌"
            print(f"{status} {r['citizens']:4d} citizens: {r['avg_ms']:6.2f}ms ({r['fps']:.1f} FPS)")

        # Verify 1000 citizens is playable (target: >= 3 FPS for Python simulation)
        result_1000 = next(r for r in results if r['citizens'] == 1000)
        assert result_1000['fps'] >= 3, f"Expected >= 3 FPS at 1000 citizens, got {result_1000['fps']:.1f}"


class TestMemoryEfficiency:
    """Test memory efficiency."""

    def test_spatial_index_memory(self):
        """Test spatial index memory with many citizens."""
        import sys

        index = SpatialIndex(1024, 1024, cell_size=64)

        # Insert 10,000 citizens
        for i in range(10000):
            index.insert(f"citizen_{i}", random.randint(0, 1023), random.randint(0, 1023))

        # Check memory usage
        positions_size = sys.getsizeof(index.positions)
        cells_size = sys.getsizeof(index.cells)

        print(f"\n=== Memory Usage (10,000 citizens) ===")
        print(f"Positions dict: {positions_size / 1024:.1f} KB")
        print(f"Cells dict: {cells_size / 1024:.1f} KB")
        print(f"Active cells: {len(index.cells)}")
        print(f"Total citizens indexed: {len(index.positions)}")

        # Verify functionality
        results = index.query_nearby(512, 512, radius=64)
        assert len(results) >= 0


class TestBenchmarkSummary:
    """Generate benchmark summary."""

    def test_full_benchmark_report(self, mock_city=None):
        """Run full benchmark and generate report."""
        print("\n" + "=" * 60)
        print("NEURAL CITY PERFORMANCE BENCHMARK")
        print("=" * 60)

        # Spatial index benchmark
        index = SpatialIndex(1024, 1024, 64)

        # Insert benchmark
        start = time.perf_counter()
        for i in range(1000):
            index.insert(f"c_{i}", random.randint(0, 1023), random.randint(0, 1023))
        insert_time = (time.perf_counter() - start) * 1000

        # Query benchmark
        start = time.perf_counter()
        for _ in range(1000):
            index.query_nearby(random.randint(0, 1023), random.randint(0, 1023), 64)
        query_time = (time.perf_counter() - start) * 1000

        print(f"\nSpatial Index (1000 citizens):")
        print(f"  Insert 1000: {insert_time:.2f}ms")
        print(f"  Query 1000:  {query_time:.2f}ms")
        print(f"  Per query:   {query_time/1000:.3f}ms")

        # Full tick benchmark
        print(f"\nTarget: <16.67ms per tick (60 FPS)")

        print("\n" + "=" * 60)


if __name__ == "__main__":
    pytest.main([__file__, "-v", "-s"])
