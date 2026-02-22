"""
Integration tests for DesktopAgentService - Main orchestrator.
Tests the full service flow with mocked LocalBackend and track client.
Covers connect/disconnect lifecycle, screenshot, input handling with safety,
command execution with safety, and window management.
"""

import pytest
import asyncio
import base64
import sys
import os
import subprocess
from unittest.mock import AsyncMock, MagicMock, patch

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from systems.desktop_agent.service import DesktopAgentService
from systems.desktop_agent.errors import ErrorCode
from systems.ai_gui.backends.base import (
    InputEvent, InputEventType, ConnectionConfig, WindowInfo, CommandResult
)


class MockLocalBackend:
    """
    Mock LocalBackend for integration testing without real X11/display.
    Simulates all LocalBackend methods.
    """

    def __init__(self):
        self.connected = False
        self.disconnected = False
        self.last_input_event = None
        self.last_command = None
        self.windows = []
        self.focused_window = None
        self.screenshot_data = b"\x89PNG\r\n\x1a\n" + b"\x00" * 100  # fake PNG
        self._should_fail_input = False
        self._should_fail_command = False
        self._should_fail_screenshot = False

    async def connect(self, config=None) -> bool:
        """Mock connect - always succeeds."""
        self.connected = True
        return True

    async def disconnect(self) -> bool:
        """Mock disconnect."""
        self.disconnected = True
        self.connected = False
        return True

    async def send_input(self, tile_id: str, event: InputEvent) -> bool:
        """Mock send_input - records event."""
        if self._should_fail_input:
            return False
        self.last_input_event = event
        return True

    async def capture_frame(self, tile_id: str = "root") -> bytes:
        """Mock capture_frame - returns fake PNG bytes."""
        if self._should_fail_screenshot:
            raise Exception("Screenshot failed")
        return self.screenshot_data

    async def get_windows(self) -> list:
        """Mock get_windows - returns test window list."""
        return self.windows

    async def focus_window(self, window_id: str) -> bool:
        """Mock focus_window."""
        self.focused_window = window_id
        return True

    async def exec_command(self, cmd: str, timeout: float = 30.0) -> CommandResult:
        """Mock exec_command - records command and returns result."""
        self.last_command = cmd
        if self._should_fail_command:
            raise Exception("Command failed")
        return CommandResult(
            stdout=f"output of: {cmd}",
            stderr="",
            exit_code=0,
            duration=0.1
        )

    # Stub methods from BaseBackend
    async def spawn(self, config): pass
    async def terminate(self, tile_id: str): pass
    async def health_check(self, tile_id: str): return True


@pytest.fixture
def mock_track_client():
    """Create a mock TrackBoardClient that always claims successfully."""
    mock_client = MagicMock()
    mock_client.is_claimed = True
    mock_client.claim = AsyncMock(return_value=True)
    mock_client.release = AsyncMock(return_value=True)
    return mock_client


@pytest.fixture
def mock_backend():
    """Create a fresh MockLocalBackend for each test."""
    return MockLocalBackend()


@pytest.fixture
def service_with_mock_track(mock_track_client):
    """Create DesktopAgentService with mocked track client."""
    service = DesktopAgentService(wp_url=None)
    service.track_client = mock_track_client
    return service


class TestConnectDisconnectLifecycle:
    """Test connect and disconnect lifecycle."""

    @pytest.mark.asyncio
    async def test_connect_creates_session(self, service_with_mock_track):
        """Connect creates a new session successfully."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            result = await service_with_mock_track.connect("local")

        assert result["success"] is True
        assert "session_id" in result
        assert result["backend"] == "local"

    @pytest.mark.asyncio
    async def test_connect_unsupported_backend(self, service_with_mock_track):
        """Connect returns error for unsupported backend type."""
        result = await service_with_mock_track.connect("vnc")

        assert result["success"] is False
        assert result["code"] == ErrorCode.UNSUPPORTED_BACKEND
        assert "Unsupported backend" in result["error"]

    @pytest.mark.asyncio
    async def test_connect_backend_failure(self, service_with_mock_track):
        """Connect returns error when backend.connect fails."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            mock_backend.connected = False

            async def fail_connect(config):
                return False
            mock_backend.connect = fail_connect
            MockBackend.return_value = mock_backend

            result = await service_with_mock_track.connect("local")

        assert result["success"] is False
        assert result["code"] == ErrorCode.BACKEND_CONNECT_FAILED

    @pytest.mark.asyncio
    async def test_disconnect_destroys_session(self, service_with_mock_track):
        """Disconnect destroys an existing session."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            # First connect
            connect_result = await service_with_mock_track.connect("local")
            session_id = connect_result["session_id"]

            # Then disconnect
            disconnect_result = await service_with_mock_track.disconnect(session_id)

        assert disconnect_result["success"] is True

    @pytest.mark.asyncio
    async def test_disconnect_nonexistent_session(self, service_with_mock_track):
        """Disconnect returns error for nonexistent session."""
        result = await service_with_mock_track.disconnect("nonexistent-id")

        assert result["success"] is False
        assert result["code"] == ErrorCode.SESSION_NOT_FOUND
        assert "Session not found" in result["error"]


class TestScreenshotCapture:
    """Test screenshot capture functionality."""

    @pytest.mark.asyncio
    async def test_screenshot_returns_base64_image(self, service_with_mock_track):
        """Screenshot returns base64-encoded image."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            connect_result = await service_with_mock_track.connect("local")
            session_id = connect_result["session_id"]

            result = await service_with_mock_track.screenshot(session_id)

        assert result["success"] is True
        assert "image" in result
        # Verify it's valid base64
        decoded = base64.b64decode(result["image"])
        assert decoded == mock_backend.screenshot_data

    @pytest.mark.asyncio
    async def test_screenshot_nonexistent_session(self, service_with_mock_track):
        """Screenshot returns error for nonexistent session."""
        result = await service_with_mock_track.screenshot("nonexistent-id")

        assert result["success"] is False
        assert result["code"] == ErrorCode.SESSION_NOT_FOUND

    @pytest.mark.asyncio
    async def test_screenshot_handles_exception(self, service_with_mock_track):
        """Screenshot handles exceptions gracefully."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            mock_backend._should_fail_screenshot = True
            MockBackend.return_value = mock_backend

            connect_result = await service_with_mock_track.connect("local")
            session_id = connect_result["session_id"]

            result = await service_with_mock_track.screenshot(session_id)

        assert result["success"] is False
        assert result["code"] == ErrorCode.CAPTURE_FAILED


class TestInputHandlingWithSafety:
    """Test input handling with safety validation."""

    @pytest.fixture
    def service_with_session(self, service_with_mock_track):
        """Helper to create service with connected session."""
        return service_with_mock_track

    @pytest.mark.asyncio
    async def test_send_input_safe_keys(self, service_with_session):
        """Send input allows safe key combinations."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            connect_result = await service_with_session.connect("local")
            session_id = connect_result["session_id"]

            event_data = {"type": "key", "keys": "Ctrl+S"}
            result = await service_with_session.send_input(session_id, event_data)

        assert result["success"] is True
        assert mock_backend.last_input_event is not None
        assert mock_backend.last_input_event.keys == "Ctrl+S"

    @pytest.mark.asyncio
    async def test_send_input_blocked_key(self, service_with_session):
        """Send input rejects blocked keys."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            connect_result = await service_with_session.connect("local")
            session_id = connect_result["session_id"]

            event_data = {"type": "key", "keys": "Sys_Req"}
            result = await service_with_session.send_input(session_id, event_data)

        assert result["success"] is False
        assert result["code"] == ErrorCode.BLOCKED_KEY
        assert mock_backend.last_input_event is None  # Never sent to backend

    @pytest.mark.asyncio
    async def test_send_input_blocked_combo(self, service_with_session):
        """Send input rejects blocked key combinations."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            connect_result = await service_with_session.connect("local")
            session_id = connect_result["session_id"]

            event_data = {"type": "key", "keys": "Ctrl+Alt+Delete"}
            result = await service_with_session.send_input(session_id, event_data)

        assert result["success"] is False
        assert result["code"] == ErrorCode.BLOCKED_COMBO

    @pytest.mark.asyncio
    async def test_send_input_mouse_event(self, service_with_session):
        """Send input handles mouse events."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            connect_result = await service_with_session.connect("local")
            session_id = connect_result["session_id"]

            event_data = {"type": "mouse", "x": 100, "y": 200, "button": 1}
            result = await service_with_session.send_input(session_id, event_data)

        assert result["success"] is True
        assert mock_backend.last_input_event.x == 100
        assert mock_backend.last_input_event.y == 200

    @pytest.mark.asyncio
    async def test_send_input_nonexistent_session(self, service_with_session):
        """Send input returns error for nonexistent session."""
        event_data = {"type": "key", "keys": "A"}
        result = await service_with_session.send_input("nonexistent-id", event_data)

        assert result["success"] is False
        assert result["code"] == ErrorCode.SESSION_NOT_FOUND

    @pytest.mark.asyncio
    async def test_send_input_backend_failure(self, service_with_session):
        """Send input handles backend failure."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            mock_backend._should_fail_input = True
            MockBackend.return_value = mock_backend

            connect_result = await service_with_session.connect("local")
            session_id = connect_result["session_id"]

            event_data = {"type": "key", "keys": "A"}
            result = await service_with_session.send_input(session_id, event_data)

        assert result["success"] is False
        assert result["code"] == ErrorCode.BACKEND_ERROR


class TestCommandExecutionWithSafety:
    """Test command execution with safety validation."""

    @pytest.mark.asyncio
    async def test_exec_command_safe_command(self, service_with_mock_track):
        """Exec command allows safe commands."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            connect_result = await service_with_mock_track.connect("local")
            session_id = connect_result["session_id"]

            result = await service_with_mock_track.exec_command(session_id, "ls -la")

        assert result["success"] is True
        assert result["exit_code"] == 0
        assert mock_backend.last_command == "ls -la"

    @pytest.mark.asyncio
    async def test_exec_command_blocked_command(self, service_with_mock_track):
        """Exec command rejects dangerous commands."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            connect_result = await service_with_mock_track.connect("local")
            session_id = connect_result["session_id"]

            result = await service_with_mock_track.exec_command(session_id, "rm -rf /")

        assert result["success"] is False
        assert result["code"] == ErrorCode.BLOCKED_COMMAND
        assert mock_backend.last_command is None  # Never sent to backend

    @pytest.mark.asyncio
    async def test_exec_command_blocked_reboot(self, service_with_mock_track):
        """Exec command rejects reboot command."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            connect_result = await service_with_mock_track.connect("local")
            session_id = connect_result["session_id"]

            result = await service_with_mock_track.exec_command(session_id, "reboot")

        assert result["success"] is False
        assert result["code"] == ErrorCode.BLOCKED_COMMAND

    @pytest.mark.asyncio
    async def test_exec_command_nonexistent_session(self, service_with_mock_track):
        """Exec command returns error for nonexistent session."""
        result = await service_with_mock_track.exec_command("nonexistent-id", "ls")

        assert result["success"] is False
        assert result["code"] == ErrorCode.SESSION_NOT_FOUND

    @pytest.mark.asyncio
    async def test_exec_command_backend_exception(self, service_with_mock_track):
        """Exec command handles backend exceptions."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            mock_backend._should_fail_command = True
            MockBackend.return_value = mock_backend

            connect_result = await service_with_mock_track.connect("local")
            session_id = connect_result["session_id"]

            result = await service_with_mock_track.exec_command(session_id, "ls")

        assert result["success"] is False
        assert result["code"] == ErrorCode.COMMAND_FAILED


class TestWindowManagement:
    """Test window management functionality."""

    @pytest.mark.asyncio
    async def test_list_windows(self, service_with_mock_track):
        """List windows returns window list."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            mock_backend.windows = [
                WindowInfo(id="0x001", title="Terminal", app_name="terminal", x=0, y=0, width=800, height=600),
                WindowInfo(id="0x002", title="Browser", app_name="firefox", x=100, y=100, width=1024, height=768),
            ]
            MockBackend.return_value = mock_backend

            connect_result = await service_with_mock_track.connect("local")
            session_id = connect_result["session_id"]

            result = await service_with_mock_track.list_windows(session_id)

        assert result["success"] is True
        assert len(result["windows"]) == 2
        assert result["windows"][0]["title"] == "Terminal"
        assert result["windows"][1]["title"] == "Browser"

    @pytest.mark.asyncio
    async def test_list_windows_empty(self, service_with_mock_track):
        """List windows returns empty list when no windows."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            mock_backend.windows = []
            MockBackend.return_value = mock_backend

            connect_result = await service_with_mock_track.connect("local")
            session_id = connect_result["session_id"]

            result = await service_with_mock_track.list_windows(session_id)

        assert result["success"] is True
        assert result["windows"] == []

    @pytest.mark.asyncio
    async def test_list_windows_nonexistent_session(self, service_with_mock_track):
        """List windows returns error for nonexistent session."""
        result = await service_with_mock_track.list_windows("nonexistent-id")

        assert result["success"] is False
        assert result["code"] == ErrorCode.SESSION_NOT_FOUND

    @pytest.mark.asyncio
    async def test_focus_window(self, service_with_mock_track):
        """Focus window focuses specific window."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            connect_result = await service_with_mock_track.connect("local")
            session_id = connect_result["session_id"]

            result = await service_with_mock_track.focus_window(session_id, "0x001")

        assert result["success"] is True
        assert mock_backend.focused_window == "0x001"

    @pytest.mark.asyncio
    async def test_focus_window_nonexistent_session(self, service_with_mock_track):
        """Focus window returns error for nonexistent session."""
        result = await service_with_mock_track.focus_window("nonexistent-id", "0x001")

        assert result["success"] is False
        assert result["code"] == ErrorCode.SESSION_NOT_FOUND

    @pytest.mark.asyncio
    async def test_focus_window_backend_failure(self, service_with_mock_track):
        """Focus window handles backend failure."""
        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()

            async def fail_focus(window_id):
                return False
            mock_backend.focus_window = fail_focus
            MockBackend.return_value = mock_backend

            connect_result = await service_with_mock_track.connect("local")
            session_id = connect_result["session_id"]

            result = await service_with_mock_track.focus_window(session_id, "0x001")

        assert result["success"] is False
        assert result["code"] == ErrorCode.FOCUS_FAILED


class TestTrackClientIntegration:
    """Test track client integration in service."""

    @pytest.mark.asyncio
    async def test_connect_claims_track_if_not_claimed(self):
        """Connect claims track if not already claimed."""
        mock_track = MagicMock()
        mock_track.is_claimed = False
        mock_track.claim = AsyncMock(return_value=True)

        service = DesktopAgentService()
        service.track_client = mock_track

        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            await service.connect("local")

        mock_track.claim.assert_called_once()

    @pytest.mark.asyncio
    async def test_connect_skips_claim_if_already_claimed(self):
        """Connect skips claim if track already claimed."""
        mock_track = MagicMock()
        mock_track.is_claimed = True
        mock_track.claim = AsyncMock(return_value=True)

        service = DesktopAgentService()
        service.track_client = mock_track

        with patch("systems.desktop_agent.service.LocalBackend") as MockBackend:
            mock_backend = MockLocalBackend()
            MockBackend.return_value = mock_backend

            await service.connect("local")

        mock_track.claim.assert_not_called()

    @pytest.mark.asyncio
    async def test_connect_fails_if_claim_fails(self):
        """Connect fails if track claim fails."""
        mock_track = MagicMock()
        mock_track.is_claimed = False
        mock_track.claim = AsyncMock(return_value=False)

        service = DesktopAgentService()
        service.track_client = mock_track

        result = await service.connect("local")

        assert result["success"] is False
        assert result["code"] == ErrorCode.TRACK_CONFLICT


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
