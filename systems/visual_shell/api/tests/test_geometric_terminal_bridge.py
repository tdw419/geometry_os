#!/usr/bin/env python3
"""
Tests for Geometric Terminal Bridge - PixelRTS v3 Integration

Run with: python -m pytest tests/test_geometric_terminal_bridge.py -v
"""

import pytest
import sys
import tempfile
import shutil
from pathlib import Path
from unittest.mock import Mock, patch

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))

# Check if PixelRTS v3 is available
try:
    sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent / "pixel_compiler"))
    from pixelrts_v3.geometric_terminal import GeometricTerminal, TerminalCell
    PIXELRTS_V3_AVAILABLE = True
except ImportError:
    PIXELRTS_V3_AVAILABLE = False


@pytest.mark.skipif(not PIXELRTS_V3_AVAILABLE, reason="PixelRTS v3 not available")
class TestGeometricTerminalBridge:
    """Tests for GeometricTerminalBridge class."""

    @pytest.fixture
    def temp_state_dir(self):
        """Create a temporary directory for test state."""
        temp_dir = tempfile.mkdtemp()
        yield Path(temp_dir)
        shutil.rmtree(temp_dir)

    @pytest.fixture
    def bridge(self, temp_state_dir):
        """Create a bridge instance."""
        from geometric_terminal_bridge import GeometricTerminalBridge
        return GeometricTerminalBridge(state_dir=temp_state_dir)

    @pytest.fixture
    def config(self):
        """Create a test configuration."""
        from geometric_terminal_bridge import TerminalTextureConfig
        return TerminalTextureConfig(cols=40, rows=10)

    def test_bridge_initialization(self, bridge):
        """Test bridge initializes correctly."""
        assert bridge is not None
        assert bridge.vat_bridge is not None
        assert bridge.texture_dir.exists()

    def test_spawn_geometric_terminal(self, bridge, config):
        """Test spawning a geometric terminal."""
        tile_id = bridge.spawn_geometric_terminal(config)

        assert tile_id >= 0
        assert tile_id in bridge._tiles

        tile = bridge._tiles[tile_id]
        assert tile.terminal is not None
        assert tile.terminal.cols == config.cols
        assert tile.terminal.rows == config.rows

    def test_feed_pty_output(self, bridge, config):
        """Test feeding PTY output."""
        tile_id = bridge.spawn_geometric_terminal(config)

        # Feed some text
        result = bridge.feed_pty_output(tile_id, b"Hello\n")
        assert result is True

        tile = bridge._tiles[tile_id]
        assert tile.dirty is True

        # Check character was written
        cell = tile.terminal.get_cell_at(0, 0)
        assert cell is not None
        assert cell.char == ord('H')

    def test_feed_ansi_colors(self, bridge, config):
        """Test ANSI color processing."""
        tile_id = bridge.spawn_geometric_terminal(config)

        # Feed ANSI-colored text
        ansi_data = b"\x1b[32mGreen\x1b[0m \x1b[31mRed\x1b[0m"
        result = bridge.feed_ansi(tile_id, ansi_data)
        assert result is True

        tile = bridge._tiles[tile_id]

        # Check first character is green (color index 2)
        cell = tile.terminal.get_cell_at(0, 0)
        assert cell is not None
        assert cell.char == ord('G')
        assert cell.fg == 2  # Green

    def test_render_to_texture(self, bridge, config):
        """Test rendering to texture."""
        tile_id = bridge.spawn_geometric_terminal(config)

        # Feed some output
        bridge.feed_pty_output(tile_id, b"Test output\n")

        # Render
        path = bridge.render_to_texture(tile_id)
        assert path is not None
        assert path.exists()

        tile = bridge._tiles[tile_id]
        assert tile.dirty is False
        assert tile.render_count == 1

    def test_get_cell(self, bridge, config):
        """Test getting cell at position."""
        tile_id = bridge.spawn_geometric_terminal(config)

        bridge.feed_pty_output(tile_id, b"ABC")
        cell = bridge.get_cell(tile_id, 0, 0)

        assert cell is not None
        assert cell.char == ord('A')

    def test_get_cell_rgba(self, bridge, config):
        """Test getting cell as RGBA."""
        tile_id = bridge.spawn_geometric_terminal(config)

        bridge.feed_pty_output(tile_id, b"X")
        rgba = bridge.get_cell_rgba(tile_id, 0, 0)

        assert rgba is not None
        assert rgba[0] == ord('X')  # R = char
        assert isinstance(rgba[1], int)  # G = fg color

    def test_encode_as_opcodes(self, bridge, config):
        """Test encoding terminal state as opcodes."""
        tile_id = bridge.spawn_geometric_terminal(config)

        # Feed some text
        bridge.feed_pty_output(tile_id, b"Hi")

        # Get opcodes
        opcodes = bridge.encode_as_opcodes(tile_id)
        assert len(opcodes) > 0

        # Should have CLR, SETFG, and PUTC operations
        op_names = [op['op'] for op in opcodes]
        assert 'CLR' in op_names
        assert 'SETFG' in op_names
        assert 'PUTC' in op_names

    def test_destroy_terminal(self, bridge, config):
        """Test destroying a terminal."""
        tile_id = bridge.spawn_geometric_terminal(config)
        assert tile_id in bridge._tiles

        result = bridge.destroy_geometric_terminal(tile_id)
        assert result is True
        assert tile_id not in bridge._tiles

    def test_get_texture_stats(self, bridge, config):
        """Test getting texture stats."""
        tile_id = bridge.spawn_geometric_terminal(config)

        stats = bridge.get_texture_stats(tile_id)
        assert stats is not None
        assert stats['tile_id'] == tile_id
        assert stats['cols'] == config.cols
        assert stats['rows'] == config.rows
        assert stats['dirty'] is True

    def test_list_terminals(self, bridge, config):
        """Test listing terminals."""
        id1 = bridge.spawn_geometric_terminal(config)
        id2 = bridge.spawn_geometric_terminal(config)

        terminals = bridge.list_geometric_terminals()
        assert len(terminals) == 2
        assert id1 in terminals
        assert id2 in terminals

    def test_multiple_feeds(self, bridge, config):
        """Test multiple PTY feeds."""
        tile_id = bridge.spawn_geometric_terminal(config)

        # Feed multiple chunks
        for i in range(5):
            bridge.feed_pty_output(tile_id, f"Line {i}\n".encode())

        tile = bridge._tiles[tile_id]
        # Should have content in multiple rows
        assert tile.dirty is True


@pytest.mark.skipif(not PIXELRTS_V3_AVAILABLE, reason="PixelRTS v3 not available")
class TestTerminalTextureConfig:
    """Tests for TerminalTextureConfig."""

    def test_default_values(self):
        """Test default configuration."""
        from geometric_terminal_bridge import TerminalTextureConfig
        config = TerminalTextureConfig()

        assert config.cols == 120
        assert config.rows == 36
        assert config.use_hilbert is True
        assert config.auto_render is False

    def test_custom_values(self):
        """Test custom configuration."""
        from geometric_terminal_bridge import TerminalTextureConfig
        config = TerminalTextureConfig(
            cols=80,
            rows=24,
            use_hilbert=False,
            auto_render=True
        )

        assert config.cols == 80
        assert config.rows == 24
        assert config.use_hilbert is False
        assert config.auto_render is True


@pytest.mark.skipif(not PIXELRTS_V3_AVAILABLE, reason="PixelRTS v3 not available")
class TestCellEncoding:
    """Tests for terminal cell RGBA encoding."""

    def test_cell_to_rgba(self):
        """Test cell encoding to RGBA."""
        cell = TerminalCell(char=ord('A'), fg=10, bg=0, flags=0)
        rgba = cell.to_rgba()

        assert rgba[0] == ord('A')  # R = char
        assert rgba[1] == 10        # G = fg
        assert rgba[2] == 0         # B = bg
        assert rgba[3] == 0         # A = flags

    def test_cell_from_rgba(self):
        """Test decoding cell from RGBA."""
        rgba = (ord('X'), 7, 1, 8)  # 'X', white on red, underline
        cell = TerminalCell.from_rgba(rgba)

        assert cell.char == ord('X')
        assert cell.fg == 7
        assert cell.bg == 1
        assert cell.flags == 8

    def test_cell_style_flags(self):
        """Test style flag encoding."""
        # Bold + underline = 1 + 8 = 9
        cell = TerminalCell(char=ord('T'), fg=7, bg=0, flags=9)
        rgba = cell.to_rgba()

        assert rgba[3] == 9  # Alpha = flags


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
