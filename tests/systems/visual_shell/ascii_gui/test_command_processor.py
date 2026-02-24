"""
Tests for GUI Command Processor.

Tests command validation, execution, and file movement.
"""

import asyncio
import tempfile
from datetime import datetime, timezone
from pathlib import Path
from typing import List

import pytest
import yaml

from systems.visual_shell.ascii_gui.command_processor import (
    GUICommandProcessor,
    CommandValidationError,
    CommandExecutionError,
)
from systems.visual_shell.ascii_gui.models import Command, VALID_ACTIONS


class MockExecutor:
    """Mock executor that records executed commands."""

    def __init__(self, fail_on: str = None):
        """
        Initialize mock executor.

        Args:
            fail_on: Command action that should fail (for testing error handling)
        """
        self.executed: List[Command] = []
        self.fail_on = fail_on

    async def __call__(self, cmd: Command) -> None:
        """Execute command (record it, optionally fail)."""
        if self.fail_on and cmd.action == self.fail_on:
            raise RuntimeError(f"Mock failure for action: {cmd.action}")
        self.executed.append(cmd)


class TestCommandProcessor:
    """Tests for GUICommandProcessor."""

    @pytest.fixture
    def temp_gui_dir(self):
        """Create a temporary GUI directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            gui_dir = Path(tmpdir) / "gui"
            gui_dir.mkdir(parents=True)
            yield gui_dir

    @pytest.fixture
    def processor(self, temp_gui_dir):
        """Create a processor with mock executor."""
        executor = MockExecutor()
        proc = GUICommandProcessor(
            executor=executor,
            gui_dir=str(temp_gui_dir)
        )
        proc._mock_executor = executor  # Keep reference for tests
        return proc

    def test_creates_directories(self, temp_gui_dir):
        """Processor creates pending and completed directories."""
        executor = MockExecutor()
        gui_dir = temp_gui_dir / "subdir" / "gui"

        processor = GUICommandProcessor(
            executor=executor,
            gui_dir=str(gui_dir)
        )

        assert processor.pending_dir.exists()
        assert processor.completed_dir.exists()

    def test_get_pending_count_empty(self, processor):
        """Pending count is 0 when empty."""
        assert processor.get_pending_count() == 0

    def test_get_completed_count_empty(self, processor):
        """Completed count is 0 when empty."""
        assert processor.get_completed_count() == 0

    @pytest.mark.asyncio
    async def test_process_empty_pending(self, processor):
        """Processing empty pending returns empty list."""
        results = await processor.process_pending()
        assert results == []

    @pytest.mark.asyncio
    async def test_valid_command_executes_and_moves(self, processor):
        """Valid command executes and moves to completed."""
        # Create command file
        cmd = Command(
            command_id="cmd-001",
            action="click",
            timestamp=datetime.now(timezone.utc),
            position=(100, 200),
            target="button#submit"
        )

        cmd_path = processor.pending_dir / "cmd-001.yaml"
        cmd_path.write_text(cmd.to_yaml())

        # Process
        results = await processor.process_pending()

        # Verify execution
        assert len(results) == 1
        assert results[0]["command_id"] == "cmd-001"
        assert results[0]["success"] is True
        assert results[0]["error"] is None

        # Verify executor was called
        assert len(processor._mock_executor.executed) == 1
        executed_cmd = processor._mock_executor.executed[0]
        assert executed_cmd.command_id == "cmd-001"
        assert executed_cmd.action == "click"

        # Verify file moved
        assert not cmd_path.exists()
        completed_path = processor.completed_dir / "cmd-001.yaml"
        assert completed_path.exists()

        # Verify completed has status annotation
        completed_data = yaml.safe_load(completed_path.read_text())
        assert completed_data["success"] is True
        assert "processed_at" in completed_data

    @pytest.mark.asyncio
    async def test_invalid_yaml_rejected(self, processor):
        """Invalid YAML is rejected with error."""
        cmd_path = processor.pending_dir / "cmd-bad.yaml"
        cmd_path.write_text("this is not: valid:: yaml:::")

        results = await processor.process_pending()

        assert len(results) == 1
        assert results[0]["success"] is False
        assert "Invalid YAML" in results[0]["error"]

        # File moved to completed with error
        assert not cmd_path.exists()
        completed_path = processor.completed_dir / "cmd-bad.yaml"
        assert completed_path.exists()

        completed_data = yaml.safe_load(completed_path.read_text())
        assert completed_data["success"] is False
        assert "Invalid YAML" in completed_data["error"]
        assert "raw_content" in completed_data  # Original content preserved

    @pytest.mark.asyncio
    async def test_missing_command_id_rejected(self, processor):
        """Missing command_id is rejected."""
        cmd_path = processor.pending_dir / "cmd-no-id.yaml"
        cmd_path.write_text(yaml.dump({
            "action": "click",
            "timestamp": datetime.now(timezone.utc).isoformat()
        }))

        results = await processor.process_pending()

        assert results[0]["success"] is False
        assert "command_id" in results[0]["error"]

    @pytest.mark.asyncio
    async def test_missing_action_rejected(self, processor):
        """Missing action is rejected."""
        cmd_path = processor.pending_dir / "cmd-no-action.yaml"
        cmd_path.write_text(yaml.dump({
            "command_id": "cmd-001",
            "timestamp": datetime.now(timezone.utc).isoformat()
        }))

        results = await processor.process_pending()

        assert results[0]["success"] is False
        assert "action" in results[0]["error"]

    @pytest.mark.asyncio
    async def test_invalid_action_rejected(self, processor):
        """Invalid action is rejected."""
        cmd_path = processor.pending_dir / "cmd-bad-action.yaml"
        cmd_path.write_text(yaml.dump({
            "command_id": "cmd-001",
            "action": "explode",  # Invalid
            "timestamp": datetime.now(timezone.utc).isoformat()
        }))

        results = await processor.process_pending()

        assert results[0]["success"] is False
        assert "Invalid action" in results[0]["error"]

    @pytest.mark.asyncio
    async def test_type_requires_text(self, processor):
        """Type action requires text field."""
        cmd_path = processor.pending_dir / "cmd-type.yaml"
        cmd_path.write_text(yaml.dump({
            "command_id": "cmd-001",
            "action": "type",
            "timestamp": datetime.now(timezone.utc).isoformat()
            # Missing 'text'
        }))

        results = await processor.process_pending()

        assert results[0]["success"] is False
        assert "text" in results[0]["error"]

    @pytest.mark.asyncio
    async def test_key_requires_keys(self, processor):
        """Key action requires keys field."""
        cmd_path = processor.pending_dir / "cmd-key.yaml"
        cmd_path.write_text(yaml.dump({
            "command_id": "cmd-001",
            "action": "key",
            "timestamp": datetime.now(timezone.utc).isoformat()
            # Missing 'keys'
        }))

        results = await processor.process_pending()

        assert results[0]["success"] is False
        assert "keys" in results[0]["error"]

    @pytest.mark.asyncio
    async def test_move_requires_position(self, processor):
        """Move action requires position field."""
        cmd_path = processor.pending_dir / "cmd-move.yaml"
        cmd_path.write_text(yaml.dump({
            "command_id": "cmd-001",
            "action": "move",
            "timestamp": datetime.now(timezone.utc).isoformat()
            # Missing 'position'
        }))

        results = await processor.process_pending()

        assert results[0]["success"] is False
        assert "position" in results[0]["error"]

    @pytest.mark.asyncio
    async def test_scroll_requires_direction(self, processor):
        """Scroll action requires direction field."""
        cmd_path = processor.pending_dir / "cmd-scroll.yaml"
        cmd_path.write_text(yaml.dump({
            "command_id": "cmd-001",
            "action": "scroll",
            "timestamp": datetime.now(timezone.utc).isoformat()
            # Missing 'direction'
        }))

        results = await processor.process_pending()

        assert results[0]["success"] is False
        assert "direction" in results[0]["error"]

    @pytest.mark.asyncio
    async def test_resize_requires_delta(self, processor):
        """Resize action requires delta field."""
        cmd_path = processor.pending_dir / "cmd-resize.yaml"
        cmd_path.write_text(yaml.dump({
            "command_id": "cmd-001",
            "action": "resize",
            "timestamp": datetime.now(timezone.utc).isoformat()
            # Missing 'delta'
        }))

        results = await processor.process_pending()

        assert results[0]["success"] is False
        assert "delta" in results[0]["error"]

    @pytest.mark.asyncio
    async def test_focus_requires_target(self, processor):
        """Focus action requires target field."""
        cmd_path = processor.pending_dir / "cmd-focus.yaml"
        cmd_path.write_text(yaml.dump({
            "command_id": "cmd-001",
            "action": "focus",
            "timestamp": datetime.now(timezone.utc).isoformat()
            # Missing 'target'
        }))

        results = await processor.process_pending()

        assert results[0]["success"] is False
        assert "target" in results[0]["error"]

    @pytest.mark.asyncio
    async def test_executor_failure_handled(self, temp_gui_dir):
        """Executor failure is handled gracefully."""
        # Create processor with failing executor
        executor = MockExecutor(fail_on="click")
        processor = GUICommandProcessor(
            executor=executor,
            gui_dir=str(temp_gui_dir)
        )
        processor._mock_executor = executor

        # Create command
        cmd = Command(
            command_id="cmd-001",
            action="click",
            timestamp=datetime.now(timezone.utc),
            position=(100, 200)
        )

        cmd_path = processor.pending_dir / "cmd-001.yaml"
        cmd_path.write_text(cmd.to_yaml())

        # Process
        results = await processor.process_pending()

        assert len(results) == 1
        assert results[0]["success"] is False
        assert "Mock failure" in results[0]["error"]

        # File still moved to completed with error
        assert not cmd_path.exists()
        completed_path = processor.completed_dir / "cmd-001.yaml"
        assert completed_path.exists()

        completed_data = yaml.safe_load(completed_path.read_text())
        assert completed_data["success"] is False

    @pytest.mark.asyncio
    async def test_multiple_commands_processed(self, processor):
        """Multiple commands are processed in order."""
        # Create multiple commands
        for i in range(3):
            cmd = Command(
                command_id=f"cmd-{i:03d}",
                action="move",
                timestamp=datetime.now(timezone.utc),
                position=(i * 100, i * 100)
            )
            cmd_path = processor.pending_dir / f"cmd-{i:03d}.yaml"
            cmd_path.write_text(cmd.to_yaml())

        results = await processor.process_pending()

        assert len(results) == 3
        assert all(r["success"] for r in results)

        # Verify order
        command_ids = [r["command_id"] for r in results]
        assert command_ids == ["cmd-000", "cmd-001", "cmd-002"]

        # All moved to completed
        assert processor.get_completed_count() == 3
        assert processor.get_pending_count() == 0

    @pytest.mark.asyncio
    async def test_all_valid_actions_accepted(self, processor):
        """All valid actions are accepted."""
        # Test each valid action
        valid_actions_tests = {
            "click": {"position": [100, 200]},
            "type": {"text": "Hello"},
            "key": {"keys": ["Enter"]},
            "move": {"position": [300, 400]},
            "scroll": {"direction": "down"},
            "drag": {"position": [500, 600], "target": "element"},
            "resize": {"delta": [100, 50], "target": "window-1"},
            "close": {"target": "window-1"},
            "focus": {"target": "window-2"},
            "menu": {"target": "file-menu"},
        }

        for i, (action, extra) in enumerate(valid_actions_tests.items()):
            cmd_data = {
                "command_id": f"cmd-{i:03d}",
                "action": action,
                "timestamp": datetime.now(timezone.utc).isoformat(),
                **extra
            }

            cmd_path = processor.pending_dir / f"cmd-{i:03d}.yaml"
            cmd_path.write_text(yaml.dump(cmd_data))

        results = await processor.process_pending()

        # All should succeed
        assert len(results) == len(valid_actions_tests)
        for r in results:
            assert r["success"], f"Action failed: {r}"

    def test_clear_completed_all(self, processor):
        """Clear completed removes all files."""
        # Create some completed files
        for i in range(3):
            completed_path = processor.completed_dir / f"cmd-{i}.yaml"
            completed_path.write_text(yaml.dump({
                "command_id": f"cmd-{i}",
                "action": "click",
                "timestamp": datetime.now(timezone.utc).isoformat(),
                "success": True
            }))

        assert processor.get_completed_count() == 3

        removed = processor.clear_completed()

        assert removed == 3
        assert processor.get_completed_count() == 0

    def test_clear_completed_by_age(self, processor):
        """Clear completed respects max_age_hours."""
        import time

        # Create old file
        old_path = processor.completed_dir / "cmd-old.yaml"
        old_path.write_text(yaml.dump({
            "command_id": "cmd-old",
            "action": "click",
            "success": True
        }))

        # Make it old (set mtime to 25 hours ago)
        old_time = time.time() - (25 * 3600)
        os.utime(old_path, (old_time, old_time))

        # Create new file
        new_path = processor.completed_dir / "cmd-new.yaml"
        new_path.write_text(yaml.dump({
            "command_id": "cmd-new",
            "action": "click",
            "success": True
        }))

        assert processor.get_completed_count() == 2

        # Clear only files older than 24 hours
        removed = processor.clear_completed(max_age_hours=24)

        assert removed == 1
        assert processor.get_completed_count() == 1
        assert new_path.exists()
        assert not old_path.exists()

    @pytest.mark.asyncio
    async def test_execution_time_recorded(self, processor):
        """Execution time is recorded in results."""
        cmd = Command(
            command_id="cmd-001",
            action="click",
            timestamp=datetime.now(timezone.utc),
            position=(100, 200)
        )

        cmd_path = processor.pending_dir / "cmd-001.yaml"
        cmd_path.write_text(cmd.to_yaml())

        results = await processor.process_pending()

        assert results[0]["execution_time_ms"] is not None
        assert results[0]["execution_time_ms"] >= 0


import os  # For utime in test
