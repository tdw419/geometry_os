"""
Tests for TaskBoard + NEB integration.

Tests that TaskBoard publishes events to NEB for task lifecycle operations.
"""

import pytest
from pathlib import Path

from systems.swarm.task_board import TaskBoard
from systems.swarm.task import Task, TaskType
from systems.swarm.neb_bus import NEBBus


class TestTaskBoardNEBIntegration:
    """Test TaskBoard event publishing via NEB."""

    def test_post_publishes_task_available(self, tmp_path):
        """Posting a task publishes task.available event."""
        bus = NEBBus(node_id="test-node")
        received = []

        bus.subscribe("task.available", lambda s: received.append(s))

        board = TaskBoard(storage_path=str(tmp_path / "neb-tasks"), event_bus=bus)
        board.post(Task(
            task_id="test-001",
            task_type=TaskType.CODE_ANALYSIS,
            description="Test task"
        ))

        assert len(received) == 1
        assert received[0].payload["task_id"] == "test-001"

    def test_claim_publishes_task_claimed(self, tmp_path):
        """Claiming a task publishes task.claimed event."""
        bus = NEBBus(node_id="test-node")
        received = []

        bus.subscribe("task.claimed", lambda s: received.append(s))

        board = TaskBoard(storage_path=str(tmp_path / "neb-tasks-2"), event_bus=bus)
        board.post(Task(
            task_id="test-002",
            task_type=TaskType.CODE_ANALYSIS,
            description="Test task"
        ))

        board.claim("test-002", "agent-001")

        assert len(received) == 1
        assert received[0].payload["claimed_by"] == "agent-001"

    def test_complete_publishes_task_completed(self, tmp_path):
        """Completing a task publishes task.completed event."""
        bus = NEBBus(node_id="test-node")
        received = []

        bus.subscribe("task.completed", lambda s: received.append(s))

        board = TaskBoard(storage_path=str(tmp_path / "neb-tasks-3"), event_bus=bus)
        board.post(Task(
            task_id="test-003",
            task_type=TaskType.CODE_ANALYSIS,
            description="Test task"
        ))
        board.claim("test-003", "agent-001")
        board.start("test-003")

        board.complete("test-003", {"lines": 100})

        assert len(received) == 1
        assert received[0].payload["result"]["lines"] == 100
