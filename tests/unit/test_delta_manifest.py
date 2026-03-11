"""
Unit tests for Delta Manifest Generator
"""

import json
import os
import tempfile

import numpy as np
import pytest

from systems.pixel_compiler.delta_manifest import (
    DeltaManifest,
    DeltaRegion,
    _find_contiguous_regions,
    _sha256_region,
    generate_delta_manifest,
)
from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder


class TestDeltaRegion:
    """Test cases for DeltaRegion dataclass."""

    def test_delta_region_creation(self):
        """Test creating a DeltaRegion with all fields."""
        region = DeltaRegion(
            offset=100,
            length=50,
            checksum="abc123",
            old_checksum="def456",
            compression="zlib",
            source_offset=200
        )

        assert region.offset == 100
        assert region.length == 50
        assert region.checksum == "abc123"
        assert region.old_checksum == "def456"
        assert region.compression == "zlib"
        assert region.source_offset == 200

    def test_delta_region_defaults(self):
        """Test DeltaRegion default values."""
        region = DeltaRegion(
            offset=0,
            length=10,
            checksum="test"
        )

        assert region.compression == "none"
        assert region.old_checksum is None
        assert region.source_offset is None

    def test_delta_region_to_dict(self):
        """Test DeltaRegion serialization to dict."""
        region = DeltaRegion(
            offset=100,
            length=50,
            checksum="abc123",
            old_checksum="def456"
        )

        result = region.to_dict()

        assert result['offset'] == 100
        assert result['length'] == 50
        assert result['checksum'] == "abc123"
        assert result['old_checksum'] == "def456"
        assert result['compression'] == "none"

    def test_delta_region_from_dict(self):
        """Test DeltaRegion deserialization from dict."""
        data = {
            'offset': 200,
            'length': 100,
            'checksum': 'xyz789',
            'old_checksum': 'uvw123',
            'compression': 'lz4',
            'source_offset': 300
        }

        region = DeltaRegion.from_dict(data)

        assert region.offset == 200
        assert region.length == 100
        assert region.checksum == "xyz789"
        assert region.old_checksum == "uvw123"
        assert region.compression == "lz4"
        assert region.source_offset == 300


class TestDeltaManifest:
    """Test cases for DeltaManifest dataclass."""

    def test_delta_manifest_creation(self):
        """Test creating a DeltaManifest with regions."""
        regions = [
            DeltaRegion(offset=0, length=10, checksum="abc"),
            DeltaRegion(offset=100, length=20, checksum="def")
        ]

        manifest = DeltaManifest(
            version="1.0",
            old_file="old.rts.png",
            new_file="new.rts.png",
            old_size=1000,
            new_size=1100,
            old_checksum="oldhash",
            new_checksum="newhash",
            regions=regions,
            unchanged_bytes=970,
            compression_ratio=3.0,
            generated_at="2024-01-01T00:00:00Z"
        )

        assert manifest.version == "1.0"
        assert manifest.old_file == "old.rts.png"
        assert manifest.new_file == "new.rts.png"
        assert len(manifest.regions) == 2
        assert manifest.regions[0].offset == 0
        assert manifest.regions[1].offset == 100

    def test_delta_manifest_to_json(self):
        """Test DeltaManifest JSON serialization produces valid structure."""
        manifest = DeltaManifest(
            old_file="old.rts.png",
            new_file="new.rts.png",
            old_checksum="oldhash",
            new_checksum="newhash",
            regions=[
                DeltaRegion(offset=0, length=10, checksum="abc")
            ]
        )

        json_str = manifest.to_json()

        # Should be valid JSON
        parsed = json.loads(json_str)
        assert parsed['old_file'] == "old.rts.png"
        assert parsed['new_file'] == "new.rts.png"
        assert len(parsed['regions']) == 1

    def test_delta_manifest_from_json(self):
        """Test DeltaManifest round-trip through JSON."""
        original = DeltaManifest(
            old_file="original.rts.png",
            new_file="updated.rts.png",
            old_size=500,
            new_size=600,
            old_checksum="abc123",
            new_checksum="def456",
            regions=[
                DeltaRegion(offset=0, length=50, checksum="region1"),
                DeltaRegion(offset=100, length=30, checksum="region2")
            ],
            unchanged_bytes=520,
            compression_ratio=13.33
        )

        json_str = original.to_json()
        restored = DeltaManifest.from_json(json_str)

        assert restored.old_file == original.old_file
        assert restored.new_file == original.new_file
        assert restored.old_size == original.old_size
        assert restored.new_size == original.new_size
        assert len(restored.regions) == len(original.regions)
        assert restored.regions[0].offset == original.regions[0].offset

    def test_delta_manifest_save_load(self):
        """Test DeltaManifest file round-trip."""
        manifest = DeltaManifest(
            old_file="a.rts.png",
            new_file="b.rts.png",
            old_checksum="hash1",
            new_checksum="hash2",
            regions=[
                DeltaRegion(offset=50, length=25, checksum="regionhash")
            ]
        )

        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            temp_path = f.name

        try:
            manifest.save(temp_path)
            loaded = DeltaManifest.load(temp_path)

            assert loaded.old_file == "a.rts.png"
            assert loaded.new_file == "b.rts.png"
            assert len(loaded.regions) == 1
            assert loaded.regions[0].offset == 50
        finally:
            os.unlink(temp_path)

    def test_delta_manifest_from_json_invalid(self):
        """Test from_json raises ValueError for invalid JSON."""
        with pytest.raises(ValueError):
            DeltaManifest.from_json("not valid json")

    def test_delta_manifest_from_json_missing_fields(self):
        """Test from_json raises ValueError for missing required fields."""
        incomplete = json.dumps({"version": "1.0"})

        with pytest.raises(ValueError) as exc_info:
            DeltaManifest.from_json(incomplete)

        assert "Missing required fields" in str(exc_info.value)


class TestHelperFunctions:
    """Test cases for helper functions."""

    def test_sha256_region(self):
        """Test SHA-256 checksum computation for a byte region."""
        data = b"Hello, World! This is test data."
        checksum = _sha256_region(data, 0, len(data))

        # Should be 64 character hex string
        assert len(checksum) == 64
        assert all(c in '0123456789abcdef' for c in checksum)

    def test_sha256_region_partial(self):
        """Test SHA-256 checksum for partial region."""
        data = b"0123456789"
        checksum = _sha256_region(data, 2, 5)

        # Should hash bytes 2-6: "23456"
        expected_data = b"23456"
        import hashlib
        expected = hashlib.sha256(expected_data).hexdigest()

        assert checksum == expected

    def test_find_contiguous_regions_empty(self):
        """Test _find_contiguous_regions with no changes."""
        mask = np.zeros(100, dtype=bool)
        regions = _find_contiguous_regions(mask)

        assert regions == []

    def test_find_contiguous_regions_single(self):
        """Test _find_contiguous_regions with single contiguous region."""
        mask = np.zeros(100, dtype=bool)
        mask[20:30] = True

        regions = _find_contiguous_regions(mask)

        assert len(regions) == 1
        assert regions[0] == (20, 10)

    def test_find_contiguous_regions_multiple(self):
        """Test _find_contiguous_regions with multiple regions."""
        mask = np.zeros(100, dtype=bool)
        mask[10:20] = True
        mask[50:60] = True
        mask[80:90] = True

        regions = _find_contiguous_regions(mask, min_size=10)

        assert len(regions) == 3
        assert (10, 10) in regions
        assert (50, 10) in regions
        assert (80, 10) in regions

    def test_find_contiguous_regions_merge_small_gaps(self):
        """Test that small gaps are merged."""
        mask = np.zeros(100, dtype=bool)
        mask[10:15] = True
        # Gap of 5 bytes (< min_size=64)
        mask[20:25] = True

        regions = _find_contiguous_regions(mask, min_size=64)

        # Should merge into single region
        assert len(regions) == 1
        assert regions[0] == (10, 15)


class TestGenerateDeltaManifest:
    """Test cases for generate_delta_manifest function."""

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

    def test_generate_delta_manifest_identical(self):
        """Test manifest generation for identical files."""
        data = b"Hello, World! This is test data for delta."
        old_path = self._create_rts_file(data, "old.rts.png")
        new_path = self._create_rts_file(data, "new.rts.png")

        manifest = generate_delta_manifest(old_path, new_path)

        assert manifest.old_file == old_path
        assert manifest.new_file == new_path
        assert manifest.old_size == len(data)
        assert manifest.new_size == len(data)
        assert manifest.old_checksum == manifest.new_checksum
        assert len(manifest.regions) == 0
        assert manifest.compression_ratio == 0.0

    def test_generate_delta_manifest_empty(self):
        """Test manifest generation with empty files."""
        empty_path = self._create_rts_file(b"", "empty.rts.png")
        data_path = self._create_rts_file(b"Some data", "data.rts.png")

        manifest = generate_delta_manifest(empty_path, data_path)

        assert manifest.old_size == 0
        assert manifest.new_size > 0
        assert len(manifest.regions) > 0  # All bytes are "added"

    def test_generate_delta_manifest_appended(self):
        """Test manifest generation when bytes are appended."""
        old_data = b"Hello"
        new_data = b"Hello, World!"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        manifest = generate_delta_manifest(old_path, new_path)

        assert manifest.old_size == len(old_data)
        assert manifest.new_size == len(new_data)
        assert manifest.compression_ratio > 0

    def test_generate_delta_manifest_modified(self):
        """Test manifest generation when bytes are modified in middle."""
        old_data = b"AAAAAAAAAA"  # 10 bytes
        new_data = b"AAAABBBBAA"  # Middle 4 bytes changed

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        manifest = generate_delta_manifest(old_path, new_path)

        assert manifest.old_size == len(old_data)
        assert manifest.new_size == len(new_data)
        assert manifest.compression_ratio > 0
        # Should have at least one changed region
        assert len(manifest.regions) >= 1

    def test_checksums_correct(self):
        """Test that checksums are computed correctly."""
        import hashlib

        data = b"Test data for checksum verification"
        old_path = self._create_rts_file(data, "old.rts.png")
        new_path = self._create_rts_file(data, "new.rts.png")

        manifest = generate_delta_manifest(old_path, new_path)

        # Verify overall checksum
        expected_hash = hashlib.sha256(data).hexdigest()
        assert manifest.old_checksum == expected_hash
        assert manifest.new_checksum == expected_hash

    def test_compression_ratio_calculation(self):
        """Test compression ratio is calculated correctly."""
        # Create files where 50% of bytes change
        old_data = b"AAAA"
        new_data = b"AABB"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        manifest = generate_delta_manifest(old_path, new_path)

        # Should be approximately 50% (2 out of 4 bytes changed)
        assert manifest.compression_ratio > 0
        assert manifest.compression_ratio <= 100

    def test_file_not_found_old(self):
        """Test FileNotFoundError for missing old file."""
        new_path = self._create_rts_file(b"data", "new.rts.png")

        with pytest.raises(FileNotFoundError):
            generate_delta_manifest("/nonexistent/old.rts.png", new_path)

    def test_file_not_found_new(self):
        """Test FileNotFoundError for missing new file."""
        old_path = self._create_rts_file(b"data", "old.rts.png")

        with pytest.raises(FileNotFoundError):
            generate_delta_manifest(old_path, "/nonexistent/new.rts.png")

    def test_generated_at_timestamp(self):
        """Test that generated_at contains valid ISO timestamp."""
        data = b"Test"
        old_path = self._create_rts_file(data, "old.rts.png")
        new_path = self._create_rts_file(data, "new.rts.png")

        manifest = generate_delta_manifest(old_path, new_path)

        # Should have timestamp
        assert manifest.generated_at
        # Should be parseable as ISO format
        from datetime import datetime
        datetime.fromisoformat(manifest.generated_at.replace('Z', '+00:00'))


class TestCLIDeltaCommand:
    """Test the pixelrts delta CLI command."""

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

    def test_cli_delta_command_basic(self):
        """Test basic CLI delta command execution."""
        import subprocess
        import sys

        old_path = self._create_rts_file(b"Old data", "old.rts.png")
        new_path = self._create_rts_file(b"New data", "new.rts.png")

        result = subprocess.run(
            [sys.executable, '-m', 'systems.pixel_compiler.pixelrts_cli', 'delta', old_path, new_path],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        # Should output valid JSON
        output = json.loads(result.stdout)
        assert 'old_file' in output
        assert 'new_file' in output
        assert 'regions' in output

    def test_cli_delta_command_output_file(self):
        """Test CLI delta command with output file."""
        import subprocess
        import sys

        old_path = self._create_rts_file(b"Old", "old.rts.png")
        new_path = self._create_rts_file(b"New", "new.rts.png")
        output_path = os.path.join(self.temp_dir, "manifest.json")

        result = subprocess.run(
            [sys.executable, '-m', 'systems.pixel_compiler.pixelrts_cli', 'delta',
             old_path, new_path, '-o', output_path],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        # Should create output file
        assert os.path.exists(output_path)

        # File should contain valid JSON
        with open(output_path) as f:
            manifest = json.load(f)

        assert 'old_file' in manifest
        assert 'new_file' in manifest

    def test_cli_delta_command_quiet(self):
        """Test CLI delta command with quiet flag."""
        import subprocess
        import sys

        old_path = self._create_rts_file(b"Data", "old.rts.png")
        new_path = self._create_rts_file(b"Data modified", "new.rts.png")
        output_path = os.path.join(self.temp_dir, "quiet.json")

        result = subprocess.run(
            [sys.executable, '-m', 'systems.pixel_compiler.pixelrts_cli', 'delta',
             old_path, new_path, '-o', output_path, '-q'],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        # Should still create file
        assert os.path.exists(output_path)
        # Quiet mode should not print summary (stdout should be empty or minimal)
        # The manifest is written to file, not stdout with -o flag
