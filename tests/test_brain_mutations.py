"""Tests for brain evolution mutations."""
import pytest
import numpy as np


class TestBrainMutations:
    """Test evolution daemon can mutate the brain."""

    def test_mutate_weight_sector_exists(self):
        """mutate_weight_sector should exist."""
        from systems.evolution_daemon.brain_mutations import mutate_weight_sector
        assert callable(mutate_weight_sector)

    def test_weight_mutation_applies(self):
        """Weight mutation should modify atlas."""
        from systems.evolution_daemon.brain_mutations import mutate_weight_sector
        atlas = np.zeros((1024, 1024, 4), dtype=np.float16)
        result = mutate_weight_sector(atlas, sector="attention_layer_0", rate=0.01)
        assert result is not None
        # Some values should have changed
        assert not np.allclose(result, np.zeros_like(result))

    def test_mutate_shader_exists(self):
        """mutate_shader should exist."""
        from systems.evolution_daemon.brain_mutations import mutate_shader
        assert callable(mutate_shader)

    def test_shader_mutation_generates_code(self):
        """Shader mutation should generate WGSL variant."""
        from systems.evolution_daemon.brain_mutations import mutate_shader
        original = "fn silu(x: f32) -> f32 { return x / (1.0 + exp(-x)); }"
        result = mutate_shader(original, mutation_type="activation")
        assert isinstance(result, str)
        assert "fn " in result  # Still a function

    def test_evaluate_brain_fitness_exists(self):
        """evaluate_brain_fitness should exist."""
        from systems.evolution_daemon.brain_mutations import evaluate_brain_fitness
        assert callable(evaluate_brain_fitness)

    def test_brain_fitness_returns_float(self):
        """Fitness evaluation should return 0-1 float."""
        from systems.evolution_daemon.brain_mutations import evaluate_brain_fitness
        fitness = evaluate_brain_fitness("nonexistent.rts.png", ["test"])
        assert isinstance(fitness, float)
        assert 0 <= fitness <= 1
