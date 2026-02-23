"""
Unit tests for sense classes: FilesystemSense, WebSense, SenseResult.
"""

import asyncio
import tempfile
import os
import pytest
from unittest.mock import patch, AsyncMock, MagicMock
import time

from systems.swarm.senses import FilesystemSense, WebSense, SenseResult
from systems.swarm.senses.base import SenseResult as BaseSenseResult


class TestSenseResult:
    """Tests for SenseResult dataclass."""

    def test_success_result(self):
        """Test successful SenseResult creation."""
        result = SenseResult(success=True, data="test data")
        assert result.success is True
        assert result.data == "test data"
        assert result.error is None

    def test_error_result(self):
        """Test error SenseResult creation."""
        result = SenseResult(success=False, error="test error")
        assert result.success is False
        assert result.data is None
        assert result.error == "test error"

    def test_repr_success(self):
        """Test string representation of success result."""
        result = SenseResult(success=True, data="test")
        assert "success=True" in repr(result)
        assert "data='test'" in repr(result)

    def test_repr_error(self):
        """Test string representation of error result."""
        result = SenseResult(success=False, error="failed")
        assert "success=False" in repr(result)
        assert "error='failed'" in repr(result)


class TestFilesystemSense:
    """Tests for FilesystemSense class."""

    def test_init_resolves_paths(self):
        """Test that paths are resolved on initialization."""
        fs = FilesystemSense(["/tmp", "/var/../tmp"])
        # Both should resolve to same path
        assert len(fs._allowed_paths) == 2
        assert fs._allowed_paths[0] == fs._allowed_paths[1]

    def test_read_file_success(self):
        """Test reading a file from allowed path."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test file
            test_file = os.path.join(tmpdir, "test.txt")
            with open(test_file, "w") as f:
                f.write("test content")

            fs = FilesystemSense([tmpdir])
            result = fs.read_file(test_file)

            assert result.success is True
            assert result.data == "test content"

    def test_read_file_not_found(self):
        """Test reading non-existent file."""
        with tempfile.TemporaryDirectory() as tmpdir:
            fs = FilesystemSense([tmpdir])
            result = fs.read_file(os.path.join(tmpdir, "nonexistent.txt"))

            assert result.success is False
            assert "not found" in result.error.lower()

    def test_read_file_not_a_file(self):
        """Test reading a directory (not a file)."""
        with tempfile.TemporaryDirectory() as tmpdir:
            fs = FilesystemSense([tmpdir])
            result = fs.read_file(tmpdir)

            assert result.success is False
            assert "not a file" in result.error.lower()

    def test_read_file_path_traversal_blocked(self):
        """Test that path traversal attacks are blocked."""
        with tempfile.TemporaryDirectory() as tmpdir:
            fs = FilesystemSense([tmpdir])
            # Try to read /etc/passwd via path traversal
            result = fs.read_file(os.path.join(tmpdir, "..", "..", "etc", "passwd"))

            assert result.success is False
            assert "not within allowed" in result.error.lower()

    def test_read_file_outside_whitelist_blocked(self):
        """Test that reading outside whitelist is blocked."""
        with tempfile.TemporaryDirectory() as tmpdir:
            fs = FilesystemSense([tmpdir])
            result = fs.read_file("/etc/passwd")

            assert result.success is False
            assert "not within allowed" in result.error.lower()

    def test_write_file_success(self):
        """Test writing a file to allowed path."""
        with tempfile.TemporaryDirectory() as tmpdir:
            fs = FilesystemSense([tmpdir])
            result = fs.write_file(os.path.join(tmpdir, "test.txt"), "new content")

            assert result.success is True
            assert result.data == 11  # len("new content")

            # Verify file was written
            with open(os.path.join(tmpdir, "test.txt")) as f:
                assert f.read() == "new content"

    def test_write_file_creates_directories(self):
        """Test that write creates parent directories."""
        with tempfile.TemporaryDirectory() as tmpdir:
            fs = FilesystemSense([tmpdir])
            result = fs.write_file(
                os.path.join(tmpdir, "subdir", "deep", "test.txt"),
                "nested content"
            )

            assert result.success is True
            assert os.path.exists(os.path.join(tmpdir, "subdir", "deep", "test.txt"))

    def test_write_file_outside_whitelist_blocked(self):
        """Test that writing outside whitelist is blocked."""
        with tempfile.TemporaryDirectory() as tmpdir:
            fs = FilesystemSense([tmpdir])
            result = fs.write_file("/etc/hacked", "malicious")

            assert result.success is False
            assert "not within allowed" in result.error.lower()

    def test_list_dir_success(self):
        """Test listing directory contents."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test structure
            os.mkdir(os.path.join(tmpdir, "subdir"))
            with open(os.path.join(tmpdir, "file1.txt"), "w") as f:
                f.write("content")
            with open(os.path.join(tmpdir, "file2.txt"), "w") as f:
                f.write("content")

            fs = FilesystemSense([tmpdir])
            result = fs.list_dir(tmpdir)

            assert result.success is True
            names = sorted([e["name"] for e in result.data])
            assert names == ["file1.txt", "file2.txt", "subdir"]

            # Check types
            files = [e for e in result.data if e["is_file"]]
            dirs = [e for e in result.data if e["is_dir"]]
            assert len(files) == 2
            assert len(dirs) == 1

    def test_list_dir_not_found(self):
        """Test listing non-existent directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            fs = FilesystemSense([tmpdir])
            result = fs.list_dir(os.path.join(tmpdir, "nonexistent"))

            assert result.success is False
            assert "not found" in result.error.lower()

    def test_list_dir_not_a_directory(self):
        """Test listing a file (not a directory)."""
        with tempfile.TemporaryDirectory() as tmpdir:
            test_file = os.path.join(tmpdir, "test.txt")
            with open(test_file, "w") as f:
                f.write("content")

            fs = FilesystemSense([tmpdir])
            result = fs.list_dir(test_file)

            assert result.success is False
            assert "not a directory" in result.error.lower()

    def test_list_dir_outside_whitelist_blocked(self):
        """Test that listing outside whitelist is blocked."""
        with tempfile.TemporaryDirectory() as tmpdir:
            fs = FilesystemSense([tmpdir])
            result = fs.list_dir("/etc")

            assert result.success is False
            assert "not within allowed" in result.error.lower()

    @pytest.mark.asyncio
    async def test_read_file_async_success(self):
        """Test async read file."""
        with tempfile.TemporaryDirectory() as tmpdir:
            test_file = os.path.join(tmpdir, "test.txt")
            with open(test_file, "w") as f:
                f.write("async content")

            fs = FilesystemSense([tmpdir], timeout=5.0)
            result = await fs.read_file_async(test_file)

            assert result.success is True
            assert result.data == "async content"

    @pytest.mark.asyncio
    async def test_write_file_async_success(self):
        """Test async write file."""
        with tempfile.TemporaryDirectory() as tmpdir:
            fs = FilesystemSense([tmpdir], timeout=5.0)
            result = await fs.write_file_async(
                os.path.join(tmpdir, "async_test.txt"),
                "async write"
            )

            assert result.success is True
            with open(os.path.join(tmpdir, "async_test.txt")) as f:
                assert f.read() == "async write"

    @pytest.mark.asyncio
    async def test_list_dir_async_success(self):
        """Test async list directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            with open(os.path.join(tmpdir, "test.txt"), "w") as f:
                f.write("content")

            fs = FilesystemSense([tmpdir], timeout=5.0)
            result = await fs.list_dir_async(tmpdir)

            assert result.success is True
            assert len(result.data) == 1


class TestWebSense:
    """Tests for WebSense class."""

    def test_init_default_values(self):
        """Test default initialization values."""
        ws = WebSense()
        assert ws._timeout == 30.0
        assert ws._max_requests_per_minute == 60

    def test_init_custom_values(self):
        """Test custom initialization values."""
        ws = WebSense(timeout=10.0, max_requests_per_minute=30)
        assert ws._timeout == 10.0
        assert ws._max_requests_per_minute == 30

    @pytest.mark.asyncio
    async def test_fetch_success(self):
        """Test successful HTTP fetch."""
        ws = WebSense()
        result = await ws.fetch("https://httpbin.org/get")

        assert result.success is True
        assert result.data["status_code"] == 200
        assert "content" in result.data

    @pytest.mark.asyncio
    async def test_fetch_http_error(self):
        """Test HTTP error response."""
        ws = WebSense()
        result = await ws.fetch("https://httpbin.org/status/404")

        assert result.success is False
        assert "HTTP error 404" in result.error

    @pytest.mark.asyncio
    async def test_fetch_invalid_url(self):
        """Test fetch with invalid URL."""
        ws = WebSense()
        result = await ws.fetch("not-a-valid-url")

        assert result.success is False
        assert "failed" in result.error.lower()

    @pytest.mark.asyncio
    async def test_rate_limiting(self):
        """Test that rate limiting works."""
        ws = WebSense(max_requests_per_minute=3)

        # Make 3 requests - should succeed
        for i in range(3):
            result = await ws.fetch("https://httpbin.org/get")
            assert result.success is True, f"Request {i+1} should succeed"

        # 4th request should fail
        result = await ws.fetch("https://httpbin.org/get")
        assert result.success is False
        assert "rate limit" in result.error.lower()

    @pytest.mark.asyncio
    async def test_rate_limit_window_reset(self):
        """Test that rate limit resets after window."""
        ws = WebSense(max_requests_per_minute=2)

        # Make 2 requests
        await ws.fetch("https://httpbin.org/get")
        await ws.fetch("https://httpbin.org/get")

        # 3rd should fail
        result = await ws.fetch("https://httpbin.org/get")
        assert result.success is False

        # Clear timestamps (simulate time passing)
        ws._request_timestamps = []

        # Should work again
        result = await ws.fetch("https://httpbin.org/get")
        assert result.success is True

    @pytest.mark.asyncio
    async def test_timeout_on_slow_request(self):
        """Test that slow requests timeout."""
        ws = WebSense(timeout=0.1)  # Very short timeout

        # httpbin has a /delay endpoint - request 2 second delay
        result = await ws.fetch("https://httpbin.org/delay/2")

        assert result.success is False
        assert "timed out" in result.error.lower()
