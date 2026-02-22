"""ThoughtBroadcaster for routing thoughts via A2A."""
import json
import time
from typing import Dict, List, Set
from collections import defaultdict

from .thought import Thought, ThoughtType


class ThoughtBroadcaster:
    """Broadcasts thoughts to other agents via A2A with rate limiting."""

    DEFAULT_RATE_LIMITS = {
        ThoughtType.EMBEDDING: 10,  # per second
        ThoughtType.ATTENTION: 50,
        ThoughtType.INFERENCE: 5,
        ThoughtType.QUERY: 2,
    }

    def __init__(
        self,
        agent_id: str,
        rate_limits: Dict[ThoughtType, int] = None,
    ):
        """Initialize the broadcaster.

        Args:
            agent_id: ID of the agent using this broadcaster.
            rate_limits: Custom rate limits per thought type.
        """
        self.agent_id = agent_id
        self.rate_limits = rate_limits or self.DEFAULT_RATE_LIMITS.copy()
        self._broadcast_history: Dict[ThoughtType, List[float]] = defaultdict(list)
        self._neighbors: Set[str] = set()

    def check_rate_limit(self, thought: Thought) -> bool:
        """Check if broadcast is allowed under rate limit.

        Args:
            thought: Thought to broadcast.

        Returns:
            True if broadcast is allowed, False if rate limited.
        """
        now = time.time()
        thought_type = thought.thought_type
        limit = self.rate_limits.get(thought_type, 10)

        # Clean old entries (older than 1 second)
        self._broadcast_history[thought_type] = [
            t for t in self._broadcast_history[thought_type]
            if now - t < 1.0
        ]

        return len(self._broadcast_history[thought_type]) < limit

    def record_broadcast(self, thought: Thought) -> None:
        """Record a broadcast for rate limiting.

        Args:
            thought: Thought that was broadcast.
        """
        self._broadcast_history[thought.thought_type].append(time.time())

    def serialize(self, thought: Thought) -> bytes:
        """Serialize thought for transmission.

        Args:
            thought: Thought to serialize.

        Returns:
            Serialized bytes.
        """
        data = thought.to_dict()
        return json.dumps(data).encode("utf-8")

    def deserialize(self, data: bytes) -> Thought:
        """Deserialize thought from transmission.

        Args:
            data: Serialized bytes.

        Returns:
            Deserialized Thought.
        """
        dict_data = json.loads(data.decode("utf-8"))
        return Thought.from_dict(dict_data)

    def add_neighbor(self, agent_id: str) -> None:
        """Add a neighbor for broadcasting.

        Args:
            agent_id: ID of neighbor agent.
        """
        self._neighbors.add(agent_id)

    def remove_neighbor(self, agent_id: str) -> None:
        """Remove a neighbor.

        Args:
            agent_id: ID of neighbor to remove.
        """
        self._neighbors.discard(agent_id)

    def get_neighbors(self) -> Set[str]:
        """Get current neighbors.

        Returns:
            Set of neighbor agent IDs.
        """
        return self._neighbors.copy()
