"""
Tests for HealerAgent - V16 Reaction Loop Consumer.
"""

import pytest
import asyncio
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))


class TestHealerAgentInit:
    """Test HealerAgent initialization."""

    def test_healer_agent_imports(self):
        """Test that HealerAgent can be imported."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent
        assert HealerAgent is not None

    def test_healer_agent_has_ws_url(self):
        """Test that HealerAgent has WebSocket URL configured."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent

        agent = HealerAgent()
        assert hasattr(agent, 'ws_url')
        assert agent.ws_url == "ws://localhost:8768"

    def test_healer_agent_has_reaction_threshold(self):
        """Test that HealerAgent has reaction time threshold."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent

        agent = HealerAgent()
        assert hasattr(agent, 'reaction_threshold')
        assert agent.reaction_threshold <= 1.0  # Must react within 1s
