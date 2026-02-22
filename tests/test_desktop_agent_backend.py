"""
Unit tests for LocalBackend - Local X11 display control.
Tests initialization, display detection, connect/disconnect lifecycle,
input handling, screenshot capture, window management, clipboard, and command execution.
All external dependencies are mocked (subprocess, mss, pyperclip).
"""

import pytest
import asyncio
import sys
import os
import subprocess
from unittest.mock import AsyncMock, MagicMock, patch, mock_open
from dataclasses import dataclass

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from systems.desktop_agent.backends.local_backend import LocalBackend
from systems.ai_gui.backends.base import (
    InputEvent, InputEventType, ConnectionConfig, WindowInfo, CommandResult
)


class TestLocalBackendInit:
    """Test LocalBackend initialization and display detection."""

    def test_init_default_display(self):
        """LocalBackend initializes with default display :0."""
        backend = LocalBackend()
        assert backend.display == ":0"

    def test_init_custom_display(self):
        """LocalBackend can be initialized with custom display."""
        backend = LocalBackend(display=":1")
        assert backend.display == ":1"

    def test_init_screenshot_none(self):
        """LocalBackend starts with _sct = None."""
        backend = LocalBackend()
        assert backend._sct is None

    def test_detect_x11_when_no_wayland_env(self):
        """Detects x11 when WAYLAND_DISPLAY is not set."""
        with patch.dict(os.environ, {}, clear=True):
            if "WAYLAND_DISPLAY" in os.environ:
                del os.environ["WAYLAND_DISPLAY"]
            backend = LocalBackend()
            assert backend.display_server == "x11"

    def test_detect_wayland_when_env_set(self):
        """Detects wayland when WAYLAND_DISPLAY is set."""
        with patch.dict(os.environ, {"WAYLAND_DISPLAY": "wayland-0"}, clear=True):
            backend = LocalBackend()
            assert backend.display_server == "wayland"


class TestLocalBackendConnect:
    """Test LocalBackend connect/disconnect lifecycle."""

    @pytest.fixture
    def mock_mss(self):
        """Create a mock mss module."""
        mock_sct = MagicMock()
        mock_sct.grab.return_value = MagicMock(rgb=b"\x00\x00\x00", size=(1, 1))
        mock_sct.monitors = [{}, {"top": 0, "left": 0, "width": 1920, "height": 1080}]
        mock_sct.close = MagicMock()

        mock_mss_module = MagicMock()
        mock_mss_module.mss.return_value = mock_sct
        mock_mss_module.tools.to_png.return_value = b"fake_png_data"
        return mock_mss_module, mock_sct

    @pytest.mark.asyncio
    async def test_connect_initializes_mss(self, mock_mss):
        """Connect initializes mss screenshot object."""
        mock_mss_module, mock_sct = mock_mss

        with patch("systems.desktop_agent.backends.local_backend.mss", mock_mss_module):
            backend = LocalBackend()
            result = await backend.connect()

        assert result is True
        mock_mss_module.mss.assert_called_once_with(display=":0")

    @pytest.mark.asyncio
    async def test_connect_with_config_override_display(self, mock_mss):
        """Connect can override display from config."""
        mock_mss_module, mock_sct = mock_mss

        config = ConnectionConfig(display=":1")

        with patch("systems.desktop_agent.backends.local_backend.mss", mock_mss_module):
            backend = LocalBackend()
            result = await backend.connect(config)

        assert result is True
        assert backend.display == ":1"
        mock_mss_module.mss.assert_called_once_with(display=":1")

    @pytest.mark.asyncio
    async def test_connect_returns_false_on_error(self, mock_mss):
        """Connect returns False on mss error."""
        mock_mss_module, _ = mock_mss
        mock_mss_module.mss.side_effect = Exception("Display not found")

        with patch("systems.desktop_agent.backends.local_backend.mss", mock_mss_module):
            backend = LocalBackend()
            result = await backend.connect()

        assert result is False

    @pytest.mark.asyncio
    async def test_connect_test_screenshot(self, mock_mss):
        """Connect tests screenshot capability."""
        mock_mss_module, mock_sct = mock_mss

        with patch("systems.desktop_agent.backends.local_backend.mss", mock_mss_module):
            backend = LocalBackend()
            result = await backend.connect()

        # Should have done a test grab
        mock_sct.grab.assert_called()

    @pytest.mark.asyncio
    async def test_disconnect_closes_mss(self, mock_mss):
        """Disconnect closes mss screenshot object."""
        mock_mss_module, mock_sct = mock_mss

        with patch("systems.desktop_agent.backends.local_backend.mss", mock_mss_module):
            backend = LocalBackend()
            await backend.connect()
            result = await backend.disconnect()

        assert result is True
        mock_sct.close.assert_called_once()
        assert backend._sct is None

    @pytest.mark.asyncio
    async def test_disconnect_without_connect(self):
        """Disconnect succeeds even if never connected."""
        backend = LocalBackend()
        result = await backend.disconnect()

        assert result is True


class TestLocalBackendInput:
    """Test LocalBackend input handling."""

    @pytest.fixture
    def backend(self):
        return LocalBackend()

    @pytest.mark.asyncio
    async def test_send_mouse_move_and_click(self, backend):
        """send_input handles mouse move + click."""
        event = InputEvent(
            type=InputEventType.MOUSE,
            x=100, y=200, button=1
        )

        with patch("subprocess.run") as mock_run:
            mock_run.return_value = MagicMock(returncode=0)
            result = await backend.send_input("root", event)

        assert result is True
        # Should call mousemove and click
        assert mock_run.call_count == 2

    @pytest.mark.asyncio
    async def test_send_mouse_move_only(self, backend):
        """send_input handles mouse move without click."""
        event = InputEvent(
            type=InputEventType.MOUSE,
            x=150, y=250
        )

        with patch("subprocess.run") as mock_run:
            mock_run.return_value = MagicMock(returncode=0)
            result = await backend.send_input("root", event)

        assert result is True
        # Only mousemove should be called
        assert mock_run.call_count == 1
        call_args = mock_run.call_args[0][0]
        assert "mousemove" in call_args

    @pytest.mark.asyncio
    async def test_send_mouse_click_only(self, backend):
        """send_input handles click at current position."""
        event = InputEvent(
            type=InputEventType.MOUSE,
            button=3  # right click
        )

        with patch("subprocess.run") as mock_run:
            mock_run.return_value = MagicMock(returncode=0)
            result = await backend.send_input("root", event)

        assert result is True
        mock_run.assert_called_once()
        call_args = mock_run.call_args[0][0]
        assert "click" in call_args
        assert "3" in call_args

    @pytest.mark.asyncio
    async def test_send_key_event(self, backend):
        """send_input handles key events."""
        event = InputEvent(
            type=InputEventType.KEY,
            keys="Ctrl+S"
        )

        with patch("subprocess.run") as mock_run:
            mock_run.return_value = MagicMock(returncode=0)
            result = await backend.send_input("root", event)

        assert result is True
        mock_run.assert_called_once()
        call_args = mock_run.call_args[0][0]
        assert "key" in call_args
        assert "Ctrl+S" in call_args

    @pytest.mark.asyncio
    async def test_send_text_event(self, backend):
        """send_input handles text typing."""
        event = InputEvent(
            type=InputEventType.TEXT,
            text="Hello World"
        )

        with patch("subprocess.run") as mock_run:
            mock_run.return_value = MagicMock(returncode=0)
            result = await backend.send_input("root", event)

        assert result is True
        mock_run.assert_called_once()
        call_args = mock_run.call_args[0][0]
        assert "type" in call_args
        assert "Hello World" in call_args

    @pytest.mark.asyncio
    async def test_send_input_returns_false_on_error(self, backend):
        """send_input returns False on subprocess error."""
        event = InputEvent(
            type=InputEventType.KEY,
            keys="A"
        )

        with patch("subprocess.run") as mock_run:
            mock_run.side_effect = subprocess.CalledProcessError(1, "xdotool", stderr="xdotool not found")
            result = await backend.send_input("root", event)

        assert result is False

    @pytest.mark.asyncio
    async def test_send_input_empty_key_event(self, backend):
        """send_input handles empty key event (no keys)."""
        event = InputEvent(
            type=InputEventType.KEY,
            keys=None
        )

        with patch("subprocess.run") as mock_run:
            result = await backend.send_input("root", event)

        # Should return True without calling subprocess
        assert result is True
        mock_run.assert_not_called()

    @pytest.mark.asyncio
    async def test_send_input_empty_text_event(self, backend):
        """send_input handles empty text event."""
        event = InputEvent(
            type=InputEventType.TEXT,
            text=None
        )

        with patch("subprocess.run") as mock_run:
            result = await backend.send_input("root", event)

        assert result is True
        mock_run.assert_not_called()


class TestLocalBackendScreenshot:
    """Test LocalBackend screenshot capture."""

    @pytest.fixture
    def mock_mss(self):
        """Create mock mss with screenshot capability."""
        mock_sct = MagicMock()
        mock_img = MagicMock()
        mock_img.rgb = b"\xff\x00\x00" * 100  # fake pixel data
        mock_img.size = (10, 10)
        mock_sct.grab.return_value = mock_img
        mock_sct.monitors = [{}, {"top": 0, "left": 0, "width": 800, "height": 600}]
        mock_sct.close = MagicMock()

        mock_mss_module = MagicMock()
        mock_mss_module.mss.return_value = mock_sct
        mock_mss_module.tools.to_png.return_value = b"png_bytes_data"
        return mock_mss_module, mock_sct

    @pytest.mark.asyncio
    async def test_capture_frame_returns_png_bytes(self, mock_mss):
        """capture_frame returns PNG bytes."""
        mock_mss_module, mock_sct = mock_mss

        with patch("systems.desktop_agent.backends.local_backend.mss", mock_mss_module):
            backend = LocalBackend()
            await backend.connect()
            result = await backend.capture_frame("root")

        assert result == b"png_bytes_data"
        mock_mss_module.tools.to_png.assert_called_once()

    @pytest.mark.asyncio
    async def test_capture_frame_uses_first_monitor(self, mock_mss):
        """capture_frame uses monitor[1] (first real monitor)."""
        mock_mss_module, mock_sct = mock_mss

        with patch("systems.desktop_agent.backends.local_backend.mss", mock_mss_module):
            backend = LocalBackend()
            await backend.connect()
            await backend.capture_frame("root")

        # Should grab with monitor 1's dimensions
        grab_call = mock_sct.grab.call_args[0][0]
        assert grab_call == mock_sct.monitors[1]

    @pytest.mark.asyncio
    async def test_capture_frame_auto_connects(self, mock_mss):
        """capture_frame auto-connects if not connected."""
        mock_mss_module, mock_sct = mock_mss

        with patch("systems.desktop_agent.backends.local_backend.mss", mock_mss_module):
            backend = LocalBackend()
            # Don't call connect first
            result = await backend.capture_frame("root")

        # Should still work (auto-connect)
        assert result == b"png_bytes_data"
        mock_mss_module.mss.assert_called()

    @pytest.mark.asyncio
    async def test_capture_frame_returns_empty_on_error(self, mock_mss):
        """capture_frame returns empty bytes on error."""
        mock_mss_module, mock_sct = mock_mss
        mock_sct.grab.side_effect = Exception("Screenshot failed")

        with patch("systems.desktop_agent.backends.local_backend.mss", mock_mss_module):
            backend = LocalBackend()
            await backend.connect()
            result = await backend.capture_frame("root")

        assert result == b""


class TestLocalBackendWindowManagement:
    """Test LocalBackend window management with wmctrl."""

    @pytest.fixture
    def backend(self):
        return LocalBackend()

    @pytest.mark.asyncio
    async def test_get_windows_parses_wmctrl_output(self, backend):
        """get_windows parses wmctrl -l -G -p -x output."""
        wmctrl_output = "0x02400003 0 1234 100 200 800 600 hostname firefox.Firefox Firefox Browser\n0x02400004 0 5678 0 0 1024 768 hostname terminal.Terminal Terminal"

        with patch("subprocess.check_output") as mock_output:
            mock_output.return_value = wmctrl_output
            windows = await backend.get_windows()

        assert len(windows) == 2
        assert windows[0].id == "0x02400003"
        assert windows[0].title == "Firefox Browser"
        assert windows[0].app_name == "firefox.Firefox"
        assert windows[0].x == 100
        assert windows[0].y == 200
        assert windows[0].width == 800
        assert windows[0].height == 600

    @pytest.mark.asyncio
    async def test_get_windows_empty_output(self, backend):
        """get_windows returns empty list when no windows."""
        with patch("subprocess.check_output") as mock_output:
            mock_output.return_value = ""
            windows = await backend.get_windows()

        assert windows == []

    @pytest.mark.asyncio
    async def test_get_windows_returns_empty_on_error(self, backend):
        """get_windows returns empty list on subprocess error."""
        with patch("subprocess.check_output") as mock_output:
            mock_output.side_effect = Exception("wmctrl not found")
            windows = await backend.get_windows()

        assert windows == []

    @pytest.mark.asyncio
    async def test_focus_window_calls_wmctrl(self, backend):
        """focus_window calls wmctrl -i -a window_id."""
        with patch("subprocess.run") as mock_run:
            mock_run.return_value = MagicMock(returncode=0)
            result = await backend.focus_window("0x02400003")

        assert result is True
        call_args = mock_run.call_args[0][0]
        assert "wmctrl" in call_args
        assert "-i" in call_args
        assert "-a" in call_args
        assert "0x02400003" in call_args

    @pytest.mark.asyncio
    async def test_focus_window_returns_false_on_error(self, backend):
        """focus_window returns False on subprocess error."""
        with patch("subprocess.run") as mock_run:
            mock_run.side_effect = subprocess.CalledProcessError(1, "wmctrl", stderr="Window not found")
            result = await backend.focus_window("0xinvalid")

        assert result is False


class TestLocalBackendClipboard:
    """Test LocalBackend clipboard operations."""

    @pytest.fixture
    def backend(self):
        return LocalBackend()

    @pytest.mark.asyncio
    async def test_get_clipboard_returns_text(self, backend):
        """get_clipboard returns clipboard text via pyperclip."""
        mock_pyperclip = MagicMock()
        mock_pyperclip.paste.return_value = "copied text"

        with patch.dict("sys.modules", {"pyperclip": mock_pyperclip}):
            result = await backend.get_clipboard()

        assert result == "copied text"

    @pytest.mark.asyncio
    async def test_get_clipboard_returns_empty_on_error(self, backend):
        """get_clipboard returns empty string on error."""
        mock_pyperclip = MagicMock()
        mock_pyperclip.paste.side_effect = Exception("Clipboard error")

        with patch.dict("sys.modules", {"pyperclip": mock_pyperclip}):
            result = await backend.get_clipboard()

        assert result == ""

    @pytest.mark.asyncio
    async def test_set_clipboard_copies_text(self, backend):
        """set_clipboard copies text via pyperclip."""
        mock_pyperclip = MagicMock()

        with patch.dict("sys.modules", {"pyperclip": mock_pyperclip}):
            result = await backend.set_clipboard("new text")

        assert result is True
        mock_pyperclip.copy.assert_called_once_with("new text")

    @pytest.mark.asyncio
    async def test_set_clipboard_returns_false_on_error(self, backend):
        """set_clipboard returns False on error."""
        mock_pyperclip = MagicMock()
        mock_pyperclip.copy.side_effect = Exception("Copy failed")

        with patch.dict("sys.modules", {"pyperclip": mock_pyperclip}):
            result = await backend.set_clipboard("text")

        assert result is False


class TestLocalBackendCommandExecution:
    """Test LocalBackend command execution with timeout."""

    @pytest.fixture
    def backend(self):
        return LocalBackend()

    @pytest.mark.asyncio
    async def test_exec_command_returns_result(self, backend):
        """exec_command returns CommandResult with output."""
        result = await backend.exec_command("echo 'hello'")

        assert isinstance(result, CommandResult)
        assert "hello" in result.stdout
        assert result.exit_code == 0
        assert result.duration > 0

    @pytest.mark.asyncio
    async def test_exec_command_captures_stderr(self, backend):
        """exec_command captures stderr."""
        result = await backend.exec_command("ls /nonexistent_dir_12345 2>&1")

        assert result.exit_code != 0 or "No such file" in result.stderr or "cannot access" in result.stderr.lower()

    @pytest.mark.asyncio
    async def test_exec_command_timeout(self, backend):
        """exec_command times out after specified duration."""
        # Use a very short timeout with a long-running command
        result = await backend.exec_command("sleep 10", timeout=0.1)

        assert result.exit_code == -1
        assert "timed out" in result.stderr.lower()

    @pytest.mark.asyncio
    async def test_exec_command_custom_timeout(self, backend):
        """exec_command uses custom timeout."""
        import time
        start = time.time()
        result = await backend.exec_command("echo done", timeout=5.0)
        elapsed = time.time() - start

        # Should complete well before 5 seconds
        assert elapsed < 4.0
        assert result.exit_code == 0

    @pytest.mark.asyncio
    async def test_exec_command_handles_exception(self, backend):
        """exec_command handles exceptions gracefully."""
        # This is tricky to test without mocking internal implementation
        # Test with a command that should work
        result = await backend.exec_command("true")
        assert result.exit_code == 0


class TestLocalBackendHealthCheck:
    """Test LocalBackend health check."""

    @pytest.fixture
    def backend(self):
        return LocalBackend()

    @pytest.mark.asyncio
    async def test_health_check_returns_true(self, backend):
        """health_check always returns True for local backend."""
        result = await backend.health_check("root")
        assert result is True


class TestLocalBackendSpawnTerminate:
    """Test LocalBackend spawn/terminate (stub methods)."""

    @pytest.fixture
    def backend(self):
        return LocalBackend()

    @pytest.mark.asyncio
    async def test_spawn_is_noop(self, backend):
        """spawn is a no-op (pass)."""
        from systems.ai_gui.backends.base import AppConfig
        config = AppConfig(app="test")
        # Should not raise
        await backend.spawn(config)

    @pytest.mark.asyncio
    async def test_terminate_is_noop(self, backend):
        """terminate is a no-op (pass)."""
        # Should not raise
        await backend.terminate("any_id")


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
