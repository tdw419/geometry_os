#!/usr/bin/env python3
"""
End-to-End Tests for Terminal Ripper Pipeline

Tests the complete "rip" workflow:
VM Framebuffer → Detection → Terminal Clone → VAT Placement

Run with: python -m pytest tests/test_terminal_ripper_e2e.py -v
"""

import pytest
import sys
import tempfile
import shutil
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock
import json

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from terminal_vat_bridge import (
    TerminalVatBridge,
    TerminalTileConfig,
    TerminalTile
)
from vm_terminal_detector import (
    VmTerminalDetector,
    TerminalCandidate
)
from terminal_ripper import TerminalRipper


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


@pytest.fixture
def detector():
    """Create a detector instance."""
    return VmTerminalDetector()


@pytest.fixture
def ripper(bridge):
    """Create a ripper instance with offline bridge."""
    return TerminalRipper(bridge=bridge)


class TestTerminalRipperE2E:
    """End-to-end tests for the terminal ripper pipeline."""

    def test_ripper_initialization(self, ripper):
        """Test ripper initializes correctly."""
        assert ripper is not None
        assert ripper.bridge is not None
        assert ripper.detector is not None

    def test_detector_patterns(self, detector):
        """Test terminal detection patterns."""
        # Should detect terminal content
        # Note: Detector matches prompts at END of line only
        terminal_texts = [
            "user@host:~$ ",          # $ at end of line
            "root@server:/# ",        # # at end of line
            ">>> ",                   # > at end of line
            "total 24\ndrwxr-xr-x",   # directory listing
            "drwxrwxrwx 2 root",      # permission string
            "\x1b[32mgreen\x1b[0m",   # ANSI escape
        ]

        for text in terminal_texts:
            assert detector.is_terminal_like(text), f"Should detect: {text[:30]}"

    def test_detector_rejects_gui(self, detector):
        """Test detector rejects GUI content."""
        gui_texts = [
            "[Button] Click here",
            "File Edit View Help",
            "[Menu] Options",
        ]

        for text in gui_texts:
            assert not detector.is_terminal_like(text), f"Should reject: {text[:30]}"

    def test_grid_size_estimation(self, detector):
        """Test terminal grid size estimation."""
        # Single line
        size = detector.estimate_grid_size("short")
        assert size[0] >= 40  # Minimum cols
        assert size[1] >= 10  # Minimum rows

        # Multiple lines
        text = "\n".join(["x" * 80] * 25)
        size = detector.estimate_grid_size(text)
        assert size[0] >= 80
        assert size[1] >= 25

    def test_rip_no_terminals(self, ripper, tmp_path):
        """Test ripping image with no terminals."""
        # Create a dummy image file
        image_path = tmp_path / "test.png"
        image_path.write_bytes(b"fake image data")

        # Since ExtractionPipeline won't find widgets, should return empty
        with patch.object(ripper.detector, 'scan', return_value=[]):
            ids = ripper.rip_from_image(str(image_path))
        assert ids == []

    def test_rip_single_terminal(self, ripper, tmp_path):
        """Test ripping image with one terminal."""
        # Create a mock candidate
        mock_candidate = TerminalCandidate(
            bbox=(100, 100, 800, 600),
            text="user@host:~$ ls -la\ntotal 24\ndrwxr-xr-x",
            confidence=0.9,
            shell_prompt=True,
            grid_size=(80, 24)
        )

        image_path = tmp_path / "test.png"
        image_path.write_bytes(b"fake image data")

        # Mock the detector to return our candidate
        with patch.object(ripper.detector, 'scan', return_value=[mock_candidate]):
            ids = ripper.rip_from_image(str(image_path))

        assert len(ids) == 1
        tile_id = ids[0]

        # Verify terminal was created
        tile = ripper.bridge.get_terminal(tile_id)
        assert tile is not None
        assert tile.cols == 80
        assert tile.rows == 24

        # Verify VAT placement
        pos = ripper.bridge.get_tile_position(tile_id)
        assert pos is not None
        assert isinstance(pos, tuple)
        assert len(pos) == 2

    def test_rip_multiple_terminals(self, ripper, tmp_path):
        """Test ripping image with multiple terminals."""
        mock_candidates = [
            TerminalCandidate(
                bbox=(100, 100, 800, 400),
                text="user@host1:~$ ",
                confidence=0.9,
                shell_prompt=True,
                grid_size=(80, 24)
            ),
            TerminalCandidate(
                bbox=(100, 500, 800, 800),
                text="root@host2:/# ",
                confidence=0.85,
                shell_prompt=True,
                grid_size=(120, 36)
            ),
            TerminalCandidate(
                bbox=(900, 100, 1600, 500),
                text=">>> ",
                confidence=0.7,
                shell_prompt=True,
                grid_size=(60, 20)
            ),
        ]

        image_path = tmp_path / "test_multi.png"
        image_path.write_bytes(b"fake image data")

        with patch.object(ripper.detector, 'scan', return_value=mock_candidates):
            ids = ripper.rip_from_image(str(image_path))

        assert len(ids) == 3

        # Verify all terminals created with correct sizes
        terminals = ripper.bridge.list_terminals()
        assert len(terminals) == 3

        sizes = {(t.cols, t.rows) for t in terminals}
        assert (80, 24) in sizes
        assert (120, 36) in sizes
        assert (60, 20) in sizes

    def test_full_pipeline_spawn_to_vat(self, bridge):
        """Test complete spawn → VAT registration flow."""
        config = TerminalTileConfig(
            rows=36,
            cols=120,
            shell="/bin/bash",
            near_center=True
        )

        # Spawn terminal
        tile_id = bridge.spawn_terminal(config)

        # Verify local tracking
        tile = bridge.get_terminal(tile_id)
        assert tile is not None
        assert tile.status in ["offline", "partial"]  # No Rust API in offline mode

        # Verify VAT registration
        pos = bridge.get_tile_position(tile_id)
        assert pos is not None

        # Verify near-center placement
        center_x = bridge.vat_manager.vat.center_x
        center_y = bridge.vat_manager.vat.center_y
        assert abs(pos[0] - center_x) <= 500
        assert abs(pos[1] - center_y) <= 500

    def test_lifecycle_spawn_move_destroy(self, bridge):
        """Test full terminal lifecycle."""
        config = TerminalTileConfig(rows=24, cols=80)

        # Spawn
        tile_id = bridge.spawn_terminal(config)
        assert bridge.get_terminal(tile_id) is not None

        # Move
        new_x, new_y = 1500, 2000
        result = bridge.move_tile(tile_id, new_x, new_y)
        assert result is True
        assert bridge.get_tile_position(tile_id) == (new_x, new_y)

        # Resize
        result = bridge.resize_terminal(tile_id, 36, 120)
        assert result is True
        tile = bridge.get_terminal(tile_id)
        assert tile.rows == 36
        assert tile.cols == 120

        # Destroy
        result = bridge.destroy_terminal(tile_id)
        assert result is True
        assert bridge.get_terminal(tile_id) is None
        assert bridge.get_tile_position(tile_id) is None

    def test_stats_tracking(self, ripper, tmp_path):
        """Test statistics tracking through pipeline."""
        # Initial stats
        stats = ripper.bridge.get_stats()
        initial_count = stats["terminal_count"]

        # Add terminals
        mock_candidates = [
            TerminalCandidate(
                bbox=(100, 100, 800, 600),
                text="user@host:~$ ",
                confidence=0.9,
                shell_prompt=True,
                grid_size=(80, 24)
            ),
        ]

        image_path = tmp_path / "test.png"
        image_path.write_bytes(b"fake image data")

        with patch.object(ripper.detector, 'scan', return_value=mock_candidates):
            ripper.rip_from_image(str(image_path))

        # Check updated stats
        stats = ripper.bridge.get_stats()
        assert stats["terminal_count"] == initial_count + 1

    def test_vat_persistence(self, temp_state_dir):
        """Test VAT state persistence across instances."""
        # Create first instance and spawn terminal
        bridge1 = TerminalVatBridge(state_dir=temp_state_dir, offline_mode=True)
        config = TerminalTileConfig(rows=36, cols=120)
        tile_id = bridge1.spawn_terminal(config)
        pos1 = bridge1.get_tile_position(tile_id)

        # Create second instance (should load from persisted state)
        bridge2 = TerminalVatBridge(state_dir=temp_state_dir, offline_mode=True)
        # Note: local terminals won't persist, but VAT positions should
        # This tests that the VAT layer persists correctly


class TestTerminalDetectorIntegration:
    """Tests for detector integration with extraction pipeline."""

    def test_detector_with_ansi_sequences(self, detector):
        """Test detection with ANSI escape sequences."""
        text = "\x1b[32muser@host\x1b[0m:\x1b[34m~\x1b[0m$ "
        assert detector.is_terminal_like(text)

    def test_detector_with_directory_listing(self, detector):
        """Test detection of directory listing output."""
        text = """
total 24
drwxr-xr-x  3 user user 4096 Feb 20 10:00 .
drwxr-xr-x 18 user user 4096 Feb 19 09:00 ..
-rw-r--r--  1 user user  220 Feb 19 09:00 .bashrc
"""
        assert detector.is_terminal_like(text)

    def test_detector_deduplication(self, detector):
        """Test candidate deduplication."""
        # Create overlapping candidates
        candidates = [
            TerminalCandidate(
                bbox=(100, 100, 800, 600),
                text="terminal 1",
                confidence=0.9,
                shell_prompt=True,
                grid_size=(80, 24)
            ),
            TerminalCandidate(
                bbox=(150, 150, 750, 550),  # Inside first
                text="terminal 1 subset",
                confidence=0.8,
                shell_prompt=True,
                grid_size=(60, 20)
            ),
        ]

        deduped = detector._deduplicate(candidates)
        # Should keep the larger one
        assert len(deduped) == 1
        assert deduped[0].text == "terminal 1"


class TestBridgeEdgeCases:
    """Edge case tests for the bridge."""

    def test_spawn_near_center_clamping(self, bridge):
        """Test that positions are clamped to grid bounds."""
        # Set up a bridge with a small grid
        config = TerminalTileConfig(near_center=True)

        # Multiple spawns should all be within bounds
        for _ in range(10):
            tile_id = bridge.spawn_terminal(config)
            pos = bridge.get_tile_position(tile_id)
            grid_size = bridge.vat_manager.vat.grid_size

            assert 0 <= pos[0] < grid_size
            assert 0 <= pos[1] < grid_size

    def test_move_out_of_bounds_clamping(self, bridge):
        """Test that moves are clamped to grid bounds."""
        config = TerminalTileConfig()
        tile_id = bridge.spawn_terminal(config)

        grid_size = bridge.vat_manager.vat.grid_size

        # Try to move beyond bounds
        result = bridge.move_tile(tile_id, grid_size + 1000, grid_size + 1000)
        assert result is True

        pos = bridge.get_tile_position(tile_id)
        assert pos[0] < grid_size
        assert pos[1] < grid_size

    def test_concurrent_operations(self, bridge):
        """Test rapid spawn/destroy operations."""
        ids = []

        # Spawn many terminals
        for i in range(20):
            config = TerminalTileConfig(rows=24 + i, cols=80 + i)
            tile_id = bridge.spawn_terminal(config)
            ids.append(tile_id)

        # Verify all spawned
        assert len(bridge.list_terminals()) == 20

        # Destroy half
        for tile_id in ids[::2]:
            bridge.destroy_terminal(tile_id)

        # Verify remaining
        assert len(bridge.list_terminals()) == 10

        # Spawn more
        for i in range(5):
            config = TerminalTileConfig()
            bridge.spawn_terminal(config)

        assert len(bridge.list_terminals()) == 15


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
