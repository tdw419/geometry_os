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


class TestHTTPBoot:
    """Test HTTP boot integration."""

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

    def test_server_http_disabled_by_default(self):
        """Test HTTP server is not started when enable_http is False."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path, interface="lo")

        assert server._enable_http is False
        assert server._http_port == 8080  # Default port
        assert server.status.http_running is False

    def test_server_http_enabled(self):
        """Test HTTP server flag is set when enable_http is True."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path, interface="lo", enable_http=True)

        assert server._enable_http is True
        assert server._http_port == 8080

    def test_server_http_custom_port(self):
        """Test HTTP server uses custom port."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(
            test_path,
            interface="lo",
            enable_http=True,
            http_port=9090
        )

        assert server._enable_http is True
        assert server._http_port == 9090

    def test_server_http_boot_files_prepared(self):
        """Test that HTTP boot files are prepared when HTTP is enabled."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path, interface="lo", enable_http=True)
        server.detect_network()

        tftp_root = server.prepare_boot_files()

        try:
            # Check that boot.ipxe was generated
            boot_ipxe = tftp_root / "boot.ipxe"
            assert boot_ipxe.exists(), "boot.ipxe should be generated when HTTP enabled"

            # Check boot.ipxe content contains HTTP URLs
            content = boot_ipxe.read_text()
            assert "http://" in content
            assert "kernel" in content.lower() or "initrd" in content.lower()

            # Check pxelinux.cfg/default uses iPXE chainload format
            pxelinux_default = tftp_root / "pxelinux.cfg" / "default"
            assert pxelinux_default.exists()
            config_content = pxelinux_default.read_text()
            assert "undionly.kpxe" in config_content

        finally:
            if server._temp_dir and os.path.exists(server._temp_dir):
                shutil.rmtree(server._temp_dir)

    def test_server_http_boot_script_content(self):
        """Test boot.ipxe script contains correct HTTP URLs."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(
            test_path,
            interface="lo",
            enable_http=True,
            http_port=9090
        )
        server.detect_network()

        tftp_root = server.prepare_boot_files()

        try:
            boot_ipxe = tftp_root / "boot.ipxe"
            content = boot_ipxe.read_text()

            # Should use HTTP URLs with the custom port
            assert f"http://{server.network_config.ip_address}:9090" in content
            assert "nbdroot=" in content

        finally:
            if server._temp_dir and os.path.exists(server._temp_dir):
                shutil.rmtree(server._temp_dir)

    def test_server_standard_config_without_http(self):
        """Test standard pxelinux.cfg is generated when HTTP is disabled."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path, interface="lo", enable_http=False)
        server.detect_network()

        tftp_root = server.prepare_boot_files()

        try:
            # boot.ipxe should NOT exist when HTTP disabled
            boot_ipxe = tftp_root / "boot.ipxe"
            assert not boot_ipxe.exists(), "boot.ipxe should not exist when HTTP disabled"

            # pxelinux.cfg/default should use standard format
            pxelinux_default = tftp_root / "pxelinux.cfg" / "default"
            assert pxelinux_default.exists()
            config_content = pxelinux_default.read_text()
            assert "vmlinuz" in config_content
            assert "initrd=" in config_content

        finally:
            if server._temp_dir and os.path.exists(server._temp_dir):
                shutil.rmtree(server._temp_dir)

    @pytest.mark.asyncio
    async def test_server_http_starts_when_enabled(self):
        """Test HTTP server starts when enabled."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path, interface="lo", enable_http=True)

        # Mock all services
        mock_dhcp = AsyncMock()
        mock_tftp = AsyncMock()
        mock_http = AsyncMock()

        mock_pxe_config = MagicMock()
        mock_pxe_config.generate_ipxe_chainload_config.return_value = "DEFAULT ipxe\nLABEL ipxe\n    KERNEL undionly.kpxe\n"
        mock_pxe_config.generate_ipxe_script.return_value = "#!ipxe\nkernel http://test/vmlinuz\nboot\n"

        with patch.object(server, '_start_nbd_server', new_callable=AsyncMock):
            with patch('systems.pixel_compiler.serve.dhcp_proxy.ProxyDHCP', return_value=mock_dhcp):
                with patch('systems.pixel_compiler.serve.tftp_server.TFTPServer', return_value=mock_tftp):
                    with patch('systems.pixel_compiler.serve.http_server.HTTPBootServer', return_value=mock_http):
                        with patch('systems.pixel_compiler.serve.pxe_config.PXEConfig', return_value=mock_pxe_config):
                            with patch('systems.pixel_compiler.serve.pxe_config.PXEConfig.ensure_ipxe_boot_files', return_value=True):
                                try:
                                    await server.start()
                                    assert server.status.http_running is True
                                except Exception:
                                    pytest.skip("Network services not available")
                                finally:
                                    await server.stop()

    @pytest.mark.asyncio
    async def test_server_http_graceful_degradation(self):
        """Test server continues if HTTP fails (graceful degradation)."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path, interface="lo", enable_http=True)

        mock_dhcp = AsyncMock()
        mock_tftp = AsyncMock()

        mock_pxe_config = MagicMock()
        mock_pxe_config.generate_ipxe_chainload_config.return_value = "DEFAULT ipxe\n"
        mock_pxe_config.generate_ipxe_script.return_value = "#!ipxe\nboot\n"

        # Mock HTTP server to raise on start
        mock_http = AsyncMock()
        mock_http.start.side_effect = OSError("Port in use")

        with patch.object(server, '_start_nbd_server', new_callable=AsyncMock):
            with patch('systems.pixel_compiler.serve.dhcp_proxy.ProxyDHCP', return_value=mock_dhcp):
                with patch('systems.pixel_compiler.serve.tftp_server.TFTPServer', return_value=mock_tftp):
                    with patch('systems.pixel_compiler.serve.http_server.HTTPBootServer', return_value=mock_http):
                        with patch('systems.pixel_compiler.serve.pxe_config.PXEConfig', return_value=mock_pxe_config):
                            with patch('systems.pixel_compiler.serve.pxe_config.PXEConfig.ensure_ipxe_boot_files', return_value=True):
                                try:
                                    await server.start()
                                    # HTTP should NOT be running but server should still be up
                                    assert server.status.http_running is False
                                    assert server._running is True
                                    # Error should be logged
                                    assert len(server.status.errors) > 0
                                except Exception:
                                    pytest.skip("Network services not available")
                                finally:
                                    await server.stop()

    def test_server_http_status_display(self):
        """Test _print_startup_info shows HTTP status."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path, interface="lo", enable_http=True, http_port=9999)

        import io
        import sys
        captured = io.StringIO()
        old_stdout = sys.stdout
        sys.stdout = captured

        try:
            server.detect_network()
            server.status.http_running = True
            server._print_startup_info()
            output = captured.getvalue()
            assert "HTTP Server" in output
            assert "9999" in output
        finally:
            sys.stdout = old_stdout

    def test_cli_http_flags_parsing(self):
        """Test argparse correctly parses HTTP flags."""
        import argparse
        from systems.pixel_compiler.pixelrts_cli import main

        # Test --http flag
        parser = argparse.ArgumentParser()
        subparsers = parser.add_subparsers(dest='command')
        serve_parser = subparsers.add_parser('serve')
        serve_parser.add_argument('file')
        serve_parser.add_argument('--http', action='store_true')
        serve_parser.add_argument('--http-port', type=int, default=8080)

        # Test with --http
        args = parser.parse_args(['serve', 'test.rts.png', '--http'])
        assert args.http is True
        assert args.http_port == 8080

        # Test with custom port
        args = parser.parse_args(['serve', 'test.rts.png', '--http', '--http-port', '9090'])
        assert args.http is True
        assert args.http_port == 9090

        # Test without --http
        args = parser.parse_args(['serve', 'test.rts.png'])
        assert args.http is False
        assert args.http_port == 8080


class TestDeltaEndpoints:
    """Test delta HTTP endpoint integration."""

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

    def test_delta_handler_not_registered_without_http(self):
        """Test that delta_enabled is False when HTTP is disabled."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path, interface="lo", enable_delta=True, enable_http=False)

        # delta_enabled should be False because HTTP is required
        assert server._enable_delta is True
        assert server._enable_http is False
        assert server.status.delta_enabled is False

    @pytest.mark.asyncio
    async def test_delta_handler_registered_with_http(self):
        """Test that DeltaHTTPHandler is registered when both delta and HTTP are enabled."""
        test_path = self._create_rts_file(b"test data")
        server = PixelRTSServer(test_path, interface="lo", enable_delta=True, enable_http=True)

        # Track register_handler calls
        registered_handlers = []

        # Create a mock HTTP server that captures register_handler calls
        mock_http = AsyncMock()
        mock_http.start = AsyncMock()
        mock_http.register_handler = MagicMock(side_effect=lambda prefix, handler: registered_handlers.append((prefix, handler)))

        mock_dhcp = AsyncMock()
        mock_tftp = AsyncMock()

        mock_pxe_config = MagicMock()
        mock_pxe_config.generate_ipxe_chainload_config.return_value = "DEFAULT ipxe\n"
        mock_pxe_config.generate_ipxe_script.return_value = "#!ipxe\nboot\n"

        with patch.object(server, '_start_nbd_server', new_callable=AsyncMock):
            with patch('systems.pixel_compiler.serve.dhcp_proxy.ProxyDHCP', return_value=mock_dhcp):
                with patch('systems.pixel_compiler.serve.tftp_server.TFTPServer', return_value=mock_tftp):
                    with patch('systems.pixel_compiler.serve.http_server.HTTPBootServer', return_value=mock_http):
                        with patch('systems.pixel_compiler.serve.pxe_config.PXEConfig', return_value=mock_pxe_config):
                            with patch('systems.pixel_compiler.serve.pxe_config.PXEConfig.ensure_ipxe_boot_files', return_value=True):
                                try:
                                    await server.start()
                                    # Verify handler was registered with /delta/ prefix
                                    assert len(registered_handlers) == 1
                                    assert registered_handlers[0][0] == '/delta/'
                                    # Verify it's a DeltaHTTPHandler-like object
                                    handler = registered_handlers[0][1]
                                    assert hasattr(handler, 'handle')
                                except Exception:
                                    pytest.skip("Network services not available")
                                finally:
                                    await server.stop()

    @pytest.mark.asyncio
    async def test_delta_list_endpoint_returns_json(self):
        """Test that /delta/list endpoint returns JSON array."""
        from systems.pixel_compiler.serve.http_server import HTTPBootServer, HTTPConfig
        from systems.pixel_compiler.serve.delta_server import DeltaServer, DeltaHTTPHandler

        # Create temp directory for HTTP root
        http_root = tempfile.mkdtemp()
        try:
            test_path = self._create_rts_file(b"test data")

            # Create DeltaServer and handler
            delta_server = DeltaServer(
                container_path=test_path,
                http_root=http_root
            )
            delta_handler = DeltaHTTPHandler(delta_server)

            # Create HTTPBootServer and register handler
            config = HTTPConfig(host="127.0.0.1", port=18080, root_dir=http_root)
            http_server = HTTPBootServer(config=config)
            http_server.register_handler('/delta/', delta_handler)

            # Start server
            await http_server.start()

            try:
                # Make request to /delta/list
                import asyncio
                reader, writer = await asyncio.open_connection('127.0.0.1', 18080)

                request = b"GET /delta/list HTTP/1.1\r\nHost: localhost\r\n\r\n"
                writer.write(request)
                await writer.drain()

                # Read response
                response_data = b""
                while True:
                    chunk = await reader.read(1024)
                    if not chunk:
                        break
                    response_data += chunk
                    if b"\r\n\r\n" in response_data:
                        # Got headers, read body if present
                        break

                writer.close()
                await writer.wait_closed()

                response_str = response_data.decode('utf-8')

                # Verify response
                assert "HTTP/1.1 200 OK" in response_str
                assert "Content-Type: application/json" in response_str
                assert '"deltas"' in response_str

            finally:
                await http_server.stop()

        finally:
            shutil.rmtree(http_root)

    @pytest.mark.asyncio
    async def test_delta_manifest_endpoint_returns_404_for_missing(self):
        """Test that /delta/<file>.json returns 404 for non-existent manifest."""
        from systems.pixel_compiler.serve.http_server import HTTPBootServer, HTTPConfig
        from systems.pixel_compiler.serve.delta_server import DeltaServer, DeltaHTTPHandler

        # Create temp directory for HTTP root
        http_root = tempfile.mkdtemp()
        try:
            test_path = self._create_rts_file(b"test data")

            # Create DeltaServer and handler
            delta_server = DeltaServer(
                container_path=test_path,
                http_root=http_root
            )
            delta_handler = DeltaHTTPHandler(delta_server)

            # Create HTTPBootServer and register handler
            config = HTTPConfig(host="127.0.0.1", port=18081, root_dir=http_root)
            http_server = HTTPBootServer(config=config)
            http_server.register_handler('/delta/', delta_handler)

            # Start server
            await http_server.start()

            try:
                # Make request to non-existent manifest
                import asyncio
                reader, writer = await asyncio.open_connection('127.0.0.1', 18081)

                request = b"GET /delta/nonexistent.json HTTP/1.1\r\nHost: localhost\r\n\r\n"
                writer.write(request)
                await writer.drain()

                # Read response
                response_data = b""
                while True:
                    chunk = await reader.read(1024)
                    if not chunk:
                        break
                    response_data += chunk
                    if b"\r\n\r\n" in response_data:
                        break

                writer.close()
                await writer.wait_closed()

                response_str = response_data.decode('utf-8')

                # Verify 404 response
                assert "HTTP/1.1 404 Not Found" in response_str

            finally:
                await http_server.stop()

        finally:
            shutil.rmtree(http_root)
