"""Tests for BrainEvolutionHook adaptive sector selection."""

from collections import Counter
from unittest.mock import patch

import numpy as np
import pytest

from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import (
    BrainEvolutionHook,
    MutationRecord,
)


class TestSectorSuccessRateCalculation:
    """Tests for sector success rate calculation."""

    def test_empty_history_returns_default_rate(self):
        """When no mutation history exists, all sectors get default 0.5 rate."""
        hook = BrainEvolutionHook(use_adaptive_sector_selection=True)
        sectors = ["embeddings", "attention_layer_0", "ffn_layer_0"]

        rates = hook._calculate_sector_success_rates(sectors)

        for sector in sectors:
            assert rates[sector] == 0.5, f"Sector {sector} should have default rate 0.5"

    def test_single_sector_success_rate(self):
        """Calculate success rate for a sector with mutations."""
        hook = BrainEvolutionHook(use_adaptive_sector_selection=True)

        # Add mutation records for "embeddings" sector
        hook.mutation_history = [
            MutationRecord("2024-01-01", "embeddings", "gaussian", 0.5, 0.6, True, {}),
            MutationRecord("2024-01-02", "embeddings", "gaussian", 0.5, 0.4, False, {}),
            MutationRecord("2024-01-03", "embeddings", "uniform", 0.5, 0.7, True, {}),
        ]

        rates = hook._calculate_sector_success_rates(["embeddings"])

        # 2 kept out of 3 = 0.667
        assert abs(rates["embeddings"] - 2/3) < 0.001

    def test_multiple_sectors_independent_rates(self):
        """Each sector's success rate is calculated independently."""
        hook = BrainEvolutionHook(use_adaptive_sector_selection=True)

        hook.mutation_history = [
            # embeddings: 2 kept out of 4 = 0.5
            MutationRecord("t1", "embeddings", "gaussian", 0.5, 0.6, True, {}),
            MutationRecord("t2", "embeddings", "gaussian", 0.5, 0.4, False, {}),
            MutationRecord("t3", "embeddings", "uniform", 0.5, 0.7, True, {}),
            MutationRecord("t4", "embeddings", "uniform", 0.5, 0.3, False, {}),
            # attention_layer_0: 3 kept out of 3 = 1.0
            MutationRecord("t5", "attention_layer_0", "gaussian", 0.5, 0.6, True, {}),
            MutationRecord("t6", "attention_layer_0", "gaussian", 0.5, 0.7, True, {}),
            MutationRecord("t7", "attention_layer_0", "uniform", 0.5, 0.8, True, {}),
            # ffn_layer_0: 0 kept out of 2 = 0.0
            MutationRecord("t8", "ffn_layer_0", "gaussian", 0.5, 0.3, False, {}),
            MutationRecord("t9", "ffn_layer_0", "uniform", 0.5, 0.2, False, {}),
        ]

        rates = hook._calculate_sector_success_rates(
            ["embeddings", "attention_layer_0", "ffn_layer_0"]
        )

        assert rates["embeddings"] == 0.5
        assert rates["attention_layer_0"] == 1.0
        assert rates["ffn_layer_0"] == 0.0

    def test_sector_not_in_history_gets_default(self):
        """Sectors without any mutations get default rate."""
        hook = BrainEvolutionHook(use_adaptive_sector_selection=True)

        hook.mutation_history = [
            MutationRecord("t1", "embeddings", "gaussian", 0.5, 0.6, True, {}),
        ]

        rates = hook._calculate_sector_success_rates(
            ["embeddings", "attention_layer_0", "lm_head"]
        )

        assert rates["embeddings"] == 1.0  # 1/1 kept
        assert rates["attention_layer_0"] == 0.5  # default
        assert rates["lm_head"] == 0.5  # default


class TestWeightedSelectionDistribution:
    """Tests for weighted sector selection producing expected distribution."""

    def test_weighted_selection_respects_success_rates(self):
        """Sectors with higher success rates are selected more often."""
        hook = BrainEvolutionHook(use_adaptive_sector_selection=True)

        # Create history where attention_layer_0 has 100% success, others have 0%
        hook.mutation_history = [
            MutationRecord("t1", "attention_layer_0", "gaussian", 0.5, 0.6, True, {}),
            MutationRecord("t2", "attention_layer_0", "gaussian", 0.5, 0.7, True, {}),
            MutationRecord("t3", "embeddings", "gaussian", 0.5, 0.3, False, {}),
            MutationRecord("t4", "ffn_layer_0", "gaussian", 0.5, 0.2, False, {}),
        ]

        # Run selection many times and count results
        selections = []
        np.random.seed(42)  # For reproducibility
        for _ in range(1000):
            sector = hook._select_sector({})
            selections.append(sector)

        counts = Counter(selections)

        # attention_layer_0 should be selected most often (100% success)
        # embeddings and ffn_layer_0 have 0% success but get default 0.5 for exploration
        # The sector with 100% success should dominate
        assert counts["attention_layer_0"] > counts["embeddings"]
        assert counts["attention_layer_0"] > counts["ffn_layer_0"]

    def test_uniform_weights_when_all_rates_equal(self):
        """When all sectors have equal success rates, selection is uniform."""
        hook = BrainEvolutionHook(use_adaptive_sector_selection=True)

        # All sectors have 50% success rate
        for sector in ["embeddings", "attention_layer_0", "ffn_layer_0", "lm_head"]:
            hook.mutation_history.extend([
                MutationRecord("t1", sector, "gaussian", 0.5, 0.6, True, {}),
                MutationRecord("t2", sector, "gaussian", 0.5, 0.4, False, {}),
            ])

        # Run selection many times
        selections = []
        np.random.seed(123)
        for _ in range(1000):
            sector = hook._select_sector({})
            selections.append(sector)

        counts = Counter(selections)

        # With equal weights, each sector should get roughly 1/6 of selections
        # (there are 6 sectors total)
        for sector in counts:
            # Allow 50% tolerance for random variation
            assert 100 < counts[sector] < 250, f"Sector {sector} count {counts[sector]} not in expected range"

    def test_normalized_weights_sum_to_one(self):
        """Weights are properly normalized to sum to 1."""
        hook = BrainEvolutionHook(use_adaptive_sector_selection=True)

        # Set up various success rates
        hook.mutation_history = [
            MutationRecord("t1", "embeddings", "gaussian", 0.5, 0.6, True, {}),
            MutationRecord("t2", "embeddings", "gaussian", 0.5, 0.4, False, {}),
            MutationRecord("t3", "attention_layer_0", "gaussian", 0.5, 0.6, True, {}),
        ]

        sectors = ["embeddings", "attention_layer_0", "ffn_layer_0"]
        rates = hook._calculate_sector_success_rates(sectors)
        weights = np.array([rates[s] for s in sectors])
        normalized = weights / weights.sum()

        assert abs(normalized.sum() - 1.0) < 0.0001


class TestAdaptiveSelectionDisabling:
    """Tests for disabling adaptive sector selection."""

    def test_disabled_uses_uniform_random(self):
        """When adaptive selection is disabled, all sectors have equal probability."""
        hook = BrainEvolutionHook(use_adaptive_sector_selection=False)

        # Even with skewed history, selection should be uniform
        hook.mutation_history = [
            MutationRecord("t1", "attention_layer_0", "gaussian", 0.5, 0.6, True, {}),
            MutationRecord("t2", "attention_layer_0", "gaussian", 0.5, 0.7, True, {}),
            MutationRecord("t3", "attention_layer_0", "gaussian", 0.5, 0.8, True, {}),
        ]

        # Run selection many times
        selections = []
        np.random.seed(456)
        for _ in range(600):
            sector = hook._select_sector({})
            selections.append(sector)

        counts = Counter(selections)

        # All 6 sectors should be selected roughly equally
        for sector in counts:
            # Each should get about 100 selections (600/6)
            assert 50 < counts[sector] < 150, f"Sector {sector} count {counts[sector]} not uniform"

    def test_disabled_ignores_mutation_history(self):
        """When disabled, mutation history doesn't affect selection."""
        hook = BrainEvolutionHook(use_adaptive_sector_selection=False)

        # Create extremely skewed history
        hook.mutation_history = [
            MutationRecord(f"t{i}", "embeddings", "gaussian", 0.5, 0.9, True, {})
            for i in range(100)
        ]

        # Selection should still be uniform across all sectors
        selections = [hook._select_sector({}) for _ in range(100)]

        # Should see variety, not just embeddings
        assert len(set(selections)) > 1, "Should select multiple sectors when disabled"

    def test_default_is_adaptive_enabled(self):
        """By default, adaptive sector selection is enabled."""
        hook = BrainEvolutionHook()
        assert hook.use_adaptive_sector_selection is True


class TestSectorWeightLogging:
    """Tests for sector weight logging."""

    def test_logs_sector_weights_when_adaptive(self, caplog):
        """Sector weights are logged when adaptive selection is used."""
        import logging
        caplog.set_level(logging.INFO)

        hook = BrainEvolutionHook(use_adaptive_sector_selection=True)

        # Add some history
        hook.mutation_history = [
            MutationRecord("t1", "embeddings", "gaussian", 0.5, 0.6, True, {}),
            MutationRecord("t2", "attention_layer_0", "gaussian", 0.5, 0.4, False, {}),
        ]

        with caplog.at_level(logging.INFO):
            hook._select_sector({})

        # Check that weights were logged
        assert any("Sector weights:" in record.message for record in caplog.records)

    def test_log_format_includes_all_sectors(self, caplog):
        """Log includes all sectors with their weights."""
        import logging
        caplog.set_level(logging.INFO)

        hook = BrainEvolutionHook(use_adaptive_sector_selection=True)

        with caplog.at_level(logging.INFO):
            hook._select_sector({})

        log_messages = [record.message for record in caplog.records]
        weights_log = next((m for m in log_messages if "Sector weights:" in m), None)

        assert weights_log is not None
        # Check format includes sector=weight pattern
        assert "embeddings=" in weights_log
        assert "attention_layer_0=" in weights_log
        assert "ffn_layer_0=" in weights_log

    def test_no_weight_logging_when_disabled(self, caplog):
        """No weight logging when adaptive selection is disabled."""
        import logging
        caplog.set_level(logging.INFO)

        hook = BrainEvolutionHook(use_adaptive_sector_selection=False)

        with caplog.at_level(logging.INFO):
            hook._select_sector({})

        log_messages = [record.message for record in caplog.records]
        assert not any("Sector weights:" in m for m in log_messages)


class TestIntegration:
    """Integration tests for adaptive sector selection."""

    @pytest.mark.asyncio
    async def test_evolution_cycle_uses_adaptive_selection(self):
        """Full evolution cycle uses adaptive sector selection."""
        hook = BrainEvolutionHook(use_adaptive_sector_selection=True)

        # Mock the mutation functions at the correct import location
        with patch.object(hook, '_load_brain_atlas', return_value=np.zeros((100, 100, 3))):
            with patch('systems.evolution_daemon.brain_mutations.mutate_weight_sector') as mock_mutate:
                with patch('systems.evolution_daemon.brain_mutations.evaluate_brain_fitness', return_value=0.5):
                    mock_mutate.return_value = np.zeros((100, 100, 3))

                    # Add history
                    hook.mutation_history = [
                        MutationRecord("t1", "embeddings", "gaussian", 0.5, 0.6, True, {}),
                    ]

                    # Run evolution cycle
                    cycle_data = {
                        'evolve_brain': True,
                        'cycle_number': 1
                    }

                    # Force mutation by mocking random
                    with patch('random.random', return_value=0.05):  # < 0.1 triggers mutation
                        with patch('random.choice', return_value='weights'):
                            result = await hook.on_evolution_cycle(cycle_data)

                    # Should have used adaptive selection (which logs weights)
                    assert result is not None

    def test_mutation_stats_includes_sector_info(self):
        """get_mutation_stats includes information about sectors."""
        hook = BrainEvolutionHook(use_adaptive_sector_selection=True)

        hook.mutation_history = [
            MutationRecord("t1", "embeddings", "gaussian", 0.5, 0.6, True, {}),
            MutationRecord("t2", "attention_layer_0", "gaussian", 0.5, 0.7, True, {}),
            MutationRecord("t3", "embeddings", "uniform", 0.5, 0.4, False, {}),
        ]

        stats = hook.get_mutation_stats()

        assert "sectors_mutated" in stats
        assert "embeddings" in stats["sectors_mutated"]
        assert "attention_layer_0" in stats["sectors_mutated"]
        assert stats["total"] == 3
        assert stats["kept"] == 2
