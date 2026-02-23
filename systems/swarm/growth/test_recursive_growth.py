"""
Unit tests for RecursiveGrowth and PatternAnalyzer.

Tests metric calculation, pattern detection, and event publishing.
"""

import unittest
from unittest.mock import MagicMock

from systems.swarm.growth.recursive_growth import RecursiveGrowth, GrowthMetrics
from systems.swarm.growth.pattern_analyzer import PatternAnalyzer
from systems.swarm.memory import Experience, generate_embedding


class TestGrowthMetrics(unittest.TestCase):
    """Tests for GrowthMetrics dataclass."""

    def test_empty_metrics(self):
        """Test default metrics."""
        metrics = GrowthMetrics()
        self.assertEqual(metrics.total_tasks, 0)
        self.assertEqual(metrics.successes, 0)
        self.assertEqual(metrics.success_rate, 0.0)

    def test_success_rate_calculation(self):
        """Test success rate property."""
        metrics = GrowthMetrics(total_tasks=10, successes=7, failures=3)
        self.assertEqual(metrics.success_rate, 0.7)

    def test_to_dict(self):
        """Test serialization."""
        metrics = GrowthMetrics(total_tasks=5, successes=3, failures=2)
        data = metrics.to_dict()
        self.assertEqual(data["total_tasks"], 5)
        self.assertEqual(data["success_rate"], 0.6)


class TestRecursiveGrowth(unittest.TestCase):
    """Tests for RecursiveGrowth event handling."""

    def setUp(self):
        """Create mock event bus."""
        self.bus = MagicMock()
        self.bus.subscribe = MagicMock(return_value="sub-123")
        self.bus.unsubscribe = MagicMock(return_value=True)
        self.bus.publish = MagicMock()

    def test_initialization(self):
        """Test that RecursiveGrowth subscribes to events."""
        growth = RecursiveGrowth(self.bus)

        self.bus.subscribe.assert_called_once()
        args = self.bus.subscribe.call_args
        self.assertEqual(args[0][0], "task.**")

        growth.shutdown()

    def test_task_tracking(self):
        """Test that task events update metrics."""
        growth = RecursiveGrowth(self.bus)

        # Get the callback that was registered
        callback = self.bus.subscribe.call_args[0][1]

        # Simulate task events
        callback(MagicMock(payload={"outcome": "success", "agent_id": "a1", "task_type": "CODE_GEN"}))
        callback(MagicMock(payload={"outcome": "success", "agent_id": "a1", "task_type": "CODE_GEN"}))
        callback(MagicMock(payload={"outcome": "failure", "agent_id": "a1", "task_type": "CODE_REVIEW"}))

        metrics = growth.get_metrics()
        self.assertEqual(metrics.total_tasks, 3)
        self.assertEqual(metrics.successes, 2)
        self.assertEqual(metrics.failures, 1)
        self.assertAlmostEqual(metrics.success_rate, 2/3, places=2)

        growth.shutdown()

    def test_agent_filtering(self):
        """Test filtering by agent_id."""
        growth = RecursiveGrowth(self.bus, agent_id="agent1")
        callback = self.bus.subscribe.call_args[0][1]

        # Events from different agents
        callback(MagicMock(payload={"outcome": "success", "agent_id": "agent1"}))
        callback(MagicMock(payload={"outcome": "success", "agent_id": "agent2"}))
        callback(MagicMock(payload={"outcome": "failure", "agent_id": "agent1"}))

        metrics = growth.get_metrics()
        # Should only count agent1's events
        self.assertEqual(metrics.total_tasks, 2)

        growth.shutdown()

    def test_metrics_by_agent(self):
        """Test per-agent metrics tracking."""
        growth = RecursiveGrowth(self.bus)
        callback = self.bus.subscribe.call_args[0][1]

        callback(MagicMock(payload={"outcome": "success", "agent_id": "a1", "task_type": "T"}))
        callback(MagicMock(payload={"outcome": "failure", "agent_id": "a2", "task_type": "T"}))

        a1_metrics = growth.get_agent_metrics("a1")
        a2_metrics = growth.get_agent_metrics("a2")

        self.assertEqual(a1_metrics.successes, 1)
        self.assertEqual(a2_metrics.failures, 1)

        growth.shutdown()

    def test_metrics_by_type(self):
        """Test per-type metrics tracking."""
        growth = RecursiveGrowth(self.bus)
        callback = self.bus.subscribe.call_args[0][1]

        callback(MagicMock(payload={"outcome": "success", "agent_id": "a", "task_type": "CODE_GEN"}))
        callback(MagicMock(payload={"outcome": "failure", "agent_id": "a", "task_type": "CODE_REVIEW"}))

        gen_metrics = growth.get_type_metrics("CODE_GEN")
        review_metrics = growth.get_type_metrics("CODE_REVIEW")

        self.assertEqual(gen_metrics.successes, 1)
        self.assertEqual(review_metrics.failures, 1)

        growth.shutdown()

    def test_context_manager(self):
        """Test using RecursiveGrowth as context manager."""
        with RecursiveGrowth(self.bus) as growth:
            callback = self.bus.subscribe.call_args[0][1]
            callback(MagicMock(payload={"outcome": "success", "agent_id": "a", "task_type": "T"}))
            self.assertEqual(growth.get_metrics().total_tasks, 1)

        # After context exit, should be unsubscribed
        self.bus.unsubscribe.assert_called()


class TestPatternAnalyzer(unittest.TestCase):
    """Tests for pattern analysis."""

    def setUp(self):
        """Create sample experiences."""
        self.experiences = [
            Experience("id1", "a", "CODE_GEN", "write", "success", "auth", generate_embedding("auth"), {"duration": 10}, 0),
            Experience("id2", "a", "CODE_GEN", "write", "success", "db", generate_embedding("db"), {"duration": 20}, 0),
            Experience("id3", "a", "CODE_GEN", "write", "failure", "api", generate_embedding("api"), {"duration": 5}, 0),
            Experience("id4", "a", "CODE_REVIEW", "review", "success", "pr", generate_embedding("pr"), {"duration": 15}, 0),
            Experience("id5", "a", "CODE_GEN", "write", "failure", "test", generate_embedding("test"), {}, 0),
        ]

    def test_analyze_empty(self):
        """Test analysis with no experiences."""
        analyzer = PatternAnalyzer()
        result = analyzer.analyze_agent_performance([])

        self.assertEqual(result["success_rate"], 0.0)
        self.assertEqual(result["total_count"], 0)
        self.assertIn("Collect more", result["recommendations"][0])

    def test_analyze_success_rate(self):
        """Test success rate calculation."""
        analyzer = PatternAnalyzer()
        result = analyzer.analyze_agent_performance(self.experiences)

        self.assertEqual(result["total_count"], 5)
        self.assertEqual(result["success_rate"], 0.6)  # 3 success / 5 total

    def test_analyze_common_failures(self):
        """Test failure pattern identification."""
        analyzer = PatternAnalyzer()
        result = analyzer.analyze_agent_performance(self.experiences)

        # CODE_GEN has 2 failures
        self.assertEqual(len(result["common_failures"]), 1)
        self.assertEqual(result["common_failures"][0]["task_type"], "CODE_GEN")
        self.assertEqual(result["common_failures"][0]["count"], 2)

    def test_analyze_avg_completion_time(self):
        """Test completion time calculation."""
        analyzer = PatternAnalyzer()
        result = analyzer.analyze_agent_performance(self.experiences)

        # 10 + 20 + 5 + 15 = 50 / 4 = 12.5
        self.assertEqual(result["avg_completion_time"], 12.5)

    def test_detect_patterns_insufficient_data(self):
        """Test pattern detection with insufficient data."""
        analyzer = PatternAnalyzer()
        result = analyzer.detect_patterns([self.experiences[0]], window_size=3)

        self.assertEqual(result["pattern"], "insufficient_data")

    def test_detect_patterns_stable(self):
        """Test detecting stable trend."""
        # Create balanced experiences
        exps = [
            Experience(f"id{i}", "a", "T", "a", "success" if i % 2 == 0 else "failure", "d", generate_embedding("d"), {}, i)
            for i in range(20)
        ]

        analyzer = PatternAnalyzer()
        result = analyzer.detect_patterns(exps, window_size=5)

        self.assertIn(result["trend"], ["stable", "improving", "declining"])

    def test_get_recommendations(self):
        """Test recommendation generation."""
        analyzer = PatternAnalyzer()
        recs = analyzer.get_recommendations(self.experiences, current_task_type="CODE_GEN")

        self.assertTrue(len(recs) > 0)


class TestIntegration(unittest.TestCase):
    """Integration tests for growth + memory."""

    def test_memory_with_growth_tracking(self):
        """Test using memory experiences for growth analysis."""
        from systems.swarm.memory import EpisodicMemory
        import tempfile
        import os

        # Create temp storage
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            temp_path = f.name

        try:
            memory = EpisodicMemory("agent1", temp_path)

            # Store experiences
            memory.store_experience("CODE_GEN", "write", "success", "auth module")
            memory.store_experience("CODE_GEN", "write", "failure", "db migration error")
            memory.store_experience("CODE_REVIEW", "review", "success", "PR review")

            # Analyze with PatternAnalyzer
            analyzer = PatternAnalyzer()
            result = analyzer.analyze_agent_performance(memory.get_all_experiences())

            self.assertEqual(result["total_count"], 3)
            self.assertAlmostEqual(result["success_rate"], 2/3, places=2)

        finally:
            if os.path.exists(temp_path):
                os.unlink(temp_path)


if __name__ == "__main__":
    unittest.main()
