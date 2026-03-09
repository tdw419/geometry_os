"""
Tests for Intrinsic Curiosity Engine integration with SisyphusDaemon.
"""

import pytest
import asyncio


class TestIntrinsicCuriosityIntegration:
    """Tests for full intrinsic curiosity integration."""

    def test_daemon_has_curiosity_engine(self):
        """Test that SisyphusDaemon has curiosity engine attribute."""
        from systems.sisyphus.daemon import SisyphusDaemon

        daemon = SisyphusDaemon()

        assert hasattr(daemon, 'curiosity_engine') or hasattr(daemon, 'entropy_mapper')

    def test_daemon_can_generate_autonomous_goals(self):
        """Test that daemon can generate goals without external input."""
        from systems.sisyphus.daemon import SisyphusDaemon
        from systems.sisyphus.performance_monitor import PerformanceMonitor

        perf = PerformanceMonitor()
        # Add some data for the mapper to analyze
        perf.record_call("test_func", 10.0)

        daemon = SisyphusDaemon(performance_monitor=perf)

        # Should be able to generate autonomous goals
        goals = daemon.generate_autonomous_goals()

        assert isinstance(goals, list)

    def test_autonomous_goal_generation_uses_entropy(self):
        """Test that autonomous goals come from entropy analysis."""
        from systems.sisyphus.daemon import SisyphusDaemon
        from systems.sisyphus.performance_monitor import PerformanceMonitor

        perf = PerformanceMonitor()
        # Register the function with a source location
        perf.register_function("hot_func", "test_file.py", 10)
        # Create a hot spot (need enough calls and slow enough time to trigger hot spot)
        for _ in range(200):
            perf.record_call("hot_func", 25.0)

        daemon = SisyphusDaemon(performance_monitor=perf)
        goals = daemon.generate_autonomous_goals()

        # Should detect the hot spot and generate optimization goal
        assert len(goals) >= 1


class TestCuriosityEngineLoop:
    """Tests for the curiosity engine loop."""

    @pytest.mark.asyncio
    async def test_curiosity_loop_runs(self):
        """Test that curiosity loop can run."""
        from systems.sisyphus.daemon import SisyphusDaemon

        daemon = SisyphusDaemon()

        # Run one iteration of curiosity cycle
        result = await daemon.run_curiosity_cycle()

        # Should return some result (even if no goals generated)
        assert result is not None

    def test_structural_health_monitoring(self):
        """Test that daemon monitors structural health."""
        from systems.sisyphus.daemon import SisyphusDaemon

        daemon = SisyphusDaemon()

        # Should be able to compute health score
        health = daemon.get_structural_health()

        assert 0.0 <= health <= 1.0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
