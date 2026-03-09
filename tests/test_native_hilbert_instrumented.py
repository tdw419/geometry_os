# tests/test_native_hilbert_instrumented.py
import pytest
from systems.sisyphus.native_hilbert import NativeHilbertLUT
from systems.sisyphus.performance_monitor import PerformanceMonitor

class TestInstrumentedHilbert:
    def test_performance_monitoring_enabled(self):
        """Test that hilbert calls are recorded in performance monitor."""
        monitor = PerformanceMonitor()
        hilbert = NativeHilbertLUT(performance_monitor=monitor)

        # Make some calls
        for i in range(100):
            hilbert.d2xy(256, i)

        # Verify calls were recorded
        assert monitor.call_counts.get("d2xy", 0) == 100

    def test_hot_spot_detection_after_usage(self):
        """Test that heavy usage creates detectable hot spots."""
        monitor = PerformanceMonitor()
        hilbert = NativeHilbertLUT(performance_monitor=monitor)

        # Heavy usage
        for i in range(1000):
            hilbert.d2xy(256, i % 65536)
            hilbert.xy2d(256, i % 256, (i // 256) % 256)

        hot_spots = monitor.detect_hot_spots(threshold_calls=100, threshold_time_ms=0.0)

        assert len(hot_spots) >= 1
        assert "d2xy" in [h.function_name for h in hot_spots]

    def test_backward_compatible_no_monitor(self):
        """Test that NativeHilbertLUT works without a monitor (backward compat)."""
        hilbert = NativeHilbertLUT()  # No monitor
        result = hilbert.d2xy(256, 0)
        assert result is not None or result == (0, 0)  # Either works

if __name__ == "__main__":
    pytest.main([__file__])
