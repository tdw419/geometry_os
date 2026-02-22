"""
SwarmCoordinator - MapReduce-style orchestration for swarm intelligence.

Coordinates task distribution (map) and result aggregation (reduce).
"""

import uuid
import logging
from typing import List, Dict, Any, Optional

from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard
from systems.swarm.reduction import reduce_results


logger = logging.getLogger("SwarmCoordinator")


class SwarmCoordinator:
    """
    Coordinates MapReduce-style swarm operations.

    Map: Split work into subtasks
    Reduce: Aggregate results from completed subtasks
    """

    def __init__(self, task_board: TaskBoard):
        """
        Initialize coordinator.

        Args:
            task_board: Shared task board for the swarm
        """
        self.task_board = task_board

    def map(
        self,
        task_type: TaskType,
        description: str,
        subtask_payloads: List[Dict[str, Any]],
        priority: int = 5
    ) -> str:
        """
        Create subtasks from a parent task (Map phase).

        Args:
            task_type: Type of tasks to create
            description: Description for all subtasks
            subtask_payloads: List of payloads, one per subtask
            priority: Task priority (1=highest)

        Returns:
            Parent task ID for reduce phase
        """
        parent_id = f"parent-{uuid.uuid4().hex[:8]}"

        for i, payload in enumerate(subtask_payloads):
            # Copy payload to avoid mutating original
            payload = dict(payload)
            payload["parent_id"] = parent_id
            task = Task(
                task_id=f"{parent_id}-sub-{i}",
                task_type=task_type,
                description=f"{description} (part {i+1}/{len(subtask_payloads)})",
                priority=priority,
                payload=payload
            )
            self.task_board.post(task)
            logger.info(f"Posted subtask {task.task_id} for parent {parent_id}")

        logger.info(f"Map complete: {len(subtask_payloads)} subtasks for {parent_id}")
        return parent_id

    def reduce(
        self,
        parent_id: str,
        strategy: str = "merge_all",
        **strategy_kwargs
    ) -> Optional[Dict[str, Any]]:
        """
        Aggregate results from completed subtasks (Reduce phase).

        Args:
            parent_id: Parent task ID from map phase
            strategy: Reduction strategy name
            **strategy_kwargs: Additional args for strategy

        Returns:
            Reduced result, or None if no results
        """
        results = self.task_board.get_results_by_parent(parent_id)

        if not results:
            logger.warning(f"No results found for parent {parent_id}")
            return None

        reduced = reduce_results(results, strategy=strategy, **strategy_kwargs)
        logger.info(f"Reduce complete: {len(results)} results for {parent_id}")
        return reduced

    def mapreduce(
        self,
        task_type: TaskType,
        description: str,
        subtask_payloads: List[Dict[str, Any]],
        reduce_strategy: str = "merge_all",
        **reduce_kwargs
    ) -> str:
        """
        Start a MapReduce job.

        Returns immediately with parent_id.
        Call reduce() later when subtasks complete.

        Args:
            task_type: Type of tasks
            description: Task description
            subtask_payloads: Payloads for each subtask
            reduce_strategy: Strategy for reduce phase
            **reduce_kwargs: Args for reduce strategy

        Returns:
            Parent task ID
        """
        return self.map(task_type, description, subtask_payloads)

    def get_progress(self, parent_id: str) -> Dict[str, Any]:
        """
        Get progress for a MapReduce job.

        Args:
            parent_id: Parent task ID

        Returns:
            Progress dict with counts and status
        """
        all_tasks = self.task_board.list_all()
        subtasks = [t for t in all_tasks if t.payload.get("parent_id") == parent_id]

        total = len(subtasks)
        completed = sum(1 for t in subtasks if t.status == TaskStatus.COMPLETED)
        failed = sum(1 for t in subtasks if t.status == TaskStatus.FAILED)
        pending = sum(1 for t in subtasks if t.status == TaskStatus.PENDING)
        in_progress = sum(1 for t in subtasks if t.status in (TaskStatus.CLAIMED, TaskStatus.IN_PROGRESS))

        return {
            "parent_id": parent_id,
            "total": total,
            "completed": completed,
            "failed": failed,
            "pending": pending,
            "in_progress": in_progress,
            "progress_pct": (completed / total * 100) if total > 0 else 0,
            "is_complete": completed == total
        }
