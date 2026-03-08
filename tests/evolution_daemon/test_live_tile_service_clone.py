#!/usr/bin/env python3
"""
Tests for LiveTileService clone_tile RPC integration.

Task 4 of substrate-cloning spec.
"""

import pytest
import asyncio
from unittest.mock import AsyncMock, MagicMock, patch

from systems.evolution_daemon.live_tile_service import LiveTileService, LiveTileInstance


class TestCloneRPC:
    """Test suite for clone_tile RPC in LiveTileService."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.fixture
    def tile_with_extraction(self):
        """Create a mock tile with extraction data."""
        tile = LiveTileInstance(
            tile_id="test-tile-123",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        # Mock last_extraction from ExtractionBridge
        tile.last_extraction = {
            "widgets": [
                {"type": "button", "bbox": [10, 10, 50, 30], "text": "Click Me"}
            ],
            "metadata": {
                "timestamp": "2026-02-19T12:00:00Z",
                "source": "test"
            }
        }
        return tile

    @pytest.mark.asyncio
    async def test_service_handles_clone_request(self, service, tile_with_extraction):
        """
        Test that LiveTileService.handle_rpc() handles clone_tile method.

        Given: A running tile with extraction data
        When: clone_tile RPC is called
        Then: Returns task_id for tracking the clone operation
        """
        # Arrange: Add tile with extraction to service
        service.tiles[tile_with_extraction.tile_id] = tile_with_extraction

        # Act: Call clone_tile RPC
        result = await service.handle_rpc(
            method="clone_tile",
            params={
                "tile_id": "test-tile-123",
                "target_name": "my_panel"
            }
        )

        # Assert: Result contains task_id
        assert result is not None
        assert "task_id" in result
        assert result["task_id"].startswith("clone-")
        assert "status" in result
        # Clone is executed synchronously, so status should be completed
        assert result["status"] in ["pending", "completed"]
        # If completed, should have output_path
        if result["status"] == "completed":
            assert "output_path" in result

    @pytest.mark.asyncio
    async def test_clone_returns_error_for_missing_tile(self, service):
        """
        Test clone_tile returns error for non-existent tile.
        """
        result = await service.handle_rpc(
            method="clone_tile",
            params={
                "tile_id": "non-existent-tile",
                "target_name": "my_panel"
            }
        )

        assert result is not None
        assert result.get("status") == "error"
        assert "not found" in result.get("error", "").lower()

    @pytest.mark.asyncio
    async def test_clone_returns_error_for_no_extraction(self, service):
        """
        Test clone_tile returns error when tile has no extraction data.
        """
        # Tile without extraction data
        tile = LiveTileInstance(
            tile_id="tile-no-extraction",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        # No last_extraction attribute
        service.tiles[tile.tile_id] = tile

        result = await service.handle_rpc(
            method="clone_tile",
            params={
                "tile_id": "tile-no-extraction",
                "target_name": "my_panel"
            }
        )

        assert result is not None
        assert result.get("status") == "error"
        assert "extraction" in result.get("error", "").lower()


class TestLiveTileServiceBasics:
    """Tests for basic LiveTileService functionality."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.fixture
    def running_tile(self):
        """Create a running tile instance."""
        return LiveTileInstance(
            tile_id="tile-running",
            rts_path="/path/to/test.rts.png",
            status="running"
        )

    def test_service_initializes_empty(self, service):
        """Service should initialize with empty tiles dict."""
        assert service.tiles == {}

    @pytest.mark.asyncio
    async def test_list_tiles_empty(self, service):
        """list_tiles should return empty list when no tiles."""
        result = await service.list_tiles()
        assert result == []

    @pytest.mark.asyncio
    async def test_list_tiles_returns_all(self, service, running_tile):
        """list_tiles should return all tiles."""
        service.tiles["tile-1"] = running_tile
        service.tiles["tile-2"] = LiveTileInstance(
            tile_id="tile-2",
            rts_path="/path/to/test2.rts.png",
            status="stopped"
        )

        result = await service.list_tiles()
        assert len(result) == 2
        tile_ids = [t["tile_id"] for t in result]
        assert "tile-running" in tile_ids
        assert "tile-2" in tile_ids

    @pytest.mark.asyncio
    async def test_get_tile_info_existing(self, service, running_tile):
        """get_tile_info should return tile dict for existing tile."""
        service.tiles[running_tile.tile_id] = running_tile

        result = await service.get_tile_info("tile-running")

        assert result is not None
        assert result["tile_id"] == "tile-running"
        assert result["status"] == "running"

    @pytest.mark.asyncio
    async def test_get_tile_info_nonexistent(self, service):
        """get_tile_info should return None for non-existent tile."""
        result = await service.get_tile_info("nonexistent")
        assert result is None

    @pytest.mark.asyncio
    async def test_stop_tile_nonexistent(self, service):
        """stop_tile should return not_found for non-existent tile."""
        result = await service.stop_tile("nonexistent")
        assert result["status"] == "not_found"

    def test_get_timestamp_format(self, service):
        """_get_timestamp should return HH:MM:SS format."""
        timestamp = service._get_timestamp()
        # Should match HH:MM:SS pattern
        parts = timestamp.split(":")
        assert len(parts) == 3
        assert all(len(p) == 2 for p in parts)
        assert all(p.isdigit() for p in parts)

    def test_set_webmcp(self, service):
        """set_webmcp should store WebMCP instance."""
        mock_webmcp = MagicMock()
        service.set_webmcp(mock_webmcp)
        assert service._webmcp is mock_webmcp

    def test_set_boot_callback(self, service):
        """set_boot_callback should store callback."""
        callback = lambda: None
        service.set_boot_callback(callback)
        assert service._boot_callback is callback


class TestLiveTileServiceRPC:
    """Tests for handle_rpc method."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.mark.asyncio
    async def test_handle_rpc_unknown_method_raises(self, service):
        """handle_rpc should raise ValueError for unknown method."""
        with pytest.raises(ValueError, match="Unknown method"):
            await service.handle_rpc("unknown_method", {})

    @pytest.mark.asyncio
    async def test_handle_rpc_list_tiles(self, service):
        """handle_rpc should handle list_tiles method."""
        result = await service.handle_rpc("list_tiles", {})
        assert result == []

    @pytest.mark.asyncio
    async def test_handle_rpc_get_tile_info(self, service):
        """handle_rpc should handle get_tile_info method."""
        tile = LiveTileInstance(
            tile_id="test-tile",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        service.tiles["test-tile"] = tile

        result = await service.handle_rpc("get_tile_info", {"tile_id": "test-tile"})
        assert result["tile_id"] == "test-tile"

    @pytest.mark.asyncio
    async def test_handle_rpc_set_tile_focus(self, service):
        """handle_rpc should handle set_tile_focus method."""
        tile = LiveTileInstance(
            tile_id="test-tile",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        service.tiles["test-tile"] = tile

        result = await service.handle_rpc("set_tile_focus", {
            "tile_id": "test-tile",
            "focused": True
        })
        assert result["status"] == "ok"
        assert service.tiles["test-tile"].focus_state == "focused"

    @pytest.mark.asyncio
    async def test_handle_rpc_set_tile_focus_not_found(self, service):
        """set_tile_focus should return error for non-existent tile."""
        result = await service.handle_rpc("set_tile_focus", {
            "tile_id": "nonexistent",
            "focused": True
        })
        assert result["status"] == "error"
        assert "not found" in result["message"].lower()

    @pytest.mark.asyncio
    async def test_handle_rpc_stop_tile(self, service):
        """handle_rpc should handle stop_tile method."""
        result = await service.handle_rpc("stop_tile", {"tile_id": "nonexistent"})
        assert result["status"] == "not_found"


class TestLiveTileInstance:
    """Tests for LiveTileInstance dataclass."""

    def test_instance_defaults(self):
        """LiveTileInstance should have correct defaults."""
        tile = LiveTileInstance(
            tile_id="test",
            rts_path="/path/to/test.rts.png"
        )

        assert tile.status == "stopped"
        assert tile.bridge is None
        assert tile.process is None
        assert tile.framebuffer is None
        assert tile.framebuffer_width == 320
        assert tile.framebuffer_height == 240
        assert tile.metrics == {"cpu": 0, "memory": 0, "uptime": 0}
        assert tile.console_output == []
        assert tile.boot_time is None
        assert tile.screenshot_task is None
        assert tile.v3_format is False
        assert tile.focus_state == "idle"

    def test_to_dict(self):
        """to_dict should return correct dictionary."""
        tile = LiveTileInstance(
            tile_id="test-tile",
            rts_path="/path/to/test.rts.png",
            status="running",
            framebuffer="base64data"
        )

        result = tile.to_dict()

        assert result["tile_id"] == "test-tile"
        assert result["rts_path"] == "/path/to/test.rts.png"
        assert result["status"] == "running"
        assert result["framebuffer"] == "base64data"
        assert result["framebuffer_width"] == 320
        assert result["framebuffer_height"] == 240
        assert "console_lines" in result


class TestGetLiveTileService:
    """Tests for module-level service getter."""

    def test_get_service_returns_instance(self):
        """get_live_tile_service should return LiveTileService."""
        from systems.evolution_daemon.live_tile_service import get_live_tile_service

        service = get_live_tile_service()
        assert isinstance(service, LiveTileService)

    def test_get_service_singleton(self):
        """get_live_tile_service should return same instance."""
        from systems.evolution_daemon import live_tile_service

        # Reset singleton
        live_tile_service._service = None

        service1 = live_tile_service.get_live_tile_service()
        service2 = live_tile_service.get_live_tile_service()

        assert service1 is service2


class TestBroadcastEvent:
    """Tests for _broadcast_event method."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.mark.asyncio
    async def test_broadcast_without_webmcp(self, service, caplog):
        """_broadcast_event should log when no WebMCP."""
        import logging

        with caplog.at_level(logging.DEBUG):
            await service._broadcast_event("test_event", {"data": "test"})

        # Should have logged the event
        assert "test_event" in caplog.text or "no WebMCP" in caplog.text

    @pytest.mark.asyncio
    async def test_broadcast_with_webmcp(self, service):
        """_broadcast_event should call WebMCP when available."""
        mock_webmcp = MagicMock()
        mock_webmcp.broadcast_event = AsyncMock()
        service.set_webmcp(mock_webmcp)

        await service._broadcast_event("test_event", {"data": "test"})

        mock_webmcp.broadcast_event.assert_called_once_with("test_event", {"data": "test"})

    @pytest.mark.asyncio
    async def test_broadcast_handles_webmcp_error(self, service, caplog):
        """_broadcast_event should handle WebMCP errors gracefully."""
        import logging

        mock_webmcp = MagicMock()
        mock_webmcp.broadcast_event = AsyncMock(side_effect=RuntimeError("Network error"))
        service.set_webmcp(mock_webmcp)

        with caplog.at_level(logging.WARNING):
            await service._broadcast_event("test_event", {"data": "test"})

        # Should have logged a warning
        assert "Failed to broadcast" in caplog.text or "Network error" in caplog.text
