#!/usr/bin/env python3
"""
Tests for TerminalVatBridge

Run with: python -m pytest tests/test_terminal_vat_bridge.py -v
"""

import pytest
import sys
from pathlib import Path
import tempfile
import shutil

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from terminal_vat_bridge import (
    TerminalVatBridge,
    TerminalTileConfig,
    TerminalTile
)


@pytest.fixture
def temp_state_dir():
    """Create a temporary directory for test state."""
    temp_dir = tempfile.mkdtemp()
    yield Path(temp_dir)
    shutil.rmtree(temp_dir)


@pytest.fixture
def bridge(temp_state_dir):
    """Create a bridge instance in offline mode for testing."""
    return TerminalVatBridge(
        state_dir=temp_state_dir,
        offline_mode=True
    )


class TestTerminalVatBridge:
    """Tests for TerminalVatBridge class."""

    def test_bridge_initialization(self, bridge):
        """Test bridge initializes correctly."""
        assert bridge is not None
        assert bridge.offline_mode is True
        assert bridge.vat_manager is not None

    def test_spawn_terminal_default_config(self, bridge):
        """Test spawning terminal with default config."""
        config = TerminalTileConfig()
        tile_id = bridge.spawn_terminal(config)

        assert tile_id >= 0
        assert tile_id in bridge._terminals

    def test_spawn_terminal_custom_config(self, bridge):
        """Test spawning terminal with custom config."""
        config = TerminalTileConfig(
            rows=24,
            cols=80,
            shell="/bin/zsh",
            district="compute"
        )
        tile_id = bridge.spawn_terminal(config)

        tile = bridge.get_terminal(tile_id)
        assert tile is not None
        assert tile.rows == 24
        assert tile.cols == 80
        assert tile.shell == "/bin/zsh"
        assert tile.district == "compute"

    def test_spawn_multiple_terminals(self, bridge):
        """Test spawning multiple terminals."""
        ids = []
        for i in range(3):
            config = TerminalTileConfig(rows=36, cols=120)
            tile_id = bridge.spawn_terminal(config)
            ids.append(tile_id)

        # All IDs should be unique
        assert len(ids) == len(set(ids))
        assert len(bridge.list_terminals()) == 3

    def test_get_tile_position(self, bridge):
        """Test getting tile position."""
        config = TerminalTileConfig(near_center=False)
        tile_id = bridge.spawn_terminal(config)

        pos = bridge.get_tile_position(tile_id)
        assert pos is not None
        assert isinstance(pos, tuple)
        assert len(pos) == 2
        assert isinstance(pos[0], int)
        assert isinstance(pos[1], int)

    def test_spawn_near_focal_point(self, bridge):
        """Test spawning near VAT center."""
        config = TerminalTileConfig(near_center=True)
        tile_id = bridge.spawn_terminal(config)

        pos = bridge.get_tile_position(tile_id)
        center_x = bridge.vat_manager.vat.center_x
        center_y = bridge.vat_manager.vat.center_y

        # Should be within 500 pixels of center (random offset is +/- 300)
        assert abs(pos[0] - center_x) <= 500
        assert abs(pos[1] - center_y) <= 500

    def test_move_tile(self, bridge):
        """Test moving a tile."""
        config = TerminalTileConfig()
        tile_id = bridge.spawn_terminal(config)

        # Move to new position
        new_x, new_y = 500, 600
        result = bridge.move_tile(tile_id, new_x, new_y)
        assert result is True

        pos = bridge.get_tile_position(tile_id)
        assert pos == (new_x, new_y)

    def test_move_nonexistent_tile(self, bridge):
        """Test moving a tile that doesn't exist."""
        result = bridge.move_tile(99999, 100, 100)
        assert result is False

    def test_get_terminal(self, bridge):
        """Test getting terminal info."""
        config = TerminalTileConfig(rows=40, cols=160)
        tile_id = bridge.spawn_terminal(config)

        tile = bridge.get_terminal(tile_id)
        assert tile is not None
        assert tile.rows == 40
        assert tile.cols == 160

    def test_get_nonexistent_terminal(self, bridge):
        """Test getting terminal that doesn't exist."""
        tile = bridge.get_terminal(99999)
        assert tile is None

    def test_list_terminals(self, bridge):
        """Test listing terminals."""
        config = TerminalTileConfig()
        bridge.spawn_terminal(config)
        bridge.spawn_terminal(config)

        terminals = bridge.list_terminals()
        assert len(terminals) == 2

    def test_list_terminals_dict(self, bridge):
        """Test listing terminals as dict."""
        config = TerminalTileConfig(rows=30, cols=100)
        tile_id = bridge.spawn_terminal(config)

        terminals = bridge.list_terminals_dict()
        assert tile_id in terminals
        assert terminals[tile_id]["rows"] == 30
        assert terminals[tile_id]["cols"] == 100
        assert "position" in terminals[tile_id]
        assert "status" in terminals[tile_id]

    def test_destroy_terminal(self, bridge):
        """Test destroying a terminal."""
        config = TerminalTileConfig()
        tile_id = bridge.spawn_terminal(config)

        # Verify it exists
        assert bridge.get_terminal(tile_id) is not None

        # Destroy it
        result = bridge.destroy_terminal(tile_id)
        assert result is True

        # Verify it's gone
        assert bridge.get_terminal(tile_id) is None
        assert bridge.get_tile_position(tile_id) is None

    def test_destroy_nonexistent_terminal(self, bridge):
        """Test destroying a terminal that doesn't exist."""
        result = bridge.destroy_terminal(99999)
        assert result is False

    def test_resize_terminal(self, bridge):
        """Test resizing a terminal."""
        config = TerminalTileConfig(rows=24, cols=80)
        tile_id = bridge.spawn_terminal(config)

        # Resize
        result = bridge.resize_terminal(tile_id, 36, 120)
        assert result is True

        tile = bridge.get_terminal(tile_id)
        assert tile.rows == 36
        assert tile.cols == 120

    def test_get_stats(self, bridge):
        """Test getting bridge stats."""
        config = TerminalTileConfig()
        bridge.spawn_terminal(config)

        stats = bridge.get_stats()
        assert "terminal_count" in stats
        assert stats["terminal_count"] == 1
        assert "api_available" in stats
        assert "vat_stats" in stats


class TestTerminalTileConfig:
    """Tests for TerminalTileConfig dataclass."""

    def test_default_values(self):
        """Test default configuration values."""
        config = TerminalTileConfig()
        assert config.rows == 36
        assert config.cols == 120
        assert config.shell == "/bin/bash"
        assert config.district == "terminal"
        assert config.near_center is True
        assert config.font_size == 16
        assert config.scrollback_lines == 1000

    def test_custom_values(self):
        """Test custom configuration values."""
        config = TerminalTileConfig(
            rows=24,
            cols=80,
            shell="/bin/zsh",
            district="compute",
            near_center=False,
            font_size=12,
            scrollback_lines=500
        )
        assert config.rows == 24
        assert config.cols == 80
        assert config.shell == "/bin/zsh"
        assert config.district == "compute"
        assert config.near_center is False
        assert config.font_size == 12
        assert config.scrollback_lines == 500


class TestTerminalTile:
    """Tests for TerminalTile dataclass."""

    def test_terminal_tile_creation(self):
        """Test terminal tile creation."""
        tile = TerminalTile(
            tile_id=1,
            rows=36,
            cols=120,
            shell="/bin/bash",
            position=(100, 200),
            district="terminal"
        )
        assert tile.tile_id == 1
        assert tile.rows == 36
        assert tile.cols == 120
        assert tile.shell == "/bin/bash"
        assert tile.position == (100, 200)
        assert tile.district == "terminal"
        assert tile.status == "running"
        assert tile.created_at is not None


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
