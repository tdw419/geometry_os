"""
Tests for ConsciousnessState - Task 4 of Collective Consciousness.

Tests the global consciousness state that maintains:
- embedding_pool: Dict[str, np.ndarray] for agent embeddings
- attention_map: Optional[np.ndarray] NxN matrix
- consensus_state: Dict[str, Any] for shared agreement
- thought_stream: deque with maxlen for recent thoughts
"""

import pytest
import numpy as np
from collections import deque

from systems.visual_shell.swarm.consciousness import Thought, ThoughtType
from systems.visual_shell.swarm.consciousness.consciousness_state import ConsciousnessState


class TestConsciousnessStateInit:
    """Test ConsciousnessState initialization."""

    def test_initializes_empty_with_default_max_thoughts(self):
        """ConsciousnessState initializes empty with max_thoughts=1000."""
        state = ConsciousnessState()

        assert len(state.embedding_pool) == 0
        assert state.attention_map is None
        assert len(state.consensus_state) == 0
        assert len(state.thought_stream) == 0
        assert state.max_thoughts == 1000

    def test_initializes_with_custom_max_thoughts(self):
        """ConsciousnessState can be initialized with custom max_thoughts."""
        state = ConsciousnessState(max_thoughts=500)

        assert state.max_thoughts == 500
        # Internal deque should have the correct maxlen
        assert state.thought_stream.maxlen == 500


class TestEmbeddingPool:
    """Test embedding pool operations."""

    def test_add_embedding_adds_to_pool(self):
        """add_embedding(agent_id, embedding) adds to pool."""
        state = ConsciousnessState()
        embedding = np.array([0.1, 0.2, 0.3, 0.4])

        state.add_embedding("agent-001", embedding)

        assert "agent-001" in state.embedding_pool
        assert np.array_equal(state.embedding_pool["agent-001"], embedding)

    def test_add_multiple_embeddings(self):
        """Multiple agents can add embeddings."""
        state = ConsciousnessState()

        state.add_embedding("agent-001", np.array([1.0, 0.0]))
        state.add_embedding("agent-002", np.array([0.0, 1.0]))
        state.add_embedding("agent-003", np.array([0.5, 0.5]))

        assert len(state.embedding_pool) == 3
        assert np.array_equal(state.embedding_pool["agent-001"], np.array([1.0, 0.0]))
        assert np.array_equal(state.embedding_pool["agent-002"], np.array([0.0, 1.0]))

    def test_update_embedding_replaces_existing(self):
        """update_embedding replaces existing embedding for same agent."""
        state = ConsciousnessState()

        state.add_embedding("agent-001", np.array([1.0, 0.0]))
        state.update_embedding("agent-001", np.array([0.0, 1.0]))

        assert len(state.embedding_pool) == 1
        assert np.array_equal(state.embedding_pool["agent-001"], np.array([0.0, 1.0]))

    def test_update_embedding_adds_if_not_exists(self):
        """update_embedding adds embedding if agent not in pool."""
        state = ConsciousnessState()

        state.update_embedding("agent-001", np.array([0.5, 0.5]))

        assert len(state.embedding_pool) == 1
        assert np.array_equal(state.embedding_pool["agent-001"], np.array([0.5, 0.5]))

    def test_remove_embedding_removes_from_pool(self):
        """remove_embedding removes embedding from pool."""
        state = ConsciousnessState()

        state.add_embedding("agent-001", np.array([1.0, 0.0]))
        state.add_embedding("agent-002", np.array([0.0, 1.0]))
        state.remove_embedding("agent-001")

        assert "agent-001" not in state.embedding_pool
        assert len(state.embedding_pool) == 1
        assert np.array_equal(state.embedding_pool["agent-002"], np.array([0.0, 1.0]))

    def test_remove_embedding_silent_if_not_exists(self):
        """remove_embedding is silent if agent not in pool."""
        state = ConsciousnessState()

        # Should not raise
        state.remove_embedding("nonexistent-agent")
        assert len(state.embedding_pool) == 0


class TestAttentionMap:
    """Test attention map computation."""

    def test_compute_attention_map_creates_matrix(self):
        """compute_attention_map() creates NxN matrix from embeddings."""
        state = ConsciousnessState()

        # Add normalized embeddings
        state.add_embedding("agent-001", np.array([1.0, 0.0]))
        state.add_embedding("agent-002", np.array([0.0, 1.0]))
        state.add_embedding("agent-003", np.array([0.5, 0.5]))

        attention = state.compute_attention_map()

        # Should be 3x3 matrix
        assert attention is not None
        assert attention.shape == (3, 3)
        # Diagonal should be 1.0 (self-attention = 1)
        assert np.allclose(np.diag(attention), 1.0)

    def test_compute_attention_map_uses_dot_product(self):
        """compute_attention_map uses dot product of normalized embeddings."""
        state = ConsciousnessState()

        # Orthogonal vectors - dot product should be 0
        state.add_embedding("agent-001", np.array([1.0, 0.0]))
        state.add_embedding("agent-002", np.array([0.0, 1.0]))

        attention = state.compute_attention_map()

        # Off-diagonal should be 0 for orthogonal vectors
        assert np.isclose(attention[0, 1], 0.0)
        assert np.isclose(attention[1, 0], 0.0)

    def test_compute_attention_map_normalizes_embeddings(self):
        """compute_attention_map normalizes embeddings before dot product."""
        state = ConsciousnessState()

        # Non-unit vectors that are parallel
        state.add_embedding("agent-001", np.array([3.0, 4.0]))  # norm = 5
        state.add_embedding("agent-002", np.array([6.0, 8.0]))  # norm = 10

        attention = state.compute_attention_map()

        # After normalization, both point in same direction -> dot = 1.0
        assert np.isclose(attention[0, 1], 1.0)
        assert np.isclose(attention[1, 0], 1.0)

    def test_compute_attention_map_handles_empty_state(self):
        """compute_attention_map() handles empty state."""
        state = ConsciousnessState()

        attention = state.compute_attention_map()

        assert attention is None

    def test_compute_attention_map_single_embedding(self):
        """compute_attention_map handles single embedding."""
        state = ConsciousnessState()

        state.add_embedding("agent-001", np.array([1.0, 2.0, 3.0]))
        attention = state.compute_attention_map()

        # 1x1 matrix with value 1.0
        assert attention is not None
        assert attention.shape == (1, 1)
        assert np.isclose(attention[0, 0], 1.0)

    def test_compute_attention_map_updates_internal_state(self):
        """compute_attention_map updates the internal attention_map attribute."""
        state = ConsciousnessState()

        state.add_embedding("agent-001", np.array([1.0, 0.0]))
        state.add_embedding("agent-002", np.array([0.0, 1.0]))

        attention = state.compute_attention_map()

        assert state.attention_map is attention


class TestThoughtStream:
    """Test thought stream operations."""

    def test_add_thought_adds_to_stream(self):
        """add_thought() adds to stream."""
        state = ConsciousnessState()
        thought = Thought(
            agent_id="agent-001",
            thought_type=ThoughtType.EMBEDDING,
            content=np.array([0.1, 0.2])
        )

        state.add_thought(thought)

        assert len(state.thought_stream) == 1
        assert state.thought_stream[0] == thought

    def test_add_thought_respects_max_thoughts_limit(self):
        """thought stream respects max_thoughts limit."""
        state = ConsciousnessState(max_thoughts=5)

        for i in range(10):
            thought = Thought(
                agent_id=f"agent-{i:03d}",
                thought_type=ThoughtType.EMBEDDING,
                content=np.array([float(i)])
            )
            state.add_thought(thought)

        # Should only keep last 5
        assert len(state.thought_stream) == 5
        # First thought should be agent-005 (oldest kept)
        assert state.thought_stream[0].agent_id == "agent-005"
        # Last thought should be agent-009 (newest)
        assert state.thought_stream[-1].agent_id == "agent-009"

    def test_add_multiple_thoughts_maintains_order(self):
        """Thoughts are maintained in insertion order."""
        state = ConsciousnessState()

        thoughts = [
            Thought(
                agent_id=f"agent-{i:03d}",
                thought_type=ThoughtType.EMBEDDING,
                content=np.array([float(i)])
            )
            for i in range(5)
        ]

        for thought in thoughts:
            state.add_thought(thought)

        for i, thought in enumerate(state.thought_stream):
            assert thought.agent_id == f"agent-{i:03d}"


class TestGetRecentThoughts:
    """Test get_recent_thoughts filtering."""

    def test_get_recent_thoughts_filters_by_type(self):
        """get_recent_thoughts() filters by type."""
        state = ConsciousnessState()

        # Add thoughts of different types
        state.add_thought(Thought(
            agent_id="agent-001",
            thought_type=ThoughtType.EMBEDDING,
            content=np.array([1.0])
        ))
        state.add_thought(Thought(
            agent_id="agent-002",
            thought_type=ThoughtType.ATTENTION,
            content=np.array([0.5])
        ))
        state.add_thought(Thought(
            agent_id="agent-003",
            thought_type=ThoughtType.EMBEDDING,
            content=np.array([0.8])
        ))
        state.add_thought(Thought(
            agent_id="agent-004",
            thought_type=ThoughtType.QUERY,
            content=np.array([0.2])
        ))

        embeddings = state.get_recent_thoughts(thought_type=ThoughtType.EMBEDDING)

        assert len(embeddings) == 2
        assert all(t.thought_type == ThoughtType.EMBEDDING for t in embeddings)

    def test_get_recent_thoughts_returns_all_if_no_filter(self):
        """get_recent_thoughts returns all if no type filter."""
        state = ConsciousnessState()

        for i, ttype in enumerate([ThoughtType.EMBEDDING, ThoughtType.ATTENTION,
                                    ThoughtType.INFERENCE, ThoughtType.QUERY]):
            state.add_thought(Thought(
                agent_id=f"agent-{i:03d}",
                thought_type=ttype,
                content=np.array([float(i)])
            ))

        all_thoughts = state.get_recent_thoughts()

        assert len(all_thoughts) == 4

    def test_get_recent_thoughts_respects_limit(self):
        """get_recent_thoughts respects limit parameter."""
        state = ConsciousnessState()

        for i in range(10):
            state.add_thought(Thought(
                agent_id=f"agent-{i:03d}",
                thought_type=ThoughtType.EMBEDDING,
                content=np.array([float(i)])
            ))

        recent = state.get_recent_thoughts(limit=5)

        assert len(recent) == 5
        # Should be the most recent (last 5)
        assert recent[0].agent_id == "agent-005"
        assert recent[-1].agent_id == "agent-009"

    def test_get_recent_thoughts_empty_state(self):
        """get_recent_thoughts handles empty state."""
        state = ConsciousnessState()

        thoughts = state.get_recent_thoughts()

        assert thoughts == []

    def test_get_recent_thoughts_no_matches_for_type(self):
        """get_recent_thoughts returns empty list if no matches."""
        state = ConsciousnessState()

        state.add_thought(Thought(
            agent_id="agent-001",
            thought_type=ThoughtType.EMBEDDING,
            content=np.array([1.0])
        ))

        queries = state.get_recent_thoughts(thought_type=ThoughtType.QUERY)

        assert queries == []


class TestConsensusState:
    """Test consensus state operations."""

    def test_consensus_state_stores_values(self):
        """consensus_state can store arbitrary values."""
        state = ConsciousnessState()

        state.consensus_state["shared_goal"] = "optimize_performance"
        state.consensus_state["agreed_params"] = {"learning_rate": 0.001}

        assert state.consensus_state["shared_goal"] == "optimize_performance"
        assert state.consensus_state["agreed_params"]["learning_rate"] == 0.001

    def test_update_consensus(self):
        """update_consensus updates consensus state."""
        state = ConsciousnessState()

        state.update_consensus("key1", "value1")
        state.update_consensus("key2", {"nested": "data"})

        assert state.consensus_state["key1"] == "value1"
        assert state.consensus_state["key2"]["nested"] == "data"

    def test_get_consensus_returns_default_if_missing(self):
        """get_consensus returns default if key missing."""
        state = ConsciousnessState()

        result = state.get_consensus("nonexistent", default="default_value")

        assert result == "default_value"


class TestConsciousnessStateIntegration:
    """Integration tests for ConsciousnessState."""

    def test_full_workflow(self):
        """Test a complete workflow with embeddings, attention, and thoughts."""
        state = ConsciousnessState(max_thoughts=100)

        # Add agent embeddings
        state.add_embedding("agent-001", np.array([1.0, 0.0, 0.0]))
        state.add_embedding("agent-002", np.array([0.0, 1.0, 0.0]))
        state.add_embedding("agent-003", np.array([0.0, 0.0, 1.0]))

        # Compute attention
        attention = state.compute_attention_map()
        assert attention.shape == (3, 3)

        # Add thoughts
        for i in range(5):
            thought = Thought(
                agent_id=f"agent-00{i}",
                thought_type=ThoughtType.INFERENCE if i % 2 == 0 else ThoughtType.QUERY,
                content=np.random.rand(3)
            )
            state.add_thought(thought)

        # Filter thoughts
        inferences = state.get_recent_thoughts(thought_type=ThoughtType.INFERENCE)
        assert len(inferences) == 3  # indices 0, 2, 4

        # Update consensus
        state.update_consensus("active_agents", 3)
        assert state.get_consensus("active_agents") == 3

        # Remove an agent
        state.remove_embedding("agent-002")
        assert len(state.embedding_pool) == 2

    def test_state_serialization(self):
        """ConsciousnessState can be serialized to dict."""
        state = ConsciousnessState()

        state.add_embedding("agent-001", np.array([1.0, 0.0]))
        state.compute_attention_map()
        state.update_consensus("test_key", "test_value")
        state.add_thought(Thought(
            agent_id="agent-001",
            thought_type=ThoughtType.EMBEDDING,
            content=np.array([1.0, 0.0])
        ))

        data = state.to_dict()

        assert "embedding_pool" in data
        assert "attention_map" in data
        assert "consensus_state" in data
        assert "thought_stream" in data
        assert "agent-001" in data["embedding_pool"]
        assert data["consensus_state"]["test_key"] == "test_value"

    def test_state_deserialization(self):
        """ConsciousnessState can be restored from dict."""
        original = ConsciousnessState()

        original.add_embedding("agent-001", np.array([1.0, 0.0]))
        original.add_embedding("agent-002", np.array([0.0, 1.0]))
        original.compute_attention_map()
        original.update_consensus("goal", "test")
        original.add_thought(Thought(
            agent_id="agent-001",
            thought_type=ThoughtType.EMBEDDING,
            content=np.array([1.0, 0.0])
        ))

        data = original.to_dict()
        restored = ConsciousnessState.from_dict(data)

        assert len(restored.embedding_pool) == 2
        assert np.array_equal(restored.embedding_pool["agent-001"], np.array([1.0, 0.0]))
        assert restored.consensus_state["goal"] == "test"
        assert len(restored.thought_stream) == 1
