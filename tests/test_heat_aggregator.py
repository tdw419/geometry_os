"""
Unit tests for HeatAggregator service.

Tests cover:
- HeatMap initialization, decay, diffusion, and hotspot detection
- HeatAggregator access recording and broadcasting
"""

import pytest
import asyncio
import numpy as np
from unittest.mock import MagicMock, AsyncMock, patch
import sys
import os

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from systems.visual_shell.api.heat_aggregator import (
    HeatAggregator, HeatMap, HeatCell, GRID_SIZE, DECAY_RATE, HEAT_INCREMENT
)


class TestHeatCell:
    """Tests for HeatCell dataclass."""

    def test_initial_state(self):
        """HeatCell starts with default values."""
        cell = HeatCell()
        assert cell.value == 0.0
        assert cell.access_count == 0
        assert cell.last_access == 0.0
        assert cell.sources == {}

    def test_to_dict(self):
        """HeatCell serializes to dictionary."""
        cell = HeatCell(value=0.5, access_count=10, last_access=12345.0)
        cell.sources = {"riscv": 0.3, "fuse": 0.2}

        data = cell.to_dict()
        assert data["value"] == 0.5
        assert data["access_count"] == 10
        assert data["last_access"] == 12345.0
        assert data["sources"]["riscv"] == 0.3

    def test_from_dict(self):
        """HeatCell deserializes from dictionary."""
        data = {
            "value": 0.7,
            "access_count": 20,
            "last_access": 54321.0,
            "sources": {"evolution": 0.5}
        }

        cell = HeatCell.from_dict(data)
        assert cell.value == 0.7
        assert cell.access_count == 20
        assert cell.last_access == 54321.0
        assert cell.sources["evolution"] == 0.5


class TestHeatMap:
    """Tests for HeatMap class."""

    def test_initial_state(self):
        """Heat map starts at zero."""
        hm = HeatMap()
        assert hm.grid.shape == (GRID_SIZE, GRID_SIZE)
        assert np.all(hm.grid == 0)
        assert hm.detailed_cells is not None

    def test_add_heat(self):
        """Adding heat increments cell value."""
        hm = HeatMap()
        hm.add_heat(10, 20, 0.5)
        assert hm.grid[20, 10] == 0.5

    def test_add_heat_with_source(self):
        """Adding heat tracks source in detailed cells."""
        hm = HeatMap()
        hm.add_heat(10, 20, 0.3, "riscv")
        hm.add_heat(10, 20, 0.2, "fuse")

        assert hm.grid[20, 10] == 0.5
        assert hm.detailed_cells[(10, 20)].sources["riscv"] == 0.3
        assert hm.detailed_cells[(10, 20)].sources["fuse"] == 0.2

    def test_heat_clamped_to_one(self):
        """Heat values are clamped to 1.0."""
        hm = HeatMap()
        hm.add_heat(10, 20, 2.0)  # Over-max
        assert hm.grid[20, 10] == 1.0

    def test_decay(self):
        """Decay reduces heat over time."""
        hm = HeatMap()
        hm.add_heat(10, 20, 1.0)
        hm.apply_decay(1.0)  # 1 second

        # After 1 second with DECAY_RATE=0.95, heat should be ~0.95
        assert hm.grid[20, 10] < 1.0
        assert hm.grid[20, 10] > 0
        assert abs(hm.grid[20, 10] - 0.95) < 0.01

    def test_decay_multiple_seconds(self):
        """Decay compounds over multiple seconds."""
        hm = HeatMap()
        hm.add_heat(10, 20, 1.0)
        hm.apply_decay(2.0)  # 2 seconds

        # After 2 seconds: 0.95^2 = 0.9025
        expected = DECAY_RATE ** 2
        assert abs(hm.grid[20, 10] - expected) < 0.01

    def test_diffusion(self):
        """Diffusion spreads heat to neighbors."""
        hm = HeatMap()
        hm.add_heat(32, 32, 1.0)
        hm.diffuse(iterations=1)

        # Center should be reduced (kernel center = 0.4)
        assert hm.grid[32, 32] < 1.0
        assert hm.grid[32, 32] > 0.3

        # Neighbors should have heat
        assert hm.grid[31, 32] > 0  # left
        assert hm.grid[33, 32] > 0  # right
        assert hm.grid[32, 31] > 0  # top
        assert hm.grid[32, 33] > 0  # bottom

    def test_get_hotspots(self):
        """Hotspots returns cells above threshold."""
        hm = HeatMap()
        hm.add_heat(10, 10, 0.8)
        hm.add_heat(20, 20, 0.9)
        hm.add_heat(30, 30, 0.3)  # Below threshold

        hotspots = hm.get_hotspots(threshold=0.5)
        assert len(hotspots) == 2

        # Should be sorted by intensity descending
        assert hotspots[0][2] == pytest.approx(0.9, rel=0.01)  # (20, 20, 0.9)
        assert hotspots[1][2] == pytest.approx(0.8, rel=0.01)  # (10, 10, 0.8)

    def test_get_hotspots_empty(self):
        """No hotspots when all cells below threshold."""
        hm = HeatMap()
        hm.add_heat(10, 10, 0.3)
        hm.add_heat(20, 20, 0.4)

        hotspots = hm.get_hotspots(threshold=0.7)
        assert len(hotspots) == 0

    def test_out_of_bounds_ignored(self):
        """Out of bounds coordinates are ignored."""
        hm = HeatMap()
        hm.add_heat(-1, 0, 1.0)  # Should be ignored
        hm.add_heat(GRID_SIZE, 0, 1.0)  # Should be ignored
        hm.add_heat(0, -1, 1.0)  # Should be ignored
        hm.add_heat(0, GRID_SIZE, 1.0)  # Should be ignored

        assert np.all(hm.grid == 0)

    def test_get_total_heat(self):
        """Get total heat across all cells."""
        hm = HeatMap()
        hm.add_heat(10, 10, 0.5)
        hm.add_heat(20, 20, 0.3)

        total = hm.get_total_heat()
        assert total == pytest.approx(0.8, abs=0.01)

    def test_get_average_heat(self):
        """Get average heat per cell."""
        hm = HeatMap()
        hm.add_heat(10, 10, 1.0)

        avg = hm.get_average_heat()
        expected = 1.0 / (GRID_SIZE * GRID_SIZE)
        assert avg == pytest.approx(expected, rel=0.01)

    def test_get_max_heat(self):
        """Get coordinates of hottest cell."""
        hm = HeatMap()
        hm.add_heat(10, 10, 0.5)
        hm.add_heat(20, 20, 0.9)
        hm.add_heat(30, 30, 0.3)

        x, y, val = hm.get_max_heat()
        assert x == 20
        assert y == 20
        assert val == pytest.approx(0.9, rel=0.01)

    def test_to_dict_and_from_dict(self):
        """HeatMap serializes and deserializes correctly."""
        hm = HeatMap()
        hm.add_heat(10, 10, 0.5)
        hm.add_heat(20, 20, 0.8)

        data = hm.to_dict()
        hm2 = HeatMap.from_dict(data)

        assert np.allclose(hm.grid, hm2.grid)
        assert hm.last_update == hm2.last_update


class TestHeatAggregator:
    """Tests for HeatAggregator class."""

    @pytest.fixture
    def mock_bridge(self):
        """Create a mock VisualBridge."""
        bridge = MagicMock()
        bridge._broadcast = AsyncMock()
        return bridge

    @pytest.fixture
    def mock_vat_manager(self):
        """Create a mock VATManager."""
        return MagicMock()

    @pytest.fixture
    def aggregator(self, mock_bridge, mock_vat_manager):
        """Create aggregator with mock dependencies."""
        return HeatAggregator(mock_bridge, mock_vat_manager)

    def test_initialization(self, aggregator):
        """Aggregator initializes correctly."""
        assert aggregator.heat_map is not None
        assert aggregator.heat_map.grid.shape == (GRID_SIZE, GRID_SIZE)
        assert aggregator.total_accesses == 0
        assert aggregator.accesses_by_source == {}

    def test_record_access(self, aggregator):
        """Record access adds heat at coordinates."""
        aggregator.record_access(10, 20, "test")

        assert aggregator.heat_map.grid[20, 10] > 0
        assert aggregator.total_accesses == 1
        assert aggregator.accesses_by_source["test"] == 1

    def test_record_access_multiple(self, aggregator):
        """Multiple accesses accumulate."""
        aggregator.record_access(10, 20, "riscv")
        aggregator.record_access(10, 20, "riscv")
        aggregator.record_access(10, 20, "fuse")

        expected = HEAT_INCREMENT * 3
        assert aggregator.heat_map.grid[20, 10] == pytest.approx(expected, rel=0.01)
        assert aggregator.total_accesses == 3
        assert aggregator.accesses_by_source["riscv"] == 2
        assert aggregator.accesses_by_source["fuse"] == 1

    def test_record_memory_access(self, aggregator):
        """Record memory access maps linear address to grid."""
        # Address 0 maps to (0, 0)
        aggregator.record_memory_access(0, "riscv")
        assert aggregator.heat_map.grid[0, 0] > 0

        # Address 4 maps to (1, 0) (next word)
        aggregator.record_memory_access(4, "riscv")
        assert aggregator.heat_map.grid[0, 1] > 0

        # Address 256 (64 * 4) maps to (0, 1)
        aggregator.record_memory_access(256, "riscv")
        assert aggregator.heat_map.grid[1, 0] > 0

    def test_get_heat_at(self, aggregator):
        """Get heat at coordinates returns current value."""
        aggregator.record_access(10, 20, "test")
        heat = aggregator.get_heat_at(10, 20)
        assert heat > 0
        assert heat == pytest.approx(HEAT_INCREMENT, rel=0.01)

    def test_get_heat_at_out_of_bounds(self, aggregator):
        """Out of bounds returns 0."""
        assert aggregator.get_heat_at(-1, 0) == 0
        assert aggregator.get_heat_at(GRID_SIZE, 0) == 0
        assert aggregator.get_heat_at(0, -1) == 0
        assert aggregator.get_heat_at(0, GRID_SIZE) == 0

    def test_get_stats(self, aggregator):
        """Get stats returns aggregator statistics."""
        aggregator.record_access(10, 10, "riscv")
        aggregator.record_access(20, 20, "fuse")

        stats = aggregator.get_stats()
        assert stats["total_accesses"] == 2
        assert stats["accesses_by_source"]["riscv"] == 1
        assert stats["accesses_by_source"]["fuse"] == 1
        assert stats["grid_size"] == GRID_SIZE
        assert stats["running"] is False  # Not started yet

    def test_clear(self, aggregator):
        """Clear resets the heat map."""
        aggregator.record_access(10, 10, "test")
        aggregator.clear()

        assert np.all(aggregator.heat_map.grid == 0)
        assert aggregator.total_accesses == 0
        assert aggregator.accesses_by_source == {}

    @pytest.mark.asyncio
    async def test_broadcast_update(self, aggregator, mock_bridge):
        """Broadcast update sends message to bridge."""
        aggregator.record_access(32, 32, "test")

        await aggregator._broadcast_update()

        mock_bridge._broadcast.assert_called_once()
        call_args = mock_bridge._broadcast.call_args[0][0]

        assert call_args["type"] == "heat_map_update"
        assert "grid" in call_args["data"]
        assert "hotspots" in call_args["data"]
        assert "stats" in call_args["data"]
        assert call_args["data"]["grid_shape"] == [GRID_SIZE, GRID_SIZE]

    @pytest.mark.asyncio
    async def test_broadcast_update_includes_hotspots(self, aggregator, mock_bridge):
        """Broadcast includes hotspots above threshold."""
        # Create some hot spots - need to exceed the 0.7 threshold
        # Add heat multiple times to same location to build up intensity
        for _ in range(8):  # 8 * 0.1 = 0.8 > 0.7 threshold
            aggregator.record_access(32, 32, "test")
        for _ in range(8):
            aggregator.record_access(16, 16, "test")

        await aggregator._broadcast_update()

        call_args = mock_bridge._broadcast.call_args[0][0]
        hotspots = call_args["data"]["hotspots"]

        # Should have some hotspots (heat values are ~0.8, above 0.7 threshold)
        assert len(hotspots) > 0
        # Each hotspot should have x, y, intensity
        for hs in hotspots:
            assert "x" in hs
            assert "y" in hs
            assert "intensity" in hs

    @pytest.mark.asyncio
    async def test_start_and_stop(self, aggregator):
        """Start and stop control the update loop."""
        await aggregator.start()
        assert aggregator._running is True
        assert aggregator._task is not None

        await aggregator.stop()
        assert aggregator._running is False
        assert aggregator._task is None


class TestHeatAggregatorIntegration:
    """Integration tests for HeatAggregator."""

    @pytest.fixture
    def mock_bridge(self):
        bridge = MagicMock()
        bridge._broadcast = AsyncMock()
        return bridge

    @pytest.fixture
    def mock_vat(self):
        return MagicMock()

    @pytest.mark.asyncio
    async def test_update_loop_applies_decay(self, mock_bridge, mock_vat):
        """Update loop applies decay over time."""
        agg = HeatAggregator(mock_bridge, mock_vat)
        agg.record_access(32, 32, "test")

        initial_heat = agg.heat_map.grid[32, 32]

        # Manually call apply_decay
        agg.heat_map.apply_decay(1.0)

        decayed_heat = agg.heat_map.grid[32, 32]
        assert decayed_heat < initial_heat

    @pytest.mark.asyncio
    async def test_update_loop_diffuses(self, mock_bridge, mock_vat):
        """Update loop diffuses heat."""
        agg = HeatAggregator(mock_bridge, mock_vat)
        agg.record_access(32, 32, "test")

        # Manually call diffuse
        agg.heat_map.diffuse(iterations=1)

        # Neighbors should have heat
        assert agg.heat_map.grid[31, 32] > 0 or agg.heat_map.grid[33, 32] > 0

    @pytest.mark.asyncio
    async def test_full_cycle(self, mock_bridge, mock_vat):
        """Test a full cycle of recording and broadcasting."""
        agg = HeatAggregator(mock_bridge, mock_vat)

        # Record many accesses
        for i in range(50):
            agg.record_access(i % GRID_SIZE, (i * 7) % GRID_SIZE, f"source_{i % 3}")

        # Broadcast
        await agg._broadcast_update()

        # Verify broadcast was called with expected data
        call_args = mock_bridge._broadcast.call_args[0][0]
        assert call_args["type"] == "heat_map_update"
        assert call_args["data"]["stats"]["total_accesses"] == 50


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
