"""
Renderer Factory for Visual Shell
Provides a unified interface for both PixiJS and Native renderers.

Usage:
    from systems.visual_shell.api.renderer_factory import get_window_manager

    # Get the configured window manager (native by default)
    manager = get_window_manager()

    # Or with custom config
    from systems.visual_shell.api.render_config import RenderConfig
    config = RenderConfig(use_native_renderer=True)
    manager = get_window_manager(config)
"""

import logging
from typing import Optional, Protocol, List, Dict, Any, runtime_checkable

from .render_config import RenderConfig, get_render_config, RendererBackend

logger = logging.getLogger("renderer_factory")


@runtime_checkable
class WindowManagerProtocol(Protocol):
    """Protocol defining the window manager interface."""

    def create_window(
        self,
        window_id: str,
        title: str,
        x: float,
        y: float,
        width: float,
        height: float,
        **kwargs
    ) -> Any:
        """Create a new window."""
        ...

    def destroy_window(self, window_id: str) -> bool:
        """Destroy a window by ID."""
        ...

    def bring_to_front(self, window_id: str) -> bool:
        """Bring a window to the front."""
        ...

    def get_all_glyph_commands(self) -> List[Dict[str, Any]]:
        """Get glyph commands for rendering."""
        ...

    def get_render_state(self) -> Dict[str, Any]:
        """Get current render state."""
        ...


def get_window_manager(config: Optional[RenderConfig] = None) -> WindowManagerProtocol:
    """
    Get the appropriate window manager based on configuration.

    Args:
        config: Optional render config. Uses global config if not provided.

    Returns:
        WindowManagerProtocol: NativeWindowManager or PixiJS WindowManager wrapper
    """
    if config is None:
        config = get_render_config()

    if config.use_native_renderer:
        logger.info("Using Native GeoASM Renderer (recommended)")
        from .native_window_manager import NativeWindowManager
        return NativeWindowManager(initial_resolution=config.resolution)
    else:
        logger.warning("Using deprecated PixiJS Renderer - migrate to native")
        # Return a wrapper that mimics PixiJS WindowManager but uses native under the hood
        # This is a transition shim - PixiJS is being deprecated
        from .native_window_manager import NativeWindowManager
        logger.info("PixiJS wrapper falling back to Native (PixiJS deprecated)")
        return NativeWindowManager(initial_resolution=config.resolution)


def get_glyph_renderer(config: Optional[RenderConfig] = None):
    """
    Get the glyph renderer for the configured backend.

    Args:
        config: Optional render config. Uses global config if not provided.

    Returns:
        Glyph renderer instance
    """
    if config is None:
        config = get_render_config()

    if config.use_native_renderer:
        from .native_api import NativeVisualShellAPI
        return NativeVisualShellAPI()
    else:
        logger.warning("PixiJS glyph rendering deprecated - using native")
        from .native_api import NativeVisualShellAPI
        return NativeVisualShellAPI()


class RendererMetrics:
    """
    Metrics collector for renderer performance comparison.
    Used in parallel mode (Task 3.2) to compare PixiJS vs Native.
    """

    def __init__(self):
        self.native_metrics: Dict[str, Any] = {
            "frames_rendered": 0,
            "total_glyphs": 0,
            "avg_frame_time_ms": 0.0,
            "max_glyphs_per_frame": 0
        }
        self.pixijs_metrics: Dict[str, Any] = {
            "frames_rendered": 0,
            "total_glyphs": 0,
            "avg_frame_time_ms": 0.0,
            "max_glyphs_per_frame": 0
        }
        self.comparison_log: List[Dict[str, Any]] = []

    def record_native_frame(self, glyph_count: int, frame_time_ms: float):
        """Record a frame from the native renderer."""
        m = self.native_metrics
        m["frames_rendered"] += 1
        m["total_glyphs"] += glyph_count
        m["max_glyphs_per_frame"] = max(m["max_glyphs_per_frame"], glyph_count)
        # Rolling average
        m["avg_frame_time_ms"] = (
            (m["avg_frame_time_ms"] * (m["frames_rendered"] - 1) + frame_time_ms)
            / m["frames_rendered"]
        )

    def record_pixijs_frame(self, glyph_count: int, frame_time_ms: float):
        """Record a frame from the PixiJS renderer."""
        m = self.pixijs_metrics
        m["frames_rendered"] += 1
        m["total_glyphs"] += glyph_count
        m["max_glyphs_per_frame"] = max(m["max_glyphs_per_frame"], glyph_count)
        m["avg_frame_time_ms"] = (
            (m["avg_frame_time_ms"] * (m["frames_rendered"] - 1) + frame_time_ms)
            / m["frames_rendered"]
        )

    def compare(self) -> Dict[str, Any]:
        """Compare native vs PixiJS performance."""
        return {
            "native": self.native_metrics,
            "pixijs": self.pixijs_metrics,
            "speedup": (
                self.pixijs_metrics["avg_frame_time_ms"]
                / self.native_metrics["avg_frame_time_ms"]
                if self.native_metrics["avg_frame_time_ms"] > 0 else 0
            )
        }


if __name__ == "__main__":
    # Demo
    config = RenderConfig(use_native_renderer=True)
    manager = get_window_manager(config)

    # Create a window
    window = manager.create_window(
        "demo",
        "Demo Window",
        100, 100,
        400, 300
    )

    print(f"Created window: {window}")
    print(f"Glyph commands: {len(manager.get_all_glyph_commands())}")
    print(f"Backend: {config.backend.value}")
