"""
KnowledgeBlock dataclass for swarm intelligence.

Represents an atomic unit of knowledge with bidirectional linking,
inspired by Heaper PKM principles.
"""

from enum import Enum


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
