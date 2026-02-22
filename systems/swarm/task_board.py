"""
TaskBoard - Shared task storage and claiming mechanism.

Provides a file-based task board that can be accessed by multiple
agents across worktrees.
"""

import json
import os
import fcntl
from pathlib import Path
from typing import List, Optional, Dict, Any

from systems.swarm.task import Task, TaskType, TaskStatus


class TaskBoard:
    """
    A shared task board for swarm coordination.

    Uses file-based storage with locking for cross-process safety.
    Each task is stored as a separate JSON file for atomic operations.
    """

    def __init__(self, storage_path: str):
        """
        Initialize task board.

        Args:
            storage_path: Directory path for task storage
        """
        self.storage_path = Path(storage_path)
        self.storage_path.mkdir(parents=True, exist_ok=True)
        self._lock_path = self.storage_path / ".board.lock"

    def _acquire_lock(self):
        """Acquire exclusive lock for board operations."""
        lock_file = open(self._lock_path, 'w')
        fcntl.flock(lock_file.fileno(), fcntl.LOCK_EX)
        return lock_file

    def _release_lock(self, lock_file):
        """Release the board lock."""
        fcntl.flock(lock_file.fileno(), fcntl.LOCK_UN)
        lock_file.close()

    def _task_path(self, task_id: str) -> Path:
        """Get file path for a task."""
        return self.storage_path / f"{task_id}.json"

    def post(self, task: Task) -> None:
        """
        Post a new task to the board.

        Args:
            task: Task to post
        """
        lock = self._acquire_lock()
        try:
            path = self._task_path(task.task_id)
            with open(path, 'w') as f:
                f.write(task.to_json())
        finally:
            self._release_lock(lock)

    def get(self, task_id: str) -> Optional[Task]:
        """
        Get a task by ID.

        Args:
            task_id: Task identifier

        Returns:
            Task if found, None otherwise
        """
        path = self._task_path(task_id)
        if not path.exists():
            return None
        with open(path, 'r') as f:
            return Task.from_json(f.read())

    def claim(self, task_id: str, agent_id: str) -> bool:
        """
        Atomically claim a task for an agent.

        Args:
            task_id: Task to claim
            agent_id: Agent claiming the task

        Returns:
            True if claim successful, False if already claimed
        """
        lock = self._acquire_lock()
        try:
            task = self.get(task_id)
            if task is None:
                return False
            if not task.claim(agent_id):
                return False
            # Write updated task
            path = self._task_path(task_id)
            with open(path, 'w') as f:
                f.write(task.to_json())
            return True
        finally:
            self._release_lock(lock)

    def start(self, task_id: str) -> bool:
        """Mark task as in progress."""
        lock = self._acquire_lock()
        try:
            task = self.get(task_id)
            if task is None or not task.start():
                return False
            path = self._task_path(task_id)
            with open(path, 'w') as f:
                f.write(task.to_json())
            return True
        finally:
            self._release_lock(lock)

    def complete(self, task_id: str, result: Dict[str, Any]) -> bool:
        """
        Mark task as completed with result.

        Transitions task through IN_PROGRESS state if needed.

        Args:
            task_id: Task to complete
            result: Result data

        Returns:
            True if successful
        """
        lock = self._acquire_lock()
        try:
            task = self.get(task_id)
            if task is None:
                return False

            # Transition to IN_PROGRESS if in CLAIMED state
            if task.status == TaskStatus.CLAIMED:
                if not task.start():
                    return False

            if not task.complete(result):
                return False

            path = self._task_path(task_id)
            with open(path, 'w') as f:
                f.write(task.to_json())
            return True
        finally:
            self._release_lock(lock)

    def fail(self, task_id: str, error: str) -> bool:
        """Mark task as failed."""
        lock = self._acquire_lock()
        try:
            task = self.get(task_id)
            if task is None or not task.fail(error):
                return False
            path = self._task_path(task_id)
            with open(path, 'w') as f:
                f.write(task.to_json())
            return True
        finally:
            self._release_lock(lock)

    def get_pending(self) -> List[Task]:
        """Get all pending (unclaimed) tasks."""
        tasks = []
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            with open(path, 'r') as f:
                task = Task.from_json(f.read())
                if task.status == TaskStatus.PENDING:
                    tasks.append(task)
        return sorted(tasks, key=lambda t: t.priority)

    def get_by_type(self, task_type: TaskType) -> List[Task]:
        """Get all tasks of a specific type."""
        tasks = []
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            with open(path, 'r') as f:
                task = Task.from_json(f.read())
                if task.task_type == task_type:
                    tasks.append(task)
        return tasks

    def get_results_by_parent(self, parent_id: str) -> List[Dict[str, Any]]:
        """
        Get all results for subtasks of a parent task.

        Used in MapReduce reduce phase to aggregate results.
        """
        results = []
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            with open(path, 'r') as f:
                task = Task.from_json(f.read())
                if (task.payload.get("parent_id") == parent_id
                    and task.status == TaskStatus.COMPLETED
                    and task.result is not None):
                    results.append(task.result)
        return results

    def list_all(self) -> List[Task]:
        """Get all tasks on the board."""
        tasks = []
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            with open(path, 'r') as f:
                tasks.append(Task.from_json(f.read()))
        return tasks
