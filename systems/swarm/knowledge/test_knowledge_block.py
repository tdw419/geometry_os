"""
Tests for BlockType enum and KnowledgeBlock dataclass.
"""

import pytest
from systems.swarm.knowledge import BlockType


class TestBlockType:
    """Tests for BlockType enum."""

    def test_block_type_concept_value(self):
        """CONCEPT should have value 'concept'."""
        assert BlockType.CONCEPT.value == "concept"

    def test_block_type_experience_value(self):
        """EXPERIENCE should have value 'experience'."""
        assert BlockType.EXPERIENCE.value == "experience"

    def test_block_type_task_value(self):
        """TASK should have value 'task'."""
        assert BlockType.TASK.value == "task"

    def test_block_type_note_value(self):
        """NOTE should have value 'note'."""
        assert BlockType.NOTE.value == "note"

    def test_block_type_reference_value(self):
        """REFERENCE should have value 'reference'."""
        assert BlockType.REFERENCE.value == "reference"

    def test_block_type_count(self):
        """Should have exactly 5 block types."""
        assert len(BlockType) == 5

    def test_block_type_from_string(self):
        """Should be able to create BlockType from string value."""
        assert BlockType("concept") == BlockType.CONCEPT
        assert BlockType("experience") == BlockType.EXPERIENCE
        assert BlockType("task") == BlockType.TASK
        assert BlockType("note") == BlockType.NOTE
        assert BlockType("reference") == BlockType.REFERENCE

    def test_block_type_invalid_string(self):
        """Invalid string should raise ValueError."""
        with pytest.raises(ValueError):
            BlockType("invalid_type")
