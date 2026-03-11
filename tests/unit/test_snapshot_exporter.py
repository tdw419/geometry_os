#!/usr/bin/env python3
"""
Unit tests for SnapshotExporter class.

Tests the export pipeline with mocked dependencies:
- BootBridge: Mocked VM interface
- SnapshotCommitter: Mocked snapshot extraction
- PixelRTSEncoder: Mocked encoding
"""

import tempfile
from datetime import datetime
from pathlib import Path
from unittest.mock import MagicMock, mock_open, patch

import pytest

from systems.pixel_compiler.boot.snapshot_committer import CommitResult
from systems.pixel_compiler.boot.snapshot_exporter import (
    ExportProgress,
    ExportResult,
    ExportStage,
    SnapshotExporter,
)


class TestExportStage:
    """Tests for ExportStage enum."""

    def test_export_stage_values(self):
        """Verify ExportStage enum has expected values."""
        assert ExportStage.IDLE.value == "idle"
        assert ExportStage.COMMITTING.value == "committing"
        assert ExportStage.EXTRACTING_BOOT_FILES.value == "extracting_boot_files"
        assert ExportStage.ENCODING.value == "encoding"
        assert ExportStage.COMPLETE.value == "complete"
        assert ExportStage.FAILED.value == "failed"


class TestExportProgress:
    """Tests for ExportProgress dataclass."""

    def test_export_progress_creation(self):
        """Verify ExportProgress can be created with required fields."""
        progress = ExportProgress(
            stage=ExportStage.IDLE,
            started_at=datetime.now()
        )
        assert progress.stage == ExportStage.IDLE
        assert progress.completed_at is None
        assert progress.message is None
        assert progress.bytes_processed == 0
        assert progress.total_bytes == 0

    def test_export_progress_to_dict(self):
        """Verify ExportProgress.to_dict() serializes correctly."""
        started = datetime.now()
        completed = datetime.now()
        progress = ExportProgress(
            stage=ExportStage.ENCODING,
            started_at=started,
            completed_at=completed,
            message="Encoding...",
            bytes_processed=1024,
            total_bytes=2048
        )
        result = progress.to_dict()

        assert result["stage"] == "encoding"
        assert result["message"] == "Encoding..."
        assert result["bytes_processed"] == 1024
        assert result["total_bytes"] == 2048
        assert "started_at" in result
        assert "completed_at" in result


class TestExportResult:
    """Tests for ExportResult dataclass."""

    def test_export_result_success(self):
        """Verify ExportResult for successful export."""
        result = ExportResult(
            success=True,
            output_path=Path("output.rts.png"),
            size_bytes=4096,
            snapshot_tag="test-snapshot"
        )
        assert result.success is True
        assert result.output_path == Path("output.rts.png")
        assert result.size_bytes == 4096
        assert result.error_message is None

    def test_export_result_failure(self):
        """Verify ExportResult for failed export."""
        result = ExportResult(
            success=False,
            output_path=None,
            error_message="Test error"
        )
        assert result.success is False
        assert result.output_path is None
        assert result.error_message == "Test error"

    def test_export_result_to_dict(self):
        """Verify ExportResult.to_dict() serializes correctly."""
        progress = ExportProgress(
            stage=ExportStage.COMPLETE,
            started_at=datetime.now()
        )
        result = ExportResult(
            success=True,
            output_path=Path("output.rts.png"),
            size_bytes=4096,
            progress=progress,
            snapshot_tag="test-tag"
        )
        d = result.to_dict()

        assert d["success"] is True
        assert d["output_path"] == "output.rts.png"
        assert d["size_bytes"] == 4096
        assert d["snapshot_tag"] == "test-tag"
        assert d["progress"] is not None


class TestSnapshotExporter:
    """Tests for SnapshotExporter class."""

    @pytest.fixture
    def mock_boot_bridge(self):
        """Create a mock BootBridge."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("test.rts.png")
        return bridge

    @pytest.fixture
    def mock_committer(self):
        """Create a mock SnapshotCommitter result."""
        result = CommitResult(
            success=True,
            output_path=Path("/tmp/extracted.qcow2"),
            snapshot_tag="test-snapshot",
            size_bytes=1024 * 1024  # 1MB
        )
        return result

    @pytest.fixture
    def exporter(self, mock_boot_bridge):
        """Create a SnapshotExporter with mocked dependencies."""
        return SnapshotExporter(boot_bridge=mock_boot_bridge)

    def test_exporter_requires_boot_bridge(self):
        """Verify SnapshotExporter raises error without boot_bridge."""
        with pytest.raises(ValueError, match="boot_bridge cannot be None"):
            SnapshotExporter(boot_bridge=None)

    def test_exporter_stores_boot_bridge(self, mock_boot_bridge):
        """Verify SnapshotExporter stores boot_bridge for passing to committer."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)
        assert exporter.boot_bridge is mock_boot_bridge

    def test_export_passes_boot_bridge_to_committer(self, mock_boot_bridge):
        """Verify SnapshotCommitter receives boot_bridge from SnapshotExporter."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        with patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotCommitter') as MockCommitter:
            mock_committer_instance = MagicMock()
            mock_committer_instance.commit.return_value = CommitResult(
                success=True,
                output_path=Path("/tmp/extracted.qcow2"),
                snapshot_tag="test-snapshot",
                size_bytes=1024
            )
            MockCommitter.return_value = mock_committer_instance

            # Mock _encode_to_rts to avoid file operations
            with patch.object(exporter, '_encode_to_rts', return_value=1024):
                with patch('tempfile.mkdtemp', return_value='/tmp/test_export'):
                    with patch('shutil.rmtree'):
                        with patch.object(Path, 'mkdir'):
                            exporter.export(output_path=Path("output.rts.png"))

            # Verify SnapshotCommitter was instantiated with boot_bridge
            MockCommitter.assert_called_once()
            call_kwargs = MockCommitter.call_args[1]
            assert call_kwargs['boot_bridge'] is mock_boot_bridge

    def test_export_calls_committer_first(self, mock_boot_bridge, mock_committer):
        """Verify SnapshotCommitter.commit called before encoding."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        with patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotCommitter') as MockCommitter:
            mock_committer_instance = MagicMock()
            mock_committer_instance.commit.return_value = mock_committer
            MockCommitter.return_value = mock_committer_instance

            # Mock _encode_to_rts to avoid file operations
            with patch.object(exporter, '_encode_to_rts', return_value=1024):
                with patch('tempfile.mkdtemp', return_value='/tmp/test_export'):
                    with patch('shutil.rmtree'):
                        with patch.object(Path, 'mkdir'):
                            exporter.export(output_path=Path("output.rts.png"))

            # Verify commit was called
            mock_committer_instance.commit.assert_called_once()

    def test_export_encodes_to_rts(self, mock_boot_bridge, mock_committer):
        """Verify PixelRTSEncoder.encode called with qcow2 data."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        with patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotCommitter') as MockCommitter:
            mock_committer_instance = MagicMock()
            mock_committer_instance.commit.return_value = mock_committer
            MockCommitter.return_value = mock_committer_instance

            # Mock _encode_to_rts to track calls
            with patch.object(exporter, '_encode_to_rts', return_value=2048) as mock_encode:
                with patch('tempfile.mkdtemp', return_value='/tmp/test_export'):
                    with patch('shutil.rmtree'):
                        with patch.object(Path, 'mkdir'):
                            result = exporter.export(output_path=Path("output.rts.png"))

            # Verify _encode_to_rts was called
            mock_encode.assert_called_once()
            # Check the call includes correct arguments
            call_kwargs = mock_encode.call_args.kwargs
            assert call_kwargs['snapshot_tag'] == "test-snapshot"

    def test_export_writes_rts_png_file(self, mock_boot_bridge, mock_committer):
        """Verify output file has .rts.png extension."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        with patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotCommitter') as MockCommitter:
            mock_committer_instance = MagicMock()
            mock_committer_instance.commit.return_value = mock_committer
            MockCommitter.return_value = mock_committer_instance

            # Mock _encode_to_rts to avoid file operations
            with patch.object(exporter, '_encode_to_rts', return_value=1024):
                with patch('tempfile.mkdtemp', return_value='/tmp/test_export'):
                    with patch('shutil.rmtree'):
                        with patch.object(Path, 'mkdir'):
                            result = exporter.export(output_path=Path("output.rts.png"))

            # Verify result has .rts.png extension
            assert result.success is True
            assert str(result.output_path).endswith('.rts.png')

    def test_export_progress_updates(self, mock_boot_bridge, mock_committer):
        """Verify progress callback receives updates."""
        progress_stages = []  # Capture stages, not the mutable progress object

        def capture_progress(progress):
            progress_stages.append(progress.stage)  # Capture enum, not object

        exporter = SnapshotExporter(
            boot_bridge=mock_boot_bridge,
            progress_callback=capture_progress
        )

        with patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotCommitter') as MockCommitter:
            mock_committer_instance = MagicMock()
            mock_committer_instance.commit.return_value = mock_committer
            MockCommitter.return_value = mock_committer_instance

            # Mock _encode_to_rts to avoid file operations
            with patch.object(exporter, '_encode_to_rts', return_value=1024):
                with patch('tempfile.mkdtemp', return_value='/tmp/test_export'):
                    with patch('shutil.rmtree'):
                        with patch.object(Path, 'mkdir'):
                            exporter.export(output_path=Path("output.rts.png"))

        # Verify we got progress updates
        assert len(progress_stages) > 0

        # Verify stages include COMMITTING (set before committer call) and COMPLETE
        assert ExportStage.COMMITTING in progress_stages
        assert ExportStage.COMPLETE in progress_stages

    def test_export_handles_committer_failure(self, mock_boot_bridge):
        """Verify error propagation when committer fails."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        with patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotCommitter') as MockCommitter:
            mock_committer_instance = MagicMock()
            mock_committer_instance.commit.return_value = CommitResult(
                success=False,
                output_path=None,
                snapshot_tag="test-snapshot",
                error_message="Commit failed: VM not booted"
            )
            MockCommitter.return_value = mock_committer_instance

            with patch('tempfile.mkdtemp', return_value='/tmp/test_export'):
                with patch('shutil.rmtree'):
                    with patch.object(Path, 'mkdir'):
                        result = exporter.export(output_path=Path("output.rts.png"))

        assert result.success is False
        assert "Commit failed" in result.error_message

    def test_export_handles_encoding_failure(self, mock_boot_bridge, mock_committer):
        """Verify error handling when encoding fails."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        with patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotCommitter') as MockCommitter:
            mock_committer_instance = MagicMock()
            mock_committer_instance.commit.return_value = mock_committer
            MockCommitter.return_value = mock_committer_instance

            # Make _encode_to_rts raise an exception
            with patch.object(exporter, '_encode_to_rts', side_effect=RuntimeError("Encoding failed")):
                with patch('tempfile.mkdtemp', return_value='/tmp/test_export'):
                    with patch('shutil.rmtree'):
                        with patch.object(Path, 'mkdir'):
                            result = exporter.export(output_path=Path("output.rts.png"))

        assert result.success is False
        assert "Encoding failed" in result.error_message

    def test_export_cleanup_temp_files(self, mock_boot_bridge, mock_committer):
        """Verify temp directory cleaned up."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        with patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotCommitter') as MockCommitter:
            mock_committer_instance = MagicMock()
            mock_committer_instance.commit.return_value = mock_committer
            MockCommitter.return_value = mock_committer_instance

            # Mock _encode_to_rts to avoid file operations
            with patch.object(exporter, '_encode_to_rts', return_value=1024):
                with patch('tempfile.mkdtemp', return_value='/tmp/test_export_123') as mock_mkdtemp:
                    with patch('shutil.rmtree') as mock_rmtree:
                        with patch.object(Path, 'mkdir'):
                            result = exporter.export(output_path=Path("output.rts.png"))

        # Verify rmtree was called with the temp directory
        mock_rmtree.assert_called_once_with('/tmp/test_export_123', ignore_errors=True)

    def test_export_ensures_rts_png_extension(self, mock_boot_bridge, mock_committer):
        """Verify output path gets .rts.png extension if not provided."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        with patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotCommitter') as MockCommitter:
            mock_committer_instance = MagicMock()
            mock_committer_instance.commit.return_value = mock_committer
            MockCommitter.return_value = mock_committer_instance

            # Mock _encode_to_rts to avoid file operations
            with patch.object(exporter, '_encode_to_rts', return_value=1024):
                with patch('tempfile.mkdtemp', return_value='/tmp/test_export'):
                    with patch('shutil.rmtree'):
                        with patch.object(Path, 'mkdir'):
                            # Pass path without .rts.png extension
                            result = exporter.export(output_path=Path("output.png"))

        # Result should have .rts.png extension
        assert str(result.output_path).endswith('.rts.png')

    def test_export_with_custom_tag(self, mock_boot_bridge, mock_committer):
        """Verify custom tag is passed to committer."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        with patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotCommitter') as MockCommitter:
            mock_committer_instance = MagicMock()
            mock_committer_instance.commit.return_value = mock_committer
            MockCommitter.return_value = mock_committer_instance

            # Mock _encode_to_rts to avoid file operations
            with patch.object(exporter, '_encode_to_rts', return_value=1024):
                with patch('tempfile.mkdtemp', return_value='/tmp/test_export'):
                    with patch('shutil.rmtree'):
                        with patch.object(Path, 'mkdir'):
                            result = exporter.export(
                                output_path=Path("output.rts.png"),
                                tag="my-custom-tag"
                            )

        # Verify tag was passed to committer
        call_kwargs = mock_committer_instance.commit.call_args[1]
        assert call_kwargs['tag'] == "my-custom-tag"

    def test_export_creates_parent_directory(self, mock_boot_bridge, mock_committer):
        """Verify parent directory is created if it doesn't exist."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        with patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotCommitter') as MockCommitter:
            mock_committer_instance = MagicMock()
            mock_committer_instance.commit.return_value = mock_committer
            MockCommitter.return_value = mock_committer_instance

            # Mock _encode_to_rts to avoid file operations
            with patch.object(exporter, '_encode_to_rts', return_value=1024):
                with patch('tempfile.mkdtemp', return_value='/tmp/test_export'):
                    with patch('shutil.rmtree'):
                        with patch.object(Path, 'mkdir') as mock_mkdir:
                            result = exporter.export(
                                output_path=Path("/some/nested/path/output.rts.png")
                            )

        # Verify mkdir was called on parent
        mock_mkdir.assert_called_once_with(parents=True, exist_ok=True)


class TestEncodeToRts:
    """Tests for _encode_to_rts method."""

    @pytest.fixture
    def mock_boot_bridge(self):
        """Create a mock BootBridge."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("test.rts.png")
        return bridge

    def test_encode_to_rts_calls_pixelrts_encoder(self, mock_boot_bridge):
        """Verify _encode_to_rts calls PixelRTSEncoder.encode correctly."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        # Create a temp file to read
        qcow2_data = b'fake qcow2 data for encoding'

        mock_encoder = MagicMock()
        mock_encoder.encode.return_value = b'PNG encoded data'

        with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSEncoder', return_value=mock_encoder):
            # Use a real temp file
            import tempfile
            with tempfile.NamedTemporaryFile(delete=False, suffix='.qcow2') as tmp:
                tmp.write(qcow2_data)
                tmp_path = Path(tmp.name)

            try:
                with tempfile.NamedTemporaryFile(delete=False, suffix='.rts.png') as out_tmp:
                    out_path = Path(out_tmp.name)

                # Call _encode_to_rts
                result_size = exporter._encode_to_rts(
                    qcow2_path=tmp_path,
                    output_path=out_path,
                    snapshot_tag="test-snapshot"
                )

                # Verify encoder was called
                mock_encoder.encode.assert_called_once()
                args, kwargs = mock_encoder.encode.call_args
                assert args[0] == qcow2_data
                assert kwargs.get('metadata', {}).get('type') == 'vm-snapshot'
                assert kwargs.get('metadata', {}).get('snapshot_tag') == 'test-snapshot'

            finally:
                tmp_path.unlink(missing_ok=True)
                out_path.unlink(missing_ok=True)

    def test_encode_to_rts_handles_import_error(self, mock_boot_bridge):
        """Verify _encode_to_rts handles PixelRTSEncoder not available."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        # Mock the import to raise ImportError
        import sys
        original_module = sys.modules.get('systems.pixel_compiler.pixelrts_v2_core')

        # Create a mock module that raises ImportError when PixelRTSEncoder is accessed
        mock_module = MagicMock()
        # Make PixelRTSEncoder raise ImportError when accessed
        type(mock_module).PixelRTSEncoder = property(lambda self: (_ for _ in ()).throw(ImportError("Not available")))

        with patch.dict('sys.modules', {'systems.pixel_compiler.pixelrts_v2_core': mock_module}):
            with patch.dict('sys.modules', {'pixel_compiler.pixelrts_v2_core': mock_module}):
                with tempfile.NamedTemporaryFile(delete=False, suffix='.qcow2') as tmp:
                    tmp.write(b'data')
                    tmp_path = Path(tmp.name)

                try:
                    with pytest.raises(RuntimeError, match="PixelRTSEncoder not available"):
                        exporter._encode_to_rts(
                            qcow2_path=tmp_path,
                            output_path=Path("/tmp/output.rts.png"),
                            snapshot_tag="test"
                        )
                finally:
                    tmp_path.unlink(missing_ok=True)
                    # Restore original module
                    if original_module:
                        sys.modules['systems.pixel_compiler.pixelrts_v2_core'] = original_module


class TestSnapshotExporterIntegration:
    """Integration-style tests for SnapshotExporter."""

    @pytest.fixture
    def mock_boot_bridge(self):
        """Create a mock BootBridge."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("test.rts.png")
        return bridge

    def test_full_pipeline_success(self, mock_boot_bridge):
        """Test full export pipeline success path."""
        progress_stages = []

        def capture_progress(progress):
            progress_stages.append(progress.stage)  # Capture enum, not object

        exporter = SnapshotExporter(
            boot_bridge=mock_boot_bridge,
            progress_callback=capture_progress
        )

        # Mock successful commit
        commit_result = CommitResult(
            success=True,
            output_path=Path("/tmp/extracted.qcow2"),
            snapshot_tag="test-snapshot",
            size_bytes=2048
        )

        with patch('systems.pixel_compiler.boot.snapshot_exporter.SnapshotCommitter') as MockCommitter:
            mock_committer_instance = MagicMock()
            mock_committer_instance.commit.return_value = commit_result
            MockCommitter.return_value = mock_committer_instance

            # Mock _encode_to_rts to avoid file operations
            with patch.object(exporter, '_encode_to_rts', return_value=2048):
                with patch('tempfile.mkdtemp', return_value='/tmp/test_export'):
                    with patch('shutil.rmtree'):
                        with patch.object(Path, 'mkdir'):
                            result = exporter.export(output_path=Path("output.rts.png"))

        # Verify success
        assert result.success is True
        assert result.output_path == Path("output.rts.png")
        assert result.snapshot_tag == "test-snapshot"

        # Verify progress stages include key stages
        assert ExportStage.COMMITTING in progress_stages  # Set before commit call
        assert ExportStage.COMPLETE in progress_stages     # Set on success


class TestExtractOriginalBootFiles:
    """Tests for _extract_original_boot_files method."""

    @pytest.fixture
    def mock_boot_bridge(self):
        """Create a mock BootBridge with mounted filesystem."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("test.rts.png")
        bridge._mounted = True
        bridge._mount_helper = MagicMock()
        return bridge

    @pytest.fixture
    def exporter(self, mock_boot_bridge):
        """Create a SnapshotExporter with mocked dependencies."""
        return SnapshotExporter(boot_bridge=mock_boot_bridge)

    def test_extract_original_boot_files_success(self, mock_boot_bridge):
        """Verify kernel/initrd bytes extracted when mounted."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        # Mock mount_helper to return paths
        mock_mount_helper = mock_boot_bridge._mount_helper
        mock_mount_helper.discover_boot_files.return_value = (
            "/tmp/mount/kernel",
            "/tmp/mount/initrd"
        )

        # Mock file reads
        kernel_data = b'fake kernel data 12345'
        initrd_data = b'fake initrd data 67890'

        with patch('builtins.open', mock_open(read_data=b'')) as mock_file:
            # Set up different read data for kernel and initrd
            mock_file.return_value.read.side_effect = [kernel_data, initrd_data]

            result_kernel, result_initrd = exporter._extract_original_boot_files()

            # Verify discover_boot_files was called
            mock_mount_helper.discover_boot_files.assert_called_once()

    def test_extract_original_boot_files_no_mount(self):
        """Verify (None, None) returned when VM not mounted."""
        bridge = MagicMock()
        bridge._mounted = False
        bridge.rts_png_path = Path("test.rts.png")

        exporter = SnapshotExporter(boot_bridge=bridge)
        kernel, initrd = exporter._extract_original_boot_files()

        assert kernel is None
        assert initrd is None

    def test_extract_original_boot_files_no_mount_helper(self):
        """Verify (None, None) returned when no mount_helper."""
        bridge = MagicMock()
        bridge._mounted = True
        bridge._mount_helper = None
        bridge.rts_png_path = Path("test.rts.png")

        exporter = SnapshotExporter(boot_bridge=bridge)
        kernel, initrd = exporter._extract_original_boot_files()

        assert kernel is None
        assert initrd is None

    def test_extract_original_boot_files_missing_files(self, mock_boot_bridge):
        """Verify graceful handling when discover_boot_files returns None."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        # Mock discover_boot_files to return None
        mock_boot_bridge._mount_helper.discover_boot_files.return_value = (None, None)

        kernel, initrd = exporter._extract_original_boot_files()

        assert kernel is None
        assert initrd is None

    def test_extract_original_boot_files_discovery_exception(self, mock_boot_bridge):
        """Verify graceful handling when discover_boot_files raises."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge)

        # Mock discover_boot_files to raise exception
        mock_boot_bridge._mount_helper.discover_boot_files.side_effect = Exception("Discovery failed")

        kernel, initrd = exporter._extract_original_boot_files()

        assert kernel is None
        assert initrd is None


class TestKernelInitrdEncoding:
    """Tests for kernel/initrd preservation during encoding."""

    @pytest.fixture
    def mock_boot_bridge_with_files(self):
        """Create a mock BootBridge with kernel/initrd available."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("test.rts.png")
        bridge._mounted = True
        bridge._mount_helper = MagicMock()
        bridge._mount_helper.discover_boot_files.return_value = (
            "/tmp/mount/vmlinuz",
            "/tmp/mount/initrd"
        )
        return bridge

    def test_encode_with_kernel_and_initrd(self, mock_boot_bridge_with_files):
        """Verify offsets in metadata, sha256 hashes correct."""
        exporter = SnapshotExporter(boot_bridge=mock_boot_bridge_with_files)

        kernel_data = b'kernel binary data here'
        initrd_data = b'initrd cpio archive data here'
        qcow2_data = b'qcow2 disk image data'

        # Mock file reads
        def mock_read_func(path, *args, **kwargs):
            if 'vmlinuz' in str(path) or 'kernel' in str(path):
                return mock_open(read_data=kernel_data).return_value
            elif 'initrd' in str(path):
                return mock_open(read_data=initrd_data).return_value
            return mock_open(read_data=qcow2_data).return_value

        mock_encoder = MagicMock()
        mock_encoder.encode.return_value = b'PNG encoded data'

        import hashlib

        with tempfile.NamedTemporaryFile(delete=False, suffix='.qcow2') as tmp:
            tmp.write(qcow2_data)
            tmp_path = Path(tmp.name)

        try:
            with tempfile.NamedTemporaryFile(delete=False, suffix='.rts.png') as out_tmp:
                out_path = Path(out_tmp.name)

            with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSEncoder', return_value=mock_encoder):
                with patch('builtins.open', mock_open(read_data=b'')) as mock_file:
                    # Set up read side effect for kernel and initrd
                    file_handles = [
                        mock_open(read_data=qcow2_data).return_value,  # qcow2
                        mock_open(read_data=kernel_data).return_value,  # kernel
                        mock_open(read_data=initrd_data).return_value,  # initrd
                    ]
                    mock_file.return_value.__enter__.return_value.read.side_effect = [
                        qcow2_data, kernel_data, initrd_data
                    ]

                    result_size = exporter._encode_to_rts(
                        qcow2_path=tmp_path,
                        output_path=out_path,
                        snapshot_tag="test-snapshot"
                    )

                    # Verify encoder was called
                    mock_encoder.encode.assert_called_once()
                    args, kwargs = mock_encoder.encode.call_args
                    metadata = kwargs.get('metadata', {})

                    # Check metadata structure
                    assert metadata.get('type') == 'vm-snapshot'
                    assert metadata.get('has_kernel') is True
                    assert metadata.get('has_initrd') is True

                    # Check offsets exist
                    offsets = metadata.get('offsets', {})
                    assert 'kernel' in offsets
                    assert 'initrd' in offsets

                    # Check offset structure
                    assert 'offset' in offsets['kernel']
                    assert 'size' in offsets['kernel']
                    assert 'sha256' in offsets['kernel']
                    assert offsets['kernel']['size'] == len(kernel_data)
                    assert offsets['kernel']['sha256'] == hashlib.sha256(kernel_data).hexdigest()

        finally:
            tmp_path.unlink(missing_ok=True)
            out_path.unlink(missing_ok=True)

    def test_encode_kernel_only(self):
        """Verify encoding with kernel but no initrd."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("test.rts.png")
        bridge._mounted = True
        bridge._mount_helper = MagicMock()
        bridge._mount_helper.discover_boot_files.return_value = (
            "/tmp/mount/vmlinuz",
            None  # No initrd
        )

        exporter = SnapshotExporter(boot_bridge=bridge)

        kernel_data = b'kernel binary data'
        qcow2_data = b'qcow2 disk image'

        mock_encoder = MagicMock()
        mock_encoder.encode.return_value = b'PNG data'

        with tempfile.NamedTemporaryFile(delete=False, suffix='.qcow2') as tmp:
            tmp.write(qcow2_data)
            tmp_path = Path(tmp.name)

        try:
            with tempfile.NamedTemporaryFile(delete=False, suffix='.rts.png') as out_tmp:
                out_path = Path(out_tmp.name)

            with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSEncoder', return_value=mock_encoder):
                with patch('builtins.open', mock_open(read_data=b'')):
                    # Set up reads: qcow2 first, then kernel
                    mock_open_handle = mock_open(read_data=qcow2_data)
                    mock_open_handle.return_value.__enter__.return_value.read.side_effect = [
                        qcow2_data, kernel_data
                    ]

                    with patch('builtins.open', mock_open_handle):
                        exporter._encode_to_rts(
                            qcow2_path=tmp_path,
                            output_path=out_path,
                            snapshot_tag="test"
                        )

                    # Verify metadata
                    args, kwargs = mock_encoder.encode.call_args
                    metadata = kwargs.get('metadata', {})

                    assert metadata.get('has_kernel') is True
                    assert metadata.get('has_initrd') is False
                    assert 'kernel' in metadata.get('offsets', {})
                    assert 'initrd' not in metadata.get('offsets', {})

        finally:
            tmp_path.unlink(missing_ok=True)
            out_path.unlink(missing_ok=True)

    def test_encode_disk_only(self):
        """Verify encoding with neither kernel nor initrd (just qcow2)."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("test.rts.png")
        bridge._mounted = False  # No mount, no boot files

        exporter = SnapshotExporter(boot_bridge=bridge)

        qcow2_data = b'qcow2 disk image only'

        mock_encoder = MagicMock()
        mock_encoder.encode.return_value = b'PNG data'

        with tempfile.NamedTemporaryFile(delete=False, suffix='.qcow2') as tmp:
            tmp.write(qcow2_data)
            tmp_path = Path(tmp.name)

        try:
            with tempfile.NamedTemporaryFile(delete=False, suffix='.rts.png') as out_tmp:
                out_path = Path(out_tmp.name)

            with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSEncoder', return_value=mock_encoder):
                exporter._encode_to_rts(
                    qcow2_path=tmp_path,
                    output_path=out_path,
                    snapshot_tag="test"
                )

                # Verify metadata
                args, kwargs = mock_encoder.encode.call_args
                metadata = kwargs.get('metadata', {})

                assert metadata.get('has_kernel') is False
                assert metadata.get('has_initrd') is False
                assert metadata.get('offsets', {}) == {}

        finally:
            tmp_path.unlink(missing_ok=True)
            out_path.unlink(missing_ok=True)


class TestMetadataStructure:
    """Tests for metadata structure with kernel/initrd info."""

    def test_metadata_includes_offsets(self):
        """Verify offsets dict present with kernel/initrd."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("test.rts.png")
        bridge._mounted = True
        bridge._mount_helper = MagicMock()
        bridge._mount_helper.discover_boot_files.return_value = (
            "/tmp/mount/vmlinuz",
            "/tmp/mount/initrd"
        )

        exporter = SnapshotExporter(boot_bridge=bridge)

        kernel_data = b'kernel'
        initrd_data = b'initrd'
        qcow2_data = b'qcow2'

        mock_encoder = MagicMock()
        mock_encoder.encode.return_value = b'PNG'

        with tempfile.NamedTemporaryFile(delete=False, suffix='.qcow2') as tmp:
            tmp.write(qcow2_data)
            tmp_path = Path(tmp.name)

        try:
            with tempfile.NamedTemporaryFile(delete=False, suffix='.rts.png') as out_tmp:
                out_path = Path(out_tmp.name)

            with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSEncoder', return_value=mock_encoder):
                with patch('builtins.open', mock_open(read_data=qcow2_data)) as mock_file:
                    mock_file.return_value.__enter__.return_value.read.side_effect = [
                        qcow2_data, kernel_data, initrd_data
                    ]

                    exporter._encode_to_rts(
                        qcow2_path=tmp_path,
                        output_path=out_path,
                        snapshot_tag="test"
                    )

                    args, kwargs = mock_encoder.encode.call_args
                    metadata = kwargs.get('metadata', {})

                    assert 'offsets' in metadata
                    assert 'kernel' in metadata['offsets']
                    assert 'initrd' in metadata['offsets']

        finally:
            tmp_path.unlink(missing_ok=True)
            out_path.unlink(missing_ok=True)

    def test_metadata_has_kernel_initrd_flags(self):
        """Verify has_kernel and has_initrd boolean flags."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("test.rts.png")
        bridge._mounted = True
        bridge._mount_helper = MagicMock()
        bridge._mount_helper.discover_boot_files.return_value = (
            "/tmp/mount/vmlinuz",
            None  # Only kernel
        )

        exporter = SnapshotExporter(boot_bridge=bridge)

        kernel_data = b'kernel'
        qcow2_data = b'qcow2'

        mock_encoder = MagicMock()
        mock_encoder.encode.return_value = b'PNG'

        with tempfile.NamedTemporaryFile(delete=False, suffix='.qcow2') as tmp:
            tmp.write(qcow2_data)
            tmp_path = Path(tmp.name)

        try:
            with tempfile.NamedTemporaryFile(delete=False, suffix='.rts.png') as out_tmp:
                out_path = Path(out_tmp.name)

            with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSEncoder', return_value=mock_encoder):
                with patch('builtins.open', mock_open(read_data=qcow2_data)) as mock_file:
                    mock_file.return_value.__enter__.return_value.read.side_effect = [
                        qcow2_data, kernel_data
                    ]

                    exporter._encode_to_rts(
                        qcow2_path=tmp_path,
                        output_path=out_path,
                        snapshot_tag="test"
                    )

                    args, kwargs = mock_encoder.encode.call_args
                    metadata = kwargs.get('metadata', {})

                    assert 'has_kernel' in metadata
                    assert 'has_initrd' in metadata
                    assert metadata['has_kernel'] is True
                    assert metadata['has_initrd'] is False

        finally:
            tmp_path.unlink(missing_ok=True)
            out_path.unlink(missing_ok=True)


class TestProgressReporting:
    """Tests for progress reporting with boot file extraction."""

    def test_progress_reports_extraction(self):
        """Verify ExportStage.EXTRACTING_BOOT_FILES reported."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("test.rts.png")
        bridge._mounted = True
        bridge._mount_helper = MagicMock()
        bridge._mount_helper.discover_boot_files.return_value = (
            "/tmp/mount/vmlinuz",
            "/tmp/mount/initrd"
        )

        progress_stages = []

        def capture_progress(progress):
            progress_stages.append(progress.stage)

        exporter = SnapshotExporter(
            boot_bridge=bridge,
            progress_callback=capture_progress
        )

        kernel_data = b'kernel'
        initrd_data = b'initrd'
        qcow2_data = b'qcow2'

        mock_encoder = MagicMock()
        mock_encoder.encode.return_value = b'PNG'

        with tempfile.NamedTemporaryFile(delete=False, suffix='.qcow2') as tmp:
            tmp.write(qcow2_data)
            tmp_path = Path(tmp.name)

        try:
            with tempfile.NamedTemporaryFile(delete=False, suffix='.rts.png') as out_tmp:
                out_path = Path(out_tmp.name)

            with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSEncoder', return_value=mock_encoder):
                with patch('builtins.open', mock_open(read_data=qcow2_data)) as mock_file:
                    mock_file.return_value.__enter__.return_value.read.side_effect = [
                        qcow2_data, kernel_data, initrd_data
                    ]

                    exporter._encode_to_rts(
                        qcow2_path=tmp_path,
                        output_path=out_path,
                        snapshot_tag="test"
                    )

                    # Verify EXTRACTING_BOOT_FILES stage was reported
                    assert ExportStage.EXTRACTING_BOOT_FILES in progress_stages

        finally:
            tmp_path.unlink(missing_ok=True)
            out_path.unlink(missing_ok=True)


class TestBootFileEdgeCases:
    """Tests for edge cases in boot file handling."""

    def test_large_boot_files_skipped(self):
        """Verify kernel+initrd > 100MB combined is skipped with warning."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("test.rts.png")
        bridge._mounted = True
        bridge._mount_helper = MagicMock()
        bridge._mount_helper.discover_boot_files.return_value = (
            "/tmp/mount/vmlinuz",
            "/tmp/mount/initrd"
        )

        exporter = SnapshotExporter(boot_bridge=bridge)

        # Create combined boot files data > 100MB (the threshold)
        # kernel 60MB + initrd 50MB = 110MB total > 100MB threshold
        large_kernel_data = b'x' * (60 * 1024 * 1024)  # 60MB
        large_initrd_data = b'y' * (50 * 1024 * 1024)  # 50MB
        qcow2_data = b'qcow2'

        mock_encoder = MagicMock()
        mock_encoder.encode.return_value = b'PNG'

        with tempfile.NamedTemporaryFile(delete=False, suffix='.qcow2') as tmp:
            tmp.write(qcow2_data)
            tmp_path = Path(tmp.name)

        try:
            with tempfile.NamedTemporaryFile(delete=False, suffix='.rts.png') as out_tmp:
                out_path = Path(out_tmp.name)

            with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSEncoder', return_value=mock_encoder):
                with patch('builtins.open', mock_open(read_data=qcow2_data)) as mock_file:
                    mock_file.return_value.__enter__.return_value.read.side_effect = [
                        qcow2_data, large_kernel_data, large_initrd_data
                    ]

                    exporter._encode_to_rts(
                        qcow2_path=tmp_path,
                        output_path=out_path,
                        snapshot_tag="test"
                    )

                    # Verify metadata shows no kernel/initrd (skipped due to size)
                    args, kwargs = mock_encoder.encode.call_args
                    metadata = kwargs.get('metadata', {})

                    assert metadata.get('has_kernel') is False
                    assert metadata.get('has_initrd') is False
                    assert metadata.get('offsets', {}) == {}

        finally:
            tmp_path.unlink(missing_ok=True)
            out_path.unlink(missing_ok=True)

    def test_external_qemu_no_kernel(self):
        """Verify boot_bridge without mount skips extraction."""
        bridge = MagicMock()
        bridge.rts_png_path = Path("test.rts.png")
        # Simulate external QEMU - not mounted via BootBridge
        bridge._mounted = False

        exporter = SnapshotExporter(boot_bridge=bridge)

        # Verify extraction returns None, None
        kernel, initrd = exporter._extract_original_boot_files()

        assert kernel is None
        assert initrd is None

