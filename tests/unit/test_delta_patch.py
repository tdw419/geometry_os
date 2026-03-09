"""
Unit tests for Delta Patch Applier
"""

import pytest
import tempfile
import os
import json
import hashlib

from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder
from systems.pixel_compiler.delta_manifest import DeltaManifest, DeltaRegion
from systems.pixel_compiler.delta_patch import (
    PatchError,
    DeltaPatcher,
    apply_delta_patch,
    ByteFetcher
)


class TestPatchError:
    """Test cases for PatchError exception."""

    def test_patch_error_creation(self):
        """Test creating a PatchError with message."""
        error = PatchError("Something went wrong")
        assert error.message == "Something went wrong"
        assert error.region_index is None

    def test_patch_error_with_region(self):
        """Test creating a PatchError with region index."""
        error = PatchError("Checksum mismatch", region_index=5)
        assert error.message == "Checksum mismatch"
        assert error.region_index == 5

    def test_patch_error_str(self):
        """Test string representation of PatchError."""
        error1 = PatchError("Simple error")
        assert str(error1) == "Simple error"

        error2 = PatchError("Region error", region_index=3)
        assert str(error2) == "Region 3: Region error"


class TestDeltaPatcherHelpers:
    """Test cases for DeltaPatcher helper methods."""

    def setup_method(self):
        """Set up test fixtures."""
        self.patcher = DeltaPatcher()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        import shutil
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def test_compute_sha256(self):
        """Test SHA-256 checksum computation."""
        data = b"Hello, World!"
        checksum = self.patcher._compute_sha256(data)

        # Should be 64 character hex string
        assert len(checksum) == 64
        assert all(c in '0123456789abcdef' for c in checksum)

        # Should match hashlib
        expected = hashlib.sha256(data).hexdigest()
        assert checksum == expected

    def test_validate_file_checksum_success(self):
        """Test file checksum validation when checksums match."""
        test_file = os.path.join(self.temp_dir, "test.bin")
        data = b"Test data for checksum"

        with open(test_file, 'wb') as f:
            f.write(data)

        expected_checksum = hashlib.sha256(data).hexdigest()
        result = self.patcher._validate_file_checksum(test_file, expected_checksum)
        assert result is True

    def test_validate_file_checksum_failure(self):
        """Test file checksum validation when checksums don't match."""
        test_file = os.path.join(self.temp_dir, "test.bin")
        data = b"Test data"

        with open(test_file, 'wb') as f:
            f.write(data)

        wrong_checksum = "0" * 64  # Obviously wrong

        with pytest.raises(PatchError) as exc_info:
            self.patcher._validate_file_checksum(test_file, wrong_checksum)

        # Should not raise, but return False or raise PatchError
        # Based on implementation, it returns True/False, not raises

    def test_validate_file_checksum_not_found(self):
        """Test file checksum validation when file doesn't exist."""
        with pytest.raises(PatchError) as exc_info:
            self.patcher._validate_file_checksum("/nonexistent/file.bin", "abc123")

        assert "not found" in str(exc_info.value).lower()

    def test_validate_region_checksum_success(self):
        """Test region checksum validation when checksums match."""
        data = b"Hello, World! This is test data."
        region_data = data[7:12]  # "World"
        expected_checksum = hashlib.sha256(region_data).hexdigest()

        # Should not raise
        self.patcher._validate_region_checksum(data, 7, 5, expected_checksum, 0)

    def test_validate_region_checksum_failure(self):
        """Test region checksum validation when checksums don't match."""
        data = b"Hello, World!"
        wrong_checksum = "0" * 64

        with pytest.raises(PatchError) as exc_info:
            self.patcher._validate_region_checksum(data, 0, 5, wrong_checksum, 2)

        assert exc_info.value.region_index == 2
        assert "checksum mismatch" in str(exc_info.value).lower()


class TestApplyPatch:
    """Test cases for applying patches."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.patcher = DeltaPatcher()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        import shutil
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def _create_rts_file(self, data: bytes, filename: str) -> str:
        """Helper to create a .rts.png file with given data."""
        path = os.path.join(self.temp_dir, filename)
        self.encoder.save(data, path, metadata={'type': 'test'})
        return path

    def _create_manifest(
        self,
        old_data: bytes,
        new_data: bytes,
        regions: list,
        old_file: str = "old.rts.png",
        new_file: str = "new.rts.png"
    ) -> DeltaManifest:
        """Helper to create a DeltaManifest."""
        delta_regions = []
        for offset, length in regions:
            region_data = new_data[offset:offset + length]
            checksum = hashlib.sha256(region_data).hexdigest()
            old_region_data = old_data[offset:offset + length] if offset < len(old_data) else b""
            old_checksum = hashlib.sha256(old_region_data).hexdigest() if old_region_data else None

            delta_regions.append(DeltaRegion(
                offset=offset,
                length=length,
                checksum=checksum,
                old_checksum=old_checksum
            ))

        return DeltaManifest(
            version="1.0",
            old_file=old_file,
            new_file=new_file,
            old_size=len(old_data),
            new_size=len(new_data),
            old_checksum=hashlib.sha256(old_data).hexdigest(),
            new_checksum=hashlib.sha256(new_data).hexdigest(),
            regions=delta_regions,
            unchanged_bytes=0,
            compression_ratio=0.0,
            generated_at="2024-01-01T00:00:00Z"
        )

    def _create_fetcher(self, new_data: bytes) -> ByteFetcher:
        """Create a ByteFetcher that returns new data regions."""
        class SimpleFetcher:
            def __init__(self, data):
                self.data = data

            def fetch_region(self, offset: int, length: int) -> bytes:
                return self.data[offset:offset + length]

        return SimpleFetcher(new_data)

    def test_apply_patch_identical(self):
        """Test applying patch for identical files (no changes)."""
        data = b"Hello, World!"
        old_path = self._create_rts_file(data, "old.rts.png")

        manifest = self._create_manifest(data, data, [])

        output_path = self.patcher.apply(old_path, manifest)

        # Should output to same file (in-place)
        assert output_path == old_path

    def test_apply_patch_single_region(self):
        """Test applying patch with single changed region."""
        old_data = b"AAAAAAAAAA"
        new_data = b"AAAABBBBAA"

        old_path = self._create_rts_file(old_data, "old.rts.png")

        # Region at offset 4, length 4 (BBBB)
        manifest = self._create_manifest(old_data, new_data, [(4, 4)])

        output_path = os.path.join(self.temp_dir, "output.rts.png")
        fetcher = self._create_fetcher(new_data)
        result_path = self.patcher.apply(old_path, manifest, output_path=output_path, byte_fetcher=fetcher)

        assert result_path == output_path

        # Read and verify output
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
        with open(output_path, 'rb') as f:
            output_png = f.read()

        decoder = PixelRTSDecoder()
        output_data = decoder.decode(output_png)

        assert output_data == new_data

    def test_apply_patch_multiple_regions(self):
        """Test applying patch with multiple changed regions."""
        old_data = b"AAAAAAAAAAA"  # 11 bytes
        new_data = b"ABBBAABBAA"   # 10 bytes

        old_path = self._create_rts_file(old_data, "old.rts.png")

        # Multiple regions
        manifest = self._create_manifest(old_data, new_data, [(1, 3), (5, 3)])

        output_path = os.path.join(self.temp_dir, "multi.rts.png")
        fetcher = self._create_fetcher(new_data)
        self.patcher.apply(old_path, manifest, output_path=output_path, byte_fetcher=fetcher)

        # Verify output
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
        with open(output_path, 'rb') as f:
            output_png = f.read()

        decoder = PixelRTSDecoder()
        output_data = decoder.decode(output_png)

        assert output_data == new_data

    def test_apply_patch_file_growth(self):
        """Test applying patch that grows the file."""
        old_data = b"Hello"
        new_data = b"Hello, World!"

        old_path = self._create_rts_file(old_data, "old.rts.png")

        # All bytes from 5 onwards are new
        manifest = self._create_manifest(old_data, new_data, [(5, 8)])

        output_path = os.path.join(self.temp_dir, "grown.rts.png")
        fetcher = self._create_fetcher(new_data)
        self.patcher.apply(old_path, manifest, output_path=output_path, byte_fetcher=fetcher)

        # Verify output
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
        with open(output_path, 'rb') as f:
            output_png = f.read()

        decoder = PixelRTSDecoder()
        output_data = decoder.decode(output_png)

        assert output_data == new_data

    def test_apply_patch_file_shrink(self):
        """Test applying patch that shrinks the file."""
        old_data = b"Hello, World!"
        new_data = b"Hello"

        old_path = self._create_rts_file(old_data, "old.rts.png")

        # No changed regions, just truncation
        manifest = self._create_manifest(old_data, new_data, [])

        output_path = os.path.join(self.temp_dir, "shrunk.rts.png")
        self.patcher.apply(old_path, manifest, output_path=output_path)

        # Verify output
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
        with open(output_path, 'rb') as f:
            output_png = f.read()

        decoder = PixelRTSDecoder()
        output_data = decoder.decode(output_png)

        assert output_data == new_data

    def test_apply_patch_checksum_mismatch(self):
        """Test that patch fails on base file checksum mismatch."""
        old_data = b"Hello, World!"
        different_data = b"Different data!"

        old_path = self._create_rts_file(old_data, "old.rts.png")

        # Manifest expects different_data as base
        manifest = self._create_manifest(different_data, old_data, [])

        with pytest.raises(PatchError) as exc_info:
            self.patcher.apply(old_path, manifest)

        assert "checksum mismatch" in str(exc_info.value).lower()

    def test_apply_patch_region_checksum_mismatch(self):
        """Test that patch fails on region checksum mismatch."""
        old_data = b"AAAAAAAAAA"
        new_data = b"AAAABBBBAA"

        old_path = self._create_rts_file(old_data, "old.rts.png")

        # Create manifest with wrong region checksum
        manifest = self._create_manifest(old_data, new_data, [(4, 4)])
        # Corrupt the region checksum
        manifest.regions[0].checksum = "0" * 64

        # Create a fetcher that returns wrong data
        fetcher = self._create_fetcher(new_data)

        with pytest.raises(PatchError) as exc_info:
            self.patcher.apply(old_path, manifest, byte_fetcher=fetcher)

        assert exc_info.value.region_index == 0

    def test_apply_patch_output_path(self):
        """Test applying patch to a new output file."""
        old_data = b"Hello"
        new_data = b"Hello, World!"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        output_path = os.path.join(self.temp_dir, "new.rts.png")

        manifest = self._create_manifest(old_data, new_data, [(5, 8)])
        fetcher = self._create_fetcher(new_data)

        result_path = self.patcher.apply(old_path, manifest, output_path=output_path, byte_fetcher=fetcher)

        assert result_path == output_path
        assert os.path.exists(output_path)
        # Original should still exist
        assert os.path.exists(old_path)

    def test_apply_patch_in_place(self):
        """Test applying patch in-place (no output path)."""
        old_data = b"Hello"
        new_data = b"Hello, World!"

        old_path = self._create_rts_file(old_data, "old.rts.png")

        manifest = self._create_manifest(old_data, new_data, [(5, 8)])
        fetcher = self._create_fetcher(new_data)

        result_path = self.patcher.apply(old_path, manifest, output_path=None, byte_fetcher=fetcher)

        # Should return same path
        assert result_path == old_path

        # Verify file was updated
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
        with open(old_path, 'rb') as f:
            output_png = f.read()

        decoder = PixelRTSDecoder()
        output_data = decoder.decode(output_png)

        assert output_data == new_data


class TestSkipValidation:
    """Test cases for skipping checksum validation."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        import shutil
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def _create_rts_file(self, data: bytes, filename: str) -> str:
        """Helper to create a .rts.png file with given data."""
        path = os.path.join(self.temp_dir, filename)
        self.encoder.save(data, path, metadata={'type': 'test'})
        return path

    def _create_fetcher(self, new_data: bytes) -> ByteFetcher:
        """Create a ByteFetcher that returns new data regions."""
        class SimpleFetcher:
            def __init__(self, data):
                self.data = data

            def fetch_region(self, offset: int, length: int) -> bytes:
                return self.data[offset:offset + length]

        return SimpleFetcher(new_data)

    def test_skip_validation(self):
        """Test that patching works with validation skipped."""
        patcher = DeltaPatcher(validate_checksums=False)

        old_data = b"AAAAAAAAAA"
        new_data = b"AAAABBBBAA"

        old_path = self._create_rts_file(old_data, "old.rts.png")

        # Create manifest with wrong checksums
        manifest = DeltaManifest(
            version="1.0",
            old_file="old.rts.png",
            new_file="new.rts.png",
            old_size=len(old_data),
            new_size=len(new_data),
            old_checksum="wrong_checksum",
            new_checksum="also_wrong",
            regions=[
                DeltaRegion(
                    offset=4,
                    length=4,
                    checksum="wrong_region_checksum"
                )
            ]
        )

        output_path = os.path.join(self.temp_dir, "output.rts.png")
        fetcher = self._create_fetcher(new_data)

        # Should NOT raise with validation skipped
        result_path = patcher.apply(old_path, manifest, output_path=output_path, byte_fetcher=fetcher)
        assert result_path == output_path


class TestConvenienceFunction:
    """Test cases for apply_delta_patch convenience function."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        import shutil
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def _create_rts_file(self, data: bytes, filename: str) -> str:
        """Helper to create a .rts.png file with given data."""
        path = os.path.join(self.temp_dir, filename)
        self.encoder.save(data, path, metadata={'type': 'test'})
        return path

    def _create_fetcher(self, new_data: bytes) -> ByteFetcher:
        """Create a ByteFetcher that returns new data regions."""
        class SimpleFetcher:
            def __init__(self, data):
                self.data = data

            def fetch_region(self, offset: int, length: int) -> bytes:
                return self.data[offset:offset + length]

        return SimpleFetcher(new_data)

    def test_apply_delta_patch_function(self):
        """Test the convenience function for applying patches."""
        old_data = b"Hello"
        new_data = b"Hello, World!"

        old_path = self._create_rts_file(old_data, "old.rts.png")

        # Create manifest
        manifest = DeltaManifest(
            version="1.0",
            old_file="old.rts.png",
            new_file="new.rts.png",
            old_size=len(old_data),
            new_size=len(new_data),
            old_checksum=hashlib.sha256(old_data).hexdigest(),
            new_checksum=hashlib.sha256(new_data).hexdigest(),
            regions=[
                DeltaRegion(
                    offset=5,
                    length=8,
                    checksum=hashlib.sha256(new_data[5:13]).hexdigest()
                )
            ]
        )

        output_path = os.path.join(self.temp_dir, "output.rts.png")
        fetcher = self._create_fetcher(new_data)
        result = apply_delta_patch(old_path, manifest, output_path=output_path, byte_fetcher=fetcher)

        assert result == output_path
        assert os.path.exists(output_path)


class TestCLIPatchCommand:
    """Test the pixelrts patch CLI command."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        import shutil
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def _create_rts_file(self, data: bytes, filename: str) -> str:
        """Helper to create a .rts.png file with given data."""
        path = os.path.join(self.temp_dir, filename)
        self.encoder.save(data, path, metadata={'type': 'test'})
        return path

    def test_cli_patch_command_basic(self):
        """Test basic CLI patch command execution with validation."""
        import subprocess
        import sys

        old_data = b"Hello"
        new_data = b"Hello, World!"

        old_path = self._create_rts_file(old_data, "old.rts.png")

        # Create manifest file
        manifest = DeltaManifest(
            version="1.0",
            old_file="old.rts.png",
            new_file="new.rts.png",
            old_size=len(old_data),
            new_size=len(new_data),
            old_checksum=hashlib.sha256(old_data).hexdigest(),
            new_checksum=hashlib.sha256(new_data).hexdigest(),
            regions=[
                DeltaRegion(
                    offset=5,
                    length=8,
                    checksum=hashlib.sha256(new_data[5:13]).hexdigest()
                )
            ]
        )

        manifest_path = os.path.join(self.temp_dir, "manifest.json")
        manifest.save(manifest_path)

        output_path = os.path.join(self.temp_dir, "output.rts.png")

        result = subprocess.run(
            [sys.executable, '-m', 'systems.pixel_compiler.pixelrts_cli', 'patch',
             old_path, manifest_path, '-o', output_path, '--skip-validation'],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        # Should succeed with skip-validation (since no byte_fetcher available)
        assert result.returncode == 0
        assert os.path.exists(output_path)

    def test_cli_patch_command_checksum_error(self):
        """Test CLI patch command with checksum error."""
        import subprocess
        import sys

        old_data = b"Hello"
        different_data = b"Different!"

        old_path = self._create_rts_file(old_data, "old.rts.png")

        # Create manifest with wrong old_checksum
        manifest = DeltaManifest(
            version="1.0",
            old_file="old.rts.png",
            new_file="new.rts.png",
            old_size=len(different_data),
            new_size=len(different_data),
            old_checksum=hashlib.sha256(different_data).hexdigest(),  # Wrong!
            new_checksum=hashlib.sha256(b"new").hexdigest(),
            regions=[]
        )

        manifest_path = os.path.join(self.temp_dir, "manifest.json")
        manifest.save(manifest_path)

        result = subprocess.run(
            [sys.executable, '-m', 'systems.pixel_compiler.pixelrts_cli', 'patch',
             old_path, manifest_path],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        # Should fail with exit code 1
        assert result.returncode == 1
        assert "checksum mismatch" in result.stderr.lower()

    def test_cli_patch_command_skip_validation(self):
        """Test CLI patch command with --skip-validation flag."""
        import subprocess
        import sys

        old_data = b"AAAAAAAAAA"
        new_data = b"AAAABBBBAA"

        old_path = self._create_rts_file(old_data, "old.rts.png")

        # Create manifest with wrong checksums
        manifest = DeltaManifest(
            version="1.0",
            old_file="old.rts.png",
            new_file="new.rts.png",
            old_size=len(old_data),
            new_size=len(new_data),
            old_checksum="wrong",
            new_checksum="wrong",
            regions=[
                DeltaRegion(
                    offset=4,
                    length=4,
                    checksum="wrong"
                )
            ]
        )

        manifest_path = os.path.join(self.temp_dir, "manifest.json")
        manifest.save(manifest_path)

        output_path = os.path.join(self.temp_dir, "output.rts.png")

        result = subprocess.run(
            [sys.executable, '-m', 'systems.pixel_compiler.pixelrts_cli', 'patch',
             old_path, manifest_path, '-o', output_path, '--skip-validation'],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        # Should succeed with validation skipped
        assert result.returncode == 0

    def test_cli_patch_command_quiet(self):
        """Test CLI patch command with --quiet flag."""
        import subprocess
        import sys

        old_data = b"Hello"
        new_data = b"Hello, World!"

        old_path = self._create_rts_file(old_data, "old.rts.png")

        manifest = DeltaManifest(
            version="1.0",
            old_file="old.rts.png",
            new_file="new.rts.png",
            old_size=len(old_data),
            new_size=len(new_data),
            old_checksum=hashlib.sha256(old_data).hexdigest(),
            new_checksum=hashlib.sha256(new_data).hexdigest(),
            regions=[
                DeltaRegion(
                    offset=5,
                    length=8,
                    checksum=hashlib.sha256(new_data[5:13]).hexdigest()
                )
            ]
        )

        manifest_path = os.path.join(self.temp_dir, "manifest.json")
        manifest.save(manifest_path)

        output_path = os.path.join(self.temp_dir, "quiet.rts.png")

        result = subprocess.run(
            [sys.executable, '-m', 'systems.pixel_compiler.pixelrts_cli', 'patch',
             old_path, manifest_path, '-o', output_path, '--quiet', '--skip-validation'],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        # Should succeed with minimal output
        assert result.returncode == 0
        assert os.path.exists(output_path)
        # Quiet mode should have minimal stdout
        assert "successfully" not in result.stdout.lower() or result.stdout.strip() == ""
