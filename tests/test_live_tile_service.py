"""
Tests for Live Tile Service.

Task 6 of Live Tile Integration Plan.
"""
import pytest
import asyncio
from unittest.mock import AsyncMock, MagicMock

from systems.evolution_daemon.live_tile_service import (
    LiveTileService,
    LiveTileInstance,
    get_live_tile_service
)


class TestLiveTileInstance:
    """Tests for LiveTileInstance dataclass."""

    def test_create_instance(self):
        """Test creating a tile instance."""
        tile = LiveTileInstance(
            tile_id="test-01",
            rts_path="rts_files/alpine.rts.png"
        )
        assert tile.tile_id == "test-01"
        assert tile.rts_path == "rts_files/alpine.rts.png"
        assert tile.status == "stopped"
        assert tile.framebuffer is None
        assert tile.metrics["cpu"] == 0
        assert tile.console_output == []

    def test_to_dict(self):
        """Test serializing to dictionary."""
        tile = LiveTileInstance(
            tile_id="test-01",
            rts_path="rts_files/alpine.rts.png",
            status="running"
        )
        data = tile.to_dict()
        assert data["tile_id"] == "test-01"
        assert data["status"] == "running"
        assert "metrics" in data


class TestLiveTileService:
    """Tests for LiveTileService."""

    @pytest.fixture
    def service(self):
        """Create a fresh service for each test."""
        return LiveTileService()

    @pytest.mark.asyncio
    async def test_boot_tile(self, service):
        """Test booting a tile from RTS file."""
        result = await service.boot_tile("test-01", "rts_files/alpine_v2.rts.png")
        assert result["tile_id"] == "test-01"
        assert result["status"] in ["booting", "running"]
        assert "test-01" in service.tiles

    @pytest.mark.asyncio
    async def test_stop_tile(self, service):
        """Test stopping a running tile."""
        await service.boot_tile("test-02", "rts_files/alpine_v2.rts.png")
        result = await service.stop_tile("test-02")
        assert result["status"] == "stopped"
        assert service.tiles["test-02"].status == "stopped"

    @pytest.mark.asyncio
    async def test_get_framebuffer_none(self, service):
        """Test getting framebuffer when none exists."""
        await service.boot_tile("test-03", "rts_files/alpine_v2.rts.png")
        fb = await service.get_framebuffer("test-03")
        # Framebuffer may be None if not yet set
        assert fb is None or "tile_id" in fb

    @pytest.mark.asyncio
    async def test_list_tiles(self, service):
        """Test listing all tiles."""
        await service.boot_tile("list-01", "rts/a.rts.png")
        await service.boot_tile("list-02", "rts/b.rts.png")
        tiles = await service.list_tiles()
        assert len(tiles) >= 2
        tile_ids = [t["tile_id"] for t in tiles]
        assert "list-01" in tile_ids
        assert "list-02" in tile_ids

    @pytest.mark.asyncio
    async def test_get_tile_info(self, service):
        """Test getting tile info."""
        await service.boot_tile("info-01", "rts/alpine.rts.png")
        info = await service.get_tile_info("info-01")
        assert info is not None
        assert info["tile_id"] == "info-01"

    @pytest.mark.asyncio
    async def test_get_tile_info_not_found(self, service):
        """Test getting info for non-existent tile."""
        info = await service.get_tile_info("nonexistent")
        assert info is None

    @pytest.mark.asyncio
    async def test_stop_nonexistent_tile(self, service):
        """Test stopping a tile that doesn't exist."""
        result = await service.stop_tile("nonexistent")
        assert result["status"] == "not_found"

    @pytest.mark.asyncio
    async def test_handle_rpc_boot(self, service):
        """Test RPC handler for boot_tile."""
        result = await service.handle_rpc("boot_tile", {
            "tile_id": "rpc-01",
            "rts_path": "rts/alpine.rts.png"
        })
        assert result["tile_id"] == "rpc-01"

    @pytest.mark.asyncio
    async def test_handle_rpc_stop(self, service):
        """Test RPC handler for stop_tile."""
        await service.handle_rpc("boot_tile", {
            "tile_id": "rpc-02",
            "rts_path": "rts/alpine.rts.png"
        })
        result = await service.handle_rpc("stop_tile", {
            "tile_id": "rpc-02"
        })
        assert result["status"] == "stopped"

    @pytest.mark.asyncio
    async def test_handle_rpc_unknown_method(self, service):
        """Test RPC handler with unknown method."""
        with pytest.raises(ValueError, match="Unknown method"):
            await service.handle_rpc("unknown_method", {})

    @pytest.mark.asyncio
    async def test_set_webmcp(self, service):
        """Test setting WebMCP instance."""
        mock_webmcp = MagicMock()
        mock_webmcp.broadcast_event = AsyncMock()
        service.set_webmcp(mock_webmcp)
        assert service._webmcp == mock_webmcp

    @pytest.mark.asyncio
    async def test_send_console_input(self, service):
        """Test sending console input."""
        await service.boot_tile("console-01", "rts/alpine.rts.png")
        # Wait for boot to complete
        await asyncio.sleep(2.5)

        tile = service.tiles["console-01"]
        tile.status = "running"  # Ensure it's running

        result = await service.send_console_input("console-01", "ls -la")
        assert result["status"] == "sent"
        assert len(tile.console_output) > 0

    @pytest.mark.asyncio
    async def test_send_console_input_not_running(self, service):
        """Test sending console input to stopped tile."""
        await service.boot_tile("console-02", "rts/alpine.rts.png")
        service.tiles["console-02"].status = "stopped"

        result = await service.send_console_input("console-02", "ls")
        assert result["status"] == "not_running"


class TestGetLiveTileService:
    """Tests for module-level service getter."""

    def test_get_service_singleton(self):
        """Test that get_live_tile_service returns singleton."""
        from systems.evolution_daemon import live_tile_service

        # Reset singleton
        live_tile_service._service = None

        service1 = get_live_tile_service()
        service2 = get_live_tile_service()
        assert service1 is service2


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
