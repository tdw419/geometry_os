"""
Shared pytest fixtures for Desktop Agent tests.

This module provides reusable fixtures for testing the desktop agent
components without real X11/display dependencies.

Usage:
    # In test files, import fixtures via conftest.py or directly:
    from tests.conftest_desktop_agent import (
        mock_backend,
        mock_local_backend,
        mock_track_manager,
        mock_track_client,
        mock_subprocess,
        mock_mss,
        mock_pyperclip,
    )

Fixtures:
    - MockBackend: Simple mock for SessionManager tests (async disconnect)
    - MockLocalBackend: Full mock for DesktopAgentService integration tests
    - mock_track_manager: Mock TrackManager for TrackBoardClient tests
    - mock_track_client: Mock TrackBoardClient with AsyncMock methods
    - mock_subprocess: Patched subprocess.run/check_output
    - mock_mss: Mock mss module for screenshot tests
    - mock_pyperclip: Mock pyperclip for clipboard tests
"""

import pytest
import sys
import os
from unittest.mock import AsyncMock, MagicMock, patch
from pathlib import Path

# Add project root to path
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))

# Import types needed for fixtures
from systems.ai_gui.backends.base import (
    InputEvent, InputEventType, ConnectionConfig, WindowInfo, CommandResult
)


# ─────────────────────────────────────────────────────────────
# Mock Backend Classes
# ─────────────────────────────────────────────────────────────

class MockBackend:
    """
    Simple mock backend for SessionManager tests.
    Only implements async disconnect() method.
    """

    def __init__(self):
        self.disconnected = False
        self.disconnect_called_count = 0

    async def disconnect(self) -> bool:
        """Mock disconnect method."""
        self.disconnected = True
        self.disconnect_called_count += 1
        return True


class MockLocalBackend:
    """
    Full mock LocalBackend for integration testing without real X11/display.
    Simulates all LocalBackend methods used by DesktopAgentService.
    """

    def __init__(self):
        self.connected = False
        self.disconnected = False
        self.last_input_event = None
        self.last_command = None
        self.windows = []
        self.focused_window = None
        self.clipboard_text = ""
        self.screenshot_data = b"\x89PNG\r\n\x1a\n" + b"\x00" * 100  # fake PNG
        self._should_fail_input = False
        self._should_fail_command = False
        self._should_fail_screenshot = False
        self._should_fail_connect = False

    async def connect(self, config=None) -> bool:
        """Mock connect - succeeds unless configured to fail."""
        if self._should_fail_connect:
            return False
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

    async def get_clipboard(self) -> str:
        """Mock get_clipboard - returns stored text."""
        return self.clipboard_text

    async def set_clipboard(self, text: str) -> bool:
        """Mock set_clipboard - stores text."""
        self.clipboard_text = text
        return True

    # Stub methods from BaseBackend
    async def spawn(self, config): pass
    async def terminate(self, tile_id: str): pass
    async def health_check(self, tile_id: str): return True


# ─────────────────────────────────────────────────────────────
# SessionManager Fixtures
# ─────────────────────────────────────────────────────────────

@pytest.fixture
def mock_backend():
    """Create a simple MockBackend for SessionManager tests."""
    return MockBackend()


@pytest.fixture
def session_manager():
    """Create a fresh SessionManager instance."""
    from systems.desktop_agent.session_manager import SessionManager
    return SessionManager()


# ─────────────────────────────────────────────────────────────
# DesktopAgentService Fixtures
# ─────────────────────────────────────────────────────────────

@pytest.fixture
def mock_local_backend():
    """Create a fresh MockLocalBackend for integration tests."""
    return MockLocalBackend()


@pytest.fixture
def mock_track_client():
    """Create a mock TrackBoardClient that always claims successfully."""
    mock_client = MagicMock()
    mock_client.is_claimed = True
    mock_client.claim = AsyncMock(return_value=True)
    mock_client.release = AsyncMock(return_value=True)
    return mock_client


@pytest.fixture
def service_with_mock_track(mock_track_client):
    """Create DesktopAgentService with mocked track client."""
    from systems.desktop_agent.service import DesktopAgentService
    service = DesktopAgentService(wp_url=None)
    service.track_client = mock_track_client
    return service


# ─────────────────────────────────────────────────────────────
# TrackBoardClient Fixtures
# ─────────────────────────────────────────────────────────────

@pytest.fixture
def mock_track_manager():
    """Create a mock TrackManager instance."""
    from wordpress_zone.track_manager import TrackManager
    tm = MagicMock(spec=TrackManager)
    tm.claim = MagicMock()
    tm.release = MagicMock()
    tm.heartbeat = MagicMock()
    return tm


@pytest.fixture
def track_client(mock_track_manager):
    """Create a TrackBoardClient with mocked TrackManager."""
    with patch('systems.desktop_agent.safety.track_client.TrackManager', return_value=mock_track_manager):
        from systems.desktop_agent.safety.track_client import TrackBoardClient
        client = TrackBoardClient()
        client.tm = mock_track_manager
        return client


# ─────────────────────────────────────────────────────────────
# Subprocess Mock Fixtures
# ─────────────────────────────────────────────────────────────

@pytest.fixture
def mock_subprocess_run():
    """
    Mock subprocess.run for xdotool commands.
    Returns successful result by default.
    """
    with patch("subprocess.run") as mock_run:
        mock_run.return_value = MagicMock(returncode=0)
        yield mock_run


@pytest.fixture
def mock_subprocess_check_output():
    """
    Mock subprocess.check_output for wmctrl commands.
    Returns empty string by default.
    """
    with patch("subprocess.check_output") as mock_output:
        mock_output.return_value = ""
        yield mock_output


@pytest.fixture
def mock_subprocess():
    """
    Combined mock for both subprocess.run and subprocess.check_output.
    Useful for tests that use both xdotool and wmctrl.
    """
    with patch("subprocess.run") as mock_run, \
         patch("subprocess.check_output") as mock_output:
        mock_run.return_value = MagicMock(returncode=0)
        mock_output.return_value = ""
        yield {"run": mock_run, "check_output": mock_output}


# ─────────────────────────────────────────────────────────────
# Screenshot Mock Fixtures
# ─────────────────────────────────────────────────────────────

@pytest.fixture
def mock_mss():
    """
    Mock mss module for screenshot tests.
    Returns fake PNG data via to_png.
    """
    mock_sct = MagicMock()
    mock_img = MagicMock()
    mock_img.rgb = b"\xff\x00\x00" * 100  # fake pixel data
    mock_img.size = (10, 10)
    mock_sct.grab.return_value = mock_img
    mock_sct.monitors = [{}, {"top": 0, "left": 0, "width": 1920, "height": 1080}]
    mock_sct.close = MagicMock()

    mock_mss_module = MagicMock()
    mock_mss_module.mss.return_value = mock_sct
    mock_mss_module.tools.to_png.return_value = b"png_bytes_data"

    return mock_mss_module, mock_sct


@pytest.fixture
def mock_mss_context():
    """
    Mock mss module already patched for LocalBackend.
    Use with: with mock_mss_context as (mss_module, sct):
    """
    mock_sct = MagicMock()
    mock_img = MagicMock()
    mock_img.rgb = b"\x00\x00\x00"
    mock_img.size = (1, 1)
    mock_sct.grab.return_value = mock_img
    mock_sct.monitors = [{}, {"top": 0, "left": 0, "width": 800, "height": 600}]
    mock_sct.close = MagicMock()

    mock_mss_module = MagicMock()
    mock_mss_module.mss.return_value = mock_sct
    mock_mss_module.tools.to_png.return_value = b"fake_png_data"

    with patch("systems.desktop_agent.backends.local_backend.mss", mock_mss_module):
        yield mock_mss_module, mock_sct


# ─────────────────────────────────────────────────────────────
# Clipboard Mock Fixtures
# ─────────────────────────────────────────────────────────────

@pytest.fixture
def mock_pyperclip():
    """
    Mock pyperclip module for clipboard tests.
    """
    mock_clip = MagicMock()
    mock_clip.paste.return_value = "test clipboard text"
    mock_clip.copy.return_value = None
    return mock_clip


@pytest.fixture
def mock_pyperclip_context():
    """
    Mock pyperclip already patched in sys.modules.
    Use with: with mock_pyperclip_context as clip:
    """
    mock_clip = MagicMock()
    mock_clip.paste.return_value = "test clipboard text"
    mock_clip.copy.return_value = None

    with patch.dict("sys.modules", {"pyperclip": mock_clip}):
        yield mock_clip


# ─────────────────────────────────────────────────────────────
# Test Data Fixtures
# ─────────────────────────────────────────────────────────────

@pytest.fixture
def sample_windows():
    """Sample window list for testing."""
    return [
        WindowInfo(id="0x001", title="Terminal", app_name="terminal", x=0, y=0, width=800, height=600),
        WindowInfo(id="0x002", title="Browser", app_name="firefox", x=100, y=100, width=1024, height=768),
        WindowInfo(id="0x003", title="Editor", app_name="code", x=200, y=200, width=1200, height=900),
    ]


@pytest.fixture
def sample_input_events():
    """Sample input events for testing."""
    return {
        "key_a": InputEvent(type=InputEventType.KEY, keys="A"),
        "key_ctrl_s": InputEvent(type=InputEventType.KEY, keys="Ctrl+S"),
        "mouse_click": InputEvent(type=InputEventType.MOUSE, x=100, y=200, button=1),
        "mouse_move": InputEvent(type=InputEventType.MOUSE, x=150, y=250),
        "text": InputEvent(type=InputEventType.TEXT, text="Hello World"),
    }


@pytest.fixture
def sample_wmctrl_output():
    """Sample wmctrl -l -G -p -x output."""
    return """0x02400003 0 1234 100 200 800 600 hostname firefox.Firefox Firefox Browser
0x02400004 0 5678 0 0 1024 768 hostname terminal.Terminal Terminal
0x02400005 0 9012 300 400 640 480 hostname code.Code VS Code"""


# ─────────────────────────────────────────────────────────────
# Async Test Configuration
# ─────────────────────────────────────────────────────────────

@pytest.fixture
def event_loop_policy():
    """Default event loop policy for async tests."""
    import asyncio
    return asyncio.DefaultEventLoopPolicy()


# ─────────────────────────────────────────────────────────────
# Cleanup Fixtures
# ─────────────────────────────────────────────────────────────

@pytest.fixture(autouse=True)
def cleanup_desktop_agent_state():
    """
    Auto-cleanup fixture to reset global state between tests.
    Ensures test isolation for SessionManager singleton-like patterns.
    """
    yield
    # Cleanup happens after each test
    # Reset any global state if needed
