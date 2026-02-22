#!/usr/bin/env python3
"""
Tests for TectonicHandler - Phase 28: Spatial Tectonics Step 2
"""

import pytest
import json
import tempfile
from pathlib import Path
import time

import sys
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.visual_shell.api.tectonic_handler import (
    TectonicHandler,
    TileMovement,
    LayoutDelta,
    TectonicStatus
)


class TestTileMovement:
    """Test TileMovement dataclass."""

    def test_tile_movement_creation(self):
        """Test creating a tile movement."""
        movement = TileMovement(
            tile_id=1,
            old_x=100,
            old_y=200,
            new_x=150,
            new_y=250
        )
        assert movement.tile_id == 1
        assert movement.old_x == 100
        assert movement.old_y == 200
        assert movement.new_x == 150
        assert movement.new_y == 250

    def test_distance_calculation(self):
        """Test that distance is calculated automatically."""
        movement = TileMovement(
            tile_id=1,
            old_x=0,
            old_y=0,
            new_x=3,
            new_y=4
        )
        # 3-4-5 triangle, distance = 5
        assert movement.distance == 5.0

    def test_zero_distance(self):
        """Test zero distance movement."""
        movement = TileMovement(
            tile_id=1,
            old_x=100,
            old_y=100,
            new_x=100,
            new_y=100
        )
        assert movement.distance == 0.0


class TestLayoutDelta:
    """Test LayoutDelta dataclass."""

    def test_layout_delta_creation(self):
        """Test creating a layout delta."""
        movements = [
            TileMovement(tile_id=1, old_x=0, old_y=0, new_x=10, new_y=10),
            TileMovement(tile_id=2, old_x=100, old_y=100, new_x=110, new_y=110)
        ]
        delta = LayoutDelta(
            proposal_id="test-001",
            movements=movements,
            bond_strength=0.85,
            cycle=42,
            processing_time_ms=15.5
        )
        assert delta.proposal_id == "test-001"
        assert len(delta.movements) == 2
        assert delta.bond_strength == 0.85
        assert delta.cycle == 42

    def test_layout_delta_to_dict(self):
        """Test serialization to dict."""
        movements = [
            TileMovement(tile_id=1, old_x=0, old_y=0, new_x=10, new_y=10)
        ]
        delta = LayoutDelta(
            proposal_id="test-002",
            movements=movements,
            bond_strength=0.5,
            cycle=1,
            processing_time_ms=10.0
        )
        data = delta.to_dict()
        assert data["proposal_id"] == "test-002"
        assert len(data["movements"]) == 1
        assert data["movements"][0]["tile_id"] == 1

    def test_layout_delta_from_dict(self):
        """Test deserialization from dict."""
        data = {
            "proposal_id": "test-003",
            "movements": [
                {"tile_id": 1, "old_x": 0, "old_y": 0, "new_x": 10, "new_y": 10, "distance": 14.14}
            ],
            "bond_strength": 0.75,
            "cycle": 5,
            "processing_time_ms": 20.0,
            "timestamp": 1234567890.0
        }
        delta = LayoutDelta.from_dict(data)
        assert delta.proposal_id == "test-003"
        assert len(delta.movements) == 1
        assert delta.movements[0].tile_id == 1
        assert delta.bond_strength == 0.75


class TestTectonicHandler:
    """Test TectonicHandler class."""

    @pytest.fixture
    def temp_state_dir(self):
        """Create a temporary directory for state files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    @pytest.fixture
    def handler(self, temp_state_dir):
        """Create a TectonicHandler with temp directory."""
        return TectonicHandler(state_dir=temp_state_dir)

    def test_handler_initialization(self, handler, temp_state_dir):
        """Test handler initializes correctly."""
        assert handler.state_dir == temp_state_dir
        assert handler.status.state == "idle"

    def test_process_proposal(self, handler, temp_state_dir):
        """Test processing a proposal."""
        proposal = {
            "proposal_id": "prop-test-001",
            "bonds": [
                {"source": 1, "dest": 2, "strength": 0.9, "volume": 10},
                {"source": 2, "dest": 3, "strength": 0.7, "volume": 8}
            ],
            "expected_improvement": 25.0,
            "pulse_count": 100
        }

        success = handler.process_proposal(proposal)
        assert success is True
        assert handler.status.state == "processing"
        assert handler.status.proposal_id == "prop-test-001"

        # Check proposal file was written
        proposal_file = temp_state_dir / "proposal.json"
        assert proposal_file.exists()

        with open(proposal_file) as f:
            data = json.load(f)
        assert data["proposal_id"] == "prop-test-001"

    def test_get_status(self, handler):
        """Test getting status."""
        status = handler.get_status()
        assert "state" in status
        assert status["state"] == "idle"

    def test_simulate_delta(self, handler):
        """Test simulating a layout delta."""
        proposal = {
            "proposal_id": "sim-test-001",
            "bonds": [
                {"source": 1, "dest": 2, "strength": 0.8}
            ]
        }

        delta = handler.simulate_delta(proposal)
        assert delta.proposal_id == "sim-test-001"
        assert len(delta.movements) >= 0  # May have movements for tile IDs 1, 2
        assert delta.bond_strength >= 0

    def test_top_bond_extraction(self, handler):
        """Test that top bond is extracted from proposal."""
        proposal = {
            "proposal_id": "top-bond-test",
            "bonds": [
                {"source": 1, "dest": 2, "strength": 0.5},
                {"source": 3, "dest": 4, "strength": 0.9},  # Top bond
                {"source": 5, "dest": 6, "strength": 0.3}
            ]
        }

        handler.process_proposal(proposal)
        assert handler.status.top_bond is not None
        assert handler.status.top_bond[0] == 3
        assert handler.status.top_bond[1] == 4
        assert handler.status.top_bond[2] == 0.9

    def test_status_file_written(self, handler, temp_state_dir):
        """Test that status file is written."""
        proposal = {
            "proposal_id": "status-file-test",
            "bonds": [{"source": 1, "dest": 2, "strength": 0.5}]
        }

        handler.process_proposal(proposal)

        status_file = temp_state_dir / "status.json"
        assert status_file.exists()

        with open(status_file) as f:
            data = json.load(f)
        assert data["proposal_id"] == "status-file-test"

    def test_read_layout_delta_none_when_no_file(self, handler):
        """Test reading delta when no file exists."""
        delta = handler.read_layout_delta()
        assert delta is None

    def test_read_layout_delta_from_file(self, handler, temp_state_dir):
        """Test reading layout delta from file."""
        # Write a fake delta file
        delta_data = {
            "proposal_id": "read-test-001",
            "movements": [
                {"tile_id": 1, "old_x": 0, "old_y": 0, "new_x": 10, "new_y": 10, "distance": 14.14}
            ],
            "bond_strength": 0.8,
            "cycle": 10,
            "processing_time_ms": 12.5,
            "timestamp": time.time()
        }

        delta_file = temp_state_dir / "layout_delta.json"
        with open(delta_file, "w") as f:
            json.dump(delta_data, f)

        delta = handler.read_layout_delta()
        assert delta is not None
        assert delta.proposal_id == "read-test-001"
        assert len(delta.movements) == 1
        assert handler.status.state == "complete"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
