"""
Coordinator Agent - Manages global swarm state, task assignment, and error recovery.

Extends the A2A Router's coordination primitives (locks, barriers) with
task orchestration and agent lifecycle management.

Also provides district-based agent organization and relocation capabilities.
"""

import asyncio
import json
import logging
import time
import uuid
from dataclasses import dataclass, field
from enum import Enum, auto
from typing import Dict, List, Optional, Any, Set
import websockets

logger = logging.getLogger(__name__)


class District(Enum):
    """Valid districts for agent placement."""
    COGNITIVE = auto()   # Reasoning, planning, decision-making
    METABOLIC = auto()   # Resource management, optimization
    SUBSTRATE = auto()   # Low-level execution, GPU/compute


@dataclass
class RelocationResult:
    """
    Result of an agent relocation attempt.

    Attributes:
        success: Whether the relocation succeeded
        agent_id: ID of the relocated agent
        from_district: Previous district (None if agent not found)
        to_district: Target district
        error: Error message if relocation failed
        timestamp: When the relocation was attempted
    """
    success: bool
    agent_id: str
    from_district: Optional[District]
    to_district: District
    error: str = ""
    timestamp: float = field(default_factory=time.time)


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
    - District-based agent organization and relocation

    Districts:
        - COGNITIVE: High-level reasoning, planning, decision-making agents
        - METABOLIC: Resource management, optimization, scheduling agents
        - SUBSTRATE: Low-level execution, GPU/compute, infrastructure agents
    """

    VALID_DISTRICTS: Set[District] = {District.COGNITIVE, District.METABOLIC, District.SUBSTRATE}

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

        # Visual bridge for telemetry (can be set externally)
        self._visual_bridge: Optional[Any] = None

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

        # Emit telemetry for new task
        await self._emit_task_update(task, previous_status=None)

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
        previous_status = task.status
        task.assigned_to = agent_id
        task.status = "assigned"
        task.started_at = time.time()

        # Remove from pending queue if present
        self.pending_tasks = [t for t in self.pending_tasks if t.task_id != task_id]

        self.agent_tasks[agent_id] = task_id

        logger.info(f"Task {task_id} assigned to {agent_id}")

        # Emit telemetry for task assignment
        await self._emit_task_update(task, previous_status=previous_status)

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
        previous_status = task.status
        task.status = "completed" if success else "failed"
        task.completed_at = time.time()
        task.result = result

        # Move to history
        self.task_history.append(task)
        del self.active_tasks[task_id]

        if agent_id in self.agent_tasks:
            del self.agent_tasks[agent_id]

        logger.info(f"Task {task_id} completed by {agent_id}: {task.status}")

        # Emit telemetry for task completion
        await self._emit_task_update(task, previous_status=previous_status)

        return True

    async def fail_task(self, task_id: str, agent_id: str, error: str) -> bool:
        """Handle task failure with retry logic."""
        if task_id not in self.active_tasks:
            return False

        task = self.active_tasks[task_id]
        previous_status = task.status
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

        # Emit telemetry for task failure
        await self._emit_task_update(task, previous_status=previous_status)

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

    async def _emit_task_update(self, task: SwarmTask, previous_status: str = None):
        """Emit task telemetry to Visual Bridge for HUD visualization.

        Args:
            task: The SwarmTask instance to emit telemetry for
            previous_status: The previous status of the task (for status transitions)
        """
        if not self.ws:
            return

        telemetry = {
            "type": "task_update",
            "data": {
                "task_id": task.task_id,
                "task_type": task.task_type,
                "status": task.status,
                "previous_status": previous_status,
                "assigned_to": task.assigned_to,
                "timestamp": time.time(),
                "started_at": task.started_at,
                "duration": task.started_at and (time.time() - task.started_at) or None,
                "retry_count": task.retry_count,
                "error": task.error
            }
        }

        # Include result if available
        if task.result is not None:
            telemetry["data"]["result"] = task.result

        try:
            await self.ws.send(json.dumps(telemetry))
            logger.debug(f"Emitted task telemetry: {task.task_id} -> {task.status}")
        except Exception as e:
            logger.warning(f"Failed to emit task telemetry: {e}")

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

    # ===================== District Management =====================

    def set_visual_bridge(self, bridge: Any) -> None:
        """
        Set the Visual Bridge for telemetry emission.

        Args:
            bridge: Visual Bridge instance with an emit() method
        """
        self._visual_bridge = bridge

    def get_visual_bridge(self) -> Optional[Any]:
        """
        Get the current Visual Bridge.

        Returns:
            The Visual Bridge instance or None if not set
        """
        return self._visual_bridge

    def relocate_agent(
        self,
        agent_id: str,
        target_district: District
    ) -> RelocationResult:
        """
        Relocate an agent to a different district.

        Args:
            agent_id: The agent's unique identifier
            target_district: The destination district (must be District enum)

        Returns:
            RelocationResult indicating success/failure and details

        Raises:
            TypeError: If target_district is not a District enum
        """
        # Validate district type
        if not isinstance(target_district, District):
            raise TypeError(
                f"target_district must be a District enum, got {type(target_district).__name__}"
            )

        # Check if agent exists
        agent = self.active_agents.get(agent_id)
        if agent is None:
            return RelocationResult(
                success=False,
                agent_id=agent_id,
                from_district=None,
                to_district=target_district,
                error=f"Agent {agent_id} not found"
            )

        # Store original district
        from_district_str = agent.get("district")
        if from_district_str:
            try:
                from_district = District[from_district_str] if isinstance(from_district_str, str) else from_district_str
            except (KeyError, ValueError):
                from_district = None
        else:
            from_district = None

        # Perform relocation
        agent["district"] = target_district.name

        # Emit telemetry
        self._emit_relocation_telemetry(agent_id, from_district, target_district)

        logger.info(f"Agent {agent_id} relocated from {from_district} to {target_district.name}")

        return RelocationResult(
            success=True,
            agent_id=agent_id,
            from_district=from_district,
            to_district=target_district
        )

    def _emit_relocation_telemetry(
        self,
        agent_id: str,
        from_district: Optional[District],
        to_district: District
    ) -> None:
        """
        Emit relocation telemetry to the Visual Bridge.

        Args:
            agent_id: The relocated agent's ID
            from_district: Previous district
            to_district: New district
        """
        if self._visual_bridge is None:
            return

        telemetry = {
            'type': 'agent_relocation',
            'agent_id': agent_id,
            'from_district': from_district.name if from_district else None,
            'to_district': to_district.name,
            'timestamp': time.time()
        }

        try:
            if hasattr(self._visual_bridge, 'emit'):
                self._visual_bridge.emit(telemetry)
                logger.debug(f"Emitted relocation telemetry: {agent_id}")
        except Exception as e:
            logger.warning(f"Failed to emit relocation telemetry: {e}")

    def get_district_load(self) -> Dict[District, int]:
        """
        Get the current load (agent count) for each district.

        Returns:
            Dictionary mapping each district to its agent count
        """
        load: Dict[District, int] = {
            District.COGNITIVE: 0,
            District.METABOLIC: 0,
            District.SUBSTRATE: 0
        }

        for agent in self.active_agents.values():
            district_name = agent.get("district")
            if district_name:
                try:
                    district = District[district_name] if isinstance(district_name, str) else district_name
                    if district in load:
                        load[district] += 1
                except (KeyError, ValueError):
                    pass

        return load

    def get_agent(self, agent_id: str) -> Optional[Dict[str, Any]]:
        """
        Get information about an agent.

        Args:
            agent_id: The agent's unique identifier

        Returns:
            Agent metadata dict if found, None otherwise
        """
        return self.active_agents.get(agent_id)

    def get_all_agents(self) -> Dict[str, Dict[str, Any]]:
        """
        Get all registered agents.

        Returns:
            Dictionary mapping agent IDs to agent metadata
        """
        return self.active_agents.copy()
