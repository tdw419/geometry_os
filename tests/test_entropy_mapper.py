# tests/test_entropy_mapper.py
"""
Tests for EntropyMapper - identifies cold spots (unused code) and hot spots (bottlenecks)
for the Intrinsic Curiosity Engine.
"""
import pytest
from typing import Dict, Any

from systems.sisyphus.performance_monitor import PerformanceMonitor


class TestEntropyMapperModule:
    """Test module and class existence."""

    def test_entropy_mapper_module_exists(self):
        """Test that entropy_mapper module can be imported."""
        from systems.sisyphus import entropy_mapper
        assert entropy_mapper is not None

    def test_entropy_mapper_has_entropy_spot_class(self):
        """Test that EntropySpot dataclass exists."""
        from systems.sisyphus.entropy_mapper import EntropySpot
        assert EntropySpot is not None

    def test_entropy_mapper_class_exists(self):
        """Test that EntropyMapper class exists."""
        from systems.sisyphus.entropy_mapper import EntropyMapper
        assert EntropyMapper is not None


class TestEntropySpot:
    """Test EntropySpot dataclass."""

    def test_entropy_spot_has_required_fields(self):
        """Test EntropySpot has all required fields."""
        from systems.sisyphus.entropy_mapper import EntropySpot

        spot = EntropySpot(
            file_path="/path/to/file.py",
            entropy_type="cold",
            score=0.75,
            metrics={"calls": 5}
        )

        assert spot.file_path == "/path/to/file.py"
        assert spot.entropy_type == "cold"
        assert spot.score == 0.75
        assert spot.metrics == {"calls": 5}
        assert spot.function_name is None
        assert spot.source_line is None

    def test_entropy_spot_sorting_by_score(self):
        """Test EntropySpot sorts by score descending."""
        from systems.sisyphus.entropy_mapper import EntropySpot

        spots = [
            EntropySpot(file_path="a.py", entropy_type="cold", score=0.3, metrics={}),
            EntropySpot(file_path="b.py", entropy_type="hot", score=0.9, metrics={}),
            EntropySpot(file_path="c.py", entropy_type="cold", score=0.5, metrics={}),
        ]

        sorted_spots = sorted(spots)

        assert sorted_spots[0].score == 0.9
        assert sorted_spots[1].score == 0.5
        assert sorted_spots[2].score == 0.3


class TestEntropyMapper:
    """Test EntropyMapper class."""

    def setup_method(self):
        """Create a fresh PerformanceMonitor and EntropyMapper for each test."""
        self.perf_monitor = PerformanceMonitor()
        # Import here to ensure fresh import after module creation
        from systems.sisyphus.entropy_mapper import EntropyMapper
        self.mapper = EntropyMapper(self.perf_monitor)

    def test_map_entropy_returns_list(self):
        """Test that map_entropy returns a list of EntropySpots."""
        from systems.sisyphus.entropy_mapper import EntropySpot

        result = self.mapper.map_entropy()

        assert isinstance(result, list)
        # Empty monitor should return empty list
        assert len(result) == 0

    def test_detect_cold_spots(self):
        """Test detection of cold spots (low call count functions)."""
        # Register and call a function only 3 times (below cold_threshold of 10)
        self.perf_monitor.register_function("rare_function", "rare.py", 10)
        for _ in range(3):
            self.perf_monitor.record_call("rare_function", duration_ms=1.0)

        # Register and call a normal function many times
        self.perf_monitor.register_function("common_function", "common.py", 20)
        for _ in range(50):
            self.perf_monitor.record_call("common_function", duration_ms=1.0)

        cold_spots = self.mapper.get_cold_spots()

        assert len(cold_spots) >= 1
        assert any(s.function_name == "rare_function" for s in cold_spots)
        assert not any(s.function_name == "common_function" for s in cold_spots)

    def test_detect_hot_spots(self):
        """Test detection of hot spots (high call count or slow functions)."""
        # Create a hot spot with many calls
        self.perf_monitor.register_function("frequent_function", "freq.py", 10)
        for _ in range(200):
            self.perf_monitor.record_call("frequent_function", duration_ms=0.5)

        # Create a normal function
        self.perf_monitor.register_function("normal_function", "normal.py", 20)
        for _ in range(30):
            self.perf_monitor.record_call("normal_function", duration_ms=1.0)

        hot_spots = self.mapper.get_hot_spots()

        assert len(hot_spots) >= 1
        assert any(s.function_name == "frequent_function" for s in hot_spots)
        assert not any(s.function_name == "normal_function" for s in hot_spots)

    def test_cold_spot_score_inversely_proportional_to_calls(self):
        """Test that cold spot score is higher for fewer calls."""
        # Very cold: 0 calls (score should be 1.0)
        self.perf_monitor.register_function("unused_function", "unused.py", 10)
        # Not registered but we can still check it

        # Slightly cold: 5 calls
        self.perf_monitor.register_function("rare_function", "rare.py", 20)
        for _ in range(5):
            self.perf_monitor.record_call("rare_function", duration_ms=1.0)

        # Near threshold: 9 calls
        self.perf_monitor.register_function("almost_warm", "almost.py", 30)
        for _ in range(9):
            self.perf_monitor.record_call("almost_warm", duration_ms=1.0)

        cold_spots = self.mapper.get_cold_spots()

        # Find the scores for each
        rare_spot = next((s for s in cold_spots if s.function_name == "rare_function"), None)
        almost_spot = next((s for s in cold_spots if s.function_name == "almost_warm"), None)

        assert rare_spot is not None
        assert almost_spot is not None
        # Lower calls should have higher score
        assert rare_spot.score > almost_spot.score

    def test_hot_spot_scoring_combines_frequency_and_time(self):
        """Test that hot spot scoring considers both call frequency and time."""
        # High frequency, fast execution
        self.perf_monitor.register_function("fast_frequent", "fast.py", 10)
        for _ in range(500):
            self.perf_monitor.record_call("fast_frequent", duration_ms=0.1)

        # Low frequency, slow execution
        self.perf_monitor.register_function("slow_rare", "slow.py", 20)
        for _ in range(50):
            self.perf_monitor.record_call("slow_rare", duration_ms=50.0)

        hot_spots = self.mapper.get_hot_spots()

        # Both should be detected as hot spots
        assert any(s.function_name == "fast_frequent" for s in hot_spots)
        assert any(s.function_name == "slow_rare" for s in hot_spots)

    def test_compute_structural_health(self):
        """Test structural health computation (PAS score)."""
        # Create a balanced system
        self.perf_monitor.register_function("balanced_func", "balanced.py", 10)
        for _ in range(50):
            self.perf_monitor.record_call("balanced_func", duration_ms=2.0)

        health = self.mapper.compute_structural_health()

        # Health should be between 0 and 1
        assert 0.0 <= health <= 1.0
        # Balanced system should have high health
        assert health > 0.5

    def test_structural_health_degrades_with_imbalance(self):
        """Test that structural health degrades with cold/hot spots."""
        # Create a very imbalanced system
        # Many cold spots
        for i in range(5):
            func_name = f"cold_{i}"
            self.perf_monitor.register_function(func_name, f"cold_{i}.py", i * 10)
            for _ in range(2):  # Very few calls
                self.perf_monitor.record_call(func_name, duration_ms=1.0)

        # Many hot spots
        for i in range(5):
            func_name = f"hot_{i}"
            self.perf_monitor.register_function(func_name, f"hot_{i}.py", i * 10)
            for _ in range(200):  # Many calls
                self.perf_monitor.record_call(func_name, duration_ms=15.0)

        imbalanced_health = self.mapper.compute_structural_health()

        # Create a balanced system for comparison
        self.perf_monitor2 = PerformanceMonitor()
        from systems.sisyphus.entropy_mapper import EntropyMapper
        self.mapper2 = EntropyMapper(self.perf_monitor2)

        for i in range(10):
            func_name = f"balanced_{i}"
            self.perf_monitor2.register_function(func_name, f"balanced_{i}.py", i * 10)
            for _ in range(50):  # Moderate calls
                self.perf_monitor2.record_call(func_name, duration_ms=2.0)

        balanced_health = self.mapper2.compute_structural_health()

        # Imbalanced should have lower health
        assert imbalanced_health < balanced_health


class TestEntropyMapperIntegration:
    """Integration tests with PerformanceMonitor."""

    def test_uses_performance_monitor_data(self):
        """Test that mapper correctly uses PerformanceMonitor data."""
        from systems.sisyphus.entropy_mapper import EntropyMapper

        monitor = PerformanceMonitor()
        monitor.register_function("test_func", "test.py", 42)
        monitor.record_call("test_func", duration_ms=5.0)

        mapper = EntropyMapper(monitor)
        cold_spots = mapper.get_cold_spots()

        # Should detect the cold spot with source location
        assert len(cold_spots) == 1
        assert cold_spots[0].file_path == "test.py"
        assert cold_spots[0].source_line == 42


if __name__ == "__main__":
    pytest.main([__file__])
