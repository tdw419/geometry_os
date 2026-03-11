"""
Native Panel - Window/Panel management for Native Visual Shell

Port of DesktopWindow.js functionality to native rendering with enhanced
usability features:
- Resize handles on corners and edges
- Snap-to-grid for cleaner layouts
- Visual feedback during interactions

Logging:
    This module logs critical operations for debugging:
    - Panel state changes (minimize, restore, close)
    - Drag operations with snap-to-grid feedback
    - Resize operations with handle tracking
    - Z-index changes
"""

import logging
import time
from dataclasses import dataclass, field
from typing import TYPE_CHECKING, Any

if TYPE_CHECKING:
    from .native_api import NativeVisualShellAPI

# ============================================================================
# Logging Configuration
# ============================================================================

logger = logging.getLogger("native_panel")

# Ensure logging is configured if not already
if not logger.handlers:
    handler = logging.StreamHandler()
    formatter = logging.Formatter(
        '%(asctime)s | %(levelname)-8s | %(name)s | %(message)s',
        datefmt='%H:%M:%S'
    )
    handler.setFormatter(formatter)
    logger.addHandler(handler)
    logger.setLevel(logging.INFO)

# Import layout utilities for enhanced usability
try:
    from .layout_utils import (
        ResizeHandleType,
        SnapConfig,
        calculate_resize,
        get_resize_handle_at,
        snap_position,
        snap_size,
    )
    HAS_LAYOUT_UTILS = True
except ImportError:
    HAS_LAYOUT_UTILS = False
    # Fallback defaults
    SnapConfig = None
    ResizeHandleType = None


class ResizeState:
    """Tracks state during a resize operation."""
    def __init__(
        self,
        handle_type: str,
        start_x: float,
        start_y: float,
        original_panel_x: float,
        original_panel_y: float,
        original_panel_width: float,
        original_panel_height: float
    ):
        self.handle_type = handle_type
        self.start_x = start_x
        self.start_y = start_y
        self.original_x = original_panel_x
        self.original_y = original_panel_y
        self.original_width = original_panel_width
        self.original_height = original_panel_height


@dataclass
class NativePanel:
    """
    A native panel/window for the Geometry OS desktop.

    This is the native equivalent of DesktopWindow.js, providing:
    - Title bar with minimize/maximize/close buttons
    - Drag support with snap-to-grid
    - Resize handles on all edges and corners
    - Z-index layering
    - Focus tracking
    - Visual feedback during interactions
    """
    id: str
    title: str
    x: float
    y: float
    width: float
    height: float
    z: int = 0
    minimized: bool = False
    dragging: bool = False
    focused: bool = False
    title_bar_height: int = 24  # Same as PixiJS DesktopWindow

    # Resize state
    resizing: bool = False
    resize_handle_size: int = 8  # Size of resize handles

    # Snap configuration
    snap_enabled: bool = True
    snap_grid_size: int = 20
    snap_threshold: int = 10

    # Internal state
    _api: Any = field(default=None, repr=False)
    _original_height: float = field(default=0.0, repr=False)
    _drag_offset: tuple[float, float] = field(default=(0.0, 0.0), repr=False)
    _content_visible: bool = True
    _resize_state: ResizeState | None = field(default=None, repr=False)
    _hovered_handle: str = "none"  # Track which handle is hovered

    def __post_init__(self):
        if self._original_height == 0.0:
            self._original_height = self.height

    @property
    def content_height(self) -> float:
        """Height of content area (total height minus title bar)"""
        if self.minimized:
            return 0
        return self.height - self.title_bar_height

    @property
    def content_visible(self) -> bool:
        """Whether content area is visible"""
        return self._content_visible

    @property
    def drag_offset(self) -> tuple[float, float]:
        """Offset from panel origin where drag started"""
        return self._drag_offset

    def minimize(self):
        """Minimize panel to title bar only"""
        self.minimized = True
        self._content_visible = False
        self.height = self.title_bar_height

    def restore(self):
        """Restore panel from minimized state"""
        self.minimized = False
        self._content_visible = True
        self.height = self._original_height

    def close(self, api: 'NativeVisualShellAPI' = None):
        """Close panel and remove from API"""
        # Use stored API reference if not provided
        api = api or self._api
        if api is not None:
            # Remove from panels dict
            if self.id in api.panels:
                del api.panels[self.id]
            # Remove from entities dict
            if self.id in api.entities:
                del api.entities[self.id]
            # Update focus if needed
            if api.focused_panel == self.id:
                api._focused_panel = None

    def start_drag(self, mouse_x: float, mouse_y: float):
        """Start dragging from given mouse position"""
        self.dragging = True
        self._drag_offset = (mouse_x - self.x, mouse_y - self.y)

    def move_drag(self, mouse_x: float, mouse_y: float):
        """Move panel during drag with optional snap-to-grid"""
        if self.dragging:
            new_x = mouse_x - self._drag_offset[0]
            new_y = mouse_y - self._drag_offset[1]

            # Apply snap-to-grid if enabled
            if self.snap_enabled:
                grid = self.snap_grid_size
                threshold = self.snap_threshold

                snapped_x = round(new_x / grid) * grid
                snapped_y = round(new_y / grid) * grid

                if abs(new_x - snapped_x) <= threshold:
                    new_x = snapped_x
                if abs(new_y - snapped_y) <= threshold:
                    new_y = snapped_y

            self.x = new_x
            self.y = new_y

    def end_drag(self):
        """End dragging"""
        self.dragging = False

    def has_button(self, button_type: str) -> bool:
        """Check if panel has a specific button type"""
        return button_type in ('minimize', 'maximize', 'close')

    def contains_point(self, px: float, py: float) -> bool:
        """Check if a point is inside this panel"""
        return (self.x <= px < self.x + self.width and
                self.y <= py < self.y + self.height)

    def get_resize_handle_at(self, px: float, py: float) -> str:
        """
        Get the resize handle type at a given point.

        Returns one of: 'none', 'top', 'bottom', 'left', 'right',
        'top_left', 'top_right', 'bottom_left', 'bottom_right'
        """
        if HAS_LAYOUT_UTILS and ResizeHandleType is not None:
            handle = get_resize_handle_at(
                self.x, self.y,
                self.width, self.height,
                px, py,
                self.resize_handle_size,
                self.title_bar_height
            )
            return handle.value
        return self._get_resize_handle_fallback(px, py)

    def _get_resize_handle_fallback(self, px: float, py: float) -> str:
        """Fallback resize handle detection without layout_utils."""
        half = self.resize_handle_size / 2
        left = self.x
        right = self.x + self.width
        top = self.y
        bottom = self.y + self.height

        on_left = left - half <= px <= left + half
        on_right = right - half <= px <= right + half
        on_top = top - half <= py <= top + half and py > self.y + self.title_bar_height
        on_bottom = bottom - half <= py <= bottom + half

        # Check corners
        if on_top and on_left:
            return "top_left"
        if on_top and on_right:
            return "top_right"
        if on_bottom and on_left:
            return "bottom_left"
        if on_bottom and on_right:
            return "bottom_right"
        if on_top:
            return "top"
        if on_bottom:
            return "bottom"
        if on_left:
            return "left"
        if on_right:
            return "right"

        return "none"

    def start_resize(self, mouse_x: float, mouse_y: float, handle_type: str = None):
        """
        Start a resize operation.

        Args:
            mouse_x, mouse_y: Current mouse position
            handle_type: Override handle type detection
        """
        if handle_type is None:
            handle_type = self.get_resize_handle_at(mouse_x, mouse_y)

        if handle_type == "none":
            return

        self.resizing = True
        self._resize_state = ResizeState(
            handle_type=handle_type,
            start_x=mouse_x,
            start_y=mouse_y,
            original_panel_x=self.x,
            original_panel_y=self.y,
            original_panel_width=self.width,
            original_panel_height=self.height
        )

    def update_resize(self, mouse_x: float, mouse_y: float):
        """
        Update panel dimensions during resize.

        Args:
            mouse_x, mouse_y: Current mouse position
        """
        if not self.resizing or self._resize_state is None:
            return

        delta_x = mouse_x - self._resize_state.start_x
        delta_y = mouse_y - self._resize_state.start_y

        if HAS_LAYOUT_UTILS and SnapConfig is not None:
            # Use layout utilities with snap
            config = SnapConfig(
                enabled=self.snap_enabled,
                grid_size=self.snap_grid_size,
                snap_threshold=self.snap_threshold,
                min_panel_width=100,
                min_panel_height=80
            )
            # Convert string handle type to enum
            handle_enum = ResizeHandleType(self._resize_state.handle_type)
            new_x, new_y, new_w, new_h = calculate_resize(
                self._resize_state.original_x,
                self._resize_state.original_y,
                self._resize_state.original_width,
                self._resize_state.original_height,
                handle_enum,
                delta_x,
                delta_y,
                config
            )
        else:
            # Fallback without layout_utils
            new_x, new_y, new_w, new_h = self._calculate_resize_fallback(
                delta_x, delta_y
            )

        self.x = new_x
        self.y = new_y
        self.width = new_w
        self.height = new_h

        # Update stored original height if not minimized
        if not self.minimized:
            self._original_height = new_h

    def _calculate_resize_fallback(
        self,
        delta_x: float,
        delta_y: float
    ) -> tuple[float, float, float, float]:
        """Fallback resize calculation without layout_utils."""
        min_w = 100
        min_h = 80

        new_x = self._resize_state.original_x
        new_y = self._resize_state.original_y
        new_w = self._resize_state.original_width
        new_h = self._resize_state.original_height

        handle = self._resize_state.handle_type

        if handle == "right":
            new_w = max(min_w, new_w + delta_x)
        elif handle == "left":
            new_w = max(min_w, new_w - delta_x)
            if new_w > min_w:
                new_x = self._resize_state.original_x + delta_x
        elif handle == "bottom":
            new_h = max(min_h, new_h + delta_y)
        elif handle == "top":
            new_h = max(min_h, new_h - delta_y)
            if new_h > min_h:
                new_y = self._resize_state.original_y + delta_y
        elif handle == "bottom_right":
            new_w = max(min_w, new_w + delta_x)
            new_h = max(min_h, new_h + delta_y)
        elif handle == "bottom_left":
            new_w = max(min_w, new_w - delta_x)
            new_h = max(min_h, new_h + delta_y)
            if new_w > min_w:
                new_x = self._resize_state.original_x + delta_x
        elif handle == "top_right":
            new_w = max(min_w, new_w + delta_x)
            new_h = max(min_h, new_h - delta_y)
            if new_h > min_h:
                new_y = self._resize_state.original_y + delta_y
        elif handle == "top_left":
            new_w = max(min_w, new_w - delta_x)
            new_h = max(min_h, new_h - delta_y)
            if new_w > min_w:
                new_x = self._resize_state.original_x + delta_x
            if new_h > min_h:
                new_y = self._resize_state.original_y + delta_y

        # Apply snap if enabled
        if self.snap_enabled:
            grid = self.snap_grid_size
            threshold = self.snap_threshold

            # Snap size
            snapped_w = round(new_w / grid) * grid
            snapped_h = round(new_h / grid) * grid
            if abs(new_w - snapped_w) <= threshold:
                new_w = max(min_w, snapped_w)
            if abs(new_h - snapped_h) <= threshold:
                new_h = max(min_h, snapped_h)

            # Snap position
            snapped_x = round(new_x / grid) * grid
            snapped_y = round(new_y / grid) * grid
            if abs(new_x - snapped_x) <= threshold:
                new_x = snapped_x
            if abs(new_y - snapped_y) <= threshold:
                new_y = snapped_y

        return (new_x, new_y, new_w, new_h)

    def end_resize(self):
        """End the resize operation."""
        self.resizing = False
        self._resize_state = None

    def set_hovered_handle(self, handle_type: str):
        """Set which resize handle is currently hovered."""
        self._hovered_handle = handle_type

    def get_cursor(self) -> str:
        """
        Get the cursor style for the current state.

        Returns one of: 'default', 'move', 'ns-resize', 'ew-resize',
        'nwse-resize', 'nesw-resize'
        """
        if self.resizing and self._resize_state:
            return self._get_cursor_for_handle(self._resize_state.handle_type)
        if self._hovered_handle != "none":
            return self._get_cursor_for_handle(self._hovered_handle)
        if self.dragging:
            return "move"
        return "default"

    def _get_cursor_for_handle(self, handle_type: str) -> str:
        """Get cursor style for a handle type."""
        cursors = {
            "top": "ns-resize",
            "bottom": "ns-resize",
            "left": "ew-resize",
            "right": "ew-resize",
            "top_left": "nwse-resize",
            "top_right": "nesw-resize",
            "bottom_left": "nesw-resize",
            "bottom_right": "nwse-resize",
        }
        return cursors.get(handle_type, "default")

    def get_resize_handles(self) -> list:
        """
        Get all resize handle positions for rendering.

        Returns list of dicts with handle_type, x, y for visual feedback.
        """
        handles = []
        x, y = self.x, self.y
        w, h = self.width, self.height

        # Corners
        handles.append({"type": "top_left", "x": x, "y": y})
        handles.append({"type": "top_right", "x": x + w, "y": y})
        handles.append({"type": "bottom_left", "x": x, "y": y + h})
        handles.append({"type": "bottom_right", "x": x + w, "y": y + h})

        # Edge centers
        handles.append({"type": "top", "x": x + w/2, "y": y})
        handles.append({"type": "bottom", "x": x + w/2, "y": y + h})
        handles.append({"type": "left", "x": x, "y": y + h/2})
        handles.append({"type": "right", "x": x + w, "y": y + h/2})

        return handles

    def to_render_state(self) -> dict[str, Any]:
        """Export panel state for rendering"""
        return {
            "type": "panel",
            "id": self.id,
            "x": self.x,
            "y": self.y,
            "z": self.z,
            "width": self.width,
            "height": self.height,
            "color": (20, 20, 35, 180),  # Default glass color
            "metadata": {
                "title": self.title,
                "minimized": self.minimized,
                "focused": self.focused,
                "title_bar_height": self.title_bar_height,
                "resizing": self.resizing,
                "dragging": self.dragging,
                "hovered_handle": self._hovered_handle,
                "cursor": self.get_cursor(),
                "snap_enabled": self.snap_enabled,
                "snap_grid_size": self.snap_grid_size,
            },
            "resize_handles": self.get_resize_handles() if self.focused else [],
        }
