"""Spatial Coordinator Bridge for Visual Shell.

Bridges the Spatial Program Coordinator to the PixiJS infinite desktop,
enabling GPU-native glyph applications to render as visual windows.

Protocol:
- Frontend -> Backend: keyboard/mouse events as InterruptPackets
- Backend -> Frontend: app state updates (load, unload, focus, render)

WebSocket Message Types:

Incoming (from frontend):
{
    "type": "interrupt",
    "data": {
        "interrupt_type": "keyboard" | "mouse",
        "payload": <int>,
        "x": <int>,
        "y": <int>
    }
}

Outgoing (to frontend):
{
    "type": "app_loaded",
    "data": {"app_id": <int>, "x": <int>, "y": <int>, "width": <int>, "height": <int>, "flags": <int>}
}
{
    "type": "app_unloaded",
    "data": {"app_id": <int>}
}
{
    "type": "focus_changed",
    "data": {"app_id": <int> | null}
}
{
    "type": "frame_tick",
    "data": {"frame": <int>, "app_count": <int>}
}
"""

import asyncio
import json
import logging
from typing import Optional, Set

from websockets.asyncio.server import ServerConnection, serve
from websockets.exceptions import ConnectionClosed

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [SPATIAL-BRIDGE] %(message)s'
)
logger = logging.getLogger("spatial-bridge")

# Import Spatial Coordinator
try:
    from systems.spatial_coordinator import (
        Coordinator,
        InterruptPacket,
        InterruptType,
        CapabilityFlags,
    )
except ImportError as e:
    logger.warning(f"Spatial Coordinator not available: {e}")
    Coordinator = None


class SpatialCoordinatorBridge:
    """WebSocket bridge between Spatial Coordinator and Visual Shell."""

    def __init__(self, host: str = "localhost", port: int = 8769):
        self.host = host
        self.port = port
        self.coordinator: Optional[Coordinator] = None
        self.clients: Set[ServerConnection] = set()
        self._running = False
        self._frame_task: Optional[asyncio.Task] = None

    def initialize_coordinator(self, map_width: int = 1024, map_height: int = 1024):
        """Initialize the Spatial Coordinator."""
        if Coordinator is None:
            raise RuntimeError("Spatial Coordinator not available")
        self.coordinator = Coordinator(map_width=map_width, map_height=map_height)
        logger.info(f"Initialized Coordinator ({map_width}x{map_height})")

    async def broadcast(self, message: dict):
        """Send message to all connected clients."""
        if not self.clients:
            return
        data = json.dumps(message)
        await asyncio.gather(
            *[client.send(data) for client in self.clients],
            return_exceptions=True
        )

    async def handle_client(self, websocket: ServerConnection):
        """Handle WebSocket client connection."""
        self.clients.add(websocket)
        logger.info(f"Client connected from {websocket.remote_address}")

        # Send current state
        await self._send_full_state(websocket)

        try:
            async for message in websocket:
                try:
                    data = json.loads(message)
                    await self._handle_message(data, websocket)
                except json.JSONDecodeError:
                    logger.error("Invalid JSON received")
                except Exception as e:
                    logger.error(f"Error handling message: {e}")
        except ConnectionClosed:
            pass
        finally:
            self.clients.discard(websocket)
            logger.info("Client disconnected")

    async def _send_full_state(self, websocket: ServerConnection):
        """Send complete coordinator state to a client."""
        if self.coordinator is None:
            return

        # Send all loaded apps
        for app_id in range(self.coordinator._next_app_id):
            region = self.coordinator.get_app_region(app_id)
            header = self.coordinator.get_app_header(app_id)
            if region and header:
                await websocket.send(json.dumps({
                    "type": "app_loaded",
                    "data": {
                        "app_id": app_id,
                        "x": region.x,
                        "y": region.y,
                        "width": region.width,
                        "height": region.height,
                        "flags": header.flags,
                    }
                }))

        # Send current focus
        await websocket.send(json.dumps({
            "type": "focus_changed",
            "data": {"app_id": self.coordinator.focused_app_id}
        }))

    async def _handle_message(self, data: dict, websocket: ServerConnection):
        """Process incoming WebSocket message."""
        if self.coordinator is None:
            return

        msg_type = data.get("type")

        if msg_type == "interrupt":
            await self._handle_interrupt(data.get("data", {}))
        elif msg_type == "load_app":
            await self._handle_load_app(data.get("data", {}))
        elif msg_type == "unload_app":
            await self._handle_unload_app(data.get("data", {}))
        elif msg_type == "tick":
            await self._handle_tick()
        else:
            logger.debug(f"Unknown message type: {msg_type}")

    async def _handle_interrupt(self, data: dict):
        """Inject interrupt into coordinator."""
        if self.coordinator is None:
            return

        interrupt_type_str = data.get("interrupt_type", "keyboard")
        interrupt_type = (
            InterruptType.KEYBOARD if interrupt_type_str == "keyboard"
            else InterruptType.MOUSE
        )

        packet = InterruptPacket(
            type=interrupt_type,
            payload=data.get("payload", 0),
            timestamp=self.coordinator.frame_count,
            source=data.get("source", 0),
            x=data.get("x", 0),
            y=data.get("y", 0),
        )

        result = self.coordinator.inject_interrupt(packet)
        logger.debug(f"Interrupt injected: {interrupt_type_str} -> {result}")

    async def _handle_load_app(self, data: dict):
        """Load app from binary data (base64 encoded)."""
        import base64

        if self.coordinator is None:
            return

        app_data_b64 = data.get("binary")
        if not app_data_b64:
            logger.error("load_app requires 'binary' field (base64)")
            return

        try:
            app_data = base64.b64decode(app_data_b64)
        except Exception as e:
            logger.error(f"Invalid base64: {e}")
            return

        app_id = self.coordinator.load_app(app_data)
        if app_id is None:
            logger.error("Failed to load app")
            return

        region = self.coordinator.get_app_region(app_id)
        header = self.coordinator.get_app_header(app_id)

        await self.broadcast({
            "type": "app_loaded",
            "data": {
                "app_id": app_id,
                "x": region.x,
                "y": region.y,
                "width": region.width,
                "height": region.height,
                "flags": header.flags,
            }
        })
        logger.info(f"App {app_id} loaded at ({region.x}, {region.y}) {region.width}x{region.height}")

    async def _handle_unload_app(self, data: dict):
        """Unload an app."""
        if self.coordinator is None:
            return

        app_id = data.get("app_id")
        if app_id is None:
            return

        result = self.coordinator.unload_app(app_id)
        if result:
            await self.broadcast({
                "type": "app_unloaded",
                "data": {"app_id": app_id}
            })
            logger.info(f"App {app_id} unloaded")

    async def _handle_tick(self):
        """Advance coordinator by one frame."""
        if self.coordinator is None:
            return

        old_focus = self.coordinator.focused_app_id
        self.coordinator.tick()

        # Check for focus change
        new_focus = self.coordinator.focused_app_id
        if old_focus != new_focus:
            await self.broadcast({
                "type": "focus_changed",
                "data": {"app_id": new_focus}
            })

        # Broadcast frame tick
        await self.broadcast({
            "type": "frame_tick",
            "data": {
                "frame": self.coordinator.frame_count,
                "app_count": self.coordinator.app_count,
            }
        })

    async def _frame_loop(self):
        """Background frame ticker (60fps target)."""
        self._running = True
        while self._running:
            await self._handle_tick()
            await asyncio.sleep(1/60)  # ~60fps

    async def run(self, auto_tick: bool = False):
        """Start the WebSocket server.

        Args:
            auto_tick: If True, automatically advance coordinator at 60fps
        """
        if self.coordinator is None:
            self.initialize_coordinator()

        logger.info(f"Starting Spatial Coordinator Bridge on ws://{self.host}:{self.port}")

        if auto_tick:
            self._frame_task = asyncio.create_task(self._frame_loop())

        async with serve(self.handle_client, self.host, self.port):
            await asyncio.Future()  # Run forever

    def stop(self):
        """Stop the bridge."""
        self._running = False
        if self._frame_task:
            self._frame_task.cancel()


# Demo/test entry point
async def demo():
    """Run a demo of the Spatial Coordinator Bridge."""
    bridge = SpatialCoordinatorBridge()

    # Pre-load a demo counter app
    bridge.initialize_coordinator()
    demo_app = (
        b'GEOS'  # Magic
        + (32).to_bytes(2, 'little')   # Width
        + (16).to_bytes(2, 'little')   # Height
        + b'\x40\x00'  # Mem size: 64
        + b'\x00\x00'  # Entry point
        + b'\x00\x00'  # Handler offset
        + CapabilityFlags.WANTS_KEYBOARD.to_bytes(2, 'little')  # Flags
        + b'\x00' * (32 * 16)  # Code
    )
    app_id = bridge.coordinator.load_app(demo_app)
    logger.info(f"Demo app loaded: {app_id}")

    await bridge.run(auto_tick=True)


if __name__ == "__main__":
    try:
        asyncio.run(demo())
    except KeyboardInterrupt:
        logger.info("Bridge stopped")
