"""
Tests for Thought data structures in the Collective Consciousness system.

Task 1: Thought Data Structures
- ThoughtType enum with EMBEDDING, ATTENTION, INFERENCE, QUERY
- Thought dataclass with validation and serialization
"""

import pytest
import numpy as np
from datetime import datetime, timezone
from uuid import UUID

from systems.visual_shell.swarm.consciousness import (
    ThoughtType,
    Thought,
)


class TestThoughtType:
    """Test cases for ThoughtType enum."""

    def test_thought_type_has_embedding(self):
        """Test ThoughtType enum has EMBEDDING value."""
        assert hasattr(ThoughtType, 'EMBEDDING')
        assert ThoughtType.EMBEDDING.value == "embedding"

    def test_thought_type_has_attention(self):
        """Test ThoughtType enum has ATTENTION value."""
        assert hasattr(ThoughtType, 'ATTENTION')
        assert ThoughtType.ATTENTION.value == "attention"

    def test_thought_type_has_inference(self):
        """Test ThoughtType enum has INFERENCE value."""
        assert hasattr(ThoughtType, 'INFERENCE')
        assert ThoughtType.INFERENCE.value == "inference"

    def test_thought_type_has_query(self):
        """Test ThoughtType enum has QUERY value."""
        assert hasattr(ThoughtType, 'QUERY')
        assert ThoughtType.QUERY.value == "query"


class TestThoughtDataclass:
    """Test cases for Thought dataclass."""

    def test_thought_initializes_with_defaults(self):
        """Test Thought dataclass initializes with auto-generated defaults."""
        thought = Thought(
            agent_id="agent-001",
            thought_type=ThoughtType.EMBEDDING,
            content=np.array([1.0, 2.0, 3.0]),
        )

        # Verify auto-generated fields
        assert thought.thought_id is not None
        assert UUID(thought.thought_id)  # Should be valid UUID
        assert thought.timestamp is not None
        assert thought.confidence == 1.0  # Default confidence
        assert thought.metadata == {}  # Default empty metadata

    def test_thought_with_explicit_values(self):
        """Test Thought can be created with explicit values."""
        custom_time = datetime(2026, 2, 19, 12, 0, 0, tzinfo=timezone.utc)
        thought = Thought(
            thought_id="custom-id-123",
            agent_id="agent-002",
            thought_type=ThoughtType.INFERENCE,
            content=np.array([0.5, 0.3]),
            confidence=0.85,
            timestamp=custom_time,
            metadata={"source": "test", "priority": "high"},
        )

        assert thought.thought_id == "custom-id-123"
        assert thought.agent_id == "agent-002"
        assert thought.thought_type == ThoughtType.INFERENCE
        assert np.array_equal(thought.content, np.array([0.5, 0.3]))
        assert thought.confidence == 0.85
        assert thought.timestamp == custom_time
        assert thought.metadata == {"source": "test", "priority": "high"}

    def test_thought_can_have_numpy_array_content(self):
        """Test Thought can store numpy array content."""
        # Test 1D array
        content_1d = np.array([1.0, 2.0, 3.0, 4.0, 5.0])
        thought_1d = Thought(
            agent_id="agent-001",
            thought_type=ThoughtType.EMBEDDING,
            content=content_1d,
        )
        assert np.array_equal(thought_1d.content, content_1d)

        # Test 2D array (e.g., attention matrix)
        content_2d = np.array([[1.0, 0.5], [0.5, 1.0]])
        thought_2d = Thought(
            agent_id="agent-002",
            thought_type=ThoughtType.ATTENTION,
            content=content_2d,
        )
        assert np.array_equal(thought_2d.content, content_2d)

        # Test empty array
        content_empty = np.array([])
        thought_empty = Thought(
            agent_id="agent-003",
            thought_type=ThoughtType.QUERY,
            content=content_empty,
        )
        assert np.array_equal(thought_empty.content, content_empty)

    def test_thought_rejects_confidence_below_zero(self):
        """Test Thought rejects confidence values below 0."""
        with pytest.raises(ValueError, match="confidence.*must be between 0 and 1"):
            Thought(
                agent_id="agent-001",
                thought_type=ThoughtType.EMBEDDING,
                content=np.array([1.0]),
                confidence=-0.1,
            )

    def test_thought_rejects_confidence_above_one(self):
        """Test Thought rejects confidence values above 1."""
        with pytest.raises(ValueError, match="confidence.*must be between 0 and 1"):
            Thought(
                agent_id="agent-001",
                thought_type=ThoughtType.EMBEDDING,
                content=np.array([1.0]),
                confidence=1.5,
            )

    def test_thought_accepts_confidence_at_boundaries(self):
        """Test Thought accepts confidence values at 0 and 1 boundaries."""
        # Test confidence = 0
        thought_zero = Thought(
            agent_id="agent-001",
            thought_type=ThoughtType.EMBEDDING,
            content=np.array([1.0]),
            confidence=0.0,
        )
        assert thought_zero.confidence == 0.0

        # Test confidence = 1
        thought_one = Thought(
            agent_id="agent-002",
            thought_type=ThoughtType.EMBEDDING,
            content=np.array([1.0]),
            confidence=1.0,
        )
        assert thought_one.confidence == 1.0


class TestThoughtSerialization:
    """Test cases for Thought serialization."""

    def test_thought_to_dict(self):
        """Test Thought can be serialized to dict."""
        content = np.array([1.0, 2.0, 3.0])
        thought = Thought(
            agent_id="agent-001",
            thought_type=ThoughtType.INFERENCE,
            content=content,
            confidence=0.9,
            metadata={"key": "value"},
        )

        result = thought.to_dict()

        assert isinstance(result, dict)
        assert result["agent_id"] == "agent-001"
        assert result["thought_type"] == "inference"
        assert result["confidence"] == 0.9
        assert result["metadata"] == {"key": "value"}
        # Content should be serialized as list
        assert "content" in result
        assert isinstance(result["content"], list)

    def test_thought_from_dict(self):
        """Test Thought can be deserialized from dict."""
        data = {
            "thought_id": "test-uuid-123",
            "agent_id": "agent-002",
            "thought_type": "query",
            "content": [0.5, 0.3, 0.2],
            "confidence": 0.75,
            "timestamp": "2026-02-19T12:00:00+00:00",
            "metadata": {"source": "test"},
        }

        thought = Thought.from_dict(data)

        assert thought.thought_id == "test-uuid-123"
        assert thought.agent_id == "agent-002"
        assert thought.thought_type == ThoughtType.QUERY
        assert np.allclose(thought.content, np.array([0.5, 0.3, 0.2]))
        assert thought.confidence == 0.75
        assert thought.metadata == {"source": "test"}

    def test_thought_roundtrip_serialization(self):
        """Test Thought can be serialized and deserialized back without loss."""
        original = Thought(
            agent_id="agent-003",
            thought_type=ThoughtType.ATTENTION,
            content=np.array([[1.0, 0.5], [0.3, 0.2]]),
            confidence=0.88,
            metadata={"layer": 5, "head": 2},
        )

        # Serialize
        data = original.to_dict()

        # Deserialize
        restored = Thought.from_dict(data)

        # Verify all fields match
        assert restored.thought_id == original.thought_id
        assert restored.agent_id == original.agent_id
        assert restored.thought_type == original.thought_type
        assert np.allclose(restored.content, original.content)
        assert restored.confidence == original.confidence
        assert restored.metadata == original.metadata

    def test_thought_serialization_handles_2d_arrays(self):
        """Test Thought serialization handles 2D numpy arrays correctly."""
        content_2d = np.array([[1.0, 2.0], [3.0, 4.0]])
        thought = Thought(
            agent_id="agent-001",
            thought_type=ThoughtType.ATTENTION,
            content=content_2d,
        )

        data = thought.to_dict()
        restored = Thought.from_dict(data)

        assert np.allclose(restored.content, content_2d)
        assert restored.content.shape == (2, 2)


class TestThoughtEquality:
    """Test cases for Thought equality and comparison."""

    def test_thoughts_with_same_id_are_equal(self):
        """Test Thoughts with the same ID are considered equal."""
        content = np.array([1.0, 2.0, 3.0])
        thought1 = Thought(
            thought_id="same-id",
            agent_id="agent-001",
            thought_type=ThoughtType.EMBEDDING,
            content=content,
        )
        thought2 = Thought(
            thought_id="same-id",
            agent_id="agent-002",  # Different agent
            thought_type=ThoughtType.INFERENCE,  # Different type
            content=np.array([4.0, 5.0]),  # Different content
        )

        assert thought1 == thought2
