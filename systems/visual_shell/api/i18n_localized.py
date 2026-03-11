"""
Native Visual Shell API
Coordinates between high-level system services and the GeoASM native rasterizer.
"""

import logging
import time
import warnings
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

try:
    from .native_panel import NativePanel
    from .renderer_config import DeprecationWarning, RendererConfig, RendererType
    from .i18n import get_localization, set_language, get_current_language
except ImportError:
    from native_panel import NativePanel
    from renderer_config import DeprecationWarning, RendererConfig, RendererType
    from i18n import get_localization, set_language, get_current_language

logger = logging.getLogger("native_visual_shell")


@dataclass
class UIEntity:
    id: str
    type: str  # 'orb', 'panel', 'icon'
    x: float
    y: float
    z: float = 0.0
    width: float = 0.0
    height: float = 0.0
    color: tuple = (255, 255, 255, 255)
    metadata: dict[str, Any] = None


class NativeVisualShellAPI:
    def __init__(
        self,
        bin_path: str = "systems/visual_shell/native/geoasm_glyphs.bin",
        config: RendererConfig | None = None,
        language: str = "en"
    ):
        self.entities: dict[str, UIEntity] = {}
        self.panels: dict[str, NativePanel] = {}
        self.bin_path = Path(bin_path)
        self.resolution = 1024
        self._next_z: int = 1
        self._focused_panel: str | None = None
        self._config = config or RendererConfig()
        self._last_frame_time: float = 0.0
        self._frame_count: int = 0

        # Initialize localization
        self.i18n = get_localization()
        if language != "en":
            set_language(language)

        # Load the pre-assembled GeoASM library
        self.library_bytes = self._load_library()
        logger.info(self.i18n.get(
            "notifications.system.initialized",
            count=len(self.library_bytes)
        ))

    @property
    def config(self) -> RendererConfig:
        """Get the current renderer configuration"""
        return self._config

    @property
    def renderer_type(self) -> str:
        """Get the current renderer type"""
        return "native" if self._config.use_native_renderer else "pixijs"

    def set_language(self, language_code: str) -> bool:
        """
        Set the UI language.
        
        Args:
            language_code: ISO 639-1 language code (e.g., 'en', 'es', 'fr')
            
        Returns:
            True if language was changed successfully
        """
        success = set_language(language_code)
        if success:
            logger.info(self.i18n.get(
                "settings.language.current",
                language=self.i18n.get_language_info(language_code).name
            ))
        return success

    def get_supported_languages(self):
        """Get list of supported languages."""
        return self.i18n.get_supported_languages()

    def set_renderer(self, renderer_type: str):
        """
        Switch between native and PixiJS renderers.

        Args:
            renderer_type: 'native' or 'pixijs'

        Warns:
            DeprecationWarning: When switching to PixiJS
        """
        if renderer_type == "pixijs":
            warnings.warn(
                self.i18n.get("notifications.renderer.pixijs_deprecated"),
                DeprecationWarning,
                stacklevel=2
            )
            self._config.use_native_renderer = False
            self._config.preferred_renderer = RendererType.PIXIJS
        elif renderer_type == "native":
            self._config.use_native_renderer = True
            self._config.preferred_renderer = RendererType.NATIVE
            logger.info(self.i18n.get("notifications.renderer.native_enabled"))
        else:
            error_msg = self.i18n.get(
                "errors.renderer.unknown_type",
                type=renderer_type
            )
            raise ValueError(error_msg)

    def get_telemetry(self) -> dict[str, Any]:
        """
        Get telemetry data for performance monitoring.

        Returns:
            Dictionary with render time, entity count, renderer type
        """
        return {
            "renderer": self.renderer_type,
            "entity_count": len(self.entities),
            "panel_count": len(self.panels),
            "frame_count": self._frame_count,
            "last_frame_time_ms": self._last_frame_time,
            "use_native_renderer": self._config.use_native_renderer,
            "language": get_current_language(),
        }

    def _load_library(self) -> bytes:
        if not self.bin_path.exists():
            logger.warning(self.i18n.get(
                "errors.file.not_found",
                path=str(self.bin_path)
            ))
            return b""
        return self.bin_path.read_bytes()

    def add_entity(self, entity: UIEntity):
        self.entities[entity.id] = entity
        logger.debug(f"Added entity: {entity.id} ({entity.type})")

    def remove_entity(self, entity_id: str):
        if entity_id in self.entities:
            del self.entities[entity_id]

    def update_entity(self, entity_id: str, **kwargs):
        if entity_id in self.entities:
            entity = self.entities[entity_id]
            for key, value in kwargs.items():
                if hasattr(entity, key):
                    setattr(entity, key, value)

    def get_render_state(self) -> list[dict[str, Any]]:
        """Return the current visual state for the renderer."""
        return [asdict(e) for e in self.entities.values()]

    def compose_frame(self) -> bytes:
        """
        Generate a full GeoASM frame that renders the current state.
        This dynamically builds a GeoASM program that calls functions
        from the pre-assembled library.
        """
        start_time = time.time()

        # 1. Start with the library
        frame_code = bytearray(self.library_bytes)

        # 2. Append dynamic calls for each entity
        # (In a real implementation, we'd use a linker or fixed entry points)
        # For now, we return the state as JSON which the hypervisor handles

        # Track telemetry
        self._frame_count += 1
        self._last_frame_time = (time.time() - start_time) * 1000

        return bytes(frame_code)

    def calculate_layout(self, engine_bridge: Any):
        """
        Use the FFI Bridge to perform complex layout on entities.
        """
        orbs = [e for e in self.entities.values() if e.type == 'orb']
        if not orbs:
            return

        # Prepare data for FFI
        # (Conceptual: this would call layout.spiral_coords or layout.force_directed)
        pass

    def sync_to_vram(self, shared_memory: Any):
        """
        Write entity data directly to shared memory for the Rust/WGSL renderer.
        """
        # Each entity takes a fixed block in the entity buffer
        # [type, x, y, w, h, r, g, b, a, ...]
        pass

    # ========================================================================
    # Panel Management (DesktopWindow.js port)
    # ========================================================================

    @property
    def focused_panel(self) -> str | None:
        """ID of the currently focused panel"""
        return self._focused_panel

    def create_panel(
        self,
        id: str,
        title: str,
        x: float,
        y: float,
        width: float,
        height: float
    ) -> NativePanel:
        """
        Create a new native panel.

        This is the native equivalent of DesktopWindow.js constructor.
        """
        panel = NativePanel(
            id=id,
            title=title,
            x=x,
            y=y,
            width=width,
            height=height,
            z=self._next_z,
            focused=True
        )
        panel._api = self  # Store reference for close()
        self._next_z += 1

        # Unfocus previous panel
        if self._focused_panel and self._focused_panel in self.panels:
            self.panels[self._focused_panel].focused = False

        self.panels[id] = panel
        self._focused_panel = id

        # Also add as UIEntity for rendering
        self.entities[id] = UIEntity(
            id=id,
            type="panel",
            x=x,
            y=y,
            z=panel.z,
            width=width,
            height=height,
            metadata={"title": title}
        )

        logger.debug(self.i18n.get(
            "notifications.window.created",
            title=title
        ))
        return panel

    def get_panel(self, panel_id: str) -> NativePanel | None:
        """Get a panel by ID"""
        return self.panels.get(panel_id)

    def get_panels(self) -> list[NativePanel]:
        """Get all panels"""
        return list(self.panels.values())

    def bring_to_front(self, panel_id: str):
        """Bring a panel to the front (highest z-index)"""
        if panel_id in self.panels:
            panel = self.panels[panel_id]
            panel.z = self._next_z
            self._next_z += 1

            # Update entity z
            if panel_id in self.entities:
                self.entities[panel_id].z = panel.z

    def focus_panel(self, panel_id: str):
        """Set focus to a specific panel"""
        if panel_id not in self.panels:
            return

        # Unfocus current
        if self._focused_panel and self._focused_panel in self.panels:
            self.panels[self._focused_panel].focused = False

        # Focus new
        self.panels[panel_id].focused = True
        self._focused_panel = panel_id
        self.bring_to_front(panel_id)

        logger.debug(self.i18n.get(
            "notifications.window.focused",
            title=self.panels[panel_id].title
        ))

    def get_panel_at(self, x: float, y: float) -> NativePanel | None:
        """Get the topmost panel at a given point"""
        # Sort by z-index descending (highest first)
        sorted_panels = sorted(
            self.panels.values(),
            key=lambda p: p.z,
            reverse=True
        )

        for panel in sorted_panels:
            if panel.contains_point(x, y):
                return panel

        return None


if __name__ == "__main__":
    # Basic PoC usage with localization
    api = NativeVisualShellAPI(language="en")
    api.add_entity(UIEntity(
        id="root_panel",
        type="panel",
        x=100, y=100,
        width=800, height=600
    ))
    api.add_entity(UIEntity(id="file_1", type="orb", x=200, y=200))

    print(f"Current entities: {len(api.get_render_state())}")
    print(f"Current language: {get_current_language()}")
    print(f"Supported languages: {len(api.get_supported_languages())}")

    # Test language switching
    api.set_language("es")
    print(f"Changed to: {get_current_language()}")
