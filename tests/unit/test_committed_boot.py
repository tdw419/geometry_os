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

        # Mock PixelRTSDecoder with proper metadata (no kernel/initrd)
        mock_decoder = MagicMock()
        mock_decoder.decode.return_value = b"fake qcow2 data"
        mock_decoder.get_metadata.return_value = {
            "disk_size": 15,  # Length of "fake qcow2 data"
            "offsets": {},  # No kernel/initrd
        }

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

        # Mock PixelRTSDecoder with proper metadata (no kernel/initrd)
        mock_decoder = MagicMock()
        mock_decoder.decode.return_value = b"fake qcow2 data"
        mock_decoder.get_metadata.return_value = {
            "disk_size": 15,
            "offsets": {},  # No kernel/initrd
        }

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


class TestKernelInitrdExtraction(unittest.TestCase):
    """Tests for _extract_kernel and _extract_initrd methods."""

    def setUp(self):
        """Create temp file for each test."""
        self.temp_file = tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False)
        self.temp_file.write(b"fake png content")
        self.temp_file.close()
        self.temp_path = Path(self.temp_file.name)
        self.output_dir = Path(tempfile.mkdtemp(prefix="test_extract_"))

    def tearDown(self):
        """Clean up temp files."""
        self.temp_path.unlink(missing_ok=True)
        shutil.rmtree(self.output_dir, ignore_errors=True)

    def test_extract_kernel_success(self):
        """Extracts kernel bytes using offset metadata."""
        booter = CommittedFileBooter(self.temp_path)

        # Create mock decoded data with kernel at offset 100
        kernel_data = b"KERNEL_BINARY_DATA_HERE_12345678"
        combined_data = b"Q" * 100 + kernel_data + b"I" * 50  # qcow2 + kernel + initrd

        # Set up mock decoded state
        booter._decoded_data = combined_data
        booter._decoded_metadata = {
            "disk_size": 100,
            "offsets": {
                "kernel": {
                    "offset": 100,
                    "size": len(kernel_data),
                }
            }
        }

        kernel_path = booter._extract_kernel(self.output_dir)

        self.assertIsNotNone(kernel_path)
        self.assertEqual(kernel_path, self.output_dir / "kernel")
        self.assertTrue(kernel_path.exists())

        # Verify content
        with open(kernel_path, 'rb') as f:
            self.assertEqual(f.read(), kernel_data)

    def test_extract_initrd_success(self):
        """Extracts initrd bytes using offset metadata."""
        booter = CommittedFileBooter(self.temp_path)

        # Create mock decoded data with initrd at offset 150
        initrd_data = b"INITRD_BINARY_DATA_HERE_87654321"
        combined_data = b"Q" * 100 + b"K" * 50 + initrd_data

        # Set up mock decoded state
        booter._decoded_data = combined_data
        booter._decoded_metadata = {
            "disk_size": 100,
            "offsets": {
                "initrd": {
                    "offset": 150,
                    "size": len(initrd_data),
                }
            }
        }

        initrd_path = booter._extract_initrd(self.output_dir)

        self.assertIsNotNone(initrd_path)
        self.assertEqual(initrd_path, self.output_dir / "initrd")
        self.assertTrue(initrd_path.exists())

        # Verify content
        with open(initrd_path, 'rb') as f:
            self.assertEqual(f.read(), initrd_data)

    def test_extract_kernel_hash_mismatch(self):
        """Raises error on kernel hash mismatch."""
        import hashlib
        from systems.pixel_compiler.boot.committed_boot import CommittedBootError

        booter = CommittedFileBooter(self.temp_path)

        kernel_data = b"KERNEL_BINARY_DATA"
        combined_data = b"Q" * 100 + kernel_data

        booter._decoded_data = combined_data
        booter._decoded_metadata = {
            "disk_size": 100,
            "offsets": {
                "kernel": {
                    "offset": 100,
                    "size": len(kernel_data),
                    "sha256": "wrong_hash_value_here",
                }
            }
        }

        with self.assertRaises(CommittedBootError) as ctx:
            booter._extract_kernel(self.output_dir)

        self.assertIn("Kernel hash mismatch", str(ctx.exception))

    def test_extract_initrd_hash_mismatch(self):
        """Raises error on initrd hash mismatch."""
        from systems.pixel_compiler.boot.committed_boot import CommittedBootError

        booter = CommittedFileBooter(self.temp_path)

        initrd_data = b"INITRD_BINARY_DATA"
        combined_data = b"Q" * 100 + initrd_data

        booter._decoded_data = combined_data
        booter._decoded_metadata = {
            "disk_size": 100,
            "offsets": {
                "initrd": {
                    "offset": 100,
                    "size": len(initrd_data),
                    "sha256": "wrong_hash_value_here",
                }
            }
        }

        with self.assertRaises(CommittedBootError) as ctx:
            booter._extract_initrd(self.output_dir)

        self.assertIn("Initrd hash mismatch", str(ctx.exception))

    def test_extract_kernel_no_kernel_stored(self):
        """Returns None when offsets has no kernel."""
        booter = CommittedFileBooter(self.temp_path)

        booter._decoded_data = b"some data"
        booter._decoded_metadata = {
            "disk_size": 100,
            "offsets": {}  # No kernel
        }

        result = booter._extract_kernel(self.output_dir)

        self.assertIsNone(result)

    def test_extract_initrd_no_initrd_stored(self):
        """Returns None when offsets has no initrd."""
        booter = CommittedFileBooter(self.temp_path)

        booter._decoded_data = b"some data"
        booter._decoded_metadata = {
            "disk_size": 100,
            "offsets": {}  # No initrd
        }

        result = booter._extract_initrd(self.output_dir)

        self.assertIsNone(result)

    def test_extract_kernel_no_decoded_data(self):
        """Returns None when no decoded data available."""
        booter = CommittedFileBooter(self.temp_path)

        # No decoded data set
        booter._decoded_data = None
        booter._decoded_metadata = None

        result = booter._extract_kernel(self.output_dir)

        self.assertIsNone(result)

    def test_extract_initrd_no_decoded_data(self):
        """Returns None when no decoded data available."""
        booter = CommittedFileBooter(self.temp_path)

        # No decoded data set
        booter._decoded_data = None
        booter._decoded_metadata = None

        result = booter._extract_initrd(self.output_dir)

        self.assertIsNone(result)

    def test_extract_kernel_hash_verification_success(self):
        """Verifies kernel hash when correct hash provided."""
        import hashlib

        booter = CommittedFileBooter(self.temp_path)

        kernel_data = b"KERNEL_BINARY_DATA"
        combined_data = b"Q" * 100 + kernel_data
        expected_hash = hashlib.sha256(kernel_data).hexdigest()

        booter._decoded_data = combined_data
        booter._decoded_metadata = {
            "disk_size": 100,
            "offsets": {
                "kernel": {
                    "offset": 100,
                    "size": len(kernel_data),
                    "sha256": expected_hash,
                }
            }
        }

        kernel_path = booter._extract_kernel(self.output_dir)

        # Should succeed without raising
        self.assertIsNotNone(kernel_path)

        # Verify content
        with open(kernel_path, 'rb') as f:
            self.assertEqual(f.read(), kernel_data)

    def test_extract_initrd_hash_verification_success(self):
        """Verifies initrd hash when correct hash provided."""
        import hashlib

        booter = CommittedFileBooter(self.temp_path)

        initrd_data = b"INITRD_BINARY_DATA"
        combined_data = b"Q" * 100 + initrd_data
        expected_hash = hashlib.sha256(initrd_data).hexdigest()

        booter._decoded_data = combined_data
        booter._decoded_metadata = {
            "disk_size": 100,
            "offsets": {
                "initrd": {
                    "offset": 100,
                    "size": len(initrd_data),
                    "sha256": expected_hash,
                }
            }
        }

        initrd_path = booter._extract_initrd(self.output_dir)

        # Should succeed without raising
        self.assertIsNotNone(initrd_path)

        # Verify content
        with open(initrd_path, 'rb') as f:
            self.assertEqual(f.read(), initrd_data)


class TestExtractQcow2Trim(unittest.TestCase):
    """Tests for extract_qcow2 disk_size trimming."""

    def setUp(self):
        """Create temp file for each test."""
        self.temp_file = tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False)
        self.temp_file.write(b"fake png content")
        self.temp_file.close()
        self.temp_path = Path(self.temp_file.name)

    def tearDown(self):
        """Clean up temp file."""
        self.temp_path.unlink(missing_ok=True)

    def test_extract_qcow2_trims_to_disk_size(self):
        """Trims decoded data to disk_size bytes."""
        # Mock decoder that returns combined data
        mock_decoder = MagicMock()
        # Combined data: qcow2 (100 bytes) + kernel (50 bytes) + initrd (30 bytes)
        combined_data = b"Q" * 100 + b"K" * 50 + b"I" * 30
        mock_decoder.decode.return_value = combined_data
        mock_decoder.get_metadata.return_value = {
            "disk_size": 100,
            "offsets": {
                "kernel": {"offset": 100, "size": 50},
                "initrd": {"offset": 150, "size": 30}
            }
        }

        booter = CommittedFileBooter(self.temp_path)

        with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder', return_value=mock_decoder):
            result_path = booter.extract_qcow2(self.temp_path)

            # Should be trimmed to disk_size (100 bytes)
            with open(result_path, 'rb') as f:
                content = f.read()
                self.assertEqual(len(content), 100)
                self.assertEqual(content, b"Q" * 100)

            # Verify decoder and metadata stored
            self.assertEqual(booter._decoder, mock_decoder)
            self.assertEqual(booter._decoded_metadata["disk_size"], 100)
            self.assertEqual(booter._decoded_data, combined_data)

    def test_extract_qcow2_no_disk_size_metadata(self):
        """Uses full decoded data when no disk_size metadata."""
        mock_decoder = MagicMock()
        full_data = b"Q" * 100
        mock_decoder.decode.return_value = full_data
        mock_decoder.get_metadata.return_value = {}  # No disk_size

        booter = CommittedFileBooter(self.temp_path)

        with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder', return_value=mock_decoder):
            result_path = booter.extract_qcow2(self.temp_path)

            # Should use full data
            with open(result_path, 'rb') as f:
                content = f.read()
                self.assertEqual(len(content), 100)
                self.assertEqual(content, full_data)


class TestBootUsesExtractedFiles(unittest.TestCase):
    """Tests for boot() using extracted kernel/initrd."""

    def setUp(self):
        """Create temp file for each test."""
        self.temp_file = tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False)
        self.temp_file.write(b"fake png content")
        self.temp_file.close()
        self.temp_path = Path(self.temp_file.name)

    def tearDown(self):
        """Clean up temp file."""
        self.temp_path.unlink(missing_ok=True)

    def test_boot_uses_extracted_kernel_initrd(self):
        """boot() passes extracted kernel/initrd to QemuBoot."""
        # Mock container type detection
        mock_img = MagicMock()
        mock_img.text = {"type": "vm-snapshot"}
        mock_img.__enter__ = Mock(return_value=mock_img)
        mock_img.__exit__ = Mock(return_value=False)

        # Mock decoder with combined data
        kernel_data = b"KERNEL"
        initrd_data = b"INITRD"
        qcow2_data = b"QCOW2DATA"
        combined_data = qcow2_data + kernel_data + initrd_data

        mock_decoder = MagicMock()
        mock_decoder.decode.return_value = combined_data
        mock_decoder.get_metadata.return_value = {
            "disk_size": len(qcow2_data),
            "offsets": {
                "kernel": {"offset": len(qcow2_data), "size": len(kernel_data)},
                "initrd": {"offset": len(qcow2_data) + len(kernel_data), "size": len(initrd_data)}
            }
        }

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

        with patch('PIL.Image.open', return_value=mock_img), \
             patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder', return_value=mock_decoder), \
             patch('systems.pixel_compiler.integration.qemu_boot.QemuBoot', return_value=mock_qemu), \
             patch('systems.pixel_compiler.integration.qemu_boot.QemuConfig'), \
             patch('systems.pixel_compiler.integration.qemu_boot.NetworkMode'):

            result = booter.boot()

            self.assertTrue(result.success)
            # Verify boot was called with kernel and initrd
            mock_qemu.boot.assert_called_once()
            call_kwargs = mock_qemu.boot.call_args[1]
            self.assertIn('kernel', call_kwargs)
            self.assertIn('initrd', call_kwargs)

    def test_full_roundtrip(self):
        """Full roundtrip: extract qcow2, kernel, initrd from combined data."""
        # Create mock combined data as SnapshotExporter would create
        qcow2_data = b"QCOW2_BINARY_DATA_" * 10  # 190 bytes
        kernel_data = b"KERNEL_BINARY_DATA" * 5    # 95 bytes
        initrd_data = b"INITRD_BINARY_DATA" * 4    # 76 bytes

        combined_data = qcow2_data + kernel_data + initrd_data
        disk_size = len(qcow2_data)
        kernel_offset = disk_size
        initrd_offset = kernel_offset + len(kernel_data)

        # Mock container type
        mock_img = MagicMock()
        mock_img.text = {"type": "vm-snapshot"}
        mock_img.__enter__ = Mock(return_value=mock_img)
        mock_img.__exit__ = Mock(return_value=False)

        # Mock decoder
        mock_decoder = MagicMock()
        mock_decoder.decode.return_value = combined_data
        mock_decoder.get_metadata.return_value = {
            "disk_size": disk_size,
            "offsets": {
                "kernel": {
                    "offset": kernel_offset,
                    "size": len(kernel_data),
                },
                "initrd": {
                    "offset": initrd_offset,
                    "size": len(initrd_data),
                }
            }
        }

        booter = CommittedFileBooter(self.temp_path)

        with patch('PIL.Image.open', return_value=mock_img), \
             patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder', return_value=mock_decoder):

            # Extract qcow2 first
            qcow2_path = booter.extract_qcow2(self.temp_path)

            # Verify qcow2 trimmed correctly
            with open(qcow2_path, 'rb') as f:
                extracted_qcow2 = f.read()
                self.assertEqual(len(extracted_qcow2), disk_size)
                self.assertEqual(extracted_qcow2, qcow2_data)

            # Extract kernel
            kernel_path = booter._extract_kernel(qcow2_path.parent)
            self.assertIsNotNone(kernel_path)
            with open(kernel_path, 'rb') as f:
                self.assertEqual(f.read(), kernel_data)

            # Extract initrd
            initrd_path = booter._extract_initrd(qcow2_path.parent)
            self.assertIsNotNone(initrd_path)
            with open(initrd_path, 'rb') as f:
                self.assertEqual(f.read(), initrd_data)


if __name__ == '__main__':
    unittest.main()
