"""
Unit tests for HTTP Boot Server

Tests the HTTPBootServer class for HTTP boot file transfer with byte-range support.
"""

import pytest
import asyncio
import tempfile
import os
from pathlib import Path
from unittest.mock import Mock, patch, AsyncMock

from systems.pixel_compiler.serve.http_server import (
    HTTPBootServer,
    HTTPConfig,
    HTTP_PORT,
    HTTP_BUFFER_SIZE,
)


class TestHTTPBootServerImport:
    """Test HTTPBootServer can be imported."""

    def test_http_server_import(self):
        """Verify HTTPBootServer imports correctly."""
        from systems.pixel_compiler.serve.http_server import HTTPBootServer
        assert HTTPBootServer is not None

    def test_http_config_import(self):
        """Verify HTTPConfig imports correctly."""
        from systems.pixel_compiler.serve.http_server import HTTPConfig
        assert HTTPConfig is not None

    def test_constants(self):
        """Verify HTTP constants are defined."""
        assert HTTP_PORT == 8080
        assert HTTP_BUFFER_SIZE == 8192


class TestHTTPBootServerConfig:
    """Test HTTPBootServer configuration."""

    def test_http_server_default_config(self):
        """Verify default configuration."""
        server = HTTPBootServer()
        assert server._config.host == "0.0.0.0"
        assert server._config.port == HTTP_PORT
        assert server._root_dir is not None

    def test_http_server_custom_config(self):
        """Verify custom configuration."""
        config = HTTPConfig(host="127.0.0.1", port=9000)
        server = HTTPBootServer(config=config)
        assert server._config.host == "127.0.0.1"
        assert server._config.port == 9000

    def test_http_server_custom_root_dir(self):
        """Verify custom root directory via config."""
        with tempfile.TemporaryDirectory() as tmpdir:
            config = HTTPConfig(root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            assert str(server._root_dir) == tmpdir

    def test_set_root_dir(self):
        """Verify set_root_dir updates root directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = HTTPBootServer()
            server.set_root_dir(tmpdir)
            assert str(server._root_dir) == tmpdir

    def test_set_root_dir_nonexistent(self):
        """Verify set_root_dir raises for nonexistent directory."""
        server = HTTPBootServer()
        with pytest.raises(ValueError, match="does not exist"):
            server.set_root_dir("/nonexistent/path")

    def test_set_root_dir_not_directory(self):
        """Verify set_root_dir raises for non-directory."""
        with tempfile.NamedTemporaryFile() as tmpfile:
            server = HTTPBootServer()
            with pytest.raises(ValueError, match="not a directory"):
                server.set_root_dir(tmpfile.name)


class TestHTTPRequestParsing:
    """Test HTTP request parsing."""

    def test_parse_get_request(self):
        """Verify GET request parsing."""
        server = HTTPBootServer()
        request = b"GET /test.txt HTTP/1.1\r\nHost: localhost\r\n\r\n"

        method, path, headers = server._parse_request(request)

        assert method == "GET"
        assert path == "/test.txt"
        assert headers.get('Host') == "localhost"

    def test_parse_head_request(self):
        """Verify HEAD request parsing."""
        server = HTTPBootServer()
        request = b"HEAD /test.txt HTTP/1.1\r\nHost: localhost\r\n\r\n"

        method, path, headers = server._parse_request(request)

        assert method == "HEAD"
        assert path == "/test.txt"

    def test_parse_request_with_range(self):
        """Verify request with Range header parsing."""
        server = HTTPBootServer()
        request = b"GET /test.txt HTTP/1.1\r\nHost: localhost\r\nRange: bytes=0-1023\r\n\r\n"

        method, path, headers = server._parse_request(request)

        assert method == "GET"
        assert headers.get('Range') == "bytes=0-1023"

    def test_parse_request_with_connection(self):
        """Verify Connection header parsing."""
        server = HTTPBootServer()
        request = b"GET /test.txt HTTP/1.1\r\nConnection: keep-alive\r\n\r\n"

        method, path, headers = server._parse_request(request)

        assert headers.get('Connection') == "keep-alive"

    def test_parse_request_url_encoded_path(self):
        """Verify URL-encoded path decoding."""
        server = HTTPBootServer()
        request = b"GET /test%20file.txt HTTP/1.1\r\n\r\n"

        method, path, headers = server._parse_request(request)

        assert path == "/test file.txt"

    def test_parse_invalid_request(self):
        """Verify invalid request returns None."""
        server = HTTPBootServer()
        request = b"INVALID\r\n\r\n"

        method, path, headers = server._parse_request(request)

        assert method is None


class TestRangeHeaderParsing:
    """Test Range header parsing."""

    def test_parse_range_start_to_end(self):
        """Verify range parsing: bytes=0-1023."""
        server = HTTPBootServer()
        start, end = server._parse_range_header("bytes=0-1023", 5000)

        assert start == 0
        assert end == 1023

    def test_parse_range_middle(self):
        """Verify range parsing: bytes=1024-2047."""
        server = HTTPBootServer()
        start, end = server._parse_range_header("bytes=1024-2047", 5000)

        assert start == 1024
        assert end == 2047

    def test_parse_range_open_end(self):
        """Verify range parsing: bytes=1024- (from 1024 to end)."""
        server = HTTPBootServer()
        start, end = server._parse_range_header("bytes=1024-", 5000)

        assert start == 1024
        assert end == 4999

    def test_parse_range_suffix(self):
        """Verify range parsing: bytes=-1024 (last 1024 bytes)."""
        server = HTTPBootServer()
        start, end = server._parse_range_header("bytes=-1024", 5000)

        assert start == 3976  # 5000 - 1024
        assert end == 4999

    def test_parse_range_suffix_larger_than_file(self):
        """Verify suffix range larger than file returns whole file."""
        server = HTTPBootServer()
        start, end = server._parse_range_header("bytes=-10000", 5000)

        assert start == 0
        assert end == 4999

    def test_parse_range_multiple_ranges(self):
        """Verify multiple ranges - uses first range."""
        server = HTTPBootServer()
        start, end = server._parse_range_header("bytes=0-499, 500-999", 5000)

        assert start == 0
        assert end == 499

    def test_parse_range_invalid_unit(self):
        """Verify invalid range unit raises error."""
        server = HTTPBootServer()
        with pytest.raises(ValueError, match="Invalid range unit"):
            server._parse_range_header("chunks=0-1023", 5000)

    def test_parse_range_start_beyond_file(self):
        """Verify range start beyond file size raises error."""
        server = HTTPBootServer()
        with pytest.raises(ValueError):
            server._parse_range_header("bytes=10000-20000", 5000)

    def test_parse_range_start_greater_than_end(self):
        """Verify start > end raises error."""
        server = HTTPBootServer()
        with pytest.raises(ValueError):
            server._parse_range_header("bytes=1023-0", 5000)


class TestPathResolution:
    """Test file path resolution and security."""

    def test_resolve_path_valid(self):
        """Verify valid path resolution."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = HTTPBootServer()
            server.set_root_dir(tmpdir)

            # Create a file
            test_file = Path(tmpdir) / "test.txt"
            test_file.write_text("hello")

            resolved = server._resolve_path("test.txt")
            assert resolved == test_file

    def test_resolve_path_subdirectory(self):
        """Verify subdirectory path resolution."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = HTTPBootServer()
            server.set_root_dir(tmpdir)

            # Create subdirectory and file
            subdir = Path(tmpdir) / "subdir"
            subdir.mkdir()
            test_file = subdir / "test.txt"
            test_file.write_text("hello")

            resolved = server._resolve_path("subdir/test.txt")
            assert resolved == test_file

    def test_resolve_path_traversal_attack(self):
        """Verify path traversal attack is blocked."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = HTTPBootServer()
            server.set_root_dir(tmpdir)

            with pytest.raises(ValueError, match="Path traversal"):
                server._resolve_path("../../../etc/passwd")

    def test_resolve_path_encoded_traversal_attack(self):
        """Verify encoded path traversal attack is blocked."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = HTTPBootServer()
            server.set_root_dir(tmpdir)

            with pytest.raises(ValueError, match="traversal"):
                server._resolve_path("..%2F..%2Fetc%2Fpasswd")

    def test_resolve_path_with_query_string(self):
        """Verify query string is stripped."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = HTTPBootServer()
            server.set_root_dir(tmpdir)

            test_file = Path(tmpdir) / "test.txt"
            test_file.write_text("hello")

            resolved = server._resolve_path("test.txt?foo=bar")
            assert resolved == test_file

    def test_resolve_path_with_fragment(self):
        """Verify fragment is stripped."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = HTTPBootServer()
            server.set_root_dir(tmpdir)

            test_file = Path(tmpdir) / "test.txt"
            test_file.write_text("hello")

            resolved = server._resolve_path("test.txt#section")
            assert resolved == test_file

    def test_resolve_path_leading_slash_stripped(self):
        """Verify leading slashes are stripped."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = HTTPBootServer()
            server.set_root_dir(tmpdir)

            test_file = Path(tmpdir) / "test.txt"
            test_file.write_text("hello")

            resolved = server._resolve_path("/test.txt")
            assert resolved == test_file


class TestContentType:
    """Test Content-Type detection."""

    def test_content_type_ipxe(self):
        """Verify .ipxe file returns text/plain."""
        server = HTTPBootServer()
        content_type = server._get_content_type(Path("boot.ipxe"))
        assert "text/plain" in content_type

    def test_content_type_cfg(self):
        """Verify .cfg file returns text/plain."""
        server = HTTPBootServer()
        content_type = server._get_content_type(Path("pxelinux.cfg"))
        assert "text/plain" in content_type

    def test_content_type_vmlinuz(self):
        """Verify vmlinuz returns application/octet-stream."""
        server = HTTPBootServer()
        content_type = server._get_content_type(Path("vmlinuz"))
        assert content_type == "application/octet-stream"

    def test_content_type_initrd(self):
        """Verify initrd.img returns application/octet-stream."""
        server = HTTPBootServer()
        content_type = server._get_content_type(Path("initrd.img"))
        assert content_type == "application/octet-stream"

    def test_content_type_binary(self):
        """Verify unknown binary returns application/octet-stream."""
        server = HTTPBootServer()
        content_type = server._get_content_type(Path("boot.bin"))
        assert content_type == "application/octet-stream"

    def test_content_type_html(self):
        """Verify .html file returns text/html."""
        server = HTTPBootServer()
        content_type = server._get_content_type(Path("index.html"))
        assert "text/html" in content_type

    def test_content_type_json(self):
        """Verify .json file returns application/json."""
        server = HTTPBootServer()
        content_type = server._get_content_type(Path("data.json"))
        assert content_type == "application/json"


class TestHTTPBootServerMethods:
    """Test HTTPBootServer methods."""

    def test_repr(self):
        """Verify string representation."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = HTTPBootServer()
            server.set_root_dir(tmpdir)
            repr_str = repr(server)

            assert "HTTPBootServer" in repr_str
            assert "stopped" in repr_str

    def test_repr_running(self):
        """Verify string representation when running."""
        server = HTTPBootServer()
        server._running = True

        repr_str = repr(server)
        assert "running" in repr_str

        server._running = False


class TestHTTPServerFullFileRequest:
    """Test full file request handling."""

    @pytest.mark.asyncio
    async def test_http_server_full_file_request(self):
        """Request full file, verify 200 OK."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test file
            test_file = Path(tmpdir) / "test.txt"
            test_content = b"Hello, World! This is a test file."
            test_file.write_bytes(test_content)

            # Create and start server
            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                # Get actual port
                port = server._server.sockets[0].getsockname()[1]

                # Connect and send request
                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"GET /test.txt HTTP/1.1\r\nHost: localhost\r\n\r\n")
                await writer.drain()

                # Read response
                response = await reader.read(4096)

                # Verify response
                assert b"200 OK" in response
                assert b"Content-Length:" in response
                assert test_content in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()

    @pytest.mark.asyncio
    async def test_http_server_range_request_start(self):
        """Request bytes 0-1023, verify 206 Partial Content."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test file (5KB)
            test_file = Path(tmpdir) / "test.bin"
            test_content = b"x" * 5120
            test_file.write_bytes(test_content)

            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"GET /test.bin HTTP/1.1\r\nHost: localhost\r\nRange: bytes=0-1023\r\n\r\n")
                await writer.drain()

                response = await reader.read(4096)

                # Verify response
                assert b"206 Partial Content" in response
                assert b"Content-Range: bytes 0-1023/5120" in response
                assert b"Accept-Ranges: bytes" in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()

    @pytest.mark.asyncio
    async def test_http_server_range_request_middle(self):
        """Request bytes 1024-2047, verify correct data."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test file with recognizable content
            test_file = Path(tmpdir) / "test.bin"
            test_content = b"A" * 1024 + b"B" * 1024 + b"C" * 1024
            test_file.write_bytes(test_content)

            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"GET /test.bin HTTP/1.1\r\nHost: localhost\r\nRange: bytes=1024-2047\r\n\r\n")
                await writer.drain()

                response = await reader.read(4096)

                # Verify response
                assert b"206 Partial Content" in response
                assert b"Content-Range: bytes 1024-2047/" in response
                # Body should contain 'B' bytes
                assert b"B" * 1024 in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()

    @pytest.mark.asyncio
    async def test_http_server_range_request_suffix(self):
        """Request last 1024 bytes, verify correct offset."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test file (5KB)
            test_file = Path(tmpdir) / "test.bin"
            test_content = b"X" * 4096 + b"Y" * 1024
            test_file.write_bytes(test_content)

            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"GET /test.bin HTTP/1.1\r\nHost: localhost\r\nRange: bytes=-1024\r\n\r\n")
                await writer.drain()

                response = await reader.read(4096)

                # Verify response
                assert b"206 Partial Content" in response
                assert b"Content-Range: bytes 4096-5119/5120" in response
                # Body should contain 'Y' bytes
                assert b"Y" * 1024 in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()

    @pytest.mark.asyncio
    async def test_http_server_range_request_open_end(self):
        """Request bytes 1024- (from 1024 to end)."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test file
            test_file = Path(tmpdir) / "test.bin"
            test_content = b"A" * 1024 + b"B" * 4096
            test_file.write_bytes(test_content)

            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"GET /test.bin HTTP/1.1\r\nHost: localhost\r\nRange: bytes=1024-\r\n\r\n")
                await writer.drain()

                response = await reader.read(8192)

                # Verify response
                assert b"206 Partial Content" in response
                assert b"Content-Range: bytes 1024-5119/5120" in response
                # Body should contain 'B' bytes
                assert b"B" * 4096 in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()


class TestHTTPServerErrorHandling:
    """Test error handling."""

    @pytest.mark.asyncio
    async def test_http_server_file_not_found(self):
        """Request non-existent file, verify 404."""
        with tempfile.TemporaryDirectory() as tmpdir:
            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"GET /nonexistent.txt HTTP/1.1\r\nHost: localhost\r\n\r\n")
                await writer.drain()

                response = await reader.read(4096)

                assert b"404 Not Found" in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()

    @pytest.mark.asyncio
    async def test_http_server_path_traversal_blocked(self):
        """Request ../../../etc/passwd, verify 400."""
        with tempfile.TemporaryDirectory() as tmpdir:
            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"GET /../../../etc/passwd HTTP/1.1\r\nHost: localhost\r\n\r\n")
                await writer.drain()

                response = await reader.read(4096)

                # Should be 400 Bad Request (path traversal detected)
                assert b"400 Bad Request" in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()

    @pytest.mark.asyncio
    async def test_http_server_invalid_range(self):
        """Request invalid range, verify 416."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test file
            test_file = Path(tmpdir) / "test.bin"
            test_file.write_bytes(b"x" * 100)

            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                # Range start beyond file size
                writer.write(b"GET /test.bin HTTP/1.1\r\nHost: localhost\r\nRange: bytes=10000-20000\r\n\r\n")
                await writer.drain()

                response = await reader.read(4096)

                assert b"416 Range Not Satisfiable" in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()

    @pytest.mark.asyncio
    async def test_http_server_method_not_allowed(self):
        """Request with POST method, verify 405."""
        with tempfile.TemporaryDirectory() as tmpdir:
            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"POST /test.txt HTTP/1.1\r\nHost: localhost\r\n\r\n")
                await writer.drain()

                response = await reader.read(4096)

                assert b"405 Method Not Allowed" in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()


class TestHTTPServerHeadRequest:
    """Test HEAD request handling."""

    @pytest.mark.asyncio
    async def test_http_server_head_request(self):
        """HEAD request returns headers without body."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test file
            test_file = Path(tmpdir) / "test.txt"
            test_content = b"Hello, World!"
            test_file.write_bytes(test_content)

            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"HEAD /test.txt HTTP/1.1\r\nHost: localhost\r\n\r\n")
                await writer.drain()

                response = await reader.read(4096)

                # Verify headers
                assert b"200 OK" in response
                assert b"Content-Length: 13" in response
                assert b"Accept-Ranges: bytes" in response
                # Body should NOT be present (just headers)
                assert test_content not in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()


class TestHTTPServerStartStop:
    """Test server start and stop."""

    @pytest.mark.asyncio
    async def test_http_server_start_stop(self):
        """Verify server starts and stops cleanly."""
        with tempfile.TemporaryDirectory() as tmpdir:
            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)

            assert server._running is False
            assert server._server is None

            await server.start()
            assert server._running is True
            assert server._server is not None

            await server.stop()
            assert server._running is False
            assert server._server is None

    @pytest.mark.asyncio
    async def test_http_server_double_stop(self):
        """Verify double stop is safe."""
        server = HTTPBootServer()
        await server.stop()
        await server.stop()  # Should not raise

    @pytest.mark.asyncio
    async def test_http_server_double_start(self):
        """Verify double start logs warning but doesn't fail."""
        with tempfile.TemporaryDirectory() as tmpdir:
            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)

            await server.start()
            await server.start()  # Should log warning but not fail

            await server.stop()


class TestHTTPServerConcurrentRequests:
    """Test concurrent request handling."""

    @pytest.mark.asyncio
    async def test_http_server_concurrent_requests(self):
        """Multiple simultaneous requests handled correctly."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test files
            for i in range(5):
                test_file = Path(tmpdir) / f"test{i}.txt"
                test_file.write_bytes(f"File {i} content".encode())

            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                async def fetch_file(idx):
                    reader, writer = await asyncio.open_connection("127.0.0.1", port)
                    writer.write(f"GET /test{idx}.txt HTTP/1.1\r\nHost: localhost\r\n\r\n".encode())
                    await writer.drain()
                    response = await reader.read(4096)
                    writer.close()
                    await writer.wait_closed()
                    return response

                # Make 5 concurrent requests
                tasks = [fetch_file(i) for i in range(5)]
                responses = await asyncio.gather(*tasks)

                # Verify all responses
                for i, response in enumerate(responses):
                    assert b"200 OK" in response
                    assert f"File {i} content".encode() in response

            finally:
                await server.stop()


class TestHTTPServerLargeFile:
    """Test large file handling."""

    @pytest.mark.asyncio
    async def test_http_server_large_file(self):
        """Test with >10MB file for performance validation."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create 11MB file
            test_file = Path(tmpdir) / "large.bin"
            file_size = 11 * 1024 * 1024  # 11 MB

            # Write in chunks to avoid memory issues
            with open(test_file, 'wb') as f:
                chunk = b'X' * 1024 * 1024  # 1 MB chunk
                for _ in range(11):
                    f.write(chunk)

            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"GET /large.bin HTTP/1.1\r\nHost: localhost\r\n\r\n")
                await writer.drain()

                # Read response in chunks
                header = await reader.read(4096)
                assert b"200 OK" in header
                assert f"Content-Length: {file_size}".encode() in header

                # Read remaining data
                total_read = 0
                while True:
                    chunk = await reader.read(65536)
                    if not chunk:
                        break
                    total_read += len(chunk)

                # Verify we got all the data
                # Note: total_read may include header bytes
                assert total_read >= file_size - 4096  # Account for header in first read

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()

    @pytest.mark.asyncio
    async def test_http_server_large_file_range(self):
        """Test range request on large file."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create 11MB file
            test_file = Path(tmpdir) / "large.bin"
            file_size = 11 * 1024 * 1024  # 11 MB

            # Write specific pattern
            with open(test_file, 'wb') as f:
                # First MB is 'A', rest is 'B'
                f.write(b'A' * (1024 * 1024))
                f.write(b'B' * (10 * 1024 * 1024))

            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                # Request range in the 'B' section
                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"GET /large.bin HTTP/1.1\r\nHost: localhost\r\nRange: bytes=2097152-2099200\r\n\r\n")
                await writer.drain()

                response = await reader.read(4096)

                assert b"206 Partial Content" in response
                assert b"Content-Range: bytes 2097152-2099200/" in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()


class TestHTTPServerContentTypeHeaders:
    """Test Content-Type header responses."""

    @pytest.mark.asyncio
    async def test_http_server_content_type_ipxe(self):
        """Request .ipxe file, verify text/plain content type."""
        with tempfile.TemporaryDirectory() as tmpdir:
            test_file = Path(tmpdir) / "boot.ipxe"
            test_file.write_text("#!ipxe\nchain http://server/boot")

            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"GET /boot.ipxe HTTP/1.1\r\nHost: localhost\r\n\r\n")
                await writer.drain()

                response = await reader.read(4096)

                assert b"Content-Type: text/plain" in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()

    @pytest.mark.asyncio
    async def test_http_server_content_type_binary(self):
        """Request vmlinuz, verify application/octet-stream content type."""
        with tempfile.TemporaryDirectory() as tmpdir:
            test_file = Path(tmpdir) / "vmlinuz"
            test_file.write_bytes(b"\x00\x01\x02\x03" * 1000)

            config = HTTPConfig(host="127.0.0.1", port=0, root_dir=tmpdir)
            server = HTTPBootServer(config=config)
            await server.start()

            try:
                port = server._server.sockets[0].getsockname()[1]

                reader, writer = await asyncio.open_connection("127.0.0.1", port)
                writer.write(b"GET /vmlinuz HTTP/1.1\r\nHost: localhost\r\n\r\n")
                await writer.drain()

                response = await reader.read(4096)

                assert b"Content-Type: application/octet-stream" in response

                writer.close()
                await writer.wait_closed()
            finally:
                await server.stop()
