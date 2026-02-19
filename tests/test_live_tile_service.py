"""
Tests for Live Tile Service.

Task 6 of Live Tile Integration Plan.
Task 3 of Distributed Neural Memory Plan (Phase 27).
"""
import pytest
import asyncio
from unittest.mock import AsyncMock, MagicMock

from systems.evolution_daemon.live_tile_service import (
    LiveTileService,
    LiveTileInstance,
    get_live_tile_service
)
from systems.evolution_daemon.neural_event import EventType


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
        
        # Mock a bridge and QEMU instance for testing
        class MockBridge:
            _qemu = MagicMock()
        tile.bridge = MockBridge()

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

    # ============================================
    # Neural Event Integration Tests (Task 3)
    # ============================================

    @pytest.mark.asyncio
    async def test_capture_neural_event(self, service):
        """Test capturing a neural event from tile activity."""
        await service.boot_tile("neural-01", "rts/alpine.rts.png")
        service.tiles["neural-01"].status = "running"
        service.tiles["neural-01"].metrics = {"cpu": 15, "memory": 150}

        event = await service.capture_neural_event(
            "neural-01",
            shell_tokens=["ls", "-la"],
            broadcast=True
        )

        assert event is not None
        assert event.tile_id == "neural-01"
        assert event.shell_tokens == ["ls", "-la"]
        assert event.broadcast is True

    @pytest.mark.asyncio
    async def test_capture_neural_event_auto_shell_tokens(self, service):
        """Test neural event capture auto-extracts shell tokens from console."""
        await service.boot_tile("neural-02", "rts/alpine.rts.png")
        service.tiles["neural-02"].status = "running"
        service.tiles["neural-02"].console_output = [
            {"text": "Welcome to Alpine"},
            {"text": "> ls -la /home"},
            {"text": "total 8"}
        ]

        event = await service.capture_neural_event("neural-02")

        assert event is not None
        # Should have extracted tokens from "> ls -la /home"
        assert "ls" in event.shell_tokens

    @pytest.mark.asyncio
    async def test_capture_neural_event_nonexistent_tile(self, service):
        """Test capturing neural event for nonexistent tile."""
        event = await service.capture_neural_event("nonexistent")
        assert event is None

    @pytest.mark.asyncio
    async def test_get_collective_context(self, service):
        """Test getting collective context from memory hub."""
        await service.boot_tile("context-01", "rts/alpine.rts.png")
        await service.boot_tile("context-02", "rts/alpine.rts.png")

        # Capture some events
        service.tiles["context-01"].status = "running"
        service.tiles["context-02"].status = "running"

        await service.capture_neural_event("context-01", shell_tokens=["test"], broadcast=True)
        await service.capture_neural_event("context-02", shell_tokens=["other"], broadcast=True)

        # Get collective context
        context = await service.get_collective_context("context-01")

        assert "recent_events" in context
        assert "similar_tiles" in context
        assert "similar_events" in context
        assert "total_memory_size" in context

    @pytest.mark.asyncio
    async def test_handle_rpc_capture_neural_event(self, service):
        """Test RPC handler for capture_neural_event."""
        await service.boot_tile("rpc-neural", "rts/alpine.rts.png")
        service.tiles["rpc-neural"].status = "running"

        result = await service.handle_rpc("capture_neural_event", {
            "tile_id": "rpc-neural",
            "shell_tokens": ["cat", "/etc/hosts"],
            "broadcast": True
        })

        assert result is not None
        assert result["tile_id"] == "rpc-neural"

    @pytest.mark.asyncio
    async def test_handle_rpc_get_collective_context(self, service):
        """Test RPC handler for get_collective_context."""
        await service.boot_tile("rpc-ctx", "rts/alpine.rts.png")

        result = await service.handle_rpc("get_collective_context", {
            "tile_id": "rpc-ctx"
        })

        assert "recent_events" in result
        assert "total_memory_size" in result

    @pytest.mark.asyncio
    async def test_memory_hub_integration(self, service):
        """Test that service is connected to memory hub."""
        assert service._memory_hub is not None

        # Store an event and verify it goes to hub
        await service.boot_tile("hub-test", "rts/alpine.rts.png")
        service.tiles["hub-test"].status = "running"

        await service.capture_neural_event("hub-test", broadcast=True)

        # Verify event is in hub
        hub_events = await service._memory_hub.get_broadcast_events()
        tile_ids = [e.tile_id for e in hub_events]
        assert "hub-test" in tile_ids


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
