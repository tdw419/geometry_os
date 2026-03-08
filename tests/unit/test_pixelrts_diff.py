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

    # ==================== Statistics Tests ====================

    def test_channel_stats_structure(self):
        """Test _compute_channel_stats returns expected keys."""
        # Create test arrays with changes
        old_arr = np.array([100, 100, 100, 255] * 10, dtype=np.uint8)
        new_arr = np.array([110, 90, 100, 255] * 10, dtype=np.uint8)
        diff_mask = old_arr != new_arr

        # Compute channel stats
        stats = self.differ._compute_channel_stats(diff_mask, old_arr, new_arr)

        # Verify structure
        assert 'per_channel' in stats, "Missing per_channel in stats"
        assert 'most_changed_channel' in stats, "Missing most_changed_channel in stats"
        assert 'least_changed_channel' in stats, "Missing least_changed_channel in stats"

        # Verify per_channel has all RGBA channels
        per_ch = stats['per_channel']
        for ch in ['R', 'G', 'B', 'A']:
            assert ch in per_ch, f"Missing channel {ch} in per_channel"
            assert 'changed' in per_ch[ch], f"Missing 'changed' in {ch} stats"
            assert 'mean_delta' in per_ch[ch], f"Missing 'mean_delta' in {ch} stats"

    def test_channel_stats_accuracy(self):
        """Test that R channel changes are counted correctly."""
        # Create arrays where only R channel (index 0 of each pixel) changes
        # Each pixel is RGBA, so R is at positions 0, 4, 8, 12, ...
        old_arr = np.array([100, 50, 50, 255] * 5, dtype=np.uint8)  # 20 bytes, 5 pixels
        new_arr = np.array([120, 50, 50, 255] * 5, dtype=np.uint8)  # R changed by +20

        diff_mask = old_arr != new_arr

        # Compute stats
        stats = self.differ._compute_channel_stats(diff_mask, old_arr, new_arr)

        # R channel should have 5 changed bytes
        assert stats['per_channel']['R']['changed'] == 5, \
            f"Expected 5 R channel changes, got {stats['per_channel']['R']['changed']}"

        # Other channels should have 0 changes
        assert stats['per_channel']['G']['changed'] == 0, "G should have 0 changes"
        assert stats['per_channel']['B']['changed'] == 0, "B should have 0 changes"
        assert stats['per_channel']['A']['changed'] == 0, "A should have 0 changes"

        # R should be most changed
        assert stats['most_changed_channel'] == 'R', \
            f"Expected R as most changed, got {stats['most_changed_channel']}"

    def test_get_summary_format(self):
        """Test get_summary returns non-empty string with expected content."""
        result = {
            'old_file': 'old.rts.png',
            'new_file': 'new.rts.png',
            'added_bytes': 100,
            'removed_bytes': 50,
            'changed_bytes': 200,
            'unchanged_bytes': 650,
            'total_bytes': 1000,
            'change_percent': 35.0,
            'changed_regions': [{'id': 'R1'}]
        }

        summary = self.differ.get_summary(result)

        # Should return non-empty string
        assert isinstance(summary, str), "Summary should be a string"
        assert len(summary) > 0, "Summary should not be empty"

        # Should contain key elements
        assert 'old.rts.png' in summary, "Summary should contain old file name"
        assert 'new.rts.png' in summary, "Summary should contain new file name"
        assert 'Bytes Added' in summary, "Summary should contain 'Bytes Added'"
        assert 'Bytes Removed' in summary, "Summary should contain 'Bytes Removed'"
        assert 'Bytes Changed' in summary, "Summary should contain 'Bytes Changed'"
        assert '1,000' in summary or '1000' in summary, "Summary should contain total bytes"

    def test_diff_includes_channel_stats(self):
        """Test that diff() result has channel_stats key."""
        # Create files with differences
        old_data = b"AAAA"
        new_data = b"AABB"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        # Run diff
        result = self.differ.diff(old_path, new_path)

        # Verify channel_stats is present
        assert 'channel_stats' in result, "Missing channel_stats in diff result"

        # Verify structure
        stats = result['channel_stats']
        assert 'per_channel' in stats, "Missing per_channel in channel_stats"
        assert 'most_changed_channel' in stats, "Missing most_changed_channel"
