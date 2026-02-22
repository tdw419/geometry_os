#!/usr/bin/env python3
"""
VATManager - Phase 28: Spatial Tectonics

Manages the Visual Allocation Table (VAT) for tile positions.
Receives LayoutDeltas from TectonicHandler and applies movements.

Architecture:
┌──────────────────┐     ┌──────────────────┐     ┌──────────────────┐
│ TectonicHandler  │ ──► │ VATManager       │ ──► │ vat.json         │
│ LayoutDelta      │     │ apply_delta()    │     │ (persisted)      │
└──────────────────┘     └──────────────────┘     └──────────────────┘

VAT Format:
{
    "version": "2.0",
    "grid_size": 4096,
    "center": {"x": 2048, "y": 2048},
    "tiles": {
        "1": {"x": 100, "y": 200, "type": "neural", "last_move": 1234567890},
        "2": {"x": 150, "y": 250, "type": "memory", "last_move": 1234567890},
        ...
    }
}
"""

import json
import time
import logging
from dataclasses import dataclass, field, asdict
from pathlib import Path
from typing import Dict, List, Optional, Any, Tuple
from datetime import datetime
import shutil

logger = logging.getLogger("spatial_tectonics.vat")


@dataclass
class TilePosition:
    """Position and metadata for a single tile."""
    x: int
    y: int
    tile_type: str = "unknown"
    district: str = "default"
    last_move: float = 0.0
    move_count: int = 0

    def to_dict(self) -> Dict[str, Any]:
        return asdict(self)

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "TilePosition":
        return cls(
            x=data.get("x", 0),
            y=data.get("y", 0),
            tile_type=data.get("tile_type", "unknown"),
            district=data.get("district", "default"),
            last_move=data.get("last_move", 0.0),
            move_count=data.get("move_count", 0)
        )


@dataclass
class VAT:
    """Visual Allocation Table containing all tile positions."""
    version: str = "2.0"
    grid_size: int = 4096
    center_x: int = 2048
    center_y: int = 2048
    tiles: Dict[str, TilePosition] = field(default_factory=dict)
    last_updated: float = field(default_factory=time.time)
    update_count: int = 0

    def to_dict(self) -> Dict[str, Any]:
        return {
            "version": self.version,
            "grid_size": self.grid_size,
            "center": {"x": self.center_x, "y": self.center_y},
            "tiles": {
                k: v.to_dict() for k, v in self.tiles.items()
            },
            "last_updated": self.last_updated,
            "update_count": self.update_count
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "VAT":
        center = data.get("center", {"x": 2048, "y": 2048})
        tiles_data = data.get("tiles", {})
        tiles = {
            k: TilePosition.from_dict(v) for k, v in tiles_data.items()
        }
        return cls(
            version=data.get("version", "2.0"),
            grid_size=data.get("grid_size", 4096),
            center_x=center.get("x", 2048),
            center_y=center.get("y", 2048),
            tiles=tiles,
            last_updated=data.get("last_updated", time.time()),
            update_count=data.get("update_count", 0)
        )


class VATManager:
    """
    Manages Visual Allocation Table for tile positions.

    The VAT is the source of truth for where each tile/district is located
    on the spatial map. Tectonic realignments modify tile positions here.
    """

    VAT_FILE = "vat.json"
    BACKUP_SUFFIX = ".bak"

    def __init__(self, state_dir: Optional[Path] = None, auto_save: bool = True):
        """
        Initialize VAT Manager.

        Args:
            state_dir: Directory for VAT file (default: .geometry/tectonic/)
            auto_save: Automatically save after modifications
        """
        self.state_dir = state_dir or Path(".geometry/tectonic")
        self.state_dir.mkdir(parents=True, exist_ok=True)
        self.auto_save = auto_save

        self.vat = self._load_vat()
        self._pending_changes = False

        logger.info(
            f"VATManager initialized with {len(self.vat.tiles)} tiles "
            f"(grid_size={self.vat.grid_size})"
        )

    def get_tile_position(self, tile_id: int) -> Optional[TilePosition]:
        """
        Get position for a tile.

        Args:
            tile_id: Tile identifier

        Returns:
            TilePosition if found, None otherwise
        """
        return self.vat.tiles.get(str(tile_id))

    def set_tile_position(
        self,
        tile_id: int,
        x: int,
        y: int,
        tile_type: str = "unknown",
        district: str = "default"
    ) -> TilePosition:
        """
        Set position for a tile.

        Args:
            tile_id: Tile identifier
            x: X coordinate
            y: Y coordinate
            tile_type: Type of tile (neural, memory, etc.)
            district: District identifier

        Returns:
            Updated TilePosition
        """
        tile_key = str(tile_id)
        existing = self.vat.tiles.get(tile_key)

        if existing:
            existing.x = x
            existing.y = y
            existing.last_move = time.time()
            existing.move_count += 1
            pos = existing
        else:
            pos = TilePosition(
                x=x,
                y=y,
                tile_type=tile_type,
                district=district,
                last_move=time.time(),
                move_count=1
            )
            self.vat.tiles[tile_key] = pos

        self.vat.last_updated = time.time()
        self.vat.update_count += 1
        self._pending_changes = True

        if self.auto_save:
            self._save_vat()

        return pos

    def apply_delta(self, delta: Any) -> int:
        """
        Apply a LayoutDelta to update tile positions.

        Args:
            delta: LayoutDelta with movements list

        Returns:
            Number of tiles moved
        """
        movements = getattr(delta, "movements", [])
        if not movements:
            logger.warning("No movements in delta")
            return 0

        moved = 0
        for movement in movements:
            tile_id = getattr(movement, "tile_id", None)
            if tile_id is None:
                continue

            new_x = getattr(movement, "new_x", 0)
            new_y = getattr(movement, "new_y", 0)

            # Clamp to grid bounds
            new_x = max(0, min(new_x, self.vat.grid_size - 1))
            new_y = max(0, min(new_y, self.vat.grid_size - 1))

            existing = self.vat.tiles.get(str(tile_id))
            if existing:
                existing.x = new_x
                existing.y = new_y
                existing.last_move = time.time()
                existing.move_count += 1
            else:
                self.vat.tiles[str(tile_id)] = TilePosition(
                    x=new_x,
                    y=new_y,
                    last_move=time.time(),
                    move_count=1
                )

            moved += 1

        if moved > 0:
            self.vat.last_updated = time.time()
            self.vat.update_count += 1
            self._pending_changes = True

            if self.auto_save:
                self._save_vat()

        logger.info(f"Applied delta: {moved} tiles moved")
        return moved

    def get_all_positions(self) -> Dict[int, Tuple[int, int]]:
        """
        Get all tile positions.

        Returns:
            Dict mapping tile_id to (x, y) tuple
        """
        return {
            int(k): (v.x, v.y)
            for k, v in self.vat.tiles.items()
        }

    def get_district_positions(self, district: str) -> Dict[int, Tuple[int, int]]:
        """
        Get positions for tiles in a specific district.

        Args:
            district: District identifier

        Returns:
            Dict mapping tile_id to (x, y) tuple
        """
        return {
            int(k): (v.x, v.y)
            for k, v in self.vat.tiles.items()
            if v.district == district
        }

    def get_stats(self) -> Dict[str, Any]:
        """Get VAT statistics."""
        type_counts = {}
        district_counts = {}

        for tile in self.vat.tiles.values():
            type_counts[tile.tile_type] = type_counts.get(tile.tile_type, 0) + 1
            district_counts[tile.district] = district_counts.get(tile.district, 0) + 1

        return {
            "tile_count": len(self.vat.tiles),
            "grid_size": self.vat.grid_size,
            "center": {"x": self.vat.center_x, "y": self.vat.center_y},
            "last_updated": self.vat.last_updated,
            "update_count": self.vat.update_count,
            "tile_types": type_counts,
            "districts": district_counts,
            "pending_changes": self._pending_changes
        }

    def save(self) -> bool:
        """Force save VAT to disk."""
        return self._save_vat()

    def _load_vat(self) -> VAT:
        """Load VAT from disk."""
        vat_path = self.state_dir / self.VAT_FILE

        if not vat_path.exists():
            logger.info("No existing VAT, creating new")
            return VAT()

        try:
            with open(vat_path, "r") as f:
                data = json.load(f)

            vat = VAT.from_dict(data)
            logger.info(f"Loaded VAT with {len(vat.tiles)} tiles")
            return vat

        except Exception as e:
            logger.warning(f"Failed to load VAT: {e}, creating new")
            return VAT()

    def _save_vat(self) -> bool:
        """Save VAT to disk with backup."""
        vat_path = self.state_dir / self.VAT_FILE

        try:
            # Create backup if file exists
            if vat_path.exists():
                backup_path = self.state_dir / f"{self.VAT_FILE}{self.BACKUP_SUFFIX}"
                shutil.copy2(vat_path, backup_path)

            # Write new VAT
            with open(vat_path, "w") as f:
                json.dump(self.vat.to_dict(), f, indent=2)

            self._pending_changes = False
            logger.debug(f"Saved VAT with {len(self.vat.tiles)} tiles")
            return True

        except Exception as e:
            logger.error(f"Failed to save VAT: {e}")
            return False

    def create_sample_tiles(self, count: int = 100):
        """Create sample tiles for testing."""
        import random

        districts = ["neural", "memory", "compute", "io", "control"]

        for i in range(count):
            x = random.randint(0, self.vat.grid_size - 1)
            y = random.randint(0, self.vat.grid_size - 1)
            district = random.choice(districts)

            self.set_tile_position(
                tile_id=i,
                x=x,
                y=y,
                tile_type=district,
                district=district
            )

        logger.info(f"Created {count} sample tiles")


# Standalone function for Visual Bridge integration
def create_vat_manager(state_dir: Optional[Path] = None) -> VATManager:
    """Factory function for creating VATManager."""
    return VATManager(state_dir)


if __name__ == "__main__":
    # Demo
    manager = VATManager()

    print("Initial stats:", json.dumps(manager.get_stats(), indent=2))

    # Create some sample tiles
    manager.create_sample_tiles(50)
    print("\nAfter creating 50 tiles:", json.dumps(manager.get_stats(), indent=2))

    # Get a position
    pos = manager.get_tile_position(0)
    if pos:
        print(f"\nTile 0 position: ({pos.x}, {pos.y})")

    # Update a position
    manager.set_tile_position(0, 500, 600, "neural", "compute")
    pos = manager.get_tile_position(0)
    if pos:
        print(f"Tile 0 new position: ({pos.x}, {pos.y}), moves={pos.move_count}")
