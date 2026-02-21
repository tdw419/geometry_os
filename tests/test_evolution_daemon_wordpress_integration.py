"""
Integration tests for Evolution Daemon WordPress integration.

Verifies that WordPress components can be imported and instantiated
from the main evolution_daemon module.
"""

import pytest


class TestWordPressEvolutionIntegration:
    """Test WordPress Evolution integration with main daemon."""

    def test_wordpress_evolution_agent_importable(self):
        """WordPressEvolutionAgent should be importable from evolution_daemon."""
        from systems.evolution_daemon.evolution_daemon import (
            HAS_WP_EVOLUTION,
            WordPressEvolutionAgent
        )

        # Check flag is set correctly
        assert HAS_WP_EVOLUTION, "HAS_WP_EVOLUTION should be True when imports succeed"

        # Check class is available
        assert WordPressEvolutionAgent is not None, "WordPressEvolutionAgent should be available"

    def test_wordpress_evolution_agent_instantiable(self):
        """WordPressEvolutionAgent should be instantiable with default config."""
        from systems.evolution_daemon.evolution_daemon import (
            HAS_WP_EVOLUTION,
            WordPressEvolutionAgent
        )

        if not HAS_WP_EVOLUTION:
            pytest.skip("WordPress Evolution not available")

        # Create agent with defaults
        agent = WordPressEvolutionAgent(wp_url="http://localhost:8080")

        assert agent is not None
        assert agent.wp_url == "http://localhost:8080"
        assert agent.analyzer is not None
        assert agent.get_cycle_count() == 0

    def test_evolution_wordpress_hook_available(self):
        """EvolutionWordPressHook should be available from evolution_daemon."""
        from systems.evolution_daemon.evolution_daemon import (
            HAS_WP_EVOLUTION,
            EvolutionWordPressHook
        )

        if not HAS_WP_EVOLUTION:
            pytest.skip("WordPress Evolution not available")

        # Check class is available
        assert EvolutionWordPressHook is not None, "EvolutionWordPressHook should be available"

        # Create hook instance
        hook = EvolutionWordPressHook(enabled=True)
        assert hook is not None

        # Verify hook stats
        stats = hook.get_stats()
        assert "enabled" in stats
        assert "published_count" in stats

    def test_bridge_service_stats_accessible(self):
        """BridgeService stats should be accessible via ServiceStats."""
        from systems.evolution_daemon.evolution_daemon import (
            HAS_WP_EVOLUTION,
            ServiceStats
        )

        if not HAS_WP_EVOLUTION:
            pytest.skip("WordPress Evolution not available")

        # Create stats object
        stats = ServiceStats(
            cycles_completed=5,
            proposals_generated=10,
            proposals_executed=3,
            errors=0,
            running=True,
            uptime_seconds=300.0,
            last_cycle_time=12345.0
        )

        assert stats.cycles_completed == 5
        assert stats.proposals_generated == 10
        assert stats.proposals_executed == 3
        assert stats.running is True

    def test_bridge_service_config_available(self):
        """BridgeServiceConfig should be available for configuration."""
        from systems.evolution_daemon.evolution_daemon import (
            HAS_WP_EVOLUTION,
            BridgeServiceConfig
        )

        if not HAS_WP_EVOLUTION:
            pytest.skip("WordPress Evolution not available")

        # Create config
        config = BridgeServiceConfig(
            wp_url="http://test.local:8080",
            ws_uri="ws://test.local:8768",
            cycle_interval=30,
            auto_execute=False,
            min_confidence=0.7
        )

        assert config.wp_url == "http://test.local:8080"
        assert config.ws_uri == "ws://test.local:8768"
        assert config.cycle_interval == 30
        assert config.auto_execute is False
        assert config.min_confidence == 0.7
