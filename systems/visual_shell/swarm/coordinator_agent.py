"""
Coordinator Agent - Manages global swarm state, task assignment, and error recovery.

Extends the A2A Router's coordination primitives (locks, barriers) with
task orchestration and agent lifecycle management.
"""

import asyncio
import json
import logging
import time
import uuid
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any
import websockets

logger = logging.getLogger(__name__)


@dataclass
class SwarmTask:
    """A task in the coordinator's queue."""
    task_id: str
    task_type: str
    params: Dict[str, Any]
    status: str = "pending"  # pending, assigned, completed, failed
    assigned_to: Optional[str] = None
    created_at: float = field(default_factory=time.time)
    started_at: Optional[float] = None
    completed_at: Optional[float] = None
    result: Optional[Dict[str, Any]] = None
    error: Optional[str] = None
    retry_count: int = 0
    max_retries: int = 3


class CoordinatorAgent:
    """
    Central coordinator for the swarm.

    Responsibilities:
    - Task queue management (submit, assign, complete, retry)
    - Agent registry and health tracking
    - Distributed lock/barrier coordination via A2A Router
    - Error recovery with automatic task reassignment
    """

    def __init__(self, a2a_url: str = "ws://localhost:8766", agent_id: str = None):
        self.a2a_url = a2a_url
        self.agent_id = agent_id or f"coordinator-{uuid.uuid4().hex[:8]}"

        # Task management
        self.pending_tasks: List[SwarmTask] = []
        self.active_tasks: Dict[str, SwarmTask] = {}  # task_id -> task
        self.task_history: List[SwarmTask] = []

        # Agent management
        self.active_agents: Dict[str, Dict[str, Any]] = {}  # agent_id -> metadata
        self.agent_tasks: Dict[str, str] = {}  # agent_id -> task_id

        # WebSocket connection
        self.ws = None
        self.running = False

        logger.info(f"CoordinatorAgent initialized: {self.agent_id}")

    async def submit_task(
        self,
        task_type: str,
        params: Dict[str, Any],
        priority: int = 0
    ) -> str:
        """Submit a new task to the queue."""
        task = SwarmTask(
            task_id=f"task-{uuid.uuid4().hex[:8]}",
            task_type=task_type,
            params=params
        )

        self.pending_tasks.append(task)
        self.active_tasks[task.task_id] = task

        logger.info(f"Task submitted: {task.task_id} ({task_type})")

        return task.task_id

    async def get_next_task(self) -> Optional[SwarmTask]:
        """Get the next pending task from the queue."""
        if self.pending_tasks:
            return self.pending_tasks.pop(0)
        return None

    async def assign_task(self, task_id: str, agent_id: str) -> bool:
        """Assign a task to an agent."""
        if task_id not in self.active_tasks:
            return False

        task = self.active_tasks[task_id]
        task.assigned_to = agent_id
        task.status = "assigned"
        task.started_at = time.time()

        # Remove from pending queue if present
        self.pending_tasks = [t for t in self.pending_tasks if t.task_id != task_id]

        self.agent_tasks[agent_id] = task_id

        logger.info(f"Task {task_id} assigned to {agent_id}")

        return True

    async def complete_task(
        self,
        task_id: str,
        agent_id: str,
        result: Dict[str, Any],
        success: bool = True
    ) -> bool:
        """Mark a task as completed."""
        if task_id not in self.active_tasks:
            return False

        task = self.active_tasks[task_id]
        task.status = "completed" if success else "failed"
        task.completed_at = time.time()
        task.result = result

        # Move to history
        self.task_history.append(task)
        del self.active_tasks[task_id]

        if agent_id in self.agent_tasks:
            del self.agent_tasks[agent_id]

        logger.info(f"Task {task_id} completed by {agent_id}: {task.status}")

        return True

    async def fail_task(self, task_id: str, agent_id: str, error: str) -> bool:
        """Handle task failure with retry logic."""
        if task_id not in self.active_tasks:
            return False

        task = self.active_tasks[task_id]
        task.error = error
        task.retry_count += 1

        if task.retry_count < task.max_retries:
            # Requeue for retry
            task.status = "pending"
            task.assigned_to = None
            self.pending_tasks.append(task)
            logger.warning(f"Task {task_id} failed, requeued (attempt {task.retry_count}/{task.max_retries})")
        else:
            # Max retries exceeded
            task.status = "failed"
            self.task_history.append(task)
            del self.active_tasks[task_id]
            logger.error(f"Task {task_id} permanently failed after {task.max_retries} attempts")

        if agent_id in self.agent_tasks:
            del self.agent_tasks[agent_id]

        return True

    async def register_agent(self, agent_id: str, metadata: Dict[str, Any]):
        """Register an agent with the coordinator."""
        self.active_agents[agent_id] = {
            **metadata,
            "registered_at": time.time(),
            "last_heartbeat": time.time(),
            "status": "online"
        }
        logger.info(f"Agent registered: {agent_id}")

    async def unregister_agent(self, agent_id: str):
        """Unregister an agent and reassign its tasks."""
        if agent_id in self.active_agents:
            del self.active_agents[agent_id]

        # Reassign any tasks this agent was working on
        if agent_id in self.agent_tasks:
            task_id = self.agent_tasks[agent_id]
            if task_id in self.active_tasks:
                task = self.active_tasks[task_id]
                task.status = "pending"
                task.assigned_to = None
                self.pending_tasks.append(task)
                logger.warning(f"Reassigning task {task_id} from disconnected agent {agent_id}")
            del self.agent_tasks[agent_id]

        logger.info(f"Agent unregistered: {agent_id}")

    async def update_heartbeat(self, agent_id: str, status: str = "online"):
        """Update agent heartbeat."""
        if agent_id in self.active_agents:
            self.active_agents[agent_id]["last_heartbeat"] = time.time()
            self.active_agents[agent_id]["status"] = status

    def get_status(self) -> Dict[str, Any]:
        """Get coordinator status summary."""
        return {
            "agent_id": self.agent_id,
            "pending_tasks": len(self.pending_tasks),
            "active_tasks": len(self.active_tasks),
            "completed_tasks": len([t for t in self.task_history if t.status == "completed"]),
            "failed_tasks": len([t for t in self.task_history if t.status == "failed"]),
            "active_agents": len(self.active_agents),
            "agents": list(self.active_agents.keys())
        }
