#!/usr/bin/env python3
"""
Terminal WebSocket Bridge

Bridges G-Shell terminal state to the PixiJS Infinite Map via WebSocket.
This enables the terminal to appear as a live, glow-mapped tile on the visual substrate.

Architecture:
┌─────────────────┐     ┌──────────────────────┐     ┌─────────────────┐
│ G-Shell         │ ──► │ terminal_fragment    │ ──► │ WebSocket       │
│ (PTY output)    │     │ .ascii               │     │ Broadcast       │
└─────────────────┘     └──────────────────────┘     └─────────────────┘
                                                              │
                                                              ▼
                                                      ┌─────────────────┐
                                                      │ PixiJS Infinite │
                                                      │ Map (Terminal   │
                                                      │  Tile)          │
                                                      └─────────────────┘

Usage:
    # Start as standalone bridge
    python3 systems/visual_shell/terminal_websocket_bridge.py

    # Or integrate with infinite_desktop_server.py
"""

import asyncio
import json
import logging
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional, Callable, Set

try:
    import websockets
    from websockets.server import serve, WebSocketServerProtocol
    WEBSOCKETS_AVAILABLE = True
except ImportError:
    WEBSOCKETS_AVAILABLE = False
    WebSocketServerProtocol = None

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("terminal-ws-bridge")

# Project root
PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent

# State paths
TERMINAL_FRAGMENT_PATH = PROJECT_ROOT / ".geometry" / "ascii_scene" / "terminal_fragment.ascii"
GNB_STATE_PATH = PROJECT_ROOT / ".geometry" / "gnb_state.ascii"
TEXTURE_PATH = PROJECT_ROOT / ".geometry" / "tectonic" / "textures"


@dataclass
class TerminalTile:
    """Represents a terminal tile on the infinite map."""
    tile_id: int
    x: float
    y: float
    width: float = 800
    height: float = 600
    content: str = ""
    texture_path: Optional[str] = None
    last_update: float = 0.0
    glow_intensity: float = 0.0


class TerminalWebSocketBridge:
    """
    Bridges terminal state to WebSocket clients.

    Features:
    - Watches terminal fragment file for changes
    - Broadcasts updates to connected WebSocket clients
    - Manages terminal tile state (position, content, glow)
    """

    def __init__(
        self,
        host: str = "localhost",
        port: int = 8766,
        watch_interval: float = 0.1
    ):
        self.host = host
        self.port = port
        self.watch_interval = watch_interval

        self.clients: Set[WebSocketServerProtocol] = set()
        self.tiles: dict[int, TerminalTile] = {}
        self.next_tile_id = 0

        self._running = False
        self._last_fragment_mtime = 0.0
        self._last_fragment_content = ""

    async def handle_client(self, websocket: WebSocketServerProtocol):
        """Handle a WebSocket client connection."""
        self.clients.add(websocket)
        client_addr = websocket.remote_address
        logger.info(f"✅ Terminal WS client connected: {client_addr}")

        try:
            # Send initial state
            await self.send_terminal_state(websocket)

            # Listen for client messages
            async for message in websocket:
                await self.handle_message(websocket, message)

        except websockets.exceptions.ConnectionClosed:
            pass
        finally:
            self.clients.discard(websocket)
            logger.info(f"❌ Terminal WS client disconnected: {client_addr}")

    async def handle_message(self, websocket: WebSocketServerProtocol, message: str):
        """Handle incoming message from client."""
        try:
            data = json.loads(message)
            action = data.get("action")

            if action == "get_terminal_state":
                await self.send_terminal_state(websocket)

            elif action == "move_tile":
                tile_id = data.get("tile_id")
                x, y = data.get("x"), data.get("y")
                if tile_id in self.tiles:
                    self.tiles[tile_id].x = x
                    self.tiles[tile_id].y = y
                    await self.broadcast_tile_update(tile_id)

            elif action == "resize_tile":
                tile_id = data.get("tile_id")
                w, h = data.get("width"), data.get("height")
                if tile_id in self.tiles:
                    self.tiles[tile_id].width = w
                    self.tiles[tile_id].height = h
                    await self.broadcast_tile_update(tile_id)

            elif action == "ping":
                await websocket.send(json.dumps({"action": "pong"}))

        except json.JSONDecodeError:
            await websocket.send(json.dumps({
                "action": "error",
                "message": "Invalid JSON"
            }))

    async def send_terminal_state(self, websocket: WebSocketServerProtocol):
        """Send current terminal state to a client."""
        state = await self.get_current_state()
        await websocket.send(json.dumps({
            "action": "terminal_state",
            "tiles": {
                tid: {
                    "tile_id": t.tile_id,
                    "x": t.x,
                    "y": t.y,
                    "width": t.width,
                    "height": t.height,
                    "content": t.content,
                    "texture_path": t.texture_path,
                    "glow_intensity": t.glow_intensity
                }
                for tid, t in self.tiles.items()
            },
            "fragment_content": state.get("content", ""),
            "timestamp": time.time()
        }))

    async def broadcast_tile_update(self, tile_id: int):
        """Broadcast tile update to all clients."""
        if tile_id not in self.tiles or not self.clients:
            return

        tile = self.tiles[tile_id]
        message = json.dumps({
            "action": "tile_update",
            "tile": {
                "tile_id": tile.tile_id,
                "x": tile.x,
                "y": tile.y,
                "width": tile.width,
                "height": tile.height,
                "content": tile.content,
                "texture_path": tile.texture_path,
                "glow_intensity": tile.glow_intensity
            }
        })

        await self._broadcast(message)

    async def broadcast_terminal_content(self, content: str):
        """Broadcast terminal content update to all clients."""
        message = json.dumps({
            "action": "terminal_content",
            "content": content,
            "timestamp": time.time()
        })
        await self._broadcast(message)

    async def _broadcast(self, message: str):
        """Broadcast message to all connected clients."""
        if not self.clients:
            return

        # Send to all clients, removing any that fail
        disconnected = set()
        for client in self.clients:
            try:
                await client.send(message)
            except Exception:
                disconnected.add(client)

        for client in disconnected:
            self.clients.discard(client)

    async def get_current_state(self) -> dict:
        """Get current terminal state from fragment file."""
        result = {
            "content": "",
            "texture_path": None,
            "timestamp": time.time()
        }

        # Read terminal fragment
        if TERMINAL_FRAGMENT_PATH.exists():
            try:
                result["content"] = TERMINAL_FRAGMENT_PATH.read_text()
                result["fragment_exists"] = True
            except Exception as e:
                logger.warning(f"Failed to read terminal fragment: {e}")
                result["fragment_exists"] = False

        # Check for native texture
        if TEXTURE_PATH.exists():
            textures = list(TEXTURE_PATH.glob("native_terminal_*.rts.png"))
            if textures:
                # Get most recent
                latest = max(textures, key=lambda p: p.stat().st_mtime)
                result["texture_path"] = str(latest)
                result["texture_mtime"] = latest.stat().st_mtime

        return result

    async def watch_terminal_state(self):
        """Watch terminal fragment for changes and broadcast updates."""
        logger.info(f"👁️ Watching terminal state: {TERMINAL_FRAGMENT_PATH}")

        while self._running:
            try:
                if TERMINAL_FRAGMENT_PATH.exists():
                    mtime = TERMINAL_FRAGMENT_PATH.stat().st_mtime

                    if mtime > self._last_fragment_mtime:
                        self._last_fragment_mtime = mtime

                        content = TERMINAL_FRAGMENT_PATH.read_text()
                        if content != self._last_fragment_content:
                            self._last_fragment_content = content

                            # Calculate glow intensity based on activity
                            glow = min(1.0, len(content) / 10000)

                            # Update or create tile
                            if 0 not in self.tiles:
                                self.tiles[0] = TerminalTile(
                                    tile_id=0,
                                    x=0,
                                    y=0,
                                    content=content,
                                    glow_intensity=glow,
                                    last_update=time.time()
                                )
                            else:
                                self.tiles[0].content = content
                                self.tiles[0].glow_intensity = glow
                                self.tiles[0].last_update = time.time()

                            # Broadcast update
                            await self.broadcast_terminal_content(content)
                            logger.debug(f"Terminal content updated ({len(content)} chars)")

            except Exception as e:
                logger.warning(f"Error watching terminal state: {e}")

            await asyncio.sleep(self.watch_interval)

    async def start(self):
        """Start the WebSocket server and file watcher."""
        if not WEBSOCKETS_AVAILABLE:
            logger.error("websockets library not installed. Run: pip install websockets")
            return

        self._running = True

        logger.info(f"🚀 Starting Terminal WebSocket Bridge on ws://{self.host}:{self.port}")

        # Start file watcher in background
        watcher_task = asyncio.create_task(self.watch_terminal_state())

        # Start WebSocket server
        async with serve(self.handle_client, self.host, self.port):
            logger.info(f"✅ Terminal WS Bridge ready at ws://{self.host}:{self.port}")
            logger.info(f"   Connect from PixiJS to receive terminal updates")

            # Keep running
            while self._running:
                await asyncio.sleep(1)

        watcher_task.cancel()

    def stop(self):
        """Stop the server."""
        self._running = False
        logger.info("🛑 Terminal WS Bridge stopped")


# Integration with Infinite Desktop Server
def create_terminal_router(bridge: TerminalWebSocketBridge):
    """Create an aiohttp router for terminal endpoints."""
    from aiohttp import web

    async def get_terminal_state(request):
        """HTTP endpoint to get terminal state."""
        state = await bridge.get_current_state()
        return web.json_response(state)

    async def get_terminal_tiles(request):
        """HTTP endpoint to get all terminal tiles."""
        return web.json_response({
            "tiles": [
                {
                    "tile_id": t.tile_id,
                    "x": t.x,
                    "y": t.y,
                    "width": t.width,
                    "height": t.height,
                    "content_preview": t.content[:500] if t.content else "",
                    "glow_intensity": t.glow_intensity
                }
                for t in bridge.tiles.values()
            ]
        })

    router = web.RouteTableDef()
    router.get("/api/terminal/state")(get_terminal_state)
    router.get("/api/terminal/tiles")(get_terminal_tiles)

    return router


async def main():
    """Main entry point."""
    bridge = TerminalWebSocketBridge()

    try:
        await bridge.start()
    except KeyboardInterrupt:
        bridge.stop()


if __name__ == "__main__":
    asyncio.run(main())
