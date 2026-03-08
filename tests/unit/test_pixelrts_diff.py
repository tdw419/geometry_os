"""
Unit tests for PixelRTS Diff Engine
"""

import pytest
import tempfile
import os
import numpy as np

from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder
from systems.pixel_compiler.pixelrts_diff import PixelRTSDiffer


class TestPixelRTSDiffer:
    """Test cases for PixelRTSDiffer class."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.differ = PixelRTSDiffer()
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

    def test_diff_identical_files(self):
        """Test diff of identical files returns all zeros."""
        # Create identical files
        data = b"Hello, World! This is test data for diff."
        old_path = self._create_rts_file(data, "old.rts.png")
        new_path = self._create_rts_file(data, "new.rts.png")

        # Run diff
        result = self.differ.diff(old_path, new_path)

        # Verify all counts are 0
        assert result['added_bytes'] == 0, f"Expected 0 added, got {result['added_bytes']}"
        assert result['removed_bytes'] == 0, f"Expected 0 removed, got {result['removed_bytes']}"
        assert result['changed_bytes'] == 0, f"Expected 0 changed, got {result['changed_bytes']}"
        assert result['unchanged_bytes'] == len(data), f"Expected {len(data)} unchanged"
        assert result['change_percent'] == 0.0, f"Expected 0% change, got {result['change_percent']}%"
        assert result['total_bytes'] == len(data)

    def test_diff_added_bytes(self):
        """Test diff detects added bytes (new file larger)."""
        # Old file has less data
        old_data = b"Hello"
        # New file has more data (extra bytes appended)
        new_data = b"Hello, World!"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        # Run diff
        result = self.differ.diff(old_path, new_path)

        # Should have added bytes (new content)
        assert result['added_bytes'] > 0, f"Expected added bytes > 0, got {result['added_bytes']}"
        assert result['removed_bytes'] == 0, f"Expected 0 removed, got {result['removed_bytes']}"
        assert result['total_bytes'] == len(new_data)

    def test_diff_removed_bytes(self):
        """Test diff detects removed bytes (new file smaller)."""
        # Old file has more data
        old_data = b"Hello, World!"
        # New file has less data
        new_data = b"Hello"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        # Run diff
        result = self.differ.diff(old_path, new_path)

        # Should have removed bytes (content truncated)
        assert result['removed_bytes'] > 0, f"Expected removed bytes > 0, got {result['removed_bytes']}"
        assert result['added_bytes'] == 0, f"Expected 0 added, got {result['added_bytes']}"
        assert result['total_bytes'] == len(old_data)

    def test_diff_changed_bytes(self):
        """Test diff detects changed bytes (same size, different content)."""
        # Same length, different content
        old_data = b"AAAAAAAAAA"  # 10 bytes
        new_data = b"ABBBBBBBBB"  # 10 bytes, first char same

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        # Run diff
        result = self.differ.diff(old_path, new_path)

        # Should have changed bytes
        assert result['changed_bytes'] > 0, f"Expected changed bytes > 0, got {result['changed_bytes']}"
        assert result['total_bytes'] == len(old_data)
        # No added/removed since same length
        assert result['added_bytes'] == 0
        assert result['removed_bytes'] == 0

    def test_diff_returns_metadata(self):
        """Test that diff returns metadata from both files."""
        data = b"Test data"
        old_path = self._create_rts_file(data, "old.rts.png")
        new_path = self._create_rts_file(data, "new.rts.png")

        # Run diff
        result = self.differ.diff(old_path, new_path)

        # Verify metadata is present
        assert 'old_metadata' in result, "Missing old_metadata in result"
        assert 'new_metadata' in result, "Missing new_metadata in result"

        # Metadata should be dicts (or None if no metadata)
        if result['old_metadata'] is not None:
            assert isinstance(result['old_metadata'], dict)
        if result['new_metadata'] is not None:
            assert isinstance(result['new_metadata'], dict)

    def test_diff_empty_files(self):
        """Test diff handles empty files correctly."""
        empty_data = b""

        old_path = self._create_rts_file(empty_data, "old_empty.rts.png")
        new_path = self._create_rts_file(empty_data, "new_empty.rts.png")

        # Run diff
        result = self.differ.diff(old_path, new_path)

        # All counts should be 0
        assert result['added_bytes'] == 0
        assert result['removed_bytes'] == 0
        assert result['changed_bytes'] == 0
        assert result['unchanged_bytes'] == 0
        assert result['total_bytes'] == 0
        assert result['change_percent'] == 0.0

    def test_diff_returns_diff_mask(self):
        """Test that diff returns a boolean numpy array mask."""
        old_data = b"AAAA"
        new_data = b"AABB"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        # Run diff
        result = self.differ.diff(old_path, new_path)

        # Verify diff_mask is a numpy boolean array
        assert 'diff_mask' in result, "Missing diff_mask in result"
        assert isinstance(result['diff_mask'], np.ndarray), "diff_mask should be numpy array"
        assert result['diff_mask'].dtype == bool, "diff_mask should be boolean"

    def test_diff_file_not_found(self):
        """Test diff raises FileNotFoundError for missing files."""
        existing_path = self._create_rts_file(b"data", "exists.rts.png")
        non_existent = "/nonexistent/file.rts.png"

        # Should raise FileNotFoundError for missing old file
        with pytest.raises(FileNotFoundError):
            self.differ.diff(non_existent, existing_path)

        # Should raise FileNotFoundError for missing new file
        with pytest.raises(FileNotFoundError):
            self.differ.diff(existing_path, non_existent)

    # ==================== Region Tests ====================

    def test_get_regions_returns_list(self):
        """Test that _get_regions returns a list (may be empty)."""
        # Create a diff mask with some changes
        mask = np.zeros(100, dtype=bool)
        mask[10:20] = True

        # Call _get_regions with a small grid
        regions = self.differ._get_regions(mask, grid_size=16)

        # Should return a list
        assert isinstance(regions, list)

    def test_diff_includes_changed_regions(self):
        """Test that diff() result contains 'changed_regions' key."""
        # Create files with differences
        old_data = b"AAAAAAAAAA"  # 10 bytes
        new_data = b"AABBBBBBBB"  # 10 bytes, different

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        # Run diff
        result = self.differ.diff(old_path, new_path)

        # Verify changed_regions is present and is a list
        assert 'changed_regions' in result, "Missing changed_regions in result"
        assert isinstance(result['changed_regions'], list), "changed_regions should be a list"

    def test_regions_have_bounds(self):
        """Test that each region has x_min, x_max, y_min, y_max, pixel_count."""
        # Create a diff mask with some changes
        mask = np.zeros(1000, dtype=bool)
        mask[100:200] = True  # Create some changed bytes

        # Call _get_regions
        regions = self.differ._get_regions(mask, grid_size=16)

        # If regions exist, verify structure
        if regions:
            region = regions[0]
            assert 'x_min' in region, "Missing x_min in region"
            assert 'x_max' in region, "Missing x_max in region"
            assert 'y_min' in region, "Missing y_min in region"
            assert 'y_max' in region, "Missing y_max in region"
            assert 'pixel_count' in region, "Missing pixel_count in region"
            assert 'id' in region, "Missing id in region"
            assert 'byte_count' in region, "Missing byte_count in region"

            # Verify types
            assert isinstance(region['x_min'], int), "x_min should be int"
            assert isinstance(region['y_min'], int), "y_min should be int"
            assert isinstance(region['pixel_count'], int), "pixel_count should be int"

    def test_regions_sorted_by_size(self):
        """Test that regions are sorted by pixel_count descending."""
        # Create a diff mask with changes in two separate areas
        # Using a larger mask to create distinct regions
        mask = np.zeros(2000, dtype=bool)
        mask[100:200] = True  # First region (25 pixels)
        mask[500:700] = True  # Second region (50 pixels) - should be first after sort

        # Call _get_regions
        regions = self.differ._get_regions(mask, grid_size=16)

        # If multiple regions exist, verify they're sorted
        if len(regions) > 1:
            pixel_counts = [r['pixel_count'] for r in regions]
            # Verify descending order
            assert pixel_counts == sorted(pixel_counts, reverse=True), \
                f"Regions not sorted by pixel_count descending: {pixel_counts}"
