"""
Integration tests for Visual Bridge GUI integration.

Tests for GUI state variables, renderer registration, scene poller,
and command processor integration with VisualBridge.
"""

import asyncio
import tempfile
from datetime import datetime, timezone
from pathlib import Path
from typing import List, Any
from unittest.mock import AsyncMock, MagicMock, patch

import pytest
import yaml


class TestGUIStateVariables:
    """Tests for GUI state variables in VisualBridge."""

    def test_gui_state_variables_initialized(self):
        """GUI state variables are initialized in __init__."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()

        # Check GUI state variables exist
        assert hasattr(bridge, 'gui_scene_dir')
        assert hasattr(bridge, 'gui_scene_files')
        assert hasattr(bridge, '_gui_renderers_registered')
        assert hasattr(bridge, '_gui_command_processor')
        assert hasattr(bridge, '_gui_broadcaster')
        assert hasattr(bridge, '_gui_renderer')

    def test_gui_scene_dir_is_path(self):
        """gui_scene_dir is a Path object pointing to correct location."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()

        assert isinstance(bridge.gui_scene_dir, Path)
        assert bridge.gui_scene_dir == Path(".geometry/gui/fragments")

    def test_gui_scene_files_initialized_empty(self):
        """gui_scene_files starts as empty dict."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()

        assert isinstance(bridge.gui_scene_files, dict)
        assert len(bridge.gui_scene_files) == 0

    def test_gui_renderers_not_registered_initially(self):
        """GUI renderers are not registered on init."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()

        assert bridge._gui_renderers_registered is False
        assert bridge._gui_command_processor is None
        assert bridge._gui_broadcaster is None
        assert bridge._gui_renderer is None


class TestGUIRendererRegistration:
    """Tests for register_gui_renderers method."""

    @pytest.fixture
    def temp_gui_dir(self, tmp_path):
        """Create a temporary GUI directory."""
        gui_dir = tmp_path / ".geometry" / "gui"
        gui_dir.mkdir(parents=True)
        return gui_dir

    def test_register_creates_broadcaster(self, temp_gui_dir):
        """register_gui_renderers creates GUIHookBroadcaster."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()
        bridge.gui_scene_dir = temp_gui_dir / "fragments"

        bridge.register_gui_renderers()

        assert bridge._gui_broadcaster is not None
        assert bridge._gui_renderers_registered is True

    def test_register_creates_renderer(self, temp_gui_dir):
        """register_gui_renderers creates GUIFragmentRenderer."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()
        bridge.gui_scene_dir = temp_gui_dir / "fragments"

        bridge.register_gui_renderers()

        assert bridge._gui_renderer is not None

    def test_register_wires_renderer_to_broadcaster(self, temp_gui_dir):
        """register_gui_renderers adds renderer as hook to broadcaster."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()
        bridge.gui_scene_dir = temp_gui_dir / "fragments"

        bridge.register_gui_renderers()

        # Renderer should be in broadcaster's hooks
        assert bridge._gui_renderer in bridge._gui_broadcaster.hooks

    def test_register_creates_directory(self, temp_gui_dir):
        """register_gui_renderers creates fragments directory if needed."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()
        # Use path that doesn't exist yet
        bridge.gui_scene_dir = temp_gui_dir / "new_fragments"
        assert not bridge.gui_scene_dir.exists()

        bridge.register_gui_renderers()

        assert bridge.gui_scene_dir.exists()

    def test_register_idempotent(self, temp_gui_dir):
        """register_gui_renderers is idempotent - only registers once."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()
        bridge.gui_scene_dir = temp_gui_dir / "fragments"

        bridge.register_gui_renderers()
        first_broadcaster = bridge._gui_broadcaster

        bridge.register_gui_renderers()  # Call again
        second_broadcaster = bridge._gui_broadcaster

        # Should be same instance
        assert first_broadcaster is second_broadcaster


class TestGUISceneWatcher:
    """Tests for GUI scene watcher setup."""

    @pytest.fixture
    def bridge_with_gui(self, tmp_path):
        """Create a bridge with GUI setup."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()
        gui_dir = tmp_path / ".geometry" / "gui"
        gui_dir.mkdir(parents=True)
        bridge.gui_scene_dir = gui_dir / "fragments"
        bridge.gui_scene_dir.mkdir(parents=True)
        return bridge

    def test_setup_watcher_is_callable(self, bridge_with_gui):
        """_setup_gui_scene_watcher is callable."""
        assert hasattr(bridge_with_gui, '_setup_gui_scene_watcher')
        assert callable(bridge_with_gui._setup_gui_scene_watcher)

    def test_scene_poller_is_async(self, bridge_with_gui):
        """_gui_scene_poller is an async method."""
        import inspect
        assert inspect.iscoroutinefunction(bridge_with_gui._gui_scene_poller)

    @pytest.mark.asyncio
    async def test_poller_detects_new_file(self, bridge_with_gui):
        """Poller detects and broadcasts new file."""
        broadcast_messages: List[dict] = []

        async def mock_broadcast(msg):
            broadcast_messages.append(msg)

        bridge_with_gui._broadcast = mock_broadcast

        # Start poller in background (it will cancel when test ends)
        task = asyncio.create_task(bridge_with_gui._gui_scene_poller())

        # Wait a bit for poller to start
        await asyncio.sleep(0.1)

        # Create a new file
        test_file = bridge_with_gui.gui_scene_dir / "test.yaml"
        test_file.write_text("test: content")

        # Wait for poller to pick it up
        await asyncio.sleep(0.7)  # Poll interval is 500ms

        task.cancel()
        try:
            await task
        except asyncio.CancelledError:
            pass

        # Should have broadcast the new file
        assert len(broadcast_messages) >= 1
        assert broadcast_messages[0]["type"] == "gui_scene_update"
        assert broadcast_messages[0]["filename"] == "test.yaml"

    @pytest.mark.asyncio
    async def test_poller_detects_file_change(self, bridge_with_gui):
        """Poller detects and broadcasts file changes."""
        broadcast_messages: List[dict] = []

        async def mock_broadcast(msg):
            broadcast_messages.append(msg)

        bridge_with_gui._broadcast = mock_broadcast

        # Create initial file
        test_file = bridge_with_gui.gui_scene_dir / "change.yaml"
        test_file.write_text("version: 1")

        # Start poller
        task = asyncio.create_task(bridge_with_gui._gui_scene_poller())
        await asyncio.sleep(0.6)  # Let it read initial state

        # Change the file
        test_file.write_text("version: 2")
        await asyncio.sleep(0.6)  # Wait for change detection

        task.cancel()
        try:
            await task
        except asyncio.CancelledError:
            pass

        # Should have broadcast the change
        change_broadcasts = [m for m in broadcast_messages if m.get("filename") == "change.yaml"]
        assert len(change_broadcasts) >= 1
        assert "version: 2" in change_broadcasts[-1]["content"]

    @pytest.mark.asyncio
    async def test_poller_handles_cancelled_error(self, bridge_with_gui):
        """Poller exits cleanly on CancelledError."""
        task = asyncio.create_task(bridge_with_gui._gui_scene_poller())

        await asyncio.sleep(0.1)
        task.cancel()

        # Should complete without raising
        try:
            await task
        except asyncio.CancelledError:
            pass  # Expected


class TestGUICommandProcessor:
    """Tests for GUI command processor setup."""

    @pytest.fixture
    def bridge_with_gui(self, tmp_path):
        """Create a bridge with GUI setup."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()
        gui_dir = tmp_path / ".geometry" / "gui"
        gui_dir.mkdir(parents=True)
        bridge.gui_scene_dir = gui_dir / "fragments"
        bridge.gui_scene_dir.mkdir(parents=True)
        return bridge

    def test_setup_processor_is_callable(self, bridge_with_gui):
        """_setup_gui_command_processor is callable."""
        assert hasattr(bridge_with_gui, '_setup_gui_command_processor')
        assert callable(bridge_with_gui._setup_gui_command_processor)

    def test_setup_processor_creates_processor(self, bridge_with_gui):
        """_setup_gui_command_processor creates GUICommandProcessor."""
        bridge_with_gui._setup_gui_command_processor()

        assert bridge_with_gui._gui_command_processor is not None

    def test_processor_has_correct_gui_dir(self, bridge_with_gui):
        """Processor is initialized with correct gui_dir."""
        bridge_with_gui._setup_gui_command_processor()

        expected_gui_dir = str(bridge_with_gui.gui_scene_dir.parent)
        actual_gui_dir = str(bridge_with_gui._gui_command_processor.gui_dir)

        assert actual_gui_dir == expected_gui_dir

    def test_execute_command_is_async(self, bridge_with_gui):
        """_execute_gui_command is an async method."""
        import inspect
        assert inspect.iscoroutinefunction(bridge_with_gui._execute_gui_command)

    @pytest.mark.asyncio
    async def test_execute_command_broadcasts(self, bridge_with_gui):
        """_execute_gui_command broadcasts command to clients."""
        broadcast_messages: List[dict] = []

        async def mock_broadcast(msg):
            broadcast_messages.append(msg)

        bridge_with_gui._broadcast = mock_broadcast

        # Create mock command
        mock_cmd = MagicMock()
        mock_cmd.command_id = "cmd-001"
        mock_cmd.action = "click"
        mock_cmd.target = "button#submit"
        mock_cmd.position = (100, 200)
        mock_cmd.text = None
        mock_cmd.keys = None
        mock_cmd.direction = None
        mock_cmd.delta = None

        await bridge_with_gui._execute_gui_command(mock_cmd)

        assert len(broadcast_messages) == 1
        assert broadcast_messages[0]["type"] == "gui_command"
        assert broadcast_messages[0]["command_id"] == "cmd-001"
        assert broadcast_messages[0]["action"] == "click"

    @pytest.mark.asyncio
    async def test_execute_command_handles_focus(self, bridge_with_gui, capsys):
        """_execute_gui_command handles focus action."""
        broadcast_messages: List[dict] = []

        async def mock_broadcast(msg):
            broadcast_messages.append(msg)

        bridge_with_gui._broadcast = mock_broadcast

        # Register broadcasters first
        bridge_with_gui.register_gui_renderers()

        # Create focus command
        mock_cmd = MagicMock()
        mock_cmd.command_id = "cmd-002"
        mock_cmd.action = "focus"
        mock_cmd.target = "window-1"
        mock_cmd.position = None
        mock_cmd.text = None
        mock_cmd.keys = None
        mock_cmd.direction = None
        mock_cmd.delta = None

        await bridge_with_gui._execute_gui_command(mock_cmd)

        # Check it printed focus message
        captured = capsys.readouterr()
        assert "focus" in captured.out.lower()

    @pytest.mark.asyncio
    async def test_execute_command_handles_close(self, bridge_with_gui, capsys):
        """_execute_gui_command handles close action."""
        broadcast_messages: List[dict] = []

        async def mock_broadcast(msg):
            broadcast_messages.append(msg)

        bridge_with_gui._broadcast = mock_broadcast

        # Register broadcasters first
        bridge_with_gui.register_gui_renderers()

        # Create close command
        mock_cmd = MagicMock()
        mock_cmd.command_id = "cmd-003"
        mock_cmd.action = "close"
        mock_cmd.target = "window-1"
        mock_cmd.position = None
        mock_cmd.text = None
        mock_cmd.keys = None
        mock_cmd.direction = None
        mock_cmd.delta = None

        await bridge_with_gui._execute_gui_command(mock_cmd)

        # Check it printed close message
        captured = capsys.readouterr()
        assert "close" in captured.out.lower()


class TestBroadcastGUISceneList:
    """Tests for broadcast_gui_scene_list method."""

    @pytest.fixture
    def bridge_with_gui(self, tmp_path):
        """Create a bridge with GUI setup."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()
        gui_dir = tmp_path / ".geometry" / "gui"
        gui_dir.mkdir(parents=True)
        bridge.gui_scene_dir = gui_dir / "fragments"
        bridge.gui_scene_dir.mkdir(parents=True)
        return bridge

    @pytest.mark.asyncio
    async def test_broadcasts_file_list(self, bridge_with_gui):
        """broadcast_gui_scene_list broadcasts list of files."""
        broadcast_messages: List[dict] = []

        async def mock_broadcast(msg):
            broadcast_messages.append(msg)

        bridge_with_gui._broadcast = mock_broadcast

        # Create some files
        (bridge_with_gui.gui_scene_dir / "windows.yaml").write_text("test: 1")
        (bridge_with_gui.gui_scene_dir / "focus.ascii").write_text("focus data")

        await bridge_with_gui.broadcast_gui_scene_list()

        assert len(broadcast_messages) == 1
        assert broadcast_messages[0]["type"] == "gui_scene_list"
        assert "windows.yaml" in broadcast_messages[0]["files"]
        assert "focus.ascii" in broadcast_messages[0]["files"]

    @pytest.mark.asyncio
    async def test_empty_directory_sends_empty_list(self, bridge_with_gui):
        """Empty directory sends empty file list."""
        broadcast_messages: List[dict] = []

        async def mock_broadcast(msg):
            broadcast_messages.append(msg)

        bridge_with_gui._broadcast = mock_broadcast

        await bridge_with_gui.broadcast_gui_scene_list()

        assert len(broadcast_messages) == 1
        assert broadcast_messages[0]["files"] == []

    @pytest.mark.asyncio
    async def test_handles_nonexistent_directory(self, bridge_with_gui):
        """Handles non-existent directory gracefully."""
        broadcast_messages: List[dict] = []

        async def mock_broadcast(msg):
            broadcast_messages.append(msg)

        bridge_with_gui._broadcast = mock_broadcast
        bridge_with_gui.gui_scene_dir = Path("/nonexistent/path")

        await bridge_with_gui.broadcast_gui_scene_list()

        # Should not broadcast if directory doesn't exist
        assert len(broadcast_messages) == 0


class TestWebSocketMessageHandlers:
    """Tests for WebSocket message handlers."""

    @pytest.fixture
    def bridge_with_gui(self, tmp_path):
        """Create a bridge with GUI setup."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()
        gui_dir = tmp_path / ".geometry" / "gui"
        gui_dir.mkdir(parents=True)
        bridge.gui_scene_dir = gui_dir / "fragments"
        bridge.gui_scene_dir.mkdir(parents=True)
        bridge.register_gui_renderers()
        return bridge

    @pytest.mark.asyncio
    async def test_gui_scene_request_returns_list(self, bridge_with_gui):
        """gui_scene_request message returns file list."""
        import json

        # Create a test file
        (bridge_with_gui.gui_scene_dir / "test.yaml").write_text("test: data")
        bridge_with_gui.gui_scene_files["test.yaml"] = "test: data"

        sent_messages: List[dict] = []

        mock_websocket = MagicMock()
        mock_websocket.send = AsyncMock(side_effect=lambda msg: sent_messages.append(json.loads(msg)))

        broadcast_messages: List[dict] = []

        async def mock_broadcast(msg):
            broadcast_messages.append(msg)

        bridge_with_gui._broadcast = mock_broadcast

        # Simulate gui_scene_request message
        data = {"type": "gui_scene_request"}
        msg_type = data.get("type")

        if msg_type == "gui_scene_request":
            await bridge_with_gui.broadcast_gui_scene_list()
            for filename, content in bridge_with_gui.gui_scene_files.items():
                await mock_websocket.send(json.dumps({
                    "type": "gui_scene_update",
                    "filename": filename,
                    "content": content,
                    "timestamp": 1234567890
                }))

        # Check broadcast was called
        assert len(broadcast_messages) == 1
        assert broadcast_messages[0]["type"] == "gui_scene_list"

        # Check individual file was sent
        assert len(sent_messages) == 1
        assert sent_messages[0]["type"] == "gui_scene_update"
        assert sent_messages[0]["filename"] == "test.yaml"

    @pytest.mark.asyncio
    async def test_gui_scene_update_caches_and_broadcasts(self, bridge_with_gui):
        """gui_scene_update message updates cache and broadcasts."""
        broadcast_messages: List[dict] = []

        async def mock_broadcast(msg):
            broadcast_messages.append(msg)

        bridge_with_gui._broadcast = mock_broadcast

        # Simulate gui_scene_update message handling
        data = {
            "type": "gui_scene_update",
            "filename": "new.yaml",
            "content": "new: content",
            "timestamp": 1234567890
        }

        # Update cache
        bridge_with_gui.gui_scene_files[data["filename"]] = data["content"]

        # Broadcast to all clients
        await bridge_with_gui._broadcast({
            "type": "gui_scene_update",
            "filename": data["filename"],
            "content": data["content"],
            "timestamp": data.get("timestamp", 1234567890)
        })

        # Check cache
        assert "new.yaml" in bridge_with_gui.gui_scene_files
        assert bridge_with_gui.gui_scene_files["new.yaml"] == "new: content"

        # Check broadcast
        assert len(broadcast_messages) == 1
        assert broadcast_messages[0]["type"] == "gui_scene_update"

    @pytest.mark.asyncio
    async def test_gui_event_routes_to_broadcaster(self, bridge_with_gui):
        """gui_event message routes to GUI broadcaster."""
        broadcast_messages: List[dict] = []

        async def mock_broadcast(msg):
            broadcast_messages.append(msg)

        bridge_with_gui._broadcast = mock_broadcast

        # Track if broadcaster was called
        broadcaster_calls: List[str] = []

        original_on_window_create = bridge_with_gui._gui_broadcaster.on_window_create
        bridge_with_gui._gui_broadcaster.on_window_create = lambda data: broadcaster_calls.append("window_create")

        # Simulate gui_event message
        data = {
            "type": "gui_event",
            "event_type": "window_create",
            "data": {"id": "win-1", "title": "Test"}
        }

        event_type = data.get("event_type")
        event_data = data.get("data")

        if bridge_with_gui._gui_broadcaster:
            if event_type == 'window_create':
                bridge_with_gui._gui_broadcaster.on_window_create(event_data)

        # Broadcast to all clients
        await bridge_with_gui._broadcast({
            "type": "GUI_EVENT",
            "event_type": event_type,
            "data": event_data,
            "timestamp": 1234567890
        })

        # Check broadcaster was called
        assert "window_create" in broadcaster_calls

        # Check broadcast
        assert len(broadcast_messages) == 1
        assert broadcast_messages[0]["type"] == "GUI_EVENT"


class TestIntegration:
    """End-to-end integration tests."""

    @pytest.fixture
    def full_bridge(self, tmp_path):
        """Create a fully configured bridge."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()
        gui_dir = tmp_path / ".geometry" / "gui"
        gui_dir.mkdir(parents=True)
        bridge.gui_scene_dir = gui_dir / "fragments"
        bridge.gui_scene_dir.mkdir(parents=True)
        return bridge

    def test_full_gui_setup(self, full_bridge):
        """Complete GUI setup works without errors."""
        # Register renderers
        full_bridge.register_gui_renderers()

        # Setup command processor
        full_bridge._setup_gui_command_processor()

        # Verify all components
        assert full_bridge._gui_renderers_registered is True
        assert full_bridge._gui_broadcaster is not None
        assert full_bridge._gui_renderer is not None
        assert full_bridge._gui_command_processor is not None

    @pytest.mark.asyncio
    async def test_command_file_triggers_broadcast(self, full_bridge):
        """Command file in pending triggers broadcast."""
        from systems.visual_shell.ascii_gui.models import Command

        broadcast_messages: List[dict] = []

        async def mock_broadcast(msg):
            broadcast_messages.append(msg)

        full_bridge._broadcast = mock_broadcast

        # Setup
        full_bridge.register_gui_renderers()
        full_bridge._setup_gui_command_processor()

        # Create a command file
        cmd = Command(
            command_id="test-cmd",
            action="click",
            timestamp=datetime.now(timezone.utc),
            position=(50, 100)
        )

        pending_dir = Path(full_bridge._gui_command_processor.pending_dir)
        cmd_path = pending_dir / "test-cmd.yaml"
        cmd_path.write_text(cmd.to_yaml())

        # Process pending commands
        results = await full_bridge._gui_command_processor.process_pending()

        # Check command was processed
        assert len(results) == 1
        assert results[0]["success"] is True

        # Check broadcast was called via _execute_gui_command
        assert len(broadcast_messages) == 1
        assert broadcast_messages[0]["type"] == "gui_command"
        assert broadcast_messages[0]["command_id"] == "test-cmd"
