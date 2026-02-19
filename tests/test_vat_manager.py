#!/usr/bin/env python3
"""
Tests for VATManager - Phase 28: Spatial Tectonics Step 2
"""

import pytest
import json
import tempfile
from pathlib import Path
import time

import sys
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.visual_shell.api.vat_manager import (
    VATManager,
    TilePosition,
    VAT
)


class TestTilePosition:
    """Test TilePosition dataclass."""

    def test_tile_position_creation(self):
        """Test creating a tile position."""
        pos = TilePosition(
            x=100,
            y=200,
            tile_type="neural",
            district="compute"
        )
        assert pos.x == 100
        assert pos.y == 200
        assert pos.tile_type == "neural"
        assert pos.district == "compute"
        assert pos.last_move == 0.0
        assert pos.move_count == 0

    def test_tile_position_to_dict(self):
        """Test serialization."""
        pos = TilePosition(x=50, y=60, tile_type="memory")
        data = pos.to_dict()
        assert data["x"] == 50
        assert data["y"] == 60
        assert data["tile_type"] == "memory"

    def test_tile_position_from_dict(self):
        """Test deserialization."""
        data = {
            "x": 100,
            "y": 200,
            "tile_type": "io",
            "district": "storage",
            "last_move": 1234567890.0,
            "move_count": 5
        }
        pos = TilePosition.from_dict(data)
        assert pos.x == 100
        assert pos.y == 200
        assert pos.tile_type == "io"
        assert pos.move_count == 5


class TestVAT:
    """Test VAT dataclass."""

    def test_vat_creation(self):
        """Test creating a VAT."""
        vat = VAT()
        assert vat.version == "2.0"
        assert vat.grid_size == 4096
        assert len(vat.tiles) == 0

    def test_vat_with_tiles(self):
        """Test VAT with tiles."""
        tiles = {
            "1": TilePosition(x=100, y=200),
            "2": TilePosition(x=150, y=250)
        }
        vat = VAT(tiles=tiles)
        assert len(vat.tiles) == 2

    def test_vat_to_dict(self):
        """Test VAT serialization."""
        tiles = {"1": TilePosition(x=100, y=200)}
        vat = VAT(tiles=tiles, grid_size=2048)
        data = vat.to_dict()
        assert data["version"] == "2.0"
        assert data["grid_size"] == 2048
        assert "tiles" in data
        assert "1" in data["tiles"]

    def test_vat_from_dict(self):
        """Test VAT deserialization."""
        data = {
            "version": "2.0",
            "grid_size": 4096,
            "center": {"x": 2048, "y": 2048},
            "tiles": {
                "1": {"x": 100, "y": 200, "tile_type": "neural", "district": "default", "last_move": 0, "move_count": 0}
            },
            "last_updated": 1234567890.0,
            "update_count": 10
        }
        vat = VAT.from_dict(data)
        assert vat.grid_size == 4096
        assert len(vat.tiles) == 1
        assert vat.update_count == 10


class TestVATManager:
    """Test VATManager class."""

    @pytest.fixture
    def temp_state_dir(self):
        """Create a temporary directory for state files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    @pytest.fixture
    def manager(self, temp_state_dir):
        """Create a VATManager with temp directory."""
        return VATManager(state_dir=temp_state_dir, auto_save=True)

    def test_manager_initialization(self, manager, temp_state_dir):
        """Test manager initializes correctly."""
        assert manager.state_dir == temp_state_dir
        assert len(manager.vat.tiles) == 0

    def test_set_tile_position(self, manager):
        """Test setting a tile position."""
        pos = manager.set_tile_position(
            tile_id=1,
            x=100,
            y=200,
            tile_type="neural",
            district="compute"
        )
        assert pos.x == 100
        assert pos.y == 200
        assert pos.tile_type == "neural"
        assert pos.move_count == 1

    def test_get_tile_position(self, manager):
        """Test getting a tile position."""
        manager.set_tile_position(1, 100, 200, "neural", "compute")
        pos = manager.get_tile_position(1)
        assert pos is not None
        assert pos.x == 100
        assert pos.y == 200

    def test_get_tile_position_not_found(self, manager):
        """Test getting a non-existent tile."""
        pos = manager.get_tile_position(999)
        assert pos is None

    def test_update_tile_position(self, manager):
        """Test updating an existing tile position."""
        # Initial position
        manager.set_tile_position(1, 100, 200, "neural", "compute")
        pos = manager.get_tile_position(1)
        assert pos.move_count == 1

        # Update position
        manager.set_tile_position(1, 150, 250, "neural", "compute")
        pos = manager.get_tile_position(1)
        assert pos.x == 150
        assert pos.y == 250
        assert pos.move_count == 2

    def test_apply_delta(self, manager):
        """Test applying a layout delta."""
        # Create mock delta with movements
        from dataclasses import dataclass

        @dataclass
        class MockMovement:
            tile_id: int
            old_x: int
            old_y: int
            new_x: int
            new_y: int

        @dataclass
        class MockDelta:
            movements: list

        delta = MockDelta(movements=[
            MockMovement(tile_id=1, old_x=0, old_y=0, new_x=100, new_y=100),
            MockMovement(tile_id=2, old_x=0, old_y=0, new_x=200, new_y=200),
        ])

        moved = manager.apply_delta(delta)
        assert moved == 2

        pos1 = manager.get_tile_position(1)
        assert pos1.x == 100
        assert pos1.y == 100

        pos2 = manager.get_tile_position(2)
        assert pos2.x == 200
        assert pos2.y == 200

    def test_apply_delta_empty(self, manager):
        """Test applying an empty delta."""
        from dataclasses import dataclass, field

        @dataclass
        class MockDelta:
            movements: list = field(default_factory=list)

        delta = MockDelta()
        moved = manager.apply_delta(delta)
        assert moved == 0

    def test_get_all_positions(self, manager):
        """Test getting all positions."""
        manager.set_tile_position(1, 100, 200)
        manager.set_tile_position(2, 300, 400)

        positions = manager.get_all_positions()
        assert len(positions) == 2
        assert positions[1] == (100, 200)
        assert positions[2] == (300, 400)

    def test_get_district_positions(self, manager):
        """Test getting positions by district."""
        manager.set_tile_position(1, 100, 200, "neural", "compute")
        manager.set_tile_position(2, 300, 400, "memory", "storage")
        manager.set_tile_position(3, 500, 600, "neural", "compute")

        compute_positions = manager.get_district_positions("compute")
        assert len(compute_positions) == 2
        assert 1 in compute_positions
        assert 3 in compute_positions
        assert 2 not in compute_positions

    def test_get_stats(self, manager):
        """Test getting statistics."""
        manager.set_tile_position(1, 100, 200, "neural", "compute")
        manager.set_tile_position(2, 300, 400, "memory", "storage")

        stats = manager.get_stats()
        assert stats["tile_count"] == 2
        assert "neural" in stats["tile_types"]
        assert "memory" in stats["tile_types"]
        assert "compute" in stats["districts"]

    def test_persistence(self, temp_state_dir):
        """Test that VAT is persisted to disk."""
        # Create manager and add tiles
        manager1 = VATManager(state_dir=temp_state_dir, auto_save=True)
        manager1.set_tile_position(1, 100, 200, "neural", "compute")
        manager1.save()

        # Create new manager and verify tiles loaded
        manager2 = VATManager(state_dir=temp_state_dir)
        pos = manager2.get_tile_position(1)
        assert pos is not None
        assert pos.x == 100
        assert pos.y == 200

    def test_create_sample_tiles(self, manager):
        """Test creating sample tiles."""
        manager.create_sample_tiles(50)
        assert len(manager.vat.tiles) == 50

    def test_grid_bounds_clamping(self, manager):
        """Test that positions are clamped to grid bounds."""
        from dataclasses import dataclass

        @dataclass
        class MockMovement:
            tile_id: int
            old_x: int
            old_y: int
            new_x: int
            new_y: int

        @dataclass
        class MockDelta:
            movements: list

        # Try to move tile outside grid bounds
        delta = MockDelta(movements=[
            MockMovement(tile_id=1, old_x=0, old_y=0, new_x=10000, new_y=10000)
        ])

        manager.apply_delta(delta)
        pos = manager.get_tile_position(1)
        # Should be clamped to grid_size - 1
        assert pos.x == 4095
        assert pos.y == 4095


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
