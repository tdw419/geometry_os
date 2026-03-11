#!/usr/bin/env python3
"""
Unit tests for SnapshotCommitter class.

Tests the commit pipeline orchestration with mocked dependencies:
- BootBridge: Provides VM access and snapshot creation
- QemuBoot: Provides QEMU monitor commands
- VMSnapshotManager: Creates internal snapshots
- QemuImgWrapper: Extracts snapshots to files

Key test scenarios:
- Full pipeline success
- Verify order: create snapshot -> pause -> extract -> resume
- VM always resumed after success
- VM always resumed after failure
- Auto-generated tags
- Custom tags
- Progress callbacks
"""

from datetime import datetime
from pathlib import Path
from unittest.mock import MagicMock, patch

import pytest

from systems.pixel_compiler.boot.snapshot_committer import (
    CommitProgress,
    CommitResult,
    CommitStage,
    SnapshotCommitter,
)


class TestSnapshotCommitter:
    """Test cases for SnapshotCommitter class."""

    @pytest.fixture
    def mock_boot_bridge(self):
        """Create a mock BootBridge instance."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("/tmp/test.rts.png")
        return bridge

    @pytest.fixture
    def mock_qemu_boot(self):
        """Create a mock QemuBoot instance."""
        qemu = MagicMock()
        qemu.image_path = Path("/tmp/test.qcow2")
        qemu.memory = "2G"
        return qemu

    @pytest.fixture
    def committer(self, mock_boot_bridge):
        """Create a SnapshotCommitter instance with mock BootBridge."""
        return SnapshotCommitter(mock_boot_bridge)

    def test_init_with_none_bridge_raises_error(self):
        """Test that initializing with None boot_bridge raises ValueError."""
        with pytest.raises(ValueError, match="boot_bridge cannot be None"):
            SnapshotCommitter(None)

    def test_init_with_progress_callback(self, mock_boot_bridge):
        """Test that progress callback is stored."""
        callback = MagicMock()
        committer = SnapshotCommitter(mock_boot_bridge, progress_callback=callback)
        assert committer.progress_callback == callback

    def test_commit_success(self, committer, mock_boot_bridge, mock_qemu_boot):
        """Test full pipeline success."""
        # Setup: BootBridge has _qemu attribute
        mock_boot_bridge._qemu = mock_qemu_boot

        # Mock create_snapshot to succeed
        snapshot_result = MagicMock()
        snapshot_result.success = True
        mock_boot_bridge.create_snapshot.return_value = snapshot_result

        # Mock QemuImgWrapper.extract_snapshot to succeed
        with patch('systems.pixel_compiler.boot.snapshot_committer.QemuImgWrapper') as MockQemuImgWrapper:
            mock_wrapper = MagicMock()
            mock_wrapper.extract_snapshot.return_value = MagicMock(
                success=True,
                snapshot_tag="test-tag",
                source_path=Path("/tmp/test.qcow2"),
                output_path=Path("/tmp/output.qcow2.tmp"),
                size_bytes=1024
            )
            MockQemuImgWrapper.return_value = mock_wrapper

            # Mock all Path operations that could fail with mocked stat
            with patch.object(Path, 'stat', return_value=MagicMock(st_size=1024)):
                with patch.object(Path, 'exists', return_value=True):
                    with patch.object(Path, 'rename'):
                        with patch.object(Path, 'mkdir'):
                            result = committer.commit(
                                output_path=Path("/tmp/output.qcow2"),
                                tag="test-tag"
                            )

        # Verify result
        assert result.success is True
        assert result.snapshot_tag == "test-tag"
        assert result.size_bytes == 1024
        assert result.error_message is None

    def test_commit_creates_snapshot_before_pause(self, committer, mock_boot_bridge, mock_qemu_boot):
        """Test that snapshot is created before VM is paused."""
        mock_boot_bridge._qemu = mock_qemu_boot

        # Track call order
        call_order = []

        # Mock create_snapshot
        snapshot_result = MagicMock()
        snapshot_result.success = True

        def track_create_snapshot(tag, description="", timeout=None):
            call_order.append(("create_snapshot", tag))
            return snapshot_result

        mock_boot_bridge.create_snapshot.side_effect = track_create_snapshot

        # Mock pause
        def track_pause(cmd):
            call_order.append(("monitor", cmd))
            return ""

        mock_qemu_boot.send_monitor_command.side_effect = track_pause

        # Mock QemuImgWrapper
        with patch('systems.pixel_compiler.boot.snapshot_committer.QemuImgWrapper') as MockQemuImgWrapper:
            mock_wrapper = MagicMock()
            mock_wrapper.extract_snapshot.return_value = MagicMock(
                success=True,
                snapshot_tag="test-tag"
            )
            MockQemuImgWrapper.return_value = mock_wrapper

            with patch.object(Path, 'stat'):
                with patch.object(Path, 'exists', return_value=True):
                    with patch.object(Path, 'rename'):
                        committer.commit(output_path=Path("/tmp/output.qcow2"), tag="test-tag")

        # Verify order: create_snapshot called before 'stop' command
        assert call_order[0] == ("create_snapshot", "test-tag")
        assert call_order[1] == ("monitor", "stop")

    def test_commit_pauses_vm_before_extraction(self, committer, mock_boot_bridge, mock_qemu_boot):
        """Test that VM is paused before extraction."""
        mock_boot_bridge._qemu = mock_qemu_boot

        # Mock successful operations
        snapshot_result = MagicMock()
        snapshot_result.success = True
        mock_boot_bridge.create_snapshot.return_value = snapshot_result

        with patch('systems.pixel_compiler.boot.snapshot_committer.QemuImgWrapper') as MockQemuImgWrapper:
            mock_wrapper = MagicMock()
            mock_wrapper.extract_snapshot.return_value = MagicMock(success=True)
            MockQemuImgWrapper.return_value = mock_wrapper

            with patch.object(Path, 'stat'), patch.object(Path, 'rename'):
                committer.commit(output_path=Path("/tmp/output.qcow2"), tag="test-tag")

        # Verify pause command was sent
        mock_qemu_boot.send_monitor_command.assert_any_call('stop')

    def test_commit_resumes_vm_after_success(self, committer, mock_boot_bridge, mock_qemu_boot):
        """Test that VM is resumed after successful commit."""
        mock_boot_bridge._qemu = mock_qemu_boot

        # Mock successful operations
        snapshot_result = MagicMock()
        snapshot_result.success = True
        mock_boot_bridge.create_snapshot.return_value = snapshot_result

        with patch('systems.pixel_compiler.boot.snapshot_committer.QemuImgWrapper') as MockQemuImgWrapper:
            mock_wrapper = MagicMock()
            mock_wrapper.extract_snapshot.return_value = MagicMock(success=True)
            MockQemuImgWrapper.return_value = mock_wrapper

            with patch.object(Path, 'stat'), patch.object(Path, 'rename'):
                committer.commit(output_path=Path("/tmp/output.qcow2"), tag="test-tag")

        # Verify resume command was sent
        mock_qemu_boot.send_monitor_command.assert_any_call('cont')

    def test_commit_resumes_vm_after_failure(self, committer, mock_boot_bridge, mock_qemu_boot):
        """Test that VM is resumed even if extraction fails."""
        mock_boot_bridge._qemu = mock_qemu_boot

        # Mock snapshot creation success
        snapshot_result = MagicMock()
        snapshot_result.success = True
        mock_boot_bridge.create_snapshot.return_value = snapshot_result

        # Mock extraction failure
        with patch('systems.pixel_compiler.boot.snapshot_committer.QemuImgWrapper') as MockQemuImgWrapper:
            mock_wrapper = MagicMock()
            mock_wrapper.extract_snapshot.return_value = MagicMock(
                success=False,
                error_message="Extraction failed"
            )
            MockQemuImgWrapper.return_value = mock_wrapper

            result = committer.commit(output_path=Path("/tmp/output.qcow2"), tag="test-tag")

        # Verify result is failure
        assert result.success is False
        assert "Extraction failed" in result.error_message

        # Verify VM was still resumed
        mock_qemu_boot.send_monitor_command.assert_any_call('cont')

    def test_commit_resumes_vm_after_snapshot_failure(self, committer, mock_boot_bridge, mock_qemu_boot):
        """Test that VM is resumed if snapshot creation fails (though VM wasn't paused yet)."""
        mock_boot_bridge._qemu = mock_qemu_boot

        # Mock snapshot creation failure
        snapshot_result = MagicMock()
        snapshot_result.success = False
        snapshot_result.error_message = "Snapshot failed"
        mock_boot_bridge.create_snapshot.return_value = snapshot_result

        result = committer.commit(output_path=Path("/tmp/output.qcow2"), tag="test-tag")

        # Verify result is failure
        assert result.success is False
        assert "Snapshot failed" in result.error_message

        # VM should not have been paused or resumed
        mock_qemu_boot.send_monitor_command.assert_not_called()

    def test_commit_auto_generates_tag(self, committer, mock_boot_bridge, mock_qemu_boot):
        """Test that tag is auto-generated if not provided."""
        mock_boot_bridge._qemu = mock_qemu_boot

        # Mock successful operations
        snapshot_result = MagicMock()
        snapshot_result.success = True

        def check_tag(tag, description="", timeout=None):
            # Verify tag format: commit-YYYYMMDD-HHMMSS
            assert tag.startswith("commit-")
            assert len(tag) == 21  # "commit-" + 8 + "-" + 6 = 21
            return snapshot_result

        mock_boot_bridge.create_snapshot.side_effect = check_tag

        with patch('systems.pixel_compiler.boot.snapshot_committer.QemuImgWrapper') as MockQemuImgWrapper:
            mock_wrapper = MagicMock()
            mock_wrapper.extract_snapshot.return_value = MagicMock(success=True)
            MockQemuImgWrapper.return_value = mock_wrapper

            with patch.object(Path, 'stat'), patch.object(Path, 'rename'):
                result = committer.commit(output_path=Path("/tmp/output.qcow2"))

        # Verify result has auto-generated tag
        assert result.snapshot_tag.startswith("commit-")

    def test_commit_with_custom_tag(self, committer, mock_boot_bridge, mock_qemu_boot):
        """Test that custom tag is used when provided."""
        mock_boot_bridge._qemu = mock_qemu_boot

        # Mock successful operations
        snapshot_result = MagicMock()
        snapshot_result.success = True
        mock_boot_bridge.create_snapshot.return_value = snapshot_result

        with patch('systems.pixel_compiler.boot.snapshot_committer.QemuImgWrapper') as MockQemuImgWrapper:
            mock_wrapper = MagicMock()
            mock_wrapper.extract_snapshot.return_value = MagicMock(success=True)
            MockQemuImgWrapper.return_value = mock_wrapper

            with patch.object(Path, 'stat'), patch.object(Path, 'rename'):
                result = committer.commit(
                    output_path=Path("/tmp/output.qcow2"),
                    tag="my-custom-tag"
                )

        # Verify custom tag was used
        assert result.snapshot_tag == "my-custom-tag"
        mock_boot_bridge.create_snapshot.assert_called_once()
        call_args = mock_boot_bridge.create_snapshot.call_args
        assert call_args[0][0] == "my-custom-tag"

    def test_progress_callback(self, mock_boot_bridge, mock_qemu_boot):
        """Test that progress callback is called during commit."""
        mock_boot_bridge._qemu = mock_qemu_boot

        # Track progress updates - capture stage at callback time to avoid mutation issues
        stages_seen = []
        messages_seen = []

        def progress_callback(progress):
            stages_seen.append(progress.stage)
            messages_seen.append(progress.message)

        committer = SnapshotCommitter(mock_boot_bridge, progress_callback=progress_callback)

        # Mock successful operations
        snapshot_result = MagicMock()
        snapshot_result.success = True
        mock_boot_bridge.create_snapshot.return_value = snapshot_result

        # Mock QEMU monitor commands
        mock_qemu_boot.send_monitor_command.return_value = ""

        with patch('systems.pixel_compiler.boot.snapshot_committer.QemuImgWrapper') as MockQemuImgWrapper:
            mock_wrapper = MagicMock()
            mock_wrapper.extract_snapshot.return_value = MagicMock(success=True)
            MockQemuImgWrapper.return_value = mock_wrapper

            with patch.object(Path, 'stat', return_value=MagicMock(st_size=1024)):
                with patch.object(Path, 'exists', return_value=True):
                    with patch.object(Path, 'rename'):
                        with patch.object(Path, 'mkdir'):
                            result = committer.commit(output_path=Path("/tmp/output.qcow2"), tag="test-tag")

        # Verify commit succeeded
        assert result.success is True

        # Verify progress was updated multiple times
        assert len(stages_seen) > 0

        # Verify stages were hit
        assert CommitStage.CREATING_SNAPSHOT in stages_seen
        assert CommitStage.PAUSING_VM in stages_seen
        assert CommitStage.EXTRACTING in stages_seen
        assert CommitStage.RESUMING_VM in stages_seen
        assert CommitStage.COMPLETE in stages_seen

    def test_commit_failure_if_vm_not_booted(self, committer, mock_boot_bridge):
        """Test that commit fails if VM is not booted."""
        # No _qemu attribute means VM not booted
        del mock_boot_bridge._qemu

        result = committer.commit(output_path=Path("/tmp/output.qcow2"), tag="test-tag")

        assert result.success is False
        assert "not booted" in result.error_message.lower()

    def test_commit_creates_output_directory(self, committer, mock_boot_bridge, mock_qemu_boot):
        """Test that output directory is created if it doesn't exist."""
        mock_boot_bridge._qemu = mock_qemu_boot

        # Mock successful operations
        snapshot_result = MagicMock()
        snapshot_result.success = True
        mock_boot_bridge.create_snapshot.return_value = snapshot_result

        with patch('systems.pixel_compiler.boot.snapshot_committer.QemuImgWrapper') as MockQemuImgWrapper:
            mock_wrapper = MagicMock()
            mock_wrapper.extract_snapshot.return_value = MagicMock(success=True)
            MockQemuImgWrapper.return_value = mock_wrapper

            with patch.object(Path, 'mkdir') as mock_mkdir, patch.object(Path, 'stat'):
                with patch.object(Path, 'rename'):
                    committer.commit(output_path=Path("/new/dir/output.qcow2"), tag="test-tag")

        # Verify mkdir was called with parents=True
        mock_mkdir.assert_called_once_with(parents=True, exist_ok=True)


class TestCommitStage:
    """Test cases for CommitStage enum."""

    def test_all_stages_exist(self):
        """Test that all expected stages exist."""
        expected_stages = [
            "IDLE",
            "CREATING_SNAPSHOT",
            "PAUSING_VM",
            "EXTRACTING",
            "RESUMING_VM",
            "COMPLETE",
            "FAILED"
        ]
        for stage_name in expected_stages:
            assert hasattr(CommitStage, stage_name)

    def test_stage_values(self):
        """Test that stage values are lowercase."""
        assert CommitStage.IDLE.value == "idle"
        assert CommitStage.COMPLETE.value == "complete"
        assert CommitStage.FAILED.value == "failed"


class TestCommitProgress:
    """Test cases for CommitProgress dataclass."""

    def test_to_dict(self):
        """Test that to_dict returns correct structure."""
        progress = CommitProgress(
            stage=CommitStage.EXTRACTING,
            started_at=datetime(2024, 1, 15, 10, 30, 0),
            message="Extracting...",
            bytes_extracted=1024
        )

        result = progress.to_dict()

        assert result["stage"] == "extracting"
        assert result["started_at"] == "2024-01-15T10:30:00"
        assert result["message"] == "Extracting..."
        assert result["bytes_extracted"] == 1024
        assert result["completed_at"] is None

    def test_to_dict_with_completed_at(self):
        """Test to_dict with completed_at set."""
        progress = CommitProgress(
            stage=CommitStage.COMPLETE,
            started_at=datetime(2024, 1, 15, 10, 30, 0),
            completed_at=datetime(2024, 1, 15, 10, 35, 0)
        )

        result = progress.to_dict()

        assert result["completed_at"] == "2024-01-15T10:35:00"


class TestCommitResult:
    """Test cases for CommitResult dataclass."""

    def test_to_dict_success(self):
        """Test to_dict for successful result."""
        progress = CommitProgress(
            stage=CommitStage.COMPLETE,
            started_at=datetime(2024, 1, 15, 10, 30, 0)
        )
        result = CommitResult(
            success=True,
            output_path=Path("/tmp/output.qcow2"),
            snapshot_tag="test-tag",
            size_bytes=1024,
            progress=progress
        )

        d = result.to_dict()

        assert d["success"] is True
        assert d["output_path"] == "/tmp/output.qcow2"
        assert d["snapshot_tag"] == "test-tag"
        assert d["size_bytes"] == 1024
        assert d["error_message"] is None
        assert d["progress"]["stage"] == "complete"

    def test_to_dict_failure(self):
        """Test to_dict for failed result."""
        result = CommitResult(
            success=False,
            output_path=None,
            snapshot_tag="test-tag",
            error_message="Something went wrong"
        )

        d = result.to_dict()

        assert d["success"] is False
        assert d["output_path"] is None
        assert d["error_message"] == "Something went wrong"
