# tests/test_daemon_self_rewriting.py

import pytest

from systems.sisyphus.daemon import SisyphusDaemon


class TestDaemonSelfRewriting:
    def test_daemon_has_performance_monitor(self):
        """Test that daemon includes performance monitoring."""
        daemon = SisyphusDaemon(enable_self_rewriting=True)

        assert daemon.performance_monitor is not None

    def test_daemon_detects_hot_spots(self):
        """Test that daemon can detect hot spots."""
        daemon = SisyphusDaemon(enable_self_rewriting=True)

        # Simulate some calls
        for i in range(1000):
            daemon.performance_monitor.record_call("test_func", 1.0)

        hot_spots = daemon.detect_kernel_hot_spots()

        assert len(hot_spots) >= 1
        assert hot_spots[0].function_name == "test_func"

    def test_daemon_creates_rewrite_task(self):
        """Test that daemon creates a task for hot-spot rewriting."""
        daemon = SisyphusDaemon(enable_self_rewriting=True)

        # Simulate hot spot
        for i in range(1000):
            daemon.performance_monitor.record_call("slow_kernel", 50.0)

        task = daemon.propose_kernel_rewrite()

        assert task is not None
        assert "slow_kernel" in task.name.lower() or "optimize" in task.name.lower()

if __name__ == "__main__":
    pytest.main([__file__])
