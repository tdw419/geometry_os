"""Tests for ThoughtBroadcaster."""
import pytest
import asyncio
import numpy as np
from systems.visual_shell.swarm.consciousness.thought_broadcaster import (
    ThoughtBroadcaster,
)
from systems.visual_shell.swarm.consciousness.thought import Thought, ThoughtType


class TestThoughtBroadcasterInit:
    """Tests for ThoughtBroadcaster initialization."""

    def test_broadcaster_initialization(self):
        """ThoughtBroadcaster initializes with agent_id."""
        broadcaster = ThoughtBroadcaster(agent_id="agent-1")
        assert broadcaster.agent_id == "agent-1"
        assert broadcaster.rate_limits is not None

    def test_broadcaster_default_rate_limits(self):
        """ThoughtBroadcaster has default rate limits."""
        broadcaster = ThoughtBroadcaster(agent_id="agent-2")
        assert broadcaster.rate_limits[ThoughtType.EMBEDDING] == 10
        assert broadcaster.rate_limits[ThoughtType.ATTENTION] == 50
        assert broadcaster.rate_limits[ThoughtType.INFERENCE] == 5
        assert broadcaster.rate_limits[ThoughtType.QUERY] == 2


class TestThoughtBroadcasterRateLimiting:
    """Tests for rate limiting."""

    @pytest.mark.asyncio
    async def test_rate_limit_allows_within_limit(self):
        """Broadcasts within rate limit succeed."""
        broadcaster = ThoughtBroadcaster(agent_id="agent-1")

        # Should allow up to 10 EMBEDDING broadcasts
        for _ in range(10):
            thought = Thought(
                agent_id="agent-1",
                thought_type=ThoughtType.EMBEDDING,
                content=np.array([1.0, 2.0]),
            )
            allowed = broadcaster.check_rate_limit(thought)
            assert allowed is True

    @pytest.mark.asyncio
    async def test_rate_limit_blocks_over_limit(self):
        """Broadcasts over rate limit are blocked."""
        broadcaster = ThoughtBroadcaster(agent_id="agent-1")

        # Exhaust QUERY rate limit (2 per second)
        for _ in range(3):
            thought = Thought(
                agent_id="agent-1",
                thought_type=ThoughtType.QUERY,
                content=np.array([1.0]),
            )
            broadcaster.record_broadcast(thought)

        # Next should be blocked
        thought = Thought(
            agent_id="agent-1",
            thought_type=ThoughtType.QUERY,
            content=np.array([1.0]),
        )
        allowed = broadcaster.check_rate_limit(thought)
        assert allowed is False


class TestThoughtBroadcasterSerialization:
    """Tests for thought serialization."""

    def test_serialize_thought(self):
        """Thought can be serialized for transmission."""
        broadcaster = ThoughtBroadcaster(agent_id="agent-1")
        thought = Thought(
            agent_id="agent-1",
            thought_type=ThoughtType.EMBEDDING,
            content=np.array([0.1, 0.2, 0.3]),
            confidence=0.9,
        )

        serialized = broadcaster.serialize(thought)
        assert isinstance(serialized, bytes)
        assert len(serialized) > 0

    def test_deserialize_thought(self):
        """Serialized thought can be deserialized."""
        broadcaster = ThoughtBroadcaster(agent_id="agent-1")
        original = Thought(
            agent_id="agent-1",
            thought_type=ThoughtType.ATTENTION,
            content=np.array([0.25, 0.5, 0.25]),
            confidence=0.8,
            metadata={"key": "value"},
        )

        serialized = broadcaster.serialize(original)
        restored = broadcaster.deserialize(serialized)

        assert restored.thought_id == original.thought_id
        assert restored.thought_type == original.thought_type
        np.testing.assert_array_almost_equal(restored.content, original.content)
        assert restored.confidence == original.confidence
