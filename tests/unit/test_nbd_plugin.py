"""
Unit tests for NBD Plugin

Tests the nbdkit Python plugin for serving PixelRTS containers.
"""

import pytest
import tempfile
import os
import shutil

from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder
from systems.pixel_compiler.serve.nbd_plugin import PixelRTSPlugin


class TestNBDPlugin:
    """Test cases for PixelRTSPlugin class."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.temp_dir = tempfile.mkdtemp()
        self.test_data = b"Hello, World! This is test data for NBD plugin range decoding."

    def teardown_method(self):
        """Clean up test files."""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def _create_rts_file(self, data: bytes, filename: str = "test.rts.png") -> str:
        """Helper to create a .rts.png file with given data."""
        path = os.path.join(self.temp_dir, filename)
        self.encoder.save(data, path, metadata={'type': 'test'})
        return path

    # ==================== Plugin Import Tests ====================

    def test_plugin_import(self):
        """Test that PixelRTSPlugin imports correctly."""
        from systems.pixel_compiler.serve.nbd_plugin import PixelRTSPlugin
        assert PixelRTSPlugin is not None
        assert hasattr(PixelRTSPlugin, 'API_VERSION')

    def test_plugin_has_required_methods(self):
        """Test that plugin has all required nbdkit API methods."""
        plugin = PixelRTSPlugin()

        required_methods = ['config', 'config_complete', 'open', 'close',
                          'get_size', 'pread']
        for method in required_methods:
            assert hasattr(plugin, method), f"Missing method: {method}"
            assert callable(getattr(plugin, method)), f"{method} is not callable"

    # ==================== Plugin Configuration Tests ====================

    def test_plugin_config_file(self):
        """Test config() accepts file parameter."""
        plugin = PixelRTSPlugin()
        test_path = self._create_rts_file(self.test_data)

        plugin.config('file', test_path)
        assert plugin.file == test_path

    def test_plugin_config_unknown_key(self):
        """Test config() raises ValueError for unknown keys."""
        plugin = PixelRTSPlugin()

        with pytest.raises(ValueError, match="Unknown configuration key"):
            plugin.config('unknown_key', 'value')

    def test_plugin_config_complete_validates_file(self):
        """Test config_complete() validates file exists."""
        plugin = PixelRTSPlugin()

        with pytest.raises(ValueError, match="file parameter is required"):
            plugin.config_complete()

        plugin.config('file', '/nonexistent/file.rts.png')
        with pytest.raises(ValueError, match="File not found"):
            plugin.config_complete()

    def test_plugin_config_complete_loads_metadata(self):
        """Test config_complete() loads container metadata."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        assert plugin._metadata is not None
        assert 'data_size' in plugin._metadata
        assert plugin._metadata['data_size'] == len(self.test_data)

    # ==================== get_size Tests ====================

    def test_plugin_get_size(self):
        """Test get_size() returns correct byte count."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        size = plugin.get_size(None)
        assert size == len(self.test_data), \
            f"Expected size {len(self.test_data)}, got {size}"

    def test_plugin_get_size_empty_container(self):
        """Test get_size() with empty container."""
        test_path = self._create_rts_file(b"")
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        size = plugin.get_size(None)
        # Empty data still produces a valid container
        assert size == 0, f"Expected size 0, got {size}"

    # ==================== pread Single Byte Tests ====================

    def test_plugin_pread_single_byte_at_start(self):
        """Test reading single byte at offset 0."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        byte_data = plugin.pread(None, 1, 0, 0)
        assert byte_data == self.test_data[0:1], \
            f"Expected {self.test_data[0:1]!r}, got {byte_data!r}"

    def test_plugin_pread_single_byte_at_middle(self):
        """Test reading single byte at middle offset."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        offset = len(self.test_data) // 2
        byte_data = plugin.pread(None, 1, offset, 0)
        assert byte_data == self.test_data[offset:offset+1], \
            f"Expected {self.test_data[offset:offset+1]!r}, got {byte_data!r}"

    def test_plugin_pread_single_byte_at_end(self):
        """Test reading single byte at last position."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        offset = len(self.test_data) - 1
        byte_data = plugin.pread(None, 1, offset, 0)
        assert byte_data == self.test_data[offset:offset+1], \
            f"Expected {self.test_data[offset:offset+1]!r}, got {byte_data!r}"

    # ==================== pread Range Tests ====================

    def test_plugin_pread_range_from_start(self):
        """Test reading multi-byte range from start."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        count = 10
        data = plugin.pread(None, count, 0, 0)
        assert data == self.test_data[:count], \
            f"Expected {self.test_data[:count]!r}, got {data!r}"

    def test_plugin_pread_range_from_middle(self):
        """Test reading multi-byte range from middle."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        offset = 10
        count = 15
        data = plugin.pread(None, count, offset, 0)
        expected = self.test_data[offset:offset+count]
        assert data == expected, f"Expected {expected!r}, got {data!r}"

    def test_plugin_pread_full_container(self):
        """Test reading entire container in one read."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        data = plugin.pread(None, len(self.test_data), 0, 0)
        assert data == self.test_data, \
            f"Expected {self.test_data!r}, got {data!r}"

    # ==================== pread Cross-Pixel Boundary Tests ====================

    def test_plugin_pread_cross_pixel_boundary(self):
        """Test reading across 4-byte pixel boundaries."""
        # Create data that spans multiple pixels
        test_data = bytes(range(256))  # 64 pixels worth of data
        test_path = self._create_rts_file(test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        # Read starting at byte 3 (last channel of first pixel) to byte 6
        # This crosses from pixel 0 to pixel 1
        offset = 3
        count = 4
        data = plugin.pread(None, count, offset, 0)
        expected = test_data[offset:offset+count]
        assert data == expected, f"Expected {expected!r}, got {data!r}"

    def test_plugin_pread_multiple_pixel_boundary_crossings(self):
        """Test reading across multiple pixel boundaries."""
        # Create data that spans many pixels
        test_data = bytes(range(100))
        test_path = self._create_rts_file(test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        # Read from byte 2 to byte 22 (crosses 5 pixels)
        offset = 2
        count = 20
        data = plugin.pread(None, count, offset, 0)
        expected = test_data[offset:offset+count]
        assert data == expected, f"Expected {expected!r}, got {data!r}"

    # ==================== pread Full Container Chunked Tests ====================

    def test_plugin_pread_full_container_in_chunks(self):
        """Test reading entire container in multiple chunks."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        # Read in 8-byte chunks
        chunk_size = 8
        result = bytearray()

        for offset in range(0, len(self.test_data), chunk_size):
            chunk = plugin.pread(None, chunk_size, offset, 0)
            result.extend(chunk)

        assert bytes(result) == self.test_data, \
            f"Chunked read mismatch"

    def test_plugin_pread_unaligned_chunks(self):
        """Test reading with unaligned chunk sizes."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        # Read in chunks of 7 bytes (not aligned to 4-byte pixels)
        chunk_size = 7
        result = bytearray()

        for offset in range(0, len(self.test_data), chunk_size):
            chunk = plugin.pread(None, chunk_size, offset, 0)
            result.extend(chunk)

        # Trim to actual data size
        result = bytes(result[:len(self.test_data)])
        assert result == self.test_data, "Unaligned chunked read mismatch"

    # ==================== Error Handling Tests ====================

    def test_plugin_invalid_file(self):
        """Test error handling for invalid files."""
        # Create a non-PixelRTS PNG file
        from PIL import Image
        import io

        img = Image.new('RGBA', (64, 64), color='red')
        buffer = io.BytesIO()
        img.save(buffer, format='PNG')
        invalid_png = buffer.getvalue()

        invalid_path = os.path.join(self.temp_dir, 'invalid.png')
        with open(invalid_path, 'wb') as f:
            f.write(invalid_png)

        plugin = PixelRTSPlugin()
        plugin.config('file', invalid_path)

        with pytest.raises(ValueError, match="Not a valid PixelRTS container"):
            plugin.config_complete()

    def test_plugin_pread_negative_offset(self):
        """Test pread raises ValueError for negative offset."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        with pytest.raises(ValueError, match="Negative offset"):
            plugin.pread(None, 10, -1, 0)

    def test_plugin_pread_beyond_end(self):
        """Test pread handles read beyond container size."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        # Read starting past the end
        data = plugin.pread(None, 10, len(self.test_data), 0)
        assert data == b'', "Expected empty bytes for read past end"

    def test_plugin_pread_partial_at_end(self):
        """Test pread handles partial read at container end."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        # Read starting 5 bytes from end, asking for 10 bytes
        offset = len(self.test_data) - 5
        data = plugin.pread(None, 10, offset, 0)

        # Should only return 5 bytes
        assert len(data) == 5, f"Expected 5 bytes, got {len(data)}"
        assert data == self.test_data[offset:]

    # ==================== Open/Close Tests ====================

    def test_plugin_open_returns_handle(self):
        """Test open() returns a valid handle."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        handle = plugin.open(readonly=True)
        assert handle is not None

    def test_plugin_close_no_error(self):
        """Test close() doesn't raise errors."""
        test_path = self._create_rts_file(self.test_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        handle = plugin.open(readonly=True)
        # Should not raise
        plugin.close(handle)

    # ==================== Large Container Tests ====================

    def test_plugin_large_container(self):
        """Test plugin handles larger containers (1MB+)."""
        # Create 1MB of data
        import random
        random.seed(42)
        large_data = bytes(random.randint(0, 255) for _ in range(1024 * 1024))

        test_path = self._create_rts_file(large_data)
        plugin = PixelRTSPlugin()
        plugin.config('file', test_path)
        plugin.config_complete()

        # Verify size
        assert plugin.get_size(None) == len(large_data)

        # Read first and last chunks
        first_chunk = plugin.pread(None, 100, 0, 0)
        assert first_chunk == large_data[:100]

        last_offset = len(large_data) - 100
        last_chunk = plugin.pread(None, 100, last_offset, 0)
        assert last_chunk == large_data[last_offset:]

        # Read a chunk from the middle
        mid_offset = len(large_data) // 2
        mid_chunk = plugin.pread(None, 100, mid_offset, 0)
        assert mid_chunk == large_data[mid_offset:mid_offset+100]


class TestDecodeRange:
    """Test cases for PixelRTSDecoder.decode_range method."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def test_decode_range_matches_full_decode(self):
        """Test that decode_range produces same results as full decode."""
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder

        test_data = b"Testing decode_range vs full decode for consistency."
        path = os.path.join(self.temp_dir, 'test.rts.png')
        self.encoder.save(test_data, path, metadata={'type': 'test'})

        with open(path, 'rb') as f:
            png_data = f.read()

        decoder = PixelRTSDecoder()

        # Full decode
        full_data = decoder.decode(png_data)

        # Range decode in chunks
        chunk_size = 8
        range_data = bytearray()
        for offset in range(0, len(test_data), chunk_size):
            chunk = decoder.decode_range(png_data, offset, chunk_size)
            range_data.extend(chunk)

        range_data = bytes(range_data[:len(test_data)])

        assert full_data == test_data, "Full decode should match original"
        assert range_data == test_data, "Range decode should match original"
        assert full_data == range_data, "Full and range decode should match"

    def test_decode_range_various_offsets(self):
        """Test decode_range at various byte offsets."""
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder

        test_data = bytes(range(256))  # Known pattern
        path = os.path.join(self.temp_dir, 'test.rts.png')
        self.encoder.save(test_data, path, metadata={'type': 'test'})

        with open(path, 'rb') as f:
            png_data = f.read()

        decoder = PixelRTSDecoder()

        # Test reads at various offsets
        for offset in [0, 1, 3, 4, 7, 8, 15, 16, 31, 32, 63, 100, 200]:
            count = 10
            data = decoder.decode_range(png_data, offset, count)
            expected = test_data[offset:offset+count]
            assert data == expected, \
                f"Mismatch at offset {offset}: expected {expected!r}, got {data!r}"

    def test_decode_range_invalid_inputs(self):
        """Test decode_range handles invalid inputs."""
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder

        test_data = b"Test data"
        path = os.path.join(self.temp_dir, 'test.rts.png')
        self.encoder.save(test_data, path, metadata={'type': 'test'})

        with open(path, 'rb') as f:
            png_data = f.read()

        decoder = PixelRTSDecoder()

        # Negative start_byte
        with pytest.raises(ValueError, match="Negative start_byte"):
            decoder.decode_range(png_data, -1, 10)

        # Negative count
        with pytest.raises(ValueError, match="Negative count"):
            decoder.decode_range(png_data, 0, -1)

        # Zero count
        result = decoder.decode_range(png_data, 0, 0)
        assert result == b''

        # Start beyond data
        result = decoder.decode_range(png_data, 1000, 10)
        assert result == b''
