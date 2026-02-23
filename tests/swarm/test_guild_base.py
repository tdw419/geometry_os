"""
Unit tests for GuildAgent base class.
"""

import pytest
import tempfile
import uuid
from typing import Dict, Any

from systems.swarm.guilds.base import GuildAgent
from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.neb_bus import NEBBus


class ConcreteGuildAgent(GuildAgent):
    """Concrete implementation for testing."""

    def __init__(self, agent_id, task_board, event_bus=None, auto_claim=False):
        super().__init__(
            agent_id=agent_id,
            task_board=task_board,
            role="test_role",
            event_bus=event_bus,
            auto_claim=auto_claim
        )

    def _summarize(self, result: Dict[str, Any]) -> str:
        return f"Test summary: {result.get('status', 'unknown')}"


class TestGuildAgentBase:
    """Tests for GuildAgent base class functionality."""

    @pytest.fixture
    def task_board(self):
        """Create a temporary task board."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield TaskBoard(storage_path=tmpdir)

    @pytest.fixture
    def event_bus(self):
        """Create an event bus."""
        return NEBBus(node_id="test-node")

    def test_role_attribute_set(self, task_board):
        """Test that role attribute is set correctly."""
        agent = ConcreteGuildAgent("agent-001", task_board)
        assert agent.role == "test_role"

    def test_event_bus_attribute_set(self, task_board, event_bus):
        """Test that event_bus is set when provided."""
        agent = ConcreteGuildAgent("agent-001", task_board, event_bus=event_bus)
        assert agent.event_bus is event_bus

    def test_event_bus_none_by_default(self, task_board):
        """Test that event_bus is None when not provided."""
        agent = ConcreteGuildAgent("agent-001", task_board)
        assert agent.event_bus is None

    def test_summarize_abstract_method(self, task_board):
        """Test that _summarize is implemented."""
        agent = ConcreteGuildAgent("agent-001", task_board)
        result = {"status": "success"}
        summary = agent._summarize(result)
        assert summary == "Test summary: success"

    def test_publish_result_with_event_bus(self, task_board, event_bus):
        """Test that _publish_result publishes to event bus."""
        agent = ConcreteGuildAgent("agent-001", task_board, event_bus=event_bus)

        # Publish result
        agent._publish_result("test.topic", {"key": "value"})

        # Check event was published
        signals = event_bus.get_recent_signals()
        assert len(signals) == 1
        assert signals[0].topic == "test.topic"
        assert signals[0].payload == {"key": "value"}

    def test_publish_result_without_event_bus(self, task_board):
        """Test that _publish_result is safe when no event bus."""
        agent = ConcreteGuildAgent("agent-001", task_board)

        # Should not raise
        agent._publish_result("test.topic", {"key": "value"})

    def test_guild_agent_extends_swarm_agent(self, task_board):
        """Test that GuildAgent extends SwarmAgent."""
        from systems.swarm.swarm_agent import SwarmAgent
        agent = ConcreteGuildAgent("agent-001", task_board)
        assert isinstance(agent, SwarmAgent)

    def test_guild_agent_has_work_cycle(self, task_board):
        """Test that GuildAgent inherits work_cycle from SwarmAgent."""
        agent = ConcreteGuildAgent("agent-001", task_board)
        assert hasattr(agent, 'work_cycle')
        assert callable(agent.work_cycle)

    def test_guild_agent_has_claim_next_task(self, task_board):
        """Test that GuildAgent inherits claim_next_task from SwarmAgent."""
        agent = ConcreteGuildAgent("agent-001", task_board)
        assert hasattr(agent, 'claim_next_task')
        assert callable(agent.claim_next_task)


class TestGuildAgentAbstractMethods:
    """Test that GuildAgent enforces abstract method implementation."""

    def test_cannot_instantiate_guild_agent_directly(self):
        """Test that GuildAgent cannot be instantiated without implementing _summarize."""
        with tempfile.TemporaryDirectory() as tmpdir:
            board = TaskBoard(storage_path=tmpdir)
            with pytest.raises(TypeError):
                # This should fail because _summarize is not implemented
                GuildAgent("agent-001", board, role="test")
