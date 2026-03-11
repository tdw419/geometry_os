"""
Live Mesh Feed - Phase 35

WebSocket streaming of real peer events to visual shell.

Bridges the mesh network (PeerRegistry, LoadBalancer) to the visual
shell via WebSocket, enabling real-time visualization of:
- Peer join/leave events
- Container add/remove events
- Migration progress
- Metrics updates

Usage:
    from systems.visual_shell.live_mesh_feed import (
        MeshFeedServer,
        MeshFeedClient,
        MeshEventType,
        create_mesh_feed_server,
        create_mesh_feed_client,
    )

    # Server side (on mesh node)
    server = MeshFeedServer(peer_registry=registry, port=8765)
    await server.start()

    # Broadcast events
    await server.broadcast_peer_joined("peer-1", "192.168.1.10")

    # Client side (visual shell)
    client = MeshFeedClient(event_bus=event_bus, url="ws://localhost:8765")
    await client.connect()
"""

import asyncio
import json
import logging
import time
import uuid
from dataclasses import dataclass, field
from typing import Any

try:
    import websockets
    HAS_WEBSOCKETS = True
except ImportError:
    HAS_WEBSOCKETS = False

from systems.visual_shell.event_streaming import (
    MeshEventBus,
    MeshEventType,
)

logger = logging.getLogger("LiveMeshFeed")


@dataclass
class MeshFeedMessage:
    """Message format for mesh feed."""
    message_type: str  # "event" or "command"
    event_type: str | None = None
    data: dict[str, Any] = field(default_factory=dict)
    timestamp: float = field(default_factory=time.time)
    message_id: str = field(default_factory=lambda: str(uuid.uuid4())[:8])

    def to_json(self) -> str:
        """Serialize to JSON."""
        return json.dumps({
            "message_type": self.message_type,
            "event_type": self.event_type,
            "data": self.data,
            "timestamp": self.timestamp,
            "message_id": self.message_id,
        })

    @classmethod
    def from_json(cls, data: str) -> "MeshFeedMessage":
        """Deserialize from JSON."""
        obj = json.loads(data)
        return cls(
            message_type=obj.get("message_type", "event"),
            event_type=obj.get("event_type"),
            data=obj.get("data", {}),
            timestamp=obj.get("timestamp", time.time()),
            message_id=obj.get("message_id", str(uuid.uuid4())[:8]),
        )


class MeshFeedServer:
    """
    WebSocket server that broadcasts mesh events.

    Runs on each mesh node and broadcasts local events
    to connected clients (visual shells).
    """

    def __init__(
        self,
        peer_registry=None,
        load_balancer=None,
        host: str = "0.0.0.0",
        port: int = 8765,
    ):
        self.peer_registry = peer_registry
        self.load_balancer = load_balancer
        self.host = host
        self.port = port

        self._running = False
        self._server = None
        self._clients: set[Any] = set()
        self._event_buffer: list[MeshFeedMessage] = []
        self._buffer_size = 100
        self._stats = {
            "events_broadcast": 0,
            "clients_connected": 0,
            "messages_sent": 0,
        }

    async def start(self):
        """Start the feed server."""
        if not HAS_WEBSOCKETS:
            logger.warning("websockets not installed, using mock mode")
            self._running = True
            return

        if self._running:
            return

        self._running = True
        self._server = await websockets.serve(
            self._handle_client,
            self.host,
            self.port,
        )
        logger.info(f"Mesh feed server started on {self.host}:{self.port}")

    async def stop(self):
        """Stop the feed server."""
        self._running = False
        if self._server:
            self._server.close()
            await self._server.wait_closed()
        self._clients.clear()
        logger.info("Mesh feed server stopped")

    async def _handle_client(self, websocket, path=None):
        """Handle a client connection."""
        self._clients.add(websocket)
        self._stats["clients_connected"] += 1
        client_addr = getattr(websocket, 'remote_address', 'unknown')
        logger.info(f"Client connected: {client_addr}")

        try:
            # Send recent events for replay
            for msg in self._event_buffer[-20:]:
                try:
                    await websocket.send(msg.to_json())
                except Exception:
                    pass

            # Keep connection alive, handle incoming commands
            async for message in websocket:
                try:
                    msg = MeshFeedMessage.from_json(message)
                    await self._handle_command(websocket, msg)
                except Exception as e:
                    logger.error(f"Error handling message: {e}")

        except Exception as e:
            logger.error(f"Client error: {e}")
        finally:
            self._clients.discard(websocket)
            logger.info(f"Client disconnected: {client_addr}")

    async def _handle_command(self, websocket, msg: MeshFeedMessage):
        """Handle a command from client."""
        if msg.message_type == "command":
            command = msg.data.get("command")
            if command == "ping":
                response = MeshFeedMessage(
                    message_type="event",
                    event_type="pong",
                    data={"timestamp": time.time()},
                )
                await websocket.send(response.to_json())
            elif command == "get_history":
                # Send buffered events
                for event_msg in self._event_buffer[-50:]:
                    await websocket.send(event_msg.to_json())

    async def broadcast(
        self,
        event_type: MeshEventType,
        data: dict[str, Any],
    ):
        """Broadcast an event to all connected clients."""
        msg = MeshFeedMessage(
            message_type="event",
            event_type=event_type.value if isinstance(event_type, MeshEventType) else event_type,
            data=data,
        )

        # Buffer for replay
        self._event_buffer.append(msg)
        if len(self._event_buffer) > self._buffer_size:
            self._event_buffer = self._event_buffer[-self._buffer_size:]

        self._stats["events_broadcast"] += 1

        # Send to all clients
        if self._clients:
            message = msg.to_json()
            disconnected = set()
            for client in self._clients:
                try:
                    await client.send(message)
                    self._stats["messages_sent"] += 1
                except Exception as e:
                    logger.warning(f"Failed to send to client: {e}")
                    disconnected.add(client)

            # Remove disconnected clients
            self._clients -= disconnected

    # Convenience broadcast methods

    async def broadcast_peer_joined(
        self,
        peer_id: str,
        hostname: str = "",
        cpu_percent: float = 0,
        memory_percent: float = 0,
        container_count: int = 0,
    ):
        """Broadcast peer joined event."""
        await self.broadcast(
            MeshEventType.PEER_JOINED,
            {
                "peer_id": peer_id,
                "hostname": hostname,
                "cpu_percent": cpu_percent,
                "memory_percent": memory_percent,
                "container_count": container_count,
            },
        )

    async def broadcast_peer_left(self, peer_id: str):
        """Broadcast peer left event."""
        await self.broadcast(
            MeshEventType.PEER_LEFT,
            {"peer_id": peer_id},
        )

    async def broadcast_peer_metrics(
        self,
        peer_id: str,
        cpu_percent: float,
        memory_percent: float,
        container_count: int = 0,
    ):
        """Broadcast peer metrics update."""
        await self.broadcast(
            MeshEventType.PEER_METRICS_UPDATED,
            {
                "peer_id": peer_id,
                "cpu_percent": cpu_percent,
                "memory_percent": memory_percent,
                "container_count": container_count,
            },
        )

    async def broadcast_migration_started(
        self,
        migration_id: str,
        source_peer_id: str,
        target_peer_id: str,
        container_name: str,
    ):
        """Broadcast migration started event."""
        await self.broadcast(
            MeshEventType.MIGRATION_STARTED,
            {
                "migration_id": migration_id,
                "source_peer_id": source_peer_id,
                "target_peer_id": target_peer_id,
                "container_name": container_name,
            },
        )

    async def broadcast_migration_progress(
        self,
        migration_id: str,
        progress: float,
    ):
        """Broadcast migration progress event."""
        await self.broadcast(
            MeshEventType.MIGRATION_PROGRESS,
            {
                "migration_id": migration_id,
                "progress": progress,
            },
        )

    async def broadcast_migration_completed(
        self,
        migration_id: str,
        success: bool = True,
    ):
        """Broadcast migration completed event."""
        await self.broadcast(
            MeshEventType.MIGRATION_COMPLETED,
            {
                "migration_id": migration_id,
                "success": success,
            },
        )

    async def broadcast_migration_failed(
        self,
        migration_id: str,
        error: str = "",
    ):
        """Broadcast migration failed event."""
        await self.broadcast(
            MeshEventType.MIGRATION_FAILED,
            {
                "migration_id": migration_id,
                "error": error,
            },
        )

    async def broadcast_container_added(
        self,
        container_id: str,
        container_name: str,
        peer_id: str,
        workload_type: str = "generic",
        memory_mb: int = 512,
    ):
        """Broadcast container added event."""
        await self.broadcast(
            MeshEventType.CONTAINER_ADDED,
            {
                "container_id": container_id,
                "container_name": container_name,
                "peer_id": peer_id,
                "workload_type": workload_type,
                "memory_mb": memory_mb,
            },
        )

    async def broadcast_container_removed(
        self,
        container_id: str,
        peer_id: str,
    ):
        """Broadcast container removed event."""
        await self.broadcast(
            MeshEventType.CONTAINER_REMOVED,
            {
                "container_id": container_id,
                "peer_id": peer_id,
            },
        )

    async def broadcast_alert(
        self,
        alert_type: str,
        message: str,
        peer_id: str | None = None,
        severity: str = "warning",
    ):
        """Broadcast alert event."""
        await self.broadcast(
            MeshEventType.ALERT_TRIGGERED,
            {
                "alert_type": alert_type,
                "message": message,
                "peer_id": peer_id,
                "severity": severity,
            },
        )

    def get_stats(self) -> dict[str, Any]:
        """Get server statistics."""
        return {
            "running": self._running,
            "host": self.host,
            "port": self.port,
            "clients_connected": len(self._clients),
            "buffer_size": len(self._event_buffer),
            **self._stats,
        }


class MeshFeedClient:
    """
    WebSocket client that receives mesh events.

    Connects to a MeshFeedServer and forwards events
    to the local MeshEventBus for visualization.
    """

    def __init__(
        self,
        event_bus: MeshEventBus,
        url: str = "ws://localhost:8765",
        reconnect_interval: float = 5.0,
        auto_reconnect: bool = True,
    ):
        self.event_bus = event_bus
        self.url = url
        self.reconnect_interval = reconnect_interval
        self.auto_reconnect = auto_reconnect

        self._running = False
        self._connected = False
        self._websocket = None
        self._receive_task: asyncio.Task | None = None
        self._reconnect_task: asyncio.Task | None = None
        self._stats = {
            "events_received": 0,
            "reconnects": 0,
            "errors": 0,
        }

    async def connect(self):
        """Connect to the feed server."""
        if not HAS_WEBSOCKETS:
            logger.warning("websockets not installed, using mock mode")
            self._running = True
            return

        if self._running:
            return

        self._running = True
        self._receive_task = asyncio.create_task(self._receive_loop())
        logger.info(f"Mesh feed client started, connecting to {self.url}")

    async def disconnect(self):
        """Disconnect from the feed server."""
        self._running = False
        self._connected = False

        if self._receive_task:
            self._receive_task.cancel()
            try:
                await self._receive_task
            except asyncio.CancelledError:
                pass

        if self._websocket:
            await self._websocket.close()
            self._websocket = None

        logger.info("Mesh feed client disconnected")

    async def _receive_loop(self):
        """Main receive loop with reconnection."""
        while self._running:
            try:
                async with websockets.connect(self.url) as websocket:
                    self._websocket = websocket
                    self._connected = True
                    logger.info(f"Connected to mesh feed: {self.url}")

                    async for message in websocket:
                        await self._handle_message(message)

            except asyncio.CancelledError:
                break
            except Exception as e:
                self._stats["errors"] += 1
                self._connected = False
                logger.error(f"Connection error: {e}")

                if self.auto_reconnect and self._running:
                    self._stats["reconnects"] += 1
                    logger.info(f"Reconnecting in {self.reconnect_interval}s...")
                    await asyncio.sleep(self.reconnect_interval)
                else:
                    break

    async def _handle_message(self, message: str):
        """Handle a received message."""
        try:
            msg = MeshFeedMessage.from_json(message)

            if msg.message_type == "event" and msg.event_type:
                # Convert to MeshEvent and publish
                try:
                    event_type = MeshEventType(msg.event_type)
                except ValueError:
                    logger.warning(f"Unknown event type: {msg.event_type}")
                    return

                self._stats["events_received"] += 1

                # Publish to local event bus
                await self.event_bus.publish(
                    event_type,
                    msg.data,
                    source_peer_id="mesh_feed",
                )

        except Exception as e:
            logger.error(f"Error handling message: {e}")

    async def send_command(self, command: str, params: dict[str, Any] = None):
        """Send a command to the server."""
        if not self._websocket or not self._connected:
            logger.warning("Not connected to server")
            return False

        try:
            msg = MeshFeedMessage(
                message_type="command",
                data={"command": command, **(params or {})},
            )
            await self._websocket.send(msg.to_json())
            return True
        except Exception as e:
            logger.error(f"Error sending command: {e}")
            return False

    def get_stats(self) -> dict[str, Any]:
        """Get client statistics."""
        return {
            "running": self._running,
            "connected": self._connected,
            "url": self.url,
            **self._stats,
        }


# Convenience functions
def create_mesh_feed_server(
    peer_registry=None,
    load_balancer=None,
    host: str = "0.0.0.0",
    port: int = 8765,
) -> MeshFeedServer:
    """Create a mesh feed server."""
    return MeshFeedServer(
        peer_registry=peer_registry,
        load_balancer=load_balancer,
        host=host,
        port=port,
    )


def create_mesh_feed_client(
    event_bus: MeshEventBus,
    url: str = "ws://localhost:8765",
) -> MeshFeedClient:
    """Create a mesh feed client."""
    return MeshFeedClient(
        event_bus=event_bus,
        url=url,
    )
