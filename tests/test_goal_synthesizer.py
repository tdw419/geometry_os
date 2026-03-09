# tests/test_goal_synthesizer.py
"""
Tests for GoalSynthesizer - transforms EntropySpots into AutonomousGoals
for the Intrinsic Curiosity Engine.
"""
import pytest
from typing import Dict, Any
from datetime import datetime

from systems.sisyphus.entropy_mapper import EntropySpot


class TestGoalSynthesizerModule:
    """Test module and class existence."""

    def test_goal_synthesizer_module_exists(self):
        """Test that goal_synthesizer module can be imported."""
        from systems.sisyphus import goal_synthesizer
        assert goal_synthesizer is not None

    def test_autonomous_goal_dataclass_exists(self):
        """Test that AutonomousGoal dataclass exists."""
        from systems.sisyphus.goal_synthesizer import AutonomousGoal
        assert AutonomousGoal is not None

    def test_goal_synthesizer_class_exists(self):
        """Test that GoalSynthesizer class exists."""
        from systems.sisyphus.goal_synthesizer import GoalSynthesizer
        assert GoalSynthesizer is not None


class TestAutonomousGoal:
    """Test AutonomousGoal dataclass."""

    def test_autonomous_goal_has_required_fields(self):
        """Test AutonomousGoal has all required fields."""
        from systems.sisyphus.goal_synthesizer import AutonomousGoal

        goal = AutonomousGoal(
            goal_id="auto-0001-abc12345",
            goal_type="eliminate_dead_code",
            target="/path/to/file.py",
            rationale="Function foo has 0 calls, potential dead code",
            priority=0.75,
            entropy_score=0.9,
            created_at="2024-01-01T00:00:00Z",
            metrics={"call_count": 0, "threshold": 10}
        )

        assert goal.goal_id == "auto-0001-abc12345"
        assert goal.goal_type == "eliminate_dead_code"
        assert goal.target == "/path/to/file.py"
        assert goal.rationale == "Function foo has 0 calls, potential dead code"
        assert goal.priority == 0.75
        assert goal.entropy_score == 0.9
        assert goal.created_at == "2024-01-01T00:00:00Z"
        assert goal.metrics == {"call_count": 0, "threshold": 10}

    def test_autonomous_goal_sorting_by_priority(self):
        """Test AutonomousGoal sorts by priority descending."""
        from systems.sisyphus.goal_synthesizer import AutonomousGoal

        goals = [
            AutonomousGoal(
                goal_id="g1", goal_type="t1", target="a.py",
                rationale="r1", priority=0.3, entropy_score=0.5,
                created_at="2024-01-01T00:00:00Z", metrics={}
            ),
            AutonomousGoal(
                goal_id="g2", goal_type="t2", target="b.py",
                rationale="r2", priority=0.9, entropy_score=0.8,
                created_at="2024-01-01T00:00:00Z", metrics={}
            ),
            AutonomousGoal(
                goal_id="g3", goal_type="t3", target="c.py",
                rationale="r3", priority=0.5, entropy_score=0.6,
                created_at="2024-01-01T00:00:00Z", metrics={}
            ),
        ]

        sorted_goals = sorted(goals)

        assert sorted_goals[0].priority == 0.9
        assert sorted_goals[1].priority == 0.5
        assert sorted_goals[2].priority == 0.3

    def test_autonomous_goal_to_task_dict(self):
        """Test AutonomousGoal.to_task_dict() method."""
        from systems.sisyphus.goal_synthesizer import AutonomousGoal

        goal = AutonomousGoal(
            goal_id="auto-0001-abc12345",
            goal_type="kernel_rewrite",
            target="/path/to/hot.py",
            rationale="Critical bottleneck",
            priority=0.9,
            entropy_score=0.85,
            created_at="2024-01-01T00:00:00Z",
            metrics={"call_count": 500, "avg_time_ms": 50.0}
        )

        task_dict = goal.to_task_dict()

        assert isinstance(task_dict, dict)
        assert task_dict["goal_id"] == "auto-0001-abc12345"
        assert task_dict["goal_type"] == "kernel_rewrite"
        assert task_dict["target"] == "/path/to/hot.py"
        assert task_dict["priority"] == 0.9


class TestGoalSynthesizer:
    """Test GoalSynthesizer class."""

    def setup_method(self):
        """Create a fresh GoalSynthesizer for each test."""
        from systems.sisyphus.goal_synthesizer import GoalSynthesizer
        self.synthesizer = GoalSynthesizer(min_entropy_score=0.5)

    def test_synthesize_from_cold_spot(self):
        """Test synthesis from a cold spot."""
        cold_spot = EntropySpot(
            file_path="/cold/unused.py",
            entropy_type="cold",
            score=0.9,
            metrics={"call_count": 1, "threshold": 10},
            function_name="unused_func",
            source_line=42
        )

        goals = self.synthesizer.synthesize_from_spot(cold_spot)

        assert isinstance(goals, list)
        assert len(goals) >= 1
        # Should have eliminate_dead_code or speculative_rewrite
        goal_types = [g.goal_type for g in goals]
        assert any(gt in ["eliminate_dead_code", "speculative_rewrite"] for gt in goal_types)

    def test_synthesize_from_hot_spot(self):
        """Test synthesis from a hot spot."""
        hot_spot = EntropySpot(
            file_path="/hot/bottleneck.py",
            entropy_type="hot",
            score=0.85,
            metrics={"call_count": 500, "avg_time_ms": 50.0, "total_time_ms": 25000},
            function_name="bottleneck_func",
            source_line=100
        )

        goals = self.synthesizer.synthesize_from_spot(hot_spot)

        assert isinstance(goals, list)
        assert len(goals) >= 1
        # Should have kernel_rewrite, parallelize, or optimize_hot
        goal_types = [g.goal_type for g in goals]
        assert any(gt in ["kernel_rewrite", "parallelize", "optimize_hot"] for gt in goal_types)

    def test_synthesize_batch_from_entropy_map(self):
        """Test batch synthesis from multiple entropy spots."""
        spots = [
            EntropySpot(
                file_path="/cold/unused.py",
                entropy_type="cold",
                score=0.9,
                metrics={"call_count": 1, "threshold": 10},
                function_name="unused_func"
            ),
            EntropySpot(
                file_path="/hot/bottleneck.py",
                entropy_type="hot",
                score=0.85,
                metrics={"call_count": 500, "avg_time_ms": 50.0},
                function_name="bottleneck_func"
            ),
        ]

        goals = self.synthesizer.synthesize_batch(spots)

        assert isinstance(goals, list)
        # Should have goals from both spots
        assert len(goals) >= 2

    def test_goals_sorted_by_priority(self):
        """Test that synthesized goals are sorted by priority."""
        spots = [
            EntropySpot(
                file_path="/cold/low.py",
                entropy_type="cold",
                score=0.6,
                metrics={"call_count": 4, "threshold": 10},
                function_name="low_priority_func"
            ),
            EntropySpot(
                file_path="/hot/high.py",
                entropy_type="hot",
                score=0.95,
                metrics={"call_count": 1000, "avg_time_ms": 80.0},
                function_name="high_priority_func"
            ),
        ]

        goals = self.synthesizer.synthesize_batch(spots)

        # Goals should be sorted by priority descending
        for i in range(len(goals) - 1):
            assert goals[i].priority >= goals[i + 1].priority

    def test_goal_includes_rationale(self):
        """Test that goals include human-readable rationale."""
        hot_spot = EntropySpot(
            file_path="/hot/bottleneck.py",
            entropy_type="hot",
            score=0.9,
            metrics={"call_count": 500, "avg_time_ms": 50.0},
            function_name="bottleneck_func",
            source_line=100
        )

        goals = self.synthesizer.synthesize_from_spot(hot_spot)

        assert len(goals) >= 1
        for goal in goals:
            assert isinstance(goal.rationale, str)
            assert len(goal.rationale) > 0
            # Rationale should include function name
            assert "bottleneck_func" in goal.rationale
            # Rationale should include metrics
            assert "500" in goal.rationale or "50" in goal.rationale


class TestHealthBasedSynthesis:
    """Test health-based goal synthesis."""

    def setup_method(self):
        """Create a fresh GoalSynthesizer for each test."""
        from systems.sisyphus.goal_synthesizer import GoalSynthesizer
        self.synthesizer = GoalSynthesizer(min_entropy_score=0.5)

    def test_low_health_generates_from_all_spots(self):
        """Test that low health (< 0.5) generates goals from all spots."""
        cold_spots = [
            EntropySpot(
                file_path=f"/cold/{i}.py",
                entropy_type="cold",
                score=0.8,
                metrics={"call_count": 2, "threshold": 10},
                function_name=f"cold_func_{i}"
            )
            for i in range(5)
        ]
        hot_spots = [
            EntropySpot(
                file_path=f"/hot/{i}.py",
                entropy_type="hot",
                score=0.8,
                metrics={"call_count": 500, "avg_time_ms": 50.0},
                function_name=f"hot_func_{i}"
            )
            for i in range(5)
        ]

        goals = self.synthesizer.synthesize_from_health_score(
            health_score=0.3,
            cold_spots=cold_spots,
            hot_spots=hot_spots
        )

        # Should generate from all spots
        assert len(goals) >= 10  # At least 1 goal per spot

    def test_medium_health_generates_top_spots(self):
        """Test that medium health (< 0.8) generates goals from top spots."""
        cold_spots = [
            EntropySpot(
                file_path=f"/cold/{i}.py",
                entropy_type="cold",
                score=0.7 + (i * 0.02),
                metrics={"call_count": 3, "threshold": 10},
                function_name=f"cold_func_{i}"
            )
            for i in range(10)
        ]
        hot_spots = [
            EntropySpot(
                file_path=f"/hot/{i}.py",
                entropy_type="hot",
                score=0.7 + (i * 0.02),
                metrics={"call_count": 500, "avg_time_ms": 50.0},
                function_name=f"hot_func_{i}"
            )
            for i in range(10)
        ]

        goals = self.synthesizer.synthesize_from_health_score(
            health_score=0.6,
            cold_spots=cold_spots,
            hot_spots=hot_spots
        )

        # Should generate from top 3 cold + top 3 hot = at least 6 goals
        assert len(goals) >= 6

    def test_high_health_generates_only_critical(self):
        """Test that high health (>= 0.8) generates goals only from critical hot spots."""
        cold_spots = [
            EntropySpot(
                file_path="/cold/unused.py",
                entropy_type="cold",
                score=0.9,
                metrics={"call_count": 1, "threshold": 10},
                function_name="unused_func"
            )
        ]
        hot_spots = [
            EntropySpot(
                file_path="/hot/critical.py",
                entropy_type="hot",
                score=0.95,  # Critical: > 0.9
                metrics={"call_count": 1000, "avg_time_ms": 100.0},
                function_name="critical_func"
            ),
            EntropySpot(
                file_path="/hot/normal.py",
                entropy_type="hot",
                score=0.7,  # Not critical
                metrics={"call_count": 200, "avg_time_ms": 20.0},
                function_name="normal_func"
            ),
        ]

        goals = self.synthesizer.synthesize_from_health_score(
            health_score=0.9,
            cold_spots=cold_spots,
            hot_spots=hot_spots
        )

        # Should only have goals from critical hot spots (score > 0.9)
        assert len(goals) >= 1
        # All goals should be from critical spots
        for goal in goals:
            assert goal.entropy_score > 0.9


class TestGoalIdGeneration:
    """Test goal ID generation."""

    def test_goal_id_format(self):
        """Test that goal IDs follow the correct format."""
        from systems.sisyphus.goal_synthesizer import GoalSynthesizer

        synthesizer = GoalSynthesizer()

        # Generate multiple IDs to test format
        ids = [synthesizer._generate_goal_id() for _ in range(5)]

        for goal_id in ids:
            # Format: auto-{counter:04d}-{uuid[:8]}
            parts = goal_id.split("-")
            assert len(parts) == 3
            assert parts[0] == "auto"
            assert len(parts[1]) == 4  # 4-digit counter
            assert parts[1].isdigit()
            assert len(parts[2]) == 8  # 8-char UUID

    def test_goal_ids_are_unique(self):
        """Test that generated goal IDs are unique."""
        from systems.sisyphus.goal_synthesizer import GoalSynthesizer

        synthesizer = GoalSynthesizer()

        # Generate many IDs
        ids = [synthesizer._generate_goal_id() for _ in range(100)]

        # All should be unique
        assert len(ids) == len(set(ids))


class TestMinEntropyScore:
    """Test minimum entropy score filtering."""

    def test_filters_low_entropy_spots(self):
        """Test that spots below min_entropy_score are filtered."""
        from systems.sisyphus.goal_synthesizer import GoalSynthesizer

        synthesizer = GoalSynthesizer(min_entropy_score=0.7)

        spots = [
            EntropySpot(
                file_path="/low.py",
                entropy_type="cold",
                score=0.5,  # Below threshold
                metrics={"call_count": 5, "threshold": 10},
                function_name="low_func"
            ),
            EntropySpot(
                file_path="/high.py",
                entropy_type="cold",
                score=0.9,  # Above threshold
                metrics={"call_count": 1, "threshold": 10},
                function_name="high_func"
            ),
        ]

        goals = synthesizer.synthesize_batch(spots)

        # Should only have goals from high entropy spot
        for goal in goals:
            assert goal.target != "/low.py"


if __name__ == "__main__":
    pytest.main([__file__])
