"""
Tests for SwarmAgent + NEB integration.
"""

import time
import pytest
from systems.swarm.task_board import TaskBoard
from systems.swarm.task import Task, TaskType
from systems.swarm.swarm_agent import SwarmAgent
from systems.swarm.neb_bus import NEBBus


class TestSwarmAgentNEBIntegration:
    """Test SwarmAgent reactive behavior."""

    def test_agent_reacts_to_task_available(self, tmp_path):
        """Agent can subscribe to TASK_AVAILABLE and react."""
        bus = NEBBus(node_id="test-node")
        board = TaskBoard(storage_path=str(tmp_path / "test-agent-neb"), event_bus=bus)

        agent = SwarmAgent(agent_id="reactive-agent", task_board=board)

        # Subscribe agent to task events
        agent.subscribe_to_events(bus)

        # Post a task - should trigger agent callback
        board.post(Task(
            task_id="react-001",
            task_type=TaskType.CODE_ANALYSIS,
            description="Test task"
        ))

        # Agent should have been notified
        assert len(agent.recent_notifications) >= 1

    def test_agent_auto_claims_on_notification(self, tmp_path):
        """Agent can auto-claim tasks when notified."""
        bus = NEBBus(node_id="test-node")
        board = TaskBoard(storage_path=str(tmp_path / "test-agent-neb-2"), event_bus=bus)

        agent = SwarmAgent(
            agent_id="auto-claimer",
            task_board=board,
            auto_claim=True
        )
        agent.subscribe_to_events(bus)

        # Post a task
        board.post(Task(
            task_id="auto-001",
            task_type=TaskType.CODE_ANALYSIS,
            description="Auto-claim test"
        ))

        # Wait for deferred claim to complete (avoids lock contention)
        time.sleep(0.1)

        # Task should be claimed by agent
        task = board.get("auto-001")
        assert task.claimed_by == "auto-claimer"
