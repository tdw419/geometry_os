"""
Experience dataclass for EpisodicMemory.

Represents an agent's experience as a vector for storage and similarity search.
"""

import time
from dataclasses import dataclass, field, asdict
from typing import List, Dict, Any
import json


@dataclass
class Experience:
    """
    A recorded experience from an agent's task execution.

    Experiences are stored as vectors for similarity search,
    enabling agents to learn from past successes/failures.

    Attributes:
        experience_id: Unique identifier for this experience
        agent_id: ID of the agent that had this experience
        task_type: Type of task (e.g., "CODE_GEN", "REVIEW")
        action: Action taken (e.g., "write", "review", "test")
        outcome: Result of the action ("success", "failure", "partial")
        description: Human-readable description of what happened
        embedding: 128-dim vector representation for similarity search
        metadata: Additional context (file paths, error messages, etc.)
        timestamp: Unix timestamp when experience was recorded
    """
    experience_id: str
    agent_id: str
    task_type: str
    action: str
    outcome: str
    description: str
    embedding: List[float]
    metadata: Dict[str, Any] = field(default_factory=dict)
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for JSON serialization."""
        return asdict(self)

    def to_json(self) -> str:
        """Serialize to JSON string."""
        return json.dumps(self.to_dict())

    @staticmethod
    def from_dict(data: Dict[str, Any]) -> 'Experience':
        """Create from dictionary."""
        return Experience(**data)

    @staticmethod
    def from_json(json_str: str) -> 'Experience':
        """Deserialize from JSON string."""
        data = json.loads(json_str)
        return Experience.from_dict(data)

    def __post_init__(self):
        """Validate embedding dimension after initialization."""
        if len(self.embedding) != 128:
            raise ValueError(f"Embedding must be 128 dimensions, got {len(self.embedding)}")
