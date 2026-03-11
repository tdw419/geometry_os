"""
Native Visual Shell API
Coordinates between high-level system services and the GeoASM native rasterizer.

Logging:
    This module logs critical operations for debugging and performance monitoring:
    - Initialization and configuration changes
    - Panel creation, focus, and z-index management
    - Entity CRUD operations
    - Frame composition timing
    - Renderer switching events
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
except ImportError:
    from native_panel import NativePanel
    from renderer_config import DeprecationWarning, RendererConfig, RendererType

# ============================================================================
# Logging Configuration
# ============================================================================

logger = logging.getLogger("native_visual_shell")

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

# Performance tracking thresholds
_SLOW_FRAME_THRESHOLD_MS = 16.0  # ~60fps
_VERY_SLOW_FRAME_THRESHOLD_MS = 33.0  # ~30fps (severe performance degradation)

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
    """
    Native Visual Shell API for Geometry OS.
    
    Manages entities, panels, and rendering state for the visual shell.
    Provides logging for all critical operations to support debugging
    and performance monitoring.
    """
    
    def __init__(
        self,
        bin_path: str = "systems/visual_shell/native/geoasm_glyphs.bin",
        config: RendererConfig | None = None
    ):
        init_start = time.time()
        logger.info(f"Initializing Native Visual Shell API (bin_path={bin_path})")
        
        self.entities: dict[str, UIEntity] = {}
        self.panels: dict[str, NativePanel] = {}
        self.bin_path = Path(bin_path)
        self.resolution = 1024
        self._next_z: int = 1
        self._focused_panel: str | None = None
        self._config = config or RendererConfig()
        self._last_frame_time: float = 0.0
        self._frame_count: int = 0
        self._slow_frame_count: int = 0
        self._entity_operations: int = 0
        
        # Performance tracking
        self._total_frame_time_ms: float = 0.0
        self._slow_frame_count: int = 0
        self._entity_operations: int = 0

        # Load the pre-assembled GeoASM library
        lib_load_start = time.time()
        self.library_bytes = self._load_library()
        lib_load_time = (time.time() - lib_load_start) * 1000
        
        init_time = (time.time() - init_start) * 1000
        logger.info(
            f"Native Visual Shell API initialized in {init_time:.2f}ms "
            f"(GeoASM library: {len(self.library_bytes)} bytes in {lib_load_time:.2f}ms, "
            f"renderer={self.renderer_type})"
        )

    @property
    def config(self) -> RendererConfig:
        """Get the current renderer configuration"""
        return self._config

    @property
    def renderer_type(self) -> str:
        """Get the current renderer type"""
        return "native" if self._config.use_native_renderer else "pixijs"

    def set_renderer(self, renderer_type: str):
        """
        Switch between native and PixiJS renderers.

        Args:
            renderer_type: 'native' or 'pixijs'

        Warns:
            DeprecationWarning: When switching to PixiJS
        """
        old_renderer = self.renderer_type
        logger.info(f"Renderer switch requested: {old_renderer} → {renderer_type}")
        
        if renderer_type == "pixijs":
            warnings.warn(
                "PixiJS renderer is deprecated. Native renderer is recommended.",
                DeprecationWarning,
                stacklevel=2
            )
            self._config.use_native_renderer = False
            self._config.preferred_renderer = RendererType.PIXIJS
            logger.warning("Switched to deprecated PixiJS renderer")
        elif renderer_type == "native":
            self._config.use_native_renderer = True
            self._config.preferred_renderer = RendererType.NATIVE
            logger.info("Switched to native renderer")
        else:
            logger.error(f"Unknown renderer type requested: {renderer_type}")
            raise ValueError(f"Unknown renderer type: {renderer_type}")

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
        }

    def _load_library(self) -> bytes:
        if not self.bin_path.exists():
            logger.warning(f"GeoASM library not found at {self.bin_path}")
            return b""
        return self.bin_path.read_bytes()

    def add_entity(self, entity: UIEntity):
        """Add a UI entity to the scene."""
        start_time = time.time()
        self.entities[entity.id] = entity
        self._entity_operations += 1
        
        elapsed = (time.time() - start_time) * 1000
        logger.debug(
            f"Added entity: {entity.id} ({entity.type}) at ({entity.x:.1f}, {entity.y:.1f}) "
            f"[total: {len(self.entities)}, {elapsed:.2f}ms]"
        )

    def remove_entity(self, entity_id: str):
        """Remove a UI entity from the scene."""
        if entity_id in self.entities:
            entity = self.entities[entity_id]
            del self.entities[entity_id]
            self._entity_operations += 1
            logger.debug(
                f"Removed entity: {entity_id} ({entity.type}) "
                f"[remaining: {len(self.entities)}]"
            )
        else:
            logger.warning(f"Attempted to remove non-existent entity: {entity_id}")

    def update_entity(self, entity_id: str, **kwargs):
        """Update properties of an existing entity."""
        if entity_id in self.entities:
            entity = self.entities[entity_id]
            updated = []
            for key, value in kwargs.items():
                if hasattr(entity, key):
                    setattr(entity, key, value)
                    updated.append(key)
            
            if updated:
                self._entity_operations += 1
                logger.debug(
                    f"Updated entity {entity_id}: {', '.join(updated)}"
                )
        else:
            logger.warning(f"Attempted to update non-existent entity: {entity_id}")

    def get_render_state(self) -> list[dict[str, Any]]:
        """Return the current visual state for the renderer."""
        return [asdict(e) for e in self.entities.values()]

    def compose_frame(self) -> bytes:
        """
        Generate a full GeoASM frame that renders the current state.
        This dynamically builds a GeoASM program that calls functions
        from the pre-assembled library.
        
        Performance:
            Logs warnings for frames taking >16ms (60fps threshold)
            Logs errors for frames taking >33ms (30fps threshold)
        """
        start_time = time.time()
        entity_count = len(self.entities)
        panel_count = len(self.panels)

        # 1. Start with the library
        frame_code = bytearray(self.library_bytes)

        # 2. Append dynamic calls for each entity
        # (In a real implementation, we'd use a linker or fixed entry points)
        # For now, we return the state as JSON which the hypervisor handles

        # Track telemetry
        self._frame_count += 1
        self._last_frame_time = (time.time() - start_time) * 1000
        
        # Performance logging
        if self._last_frame_time > _VERY_SLOW_FRAME_THRESHOLD_MS:
            logger.error(
                f"Frame {self._frame_count} took {self._last_frame_time:.2f}ms "
                f"(entities={entity_count}, panels={panel_count}) - "
                f"SEVERE PERFORMANCE DEGRADATION"
            )
            self._slow_frame_count += 1
        elif self._last_frame_time > _SLOW_FRAME_THRESHOLD_MS:
            logger.warning(
                f"Frame {self._frame_count} took {self._last_frame_time:.2f}ms "
                f"(entities={entity_count}, panels={panel_count})"
            )
            self._slow_frame_count += 1
        elif logger.isEnabledFor(logging.DEBUG) and self._frame_count % 60 == 0:
            logger.debug(
                f"Frame {self._frame_count}: {self._last_frame_time:.2f}ms, "
                f"entities={entity_count}, panels={panel_count}, "
                f"slow_frames={self._slow_frame_count}"
            )

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
        start_time = time.time()
        
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
            old_focused = self._focused_panel
            self.panels[old_focused].focused = False
            logger.debug(f"Unfocused previous panel: {old_focused}")

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

        elapsed = (time.time() - start_time) * 1000
        logger.info(
            f"Created panel: '{title}' (id={id}) at ({x:.0f}, {y:.0f}) "
            f"size=({width:.0f}x{height:.0f}), z={panel.z} "
            f"[total panels: {len(self.panels)}, {elapsed:.2f}ms]"
        )
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
            old_z = panel.z
            panel.z = self._next_z
            self._next_z += 1

            # Update entity z
            if panel_id in self.entities:
                self.entities[panel_id].z = panel.z

            logger.debug(
                f"Panel '{panel_id}' brought to front (z: {old_z} → {panel.z})"
            )

    def focus_panel(self, panel_id: str):
        """Set focus to a specific panel"""
        if panel_id not in self.panels:
            logger.warning(f"Attempted to focus non-existent panel: {panel_id}")
            return

        old_focused = self._focused_panel
        
        # Unfocus current
        if self._focused_panel and self._focused_panel in self.panels:
            self.panels[self._focused_panel].focused = False

        # Focus new
        self.panels[panel_id].focused = True
        self._focused_panel = panel_id
        self.bring_to_front(panel_id)

        if old_focused != panel_id:
            logger.debug(
                f"Focus changed: '{old_focused}' → '{panel_id}' "
                f"(z={self.panels[panel_id].z})"
            )

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
                logger.debug(
                    f"Hit test at ({x:.0f}, {y:.0f}) found panel '{panel.id}' "
                    f"(z={panel.z})"
                )
                return panel

        logger.debug(f"Hit test at ({x:.0f}, {y:.0f}) found no panel")
        return None

if __name__ == "__main__":
    # Basic PoC usage
    api = NativeVisualShellAPI()
    api.add_entity(UIEntity(id="root_panel", type="panel", x=100, y=100, width=800, height=600))
    api.add_entity(UIEntity(id="file_1", type="orb", x=200, y=200))

    print(f"Current entities: {len(api.get_render_state())}")
