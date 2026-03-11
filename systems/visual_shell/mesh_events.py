"""
Mesh Event Streaming - Phase 33

Real-time event streaming from mesh to dashboard.

Provides event bus for mesh events (peer joins/leaves, container
changes, migration progress) and connects to dashboard for live updates.

Usage:
    from systems.visual_shell.mesh_events import (
        MeshEventBus,
        MeshEventType,
        MeshEvent,
        EventSubscriber,
    )

    # Create event bus
    bus = MeshEventBus()
    await bus.start()

    # Subscribe to events
    subscriber = bus.subscribe("dashboard")
    async for event in subscriber.events():
        handle_event(event)

    # Publish events
    await bus.publish(MeshEvent(MeshEventType.PEER_JOINED, {...}))
"""

import asyncio
import logging
import time
import uuid
from collections import defaultdict
from collections.abc import AsyncIterator, Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

logger = logging.getLogger("MeshEvents")


class MeshEventType(Enum):
    """Types of mesh events."""
    # Peer events
    PEER_JOINED = "peer_joined"
    PEER_LEFT = "peer_left"
    PEER_STATUS_CHANGED = "peer_status_changed"
    PEER_METRICS_UPDATED = "peer_metrics_updated"

    # Container events
    CONTAINER_STARTED = "container_started"
    CONTAINER_STOPPED = "container_stopped"
    CONTAINER_MIGRATED = "container_migrated"

    # Migration events
    MIGRATION_STARTED = "migration_started"
    MIGRATION_PROGRESS = "migration_progress"
    MIGRATION_COMPLETED = "migration_completed"
    MIGRATION_FAILED = "migration_failed"

    # Cluster events
    CLUSTER_ALERT = "cluster_alert"
    CLUSTER_REBALANCED = "cluster_rebalanced"

    # System events
    HEARTBEAT = "heartbeat"
    SYNC_REQUEST = "sync_request"
    SYNC_COMPLETE = "sync_complete"


@dataclass
class MeshEvent:
    """A mesh event."""
    event_type: MeshEventType
    data: dict[str, Any]
    event_id: str = field(default_factory=lambda: str(uuid.uuid4())[:8])
    timestamp: float = field(default_factory=time.time)
    source_peer_id: str | None = None
    correlation_id: str | None = None  # For linking related events

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

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "MeshEvent":
        """Create from dictionary."""
        return cls(
            event_id=data["event_id"],
            event_type=MeshEventType(data["event_type"]),
            timestamp=data["timestamp"],
            source_peer_id=data.get("source_peer_id"),
            correlation_id=data.get("correlation_id"),
            data=data["data"],
        )


@dataclass
class EventFilter:
    """Filter for event subscription."""
    event_types: list[MeshEventType] | None = None
    source_peer_id: str | None = None
    min_severity: str | None = None

    def matches(self, event: MeshEvent) -> bool:
        """Check if event matches filter."""
        if self.event_types and event.event_type not in self.event_types:
            return False
        if self.source_peer_id and event.source_peer_id != self.source_peer_id:
            return False
        return True


class EventSubscriber:
    """
    Subscriber for mesh events.

    Provides async iterator interface for consuming events.
    """

    def __init__(
        self,
        subscriber_id: str,
        event_filter: EventFilter | None = None,
        max_queue_size: int = 1000,
    ):
        self.subscriber_id = subscriber_id
        self.event_filter = event_filter
        self.max_queue_size = max_queue_size

        self._queue: asyncio.Queue = asyncio.Queue(maxsize=max_queue_size)
        self._active = True
        self._stats = {
            "events_received": 0,
            "events_dropped": 0,
        }

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

    async def events(self) -> AsyncIterator[MeshEvent]:
        """Async iterator for events."""
        while self._active:
            try:
                event = await asyncio.wait_for(
                    self._queue.get(),
                    timeout=1.0
                )
                yield event
            except TimeoutError:
                continue
            except asyncio.CancelledError:
                break

    async def get_event(self, timeout: float = 1.0) -> MeshEvent | None:
        """Get next event with timeout."""
        try:
            return await asyncio.wait_for(self._queue.get(), timeout=timeout)
        except TimeoutError:
            return None

    def deactivate(self):
        """Deactivate subscriber."""
        self._active = False

    def get_stats(self) -> dict[str, Any]:
        """Get subscriber statistics."""
        return {
            "subscriber_id": self.subscriber_id,
            "active": self._active,
            "queue_size": self._queue.qsize(),
            **self._stats,
        }


class MeshEventBus:
    """
    Central event bus for mesh events.

    Manages subscribers and distributes events.
    """

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

    async def publish_event(self, event: MeshEvent) -> str:
        """Publish a pre-constructed event."""
        await self._pending_queue.put(event)
        return event.event_id

    def subscribe(
        self,
        subscriber_id: str,
        event_filter: EventFilter | None = None,
    ) -> EventSubscriber:
        """Create a new subscriber."""
        if subscriber_id in self._subscribers:
            logger.warning(f"Replacing existing subscriber: {subscriber_id}")
            self._subscribers[subscriber_id].deactivate()

        subscriber = EventSubscriber(
            subscriber_id=subscriber_id,
            event_filter=event_filter,
        )
        self._subscribers[subscriber_id] = subscriber

        logger.info(f"New subscriber: {subscriber_id}")
        return subscriber

    def unsubscribe(self, subscriber_id: str):
        """Remove a subscriber."""
        if subscriber_id in self._subscribers:
            self._subscribers[subscriber_id].deactivate()
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
    """
    Connects mesh systems to the event bus.

    Bridges load balancer, visualizer, and other systems to events.
    """

    def __init__(
        self,
        event_bus: MeshEventBus,
        visualizer=None,
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
            self._handle_peer_joined
        )
        self.event_bus.on_event(
            MeshEventType.PEER_LEFT,
            self._handle_peer_left
        )
        self.event_bus.on_event(
            MeshEventType.PEER_METRICS_UPDATED,
            self._handle_peer_metrics
        )
        self.event_bus.on_event(
            MeshEventType.MIGRATION_STARTED,
            self._handle_migration_started
        )
        self.event_bus.on_event(
            MeshEventType.MIGRATION_PROGRESS,
            self._handle_migration_progress
        )
        self.event_bus.on_event(
            MeshEventType.MIGRATION_COMPLETED,
            self._handle_migration_completed
        )
        self.event_bus.on_event(
            MeshEventType.MIGRATION_FAILED,
            self._handle_migration_failed
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

    # Convenience methods for publishing events

    async def publish_peer_joined(
        self,
        peer_id: str,
        hostname: str = "",
        cpu_percent: float = 0,
        memory_percent: float = 0,
        container_count: int = 0,
    ):
        """Publish peer joined event."""
        await self.event_bus.publish(
            MeshEventType.PEER_JOINED,
            {
                "peer_id": peer_id,
                "hostname": hostname,
                "cpu_percent": cpu_percent,
                "memory_percent": memory_percent,
                "container_count": container_count,
            },
        )

    async def publish_peer_left(self, peer_id: str):
        """Publish peer left event."""
        await self.event_bus.publish(
            MeshEventType.PEER_LEFT,
            {"peer_id": peer_id},
        )

    async def publish_peer_metrics(
        self,
        peer_id: str,
        hostname: str = "",
        cpu_percent: float = 0,
        memory_percent: float = 0,
        container_count: int = 0,
    ):
        """Publish peer metrics update."""
        await self.event_bus.publish(
            MeshEventType.PEER_METRICS_UPDATED,
            {
                "peer_id": peer_id,
                "hostname": hostname,
                "cpu_percent": cpu_percent,
                "memory_percent": memory_percent,
                "container_count": container_count,
            },
        )

    async def publish_migration_started(
        self,
        migration_id: str,
        source_peer_id: str,
        target_peer_id: str,
        container_name: str,
    ):
        """Publish migration started event."""
        await self.event_bus.publish(
            MeshEventType.MIGRATION_STARTED,
            {
                "migration_id": migration_id,
                "source_peer_id": source_peer_id,
                "target_peer_id": target_peer_id,
                "container_name": container_name,
            },
            correlation_id=migration_id,
        )

    async def publish_migration_progress(
        self,
        migration_id: str,
        progress: float,
    ):
        """Publish migration progress event."""
        await self.event_bus.publish(
            MeshEventType.MIGRATION_PROGRESS,
            {
                "migration_id": migration_id,
                "progress": progress,
            },
            correlation_id=migration_id,
        )

    async def publish_migration_completed(
        self,
        migration_id: str,
        source_peer_id: str,
        target_peer_id: str,
        container_name: str,
    ):
        """Publish migration completed event."""
        await self.event_bus.publish(
            MeshEventType.MIGRATION_COMPLETED,
            {
                "migration_id": migration_id,
                "source_peer_id": source_peer_id,
                "target_peer_id": target_peer_id,
                "container_name": container_name,
            },
            correlation_id=migration_id,
        )

    async def publish_migration_failed(
        self,
        migration_id: str,
        source_peer_id: str,
        target_peer_id: str,
        container_name: str,
        error: str = "",
    ):
        """Publish migration failed event."""
        await self.event_bus.publish(
            MeshEventType.MIGRATION_FAILED,
            {
                "migration_id": migration_id,
                "source_peer_id": source_peer_id,
                "target_peer_id": target_peer_id,
                "container_name": container_name,
                "error": error,
            },
            correlation_id=migration_id,
        )

    async def publish_cluster_alert(
        self,
        alert_type: str,
        message: str,
        peer_id: str | None = None,
    ):
        """Publish cluster alert event."""
        await self.event_bus.publish(
            MeshEventType.CLUSTER_ALERT,
            {
                "alert_type": alert_type,
                "message": message,
                "peer_id": peer_id,
            },
        )


# Convenience function
def create_mesh_event_bus(
    local_peer_id: str = "local",
    history_size: int = 100,
) -> MeshEventBus:
    """Create a mesh event bus."""
    return MeshEventBus(
        local_peer_id=local_peer_id,
        history_size=history_size,
    )
