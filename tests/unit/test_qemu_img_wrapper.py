"""Unit tests for QemuImgWrapper."""
from pathlib import Path
from unittest.mock import MagicMock, patch

import pytest

from systems.pixel_compiler.boot.qemu_img_wrapper import (
    QemuImgError,
    QemuImgWrapper,
    SnapshotExtractResult,
)


class TestQemuImgWrapper:
    """Tests for QemuImgWrapper class."""

    def test_is_available_when_in_path(self):
        """Test is_available returns True when qemu-img is in PATH."""
        with patch('shutil.which', return_value='/usr/bin/qemu-img'):
            wrapper = QemuImgWrapper()
            assert wrapper.is_available() is True

    def test_is_available_when_not_in_path(self):
        """Test is_available returns False when qemu-img is not in PATH."""
        with patch('shutil.which', return_value=None):
            wrapper = QemuImgWrapper()
            assert wrapper.is_available() is False

    def test_extract_snapshot_success(self, tmp_path):
        """Test successful snapshot extraction."""
        wrapper = QemuImgWrapper()

        # Mock is_available
        with patch.object(wrapper, 'is_available', return_value=True):
            # Mock subprocess.run
            mock_result = MagicMock()
            mock_result.returncode = 0
            mock_result.stderr = ""

            # Create a mock source file
            source = tmp_path / "source.qcow2"
            source.write_bytes(b"mock qcow2 data")
            output = tmp_path / "output.qcow2"

            with patch('subprocess.run', return_value=mock_result):
                # Create mock output file
                output.write_bytes(b"extracted data")

                result = wrapper.extract_snapshot(source, "test-snap", output)

                assert result.success is True
                assert result.snapshot_tag == "test-snap"
                assert result.output_path == output
                assert result.size_bytes > 0

    def test_extract_snapshot_qemu_img_not_available(self, tmp_path):
        """Test extraction fails when qemu-img is not available."""
        wrapper = QemuImgWrapper()

        with patch.object(wrapper, 'is_available', return_value=False):
            source = tmp_path / "source.qcow2"
            source.write_bytes(b"data")
            output = tmp_path / "output.qcow2"

            with pytest.raises(QemuImgError, match="qemu-img is not available"):
                wrapper.extract_snapshot(source, "test-snap", output)

    def test_extract_snapshot_source_not_found(self, tmp_path):
        """Test extraction fails when source file doesn't exist."""
        wrapper = QemuImgWrapper()

        with patch.object(wrapper, 'is_available', return_value=True):
            source = tmp_path / "nonexistent.qcow2"
            output = tmp_path / "output.qcow2"

            with pytest.raises(QemuImgError, match="Source qcow2 file not found"):
                wrapper.extract_snapshot(source, "test-snap", output)

    def test_extract_snapshot_subprocess_failure(self, tmp_path):
        """Test extraction handles subprocess failure."""
        wrapper = QemuImgWrapper()

        with patch.object(wrapper, 'is_available', return_value=True):
            mock_result = MagicMock()
            mock_result.returncode = 1
            mock_result.stderr = "qemu-img error: snapshot not found"

            source = tmp_path / "source.qcow2"
            source.write_bytes(b"data")
            output = tmp_path / "output.qcow2"

            with patch('subprocess.run', return_value=mock_result):
                result = wrapper.extract_snapshot(source, "test-snap", output)

                assert result.success is False
                assert "qemu-img error" in result.error_message

    def test_list_snapshots_success(self, tmp_path):
        """Test listing snapshots from qcow2 file."""
        wrapper = QemuImgWrapper()

        with patch.object(wrapper, 'is_available', return_value=True):
            mock_result = MagicMock()
            mock_result.returncode = 0
            mock_result.stdout = """ID  TAG               VM SIZE                DATE     VM CLOCK
--  ---               -------                ----     --------
1   snap-1            1.5 GB      2024-01-15 10:00:00   00:05:00.000
2   snap-2            1.6 GB      2024-01-15 11:00:00   00:10:00.000
"""

            qcow2 = tmp_path / "vm.qcow2"
            qcow2.write_bytes(b"data")

            with patch('subprocess.run', return_value=mock_result):
                snapshots = wrapper.list_snapshots(qcow2)

                assert len(snapshots) == 2
                assert "snap-1" in snapshots
                assert "snap-2" in snapshots

    def test_get_version(self):
        """Test getting qemu-img version."""
        wrapper = QemuImgWrapper()

        mock_result = MagicMock()
        mock_result.returncode = 0
        mock_result.stdout = "qemu-img version 8.2.2\nCopyright (c) 2003-2023"

        with patch('subprocess.run', return_value=mock_result):
            with patch.object(wrapper, 'is_available', return_value=True):
                version = wrapper.get_version()
                assert "qemu-img version" in version

    def test_get_version_not_available(self):
        """Test get_version returns None when qemu-img not available."""
        wrapper = QemuImgWrapper()

        with patch.object(wrapper, 'is_available', return_value=False):
            version = wrapper.get_version()
            assert version is None

    def test_list_snapshots_qemu_img_not_available(self, tmp_path):
        """Test list_snapshots raises error when qemu-img not available."""
        wrapper = QemuImgWrapper()

        with patch.object(wrapper, 'is_available', return_value=False):
            qcow2 = tmp_path / "vm.qcow2"
            qcow2.write_bytes(b"data")

            with pytest.raises(QemuImgError, match="qemu-img is not available"):
                wrapper.list_snapshots(qcow2)

    def test_list_snapshots_file_not_found(self, tmp_path):
        """Test list_snapshots raises error when file not found."""
        wrapper = QemuImgWrapper()

        with patch.object(wrapper, 'is_available', return_value=True):
            qcow2 = tmp_path / "nonexistent.qcow2"

            with pytest.raises(QemuImgError, match="qcow2 file not found"):
                wrapper.list_snapshots(qcow2)

    def test_list_snapshots_empty_output(self, tmp_path):
        """Test list_snapshots handles empty output."""
        wrapper = QemuImgWrapper()

        with patch.object(wrapper, 'is_available', return_value=True):
            mock_result = MagicMock()
            mock_result.returncode = 0
            mock_result.stdout = """ID  TAG               VM SIZE                DATE     VM CLOCK
--  ---               -------                ----     --------
"""

            qcow2 = tmp_path / "vm.qcow2"
            qcow2.write_bytes(b"data")

            with patch('subprocess.run', return_value=mock_result):
                snapshots = wrapper.list_snapshots(qcow2)
                assert len(snapshots) == 0

    def test_extract_snapshot_creates_output_directory(self, tmp_path):
        """Test extraction creates output directory if it doesn't exist."""
        wrapper = QemuImgWrapper()

        with patch.object(wrapper, 'is_available', return_value=True):
            mock_result = MagicMock()
            mock_result.returncode = 0
            mock_result.stderr = ""

            source = tmp_path / "source.qcow2"
            source.write_bytes(b"data")
            output = tmp_path / "subdir" / "output.qcow2"

            with patch('subprocess.run', return_value=mock_result):
                # Create the output file after extraction
                def create_output(*args, **kwargs):
                    output.parent.mkdir(parents=True, exist_ok=True)
                    output.write_bytes(b"extracted")
                    return mock_result

                with patch('subprocess.run', side_effect=create_output):
                    result = wrapper.extract_snapshot(source, "test-snap", output)

                    assert result.success is True
                    assert output.parent.exists()

    def test_extract_snapshot_timeout(self, tmp_path):
        """Test extraction handles timeout."""
        wrapper = QemuImgWrapper()

        with patch.object(wrapper, 'is_available', return_value=True):
            source = tmp_path / "source.qcow2"
            source.write_bytes(b"data")
            output = tmp_path / "output.qcow2"

            with patch('subprocess.run', side_effect=TimeoutError("Timeout")):
                result = wrapper.extract_snapshot(source, "test-snap", output, timeout=1)

                assert result.success is False
                assert "Error extracting snapshot" in result.error_message

    def test_extract_snapshot_with_absolute_path(self, tmp_path):
        """Test extraction works with absolute path to qemu-img."""
        wrapper = QemuImgWrapper(qemu_img_path="/usr/bin/qemu-img")

        with patch('shutil.which', return_value=None):
            # Patch Path methods to simulate absolute path exists
            with patch.object(Path, 'is_absolute', return_value=True):
                with patch.object(Path, 'exists', return_value=True):
                    with patch.object(Path, 'is_file', return_value=True):
                        assert wrapper.is_available() is True


class TestSnapshotExtractResult:
    """Tests for SnapshotExtractResult dataclass."""

    def test_to_dict(self, tmp_path):
        """Test to_dict serialization."""
        result = SnapshotExtractResult(
            success=True,
            snapshot_tag="test-snap",
            source_path=tmp_path / "source.qcow2",
            output_path=tmp_path / "output.qcow2",
            size_bytes=1024,
            error_message=None
        )

        d = result.to_dict()
        assert d["success"] is True
        assert d["snapshot_tag"] == "test-snap"
        assert d["size_bytes"] == 1024
        assert d["error_message"] is None

    def test_to_dict_with_error(self, tmp_path):
        """Test to_dict with error message."""
        result = SnapshotExtractResult(
            success=False,
            snapshot_tag="test-snap",
            source_path=tmp_path / "source.qcow2",
            output_path=tmp_path / "output.qcow2",
            size_bytes=0,
            error_message="Extraction failed"
        )

        d = result.to_dict()
        assert d["success"] is False
        assert d["error_message"] == "Extraction failed"
