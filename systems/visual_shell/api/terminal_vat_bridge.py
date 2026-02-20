#!/usr/bin/env python3
"""
Terminal VAT Bridge - Phase 3: Integration

Bridges TerminalCloneManager (Rust) with VATManager (Python).
Provides terminal tile spawning with focal-point placement.

Architecture:
┌──────────────────────┐     ┌──────────────────────┐     ┌──────────────────────┐
│ TerminalVatBridge    │ ──► │ Rust API Server      │ ──► │ TerminalCloneManager │
│ spawn_terminal()     │     │ /api/terminal/spawn  │     │ (pty_engine + emu)   │
└──────────────────────┘     └──────────────────────┘     └──────────────────────┘
         │
         ▼
┌──────────────────────┐
│ VATManager           │
│ set_tile_position()  │
└──────────────────────┘

Usage:
    from systems.visual_shell.api.terminal_vat_bridge import TerminalVatBridge, TerminalTileConfig

    bridge = TerminalVatBridge()
    config = TerminalTileConfig(rows=36, cols=120, shell="/bin/bash")
    tile_id = bridge.spawn_terminal(config)
    pos = bridge.get_tile_position(tile_id)
"""

import json
import logging
import time
import requests
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional, Tuple, Dict, Any, List

# Import VATManager for tile position tracking
from vat_manager import VATManager, TilePosition

logger = logging.getLogger("terminal_vat_bridge")

# Default Rust API server endpoint
DEFAULT_API_BASE = "http://127.0.0.1:4445"


@dataclass
class TerminalTileConfig:
    """Configuration for spawning a terminal tile."""
    rows: int = 36
    cols: int = 120
    shell: str = "/bin/bash"
    district: str = "terminal"
    near_center: bool = True  # Spawn near VAT focal point
    font_size: int = 16  # Character height in pixels
    scrollback_lines: int = 1000


@dataclass
class TerminalTile:
    """Represents a terminal tile instance."""
    tile_id: int
    rows: int
    cols: int
    shell: str
    position: Tuple[int, int]
    district: str
    created_at: float = field(default_factory=time.time)
    status: str = "running"  # running, stopped, error


class TerminalVatBridge:
    """
    Bridge between Terminal Clone Manager and VAT.

    Provides:
    - Terminal tile spawning with VAT integration
    - Focal-point placement (near map center)
    - Position tracking and movement
    - Lifecycle management (create, list, destroy)
    """

    def __init__(
        self,
        state_dir: Optional[Path] = None,
        api_base: str = DEFAULT_API_BASE,
        auto_save: bool = True,
        offline_mode: bool = False
    ):
        """
        Initialize the bridge.

        Args:
            state_dir: Directory for VAT state (default: .geometry/tectonic/)
            api_base: Base URL for Rust API server
            auto_save: Auto-save VAT after changes
            offline_mode: If True, skip Rust API calls (for testing)
        """
        self.state_dir = state_dir or Path(".geometry/tectonic")
        self.state_dir.mkdir(parents=True, exist_ok=True)
        self.api_base = api_base
        self.offline_mode = offline_mode

        # Initialize VAT Manager
        self.vat_manager = VATManager(state_dir=self.state_dir, auto_save=auto_save)

        # Track terminal tiles locally
        self._terminals: Dict[int, TerminalTile] = {}
        self._next_id = 0

        # Check API connectivity
        self._api_available = self._check_api_health() if not offline_mode else False

        logger.info(
            f"TerminalVatBridge initialized "
            f"(api={'connected' if self._api_available else 'offline'}, "
            f"vat={len(self.vat_manager.vat.tiles)} tiles)"
        )

    def _check_api_health(self) -> bool:
        """Check if Rust API server is available."""
        try:
            response = requests.get(f"{self.api_base}/health", timeout=2.0)
            return response.status_code == 200
        except Exception as e:
            logger.debug(f"API health check failed: {e}")
            return False

    def spawn_terminal(self, config: TerminalTileConfig) -> int:
        """
        Spawn a new terminal tile and register with VAT.

        Args:
            config: Terminal configuration

        Returns:
            Tile ID
        """
        # Generate tile ID
        tile_id = self._next_id
        self._next_id += 1

        # Calculate position (near focal point if configured)
        if config.near_center:
            import random
            offset_x = random.randint(-300, 300)
            offset_y = random.randint(-300, 300)
            x = self.vat_manager.vat.center_x + offset_x
            y = self.vat_manager.vat.center_y + offset_y
        else:
            # Stack vertically from top-left
            x = 100 + (tile_id % 5) * 400
            y = 100 + (tile_id // 5) * 500

        # Clamp to grid bounds
        grid_size = self.vat_manager.vat.grid_size
        x = max(0, min(x, grid_size - 1))
        y = max(0, min(y, grid_size - 1))

        # Register with VAT
        self.vat_manager.set_tile_position(
            tile_id=tile_id,
            x=x,
            y=y,
            tile_type="terminal",
            district=config.district
        )

        # Track locally
        tile = TerminalTile(
            tile_id=tile_id,
            rows=config.rows,
            cols=config.cols,
            shell=config.shell,
            position=(x, y),
            district=config.district
        )
        self._terminals[tile_id] = tile

        # Try to spawn via Rust API
        if self._api_available and not self.offline_mode:
            try:
                response = requests.post(
                    f"{self.api_base}/api/terminal/spawn",
                    json={
                        "tile_id": tile_id,
                        "rows": config.rows,
                        "cols": config.cols,
                        "shell": config.shell
                    },
                    timeout=5.0
                )
                if response.status_code == 200:
                    logger.info(f"Spawned terminal {tile_id} via Rust API")
                else:
                    logger.warning(f"Rust API returned {response.status_code}")
                    tile.status = "partial"  # VAT only, no PTY
            except Exception as e:
                logger.warning(f"Failed to spawn via Rust API: {e}")
                tile.status = "partial"  # VAT only, no PTY
        else:
            tile.status = "offline"  # VAT only, API unavailable

        logger.info(
            f"Spawned terminal tile {tile_id} at ({x}, {y}) "
            f"with {config.cols}x{config.rows} grid [{tile.status}]"
        )

        return tile_id

    def get_tile_position(self, tile_id: int) -> Optional[Tuple[int, int]]:
        """
        Get position of a terminal tile.

        Args:
            tile_id: Tile identifier

        Returns:
            (x, y) tuple or None if not found
        """
        pos = self.vat_manager.get_tile_position(tile_id)
        if pos:
            return (pos.x, pos.y)
        return None

    def move_tile(self, tile_id: int, x: int, y: int) -> bool:
        """
        Move a terminal tile to a new position.

        Args:
            tile_id: Tile identifier
            x: New X coordinate
            y: New Y coordinate

        Returns:
            True if successful
        """
        if tile_id not in self._terminals:
            logger.warning(f"Terminal {tile_id} not found")
            return False

        # Clamp to grid bounds
        grid_size = self.vat_manager.vat.grid_size
        x = max(0, min(x, grid_size - 1))
        y = max(0, min(y, grid_size - 1))

        # Update VAT
        pos = self.vat_manager.get_tile_position(tile_id)
        if not pos:
            return False

        self.vat_manager.set_tile_position(
            tile_id=tile_id,
            x=x,
            y=y,
            tile_type=pos.tile_type,
            district=pos.district
        )

        # Update local tracking
        self._terminals[tile_id].position = (x, y)

        logger.debug(f"Moved terminal {tile_id} to ({x}, {y})")
        return True

    def get_terminal(self, tile_id: int) -> Optional[TerminalTile]:
        """
        Get terminal tile info.

        Args:
            tile_id: Tile identifier

        Returns:
            TerminalTile or None
        """
        return self._terminals.get(tile_id)

    def list_terminals(self) -> List[TerminalTile]:
        """
        List all terminal tiles.

        Returns:
            List of TerminalTile objects
        """
        return list(self._terminals.values())

    def list_terminals_dict(self) -> Dict[int, Dict[str, Any]]:
        """
        List all terminal tiles as dictionaries.

        Returns:
            Dict of tile_id -> {position, type, district, status}
        """
        result = {}
        for tile_id, tile in self._terminals.items():
            result[tile_id] = {
                "position": tile.position,
                "rows": tile.rows,
                "cols": tile.cols,
                "shell": tile.shell,
                "district": tile.district,
                "status": tile.status,
                "created_at": tile.created_at
            }
        return result

    def destroy_terminal(self, tile_id: int) -> bool:
        """
        Remove a terminal tile.

        Args:
            tile_id: Tile identifier

        Returns:
            True if successful
        """
        if tile_id not in self._terminals:
            logger.warning(f"Terminal {tile_id} not found for destruction")
            return False

        # Try to destroy via Rust API
        if self._api_available and not self.offline_mode:
            try:
                response = requests.delete(
                    f"{self.api_base}/api/terminal/{tile_id}",
                    timeout=5.0
                )
                logger.debug(f"Rust API destroy response: {response.status_code}")
            except Exception as e:
                logger.warning(f"Failed to destroy via Rust API: {e}")

        # Remove from VAT
        if str(tile_id) in self.vat_manager.vat.tiles:
            del self.vat_manager.vat.tiles[str(tile_id)]
            self.vat_manager.vat.last_updated = time.time()
            self.vat_manager.vat.update_count += 1

            if self.vat_manager.auto_save:
                self.vat_manager.save()

        # Remove local tracking
        del self._terminals[tile_id]

        logger.info(f"Destroyed terminal tile {tile_id}")
        return True

    def resize_terminal(self, tile_id: int, rows: int, cols: int) -> bool:
        """
        Resize a terminal tile.

        Args:
            tile_id: Tile identifier
            rows: New row count
            cols: New column count

        Returns:
            True if successful
        """
        if tile_id not in self._terminals:
            return False

        # Try to resize via Rust API
        if self._api_available and not self.offline_mode:
            try:
                response = requests.post(
                    f"{self.api_base}/api/terminal/{tile_id}/resize",
                    json={"rows": rows, "cols": cols},
                    timeout=5.0
                )
                if response.status_code != 200:
                    logger.warning(f"Rust API resize failed: {response.status_code}")
            except Exception as e:
                logger.warning(f"Failed to resize via Rust API: {e}")

        # Update local tracking
        self._terminals[tile_id].rows = rows
        self._terminals[tile_id].cols = cols

        logger.debug(f"Resized terminal {tile_id} to {cols}x{rows}")
        return True

    def get_stats(self) -> Dict[str, Any]:
        """
        Get bridge statistics.

        Returns:
            Dict with terminal count, API status, etc.
        """
        return {
            "terminal_count": len(self._terminals),
            "api_available": self._api_available,
            "api_base": self.api_base,
            "offline_mode": self.offline_mode,
            "vat_stats": self.vat_manager.get_stats()
        }


# Convenience function
def create_terminal_bridge(
    state_dir: Optional[Path] = None,
    offline_mode: bool = False
) -> TerminalVatBridge:
    """Factory function for creating TerminalVatBridge."""
    return TerminalVatBridge(state_dir=state_dir, offline_mode=offline_mode)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Terminal VAT Bridge")
    parser.add_argument("--offline", action="store_true", help="Run in offline mode")
    parser.add_argument("--spawn", action="store_true", help="Spawn a test terminal")
    parser.add_argument("--list", action="store_true", help="List terminals")
    parser.add_argument("--stats", action="store_true", help="Show stats")

    args = parser.parse_args()

    logging.basicConfig(level=logging.INFO)

    bridge = TerminalVatBridge(offline_mode=args.offline)

    if args.spawn:
        config = TerminalTileConfig(rows=36, cols=120)
        tile_id = bridge.spawn_terminal(config)
        print(f"Spawned terminal: {tile_id}")
        print(f"Position: {bridge.get_tile_position(tile_id)}")

    if args.list:
        terminals = bridge.list_terminals()
        print(f"Terminals ({len(terminals)}):")
        for t in terminals:
            print(f"  {t.tile_id}: {t.cols}x{t.rows} at {t.position} [{t.status}]")

    if args.stats or not (args.spawn or args.list):
        print(json.dumps(bridge.get_stats(), indent=2, default=str))
