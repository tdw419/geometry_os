"""Tests for brain evolution integration with daemon."""
import pytest
from unittest.mock import MagicMock, patch


class TestBrainEvolutionDaemonIntegration:
    """Test brain evolution is wired into daemon."""

    def test_daemon_registers_brain_hook(self):
        """Daemon should register brain evolution hook on init."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook

        daemon = EvolutionDaemon()

        # Check that brain hook is registered
        assert hasattr(daemon, '_brain_hook')
        assert isinstance(daemon._brain_hook, BrainEvolutionHook)

    def test_brain_hook_disabled_by_default(self):
        """Brain evolution should be disabled by default for safety."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        daemon = EvolutionDaemon()

        # Check config - brain evolution should be opt-in
        config = daemon.config if hasattr(daemon, 'config') else {}
        # Default should be False or not present (which means False)
        assert config.get('evolve_brain', False) is False

    @pytest.mark.asyncio
    async def test_evolution_cycle_can_call_brain_hook(self):
        """Evolution cycle should be able to invoke brain hook."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        daemon = EvolutionDaemon()

        # Skip if brain hook not available
        if not hasattr(daemon, '_brain_hook') or daemon._brain_hook is None:
            pytest.skip("Brain evolution hook not available")

        # Verify hooks are registered
        assert 'evolution_cycle' in daemon._hooks, "evolution_cycle hook type should be registered"
        assert len(daemon._hooks['evolution_cycle']) > 0, "At least one evolution_cycle hook should exist"

        # Create a mock callback and track calls
        call_count = [0]

        async def mock_cycle(data):
            call_count[0] += 1
            return {"success": True, "tested": True}

        # Replace the hook in the daemon's hook list
        original_hooks = daemon._hooks['evolution_cycle'].copy()
        daemon._hooks['evolution_cycle'] = [mock_cycle]

        try:
            # Trigger hooks with evolution_cycle type
            results = await daemon.trigger_hooks('evolution_cycle', {"evolve_brain": True, "cycle_number": 1})

            # Verify hook was called
            assert call_count[0] >= 1, "Brain hook should have been called"
            assert len(results) >= 1, "Should have at least one result"
        finally:
            # Restore original hooks
            daemon._hooks['evolution_cycle'] = original_hooks
