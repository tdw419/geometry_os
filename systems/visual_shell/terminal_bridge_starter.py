#!/usr/bin/env python3
"""
Terminal Bridge Starter

Starts the G-Shell terminal with visual substrate integration.
Launches both the WebSocket bridge and connects to the PixiJS frontend.

Usage:
    python3 systems/visual_shell/terminal_bridge_starter.py

This will:
1. Start the Terminal WebSocket Bridge (port 8766)
2. Connect it to the Infinite Desktop Server (port 8080)
3. Launch G-Shell with visual sync enabled
"""

import asyncio
import subprocess
import sys
import time
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from systems.visual_shell.terminal_websocket_bridge import TerminalWebSocketBridge


async def start_bridge():
    """Start the terminal WebSocket bridge."""
    bridge = TerminalWebSocketBridge(
        host="localhost",
        port=8766,
        watch_interval=0.1
    )

    print("=" * 60)
    print("GEOMETRY OS - TERMINAL VISUAL BRIDGE")
    print("=" * 60)
    print()
    print("This bridge connects G-Shell to the PixiJS Infinite Map.")
    print()
    print("Architecture:")
    print("  G-Shell PTY")
    print("      ↓")
    print("  .geometry/ascii_scene/terminal_fragment.ascii")
    print("      ↓")
    print("  WebSocket Bridge (ws://localhost:8766)")
    print("      ↓")
    print("  PixiJS Terminal Tile (glow-mapped)")
    print()
    print("-" * 60)
    print()
    print("To use:")
    print("  1. Start the PixiJS frontend: python3 systems/visual_shell/server/infinite_desktop_server.py")
    print("  2. Open browser to: http://localhost:8080")
    print("  3. Start G-Shell: python3 geometry_os_cli.py shell --native")
    print("  4. Terminal output will appear as a live tile on the map")
    print()
    print("-" * 60)

    await bridge.start()


def main():
    """Main entry point."""
    try:
        asyncio.run(start_bridge())
    except KeyboardInterrupt:
        print("\n\n🛑 Terminal Bridge stopped")


if __name__ == "__main__":
    main()
