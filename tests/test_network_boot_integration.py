# tests/test_network_boot_integration.py
"""
Integration tests for NetworkBoot orchestrator.
"""

from unittest.mock import AsyncMock, MagicMock

import pytest

from systems.infinite_map.gravity_engine import GravityEngine
from systems.network_boot.network_boot import NetworkBoot


class TestNetworkBoot:
    """Tests for NetworkBoot orchestrator."""

    def test_network_boot_creation(self):
        """Test NetworkBoot initializes correctly."""
        nb = NetworkBoot(node_id="test-node", hostname="test-host")
        assert nb.node_id == "test-node"
        assert nb.hostname == "test-host"
        assert nb.running is False

    @pytest.mark.asyncio
    async def test_network_boot_start(self):
        """Test starting NetworkBoot."""
        nb = NetworkBoot(node_id="test", hostname="test")

        # Mock components
        nb.broadcaster = AsyncMock()
        nb.broadcaster.start = AsyncMock()
        nb.sync = AsyncMock()
        nb.sync.start_server = AsyncMock()

        await nb.start()

        nb.broadcaster.start.assert_called_once()
        nb.sync.start_server.assert_called_once()

    @pytest.mark.asyncio
    async def test_network_boot_stop(self):
        """Test stopping NetworkBoot."""
        nb = NetworkBoot(node_id="test", hostname="test")
        nb.running = True

        # Mock components
        nb.broadcaster = MagicMock()
        nb.broadcaster.stop = MagicMock()
        nb.sync = MagicMock()
        nb.sync.stop = MagicMock()

        nb.stop()

        nb.broadcaster.stop.assert_called_once()
        nb.sync.stop.assert_called_once()
        assert nb.running is False

    @pytest.mark.asyncio
    async def test_network_boot_connect_gravity_engine(self):
        """Test connecting GravityEngine to NetworkBoot."""
        nb = NetworkBoot(node_id="test", hostname="test")
        gravity = GravityEngine()

        nb.connect_gravity_engine(gravity)

        assert nb.gravity_engine == gravity
        assert nb.sync.on_orb_update is not None
        assert nb.sync.on_ripple is not None


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
