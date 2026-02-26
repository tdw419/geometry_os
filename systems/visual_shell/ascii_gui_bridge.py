"""
ASCII GUI Bridge - Connects ASCII fragments to Visual Shell frontend.

This bridge:
1. Reads ASCII fragments from .geometry/gui/fragments/ and broadcasts to frontend
2. Processes commands from .geometry/gui/commands/pending/ and sends to frontend
3. Receives window events from frontend and updates ASCII fragments

This enables AI agents to read/write ASCII text files and control the real GUI.
"""

import asyncio
import json
import yaml
from pathlib import Path
from datetime import datetime
from typing import Dict, Any, Optional, List, Callable
from dataclasses import dataclass, field
import logging

logger = logging.getLogger(__name__)

# Project root
PROJECT_ROOT = Path(__file__).parent.parent.parent.parent
GUI_DIR = PROJECT_ROOT / ".geometry" / "gui"


@dataclass
class WindowState:
    """Represents a window's state for ASCII rendering."""
    id: str
    title: str
    type: str
    pos: List[int]
    size: List[int]
    z: int = 0
    focused: bool = False
    visible: bool = True
    metadata: Dict[str, Any] = field(default_factory=dict)


class ASCIIGUIBridge:
    """
    Bridge between ASCII GUI fragments and Visual Shell frontend.

    Usage:
        bridge = ASCIIGUIBridge(broadcast_callback)
        await bridge.start()

    The broadcast_callback should accept a dict and send it via WebSocket.
    """

    def __init__(
        self,
        broadcast_callback: Callable[[Dict[str, Any]], None],
        gui_dir: Optional[Path] = None
    ):
        self.broadcast = broadcast_callback
        self.gui_dir = gui_dir or GUI_DIR
        self.fragments_dir = self.gui_dir / "fragments"
        self.pending_dir = self.gui_dir / "commands" / "pending"
        self.completed_dir = self.gui_dir / "commands" / "completed"

        # Ensure directories exist
        self.fragments_dir.mkdir(parents=True, exist_ok=True)
        self.pending_dir.mkdir(parents=True, exist_ok=True)
        self.completed_dir.mkdir(parents=True, exist_ok=True)

        # Current window state
        self.windows: Dict[str, WindowState] = {}
        self.focused_window_id: Optional[str] = None

        # Running state
        self._running = False
        self._last_fragment_hash: Dict[str, str] = {}

    async def start(self):
        """Start the bridge - load initial state and begin processing."""
        self._running = True
        await self._load_windows_fragment()
        logger.info(f"ASCII GUI Bridge started, watching {self.gui_dir}")

    async def stop(self):
        """Stop the bridge."""
        self._running = False

    # === Fragment Reading (AI reads GUI state) ===

    async def _load_windows_fragment(self):
        """Load windows.yaml into internal state."""
        yaml_path = self.fragments_dir / "windows.yaml"
        if not yaml_path.exists():
            return

        try:
            with open(yaml_path) as f:
                data = yaml.safe_load(f) or {}

            self.windows.clear()
            for win_data in data.get("windows", []):
                win = WindowState(
                    id=win_data["id"],
                    title=win_data["title"],
                    type=win_data["type"],
                    pos=win_data["pos"],
                    size=win_data["size"],
                    z=win_data.get("z", 0),
                    focused=win_data.get("focused", False),
                    visible=win_data.get("visible", True),
                    metadata=win_data.get("metadata", {})
                )
                self.windows[win.id] = win
                if win.focused:
                    self.focused_window_id = win.id

            logger.debug(f"Loaded {len(self.windows)} windows from fragment")
        except Exception as e:
            logger.error(f"Failed to load windows fragment: {e}")

    def get_windows_yaml(self) -> str:
        """Get current windows state as YAML string."""
        windows_data = []
        for win in sorted(self.windows.values(), key=lambda w: -w.z):
            windows_data.append({
                "id": win.id,
                "title": win.title,
                "type": win.type,
                "pos": win.pos,
                "size": win.size,
                "z": win.z,
                "focused": win.focused,
                "visible": win.visible,
                "metadata": win.metadata
            })

        data = {
            "windows": windows_data,
            "count": len(windows_data),
            "focused_id": self.focused_window_id,
            "last_update": datetime.now().isoformat()
        }
        return yaml.dump(data, default_flow_style=False)

    # === Command Processing (AI writes commands) ===

    async def process_pending_commands(self):
        """
        Process all pending commands from .geometry/gui/commands/pending/.

        Commands are YAML files with format:
            command_id: <uuid>
            action: focus|close|move|resize|create
            target: <window-id>
            params: {...}
            timestamp: <ISO8601>
            source: <agent-name>
        """
        if not self.pending_dir.exists():
            return

        for cmd_file in list(self.pending_dir.glob("*.yaml")):
            try:
                await self._process_command_file(cmd_file)
            except Exception as e:
                logger.error(f"Failed to process command {cmd_file}: {e}")
                # Move to completed with error
                self._move_to_completed(cmd_file, error=str(e))

    async def _process_command_file(self, cmd_path: Path):
        """Process a single command file."""
        with open(cmd_path) as f:
            command = yaml.safe_load(f)

        action = command.get("action")
        target = command.get("target")
        params = command.get("params", {})
        cmd_id = command.get("command_id", cmd_path.stem)

        logger.info(f"Processing command: {action} on {target}")

        # Broadcast to frontend
        message = {
            "type": "GUI_COMMAND",
            "command_id": cmd_id,
            "action": action,
            "target": target,
            "params": params,
            "source": command.get("source", "unknown"),
            "timestamp": command.get("timestamp", datetime.now().isoformat())
        }

        await self.broadcast(message)

        # Update internal state based on action
        if action == "focus" and target in self.windows:
            # Unfocus all, focus target
            for win in self.windows.values():
                win.focused = False
            self.windows[target].focused = True
            self.focused_window_id = target

        elif action == "close" and target in self.windows:
            del self.windows[target]
            if self.focused_window_id == target:
                self.focused_window_id = None

        elif action == "create":
            win = WindowState(
                id=target,
                title=params.get("title", "New Window"),
                type=params.get("type", "terminal"),
                pos=params.get("pos", [100, 100]),
                size=params.get("size", [400, 300]),
                z=params.get("z", 0),
                focused=params.get("focused", False),
                visible=True
            )
            self.windows[target] = win
            if win.focused:
                self.focused_window_id = target

        elif action == "move" and target in self.windows:
            if "pos" in params:
                self.windows[target].pos = params["pos"]

        elif action == "resize" and target in self.windows:
            if "size" in params:
                self.windows[target].size = params["size"]

        # Update fragments
        await self._update_fragments()

        # Move to completed
        self._move_to_completed(cmd_path)

    def _move_to_completed(self, cmd_path: Path, error: Optional[str] = None):
        """Move command file to completed directory."""
        completed_path = self.completed_dir / cmd_path.name

        # If there was an error, append it to the file
        if error:
            with open(cmd_path, 'a') as f:
                f.write(f"\nerror: \"{error}\"\n")
            completed_path = self.completed_dir / f"{cmd_path.stem}_error.yaml"

        cmd_path.rename(completed_path)

    async def _update_fragments(self):
        """Update all ASCII fragments from current state."""
        # Update windows.yaml
        yaml_path = self.fragments_dir / "windows.yaml"
        yaml_path.write_text(self.get_windows_yaml())

        # Update focus.ascii
        focus_path = self.fragments_dir / "focus.ascii"
        focus_path.write_text(self._render_focus_ascii())

    def _render_focus_ascii(self) -> str:
        """Render focus state as ASCII box."""
        focused = None
        if self.focused_window_id and self.focused_window_id in self.windows:
            focused = self.windows[self.focused_window_id]

        lines = [
            "+----------------------------------------------------------+",
            "| FOCUS STATE                                              |",
            "+----------------------------------------------------------+",
        ]

        if focused:
            lines.extend([
                f"| Window:     {focused.id} ({focused.title})".ljust(60) + "|",
                f"| Element:    none".ljust(60) + "|",
                f"| Cursor:     (0, 0)".ljust(60) + "|",
                f"| Mode:       normal".ljust(60) + "|",
            ])
        else:
            lines.extend([
                "| Window:     none".ljust(60) + "|",
                "| Element:    none".ljust(60) + "|",
            ])

        lines.append("+----------------------------------------------------------+")
        return "\n".join(lines)

    # === Frontend Event Handlers (update ASCII from frontend) ===

    async def on_window_create(self, window: WindowState):
        """Handle window creation from frontend."""
        self.windows[window.id] = window
        if window.focused:
            self.focused_window_id = window.id
        await self._update_fragments()
        logger.info(f"Window created: {window.id}")

    async def on_window_close(self, window_id: str):
        """Handle window close from frontend."""
        if window_id in self.windows:
            del self.windows[window_id]
            if self.focused_window_id == window_id:
                self.focused_window_id = None
            await self._update_fragments()
            logger.info(f"Window closed: {window_id}")

    async def on_window_focus(self, window_id: str):
        """Handle window focus from frontend."""
        if window_id in self.windows:
            for win in self.windows.values():
                win.focused = False
            self.windows[window_id].focused = True
            self.focused_window_id = window_id
            await self._update_fragments()

    async def on_window_move(self, window_id: str, pos: List[int]):
        """Handle window move from frontend."""
        if window_id in self.windows:
            self.windows[window_id].pos = pos
            await self._update_fragments()

    async def on_window_resize(self, window_id: str, size: List[int]):
        """Handle window resize from frontend."""
        if window_id in self.windows:
            self.windows[window_id].size = size
            await self._update_fragments()

    async def on_mouse_move(self, x: int, y: int, hovering: Optional[str] = None):
        """Handle mouse movement - update mouse.ascii fragment."""
        mouse_path = self.fragments_dir / "mouse.ascii"
        content = f"""+----------------------------------------------------------+
| MOUSE STATE                                              |
+----------------------------------------------------------+
| Position:   ({x}, {y})".ljust(41) + "|
| Buttons:    none".ljust(60) + "|
| Hovering:   {hovering or 'none'}".ljust(60) + "|
+----------------------------------------------------------+
"""
        mouse_path.write_text(content)

    async def on_key_event(self, modifiers: str, pressed: str, last_key: str):
        """Handle keyboard event - update keyboard.ascii fragment."""
        kb_path = self.fragments_dir / "keyboard.ascii"
        content = f"""+----------------------------------------------------------+
| KEYBOARD STATE                                           |
+----------------------------------------------------------+
| Modifiers:  {modifiers}".ljust(60) + "|
| Pressed:    {pressed}".ljust(60) + "|
| Last Key:   {last_key}".ljust(60) + "|
+----------------------------------------------------------+
"""
        kb_path.write_text(content)


# Convenience function for integration
def create_ascii_gui_bridge(broadcast_callback: Callable) -> ASCIIGUIBridge:
    """Create an ASCII GUI bridge with the given broadcast callback."""
    return ASCIIGUIBridge(broadcast_callback)
