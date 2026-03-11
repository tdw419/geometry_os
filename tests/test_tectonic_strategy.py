"""
Tests for StrategyProfile data structure.

Task 1.1 of Tectonic Realignment Plan.
"""

import pytest

from systems.tectonic.strategy import StrategyProfile, StrategyType


class TestStrategyProfileCreation:
    """Tests for StrategyProfile instantiation."""

    def test_strategy_profile_creation_with_defaults(self):
        """Test creating a strategy profile with default values."""
        profile = StrategyProfile()

        assert profile.base_bid_fraction == 0.1
        assert profile.distance_weight == 0.05
        assert profile.distance_decay == 0.5
        assert profile.counter_bid_multiplier == 1.1
        assert profile.counter_bid_threshold == 0.3
        assert profile.bid_timing_ms == 250.0
        assert profile.counter_timing_ms == 400.0
        assert profile.aggression_level == 0.5
        assert profile.budget_reserve_fraction == 0.2

    def test_strategy_profile_with_custom_values(self):
        """Test creating a strategy profile with custom values."""
        profile = StrategyProfile(
            base_bid_fraction=0.2,
            distance_weight=0.1,
            counter_bid_multiplier=1.5,
            aggression_level=0.8,
        )

        assert profile.base_bid_fraction == 0.2
        assert profile.distance_weight == 0.1
        assert profile.counter_bid_multiplier == 1.5
        assert profile.aggression_level == 0.8
        # Defaults still apply
        assert profile.distance_decay == 0.5
        assert profile.counter_bid_threshold == 0.3


class TestCalculateOptimalBid:
    """Tests for calculate_optimal_bid method."""

    def test_calculate_optimal_bid_near_origin_higher_bid(self):
        """Test that tiles near origin get higher bids."""
        profile = StrategyProfile(base_bid_fraction=0.1, distance_weight=0.05)
        budget = 1000.0

        # Near origin (0, 0) - distance = 0
        near_bid = profile.calculate_optimal_bid((0, 0), "build", budget)

        # distance_factor = 1 / (1 + 0 * 0.05) = 1.0
        # base = 1000 * 0.1 = 100
        # bid = 100 * 1.0 * (1 + 0.5 * 0.5) = 100 * 1.0 * 1.25 = 125
        # max_bid = 1000 * 0.8 = 800
        # final = min(125, 800) = 125
        assert near_bid == pytest.approx(125.0, rel=0.01)

    def test_calculate_optimal_bid_far_from_origin_lower_bid(self):
        """Test that tiles far from origin get lower bids."""
        profile = StrategyProfile(base_bid_fraction=0.1, distance_weight=0.05)
        budget = 1000.0

        # Far from origin (100, 100) - distance = sqrt(20000) ~ 141.4
        far_bid = profile.calculate_optimal_bid((100, 100), "build", budget)

        # Near origin bid should be higher than far bid
        near_bid = profile.calculate_optimal_bid((0, 0), "build", budget)
        assert near_bid > far_bid

        # Verify far bid is reduced due to distance
        # distance_factor = 1 / (1 + 141.4 * 0.05) ~ 0.124
        # bid should be significantly lower than base * aggression multiplier
        assert far_bid < 100.0  # Less than base bid of 100

    def test_calculate_optimal_bid_respects_budget_reserve(self):
        """Test that bids don't exceed budget reserve."""
        profile = StrategyProfile(
            base_bid_fraction=0.5,  # High base fraction
            budget_reserve_fraction=0.2
        )
        budget = 100.0

        # Even with high base fraction, bid should be capped
        bid = profile.calculate_optimal_bid((0, 0), "build", budget)

        # Max bid = 100 * (1 - 0.2) = 80
        assert bid <= 80.0

    def test_calculate_optimal_bid_with_aggression(self):
        """Test that aggression level affects bid amount."""
        low_aggression = StrategyProfile(aggression_level=0.1)
        high_aggression = StrategyProfile(aggression_level=0.9)
        budget = 1000.0

        low_bid = low_aggression.calculate_optimal_bid((10, 10), "build", budget)
        high_bid = high_aggression.calculate_optimal_bid((10, 10), "build", budget)

        # High aggression should result in higher bid
        assert high_bid > low_bid


class TestShouldCounterBid:
    """Tests for should_counter_bid method."""

    def test_should_counter_bid_when_original_is_low_true(self):
        """Test that counter-bid is considered when original is low."""
        profile = StrategyProfile(
            counter_bid_threshold=0.3,
            aggression_level=1.0  # Always counter if threshold allows
        )
        budget = 100.0

        # Original bid of 20 is less than 100 * 0.3 = 30
        # With aggression 1.0, should always return True
        result = profile.should_counter_bid(20.0, budget)
        assert result is True

    def test_should_counter_bid_when_original_is_high_false(self):
        """Test that counter-bid is rejected when original is too high."""
        profile = StrategyProfile(
            counter_bid_threshold=0.3,
            aggression_level=1.0  # Even with max aggression
        )
        budget = 100.0

        # Original bid of 50 is more than 100 * 0.3 = 30
        result = profile.should_counter_bid(50.0, budget)
        assert result is False

    def test_should_counter_bid_respects_threshold(self):
        """Test that counter_bid_threshold is properly applied."""
        profile = StrategyProfile(
            counter_bid_threshold=0.5,  # 50% of budget
            aggression_level=1.0
        )
        budget = 100.0

        # 40 < 50, should pass threshold check
        result = profile.should_counter_bid(40.0, budget)
        assert result is True

        # 60 > 50, should fail threshold check
        result = profile.should_counter_bid(60.0, budget)
        assert result is False


class TestCalculateCounterBid:
    """Tests for calculate_counter_bid method."""

    def test_calculate_counter_bid_amount(self):
        """Test that counter-bid is calculated correctly."""
        profile = StrategyProfile(counter_bid_multiplier=1.1)

        counter = profile.calculate_counter_bid(100.0)
        assert counter == pytest.approx(110.0)

    def test_calculate_counter_bid_with_custom_multiplier(self):
        """Test counter-bid with custom multiplier."""
        profile = StrategyProfile(counter_bid_multiplier=1.5)

        counter = profile.calculate_counter_bid(100.0)
        assert counter == 150.0


class TestTimingPreferences:
    """Tests for timing preference methods."""

    def test_bid_timing_preference(self):
        """Test bid timing preference."""
        profile = StrategyProfile(bid_timing_ms=250.0)

        assert profile.bid_timing_preference() == 250.0

    def test_counter_timing_preference(self):
        """Test counter-bid timing preference."""
        profile = StrategyProfile(counter_timing_ms=400.0)

        assert profile.counter_timing_preference() == 400.0


class TestSerialization:
    """Tests for to_dict and from_dict methods."""

    def test_serialization_to_dict_from_dict(self):
        """Test that profiles can be serialized and deserialized."""
        original = StrategyProfile(
            base_bid_fraction=0.15,
            distance_weight=0.08,
            distance_decay=0.6,
            counter_bid_multiplier=1.2,
            counter_bid_threshold=0.25,
            bid_timing_ms=300.0,
            counter_timing_ms=500.0,
            aggression_level=0.7,
            budget_reserve_fraction=0.15,
        )

        # Serialize to dict
        data = original.to_dict()

        # Verify all fields are present
        assert data["base_bid_fraction"] == 0.15
        assert data["distance_weight"] == 0.08
        assert data["aggression_level"] == 0.7

        # Deserialize back
        restored = StrategyProfile.from_dict(data)

        # Verify all fields match
        assert restored.base_bid_fraction == original.base_bid_fraction
        assert restored.distance_weight == original.distance_weight
        assert restored.distance_decay == original.distance_decay
        assert restored.counter_bid_multiplier == original.counter_bid_multiplier
        assert restored.counter_bid_threshold == original.counter_bid_threshold
        assert restored.bid_timing_ms == original.bid_timing_ms
        assert restored.counter_timing_ms == original.counter_timing_ms
        assert restored.aggression_level == original.aggression_level
        assert restored.budget_reserve_fraction == original.budget_reserve_fraction

    def test_from_dict_with_missing_fields_uses_defaults(self):
        """Test that missing fields use default values."""
        data = {"base_bid_fraction": 0.2}

        profile = StrategyProfile.from_dict(data)

        assert profile.base_bid_fraction == 0.2
        assert profile.distance_weight == 0.05  # Default
        assert profile.aggression_level == 0.5  # Default


class TestStrategyTypeEnum:
    """Tests for StrategyType enum."""

    def test_strategy_type_enum_values(self):
        """Test that StrategyType has all required values."""
        assert StrategyType.RANDOM.value == "random"
        assert StrategyType.AGGRESSIVE.value == "aggressive"
        assert StrategyType.CONSERVATIVE.value == "conservative"
        assert StrategyType.DISTANCE_AWARE.value == "distance_aware"
        assert StrategyType.ADAPTIVE.value == "adaptive"


class TestPresetStrategies:
    """Tests for get_preset classmethod."""

    def test_get_preset_strategy_for_aggressive_high_aggression(self):
        """Test that AGGRESSIVE preset has high aggression."""
        profile = StrategyProfile.get_preset(StrategyType.AGGRESSIVE)

        assert profile.aggression_level == 0.9
        assert profile.base_bid_fraction == 0.25
        assert profile.counter_bid_multiplier == 1.3

    def test_get_preset_strategy_for_conservative_low_aggression(self):
        """Test that CONSERVATIVE preset has low aggression."""
        profile = StrategyProfile.get_preset(StrategyType.CONSERVATIVE)

        assert profile.aggression_level == 0.2
        assert profile.base_bid_fraction == 0.08
        assert profile.counter_bid_threshold == 0.15

    def test_get_preset_strategy_for_random(self):
        """Test RANDOM preset configuration."""
        profile = StrategyProfile.get_preset(StrategyType.RANDOM)

        assert profile.base_bid_fraction == 0.3
        assert profile.distance_weight == 0.0

    def test_get_preset_strategy_for_distance_aware(self):
        """Test DISTANCE_AWARE preset configuration."""
        profile = StrategyProfile.get_preset(StrategyType.DISTANCE_AWARE)

        assert profile.base_bid_fraction == 0.12
        assert profile.distance_weight == 0.1

    def test_get_preset_strategy_for_adaptive(self):
        """Test ADAPTIVE preset configuration."""
        profile = StrategyProfile.get_preset(StrategyType.ADAPTIVE)

        assert profile.base_bid_fraction == 0.15


class TestIntegration:
    """Integration tests combining multiple methods."""

    def test_aggressive_profile_full_workflow(self):
        """Test full workflow with aggressive profile."""
        profile = StrategyProfile.get_preset(StrategyType.AGGRESSIVE)
        budget = 1000.0

        # Calculate bid for a tile
        bid = profile.calculate_optimal_bid((5, 5), "build", budget)

        # Check timing preferences
        timing = profile.bid_timing_preference()

        # Serialize and restore
        restored = StrategyProfile.from_dict(profile.to_dict())

        assert restored.aggression_level == 0.9
        assert timing == 250.0

    def test_conservative_profile_counter_bid_decision(self):
        """Test counter-bid decision with conservative profile."""
        profile = StrategyProfile.get_preset(StrategyType.CONSERVATIVE)
        budget = 100.0

        # Conservative has counter_bid_threshold=0.15
        # So 10 < 15 should pass threshold (but depends on random/aggression)
        # With low aggression, less likely to counter

        # High bid should always be rejected
        assert profile.should_counter_bid(20.0, budget) is False  # 20 > 15
