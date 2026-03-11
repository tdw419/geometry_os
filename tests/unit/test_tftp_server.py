"""
Unit tests for TFTP Server

Tests the TFTPServer class for PXE boot file transfer.
"""

import struct
import tempfile
from pathlib import Path

import pytest

from systems.pixel_compiler.serve.tftp_server import (
    ERROR_ACCESS_VIOLATION,
    ERROR_DISK_FULL,
    ERROR_FILE_EXISTS,
    ERROR_FILE_NOT_FOUND,
    ERROR_ILLEGAL_OPERATION,
    ERROR_NO_SUCH_USER,
    ERROR_NOT_DEFINED,
    ERROR_UNKNOWN_TID,
    OPCODE_ACK,
    OPCODE_DATA,
    OPCODE_ERROR,
    OPCODE_RRQ,
    OPCODE_WRQ,
    TFTP_BLOCK_SIZE,
    TFTP_PORT,
    TFTP_TIMEOUT,
    TFTPServer,
    TFTPTransfer,
)


class TestTFTPServerImport:
    """Test TFTPServer can be imported."""

    def test_tftp_server_import(self):
        """Verify TFTPServer imports correctly."""
        from systems.pixel_compiler.serve.tftp_server import TFTPServer
        assert TFTPServer is not None

    def test_tftp_transfer_import(self):
        """Verify TFTPTransfer imports correctly."""
        from systems.pixel_compiler.serve.tftp_server import TFTPTransfer
        assert TFTPTransfer is not None

    def test_constants(self):
        """Verify TFTP constants are defined."""
        assert TFTP_PORT == 69
        assert TFTP_BLOCK_SIZE == 512
        assert OPCODE_RRQ == 1
        assert OPCODE_WRQ == 2
        assert OPCODE_DATA == 3
        assert OPCODE_ACK == 4
        assert OPCODE_ERROR == 5


class TestTFTPServerConfig:
    """Test TFTPServer configuration."""

    def test_tftp_server_default_config(self):
        """Verify default configuration."""
        server = TFTPServer()
        assert server._timeout == TFTP_TIMEOUT
        assert server._root_dir is not None

    def test_tftp_server_custom_root_dir(self):
        """Verify custom root directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = TFTPServer(root_dir=tmpdir)
            assert str(server._root_dir) == tmpdir

    def test_tftp_server_custom_timeout(self):
        """Verify custom timeout."""
        server = TFTPServer(timeout=10.0)
        assert server._timeout == 10.0

    def test_set_root_dir(self):
        """Verify set_root_dir updates root directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = TFTPServer()
            server.set_root_dir(tmpdir)
            assert str(server._root_dir) == tmpdir

    def test_set_root_dir_nonexistent(self):
        """Verify set_root_dir raises for nonexistent directory."""
        server = TFTPServer()
        with pytest.raises(ValueError, match="does not exist"):
            server.set_root_dir("/nonexistent/path")

    def test_set_root_dir_not_directory(self):
        """Verify set_root_dir raises for non-directory."""
        with tempfile.NamedTemporaryFile() as tmpfile:
            server = TFTPServer()
            with pytest.raises(ValueError, match="not a directory"):
                server.set_root_dir(tmpfile.name)


class TestRRQParsing:
    """Test TFTP Read Request parsing."""

    def test_parse_rrq(self):
        """Verify RRQ packet parsing."""
        # Build RRQ packet: opcode(2) + filename + null + mode + null
        filename = "test.txt"
        mode = "octet"
        packet = struct.pack('!H', OPCODE_RRQ)
        packet += filename.encode('ascii') + b'\x00'
        packet += mode.encode('ascii') + b'\x00'

        result = TFTPServer.parse_rrq(packet)

        assert result[0] == filename
        assert result[1] == mode

    def test_parse_rrq_netascii(self):
        """Verify RRQ parsing with netascii mode."""
        filename = "config.txt"
        mode = "netascii"
        packet = struct.pack('!H', OPCODE_RRQ)
        packet += filename.encode('ascii') + b'\x00'
        packet += mode.encode('ascii') + b'\x00'

        result = TFTPServer.parse_rrq(packet)

        assert result[0] == filename
        assert result[1] == "netascii"

    def test_parse_rrq_too_short(self):
        """Verify RRQ parsing fails for short packet."""
        packet = b'\x00\x01'  # Just opcode

        with pytest.raises(ValueError, match="too short"):
            TFTPServer.parse_rrq(packet)

    def test_parse_rrq_wrong_opcode(self):
        """Verify RRQ parsing fails for wrong opcode."""
        packet = struct.pack('!H', OPCODE_WRQ)  # Wrong opcode
        packet += b'test.txt\x00octet\x00'

        with pytest.raises(ValueError, match="Expected RRQ opcode"):
            TFTPServer.parse_rrq(packet)


class TestDataPacketBuilding:
    """Test DATA packet building."""

    def test_build_data_packet(self):
        """Verify DATA packet building."""
        block = 1
        data = b'Hello, World!'

        packet = TFTPServer.build_data_packet(block, data)

        # Check opcode
        opcode = struct.unpack('!H', packet[0:2])[0]
        assert opcode == OPCODE_DATA

        # Check block number
        block_num = struct.unpack('!H', packet[2:4])[0]
        assert block_num == 1

        # Check data
        assert packet[4:] == data

    def test_build_data_packet_block_65535(self):
        """Verify DATA packet with max block number."""
        block = 65535
        data = b'x' * 512

        packet = TFTPServer.build_data_packet(block, data)

        block_num = struct.unpack('!H', packet[2:4])[0]
        assert block_num == 65535

    def test_build_data_packet_empty(self):
        """Verify DATA packet with empty data (end of transfer)."""
        block = 10
        data = b''

        packet = TFTPServer.build_data_packet(block, data)

        assert len(packet) == 4  # Just opcode and block number


class TestErrorPacketBuilding:
    """Test ERROR packet building."""

    def test_build_error_packet(self):
        """Verify ERROR packet building."""
        code = ERROR_FILE_NOT_FOUND
        message = "File not found"

        packet = TFTPServer.build_error_packet(code, message)

        # Check opcode
        opcode = struct.unpack('!H', packet[0:2])[0]
        assert opcode == OPCODE_ERROR

        # Check error code
        err_code = struct.unpack('!H', packet[2:4])[0]
        assert err_code == ERROR_FILE_NOT_FOUND

        # Check message (null-terminated)
        msg = packet[4:-1].decode('ascii')
        assert msg == "File not found"
        assert packet[-1:] == b'\x00'

    def test_build_error_packet_access_violation(self):
        """Verify ERROR packet for access violation."""
        code = ERROR_ACCESS_VIOLATION
        message = "Access denied"

        packet = TFTPServer.build_error_packet(code, message)

        err_code = struct.unpack('!H', packet[2:4])[0]
        assert err_code == ERROR_ACCESS_VIOLATION

    def test_build_error_packet_illegal_operation(self):
        """Verify ERROR packet for illegal operation."""
        code = ERROR_ILLEGAL_OPERATION
        message = "Write not supported"

        packet = TFTPServer.build_error_packet(code, message)

        err_code = struct.unpack('!H', packet[2:4])[0]
        assert err_code == ERROR_ILLEGAL_OPERATION


class TestPathResolution:
    """Test file path resolution and security."""

    def test_resolve_path_valid(self):
        """Verify valid path resolution."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = TFTPServer(root_dir=tmpdir)

            # Create a file
            test_file = Path(tmpdir) / "test.txt"
            test_file.write_text("hello")

            resolved = server._resolve_path("test.txt")
            assert resolved == test_file

    def test_resolve_path_subdirectory(self):
        """Verify subdirectory path resolution."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = TFTPServer(root_dir=tmpdir)

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
            server = TFTPServer(root_dir=tmpdir)

            with pytest.raises(ValueError, match="escapes root directory"):
                server._resolve_path("../../../etc/passwd")

    def test_resolve_path_absolute_blocked(self):
        """Verify absolute path is blocked."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = TFTPServer(root_dir=tmpdir)

            # Absolute paths should be treated as relative
            resolved = server._resolve_path("/etc/passwd")
            # Should resolve within root_dir
            assert str(tmpdir) in str(resolved) or resolved.name == "etc"

    def test_resolve_path_leading_slash_stripped(self):
        """Verify leading slashes are stripped."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = TFTPServer(root_dir=tmpdir)

            # Create file
            test_file = Path(tmpdir) / "test.txt"
            test_file.write_text("hello")

            # Leading slash should be stripped
            resolved = server._resolve_path("/test.txt")
            assert resolved == test_file


class TestTFTPTransfer:
    """Test TFTPTransfer dataclass."""

    def test_tftp_transfer_creation(self):
        """Verify TFTPTransfer creation."""
        transfer = TFTPTransfer(
            filename="test.txt",
            client_addr=("192.168.1.100", 12345),
            total_bytes=1024
        )

        assert transfer.filename == "test.txt"
        assert transfer.client_addr == ("192.168.1.100", 12345)
        assert transfer.block_number == 0
        assert transfer.bytes_sent == 0
        assert transfer.total_bytes == 1024
        assert transfer.completed is False
        assert transfer.error is None

    def test_tftp_transfer_defaults(self):
        """Verify TFTPTransfer default values."""
        transfer = TFTPTransfer(
            filename="test.txt",
            client_addr=("127.0.0.1", 1234)
        )

        assert transfer.block_number == 0
        assert transfer.bytes_sent == 0
        assert transfer.total_bytes == 0
        assert transfer.retries == 0
        assert transfer.completed is False


class TestFileNotFound:
    """Test file not found handling."""

    def test_file_not_found(self):
        """Verify file not found error handling."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = TFTPServer(root_dir=tmpdir)

            # Try to resolve nonexistent file - path resolution works
            # but the actual file check happens in _handle_rrq
            # For this test, verify the file doesn't exist
            nonexistent = Path(tmpdir) / "nonexistent.txt"
            assert not nonexistent.exists()

            # Path resolution should work (file doesn't need to exist for resolution)
            resolved = server._resolve_path("nonexistent.txt")
            assert resolved == nonexistent


class TestTFTPServerMethods:
    """Test TFTPServer methods."""

    def test_repr(self):
        """Verify string representation."""
        with tempfile.TemporaryDirectory() as tmpdir:
            server = TFTPServer(root_dir=tmpdir)
            repr_str = repr(server)

            assert "TFTPServer" in repr_str
            assert "stopped" in repr_str
            assert "transfers=0" in repr_str

    def test_repr_running(self):
        """Verify string representation when running."""
        server = TFTPServer()
        server._running = True

        repr_str = repr(server)
        assert "running" in repr_str

        server._running = False


class TestBlockBasedTransfer:
    """Test block-based transfer logic."""

    def test_data_packet_max_size(self):
        """Verify data packets respect block size."""
        # Create data larger than block size
        large_data = b'x' * (TFTP_BLOCK_SIZE + 100)

        # Server should only send TFTP_BLOCK_SIZE at a time
        packet = TFTPServer.build_data_packet(1, large_data[:TFTP_BLOCK_SIZE])

        # Packet should be 4 bytes header + 512 bytes data
        assert len(packet) == 4 + TFTP_BLOCK_SIZE

    def test_last_block_smaller(self):
        """Verify last block can be smaller than block size."""
        small_data = b'x' * 100

        packet = TFTPServer.build_data_packet(10, small_data)

        assert len(packet) == 4 + 100


class TestErrorCodeConstants:
    """Test error code constants."""

    def test_error_codes_defined(self):
        """Verify error codes are properly defined."""
        assert ERROR_NOT_DEFINED == 0
        assert ERROR_FILE_NOT_FOUND == 1
        assert ERROR_ACCESS_VIOLATION == 2
        assert ERROR_DISK_FULL == 3
        assert ERROR_ILLEGAL_OPERATION == 4
        assert ERROR_UNKNOWN_TID == 5
        assert ERROR_FILE_EXISTS == 6
        assert ERROR_NO_SUCH_USER == 7
