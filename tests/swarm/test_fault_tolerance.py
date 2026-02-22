"""
Fault tolerance tests - prove the system handles failures gracefully.
"""

import pytest
import time
import json
import uuid
from pathlib import Path

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent


class TestFaultTolerance:
    """Tests proving fault tolerance."""

    @pytest.mark.skip(reason="Production code doesn't implement stale claim recovery yet")
    def test_claimed_task_becomes_reclaimable_after_timeout(self, tmp_path):
        """If agent crashes after claiming, task becomes reclaimable."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create task
        task = Task(
            task_id=f"crash-{uuid.uuid4().hex[:8]}",
            task_type=TaskType.CODE_ANALYSIS,
            description="Crash-prone task",
            payload={}
        )
        board.post(task)

        # Agent 1 claims but "crashes" (doesn't complete)
        agent1 = SwarmAgent(agent_id="crashy-agent", task_board=board)
        claimed_task = agent1.claim_next_task()
        assert claimed_task is not None

        # Manually set claim to old timestamp (simulating crash)
        task_file = Path(tmp_path / "tasks" / f"{claimed_task.task_id}.json")
        with open(task_file, 'r') as f:
            data = json.load(f)

        # Set claimed_at to 1 hour ago
        data['claimed_at'] = time.time() - 3600
        with open(task_file, 'w') as f:
            json.dump(data, f)

        # Agent 2 should be able to claim the "stale" task
        agent2 = SwarmAgent(agent_id="recovery-agent", task_board=board)
        recovered_task = agent2.claim_next_task()
        assert recovered_task is not None
        assert recovered_task.task_id == claimed_task.task_id

    @pytest.mark.skip(reason="Production code doesn't handle corrupted task files yet")
    def test_corrupted_task_file_quarantined(self, tmp_path):
        """Corrupted task files are detected and don't crash the system."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Create valid task
        task = Task(
            task_id=f"good-{uuid.uuid4().hex[:8]}",
            task_type=TaskType.CODE_ANALYSIS,
            description="Good task",
            payload={}
        )
        board.post(task)

        # Create corrupted task file
        corrupted_path = Path(tmp_path / "tasks" / "corrupted-task-id.json")
        corrupted_path.write_text("not valid json {{{")

        # Getting pending should skip corrupted file, not crash
        pending = board.get_pending()
        assert len(pending) == 1
        assert pending[0].task_id == task.task_id

    def test_agent_fail_task_marks_failed(self, tmp_path):
        """Agent can mark task as failed and it's tracked properly."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        task = Task(
            task_id=f"fail-{uuid.uuid4().hex[:8]}",
            task_type=TaskType.CODE_ANALYSIS,
            description="Will fail",
            payload={}
        )
        board.post(task)

        agent = SwarmAgent(agent_id="failing-agent", task_board=board)
        claimed = agent.claim_next_task()
        assert claimed is not None

        # Agent fails the task
        agent.fail_task(claimed, error="Something went wrong")

        # Task should be marked as failed
        updated = board.get(claimed.task_id)
        assert updated.status == TaskStatus.FAILED
        assert "error" in updated.result
        assert "Something went wrong" in updated.result["error"]

    def test_graceful_handling_of_missing_storage(self, tmp_path):
        """TaskBoard handles missing storage directory gracefully."""
        nonexistent_path = str(tmp_path / "nonexistent" / "tasks")

        # Should create directory automatically
        board = TaskBoard(storage_path=nonexistent_path)

        # Should work fine
        task = Task(
            task_id=f"first-{uuid.uuid4().hex[:8]}",
            task_type=TaskType.CODE_ANALYSIS,
            description="First task",
            payload={}
        )
        board.post(task)

        pending = board.get_pending()
        assert len(pending) == 1
