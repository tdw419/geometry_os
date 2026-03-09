#!/usr/bin/env python3
"""
Unit tests for CommittedFileBooter.

Tests container type detection, metadata extraction, boot flow,
and cleanup behavior.
"""

import unittest
from unittest.mock import Mock, patch, MagicMock, mock_open
from pathlib import Path
import tempfile
import shutil
import io

from systems.pixel_compiler.boot.committed_boot import (
    CommittedFileBooter,
    ContainerType,
    CommittedFileMetadata,
    BootResult,
)


class TestContainerTypeDetection(unittest.TestCase):
    """Tests for detect_container_type static method."""

    def test_detect_container_type_vm_snapshot(self):
        """PNG with type='vm-snapshot' metadata returns VM_SNAPSHOT."""
        # Create a mock PNG with vm-snapshot metadata
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            temp_path = Path(f.name)

        try:
            # Mock PIL Image with vm-snapshot type
            mock_img = MagicMock()
            mock_img.text = {"type": "vm-snapshot"}
            mock_img.__enter__ = Mock(return_value=mock_img)
            mock_img.__exit__ = Mock(return_value=False)

            with patch('PIL.Image.open', return_value=mock_img):
                result = CommittedFileBooter.detect_container_type(temp_path)
                self.assertEqual(result, ContainerType.VM_SNAPSHOT)
        finally:
            temp_path.unlink(missing_ok=True)

    def test_detect_container_type_bootable(self):
        """PNG without type or type='bootable' returns BOOTABLE."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            temp_path = Path(f.name)

        try:
            # Mock PIL Image without type metadata
            mock_img = MagicMock()
            mock_img.text = {}
            mock_img.__enter__ = Mock(return_value=mock_img)
            mock_img.__exit__ = Mock(return_value=False)

            with patch('PIL.Image.open', return_value=mock_img):
                result = CommittedFileBooter.detect_container_type(temp_path)
                self.assertEqual(result, ContainerType.BOOTABLE)
        finally:
            temp_path.unlink(missing_ok=True)

    def test_detect_container_type_explicit_bootable(self):
        """PNG with explicit type='bootable' returns BOOTABLE."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            temp_path = Path(f.name)

        try:
            mock_img = MagicMock()
            mock_img.text = {"type": "bootable"}
            mock_img.__enter__ = Mock(return_value=mock_img)
            mock_img.__exit__ = Mock(return_value=False)

            with patch('PIL.Image.open', return_value=mock_img):
                result = CommittedFileBooter.detect_container_type(temp_path)
                self.assertEqual(result, ContainerType.BOOTABLE)
        finally:
            temp_path.unlink(missing_ok=True)

    def test_detect_container_type_invalid_png(self):
        """Non-PNG file raises appropriate error."""
        with tempfile.NamedTemporaryFile(suffix='.txt', delete=False) as f:
            f.write(b"not a png")
            temp_path = Path(f.name)

        try:
            # Mock PIL.Image.open to raise exception
            with patch('PIL.Image.open', side_effect=Exception("Not a PNG")):
                with self.assertRaises(ValueError) as ctx:
                    CommittedFileBooter.detect_container_type(temp_path)
                self.assertIn("Failed to read PNG metadata", str(ctx.exception))
        finally:
            temp_path.unlink(missing_ok=True)

    def test_detect_container_type_nonexistent_file(self):
        """Non-existent file raises FileNotFoundError."""
        with self.assertRaises(FileNotFoundError):
            CommittedFileBooter.detect_container_type("/nonexistent/file.png")


class TestMetadataExtraction(unittest.TestCase):
    """Tests for extract_metadata static method."""

    def test_extract_metadata_vm_snapshot(self):
        """Extracts type, snapshot_tag, source_format, disk_size."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            temp_path = Path(f.name)

        try:
            mock_img = MagicMock()
            mock_img.text = {
                "type": "vm-snapshot",
                "snapshot_tag": "test-snapshot-001",
                "source_format": "qcow2",
                "original_size": "1073741824",  # 1GB
                "created_at": "2026-03-09T12:00:00Z",
            }
            mock_img.__enter__ = Mock(return_value=mock_img)
            mock_img.__exit__ = Mock(return_value=False)

            with patch('PIL.Image.open', return_value=mock_img):
                metadata = CommittedFileBooter.extract_metadata(temp_path)

                self.assertEqual(metadata.container_type, ContainerType.VM_SNAPSHOT)
                self.assertEqual(metadata.snapshot_tag, "test-snapshot-001")
                self.assertEqual(metadata.source_format, "qcow2")
                self.assertEqual(metadata.disk_size, 1073741824)
                self.assertEqual(metadata.created_at, "2026-03-09T12:00:00Z")
        finally:
            temp_path.unlink(missing_ok=True)

    def test_extract_metadata_with_kernel_initrd(self):
        """Extracts original_kernel and original_initrd if present."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            temp_path = Path(f.name)

        try:
            mock_img = MagicMock()
            mock_img.text = {
                "type": "vm-snapshot",
                "snapshot_tag": "with-kernel",
                "original_kernel": "/boot/vmlinuz",
                "original_initrd": "/boot/initrd.img",
            }
            mock_img.__enter__ = Mock(return_value=mock_img)
            mock_img.__exit__ = Mock(return_value=False)

            with patch('PIL.Image.open', return_value=mock_img):
                metadata = CommittedFileBooter.extract_metadata(temp_path)

                self.assertEqual(metadata.original_kernel, "/boot/vmlinuz")
                self.assertEqual(metadata.original_initrd, "/boot/initrd.img")
        finally:
            temp_path.unlink(missing_ok=True)

    def test_extract_metadata_missing_fields(self):
        """Handles missing optional fields gracefully."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            temp_path = Path(f.name)

        try:
            mock_img = MagicMock()
            mock_img.text = {
                "type": "vm-snapshot",
                # snapshot_tag, kernel, initrd all missing
            }
            mock_img.__enter__ = Mock(return_value=mock_img)
            mock_img.__exit__ = Mock(return_value=False)

            with patch('PIL.Image.open', return_value=mock_img):
                metadata = CommittedFileBooter.extract_metadata(temp_path)

                self.assertEqual(metadata.container_type, ContainerType.VM_SNAPSHOT)
                self.assertIsNone(metadata.snapshot_tag)
                self.assertIsNone(metadata.original_kernel)
                self.assertIsNone(metadata.original_initrd)
                self.assertEqual(metadata.source_format, "qcow2")  # Default
        finally:
            temp_path.unlink(missing_ok=True)

    def test_extract_metadata_invalid_size(self):
        """Handles invalid original_size value gracefully."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            temp_path = Path(f.name)

        try:
            mock_img = MagicMock()
            mock_img.text = {
                "type": "vm-snapshot",
                "original_size": "not-a-number",
            }
            mock_img.__enter__ = Mock(return_value=mock_img)
            mock_img.__exit__ = Mock(return_value=False)

            with patch('PIL.Image.open', return_value=mock_img):
                with patch('systems.pixel_compiler.boot.committed_boot.logger') as mock_logger:
                    metadata = CommittedFileBooter.extract_metadata(temp_path)

                    # Should log warning but not crash
                    self.assertIsNone(metadata.disk_size)
        finally:
            temp_path.unlink(missing_ok=True)


class TestCommittedFileBooterInit(unittest.TestCase):
    """Tests for CommittedFileBooter initialization."""

    def test_init_valid_path(self):
        """Creates instance with valid path."""
        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            f.write(b"fake png content")
            temp_path = Path(f.name)

        try:
            booter = CommittedFileBooter(temp_path)
            self.assertEqual(booter.rts_png_path, temp_path.resolve())
            self.assertEqual(booter.memory, "2G")
            self.assertEqual(booter.cpus, 2)
            self.assertEqual(booter.vnc_display, 0)
            self.assertFalse(booter.verbose)
        finally:
            temp_path.unlink(missing_ok=True)

    def test_init_custom_params(self):
        """Creates instance with custom parameters."""
        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            f.write(b"fake png content")
            temp_path = Path(f.name)

        try:
            booter = CommittedFileBooter(
                temp_path,
                memory="4G",
                cpus=4,
                vnc_display=1,
                verbose=True,
            )
            self.assertEqual(booter.memory, "4G")
            self.assertEqual(booter.cpus, 4)
            self.assertEqual(booter.vnc_display, 1)
            self.assertTrue(booter.verbose)
        finally:
            temp_path.unlink(missing_ok=True)

    def test_init_invalid_path(self):
        """Raises FileNotFoundError for non-existent file."""
        with self.assertRaises(FileNotFoundError) as ctx:
            CommittedFileBooter("/nonexistent/file.rts.png")
        self.assertIn("Committed file not found", str(ctx.exception))


class TestBootFlow(unittest.TestCase):
    """Tests for boot() method with mocked dependencies."""

    def setUp(self):
        """Create temp file for each test."""
        self.temp_file = tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False)
        self.temp_file.write(b"fake png content")
        self.temp_file.close()
        self.temp_path = Path(self.temp_file.name)

    def tearDown(self):
        """Clean up temp file."""
        self.temp_path.unlink(missing_ok=True)

    def test_boot_success(self):
        """Mocks PixelRTSDecoder and QemuBoot, verifies boot() returns BootResult."""
        # Mock container type detection
        mock_img = MagicMock()
        mock_img.text = {
            "type": "vm-snapshot",
            "snapshot_tag": "test-snap",
            "source_format": "qcow2",
        }
        mock_img.__enter__ = Mock(return_value=mock_img)
        mock_img.__exit__ = Mock(return_value=False)

        # Mock PixelRTSDecoder
        mock_decoder = MagicMock()
        mock_decoder.decode.return_value = b"fake qcow2 data"

        # Mock QemuBoot
        mock_process = MagicMock()
        mock_process.pid = 12345

        mock_qemu = MagicMock()
        mock_qemu.boot.return_value = mock_process
        mock_qemu.get_status.return_value = {
            "vnc_port": 5900,
            "serial_socket": "/tmp/serial.sock",
        }

        booter = CommittedFileBooter(self.temp_path)

        # Patch at the point of import (inside the boot method)
        with patch('PIL.Image.open', return_value=mock_img), \
             patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder', return_value=mock_decoder), \
             patch('systems.pixel_compiler.integration.qemu_boot.QemuBoot', return_value=mock_qemu), \
             patch('systems.pixel_compiler.integration.qemu_boot.QemuConfig'), \
             patch('systems.pixel_compiler.integration.qemu_boot.NetworkMode'):

            result = booter.boot()

            self.assertIsInstance(result, BootResult)
            self.assertTrue(result.success)
            self.assertEqual(result.pid, 12345)
            self.assertEqual(result.vnc_port, 5900)

    def test_boot_extraction_failure(self):
        """Handles qcow2 extraction failure."""
        mock_img = MagicMock()
        mock_img.text = {"type": "vm-snapshot"}
        mock_img.__enter__ = Mock(return_value=mock_img)
        mock_img.__exit__ = Mock(return_value=False)

        mock_decoder = MagicMock()
        mock_decoder.decode.side_effect = RuntimeError("Decoding failed")

        booter = CommittedFileBooter(self.temp_path)

        with patch('PIL.Image.open', return_value=mock_img), \
             patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder', return_value=mock_decoder):

            result = booter.boot()

            self.assertFalse(result.success)
            self.assertIn("Runtime error", result.error_message)

    def test_boot_qemu_failure(self):
        """Handles QEMU start failure."""
        mock_img = MagicMock()
        mock_img.text = {"type": "vm-snapshot"}
        mock_img.__enter__ = Mock(return_value=mock_img)
        mock_img.__exit__ = Mock(return_value=False)

        mock_decoder = MagicMock()
        mock_decoder.decode.return_value = b"fake qcow2 data"

        booter = CommittedFileBooter(self.temp_path)

        with patch('PIL.Image.open', return_value=mock_img), \
             patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder', return_value=mock_decoder), \
             patch('systems.pixel_compiler.integration.qemu_boot.QemuBoot') as MockQemuBoot:

            # Make QemuBoot raise an exception
            MockQemuBoot.side_effect = RuntimeError("QEMU not available")

            result = booter.boot()

            self.assertFalse(result.success)
            self.assertIn("Runtime error", result.error_message)

    def test_boot_wrong_container_type(self):
        """Returns failure for non-vm-snapshot containers."""
        mock_img = MagicMock()
        mock_img.text = {"type": "bootable"}  # Wrong type
        mock_img.__enter__ = Mock(return_value=mock_img)
        mock_img.__exit__ = Mock(return_value=False)

        booter = CommittedFileBooter(self.temp_path)

        with patch('PIL.Image.open', return_value=mock_img):
            result = booter.boot()

            self.assertFalse(result.success)
            self.assertIn("Not a vm-snapshot container", result.error_message)

    def test_cleanup_on_failure(self):
        """Verifies temp files cleaned up on boot failure."""
        mock_img = MagicMock()
        mock_img.text = {"type": "vm-snapshot"}
        mock_img.__enter__ = Mock(return_value=mock_img)
        mock_img.__exit__ = Mock(return_value=False)

        mock_decoder = MagicMock()
        mock_decoder.decode.side_effect = RuntimeError("Failed")

        booter = CommittedFileBooter(self.temp_path)

        with patch('PIL.Image.open', return_value=mock_img), \
             patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder', return_value=mock_decoder):

            result = booter.boot()

            # After failure, temp dir should be cleaned up
            self.assertFalse(result.success)
            self.assertIsNone(booter._temp_dir)


class TestContextManager(unittest.TestCase):
    """Tests for context manager protocol."""

    def setUp(self):
        """Create temp file for each test."""
        self.temp_file = tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False)
        self.temp_file.write(b"fake png content")
        self.temp_file.close()
        self.temp_path = Path(self.temp_file.name)

    def tearDown(self):
        """Clean up temp file."""
        self.temp_path.unlink(missing_ok=True)

    def test_context_manager_cleanup(self):
        """Verifies stop() called on exit."""
        booter = CommittedFileBooter(self.temp_path)
        # Create a fake temp dir to verify cleanup
        booter._temp_dir = tempfile.mkdtemp(prefix="test_cleanup_")

        # Test __exit__ directly
        booter.__exit__(None, None, None)

        # After exit, temp dir should be cleaned up
        self.assertIsNone(booter._temp_dir)

    def test_context_manager_exception(self):
        """Verifies cleanup on exception."""
        booter = CommittedFileBooter(self.temp_path)
        # Create a fake temp dir to verify cleanup
        booter._temp_dir = tempfile.mkdtemp(prefix="test_cleanup_")

        # Test __exit__ with exception info
        booter.__exit__(ValueError, ValueError("Test"), None)

        # After exit, temp dir should be cleaned up even on exception
        self.assertIsNone(booter._temp_dir)

    def test_context_manager_manual_stop(self):
        """Verifies manual stop() works correctly."""
        booter = CommittedFileBooter(self.temp_path)

        # Create a fake temp dir to verify cleanup
        booter._temp_dir = tempfile.mkdtemp(prefix="test_cleanup_")

        booter.stop()

        # After stop, temp dir should be None
        self.assertIsNone(booter._temp_dir)


class TestExtractQcow2(unittest.TestCase):
    """Tests for extract_qcow2 method."""

    def setUp(self):
        """Create temp file for each test."""
        self.temp_file = tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False)
        self.temp_file.write(b"fake png content")
        self.temp_file.close()
        self.temp_path = Path(self.temp_file.name)

    def tearDown(self):
        """Clean up temp file."""
        self.temp_path.unlink(missing_ok=True)

    def test_extract_qcow2_to_temp_dir(self):
        """Extracts qcow2 to temp directory."""
        mock_decoder = MagicMock()
        mock_decoder.decode.return_value = b"qcow2 binary data here"

        booter = CommittedFileBooter(self.temp_path)

        with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder', return_value=mock_decoder):
            result_path = booter.extract_qcow2(self.temp_path)

            # Should return a path in temp dir
            self.assertTrue(str(result_path).endswith('.qcow2'))
            self.assertTrue(result_path.parent.name.startswith('committed_boot_'))

            # Decoder should have been called
            mock_decoder.decode.assert_called_once()

    def test_extract_qcow2_to_custom_dir(self):
        """Extracts qcow2 to specified output directory."""
        mock_decoder = MagicMock()
        mock_decoder.decode.return_value = b"qcow2 binary data"

        output_dir = Path(tempfile.mkdtemp(prefix="test_output_"))

        try:
            booter = CommittedFileBooter(self.temp_path)

            with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder', return_value=mock_decoder):
                result_path = booter.extract_qcow2(self.temp_path, output_dir)

                # Should be in specified output dir
                self.assertEqual(result_path.parent, output_dir)
                self.assertTrue(result_path.exists())

                # Verify file contents
                with open(result_path, 'rb') as f:
                    self.assertEqual(f.read(), b"qcow2 binary data")
        finally:
            shutil.rmtree(output_dir, ignore_errors=True)

    def test_extract_qcow2_nonexistent_file(self):
        """Raises FileNotFoundError for non-existent file."""
        booter = CommittedFileBooter(self.temp_path)

        with self.assertRaises(FileNotFoundError):
            booter.extract_qcow2("/nonexistent/file.rts.png")


class TestGetStatus(unittest.TestCase):
    """Tests for get_status method."""

    def test_get_status_idle(self):
        """Returns correct status when idle."""
        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            f.write(b"fake png")
            temp_path = Path(f.name)

        try:
            booter = CommittedFileBooter(temp_path)
            status = booter.get_status()

            self.assertFalse(status["booted"])
            self.assertEqual(status["rts_png_path"], str(temp_path.resolve()))
            self.assertIsNone(status["extracted_qcow2"])
        finally:
            temp_path.unlink(missing_ok=True)

    def test_get_status_with_extracted_qcow2(self):
        """Returns status with extracted qcow2 path."""
        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            f.write(b"fake png")
            temp_path = Path(f.name)

        try:
            booter = CommittedFileBooter(temp_path)
            booter._extracted_qcow2 = Path("/tmp/test.qcow2")

            status = booter.get_status()

            self.assertEqual(status["extracted_qcow2"], "/tmp/test.qcow2")
        finally:
            temp_path.unlink(missing_ok=True)


class TestBootResult(unittest.TestCase):
    """Tests for BootResult dataclass."""

    def test_boot_result_to_dict(self):
        """Converts BootResult to dictionary."""
        result = BootResult(
            success=True,
            pid=12345,
            vnc_port=5900,
            serial_socket=Path("/tmp/serial.sock"),
            error_message=None,
        )

        d = result.to_dict()

        self.assertTrue(d["success"])
        self.assertEqual(d["pid"], 12345)
        self.assertEqual(d["vnc_port"], 5900)
        self.assertEqual(d["serial_socket"], "/tmp/serial.sock")
        self.assertIsNone(d["error_message"])

    def test_boot_result_failure(self):
        """Creates failure BootResult correctly."""
        result = BootResult(
            success=False,
            error_message="Something went wrong",
        )

        self.assertFalse(result.success)
        self.assertEqual(result.error_message, "Something went wrong")


class TestCommittedFileMetadata(unittest.TestCase):
    """Tests for CommittedFileMetadata dataclass."""

    def test_metadata_to_dict(self):
        """Converts metadata to dictionary."""
        metadata = CommittedFileMetadata(
            container_type=ContainerType.VM_SNAPSHOT,
            snapshot_tag="test-snap",
            source_format="qcow2",
            disk_size=1073741824,
        )

        d = metadata.to_dict()

        self.assertEqual(d["container_type"], "vm-snapshot")
        self.assertEqual(d["snapshot_tag"], "test-snap")
        self.assertEqual(d["source_format"], "qcow2")
        self.assertEqual(d["disk_size"], 1073741824)


if __name__ == '__main__':
    unittest.main()
