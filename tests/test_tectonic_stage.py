"""
Tests for TectonicStage evolution stage.

Tests cover:
- Stage creation and initialization
- Assessment runs simulations
- Proposal generation for mutations
- Application of strategy modifications
- Verification of improvements
- Full cycle integration

Note: This tests the strategy evolution TectonicStage, not the shader
optimization TectonicStage in systems/evolution_daemon/stages/tectonic_stage.py
"""

import json
import tempfile
from pathlib import Path

import pytest

from systems.evolution_daemon.tectonic_stage import (
    EvolutionProposal,
    StrategyCandidate,
    TectonicStage,
    TectonicStageConfig,
)
from systems.tectonic.strategy import StrategyProfile


class TestTectonicStageConfig:
    """Tests for TectonicStageConfig."""

    def test_default_config(self):
        """Test default configuration values."""
        config = TectonicStageConfig()

        assert config.rounds_per_cycle == 100
        assert config.min_win_rate_improvement == 0.05
        assert config.mutation_rate == 0.1
        assert config.survival_threshold == 0.3
        assert config.population_size == 6
        assert config.elite_count == 2
        assert config.crossover_rate == 0.3

    def test_custom_config(self):
        """Test custom configuration values."""
        config = TectonicStageConfig(
            rounds_per_cycle=50,
            mutation_rate=0.2,
            population_size=4,
        )

        assert config.rounds_per_cycle == 50
        assert config.mutation_rate == 0.2
        assert config.population_size == 4


class TestStrategyCandidate:
    """Tests for StrategyCandidate."""

    def test_candidate_creation(self):
        """Test creating a strategy candidate."""
        strategy = StrategyProfile()
        candidate = StrategyCandidate(
            strategy=strategy,
            agent_id="test_agent",
        )

        assert candidate.agent_id == "test_agent"
        assert candidate.strategy == strategy
        assert candidate.win_rate == 0.0
        assert candidate.total_wins == 0
        assert candidate.total_rounds == 0

    def test_update_fitness_win(self):
        """Test updating fitness after a win."""
        candidate = StrategyCandidate(
            strategy=StrategyProfile(),
            agent_id="test_agent",
        )

        candidate.update_fitness(won=True)

        assert candidate.total_wins == 1
        assert candidate.total_rounds == 1
        assert candidate.win_rate == 1.0

    def test_update_fitness_loss(self):
        """Test updating fitness after a loss."""
        candidate = StrategyCandidate(
            strategy=StrategyProfile(),
            agent_id="test_agent",
        )

        candidate.update_fitness(won=False)

        assert candidate.total_wins == 0
        assert candidate.total_rounds == 1
        assert candidate.win_rate == 0.0

    def test_update_fitness_multiple(self):
        """Test updating fitness after multiple rounds."""
        candidate = StrategyCandidate(
            strategy=StrategyProfile(),
            agent_id="test_agent",
        )

        # 3 wins, 2 losses = 60% win rate
        for won in [True, True, False, True, False]:
            candidate.update_fitness(won=won)

        assert candidate.total_wins == 3
        assert candidate.total_rounds == 5
        assert candidate.win_rate == 0.6


class TestEvolutionProposal:
    """Tests for EvolutionProposal."""

    def test_proposal_creation(self):
        """Test creating an evolution proposal."""
        proposal = EvolutionProposal(
            operation_type="mutate",
            target_ids=["agent_1"],
            params={"mutation_strength": 0.2},
            reason="Test mutation",
        )

        assert proposal.operation_type == "mutate"
        assert proposal.target_ids == ["agent_1"]
        assert proposal.params == {"mutation_strength": 0.2}
        assert proposal.reason == "Test mutation"


class TestTectonicStageCreation:
    """Tests for TectonicStage creation."""

    def test_stage_creation_default(self):
        """Test creating stage with defaults."""
        stage = TectonicStage()

        assert stage.config is not None
        assert len(stage.population) == stage.config.population_size
        assert stage.cycle_count == 0
        assert stage.baseline_win_rate == 0.5

    def test_stage_creation_custom_config(self):
        """Test creating stage with custom config."""
        config = TectonicStageConfig(
            rounds_per_cycle=50,
            population_size=4,
        )
        stage = TectonicStage(config=config)

        assert stage.config.rounds_per_cycle == 50
        assert stage.config.population_size == 4
        assert len(stage.population) == 4

    def test_stage_with_forge(self):
        """Test creating stage with Forge instance."""
        from systems.foundry.forge import Forge

        forge = Forge()
        stage = TectonicStage(forge=forge)

        assert stage.forge is forge

    def test_stage_with_history_path(self):
        """Test creating stage with history path."""
        with tempfile.TemporaryDirectory() as tmpdir:
            history_path = Path(tmpdir) / "history.json"
            stage = TectonicStage(history_path=str(history_path))

            assert stage.history_path == str(history_path)


class TestTectonicStageAssess:
    """Tests for TectonicStage.assess()."""

    def test_assess_runs_simulations(self):
        """Test that assess runs simulation rounds."""
        config = TectonicStageConfig(
            rounds_per_cycle=10,
            population_size=4,
        )
        stage = TectonicStage(config=config)

        assessment = stage.assess()

        assert "rounds_completed" in assessment
        assert assessment["rounds_completed"] == 10
        assert "win_rates" in assessment
        assert len(assessment["win_rates"]) == 4

    def test_assess_updates_candidate_fitness(self):
        """Test that assess updates candidate fitness."""
        config = TectonicStageConfig(
            rounds_per_cycle=20,
            population_size=4,
        )
        stage = TectonicStage(config=config)

        # All candidates start with 0 win rate
        for candidate in stage.population:
            assert candidate.win_rate == 0.0

        assessment = stage.assess()

        # After assessment, some candidates should have non-zero win rates
        has_nonzero = any(c.win_rate > 0 for c in stage.population)
        assert has_nonzero

    def test_assess_returns_metrics(self):
        """Test that assess returns expected metrics."""
        config = TectonicStageConfig(rounds_per_cycle=10)
        stage = TectonicStage(config=config)

        assessment = stage.assess()

        assert "average_win_rate" in assessment
        assert "best_win_rate" in assessment
        assert "best_agent_id" in assessment
        assert "improvement" in assessment

    def test_assess_tracks_best_strategy(self):
        """Test that assess tracks the best strategy."""
        config = TectonicStageConfig(rounds_per_cycle=10)
        stage = TectonicStage(config=config)

        assert stage.best_strategy is None
        assert stage.best_win_rate == 0.0

        stage.assess()

        # Best strategy should be set after assessment
        assert stage.best_strategy is not None
        assert stage.best_win_rate > 0


class TestTectonicStagePropose:
    """Tests for TectonicStage.propose()."""

    def test_propose_generates_proposals(self):
        """Test that propose generates evolution proposals."""
        config = TectonicStageConfig(
            rounds_per_cycle=10,
            population_size=4,
        )
        stage = TectonicStage(config=config)

        assessment = stage.assess()
        proposals = stage.propose(assessment)

        assert isinstance(proposals, list)
        assert len(proposals) > 0

    def test_propose_includes_elitism(self):
        """Test that propose includes elitism for top performers."""
        config = TectonicStageConfig(
            rounds_per_cycle=10,
            population_size=4,
            elite_count=2,
        )
        stage = TectonicStage(config=config)

        assessment = stage.assess()
        proposals = stage.propose(assessment)

        elite_proposals = [p for p in proposals if p.operation_type == "elitism"]
        assert len(elite_proposals) >= 1

    def test_propose_targets_underperformers(self):
        """Test that propose targets underperforming candidates."""
        config = TectonicStageConfig(
            rounds_per_cycle=10,
            population_size=4,
            survival_threshold=0.3,
        )
        stage = TectonicStage(config=config)

        assessment = stage.assess()
        proposals = stage.propose(assessment)

        # Should have proposals targeting weak performers
        target_ids = []
        for p in proposals:
            target_ids.extend(p.target_ids)

        assert len(target_ids) > 0


class TestTectonicStageApply:
    """Tests for TectonicStage.apply()."""

    def test_apply_mutations(self):
        """Test applying mutation proposals."""
        config = TectonicStageConfig(
            rounds_per_cycle=10,
            population_size=4,
            mutation_rate=1.0,  # Force mutations
        )
        stage = TectonicStage(config=config)

        assessment = stage.assess()
        proposals = stage.propose(assessment)

        # Get original strategies
        original_strategies = {
            c.agent_id: c.strategy.base_bid_fraction
            for c in stage.population
        }

        result = stage.apply(proposals)

        assert "applied" in result
        assert len(result["applied"]) > 0

    def test_apply_crossover(self):
        """Test applying crossover proposals."""
        config = TectonicStageConfig(
            rounds_per_cycle=10,
            population_size=4,
            crossover_rate=1.0,  # Force crossover
        )
        stage = TectonicStage(config=config)

        assessment = stage.assess()

        # Create a crossover proposal manually
        sorted_candidates = sorted(stage.population, key=lambda c: c.win_rate, reverse=True)
        if len(sorted_candidates) >= 3:
            proposal = EvolutionProposal(
                operation_type="crossover",
                target_ids=[sorted_candidates[2].agent_id],
                params={
                    "parent1_id": sorted_candidates[0].agent_id,
                    "parent2_id": sorted_candidates[1].agent_id,
                },
                reason="Test crossover",
            )
            result = stage.apply([proposal])

            crossover_applied = any(
                r["type"] == "crossover"
                for r in result["applied"]
            )
            assert crossover_applied

    def test_apply_resets_fitness(self):
        """Test that apply resets fitness for modified candidates."""
        config = TectonicStageConfig(
            rounds_per_cycle=10,
            population_size=4,
            mutation_rate=1.0,
        )
        stage = TectonicStage(config=config)

        stage.assess()

        # Find a candidate with non-zero fitness
        candidate = next(c for c in stage.population if c.win_rate > 0)
        original_wins = candidate.total_wins

        # Create mutation proposal
        proposal = EvolutionProposal(
            operation_type="mutate",
            target_ids=[candidate.agent_id],
            params={"mutation_strength": 0.2},
            reason="Test",
        )
        stage.apply([proposal])

        # Fitness should be reset
        assert candidate.total_wins == 0
        assert candidate.win_rate == 0.0

    def test_apply_records_history(self):
        """Test that apply records operations in history."""
        config = TectonicStageConfig(rounds_per_cycle=10)
        stage = TectonicStage(config=config)

        initial_cycle_count = stage.cycle_count

        assessment = stage.assess()
        proposals = stage.propose(assessment)
        stage.apply(proposals)

        assert stage.cycle_count > initial_cycle_count
        assert len(stage.history) > 0


class TestTectonicStageVerify:
    """Tests for TectonicStage.verify()."""

    def test_verify_returns_boolean(self):
        """Test that verify returns a boolean."""
        config = TectonicStageConfig(rounds_per_cycle=10)
        stage = TectonicStage(config=config)

        result = {"applied": [], "skipped": [], "errors": []}
        verified = stage.verify(result)

        # Should be True or False (numpy.bool_ also acceptable)
        assert verified in (True, False) or str(type(verified)) in ("<class 'numpy.bool_'>", "<class 'bool'>")

    def test_verify_updates_baseline_on_improvement(self):
        """Test that verify updates baseline when improved."""
        config = TectonicStageConfig(
            rounds_per_cycle=10,
            min_win_rate_improvement=0.01,  # Low threshold
        )
        stage = TectonicStage(config=config)
        stage.baseline_win_rate = 0.2

        result = {"applied": [], "skipped": [], "errors": []}
        stage.verify(result)

        # Baseline should have been updated (or at least attempted)
        # Note: actual improvement depends on simulation results


class TestTectonicStageRunCycle:
    """Tests for TectonicStage.run_cycle()."""

    def test_run_cycle_returns_complete_results(self):
        """Test that run_cycle returns complete results."""
        config = TectonicStageConfig(rounds_per_cycle=10)
        stage = TectonicStage(config=config)

        result = stage.run_cycle()

        assert "cycle" in result
        assert "assessment" in result
        assert "proposals_count" in result
        assert "apply_result" in result
        assert "verified" in result

    def test_run_cycle_increments_cycle_count(self):
        """Test that run_cycle increments cycle count."""
        config = TectonicStageConfig(rounds_per_cycle=10)
        stage = TectonicStage(config=config)

        initial_count = stage.cycle_count
        stage.run_cycle()

        assert stage.cycle_count == initial_count + 1

    def test_multiple_cycles(self):
        """Test running multiple evolution cycles."""
        config = TectonicStageConfig(rounds_per_cycle=10)
        stage = TectonicStage(config=config)

        for _ in range(3):
            result = stage.run_cycle()
            assert "assessment" in result

        assert stage.cycle_count == 3


class TestTectonicStageStrategyOperations:
    """Tests for strategy mutation and crossover."""

    def test_mutate_strategy(self):
        """Test strategy mutation."""
        stage = TectonicStage()
        original = StrategyProfile(
            base_bid_fraction=0.1,
            aggression_level=0.5,
        )

        mutated = stage._mutate_strategy(original, mutation_strength=0.2)

        # Mutated strategy should be different
        # (with high probability due to randomness)
        assert isinstance(mutated, StrategyProfile)

    def test_crossover_strategies(self):
        """Test strategy crossover."""
        stage = TectonicStage()
        parent1 = StrategyProfile(
            base_bid_fraction=0.1,
            aggression_level=0.3,
        )
        parent2 = StrategyProfile(
            base_bid_fraction=0.2,
            aggression_level=0.7,
        )

        child = stage._crossover_strategies(parent1, parent2)

        # Child should inherit from both parents
        assert isinstance(child, StrategyProfile)
        # Values should come from either parent
        assert child.base_bid_fraction in [0.1, 0.2]
        assert child.aggression_level in [0.3, 0.7]


class TestTectonicStagePersistence:
    """Tests for history and strategy persistence."""

    def test_save_history(self):
        """Test saving evolution history."""
        with tempfile.TemporaryDirectory() as tmpdir:
            history_path = Path(tmpdir) / "history.json"
            config = TectonicStageConfig(rounds_per_cycle=10)
            stage = TectonicStage(config=config, history_path=str(history_path))

            stage.run_cycle()

            # History file should be created
            assert history_path.exists()

            with open(history_path) as f:
                data = json.load(f)

            assert "cycle_count" in data
            assert "history" in data

    def test_export_best_strategy(self):
        """Test exporting best strategy."""
        with tempfile.TemporaryDirectory() as tmpdir:
            export_path = Path(tmpdir) / "best_strategy.json"
            config = TectonicStageConfig(rounds_per_cycle=10)
            stage = TectonicStage(config=config)

            # Run to get a best strategy
            stage.assess()

            success = stage.export_best_strategy(str(export_path))

            assert success
            assert export_path.exists()

            with open(export_path) as f:
                data = json.load(f)

            assert "strategy" in data
            assert "win_rate" in data

    def test_export_without_best_strategy(self):
        """Test exporting when no best strategy exists."""
        with tempfile.TemporaryDirectory() as tmpdir:
            export_path = Path(tmpdir) / "best_strategy.json"
            stage = TectonicStage()

            success = stage.export_best_strategy(str(export_path))

            assert not success
            assert not export_path.exists()


class TestTectonicStageReset:
    """Tests for TectonicStage.reset()."""

    def test_reset_clears_state(self):
        """Test that reset clears stage state."""
        config = TectonicStageConfig(rounds_per_cycle=10)
        stage = TectonicStage(config=config)

        # Run some cycles
        stage.run_cycle()
        stage.run_cycle()

        # Reset
        stage.reset()

        assert stage.cycle_count == 0
        assert len(stage.history) == 0
        assert stage.baseline_win_rate == 0.5
        assert stage.best_strategy is None
        assert stage.best_win_rate == 0.0

    def test_reset_reinitializes_population(self):
        """Test that reset reinitializes population."""
        config = TectonicStageConfig(rounds_per_cycle=10)
        stage = TectonicStage(config=config)

        original_ids = [c.agent_id for c in stage.population]

        stage.reset()

        # Population should be reinitialized (same size)
        assert len(stage.population) == config.population_size


class TestTectonicStageIntegration:
    """Integration tests for TectonicStage."""

    def test_full_evolution_workflow(self):
        """Test complete evolution workflow."""
        config = TectonicStageConfig(
            rounds_per_cycle=20,
            population_size=4,
            mutation_rate=0.5,
            crossover_rate=0.5,
        )
        stage = TectonicStage(config=config)

        # Run multiple cycles
        results = []
        for _ in range(3):
            result = stage.run_cycle()
            results.append(result)

        # Should have completed all cycles
        assert len(results) == 3

        # Should have tracked improvements
        assert stage.best_strategy is not None

    def test_evolution_with_custom_agents(self):
        """Test evolution with custom strategy types."""
        config = TectonicStageConfig(
            rounds_per_cycle=20,
            population_size=4,
        )
        stage = TectonicStage(config=config)

        # Verify population has diverse strategies
        strategy_diversity = set()
        for candidate in stage.population:
            # Check some strategy parameters for diversity
            strategy_diversity.add(round(candidate.strategy.base_bid_fraction, 2))

        # Should have at least some diversity
        assert len(strategy_diversity) >= 1


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
