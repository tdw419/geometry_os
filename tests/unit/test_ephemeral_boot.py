#!/usr/bin/env python3
"""
Unit tests for EphemeralBooter.

Tests the ephemeral boot functionality including:
- Temp file creation and management
- Cleanup on stop() and context exit
- Container type detection and delegation
- Boot failure handling
"""

import os
import tempfile
import shutil
from pathlib import Path
from unittest import mock
from unittest.mock import MagicMock, patch, PropertyMock

import pytest


# Import test subject
from systems.pixel_compiler.boot.ephemeral_boot import (
    EphemeralBooter,
    EphemeralBootError,
)
from systems.pixel_compiler.boot.boot_bridge import BootResult
from systems.pixel_compiler.boot.committed_boot import ContainerType


# ============================================================================
# Fixtures
# ============================================================================

@pytest.fixture
def temp_dir():
    """Create a temporary directory for test files."""
    dir_path = tempfile.mkdtemp(prefix="test_ephemeral_boot_")
    yield Path(dir_path)
    shutil.rmtree(dir_path, ignore_errors=True)


@pytest.fixture
def bootable_rts_file(temp_dir):
    """Create a minimal bootable .rts.png file for testing."""
    from PIL import Image
    import io

    # Create a minimal PNG with bootable type metadata
    img = Image.new('RGB', (10, 10), color='red')

    # Add metadata to indicate bootable type
    from PIL import PngImagePlugin
    meta = PngImagePlugin.PngInfo()
    meta.add_text("type", "bootable")

    file_path = temp_dir / "test_bootable.rts.png"
    img.save(file_path, "PNG", pnginfo=meta)

    return file_path


@pytest.fixture
def vm_snapshot_rts_file(temp_dir):
    """Create a minimal vm-snapshot .rts.png file for testing."""
    from PIL import Image
    import io

    # Create a minimal PNG with vm-snapshot type metadata
    img = Image.new('RGB', (10, 10), color='blue')

    # Add metadata to indicate vm-snapshot type
    from PIL import PngImagePlugin
    meta = PngImagePlugin.PngInfo()
    meta.add_text("type", "vm-snapshot")

    file_path = temp_dir / "test_vm_snapshot.rts.png"
    img.save(file_path, "PNG", pnginfo=meta)

    return file_path


# ============================================================================
# Tests
# ============================================================================

class TestEphemeralBooterBasics:
    """Test basic EphemeralBooter functionality."""

    def test_ephemeral_booter_creates_temp_copy(self, bootable_rts_file):
        """Verify temp file is created."""
        booter = EphemeralBooter(bootable_rts_file)

        # Check temp file exists
        assert booter._temp_path is not None
        assert booter._temp_path.exists()

        # Cleanup
        booter.stop()

    def test_ephemeral_booter_temp_copy_matches_original(self, bootable_rts_file):
        """Verify copy is identical to original."""
        booter = EphemeralBooter(bootable_rts_file)

        # Read both files
        original_content = bootable_rts_file.read_bytes()
        temp_content = booter._temp_path.read_bytes()

        assert original_content == temp_content

        # Cleanup
        booter.stop()

    def test_ephemeral_booter_original_unchanged(self, bootable_rts_file):
        """Verify original path preserved."""
        booter = EphemeralBooter(bootable_rts_file)

        # Original path should point to the original file
        assert booter.original_path == bootable_rts_file.resolve()
        assert booter.original_path.exists()

        # Cleanup
        booter.stop()

    def test_ephemeral_booter_cleanup_on_stop(self, bootable_rts_file):
        """Verify temp dir removed after stop()."""
        booter = EphemeralBooter(bootable_rts_file)
        temp_dir = booter._temp_dir
        temp_path = booter._temp_path

        # Temp should exist before stop
        assert Path(temp_dir).exists()
        assert temp_path.exists()

        # Stop should cleanup
        booter.stop()

        # Temp should not exist after stop
        assert not Path(temp_dir).exists()
        assert booter._temp_dir is None
        assert booter._temp_path is None

    def test_ephemeral_booter_context_manager_cleanup(self, bootable_rts_file):
        """Verify cleanup on context exit."""
        temp_dir = None

        with EphemeralBooter(bootable_rts_file) as booter:
            temp_dir = booter._temp_dir
            assert Path(temp_dir).exists()

        # After context exit, temp should be cleaned up
        assert not Path(temp_dir).exists()

    def test_ephemeral_booter_is_ephemeral_flag(self, bootable_rts_file):
        """Verify is_ephemeral=True."""
        booter = EphemeralBooter(bootable_rts_file)
        assert booter.is_ephemeral is True
        booter.stop()


class TestEphemeralBooterContainerTypeDetection:
    """Test container type detection and delegation."""

    def test_ephemeral_booter_detects_bootable_type(self, bootable_rts_file):
        """Verify BootBridge used for bootable."""
        # Patch the source modules
        with patch('systems.pixel_compiler.boot.boot_bridge.BootBridge') as MockBootBridge:
            mock_bridge = MagicMock()
            MockBootBridge.return_value = mock_bridge

            # Patch detect_container_type to return BOOTABLE
            with patch('systems.pixel_compiler.boot.committed_boot.CommittedFileBooter.detect_container_type') as mock_detect:
                mock_detect.return_value = ContainerType.BOOTABLE

                booter = EphemeralBooter(bootable_rts_file)

                # Should have created a BootBridge
                assert booter._container_type == ContainerType.BOOTABLE
                MockBootBridge.assert_called_once()

                booter.stop()

    def test_ephemeral_booter_detects_vm_snapshot_type(self, vm_snapshot_rts_file):
        """Verify CommittedFileBooter used for vm-snapshot."""
        # Patch the source modules
        with patch('systems.pixel_compiler.boot.committed_boot.CommittedFileBooter') as MockCommittedBooter:
            mock_booter = MagicMock()
            MockCommittedBooter.return_value = mock_booter

            # Patch detect_container_type to return VM_SNAPSHOT
            with patch('systems.pixel_compiler.boot.committed_boot.CommittedFileBooter.detect_container_type') as mock_detect:
                mock_detect.return_value = ContainerType.VM_SNAPSHOT

                booter = EphemeralBooter(vm_snapshot_rts_file)

                # Should have created a CommittedFileBooter
                assert booter._container_type == ContainerType.VM_SNAPSHOT
                MockCommittedBooter.assert_called_once()

                booter.stop()


class TestEphemeralBooterBootFailure:
    """Test boot failure handling."""

    def test_ephemeral_booter_boot_failure_cleanup(self, bootable_rts_file):
        """Verify temp cleaned if boot fails."""
        # Patch the source modules
        with patch('systems.pixel_compiler.boot.boot_bridge.BootBridge') as MockBootBridge:
            mock_bridge = MagicMock()
            mock_bridge.boot.return_value = BootResult(
                success=False,
                error_message="Simulated boot failure"
            )
            MockBootBridge.return_value = mock_bridge

            # Patch detect_container_type to return BOOTABLE
            with patch('systems.pixel_compiler.boot.committed_boot.CommittedFileBooter.detect_container_type') as mock_detect:
                mock_detect.return_value = ContainerType.BOOTABLE

                booter = EphemeralBooter(bootable_rts_file)
                temp_dir = booter._temp_dir

                # Temp should exist before boot
                assert Path(temp_dir).exists()

                # Boot should fail
                result = booter.boot()
                assert result.success is False
                assert "Simulated boot failure" in result.error_message

                # Temp should be cleaned up after failed boot
                assert not Path(temp_dir).exists()
                assert booter._temp_dir is None


class TestEphemeralBooterGetStatus:
    """Test get_status method."""

    def test_ephemeral_booter_status_includes_ephemeral_flag(self, bootable_rts_file):
        """Verify status includes ephemeral=True."""
        booter = EphemeralBooter(bootable_rts_file)
        status = booter.get_status()

        assert status["ephemeral"] is True
        assert "original_path" in status
        assert "temp_path" in status

        booter.stop()


class TestEphemeralBootError:
    """Test EphemeralBootError exception."""

    def test_ephemeral_boot_error_exception(self):
        """Verify exception class exists and is raisable."""
        with pytest.raises(EphemeralBootError):
            raise EphemeralBootError("Test error")

    def test_ephemeral_boot_error_message(self):
        """Verify exception message is preserved."""
        try:
            raise EphemeralBootError("Custom error message")
        except EphemeralBootError as e:
            assert "Custom error message" in str(e)


class TestEphemeralBooterFileNotFound:
    """Test file not found handling."""

    def test_ephemeral_booter_raises_on_missing_file(self, temp_dir):
        """Verify FileNotFoundError for non-existent file."""
        missing_file = temp_dir / "nonexistent.rts.png"

        with pytest.raises(FileNotFoundError):
            EphemeralBooter(missing_file)


class TestEphemeralBooterMultipleStops:
    """Test calling stop() multiple times."""

    def test_ephemeral_booter_multiple_stops_safe(self, bootable_rts_file):
        """Verify stop() is safe to call multiple times."""
        booter = EphemeralBooter(bootable_rts_file)

        # First stop
        booter.stop()
        assert booter._cleaned_up is True

        # Second stop should not raise
        booter.stop()
        booter.stop()

        # Should still be cleaned up
        assert booter._cleaned_up is True


class TestEphemeralBooterRepr:
    """Test string representation."""

    def test_ephemeral_booter_repr(self, bootable_rts_file):
        """Verify __repr__ works."""
        booter = EphemeralBooter(bootable_rts_file)
        repr_str = repr(booter)

        assert "EphemeralBooter" in repr_str
        assert str(bootable_rts_file.name) in repr_str or str(bootable_rts_file.stem) in repr_str

        booter.stop()


class TestEphemeralBooterBootDelegation:
    """Test boot() method delegation to inner booter."""

    def test_boot_delegates_to_inner_booter(self, bootable_rts_file):
        """Verify boot() calls inner booter's boot()."""
        # Patch the source modules
        with patch('systems.pixel_compiler.boot.boot_bridge.BootBridge') as MockBootBridge:
            mock_bridge = MagicMock()
            mock_bridge.boot.return_value = BootResult(
                success=True,
                pid=12345,
                vnc_port=5900
            )
            MockBootBridge.return_value = mock_bridge

            # Patch detect_container_type to return BOOTABLE
            with patch('systems.pixel_compiler.boot.committed_boot.CommittedFileBooter.detect_container_type') as mock_detect:
                mock_detect.return_value = ContainerType.BOOTABLE

                booter = EphemeralBooter(bootable_rts_file)
                result = booter.boot(cmdline="test", extra_qemu_args=["-no-reboot"])

                # Should have called inner booter's boot with our args
                mock_bridge.boot.assert_called_once_with(
                    cmdline="test",
                    extra_qemu_args=["-no-reboot"]
                )

                assert result.success is True
                assert result.pid == 12345

                booter.stop()


class TestEphemeralBooterOriginalPathProperty:
    """Test original_path property."""

    def test_original_path_returns_path_object(self, bootable_rts_file):
        """Verify original_path returns Path object."""
        booter = EphemeralBooter(bootable_rts_file)

        assert isinstance(booter.original_path, Path)
        assert booter.original_path == bootable_rts_file.resolve()

        booter.stop()

    def test_original_path_after_cleanup(self, bootable_rts_file):
        """Verify original_path accessible after cleanup."""
        booter = EphemeralBooter(bootable_rts_file)
        original = booter.original_path

        booter.stop()

        # Should still be able to access original_path
        assert booter.original_path == original
        assert booter.original_path.exists()


# ============================================================================
# Main
# ============================================================================

if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
