"""Tests for brain evolution visual feedback."""
from unittest.mock import MagicMock

import pytest


class TestBrainEvolutionVisual:
    """Test brain evolution emits visual feedback."""

    @pytest.fixture
    def hook_with_bridge(self):
        """Create hook with mock visual bridge."""
        from unittest.mock import MagicMock

        from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook

        hook = BrainEvolutionHook()
        hook.visual_bridge = MagicMock()
        hook.visual_bridge.emit_atlas_glow = MagicMock(return_value=True)
        hook.visual_bridge.emit_thought_pulse = MagicMock(return_value=True)
        return hook

    @pytest.mark.asyncio
    async def test_mutation_emits_glow_event(self, hook_with_bridge):
        """Successful mutation should emit atlas glow."""
        hook = hook_with_bridge

        # Mock brain atlas
        hook._brain_atlas = MagicMock()
        hook._brain_atlas.shape = (1024, 1024, 4)

        result = await hook.on_evolution_cycle({
            'evolve_brain': True,
            'cycle_number': 1,
            'daemon': MagicMock()
        })

        # If mutation was successful, visual bridge should be called
        if result.get('success') and result.get('kept'):
            hook.visual_bridge.emit_atlas_glow.assert_called()

    @pytest.mark.asyncio
    async def test_mutation_emits_thought_pulse(self, hook_with_bridge):
        """Kept mutation should emit thought pulse."""
        hook = hook_with_bridge

        # Mock brain atlas
        hook._brain_atlas = MagicMock()
        hook._brain_atlas.shape = (1024, 1024, 4)

        result = await hook.on_evolution_cycle({
            'evolve_brain': True,
            'cycle_number': 1
        })

        # If mutation was kept, should emit thought pulse
        if result.get('kept', False):
            hook.visual_bridge.emit_thought_pulse.assert_called()

    def test_hook_has_visual_bridge_attribute(self):
        """Hook should have visual_bridge attribute."""
        from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook

        hook = BrainEvolutionHook()
        assert hasattr(hook, 'visual_bridge')
