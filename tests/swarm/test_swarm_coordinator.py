"""
Tests for SwarmCoordinator - MapReduce-style orchestration.
"""

import pytest
from pathlib import Path

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_coordinator import SwarmCoordinator


class TestSwarmCoordinator:
    """Test MapReduce orchestration."""

    def test_create_coordinator(self, tmp_path):
        """Coordinator can be created with task board."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)
        assert coord.task_board == board

    def test_map_creates_subtasks(self, tmp_path):
        """map() creates subtasks from a parent task."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        parent_id = coord.map(
            task_type=TaskType.CODE_ANALYSIS,
            description="Analyze all modules",
            subtask_payloads=[
                {"module": "auth"},
                {"module": "api"},
                {"module": "db"}
            ]
        )

        # Should have 3 subtasks
        all_tasks = board.list_all()
        subtasks = [t for t in all_tasks if t.payload.get("parent_id") == parent_id]
        assert len(subtasks) == 3

    def test_reduce_aggregates_results(self, tmp_path):
        """reduce() aggregates results from completed subtasks."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # Create and complete subtasks
        parent_id = "parent-reduce-test"
        for i in range(3):
            task = Task(
                task_id=f"reduce-sub-{i}",
                task_type=TaskType.PARALLEL_SEARCH,
                description=f"Search {i}",
                payload={"parent_id": parent_id}
            )
            board.post(task)
            board.claim(f"reduce-sub-{i}", f"agent-{i}")
            board.start(f"reduce-sub-{i}")
            board.complete(f"reduce-sub-{i}", {"found": i * 10})

        # Reduce
        result = coord.reduce(parent_id, strategy="merge_all")
        assert result is not None
        assert 0 in result["found"]
        assert 10 in result["found"]
        assert 20 in result["found"]

    def test_mapreduce_full_workflow(self, tmp_path):
        """Full MapReduce workflow: map -> work -> reduce."""
        board = TaskBoard(storage_path=str(tmp_path / "tasks"))
        coord = SwarmCoordinator(task_board=board)

        # Map: create subtasks
        parent_id = coord.map(
            task_type=TaskType.SOLUTION_EXPLORATION,
            description="Explore sorting algorithms",
            subtask_payloads=[
                {"approach": "quicksort"},
                {"approach": "mergesort"},
                {"approach": "heapsort"}
            ]
        )

        # Simulate agents completing work with explicit scores
        # Sort subtasks by approach to ensure deterministic assignment
        subtasks = [t for t in board.list_all() if t.payload.get("parent_id") == parent_id]
        subtasks.sort(key=lambda t: t.payload["approach"])

        scores = {"quicksort": 95, "mergesort": 80, "heapsort": 70}
        for task in subtasks:
            approach = task.payload["approach"]
            board.claim(task.task_id, f"agent-{approach}")
            board.start(task.task_id)
            board.complete(task.task_id, {
                "approach": approach,
                "score": scores[approach]
            })

        # Reduce: pick best solution
        result = coord.reduce(parent_id, strategy="best_score", score_key="score")
        assert result["approach"] == "quicksort"  # Highest score (95)
        assert result["score"] == 95
