# tests/test_performance_monitor.py

import pytest

from systems.sisyphus.performance_monitor import PerformanceMonitor


class TestPerformanceMonitor:
    def setup_method(self):
        self.monitor = PerformanceMonitor()

    def test_record_call(self):
        """Test recording a function call."""
        self.monitor.record_call("hilbert_d2xy", duration_ms=0.5)
        assert self.monitor.call_counts["hilbert_d2xy"] == 1

    def test_hot_spot_detection(self):
        """Test detecting a hot spot based on call frequency."""
        # Record 1000 fast calls
        for _ in range(1000):
            self.monitor.record_call("hot_function", duration_ms=0.1)

        # Record 10 slow calls
        for _ in range(10):
            self.monitor.record_call("slow_function", duration_ms=50.0)

        hot_spots = self.monitor.detect_hot_spots(threshold_calls=100, threshold_time_ms=10.0)

        assert len(hot_spots) >= 1
        assert any(s.function_name == "slow_function" for s in hot_spots)

    def test_hot_spot_has_location(self):
        """Test that hot spots include source location."""
        self.monitor.register_function("test_func", file="test.rs", line=42)
        self.monitor.record_call("test_func", duration_ms=100.0)

        hot_spots = self.monitor.detect_hot_spots(threshold_calls=1, threshold_time_ms=50.0)

        assert len(hot_spots) == 1
        assert hot_spots[0].source_file == "test.rs"
        assert hot_spots[0].source_line == 42

if __name__ == "__main__":
    pytest.main([__file__])
