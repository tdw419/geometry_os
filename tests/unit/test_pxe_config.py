"""
Unit tests for PXE Configuration Generator

Tests the PXEConfig class for PXE boot and iPXE chainloading support.
"""

import pytest
import tempfile
from pathlib import Path
from unittest.mock import patch, Mock

from systems.pixel_compiler.serve.pxe_config import PXEConfig


class TestPXEConfigImport:
    """Test PXEConfig can be imported."""

    def test_pxe_config_import(self):
        """Verify PXEConfig imports correctly."""
        from systems.pixel_compiler.serve.pxe_config import PXEConfig
        assert PXEConfig is not None

    def test_pxe_config_instantiation(self):
        """Verify PXEConfig can be instantiated."""
        config = PXEConfig()
        assert config.kernel == PXEConfig.DEFAULT_KERNEL
        assert config.initrd == PXEConfig.DEFAULT_INITRD


class TestPXEConfigDefault:
    """Test PXEConfig default configuration."""

    def test_default_kernel(self):
        """Verify default kernel filename."""
        config = PXEConfig()
        assert config.kernel == "vmlinuz"

    def test_default_initrd(self):
        """Verify default initrd filename."""
        config = PXEConfig()
        assert config.initrd == "initrd.img"

    def test_default_timeout(self):
        """Verify default timeout."""
        config = PXEConfig()
        assert config.timeout == 50

    def test_default_prompt(self):
        """Verify default prompt setting."""
        config = PXEConfig()
        assert config.prompt is False

    def test_custom_kernel(self):
        """Verify custom kernel configuration."""
        config = PXEConfig(kernel="bzImage")
        assert config.kernel == "bzImage"

    def test_custom_initrd(self):
        """Verify custom initrd configuration."""
        config = PXEConfig(initrd="initramfs.img")
        assert config.initrd == "initramfs.img"


class TestDefaultConfigGeneration:
    """Test pxelinux.cfg/default generation."""

    def test_generate_default_config_basic(self):
        """Verify basic pxelinux.cfg/default generation."""
        config = PXEConfig()
        content = config.generate_default_config("192.168.1.100", 10809)

        assert "DEFAULT linux" in content
        assert "TIMEOUT 50" in content
        assert "PROMPT 0" in content
        assert "KERNEL vmlinuz" in content
        assert "initrd=initrd.img" in content
        assert "nbdroot=192.168.1.100:10809" in content
        assert "root=/dev/nbd0" in content

    def test_generate_default_config_custom_label(self):
        """Verify custom label in config."""
        config = PXEConfig()
        content = config.generate_default_config("192.168.1.100", 10809, label="custom")

        assert "DEFAULT custom" in content
        assert "LABEL custom" in content

    def test_generate_default_config_custom_nbd_port(self):
        """Verify custom NBD port in config."""
        config = PXEConfig()
        content = config.generate_default_config("192.168.1.100", 12345)

        assert "nbdroot=192.168.1.100:12345" in content

    def test_generate_default_config_with_extras(self):
        """Verify extra kernel parameters."""
        config = PXEConfig()
        content = config.generate_default_config(
            "192.168.1.100", 10809, cmdline_extras="console=ttyS0"
        )

        assert "console=ttyS0" in content


class TestIPXEChainloadConfig:
    """Test iPXE chainload configuration generation."""

    def test_ipxe_chainload_config_default(self):
        """Verify generate_ipxe_chainload_config returns correct pxelinux format."""
        config = PXEConfig()
        content = config.generate_ipxe_chainload_config("192.168.1.100", 8080, 10809)

        # Check pxelinux format
        assert "DEFAULT ipxe" in content
        assert "LABEL ipxe" in content
        assert "KERNEL undionly.kpxe" in content
        assert "TIMEOUT 50" in content
        assert "PROMPT 0" in content

    def test_ipxe_chainload_config_uses_class_timeout(self):
        """Verify chainload config uses instance timeout."""
        config = PXEConfig(timeout=100)
        content = config.generate_ipxe_chainload_config("192.168.1.100")

        assert "TIMEOUT 100" in content

    def test_ipxe_chainload_config_contains_undi_driver(self):
        """Verify chainload config contains undionly.kpxe."""
        config = PXEConfig()
        content = config.generate_ipxe_chainload_config("192.168.1.100")

        assert "undionly.kpxe" in content


class TestIPXEScriptGeneration:
    """Test iPXE HTTP boot script generation."""

    def test_ipxe_script_generation(self):
        """Verify generate_ipxe_script produces valid iPXE script."""
        config = PXEConfig()
        script = config.generate_ipxe_script("192.168.1.100", 8080, 10809)

        # Check iPXE script format
        assert script.startswith("#!ipxe")
        assert "kernel http://192.168.1.100:8080/vmlinuz" in script
        assert "initrd http://192.168.1.100:8080/initrd.img" in script
        assert "boot" in script

    def test_ipxe_script_http_url_format(self):
        """Verify iPXE script uses HTTP URLs."""
        config = PXEConfig()
        script = config.generate_ipxe_script("192.168.1.100", 8080, 10809)

        # All URLs should be HTTP, not TFTP
        assert "http://192.168.1.100:8080/vmlinuz" in script
        assert "http://192.168.1.100:8080/initrd.img" in script

    def test_ipxe_script_nbdroot_parameter(self):
        """Verify iPXE script contains correct nbdroot parameter."""
        config = PXEConfig()
        script = config.generate_ipxe_script("192.168.1.100", 8080, 10809)

        assert "nbdroot=192.168.1.100:10809" in script
        assert "root=/dev/nbd0" in script

    def test_ipxe_script_custom_http_port(self):
        """Verify iPXE script uses custom HTTP port."""
        config = PXEConfig()
        script = config.generate_ipxe_script("192.168.1.100", 9000, 10809)

        assert "http://192.168.1.100:9000/vmlinuz" in script
        assert "http://192.168.1.100:9000/initrd.img" in script

    def test_ipxe_script_custom_nbd_port(self):
        """Verify iPXE script uses custom NBD port."""
        config = PXEConfig()
        script = config.generate_ipxe_script("192.168.1.100", 8080, 12345)

        assert "nbdroot=192.168.1.100:12345" in script


class TestIPXEScriptCustomURLs:
    """Test iPXE script with custom URLs."""

    def test_ipxe_script_with_custom_kernel_url(self):
        """Verify custom kernel URL is used."""
        config = PXEConfig()
        script = config.generate_ipxe_script(
            "192.168.1.100",
            8080,
            10809,
            kernel_url="http://custom.server/kernel"
        )

        assert "http://custom.server/kernel" in script

    def test_ipxe_script_with_custom_initrd_url(self):
        """Verify custom initrd URL is used."""
        config = PXEConfig()
        script = config.generate_ipxe_script(
            "192.168.1.100",
            8080,
            10809,
            initrd_url="http://custom.server/initrd"
        )

        assert "http://custom.server/initrd" in script

    def test_ipxe_script_with_both_custom_urls(self):
        """Verify both custom URLs are used."""
        config = PXEConfig()
        script = config.generate_ipxe_script(
            "192.168.1.100",
            8080,
            10809,
            kernel_url="http://cdn.example.com/vmlinuz",
            initrd_url="http://cdn.example.com/initrd.img"
        )

        assert "http://cdn.example.com/vmlinuz" in script
        assert "http://cdn.example.com/initrd.img" in script


class TestGetIPXEBootFiles:
    """Test get_ipxe_boot_files method."""

    def test_get_ipxe_boot_files(self):
        """Verify returns list with undionly.kpxe."""
        config = PXEConfig()
        files = config.get_ipxe_boot_files()

        assert isinstance(files, list)
        assert len(files) == 1
        assert "undionly.kpxe" in files

    def test_get_ipxe_boot_files_constant(self):
        """Verify returns IPXE_BOOT_FILE constant."""
        config = PXEConfig()
        files = config.get_ipxe_boot_files()

        assert files[0] == PXEConfig.IPXE_BOOT_FILE


class TestGetIPXEBootFileURL:
    """Test get_ipxe_boot_file_url method."""

    def test_get_ipxe_boot_file_url(self):
        """Verify returns correct CDN URL."""
        url = PXEConfig.get_ipxe_boot_file_url()

        assert url == "https://boot.ipxe.org/undionly.kpxe"

    def test_get_ipxe_boot_file_url_is_classmethod(self):
        """Verify method is classmethod."""
        # Should work on class, not just instance
        url = PXEConfig.get_ipxe_boot_file_url()
        assert "ipxe.org" in url


class TestChainloadFlowIntegration:
    """Test full chainload flow integration."""

    def test_chainload_flow_integration(self):
        """Simulate full chain: pxelinux.cfg -> iPXE -> HTTP boot script."""
        config = PXEConfig()
        server_ip = "192.168.1.100"
        http_port = 8080
        nbd_port = 10809

        # Step 1: Generate pxelinux.cfg for iPXE chainload
        pxelinux_cfg = config.generate_ipxe_chainload_config(server_ip, http_port, nbd_port)
        assert "DEFAULT ipxe" in pxelinux_cfg
        assert "KERNEL undionly.kpxe" in pxelinux_cfg

        # Step 2: Generate iPXE script for HTTP boot
        ipxe_script = config.generate_ipxe_script(server_ip, http_port, nbd_port)
        assert "#!ipxe" in ipxe_script
        assert f"http://{server_ip}:{http_port}/vmlinuz" in ipxe_script
        assert f"nbdroot={server_ip}:{nbd_port}" in ipxe_script

    def test_chainload_flow_consistent_urls(self):
        """Verify all URLs are consistent across chainload flow."""
        config = PXEConfig()
        server_ip = "10.0.0.50"
        http_port = 9000
        nbd_port = 12345

        # Generate both configs
        pxelinux_cfg = config.generate_ipxe_chainload_config(server_ip, http_port, nbd_port)
        ipxe_script = config.generate_ipxe_script(server_ip, http_port, nbd_port)

        # iPXE script should reference same server
        assert f"http://{server_ip}:{http_port}" in ipxe_script
        assert f"nbdroot={server_ip}:{nbd_port}" in ipxe_script


class TestEnsureIPXEBootFiles:
    """Test ensure_ipxe_boot_files method."""

    def test_ensure_ipxe_boot_files_existing(self):
        """Verify no download when file already exists."""
        with tempfile.TemporaryDirectory() as tmpdir:
            tftp_root = Path(tmpdir)

            # Create existing undionly.kpxe
            ipxe_file = tftp_root / "undionly.kpxe"
            ipxe_file.write_bytes(b"fake ipxe binary")

            result = PXEConfig.ensure_ipxe_boot_files(tftp_root)

            assert result is True
            # File should still exist
            assert ipxe_file.exists()

    def test_ensure_ipxe_boot_files_downloads(self):
        """Verify download is attempted when file is missing."""
        with tempfile.TemporaryDirectory() as tmpdir:
            tftp_root = Path(tmpdir)

            # Mock urlretrieve to simulate successful download
            with patch('urllib.request.urlretrieve') as mock_retrieve:
                mock_retrieve.return_value = None  # Simulate success

                result = PXEConfig.ensure_ipxe_boot_files(tftp_root)

                # Should have tried to download
                assert mock_retrieve.called
                # URL should be correct
                call_args = mock_retrieve.call_args
                assert "boot.ipxe.org" in call_args[0][0]

    def test_ensure_ipxe_boot_files_download_fails(self):
        """Verify returns False when download fails."""
        with tempfile.TemporaryDirectory() as tmpdir:
            tftp_root = Path(tmpdir)

            # Mock urlretrieve to raise exception
            with patch('urllib.request.urlretrieve') as mock_retrieve:
                mock_retrieve.side_effect = Exception("Network error")

                result = PXEConfig.ensure_ipxe_boot_files(tftp_root)

                assert result is False

    def test_ensure_ipxe_boot_files_creates_directory(self):
        """Verify TFTP root directory is created if missing."""
        with tempfile.TemporaryDirectory() as tmpdir:
            tftp_root = Path(tmpdir) / "subdir" / "tftp"

            # Mock successful download
            with patch('urllib.request.urlretrieve') as mock_retrieve:
                mock_retrieve.return_value = None

                PXEConfig.ensure_ipxe_boot_files(tftp_root)

                # Directory should be created
                assert tftp_root.exists()


class TestWriteConfig:
    """Test write_config method."""

    def test_write_config_creates_directory(self):
        """Verify write_config creates output directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            output_dir = Path(tmpdir) / "pxelinux.cfg"

            config = PXEConfig()
            config_path = config.write_config(str(output_dir), "test content")

            assert output_dir.exists()
            assert config_path.exists()

    def test_write_config_content(self):
        """Verify write_config writes correct content."""
        with tempfile.TemporaryDirectory() as tmpdir:
            output_dir = Path(tmpdir)

            config = PXEConfig()
            content = "DEFAULT test\nTIMEOUT 50"
            config_path = config.write_config(str(output_dir), content)

            assert config_path.read_text() == content

    def test_write_config_custom_filename(self):
        """Verify write_config uses custom filename."""
        with tempfile.TemporaryDirectory() as tmpdir:
            output_dir = Path(tmpdir)

            config = PXEConfig()
            config_path = config.write_config(str(output_dir), "content", filename="custom.cfg")

            assert config_path.name == "custom.cfg"


class TestGetRequiredBootFiles:
    """Test get_required_boot_files method."""

    def test_get_required_boot_files_basic(self):
        """Verify basic required files list."""
        config = PXEConfig()
        files = config.get_required_boot_files()

        assert "pxelinux.0" in files
        assert "ldlinux.c32" in files

    def test_get_required_boot_files_with_optional(self):
        """Verify optional files are included when requested."""
        config = PXEConfig()
        files = config.get_required_boot_files(include_optional=True)

        assert "pxelinux.0" in files
        assert "ldlinux.c32" in files
        assert "vesamenu.c32" in files
        assert "libcom32.c32" in files
        assert "libutil.c32" in files


class TestClientConfigFilename:
    """Test get_client_config_filename method."""

    def test_client_config_filename_colon_format(self):
        """Verify MAC with colons is converted correctly."""
        filename = PXEConfig.get_client_config_filename("88:99:aa:bb:cc:dd")

        assert filename == "01-88-99-aa-bb-cc-dd"

    def test_client_config_filename_dash_format(self):
        """Verify MAC with dashes is converted correctly."""
        filename = PXEConfig.get_client_config_filename("88-99-aa-bb-cc-dd")

        assert filename == "01-88-99-aa-bb-cc-dd"

    def test_client_config_filename_uppercase(self):
        """Verify uppercase MAC is normalized to lowercase."""
        filename = PXEConfig.get_client_config_filename("88:99:AA:BB:CC:DD")

        assert filename == "01-88-99-aa-bb-cc-dd"


class TestRepr:
    """Test __repr__ method."""

    def test_repr(self):
        """Verify string representation."""
        config = PXEConfig(kernel="vmlinuz", initrd="initrd.img")
        repr_str = repr(config)

        assert "PXEConfig" in repr_str
        assert "vmlinuz" in repr_str
        assert "initrd.img" in repr_str


class TestIPXEConstants:
    """Test iPXE class constants."""

    def test_ipxe_boot_file_constant(self):
        """Verify IPXE_BOOT_FILE constant."""
        assert PXEConfig.IPXE_BOOT_FILE == "undionly.kpxe"

    def test_ipxe_download_url_constant(self):
        """Verify IPXE_DOWNLOAD_URL constant."""
        assert PXEConfig.IPXE_DOWNLOAD_URL == "https://boot.ipxe.org/undionly.kpxe"
