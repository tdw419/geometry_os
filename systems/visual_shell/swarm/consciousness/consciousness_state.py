"""
ConsciousnessState - Global consciousness state for the Collective Consciousness.

Task 4: ConsciousnessState implementation for maintaining:
- embedding_pool: Dict[str, np.ndarray] for agent embeddings
- attention_map: Optional[np.ndarray] NxN matrix
- consensus_state: Dict[str, Any] for shared agreement
- thought_stream: deque with maxlen for recent thoughts

The attention map is computed using dot product of L2-normalized embeddings.
"""

from collections import deque
from typing import Any, Dict, List, Optional

import numpy as np

from systems.visual_shell.swarm.consciousness import Thought, ThoughtType


class ConsciousnessState:
    """
    Global consciousness state for the collective agent swarm.

    Maintains a shared state that all agents can read from and write to,
    enabling collective awareness and attention across the swarm.

    Attributes:
        max_thoughts: Maximum number of thoughts to keep in the stream.
        embedding_pool: Agent ID -> embedding vector mapping.
        attention_map: NxN attention matrix computed from embeddings.
        consensus_state: Shared key-value store for agreed-upon state.
        thought_stream: Deque of recent thoughts (limited by max_thoughts).

    Example:
        >>> state = ConsciousnessState(max_thoughts=100)
        >>> state.add_embedding("agent-001", np.array([1.0, 0.0]))
        >>> state.add_embedding("agent-002", np.array([0.0, 1.0]))
        >>> attention = state.compute_attention_map()
        >>> attention.shape
        (2, 2)
    """

    def __init__(self, max_thoughts: int = 1000):
        """
        Initialize an empty consciousness state.

        Args:
            max_thoughts: Maximum number of thoughts to retain in the stream.
                         Older thoughts are discarded when the limit is reached.
        """
        self.max_thoughts = max_thoughts
        self.embedding_pool: Dict[str, np.ndarray] = {}
        self.attention_map: Optional[np.ndarray] = None
        self.consensus_state: Dict[str, Any] = {}
        self.thought_stream: deque = deque(maxlen=max_thoughts)

    def add_embedding(self, agent_id: str, embedding: np.ndarray) -> None:
        """
        Add an agent's embedding to the pool.

        If the agent already has an embedding, this will NOT replace it.
        Use update_embedding() to replace an existing embedding.

        Args:
            agent_id: Unique identifier for the agent.
            embedding: Numpy array representing the agent's embedding vector.
        """
        self.embedding_pool[agent_id] = embedding

    def update_embedding(self, agent_id: str, embedding: np.ndarray) -> None:
        """
        Update or add an agent's embedding in the pool.

        Unlike add_embedding, this will replace an existing embedding.

        Args:
            agent_id: Unique identifier for the agent.
            embedding: Numpy array representing the agent's embedding vector.
        """
        self.embedding_pool[agent_id] = embedding

    def remove_embedding(self, agent_id: str) -> None:
        """
        Remove an agent's embedding from the pool.

        Silently succeeds if the agent is not in the pool.

        Args:
            agent_id: Unique identifier for the agent to remove.
        """
        self.embedding_pool.pop(agent_id, None)

    def compute_attention_map(self) -> Optional[np.ndarray]:
        """
        Compute the NxN attention matrix from agent embeddings.

        Uses dot product of L2-normalized embeddings to compute pairwise
        attention scores. The result is a symmetric matrix where:
        - Diagonal elements are 1.0 (self-attention)
        - Off-diagonal elements are in [-1, 1] (cosine similarity)

        Returns:
            NxN numpy array of attention scores, or None if no embeddings.

        Example:
            >>> state = ConsciousnessState()
            >>> state.add_embedding("a", np.array([1.0, 0.0]))
            >>> state.add_embedding("b", np.array([0.0, 1.0]))
            >>> attention = state.compute_attention_map()
            >>> attention[0, 0]  # self-attention
            1.0
            >>> attention[0, 1]  # orthogonal vectors
            0.0
        """
        if not self.embedding_pool:
            self.attention_map = None
            return None

        # Stack embeddings into matrix (N x D)
        embeddings = np.stack(list(self.embedding_pool.values()))
        n_agents = embeddings.shape[0]

        # L2 normalize each embedding
        norms = np.linalg.norm(embeddings, axis=1, keepdims=True)
        # Avoid division by zero
        norms = np.where(norms == 0, 1, norms)
        normalized = embeddings / norms

        # Compute attention via dot product
        self.attention_map = normalized @ normalized.T

        return self.attention_map

    def add_thought(self, thought: Thought) -> None:
        """
        Add a thought to the thought stream.

        If the stream is at capacity, the oldest thought is automatically
        discarded.

        Args:
            thought: A Thought instance to add to the stream.
        """
        self.thought_stream.append(thought)

    def get_recent_thoughts(
        self,
        thought_type: Optional[ThoughtType] = None,
        limit: Optional[int] = None
    ) -> List[Thought]:
        """
        Get recent thoughts from the stream, optionally filtered by type.

        Args:
            thought_type: If provided, only return thoughts of this type.
            limit: If provided, return at most this many thoughts.

        Returns:
            List of Thought instances, newest last.

        Example:
            >>> state = ConsciousnessState()
            >>> state.add_thought(Thought("a", ThoughtType.EMBEDDING, np.array([1])))
            >>> state.add_thought(Thought("b", ThoughtType.QUERY, np.array([2])))
            >>> state.get_recent_thoughts(ThoughtType.EMBEDDING)
            [Thought(agent_id='a', ...)]
        """
        if thought_type is not None:
            thoughts = [
                t for t in self.thought_stream
                if t.thought_type == thought_type
            ]
        else:
            thoughts = list(self.thought_stream)

        if limit is not None:
            thoughts = thoughts[-limit:]

        return thoughts

    def update_consensus(self, key: str, value: Any) -> None:
        """
        Update the consensus state with a key-value pair.

        Args:
            key: The key to set.
            value: The value to associate with the key.
        """
        self.consensus_state[key] = value

    def get_consensus(self, key: str, default: Any = None) -> Any:
        """
        Get a value from the consensus state.

        Args:
            key: The key to look up.
            default: Value to return if key is not found.

        Returns:
            The value associated with the key, or default if not found.
        """
        return self.consensus_state.get(key, default)

    def to_dict(self) -> Dict[str, Any]:
        """
        Serialize the consciousness state to a dictionary.

        Numpy arrays are converted to lists for JSON compatibility.

        Returns:
            Dictionary representation of the state.
        """
        return {
            "max_thoughts": self.max_thoughts,
            "embedding_pool": {
                k: v.tolist() for k, v in self.embedding_pool.items()
            },
            "attention_map": (
                self.attention_map.tolist()
                if self.attention_map is not None
                else None
            ),
            "consensus_state": self.consensus_state,
            "thought_stream": [t.to_dict() for t in self.thought_stream],
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "ConsciousnessState":
        """
        Deserialize a consciousness state from a dictionary.

        Args:
            data: Dictionary containing serialized state data.

        Returns:
            A new ConsciousnessState instance.
        """
        state = cls(max_thoughts=data.get("max_thoughts", 1000))

        # Restore embedding pool
        for agent_id, embedding_list in data.get("embedding_pool", {}).items():
            state.embedding_pool[agent_id] = np.array(embedding_list)

        # Restore attention map
        if data.get("attention_map") is not None:
            state.attention_map = np.array(data["attention_map"])

        # Restore consensus state
        state.consensus_state = data.get("consensus_state", {})

        # Restore thought stream
        for thought_data in data.get("thought_stream", []):
            thought = Thought.from_dict(thought_data)
            state.thought_stream.append(thought)

        return state
