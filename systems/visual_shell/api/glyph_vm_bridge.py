"""Glyph VM Bridge for Visual Shell.

Bridges the GPU Glyph VM to the PixiJS infinite desktop,
enabling live rendering of glyph applications.

Protocol Extension:
- app_render: Send glyph grid content to frontend
- glyph_write: App writes glyph to display buffer

WebSocket Message Types:

Incoming (from frontend):
{
    "type": "interrupt",
    "data": {"interrupt_type": "keyboard", "payload": <keycode>, "x": 0, "y": 0}
}
{
    "type": "load_app",
    "data": {"binary": "<base64>"}
}

Outgoing (to frontend):
{
    "type": "app_loaded",
    "data": {"app_id": 0, "x": 0, "y": 0, "width": 32, "height": 16}
}
{
    "type": "app_render",
    "data": {"app_id": 0, "glyphs": [[32, 32, ...], ...]}  // 2D array of glyph IDs
}
{
    "type": "register_update",
    "data": {"app_id": 0, "registers": [0, 0, ...]}  // For debugging
}
"""

import asyncio
import json
import logging
import base64
import struct
from typing import Optional, Set, Dict, List

from websockets.asyncio.server import ServerConnection, serve
from websockets.exceptions import ConnectionClosed

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [GLYPH-VM-BRIDGE] %(message)s'
)
logger = logging.getLogger("glyph-vm-bridge")

# Import GPU VM
try:
    from systems.spatial_coordinator.gpu_vm import GPUGlyphVM
    from systems.spatial_coordinator.opcodes import (
        R0, R1, R2, R3,
        R_INT_TYPE, R_INT_PAYLOAD, R_INT_SOURCE,
    )
    HAS_GPU_VM = True
except ImportError as e:
    logger.warning(f"GPU Glyph VM not available: {e}")
    GPUGlyphVM = None
    HAS_GPU_VM = False

# Import AppLoader for app discovery
try:
    from systems.spatial_coordinator.apps import AppLoader
    HAS_APP_LOADER = True
except ImportError as e:
    logger.warning(f"AppLoader not available: {e}")
    AppLoader = None
    HAS_APP_LOADER = False


class GlyphVMBridge:
    """WebSocket bridge between GPU Glyph VM and Visual Shell."""

    def __init__(self, host: str = "localhost", port: int = 8770):
        self.host = host
        self.port = port
        self.vm: Optional[GPUGlyphVM] = None
        self.clients: Set[ServerConnection] = set()
        self._running = False
        self._frame_task: Optional[asyncio.Task] = None
        self._frame_count = 0

        # Glyph display buffers per app (width * height glyphs)
        self._glyph_buffers: Dict[int, List[int]] = {}

        # App loader for loading apps by name
        self._app_loader: Optional[AppLoader] = None

    def initialize_vm(self):
        """Initialize the GPU Glyph VM."""
        if GPUGlyphVM is None:
            raise RuntimeError("GPU Glyph VM not available")
        self.vm = GPUGlyphVM()
        logger.info(f"Initialized GPU Glyph VM (GPU mode: {self.vm.has_gpu})")

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
        """Send complete VM state to a client."""
        if self.vm is None:
            return

        # Send all loaded apps
        for app_id in range(len(self.vm._apps)):
            if self.vm._apps[app_id] is None:
                continue

            app = self.vm._apps[app_id]
            ctx = app['context']

            await websocket.send(json.dumps({
                "type": "app_loaded",
                "data": {
                    "app_id": app_id,
                    "x": ctx.origin_x,
                    "y": ctx.origin_y,
                    "width": ctx.width,
                    "height": ctx.height,
                    "flags": app['flags'],
                }
            }))

            # Send glyph buffer if available
            if app_id in self._glyph_buffers:
                await self._send_glyph_update(websocket, app_id)

    async def _handle_message(self, data: dict, websocket: ServerConnection):
        """Process incoming WebSocket message."""
        if self.vm is None:
            return

        msg_type = data.get("type")

        if msg_type == "interrupt":
            await self._handle_interrupt(data.get("data", {}))
        elif msg_type == "load_app":
            await self._handle_load_app(data.get("data", {}))
        elif msg_type == "load_app_by_name":
            await self._handle_load_app_by_name(data.get("data", {}))
        elif msg_type == "list_apps":
            await self._handle_list_apps()
        elif msg_type == "unload_app":
            await self._handle_unload_app(data.get("data", {}))
        elif msg_type == "tick":
            await self._handle_tick()
        elif msg_type == "write_glyph":
            await self._handle_write_glyph(data.get("data", {}))
        else:
            logger.debug(f"Unknown message type: {msg_type}")

    async def _handle_interrupt(self, data: dict):
        """Inject interrupt into VM."""
        if self.vm is None:
            return

        interrupt_type = data.get("interrupt_type", "keyboard")
        payload = data.get("payload", 0)

        # Find target app (first app that wants input, or focused app)
        target_app = self._find_target_app()
        if target_app is None:
            return

        int_type = 1 if interrupt_type == "keyboard" else 2
        self.vm.set_interrupt(target_app, int_type, payload)

        logger.debug(f"Interrupt: {interrupt_type}={payload} -> app {target_app}")

    def _find_target_app(self) -> Optional[int]:
        """Find app to receive interrupt."""
        if self.vm is None:
            return None

        # Return first non-halted app
        for app_id, app in enumerate(self.vm._apps):
            if app and not app['halted']:
                return app_id
        return None

    async def _handle_load_app(self, data: dict):
        """Load app from binary data (base64 encoded)."""
        if self.vm is None:
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

        app_id = self.vm.load_app(app_data)
        if app_id is None:
            logger.error("Failed to load app")
            return

        app = self.vm._apps[app_id]
        ctx = app['context']

        # Initialize glyph buffer
        glyph_count = ctx.width * ctx.height
        self._glyph_buffers[app_id] = [32] * glyph_count  # Space chars

        await self.broadcast({
            "type": "app_loaded",
            "data": {
                "app_id": app_id,
                "x": ctx.origin_x,
                "y": ctx.origin_y,
                "width": ctx.width,
                "height": ctx.height,
                "flags": app['flags'],
            }
        })

        logger.info(f"App {app_id} loaded at ({ctx.origin_x}, {ctx.origin_y}) {ctx.width}x{ctx.height}")

    async def _handle_load_app_by_name(self, data: dict):
        """Load an app by name using AppLoader discovery, load into bridge's VM."""
        if self.vm is None:
            return

        app_name = data.get("name")
        if not app_name:
            logger.error("load_app_by_name requires 'name' field")
            return

        # Initialize AppLoader for discovery (if needed)
        if self._app_loader is None and HAS_APP_LOADER:
            self._app_loader = AppLoader()
            # Note: We DON'T use AppLoader's VM - we use self.vm directly

        if self._app_loader is None:
            logger.error("AppLoader not available")
            return

        # Check if app exists in discovery
        if app_name not in self._app_loader._app_info:
            logger.error(f"Unknown app: {app_name}")
            await self.broadcast({
                "type": "error",
                "data": {"message": f"Unknown app: {app_name}"}
            })
            return

        # Get the app binary from AppLoader discovery
        app_info = self._app_loader._app_info[app_name]
        app_binary = app_info.get('binary')

        if app_binary is None:
            logger.error(f"App '{app_name}' has no binary")
            return

        # Load into our VM (not AppLoader's VM)
        app_id = self.vm.load_app(app_binary)

        if app_id is None:
            logger.error(f"Failed to load app: {app_name}")
            return

        # Get app info from our VM
        app = self.vm._apps[app_id]
        ctx = app['context']

        # Initialize glyph buffer
        glyph_count = ctx.width * ctx.height
        self._glyph_buffers[app_id] = [32] * glyph_count

        # Broadcast app loaded with name
        await self.broadcast({
            "type": "app_loaded",
            "data": {
                "app_id": app_id,
                "name": app_name,
                "x": ctx.origin_x,
                "y": ctx.origin_y,
                "width": ctx.width,
                "height": ctx.height,
                "flags": app['flags'],
            }
        })

        # Send initial glyph state
        await self._broadcast_glyph_update(app_id)

        logger.info(f"App '{app_name}' loaded as app_id={app_id}")

    async def _handle_list_apps(self):
        """Send list of available apps."""
        # Initialize AppLoader for discovery only if needed
        if self._app_loader is None and HAS_APP_LOADER:
            self._app_loader = AppLoader()
            # Note: AppLoader discovers apps in __init__, no VM needed

        apps = []
        if self._app_loader:
            apps = list(self._app_loader._app_info.keys())

        await self.broadcast({
            "type": "app_list",
            "data": {"apps": apps}
        })
        logger.debug(f"Sent app list: {apps}")

    async def _handle_unload_app(self, data: dict):
        """Unload an app."""
        if self.vm is None:
            return

        app_id = data.get("app_id")
        if app_id is None:
            return

        if app_id < len(self.vm._apps) and self.vm._apps[app_id] is not None:
            self.vm._apps[app_id] = None
            if app_id in self._glyph_buffers:
                del self._glyph_buffers[app_id]

            await self.broadcast({
                "type": "app_unloaded",
                "data": {"app_id": app_id}
            })
            logger.info(f"App {app_id} unloaded")

    async def _handle_tick(self):
        """Advance VM by one frame."""
        if self.vm is None:
            return

        # Run VM
        self.vm.run(max_frames=1)
        self._frame_count += 1

        # Broadcast updates
        await self._broadcast_frame_update()

    async def _handle_write_glyph(self, data: dict):
        """Write glyph to app's display buffer."""
        app_id = data.get("app_id")
        x = data.get("x", 0)
        y = data.get("y", 0)
        glyph = data.get("glyph", 32)

        if app_id is None or app_id not in self._glyph_buffers:
            return

        app = self.vm._apps[app_id]
        if app is None:
            return

        ctx = app['context']
        if x < 0 or x >= ctx.width or y < 0 or y >= ctx.height:
            return

        idx = y * ctx.width + x
        self._glyph_buffers[app_id][idx] = glyph

        # Broadcast glyph update
        await self.broadcast({
            "type": "glyph_update",
            "data": {
                "app_id": app_id,
                "x": x,
                "y": y,
                "glyph": glyph,
            }
        })

    async def _broadcast_frame_update(self):
        """Broadcast frame tick and any changed state."""
        if self.vm is None:
            return

        await self.broadcast({
            "type": "frame_tick",
            "data": {
                "frame": self._frame_count,
                "app_count": self.vm.app_count,
            }
        })

    async def _broadcast_glyph_update(self, app_id: int):
        """Broadcast glyph buffer for an app to all clients."""
        if app_id not in self._glyph_buffers:
            return

        if self.vm is None:
            return

        app = self.vm._apps[app_id]
        if app is None:
            return

        ctx = app['context']

        # Convert to 2D array
        glyphs = self._glyph_buffers[app_id]
        glyph_grid = []
        for y in range(ctx.height):
            row = glyphs[y * ctx.width:(y + 1) * ctx.width]
            glyph_grid.append(row)

        await self.broadcast({
            "type": "app_render",
            "data": {
                "app_id": app_id,
                "glyphs": glyph_grid,
            }
        })

    async def _send_glyph_update(self, websocket: ServerConnection, app_id: int):
        """Send glyph buffer for an app."""
        if app_id not in self._glyph_buffers:
            return

        app = self.vm._apps[app_id]
        if app is None:
            return

        ctx = app['context']

        # Convert to 2D array
        glyphs = self._glyph_buffers[app_id]
        glyph_grid = []
        for y in range(ctx.height):
            row = glyphs[y * ctx.width:(y + 1) * ctx.width]
            glyph_grid.append(row)

        await websocket.send(json.dumps({
            "type": "app_render",
            "data": {
                "app_id": app_id,
                "glyphs": glyph_grid,
            }
        }))

    async def _frame_loop(self):
        """Background frame ticker (60fps target)."""
        self._running = True
        while self._running:
            await self._handle_tick()
            await asyncio.sleep(1/60)  # ~60fps

    async def run(self, auto_tick: bool = False):
        """Start the WebSocket server.

        Args:
            auto_tick: If True, automatically advance VM at 60fps
        """
        if self.vm is None:
            self.initialize_vm()

        logger.info(f"Starting Glyph VM Bridge on ws://{self.host}:{self.port}")
        logger.info(f"GPU mode: {self.vm.has_gpu}")

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
    """Run a demo of the Glyph VM Bridge."""
    bridge = GlyphVMBridge()
    bridge.initialize_vm()

    # Load a simple counter app
    from systems.spatial_coordinator.glyph_vm import assemble, Opcode
    from systems.spatial_coordinator.opcodes import R0, R1, R2, R3

    code = assemble([
        # Counter app: increment R0 on spacebar, display count
        (Opcode.MOVI, R0, 0, 0),        # R0 = 0 (counter)
        (Opcode.MOVI, R1, 0, 0x20),     # R1 = spacebar keycode
        (Opcode.MOV, R2, R_INT_PAYLOAD, 0),  # R2 = INT_PAYLOAD
        (Opcode.CMP, R1, R2, 0),        # Compare R1 == R2
        (Opcode.MOVI, R3, 0, 24),       # R3 = skip address
        (Opcode.JNE, 0, R3, 0),         # Jump if not equal
        (Opcode.ADDI, R0, 0, 1),        # R0 += 1
        # TODO: Add DRAW instruction to display counter
        (Opcode.HALT, 0, 0, 0),         # 24: Halt
    ])

    header = (
        b'GEOS'
        + (32).to_bytes(2, 'little')   # Width
        + (16).to_bytes(2, 'little')   # Height
        + b'\x40\x00'  # Mem size: 64
        + b'\x00\x00'  # Entry point
        + b'\x00\x00'  # Handler offset
        + b'\x01\x00'  # Flags: WANTS_KEYBOARD
    )

    app_bytes = header + code
    app_id = bridge.vm.load_app(app_bytes)

    if app_id is not None:
        ctx = bridge.vm._apps[app_id]['context']
        bridge._glyph_buffers[app_id] = [32] * (ctx.width * ctx.height)
        logger.info(f"Demo counter app loaded: {app_id}")

    await bridge.run(auto_tick=True)


if __name__ == "__main__":
    try:
        asyncio.run(demo())
    except KeyboardInterrupt:
        logger.info("Bridge stopped")
