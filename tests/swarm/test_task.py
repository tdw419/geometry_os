"""
Tests for Task data structure.
"""

import pytest
import time
from systems.swarm.task import Task, TaskStatus, TaskType


class TestTaskCreation:
    """Test task creation and initialization."""

    def test_create_task_with_defaults(self):
        """Task can be created with minimal arguments."""
        task = Task(
            task_id="task-001",
            task_type=TaskType.CODE_ANALYSIS,
            description="Analyze auth module"
        )
        assert task.task_id == "task-001"
        assert task.status == TaskStatus.PENDING
        assert task.priority == 5

    def test_task_has_required_fields(self):
        """Task includes all required fields."""
        task = Task(
            task_id="task-002",
            task_type=TaskType.PARALLEL_SEARCH,
            description="Search for TODOs",
            payload={"pattern": "TODO", "paths": ["src/"]}
        )
        assert task.payload["pattern"] == "TODO"
        assert task.created_at > 0

    def test_task_serialization(self):
        """Task can be serialized to JSON."""
        task = Task(
            task_id="task-003",
            task_type=TaskType.SOLUTION_EXPLORATION,
            description="Find best sorting approach"
        )
        json_str = task.to_json()
        assert '"task_id": "task-003"' in json_str
        assert 'SOLUTION_EXPLORATION' in json_str

    def test_task_deserialization(self):
        """Task can be deserialized from JSON."""
        json_str = '{"task_id": "task-004", "task_type": "DISTRIBUTED_REVIEW", "description": "Review PR", "status": "PENDING", "priority": 5, "created_at": 1234567890, "claimed_by": null, "claimed_at": null, "result": null, "payload": {}}'
        task = Task.from_json(json_str)
        assert task.task_id == "task-004"
        assert task.task_type == TaskType.DISTRIBUTED_REVIEW
