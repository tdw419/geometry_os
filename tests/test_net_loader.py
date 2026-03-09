"""
Tests for remote hypervisor network loader.

Task 3: Create Rust Net Loader
Phase 8: Network Boot
"""

import pytest
import subprocess
import os


class TestNetLoaderBuild:
    """Tests for net_loader Rust module."""

    def test_net_loader_crate_exists(self):
        """Test that hypervisor crate exists."""
        cargo_path = "systems/hypervisor/Cargo.toml"
        assert os.path.exists(cargo_path), f"Missing Cargo.toml at {cargo_path}"

    def test_net_loader_compiles(self):
        """Test that net_loader compiles without errors."""
        result = subprocess.run(
            ["cargo", "check", "--package", "geometry-hypervisor"],
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os/systems/hypervisor",
            capture_output=True,
            text=True
        )
        assert result.returncode == 0, f"Cargo check failed: {result.stderr}"


class TestBootFrameRust:
    """Tests for BootFrame Rust implementation."""

    def test_boot_frame_module_exists(self):
        """Test that boot_frame.rs exists."""
        path = "systems/hypervisor/src/boot_frame.rs"
        assert os.path.exists(path), f"Missing {path}"

    def test_boot_frame_has_struct(self):
        """Test that BootFrame struct is defined."""
        with open("systems/hypervisor/src/boot_frame.rs") as f:
            content = f.read()

        assert "struct BootFrame" in content or "pub struct BootFrame" in content
        assert "sequence" in content
        assert "chunk_data" in content
        assert "checksum" in content

    def test_boot_frame_has_validate_checksum(self):
        """Test that BootFrame has validate_checksum method."""
        with open("systems/hypervisor/src/boot_frame.rs") as f:
            content = f.read()

        assert "validate_checksum" in content


class TestNetLoaderFunction:
    """Tests for net_loader functionality."""

    def test_net_loader_module_exists(self):
        """Test that net_loader.rs exists."""
        path = "systems/hypervisor/src/net_loader.rs"
        assert os.path.exists(path), f"Missing {path}"

    def test_net_loader_has_connect_function(self):
        """Test that net_loader has connect function."""
        with open("systems/hypervisor/src/net_loader.rs") as f:
            content = f.read()

        assert "fn connect" in content or "async fn connect" in content

    def test_net_loader_has_struct(self):
        """Test that NetLoader struct is defined."""
        with open("systems/hypervisor/src/net_loader.rs") as f:
            content = f.read()

        assert "struct NetLoader" in content or "pub struct NetLoader" in content


class TestDependencies:
    """Tests for Cargo.toml dependencies."""

    def test_sha2_dependency(self):
        """Test that sha2 dependency is added."""
        with open("systems/hypervisor/Cargo.toml") as f:
            content = f.read()
        assert "sha2" in content

    def test_hex_dependency(self):
        """Test that hex dependency is added."""
        with open("systems/hypervisor/Cargo.toml") as f:
            content = f.read()
        assert "hex" in content


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
