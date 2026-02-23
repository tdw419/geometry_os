"""
SwarmAgent - An agent that executes tasks from a shared task board.

Agents claim tasks, execute work, and post results.
"""

import logging
from typing import Optional, List, Dict, Any, Callable, TYPE_CHECKING

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus
    from systems.swarm.neb_signal import NEBSignal
    from systems.swarm.memory import EpisodicMemory


logger = logging.getLogger("SwarmAgent")


class SwarmAgent:
    """
    An agent in the swarm that executes tasks.

    Agents have:
    - An ID for identification
    - A task board to pull work from
    - Capabilities that determine what tasks they can handle
    - Optional handlers for specific task types
    - Optional episodic memory for learning from experiences
    """

    def __init__(
        self,
        agent_id: str,
        task_board: TaskBoard,
        capabilities: Optional[List[str]] = None,
        handlers: Optional[Dict[TaskType, Callable]] = None,
        auto_claim: bool = False,
        memory: Optional['EpisodicMemory'] = None
    ):
        """
        Initialize swarm agent.

        Args:
            agent_id: Unique identifier for this agent
            task_board: TaskBoard to pull tasks from
            capabilities: List of task types this agent can handle
            handlers: Optional mapping of task types to handler functions
            auto_claim: If True, automatically claim tasks when notified via NEB
            memory: Optional EpisodicMemory for learning from experiences
        """
        self.agent_id = agent_id
        self.task_board = task_board
        self.capabilities = capabilities or self._default_capabilities()
        self.handlers = handlers or {}
        self.current_task: Optional[Task] = None
        self.auto_claim = auto_claim
        self.recent_notifications: List['NEBSignal'] = []
        self._memory = memory

    @property
    def memory(self) -> Optional['EpisodicMemory']:
        """Get the agent's episodic memory (if configured)."""
        return self._memory

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

        If memory is configured:
        - Before execution: Check for similar past failures
        - After completion: Store the experience

        Returns:
            Completed task, or None if no work available
        """
        task = self.claim_next_task()
        if task is None:
            return None

        # Check memory for similar failures before execution
        if self._memory is not None:
            self._check_similar_failures(task)

        try:
            result = self.execute_task(task)
            self.complete_task(task, result)

            # Store successful experience
            if self._memory is not None:
                self._store_experience(task, result, "success")

            return task
        except Exception as e:
            self.fail_task(task, str(e))

            # Store failure experience
            if self._memory is not None:
                self._store_experience(task, {"error": str(e)}, "failure")

            raise

    def _check_similar_failures(self, task: Task) -> None:
        """
        Check memory for similar past failures and log warnings.

        Args:
            task: Task about to be executed
        """
        if self._memory is None:
            return

        from systems.swarm.memory import generate_embedding

        # Create query from task description
        query_embedding = generate_embedding(task.description)
        similar_failures = self._memory.check_similar_failures(query_embedding, k=3)

        if similar_failures:
            logger.warning(
                f"Agent {self.agent_id}: Found {len(similar_failures)} similar past failures "
                f"for task {task.task_id}"
            )
            for result in similar_failures:
                logger.info(
                    f"  - Similar failure: {result.experience.description[:50]}... "
                    f"(similarity: {result.similarity:.2f})"
                )

    def _store_experience(
        self,
        task: Task,
        result: Dict[str, Any],
        outcome: str
    ) -> None:
        """
        Store an experience in memory.

        Args:
            task: Task that was executed
            result: Result of the task
            outcome: "success" or "failure"
        """
        if self._memory is None:
            return

        description = f"{task.task_type.value}: {task.description}"
        if outcome == "failure" and "error" in result:
            description += f" - Error: {result['error']}"

        self._memory.store_experience(
            task_type=task.task_type.value,
            action="execute",
            outcome=outcome,
            description=description,
            metadata={"task_id": task.task_id, "result": result}
        )

    def subscribe_to_events(self, bus: 'NEBBus') -> str:
        """
        Subscribe to task.available events from the Neural Event Bus.

        When a task becomes available, the agent is notified and optionally
        auto-claims it if auto_claim is True.

        Note: The auto_claim is deferred to avoid lock contention when the
        callback is invoked during TaskBoard.post() which already holds the
        board lock.

        Args:
            bus: NEBBus to subscribe to

        Returns:
            Subscription ID
        """
        def on_task_available(signal: 'NEBSignal'):
            self.recent_notifications.append(signal)
            if self.auto_claim:
                # Defer the claim to avoid lock contention
                # The task is already persisted, so we can claim it after
                # the current operation completes
                import threading
                threading.Timer(0.01, self.claim_next_task).start()

        return bus.subscribe("task.available", on_task_available)
