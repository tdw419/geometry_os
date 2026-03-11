"""
Tests for CLI commit command.

Tests the commit subcommand that commits running containers to .rts.png files.
"""

from pathlib import Path
from unittest.mock import MagicMock, patch


class TestCommitCommandValidation:
    """Tests for commit command input validation."""

    def test_commit_container_not_found(self):
        """Commit command fails when container not in MultiBootManager."""
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="nonexistent",
            output="/tmp/test.rts.png",
            snapshot=None,
            no_verify=False,
            timeout=600,
            quiet=False,
            verbose=False
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            mock_manager.get_container.return_value = None
            MockManager.return_value = mock_manager

            result = cmd_commit(args)

            assert result == 1
            mock_manager.get_container.assert_called_once_with("nonexistent")

    def test_commit_output_wrong_extension(self):
        """Commit command fails if output doesn't end with .rts.png."""
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="test-container",
            output="/tmp/test.png",  # Wrong extension
            snapshot=None,
            no_verify=False,
            timeout=600,
            quiet=False,
            verbose=False
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            MockManager.return_value = mock_manager

            result = cmd_commit(args)
            assert result == 1


class TestCommitCommandExecution:
    """Tests for commit command execution flow."""

    def test_commit_success(self):
        """Commit command succeeds with valid container and output."""

        from systems.pixel_compiler.boot.snapshot_exporter import ExportResult
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="test-container",
            output="/tmp/test.rts.png",
            snapshot=None,
            no_verify=False,
            timeout=600,
            quiet=True,  # Suppress output
            verbose=False
        )

        # Create mock export result
        mock_result = ExportResult(
            success=True,
            output_path=Path("/tmp/test.rts.png"),
            size_bytes=1024 * 1024,  # 1MB
            snapshot_tag="auto-snap-123",
            verified=True
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager, \
             patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotExporter') as MockExporter:

            # Setup mock container
            mock_manager = MagicMock()
            mock_container = {
                'boot_bridge': MagicMock()
            }
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            # Setup mock exporter
            mock_exporter_instance = MagicMock()
            mock_exporter_instance.export.return_value = mock_result
            MockExporter.return_value = mock_exporter_instance

            result = cmd_commit(args)

            assert result == 0
            MockExporter.assert_called_once()
            mock_exporter_instance.export.assert_called_once_with(
                output_path=Path("/tmp/test.rts.png"),
                tag=None,
                timeout=600,
                verify=True
            )

    def test_commit_with_snapshot_tag(self):
        """Commit command passes snapshot tag to exporter."""
        from systems.pixel_compiler.boot.snapshot_exporter import ExportResult
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="test-container",
            output="/tmp/test.rts.png",
            snapshot="my-snapshot",
            no_verify=False,
            timeout=600,
            quiet=True,
            verbose=False
        )

        mock_result = ExportResult(
            success=True,
            output_path=Path("/tmp/test.rts.png"),
            size_bytes=1024
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager, \
             patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotExporter') as MockExporter:

            mock_manager = MagicMock()
            mock_container = {'boot_bridge': MagicMock()}
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            mock_exporter_instance = MagicMock()
            mock_exporter_instance.export.return_value = mock_result
            MockExporter.return_value = mock_exporter_instance

            result = cmd_commit(args)

            assert result == 0
            mock_exporter_instance.export.assert_called_once()
            call_kwargs = mock_exporter_instance.export.call_args.kwargs
            assert call_kwargs['tag'] == "my-snapshot"

    def test_commit_with_no_verify(self):
        """Commit command passes verify=False when --no-verify flag set."""
        from systems.pixel_compiler.boot.snapshot_exporter import ExportResult
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="test-container",
            output="/tmp/test.rts.png",
            snapshot=None,
            no_verify=True,
            timeout=600,
            quiet=True,
            verbose=False
        )

        mock_result = ExportResult(
            success=True,
            output_path=Path("/tmp/test.rts.png"),
            size_bytes=1024,
            verified=False
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager, \
             patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotExporter') as MockExporter:

            mock_manager = MagicMock()
            mock_container = {'boot_bridge': MagicMock()}
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            mock_exporter_instance = MagicMock()
            mock_exporter_instance.export.return_value = mock_result
            MockExporter.return_value = mock_exporter_instance

            result = cmd_commit(args)

            assert result == 0
            mock_exporter_instance.export.assert_called_once()
            call_kwargs = mock_exporter_instance.export.call_args.kwargs
            assert call_kwargs['verify'] is False

    def test_commit_with_custom_timeout(self):
        """Commit command passes custom timeout to exporter."""
        from systems.pixel_compiler.boot.snapshot_exporter import ExportResult
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="test-container",
            output="/tmp/test.rts.png",
            snapshot=None,
            no_verify=False,
            timeout=1200,  # Custom timeout
            quiet=True,
            verbose=False
        )

        mock_result = ExportResult(
            success=True,
            output_path=Path("/tmp/test.rts.png"),
            size_bytes=1024
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager, \
             patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotExporter') as MockExporter:

            mock_manager = MagicMock()
            mock_container = {'boot_bridge': MagicMock()}
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            mock_exporter_instance = MagicMock()
            mock_exporter_instance.export.return_value = mock_result
            MockExporter.return_value = mock_exporter_instance

            result = cmd_commit(args)

            assert result == 0
            mock_exporter_instance.export.assert_called_once()
            call_kwargs = mock_exporter_instance.export.call_args.kwargs
            assert call_kwargs['timeout'] == 1200


class TestCommitErrorHandling:
    """Tests for commit command error handling."""

    def test_commit_export_failure(self):
        """Commit command handles export failure gracefully."""
        from systems.pixel_compiler.boot.snapshot_exporter import ExportResult
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="test-container",
            output="/tmp/test.rts.png",
            snapshot=None,
            no_verify=False,
            timeout=600,
            quiet=True,
            verbose=False
        )

        mock_result = ExportResult(
            success=False,
            output_path=None,
            error_message="Disk extraction failed"
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager, \
             patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotExporter') as MockExporter:

            mock_manager = MagicMock()
            mock_container = {'boot_bridge': MagicMock()}
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            mock_exporter_instance = MagicMock()
            mock_exporter_instance.export.return_value = mock_result
            MockExporter.return_value = mock_exporter_instance

            result = cmd_commit(args)

            assert result == 1

    def test_commit_no_boot_bridge(self):
        """Commit command fails when container has no boot_bridge."""
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="test-container",
            output="/tmp/test.rts.png",
            snapshot=None,
            no_verify=False,
            timeout=600,
            quiet=False,
            verbose=False
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager:
            mock_manager = MagicMock()
            # Container exists but has no boot_bridge
            mock_container = {'name': 'test-container'}
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            result = cmd_commit(args)

            assert result == 1

    def test_commit_exporter_exception(self):
        """Commit command handles exporter exceptions."""
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="test-container",
            output="/tmp/test.rts.png",
            snapshot=None,
            no_verify=False,
            timeout=600,
            quiet=True,
            verbose=False
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager, \
             patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotExporter') as MockExporter:

            mock_manager = MagicMock()
            mock_container = {'boot_bridge': MagicMock()}
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            # Make exporter raise exception
            MockExporter.side_effect = RuntimeError("Exporter init failed")

            result = cmd_commit(args)

            assert result == 1


class TestCommitProgressOutput:
    """Tests for commit command progress output."""

    def test_commit_shows_progress_when_not_quiet(self):
        """Commit command shows progress output when quiet=False."""
        from systems.pixel_compiler.boot.snapshot_exporter import (
            ExportResult,
        )
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="test-container",
            output="/tmp/test.rts.png",
            snapshot=None,
            no_verify=False,
            timeout=600,
            quiet=False,
            verbose=False
        )

        mock_result = ExportResult(
            success=True,
            output_path=Path("/tmp/test.rts.png"),
            size_bytes=1024 * 1024
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager, \
             patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotExporter') as MockExporter:

            mock_manager = MagicMock()
            mock_container = {'boot_bridge': MagicMock()}
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            mock_exporter_instance = MagicMock()
            mock_exporter_instance.export.return_value = mock_result
            MockExporter.return_value = mock_exporter_instance

            result = cmd_commit(args)

            assert result == 0
            # Verify progress_callback was passed
            assert MockExporter.call_args.kwargs.get('progress_callback') is not None

    def test_commit_verbose_mode(self):
        """Commit command shows verbose output when verbose=True."""
        from systems.pixel_compiler.boot.snapshot_exporter import ExportResult
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="test-container",
            output="/tmp/test.rts.png",
            snapshot=None,
            no_verify=False,
            timeout=600,
            quiet=False,
            verbose=True
        )

        mock_result = ExportResult(
            success=True,
            output_path=Path("/tmp/test.rts.png"),
            size_bytes=1024 * 1024
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager, \
             patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotExporter') as MockExporter:

            mock_manager = MagicMock()
            mock_container = {'boot_bridge': MagicMock()}
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            mock_exporter_instance = MagicMock()
            mock_exporter_instance.export.return_value = mock_result
            MockExporter.return_value = mock_exporter_instance

            result = cmd_commit(args)

            assert result == 0


class TestCommitEphemeralContainer:
    """Tests for commit command with ephemeral containers."""

    def test_commit_ephemeral_container_saves_changes(self):
        """Commit from ephemeral container works the same as regular container."""
        from systems.pixel_compiler.boot.snapshot_exporter import ExportResult
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="ephemeral-container",
            output="/tmp/output.rts.png",
            snapshot=None,
            no_verify=False,
            timeout=600,
            quiet=True,
            verbose=False
        )

        mock_result = ExportResult(
            success=True,
            output_path=Path("/tmp/output.rts.png"),
            size_bytes=1024 * 1024
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager, \
             patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotExporter') as MockExporter:

            mock_manager = MagicMock()
            # Ephemeral container has is_ephemeral=True
            mock_container = {
                'boot_bridge': MagicMock(),
                'is_ephemeral': True
            }
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            mock_exporter_instance = MagicMock()
            mock_exporter_instance.export.return_value = mock_result
            MockExporter.return_value = mock_exporter_instance

            result = cmd_commit(args)

            # Commit should succeed
            assert result == 0
            # Export should have been called
            mock_exporter_instance.export.assert_called_once()

    def test_commit_ephemeral_shows_info_message(self):
        """Commit command shows informational message for ephemeral containers."""
        from io import StringIO

        from systems.pixel_compiler.boot.snapshot_exporter import ExportResult
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="ephemeral-container",
            output="/tmp/output.rts.png",
            snapshot=None,
            no_verify=False,
            timeout=600,
            quiet=False,  # Not quiet - should show message
            verbose=False
        )

        mock_result = ExportResult(
            success=True,
            output_path=Path("/tmp/output.rts.png"),
            size_bytes=1024 * 1024
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager, \
             patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotExporter') as MockExporter, \
             patch('sys.stdout', new_callable=StringIO) as mock_stdout:

            mock_manager = MagicMock()
            mock_container = {
                'boot_bridge': MagicMock(),
                'is_ephemeral': True
            }
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            mock_exporter_instance = MagicMock()
            mock_exporter_instance.export.return_value = mock_result
            MockExporter.return_value = mock_exporter_instance

            result = cmd_commit(args)

            output = mock_stdout.getvalue()
            # Should show the ephemeral note
            assert "Note: Committing ephemeral container 'ephemeral-container'" in output
            assert result == 0

    def test_commit_ephemeral_no_message_when_quiet(self):
        """Commit command does not show ephemeral note when quiet=True."""
        from io import StringIO

        from systems.pixel_compiler.boot.snapshot_exporter import ExportResult
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="ephemeral-container",
            output="/tmp/output.rts.png",
            snapshot=None,
            no_verify=False,
            timeout=600,
            quiet=True,  # Quiet mode - should not show message
            verbose=False
        )

        mock_result = ExportResult(
            success=True,
            output_path=Path("/tmp/output.rts.png"),
            size_bytes=1024 * 1024
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager, \
             patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotExporter') as MockExporter, \
             patch('sys.stdout', new_callable=StringIO) as mock_stdout:

            mock_manager = MagicMock()
            mock_container = {
                'boot_bridge': MagicMock(),
                'is_ephemeral': True
            }
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            mock_exporter_instance = MagicMock()
            mock_exporter_instance.export.return_value = mock_result
            MockExporter.return_value = mock_exporter_instance

            result = cmd_commit(args)

            output = mock_stdout.getvalue()
            # Should NOT show the ephemeral note when quiet
            assert "Note: Committing ephemeral" not in output
            assert result == 0

    def test_commit_non_ephemeral_no_message(self):
        """Commit command does not show ephemeral note for regular containers."""
        from io import StringIO

        from systems.pixel_compiler.boot.snapshot_exporter import ExportResult
        from systems.pixel_compiler.pixelrts_cli import cmd_commit

        args = MagicMock(
            container="regular-container",
            output="/tmp/output.rts.png",
            snapshot=None,
            no_verify=False,
            timeout=600,
            quiet=False,
            verbose=False
        )

        mock_result = ExportResult(
            success=True,
            output_path=Path("/tmp/output.rts.png"),
            size_bytes=1024 * 1024
        )

        with patch('systems.pixel_compiler.boot.MultiBootManager') as MockManager, \
             patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotExporter') as MockExporter, \
             patch('sys.stdout', new_callable=StringIO) as mock_stdout:

            mock_manager = MagicMock()
            # Regular container - is_ephemeral is False or not present
            mock_container = {
                'boot_bridge': MagicMock(),
                'is_ephemeral': False
            }
            mock_manager.get_container.return_value = mock_container
            MockManager.return_value = mock_manager

            mock_exporter_instance = MagicMock()
            mock_exporter_instance.export.return_value = mock_result
            MockExporter.return_value = mock_exporter_instance

            result = cmd_commit(args)

            output = mock_stdout.getvalue()
            # Should NOT show the ephemeral note for regular containers
            assert "Note: Committing ephemeral" not in output
            assert result == 0
