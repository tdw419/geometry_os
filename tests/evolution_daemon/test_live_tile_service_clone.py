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


class TestCaptureNeuralEvent:
    """Tests for capture_neural_event method."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.fixture
    def running_tile(self):
        """Create a running tile with console output."""
        tile = LiveTileInstance(
            tile_id="tile-neural",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        tile.metrics = {"cpu": 15.0, "memory": 140}
        tile.console_output = [
            {"text": "> ls -la"},
            {"text": "file1 file2"},
            {"text": "> cat test.txt"}
        ]
        return tile

    @pytest.mark.asyncio
    async def test_capture_neural_event_returns_none_for_missing_tile(self, service):
        """capture_neural_event should return None for non-existent tile."""
        result = await service.capture_neural_event("nonexistent")
        assert result is None

    @pytest.mark.asyncio
    async def test_capture_neural_event_with_shell_tokens(self, service, running_tile):
        """capture_neural_event should use provided shell_tokens."""
        service.tiles[running_tile.tile_id] = running_tile

        event = await service.capture_neural_event(
            "tile-neural",
            shell_tokens=["ls", "-la", "/home"],
            broadcast=False
        )

        assert event is not None
        assert event.tile_id == "tile-neural"
        assert event.shell_tokens == ["ls", "-la", "/home"]
        assert event.broadcast is False

    @pytest.mark.asyncio
    async def test_capture_neural_event_extracts_from_console(self, service, running_tile):
        """capture_neural_event should extract shell tokens from console."""
        service.tiles[running_tile.tile_id] = running_tile

        event = await service.capture_neural_event(
            "tile-neural",
            shell_tokens=None,  # Should extract from console
            broadcast=True
        )

        assert event is not None
        # Should have extracted tokens from console output
        assert len(event.shell_tokens) > 0
        assert "ls" in event.shell_tokens or "cat" in event.shell_tokens

    @pytest.mark.asyncio
    async def test_capture_neural_event_with_event_type_override(self, service, running_tile):
        """capture_neural_event should allow event_type override."""
        from systems.evolution_daemon.neural_event import EventType

        service.tiles[running_tile.tile_id] = running_tile

        event = await service.capture_neural_event(
            "tile-neural",
            shell_tokens=["test"],
            event_type=EventType.ALPINE_COMMAND,
            broadcast=False
        )

        assert event is not None
        assert event.event_type == EventType.ALPINE_COMMAND


class TestGetCollectiveContext:
    """Tests for get_collective_context method."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.mark.asyncio
    async def test_get_collective_context_returns_dict(self, service):
        """get_collective_context should return context dict."""
        result = await service.get_collective_context("tile-test")

        assert isinstance(result, dict)
        assert "recent_events" in result
        assert "similar_tiles" in result
        assert "similar_events" in result


class TestGetFramebuffer:
    """Tests for get_framebuffer method."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.mark.asyncio
    async def test_get_framebuffer_missing_tile(self, service):
        """get_framebuffer should return None for missing tile."""
        result = await service.get_framebuffer("nonexistent")

        assert result is None

    @pytest.mark.asyncio
    async def test_get_framebuffer_running_tile(self, service):
        """get_framebuffer should return framebuffer data for running tile."""
        tile = LiveTileInstance(
            tile_id="tile-fb",
            rts_path="/path/to/test.rts.png",
            status="running",
            framebuffer="base64imagedata"
        )
        service.tiles[tile.tile_id] = tile

        result = await service.get_framebuffer("tile-fb")

        assert result["tile_id"] == "tile-fb"
        assert result["data"] == "base64imagedata"
        assert result["width"] == 320
        assert result["height"] == 240


class TestHandleRPCAdvanced:
    """Tests for additional handle_rpc methods."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.mark.asyncio
    async def test_handle_rpc_capture_neural_event(self, service):
        """handle_rpc should handle capture_neural_event method."""
        tile = LiveTileInstance(
            tile_id="tile-rpc",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        tile.metrics = {"cpu": 10, "memory": 128}
        service.tiles[tile.tile_id] = tile

        result = await service.handle_rpc("capture_neural_event", {
            "tile_id": "tile-rpc",
            "shell_tokens": ["test"],
            "broadcast": False
        })

        assert result is not None
        assert result["tile_id"] == "tile-rpc"

    @pytest.mark.asyncio
    async def test_handle_rpc_capture_neural_event_missing_tile(self, service):
        """handle_rpc capture_neural_event should return None for missing tile."""
        result = await service.handle_rpc("capture_neural_event", {
            "tile_id": "nonexistent",
            "shell_tokens": ["test"]
        })

        assert result is None

    @pytest.mark.asyncio
    async def test_handle_rpc_get_collective_context(self, service):
        """handle_rpc should handle get_collective_context method."""
        result = await service.handle_rpc("get_collective_context", {
            "tile_id": "tile-test"
        })

        assert isinstance(result, dict)
        assert "recent_events" in result

    @pytest.mark.asyncio
    async def test_handle_rpc_send_console_input_missing_tile(self, service):
        """handle_rpc send_console_input should handle missing tile."""
        result = await service.handle_rpc("send_console_input", {
            "tile_id": "nonexistent",
            "input": "ls"
        })

        assert result["status"] == "not_found"

    @pytest.mark.asyncio
    async def test_handle_rpc_send_console_input_not_running(self, service):
        """handle_rpc send_console_input should handle stopped tile."""
        tile = LiveTileInstance(
            tile_id="tile-stopped",
            rts_path="/path/to/test.rts.png",
            status="stopped"
        )
        service.tiles[tile.tile_id] = tile

        result = await service.handle_rpc("send_console_input", {
            "tile_id": "tile-stopped",
            "input": "ls"
        })

        assert result["status"] == "not_running"


class TestCalculateTargetFps:
    """Tests for _calculate_target_fps method."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    def test_calculate_fps_background(self, service):
        """Background tiles should have low FPS."""
        tile = LiveTileInstance(
            tile_id="tile-bg",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        tile.focus_state = "background"

        fps = service._calculate_target_fps(tile)
        assert fps == 0.5

    def test_calculate_fps_focused(self, service):
        """Focused tiles should have high FPS."""
        tile = LiveTileInstance(
            tile_id="tile-focus",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        tile.focus_state = "focused"

        fps = service._calculate_target_fps(tile)
        assert fps == 15.0

    def test_calculate_fps_typing_recent_input(self, service):
        """Typing tiles with recent input should have medium-high FPS."""
        import time

        tile = LiveTileInstance(
            tile_id="tile-type",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        tile.focus_state = "typing"
        tile.last_input_time = time.time()

        fps = service._calculate_target_fps(tile)
        assert fps == 10.0

    def test_calculate_fps_typing_no_recent_input(self, service):
        """Typing tiles without recent input should have high FPS."""
        tile = LiveTileInstance(
            tile_id="tile-type",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        tile.focus_state = "typing"
        tile.last_input_time = 0  # Very old

        fps = service._calculate_target_fps(tile)
        assert fps == 15.0

    def test_calculate_fps_idle_recent_input(self, service):
        """Idle tiles with recent input should have medium FPS."""
        import time

        tile = LiveTileInstance(
            tile_id="tile-idle",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        tile.focus_state = "idle"
        tile.last_input_time = time.time()

        fps = service._calculate_target_fps(tile)
        assert fps == 5.0

    def test_calculate_fps_idle_no_recent_input(self, service):
        """Idle tiles without recent input should have low FPS."""
        tile = LiveTileInstance(
            tile_id="tile-idle",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        tile.focus_state = "idle"
        tile.last_input_time = 0

        fps = service._calculate_target_fps(tile)
        assert fps == 1.0


class TestBootTileV3:
    """Tests for boot_tile_v3 method."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.mark.asyncio
    async def test_boot_tile_v3_creates_tile(self, service):
        """boot_tile_v3 should create a v3 format tile."""
        result = await service.boot_tile_v3("tile-v3", "/path/to/test.rts.png")

        assert result["tile_id"] == "tile-v3"
        assert result["status"] == "running"

        tile = service.tiles["tile-v3"]
        assert tile.v3_format is True
        assert tile.status == "running"
        assert tile.boot_time is not None

    @pytest.mark.asyncio
    async def test_boot_tile_v3_already_running(self, service):
        """boot_tile_v3 should return already_running for existing tile."""
        # First boot
        await service.boot_tile_v3("tile-v3-existing", "/path/to/test.rts.png")

        # Second boot attempt
        result = await service.boot_tile_v3("tile-v3-existing", "/path/to/test.rts.png")

        assert result["status"] == "already_running"

    @pytest.mark.asyncio
    async def test_boot_tile_v3_adds_console_output(self, service):
        """boot_tile_v3 should add boot message to console."""
        await service.boot_tile_v3("tile-v3-console", "/path/to/test.rts.png")

        tile = service.tiles["tile-v3-console"]
        assert len(tile.console_output) == 1
        assert "Alpine" in tile.console_output[0]["text"]

    @pytest.mark.asyncio
    async def test_handle_rpc_boot_tile_v3(self, service):
        """handle_rpc should handle boot_tile_v3 method."""
        result = await service.handle_rpc("boot_tile_v3", {
            "tile_id": "tile-rpc-v3",
            "rts_path": "/path/to/test.rts.png"
        })

        assert result["tile_id"] == "tile-rpc-v3"
        assert result["status"] == "running"


class TestOnAlpineOutput:
    """Tests for _on_alpine_output method."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.mark.asyncio
    async def test_on_alpine_output_missing_tile(self, service):
        """_on_alpine_output should handle missing tile."""
        # Should not raise
        await service._on_alpine_output("nonexistent", "output", 0)

    @pytest.mark.asyncio
    async def test_on_alpine_output_no_pending_command(self, service):
        """_on_alpine_output should return early if no pending command."""
        tile = LiveTileInstance(
            tile_id="tile-no-cmd",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        service.tiles[tile.tile_id] = tile

        # Should not raise and should not modify console
        await service._on_alpine_output("tile-no-cmd", "output", 0)

    @pytest.mark.asyncio
    async def test_on_alpine_output_captures_neural_event(self, service):
        """_on_alpine_output should capture neural event for command."""
        tile = LiveTileInstance(
            tile_id="tile-alpine",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        tile._pending_command = "ls -la"
        service.tiles[tile.tile_id] = tile

        # Should capture event and clear pending command
        await service._on_alpine_output("tile-alpine", "file1\nfile2", 0)

        assert tile._pending_command == ""


class TestSendConsoleInputV3:
    """Tests for send_console_input with v3 format."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.mark.asyncio
    async def test_send_console_input_v3_simulates_ls(self, service):
        """send_console_input should simulate ls command in v3."""
        tile = LiveTileInstance(
            tile_id="tile-v3-input",
            rts_path="/path/to/test.rts.png",
            status="running",
            v3_format=True
        )
        service.tiles[tile.tile_id] = tile

        result = await service.send_console_input("tile-v3-input", "ls\n")

        assert result["status"] == "sent"
        # Should have triggered _on_alpine_output which adds console
        # Wait a bit for async
        await asyncio.sleep(0.1)

    @pytest.mark.asyncio
    async def test_send_console_input_v3_simulates_uname(self, service):
        """send_console_input should simulate uname command in v3."""
        tile = LiveTileInstance(
            tile_id="tile-v3-uname",
            rts_path="/path/to/test.rts.png",
            status="running",
            v3_format=True
        )
        service.tiles[tile.tile_id] = tile

        result = await service.send_console_input("tile-v3-uname", "uname -a\n")

        assert result["status"] == "sent"

    @pytest.mark.asyncio
    async def test_send_console_input_updates_focus_state(self, service):
        """send_console_input should update focus_state for v3 tiles."""
        tile = LiveTileInstance(
            tile_id="tile-v3-focus",
            rts_path="/path/to/test.rts.png",
            status="running",
            v3_format=True
        )
        service.tiles[tile.tile_id] = tile

        await service.send_console_input("tile-v3-focus", "test\n")

        assert tile.focus_state == "typing"
        assert tile.last_input_time > 0


class TestCaptureV3Terminal:
    """Tests for _capture_v3_terminal method."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.mark.asyncio
    async def test_capture_v3_terminal_returns_grid(self, service):
        """_capture_v3_terminal should return terminal grid."""
        tile = LiveTileInstance(
            tile_id="tile-terminal",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        # Set some terminal content
        tile.terminal_grid[0][0] = 'H'
        tile.terminal_grid[0][1] = 'i'
        service.tiles[tile.tile_id] = tile

        result = await service._capture_v3_terminal(tile)

        assert result is not None
        assert result[0][0] == 'H'
        assert result[0][1] == 'i'


class TestCloneTileErrors:
    """Tests for clone_tile error handling."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.mark.asyncio
    async def test_clone_tile_transmuter_error(self, service):
        """clone_tile should handle transmuter errors gracefully."""
        tile = LiveTileInstance(
            tile_id="tile-clone-error",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        tile.last_extraction = {
            "widgets": [{"type": "button", "bbox": [0, 0, 10, 10]}]
        }
        service.tiles[tile.tile_id] = tile

        # Mock the transmuter to raise an error
        service._clone_orchestrator.transmuter.transmute = MagicMock(
            side_effect=RuntimeError("Transmutation failed")
        )

        result = await service.clone_tile("tile-clone-error", "test_output")

        assert result["status"] == "failed"
        assert "Transmutation failed" in result["error"]
