"""
GUI Command Processor - Processes AI commands from the command queue.

Watches commands/pending/ directory, validates commands, executes them via
injected executor callback, and moves processed commands to commands/completed/.

Architecture:
- GUICommandProcessor: Scans pending dir, validates, executes, moves to completed
- VALID_ACTIONS: Set of valid command actions (click, type, key, move, scroll, etc.)
- Async processing with executor callback injection

Command Flow:
1. AI writes YAML command to commands/pending/cmd-001.yaml
2. Processor scans pending dir
3. Processor validates command (action, required fields)
4. Processor executes via injected executor callback
5. Processor moves to completed/ with success/error annotation
"""

import os
import shutil
import tempfile
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Awaitable, Callable, Dict, List, Optional
import logging

import yaml

from .models import Command, VALID_ACTIONS

logger = logging.getLogger(__name__)


class CommandValidationError(Exception):
    """Raised when a command fails validation."""
    pass


class CommandExecutionError(Exception):
    """Raised when command execution fails."""
    pass


class GUICommandProcessor:
    """
    Processes AI commands from the command queue.

    Watches commands/pending/ directory, validates commands against
    the schema, executes them via injected executor callback, and
    moves processed commands to commands/completed/.

    The executor callback is injected to allow different execution
    strategies (direct, via GUIProtocol, mocked for testing, etc.).

    Example:
        >>> async def my_executor(cmd: Command) -> None:
        ...     # Execute the command via GUI system
        ...     print(f"Executing: {cmd.action}")
        ...
        >>> processor = GUICommandProcessor(executor=my_executor)
        >>> await processor.process_pending()
    """

    def __init__(
        self,
        executor: Callable[[Command], Awaitable[None]],
        gui_dir: str = ".geometry/gui"
    ):
        """
        Initialize the Command Processor.

        Args:
            executor: Async callback to execute validated commands
            gui_dir: Base directory for GUI command queues
        """
        self.executor = executor
        self.gui_dir = Path(gui_dir)
        self.pending_dir = self.gui_dir / "commands" / "pending"
        self.completed_dir = self.gui_dir / "commands" / "completed"

        # Ensure directories exist
        self.pending_dir.mkdir(parents=True, exist_ok=True)
        self.completed_dir.mkdir(parents=True, exist_ok=True)

    async def process_pending(self) -> List[Dict[str, Any]]:
        """
        Process all pending commands.

        Scans the pending directory, validates each command,
        executes it, and moves it to completed.

        Returns:
            List of processing results with command_id, success, error
        """
        results = []

        # Get all YAML files in pending directory
        pending_files = sorted(self.pending_dir.glob("*.yaml"))

        for cmd_file in pending_files:
            result = await self._process_single_command(cmd_file)
            results.append(result)

        return results

    async def _process_single_command(self, cmd_path: Path) -> Dict[str, Any]:
        """
        Process a single command file.

        Args:
            cmd_path: Path to command YAML file

        Returns:
            Result dict with command_id, success, error, execution_time
        """
        result = {
            "command_id": None,
            "success": False,
            "error": None,
            "execution_time_ms": None
        }

        start_time = datetime.now(timezone.utc)

        try:
            # Load and validate
            cmd = self._load_command(cmd_path)
            result["command_id"] = cmd.command_id

            # Execute
            await self._execute_command(cmd)

            # Success
            result["success"] = True
            self._move_to_completed(cmd_path, success=True, error=None)

        except CommandValidationError as e:
            result["error"] = str(e)
            logger.warning(f"Command validation failed: {cmd_path}: {e}")
            self._move_to_completed(cmd_path, success=False, error=str(e))

        except CommandExecutionError as e:
            result["error"] = str(e)
            logger.error(f"Command execution failed: {cmd_path}: {e}")
            self._move_to_completed(cmd_path, success=False, error=str(e))

        except Exception as e:
            result["error"] = f"Unexpected error: {e}"
            logger.exception(f"Unexpected error processing command: {cmd_path}")
            self._move_to_completed(cmd_path, success=False, error=str(e))

        finally:
            end_time = datetime.now(timezone.utc)
            result["execution_time_ms"] = int(
                (end_time - start_time).total_seconds() * 1000
            )

        return result

    def _load_command(self, cmd_path: Path) -> Command:
        """
        Load and validate a command from YAML file.

        Args:
            cmd_path: Path to command YAML file

        Returns:
            Validated Command object

        Raises:
            CommandValidationError: If command is invalid
        """
        try:
            content = cmd_path.read_text()
            data = yaml.safe_load(content)
        except yaml.YAMLError as e:
            raise CommandValidationError(f"Invalid YAML: {e}")
        except Exception as e:
            raise CommandValidationError(f"Failed to read file: {e}")

        if not isinstance(data, dict):
            raise CommandValidationError("Command must be a YAML mapping")

        # Validate required fields
        if "command_id" not in data:
            raise CommandValidationError("Missing required field: command_id")

        if "action" not in data:
            raise CommandValidationError("Missing required field: action")

        if "timestamp" not in data:
            raise CommandValidationError("Missing required field: timestamp")

        # Validate action
        action = data["action"]
        if action not in VALID_ACTIONS:
            raise CommandValidationError(
                f"Invalid action '{action}'. Valid actions: {sorted(VALID_ACTIONS)}"
            )

        # Validate action-specific fields
        self._validate_action_fields(data)

        # Build Command object (will validate in __post_init__)
        try:
            cmd = Command(
                command_id=data["command_id"],
                action=data["action"],
                timestamp=datetime.fromisoformat(data["timestamp"]),
                target=data.get("target"),
                position=tuple(data["position"]) if data.get("position") else None,
                text=data.get("text"),
                keys=data.get("keys"),
                direction=data.get("direction"),
                delta=tuple(data["delta"]) if data.get("delta") else None,
                metadata=data.get("metadata", {}),
            )
        except ValueError as e:
            raise CommandValidationError(str(e))

        return cmd

    def _validate_action_fields(self, data: Dict[str, Any]) -> None:
        """
        Validate action-specific required fields.

        Args:
            data: Command data dict

        Raises:
            CommandValidationError: If required fields are missing
        """
        action = data["action"]

        # Action-specific validation
        if action == "click" and not data.get("position") and not data.get("target"):
            logger.debug("Click command without position or target - may use default")

        if action == "type" and not data.get("text"):
            raise CommandValidationError("'type' action requires 'text' field")

        if action == "key" and not data.get("keys"):
            raise CommandValidationError("'key' action requires 'keys' field")

        if action == "move" and not data.get("position"):
            raise CommandValidationError("'move' action requires 'position' field")

        if action == "scroll" and not data.get("direction"):
            raise CommandValidationError("'scroll' action requires 'direction' field")

        if action == "drag" and not data.get("position"):
            raise CommandValidationError("'drag' action requires 'position' field (target position)")

        if action == "resize" and not data.get("delta"):
            raise CommandValidationError("'resize' action requires 'delta' field")

        if action == "close" and not data.get("target"):
            logger.debug("Close command without target - may close focused window")

        if action == "focus" and not data.get("target"):
            raise CommandValidationError("'focus' action requires 'target' field")

    async def _execute_command(self, cmd: Command) -> None:
        """
        Execute a validated command.

        Args:
            cmd: Validated Command object

        Raises:
            CommandExecutionError: If execution fails
        """
        try:
            await self.executor(cmd)
            logger.info(f"Executed command: {cmd.command_id} ({cmd.action})")
        except Exception as e:
            raise CommandExecutionError(f"Executor failed: {e}")

    def _move_to_completed(
        self,
        cmd_path: Path,
        success: bool,
        error: Optional[str]
    ) -> None:
        """
        Move processed command to completed directory with status annotation.

        Reads the original command, adds status fields, writes to completed/,
        then removes from pending.

        Args:
            cmd_path: Path to command in pending directory
            success: Whether command executed successfully
            error: Error message if failed, None if succeeded
        """
        try:
            # Read original content
            content = cmd_path.read_text()

            # Try to parse YAML, fall back to raw content wrapper
            try:
                data = yaml.safe_load(content)
                if not isinstance(data, dict):
                    data = {"raw_content": content}
            except yaml.YAMLError:
                # Invalid YAML - wrap in error record
                data = {"raw_content": content}

            # Add completion status
            data["processed_at"] = datetime.now(timezone.utc).isoformat()
            data["success"] = success
            if error:
                data["error"] = error

            # Write to completed directory
            completed_path = self.completed_dir / cmd_path.name

            # Handle duplicate filenames (shouldn't happen with UUIDs but be safe)
            if completed_path.exists():
                base = cmd_path.stem
                suffix = cmd_path.suffix
                counter = 1
                while completed_path.exists():
                    completed_path = self.completed_dir / f"{base}_{counter}{suffix}"
                    counter += 1

            # Atomic write to completed
            fd, temp_path = tempfile.mkstemp(
                dir=self.completed_dir,
                prefix=f".{cmd_path.name}.tmp"
            )
            try:
                with os.fdopen(fd, 'w') as f:
                    yaml.dump(data, f, default_flow_style=False, sort_keys=False)
                os.rename(temp_path, completed_path)
            except Exception:
                try:
                    os.unlink(temp_path)
                except:
                    pass
                raise

            # Remove from pending
            cmd_path.unlink()
            logger.debug(f"Moved command to completed: {cmd_path.name}")

        except Exception as e:
            logger.error(f"Failed to move command to completed: {e}")
            # Don't raise - we don't want to block other commands

    def get_pending_count(self) -> int:
        """Get the number of pending commands."""
        return len(list(self.pending_dir.glob("*.yaml")))

    def get_completed_count(self) -> int:
        """Get the number of completed commands."""
        return len(list(self.completed_dir.glob("*.yaml")))

    def clear_completed(self, max_age_hours: Optional[int] = None) -> int:
        """
        Clear completed commands, optionally filtering by age.

        Args:
            max_age_hours: Only clear commands older than this many hours

        Returns:
            Number of files removed
        """
        removed = 0
        now = datetime.now(timezone.utc)

        for cmd_file in self.completed_dir.glob("*.yaml"):
            if max_age_hours is not None:
                # Check file modification time
                mtime = datetime.fromtimestamp(
                    cmd_file.stat().st_mtime,
                    tz=timezone.utc
                )
                age_hours = (now - mtime).total_seconds() / 3600
                if age_hours < max_age_hours:
                    continue

            cmd_file.unlink()
            removed += 1

        return removed


# Demo / Test
if __name__ == "__main__":
    import asyncio

    async def demo():
        """Demonstrate command processor usage."""
        from tempfile import TemporaryDirectory

        with TemporaryDirectory() as tmpdir:
            # Create mock executor
            executed_commands = []

            async def mock_executor(cmd: Command) -> None:
                print(f"  Executing: {cmd.action} (id={cmd.command_id})")
                executed_commands.append(cmd)

            # Create processor
            gui_dir = Path(tmpdir) / "gui"
            processor = GUICommandProcessor(
                executor=mock_executor,
                gui_dir=str(gui_dir)
            )

            print("=== GUI Command Processor Demo ===\n")

            # Create a test command
            cmd = Command(
                command_id="cmd-001",
                action="click",
                timestamp=datetime.now(timezone.utc),
                position=(100, 200),
                target="button#submit"
            )

            # Write to pending
            pending_file = processor.pending_dir / "cmd-001.yaml"
            pending_file.write_text(cmd.to_yaml())
            print(f"Created command: {cmd.command_id}")
            print(f"  Action: {cmd.action}")
            print(f"  Position: {cmd.position}")
            print(f"  Target: {cmd.target}")

            print(f"\nPending commands: {processor.get_pending_count()}")

            # Process
            print("\nProcessing pending commands...")
            results = await processor.process_pending()

            print(f"\nResults:")
            for r in results:
                print(f"  {r['command_id']}: success={r['success']}, time={r['execution_time_ms']}ms")

            print(f"\nPending: {processor.get_pending_count()}")
            print(f"Completed: {processor.get_completed_count()}")

            # Show completed file
            completed_file = processor.completed_dir / "cmd-001.yaml"
            if completed_file.exists():
                print(f"\nCompleted command file:")
                print(completed_file.read_text())

    asyncio.run(demo())
