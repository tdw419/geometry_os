"""
Renderer Configuration Module

Manages renderer selection and parallel mode for the Native Visual Shell.
"""

from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class RendererType(Enum):
    """Renderer type selection"""
    NATIVE = "native"
    PIXIJS = "pixijs"


class DeprecationWarning(UserWarning):
    """Warning when using deprecated PixiJS renderer"""
    pass


@dataclass
class RendererConfig:
    """Configuration for visual shell renderer"""

    use_native_renderer: bool = True
    enable_parallel_mode: bool = False
    preferred_renderer: RendererType = field(default=RendererType.NATIVE)

    # Performance thresholds
    native_target_fps: float = 60.0
    pixijs_target_fps: float = 30.0

    def get_preferred_renderer(self) -> RendererType:
        """Get the preferred renderer based on config"""
        if self.enable_parallel_mode:
            return RendererType.NATIVE  # Native preferred in parallel mode

        return self.preferred_renderer

    def to_dict(self) -> dict[str, Any]:
        """Convert config to dictionary for serialization"""
        return {
            "use_native_renderer": self.use_native_renderer,
            "enable_parallel_mode": self.enable_parallel_mode,
            "preferred_renderer": self.preferred_renderer.value,
            "native_target_fps": self.native_target_fps,
            "pixijs_target_fps": self.pixijs_target_fps,
        }

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "RendererConfig":
        """Create config from dictionary"""
        return cls(
            use_native_renderer=data.get("use_native_renderer", True),
            enable_parallel_mode=data.get("enable_parallel_mode", False),
            preferred_renderer=RendererType(data.get("preferred_renderer", "native")),
            native_target_fps=data.get("native_target_fps", 60.0),
            pixijs_target_fps=data.get("pixijs_target_fps", 30.0),
        )
