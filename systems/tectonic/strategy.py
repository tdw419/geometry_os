"""
StrategyProfile data structure for learned bidding strategies.

Task 1.1 of Tectonic Realignment Plan.
"""

import math
from dataclasses import dataclass
from enum import Enum
from typing import Any


class StrategyType(Enum):
    """Types of bidding strategies."""

    RANDOM = "random"
    AGGRESSIVE = "aggressive"
    CONSERVATIVE = "conservative"
    DISTANCE_AWARE = "distance_aware"
    ADAPTIVE = "adaptive"


@dataclass
class StrategyProfile:
    """
    Learned bidding strategy profile for tectonic negotiations.

    Encapsulates parameters that control how an agent bids on tiles,
    including base bid amounts, distance weighting, counter-bid behavior,
    and timing preferences.
    """

    base_bid_fraction: float = 0.1
    distance_weight: float = 0.05
    distance_decay: float = 0.5
    counter_bid_multiplier: float = 1.1
    counter_bid_threshold: float = 0.3
    bid_timing_ms: float = 250.0
    counter_timing_ms: float = 400.0
    aggression_level: float = 0.5
    budget_reserve_fraction: float = 0.2

    def calculate_optimal_bid(
        self,
        tile: tuple[int, int],
        purpose: str,
        budget: float
    ) -> float:
        """
        Calculate the optimal bid amount for a given tile.

        Formula:
            base = budget * base_bid_fraction
            distance_factor = 1 / (1 + distance * distance_weight)
            bid = base * distance_factor * (1 + aggression_level * 0.5)
            max_bid = budget * (1 - budget_reserve_fraction)

        Args:
            tile: The (x, y) coordinates of the tile to bid on
            purpose: The purpose of the claim (affects future extensions)
            budget: The agent's current budget

        Returns:
            The calculated bid amount, capped at max bid
        """
        # Calculate base bid
        base = budget * self.base_bid_fraction

        # Calculate distance from origin (0, 0)
        distance = math.sqrt(tile[0] ** 2 + tile[1] ** 2)

        # Calculate distance factor (closer tiles get higher bids)
        distance_factor = 1 / (1 + distance * self.distance_weight)

        # Apply aggression multiplier
        bid = base * distance_factor * (1 + self.aggression_level * 0.5)

        # Cap at maximum bid (respecting budget reserve)
        max_bid = budget * (1 - self.budget_reserve_fraction)

        return min(bid, max_bid)

    def should_counter_bid(
        self,
        original_bid: float,
        my_budget: float,
        tile: tuple[int, int] | None = None
    ) -> bool:
        """
        Determine whether to submit a counter-bid.

        Args:
            original_bid: The bid amount to counter
            my_budget: The agent's current budget
            tile: Optional tile coordinates (for future extensions)

        Returns:
            True if a counter-bid should be submitted, False otherwise
        """
        # Don't counter if the original bid is too high
        if original_bid > my_budget * self.counter_bid_threshold:
            return False

        # Consider aggression level - higher aggression means more likely to counter
        # Simple probabilistic model based on aggression
        import random
        return random.random() < self.aggression_level

    def calculate_counter_bid(self, original_bid: float) -> float:
        """
        Calculate the counter-bid amount.

        Args:
            original_bid: The bid amount to counter

        Returns:
            The counter-bid amount
        """
        return original_bid * self.counter_bid_multiplier

    def bid_timing_preference(self) -> float:
        """
        Get the preferred timing for submitting bids (in milliseconds).

        Returns:
            The bid timing in milliseconds
        """
        return self.bid_timing_ms

    def counter_timing_preference(self) -> float:
        """
        Get the preferred timing for submitting counter-bids (in milliseconds).

        Returns:
            The counter-bid timing in milliseconds
        """
        return self.counter_timing_ms

    def to_dict(self) -> dict[str, Any]:
        """
        Serialize the strategy profile to a dictionary.

        Returns:
            Dictionary representation of the profile
        """
        return {
            "base_bid_fraction": self.base_bid_fraction,
            "distance_weight": self.distance_weight,
            "distance_decay": self.distance_decay,
            "counter_bid_multiplier": self.counter_bid_multiplier,
            "counter_bid_threshold": self.counter_bid_threshold,
            "bid_timing_ms": self.bid_timing_ms,
            "counter_timing_ms": self.counter_timing_ms,
            "aggression_level": self.aggression_level,
            "budget_reserve_fraction": self.budget_reserve_fraction,
        }

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "StrategyProfile":
        """
        Deserialize a strategy profile from a dictionary.

        Args:
            data: Dictionary containing profile data

        Returns:
            A new StrategyProfile instance
        """
        return cls(
            base_bid_fraction=data.get("base_bid_fraction", 0.1),
            distance_weight=data.get("distance_weight", 0.05),
            distance_decay=data.get("distance_decay", 0.5),
            counter_bid_multiplier=data.get("counter_bid_multiplier", 1.1),
            counter_bid_threshold=data.get("counter_bid_threshold", 0.3),
            bid_timing_ms=data.get("bid_timing_ms", 250.0),
            counter_timing_ms=data.get("counter_timing_ms", 400.0),
            aggression_level=data.get("aggression_level", 0.5),
            budget_reserve_fraction=data.get("budget_reserve_fraction", 0.2),
        )

    @classmethod
    def get_preset(cls, strategy_type: StrategyType) -> "StrategyProfile":
        """
        Get a preset strategy profile based on strategy type.

        Args:
            strategy_type: The type of strategy preset to use

        Returns:
            A StrategyProfile configured for the given type
        """
        if strategy_type == StrategyType.RANDOM:
            # Random strategy: high variance, no distance awareness
            return cls(
                base_bid_fraction=0.3,
                distance_weight=0.0,
                distance_decay=0.5,
                counter_bid_multiplier=1.1,
                counter_bid_threshold=0.3,
                bid_timing_ms=250.0,
                counter_timing_ms=400.0,
                aggression_level=0.5,
                budget_reserve_fraction=0.2,
            )

        elif strategy_type == StrategyType.AGGRESSIVE:
            # Aggressive strategy: high bids, quick to counter
            return cls(
                base_bid_fraction=0.25,
                distance_weight=0.05,
                distance_decay=0.5,
                counter_bid_multiplier=1.3,
                counter_bid_threshold=0.3,
                bid_timing_ms=250.0,
                counter_timing_ms=400.0,
                aggression_level=0.9,
                budget_reserve_fraction=0.2,
            )

        elif strategy_type == StrategyType.CONSERVATIVE:
            # Conservative strategy: low bids, cautious counters
            return cls(
                base_bid_fraction=0.08,
                distance_weight=0.05,
                distance_decay=0.5,
                counter_bid_multiplier=1.1,
                counter_bid_threshold=0.15,
                bid_timing_ms=250.0,
                counter_timing_ms=400.0,
                aggression_level=0.2,
                budget_reserve_fraction=0.2,
            )

        elif strategy_type == StrategyType.DISTANCE_AWARE:
            # Distance-aware strategy: strong distance weighting
            return cls(
                base_bid_fraction=0.12,
                distance_weight=0.1,
                distance_decay=0.5,
                counter_bid_multiplier=1.1,
                counter_bid_threshold=0.3,
                bid_timing_ms=250.0,
                counter_timing_ms=400.0,
                aggression_level=0.5,
                budget_reserve_fraction=0.2,
            )

        elif strategy_type == StrategyType.ADAPTIVE:
            # Adaptive strategy: balanced for learning
            return cls(
                base_bid_fraction=0.15,
                distance_weight=0.05,
                distance_decay=0.5,
                counter_bid_multiplier=1.1,
                counter_bid_threshold=0.3,
                bid_timing_ms=250.0,
                counter_timing_ms=400.0,
                aggression_level=0.5,
                budget_reserve_fraction=0.2,
            )

        else:
            # Default to adaptive
            return cls()
