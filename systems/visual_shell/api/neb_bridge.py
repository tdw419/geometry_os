"""
NEBBridge - Bridge NEB events to VisualBridge for HUD streaming.

Subscribes to all NEB events and broadcasts summary payloads to the
Visual Debug Overlay at a throttled rate (10 Hz max).
"""

import time
import asyncio
import logging
from typing import Dict, Any, List, Optional

# Configure logger
logger = logging.getLogger(__name__)

# Import NEBBus with graceful fallback
try:
    from systems.swarm.neb_bus import NEBBus
    from systems.swarm.neb_signal import NEBSignal
    NEB_AVAILABLE = True
except ImportError as e:
    logger.warning(f"NEBBus not available: {e}. NEB features disabled.")
    NEBBus = None  # type: ignore
    NEBSignal = None  # type: ignore
    NEB_AVAILABLE = False


class NEBBridge:
    """
    Bridge between NEBBus and VisualBridge for HUD event streaming.

    Subscribes to all NEB events with '**' pattern, aggregates them,
    and broadcasts summary payloads to connected HUD clients.

    Throttles broadcasts to 10 Hz (100ms) to prevent overwhelming clients.

    Attributes:
        visual_bridge: VisualBridge instance for broadcasting
        node_id: Unique identifier for this bridge node
        throttle_ms: Minimum time between broadcasts (default 100ms)
        max_events: Maximum events to include in summary (default 10)
    """

    def __init__(
        self,
        visual_bridge: Any,
        node_id: str = "neb-bridge",
        throttle_ms: int = 100,
        max_events: int = 10
    ):
        """
        Initialize the NEB Bridge.

        Args:
            visual_bridge: VisualBridge instance for broadcasting
            node_id: Unique identifier for this bridge node
            throttle_ms: Min time between broadcasts (default 100ms = 10 Hz)
            max_events: Maximum events to include in summary (default 10)
        """
        self.visual_bridge = visual_bridge
        self.node_id = node_id
        self.throttle_ms = throttle_ms
        self.max_events = max_events

        # NEB bus instance
        self._bus: Optional[NEBBus] = None
        self._subscription_id: Optional[str] = None

        # Event buffer for aggregation
        self._events: List[Dict[str, Any]] = []
        self._topic_counts: Dict[str, int] = {}
        self._total_count: int = 0

        # Throttle state
        self._last_broadcast: float = 0.0
        self._broadcast_task: Optional[asyncio.Task] = None
        self._running: bool = False

    async def start(self) -> bool:
        """
        Start the NEB Bridge.

        Creates NEBBus instance, subscribes to all events, and starts
        the broadcast loop.

        Returns:
            True if started successfully, False otherwise
        """
        # Check if NEBBus is available
        if not NEB_AVAILABLE:
            logger.warning("NEBBridge cannot start: NEBBus not available")
            return False

        try:
            # Create NEBBus instance
            self._bus = NEBBus(node_id=self.node_id)

            # Subscribe to all events with '**' pattern
            self._subscription_id = self._bus.subscribe(
                pattern="**",
                callback=self._on_event
            )

            self._running = True

            # Start broadcast loop
            self._broadcast_task = asyncio.create_task(self._broadcast_loop())

            logger.info(f"NEBBridge started (sub_id={self._subscription_id})")
            return True

        except Exception as e:
            logger.error(f"NEBBridge failed to start: {e}")
            return False

    async def stop(self) -> None:
        """Stop the NEB Bridge and cleanup resources."""
        self._running = False

        if self._broadcast_task:
            self._broadcast_task.cancel()
            try:
                await self._broadcast_task
            except asyncio.CancelledError:
                pass
            self._broadcast_task = None

        if self._bus and self._subscription_id:
            self._bus.unsubscribe(self._subscription_id)
            self._subscription_id = None

        self._bus = None
        logger.info("NEBBridge stopped")

    def _on_event(self, signal: "NEBSignal") -> None:
        """
        Handle incoming NEB event.

        Adds event to buffer and updates topic counts.

        Args:
            signal: NEBSignal from NEBBus
        """
        try:
            # Build event summary
            event_data = {
                "topic": signal.topic,
                "source_id": signal.source_id,
                "timestamp": signal.timestamp,
                "payload_preview": self._truncate_payload(signal.payload)
            }

            # Add to events buffer (limit to max_events)
            self._events.append(event_data)
            if len(self._events) > self.max_events:
                self._events = self._events[-self.max_events:]

            # Update topic counts (use first segment as prefix)
            topic_prefix = (signal.topic.split(".")[0]
                            if "." in signal.topic else signal.topic)
            self._topic_counts[topic_prefix] = (
                self._topic_counts.get(topic_prefix, 0) + 1)

            # Update total count
            self._total_count += 1
        except Exception as e:
            logger.error(f"NEBBridge event callback error: {e}")

    def _truncate_payload(self, payload: Any, max_len: int = 50) -> str:
        """Truncate payload for preview display."""
        try:
            preview = str(payload)
            if len(preview) > max_len:
                preview = preview[:max_len] + "..."
            return preview
        except Exception:
            return "<error>"

    async def _broadcast_loop(self) -> None:
        """
        Periodic broadcast loop.

        Broadcasts summary payload at throttle rate (10 Hz max).
        """
        while self._running:
            try:
                # Check if we have events to broadcast
                if self._events and self.visual_bridge:
                    await self._broadcast_summary()

                # Wait for throttle interval
                await asyncio.sleep(self.throttle_ms / 1000.0)

            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"NEBBridge broadcast error: {e}")
                await asyncio.sleep(1.0)  # Back off on error

    async def _broadcast_summary(self) -> None:
        """
        Build and broadcast summary payload to VisualBridge.

        Payload structure:
        {
            "type": "NEB_EVENT_UPDATE",
            "data": {
                "events": [...],
                "topicCounts": {...},
                "totalCount": N,
                "timestamp": T
            }
        }
        """
        # Throttle check - ensure minimum time between broadcasts
        now = time.time()
        elapsed_ms = (now - self._last_broadcast) * 1000
        if elapsed_ms < self.throttle_ms:
            return

        self._last_broadcast = now

        # Build summary payload
        payload = {
            "type": "NEB_EVENT_UPDATE",
            "data": {
                "events": list(self._events),
                "topicCounts": dict(self._topic_counts),
                "totalCount": self._total_count,
                "timestamp": now
            }
        }

        # Broadcast via VisualBridge
        try:
            await self.visual_bridge._broadcast(payload)
        except Exception as e:
            logger.error(f"NEBBridge broadcast failed: {e}")

        # Clear events buffer after broadcast (keep topic counts)
        self._events = []

    def get_status(self) -> Dict[str, Any]:
        """
        Get current bridge status.

        Returns:
            Dict with status info
        """
        return {
            "running": self._running,
            "node_id": self.node_id,
            "subscription_id": self._subscription_id,
            "total_events": self._total_count,
            "topic_counts": dict(self._topic_counts),
            "throttle_ms": self.throttle_ms
        }
