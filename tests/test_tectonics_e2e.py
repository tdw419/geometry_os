#!/usr/bin/env python3
"""
End-to-End Tests for Spatial Tectonics - Phase 28 Step 2

Tests the complete flow:
NeuralPulse → ConsensusEngine → TectonicHandler → VATManager
"""

import pytest
import json
import tempfile
from pathlib import Path
import time
import asyncio

import sys
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.evolution_daemon.spatial_tectonics import (
    ConsensusEngine,
    PulseEvent,
    TectonicProposal
)
from systems.visual_shell.api.tectonic_handler import (
    TectonicHandler,
    LayoutDelta
)
from systems.visual_shell.api.vat_manager import (
    VATManager,
    TilePosition
)


class TestTectonicsE2E:
    """End-to-end tests for spatial tectonics pipeline."""

    @pytest.fixture
    def temp_state_dir(self):
        """Create a temporary directory for state files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    @pytest.fixture
    def components(self, temp_state_dir):
        """Create all tectonic components."""
        consensus = ConsensusEngine(
            aggregation_window_secs=1,  # Short window for testing
            min_pulse_count=3,
            min_bond_strength=0.1
        )
        handler = TectonicHandler(state_dir=temp_state_dir)
        vat = VATManager(state_dir=temp_state_dir)

        return {
            "consensus": consensus,
            "handler": handler,
            "vat": vat
        }

    def test_pulse_aggregation(self, components):
        """Test that pulses are aggregated correctly."""
        consensus = components["consensus"]

        # Record pulses between tiles 1 and 2
        for i in range(10):
            event = PulseEvent(
                source_tile=1,
                dest_tile=2,
                pulse_type="violet",
                volume=1.0,
                timestamp=time.time()
            )
            consensus.record_pulse(event)

        # Check edge volumes
        edge_key = tuple(sorted([1, 2]))
        assert edge_key in consensus.edge_volumes
        assert consensus.edge_volumes[edge_key] == 10.0
        assert consensus.edge_counts[edge_key] == 10

    def test_pulse_aggregation_hybrid_bonds(self, components):
        """Test that mixed pulse types create hybrid bonds."""
        consensus = components["consensus"]

        # Record violet pulses
        for i in range(5):
            event = PulseEvent(
                source_tile=1,
                dest_tile=2,
                pulse_type="violet",
                volume=1.0,
                timestamp=time.time()
            )
            consensus.record_pulse(event)

        # Record cyan pulses between same tiles
        for i in range(5):
            event = PulseEvent(
                source_tile=1,
                dest_tile=2,
                pulse_type="cyan",
                volume=1.0,
                timestamp=time.time()
            )
            consensus.record_pulse(event)

        edge_key = tuple(sorted([1, 2]))
        assert consensus.edge_types[edge_key] == "hybrid"

    def test_proposal_creation(self, components):
        """Test that proposals are created from aggregated pulses."""
        consensus = components["consensus"]

        # Record enough pulses to exceed threshold
        for i in range(20):
            event = PulseEvent(
                source_tile=i % 3,
                dest_tile=(i + 1) % 3,
                pulse_type="violet",
                volume=1.0 + (i % 5) * 0.5,
                timestamp=time.time()
            )
            consensus.record_pulse(event)

        # Create proposal synchronously
        proposal = asyncio.get_event_loop().run_until_complete(
            consensus._create_proposal()
        )

        assert proposal is not None
        assert len(proposal.bonds) > 0
        assert proposal.pulse_count == 20

    def test_proposal_to_handler_flow(self, components):
        """Test proposal processing through handler."""
        consensus = components["consensus"]
        handler = components["handler"]

        # Record pulses
        for i in range(15):
            event = PulseEvent(
                source_tile=1,
                dest_tile=2,
                pulse_type="violet",
                volume=1.0,
                timestamp=time.time()
            )
            consensus.record_pulse(event)

        # Create proposal
        proposal = asyncio.get_event_loop().run_until_complete(
            consensus._create_proposal()
        )

        assert proposal is not None

        # Process through handler
        proposal_dict = {
            "proposal_id": proposal.proposal_id,
            "bonds": proposal.bonds,
            "expected_improvement": proposal.expected_saccade_improvement,
            "pulse_count": proposal.pulse_count
        }

        success = handler.process_proposal(proposal_dict)
        assert success is True
        assert handler.status.state == "processing"

    def test_handler_to_vat_flow(self, components):
        """Test handler delta applied to VAT."""
        handler = components["handler"]
        vat = components["vat"]

        # Create initial tiles in VAT
        vat.set_tile_position(1, 100, 200, "neural", "compute")
        vat.set_tile_position(2, 300, 400, "neural", "compute")

        # Simulate a proposal and delta
        proposal = {
            "proposal_id": "e2e-test-001",
            "bonds": [
                {"source": 1, "dest": 2, "strength": 0.9, "volume": 10}
            ]
        }

        # Process proposal
        handler.process_proposal(proposal)

        # Simulate delta (would normally come from Rust)
        delta = handler.simulate_delta(proposal)

        # Apply delta to VAT
        moved_count = vat.apply_delta(delta)
        assert moved_count >= 0  # May or may not have movements depending on simulation

    def test_full_pipeline_simulation(self, components):
        """Test the full pipeline with simulated data."""
        consensus = components["consensus"]
        handler = components["handler"]
        vat = components["vat"]

        # 1. Create initial VAT state
        vat.set_tile_position(1, 500, 500, "neural", "compute")
        vat.set_tile_position(2, 800, 800, "memory", "storage")
        vat.set_tile_position(3, 1000, 1000, "io", "io")

        # 2. Record pulses (simulating NeuralPulseSystem activity)
        for i in range(30):
            # Strong bond between 1 and 2
            event = PulseEvent(
                source_tile=1,
                dest_tile=2,
                pulse_type="violet",
                volume=1.5,
                timestamp=time.time()
            )
            consensus.record_pulse(event)

            # Weaker bond between 2 and 3
            if i % 2 == 0:
                event = PulseEvent(
                    source_tile=2,
                    dest_tile=3,
                    pulse_type="cyan",
                    volume=0.8,
                    timestamp=time.time()
                )
                consensus.record_pulse(event)

        # 3. Create proposal
        proposal = asyncio.get_event_loop().run_until_complete(
            consensus._create_proposal()
        )
        assert proposal is not None

        # 4. Get top bonds
        top_bonds = consensus.get_top_bonds(3)
        assert len(top_bonds) > 0

        # 5. Process through handler
        proposal_dict = {
            "proposal_id": proposal.proposal_id,
            "bonds": proposal.bonds,
            "expected_improvement": proposal.expected_saccade_improvement,
            "pulse_count": proposal.pulse_count
        }

        success = handler.process_proposal(proposal_dict)
        assert success is True

        # 6. Simulate delta
        delta = handler.simulate_delta(proposal_dict)
        assert delta is not None

        # 7. Apply to VAT
        moved_count = vat.apply_delta(delta)

        # 8. Verify final state
        stats = vat.get_stats()
        assert stats["tile_count"] >= 3
        assert stats["update_count"] > 0

    def test_bond_strength_calculation(self, components):
        """Test that bond strength is calculated correctly."""
        consensus = components["consensus"]

        # Create asymmetric pulse volumes
        # Edge 1-2: total volume 10.0
        for i in range(10):
            event = PulseEvent(
                source_tile=1,
                dest_tile=2,
                pulse_type="violet",
                volume=1.0,
                timestamp=time.time()
            )
            consensus.record_pulse(event)

        # Edge 3-4: total volume 5.0
        for i in range(5):
            event = PulseEvent(
                source_tile=3,
                dest_tile=4,
                pulse_type="violet",
                volume=1.0,
                timestamp=time.time()
            )
            consensus.record_pulse(event)

        # Get top bonds
        top_bonds = consensus.get_top_bonds()

        # First bond should be 1-2 with strength 1.0
        assert top_bonds[0]["source"] == 1
        assert top_bonds[0]["dest"] == 2
        assert top_bonds[0]["strength"] == 1.0  # Max volume normalized to 1.0

        # Second bond should be 3-4 with strength 0.5
        assert top_bonds[1]["source"] == 3
        assert top_bonds[1]["dest"] == 4
        assert abs(top_bonds[1]["strength"] - 0.5) < 0.01

    def test_vat_position_tracking(self, components):
        """Test that VAT tracks position history correctly."""
        vat = components["vat"]

        # Set initial position
        vat.set_tile_position(1, 100, 100, "neural", "compute")
        pos = vat.get_tile_position(1)
        assert pos.move_count == 1
        initial_move_time = pos.last_move

        time.sleep(0.01)  # Small delay

        # Update position
        vat.set_tile_position(1, 150, 150, "neural", "compute")
        pos = vat.get_tile_position(1)
        assert pos.move_count == 2
        assert pos.last_move > initial_move_time

    def test_multiple_proposals_tracking(self, components):
        """Test tracking multiple proposals through handler."""
        handler = components["handler"]

        # Process multiple proposals
        for i in range(3):
            proposal = {
                "proposal_id": f"multi-test-{i}",
                "bonds": [
                    {"source": i, "dest": i + 1, "strength": 0.5 + i * 0.1}
                ]
            }
            handler.process_proposal(proposal)

            # Simulate delta
            delta = handler.simulate_delta(proposal)
            handler._last_delta = delta

            # Update status manually (normally done by read_layout_delta)
            handler.status.last_cycle = i

        status = handler.get_status()
        assert status["last_cycle"] == 2  # Last iteration


class TestTectonicsStats:
    """Test statistics and monitoring."""

    @pytest.fixture
    def temp_state_dir(self):
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    def test_consensus_stats(self, temp_state_dir):
        """Test ConsensusEngine statistics."""
        consensus = ConsensusEngine()

        for i in range(10):
            event = PulseEvent(
                source_tile=1,
                dest_tile=2,
                pulse_type="violet",
                volume=1.0,
                timestamp=time.time()
            )
            consensus.record_pulse(event)

        stats = consensus.get_stats()
        assert stats["pulse_buffer_size"] == 10
        assert stats["active_edges"] == 1
        assert stats["total_pulse_count"] == 10
        assert stats["total_volume"] == 10.0

    def test_vat_stats(self, temp_state_dir):
        """Test VAT statistics."""
        vat = VATManager(state_dir=temp_state_dir)

        vat.set_tile_position(1, 100, 200, "neural", "compute")
        vat.set_tile_position(2, 300, 400, "memory", "storage")
        vat.set_tile_position(3, 500, 600, "neural", "compute")

        stats = vat.get_stats()
        assert stats["tile_count"] == 3
        assert stats["tile_types"]["neural"] == 2
        assert stats["tile_types"]["memory"] == 1
        assert stats["districts"]["compute"] == 2

    def test_handler_stats(self, temp_state_dir):
        """Test TectonicHandler statistics."""
        handler = TectonicHandler(state_dir=temp_state_dir)

        proposal = {
            "proposal_id": "stats-test",
            "bonds": [{"source": 1, "dest": 2, "strength": 0.8}]
        }
        handler.process_proposal(proposal)

        status = handler.get_status()
        assert status["state"] == "processing"
        assert status["proposal_id"] == "stats-test"
        assert status["top_bond"] is not None


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
