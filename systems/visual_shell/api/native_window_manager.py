"""
Native Window Manager
Migrates PixiJS window/panel management to native GeoASM rendering.

This replaces:
- DesktopWindow.js -> NativeWindow (dataclass)
- WindowManager.js -> NativeWindowManager

Key features:
- Window creation/destruction
- Drag-and-drop (via event handlers)
- Z-index management (depth sorting)
- Minimize/maximize/close actions
- Title bars with buttons
- Content areas
- Notification system
"""

import logging
import json
from dataclasses import dataclass, field
from typing import List, Dict, Any, Optional, Callable
from enum import Enum
from pathlib import Path

logger = logging.getLogger("native_window_manager")


class WindowState(Enum):
    """Window states for state machine."""
    NORMAL = "normal"
    MINIMIZED = "minimized"
    MAXIMIZED = "maximized"
    DRAGGING = "dragging"
    CLOSING = "closing"


class WindowButtonType(Enum):
    """Types of window buttons."""
    MINIMIZE = "minimize"
    MAXIMIZE = "maximize"
    CLOSE = "close"


@dataclass
class NativeWindow:
    """
    Native window entity that replaces PixiJS DesktopWindow.
    All rendering is done via GeoASM glyph commands.
    """
    id: str
    title: str
    x: float
    y: float
    width: float
    height: float
    z_index: int = 0

    # State
    state: WindowState = WindowState.NORMAL
    original_height: float = 0.0

    # Colors (RGBA)
    background_color: tuple = (26, 26, 46, 230)  # Dark blue-ish
    title_bar_color: tuple = (74, 74, 110, 255)  # Light gray
    border_color: tuple = (100, 100, 140, 255)  # Medium gray

    text_color: tuple = (255, 255, 255, 255)  # White

    button_color: tuple = (255, 200, 100, 255)  # Orange-ish

    # Dimensions
    title_bar_height: float = 30.0
    border_width: float = 2.0
    corner_radius: float = 8.0

    # Content
    content_data: Optional[Dict[str, Any]] = None

    # Callbacks
    on_close: Optional[Callable[[], None]] = None
    on_minimize: Optional[Callable[[], None]] = None
    on_maximize: Optional[Callable[[], None]] = None
    on_drag_start: Optional[Callable[[float, float], None]] = None
    on_drag_end: Optional[Callable[[float, float], None]] = None
    on_focus: Optional[Callable[[], None]] = None

    def to_glyph_commands(self) -> List[Dict[str, Any]]:
        """
        Convert this window to GeoASM glyph commands.
        Returns a list of glyph commands for the renderer.
        """
        commands = []

        # 1. Window background (fill rect with border)
        commands.append({
            "opcode": "FILL_RECT",
            "x": int(self.x),
            "y": int(self.y),
            "width": int(self.width),
            "height": int(self.height if self.state != WindowState.MINIMIZED else self.title_bar_height),
            "color": self._pack_color(self.background_color)
        })

        # 2. Border (draw rect)
        if self.border_width > 0:
            commands.append({
                "opcode": "DRAW_RECT",
                "x": int(self.x),
                "y": int(self.y),
                "width": int(self.width),
                "height": int(self.height if self.state != WindowState.MINIMIZED else self.title_bar_height),
                "color": self._pack_color(self.border_color),
                "line_width": int(self.border_width)
            })

        # 3. Title bar background
        commands.append({
            "opcode": "FILL_RECT",
            "x": int(self.x),
            "y": int(self.y),
            "width": int(self.width),
            "height": int(self.title_bar_height),
            "color": self._pack_color(self.title_bar_color)
        })

        # 4. Title text
        if self.title:
            commands.append({
                "opcode": "DRAW_TEXT",
                "x": int(self.x + 10),
                "y": int(self.y + 8),
                "text": self.title,
                "color": self._pack_color(self.text_color),
                "font_size": 14
            })

        # 5. Window buttons
        button_y = self.y + 8
        button_size = 14
        button_spacing = 4

        # Close button (X)
        close_x = self.x + self.width - button_size - button_spacing
        commands.append({
            "opcode": "DRAW_TEXT",
            "x": int(close_x),
            "y": int(button_y),
            "text": "×",
            "color": self._pack_color(self.button_color),
            "font_size": 12
        })

        # Maximize button (□)
        max_x = close_x - button_size - button_spacing
        commands.append({
            "opcode": "DRAW_TEXT",
            "x": int(max_x),
            "y": int(button_y),
            "text": "□",
            "color": self._pack_color(self.button_color),
            "font_size": 12
        })

        # Minimize button (−)
        min_x = max_x - button_size - button_spacing
        commands.append({
            "opcode": "DRAW_TEXT",
            "x": int(min_x),
            "y": int(button_y),
            "text": "−",
            "color": self._pack_color(self.button_color),
            "font_size": 12
        })

        # 6. Content area (if not minimized)
        if self.state != WindowState.MINIMIZED and self.content_data:
            content_y = self.y + self.title_bar_height + 5
            content_height = self.height - self.title_bar_height - 10

            # Content background
            commands.append({
                "opcode": "FILL_RECT",
                "x": int(self.x + 5),
                "y": int(content_y),
                "width": int(self.width - 10),
                "height": int(content_height),
                "color": self._pack_color((40, 40, 60, 200))
            })

            # Content items (if any)
            if "items" in self.content_data:
                for i, item in enumerate(self.content_data["items"]):
                    item_y = content_y + 10 + i * 20
                    commands.append({
                        "opcode": "DRAW_TEXT",
                        "x": int(self.x + 15),
                        "y": int(item_y),
                        "text": item.get("text", ""),
                        "color": self._pack_color((200, 200, 200, 255)),
                        "font_size": 12
                    })

        return commands

    def _pack_color(self, rgba: tuple) -> int:
        """Pack RGBA tuple to single integer for GeoASM."""
        r, g, b, a = rgba
        return (r << 24) | (g << 16) | (b << 8) | a


    def contains_point(self, px: float, py: float) -> bool:
        """Check if point is within window bounds."""
        return (
            self.x <= px <= self.x + self.width and
            self.y <= py <= self.y + (self.title_bar_height if self.state == WindowState.MINIMIZED else self.height)
        )

    def is_in_title_bar(self, px: float, py: float) -> bool:
        """Check if point is in the title bar area."""
        return (
            self.x <= px <= self.x + self.width and
            self.y <= py <= self.y + self.title_bar_height
        )

    def get_button_at(self, px: float, py: float) -> Optional[WindowButtonType]:
        """Get which button is at the given point, if any."""
        if not self.is_in_title_bar(px, py):
            return None

        button_y = self.y + 8
        button_size = 14
        button_spacing = 4

        # Close button
        close_x = self.x + self.width - button_size - button_spacing
        if close_x <= px <= close_x + button_size:
            return WindowButtonType.CLOSE

        # Maximize button
        max_x = close_x - button_size - button_spacing
        if max_x <= px <= max_x + button_size:
            return WindowButtonType.MAXIMIZE

        # Minimize button
        min_x = max_x - button_size - button_spacing
        if min_x <= px <= min_x + button_size:
            return WindowButtonType.MINIMIZE

        return None


@dataclass
class DragState:
    """State for tracking drag operations."""
    active: bool = False
    start_x: float = 0.0
    start_y: float = 0.0
    offset_x: float = 0.0
    offset_y: float = 0.0


class NativeWindowManager:
    """
    Manages all native windows in the Geometry OS desktop.
    Replaces PixiJS WindowManager with native GeoASM rendering.
    """

    def __init__(self, initial_resolution: tuple[int, int] = (1920, 1080)):
        self.windows: Dict[str, NativeWindow] = {}
        self.z_order: List[str] = []  # Front to back order
        self.resolution = initial_resolution
        self.drag_state = DragState()
        self.focused_window: Optional[str] = None

        # Notification state
        self.notifications: List[Dict[str, Any]] = []
        self.notification_timeout = 3000  # ms

        logger.info(f"NativeWindowManager initialized at {initial_resolution}")

    # ========================================================================
    # Window Lifecycle
    # ========================================================================

    def create_window(
        self,
        window_id: str,
        title: str,
        x: float,
        y: float,
        width: float,
        height: float,
        **kwargs
    ) -> NativeWindow:
        """Create a new native window."""
        if window_id in self.windows:
            logger.warning(f"Window {window_id} already exists")
            return self.windows[window_id]

        window = NativeWindow(
            id=window_id,
            title=title,
            x=x,
            y=y,
            width=width,
            height=height,
            **kwargs
        )

        self.windows[window_id] = window
        self.z_order.append(window_id)  # Add to front
        self._bring_to_front(window_id)

        logger.info(f"Created window: {window_id} ({title})")
        return window

    def destroy_window(self, window_id: str) -> bool:
        """Destroy a window by ID."""
        if window_id not in self.windows:
            return False

        window = self.windows[window_id]

        # Call close callback
        if window.on_close:
            window.on_close()

        # Remove from tracking
        del self.windows[window_id]
        if window_id in self.z_order:
            self.z_order.remove(window_id)

        if self.focused_window == window_id:
            self.focused_window = None

        logger.info(f"Destroyed window: {window_id}")
        return True

    def get_window(self, window_id: str) -> Optional[NativeWindow]:
        """Get a window by ID."""
        return self.windows.get(window_id)

    def get_all_windows(self) -> List[NativeWindow]:
        """Get all windows in z-order (front to back)."""
        return [self.windows[wid] for wid in reversed(self.z_order) if wid in self.windows]

    # ========================================================================
    # Z-Index Management
    # ========================================================================

    def bring_to_front(self, window_id: str) -> bool:
        """Bring a window to the front of the z-order."""
        if window_id not in self.windows:
            return False

        self._bring_to_front(window_id)
        window = self.windows[window_id]

        if window.on_focus:
            window.on_focus()

        self.focused_window = window_id
        logger.debug(f"Brought to front: {window_id}")
        return True

    def _bring_to_front(self, window_id: str):
        """Internal: update z-order."""
        if window_id in self.z_order:
            self.z_order.remove(window_id)
        self.z_order.append(window_id)

    def send_to_back(self, window_id: str) -> bool:
        """Send a window to the back of the z-order."""
        if window_id not in self.windows:
            return False

        if window_id in self.z_order:
            self.z_order.remove(window_id)
        self.z_order.insert(0, window_id)

        logger.debug(f"Sent to back: {window_id}")
        return True

    # ========================================================================
    # Window State Management
    # ========================================================================

    def minimize_window(self, window_id: str) -> bool:
        """Minimize a window (show only title bar)."""
        if window_id not in self.windows:
            return False

        window = self.windows[window_id]
        window.state = WindowState.MINIMIZED
        window.original_height = window.height

        if window.on_minimize:
            window.on_minimize()

        logger.debug(f"Minimized: {window_id}")
        return True

    def maximize_window(self, window_id: str) -> bool:
        """Maximize a window to full screen."""
        if window_id not in self.windows:
            return False

        window = self.windows[window_id]
        window.state = WindowState.MAXIMIZED
        window.x = 0
        window.y = 0
        window.width = self.resolution[0]
        window.height = self.resolution[1]

        if window.on_maximize:
            window.on_maximize()

        logger.debug(f"Maximized: {window_id}")
        return True

    def restore_window(self, window_id: str) -> bool:
        """Restore a window to normal state."""
        if window_id not in self.windows:
            return False

        window = self.windows[window_id]
        window.state = WindowState.NORMAL

        if window.state == WindowState.MINIMIZED and window.original_height > 0:
            window.height = window.original_height

        logger.debug(f"Restored: {window_id}")
        return True

    def close_window(self, window_id: str) -> bool:
        """Close (destroy) a window."""
        return self.destroy_window(window_id)

    # ========================================================================
    # Event Handling
    # ========================================================================

    def handle_pointer_down(self, x: float, y: float) -> Optional[str]:
        """
        Handle pointer down event.
        Returns the window ID that was hit, or None.
        """
        # Find topmost window at this position
        for window_id in reversed(self.z_order):
            window = self.windows.get(window_id)
            if not window:
                continue

            if window.contains_point(x, y):
                self.bring_to_front(window_id)

                # Check for button click
                button = window.get_button_at(x, y)
                if button:
                    self._handle_button_click(window_id, button)
                    return window_id

                # Check for title bar (drag start)
                if window.is_in_title_bar(x, y):
                    self._start_drag(window_id, x, y)

                return window_id

        return None

    def handle_pointer_up(self, x: float, y: float):
        """Handle pointer up event."""
        if self.drag_state.active:
            self._end_drag(x, y)

    def handle_pointer_move(self, x: float, y: float):
        """Handle pointer move event."""
        if self.drag_state.active and self.focused_window:
            self._update_drag(x, y)

    def _start_drag(self, window_id: str, x: float, y: float):
        """Start dragging a window."""
        window = self.windows.get(window_id)
        if not window:
            return

        self.drag_state.active = True
        self.drag_state.start_x = x
        self.drag_state.start_y = y
        self.drag_state.offset_x = x - window.x
        self.drag_state.offset_y = y - window.y
        window.state = WindowState.DRAGGING

        if window.on_drag_start:
            window.on_drag_start(x, y)

        logger.debug(f"Started drag: {window_id}")

    def _update_drag(self, x: float, y: float):
        """Update window position during drag."""
        window = self.windows.get(self.focused_window)
        if not window:
            return

        window.x = x - self.drag_state.offset_x
        window.y = y - self.drag_state.offset_y

    def _end_drag(self, x: float, y: float):
        """End dragging operation."""
        if not self.focused_window:
            return

        window = self.windows.get(self.focused_window)
        if window:
            window.state = WindowState.NORMAL

            if window.on_drag_end:
                window.on_drag_end(x, y)

        self.drag_state.active = False
        logger.debug(f"Ended drag: {self.focused_window}")

    def _handle_button_click(self, window_id: str, button: WindowButtonType):
        """Handle window button click."""
        if button == WindowButtonType.CLOSE:
            self.close_window(window_id)
        elif button == WindowButtonType.MINIMIZE:
            window = self.windows.get(window_id)
            if window and window.state == WindowState.MINIMIZED:
                self.restore_window(window_id)
            else:
                self.minimize_window(window_id)
        elif button == WindowButtonType.MAXIMIZE:
            window = self.windows.get(window_id)
            if window and window.state == WindowState.MAXIMIZED:
                self.restore_window(window_id)
            else:
                self.maximize_window(window_id)

    # ========================================================================
    # Notifications
    # ========================================================================

    def create_notification(
        self,
        message: str,
        color: tuple = (100, 150, 200, 230),
        duration: int = 3000
    ) -> str:
        """Create a notification window."""
        import time
        import uuid

        notification_id = f"notification_{uuid.uuid4().hex[:8]}"

        # Create notification window
        notification = self.create_window(
            notification_id,
            "",  # No title
            (self.resolution[0] / 2) - 150,  # Center top
            10,
            300,
            50,
            background_color=color,
            border_color=color,
            title_bar_height=0,  # No title bar
            border_width=0
        )

        # Set content
        notification.content_data = {
            "items": [{"text": message}]
        }

        # Auto-dismiss
        def dismiss():
            self.destroy_window(notification_id)

        notification.on_close = lambda: None

        import threading
        timer = threading.Timer(duration / 1000, dismiss)

        logger.info(f"Created notification: {message[:50]}...")
        return notification_id

    # ========================================================================
    # Rendering
    # ========================================================================

    def get_all_glyph_commands(self) -> List[Dict[str, Any]]:
        """Get all glyph commands for the current frame."""
        commands = []

        # Render windows back to front
        for window_id in self.z_order:
            window = self.windows.get(window_id)
            if window:
                commands.extend(window.to_glyph_commands())

        return commands

    def get_render_state(self) -> Dict[str, Any]:
        """Get the current state for serialization."""
        return {
            "windows": {
                wid: {
                    "id": w.id,
                    "title": w.title,
                    "x": w.x,
                    "y": w.y,
                    "width": w.width,
                    "height": w.height,
                    "state": w.state.value,
                    "z_index": self.z_order.index(wid)
                }
                for wid, w in self.windows.items()
            },
            "z_order": self.z_order.copy(),
            "focused": self.focused_window,
            "notifications": len(self.notifications)
        }


# ========================================================================
# Main
# ========================================================================

if __name__ == "__main__":
    # Demo usage
    manager = NativeWindowManager((1920, 1080))

    # Create some windows
    main_window = manager.create_window(
        "main",
        "Main Window",
        100, 100,
        800, 600,
        on_close=lambda: print("Main window closed!")
    )

    tool_window = manager.create_window(
        "tools",
        "Tools",
        950, 100,
        400, 500
    )

    terminal_window = manager.create_window(
        "terminal",
        "Terminal",
        100, 700,
        600, 300
    )

    # Test interactions
    print(f"Created {len(manager.windows)} windows")
    print(f"Glyph commands: {len(manager.get_all_glyph_commands())}")

    # Create a notification
    manager.create_notification("System initialized successfully!", (50, 200, 50, 230))

    # Test z-order
    manager.bring_to_front("tools")
    print(f"Z-order: {manager.z_order}")

    # Export state
    print(f"Render state: {json.dumps(manager.get_render_state(), indent=2)}")
