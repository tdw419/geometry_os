"""
Tests for BlockType enum and KnowledgeBlock dataclass.
"""

import pytest
import hashlib
import time
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


class TestKnowledgeBlockSerialization:
    """Test to_dict and from_dict methods."""

    def test_to_dict_basic(self):
        """Should serialize basic block to dictionary."""
        from systems.swarm.knowledge.knowledge_block import KnowledgeBlock

        block = KnowledgeBlock(
            block_id="test-001",
            block_type=BlockType.CONCEPT,
            content={"description": "Test concept"},
            tags=["#test"],
            mentions=["other-block"],
            backlinks=[],
            embedding=[0.1] * 128,
            metadata={"source": "unit-test"},
            created_at=1234567890.0,
            updated_at=1234567890.0,
        )
        d = block.to_dict()

        assert d["block_id"] == "test-001"
        assert d["block_type"] == "concept"  # Enum value, not enum object
        assert d["content"] == {"description": "Test concept"}
        assert d["tags"] == ["#test"]
        assert d["mentions"] == ["other-block"]
        assert d["backlinks"] == []
        assert d["embedding"] == [0.1] * 128
        assert d["metadata"] == {"source": "unit-test"}
        assert d["created_at"] == 1234567890.0
        assert d["updated_at"] == 1234567890.0

    def test_from_dict_basic(self):
        """Should deserialize from dictionary."""
        from systems.swarm.knowledge.knowledge_block import KnowledgeBlock

        d = {
            "block_id": "exp-001",
            "block_type": "experience",
            "content": {"description": "Learned lesson"},
            "tags": ["#learning"],
            "mentions": [],
            "backlinks": ["task-001"],
            "embedding": [0.2] * 128,
            "metadata": {"author": "agent-alpha"},
            "created_at": 1234567890.0,
            "updated_at": 1234567900.0,
        }
        block = KnowledgeBlock.from_dict(d)

        assert block.block_id == "exp-001"
        assert block.block_type == BlockType.EXPERIENCE
        assert block.content == {"description": "Learned lesson"}
        assert block.tags == ["#learning"]
        assert block.mentions == []
        assert block.backlinks == ["task-001"]
        assert block.embedding == [0.2] * 128
        assert block.metadata == {"author": "agent-alpha"}
        assert block.created_at == 1234567890.0
        assert block.updated_at == 1234567900.0

    def test_round_trip_serialization(self):
        """Should round-trip through to_dict and from_dict."""
        from systems.swarm.knowledge.knowledge_block import KnowledgeBlock

        original = KnowledgeBlock(
            block_id="round-trip",
            block_type=BlockType.NOTE,
            content={"text": "Round trip test"},
            tags=["#serialization"],
            mentions=["ref-001"],
            backlinks=["parent-001"],
            embedding=[0.3] * 128,
            metadata={"priority": "high"},
            created_at=1111111111.0,
            updated_at=2222222222.0,
        )

        d = original.to_dict()
        restored = KnowledgeBlock.from_dict(d)

        assert restored.block_id == original.block_id
        assert restored.block_type == original.block_type
        assert restored.content == original.content
        assert restored.tags == original.tags
        assert restored.mentions == original.mentions
        assert restored.backlinks == original.backlinks
        assert restored.embedding == original.embedding
        assert restored.metadata == original.metadata
        assert restored.created_at == original.created_at
        assert restored.updated_at == original.updated_at


class TestKnowledgeBlockContentHash:
    """Test compute_content_hash method."""

    def test_compute_content_hash_is_deterministic(self):
        """Same content should produce same hash."""
        from systems.swarm.knowledge.knowledge_block import KnowledgeBlock

        block = KnowledgeBlock(
            block_id="hash-test-1",
            block_type=BlockType.TASK,
            content={"description": "Test task"},
            tags=["#test"],
            mentions=[],
            backlinks=[],
            embedding=[0.0] * 128,
            metadata={},
            created_at=1000.0,
            updated_at=1000.0,
        )

        hash1 = block.compute_content_hash()
        hash2 = block.compute_content_hash()

        assert hash1 == hash2
        assert len(hash1) == 64  # SHA-256 produces 64 hex chars

    def test_different_content_produces_different_hash(self):
        """Different content should produce different hashes."""
        from systems.swarm.knowledge.knowledge_block import KnowledgeBlock

        block1 = KnowledgeBlock(
            block_id="hash-test-2a",
            block_type=BlockType.TASK,
            content={"description": "Task A"},
            tags=["#test"],
            mentions=[],
            backlinks=[],
            embedding=[0.0] * 128,
            metadata={},
            created_at=1000.0,
            updated_at=1000.0,
        )

        block2 = KnowledgeBlock(
            block_id="hash-test-2b",
            block_type=BlockType.TASK,
            content={"description": "Task B"},
            tags=["#test"],
            mentions=[],
            backlinks=[],
            embedding=[0.0] * 128,
            metadata={},
            created_at=1000.0,
            updated_at=1000.0,
        )

        hash1 = block1.compute_content_hash()
        hash2 = block2.compute_content_hash()

        assert hash1 != hash2

    def test_content_hash_ignores_metadata(self):
        """Hash should only consider content, not metadata or timestamps."""
        from systems.swarm.knowledge.knowledge_block import KnowledgeBlock

        block1 = KnowledgeBlock(
            block_id="hash-test-3a",
            block_type=BlockType.CONCEPT,
            content={"definition": "Same"},
            tags=["#test"],
            mentions=[],
            backlinks=[],
            embedding=[0.0] * 128,
            metadata={"version": 1},
            created_at=1000.0,
            updated_at=1000.0,
        )

        block2 = KnowledgeBlock(
            block_id="hash-test-3b",
            block_type=BlockType.CONCEPT,
            content={"definition": "Same"},
            tags=["#test"],
            mentions=[],
            backlinks=[],
            embedding=[0.0] * 128,
            metadata={"version": 2},  # Different metadata
            created_at=2000.0,  # Different timestamp
            updated_at=2000.0,
        )

        hash1 = block1.compute_content_hash()
        hash2 = block2.compute_content_hash()

        assert hash1 == hash2  # Same content = same hash

    def test_content_hash_is_sha256(self):
        """Hash should match manual SHA-256 computation."""
        from systems.swarm.knowledge.knowledge_block import KnowledgeBlock
        import json

        content = {"description": "Verify SHA-256"}
        expected_hash = hashlib.sha256(
            json.dumps(content, sort_keys=True).encode()
        ).hexdigest()

        block = KnowledgeBlock(
            block_id="hash-test-4",
            block_type=BlockType.REFERENCE,
            content=content,
            tags=[],
            mentions=[],
            backlinks=[],
            embedding=[0.0] * 128,
            metadata={},
            created_at=1000.0,
            updated_at=1000.0,
        )

        assert block.compute_content_hash() == expected_hash


class TestKnowledgeBlockEmbeddingValidation:
    """Test __post_init__ embedding validation."""

    def test_valid_128_dim_embedding(self):
        """128-dim embedding should be accepted."""
        from systems.swarm.knowledge.knowledge_block import KnowledgeBlock

        block = KnowledgeBlock(
            block_id="embed-valid",
            block_type=BlockType.EXPERIENCE,
            content={"data": "test"},
            tags=[],
            mentions=[],
            backlinks=[],
            embedding=[0.1] * 128,
            metadata={},
            created_at=time.time(),
            updated_at=time.time(),
        )

        assert len(block.embedding) == 128

    def test_invalid_embedding_dimension_raises(self):
        """Non-128-dim embedding should raise ValueError."""
        from systems.swarm.knowledge.knowledge_block import KnowledgeBlock

        with pytest.raises(ValueError) as exc_info:
            KnowledgeBlock(
                block_id="embed-invalid",
                block_type=BlockType.EXPERIENCE,
                content={"data": "test"},
                tags=[],
                mentions=[],
                backlinks=[],
                embedding=[0.1] * 64,  # Wrong dimension
                metadata={},
                created_at=time.time(),
                updated_at=time.time(),
            )

        assert "128" in str(exc_info.value)

    def test_empty_embedding_allowed(self):
        """Empty embedding list should be allowed (not yet embedded)."""
        from systems.swarm.knowledge.knowledge_block import KnowledgeBlock

        block = KnowledgeBlock(
            block_id="embed-empty",
            block_type=BlockType.NOTE,
            content={"text": "Unembedded note"},
            tags=[],
            mentions=[],
            backlinks=[],
            embedding=[],  # Empty is OK
            metadata={},
            created_at=time.time(),
            updated_at=time.time(),
        )

        assert block.embedding == []


class TestKnowledgeBlockDefaults:
    """Test default values for optional fields."""

    def test_default_values(self):
        """Should have sensible defaults for optional fields."""
        from systems.swarm.knowledge.knowledge_block import KnowledgeBlock

        block = KnowledgeBlock(
            block_id="defaults-test",
            block_type=BlockType.NOTE,
            content={"text": "Test"},
            tags=[],
            mentions=[],
            backlinks=[],
            embedding=[],
            metadata={},
        )

        # created_at and updated_at should be set automatically
        assert block.created_at > 0
        assert block.updated_at > 0
        assert block.tags == []
        assert block.mentions == []
        assert block.backlinks == []
        assert block.embedding == []
        assert block.metadata == {}
