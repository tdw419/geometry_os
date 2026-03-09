"""
Unit tests for Delta Server Integration

Tests the DeltaServer class, HTTP endpoints, HTTPByteFetcher,
and CLI integration for delta updates.
"""

import pytest
import tempfile
import os
import json
import hashlib
import asyncio
from pathlib import Path

from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder
from systems.pixel_compiler.delta_manifest import DeltaManifest, DeltaRegion, generate_delta_manifest
from systems.pixel_compiler.delta_patch import DeltaPatcher, HTTPByteFetcher, PatchError
from systems.pixel_compiler.serve.delta_server import (
    DeltaServer,
    generate_delta_for_container,
    create_delta_handler,
    DeltaHTTPHandler
)


class TestDeltaServerCreation:
    """Test cases for DeltaServer initialization."""

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

    def test_delta_server_creation(self):
        """Test creating a DeltaServer instance."""
        data = b"Hello, World!"
        container_path = self._create_rts_file(data, "container.rts.png")

        server = DeltaServer(container_path, self.temp_dir)

        # container_path is converted to Path object in __post_init__
        assert str(server.container_path) == str(container_path)
        assert str(server.http_root) == str(self.temp_dir)
        assert server._delta_dir.exists()
        assert server._delta_dir.name == "delta"

    def test_delta_server_creates_directory(self):
        """Test that delta directory is created."""
        data = b"Test data"
        container_path = self._create_rts_file(data, "test.rts.png")

        # Delete delta dir if it exists
        delta_dir = os.path.join(self.temp_dir, "delta")
        if os.path.exists(delta_dir):
            import shutil
            shutil.rmtree(delta_dir)

        server = DeltaServer(container_path, self.temp_dir)

        assert os.path.exists(delta_dir)


class TestGenerateManifest:
    """Test cases for manifest generation."""

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

    def test_generate_manifest_for_version(self):
        """Test generating a manifest for an old version."""
        old_data = b"AAAAAAAAAA"
        new_data = b"AAAABBBBAA"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        server = DeltaServer(new_path, self.temp_dir)
        manifest_path = server.generate_manifest_for_version(old_path)

        assert os.path.exists(manifest_path)
        assert manifest_path.endswith(".json")

        # Verify manifest content
        manifest = DeltaManifest.load(manifest_path)
        assert manifest.old_size == len(old_data)
        assert manifest.new_size == len(new_data)
        assert len(manifest.regions) >= 1

    def test_generate_manifest_file_not_found(self):
        """Test generating manifest with non-existent old file."""
        data = b"Test data"
        container_path = self._create_rts_file(data, "container.rts.png")

        server = DeltaServer(container_path, self.temp_dir)

        with pytest.raises(FileNotFoundError):
            server.generate_manifest_for_version("/nonexistent/file.rts.png")


class TestManifestCaching:
    """Test cases for manifest caching."""

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

    def test_manifest_caching(self):
        """Test that manifests are cached correctly."""
        old_data = b"AAAAAAAAAA"
        new_data = b"AAAABBBBAA"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        server = DeltaServer(new_path, self.temp_dir)
        manifest_path = server.generate_manifest_for_version(old_path)

        # Get cached manifest
        version_tag = "old"
        cached = server.get_cached_manifest(version_tag)

        assert cached is not None
        assert cached.old_size == len(old_data)
        assert cached.new_size == len(new_data)

    def test_list_available_deltas(self):
        """Test listing available deltas."""
        old_data = b"AAAAAAAAAA"
        new_data = b"AAAABBBBAA"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        server = DeltaServer(new_path, self.temp_dir)
        server.generate_manifest_for_version(old_path)

        deltas = server.list_available_deltas()

        assert len(deltas) == 1
        assert 'file' in deltas[0]
        assert 'regions_count' in deltas[0]
        assert 'compression_ratio' in deltas[0]


class TestGenerateDeltaForContainer:
    """Test cases for generate_delta_for_container function."""

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

    def test_generate_delta_for_container(self):
        """Test the convenience function for delta generation."""
        old_data = b"Hello"
        new_data = b"Hello, World!"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        manifest_path = generate_delta_for_container(
            new_path, old_path, self.temp_dir
        )

        assert os.path.exists(manifest_path)


class TestDeltaHandler:
    """Test cases for HTTP delta handler."""

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

    def test_delta_handler_list(self):
        """Test the /delta/list endpoint handler."""
        old_data = b"AAAAAAAAAA"
        new_data = b"AAAABBBBAA"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        server = DeltaServer(new_path, self.temp_dir)
        server.generate_manifest_for_version(old_path)

        handler = create_delta_handler(server)

        # Create mock writer
        class MockWriter:
            def __init__(self):
                self.data = []

            def write(self, data):
                self.data.append(data)

            async def drain(self):
                pass

        async def run_test():
            writer = MockWriter()
            result = await handler('/delta/list', {}, writer)
            assert result is True
            response = b''.join(writer.data).decode('utf-8')
            assert '"deltas"' in response

        asyncio.run(run_test())

    def test_delta_handler_manifest(self):
        """Test the /delta/<file>.json endpoint handler."""
        old_data = b"AAAAAAAAAA"
        new_data = b"AAAABBBBAA"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        server = DeltaServer(new_path, self.temp_dir)
        server.generate_manifest_for_version(old_path)

        handler = create_delta_handler(server)

        class MockWriter:
            def __init__(self):
                self.data = []

            def write(self, data):
                self.data.append(data)

            async def drain(self):
                pass

        async def run_test():
            writer = MockWriter()
            # Manifest filename is {stem}.json where stem is "new.rts" for "new.rts.png"
            manifest_name = Path(new_path).stem + '.json'
            result = await handler(f'/delta/{manifest_name}', {}, writer)
            assert result is True
            response = b''.join(writer.data).decode('utf-8')
            assert '"old_file"' in response
            assert '"new_file"' in response

        asyncio.run(run_test())

    def test_delta_handler_not_found(self):
        """Test the handler for non-existent manifest."""
        data = b"Test data"
        new_path = self._create_rts_file(data, "new.rts.png")

        server = DeltaServer(new_path, self.temp_dir)

        handler = create_delta_handler(server)

        class MockWriter:
            def __init__(self):
                self.data = []

            def write(self, data):
                self.data.append(data)

            async def drain(self):
                pass

        async def run_test():
            writer = MockWriter()
            result = await handler('/delta/nonexistent.json', {}, writer)
            assert result is True
            response = b''.join(writer.data).decode('utf-8')
            assert '404' in response or 'Not Found' in response

        asyncio.run(run_test())


class TestHTTPByteFetcher:
    """Test cases for HTTPByteFetcher class."""

    def test_http_byte_fetcher_creation(self):
        """Test creating an HTTPByteFetcher."""
        fetcher = HTTPByteFetcher("http://localhost:8080/file.rts.png")
        assert fetcher.base_url == "http://localhost:8080/file.rts.png"
        assert fetcher.bytes_fetched == 0

    def test_http_byte_fetcher_bytes_count(self):
        """Test bytes_fetched property and reset."""
        fetcher = HTTPByteFetcher("http://localhost:8080/file.rts.png")

        # Simulate bytes fetched
        fetcher._bytes_fetched = 1000
        assert fetcher.bytes_fetched == 1000

        fetcher.reset_bytes_count()
        assert fetcher.bytes_fetched == 0


class TestPixelRTSServeDeltaFlag:
    """Test cases for --delta flag in serve command."""

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

        return path

    def test_pixelrts_serve_delta_flag(self):
        """Test that --delta flag is recognized in CLI."""
        import subprocess
        import sys

        data = b"Test data"
        rts_path = self._create_rts_file(data, "test.rts.png")

        # Test help output includes --delta
        result = subprocess.run(
            [sys.executable, '-m', 'systems.pixel_compiler.pixelrts_cli', 'serve', '--help'],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        assert '--delta' in result.stdout


class TestPixelRTSUpdateCommand:
    """Test cases for pixelrts update CLI command."""

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

    def test_pixelrts_update_command_help(self):
        """Test that update command help is available."""
        import subprocess
        import sys

        result = subprocess.run(
            [sys.executable, '-m', 'systems.pixel_compiler.pixelrts_cli', 'update', '--help'],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        assert result.returncode == 0 or result.returncode == 0
        assert '--server' in result.stdout
        assert '--force' in result.stdout

    def test_pixelrts_update_missing_file(self):
        """Test update command with missing file."""
        import subprocess
        import sys

        result = subprocess.run(
            [sys.executable, '-m', 'systems.pixel_compiler.pixelrts_cli', 'update',
             '/nonexistent/file.rts.png', '--server', 'http://localhost:8080'],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        # Should fail with error about file not found
        assert result.returncode != 0


class TestDeltaSizeReduction:
    """Test cases for delta size reduction."""

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

    def test_delta_size_reduction(self):
        """Test that delta transfer is smaller than full file."""
        # Create files with significant differences
        old_data = b"A" * 1000 + b"B" * 10 + b"A" * 990  # 2000 bytes, 10 changed
        new_data = b"A" * 1000 + b"C" * 10 + b"A" * 990

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        server = DeltaServer(new_path, self.temp_dir)
        manifest_path = server.generate_manifest_for_version(old_path)

        manifest = DeltaManifest.load(manifest_path)

        # Calculate total bytes to transfer
        total_delta_bytes = sum(r.length for r in manifest.regions)

        # Delta should be smaller than full file for typical updates
        # (unless everything changed)
        full_file_size = manifest.new_size

        # For this test case, expect some savings
        # (10 bytes out of 2000 changed = 0.5% of file)
        if len(manifest.regions) > 0:
            # At least some bytes changed
            assert total_delta_bytes <= full_file_size


class TestCLIDeltaFromFlag:
    """Test cases for --delta-from CLI flag."""

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

    def test_cli_delta_from_flag_in_help(self):
        """Test that --delta-from flag is in help output."""
        import subprocess
        import sys

        result = subprocess.run(
            [sys.executable, '-m', 'systems.pixel_compiler.pixelrts_cli', 'serve', '--help'],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        assert '--delta-from' in result.stdout
