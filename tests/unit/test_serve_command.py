"""
Unit tests for Serve Command

Tests the PixelRTSServer class and serve command functionality.
"""

import pytest
import asyncio
import tempfile
import os
import shutil
from unittest.mock import Mock, patch, AsyncMock, MagicMock
from pathlib import Path

from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder
from systems.pixel_compiler.serve.server import (
    PixelRTSServer,
    NetworkConfig,
    ServerStatus,
    DHCP_PROXY_PORT,
    TFTP_PORT,
    NBD_PORT,
)


class TestServeImport:
    """Test PixelRTSServer can be imported."""

    def test_serve_import(self):
        """Verify PixelRTSServer imports correctly."""
        from systems.pixel_compiler.serve.server import PixelRTSServer
        assert PixelRTSServer is not None

    def test_network_config_import(self):
        """Verify NetworkConfig imports correctly."""
        from systems.pixel_compiler.serve.server import NetworkConfig
        assert NetworkConfig is not None

    def test_server_status_import(self):
        """Verify ServerStatus imports correctly."""
        from systems.pixel_compiler.serve.server import ServerStatus
        assert ServerStatus is not None


class TestPixelRTSServerInit:
    """Test PixelRTSServer initialization."""

    def test_init_with_file(self):
        """Verify initialization with file path."""
        server = PixelRTSServer("/path/to/container.rts.png")
        assert str(server.rts_png_path) == "/path/to/container.rts.png"
        assert server.interface_override is None
        assert server.verbose is False

    def test_init_with_interface(self):
        """Verify initialization with interface override."""
        server = PixelRTSServer("/path/to/container.rts.png", interface="eth0")
        assert server.interface_override == "eth0"

    def test_init_with_verbose(self):
        """Verify initialization with verbose flag."""
        server = PixelRTSServer("/path/to/container.rts.png", verbose=True)
        assert server.verbose is True


class TestNetworkDetection:
    """Test network interface detection."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def _create_rts_file(self, data: bytes, filename: str = "test.rts.png") -> str:
        """Helper to create a .rts.png file with given data."""
        path = os.path.join(self.temp_dir, filename)
        self.encoder.save(data, path, metadata={'type': 'test'})
        return path

    def test_detect_network_auto(self):
        """Test auto-detection of network interface."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path)

        # This should not raise - may return various interfaces
        try:
            config = server.detect_network()
            assert config.interface is not None
            assert config.ip_address is not None
            assert server.network_config is not None
        except RuntimeError as e:
            # Auto-detection may fail in containers without network
            if "Could not auto-detect" in str(e):
                pytest.skip("Network auto-detection not available in this environment")
            raise

    def test_detect_network_with_interface_override(self):
        """Test detection with interface override."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path, interface="lo")

        config = server.detect_network()
        assert config.interface == "lo"
        assert server.network_config is not None


class TestContainerValidation:
    """Test container validation."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def _create_rts_file(self, data: bytes, filename: str = "test.rts.png") -> str:
        """Helper to create a .rts.png file with given data."""
        path = os.path.join(self.temp_dir, filename)
        self.encoder.save(data, path, metadata={'type': 'test'})
        return path

    def test_validate_container_valid(self):
        """Test validation of valid container."""
        test_path = self._create_rts_file(b"Hello, World!")
        server = PixelRTSServer(test_path)

        metadata = server.validate_container()
        assert metadata is not None
        assert 'data_size' in metadata

    def test_validate_container_invalid(self):
        """Test validation of invalid file."""
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

        server = PixelRTSServer(invalid_path)

        with pytest.raises(ValueError, match="Not a valid PixelRTS container"):
            server.validate_container()

    def test_validate_container_missing(self):
        """Test validation of missing file."""
        server = PixelRTSServer("/nonexistent/file.rts.png")

        with pytest.raises(ValueError, match="File not found"):
            server.validate_container()


class TestServerLifecycle:
    """Test server start/stop lifecycle."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def _create_rts_file(self, data: bytes, filename: str = "test.rts.png") -> str:
        """Helper to create a .rts.png file with given data."""
        path = os.path.join(self.temp_dir, filename)
        self.encoder.save(data, path, metadata={'type': 'test'})
        return path

    @pytest.mark.asyncio
    async def test_server_lifecycle(self):
        """Test server start and stop work correctly."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path, interface="lo")

        # Mock the services to avoid port binding issues
        with patch.object(server, '_start_nbd_server', new_callable=AsyncMock):
            # Create mock services
            mock_dhcp = AsyncMock()
            mock_tftp = AsyncMock()

            # Create mock PXEConfig that returns string
            mock_pxe_config = MagicMock()
            mock_pxe_config.generate_default_config.return_value = "DEFAULT linux\nLABEL linux\n    KERNEL vmlinuz\n"

            # Patch the imports in the server module
            with patch('systems.pixel_compiler.serve.dhcp_proxy.ProxyDHCP', return_value=mock_dhcp):
                with patch('systems.pixel_compiler.serve.tftp_server.TFTPServer', return_value=mock_tftp):
                    with patch('systems.pixel_compiler.serve.pxe_config.PXEConfig', return_value=mock_pxe_config):
                        try:
                            await server.start()
                            assert server._running is True
                            assert server.status.dhcp_running is True
                            assert server.status.tftp_running is True
                        except Exception as e:
                            # May fail due to network constraints
                            if "Permission denied" in str(e) or "Address already in use" in str(e):
                                pytest.skip("Network services not available in this environment")
                            raise

                        await server.stop()
                        assert server._running is False

    def test_repr(self):
        """Test string representation."""
        server = PixelRTSServer("/path/to/file.rts.png")
        repr_str = repr(server)
        assert "PixelRTSServer" in repr_str
        assert "stopped" in repr_str


class TestCLIserveCommand:
    """Test CLI serve command."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def _create_rts_file(self, data: bytes, filename: str = "test.rts.png") -> str:
        """Helper to create a .rts.png file with given data."""
        path = os.path.join(self.temp_dir, filename)
        self.encoder.save(data, path, metadata={'type': 'test'})
        return path

    def test_cli_serve_help(self):
        """Test pixelrts serve --help works."""
        import subprocess
        result = subprocess.run(
            ['python3', '-m', 'systems.pixel_compiler.pixelrts_cli', 'serve', '--help'],
            capture_output=True,
            text=True,
            cwd=str(Path(__file__).parent.parent.parent)
        )
        assert result.returncode == 0
        assert 'serve' in result.stdout.lower() or 'network' in result.stdout.lower()
        assert '--interface' in result.stdout or 'INTERFACE' in result.stdout

    def test_cli_serve_invalid_file(self):
        """Test serve command with invalid file exits with code 1."""
        import subprocess
        result = subprocess.run(
            ['python3', '-m', 'systems.pixel_compiler.pixelrts_cli', 'serve', '/nonexistent/file.rts.png'],
            capture_output=True,
            text=True,
            timeout=10,
            cwd=str(Path(__file__).parent.parent.parent)
        )
        # Should exit with error (1 or other non-zero)
        assert result.returncode != 0


class TestBootFiles:
    """Test boot file preparation."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def _create_rts_file(self, data: bytes, filename: str = "test.rts.png") -> str:
        """Helper to create a .rts.png file with given data."""
        path = os.path.join(self.temp_dir, filename)
        self.encoder.save(data, path, metadata={'type': 'test'})
        return path

    def test_prepare_boot_files(self):
        """Test boot file preparation creates TFTP directory."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path, interface="lo")
        server.detect_network()

        tftp_root = server.prepare_boot_files()

        try:
            assert tftp_root is not None
            assert tftp_root.exists()
            assert (tftp_root / "pxelinux.cfg").exists()
            assert (tftp_root / "pxelinux.cfg" / "default").exists()
        finally:
            # Cleanup
            if server._temp_dir and os.path.exists(server._temp_dir):
                shutil.rmtree(server._temp_dir)


class TestNetworkConfig:
    """Test NetworkConfig dataclass."""

    def test_network_config_defaults(self):
        """Test NetworkConfig default values."""
        config = NetworkConfig()
        assert config.interface == ""
        assert config.ip_address == ""
        assert config.subnet == ""
        assert config.gateway == ""

    def test_network_config_repr(self):
        """Test NetworkConfig string representation."""
        config = NetworkConfig(interface="eth0", ip_address="192.168.1.100")
        repr_str = repr(config)
        assert "eth0" in repr_str
        assert "192.168.1.100" in repr_str


class TestServerStatus:
    """Test ServerStatus dataclass."""

    def test_server_status_defaults(self):
        """Test ServerStatus default values."""
        status = ServerStatus()
        assert status.dhcp_running is False
        assert status.tftp_running is False
        assert status.nbd_running is False
        assert status.clients_served == 0
        assert status.bytes_transferred == 0
        assert status.errors == []
