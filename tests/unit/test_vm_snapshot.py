#!/usr/bin/env python3
"""
Unit tests for VMSnapshotManager class.

Tests cover:
- SnapshotState enum values
- VMSnapshotMetadata serialization/deserialization
- SnapshotResult creation
- SnapshotInfo creation
- VMSnapshotManager initialization
- Tag validation
- Snapshot list parsing
- Timeout calculation (SNAP-03 performance verification)
"""

from datetime import datetime
from unittest.mock import Mock

import pytest

from systems.pixel_compiler.boot.vm_snapshot import (
    RestoreProgress,
    RestoreState,
    SnapshotError,
    SnapshotInfo,
    SnapshotResult,
    SnapshotState,
    VMSnapshotManager,
    VMSnapshotMetadata,
)


class TestSnapshotState:
    """Tests for SnapshotState enum."""

    def test_state_values(self):
        """Verify all state values are correct."""
        assert SnapshotState.CREATING.value == "creating"
        assert SnapshotState.COMPLETE.value == "complete"
        assert SnapshotState.PARTIAL.value == "partial"
        assert SnapshotState.CORRUPTED.value == "corrupted"
        assert SnapshotState.DELETING.value == "deleting"

    def test_state_count(self):
        """Verify we have all expected states."""
        states = list(SnapshotState)
        assert len(states) == 5


class TestVMSnapshotMetadata:
    """Tests for VMSnapshotMetadata dataclass."""

    def test_metadata_creation(self):
        """Test creating metadata with required fields."""
        metadata = VMSnapshotMetadata(
            snapshot_id="snap_001",
            tag="test-snapshot",
            container_name="test-container",
            created_at=datetime(2024, 1, 15, 14, 30, 0),
            state=SnapshotState.COMPLETE,
            vm_memory="2G"
        )
        assert metadata.snapshot_id == "snap_001"
        assert metadata.tag == "test-snapshot"
        assert metadata.container_name == "test-container"
        assert metadata.state == SnapshotState.COMPLETE
        assert metadata.vm_memory == "2G"
        assert metadata.description is None
        assert metadata.size_bytes == 0

    def test_metadata_to_dict(self):
        """Test serialization to dictionary."""
        metadata = VMSnapshotMetadata(
            snapshot_id="snap_001",
            tag="test-snapshot",
            container_name="test-container",
            created_at=datetime(2024, 1, 15, 14, 30, 0),
            state=SnapshotState.COMPLETE,
            vm_memory="2G",
            description="Test snapshot",
            size_bytes=1024
        )
        result = metadata.to_dict()

        assert result["snapshot_id"] == "snap_001"
        assert result["tag"] == "test-snapshot"
        assert result["container_name"] == "test-container"
        assert result["created_at"] == "2024-01-15T14:30:00"
        assert result["state"] == "complete"
        assert result["vm_memory"] == "2G"
        assert result["description"] == "Test snapshot"
        assert result["size_bytes"] == 1024

    def test_metadata_from_dict(self):
        """Test deserialization from dictionary."""
        data = {
            "snapshot_id": "snap_001",
            "tag": "test-snapshot",
            "container_name": "test-container",
            "created_at": "2024-01-15T14:30:00",
            "state": "complete",
            "vm_memory": "2G",
            "description": "Test snapshot",
            "size_bytes": 2048
        }
        metadata = VMSnapshotMetadata.from_dict(data)

        assert metadata.snapshot_id == "snap_001"
        assert metadata.tag == "test-snapshot"
        assert metadata.container_name == "test-container"
        assert metadata.created_at == datetime(2024, 1, 15, 14, 30, 0)
        assert metadata.state == SnapshotState.COMPLETE
        assert metadata.vm_memory == "2G"
        assert metadata.description == "Test snapshot"
        assert metadata.size_bytes == 2048

    def test_metadata_optional_fields(self):
        """Test that optional fields have correct defaults."""
        metadata = VMSnapshotMetadata(
            snapshot_id="snap_001",
            tag="test",
            container_name="test-container",
            created_at=datetime.now(),
            state=SnapshotState.CREATING,
            vm_memory="1G"
        )
        assert metadata.description is None
        assert metadata.size_bytes == 0


class TestSnapshotResult:
    """Tests for SnapshotResult dataclass."""

    def test_success_result(self):
        """Test creating a success result."""
        metadata = VMSnapshotMetadata(
            snapshot_id="snap_001",
            tag="test",
            container_name="test-container",
            created_at=datetime.now(),
            state=SnapshotState.COMPLETE,
            vm_memory="2G"
        )
        result = SnapshotResult(
            success=True,
            tag="test-snapshot",
            metadata=metadata
        )
        assert result.success is True
        assert result.tag == "test-snapshot"
        assert result.metadata == metadata
        assert result.error_message is None

    def test_failure_result(self):
        """Test creating a failure result with error_message."""
        result = SnapshotResult(
            success=False,
            tag="test-snapshot",
            error_message="VM is not running"
        )
        assert result.success is False
        assert result.tag == "test-snapshot"
        assert result.metadata is None
        assert result.error_message == "VM is not running"


class TestSnapshotInfo:
    """Tests for SnapshotInfo dataclass."""

    def test_info_creation(self):
        """Test creating SnapshotInfo with all fields."""
        info = SnapshotInfo(
            id=1,
            tag="snapshot-1",
            size="2.5 GB",
            date="2024-01-15 14:30:00",
            vm_clock="00:01:23.456"
        )
        assert info.id == 1
        assert info.tag == "snapshot-1"
        assert info.size == "2.5 GB"
        assert info.date == "2024-01-15 14:30:00"
        assert info.vm_clock == "00:01:23.456"


class TestVMSnapshotManagerInit:
    """Tests for VMSnapshotManager initialization."""

    def test_init_stores_references(self):
        """Test that initialization stores qemu_boot and container_name."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test-container")

        assert manager.qemu_boot == mock_qemu
        assert manager.container_name == "test-container"

    def test_init_requires_qemu_boot(self):
        """Test that initialization raises on None qemu_boot."""
        with pytest.raises(ValueError, match="qemu_boot cannot be None"):
            VMSnapshotManager(None, "test-container")


class TestTagValidation:
    """Tests for snapshot tag validation."""

    def test_valid_tag_alphanumeric(self):
        """Test that alphanumeric tags are accepted."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        # Should not raise
        manager._validate_tag("snapshot123")

    def test_valid_tag_with_dash(self):
        """Test that tags with dashes are accepted."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        # Should not raise
        manager._validate_tag("my-snapshot")

    def test_valid_tag_with_underscore(self):
        """Test that tags with underscores are accepted."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        # Should not raise
        manager._validate_tag("my_snapshot")

    def test_valid_tag_combined(self):
        """Test tag with alphanumeric, dash, and underscore."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        # Should not raise
        manager._validate_tag("my-snapshot_v2")

    def test_invalid_tag_with_space(self):
        """Test that tags with spaces raise SnapshotError."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        with pytest.raises(SnapshotError, match="Invalid snapshot tag"):
            manager._validate_tag("my snapshot")

    def test_invalid_tag_with_special_chars(self):
        """Test that tags with special characters raise SnapshotError."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        with pytest.raises(SnapshotError, match="Invalid snapshot tag"):
            manager._validate_tag("snapshot@test")

    def test_invalid_tag_empty(self):
        """Test that empty tags raise SnapshotError."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        with pytest.raises(SnapshotError, match="cannot be empty"):
            manager._validate_tag("")

    def test_invalid_tag_with_dot(self):
        """Test that tags with dots raise SnapshotError."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        with pytest.raises(SnapshotError, match="Invalid snapshot tag"):
            manager._validate_tag("snapshot.v1")


class TestSnapshotListParsing:
    """Tests for parsing 'info snapshots' output."""

    def test_parse_empty_snapshots(self):
        """Test parsing empty output returns empty list."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        result = manager._parse_snapshot_list("")
        assert result == []

    def test_parse_no_snapshots_header_only(self):
        """Test parsing output with only header lines."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        output = "ID  TAG               VM SIZE                DATE     VM CLOCK\n--- ---                -------                ----     --------"
        result = manager._parse_snapshot_list(output)
        assert result == []

    def test_parse_single_snapshot(self):
        """Test parsing single snapshot entry."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        output = """ID  TAG               VM SIZE                DATE     VM CLOCK
1   snapshot-1        2.5 GB      2024-01-15 14:30:00   00:01:23.456"""

        result = manager._parse_snapshot_list(output)

        assert len(result) == 1
        assert result[0].id == 1
        assert result[0].tag == "snapshot-1"
        assert result[0].size == "2.5 GB"
        assert result[0].date == "2024-01-15 14:30:00"
        assert result[0].vm_clock == "00:01:23.456"

    def test_parse_multiple_snapshots(self):
        """Test parsing multiple snapshot entries."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        output = """ID  TAG               VM SIZE                DATE     VM CLOCK
1   snapshot-1        2.5 GB      2024-01-15 14:30:00   00:01:23.456
2   snapshot-2        1.8 GB      2024-01-16 09:15:00   00:02:45.123
3   snapshot-3        3.2 GB      2024-01-17 16:45:00   00:00:15.789"""

        result = manager._parse_snapshot_list(output)

        assert len(result) == 3
        assert result[0].tag == "snapshot-1"
        assert result[1].tag == "snapshot-2"
        assert result[2].tag == "snapshot-3"

    def test_parse_malformed_line(self):
        """Test that malformed lines are skipped."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        output = """ID  TAG               VM SIZE                DATE     VM CLOCK
1   snapshot-1        2.5 GB      2024-01-15 14:30:00   00:01:23.456
This is a malformed line
2   snapshot-2        1.8 GB      2024-01-16 09:15:00   00:02:45.123"""

        result = manager._parse_snapshot_list(output)

        assert len(result) == 2
        assert result[0].tag == "snapshot-1"
        assert result[1].tag == "snapshot-2"

    def test_parse_with_different_size_formats(self):
        """Test parsing snapshots with different size formats."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        output = """ID  TAG               VM SIZE                DATE     VM CLOCK
1   snap-mb           512 MB      2024-01-15 14:30:00   00:01:23.456
2   snap-gb           2 GB        2024-01-16 09:15:00   00:02:45.123
3   snap-tb           1.5 TB      2024-01-17 16:45:00   00:00:15.789"""

        result = manager._parse_snapshot_list(output)

        assert len(result) == 3
        assert result[0].size == "512 MB"
        assert result[1].size == "2 GB"
        assert result[2].size == "1.5 TB"

    def test_parse_with_vm_clock_variations(self):
        """Test parsing snapshots with different VM clock formats."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        output = """ID  TAG               VM SIZE                DATE     VM CLOCK
1   snap-1            2 GB        2024-01-15 14:30:00   00:00:01.123
2   snap-2            2 GB        2024-01-16 09:15:00   00:15:30.000
3   snap-3            2 GB        2024-01-17 16:45:00   01:23:45.678"""

        result = manager._parse_snapshot_list(output)

        assert len(result) == 3
        assert result[0].vm_clock == "00:00:01.123"
        assert result[1].vm_clock == "00:15:30.000"
        assert result[2].vm_clock == "01:23:45.678"


class TestTimeoutCalculation:
    """Tests for timeout calculation based on memory size (SNAP-03 verification)."""

    def test_timeout_baseline_2gb(self):
        """Test that 2GB memory returns 5 second timeout (baseline)."""
        mock_qemu = Mock()
        mock_qemu.memory = "2G"
        manager = VMSnapshotManager(mock_qemu, "test")

        timeout = manager._calculate_timeout()

        assert timeout == 5.0

    def test_timeout_scales_linearly(self):
        """Test that 4GB memory returns 10 second timeout (linear scaling)."""
        mock_qemu = Mock()
        mock_qemu.memory = "4G"
        manager = VMSnapshotManager(mock_qemu, "test")

        timeout = manager._calculate_timeout()

        assert timeout == 10.0

    def test_timeout_minimum_value(self):
        """Test that small memory (256MB) returns at least 2 second timeout."""
        mock_qemu = Mock()
        mock_qemu.memory = "256M"
        manager = VMSnapshotManager(mock_qemu, "test")

        timeout = manager._calculate_timeout()

        assert timeout >= 2.0

    def test_timeout_large_memory(self):
        """Test that 8GB memory returns 20 second timeout."""
        mock_qemu = Mock()
        mock_qemu.memory = "8G"
        manager = VMSnapshotManager(mock_qemu, "test")

        timeout = manager._calculate_timeout()

        assert timeout == 20.0

    def test_timeout_calculation_formula(self):
        """Verify formula: timeout = (memory_gb / 2) * 5."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        # Test various memory sizes
        test_cases = [
            ("1G", 2.5),    # (1/2) * 5 = 2.5
            ("2G", 5.0),    # (2/2) * 5 = 5.0
            ("4G", 10.0),   # (4/2) * 5 = 10.0
            ("6G", 15.0),   # (6/2) * 5 = 15.0
            ("8G", 20.0),   # (8/2) * 5 = 20.0
            ("16G", 40.0),  # (16/2) * 5 = 40.0
        ]

        for memory_str, expected_timeout in test_cases:
            mock_qemu.memory = memory_str
            timeout = manager._calculate_timeout()
            assert timeout == expected_timeout, f"Failed for {memory_str}: expected {expected_timeout}, got {timeout}"

    def test_timeout_very_small_memory_uses_minimum(self):
        """Test that very small memory values use minimum timeout."""
        mock_qemu = Mock()
        mock_qemu.memory = "64M"  # 64MB = 0.0625GB -> would be 0.156s, but min is 2s
        manager = VMSnapshotManager(mock_qemu, "test")

        timeout = manager._calculate_timeout()

        assert timeout == 2.0  # Minimum enforced

    def test_timeout_bytes_only_value(self):
        """Test timeout calculation with bytes-only value (no suffix)."""
        mock_qemu = Mock()
        # 2147483648 bytes = 2GB
        mock_qemu.memory = "2147483648"
        manager = VMSnapshotManager(mock_qemu, "test")

        timeout = manager._calculate_timeout()

        # Should be close to 5.0 (may have slight floating point differences)
        assert abs(timeout - 5.0) < 0.01

    def test_timeout_with_megabytes(self):
        """Test timeout calculation with MB suffix."""
        mock_qemu = Mock()
        mock_qemu.memory = "1024M"  # 1GB
        manager = VMSnapshotManager(mock_qemu, "test")

        timeout = manager._calculate_timeout()

        assert timeout == 2.5

    def test_timeout_with_terabytes(self):
        """Test timeout calculation with TB suffix."""
        mock_qemu = Mock()
        mock_qemu.memory = "1T"  # 1TB = 1024GB
        manager = VMSnapshotManager(mock_qemu, "test")

        timeout = manager._calculate_timeout()

        # (1024 / 2) * 5 = 2560
        assert timeout == 2560.0

    def test_timeout_missing_memory_attribute(self):
        """Test that missing memory attribute falls back to baseline."""
        mock_qemu = Mock(spec=[])  # No attributes
        manager = VMSnapshotManager(mock_qemu, "test")

        timeout = manager._calculate_timeout()

        assert timeout == 5.0  # Falls back to baseline


class TestMemoryParsing:
    """Tests for _parse_memory_to_gb helper method."""

    def test_parse_gigabytes(self):
        """Test parsing GB values."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        assert manager._parse_memory_to_gb("2G") == 2.0
        assert manager._parse_memory_to_gb("2GB") == 2.0
        assert manager._parse_memory_to_gb("4g") == 4.0
        assert manager._parse_memory_to_gb("4gb") == 4.0
        assert manager._parse_memory_to_gb("1.5G") == 1.5

    def test_parse_megabytes(self):
        """Test parsing MB values."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        assert manager._parse_memory_to_gb("1024M") == 1.0
        assert manager._parse_memory_to_gb("512MB") == 0.5
        assert manager._parse_memory_to_gb("2048m") == 2.0

    def test_parse_kilobytes(self):
        """Test parsing KB values."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        # 1048576 KB = 1 GB
        assert manager._parse_memory_to_gb("1048576K") == pytest.approx(1.0, rel=0.01)
        assert manager._parse_memory_to_gb("524288KB") == pytest.approx(0.5, rel=0.01)

    def test_parse_terabytes(self):
        """Test parsing TB values."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        assert manager._parse_memory_to_gb("1T") == 1024.0
        assert manager._parse_memory_to_gb("2TB") == 2048.0

    def test_parse_numeric_only(self):
        """Test parsing numeric-only values (assumed bytes)."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        # 2147483648 bytes = 2 GB
        result = manager._parse_memory_to_gb("2147483648")
        assert abs(result - 2.0) < 0.01

    def test_parse_with_whitespace(self):
        """Test parsing values with whitespace."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        assert manager._parse_memory_to_gb(" 2G ") == 2.0
        assert manager._parse_memory_to_gb("4 GB") == 4.0


class TestVMRunningCheck:
    """Tests for _is_vm_running method."""

    def test_vm_running_with_process_and_socket(self):
        """Test VM is considered running when process and socket exist."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None  # Process is running
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket

        manager = VMSnapshotManager(mock_qemu, "test")
        assert manager._is_vm_running() is True

    def test_vm_not_running_no_process(self):
        """Test VM is not running when no process exists."""
        mock_qemu = Mock()
        mock_qemu._process = None
        mock_qemu._monitor_socket = Mock()

        manager = VMSnapshotManager(mock_qemu, "test")
        assert manager._is_vm_running() is False

    def test_vm_not_running_process_terminated(self):
        """Test VM is not running when process has terminated."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = 0  # Process exited
        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = Mock()

        manager = VMSnapshotManager(mock_qemu, "test")
        assert manager._is_vm_running() is False

    def test_vm_not_running_no_socket(self):
        """Test VM is not running when no monitor socket exists."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = False

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket

        manager = VMSnapshotManager(mock_qemu, "test")
        assert manager._is_vm_running() is False

    def test_vm_not_running_socket_none(self):
        """Test VM is not running when monitor socket is None."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = None

        manager = VMSnapshotManager(mock_qemu, "test")
        assert manager._is_vm_running() is False


class TestCreateSnapshot:
    """Tests for create_snapshot method."""

    def test_create_snapshot_success(self):
        """Test successful snapshot creation."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        mock_qemu.memory = "2G"
        mock_qemu.send_monitor_command.return_value = "OK"

        manager = VMSnapshotManager(mock_qemu, "test-container")
        result = manager.create_snapshot("test-snapshot", description="Test")

        assert result.success is True
        assert result.tag == "test-snapshot"
        assert result.metadata is not None
        assert result.metadata.tag == "test-snapshot"
        assert result.metadata.container_name == "test-container"
        assert result.metadata.description == "Test"
        mock_qemu.send_monitor_command.assert_called_once_with("savevm test-snapshot")

    def test_create_snapshot_invalid_tag(self):
        """Test snapshot creation with invalid tag returns failure result."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        # Invalid tag raises SnapshotError which is caught and returned as failure
        with pytest.raises(SnapshotError, match="Invalid snapshot tag"):
            manager.create_snapshot("invalid tag!")

    def test_create_snapshot_vm_not_running(self):
        """Test snapshot creation fails when VM is not running."""
        mock_qemu = Mock()
        mock_qemu._process = None
        manager = VMSnapshotManager(mock_qemu, "test")

        result = manager.create_snapshot("test-snapshot")

        assert result.success is False
        assert "not running" in result.error_message.lower()

    def test_create_snapshot_custom_timeout(self):
        """Test snapshot creation with custom timeout."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        mock_qemu.memory = "2G"
        mock_qemu.send_monitor_command.return_value = "OK"

        manager = VMSnapshotManager(mock_qemu, "test")
        result = manager.create_snapshot("test-snapshot", timeout=60.0)

        assert result.success is True


class TestListSnapshots:
    """Tests for list_snapshots method."""

    def test_list_snapshots_success(self):
        """Test successful snapshot listing."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        mock_qemu.send_monitor_command.return_value = """ID  TAG               VM SIZE                DATE     VM CLOCK
1   snap-1            2 GB        2024-01-15 14:30:00   00:01:23.456
2   snap-2            1.8 GB      2024-01-16 09:15:00   00:02:45.123"""

        manager = VMSnapshotManager(mock_qemu, "test")
        result = manager.list_snapshots()

        assert len(result) == 2
        assert result[0].tag == "snap-1"
        assert result[1].tag == "snap-2"

    def test_list_snapshots_vm_not_running(self):
        """Test listing snapshots when VM is not running returns empty list."""
        mock_qemu = Mock()
        mock_qemu._process = None
        manager = VMSnapshotManager(mock_qemu, "test")

        result = manager.list_snapshots()

        assert result == []

    def test_list_snapshots_empty(self):
        """Test listing snapshots when no snapshots exist."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        mock_qemu.send_monitor_command.return_value = "No snapshots available"

        manager = VMSnapshotManager(mock_qemu, "test")
        result = manager.list_snapshots()

        assert result == []


class TestRestoreSnapshot:
    """Tests for restore_snapshot method."""

    def test_restore_snapshot_success(self):
        """Test successful snapshot restoration."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        # Order: info status (pre), info snapshots, loadvm, info status (post)
        mock_qemu.send_monitor_command.side_effect = [
            "VM status: running",
            "ID  TAG               VM SIZE                DATE     VM CLOCK\n1   restore-test      2 GB        2024-01-15 14:30:00   00:01:23.456",
            "OK",
            "VM status: running"
        ]

        manager = VMSnapshotManager(mock_qemu, "test")
        result = manager.restore_snapshot("restore-test")

        assert result.success is True
        assert result.tag == "restore-test"

    def test_restore_snapshot_not_found(self):
        """Test restoring non-existent snapshot fails."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        mock_qemu.send_monitor_command.return_value = "No snapshots"

        manager = VMSnapshotManager(mock_qemu, "test")
        result = manager.restore_snapshot("nonexistent")

        assert result.success is False
        assert "not found" in result.error_message.lower()

    def test_restore_snapshot_invalid_tag(self):
        """Test restoring with invalid tag returns failure result."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        # Invalid tag now returns failure result instead of raising
        result = manager.restore_snapshot("invalid tag!")
        assert result.success is False
        assert result.restore_progress is not None
        assert result.restore_progress.state == RestoreState.FAILED
        assert "invalid snapshot tag" in result.restore_progress.error_message.lower()


class TestDeleteSnapshot:
    """Tests for delete_snapshot method."""

    def test_delete_snapshot_success(self):
        """Test successful snapshot deletion."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        mock_qemu.send_monitor_command.return_value = "OK"

        manager = VMSnapshotManager(mock_qemu, "test")
        result = manager.delete_snapshot("delete-test")

        assert result.success is True
        assert result.tag == "delete-test"
        mock_qemu.send_monitor_command.assert_called_once_with("delvm delete-test")

    def test_delete_snapshot_vm_not_running(self):
        """Test deleting snapshot when VM is not running fails."""
        mock_qemu = Mock()
        mock_qemu._process = None
        manager = VMSnapshotManager(mock_qemu, "test")

        result = manager.delete_snapshot("test-snapshot")

        assert result.success is False
        assert "not running" in result.error_message.lower()

    def test_delete_snapshot_invalid_tag(self):
        """Test deleting with invalid tag raises SnapshotError."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        # Invalid tag raises SnapshotError
        with pytest.raises(SnapshotError, match="Invalid snapshot tag"):
            manager.delete_snapshot("invalid tag!")


class TestRestoreState:
    """Tests for RestoreState enum."""

    def test_state_values(self):
        """Verify all state values are correct."""
        assert RestoreState.PENDING.value == "pending"
        assert RestoreState.VALIDATING.value == "validating"
        assert RestoreState.LOADING.value == "loading"
        assert RestoreState.VERIFYING.value == "verifying"
        assert RestoreState.COMPLETE.value == "complete"
        assert RestoreState.FAILED.value == "failed"

    def test_state_count(self):
        """Verify we have all expected states."""
        states = list(RestoreState)
        assert len(states) == 6


class TestRestoreProgress:
    """Tests for RestoreProgress dataclass."""

    def test_progress_creation(self):
        """Test creating progress with required fields."""
        progress = RestoreProgress(
            state=RestoreState.PENDING,
            tag="test-restore",
            started_at=datetime(2024, 1, 15, 14, 30, 0)
        )
        assert progress.state == RestoreState.PENDING
        assert progress.tag == "test-restore"
        assert progress.started_at == datetime(2024, 1, 15, 14, 30, 0)
        assert progress.completed_at is None
        assert progress.error_message is None
        assert progress.pre_restore_vm_state is None

    def test_progress_to_dict(self):
        """Test serialization to dictionary."""
        progress = RestoreProgress(
            state=RestoreState.COMPLETE,
            tag="test-restore",
            started_at=datetime(2024, 1, 15, 14, 30, 0),
            completed_at=datetime(2024, 1, 15, 14, 31, 0),
            error_message=None,
            pre_restore_vm_state="running"
        )
        result = progress.to_dict()

        assert result["state"] == "complete"
        assert result["tag"] == "test-restore"
        assert result["started_at"] == "2024-01-15T14:30:00"
        assert result["completed_at"] == "2024-01-15T14:31:00"
        assert result["error_message"] is None
        assert result["pre_restore_vm_state"] == "running"

    def test_progress_optional_fields(self):
        """Test that optional fields are handled correctly."""
        progress = RestoreProgress(
            state=RestoreState.FAILED,
            tag="test-restore",
            started_at=datetime(2024, 1, 15, 14, 30, 0),
            completed_at=datetime(2024, 1, 15, 14, 30, 30),
            error_message="Snapshot not found"
        )
        assert progress.error_message == "Snapshot not found"
        assert progress.pre_restore_vm_state is None

    def test_progress_to_dict_with_none_completed_at(self):
        """Test to_dict handles None completed_at."""
        progress = RestoreProgress(
            state=RestoreState.LOADING,
            tag="test-restore",
            started_at=datetime(2024, 1, 15, 14, 30, 0)
        )
        result = progress.to_dict()
        assert result["completed_at"] is None


class TestRestoreSnapshotValidation:
    """Tests for restore_snapshot validation."""

    def test_restore_validates_tag(self):
        """Test restore with invalid tag returns failure result."""
        mock_qemu = Mock()
        manager = VMSnapshotManager(mock_qemu, "test")

        # Invalid tag now returns failure result instead of raising
        result = manager.restore_snapshot("invalid tag!")
        assert result.success is False
        assert result.restore_progress is not None
        assert result.restore_progress.state == RestoreState.FAILED
        assert "invalid snapshot tag" in result.restore_progress.error_message.lower()

    def test_restore_validates_vm_running(self):
        """Test restore fails when VM is not running."""
        mock_qemu = Mock()
        mock_qemu._process = None
        manager = VMSnapshotManager(mock_qemu, "test")

        result = manager.restore_snapshot("test-snapshot")

        assert result.success is False
        assert "not running" in result.error_message.lower()
        assert result.restore_progress is not None
        assert result.restore_progress.state == RestoreState.FAILED

    def test_restore_validates_snapshot_exists(self):
        """Test restore fails when snapshot does not exist."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        mock_qemu.send_monitor_command.return_value = "No snapshots"

        manager = VMSnapshotManager(mock_qemu, "test")
        result = manager.restore_snapshot("nonexistent")

        assert result.success is False
        assert "not found" in result.error_message.lower()
        assert result.restore_progress is not None
        assert result.restore_progress.state == RestoreState.FAILED

    def test_restore_includes_progress(self):
        """Test restore result includes restore_progress."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        # Order: info status (pre), info snapshots, loadvm, info status (post)
        mock_qemu.send_monitor_command.side_effect = [
            "VM status: running",
            "ID  TAG               VM SIZE                DATE     VM CLOCK\n1   test-snap         2 GB        2024-01-15 14:30:00   00:01:23.456",
            "OK",
            "VM status: running"
        ]

        manager = VMSnapshotManager(mock_qemu, "test")
        result = manager.restore_snapshot("test-snap")

        assert result.success is True
        assert result.restore_progress is not None
        assert result.restore_progress.state == RestoreState.COMPLETE
        assert result.restore_progress.tag == "test-snap"


class TestGetVmStatus:
    """Tests for _get_vm_status method."""

    def test_get_vm_status_running(self):
        """Test parsing 'VM status: running'."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        mock_qemu.send_monitor_command.return_value = "VM status: running"

        manager = VMSnapshotManager(mock_qemu, "test")
        status = manager._get_vm_status()

        assert status == "running"

    def test_get_vm_status_paused(self):
        """Test parsing 'VM status: paused'."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        mock_qemu.send_monitor_command.return_value = "VM status: paused"

        manager = VMSnapshotManager(mock_qemu, "test")
        status = manager._get_vm_status()

        assert status == "paused"

    def test_get_vm_status_error(self):
        """Test _get_vm_status returns None on error."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        mock_qemu.send_monitor_command.side_effect = RuntimeError("Connection lost")

        manager = VMSnapshotManager(mock_qemu, "test")
        status = manager._get_vm_status()

        assert status is None


class TestRestoreProgressStates:
    """Tests for restore progress state transitions."""

    def test_restore_progress_transitions(self):
        """Test progress goes through expected states on success."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        # Order: info status (pre), info snapshots, loadvm, info status (post)
        mock_qemu.send_monitor_command.side_effect = [
            "VM status: running",
            "ID  TAG               VM SIZE                DATE     VM CLOCK\n1   test-snap         2 GB        2024-01-15 14:30:00   00:01:23.456",
            "OK",
            "VM status: running"
        ]

        manager = VMSnapshotManager(mock_qemu, "test")
        result = manager.restore_snapshot("test-snap")

        assert result.success is True
        assert result.restore_progress.state == RestoreState.COMPLETE
        assert result.restore_progress.completed_at is not None
        assert result.restore_progress.pre_restore_vm_state == "running"

    def test_restore_failure_includes_error(self):
        """Test failed restore has error_message in progress."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        mock_qemu.send_monitor_command.return_value = "No snapshots"

        manager = VMSnapshotManager(mock_qemu, "test")
        result = manager.restore_snapshot("nonexistent")

        assert result.success is False
        assert result.restore_progress.state == RestoreState.FAILED
        assert result.restore_progress.error_message is not None
        assert "not found" in result.restore_progress.error_message.lower()

    def test_restore_success_complete_state(self):
        """Test successful restore has COMPLETE state."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        # Order: info status (pre), info snapshots, loadvm, info status (post)
        mock_qemu.send_monitor_command.side_effect = [
            "VM status: paused",
            "ID  TAG               VM SIZE                DATE     VM CLOCK\n1   restore-me        2 GB        2024-01-15 14:30:00   00:01:23.456",
            "OK",
            "VM status: running"
        ]

        manager = VMSnapshotManager(mock_qemu, "test")
        result = manager.restore_snapshot("restore-me")

        assert result.success is True
        assert result.restore_progress.state == RestoreState.COMPLETE
        assert result.restore_progress.pre_restore_vm_state == "paused"

    def test_restore_fails_on_unresponsive_vm(self):
        """Test restore fails when VM is not responsive after restore."""
        mock_qemu = Mock()
        mock_process = Mock()
        mock_process.poll.return_value = None
        mock_socket = Mock()
        mock_socket.exists.return_value = True

        mock_qemu._process = mock_process
        mock_qemu._monitor_socket = mock_socket
        # Order: info status (pre), info snapshots, loadvm, info status (post) returns None
        mock_qemu.send_monitor_command.side_effect = [
            "VM status: running",
            "ID  TAG               VM SIZE                DATE     VM CLOCK\n1   test-snap         2 GB        2024-01-15 14:30:00   00:01:23.456",
            "OK",
            None  # VM not responsive after restore
        ]

        manager = VMSnapshotManager(mock_qemu, "test")
        result = manager.restore_snapshot("test-snap")

        assert result.success is False
        assert result.restore_progress.state == RestoreState.FAILED
        assert "not responsive" in result.restore_progress.error_message.lower()
