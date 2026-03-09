"""
Unit tests for PixelRTS CLI snapshot command integration.

Tests the CLI interface for VM snapshot operations:
- snapshot create <container> <tag>
- snapshot list <container>
- snapshot restore <container> <tag>
- snapshot delete <container> <tag>
"""

import pytest
import sys
from io import StringIO
from unittest.mock import patch, MagicMock

from systems.pixel_compiler.pixelrts_cli import (
    cmd_snapshot_create,
    cmd_snapshot_list,
    cmd_snapshot_restore,
    cmd_snapshot_delete,
    main,
)
from systems.pixel_compiler.boot.vm_snapshot import (
    SnapshotResult,
    SnapshotInfo,
    SnapshotState,
    VMSnapshotMetadata,
    RestoreProgress,
    RestoreState,
)
from systems.pixel_compiler.boot.multi_boot_manager import (
    RestoreResult,
    ContainerState,
)


class TestCmdSnapshotCreate:
    """Test cases for cmd_snapshot_create function."""

    def test_create_nonexistent_container_returns_1(self):
        """Test that creating snapshot for non-existent container returns 1."""
        args = MagicMock()
        args.container = "nonexistent"
        args.tag = "test-snapshot"
        args.description = ""
        args.quiet = True
        args.verbose = False

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.create_snapshot.side_effect = ValueError(
                "Container 'nonexistent' does not exist"
            )

            # Capture stderr
            old_stderr = sys.stderr
            sys.stderr = StringIO()

            try:
                result = cmd_snapshot_create(args)
            finally:
                sys.stderr = old_stderr

            assert result == 1, "Should return 1 for nonexistent container"

    def test_create_delegates_to_manager(self):
        """Test that create_snapshot is called with correct arguments."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.description = "Test description"
        args.quiet = True
        args.verbose = False

        mock_result = SnapshotResult(
            success=True,
            tag="test-tag",
            metadata=VMSnapshotMetadata(
                snapshot_id="snap-123",
                tag="test-tag",
                container_name="test-container",
                created_at=None,
                state=SnapshotState.COMPLETE,
                vm_memory="2G",
                description="Test description",
            )
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.create_snapshot.return_value = mock_result

            result = cmd_snapshot_create(args)

            # Verify manager was called with correct args
            mock_manager.create_snapshot.assert_called_once_with(
                name="test-container",
                tag="test-tag",
                description="Test description"
            )
            assert result == 0, "Should return 0 on success"

    def test_create_success_returns_0(self):
        """Test that successful snapshot creation returns 0."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.description = ""
        args.quiet = True
        args.verbose = False

        mock_result = SnapshotResult(
            success=True,
            tag="test-tag",
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.create_snapshot.return_value = mock_result

            result = cmd_snapshot_create(args)
            assert result == 0, "Should return 0 on success"

    def test_create_failure_returns_1(self):
        """Test that failed snapshot creation returns 1."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.description = ""
        args.quiet = True
        args.verbose = False

        mock_result = SnapshotResult(
            success=False,
            tag="test-tag",
            error_message="QEMU monitor not responding"
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.create_snapshot.return_value = mock_result

            # Capture stderr
            old_stderr = sys.stderr
            sys.stderr = StringIO()

            try:
                result = cmd_snapshot_create(args)
            finally:
                sys.stderr = old_stderr

            assert result == 1, "Should return 1 on failure"


class TestCmdSnapshotList:
    """Test cases for cmd_snapshot_list function."""

    def test_list_nonexistent_container_returns_1(self):
        """Test that listing snapshots for non-existent container returns 1."""
        args = MagicMock()
        args.container = "nonexistent"
        args.json = False
        args.quiet = True
        args.verbose = False

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.list_container_snapshots.side_effect = ValueError(
                "Container 'nonexistent' does not exist"
            )

            # Capture stderr
            old_stderr = sys.stderr
            sys.stderr = StringIO()

            try:
                result = cmd_snapshot_list(args)
            finally:
                sys.stderr = old_stderr

            assert result == 1, "Should return 1 for nonexistent container"

    def test_list_empty_snapshots(self):
        """Test listing snapshots when container has none."""
        args = MagicMock()
        args.container = "test-container"
        args.json = False
        args.quiet = True
        args.verbose = False

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.list_container_snapshots.return_value = []

            result = cmd_snapshot_list(args)
            assert result == 0, "Should return 0 even with no snapshots"

    def test_list_shows_snapshots(self):
        """Test listing snapshots displays snapshot info."""
        args = MagicMock()
        args.container = "test-container"
        args.json = False
        args.quiet = False
        args.verbose = False

        mock_snapshots = [
            SnapshotInfo(
                id="1",
                tag="snapshot-1",
                size="100MB",
                date="2024-01-01",
                vm_clock="00:01:00"
            ),
            SnapshotInfo(
                id="2",
                tag="snapshot-2",
                size="200MB",
                date="2024-01-02",
                vm_clock="00:02:00"
            )
        ]

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.list_container_snapshots.return_value = mock_snapshots

            # Capture stdout
            old_stdout = sys.stdout
            sys.stdout = StringIO()

            try:
                result = cmd_snapshot_list(args)
                output = sys.stdout.getvalue()
            finally:
                sys.stdout = old_stdout

            assert result == 0, "Should return 0 on success"
            assert "snapshot-1" in output, "Should show snapshot tag"
            assert "snapshot-2" in output, "Should show second snapshot tag"

    def test_list_delegates_to_manager(self):
        """Test that list_container_snapshots is called with correct container."""
        args = MagicMock()
        args.container = "my-container"
        args.json = False
        args.quiet = True
        args.verbose = False

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.list_container_snapshots.return_value = []

            cmd_snapshot_list(args)

            mock_manager.list_container_snapshots.assert_called_once_with("my-container")


class TestCmdSnapshotRestore:
    """Test cases for cmd_snapshot_restore function."""

    def test_restore_success_returns_0(self):
        """Test that successful restore returns 0."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = True
        args.verbose = False
        args.wait = 0

        mock_result = RestoreResult(
            success=True,
            container_name="test-container",
            snapshot_tag="test-tag",
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result

            result = cmd_snapshot_restore(args)
            assert result == 0, "Should return 0 on success"

    def test_restore_failure_returns_1(self):
        """Test that failed restore returns 1."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = True
        args.verbose = False
        args.wait = 0

        mock_result = RestoreResult(
            success=False,
            container_name="test-container",
            snapshot_tag="test-tag",
            error_message="Snapshot not found"
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result

            # Capture stderr
            old_stderr = sys.stderr
            sys.stderr = StringIO()

            try:
                result = cmd_snapshot_restore(args)
            finally:
                sys.stderr = old_stderr

            assert result == 1, "Should return 1 on failure"

    def test_restore_delegates_to_manager(self):
        """Test that restore_snapshot is called with correct arguments."""
        args = MagicMock()
        args.container = "restore-container"
        args.tag = "restore-tag"
        args.quiet = True
        args.verbose = False
        args.wait = 0

        mock_result = RestoreResult(
            success=True,
            container_name="restore-container",
            snapshot_tag="restore-tag"
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result

            cmd_snapshot_restore(args)

            mock_manager.restore_snapshot.assert_called_once_with(
                name="restore-container",
                tag="restore-tag"
            )


class TestCmdSnapshotRestoreEnhanced:
    """Test cases for enhanced cmd_snapshot_restore function with verbose output."""

    def test_restore_success_shows_identity_preserved(self):
        """Test verbose output shows identity preservation status."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = False
        args.verbose = True
        args.wait = 0

        mock_result = RestoreResult(
            success=True,
            container_name="test-container",
            snapshot_tag="test-tag",
            identity_preserved=True,
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result
            mock_manager.list_containers.return_value = []

            old_stdout = sys.stdout
            sys.stdout = StringIO()

            try:
                result = cmd_snapshot_restore(args)
                output = sys.stdout.getvalue()
            finally:
                sys.stdout = old_stdout

            assert result == 0, "Should return 0 on success"
            assert "Identity preserved: Yes" in output, "Should show identity preserved status"

    def test_restore_success_shows_network_status(self):
        """Test verbose output shows network reconnection status."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = False
        args.verbose = True
        args.wait = 0

        mock_result = RestoreResult(
            success=True,
            container_name="test-container",
            snapshot_tag="test-tag",
            network_reconnected=True,
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result
            mock_manager.list_containers.return_value = []

            old_stdout = sys.stdout
            sys.stdout = StringIO()

            try:
                result = cmd_snapshot_restore(args)
                output = sys.stdout.getvalue()
            finally:
                sys.stdout = old_stdout

            assert result == 0, "Should return 0 on success"
            assert "Network reconnected: Yes" in output, "Should show network status"

    def test_restore_failure_shows_progress_state(self):
        """Test verbose output shows failure state on error."""
        from datetime import datetime

        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = False
        args.verbose = True
        args.wait = 0

        mock_progress = RestoreProgress(
            state=RestoreState.LOADING,
            tag="test-tag",
            started_at=datetime.now(),
            error_message="Load failed"
        )

        mock_result = RestoreResult(
            success=False,
            container_name="test-container",
            snapshot_tag="test-tag",
            error_message="Snapshot not found",
            restore_progress=mock_progress,
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result

            old_stderr = sys.stderr
            sys.stderr = StringIO()

            try:
                result = cmd_snapshot_restore(args)
                output = sys.stderr.getvalue()
            finally:
                sys.stderr = old_stderr

            assert result == 1, "Should return 1 on failure"
            assert "loading" in output.lower(), "Should show failure state"

    def test_restore_uses_restore_result(self):
        """Test that command uses RestoreResult type from multi_boot_manager."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = True
        args.verbose = False
        args.wait = 0

        # Create a RestoreResult (not SnapshotResult)
        mock_result = RestoreResult(
            success=True,
            container_name="test-container",
            snapshot_tag="test-tag",
            identity_preserved=True,
            network_reconnected=True,
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result

            result = cmd_snapshot_restore(args)

            # Verify the result has RestoreResult fields
            assert hasattr(mock_result, 'identity_preserved'), "Should have identity_preserved field"
            assert hasattr(mock_result, 'network_reconnected'), "Should have network_reconnected field"
            assert result == 0, "Should return 0 on success"

    def test_restore_wait_flag(self):
        """Test --wait flag delays completion."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = False
        args.verbose = True
        args.wait = 0.1  # Small wait for fast test

        mock_result = RestoreResult(
            success=True,
            container_name="test-container",
            snapshot_tag="test-tag",
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result
            mock_manager.list_containers.return_value = []

            old_stdout = sys.stdout
            sys.stdout = StringIO()

            try:
                result = cmd_snapshot_restore(args)
                output = sys.stdout.getvalue()
            finally:
                sys.stdout = old_stdout

            assert result == 0, "Should return 0 on success"
            assert "Waiting" in output, "Should show wait message"


class TestCmdSnapshotRestoreVerbose:
    """Test cases for verbose output in cmd_snapshot_restore."""

    def test_verbose_shows_pre_restore_state(self):
        """Test verbose shows container state before restore."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = False
        args.verbose = True
        args.wait = 0

        mock_container = MagicMock()
        mock_container.name = "test-container"
        mock_container.state = ContainerState.RUNNING
        mock_container.resources = MagicMock()
        mock_container.resources.vnc_port = 5900

        mock_result = RestoreResult(
            success=True,
            container_name="test-container",
            snapshot_tag="test-tag",
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result
            mock_manager.list_containers.return_value = [mock_container]

            old_stdout = sys.stdout
            sys.stdout = StringIO()

            try:
                result = cmd_snapshot_restore(args)
                output = sys.stdout.getvalue()
            finally:
                sys.stdout = old_stdout

            assert result == 0, "Should return 0 on success"
            assert "Container state:" in output, "Should show container state"
            assert "VNC port:" in output, "Should show VNC port"

    def test_verbose_shows_duration(self):
        """Test verbose shows restore duration."""
        from datetime import datetime, timedelta

        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = False
        args.verbose = True
        args.wait = 0

        started = datetime.now() - timedelta(seconds=2)
        completed = datetime.now()

        mock_progress = RestoreProgress(
            state=RestoreState.COMPLETE,
            tag="test-tag",
            started_at=started,
            completed_at=completed,
        )

        mock_result = RestoreResult(
            success=True,
            container_name="test-container",
            snapshot_tag="test-tag",
            restore_progress=mock_progress,
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result
            mock_manager.list_containers.return_value = []

            old_stdout = sys.stdout
            sys.stdout = StringIO()

            try:
                result = cmd_snapshot_restore(args)
                output = sys.stdout.getvalue()
            finally:
                sys.stdout = old_stdout

            assert result == 0, "Should return 0 on success"
            assert "Duration:" in output, "Should show duration"

    def test_verbose_shows_vm_state(self):
        """Test verbose shows pre-restore VM state from progress."""
        from datetime import datetime

        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = False
        args.verbose = True
        args.wait = 0

        mock_progress = RestoreProgress(
            state=RestoreState.COMPLETE,
            tag="test-tag",
            started_at=datetime.now(),
            pre_restore_vm_state="running",
        )

        mock_result = RestoreResult(
            success=True,
            container_name="test-container",
            snapshot_tag="test-tag",
            restore_progress=mock_progress,
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result
            mock_manager.list_containers.return_value = []

            old_stdout = sys.stdout
            sys.stdout = StringIO()

            try:
                result = cmd_snapshot_restore(args)
                output = sys.stdout.getvalue()
            finally:
                sys.stdout = old_stdout

            assert result == 0, "Should return 0 on success"
            assert "Pre-restore VM state:" in output, "Should show pre-restore VM state"


class TestCmdSnapshotRestoreErrorHandling:
    """Test cases for error handling in cmd_snapshot_restore."""

    def test_container_not_found_error(self):
        """Test clear error message for container not found."""
        args = MagicMock()
        args.container = "nonexistent"
        args.tag = "test-tag"
        args.quiet = False
        args.verbose = False
        args.wait = 0

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.side_effect = ValueError(
                "Container 'nonexistent' does not exist"
            )

            old_stderr = sys.stderr
            sys.stderr = StringIO()

            try:
                result = cmd_snapshot_restore(args)
                output = sys.stderr.getvalue()
            finally:
                sys.stderr = old_stderr

            assert result == 1, "Should return 1 on error"
            assert "[ERROR]" in output, "Should show error prefix"
            assert "nonexistent" in output, "Should mention container name"

    def test_restore_shows_failure_state(self):
        """Test shows which state failed in verbose mode."""
        from datetime import datetime

        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = False
        args.verbose = True
        args.wait = 0

        mock_progress = RestoreProgress(
            state=RestoreState.VERIFYING,
            tag="test-tag",
            started_at=datetime.now(),
        )

        mock_result = RestoreResult(
            success=False,
            container_name="test-container",
            snapshot_tag="test-tag",
            error_message="VM not responsive",
            restore_progress=mock_progress,
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result

            old_stderr = sys.stderr
            sys.stderr = StringIO()

            try:
                result = cmd_snapshot_restore(args)
                output = sys.stderr.getvalue()
            finally:
                sys.stderr = old_stderr

            assert result == 1, "Should return 1 on failure"
            assert "verifying" in output.lower(), "Should show failure state"

    def test_restore_handles_value_error(self):
        """Test ValueError handled gracefully."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = False
        args.verbose = False
        args.wait = 0

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.side_effect = ValueError(
                "Container is not running"
            )

            old_stderr = sys.stderr
            sys.stderr = StringIO()

            try:
                result = cmd_snapshot_restore(args)
                output = sys.stderr.getvalue()
            finally:
                sys.stderr = old_stderr

            assert result == 1, "Should return 1 on error"
            assert "[ERROR]" in output, "Should show error prefix"

    def test_restore_handles_snapshot_error(self):
        """Test SnapshotError handled gracefully."""
        from systems.pixel_compiler.boot.vm_snapshot import SnapshotError

        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.quiet = False
        args.verbose = False
        args.wait = 0

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.side_effect = SnapshotError(
                "QEMU monitor not available"
            )

            old_stderr = sys.stderr
            sys.stderr = StringIO()

            try:
                result = cmd_snapshot_restore(args)
                output = sys.stderr.getvalue()
            finally:
                sys.stderr = old_stderr

            assert result == 1, "Should return 1 on error"
            assert "[ERROR]" in output, "Should show error prefix"
            assert "Snapshot operation failed" in output, "Should mention snapshot error"


class TestCmdSnapshotDelete:
    """Test cases for cmd_snapshot_delete function."""

    def test_delete_prompts_confirmation(self):
        """Test that delete prompts for confirmation without --force."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.force = False
        args.quiet = True
        args.verbose = False

        mock_result = SnapshotResult(success=True, tag="test-tag")

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.delete_snapshot.return_value = mock_result

            # Mock input() to return 'y'
            with patch('builtins.input', return_value='y'):
                result = cmd_snapshot_delete(args)

            assert result == 0, "Should return 0 after confirmation"

    def test_delete_force_skips_confirmation(self):
        """Test that --force skips confirmation prompt."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.force = True
        args.quiet = True
        args.verbose = False

        mock_result = SnapshotResult(success=True, tag="test-tag")

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.delete_snapshot.return_value = mock_result

            result = cmd_snapshot_delete(args)

            # Should succeed without prompting
            assert result == 0, "Should return 0 with --force"

    def test_delete_success_returns_0(self):
        """Test that successful delete returns 0."""
        args = MagicMock()
        args.container = "test-container"
        args.tag = "test-tag"
        args.force = True
        args.quiet = True
        args.verbose = False

        mock_result = SnapshotResult(success=True, tag="test-tag")

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.delete_snapshot.return_value = mock_result

            result = cmd_snapshot_delete(args)
            assert result == 0, "Should return 0 on success"

    def test_delete_delegates_to_manager(self):
        """Test that delete_snapshot is called with correct arguments."""
        args = MagicMock()
        args.container = "delete-container"
        args.tag = "delete-tag"
        args.force = True
        args.quiet = True
        args.verbose = False

        mock_result = SnapshotResult(success=True, tag="delete-tag")

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.delete_snapshot.return_value = mock_result

            cmd_snapshot_delete(args)

            mock_manager.delete_snapshot.assert_called_once_with(
                name="delete-container",
                tag="delete-tag"
            )


class TestPixelRTSCliSnapshotSubprocess:
    """Test snapshot command via subprocess for full isolation."""

    def test_snapshot_help_via_subprocess(self):
        """Test that 'pixelrts snapshot --help' works."""
        import subprocess

        result = subprocess.run(
            ['python3', '-m', 'systems.pixel_compiler.pixelrts_cli', 'snapshot', '--help'],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        # Should exit 0 and show help
        assert result.returncode == 0, f"Help should return 0, got {result.returncode}"
        assert 'create' in result.stdout.lower(), "Help should mention 'create' subcommand"
        assert 'list' in result.stdout.lower(), "Help should mention 'list' subcommand"

    def test_snapshot_create_help_via_subprocess(self):
        """Test that 'pixelrts snapshot create --help' works."""
        import subprocess

        result = subprocess.run(
            ['python3', '-m', 'systems.pixel_compiler.pixelrts_cli', 'snapshot', 'create', '--help'],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        assert result.returncode == 0, f"Help should return 0, got {result.returncode}"
        assert 'container' in result.stdout.lower(), "Help should mention 'container' argument"
        assert 'tag' in result.stdout.lower(), "Help should mention 'tag' argument"
