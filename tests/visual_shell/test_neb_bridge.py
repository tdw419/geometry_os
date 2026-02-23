"""
Tests for NEBBridge - Bridge NEB events to VisualBridge for HUD streaming.
"""

import pytest
import asyncio
import time
from unittest.mock import Mock, AsyncMock, MagicMock, patch
from dataclasses import dataclass
from typing import Dict, Any, Optional, List


# Mock NEBSignal for testing without NEBBus dependency
@dataclass
class MockNEBSignal:
    """Mock NEBSignal for isolated tests."""
    source_id: str
    topic: str
    payload: Dict[str, Any] = None
    embedding: Optional[List[float]] = None
    timestamp: float = 0.0

    def __post_init__(self):
        if self.payload is None:
            self.payload = {}
        if self.timestamp == 0.0:
            self.timestamp = time.time()


class MockVisualBridge:
    """Mock VisualBridge for testing."""

    def __init__(self):
        self.broadcasts = []
        self._broadcast = AsyncMock(side_effect=self._record_broadcast)

    async def _record_broadcast(self, payload):
        """Record broadcast calls for assertions."""
        self.broadcasts.append(payload)


class TestNEBBridgeThrottle:
    """Test NEBBridge throttle logic (100ms debounce)."""

    @pytest.mark.asyncio
    async def test_throttle_prevents_rapid_broadcasts(self):
        """Broadcasts within 100ms should be throttled."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-throttle",
            throttle_ms=100,
            max_events=10
        )

        # Manually set last_broadcast to simulate recent broadcast
        bridge._last_broadcast = time.time()
        bridge._events = [{"topic": "test.event"}]

        # Try to broadcast immediately (should be throttled)
        await bridge._broadcast_summary()

        # Should not broadcast due to throttle
        assert len(visual_bridge.broadcasts) == 0

    @pytest.mark.asyncio
    async def test_throttle_allows_after_interval(self):
        """Broadcast after 100ms interval should succeed."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-throttle",
            throttle_ms=100,
            max_events=10
        )

        # Set last_broadcast to 150ms ago (past throttle interval)
        bridge._last_broadcast = time.time() - 0.150
        bridge._events = [{"topic": "test.event", "source_id": "src"}]

        # Broadcast should succeed
        await bridge._broadcast_summary()

        assert len(visual_bridge.broadcasts) == 1
        assert visual_bridge.broadcasts[0]["type"] == "NEB_EVENT_UPDATE"

    @pytest.mark.asyncio
    async def test_throttle_updates_last_broadcast_time(self):
        """After successful broadcast, last_broadcast should update."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-throttle",
            throttle_ms=100,
            max_events=10
        )

        old_time = bridge._last_broadcast
        bridge._events = [{"topic": "test.event"}]

        # Wait briefly to ensure time difference
        await asyncio.sleep(0.001)
        await bridge._broadcast_summary()

        assert bridge._last_broadcast > old_time


class TestNEBBridgeEventSummarization:
    """Test NEBBridge event summarization (events[], topicCounts{})."""

    def test_on_event_adds_to_buffer(self):
        """Events should be added to the buffer."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-summary",
            throttle_ms=100,
            max_events=10
        )

        signal = MockNEBSignal(
            source_id="node-1",
            topic="task.assigned",
            payload={"task_id": "t-001"}
        )

        bridge._on_event(signal)

        assert len(bridge._events) == 1
        assert bridge._events[0]["topic"] == "task.assigned"
        assert bridge._events[0]["source_id"] == "node-1"

    def test_topic_counts_by_prefix(self):
        """Topic counts should aggregate by first segment."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-summary",
            throttle_ms=100,
            max_events=10
        )

        # Add multiple events with different topics
        bridge._on_event(MockNEBSignal("n1", "task.created", {"id": 1}))
        bridge._on_event(MockNEBSignal("n1", "task.assigned", {"id": 2}))
        bridge._on_event(MockNEBSignal("n1", "task.completed", {"id": 3}))
        bridge._on_event(MockNEBSignal("n1", "build.started", {"id": 4}))
        bridge._on_event(MockNEBSignal("n1", "build.finished", {"id": 5}))
        bridge._on_event(MockNEBSignal("n1", "error", {"msg": "oops"}))

        # Topic counts should be by prefix
        assert bridge._topic_counts.get("task") == 3
        assert bridge._topic_counts.get("build") == 2
        assert bridge._topic_counts.get("error") == 1

    def test_total_count_increments(self):
        """Total count should track all events."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-summary",
            throttle_ms=100,
            max_events=10
        )

        assert bridge._total_count == 0

        bridge._on_event(MockNEBSignal("n1", "test.1", {}))
        assert bridge._total_count == 1

        bridge._on_event(MockNEBSignal("n1", "test.2", {}))
        assert bridge._total_count == 2

        bridge._on_event(MockNEBSignal("n1", "test.3", {}))
        assert bridge._total_count == 3

    def test_events_buffer_limited_to_max_events(self):
        """Events buffer should be limited to max_events."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-summary",
            throttle_ms=100,
            max_events=5  # Set low limit
        )

        # Add more events than max
        for i in range(10):
            bridge._on_event(MockNEBSignal("n1", f"test.{i}", {"idx": i}))

        # Buffer should only have last max_events
        assert len(bridge._events) == 5
        # Should have most recent events
        topics = [e["topic"] for e in bridge._events]
        assert "test.5" in topics
        assert "test.9" in topics
        assert "test.0" not in topics

    def test_payload_truncation(self):
        """Large payloads should be truncated for preview."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-summary",
            throttle_ms=100,
            max_events=10
        )

        large_payload = {"data": "x" * 200}
        signal = MockNEBSignal("n1", "test.topic", large_payload)

        bridge._on_event(signal)

        preview = bridge._events[0]["payload_preview"]
        assert len(preview) <= 53  # 50 chars + "..."
        assert preview.endswith("...")


class TestNEBBridgeBroadcastSummary:
    """Test NEBBridge broadcast summary payload structure."""

    @pytest.mark.asyncio
    async def test_broadcast_payload_structure(self):
        """Broadcast payload should have correct structure."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-broadcast",
            throttle_ms=100,
            max_events=10
        )

        # Add some events
        bridge._on_event(MockNEBSignal("n1", "task.created", {"id": 1}))
        bridge._on_event(MockNEBSignal("n2", "build.started", {"job": "x"}))

        # Clear last_broadcast to allow immediate broadcast
        bridge._last_broadcast = 0.0
        await bridge._broadcast_summary()

        assert len(visual_bridge.broadcasts) == 1

        payload = visual_bridge.broadcasts[0]
        assert payload["type"] == "NEB_EVENT_UPDATE"

        data = payload["data"]
        assert "events" in data
        assert "topicCounts" in data
        assert "totalCount" in data
        assert "timestamp" in data

        assert data["totalCount"] == 2
        assert data["topicCounts"]["task"] == 1
        assert data["topicCounts"]["build"] == 1

    @pytest.mark.asyncio
    async def test_events_cleared_after_broadcast(self):
        """Events buffer should be cleared after broadcast."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-broadcast",
            throttle_ms=100,
            max_events=10
        )

        bridge._on_event(MockNEBSignal("n1", "test.event", {}))
        assert len(bridge._events) == 1

        bridge._last_broadcast = 0.0
        await bridge._broadcast_summary()

        # Events should be cleared after broadcast
        assert len(bridge._events) == 0
        # But topic counts should persist
        assert bridge._topic_counts.get("test") == 1

    @pytest.mark.asyncio
    async def test_broadcast_shows_zero_count_when_empty(self):
        """Should broadcast with zero count when events buffer is empty."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-broadcast",
            throttle_ms=100,
            max_events=10
        )

        # No events added
        bridge._last_broadcast = 0.0
        await bridge._broadcast_summary()

        # Should broadcast with empty events and zero count
        assert len(visual_bridge.broadcasts) == 1
        payload = visual_bridge.broadcasts[0]
        assert payload["data"]["events"] == []
        assert payload["data"]["totalCount"] == 0


class TestNEBBridgeStatus:
    """Test NEBBridge status reporting."""

    def test_get_status_returns_bridge_info(self):
        """get_status should return bridge state info."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-status",
            throttle_ms=100,
            max_events=10
        )

        bridge._on_event(MockNEBSignal("n1", "test.event", {}))

        status = bridge.get_status()

        assert status["running"] == False  # Not started yet
        assert status["node_id"] == "test-status"
        assert status["total_events"] == 1
        assert status["topic_counts"]["test"] == 1
        assert status["throttle_ms"] == 100


class TestNEBBridgeLifecycle:
    """Test NEBBridge start/stop lifecycle."""

    @pytest.mark.asyncio
    async def test_start_fails_without_neb_available(self):
        """Start should return False when NEBBus not available."""
        with patch('systems.visual_shell.api.neb_bridge.NEB_AVAILABLE', False):
            from systems.visual_shell.api.neb_bridge import NEBBridge

            visual_bridge = MockVisualBridge()
            bridge = NEBBridge(
                visual_bridge=visual_bridge,
                node_id="test-lifecycle",
                throttle_ms=100,
                max_events=10
            )

            result = await bridge.start()
            assert result is False

    @pytest.mark.asyncio
    async def test_stop_cancels_broadcast_task(self):
        """Stop should cancel the broadcast task."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-lifecycle",
            throttle_ms=100,
            max_events=10
        )

        # Simulate running state with broadcast task
        bridge._running = True
        bridge._broadcast_task = asyncio.create_task(
            asyncio.sleep(10)  # Long-running dummy task
        )

        await bridge.stop()

        assert bridge._running == False
        assert bridge._broadcast_task is None


class TestNEBBridgeErrorHandling:
    """Test NEBBridge error handling."""

    def test_on_event_handles_exception(self):
        """_on_event should not crash on malformed signal."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-error",
            throttle_ms=100,
            max_events=10
        )

        # Create a signal that will cause an error when accessing attributes
        bad_signal = MockNEBSignal("n1", "test.event", None)
        # Manually break the signal
        object.__setattr__(bad_signal, 'topic', None)

        # Should not crash
        try:
            bridge._on_event(bad_signal)
        except Exception:
            pytest.fail("_on_event should handle exceptions gracefully")

    def test_truncate_payload_handles_error(self):
        """_truncate_payload should handle un-stringable payloads."""
        from systems.visual_shell.api.neb_bridge import NEBBridge

        visual_bridge = MockVisualBridge()
        bridge = NEBBridge(
            visual_bridge=visual_bridge,
            node_id="test-error",
            throttle_ms=100,
            max_events=10
        )

        # Object that raises on str()
        class BadObject:
            def __str__(self):
                raise ValueError("Cannot stringify")

        result = bridge._truncate_payload(BadObject())
        assert result == "<error>"
