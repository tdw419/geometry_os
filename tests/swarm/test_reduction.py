"""
Tests for reduction strategies - merging results from parallel agents.
"""

import pytest
from systems.swarm.reduction import (
    ReductionStrategy,
    FirstResultStrategy,
    BestScoreStrategy,
    MergeAllStrategy,
    MajorityVoteStrategy,
    get_strategy,
    reduce_results
)


class TestReductionStrategies:
    """Test result reduction strategies."""

    def test_first_result_strategy(self):
        """FirstResult returns the first completed result."""
        strategy = FirstResultStrategy()
        results = [
            {"value": 1},
            {"value": 2},
            {"value": 3}
        ]
        reduced = strategy.reduce(results)
        assert reduced["value"] == 1

    def test_best_score_strategy(self):
        """BestScore picks result with highest score."""
        strategy = BestScoreStrategy(score_key="confidence")
        results = [
            {"answer": "A", "confidence": 0.7},
            {"answer": "B", "confidence": 0.9},
            {"answer": "C", "confidence": 0.5}
        ]
        reduced = strategy.reduce(results)
        assert reduced["answer"] == "B"

    def test_merge_all_strategy(self):
        """MergeAll combines all results into list."""
        strategy = MergeAllStrategy()
        results = [
            {"files": ["a.py"]},
            {"files": ["b.py"]},
            {"files": ["c.py"]}
        ]
        reduced = strategy.reduce(results)
        assert "a.py" in reduced["files"]
        assert "b.py" in reduced["files"]
        assert "c.py" in reduced["files"]

    def test_majority_vote_strategy(self):
        """MajorityVote picks most common answer."""
        strategy = MajorityVoteStrategy(vote_key="decision")
        results = [
            {"decision": "approve"},
            {"decision": "approve"},
            {"decision": "reject"},
            {"decision": "approve"}
        ]
        reduced = strategy.reduce(results)
        assert reduced["decision"] == "approve"

    def test_reduce_results_factory(self):
        """reduce_results picks correct strategy by name."""
        results = [{"score": 0.8, "id": 1}, {"score": 0.9, "id": 2}]

        # Best score
        reduced = reduce_results(results, strategy="best_score", score_key="score")
        assert reduced["id"] == 2

        # First result
        reduced = reduce_results(results, strategy="first")
        assert reduced["id"] == 1

    def test_get_strategy_by_name(self):
        """get_strategy returns correct strategy type."""
        assert isinstance(get_strategy("first"), FirstResultStrategy)
        assert isinstance(get_strategy("best_score"), BestScoreStrategy)
        assert isinstance(get_strategy("merge_all"), MergeAllStrategy)
        assert isinstance(get_strategy("majority_vote"), MajorityVoteStrategy)

    def test_get_strategy_unknown_defaults_to_first(self):
        """get_strategy defaults to FirstResultStrategy for unknown names."""
        strategy = get_strategy("unknown")
        assert isinstance(strategy, FirstResultStrategy)

    def test_empty_results_returns_none(self):
        """Reducing empty results returns None."""
        strategy = FirstResultStrategy()
        assert strategy.reduce([]) is None
