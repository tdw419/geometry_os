"""
Tests for GUI Fragment Renderer.
"""

import asyncio
import tempfile
from pathlib import Path
from datetime import datetime

import pytest
import yaml

from systems.visual_shell.ascii_gui.fragment_renderer import (
    GUIFragmentRenderer,
    atomic_write,
)
from systems.visual_shell.ascii_gui.models import (
    Window,
    WindowType,
    FocusState,
    MouseState,
    KeyboardState,
)


class TestAtomicWrite:
    """Tests for atomic_write helper."""

    def test_writes_file_successfully(self, tmp_path):
        """Test that atomic_write creates a file."""
        content = "test content\nline 2"
        atomic_write(tmp_path, "test.txt", content)

        result = (tmp_path / "test.txt").read_text()
        assert result == content

    def test_overwrites_existing_file(self, tmp_path):
        """Test that atomic_write overwrites existing files."""
        (tmp_path / "test.txt").write_text("old content")

        atomic_write(tmp_path, "test.txt", "new content")

        result = (tmp_path / "test.txt").read_text()
        assert result == "new content"


class TestGUIFragmentRenderer:
    """Tests for GUIFragmentRenderer."""

    @pytest.fixture
    def renderer(self, tmp_path):
        """Create a renderer with temp directory."""
        return GUIFragmentRenderer(
            output_dir=str(tmp_path / "gui"),
            auto_flush=True
        )

    @pytest.fixture
    def sample_window(self):
        """Create a sample window."""
        return Window(
            id="win-1",
            title="Terminal",
            type=WindowType.TERMINAL,
            pos=(100, 50),
            size=(640, 480),
        )

    def test_init_creates_directories(self, tmp_path):
        """Test that init creates required directories."""
        output_dir = tmp_path / "gui"
        renderer = GUIFragmentRenderer(output_dir=str(output_dir))

        assert output_dir.exists()
        assert (output_dir / "fragments").exists()

    def test_init_state_is_empty(self, renderer):
        """Test that initial state is empty."""
        assert len(renderer.windows) == 0
        assert renderer.focus_state.window_id is None
        assert renderer.mouse_state.x == 0
        assert renderer.mouse_state.y == 0
        assert renderer.keyboard_state.last_key is None

    @pytest.mark.asyncio
    async def test_on_window_create_adds_window(self, renderer, sample_window):
        """Test that on_window_create adds window to state."""
        await renderer.on_window_create(sample_window)

        assert "win-1" in renderer.windows
        assert renderer.windows["win-1"].title == "Terminal"

    @pytest.mark.asyncio
    async def test_on_window_create_writes_fragments(self, renderer, sample_window):
        """Test that on_window_create writes fragment files."""
        await renderer.on_window_create(sample_window)

        # Check windows.yaml exists
        yaml_path = renderer.fragments_dir / "windows.yaml"
        assert yaml_path.exists()

        # Parse and verify content
        content = yaml.safe_load(yaml_path.read_text())
        assert content["count"] == 1
        assert len(content["windows"]) == 1
        assert content["windows"][0]["id"] == "win-1"
        assert content["windows"][0]["title"] == "Terminal"
        assert content["windows"][0]["type"] == "terminal"

    @pytest.mark.asyncio
    async def test_on_window_focus_sets_focused_window(self, renderer, sample_window):
        """Test that on_window_focus sets the focused window."""
        await renderer.on_window_create(sample_window)

        focused_window = Window(
            id="win-2",
            title="Editor",
            type=WindowType.EDITOR,
        )
        await renderer.on_window_create(focused_window)
        await renderer.on_window_focus(focused_window)

        # Check internal state
        assert renderer.focus_state.window_id == "win-2"
        assert renderer.focus_state.window_title == "Editor"

        # Check windows.yaml shows focused
        yaml_path = renderer.fragments_dir / "windows.yaml"
        content = yaml.safe_load(yaml_path.read_text())
        assert content["focused_id"] == "win-2"

    @pytest.mark.asyncio
    async def test_on_window_focus_clears_previous_focus(self, renderer, sample_window):
        """Test that focusing one window clears focus from others."""
        await renderer.on_window_create(sample_window)

        win2 = Window(id="win-2", title="Editor", type=WindowType.EDITOR)
        await renderer.on_window_create(win2)

        # Focus first window
        await renderer.on_window_focus(sample_window)
        assert renderer.windows["win-1"].focused is True
        assert renderer.windows["win-2"].focused is False

        # Focus second window
        await renderer.on_window_focus(win2)
        assert renderer.windows["win-1"].focused is False
        assert renderer.windows["win-2"].focused is True

    @pytest.mark.asyncio
    async def test_on_window_focus_writes_focus_fragment(self, renderer, sample_window):
        """Test that on_window_focus writes focus.ascii."""
        await renderer.on_window_create(sample_window)
        await renderer.on_window_focus(sample_window)

        focus_path = renderer.fragments_dir / "focus.ascii"
        assert focus_path.exists()

        content = focus_path.read_text()
        assert "FOCUS STATE" in content
        assert "win-1" in content
        assert "Terminal" in content

    @pytest.mark.asyncio
    async def test_on_window_close_removes_window(self, renderer, sample_window):
        """Test that on_window_close removes window from state."""
        await renderer.on_window_create(sample_window)
        await renderer.on_window_close("win-1")

        assert "win-1" not in renderer.windows

    @pytest.mark.asyncio
    async def test_on_window_close_clears_focus_if_focused(self, renderer, sample_window):
        """Test that closing focused window clears focus state."""
        await renderer.on_window_create(sample_window)
        await renderer.on_window_focus(sample_window)
        await renderer.on_window_close("win-1")

        assert renderer.focus_state.window_id is None
        assert renderer.focus_state.window_title is None

    @pytest.mark.asyncio
    async def test_on_window_close_preserves_focus_if_not_focused(self, renderer, sample_window):
        """Test that closing non-focused window preserves focus."""
        await renderer.on_window_create(sample_window)

        win2 = Window(id="win-2", title="Editor", type=WindowType.EDITOR)
        await renderer.on_window_create(win2)
        await renderer.on_window_focus(win2)

        await renderer.on_window_close("win-1")

        assert renderer.focus_state.window_id == "win-2"

    @pytest.mark.asyncio
    async def test_on_mouse_move_updates_state(self, renderer):
        """Test that on_mouse_move updates mouse state."""
        await renderer.on_mouse_move(100, 200, "button#submit")

        assert renderer.mouse_state.x == 100
        assert renderer.mouse_state.y == 200
        assert renderer.mouse_state.hovering == "button#submit"

    @pytest.mark.asyncio
    async def test_on_mouse_move_writes_mouse_fragment(self, renderer):
        """Test that on_mouse_move writes mouse.ascii."""
        await renderer.on_mouse_move(50, 75, None)

        mouse_path = renderer.fragments_dir / "mouse.ascii"
        assert mouse_path.exists()

        content = mouse_path.read_text()
        assert "MOUSE STATE" in content
        assert "(50, 75)" in content

    @pytest.mark.asyncio
    async def test_on_key_press_updates_state(self, renderer):
        """Test that on_key_press updates keyboard state."""
        await renderer.on_key_press("Enter", ["ctrl", "shift"])

        assert renderer.keyboard_state.last_key == "Enter"
        assert renderer.keyboard_state.modifiers == ["ctrl", "shift"]
        assert renderer.keyboard_state.last_key_time is not None

    @pytest.mark.asyncio
    async def test_on_key_press_writes_keyboard_fragment(self, renderer):
        """Test that on_key_press writes keyboard.ascii."""
        await renderer.on_key_press("a", [])

        kb_path = renderer.fragments_dir / "keyboard.ascii"
        assert kb_path.exists()

        content = kb_path.read_text()
        assert "KEYBOARD STATE" in content
        assert "a" in content

    def test_force_flush_writes_all_fragments(self, renderer, sample_window):
        """Test that force_flush writes all fragments even with auto_flush=False."""
        renderer.auto_flush = False
        renderer.windows["win-1"] = sample_window

        renderer.force_flush()

        assert (renderer.fragments_dir / "windows.yaml").exists()
        assert (renderer.fragments_dir / "focus.ascii").exists()
        assert (renderer.fragments_dir / "mouse.ascii").exists()
        assert (renderer.fragments_dir / "keyboard.ascii").exists()

    def test_update_focus_manually(self, renderer):
        """Test manual focus state update."""
        renderer.update_focus(
            window_id="manual-win",
            window_title="Manual Window",
            element="textarea[0]",
            mode="insert"
        )

        assert renderer.focus_state.window_id == "manual-win"
        assert renderer.focus_state.window_title == "Manual Window"
        assert renderer.focus_state.element == "textarea[0]"
        assert renderer.focus_state.mode == "insert"

        # Check fragment updated
        focus_path = renderer.fragments_dir / "focus.ascii"
        content = focus_path.read_text()
        assert "Manual Window" in content

    def test_update_mouse_manually(self, renderer):
        """Test manual mouse state update."""
        renderer.update_mouse(x=500, y=300, hovering="div#content")

        assert renderer.mouse_state.x == 500
        assert renderer.mouse_state.y == 300
        assert renderer.mouse_state.hovering == "div#content"

    def test_update_keyboard_manually(self, renderer):
        """Test manual keyboard state update."""
        renderer.update_keyboard(
            last_key="Escape",
            modifiers=["alt"]
        )

        assert renderer.keyboard_state.last_key == "Escape"
        assert renderer.keyboard_state.modifiers == ["alt"]

    @pytest.mark.asyncio
    async def test_multiple_windows_sorted_in_yaml(self, renderer):
        """Test that multiple windows appear in windows.yaml."""
        win1 = Window(id="z-last", title="Z Window", type=WindowType.TERMINAL, z=2)
        win2 = Window(id="a-first", title="A Window", type=WindowType.EDITOR, z=1)
        win3 = Window(id="m-middle", title="M Window", type=WindowType.BROWSER, z=3)

        await renderer.on_window_create(win1)
        await renderer.on_window_create(win2)
        await renderer.on_window_create(win3)

        yaml_path = renderer.fragments_dir / "windows.yaml"
        content = yaml.safe_load(yaml_path.read_text())

        assert content["count"] == 3
        ids = [w["id"] for w in content["windows"]]
        assert "z-last" in ids
        assert "a-first" in ids
        assert "m-middle" in ids

    @pytest.mark.asyncio
    async def test_focus_ascii_box_format(self, renderer, sample_window):
        """Test focus.ascii box has correct format."""
        await renderer.on_window_create(sample_window)
        await renderer.on_window_focus(sample_window)

        content = (renderer.fragments_dir / "focus.ascii").read_text()

        # Check box structure
        lines = content.strip().split("\n")
        assert lines[0].startswith("+")
        assert lines[0].endswith("+")
        assert "FOCUS STATE" in lines[1]
        assert "Window:" in content
        assert "Element:" in content
        assert "Cursor:" in content
        assert "Mode:" in content

    @pytest.mark.asyncio
    async def test_mouse_ascii_box_format(self, renderer):
        """Test mouse.ascii box has correct format."""
        await renderer.on_mouse_move(100, 200, "button")

        content = (renderer.fragments_dir / "mouse.ascii").read_text()

        # Check box structure
        lines = content.strip().split("\n")
        assert lines[0].startswith("+")
        assert lines[0].endswith("+")
        assert "MOUSE STATE" in lines[1]
        assert "Position:" in content
        assert "Buttons:" in content
        assert "Hovering:" in content

    @pytest.mark.asyncio
    async def test_keyboard_ascii_box_format(self, renderer):
        """Test keyboard.ascii box has correct format."""
        await renderer.on_key_press("Enter", ["ctrl"])

        content = (renderer.fragments_dir / "keyboard.ascii").read_text()

        # Check box structure
        lines = content.strip().split("\n")
        assert lines[0].startswith("+")
        assert lines[0].endswith("+")
        assert "KEYBOARD STATE" in lines[1]
        assert "Modifiers:" in content
        assert "Pressed:" in content
        assert "Last Key:" in content

    @pytest.mark.asyncio
    async def test_auto_flush_false_skips_writes(self, tmp_path, sample_window):
        """Test that auto_flush=False skips file writes."""
        renderer = GUIFragmentRenderer(
            output_dir=str(tmp_path / "gui"),
            auto_flush=False
        )

        await renderer.on_window_create(sample_window)

        # No files should be written yet
        assert not (renderer.fragments_dir / "windows.yaml").exists()

        # Manual flush should write
        renderer.force_flush()
        assert (renderer.fragments_dir / "windows.yaml").exists()
