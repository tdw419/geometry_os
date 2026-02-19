"""
ThoughtEngine for generating and processing thoughts.

Task 2: ThoughtEngine
- Per-agent reasoning module for generating embeddings and computing attention
- Uses hash-based deterministic embedding for testing (can be replaced with sentence-transformers)
- Computes attention weights via dot product and softmax
"""

from typing import List

import numpy as np

from systems.visual_shell.swarm.consciousness.thought import Thought, ThoughtType


class ThoughtEngine:
    """
    Per-agent reasoning module for generating and processing thoughts.

    The ThoughtEngine is responsible for:
    - Generating embeddings from text input
    - Computing attention weights over context thoughts
    - Managing local context for reasoning

    Attributes:
        agent_id: Unique identifier for the agent using this engine
        embedding_dim: Dimension of embedding vectors (default 384 for sentence-transformers)
        _local_context: List of thoughts in local context

    Example:
        >>> engine = ThoughtEngine(agent_id="agent-001", embedding_dim=64)
        >>> # Async usage:
        >>> # embedding = await engine.generate_embedding("hello world")
        >>> # attention = await engine.compute_attention(query, context)
    """

    def __init__(self, agent_id: str, embedding_dim: int = 384):
        """
        Initialize the thought engine.

        Args:
            agent_id: Unique identifier for the agent.
            embedding_dim: Dimension of embedding vectors. Default is 384,
                          which matches sentence-transformers' all-MiniLM-L6-v2.
        """
        self.agent_id = agent_id
        self.embedding_dim = embedding_dim
        self._local_context: List[Thought] = []

    async def generate_embedding(self, text: str) -> Thought:
        """
        Generate an embedding thought from text input.

        Uses a simple hash-based embedding for testing purposes.
        In production, this would use sentence-transformers or similar.

        The embedding is:
        - Deterministic (same text always produces same embedding)
        - Normalized to unit length

        Args:
            text: Input text to embed.

        Returns:
            Thought containing the embedding vector with type EMBEDDING.

        Example:
            >>> engine = ThoughtEngine(agent_id="agent-1", embedding_dim=64)
            >>> # thought = await engine.generate_embedding("hello")
            >>> # thought.thought_type == ThoughtType.EMBEDDING
        """
        # Simple deterministic embedding based on text hash
        # In production: use sentence-transformers
        np.random.seed(hash(text) % (2**32))
        embedding = np.random.randn(self.embedding_dim)
        # Normalize to unit vector
        embedding = embedding / np.linalg.norm(embedding)

        return Thought(
            agent_id=self.agent_id,
            thought_type=ThoughtType.EMBEDDING,
            content=embedding.astype(np.float32),
            confidence=1.0,
            metadata={"text": text[:100]},  # Truncate for storage
        )

    async def compute_attention(
        self, query: Thought, context: List[Thought]
    ) -> Thought:
        """
        Compute attention weights of query over context.

        Computes dot product attention scores between the query embedding
        and each context embedding, then applies softmax normalization.

        Args:
            query: Query thought containing the query embedding.
            context: List of context thoughts to attend over.

        Returns:
            Thought containing attention weights (sums to 1.0).

        Raises:
            ValueError: If context is empty.

        Example:
            >>> engine = ThoughtEngine(agent_id="agent-1", embedding_dim=64)
            >>> # query = await engine.generate_embedding("query")
            >>> # context = [await engine.generate_embedding(f"ctx{i}") for i in range(3)]
            >>> # attention = await engine.compute_attention(query, context)
            >>> # sum(attention.content) ≈ 1.0
        """
        if not context:
            raise ValueError("Context cannot be empty")

        # Get embeddings
        query_emb = query.content
        context_embs = np.array([t.content for t in context])

        # Compute dot product attention scores
        scores = context_embs @ query_emb

        # Softmax normalization (numerically stable)
        exp_scores = np.exp(scores - np.max(scores))
        attention_weights = exp_scores / exp_scores.sum()

        return Thought(
            agent_id=self.agent_id,
            thought_type=ThoughtType.ATTENTION,
            content=attention_weights.astype(np.float32),
            confidence=1.0,
            metadata={
                "query_id": query.thought_id,
                "context_ids": [t.thought_id for t in context],
            },
        )

    def add_to_context(self, thought: Thought) -> None:
        """
        Add a thought to local context.

        Args:
            thought: Thought to add to context.
        """
        self._local_context.append(thought)

    def clear_context(self) -> None:
        """Clear local context."""
        self._local_context.clear()

    def get_context(self) -> List[Thought]:
        """
        Get current local context.

        Returns:
            List of thoughts in local context.
        """
        return self._local_context.copy()
