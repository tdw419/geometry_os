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

        mock_result = SnapshotResult(
            success=True,
            tag="test-tag",
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

        mock_result = SnapshotResult(
            success=False,
            tag="test-tag",
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

        mock_result = SnapshotResult(success=True, tag="restore-tag")

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager
            mock_manager.restore_snapshot.return_value = mock_result

            cmd_snapshot_restore(args)

            mock_manager.restore_snapshot.assert_called_once_with(
                name="restore-container",
                tag="restore-tag"
            )


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
