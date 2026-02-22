"""
SwarmAgent - An agent that executes tasks from a shared task board.

Agents claim tasks, execute work, and post results.
"""

import logging
from typing import Optional, List, Dict, Any, Callable

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard


logger = logging.getLogger("SwarmAgent")


class SwarmAgent:
    """
    An agent in the swarm that executes tasks.

    Agents have:
    - An ID for identification
    - A task board to pull work from
    - Capabilities that determine what tasks they can handle
    - Optional handlers for specific task types
    """

    def __init__(
        self,
        agent_id: str,
        task_board: TaskBoard,
        capabilities: Optional[List[str]] = None,
        handlers: Optional[Dict[TaskType, Callable]] = None
    ):
        """
        Initialize swarm agent.

        Args:
            agent_id: Unique identifier for this agent
            task_board: TaskBoard to pull tasks from
            capabilities: List of task types this agent can handle
            handlers: Optional mapping of task types to handler functions
        """
        self.agent_id = agent_id
        self.task_board = task_board
        self.capabilities = capabilities or self._default_capabilities()
        self.handlers = handlers or {}
        self.current_task: Optional[Task] = None

    def _default_capabilities(self) -> List[str]:
        """Default capabilities - all task types."""
        return [t.value for t in TaskType]

    def can_handle(self, task_type: TaskType) -> bool:
        """Check if agent can handle a task type."""
        return task_type.value in self.capabilities

    def claim_next_task(self) -> Optional[Task]:
        """
        Claim the next available pending task.

        Returns:
            Claimed task, or None if no suitable tasks available
        """
        pending = self.task_board.get_pending()

        for task in pending:
            if not self.can_handle(task.task_type):
                continue

            if self.task_board.claim(task.task_id, self.agent_id):
                self.current_task = self.task_board.get(task.task_id)
                logger.info(f"Agent {self.agent_id} claimed task {task.task_id}")
                return self.current_task

        return None

    def execute_task(self, task: Task) -> Dict[str, Any]:
        """
        Execute a task using registered handler or default.

        Args:
            task: Task to execute

        Returns:
            Result dictionary
        """
        self.task_board.start(task.task_id)

        handler = self.handlers.get(task.task_type)
        if handler:
            result = handler(task)
        else:
            result = self._default_handler(task)

        return result

    def _default_handler(self, task: Task) -> Dict[str, Any]:
        """Default task handler - just marks as processed."""
        return {
            "processed_by": self.agent_id,
            "task_type": task.task_type.value,
            "description": task.description
        }

    def complete_task(self, task: Task, result: Dict[str, Any]) -> bool:
        """
        Mark a task as completed with result.

        Args:
            task: Task to complete
            result: Result data

        Returns:
            True if successful
        """
        success = self.task_board.complete(task.task_id, result)
        if success:
            logger.info(f"Agent {self.agent_id} completed task {task.task_id}")
            if self.current_task and self.current_task.task_id == task.task_id:
                self.current_task = None
        return success

    def fail_task(self, task: Task, error: str) -> bool:
        """
        Mark a task as failed.

        Args:
            task: Task that failed
            error: Error message

        Returns:
            True if successful
        """
        success = self.task_board.fail(task.task_id, error)
        if success:
            logger.warning(f"Agent {self.agent_id} failed task {task.task_id}: {error}")
            if self.current_task and self.current_task.task_id == task.task_id:
                self.current_task = None
        return success

    def work_cycle(self) -> Optional[Task]:
        """
        Perform one work cycle: claim, execute, complete.

        Returns:
            Completed task, or None if no work available
        """
        task = self.claim_next_task()
        if task is None:
            return None

        try:
            result = self.execute_task(task)
            self.complete_task(task, result)
            return task
        except Exception as e:
            self.fail_task(task, str(e))
            raise
