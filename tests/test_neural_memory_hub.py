"""
Tests for NeuralMemoryHub.

Task 2 of Distributed Neural Memory Plan (Phase 27).
"""
import pytest
import asyncio
import time
import numpy as np
from unittest.mock import AsyncMock, MagicMock

from systems.evolution_daemon.neural_memory_hub import (
    NeuralMemoryHub,
    get_neural_memory_hub
)
from systems.evolution_daemon.neural_event import NeuralEvent, EventType


class TestNeuralMemoryHub:
    """Tests for NeuralMemoryHub service."""

    @pytest.fixture
    def hub(self):
        """Create a fresh hub for each test."""
        return NeuralMemoryHub(max_events=100, max_age_seconds=60.0)

    @pytest.fixture
    def sample_event(self):
        """Create a sample NeuralEvent for testing."""
        return NeuralEvent(
            tile_id="tile-001",
            shell_tokens=["ls", "-la", "/home"],
            cpu_jitter=0.15,
            memory_delta=50.0,
            io_frequency=10.0,
            broadcast=True
        )

    @pytest.fixture
    def sample_event_2(self):
        """Create a second sample NeuralEvent."""
        return NeuralEvent(
            tile_id="tile-002",
            shell_tokens=["cat", "/etc/hosts"],
            cpu_jitter=0.25,
            memory_delta=30.0,
            io_frequency=5.0,
            broadcast=True
        )

    @pytest.mark.asyncio
    async def test_store_event(self, hub, sample_event):
        """Test storing an event in the hub."""
        await hub.store_event(sample_event)

        assert len(hub.events) == 1
        assert hub.events[0].tile_id == "tile-001"

    @pytest.mark.asyncio
    async def test_store_event_max_limit(self, hub):
        """Test that hub enforces max_events limit (FIFO)."""
        hub.max_events = 5

        for i in range(10):
            event = NeuralEvent(
                tile_id=f"tile-{i}",
                shell_tokens=["test"],
                cpu_jitter=0.1,
                memory_delta=10.0,
                io_frequency=1.0,
                broadcast=False
            )
            await hub.store_event(event)

        assert len(hub.events) == 5
        # First 5 events should be removed (FIFO)
        assert hub.events[0].tile_id == "tile-5"
        assert hub.events[-1].tile_id == "tile-9"

    @pytest.mark.asyncio
    async def test_find_similar_events(self, hub, sample_event, sample_event_2):
        """Test finding similar events using cosine similarity."""
        await hub.store_event(sample_event)
        await hub.store_event(sample_event_2)

        # Create a query similar to sample_event
        query = NeuralEvent(
            tile_id="tile-003",
            shell_tokens=["ls", "-la", "/var"],  # Similar to sample_event
            cpu_jitter=0.14,  # Close to 0.15
            memory_delta=48.0,  # Close to 50.0
            io_frequency=11.0,  # Close to 10.0
            broadcast=False
        )

        similar = await hub.find_similar(query, limit=5, exclude_tile="tile-003")

        assert len(similar) >= 1
        # Should find sample_event (similar shell_tokens and metrics)
        tile_ids = [e.tile_id for e in similar]
        assert "tile-001" in tile_ids

    @pytest.mark.asyncio
    async def test_find_similar_exclude_tile(self, hub, sample_event):
        """Test that find_similar excludes specified tile."""
        await hub.store_event(sample_event)

        # Query with same tile_id should be excluded
        query = NeuralEvent(
            tile_id="tile-001",  # Same as sample_event
            shell_tokens=["test"],
            cpu_jitter=0.1,
            memory_delta=10.0,
            io_frequency=1.0,
            broadcast=False
        )

        similar = await hub.find_similar(query, exclude_tile="tile-001")
        assert len(similar) == 0

    @pytest.mark.asyncio
    async def test_find_similar_no_vector(self, hub):
        """Test find_similar with event without vector."""
        event = NeuralEvent(
            tile_id="tile-no-vec",
            shell_tokens=[],
            cpu_jitter=0.0,
            memory_delta=0.0,
            io_frequency=0.0,
            broadcast=True
        )
        # Manually clear the vector
        event.event_vector = None
        await hub.store_event(event)

        query = NeuralEvent(
            tile_id="query",
            shell_tokens=["test"],
            cpu_jitter=0.1,
            memory_delta=10.0,
            io_frequency=1.0,
            broadcast=False
        )

        similar = await hub.find_similar(query)
        # Should not match events without vectors
        assert len(similar) == 0

    @pytest.mark.asyncio
    async def test_get_collective_context(self, hub, sample_event, sample_event_2):
        """Test getting collective context for a tile."""
        await hub.store_event(sample_event)
        await hub.store_event(sample_event_2)

        context = await hub.get_collective_context("tile-001", context_limit=3)

        assert "recent_events" in context
        assert "similar_tiles" in context
        assert "similar_events" in context
        assert "total_memory_size" in context
        assert "timestamp" in context

        assert context["total_memory_size"] == 2
        # Recent events should not include tile-001's own events
        for event_dict in context["recent_events"]:
            assert event_dict["tile_id"] != "tile-001"

    @pytest.mark.asyncio
    async def test_get_collective_context_no_own_events(self, hub, sample_event):
        """Test collective context when tile has no events yet."""
        await hub.store_event(sample_event)

        context = await hub.get_collective_context("tile-new", context_limit=3)

        assert context["total_memory_size"] == 1
        # Should still work even without own events
        assert isinstance(context["recent_events"], list)

    @pytest.mark.asyncio
    async def test_broadcast_filter(self, hub):
        """Test that non-broadcast events are filtered from similarity search."""
        # Store broadcast event
        broadcast_event = NeuralEvent(
            tile_id="tile-broadcast",
            shell_tokens=["test", "broadcast"],
            cpu_jitter=0.1,
            memory_delta=10.0,
            io_frequency=1.0,
            broadcast=True
        )
        await hub.store_event(broadcast_event)

        # Store non-broadcast event
        private_event = NeuralEvent(
            tile_id="tile-private",
            shell_tokens=["test", "private"],
            cpu_jitter=0.1,
            memory_delta=10.0,
            io_frequency=1.0,
            broadcast=False
        )
        await hub.store_event(private_event)

        query = NeuralEvent(
            tile_id="query",
            shell_tokens=["test"],
            cpu_jitter=0.1,
            memory_delta=10.0,
            io_frequency=1.0,
            broadcast=False
        )

        similar = await hub.find_similar(query)

        # Should only find broadcast event
        tile_ids = [e.tile_id for e in similar]
        assert "tile-broadcast" in tile_ids or len(similar) == 0
        assert "tile-private" not in tile_ids

    @pytest.mark.asyncio
    async def test_get_broadcast_events(self, hub):
        """Test getting all broadcast events."""
        for i in range(5):
            event = NeuralEvent(
                tile_id=f"tile-{i}",
                shell_tokens=["test"],
                cpu_jitter=0.1,
                memory_delta=10.0,
                io_frequency=1.0,
                broadcast=(i % 2 == 0)  # Even indices broadcast
            )
            await hub.store_event(event)

        broadcast = await hub.get_broadcast_events()

        assert len(broadcast) == 3  # tiles 0, 2, 4
        for event in broadcast:
            assert event.broadcast is True

    @pytest.mark.asyncio
    async def test_event_expiry(self, hub):
        """Test cleanup of expired events."""
        hub.max_age_seconds = 0.1  # 100ms expiry

        # Store event
        event = NeuralEvent(
            tile_id="tile-expire",
            shell_tokens=["test"],
            cpu_jitter=0.1,
            memory_delta=10.0,
            io_frequency=1.0,
            broadcast=True
        )
        await hub.store_event(event)

        assert len(hub.events) == 1

        # Wait for expiry
        await asyncio.sleep(0.2)

        removed = await hub.cleanup_expired()

        assert removed == 1
        assert len(hub.events) == 0

    @pytest.mark.asyncio
    async def test_set_webmcp(self, hub, sample_event):
        """Test WebMCP integration for broadcasting."""
        mock_webmcp = MagicMock()
        mock_webmcp.broadcast_event = AsyncMock()

        hub.set_webmcp(mock_webmcp)

        # Store a broadcast event
        await hub.store_event(sample_event)

        # Should have called broadcast
        mock_webmcp.broadcast_event.assert_called_once()
        call_args = mock_webmcp.broadcast_event.call_args
        assert call_args[0][0] == "neural_event"
        assert call_args[0][1]["tile_id"] == "tile-001"

    @pytest.mark.asyncio
    async def test_cosine_similarity(self, hub):
        """Test cosine similarity calculation."""
        # Identical vectors
        a = np.array([1.0, 0.0, 0.0])
        b = np.array([1.0, 0.0, 0.0])
        assert hub._cosine_similarity(a, b) == pytest.approx(1.0, abs=0.01)

        # Orthogonal vectors
        c = np.array([0.0, 1.0, 0.0])
        assert hub._cosine_similarity(a, c) == pytest.approx(0.0, abs=0.01)

        # Opposite vectors
        d = np.array([-1.0, 0.0, 0.0])
        assert hub._cosine_similarity(a, d) == pytest.approx(-1.0, abs=0.01)

        # Zero vector
        zero = np.array([0.0, 0.0, 0.0])
        assert hub._cosine_similarity(a, zero) == 0.0


class TestGetNeuralMemoryHub:
    """Tests for module-level hub getter."""

    def test_get_hub_singleton(self):
        """Test that get_neural_memory_hub returns singleton."""
        from systems.evolution_daemon import neural_memory_hub

        # Reset singleton
        neural_memory_hub._hub = None

        hub1 = get_neural_memory_hub()
        hub2 = get_neural_memory_hub()

        assert hub1 is hub2


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
