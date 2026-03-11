"""
Event Streaming - Phase 33

Real-time event distribution across the mesh.

Connects the components together via the event bus,
so that all parts of the system can react to mesh events
in real-time.

Usage:
    from systems.visual_shell.event_streaming import (
        MeshEventBus,
        MeshEventType,
        MeshEvent,
        EventFilter,
        EventSubscriber,
        MeshEventConnector,
        create_mesh_event_bus,
        create_mesh_event_connector,
    )

    # Create event bus
    bus = MeshEventBus(local_peer_id="test-local")
    await bus.start()

    # Subscribe to events
    subscriber = bus.subscribe(
        "dashboard-sub",
        EventFilter(event_types=[MeshEventType.PEER_JOINED]),
    )
    subscriber.activate()

    # Publish events
    await bus.publish(MeshEventType.PEER_JOINED, {"peer_id": "peer-1"})
"""

import asyncio
import logging
import time
import uuid
from collections import defaultdict
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

from systems.visual_shell.cluster_visualizer import (
    ClusterVisualizer,
)

logger = logging.getLogger("EventStreaming")


class MeshEventType(Enum):
    """Types of mesh events."""
    PEER_JOINED = "peer_joined"
    PEER_LEFT = "peer_left"
    PEER_METRICS_UPDATED = "peer_metrics_updated"
    MIGRATION_STARTED = "migration_started"
    MIGRATION_PROGRESS = "migration_progress"
    MIGRATION_COMPLETED = "migration_completed"
    MIGRATION_FAILED = "migration_failed"
    CONTAINER_ADDED = "container_added"
    CONTAINER_REMOVED = "container_removed"
    ALERT_TRIGGERED = "alert_triggered"
    HEALTH_CHECK = "health_check"
    USER_ACTION = "user_action"
    NETWORK_DISCONNECT = "network_disconnect"
    CUSTOM_EVENT = "custom_event"


@dataclass
class MeshEvent:
    """A mesh event."""
    event_type: MeshEventType
    data: dict[str, Any]
    event_id: str = field(default_factory=lambda: str(uuid.uuid4())[:8])
    timestamp: float = field(default_factory=time.time)
    source_peer_id: str | None = None
    correlation_id: str | None = None

    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary."""
        return {
            "event_id": self.event_id,
            "event_type": self.event_type.value,
            "timestamp": self.timestamp,
            "source_peer_id": self.source_peer_id,
            "correlation_id": self.correlation_id,
            "data": self.data,
        }


@dataclass
class EventFilter:
    """Filter for event subscription."""
    event_types: list[MeshEventType] | None = None
    source_peer_id: str | None = None
    min_severity: str | None = None
    correlation_id: str | None = None

    def matches(self, event_or_type) -> bool:
        """Check if event matches filter.

        Can accept either a MeshEvent or MeshEventType for convenience.
        """
        # Handle being passed just an event type
        if isinstance(event_or_type, MeshEventType):
            if self.event_types and event_or_type not in self.event_types:
                return False
            return True

        # Handle full event
        event = event_or_type

        # Check event types
        if self.event_types and event.event_type not in self.event_types:
            return False

        # Check source peer
        if self.source_peer_id and event.source_peer_id != self.source_peer_id:
            return False

        # Check correlation ID
        if self.correlation_id and event.correlation_id != self.correlation_id:
            return False

        # Check severity
        if self.min_severity:
            severity = event.data.get("severity", "info")
            severity_levels = ["debug", "info", "warning", "error", "critical"]
            if severity_levels.index(severity) < severity_levels.index(self.min_severity):
                return False

        return True


class EventSubscriber:
    """Subscriber for mesh events."""

    def __init__(
        self,
        subscriber_id: str,
        event_filter: EventFilter | None = None,
        max_queue_size: int = 1000,
    ):
        self.subscriber_id = subscriber_id
        self.event_filter = event_filter
        self.max_queue_size = max_queue_size
        self.event_bus = None  # Set when subscribed
        self._handler = None  # Set when handler registered

        self._queue: asyncio.Queue = asyncio.Queue(maxsize=max_queue_size)
        self._active = False
        self._stats = {
            "events_received": 0,
            "events_dropped": 0,
        }

    def activate(self):
        """Activate the subscriber."""
        self._active = True

    def deactivate(self):
        """Deactivate the subscriber."""
        self._active = False

    async def push(self, event: MeshEvent) -> bool:
        """Push event to subscriber queue."""
        if not self._active:
            return False

        # Apply filter
        if self.event_filter and not self.event_filter.matches(event):
            return False

        try:
            self._queue.put_nowait(event)
            self._stats["events_received"] += 1
            return True
        except asyncio.QueueFull:
            self._stats["events_dropped"] += 1
            logger.warning(
                f"Subscriber {self.subscriber_id} queue full, dropping event"
            )
            return False

    async def get_event(self, timeout: float = 1.0) -> MeshEvent | None:
        """Get next event with timeout."""
        try:
            return await asyncio.wait_for(self._queue.get(), timeout=timeout)
        except TimeoutError:
            return None

    def get_stats(self) -> dict[str, Any]:
        """Get subscriber statistics."""
        return {
            "subscriber_id": self.subscriber_id,
            "active": self._active,
            "queue_size": self._queue.qsize(),
            **self._stats,
        }


class MeshEventBus:
    """Central event bus for mesh events."""

    def __init__(
        self,
        local_peer_id: str = "local",
        history_size: int = 100,
    ):
        self.local_peer_id = local_peer_id
        self.history_size = history_size

        self._subscribers: dict[str, EventSubscriber] = {}
        self._history: list[MeshEvent] = []
        self._event_handlers: dict[MeshEventType, list[Callable]] = defaultdict(list)

        self._running = False
        self._publish_task: asyncio.Task | None = None
        self._pending_queue: asyncio.Queue = asyncio.Queue()

        self._stats = {
            "events_published": 0,
            "events_by_type": defaultdict(int),
        }

    async def start(self):
        """Start the event bus."""
        if self._running:
            return

        self._running = True
        self._publish_task = asyncio.create_task(self._process_pending())
        logger.info(f"Mesh event bus started (peer: {self.local_peer_id})")

    async def stop(self):
        """Stop the event bus."""
        self._running = False

        if self._publish_task:
            self._publish_task.cancel()
            try:
                await self._publish_task
            except asyncio.CancelledError:
                pass

        # Deactivate all subscribers
        for subscriber in self._subscribers.values():
            subscriber.deactivate()

        logger.info("Mesh event bus stopped")

    async def _process_pending(self):
        """Process pending events."""
        while self._running:
            try:
                event = await asyncio.wait_for(
                    self._pending_queue.get(),
                    timeout=0.5
                )
                await self._distribute(event)
            except TimeoutError:
                continue
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Error processing event: {e}")

    async def _distribute(self, event: MeshEvent):
        """Distribute event to subscribers."""
        # Add to history
        self._history.append(event)
        if len(self._history) > self.history_size:
            self._history = self._history[-self.history_size:]

        # Update stats
        self._stats["events_published"] += 1
        self._stats["events_by_type"][event.event_type] += 1

        # Call registered handlers
        for handler in self._event_handlers[event.event_type]:
            try:
                result = handler(event)
                if asyncio.iscoroutine(result):
                    await result
            except Exception as e:
                logger.error(f"Handler error for {event.event_type}: {e}")

        # Push to all subscribers
        for subscriber in self._subscribers.values():
            await subscriber.push(event)

    async def publish(
        self,
        event_type: MeshEventType,
        data: dict[str, Any],
        source_peer_id: str | None = None,
        correlation_id: str | None = None,
    ) -> str:
        """Publish an event."""
        event = MeshEvent(
            event_type=event_type,
            data=data,
            source_peer_id=source_peer_id or self.local_peer_id,
            correlation_id=correlation_id,
        )

        await self._pending_queue.put(event)
        return event.event_id

    def subscribe(
        self,
        subscriber_id: str,
        event_filter: EventFilter | None = None,
        handler: Callable[[MeshEvent], None] | None = None,
    ) -> EventSubscriber:
        """Create a new subscriber."""
        if subscriber_id in self._subscribers:
            logger.warning(f"Replacing existing subscriber: {subscriber_id}")
            self._subscribers[subscriber_id].deactivate()

        subscriber = EventSubscriber(
            subscriber_id=subscriber_id,
            event_filter=event_filter,
        )
        subscriber.event_bus = self
        self._subscribers[subscriber_id] = subscriber

        # Register handler for all event types if provided
        # The handler will be called and can filter itself
        if handler:
            # Store handler reference for later cleanup
            subscriber._handler = handler
            # Register for all common event types
            for event_type in [
                MeshEventType.PEER_JOINED,
                MeshEventType.PEER_LEFT,
                MeshEventType.PEER_METRICS_UPDATED,
                MeshEventType.MIGRATION_STARTED,
                MeshEventType.MIGRATION_PROGRESS,
                MeshEventType.MIGRATION_COMPLETED,
                MeshEventType.MIGRATION_FAILED,
                MeshEventType.CONTAINER_ADDED,
                MeshEventType.CONTAINER_REMOVED,
                MeshEventType.ALERT_TRIGGERED,
            ]:
                self.on_event(event_type, handler)

        logger.info(f"New subscriber: {subscriber_id}")
        return subscriber

    def unsubscribe(self, subscriber_id: str):
        """Remove a subscriber."""
        if subscriber_id in self._subscribers:
            subscriber = self._subscribers[subscriber_id]
            subscriber.deactivate()
            # Remove handler if registered
            if subscriber._handler:
                for event_type in [
                    MeshEventType.PEER_JOINED,
                    MeshEventType.PEER_LEFT,
                    MeshEventType.PEER_METRICS_UPDATED,
                    MeshEventType.MIGRATION_STARTED,
                    MeshEventType.MIGRATION_PROGRESS,
                    MeshEventType.MIGRATION_COMPLETED,
                    MeshEventType.MIGRATION_FAILED,
                    MeshEventType.CONTAINER_ADDED,
                    MeshEventType.CONTAINER_REMOVED,
                    MeshEventType.ALERT_TRIGGERED,
                ]:
                    self.off_event(event_type, subscriber._handler)
            del self._subscribers[subscriber_id]
            logger.info(f"Unsubscribed: {subscriber_id}")

    def on_event(
        self,
        event_type: MeshEventType,
        handler: Callable[[MeshEvent], None],
    ):
        """Register a handler for an event type."""
        self._event_handlers[event_type].append(handler)

    def off_event(
        self,
        event_type: MeshEventType,
        handler: Callable[[MeshEvent], None],
    ):
        """Unregister a handler."""
        if handler in self._event_handlers[event_type]:
            self._event_handlers[event_type].remove(handler)

    def get_history(
        self,
        event_type: MeshEventType | None = None,
        limit: int = 50,
    ) -> list[MeshEvent]:
        """Get event history."""
        events = self._history
        if event_type:
            events = [e for e in events if e.event_type == event_type]
        return events[-limit:]

    def get_stats(self) -> dict[str, Any]:
        """Get bus statistics."""
        return {
            "running": self._running,
            "local_peer_id": self.local_peer_id,
            "subscriber_count": len(self._subscribers),
            "history_size": len(self._history),
            "events_published": self._stats["events_published"],
            "events_by_type": {
                k.value: v for k, v in self._stats["events_by_type"].items()
            },
        }


class MeshEventConnector:
    """Connects mesh systems to the event bus."""

    def __init__(
        self,
        event_bus: MeshEventBus,
        visualizer: ClusterVisualizer | None = None,
        load_balancer=None,
    ):
        self.event_bus = event_bus
        self.visualizer = visualizer
        self.load_balancer = load_balancer

        self._running = False
        self._sync_task: asyncio.Task | None = None

        # Register handlers
        self._setup_handlers()

    def _setup_handlers(self):
        """Set up event handlers."""
        self.event_bus.on_event(
            MeshEventType.PEER_JOINED,
            self._handle_peer_joined,
        )
        self.event_bus.on_event(
            MeshEventType.PEER_LEFT,
            self._handle_peer_left,
        )
        self.event_bus.on_event(
            MeshEventType.PEER_METRICS_UPDATED,
            self._handle_peer_metrics,
        )
        self.event_bus.on_event(
            MeshEventType.MIGRATION_STARTED,
            self._handle_migration_started,
        )
        self.event_bus.on_event(
            MeshEventType.MIGRATION_PROGRESS,
            self._handle_migration_progress,
        )
        self.event_bus.on_event(
            MeshEventType.MIGRATION_COMPLETED,
            self._handle_migration_completed,
        )
        self.event_bus.on_event(
            MeshEventType.MIGRATION_FAILED,
            self._handle_migration_failed,
        )

    async def start(self):
        """Start the connector."""
        if self._running:
            return

        self._running = True
        logger.info("Mesh event connector started")

    async def stop(self):
        """Stop the connector."""
        self._running = False
        logger.info("Mesh event connector stopped")

    async def _handle_peer_joined(self, event: MeshEvent):
        """Handle peer joined event."""
        if self.visualizer:
            data = event.data
            self.visualizer.update_peer(
                peer_id=data.get("peer_id"),
                hostname=data.get("hostname", ""),
                cpu_percent=data.get("cpu_percent", 0),
                memory_percent=data.get("memory_percent", 0),
                container_count=data.get("container_count", 0),
            )

    async def _handle_peer_left(self, event: MeshEvent):
        """Handle peer left event."""
        if self.visualizer:
            peer_id = event.data.get("peer_id")
            if peer_id:
                self.visualizer.remove_peer(peer_id)

    async def _handle_peer_metrics(self, event: MeshEvent):
        """Handle peer metrics update."""
        if self.visualizer:
            data = event.data
            self.visualizer.update_peer(
                peer_id=data.get("peer_id"),
                hostname=data.get("hostname", ""),
                cpu_percent=data.get("cpu_percent", 0),
                memory_percent=data.get("memory_percent", 0),
                container_count=data.get("container_count", 0),
            )

    async def _handle_migration_started(self, event: MeshEvent):
        """Handle migration started event."""
        if self.visualizer:
            data = event.data
            self.visualizer.show_migration(
                migration_id=data.get("migration_id"),
                source_peer_id=data.get("source_peer_id"),
                target_peer_id=data.get("target_peer_id"),
                container_name=data.get("container_name", ""),
            )

    async def _handle_migration_progress(self, event: MeshEvent):
        """Handle migration progress event."""
        if self.visualizer:
            data = event.data
            self.visualizer.update_migration_progress(
                migration_id=data.get("migration_id"),
                progress=data.get("progress", 0),
            )

    async def _handle_migration_completed(self, event: MeshEvent):
        """Handle migration completed event."""
        if self.visualizer:
            data = event.data
            self.visualizer.complete_migration(
                migration_id=data.get("migration_id"),
                success=True,
            )

    async def _handle_migration_failed(self, event: MeshEvent):
        """Handle migration failed event."""
        if self.visualizer:
            data = event.data
            self.visualizer.complete_migration(
                migration_id=data.get("migration_id"),
                success=False,
            )


# Convenience functions
def create_mesh_event_bus(
    local_peer_id: str = "local",
    history_size: int = 100,
) -> MeshEventBus:
    """Create a mesh event bus."""
    return MeshEventBus(
        local_peer_id=local_peer_id,
        history_size=history_size,
    )


def create_mesh_event_connector(
    event_bus: MeshEventBus,
    visualizer: ClusterVisualizer | None = None,
    load_balancer=None,
) -> MeshEventConnector:
    """Create a mesh event connector."""
    return MeshEventConnector(
        event_bus=event_bus,
        visualizer=visualizer,
        load_balancer=load_balancer,
    )
