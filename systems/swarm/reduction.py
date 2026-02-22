"""
Reduction strategies for merging results from parallel agents.

Different strategies for combining results based on task type.
"""

from abc import ABC, abstractmethod
from typing import List, Dict, Any, Optional
from collections import Counter


class ReductionStrategy(ABC):
    """Base class for reduction strategies."""

    @abstractmethod
    def reduce(self, results: List[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
        """
        Reduce multiple results into a single result.

        Args:
            results: List of result dictionaries from agents

        Returns:
            Reduced/merged result, or None if no results
        """
        pass


class FirstResultStrategy(ReductionStrategy):
    """Returns the first completed result."""

    def reduce(self, results: List[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
        if not results:
            return None
        return results[0]


class BestScoreStrategy(ReductionStrategy):
    """Picks result with highest score on a given key."""

    def __init__(self, score_key: str = "score"):
        self.score_key = score_key

    def reduce(self, results: List[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
        if not results:
            return None
        return max(results, key=lambda r: r.get(self.score_key, 0))


class MergeAllStrategy(ReductionStrategy):
    """Merges all results by combining lists."""

    def reduce(self, results: List[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
        if not results:
            return None

        merged = {}
        for result in results:
            for key, value in result.items():
                if key not in merged:
                    merged[key] = []
                if isinstance(value, list):
                    merged[key].extend(value)
                else:
                    merged[key].append(value)
        return merged


class MajorityVoteStrategy(ReductionStrategy):
    """Picks the most common value for a vote key."""

    def __init__(self, vote_key: str = "decision"):
        self.vote_key = vote_key

    def reduce(self, results: List[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
        if not results:
            return None

        votes = [r.get(self.vote_key) for r in results if self.vote_key in r]
        if not votes:
            return results[0]

        counter = Counter(votes)
        winner = counter.most_common(1)[0][0]

        # Return first result that has the winning vote
        for result in results:
            if result.get(self.vote_key) == winner:
                return result
        return results[0]


# Strategy registry
STRATEGIES = {
    "first": FirstResultStrategy,
    "best_score": BestScoreStrategy,
    "merge_all": MergeAllStrategy,
    "majority_vote": MajorityVoteStrategy,
}


def reduce_results(
    results: List[Dict[str, Any]],
    strategy: str = "first",
    **strategy_kwargs
) -> Optional[Dict[str, Any]]:
    """
    Reduce results using a named strategy.

    Args:
        results: List of result dictionaries
        strategy: Strategy name ("first", "best_score", "merge_all", "majority_vote")
        **strategy_kwargs: Additional arguments for the strategy

    Returns:
        Reduced result
    """
    strategy_class = STRATEGIES.get(strategy, FirstResultStrategy)
    instance = strategy_class(**strategy_kwargs)
    return instance.reduce(results)
