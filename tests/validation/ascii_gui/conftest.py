"""
Shared fixtures for ASCII GUI validation tests.
"""

import pytest
import tempfile
from pathlib import Path
import asyncio
from datetime import datetime

from systems.visual_shell.ascii_gui import (
    GUIFragmentRenderer,
    GUICommandProcessor,
    GUIHookBroadcaster,
    Window,
    WindowType,
    Command,
)


@pytest.fixture
def temp_gui_dirs():
    """Create temporary GUI directories for testing."""
    with tempfile.TemporaryDirectory() as d:
        root = Path(d)
        fragments = root / "fragments"
        pending = root / "commands" / "pending"
        completed = root / "commands" / "completed"

        fragments.mkdir(parents=True)
        pending.mkdir(parents=True)
        completed.mkdir(parents=True)

        yield {
            "root": root,
            "fragments": fragments,
            "pending": pending,
            "completed": completed,
        }


@pytest.fixture
async def gui_renderer(temp_gui_dirs):
    """Create a GUI fragment renderer."""
    renderer = GUIFragmentRenderer(output_dir=temp_gui_dirs["fragments"])
    yield renderer


@pytest.fixture
async def gui_processor(temp_gui_dirs):
    """Create a GUI command processor with mock executor."""
    executed_commands = []

    async def mock_executor(cmd):
        executed_commands.append(cmd)

    processor = GUICommandProcessor(
        pending_dir=temp_gui_dirs["pending"],
        completed_dir=temp_gui_dirs["completed"],
        executor=mock_executor,
    )

    yield {
        "processor": processor,
        "executed_commands": executed_commands,
        "pending": temp_gui_dirs["pending"],
        "completed": temp_gui_dirs["completed"],
    }


@pytest.fixture
def sample_windows():
    """Create sample windows for testing."""
    return [
        Window(
            id="win-terminal",
            title="Terminal",
            type=WindowType.TERMINAL,
            pos=(100, 50),
            size=(640, 480),
            z_index=2,
            focused=False,
        ),
        Window(
            id="win-editor",
            title="Code Editor",
            type=WindowType.EDITOR,
            pos=(750, 50),
            size=(800, 600),
            z_index=1,
            focused=True,
        ),
        Window(
            id="win-browser",
            title="Neural City",
            type=WindowType.NEURAL_CITY,
            pos=(100, 550),
            size=(640, 400),
            z_index=0,
            focused=False,
        ),
    ]


@pytest.fixture
def lm_studio_available():
    """Check if LM Studio is available."""
    import requests
    try:
        response = requests.get("http://localhost:1234/v1/models", timeout=2)
        return response.status_code == 200
    except:
        return False


@pytest.fixture
def webmcp_available():
    """Check if WebMCP bridge is available."""
    import requests
    try:
        response = requests.get("http://localhost:8769/health", timeout=2)
        return response.status_code == 200
    except:
        return False


def skip_if_no_lm_studio(available):
    """Skip test if LM Studio is not available."""
    if not available:
        pytest.skip("LM Studio not available at localhost:1234")


def skip_if_no_webmcp(available):
    """Skip test if WebMCP bridge is not available."""
    if not available:
        pytest.skip("WebMCP bridge not available at localhost:8769")
