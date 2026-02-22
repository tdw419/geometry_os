"""
Tests for SwarmAgent - agent that executes tasks from the board.
"""

import pytest
import tempfile
from pathlib import Path

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent


class TestSwarmAgent:
    """Test swarm agent behavior."""

    def test_create_agent(self, tmp_path):
        """Agent can be created with ID and task board."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        agent = SwarmAgent(agent_id="test-agent", task_board=board)
        assert agent.agent_id == "test-agent"

    def test_claim_next_task(self, tmp_path):
        """Agent can claim the next pending task."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        board.post(Task(
            task_id="claim-test",
            task_type=TaskType.CODE_ANALYSIS,
            description="Test task"
        ))

        agent = SwarmAgent(agent_id="claimer", task_board=board)
        task = agent.claim_next_task()
        assert task is not None
        assert task.task_id == "claim-test"
        assert task.claimed_by == "claimer"

    def test_claim_respects_capabilities(self, tmp_path):
        """Agent only claims tasks matching its capabilities."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        board.post(Task(
            task_id="search-task",
            task_type=TaskType.PARALLEL_SEARCH,
            description="Search task"
        ))

        # Agent without search capability
        agent = SwarmAgent(
            agent_id="no-search",
            task_board=board,
            capabilities=["CODE_ANALYSIS"]
        )
        task = agent.claim_next_task()
        assert task is None  # Cannot claim

        # Agent with search capability
        agent2 = SwarmAgent(
            agent_id="has-search",
            task_board=board,
            capabilities=["PARALLEL_SEARCH"]
        )
        task = agent2.claim_next_task()
        assert task is not None

    def test_complete_claimed_task(self, tmp_path):
        """Agent can complete a claimed task."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        board.post(Task(
            task_id="complete-test",
            task_type=TaskType.CODE_ANALYSIS,
            description="Complete me"
        ))

        agent = SwarmAgent(agent_id="completer", task_board=board)
        task = agent.claim_next_task()
        agent.complete_task(task, {"lines_analyzed": 100})

        completed = board.get("complete-test")
        assert completed.status == TaskStatus.COMPLETED
        assert completed.result["lines_analyzed"] == 100

    def test_fail_task(self, tmp_path):
        """Agent can fail a task with error."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        board.post(Task(
            task_id="fail-test",
            task_type=TaskType.CODE_ANALYSIS,
            description="Will fail"
        ))

        agent = SwarmAgent(agent_id="failer", task_board=board)
        task = agent.claim_next_task()
        agent.fail_task(task, "Something went wrong")

        failed = board.get("fail-test")
        assert failed.status == TaskStatus.FAILED
        assert "Something went wrong" in failed.result["error"]

    def test_no_pending_tasks_returns_none(self, tmp_path):
        """claim_next_task returns None when no tasks available."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        agent = SwarmAgent(agent_id="idle", task_board=board)
        task = agent.claim_next_task()
        assert task is None
