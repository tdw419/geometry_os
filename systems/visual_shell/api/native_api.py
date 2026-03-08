"""
Native Visual Shell API
Coordinates between high-level system services and the GeoASM native rasterizer.
"""

import logging
import json
from pathlib import Path
from typing import List, Dict, Any, Optional
from dataclasses import dataclass, asdict

try:
    from .native_panel import NativePanel
except ImportError:
    from native_panel import NativePanel

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
    metadata: Dict[str, Any] = None

class NativeVisualShellAPI:
    def __init__(self, bin_path: str = "systems/visual_shell/native/geoasm_glyphs.bin"):
        self.entities: Dict[str, UIEntity] = {}
        self.panels: Dict[str, NativePanel] = {}
        self.bin_path = Path(bin_path)
        self.resolution = 1024
        self._next_z: int = 1
        self._focused_panel: Optional[str] = None

        # Load the pre-assembled GeoASM library
        self.library_bytes = self._load_library()
        logger.info(f"Native Visual Shell API initialized with {len(self.library_bytes)} bytes of GeoASM")

    def _load_library(self) -> bytes:
        if not self.bin_path.exists():
            logger.warning(f"GeoASM library not found at {self.bin_path}")
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

    def get_render_state(self) -> List[Dict[str, Any]]:
        """Return the current visual state for the renderer."""
        return [asdict(e) for e in self.entities.values()]

    def compose_frame(self) -> bytes:
        """
        Generate a full GeoASM frame that renders the current state.
        This dynamically builds a GeoASM program that calls functions 
        from the pre-assembled library.
        """
        # 1. Start with the library
        frame_code = bytearray(self.library_bytes)
        
        # 2. Append dynamic calls for each entity
        # (In a real implementation, we'd use a linker or fixed entry points)
        # For now, we return the state as JSON which the hypervisor handles
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
    def focused_panel(self) -> Optional[str]:
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

        logger.debug(f"Created panel: {id} at ({x}, {y})")
        return panel

    def get_panel(self, panel_id: str) -> Optional[NativePanel]:
        """Get a panel by ID"""
        return self.panels.get(panel_id)

    def get_panels(self) -> List[NativePanel]:
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

    def get_panel_at(self, x: float, y: float) -> Optional[NativePanel]:
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
    # Basic PoC usage
    api = NativeVisualShellAPI()
    api.add_entity(UIEntity(id="root_panel", type="panel", x=100, y=100, width=800, height=600))
    api.add_entity(UIEntity(id="file_1", type="orb", x=200, y=200))
    
    print(f"Current entities: {len(api.get_render_state())}")
