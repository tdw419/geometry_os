"""
Tests for TaskBoard - shared task storage and claiming.
"""

import pytest
import tempfile
import os
from pathlib import Path

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard


class TestTaskBoard:
    """Test task board operations."""

    def test_create_task_board(self, tmp_path):
        """TaskBoard can be created with a storage path."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        assert board.storage_path.exists()

    def test_post_task(self, tmp_path):
        """Tasks can be posted to the board."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        task = Task(
            task_id="post-001",
            task_type=TaskType.CODE_ANALYSIS,
            description="Analyze module"
        )
        board.post(task)
        assert board.get("post-001") is not None

    def test_claim_task(self, tmp_path):
        """Tasks can be claimed atomically."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        task = Task(
            task_id="claim-001",
            task_type=TaskType.PARALLEL_SEARCH,
            description="Search code"
        )
        board.post(task)

        # First claim succeeds
        claimed = board.claim("claim-001", "agent-alpha")
        assert claimed is True

        # Second claim fails
        claimed2 = board.claim("claim-001", "agent-beta")
        assert claimed2 is False

    def test_get_pending_tasks(self, tmp_path):
        """Can retrieve all pending tasks."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        for i in range(3):
            board.post(Task(
                task_id=f"pending-{i}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Task {i}"
            ))

        pending = board.get_pending()
        assert len(pending) == 3

    def test_complete_task(self, tmp_path):
        """Tasks can be completed with results."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        task = Task(
            task_id="complete-001",
            task_type=TaskType.SOLUTION_EXPLORATION,
            description="Find solution"
        )
        board.post(task)
        board.claim("complete-001", "agent-1")
        board.start("complete-001")  # Must start before completing

        board.complete("complete-001", {"answer": 42})
        completed = board.get("complete-001")
        assert completed.status == TaskStatus.COMPLETED
        assert completed.result["answer"] == 42

    def test_get_by_type(self, tmp_path):
        """Can filter tasks by type."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        board.post(Task(
            task_id="type-001",
            task_type=TaskType.CODE_ANALYSIS,
            description="Analyze"
        ))
        board.post(Task(
            task_id="type-002",
            task_type=TaskType.PARALLEL_SEARCH,
            description="Search"
        ))

        analysis_tasks = board.get_by_type(TaskType.CODE_ANALYSIS)
        assert len(analysis_tasks) == 1
        assert analysis_tasks[0].task_id == "type-001"

    def test_get_results_for_parent(self, tmp_path):
        """Can get all results for a parent task (MapReduce reduce phase)."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))

        # Simulate subtasks from a parent
        parent_id = "parent-001"
        for i in range(3):
            task = Task(
                task_id=f"sub-{i}",
                task_type=TaskType.CODE_ANALYSIS,
                description=f"Subtask {i}",
                payload={"parent_id": parent_id}
            )
            board.post(task)
            board.claim(f"sub-{i}", f"agent-{i}")
            board.start(f"sub-{i}")  # Must start before completing
            board.complete(f"sub-{i}", {"found": i * 10})

        results = board.get_results_by_parent(parent_id)
        assert len(results) == 3
        # Check all expected values are present (order may vary due to glob())
        found_values = [r["found"] for r in results]
        assert 0 in found_values
        assert 10 in found_values
        assert 20 in found_values
