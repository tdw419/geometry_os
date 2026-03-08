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
"""

# Configuration
from .render_config import (
    RenderConfig,
    RendererBackend,
    get_render_config,
    set_render_config,
    DEFAULT_CONFIG,
)

# Factory
from .renderer_factory import (
    get_window_manager,
    get_glyph_renderer,
    RendererMetrics,
    WindowManagerProtocol,
)

# Native implementations (default)
from .native_window_manager import (
    NativeWindowManager,
    NativeWindow,
    WindowState,
    WindowButtonType,
    DragState,
)

from .native_api import (
    NativeVisualShellAPI,
    UIEntity,
)

from .native_panel import NativePanel

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
    # Legacy
    "VisualBridge",
]
