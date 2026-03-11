#!/usr/bin/env python3
"""
Unit tests for BootBridge snapshot methods.

Tests the integration between BootBridge and VMSnapshotManager,
ensuring snapshot methods properly validate VM state and delegate
to the snapshot manager.
"""

from pathlib import Path
from unittest.mock import Mock, PropertyMock, patch

import pytest

from systems.pixel_compiler.boot.boot_bridge import BootBridge
from systems.pixel_compiler.boot.vm_snapshot import (
    SnapshotError,
    SnapshotInfo,
    SnapshotResult,
    SnapshotState,
    VMSnapshotMetadata,
)


class TestBootBridgeSnapshotMethods:
    """Tests for BootBridge snapshot method validation."""

    def test_create_snapshot_raises_when_not_booted(self):
        """create_snapshot should raise SnapshotError when VM is not booted."""
        # Create BootBridge without booting
        rts_path = Path("/tmp/test.rts.png")

        with patch.object(BootBridge, '__init__', lambda self, path: None):
            bridge = BootBridge.__new__(BootBridge)
            bridge._booted = False
            bridge._qemu = None
            bridge.rts_png_path = rts_path

            with pytest.raises(SnapshotError, match="VM is not booted"):
                bridge.create_snapshot("test-snapshot")

    def test_list_snapshots_raises_when_not_booted(self):
        """list_snapshots should raise SnapshotError when VM is not booted."""
        rts_path = Path("/tmp/test.rts.png")

        with patch.object(BootBridge, '__init__', lambda self, path: None):
            bridge = BootBridge.__new__(BootBridge)
            bridge._booted = False
            bridge._qemu = None
            bridge.rts_png_path = rts_path

            with pytest.raises(SnapshotError, match="VM is not booted"):
                bridge.list_snapshots()

    def test_restore_snapshot_raises_when_not_booted(self):
        """restore_snapshot should raise SnapshotError when VM is not booted."""
        rts_path = Path("/tmp/test.rts.png")

        with patch.object(BootBridge, '__init__', lambda self, path: None):
            bridge = BootBridge.__new__(BootBridge)
            bridge._booted = False
            bridge._qemu = None
            bridge.rts_png_path = rts_path

            with pytest.raises(SnapshotError, match="VM is not booted"):
                bridge.restore_snapshot("test-snapshot")

    def test_delete_snapshot_raises_when_not_booted(self):
        """delete_snapshot should raise SnapshotError when VM is not booted."""
        rts_path = Path("/tmp/test.rts.png")

        with patch.object(BootBridge, '__init__', lambda self, path: None):
            bridge = BootBridge.__new__(BootBridge)
            bridge._booted = False
            bridge._qemu = None
            bridge.rts_png_path = rts_path

            with pytest.raises(SnapshotError, match="VM is not booted"):
                bridge.delete_snapshot("test-snapshot")

    def test_snapshot_manager_property_returns_none_when_not_booted(self):
        """_snapshot_manager property should return None when VM is not booted."""
        rts_path = Path("/tmp/test.rts.png")

        with patch.object(BootBridge, '__init__', lambda self, path: None):
            bridge = BootBridge.__new__(BootBridge)
            bridge._booted = False
            bridge._qemu = None
            bridge.rts_png_path = rts_path

            assert bridge._snapshot_manager is None


class TestBootBridgeSnapshotIntegration:
    """Tests for BootBridge snapshot delegation to VMSnapshotManager."""

    def test_create_snapshot_delegates_to_manager(self):
        """create_snapshot should delegate to VMSnapshotManager."""
        rts_path = Path("/tmp/test.rts.png")
        mock_qemu = Mock()

        # Create mock snapshot manager
        mock_manager = Mock()
        mock_result = SnapshotResult(
            success=True,
            tag="test-snapshot",
            metadata=VMSnapshotMetadata(
                snapshot_id="test-id",
                tag="test-snapshot",
                container_name="test",
                created_at=None,
                state=SnapshotState.COMPLETE,
                vm_memory="2G",
            )
        )
        mock_manager.create_snapshot.return_value = mock_result

        with patch.object(BootBridge, '__init__', lambda self, path: None):
            bridge = BootBridge.__new__(BootBridge)
            bridge._booted = True
            bridge._qemu = mock_qemu
            bridge.rts_png_path = rts_path

            # Patch _snapshot_manager property using PropertyMock
            with patch.object(BootBridge, '_snapshot_manager', new_callable=PropertyMock) as mock_prop:
                mock_prop.return_value = mock_manager
                result = bridge.create_snapshot("test-snapshot", description="test desc")

                # Verify delegation
                mock_manager.create_snapshot.assert_called_once_with(
                    "test-snapshot",
                    description="test desc",
                    timeout=None
                )
                assert result.success is True
                assert result.tag == "test-snapshot"

    def test_list_snapshots_delegates_to_manager(self):
        """list_snapshots should delegate to VMSnapshotManager."""
        rts_path = Path("/tmp/test.rts.png")
        mock_qemu = Mock()

        # Create mock snapshot manager
        mock_manager = Mock()
        mock_snapshots = [
            SnapshotInfo(id=1, tag="snap-1", size="2 GB", date="2024-01-01 12:00:00", vm_clock="00:00:01"),
            SnapshotInfo(id=2, tag="snap-2", size="2 GB", date="2024-01-02 12:00:00", vm_clock="00:00:02"),
        ]
        mock_manager.list_snapshots.return_value = mock_snapshots

        with patch.object(BootBridge, '__init__', lambda self, path: None):
            bridge = BootBridge.__new__(BootBridge)
            bridge._booted = True
            bridge._qemu = mock_qemu
            bridge.rts_png_path = rts_path

            with patch.object(BootBridge, '_snapshot_manager', new_callable=PropertyMock) as mock_prop:
                mock_prop.return_value = mock_manager
                result = bridge.list_snapshots()

                mock_manager.list_snapshots.assert_called_once()
                assert len(result) == 2
                assert result[0].tag == "snap-1"
                assert result[1].tag == "snap-2"

    def test_restore_snapshot_delegates_to_manager(self):
        """restore_snapshot should delegate to VMSnapshotManager."""
        rts_path = Path("/tmp/test.rts.png")
        mock_qemu = Mock()

        # Create mock snapshot manager
        mock_manager = Mock()
        mock_result = SnapshotResult(success=True, tag="test-snapshot")
        mock_manager.restore_snapshot.return_value = mock_result

        with patch.object(BootBridge, '__init__', lambda self, path: None):
            bridge = BootBridge.__new__(BootBridge)
            bridge._booted = True
            bridge._qemu = mock_qemu
            bridge.rts_png_path = rts_path

            with patch.object(BootBridge, '_snapshot_manager', new_callable=PropertyMock) as mock_prop:
                mock_prop.return_value = mock_manager
                result = bridge.restore_snapshot("test-snapshot")

                mock_manager.restore_snapshot.assert_called_once_with("test-snapshot")
                assert result.success is True

    def test_delete_snapshot_delegates_to_manager(self):
        """delete_snapshot should delegate to VMSnapshotManager."""
        rts_path = Path("/tmp/test.rts.png")
        mock_qemu = Mock()

        # Create mock snapshot manager
        mock_manager = Mock()
        mock_result = SnapshotResult(success=True, tag="test-snapshot")
        mock_manager.delete_snapshot.return_value = mock_result

        with patch.object(BootBridge, '__init__', lambda self, path: None):
            bridge = BootBridge.__new__(BootBridge)
            bridge._booted = True
            bridge._qemu = mock_qemu
            bridge.rts_png_path = rts_path

            with patch.object(BootBridge, '_snapshot_manager', new_callable=PropertyMock) as mock_prop:
                mock_prop.return_value = mock_manager
                result = bridge.delete_snapshot("test-snapshot")

                mock_manager.delete_snapshot.assert_called_once_with("test-snapshot")
                assert result.success is True
