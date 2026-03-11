"""
Layout Utilities - Snap-to-grid, alignment, and resize helpers.

This module provides usability improvements for the Native Glyph Shell:
- Snap-to-grid for cleaner panel layouts
- Resize handles with visual feedback
- Alignment helpers for organizing panels

Usage:
    from systems.visual_shell.api.layout_utils import (
        SnapConfig,
        ResizeHandle,
        ResizeHandleType,
        LayoutGrid,
        snap_position,
        snap_size,
        get_resize_handle_at,
        calculate_resize,
    )

    # Create a snap configuration
    config = SnapConfig(grid_size=20, enabled=True)

    # Snap a panel position
    snapped_x, snapped_y = snap_position(x, y, config)

    # Get resize handle at point
    handle = get_resize_handle_at(panel, mouse_x, mouse_y, handle_size=8)
    if handle == ResizeHandleType.BOTTOM_RIGHT:
        # Start diagonal resize
        pass
"""

from dataclasses import dataclass
from enum import Enum


class ResizeHandleType(Enum):
    """Types of resize handles on a panel."""
    NONE = "none"
    TOP = "top"
    BOTTOM = "bottom"
    LEFT = "left"
    RIGHT = "right"
    TOP_LEFT = "top_left"
    TOP_RIGHT = "top_right"
    BOTTOM_LEFT = "bottom_left"
    BOTTOM_RIGHT = "bottom_right"


@dataclass
class SnapConfig:
    """Configuration for snap-to-grid behavior."""
    enabled: bool = True
    grid_size: int = 20  # Pixels per grid cell
    snap_threshold: int = 10  # Snap if within this distance
    snap_edges: bool = True  # Snap to other panel edges
    snap_center: bool = False  # Snap to center lines
    min_panel_width: int = 100  # Minimum panel width
    min_panel_height: int = 80  # Minimum panel height


@dataclass
class LayoutGrid:
    """Visual grid overlay for layout assistance."""
    enabled: bool = False
    grid_size: int = 20
    color: tuple[int, int, int, int] = (100, 100, 100, 40)  # RGBA
    show_major_lines: bool = True  # Show lines every 5 cells
    major_color: tuple[int, int, int, int] = (120, 120, 120, 60)  # RGBA

    def get_cell_at(self, x: float, y: float) -> tuple[int, int]:
        """Get the grid cell coordinates for a point."""
        return (int(x // self.grid_size), int(y // self.grid_size))

    def get_cell_origin(self, cell_x: int, cell_y: int) -> tuple[float, float]:
        """Get the pixel origin of a grid cell."""
        return (cell_x * self.grid_size, cell_y * self.grid_size)


@dataclass
class ResizeHandle:
    """Represents a resize handle on a panel."""
    handle_type: ResizeHandleType
    x: float
    y: float
    size: int = 8  # Handle size in pixels
    is_hovered: bool = False
    is_active: bool = False

    def contains_point(self, px: float, py: float) -> bool:
        """Check if a point is within this handle."""
        half = self.size / 2
        return (self.x - half <= px <= self.x + half and
                self.y - half <= py <= self.y + half)

    def get_cursor(self) -> str:
        """Get the cursor style for this handle."""
        cursors = {
            ResizeHandleType.TOP: "ns-resize",
            ResizeHandleType.BOTTOM: "ns-resize",
            ResizeHandleType.LEFT: "ew-resize",
            ResizeHandleType.RIGHT: "ew-resize",
            ResizeHandleType.TOP_LEFT: "nwse-resize",
            ResizeHandleType.TOP_RIGHT: "nesw-resize",
            ResizeHandleType.BOTTOM_LEFT: "nesw-resize",
            ResizeHandleType.BOTTOM_RIGHT: "nwse-resize",
        }
        return cursors.get(self.handle_type, "default")


def snap_position(
    x: float,
    y: float,
    config: SnapConfig,
    bounds: tuple[int, int] | None = None
) -> tuple[float, float]:
    """
    Snap a position to the nearest grid point.

    Args:
        x: X coordinate
        y: Y coordinate
        config: Snap configuration
        bounds: Optional (width, height) to constrain position

    Returns:
        Snapped (x, y) coordinates
    """
    if not config.enabled:
        return (x, y)

    grid = config.grid_size
    threshold = config.snap_threshold

    # Calculate nearest grid points
    snapped_x = round(x / grid) * grid
    snapped_y = round(y / grid) * grid

    # Only snap if within threshold
    if abs(x - snapped_x) > threshold:
        snapped_x = x
    if abs(y - snapped_y) > threshold:
        snapped_y = y

    # Apply bounds if specified
    if bounds:
        max_x, max_y = bounds
        snapped_x = max(0, min(snapped_x, max_x))
        snapped_y = max(0, min(snapped_y, max_y))

    return (snapped_x, snapped_y)


def snap_size(
    width: float,
    height: float,
    config: SnapConfig
) -> tuple[float, float]:
    """
    Snap dimensions to grid increments.

    Args:
        width: Width in pixels
        height: Height in pixels
        config: Snap configuration

    Returns:
        Snapped (width, height)
    """
    if not config.enabled:
        return (width, height)

    grid = config.grid_size

    # Snap to grid increments
    snapped_width = max(config.min_panel_width, round(width / grid) * grid)
    snapped_height = max(config.min_panel_height, round(height / grid) * grid)

    return (snapped_width, snapped_height)


def get_resize_handle_at(
    panel_x: float,
    panel_y: float,
    panel_width: float,
    panel_height: float,
    mouse_x: float,
    mouse_y: float,
    handle_size: int = 8,
    title_bar_height: int = 24
) -> ResizeHandleType:
    """
    Determine which resize handle (if any) is at the mouse position.

    Args:
        panel_x, panel_y: Panel position
        panel_width, panel_height: Panel dimensions
        mouse_x, mouse_y: Mouse position
        handle_size: Size of handle hit area
        title_bar_height: Height of title bar (excluded from resize)

    Returns:
        The type of resize handle at the position, or NONE
    """
    half = handle_size / 2

    # Panel bounds
    left = panel_x
    right = panel_x + panel_width
    top = panel_y
    bottom = panel_y + panel_height

    # Edge regions
    on_left = left - half <= mouse_x <= left + half
    on_right = right - half <= mouse_x <= right + half
    on_top = top - half <= mouse_y <= top + half
    on_bottom = bottom - half <= mouse_y <= bottom + half

    # Check corners FIRST (higher priority than title bar exclusion)
    # Top corners should work even in title bar area
    if on_top and on_left:
        return ResizeHandleType.TOP_LEFT
    if on_top and on_right:
        return ResizeHandleType.TOP_RIGHT
    if on_bottom and on_left:
        return ResizeHandleType.BOTTOM_LEFT
    if on_bottom and on_right:
        return ResizeHandleType.BOTTOM_RIGHT

    # Don't allow top edge resize on title bar area (only edge, corners handled above)
    if on_top and mouse_y >= panel_y and mouse_y < panel_y + title_bar_height:
        on_top = False

    # Check edges
    if on_top:
        return ResizeHandleType.TOP
    if on_bottom:
        return ResizeHandleType.BOTTOM
    if on_left:
        return ResizeHandleType.LEFT
    if on_right:
        return ResizeHandleType.RIGHT

    return ResizeHandleType.NONE


def calculate_resize(
    original_x: float,
    original_y: float,
    original_width: float,
    original_height: float,
    handle_type: ResizeHandleType,
    delta_x: float,
    delta_y: float,
    config: SnapConfig,
    maintain_aspect: bool = False
) -> tuple[float, float, float, float]:
    """
    Calculate new panel dimensions after resize.

    Args:
        original_x, original_y: Original panel position
        original_width, original_height: Original dimensions
        handle_type: Which handle is being dragged
        delta_x, delta_y: Mouse movement since resize start
        config: Snap configuration
        maintain_aspect: Whether to maintain aspect ratio

    Returns:
        New (x, y, width, height)
    """
    min_w = config.min_panel_width
    min_h = config.min_panel_height

    new_x = original_x
    new_y = original_y
    new_width = original_width
    new_height = original_height

    # Apply delta based on handle type
    if handle_type == ResizeHandleType.RIGHT:
        new_width = max(min_w, original_width + delta_x)
    elif handle_type == ResizeHandleType.LEFT:
        new_width = max(min_w, original_width - delta_x)
        if new_width > min_w:
            new_x = original_x + delta_x
    elif handle_type == ResizeHandleType.BOTTOM:
        new_height = max(min_h, original_height + delta_y)
    elif handle_type == ResizeHandleType.TOP:
        new_height = max(min_h, original_height - delta_y)
        if new_height > min_h:
            new_y = original_y + delta_y
    elif handle_type == ResizeHandleType.BOTTOM_RIGHT:
        new_width = max(min_w, original_width + delta_x)
        new_height = max(min_h, original_height + delta_y)
    elif handle_type == ResizeHandleType.BOTTOM_LEFT:
        new_width = max(min_w, original_width - delta_x)
        new_height = max(min_h, original_height + delta_y)
        if new_width > min_w:
            new_x = original_x + delta_x
    elif handle_type == ResizeHandleType.TOP_RIGHT:
        new_width = max(min_w, original_width + delta_x)
        new_height = max(min_h, original_height - delta_y)
        if new_height > min_h:
            new_y = original_y + delta_y
    elif handle_type == ResizeHandleType.TOP_LEFT:
        new_width = max(min_w, original_width - delta_x)
        new_height = max(min_h, original_height - delta_y)
        if new_width > min_w:
            new_x = original_x + delta_x
        if new_height > min_h:
            new_y = original_y + delta_y

    # Apply aspect ratio constraint if needed
    if maintain_aspect:
        aspect = original_width / original_height
        if new_width / new_height > aspect:
            new_width = new_height * aspect
        else:
            new_height = new_width / aspect

    # Snap to grid if enabled
    if config.enabled:
        new_x, new_y = snap_position(new_x, new_y, config)
        new_width, new_height = snap_size(new_width, new_height, config)

    return (new_x, new_y, new_width, new_height)


def get_resize_handles(
    panel_x: float,
    panel_y: float,
    panel_width: float,
    panel_height: float,
    handle_size: int = 8
) -> list[ResizeHandle]:
    """
    Get all resize handles for a panel.

    Returns a list of ResizeHandle objects for each edge and corner.
    """
    handles = []

    # Corners
    handles.append(ResizeHandle(
        handle_type=ResizeHandleType.TOP_LEFT,
        x=panel_x,
        y=panel_y,
        size=handle_size
    ))
    handles.append(ResizeHandle(
        handle_type=ResizeHandleType.TOP_RIGHT,
        x=panel_x + panel_width,
        y=panel_y,
        size=handle_size
    ))
    handles.append(ResizeHandle(
        handle_type=ResizeHandleType.BOTTOM_LEFT,
        x=panel_x,
        y=panel_y + panel_height,
        size=handle_size
    ))
    handles.append(ResizeHandle(
        handle_type=ResizeHandleType.BOTTOM_RIGHT,
        x=panel_x + panel_width,
        y=panel_y + panel_height,
        size=handle_size
    ))

    # Edges (centered)
    handles.append(ResizeHandle(
        handle_type=ResizeHandleType.TOP,
        x=panel_x + panel_width / 2,
        y=panel_y,
        size=handle_size
    ))
    handles.append(ResizeHandle(
        handle_type=ResizeHandleType.BOTTOM,
        x=panel_x + panel_width / 2,
        y=panel_y + panel_height,
        size=handle_size
    ))
    handles.append(ResizeHandle(
        handle_type=ResizeHandleType.LEFT,
        x=panel_x,
        y=panel_y + panel_height / 2,
        size=handle_size
    ))
    handles.append(ResizeHandle(
        handle_type=ResizeHandleType.RIGHT,
        x=panel_x + panel_width,
        y=panel_y + panel_height / 2,
        size=handle_size
    ))

    return handles


def align_panels(
    panels: list[tuple[float, float, float, float]],
    alignment: str
) -> list[tuple[float, float, float, float]]:
    """
    Align multiple panels.

    Args:
        panels: List of (x, y, width, height) tuples
        alignment: One of 'left', 'right', 'top', 'bottom', 'center_h', 'center_v'

    Returns:
        List of aligned panel positions
    """
    if len(panels) < 2:
        return panels

    result = []

    if alignment == 'left':
        min_x = min(p[0] for p in panels)
        for x, y, w, h in panels:
            result.append((min_x, y, w, h))
    elif alignment == 'right':
        max_right = max(p[0] + p[2] for p in panels)
        for x, y, w, h in panels:
            result.append((max_right - w, y, w, h))
    elif alignment == 'top':
        min_y = min(p[1] for p in panels)
        for x, y, w, h in panels:
            result.append((x, min_y, w, h))
    elif alignment == 'bottom':
        max_bottom = max(p[1] + p[3] for p in panels)
        for x, y, w, h in panels:
            result.append((x, max_bottom - h, w, h))
    elif alignment == 'center_h':
        centers = [p[0] + p[2] / 2 for p in panels]
        avg_center = sum(centers) / len(centers)
        for x, y, w, h in panels:
            result.append((avg_center - w / 2, y, w, h))
    elif alignment == 'center_v':
        centers = [p[1] + p[3] / 2 for p in panels]
        avg_center = sum(centers) / len(centers)
        for x, y, w, h in panels:
            result.append((x, avg_center - h / 2, w, h))
    else:
        result = list(panels)

    return result


def distribute_panels(
    panels: list[tuple[float, float, float, float]],
    direction: str,
    gap: int = 10
) -> list[tuple[float, float, float, float]]:
    """
    Distribute panels evenly with equal spacing.

    Args:
        panels: List of (x, y, width, height) tuples
        direction: 'horizontal' or 'vertical'
        gap: Gap between panels in pixels

    Returns:
        List of redistributed panel positions
    """
    if len(panels) < 2:
        return panels

    result = []

    if direction == 'horizontal':
        # Sort by x position
        sorted_panels = sorted(panels, key=lambda p: p[0])
        total_width = sum(p[2] for p in sorted_panels)
        total_gaps = (len(sorted_panels) - 1) * gap
        start_x = sorted_panels[0][0]

        current_x = start_x
        for x, y, w, h in sorted_panels:
            result.append((current_x, y, w, h))
            current_x += w + gap

    elif direction == 'vertical':
        # Sort by y position
        sorted_panels = sorted(panels, key=lambda p: p[1])
        total_height = sum(p[3] for p in sorted_panels)
        total_gaps = (len(sorted_panels) - 1) * gap
        start_y = sorted_panels[0][1]

        current_y = start_y
        for x, y, w, h in sorted_panels:
            result.append((x, current_y, w, h))
            current_y += h + gap

    return result
