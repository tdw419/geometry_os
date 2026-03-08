"""
Native Panel - Window/Panel management for Native Visual Shell

Port of DesktopWindow.js functionality to native rendering.
"""

from dataclasses import dataclass, field
from typing import Dict, Any, Optional, Tuple, TYPE_CHECKING

if TYPE_CHECKING:
    from .native_api import NativeVisualShellAPI


@dataclass
class NativePanel:
    """
    A native panel/window for the Geometry OS desktop.

    This is the native equivalent of DesktopWindow.js, providing:
    - Title bar with minimize/maximize/close buttons
    - Drag support
    - Z-index layering
    - Focus tracking
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

    # Internal state
    _api: Any = field(default=None, repr=False)
    _original_height: float = field(default=0.0, repr=False)
    _drag_offset: Tuple[float, float] = field(default=(0.0, 0.0), repr=False)
    _content_visible: bool = True

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
    def drag_offset(self) -> Tuple[float, float]:
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
        """Move panel during drag"""
        if self.dragging:
            self.x = mouse_x - self._drag_offset[0]
            self.y = mouse_y - self._drag_offset[1]

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

    def to_render_state(self) -> Dict[str, Any]:
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
            }
        }
