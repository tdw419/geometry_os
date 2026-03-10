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

    def test_evaluate_brain_fitness_uses_benchmarks(self):
        """Fitness evaluation should use benchmark suite."""
        from systems.evolution_daemon.brain_mutations import evaluate_brain_fitness
        from unittest.mock import patch, MagicMock

        # Mock the pixel brain service and benchmark module
        with patch('systems.visual_shell.api.pixel_brain_service.get_pixel_brain_service') as mock_service:
            mock_instance = MagicMock()
            mock_service.return_value = mock_instance
            mock_instance.is_available.return_value = True
            mock_instance.generate.return_value = {'text': 'Once upon a time there was a little dog.'}

            fitness = evaluate_brain_fitness("tinystories_brain.rts.png", ["test prompt"])

            # Should have called generate for the prompt
            mock_instance.generate.assert_called()

    def test_evaluate_brain_fitness_handles_unavailable_service(self):
        """Fitness evaluation handles unavailable service gracefully."""
        from systems.evolution_daemon.brain_mutations import evaluate_brain_fitness
        from unittest.mock import patch, MagicMock

        with patch('systems.visual_shell.api.pixel_brain_service.get_pixel_brain_service') as mock_service:
            mock_instance = MagicMock()
            mock_service.return_value = mock_instance
            mock_instance.is_available.return_value = False

            fitness = evaluate_brain_fitness("tinystories_brain.rts.png", ["test"])

            # Should return 0.0 when service unavailable
            assert fitness == 0.0


class TestBrainEvolutionHook:
    """Test brain evolution hook integration."""

    def test_register_hook_exists(self):
        """register_hook should exist."""
        from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import register_hook
        assert callable(register_hook)

    def test_brain_evolution_hook_class_exists(self):
        """BrainEvolutionHook class should exist."""
        from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook
        hook = BrainEvolutionHook()
        assert hook is not None
        assert hasattr(hook, 'on_evolution_cycle')

    def test_hook_has_mutation_history(self):
        """Hook should track mutation history."""
        from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook
        hook = BrainEvolutionHook()
        assert hasattr(hook, 'mutation_history')
        assert isinstance(hook.mutation_history, list)

    def test_hook_has_test_prompts(self):
        """Hook should have default test prompts."""
        from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook
        hook = BrainEvolutionHook()
        assert hasattr(hook, 'test_prompts')
        assert len(hook.test_prompts) > 0

    def test_hook_get_mutation_stats(self):
        """Hook should provide mutation statistics."""
        from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook
        hook = BrainEvolutionHook()
        stats = hook.get_mutation_stats()
        assert isinstance(stats, dict)
        assert 'total' in stats


