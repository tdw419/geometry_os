"""
Render Configuration for Visual Shell
Controls the switch between PixiJS (legacy) and Native GeoASM rendering.

DEPRECATED (PixiJS): The PixiJS renderer is deprecated as of 2026-03-08.
                    It will be archived and removed from active development.
                    Use native renderer for all new development.
"""

from dataclasses import dataclass, field
from typing import Literal, Optional
from enum import Enum
import os


class RendererBackend(Enum):
    """Available renderer backends."""
    NATIVE = "native"       # GeoASM + Rust + WGSL (recommended)
    PIXIJS = "pixijs"       # Legacy PixiJS (deprecated)


@dataclass
class RenderConfig:
    """
    Configuration for the Visual Shell renderer.

    Default: Native renderer (use_native_renderer=True)

    Migration Guide:
    - To use legacy PixiJS: set use_native_renderer=False (temporary for testing)
    - To run both in parallel: set parallel_mode=True (for validation)
    """

    # Primary renderer selection
    use_native_renderer: bool = True  # Default to native

    # Parallel mode for validation (Task 3.2)
    parallel_mode: bool = False  # Run both renderers simultaneously
    log_performance_metrics: bool = True

    # Native renderer settings
    native_backend: RendererBackend = RendererBackend.NATIVE
    hilbert_substrate_size: int = 1024  # Size of Hilbert-mapped VRAM
    dirty_region_tracking: bool = True

    # PixiJS settings (deprecated)
    pixijs_backend: RendererBackend = RendererBackend.PIXIJS

    # Resolution
    resolution: tuple[int, int] = (1920, 1080)

    # Feature flags
    enable_drag_and_drop: bool = True
    enable_z_order_management: bool = True
    enable_notifications: bool = True
    enable_window_buttons: bool = True

    # Performance
    target_fps: int = 60
    max_glyphs_per_frame: int = 10000

    @classmethod
    def from_env(cls) -> "RenderConfig":
        """Load configuration from environment variables."""
        return cls(
            use_native_renderer=os.getenv("GEOMETRY_OS_NATIVE_RENDERER", "true").lower() == "true",
            parallel_mode=os.getenv("GEOMETRY_OS_PARALLEL_RENDER", "false").lower() == "true",
            resolution=(
                int(os.getenv("GEOMETRY_OS_WIDTH", "1920")),
                int(os.getenv("GEOMETRY_OS_HEIGHT", "1080"))
            ),
            target_fps=int(os.getenv("GEOMETRY_OS_TARGET_FPS", "60"))
        )

    @property
    def backend(self) -> RendererBackend:
        """Get the active backend."""
        return RendererBackend.NATIVE if self.use_native_renderer else RendererBackend.PIXIJS

    @property
    def is_native(self) -> bool:
        """Check if using native renderer."""
        return self.use_native_renderer

    @property
    def is_pixijs(self) -> bool:
        """Check if using PixiJS renderer."""
        return not self.use_native_renderer


# Default configuration instance
DEFAULT_CONFIG = RenderConfig()


def get_render_config() -> RenderConfig:
    """Get the global render configuration."""
    return DEFAULT_CONFIG


def set_render_config(config: RenderConfig):
    """Set the global render configuration."""
    global DEFAULT_CONFIG
    DEFAULT_CONFIG = config


if __name__ == "__main__":
    # Demo
    config = RenderConfig.from_env()
    print(f"Renderer Backend: {config.backend.value}")
    print(f"Native: {config.is_native}")
    print(f"Parallel Mode: {config.parallel_mode}")
    print(f"Resolution: {config.resolution}")
