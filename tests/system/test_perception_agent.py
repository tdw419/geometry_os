"""
Tests for PerceptionAgent - The 'Retina' of the Swarm.
"""

import pytest
import asyncio
from unittest.mock import Mock, patch, AsyncMock
import sys
import os

# Add project paths
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../../conductor/tracks/shotcut-on-the-map'))


class TestPerceptionAgentInit:
    """Test PerceptionAgent initialization."""

    def test_perception_agent_imports(self):
        """Test that PerceptionAgent can be imported."""
        from systems.visual_shell.swarm.perception_agent import PerceptionAgent
        assert PerceptionAgent is not None

    def test_perception_agent_initialization(self):
        """Test PerceptionAgent initializes with correct capabilities."""
        from systems.visual_shell.swarm.perception_agent import PerceptionAgent

        agent = PerceptionAgent(agent_id="perception-test-1")
        assert agent.agent_id == "perception-test-1"
        assert "perception" in agent.capabilities
        assert "visual_extraction" in agent.capabilities
        assert "ocr" in agent.capabilities

    def test_perception_agent_metadata(self):
        """Test PerceptionAgent has correct metadata for registration."""
        from systems.visual_shell.swarm.perception_agent import PerceptionAgent

        agent = PerceptionAgent(agent_id="perception-test-2")
        metadata = agent.get_registration_metadata()

        assert metadata["agent_type"] == "specialist"
        assert "visual_extraction" in metadata["capabilities"]
        assert "ocr" in metadata["capabilities"]
        assert "semantic_clustering" in metadata["capabilities"]
