"""
StrategyLearner for deriving optimal bidding parameters.

Task 3.1 of Tectonic Realignment Plan.

Analyzes simulation results to learn optimal strategy parameters
for tectonic negotiations.
"""

import json
import logging
import math
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from systems.tectonic.arena import SimulationArena, SimulationResult
from systems.tectonic.strategy import StrategyProfile

logger = logging.getLogger("tectonic.learner")


@dataclass
class LearningConfig:
    """
    Configuration for the strategy learner.

    Attributes:
        learning_rate: Rate at which parameters are adjusted (0.0 to 1.0)
        min_samples: Minimum samples required before deriving strategy
        distance_bins: Number of bins for distance analysis
        bid_bins: Number of bins for bid analysis
    """

    learning_rate: float = 0.1
    min_samples: int = 100
    distance_bins: int = 10
    bid_bins: int = 10


class StrategyLearner:
    """
    Learns optimal strategy parameters from simulation results.

    Analyzes winning bids, distance patterns, and bid variance to derive
    a StrategyProfile that maximizes win probability.
    """

    def __init__(self, config: LearningConfig | None = None):
        """
        Initialize the strategy learner.

        Args:
            config: Optional learning configuration
        """
        self.config = config or LearningConfig()
        self._samples: list[SimulationResult] = []

        # Distance tracking: bin_index -> count
        self._distance_wins: dict[int, int] = {}
        self._total_by_distance: dict[int, int] = {}

        # Bid tracking: bin_index -> count
        self._bid_wins: dict[int, int] = {}
        self._total_by_bid: dict[int, int] = {}

    @property
    def samples_collected(self) -> int:
        """Get the number of samples collected."""
        return len(self._samples)

    def add_sample(self, result: SimulationResult) -> None:
        """
        Add a simulation result as a learning sample.

        Analyzes the result and updates internal tracking for
        distance and bid patterns.

        Args:
            result: The simulation result to learn from
        """
        self._samples.append(result)

        # Calculate distance from origin
        tile = result.tile
        distance = math.sqrt(tile[0] ** 2 + tile[1] ** 2)

        # Bin the distance (max expected distance ~20 for the arena)
        max_distance = 20.0
        distance_bin = min(
            int(distance / max_distance * self.config.distance_bins),
            self.config.distance_bins - 1,
        )

        # Track distance stats
        self._total_by_distance[distance_bin] = (
            self._total_by_distance.get(distance_bin, 0) + 1
        )

        # Bin the winning bid (assume max bid ~50)
        max_bid = 50.0
        bid_bin = min(
            int(result.winning_bid / max_bid * self.config.bid_bins),
            self.config.bid_bins - 1,
        )

        # Track bid stats
        self._total_by_bid[bid_bin] = self._total_by_bid.get(bid_bin, 0) + 1
        self._bid_wins[bid_bin] = self._bid_wins.get(bid_bin, 0) + 1

        # Track distance wins (winner's distance pattern)
        self._distance_wins[distance_bin] = (
            self._distance_wins.get(distance_bin, 0) + 1
        )

    def learn_from_arena(self, arena: SimulationArena) -> int:
        """
        Learn from all results in a simulation arena.

        Args:
            arena: The simulation arena to learn from

        Returns:
            Number of samples added
        """
        count = 0
        for result in arena.results:
            self.add_sample(result)
            count += 1
        logger.info(f"Learned from {count} arena results")
        return count

    def derive_strategy(self) -> StrategyProfile:
        """
        Derive an optimal strategy profile from collected samples.

        Analyzes:
        - Winning bids to derive base_bid_fraction
        - Distance patterns to derive distance_weight
        - Bid variance to derive aggression_level

        Returns:
            A new StrategyProfile with learned parameters
        """
        if self.samples_collected < self.config.min_samples:
            logger.warning(
                f"Only {self.samples_collected} samples, "
                f"need {self.config.min_samples} for reliable learning"
            )
            # Return default profile if not enough samples
            return StrategyProfile()

        # Analyze bid efficiency to get optimal bid fraction
        bid_analysis = self.analyze_bid_efficiency()
        optimal_bid_range = bid_analysis.get("optimal_bid_range", (5.0, 15.0))
        avg_optimal_bid = (optimal_bid_range[0] + optimal_bid_range[1]) / 2

        # Assume average budget of 100, calculate base_bid_fraction
        avg_budget = 100.0
        base_bid_fraction = avg_optimal_bid / avg_budget
        base_bid_fraction = max(0.05, min(0.3, base_bid_fraction))

        # Analyze distance correlation
        distance_analysis = self.analyze_distance_correlation()
        correlation = distance_analysis.get("correlation", 0.0)

        # Derive distance_weight from correlation
        # Negative correlation means closer tiles win more
        # Higher absolute correlation means stronger distance effect
        if correlation < 0:
            distance_weight = abs(correlation) * 0.15  # Scale to reasonable range
        else:
            distance_weight = 0.02  # Low weight if no clear pattern

        distance_weight = max(0.0, min(0.2, distance_weight))

        # Calculate bid variance for aggression level
        if self._samples:
            winning_bids = [r.winning_bid for r in self._samples]
            avg_bid = sum(winning_bids) / len(winning_bids)
            variance = sum((b - avg_bid) ** 2 for b in winning_bids) / len(winning_bids)
            std_dev = math.sqrt(variance)

            # High variance suggests aggressive bidding
            # Normalize std_dev relative to average bid
            normalized_variance = std_dev / avg_bid if avg_bid > 0 else 0
            aggression_level = min(1.0, normalized_variance)
        else:
            aggression_level = 0.5

        # Apply learning rate to smooth changes
        default = StrategyProfile()
        learned = StrategyProfile(
            base_bid_fraction=self._apply_learning(
                default.base_bid_fraction, base_bid_fraction
            ),
            distance_weight=self._apply_learning(
                default.distance_weight, distance_weight
            ),
            aggression_level=self._apply_learning(
                default.aggression_level, aggression_level
            ),
        )

        logger.info(
            f"Derived strategy: base_bid={learned.base_bid_fraction:.3f}, "
            f"distance_weight={learned.distance_weight:.3f}, "
            f"aggression={learned.aggression_level:.3f}"
        )

        return learned

    def _apply_learning(self, old_value: float, new_value: float) -> float:
        """Apply learning rate to smooth parameter changes."""
        return old_value + self.config.learning_rate * (new_value - old_value)

    def analyze_distance_correlation(self) -> dict[str, Any]:
        """
        Analyze correlation between distance and win rate.

        Bins samples by distance and calculates the correlation
        between distance and winning probability.

        Returns:
            Dictionary with:
            - correlation: Pearson correlation coefficient
            - bins: List of (distance_bin, win_rate) tuples
        """
        bins_data: list[tuple[int, float]] = []

        for bin_idx in sorted(self._total_by_distance.keys()):
            total = self._total_by_distance[bin_idx]
            wins = self._distance_wins.get(bin_idx, 0)
            win_rate = wins / total if total > 0 else 0.0
            bins_data.append((bin_idx, win_rate))

        # Calculate Pearson correlation
        if len(bins_data) < 2:
            return {"correlation": 0.0, "bins": bins_data}

        n = len(bins_data)
        sum_x = sum(b[0] for b in bins_data)
        sum_y = sum(b[1] for b in bins_data)
        sum_xy = sum(b[0] * b[1] for b in bins_data)
        sum_x2 = sum(b[0] ** 2 for b in bins_data)
        sum_y2 = sum(b[1] ** 2 for b in bins_data)

        numerator = n * sum_xy - sum_x * sum_y
        denominator = math.sqrt(
            (n * sum_x2 - sum_x ** 2) * (n * sum_y2 - sum_y ** 2)
        )

        correlation = numerator / denominator if denominator != 0 else 0.0

        return {
            "correlation": correlation,
            "bins": bins_data,
        }

    def analyze_bid_efficiency(self) -> dict[str, Any]:
        """
        Analyze bid efficiency to find optimal bid range.

        Bins samples by bid amount and identifies the bid range
        with the highest win rate.

        Returns:
            Dictionary with:
            - optimal_bid_range: Tuple of (min_bid, max_bid)
            - bid_rates: List of (bid_bin, win_rate) tuples
        """
        bid_rates: list[tuple[int, float]] = []

        for bin_idx in sorted(self._total_by_bid.keys()):
            total = self._total_by_bid[bin_idx]
            wins = self._bid_wins.get(bin_idx, 0)
            win_rate = wins / total if total > 0 else 0.0
            bid_rates.append((bin_idx, win_rate))

        # Find optimal bid range (bins with highest win rates)
        if bid_rates:
            # Sort by win rate
            sorted_rates = sorted(bid_rates, key=lambda x: x[1], reverse=True)

            # Get top bins (top 30% or at least 2 bins)
            top_count = max(2, len(sorted_rates) // 3)
            top_bins = sorted(sorted_rates[:top_count], key=lambda x: x[0])

            if top_bins:
                # Convert bin indices to bid amounts
                max_bid = 50.0
                min_bin = top_bins[0][0]
                max_bin = top_bins[-1][0]

                # Calculate actual bid range
                min_bid_value = (min_bin / self.config.bid_bins) * max_bid
                max_bid_value = ((max_bin + 1) / self.config.bid_bins) * max_bid

                optimal_bid_range = (min_bid_value, max_bid_value)
            else:
                optimal_bid_range = (5.0, 15.0)
        else:
            optimal_bid_range = (5.0, 15.0)

        return {
            "optimal_bid_range": optimal_bid_range,
            "bid_rates": bid_rates,
        }

    def export_learned_params(self) -> dict[str, Any]:
        """
        Export the derived strategy parameters.

        Returns:
            Dictionary representation of the derived StrategyProfile
        """
        profile = self.derive_strategy()
        return profile.to_dict()

    def save_profile(self, profile: StrategyProfile, path: str) -> None:
        """
        Save a strategy profile to a JSON file.

        Args:
            profile: The strategy profile to save
            path: File path to save to
        """
        file_path = Path(path)
        file_path.parent.mkdir(parents=True, exist_ok=True)

        with open(file_path, "w") as f:
            json.dump(profile.to_dict(), f, indent=2)

        logger.info(f"Saved strategy profile to {path}")

    def load_profile(self, path: str) -> StrategyProfile:
        """
        Load a strategy profile from a JSON file.

        Args:
            path: File path to load from

        Returns:
            The loaded StrategyProfile
        """
        with open(path) as f:
            data = json.load(f)

        profile = StrategyProfile.from_dict(data)
        logger.info(f"Loaded strategy profile from {path}")
        return profile

    def reset(self) -> None:
        """Reset all learned data."""
        self._samples = []
        self._distance_wins = {}
        self._total_by_distance = {}
        self._bid_wins = {}
        self._total_by_bid = {}
        logger.info("Reset learner state")
