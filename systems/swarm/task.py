"""
Task data structure for swarm intelligence.

Represents a unit of work that can be claimed and executed by agents.
"""

import json
import time
from dataclasses import dataclass, field, asdict
from enum import Enum
from typing import Optional, Dict, Any


class TaskStatus(Enum):
    """Lifecycle states for a task."""
    PENDING = "PENDING"
    CLAIMED = "CLAIMED"
    IN_PROGRESS = "IN_PROGRESS"
    COMPLETED = "COMPLETED"
    FAILED = "FAILED"
    CANCELLED = "CANCELLED"


class TaskType(Enum):
    """Types of tasks the swarm can handle."""
    CODE_ANALYSIS = "CODE_ANALYSIS"
    PARALLEL_SEARCH = "PARALLEL_SEARCH"
    SOLUTION_EXPLORATION = "SOLUTION_EXPLORATION"
    DISTRIBUTED_REVIEW = "DISTRIBUTED_REVIEW"
    # Guild task types
    CODE_GENERATION = "CODE_GENERATION"
    CODE_TESTING = "CODE_TESTING"
    CODE_REVIEW = "CODE_REVIEW"
    SECURITY_SCAN = "SECURITY_SCAN"
    ARCHITECTURE_DESIGN = "ARCHITECTURE_DESIGN"
    SYSTEM_PLANNING = "SYSTEM_PLANNING"


@dataclass
class Task:
    """
    A unit of work for the swarm.

    Tasks flow through states:
    PENDING -> CLAIMED -> IN_PROGRESS -> COMPLETED/FAILED
    """
    task_id: str
    task_type: TaskType
    description: str
    status: TaskStatus = TaskStatus.PENDING
    priority: int = 5  # 1=highest, 10=lowest
    created_at: float = field(default_factory=time.time)
    claimed_by: Optional[str] = None
    claimed_at: Optional[float] = None
    result: Optional[Dict[str, Any]] = None
    payload: Dict[str, Any] = field(default_factory=dict)

    def claim(self, agent_id: str) -> bool:
        """
        Atomically claim this task for an agent.

        Returns True if claim successful, False if already claimed.
        """
        if self.status != TaskStatus.PENDING:
            return False
        self.status = TaskStatus.CLAIMED
        self.claimed_by = agent_id
        self.claimed_at = time.time()
        return True

    def start(self) -> bool:
        """Mark task as in progress."""
        if self.status != TaskStatus.CLAIMED:
            return False
        self.status = TaskStatus.IN_PROGRESS
        return True

    def complete(self, result: Dict[str, Any]) -> bool:
        """Mark task as completed with result."""
        if self.status != TaskStatus.IN_PROGRESS:
            return False
        self.status = TaskStatus.COMPLETED
        self.result = result
        return True

    def fail(self, error: str) -> bool:
        """Mark task as failed with error message."""
        if self.status not in (TaskStatus.CLAIMED, TaskStatus.IN_PROGRESS):
            return False
        self.status = TaskStatus.FAILED
        self.result = {"error": error}
        return True

    def to_json(self) -> str:
        """Serialize task to JSON string."""
        data = asdict(self)
        data["task_type"] = self.task_type.value
        data["status"] = self.status.value
        return json.dumps(data)

    @staticmethod
    def from_json(json_str: str) -> 'Task':
        """Deserialize task from JSON string."""
        data = json.loads(json_str)
        data["task_type"] = TaskType(data["task_type"])
        data["status"] = TaskStatus(data["status"])
        return Task(**data)
