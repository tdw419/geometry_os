"""
Unit tests for CoordinatorAgent relocate_agent functionality.

Tests cover:
- Agent relocation between districts
- Telemetry emission to Visual Bridge
- Validation of districts
- Nonexistent agent handling
- District load tracking

Part of Agent Relocation Task 1
"""

import pytest
import asyncio
from dataclasses import dataclass, field
from typing import Dict, List, Any, Optional
from unittest.mock import Mock, MagicMock, call, AsyncMock
import time

from systems.visual_shell.swarm.coordinator_agent import (
    CoordinatorAgent,
    District,
    RelocationResult,
)


class TestRelocateAgent:
    """Tests for relocate_agent method."""

    @pytest.fixture
    def coordinator(self):
        """Create a fresh coordinator for each test."""
        return CoordinatorAgent()

    @pytest.mark.asyncio
    async def test_relocate_agent_changes_district(self, coordinator):
        """Test that relocate_agent changes an agent's district."""
        # Register an agent in cognitive district
        agent_id = "test-agent-001"
        await coordinator.register_agent(
            agent_id=agent_id,
            metadata={
                "agent_type": "cognitive_worker",
                "district": District.COGNITIVE.name,
                "capabilities": ["reasoning", "planning"]
            }
        )

        # Verify initial district
        agent = coordinator.get_agent(agent_id)
        assert agent is not None
        assert agent.get("district") == District.COGNITIVE.name

        # Relocate to metabolic district
        result = coordinator.relocate_agent(agent_id, District.METABOLIC)

        assert result.success is True
        assert result.agent_id == agent_id
        assert result.from_district == District.COGNITIVE
        assert result.to_district == District.METABOLIC

        # Verify the change persisted
        agent = coordinator.get_agent(agent_id)
        assert agent.get("district") == District.METABOLIC.name

    @pytest.mark.asyncio
    async def test_relocate_agent_emits_telemetry(self, coordinator):
        """Test that relocate_agent emits telemetry to Visual Bridge."""
        # Mock the visual bridge
        mock_bridge = Mock()
        coordinator.set_visual_bridge(mock_bridge)

        # Register and relocate an agent
        agent_id = "test-agent-002"
        await coordinator.register_agent(
            agent_id=agent_id,
            metadata={
                "agent_type": "substrate_worker",
                "district": District.SUBSTRATE.name,
                "capabilities": ["gpu_compute"]
            }
        )

        coordinator.relocate_agent(agent_id, District.COGNITIVE)

        # Verify telemetry was emitted
        assert mock_bridge.emit.called
        call_args = mock_bridge.emit.call_args

        # Check the telemetry payload
        telemetry = call_args[0][0] if call_args[0] else call_args[1].get('event')
        assert telemetry is not None
        assert telemetry.get('type') == 'agent_relocation'
        assert telemetry.get('agent_id') == agent_id

    def test_relocate_nonexistent_agent_returns_false(self, coordinator):
        """Test that relocating a nonexistent agent returns failure."""
        result = coordinator.relocate_agent("nonexistent_agent_id", District.COGNITIVE)

        assert result.success is False
        assert "not found" in result.error.lower() or "does not exist" in result.error.lower()

    @pytest.mark.asyncio
    async def test_relocate_agent_validates_district(self, coordinator):
        """Test that relocate_agent validates the target district."""
        agent_id = "test-agent-003"
        await coordinator.register_agent(
            agent_id=agent_id,
            metadata={
                "agent_type": "cognitive_worker",
                "district": District.COGNITIVE.name,
                "capabilities": ["reasoning"]
            }
        )

        # Try to relocate to an invalid district (string instead of enum)
        with pytest.raises((ValueError, TypeError)):
            coordinator.relocate_agent(agent_id, "invalid_district")

    @pytest.mark.asyncio
    async def test_relocate_agent_same_district_returns_success(self, coordinator):
        """Test that relocating to the same district succeeds but is a no-op."""
        agent_id = "test-agent-004"
        await coordinator.register_agent(
            agent_id=agent_id,
            metadata={
                "agent_type": "cognitive_worker",
                "district": District.COGNITIVE.name,
                "capabilities": ["reasoning"]
            }
        )

        result = coordinator.relocate_agent(agent_id, District.COGNITIVE)

        # Should succeed but indicate no actual move
        assert result.success is True
        assert result.from_district == result.to_district


class TestGetDistrictLoad:
    """Tests for get_district_load method."""

    @pytest.fixture
    def coordinator(self):
        """Create a fresh coordinator for each test."""
        return CoordinatorAgent()

    @pytest.mark.asyncio
    async def test_get_district_load_returns_counts(self, coordinator):
        """Test that get_district_load returns agent counts per district."""
        # Register agents in different districts
        await coordinator.register_agent("agent-1", {"district": District.COGNITIVE.name})
        await coordinator.register_agent("agent-2", {"district": District.COGNITIVE.name})
        await coordinator.register_agent("agent-3", {"district": District.METABOLIC.name})
        await coordinator.register_agent("agent-4", {"district": District.SUBSTRATE.name})
        await coordinator.register_agent("agent-5", {"district": District.SUBSTRATE.name})
        await coordinator.register_agent("agent-6", {"district": District.SUBSTRATE.name})

        load = coordinator.get_district_load()

        assert load[District.COGNITIVE] == 2
        assert load[District.METABOLIC] == 1
        assert load[District.SUBSTRATE] == 3

    def test_get_district_load_empty_coordinator(self, coordinator):
        """Test that get_district_load returns zeros when no agents."""
        load = coordinator.get_district_load()

        assert load[District.COGNITIVE] == 0
        assert load[District.METABOLIC] == 0
        assert load[District.SUBSTRATE] == 0

    @pytest.mark.asyncio
    async def test_get_district_load_updates_after_relocation(self, coordinator):
        """Test that district load updates after agent relocation."""
        agent_id = "test-agent-relocate"
        await coordinator.register_agent(
            agent_id,
            {"district": District.COGNITIVE.name}
        )

        # Check initial load
        load = coordinator.get_district_load()
        assert load[District.COGNITIVE] == 1
        assert load[District.METABOLIC] == 0

        # Relocate
        coordinator.relocate_agent(agent_id, District.METABOLIC)

        # Check updated load
        load = coordinator.get_district_load()
        assert load[District.COGNITIVE] == 0
        assert load[District.METABOLIC] == 1


class TestCoordinatorAgentBasics:
    """Tests for basic CoordinatorAgent functionality."""

    @pytest.fixture
    def coordinator(self):
        """Create a fresh coordinator for each test."""
        return CoordinatorAgent()

    def test_coordinator_initialization(self, coordinator):
        """Test that CoordinatorAgent initializes correctly."""
        assert coordinator.get_all_agents() == {}
        assert coordinator.get_visual_bridge() is None

    @pytest.mark.asyncio
    async def test_register_agent(self, coordinator):
        """Test agent registration."""
        agent_id = "test-register-agent"
        await coordinator.register_agent(
            agent_id=agent_id,
            metadata={
                "agent_type": "test_agent",
                "district": District.COGNITIVE.name,
                "capabilities": ["test"]
            }
        )

        assert len(coordinator.get_all_agents()) == 1

        agent = coordinator.get_agent(agent_id)
        assert agent is not None
        assert agent.get("agent_type") == "test_agent"
        assert agent.get("district") == District.COGNITIVE.name

    def test_get_agent_nonexistent(self, coordinator):
        """Test getting a nonexistent agent returns None."""
        agent = coordinator.get_agent("nonexistent_id")
        assert agent is None

    def test_set_visual_bridge(self, coordinator):
        """Test setting the visual bridge."""
        mock_bridge = Mock()

        coordinator.set_visual_bridge(mock_bridge)

        assert coordinator.get_visual_bridge() == mock_bridge
