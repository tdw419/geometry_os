"""
Thought data structures for the Collective Consciousness system.

Task 1: Thought Data Structures
- ThoughtType enum with EMBEDDING, ATTENTION, INFERENCE, QUERY
- Thought dataclass with validation and serialization
"""

from dataclasses import dataclass, field
from datetime import datetime, timezone
from enum import Enum
from typing import Any, Dict, List, Optional, Union
from uuid import uuid4

import numpy as np


class ThoughtType(Enum):
    """
    Enumeration of thought types in the collective consciousness.

    Types:
        EMBEDDING: Vector embeddings representing semantic content
        ATTENTION: Attention weights or patterns
        INFERENCE: Results from model inference
        QUERY: Search or retrieval queries
    """

    EMBEDDING = "embedding"
    ATTENTION = "attention"
    INFERENCE = "inference"
    QUERY = "query"


@dataclass
class Thought:
    """
    A single thought unit in the collective consciousness.

    Represents a piece of information, inference, or query shared
    between agents in the swarm.

    Attributes:
        thought_id: Unique identifier for the thought (auto-generated UUID)
        agent_id: ID of the agent that produced this thought
        thought_type: Type of thought (embedding, attention, inference, query)
        content: Numpy array containing the thought data
        confidence: Confidence score in [0, 1] range
        timestamp: When the thought was created (defaults to now in UTC)
        metadata: Additional metadata as key-value pairs

    Example:
        >>> import numpy as np
        >>> thought = Thought(
        ...     agent_id="agent-001",
        ...     thought_type=ThoughtType.EMBEDDING,
        ...     content=np.array([0.1, 0.2, 0.3]),
        ...     confidence=0.95
        ... )
        >>> thought.confidence
        0.95
    """

    agent_id: str
    thought_type: ThoughtType
    content: np.ndarray
    thought_id: str = field(default_factory=lambda: str(uuid4()))
    confidence: float = 1.0
    timestamp: datetime = field(default_factory=lambda: datetime.now(timezone.utc))
    metadata: Dict[str, Any] = field(default_factory=dict)

    def __post_init__(self):
        """Validate thought after initialization."""
        self._validate_confidence()
        self._ensure_content_is_array()

    def _validate_confidence(self):
        """Validate that confidence is in [0, 1] range."""
        if not 0.0 <= self.confidence <= 1.0:
            raise ValueError(
                f"confidence must be between 0 and 1, got {self.confidence}"
            )

    def _ensure_content_is_array(self):
        """Ensure content is a numpy array."""
        if not isinstance(self.content, np.ndarray):
            self.content = np.array(self.content)

    def to_dict(self) -> Dict[str, Any]:
        """
        Serialize Thought to a dictionary.

        Converts numpy array to list for JSON compatibility.

        Returns:
            Dictionary representation of the thought.

        Example:
            >>> thought = Thought(
            ...     agent_id="agent-001",
            ...     thought_type=ThoughtType.EMBEDDING,
            ...     content=np.array([1.0, 2.0])
            ... )
            >>> data = thought.to_dict()
            >>> data["content"]
            [1.0, 2.0]
        """
        return {
            "thought_id": self.thought_id,
            "agent_id": self.agent_id,
            "thought_type": self.thought_type.value,
            "content": self.content.tolist(),
            "confidence": self.confidence,
            "timestamp": self.timestamp.isoformat(),
            "metadata": self.metadata,
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "Thought":
        """
        Deserialize Thought from a dictionary.

        Args:
            data: Dictionary containing thought data.

        Returns:
            A new Thought instance.

        Example:
            >>> data = {
            ...     "thought_id": "test-id",
            ...     "agent_id": "agent-001",
            ...     "thought_type": "embedding",
            ...     "content": [1.0, 2.0],
            ...     "confidence": 0.9,
            ...     "timestamp": "2026-02-19T12:00:00+00:00",
            ...     "metadata": {}
            ... }
            >>> thought = Thought.from_dict(data)
            >>> thought.thought_type
            <ThoughtType.EMBEDDING: 'embedding'>
        """
        return cls(
            thought_id=data["thought_id"],
            agent_id=data["agent_id"],
            thought_type=ThoughtType(data["thought_type"]),
            content=np.array(data["content"]),
            confidence=data["confidence"],
            timestamp=datetime.fromisoformat(data["timestamp"]),
            metadata=data.get("metadata", {}),
        )

    def __eq__(self, other: object) -> bool:
        """
        Check equality based on thought_id.

        Two thoughts are considered equal if they have the same thought_id,
        regardless of other attributes.

        Args:
            other: Another object to compare with.

        Returns:
            True if both have the same thought_id, False otherwise.
        """
        if not isinstance(other, Thought):
            return NotImplemented
        return self.thought_id == other.thought_id
