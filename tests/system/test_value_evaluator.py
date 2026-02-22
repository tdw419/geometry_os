"""
Tests for ValueEvaluator - AI value scoring for recursive evolution.

TDD Tests:
1. Test ValueEvaluator initializes with default weights
2. Test compute_access_score - high count -> high score (log scale)
3. Test compute_criticality_score - many dependents -> high criticality
4. Test compute_improvement_score - low coverage -> high improvement potential
5. Test evaluate() returns ValueScore with composite_score in [0,1]
"""

import pytest
import math
from dataclasses import dataclass
from typing import Dict, Any, Optional

# Import will fail initially - that's expected in TDD
from systems.visual_shell.swarm.evolution.value_evaluator import (
    ValueScore,
    ValueEvaluator,
)


class TestValueEvaluatorInit:
    """Test ValueEvaluator initialization."""

    def test_default_weights(self):
        """Test ValueEvaluator initializes with default weights."""
        evaluator = ValueEvaluator()

        assert evaluator.weight_access == 0.25
        assert evaluator.weight_criticality == 0.25
        assert evaluator.weight_improvement == 0.20
        assert evaluator.weight_complexity == 0.15
        assert evaluator.weight_staleness == 0.15

    def test_custom_weights(self):
        """Test ValueEvaluator accepts custom weights."""
        evaluator = ValueEvaluator(
            weight_access=0.30,
            weight_criticality=0.30,
            weight_improvement=0.15,
            weight_complexity=0.15,
            weight_staleness=0.10,
        )

        assert evaluator.weight_access == 0.30
        assert evaluator.weight_criticality == 0.30
        assert evaluator.weight_improvement == 0.15
        assert evaluator.weight_complexity == 0.15
        assert evaluator.weight_staleness == 0.10

    def test_weights_sum_to_one(self):
        """Test that default weights sum to 1.0."""
        evaluator = ValueEvaluator()
        total = (
            evaluator.weight_access +
            evaluator.weight_criticality +
            evaluator.weight_improvement +
            evaluator.weight_complexity +
            evaluator.weight_staleness
        )
        assert abs(total - 1.0) < 0.001


class TestComputeAccessScore:
    """Test compute_access_score method."""

    def test_high_count_high_score(self):
        """Test high access count produces high score (log scale)."""
        evaluator = ValueEvaluator()

        # Low access count
        low_score = evaluator.compute_access_score("file.py", access_count=1)

        # High access count
        high_score = evaluator.compute_access_score("file.py", access_count=1000)

        # High count should give higher score
        assert high_score > low_score
        # Both should be in [0, 1]
        assert 0.0 <= low_score <= 1.0
        assert 0.0 <= high_score <= 1.0

    def test_zero_access_returns_zero(self):
        """Test zero access count returns zero score."""
        evaluator = ValueEvaluator()
        score = evaluator.compute_access_score("file.py", access_count=0)
        assert score == 0.0

    def test_log_scale_progression(self):
        """Test that scores follow log scale progression."""
        evaluator = ValueEvaluator()

        # Get scores for increasing access counts
        score_10 = evaluator.compute_access_score("file.py", access_count=10)
        score_100 = evaluator.compute_access_score("file.py", access_count=100)
        score_1000 = evaluator.compute_access_score("file.py", access_count=1000)

        # Log scale: doubling count shouldn't double score
        # ratio of 100 to 10 should be less than linear
        ratio = score_100 / score_10 if score_10 > 0 else 0
        assert ratio < 10  # Not linear


class TestComputeCriticalityScore:
    """Test compute_criticality_score method."""

    def test_many_dependents_high_criticality(self):
        """Test many dependents produces high criticality score."""
        evaluator = ValueEvaluator()

        low_score = evaluator.compute_criticality_score("file.py", dependent_count=1)
        high_score = evaluator.compute_criticality_score("file.py", dependent_count=50)

        assert high_score > low_score
        assert 0.0 <= low_score <= 1.0
        assert 0.0 <= high_score <= 1.0

    def test_no_dependents_zero_score(self):
        """Test no dependents returns zero score."""
        evaluator = ValueEvaluator()
        score = evaluator.compute_criticality_score("file.py", dependent_count=0)
        assert score == 0.0

    def test_criticality_saturates(self):
        """Test criticality score saturates at high dependent counts."""
        evaluator = ValueEvaluator()

        # Very high dependent counts should approach but not exceed 1.0
        score = evaluator.compute_criticality_score("file.py", dependent_count=1000)
        assert 0.0 <= score <= 1.0


class TestComputeImprovementScore:
    """Test compute_improvement_score method."""

    def test_low_coverage_high_improvement(self):
        """Test low coverage produces high improvement potential score."""
        evaluator = ValueEvaluator()

        # High coverage = low improvement potential
        high_coverage_score = evaluator.compute_improvement_score(coverage=0.9)

        # Low coverage = high improvement potential
        low_coverage_score = evaluator.compute_improvement_score(coverage=0.1)

        assert low_coverage_score > high_coverage_score
        assert 0.0 <= high_coverage_score <= 1.0
        assert 0.0 <= low_coverage_score <= 1.0

    def test_zero_coverage_max_improvement(self):
        """Test zero coverage returns maximum improvement score."""
        evaluator = ValueEvaluator()
        score = evaluator.compute_improvement_score(coverage=0.0)
        assert score == 1.0

    def test_full_coverage_min_improvement(self):
        """Test full coverage returns minimum improvement score."""
        evaluator = ValueEvaluator()
        score = evaluator.compute_improvement_score(coverage=1.0)
        assert score == 0.0

    def test_improvement_inversely_proportional(self):
        """Test improvement score is inversely proportional to coverage."""
        evaluator = ValueEvaluator()

        # 50% coverage should give 50% improvement potential
        score = evaluator.compute_improvement_score(coverage=0.5)
        assert abs(score - 0.5) < 0.01


class TestEvaluate:
    """Test the main evaluate() method."""

    def test_returns_value_score(self):
        """Test evaluate() returns ValueScore instance."""
        evaluator = ValueEvaluator()

        result = evaluator.evaluate(
            file_path="test.py",
            access_count=10,
            dependent_count=5,
            coverage=0.5,
            complexity=0.3,
            staleness=0.2,
        )

        assert isinstance(result, ValueScore)
        assert result.file_path == "test.py"

    def test_composite_score_in_range(self):
        """Test composite_score is always in [0, 1]."""
        evaluator = ValueEvaluator()

        # Test various inputs
        test_cases = [
            {"access_count": 0, "dependent_count": 0, "coverage": 1.0, "complexity": 0, "staleness": 0},
            {"access_count": 1000, "dependent_count": 100, "coverage": 0.0, "complexity": 1.0, "staleness": 1.0},
            {"access_count": 50, "dependent_count": 10, "coverage": 0.3, "complexity": 0.5, "staleness": 0.7},
        ]

        for case in test_cases:
            result = evaluator.evaluate(
                file_path="test.py",
                **case
            )
            assert 0.0 <= result.composite_score <= 1.0, f"Failed for case: {case}"

    def test_composite_formula(self):
        """Test composite score follows the weighted formula."""
        evaluator = ValueEvaluator()

        # Use known values to verify formula
        result = evaluator.evaluate(
            file_path="test.py",
            access_count=100,
            dependent_count=10,
            coverage=0.5,
            complexity=0.4,
            staleness=0.6,
        )

        # Calculate expected based on formula
        # composite = 0.25*access + 0.25*criticality + 0.20*(1-coverage) + 0.15*complexity + 0.15*staleness
        expected_access = evaluator.compute_access_score("test.py", 100)
        expected_criticality = evaluator.compute_criticality_score("test.py", 10)
        expected_improvement = evaluator.compute_improvement_score(0.5)

        expected = (
            0.25 * expected_access +
            0.25 * expected_criticality +
            0.20 * expected_improvement +
            0.15 * 0.4 +
            0.15 * 0.6
        )

        assert abs(result.composite_score - expected) < 0.001

    def test_value_score_contains_all_scores(self):
        """Test ValueScore contains all individual scores."""
        evaluator = ValueEvaluator()

        result = evaluator.evaluate(
            file_path="test.py",
            access_count=50,
            dependent_count=20,
            coverage=0.3,
            complexity=0.5,
            staleness=0.7,
        )

        assert hasattr(result, 'access_score')
        assert hasattr(result, 'criticality_score')
        assert hasattr(result, 'improvement_score')
        assert hasattr(result, 'complexity_score')
        assert hasattr(result, 'staleness_score')
        assert hasattr(result, 'composite_score')
        assert hasattr(result, 'metadata')

    def test_evaluate_with_metadata(self):
        """Test evaluate() accepts and stores metadata."""
        evaluator = ValueEvaluator()

        metadata = {"author": "test", "last_modified": "2026-02-19"}
        result = evaluator.evaluate(
            file_path="test.py",
            access_count=10,
            dependent_count=5,
            coverage=0.5,
            complexity=0.3,
            staleness=0.2,
            metadata=metadata,
        )

        assert result.metadata == metadata

    def test_high_value_file(self):
        """Test that high-access, high-criticality, low-coverage file gets high score."""
        evaluator = ValueEvaluator()

        high_value = evaluator.evaluate(
            file_path="core.py",
            access_count=500,
            dependent_count=50,
            coverage=0.2,  # Low coverage = high improvement
            complexity=0.7,
            staleness=0.8,
        )

        low_value = evaluator.evaluate(
            file_path="utils.py",
            access_count=5,
            dependent_count=1,
            coverage=0.95,
            complexity=0.1,
            staleness=0.1,
        )

        assert high_value.composite_score > low_value.composite_score


class TestValueScoreDataclass:
    """Test ValueScore dataclass."""

    def test_value_score_creation(self):
        """Test ValueScore can be created with all fields."""
        score = ValueScore(
            file_path="test.py",
            access_score=0.5,
            criticality_score=0.3,
            improvement_score=0.7,
            complexity_score=0.4,
            staleness_score=0.2,
            composite_score=0.42,
            metadata={"key": "value"},
        )

        assert score.file_path == "test.py"
        assert score.access_score == 0.5
        assert score.criticality_score == 0.3
        assert score.improvement_score == 0.7
        assert score.complexity_score == 0.4
        assert score.staleness_score == 0.2
        assert score.composite_score == 0.42
        assert score.metadata == {"key": "value"}

    def test_value_score_default_metadata(self):
        """Test ValueScore has default empty metadata."""
        score = ValueScore(
            file_path="test.py",
            access_score=0.5,
            criticality_score=0.3,
            improvement_score=0.7,
            complexity_score=0.4,
            staleness_score=0.2,
            composite_score=0.42,
        )

        assert score.metadata == {}
