"""
VisualShellAsciiRenderer - ASCII visualization of Visual Shell for AI perception.

Emits .ascii files representing the Visual Shell state including:
- YAML-like tree of active windows
- Input state (keyboard, mouse)
- Global metrics (window count, memory, FPS)

Part of ASCII Scene Graph expansion for zero-cost AI perception.
"""

import os
import tempfile
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any
import asyncio
import logging

from systems.visual_shell.ascii_scene.hooks import VisualShellHook

logger = logging.getLogger(__name__)


@dataclass
class Window:
    """Represents a window in the Visual Shell."""
    id: int
    title: str
    pos: Tuple[int, int]
    size: Tuple[int, int]
    z_index: int = 0
    focused: bool = False

    def to_yaml_lines(self, indent: int = 2) -> List[str]:
        """Generate YAML-like lines for this window."""
        prefix = " " * indent
        lines = [
            f"{prefix}- id: {self.id}",
            f"{prefix}  title: \"{self.title}\"",
            f"{prefix}  pos: [{self.pos[0]}, {self.pos[1]}]",
            f"{prefix}  size: [{self.size[0]}, {self.size[1]}]",
            f"{prefix}  z: {self.z_index}",
        ]
        if self.focused:
            lines.append(f"{prefix}  focused: true")
        return lines


@dataclass
class InputState:
    """Represents current input state."""
    keys_pressed: List[str] = field(default_factory=list)
    mouse_pos: Tuple[int, int] = (0, 0)
    mouse_buttons: List[str] = field(default_factory=list)
    modifiers: List[str] = field(default_factory=list)


class VisualShellAsciiRenderer(VisualShellHook):
    """
    ASCII renderer for Visual Shell state.

    Implements VisualShellHook to receive shell events and emits .ascii files
    for zero-cost AI perception.

    Output files (in output_dir):
        - shell_fragments.ascii: YAML-like tree of active windows
        - shell_focus.ascii: Input state (keyboard, mouse)
        - shell_state.ascii: Global metrics (window count, memory, FPS)

    Example:
        >>> renderer = VisualShellAsciiRenderer()
        >>> await renderer.on_window_create(1, "Terminal", (100, 50), (640, 480))
        >>> await renderer.on_window_focus(1)
        >>> # Files written to .geometry/ascii_scene/
    """

    def __init__(
        self,
        output_dir: str = ".geometry/ascii_scene",
        auto_flush: bool = True
    ):
        """
        Initialize the Visual Shell ASCII renderer.

        Args:
            output_dir: Directory to write .ascii files
            auto_flush: Automatically write files on each update
        """
        self.output_dir = Path(output_dir)
        self.auto_flush = auto_flush

        self.windows: Dict[int, Window] = {}
        self.focused_window_id: Optional[int] = None
        self.fragment_count: int = 0
        self.memory_mb: float = 0.0
        self.fps: float = 60.0
        self.input_state = InputState()
        self.last_update: Optional[datetime] = None

        # Ensure output directory exists
        self.output_dir.mkdir(parents=True, exist_ok=True)

    def _atomic_write(self, filename: str, content: str) -> None:
        """
        Atomically write content to a file.

        Uses temp file + rename to avoid partial reads.

        Args:
            filename: Target filename (without path)
            content: Content to write
        """
        target_path = self.output_dir / filename

        # Write to temp file first
        fd, temp_path = tempfile.mkstemp(
            dir=self.output_dir,
            prefix=f".{filename}.tmp"
        )

        try:
            with os.fdopen(fd, 'w') as f:
                f.write(content)

            # Atomic rename
            os.rename(temp_path, target_path)
        except Exception as e:
            # Clean up temp file on error
            try:
                os.unlink(temp_path)
            except:
                pass
            logger.error(f"Failed to write {filename}: {e}")

    def _flush_all(self) -> None:
        """Write all .ascii files."""
        self._write_fragments()
        self._write_focus()
        self._write_state()

    # --- VisualShellHook implementation ---

    async def on_window_create(
        self,
        id: int,
        title: str,
        pos: Tuple[int, int],
        size: Tuple[int, int]
    ) -> None:
        """Handle window creation event."""
        self.windows[id] = Window(
            id=id,
            title=title,
            pos=pos,
            size=size,
            z_index=len(self.windows)
        )
        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._flush_all()

    async def on_window_focus(self, id: int) -> None:
        """Handle window focus event."""
        # Clear previous focus
        for win in self.windows.values():
            win.focused = False

        # Set new focus
        if id in self.windows:
            self.windows[id].focused = True
            self.focused_window_id = id

        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._flush_all()

    async def on_window_close(self, id: int) -> None:
        """Handle window close event."""
        if id in self.windows:
            del self.windows[id]

        if self.focused_window_id == id:
            self.focused_window_id = None

        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._flush_all()

    async def on_fragment_update(
        self,
        fragment_count: int,
        memory_mb: float
    ) -> None:
        """Handle fragment update event."""
        self.fragment_count = fragment_count
        self.memory_mb = memory_mb
        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._write_state()

    # --- Additional methods for input state ---

    def update_input_state(
        self,
        keys_pressed: Optional[List[str]] = None,
        mouse_pos: Optional[Tuple[int, int]] = None,
        mouse_buttons: Optional[List[str]] = None,
        modifiers: Optional[List[str]] = None,
        fps: Optional[float] = None
    ) -> None:
        """
        Update input state manually.

        Args:
            keys_pressed: List of currently pressed keys
            mouse_pos: Current mouse position (x, y)
            mouse_buttons: List of pressed mouse buttons ("left", "right", "middle")
            modifiers: List of active modifiers ("shift", "ctrl", "alt", "meta")
            fps: Current frames per second
        """
        if keys_pressed is not None:
            self.input_state.keys_pressed = keys_pressed
        if mouse_pos is not None:
            self.input_state.mouse_pos = mouse_pos
        if mouse_buttons is not None:
            self.input_state.mouse_buttons = mouse_buttons
        if modifiers is not None:
            self.input_state.modifiers = modifiers
        if fps is not None:
            self.fps = fps

        self.last_update = datetime.utcnow()

        if self.auto_flush:
            self._write_focus()

    # --- ASCII rendering ---

    def _write_fragments(self) -> None:
        """Render YAML-like tree of active windows."""
        lines = []
        width = 80

        # Header
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append("|" + " VISUAL SHELL FRAGMENTS ".center(width - 2) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        # Windows section
        lines.append("windows:")

        if not self.windows:
            lines.append("  []  # No active windows")
        else:
            # Sort windows by z-index (higher = more recent = top)
            sorted_windows = sorted(
                self.windows.values(),
                key=lambda w: w.z_index,
                reverse=True
            )

            for window in sorted_windows:
                for line in window.to_yaml_lines(indent=2):
                    lines.append(line)

        lines.append("")

        # Summary
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append(f"| Total Windows: {len(self.windows)}".ljust(width - 1) + "|")

        if self.focused_window_id and self.focused_window_id in self.windows:
            focused = self.windows[self.focused_window_id]
            lines.append(f"| Focused: \"{focused.title}\" (id={self.focused_window_id})".ljust(width - 1) + "|")
        else:
            lines.append("| Focused: None".ljust(width - 1) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        self._atomic_write("shell_fragments.ascii", "\n".join(lines))

    def _write_focus(self) -> None:
        """Render input state (keyboard, mouse)."""
        lines = []
        width = 80

        # Header
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append("|" + " INPUT STATE ".center(width - 2) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        # Keyboard section
        lines.append("| KEYBOARD:".ljust(width - 1) + "|")

        if self.input_state.keys_pressed:
            keys_str = ", ".join(self.input_state.keys_pressed[:10])
            if len(self.input_state.keys_pressed) > 10:
                keys_str += f" ... (+{len(self.input_state.keys_pressed) - 10} more)"
            lines.append(f"|   Keys: {keys_str}".ljust(width - 1) + "|")
        else:
            lines.append("|   Keys: (none)".ljust(width - 1) + "|")

        if self.input_state.modifiers:
            mods_str = "+".join(self.input_state.modifiers)
            lines.append(f"|   Modifiers: {mods_str}".ljust(width - 1) + "|")
        else:
            lines.append("|   Modifiers: (none)".ljust(width - 1) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        # Mouse section
        lines.append("| MOUSE:".ljust(width - 1) + "|")

        mx, my = self.input_state.mouse_pos
        lines.append(f"|   Position: ({mx}, {my})".ljust(width - 1) + "|")

        if self.input_state.mouse_buttons:
            btns_str = ", ".join(self.input_state.mouse_buttons)
            lines.append(f"|   Buttons: {btns_str}".ljust(width - 1) + "|")
        else:
            lines.append("|   Buttons: (none)".ljust(width - 1) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        # FPS
        fps_str = f"{self.fps:.1f}"
        if self.fps >= 55:
            fps_status = "GOOD"
        elif self.fps >= 30:
            fps_status = "OK"
        else:
            fps_status = "LOW"
        lines.append(f"| FPS: {fps_str} [{fps_status}]".ljust(width - 1) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        self._atomic_write("shell_focus.ascii", "\n".join(lines))

    def _write_state(self) -> None:
        """Render global metrics."""
        lines = []
        width = 80

        # Header
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append("|" + " SHELL STATE ".center(width - 2) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        # Window metrics
        lines.append(f"| Window Count: {len(self.windows)}".ljust(width - 1) + "|")

        # Fragment metrics
        lines.append(f"| Fragment Count: {self.fragment_count}".ljust(width - 1) + "|")

        # Memory with bar
        bar_width = 30
        memory_normalized = min(self.memory_mb / 1024, 1.0)  # Normalize to 1GB max
        bar_filled = int(memory_normalized * bar_width)
        bar = "#" * bar_filled + "-" * (bar_width - bar_filled)
        memory_line = f"| Memory: [{bar}] {self.memory_mb:.1f} MB"
        lines.append(memory_line.ljust(width - 1) + "|")

        # Performance
        fps_str = f"{self.fps:.1f}"
        lines.append(f"| FPS: {fps_str}".ljust(width - 1) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        # Window sizes summary
        if self.windows:
            total_area = sum(w.size[0] * w.size[1] for w in self.windows.values())
            avg_area = total_area // len(self.windows)
            lines.append(f"| Total Window Area: {total_area:,} px".ljust(width - 1) + "|")
            lines.append(f"| Avg Window Size: {avg_area:,} px".ljust(width - 1) + "|")
        else:
            lines.append("| No windows open".ljust(width - 1) + "|")

        # Timestamp
        timestamp = self.last_update.isoformat() if self.last_update else "N/A"
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append(f"| Last Update: {timestamp}".ljust(width - 1) + "|")
        lines.append("+" + "-" * (width - 2) + "+")

        self._atomic_write("shell_state.ascii", "\n".join(lines))

    def force_flush(self) -> None:
        """Force write all .ascii files regardless of auto_flush setting."""
        self._flush_all()
