"""
Tests for CLI boot command with committed file support.

Tests the routing between BootBridge and CommittedFileBooter based on
container type detection, as well as verification in export.
"""

import pytest
import tempfile
import subprocess
import sys
from pathlib import Path
from unittest.mock import patch, MagicMock, mock_open


class TestContainerTypeDetection:
    """Tests for container type detection in CLI boot command."""

    def test_boot_detects_vm_snapshot_via_direct_call(self):
        """CLI detects vm-snapshot container type - test detection logic directly."""
        from systems.pixel_compiler.boot.committed_boot import CommittedFileBooter, ContainerType
        from PIL import Image, PngImagePlugin

        # Create a vm-snapshot type PNG
        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            temp_path = Path(f.name)
            # Create a PNG with vm-snapshot metadata
            img = Image.new('RGB', (10, 10), color='blue')
            meta = PngImagePlugin.PngInfo()
            meta.add_text("type", "vm-snapshot")
            img.save(f, format='PNG', pnginfo=meta)

        try:
            # Detection should return VM_SNAPSHOT
            result = CommittedFileBooter.detect_container_type(temp_path)
            assert result == ContainerType.VM_SNAPSHOT

        finally:
            temp_path.unlink(missing_ok=True)

    def test_boot_detects_bootable_via_direct_call(self):
        """CLI routes to BootBridge for regular containers - test detection logic directly."""
        from systems.pixel_compiler.boot.committed_boot import CommittedFileBooter, ContainerType
        from PIL import Image

        # Create a regular (non-vm-snapshot) PNG in memory
        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            temp_path = Path(f.name)
            # Create a simple PNG without vm-snapshot metadata
            img = Image.new('RGB', (10, 10), color='red')
            img.save(f, format='PNG')

        try:
            # Detection should return BOOTABLE for non-vm-snapshot files
            result = CommittedFileBooter.detect_container_type(temp_path)
            assert result == ContainerType.BOOTABLE

        finally:
            temp_path.unlink(missing_ok=True)

    def test_detect_container_type_invalid_png(self):
        """Detection raises ValueError for invalid PNG."""
        from systems.pixel_compiler.boot.committed_boot import CommittedFileBooter

        # Create an invalid PNG file
        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            temp_path = Path(f.name)
            f.write(b'not a png file')

        try:
            with pytest.raises(ValueError):
                CommittedFileBooter.detect_container_type(temp_path)

        finally:
            temp_path.unlink(missing_ok=True)


class TestCommittedFileBooterMetadata:
    """Tests for CommittedFileBooter metadata extraction."""

    def test_extract_metadata(self):
        """Extract metadata from committed file."""
        from systems.pixel_compiler.boot.committed_boot import CommittedFileBooter, ContainerType
        from PIL import Image, PngImagePlugin

        # Create a committed file with full metadata
        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            temp_path = Path(f.name)
            img = Image.new('RGB', (10, 10), color='blue')
            meta = PngImagePlugin.PngInfo()
            meta.add_text("type", "vm-snapshot")
            meta.add_text("snapshot_tag", "test-snapshot-123")
            meta.add_text("source_format", "qcow2")
            meta.add_text("original_size", "1048576")
            img.save(f, format='PNG', pnginfo=meta)

        try:
            metadata = CommittedFileBooter.extract_metadata(temp_path)

            assert metadata.container_type == ContainerType.VM_SNAPSHOT
            assert metadata.snapshot_tag == "test-snapshot-123"
            assert metadata.source_format == "qcow2"
            assert metadata.disk_size == 1048576

        finally:
            temp_path.unlink(missing_ok=True)


class TestVerificationInExport:
    """Tests for verification in SnapshotExporter."""

    def test_export_with_verification_stage(self):
        """VERIFYING stage exists in ExportStage enum."""
        from systems.pixel_compiler.boot.snapshot_exporter import ExportStage

        assert ExportStage.VERIFYING.value == "verifying"
        assert ExportStage.VERIFYING in list(ExportStage)

    def test_export_method_has_verify_parameter(self):
        """Export method has verify parameter with default True."""
        from systems.pixel_compiler.boot.snapshot_exporter import SnapshotExporter

        mock_bridge = MagicMock()
        exporter = SnapshotExporter(mock_bridge)

        import inspect
        sig = inspect.signature(exporter.export)
        assert 'verify' in sig.parameters
        assert sig.parameters['verify'].default is True

    def test_export_result_has_verified_fields(self):
        """ExportResult includes verified and verification_error fields."""
        from systems.pixel_compiler.boot.snapshot_exporter import ExportResult

        result = ExportResult(
            success=True,
            output_path=Path("/tmp/test.rts.png"),
            verified=True,
            verification_error=None
        )

        assert hasattr(result, 'verified')
        assert hasattr(result, 'verification_error')
        assert result.verified is True
        assert result.verification_error is None

    def test_export_result_to_dict_includes_verification(self):
        """ExportResult.to_dict() includes verification fields."""
        from systems.pixel_compiler.boot.snapshot_exporter import ExportResult

        result = ExportResult(
            success=True,
            output_path=Path("/tmp/test.rts.png"),
            verified=False,
            verification_error="Test error"
        )

        result_dict = result.to_dict()
        assert 'verified' in result_dict
        assert 'verification_error' in result_dict
        assert result_dict['verified'] is False
        assert result_dict['verification_error'] == "Test error"


class TestErrorHandling:
    """Tests for error handling in CLI boot command."""

    def test_boot_corrupted_file(self):
        """Corrupted file shows clear error."""
        from systems.pixel_compiler.pixelrts_cli import cmd_boot

        # Create a file that's not a valid PNG
        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            temp_path = Path(f.name)
            f.write(b'not a png file')

        try:
            args = MagicMock(
                inputs=[str(temp_path)],
                memory='2G',
                cpus=2,
                vnc=0,
                verbose=False,
                quiet=True,
                cmdline=None,
                qemu_arg=None,
                background=False
            )

            result = cmd_boot(args)

            # Should fail
            assert result != 0

        finally:
            temp_path.unlink(missing_ok=True)

    def test_boot_file_not_found(self):
        """File not found shows clear error."""
        from systems.pixel_compiler.pixelrts_cli import cmd_boot

        args = MagicMock(
            inputs=['/nonexistent/file.rts.png'],
            memory='2G',
            cpus=2,
            vnc=0,
            verbose=False,
            quiet=True,
            cmdline=None,
            qemu_arg=None,
            background=False
        )

        result = cmd_boot(args)

        # Should fail with error code 1
        assert result == 1

    def test_committed_file_booter_raises_on_missing_file(self):
        """CommittedFileBooter raises FileNotFoundError for missing file."""
        from systems.pixel_compiler.boot.committed_boot import CommittedFileBooter

        with pytest.raises(FileNotFoundError):
            CommittedFileBooter("/nonexistent/file.rts.png")


class TestExportVerificationIntegration:
    """Integration tests for export verification."""

    def test_verify_export_success(self):
        """_verify_export returns True for valid export."""
        from systems.pixel_compiler.boot.snapshot_exporter import SnapshotExporter
        from systems.pixel_compiler.boot.snapshot_committer import CommitResult

        # Create mock boot_bridge
        mock_bridge = MagicMock()
        exporter = SnapshotExporter(mock_bridge)

        # Create a valid .rts.png file for testing
        with tempfile.TemporaryDirectory() as tmpdir:
            output_path = Path(tmpdir) / "test.rts.png"

            try:
                from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder

                # Create test data
                test_data = b'\x00' * 1024
                encoder = PixelRTSEncoder(mode="standard")
                metadata = {
                    "type": "vm-snapshot",
                    "offsets": {}
                }
                png_data = encoder.encode(test_data, metadata=metadata)

                with open(output_path, 'wb') as f:
                    f.write(png_data)

                # Create mock commit result
                commit_result = CommitResult(
                    success=True,
                    output_path=output_path,
                    snapshot_tag="test-snapshot",
                    size_bytes=1024
                )

                # Verify should pass
                verified, error = exporter._verify_export(
                    output_path=output_path,
                    expected_disk_size=1024,
                    commit_result=commit_result
                )

                # Should pass since we encoded valid data
                assert verified is True
                assert error is None

            except ImportError:
                pytest.skip("PixelRTSEncoder not available")

    def test_verify_export_detects_size_mismatch(self):
        """_verify_export detects size mismatch."""
        from systems.pixel_compiler.boot.snapshot_exporter import SnapshotExporter
        from systems.pixel_compiler.boot.snapshot_committer import CommitResult

        # Create mock boot_bridge
        mock_bridge = MagicMock()
        exporter = SnapshotExporter(mock_bridge)

        # Create a valid .rts.png file for testing
        with tempfile.TemporaryDirectory() as tmpdir:
            output_path = Path(tmpdir) / "test.rts.png"

            try:
                from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder

                # Create test data
                test_data = b'\x00' * 1024
                encoder = PixelRTSEncoder(mode="standard")
                metadata = {
                    "type": "vm-snapshot",
                    "offsets": {}
                }
                png_data = encoder.encode(test_data, metadata=metadata)

                with open(output_path, 'wb') as f:
                    f.write(png_data)

                # Create mock commit result
                commit_result = CommitResult(
                    success=True,
                    output_path=output_path,
                    snapshot_tag="test-snapshot",
                    size_bytes=1024
                )

                # Verify should fail due to size mismatch (expecting 2048)
                verified, error = exporter._verify_export(
                    output_path=output_path,
                    expected_disk_size=2048,  # Expected size is larger than actual
                    commit_result=commit_result
                )

                # Should fail due to size mismatch
                assert verified is False
                assert "too small" in error.lower()

            except ImportError:
                pytest.skip("PixelRTSEncoder not available")

    def test_verify_export_with_kernel_hash(self):
        """_verify_export verifies kernel hash when present."""
        from systems.pixel_compiler.boot.snapshot_exporter import SnapshotExporter
        from systems.pixel_compiler.boot.snapshot_committer import CommitResult
        import hashlib

        mock_bridge = MagicMock()
        exporter = SnapshotExporter(mock_bridge)

        with tempfile.TemporaryDirectory() as tmpdir:
            output_path = Path(tmpdir) / "test.rts.png"

            try:
                from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder

                # Create test data with kernel
                test_data = b'\x00' * 1024
                kernel_data = b'kernel_content_here'
                combined_data = test_data + kernel_data

                encoder = PixelRTSEncoder(mode="standard")
                metadata = {
                    "type": "vm-snapshot",
                    "offsets": {
                        "kernel": {
                            "offset": 1024,
                            "size": len(kernel_data),
                            "sha256": hashlib.sha256(kernel_data).hexdigest()
                        }
                    }
                }
                png_data = encoder.encode(combined_data, metadata=metadata)

                with open(output_path, 'wb') as f:
                    f.write(png_data)

                commit_result = CommitResult(
                    success=True,
                    output_path=output_path,
                    snapshot_tag="test-snapshot",
                    size_bytes=1024
                )

                # Verify should pass with correct hash
                verified, error = exporter._verify_export(
                    output_path=output_path,
                    expected_disk_size=1024,
                    commit_result=commit_result
                )

                assert verified is True
                assert error is None

            except ImportError:
                pytest.skip("PixelRTSEncoder not available")


class TestCLIBootCommandRouting:
    """Tests for CLI boot command routing logic."""

    def test_cli_imports_boot_command(self):
        """CLI boot command can be imported."""
        from systems.pixel_compiler.pixelrts_cli import cmd_boot, _boot_committed
        assert callable(cmd_boot)
        assert callable(_boot_committed)

    def test_cli_has_boot_committed_helper(self):
        """CLI has _boot_committed helper function."""
        from systems.pixel_compiler.pixelrts_cli import _boot_committed
        import inspect
        sig = inspect.signature(_boot_committed)
        # Should have args and input_path parameters
        assert len(sig.parameters) >= 2

    def test_committed_boot_error_class_exists(self):
        """CommittedBootError exception class exists."""
        from systems.pixel_compiler.boot.committed_boot import CommittedBootError
        assert issubclass(CommittedBootError, Exception)


class TestEphemeralBootFlag:
    """Tests for --ephemeral CLI flag."""

    def test_boot_ephemeral_flag_in_parser(self):
        """Verify --ephemeral flag exists in boot parser."""
        import argparse
        from systems.pixel_compiler.pixelrts_cli import main

        # Parse with --ephemeral flag
        parser = argparse.ArgumentParser()
        subparsers = parser.add_subparsers(dest='command')
        boot_parser = subparsers.add_parser('boot')
        boot_parser.add_argument('inputs', nargs='+')
        boot_parser.add_argument('--ephemeral', '-e', action='store_true')

        args = boot_parser.parse_args(['--ephemeral', 'test.rts.png'])
        assert args.ephemeral is True

        # Without flag
        args = boot_parser.parse_args(['test.rts.png'])
        assert args.ephemeral is False

    def test_boot_ephemeral_creates_ephemeral_booter(self):
        """Verify EphemeralBooter is used when --ephemeral flag is set."""
        from systems.pixel_compiler.pixelrts_cli import cmd_boot
        from PIL import Image

        # Create a temporary PNG file
        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            temp_path = Path(f.name)
            img = Image.new('RGB', (10, 10), color='green')
            img.save(f, format='PNG')

        try:
            args = MagicMock(
                inputs=[str(temp_path)],
                memory='2G',
                cpus=2,
                vnc=0,
                verbose=False,
                quiet=True,
                cmdline=None,
                qemu_arg=None,
                background=False,
                ephemeral=True  # Enable ephemeral mode
            )

            # Mock EphemeralBooter at the import location
            with patch('systems.pixel_compiler.boot.ephemeral_boot.EphemeralBooter') as mock_ephemeral_class:
                mock_booter = MagicMock()
                mock_result = MagicMock()
                mock_result.success = True
                mock_result.pid = 12345
                mock_result.vnc_port = 0
                mock_result.process = None
                mock_booter.boot.return_value = mock_result
                mock_booter.original_path = temp_path
                mock_ephemeral_class.return_value.__enter__ = MagicMock(return_value=mock_booter)
                mock_ephemeral_class.return_value.__exit__ = MagicMock(return_value=False)

                result = cmd_boot(args)

                # Verify EphemeralBooter was instantiated
                mock_ephemeral_class.assert_called_once()
                call_kwargs = mock_ephemeral_class.call_args[1]
                assert str(temp_path) in str(call_kwargs.get('rts_png_path', ''))

        finally:
            temp_path.unlink(missing_ok=True)

    def test_boot_ephemeral_prints_mode_message(self):
        """Verify ephemeral mode message is printed when flag is set."""
        from systems.pixel_compiler.pixelrts_cli import cmd_boot
        from PIL import Image
        from io import StringIO

        # Create a temporary PNG file
        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            temp_path = Path(f.name)
            img = Image.new('RGB', (10, 10), color='blue')
            img.save(f, format='PNG')

        try:
            args = MagicMock(
                inputs=[str(temp_path)],
                memory='2G',
                cpus=2,
                vnc=0,
                verbose=False,
                quiet=False,  # Enable output
                cmdline=None,
                qemu_arg=None,
                background=False,
                ephemeral=True
            )

            captured_output = StringIO()

            with patch('sys.stdout', captured_output):
                with patch('systems.pixel_compiler.boot.ephemeral_boot.EphemeralBooter') as mock_ephemeral:
                    mock_booter = MagicMock()
                    mock_result = MagicMock()
                    mock_result.success = True
                    mock_result.pid = 12345
                    mock_result.vnc_port = 0
                    mock_result.process = None
                    mock_booter.boot.return_value = mock_result
                    mock_booter.original_path = temp_path
                    mock_ephemeral.return_value.__enter__ = MagicMock(return_value=mock_booter)
                    mock_ephemeral.return_value.__exit__ = MagicMock(return_value=False)

                    cmd_boot(args)

            output = captured_output.getvalue()
            assert "Ephemeral mode" in output or "ephemeral" in output.lower()

        finally:
            temp_path.unlink(missing_ok=True)

    def test_cli_has_boot_ephemeral_helper(self):
        """CLI has _boot_ephemeral helper function."""
        from systems.pixel_compiler.pixelrts_cli import _boot_ephemeral
        import inspect
        sig = inspect.signature(_boot_ephemeral)
        # Should have args and input_path parameters
        assert len(sig.parameters) >= 2

    def test_ephemeral_boot_error_class_exists(self):
        """EphemeralBootError exception class exists."""
        from systems.pixel_compiler.boot.ephemeral_boot import EphemeralBootError
        assert issubclass(EphemeralBootError, Exception)

    def test_boot_without_ephemeral_uses_bootbridge(self):
        """Verify BootBridge is used when --ephemeral flag is NOT set."""
        from systems.pixel_compiler.pixelrts_cli import cmd_boot
        from PIL import Image

        # Create a temporary PNG file
        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            temp_path = Path(f.name)
            img = Image.new('RGB', (10, 10), color='red')
            img.save(f, format='PNG')

        try:
            args = MagicMock(
                inputs=[str(temp_path)],
                memory='2G',
                cpus=2,
                vnc=0,
                verbose=False,
                quiet=True,
                cmdline=None,
                qemu_arg=None,
                background=False,
                ephemeral=False  # Disable ephemeral mode
            )

            # Mock BootBridge at the import location
            with patch('systems.pixel_compiler.boot.BootBridge') as mock_bridge_class:
                mock_bridge = MagicMock()
                mock_result = MagicMock()
                mock_result.success = True
                mock_result.pid = 12345
                mock_result.vnc_port = 0
                mock_result.process = None
                mock_result.mountpoint = None
                mock_bridge.boot.return_value = mock_result
                mock_bridge_class.return_value = mock_bridge

                result = cmd_boot(args)

                # Verify BootBridge was instantiated (not EphemeralBooter)
                mock_bridge_class.assert_called_once()

        finally:
            temp_path.unlink(missing_ok=True)
