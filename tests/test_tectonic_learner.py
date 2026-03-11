"""
Tests for StrategyLearner.

Task 3.1 of Tectonic Realignment Plan.
"""

import json

from systems.tectonic.arena import (
    AgentConfig,
    SimulationArena,
    SimulationResult,
)
from systems.tectonic.learner import LearningConfig, StrategyLearner
from systems.tectonic.strategy import StrategyProfile, StrategyType


class TestLearningConfig:
    """Tests for LearningConfig dataclass."""

    def test_default_config(self):
        """Test default configuration values."""
        config = LearningConfig()
        assert config.learning_rate == 0.1
        assert config.min_samples == 100
        assert config.distance_bins == 10
        assert config.bid_bins == 10

    def test_custom_config(self):
        """Test custom configuration values."""
        config = LearningConfig(
            learning_rate=0.05,
            min_samples=50,
            distance_bins=5,
            bid_bins=8,
        )
        assert config.learning_rate == 0.05
        assert config.min_samples == 50
        assert config.distance_bins == 5
        assert config.bid_bins == 8

    def test_config_bounds(self):
        """Test configuration with edge case values."""
        config = LearningConfig(
            learning_rate=1.0,
            min_samples=1,
            distance_bins=1,
            bid_bins=1,
        )
        assert config.learning_rate == 1.0
        assert config.min_samples == 1


class TestStrategyLearnerCreation:
    """Tests for StrategyLearner instantiation."""

    def test_create_learner_default_config(self):
        """Test creating learner with default config."""
        learner = StrategyLearner()
        assert learner.config.learning_rate == 0.1
        assert learner.samples_collected == 0

    def test_create_learner_custom_config(self):
        """Test creating learner with custom config."""
        config = LearningConfig(learning_rate=0.2, min_samples=50)
        learner = StrategyLearner(config)
        assert learner.config.learning_rate == 0.2
        assert learner.config.min_samples == 50

    def test_samples_collected_property(self):
        """Test samples_collected property."""
        learner = StrategyLearner()
        assert learner.samples_collected == 0


class TestStrategyLearnerAddSample:
    """Tests for add_sample method."""

    def test_add_single_sample(self):
        """Test adding a single sample."""
        learner = StrategyLearner()
        result = SimulationResult(
            round_id=1,
            winner="agent_a",
            tile=(5, 5),
            winning_bid=10.0,
            participants=["agent_a", "agent_b"],
            forces={"agent_a": 10.0, "agent_b": 8.0},
        )
        learner.add_sample(result)
        assert learner.samples_collected == 1

    def test_add_multiple_samples(self):
        """Test adding multiple samples."""
        learner = StrategyLearner()
        for i in range(10):
            result = SimulationResult(
                round_id=i + 1,
                winner=f"agent_{i % 2}",
                tile=(i, i),
                winning_bid=float(i + 1),
                participants=["agent_a", "agent_b"],
                forces={},
            )
            learner.add_sample(result)
        assert learner.samples_collected == 10

    def test_add_sample_updates_distance_tracking(self):
        """Test that add_sample updates distance tracking."""
        learner = StrategyLearner()
        result = SimulationResult(
            round_id=1,
            winner="agent_a",
            tile=(10, 0),  # distance = 10
            winning_bid=10.0,
            participants=["agent_a"],
            forces={},
        )
        learner.add_sample(result)
        assert len(learner._total_by_distance) > 0
        assert len(learner._distance_wins) > 0

    def test_add_sample_updates_bid_tracking(self):
        """Test that add_sample updates bid tracking."""
        learner = StrategyLearner()
        result = SimulationResult(
            round_id=1,
            winner="agent_a",
            tile=(5, 5),
            winning_bid=25.0,
            participants=["agent_a"],
            forces={},
        )
        learner.add_sample(result)
        assert len(learner._total_by_bid) > 0
        assert len(learner._bid_wins) > 0


class TestStrategyLearnerLearnFromArena:
    """Tests for learn_from_arena method."""

    def test_learn_from_empty_arena(self):
        """Test learning from arena with no results."""
        learner = StrategyLearner()
        arena = SimulationArena()
        count = learner.learn_from_arena(arena)
        assert count == 0
        assert learner.samples_collected == 0

    def test_learn_from_arena_with_results(self):
        """Test learning from arena with results."""
        learner = StrategyLearner()
        arena = SimulationArena()
        arena.add_agent(AgentConfig(agent_id="a", strategy_type=StrategyType.AGGRESSIVE))
        arena.add_agent(AgentConfig(agent_id="b", strategy_type=StrategyType.CONSERVATIVE))

        arena.run_rounds(5)

        count = learner.learn_from_arena(arena)
        assert count == 5
        assert learner.samples_collected == 5

    def test_learn_from_arena_accumulates(self):
        """Test that learning accumulates across multiple arenas."""
        learner = StrategyLearner()

        arena1 = SimulationArena()
        arena1.add_agent(AgentConfig(agent_id="a", strategy_type=StrategyType.AGGRESSIVE))
        arena1.add_agent(AgentConfig(agent_id="b", strategy_type=StrategyType.CONSERVATIVE))
        arena1.run_rounds(3)
        learner.learn_from_arena(arena1)

        arena2 = SimulationArena()
        arena2.add_agent(AgentConfig(agent_id="c", strategy_type=StrategyType.AGGRESSIVE))
        arena2.add_agent(AgentConfig(agent_id="d", strategy_type=StrategyType.CONSERVATIVE))
        arena2.run_rounds(4)
        learner.learn_from_arena(arena2)

        assert learner.samples_collected == 7


class TestStrategyLearnerDeriveStrategy:
    """Tests for derive_strategy method."""

    def test_derive_strategy_returns_profile(self):
        """Test that derive_strategy returns a StrategyProfile."""
        learner = StrategyLearner(LearningConfig(min_samples=1))
        result = SimulationResult(
            round_id=1,
            winner="agent_a",
            tile=(5, 5),
            winning_bid=10.0,
            participants=["agent_a"],
            forces={},
        )
        learner.add_sample(result)

        profile = learner.derive_strategy()
        assert isinstance(profile, StrategyProfile)

    def test_derive_strategy_returns_default_with_no_samples(self):
        """Test that derive_strategy returns default profile with no samples."""
        learner = StrategyLearner()
        profile = learner.derive_strategy()
        default = StrategyProfile()
        assert profile.base_bid_fraction == default.base_bid_fraction
        assert profile.distance_weight == default.distance_weight

    def test_derive_strategy_with_sufficient_samples(self):
        """Test derive_strategy with enough samples."""
        learner = StrategyLearner(LearningConfig(min_samples=10))

        arena = SimulationArena()
        arena.add_agent(AgentConfig(agent_id="a", strategy_type=StrategyType.AGGRESSIVE))
        arena.add_agent(AgentConfig(agent_id="b", strategy_type=StrategyType.CONSERVATIVE))
        arena.run_rounds(15)

        learner.learn_from_arena(arena)
        profile = learner.derive_strategy()

        assert isinstance(profile, StrategyProfile)
        # Parameters should be within reasonable bounds
        assert 0.0 <= profile.base_bid_fraction <= 1.0
        assert 0.0 <= profile.distance_weight <= 1.0
        assert 0.0 <= profile.aggression_level <= 1.0

    def test_derive_strategy_respects_learning_rate(self):
        """Test that learning rate affects derived strategy."""
        # Low learning rate - should stay closer to defaults
        learner_low = StrategyLearner(LearningConfig(learning_rate=0.01, min_samples=10))

        arena = SimulationArena()
        arena.add_agent(AgentConfig(agent_id="a", strategy_type=StrategyType.AGGRESSIVE))
        arena.add_agent(AgentConfig(agent_id="b", strategy_type=StrategyType.CONSERVATIVE))
        arena.run_rounds(15)
        learner_low.learn_from_arena(arena)

        profile_low = learner_low.derive_strategy()
        default = StrategyProfile()

        # With low learning rate, should be close to defaults
        assert abs(profile_low.base_bid_fraction - default.base_bid_fraction) < 0.5


class TestStrategyLearnerAnalyzeDistanceCorrelation:
    """Tests for analyze_distance_correlation method."""

    def test_analyze_distance_correlation_empty(self):
        """Test correlation analysis with no samples."""
        learner = StrategyLearner()
        result = learner.analyze_distance_correlation()
        assert "correlation" in result
        assert "bins" in result
        assert result["correlation"] == 0.0

    def test_analyze_distance_correlation_with_samples(self):
        """Test correlation analysis with samples."""
        learner = StrategyLearner()

        # Add samples with varying distances
        for i in range(20):
            result = SimulationResult(
                round_id=i + 1,
                winner="agent_a",
                tile=(i, 0),  # Distance = i
                winning_bid=10.0,
                participants=["agent_a"],
                forces={},
            )
            learner.add_sample(result)

        analysis = learner.analyze_distance_correlation()
        assert "correlation" in analysis
        assert "bins" in analysis
        assert isinstance(analysis["correlation"], float)
        assert isinstance(analysis["bins"], list)

    def test_analyze_distance_correlation_returns_bins(self):
        """Test that bins are returned in analysis."""
        learner = StrategyLearner()

        result = SimulationResult(
            round_id=1,
            winner="agent_a",
            tile=(5, 5),
            winning_bid=10.0,
            participants=["agent_a"],
            forces={},
        )
        learner.add_sample(result)

        analysis = learner.analyze_distance_correlation()
        assert len(analysis["bins"]) > 0
        # Each bin should be (bin_index, win_rate)
        for bin_data in analysis["bins"]:
            assert len(bin_data) == 2


class TestStrategyLearnerAnalyzeBidEfficiency:
    """Tests for analyze_bid_efficiency method."""

    def test_analyze_bid_efficiency_empty(self):
        """Test bid efficiency analysis with no samples."""
        learner = StrategyLearner()
        result = learner.analyze_bid_efficiency()
        assert "optimal_bid_range" in result
        assert "bid_rates" in result
        # Should return default range when no samples
        assert result["optimal_bid_range"] == (5.0, 15.0)

    def test_analyze_bid_efficiency_with_samples(self):
        """Test bid efficiency analysis with samples."""
        learner = StrategyLearner()

        # Add samples with varying bid amounts
        for i in range(20):
            result = SimulationResult(
                round_id=i + 1,
                winner="agent_a",
                tile=(5, 5),
                winning_bid=float(i * 2 + 1),  # Bids from 1 to 39
                participants=["agent_a"],
                forces={},
            )
            learner.add_sample(result)

        analysis = learner.analyze_bid_efficiency()
        assert "optimal_bid_range" in analysis
        assert "bid_rates" in analysis
        assert isinstance(analysis["optimal_bid_range"], tuple)
        assert len(analysis["optimal_bid_range"]) == 2

    def test_analyze_bid_efficiency_returns_bid_rates(self):
        """Test that bid rates are returned in analysis."""
        learner = StrategyLearner()

        result = SimulationResult(
            round_id=1,
            winner="agent_a",
            tile=(5, 5),
            winning_bid=25.0,
            participants=["agent_a"],
            forces={},
        )
        learner.add_sample(result)

        analysis = learner.analyze_bid_efficiency()
        assert len(analysis["bid_rates"]) > 0
        # Each rate should be (bid_bin, win_rate)
        for rate_data in analysis["bid_rates"]:
            assert len(rate_data) == 2


class TestStrategyLearnerExportLearnedParams:
    """Tests for export_learned_params method."""

    def test_export_learned_params_returns_dict(self):
        """Test that export returns a dictionary."""
        learner = StrategyLearner(LearningConfig(min_samples=1))
        result = SimulationResult(
            round_id=1,
            winner="agent_a",
            tile=(5, 5),
            winning_bid=10.0,
            participants=["agent_a"],
            forces={},
        )
        learner.add_sample(result)

        params = learner.export_learned_params()
        assert isinstance(params, dict)

    def test_export_learned_params_contains_all_fields(self):
        """Test that exported params contain all StrategyProfile fields."""
        learner = StrategyLearner(LearningConfig(min_samples=1))
        result = SimulationResult(
            round_id=1,
            winner="agent_a",
            tile=(5, 5),
            winning_bid=10.0,
            participants=["agent_a"],
            forces={},
        )
        learner.add_sample(result)

        params = learner.export_learned_params()
        expected_keys = [
            "base_bid_fraction",
            "distance_weight",
            "distance_decay",
            "counter_bid_multiplier",
            "counter_bid_threshold",
            "bid_timing_ms",
            "counter_timing_ms",
            "aggression_level",
            "budget_reserve_fraction",
        ]
        for key in expected_keys:
            assert key in params


class TestStrategyLearnerSaveLoad:
    """Tests for save_profile and load_profile methods."""

    def test_save_profile(self, tmp_path):
        """Test saving a profile to file."""
        learner = StrategyLearner()
        profile = StrategyProfile(
            base_bid_fraction=0.15,
            distance_weight=0.08,
            aggression_level=0.7,
        )

        file_path = tmp_path / "strategy.json"
        learner.save_profile(profile, str(file_path))

        assert file_path.exists()

    def test_load_profile(self, tmp_path):
        """Test loading a profile from file."""
        learner = StrategyLearner()
        original = StrategyProfile(
            base_bid_fraction=0.15,
            distance_weight=0.08,
            aggression_level=0.7,
        )

        file_path = tmp_path / "strategy.json"
        learner.save_profile(original, str(file_path))
        loaded = learner.load_profile(str(file_path))

        assert loaded.base_bid_fraction == original.base_bid_fraction
        assert loaded.distance_weight == original.distance_weight
        assert loaded.aggression_level == original.aggression_level

    def test_save_load_roundtrip(self, tmp_path):
        """Test that save/load preserves all profile values."""
        learner = StrategyLearner()
        original = StrategyProfile(
            base_bid_fraction=0.2,
            distance_weight=0.1,
            distance_decay=0.6,
            counter_bid_multiplier=1.2,
            counter_bid_threshold=0.25,
            bid_timing_ms=300.0,
            counter_timing_ms=500.0,
            aggression_level=0.8,
            budget_reserve_fraction=0.15,
        )

        file_path = tmp_path / "strategy.json"
        learner.save_profile(original, str(file_path))
        loaded = learner.load_profile(str(file_path))

        # All fields should match
        assert loaded.base_bid_fraction == original.base_bid_fraction
        assert loaded.distance_weight == original.distance_weight
        assert loaded.distance_decay == original.distance_decay
        assert loaded.counter_bid_multiplier == original.counter_bid_multiplier
        assert loaded.counter_bid_threshold == original.counter_bid_threshold
        assert loaded.bid_timing_ms == original.bid_timing_ms
        assert loaded.counter_timing_ms == original.counter_timing_ms
        assert loaded.aggression_level == original.aggression_level
        assert loaded.budget_reserve_fraction == original.budget_reserve_fraction

    def test_save_creates_parent_directories(self, tmp_path):
        """Test that save creates parent directories if needed."""
        learner = StrategyLearner()
        profile = StrategyProfile()

        file_path = tmp_path / "nested" / "dir" / "strategy.json"
        learner.save_profile(profile, str(file_path))

        assert file_path.exists()

    def test_saved_file_is_valid_json(self, tmp_path):
        """Test that saved file is valid JSON."""
        learner = StrategyLearner()
        profile = StrategyProfile(base_bid_fraction=0.12)

        file_path = tmp_path / "strategy.json"
        learner.save_profile(profile, str(file_path))

        # Should be able to parse as JSON
        with open(file_path) as f:
            data = json.load(f)

        assert data["base_bid_fraction"] == 0.12


class TestStrategyLearnerReset:
    """Tests for reset method."""

    def test_reset_clears_samples(self):
        """Test that reset clears all samples."""
        learner = StrategyLearner()
        for i in range(10):
            result = SimulationResult(
                round_id=i + 1,
                winner="agent_a",
                tile=(i, i),
                winning_bid=10.0,
                participants=["agent_a"],
                forces={},
            )
            learner.add_sample(result)

        assert learner.samples_collected == 10
        learner.reset()
        assert learner.samples_collected == 0

    def test_reset_clears_tracking_dicts(self):
        """Test that reset clears internal tracking dictionaries."""
        learner = StrategyLearner()
        result = SimulationResult(
            round_id=1,
            winner="agent_a",
            tile=(5, 5),
            winning_bid=10.0,
            participants=["agent_a"],
            forces={},
        )
        learner.add_sample(result)

        learner.reset()
        assert len(learner._distance_wins) == 0
        assert len(learner._total_by_distance) == 0
        assert len(learner._bid_wins) == 0
        assert len(learner._total_by_bid) == 0
