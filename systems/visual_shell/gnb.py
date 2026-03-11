#!/usr/bin/env python3
"""
Geometric Native Browser (GNB) - Phase 50 Alpha
The "Native Browser" for Geometry OS.

Bypasses the HTML/JS stack to provide a direct, high-performance interface
to the ASCII Scene Graph.

Features:
- Dual-Audience perception: Native GPU rendering + ASCII State mirroring.
- Zero-latency interaction: Direct Python/Rust bridge.
- State-as-Text: All UI transitions are logged as ASCII fragments.
"""

import asyncio
import logging
import sys
import time
from pathlib import Path
from typing import Any

# Configure logging
logging.basicConfig(level=logging.INFO, format='[GNB] %(message)s')
logger = logging.getLogger("GNB")

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent
ASCII_SCENE_DIR = PROJECT_ROOT / ".geometry" / "ascii_scene"

class GNB:
    def __init__(self, headless: bool = False):
        self.headless = headless
        self.active = True
        self.state_file = PROJECT_ROOT / ".geometry" / "gnb_state.ascii"
        self._ensure_dirs()

    def _ensure_dirs(self):
        ASCII_SCENE_DIR.mkdir(parents=True, exist_ok=True)
        (PROJECT_ROOT / ".geometry").mkdir(parents=True, exist_ok=True)

    async def run(self):
        logger.info("🚀 Geometric Native Browser Starting...")
        logger.info(f"📁 Watching ASCII Scene: {ASCII_SCENE_DIR}")

        if not self.headless:
            logger.info("🖥️  Native Window Mode: Enabled (WGPU)")
        else:
            logger.info("🤖 Headless Mode: AI Perception active")

        try:
            while self.active:
                # 1. Read ASCII Scene Fragments
                scene = self._read_scene()

                # 2. Update Internal State Mirror
                self._update_mirror(scene)

                # 3. Render (Simulated for Alpha)
                if not self.headless:
                    self._render_native(scene)

                await asyncio.sleep(1.0) # 1Hz for state polling in Alpha
        except KeyboardInterrupt:
            self.stop()

    def _read_scene(self) -> dict[str, Any]:
        """Read all fragments from the ASCII Scene directory."""
        scene = {
            "windows": [],
            "metrics": {},
            "input": {}
        }

        try:
            fragments_file = ASCII_SCENE_DIR / "shell_fragments.ascii"
            if fragments_file.exists():
                # For Alpha, we'll just check if the file exists and has content
                content = fragments_file.read_text()
                scene["windows_raw"] = content

            state_file = ASCII_SCENE_DIR / "shell_state.ascii"
            if state_file.exists():
                scene["state_raw"] = state_file.read_text()
        except Exception as e:
            logger.error(f"Failed to read scene fragments: {e}")

        return scene

    def _update_mirror(self, scene: dict[str, Any]):
        """Update the GNB state file for AI perception."""
        mirror_content = [
            "GEOMETRIC NATIVE BROWSER - STATE MIRROR",
            f"TIMESTAMP: {time.time()}",
            f"MODE: {'HEADLESS' if self.headless else 'WINDOWED'}",
            "---",
            "SCENE SUMMARY:",
            scene.get("state_raw", "No state data detected."),
            "---",
            "WINDOW TOPOLOGY:",
            scene.get("windows_raw", "No windows detected.")
        ]

        with open(self.state_file, "w") as f:
            f.write("\n".join(mirror_content))

    def _render_native(self, scene: dict[str, Any]):
        """Render the scene via WGPU (Stub for Alpha)."""
        # In a real implementation, this would use systems/native/ libraries
        pass

    def stop(self):
        self.active = False
        logger.info("🛑 GNB Shutting down...")

if __name__ == "__main__":
    headless_mode = "--headless" in sys.argv
    gnb = GNB(headless=headless_mode)
    asyncio.run(gnb.run())
