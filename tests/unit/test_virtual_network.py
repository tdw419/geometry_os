"""
Unit tests for VirtualNetwork class.

Tests QEMU socket netdev configuration for inter-container communication
without root privileges.
"""

import pytest
from systems.pixel_compiler.boot.virtual_network import (
    VirtualNetwork,
    VirtualNetworkConfig,
    NetworkSetupError,
)


class TestVirtualNetworkConfig:
    """Tests for VirtualNetworkConfig dataclass."""

    def test_default_config(self):
        """Default configuration uses standard multicast address and port."""
        config = VirtualNetworkConfig()

        assert config.mcast_addr == "230.0.0.1"
        assert config.mcast_port == 1234
        assert config.enabled is True

    def test_custom_config(self):
        """Custom address and port work correctly."""
        config = VirtualNetworkConfig(
            mcast_addr="239.0.0.1",
            mcast_port=5678,
            enabled=False
        )

        assert config.mcast_addr == "239.0.0.1"
        assert config.mcast_port == 5678
        assert config.enabled is False


class TestVirtualNetwork:
    """Tests for VirtualNetwork class."""

    def test_build_netdev_args_returns_list(self):
        """build_netdev_args returns a list of strings."""
        vn = VirtualNetwork()
        args = vn.build_netdev_args()

        assert isinstance(args, list)
        assert all(isinstance(arg, str) for arg in args)

    def test_build_netdev_args_contains_netdev(self):
        """Arguments contain -netdev flag."""
        vn = VirtualNetwork()
        args = vn.build_netdev_args()

        assert "-netdev" in args

    def test_build_netdev_args_contains_socket(self):
        """Arguments contain socket type."""
        vn = VirtualNetwork()
        args = vn.build_netdev_args()

        # Find the netdev argument
        netdev_idx = args.index("-netdev")
        netdev_value = args[netdev_idx + 1]

        assert "socket" in netdev_value

    def test_build_netdev_args_contains_mcast(self):
        """Arguments contain multicast specification."""
        vn = VirtualNetwork()
        args = vn.build_netdev_args()

        # Find the netdev argument
        netdev_idx = args.index("-netdev")
        netdev_value = args[netdev_idx + 1]

        assert "mcast=230.0.0.1:1234" in netdev_value

    def test_build_netdev_args_contains_device(self):
        """Arguments contain -device flag."""
        vn = VirtualNetwork()
        args = vn.build_netdev_args()

        assert "-device" in args

    def test_build_netdev_args_contains_virtio_net(self):
        """Arguments contain virtio-net-pci device."""
        vn = VirtualNetwork()
        args = vn.build_netdev_args()

        # Find the device argument
        device_idx = args.index("-device")
        device_value = args[device_idx + 1]

        assert "virtio-net-pci" in device_value

    def test_build_netdev_args_with_custom_id(self):
        """Custom device_id appears in arguments."""
        vn = VirtualNetwork()
        args = vn.build_netdev_args("custom_net")

        # Check netdev has custom ID
        netdev_idx = args.index("-netdev")
        netdev_value = args[netdev_idx + 1]
        assert "id=custom_net" in netdev_value

        # Check device references custom ID
        device_idx = args.index("-device")
        device_value = args[device_idx + 1]
        assert "netdev=custom_net" in device_value

    def test_build_netdev_args_custom_mcast(self):
        """Custom multicast address and port appear in arguments."""
        config = VirtualNetworkConfig(mcast_addr="239.1.2.3", mcast_port=9999)
        vn = VirtualNetwork(config)
        args = vn.build_netdev_args()

        netdev_idx = args.index("-netdev")
        netdev_value = args[netdev_idx + 1]

        assert "mcast=239.1.2.3:9999" in netdev_value

    def test_is_available_returns_true(self):
        """Socket networking is always available without root."""
        vn = VirtualNetwork()

        assert vn.is_available() is True

    def test_get_network_info_returns_dict(self):
        """get_network_info returns configuration as dictionary."""
        config = VirtualNetworkConfig(mcast_addr="230.0.0.1", mcast_port=1234)
        vn = VirtualNetwork(config)
        info = vn.get_network_info()

        assert isinstance(info, dict)
        assert info["mcast_addr"] == "230.0.0.1"
        assert info["mcast_port"] == 1234
        assert info["enabled"] is True

    def test_disabled_network_returns_empty_args(self):
        """When enabled=False, build_netdev_args returns empty list."""
        config = VirtualNetworkConfig(enabled=False)
        vn = VirtualNetwork(config)
        args = vn.build_netdev_args()

        assert args == []

    def test_default_config_used_when_none_provided(self):
        """VirtualNetwork uses default config when none provided."""
        vn = VirtualNetwork()

        assert vn.config.mcast_addr == "230.0.0.1"
        assert vn.config.mcast_port == 1234
        assert vn.config.enabled is True

    def test_args_structure_correct_order(self):
        """Arguments are in correct order: -netdev value -device value."""
        vn = VirtualNetwork()
        args = vn.build_netdev_args("net0")

        assert args[0] == "-netdev"
        assert "socket,id=net0,mcast=" in args[1]
        assert args[2] == "-device"
        assert "virtio-net-pci,netdev=net0" in args[3]


class TestNetworkSetupError:
    """Tests for NetworkSetupError exception."""

    def test_exception_is_raised(self):
        """NetworkSetupError can be raised and caught."""
        with pytest.raises(NetworkSetupError):
            raise NetworkSetupError("Test error")

    def test_exception_message(self):
        """NetworkSetupError preserves error message."""
        try:
            raise NetworkSetupError("Network setup failed")
        except NetworkSetupError as e:
            assert "Network setup failed" in str(e)

    def test_exception_inheritance(self):
        """NetworkSetupError inherits from Exception."""
        assert issubclass(NetworkSetupError, Exception)
