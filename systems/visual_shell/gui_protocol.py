"""
AI GUI Operation Protocol
The standard protocol for autonomous agents to interact with GUI applications.

Implements a 4-layer reliability hierarchy:
1. Direct Command (Shortcuts/CLI)
2. Semantic API (Vision Bridge)
3. Visual Perception (VLM Analysis)
4. Verification (Closed Loop)
"""

import logging
import time
import subprocess
from pathlib import Path
from dataclasses import dataclass
from typing import Optional, Dict, Any, List

from .layers.keyboard_layer import KeyboardLayer
from .layers.semantic_layer import SemanticLayer
from .layers.visual_layer import VisualLayer
from .layers.verification_layer import VerificationLayer

logger = logging.getLogger("gui_protocol")

@dataclass
class ProtocolResult:
    success: bool
    layer_used: int
    message: str
    action_taken: str
    state_snapshot: Optional[str] = None

class GUIProtocol:
    def __init__(self, bridge_dir: str = "/tmp/vision_bridge_1", vnc_display: str = "127.0.0.1:0"):
        self.bridge_dir = Path(bridge_dir)
        self.vnc_display = vnc_display
        self.state_file = self.bridge_dir / "gui_state.txt"
        self.action_file = self.bridge_dir / "actions.txt"
        
        # Initialize layers
        self.keyboard_layer = KeyboardLayer()
        self.semantic_layer = SemanticLayer(str(self.state_file))
        self.visual_layer = VisualLayer()
        self.verifier = VerificationLayer()

    def _execute_direct(self, cmd: str) -> bool:
        """Send command directly to VNC bypassing bridge logic for speed."""
        try:
            parts = cmd.split()
            if parts[0] == "type":
                # Join back the text for 'vncdo type'
                text = " ".join(parts[1:])
                subprocess.run(["vncdo", "-s", self.vnc_display, "type", text], check=True, capture_output=True)
            else:
                subprocess.run(["vncdo", "-s", self.vnc_display] + parts, check=True, capture_output=True)
            return True
        except Exception as e:
            logger.error(f"Direct execution failed: {e}")
            return False

    def _execute_bridge(self, action_text: str) -> bool:
        """Execute action directly via VNC (vncdo)."""
        try:
            parts = action_text.split(":", 1)
            if len(parts) != 2:
                return False

            action = parts[0].strip().lower()
            target = parts[1].strip()

            if action == "click":
                coords = self._find_element_coords(target)
                if coords:
                    x, y = coords
                    print(f"[Protocol] Clicking at ({x}, {y}) via VNC {self.vnc_display}")
                    subprocess.run(["vncdo", "-s", self.vnc_display, "move", str(x), str(y), "click", "1"],
                                 check=True, capture_output=True, timeout=10)
                    return True
                else:
                    return False

            elif action == "type":
                subprocess.run(["vncdo", "-s", self.vnc_display, "type", target],
                             check=True, capture_output=True, timeout=30)
                return True

            elif action == "key":
                subprocess.run(["vncdo", "-s", self.vnc_display, "key", target],
                             check=True, capture_output=True, timeout=10)
                return True

            return False
        except Exception as e:
            logger.error(f"Bridge execution failed: {e}")
            return False

    def _find_element_coords(self, label: str) -> Optional[tuple]:
        """Find element coordinates from state file."""
        if not self.state_file.exists():
            return None

        state_text = self.state_file.read_text()
        label_lower = label.lower()

        for line in state_text.splitlines():
            if label_lower in line.lower() and "@ (" in line:
                # Parse: "- [button] Export @ (850, 120)"
                try:
                    start = line.rfind("@ (")
                    end = line.rfind(")")
                    coords_str = line[start+3:end]
                    x, y = coords_str.split(",")
                    return (int(x.strip()), int(y.strip()))
                except:
                    continue
        return None

    def _get_current_state(self) -> str:
        if self.state_file.exists():
            return self.state_file.read_text()
        return ""

    def operate(self, intent: str, app_context: str = "general") -> ProtocolResult:
        """Execute intent using 4-layer fallback."""
        logger.info(f"Executing intent: {intent} (Context: {app_context})")

        initial_state = self._get_current_state()

        # --- Layer 1: Direct Command (Shortcuts) ---
        shortcut = self.keyboard_layer._find_shortcut(intent, app_context)
        if shortcut:
            print(f"[Protocol] Layer 1: Sending shortcut '{shortcut}'")
            if self._execute_direct(f"key {shortcut}"):
                time.sleep(1)
                if self.verifier.verify(intent, initial_state, self._get_current_state()):
                    return ProtocolResult(True, 1, "Success via Shortcut", f"key:{shortcut}")

        # --- Layer 2: Semantic Match ---
        if self.semantic_layer.execute(intent):
            target = self.semantic_layer._extract_target(intent)
            print(f"[Protocol] Layer 2: Semantic click on '{target}'")
            if self._execute_bridge(f"click: {target}"):
                time.sleep(1)
                if self.verifier.verify(intent, initial_state, self._get_current_state()):
                    return ProtocolResult(True, 2, "Success via Semantic Match", f"click:{target}")

        # --- Layer 3: Visual Fallback (VLM) ---
        print(f"[Protocol] Layer 3: Falling back to Visual Perception...")
        return ProtocolResult(False, 0, "Failed to resolve intent through deterministic layers", "none")
