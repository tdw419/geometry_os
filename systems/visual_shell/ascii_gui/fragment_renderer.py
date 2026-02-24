"""
GUI Fragment Renderer - ASCII state files for AI perception.

Emits .ascii and .yaml files representing the GUI state including:
- windows.yaml: YAML list of all active windows
- focus.ascii: ASCII box showing focused window/element
- mouse.ascii: ASCII box showing mouse state
- keyboard.ascii: ASCII box showing keyboard state

Implements GUIShellHook to receive GUI events.
"""

import os
import tempfile
from datetime import datetime, timezone
from pathlib import Path
from typing import Dict, List, Optional
import logging

import yaml

from .hooks import GUIShellHook
from .models import Window, FocusState, MouseState, KeyboardState

logger = logging.getLogger(__name__)


def atomic_write(output_dir: Path, filename: str, content: str) -> None:
    """
    Atomically write content to a file.

    Uses temp file + rename to avoid partial reads.

    Args:
        output_dir: Directory to write to
        filename: Target filename (without path)
        content: Content to write
    """
    target_path = output_dir / filename

    # Write to temp file first
    fd, temp_path = tempfile.mkstemp(
        dir=output_dir,
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
        raise


class GUIFragmentRenderer(GUIShellHook):
    """
    ASCII renderer for GUI state.

    Implements GUIShellHook to receive GUI events and emits .ascii files
    for zero-cost AI perception.

    Output files (in output_dir/fragments/):
        - windows.yaml: YAML list of all active windows
        - focus.ascii: ASCII box showing focused window/element
        - mouse.ascii: ASCII box showing mouse state
        - keyboard.ascii: ASCII box showing keyboard state

    Example:
        >>> renderer = GUIFragmentRenderer()
        >>> broadcaster.add_hook(renderer)
        >>> await broadcaster.on_window_create(window)
        >>> # Files written to .geometry/gui/fragments/
    """

    DEFAULT_WIDTH = 80

    def __init__(
        self,
        output_dir: str = ".geometry/gui",
        auto_flush: bool = True,
        box_width: int = DEFAULT_WIDTH
    ):
        """
        Initialize the GUI Fragment Renderer.

        Args:
            output_dir: Base directory for GUI state files
            auto_flush: Automatically write files on each update
            box_width: Width of ASCII boxes
        """
        self.output_dir = Path(output_dir)
        self.fragments_dir = self.output_dir / "fragments"
        self.auto_flush = auto_flush
        self.box_width = box_width

        # State
        self.windows: Dict[str, Window] = {}
        self.focus_state = FocusState()
        self.mouse_state = MouseState()
        self.keyboard_state = KeyboardState()
        self.last_update: Optional[datetime] = None

        # Ensure output directories exist
        self.fragments_dir.mkdir(parents=True, exist_ok=True)

    def _flush_all(self) -> None:
        """Write all fragment files."""
        self._write_windows()
        self._write_focus()
        self._write_mouse()
        self._write_keyboard()

    # --- GUIShellHook implementation ---

    async def on_window_create(self, window: Window) -> None:
        """Handle window creation event."""
        self.windows[window.id] = window
        self.last_update = datetime.now(timezone.utc)

        if self.auto_flush:
            self._flush_all()

    async def on_window_focus(self, window: Window) -> None:
        """Handle window focus event."""
        # Clear previous focus
        for win in self.windows.values():
            win.focused = False

        # Set new focus
        if window.id in self.windows:
            self.windows[window.id].focused = True
            self.focus_state.window_id = window.id
            self.focus_state.window_title = window.title
        else:
            # Window not tracked, add it
            window.focused = True
            self.windows[window.id] = window
            self.focus_state.window_id = window.id
            self.focus_state.window_title = window.title

        self.last_update = datetime.now(timezone.utc)

        if self.auto_flush:
            self._flush_all()

    async def on_window_close(self, window_id: str) -> None:
        """Handle window close event."""
        if window_id in self.windows:
            del self.windows[window_id]

        if self.focus_state.window_id == window_id:
            self.focus_state.window_id = None
            self.focus_state.window_title = None

        self.last_update = datetime.now(timezone.utc)

        if self.auto_flush:
            self._flush_all()

    async def on_mouse_move(self, x: int, y: int, hovering: Optional[str]) -> None:
        """Handle mouse move event."""
        self.mouse_state.x = x
        self.mouse_state.y = y
        self.mouse_state.hovering = hovering
        self.last_update = datetime.now(timezone.utc)

        if self.auto_flush:
            self._write_mouse()

    async def on_key_press(self, key: str, modifiers: List[str]) -> None:
        """Handle key press event."""
        self.keyboard_state.last_key = key
        self.keyboard_state.last_key_time = datetime.now(timezone.utc).isoformat()
        self.keyboard_state.modifiers = modifiers
        self.last_update = datetime.now(timezone.utc)

        if self.auto_flush:
            self._write_keyboard()

    async def on_menu_open(self, menu_id: str) -> None:
        """Handle menu open event (no fragment output for menus in POC)."""
        self.last_update = datetime.now(timezone.utc)
        # Menus not rendered in POC - future enhancement

    # --- ASCII/YAML rendering ---

    def _write_windows(self) -> None:
        """Render YAML list of active windows."""
        windows_data = {
            "windows": [win.to_yaml_dict() for win in self.windows.values()],
            "count": len(self.windows),
            "focused_id": self.focus_state.window_id,
            "last_update": self.last_update.isoformat() if self.last_update else None
        }

        content = yaml.dump(windows_data, default_flow_style=False, sort_keys=False)
        atomic_write(self.fragments_dir, "windows.yaml", content)

    def _write_focus(self) -> None:
        """Render focus state as ASCII box."""
        content = self.focus_state.to_ascii_box(width=self.box_width)
        atomic_write(self.fragments_dir, "focus.ascii", content)

    def _write_mouse(self) -> None:
        """Render mouse state as ASCII box."""
        content = self.mouse_state.to_ascii_box(width=self.box_width)
        atomic_write(self.fragments_dir, "mouse.ascii", content)

    def _write_keyboard(self) -> None:
        """Render keyboard state as ASCII box."""
        content = self.keyboard_state.to_ascii_box(width=self.box_width)
        atomic_write(self.fragments_dir, "keyboard.ascii", content)

    def force_flush(self) -> None:
        """Force write all fragment files regardless of auto_flush setting."""
        self._flush_all()

    # --- Manual state update methods ---

    def update_focus(self, **kwargs) -> None:
        """
        Manually update focus state.

        Args:
            **kwargs: FocusState fields to update
        """
        for key, value in kwargs.items():
            if hasattr(self.focus_state, key):
                setattr(self.focus_state, key, value)

        self.last_update = datetime.now(timezone.utc)

        if self.auto_flush:
            self._write_focus()

    def update_mouse(self, **kwargs) -> None:
        """
        Manually update mouse state.

        Args:
            **kwargs: MouseState fields to update
        """
        for key, value in kwargs.items():
            if hasattr(self.mouse_state, key):
                setattr(self.mouse_state, key, value)

        self.last_update = datetime.now(timezone.utc)

        if self.auto_flush:
            self._write_mouse()

    def update_keyboard(self, **kwargs) -> None:
        """
        Manually update keyboard state.

        Args:
            **kwargs: KeyboardState fields to update
        """
        for key, value in kwargs.items():
            if hasattr(self.keyboard_state, key):
                setattr(self.keyboard_state, key, value)

        self.last_update = datetime.now(timezone.utc)

        if self.auto_flush:
            self._write_keyboard()

    def set_hover_element(self, element: Optional[str]) -> None:
        """Set the element currently under the mouse cursor."""
        self.mouse_state.hovering = element
        self.last_update = datetime.now(timezone.utc)

        if self.auto_flush:
            self._write_mouse()


# Demo / Test
if __name__ == "__main__":
    import asyncio
    from .models import WindowType

    async def demo():
        """Demonstrate fragment renderer usage."""
        renderer = GUIFragmentRenderer()

        print("=== GUI Fragment Renderer Demo ===\n")

        # Create some windows
        win1 = Window(
            id="terminal-1",
            title="Terminal",
            type=WindowType.TERMINAL,
            pos=(100, 50),
            size=(640, 480)
        )
        win2 = Window(
            id="editor-1",
            title="main.py",
            type=WindowType.EDITOR,
            pos=(200, 100),
            size=(800, 600)
        )

        print("Creating windows...")
        await renderer.on_window_create(win1)
        await renderer.on_window_create(win2)

        print("Focusing terminal...")
        await renderer.on_window_focus(win1)

        print("Moving mouse...")
        await renderer.on_mouse_move(300, 200, "button#submit")

        print("Pressing key...")
        await renderer.on_key_press("Enter", ["ctrl"])

        print("\nFragment files written to .geometry/gui/fragments/")
        print(f"  - windows.yaml")
        print(f"  - focus.ascii")
        print(f"  - mouse.ascii")
        print(f"  - keyboard.ascii")

        # Show sample output
        print("\n--- focus.ascii ---")
        print((renderer.fragments_dir / "focus.ascii").read_text())

    asyncio.run(demo())
