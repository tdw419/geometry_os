"""
KnowledgeBlock dataclass for swarm intelligence.

Represents an atomic unit of knowledge with bidirectional linking,
inspired by Heaper PKM principles.
"""

import hashlib
import json
import time
from dataclasses import dataclass, field, asdict
from enum import Enum
from typing import List, Dict, Any


class BlockType(Enum):
    """
    Types of knowledge blocks.

    Each type represents a different category of knowledge
    that agents can store, link, and query.

    Values:
        CONCEPT: Abstract ideas, definitions, patterns
        EXPERIENCE: Learned lessons from agent actions
        TASK: Work items and their context
        NOTE: Freeform observations and thoughts
        REFERENCE: External resources, documentation links
    """
    CONCEPT = "concept"
    EXPERIENCE = "experience"
    TASK = "task"
    NOTE = "note"
    REFERENCE = "reference"


@dataclass
class KnowledgeBlock:
    """
    Atomic unit of knowledge with bidirectional linking.

    Represents a single piece of knowledge that can be linked to other
    blocks, tagged, and embedded for semantic search.

    Attributes:
        block_id: Unique identifier for this block
        block_type: Type of knowledge (CONCEPT, EXPERIENCE, TASK, NOTE, REFERENCE)
        content: The actual knowledge content as a dictionary
        tags: List of tags for categorization (e.g., ["#bugfix", "#auth"])
        mentions: List of other block IDs this block references
        backlinks: List of block IDs that reference this block
        embedding: 128-dim vector for semantic similarity (empty if not embedded)
        metadata: Additional context and provenance information
        created_at: Unix timestamp when block was created
        updated_at: Unix timestamp when block was last updated
    """
    block_id: str
    block_type: BlockType
    content: Dict[str, Any]
    tags: List[str] = field(default_factory=list)
    mentions: List[str] = field(default_factory=list)
    backlinks: List[str] = field(default_factory=list)
    embedding: List[float] = field(default_factory=list)
    metadata: Dict[str, Any] = field(default_factory=dict)
    created_at: float = field(default_factory=time.time)
    updated_at: float = field(default_factory=time.time)

    def to_dict(self) -> Dict[str, Any]:
        """
        Serialize to dictionary for JSON storage.

        Returns:
            Dictionary representation with block_type as string value.
        """
        d = asdict(self)
        d["block_type"] = self.block_type.value
        return d

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "KnowledgeBlock":
        """
        Deserialize from dictionary.

        Args:
            data: Dictionary with block_type as string value.

        Returns:
            KnowledgeBlock instance.
        """
        data = data.copy()
        data["block_type"] = BlockType(data["block_type"])
        return cls(**data)

    def compute_content_hash(self) -> str:
        """
        Compute SHA-256 hash of content for deduplication.

        The hash is deterministic and only considers the content field,
        not metadata, timestamps, or other fields.

        Returns:
            64-character hexadecimal SHA-256 hash string.
        """
        content_json = json.dumps(self.content, sort_keys=True)
        return hashlib.sha256(content_json.encode()).hexdigest()

    def __post_init__(self):
        """
        Validate embedding dimension after initialization.

        Raises:
            ValueError: If embedding is non-empty and not 128 dimensions.
        """
        # Empty embedding is allowed (not yet embedded)
        if len(self.embedding) == 0:
            return

        if len(self.embedding) != 128:
            raise ValueError(
                f"Embedding must be 128 dimensions, got {len(self.embedding)}"
            )
