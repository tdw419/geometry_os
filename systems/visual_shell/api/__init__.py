"""
Visual Shell API

Provides the unified interface for Geometry OS visual rendering.
Default: Native GeoASM Renderer (PixiJS deprecated)

Quick Start:
    from systems.visual_shell.api import get_window_manager, RenderConfig

    # Get default window manager (native)
    manager = get_window_manager()

    # Create a window
    window = manager.create_window("main", "Main Window", 100, 100, 800, 600)

Usability Features:
    from systems.visual_shell.api import (
        SnapConfig,
        ResizeHandleType,
        snap_position,
        snap_size,
        get_resize_handle_at,
    )

    # Snap a position to grid
    snapped = snap_position(123, 456, SnapConfig(grid_size=20))
"""

# Configuration
# Layout utilities (usability enhancements)
from .layout_utils import (
    LayoutGrid,
    ResizeHandle,
    ResizeHandleType,
    SnapConfig,
    align_panels,
    calculate_resize,
    distribute_panels,
    get_resize_handle_at,
    get_resize_handles,
    snap_position,
    snap_size,
)
from .native_api import (
    NativeVisualShellAPI,
    UIEntity,
)
from .native_panel import NativePanel, ResizeState

# Native implementations (default)
from .native_window_manager import (
    DragState,
    NativeWindow,
    NativeWindowManager,
    WindowButtonType,
    WindowState,
)
from .render_config import (
    DEFAULT_CONFIG,
    RenderConfig,
    RendererBackend,
    get_render_config,
    set_render_config,
)

# Factory
from .renderer_factory import (
    RendererMetrics,
    WindowManagerProtocol,
    get_glyph_renderer,
    get_window_manager,
)

# Legacy bridge (for backward compatibility during migration)
# Note: visual_bridge has external dependencies, make it optional
try:
    from .visual_bridge import VisualBridge
except ImportError:
    VisualBridge = None  # type: ignore

__all__ = [
    # Configuration
    "RenderConfig",
    "RendererBackend",
    "get_render_config",
    "set_render_config",
    "DEFAULT_CONFIG",
    # Factory
    "get_window_manager",
    "get_glyph_renderer",
    "RendererMetrics",
    "WindowManagerProtocol",
    # Native implementations
    "NativeWindowManager",
    "NativeWindow",
    "WindowState",
    "WindowButtonType",
    "DragState",
    "NativeVisualShellAPI",
    "UIEntity",
    "NativePanel",
    "ResizeState",
    # Layout utilities
    "SnapConfig",
    "ResizeHandleType",
    "ResizeHandle",
    "LayoutGrid",
    "snap_position",
    "snap_size",
    "get_resize_handle_at",
    "calculate_resize",
    "get_resize_handles",
    "align_panels",
    "distribute_panels",
    # Legacy
    "VisualBridge",
]
