"""Tests for ThoughtEngine.

Task 2: ThoughtEngine
- Initializes with agent_id and embedding_dim (default 384)
- generate_embedding(text) returns a Thought with type EMBEDDING
- Same input produces same embedding (deterministic)
- compute_attention(query, context) returns attention weights that sum to 1.0
- compute_attention raises ValueError for empty context
"""

import pytest
import numpy as np

from systems.visual_shell.swarm.consciousness.thought_engine import ThoughtEngine
from systems.visual_shell.swarm.consciousness.thought import Thought, ThoughtType


class TestThoughtEngineInit:
    """Tests for ThoughtEngine initialization."""

    def test_thought_engine_initialization(self):
        """ThoughtEngine initializes with agent_id and embedding_dim."""
        engine = ThoughtEngine(agent_id="agent-1", embedding_dim=128)
        assert engine.agent_id == "agent-1"
        assert engine.embedding_dim == 128

    def test_thought_engine_default_embedding_dim(self):
        """ThoughtEngine has default embedding dimension."""
        engine = ThoughtEngine(agent_id="agent-2")
        assert engine.embedding_dim == 384  # sentence-transformers default


class TestThoughtEngineEmbedding:
    """Tests for embedding generation."""

    @pytest.mark.asyncio
    async def test_generate_embedding(self):
        """generate_embedding(text) returns a Thought with type EMBEDDING."""
        engine = ThoughtEngine(agent_id="agent-1", embedding_dim=64)
        thought = await engine.generate_embedding("hello world")

        assert thought.agent_id == "agent-1"
        assert thought.thought_type == ThoughtType.EMBEDDING
        assert thought.content is not None
        assert thought.content.shape == (64,)
        assert thought.confidence == 1.0

    @pytest.mark.asyncio
    async def test_embedding_deterministic(self):
        """Same input produces same embedding (deterministic)."""
        engine = ThoughtEngine(agent_id="agent-2", embedding_dim=32)
        thought1 = await engine.generate_embedding("test input")
        thought2 = await engine.generate_embedding("test input")

        np.testing.assert_array_equal(thought1.content, thought2.content)

    @pytest.mark.asyncio
    async def test_embedding_normalized(self):
        """Embedding is normalized to unit vector."""
        engine = ThoughtEngine(agent_id="agent-3", embedding_dim=64)
        thought = await engine.generate_embedding("normalize test")

        norm = np.linalg.norm(thought.content)
        assert abs(norm - 1.0) < 1e-6

    @pytest.mark.asyncio
    async def test_different_inputs_different_embeddings(self):
        """Different inputs produce different embeddings."""
        engine = ThoughtEngine(agent_id="agent-4", embedding_dim=32)
        thought1 = await engine.generate_embedding("first text")
        thought2 = await engine.generate_embedding("second text")

        # Embeddings should be different
        assert not np.allclose(thought1.content, thought2.content)


class TestThoughtEngineAttention:
    """Tests for attention computation."""

    @pytest.mark.asyncio
    async def test_compute_attention(self):
        """compute_attention(query, context) returns attention weights that sum to 1.0."""
        engine = ThoughtEngine(agent_id="agent-1", embedding_dim=64)

        # Create context thoughts
        context = [
            await engine.generate_embedding("context one"),
            await engine.generate_embedding("context two"),
            await engine.generate_embedding("context three"),
        ]

        query = await engine.generate_embedding("query text")
        attention = await engine.compute_attention(query, context)

        assert attention.agent_id == "agent-1"
        assert attention.thought_type == ThoughtType.ATTENTION
        assert attention.content is not None
        assert attention.content.shape == (3,)
        assert abs(sum(attention.content) - 1.0) < 1e-6  # Softmax sums to 1

    @pytest.mark.asyncio
    async def test_attention_empty_context_raises_error(self):
        """compute_attention raises ValueError for empty context."""
        engine = ThoughtEngine(agent_id="agent-2", embedding_dim=32)
        query = await engine.generate_embedding("query")

        with pytest.raises(ValueError, match="Context cannot be empty"):
            await engine.compute_attention(query, [])

    @pytest.mark.asyncio
    async def test_attention_weights_non_negative(self):
        """Attention weights are all non-negative."""
        engine = ThoughtEngine(agent_id="agent-3", embedding_dim=32)

        context = [
            await engine.generate_embedding("context a"),
            await engine.generate_embedding("context b"),
        ]
        query = await engine.generate_embedding("query")

        attention = await engine.compute_attention(query, context)

        assert all(w >= 0 for w in attention.content)

    @pytest.mark.asyncio
    async def test_attention_metadata_contains_ids(self):
        """Attention thought metadata contains query and context IDs."""
        engine = ThoughtEngine(agent_id="agent-4", embedding_dim=32)

        context = [
            await engine.generate_embedding("context a"),
            await engine.generate_embedding("context b"),
        ]
        query = await engine.generate_embedding("query")

        attention = await engine.compute_attention(query, context)

        assert "query_id" in attention.metadata
        assert attention.metadata["query_id"] == query.thought_id
        assert "context_ids" in attention.metadata
        assert len(attention.metadata["context_ids"]) == 2
