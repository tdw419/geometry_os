"""
Unit tests for DHCP Proxy Server

Tests the ProxyDHCP class for PXE boot support.
"""

import struct

from systems.pixel_compiler.serve.dhcp_proxy import (
    DHCP_DISCOVER,
    DHCP_MAGIC_COOKIE,
    DHCP_OFFER,
    OPTION_MESSAGE_TYPE,
    OPTION_SERVER_ID,
    OPTION_VENDOR_CLASS,
    PROXY_DHCP_PORT,
    PXE_CLIENT_ID,
    DHCPConfig,
    DHCPPacket,
    ProxyDHCP,
)


class TestProxyDHCPImport:
    """Test ProxyDHCP can be imported."""

    def test_proxy_dhcp_import(self):
        """Verify ProxyDHCP imports correctly."""
        from systems.pixel_compiler.serve.dhcp_proxy import ProxyDHCP
        assert ProxyDHCP is not None

    def test_dhcp_config_import(self):
        """Verify DHCPConfig imports correctly."""
        from systems.pixel_compiler.serve.dhcp_proxy import DHCPConfig
        assert DHCPConfig is not None

    def test_dhcp_packet_import(self):
        """Verify DHCPPacket imports correctly."""
        from systems.pixel_compiler.serve.dhcp_proxy import DHCPPacket
        assert DHCPPacket is not None


class TestProxyDHCPConfig:
    """Test ProxyDHCP configuration."""

    def test_proxy_dhcp_config_default(self):
        """Verify default configuration."""
        proxy = ProxyDHCP()
        assert proxy.config is not None
        assert proxy.config.listen_port == PROXY_DHCP_PORT
        assert proxy.config.boot_file == "pxelinux.0"

    def test_proxy_dhcp_config_custom(self):
        """Verify custom configuration."""
        config = DHCPConfig(
            boot_file="lpxelinux.0",
            server_ip="192.168.1.100",
            tftp_server="192.168.1.100"
        )
        proxy = ProxyDHCP(config=config)
        assert proxy.config.boot_file == "lpxelinux.0"
        assert proxy.config.server_ip == "192.168.1.100"

    def test_set_config(self):
        """Verify set_config updates boot parameters."""
        proxy = ProxyDHCP()
        proxy.set_config(boot_file="test.0", tftp_ip="10.0.0.1")
        assert proxy.config.boot_file == "test.0"
        assert proxy.config.tftp_server == "10.0.0.1"

    def test_set_config_no_tftp_ip(self):
        """Verify set_config preserves existing tftp_server when not provided."""
        proxy = ProxyDHCP()
        proxy.config.tftp_server = "192.168.1.50"
        proxy.set_config(boot_file="test.0")
        assert proxy.config.tftp_server == "192.168.1.50"


class TestDHCPPacketParsing:
    """Test DHCP packet parsing."""

    def test_parse_dhcp_discover(self):
        """Verify DHCPDISCOVER packet parsing."""
        proxy = ProxyDHCP()

        # Build a minimal DHCPDISCOVER packet
        packet_data = self._build_discover_packet()

        packet = proxy.parse_dhcp_packet(packet_data)

        assert packet.message_type == DHCP_DISCOVER
        assert len(packet.xid) == 4
        assert len(packet.client_mac) == 6
        assert packet.is_pxe_client is True

    def test_parse_non_pxe_packet(self):
        """Verify non-PXE packet is detected."""
        proxy = ProxyDHCP()

        # Build DHCPDISCOVER without PXE vendor class
        packet_data = self._build_discover_packet(with_pxe=False)

        packet = proxy.parse_dhcp_packet(packet_data)

        assert packet.message_type == DHCP_DISCOVER
        assert packet.is_pxe_client is False

    def test_parse_options(self):
        """Verify DHCP options parsing."""
        proxy = ProxyDHCP()

        packet_data = self._build_discover_packet()
        packet = proxy.parse_dhcp_packet(packet_data)

        assert OPTION_MESSAGE_TYPE in packet.options
        assert OPTION_VENDOR_CLASS in packet.options
        assert packet.options[OPTION_MESSAGE_TYPE][0] == DHCP_DISCOVER

    def _build_discover_packet(self, with_pxe: bool = True) -> bytes:
        """Build a test DHCPDISCOVER packet."""
        # Fixed header
        data = struct.pack('!BBBB', 1, 1, 6, 0)  # op, htype, hlen, hops
        data += b'\x12\x34\x56\x78'  # xid (transaction ID)
        data += struct.pack('!HH', 0, 0)  # secs, flags
        data += b'\x00\x00\x00\x00'  # ciaddr
        data += b'\x00\x00\x00\x00'  # yiaddr
        data += b'\x00\x00\x00\x00'  # siaddr
        data += b'\x00\x00\x00\x00'  # giaddr
        data += b'\xaa\xbb\xcc\xdd\xee\xff' + b'\x00' * 10  # chaddr (MAC)
        data += b'\x00' * 64  # sname
        data += b'\x00' * 128  # file
        data += DHCP_MAGIC_COOKIE  # magic cookie

        # Options
        # Option 53: Message Type = DHCPDISCOVER
        data += bytes([OPTION_MESSAGE_TYPE, 1, DHCP_DISCOVER])

        # Option 60: Vendor Class (PXEClient)
        if with_pxe:
            data += bytes([OPTION_VENDOR_CLASS, len(PXE_CLIENT_ID)]) + PXE_CLIENT_ID

        # End option
        data += b'\xff'

        return data


class TestDHCPOfferBuilding:
    """Test DHCPOFFER packet building."""

    def test_build_dhcp_offer(self):
        """Verify DHCPOFFER packet building."""
        proxy = ProxyDHCP()
        proxy.config.server_ip = "192.168.1.100"
        proxy.config.boot_file = "pxelinux.0"

        client_mac = b'\xaa\xbb\xcc\xdd\xee\xff'
        xid = b'\x12\x34\x56\x78'

        offer = proxy.build_dhcp_offer(client_mac, xid)

        # Check minimum length
        assert len(offer) >= 240

        # Check it's a BOOTREPLY (op=2)
        assert offer[0] == 2

        # Check transaction ID matches
        assert offer[4:8] == xid

        # Check client MAC is in chaddr field
        assert offer[28:34] == client_mac

        # Check magic cookie
        assert offer[236:240] == DHCP_MAGIC_COOKIE

    def test_build_dhcp_offer_contains_server_ip(self):
        """Verify DHCPOFFER contains server IP."""
        proxy = ProxyDHCP()
        proxy.config.server_ip = "192.168.1.100"

        offer = proxy.build_dhcp_offer(b'\xaa\xbb\xcc\xdd\xee\xff', b'\x12\x34\x56\x78')

        # Parse server IP from siaddr field (bytes 20-24)
        server_ip_bytes = offer[20:24]
        server_ip = '.'.join(str(b) for b in server_ip_bytes)
        assert server_ip == "192.168.1.100"

    def test_build_dhcp_offer_contains_boot_file(self):
        """Verify DHCPOFFER contains boot filename."""
        proxy = ProxyDHCP()
        proxy.config.boot_file = "pxelinux.0"

        offer = proxy.build_dhcp_offer(b'\xaa\xbb\xcc\xdd\xee\xff', b'\x12\x34\x56\x78')

        # Boot file is at bytes 108-235 (128 bytes)
        boot_file_field = offer[108:236]
        boot_file = boot_file_field.split(b'\x00')[0].decode('ascii')
        assert boot_file == "pxelinux.0"

    def test_build_dhcp_offer_contains_options(self):
        """Verify DHCPOFFER contains required options."""
        proxy = ProxyDHCP()
        proxy.config.server_ip = "192.168.1.100"

        offer = proxy.build_dhcp_offer(b'\xaa\xbb\xcc\xdd\xee\xff', b'\x12\x34\x56\x78')

        # Parse options
        options = ProxyDHCP._parse_options(offer[240:])

        # Check message type is DHCPOFFER
        assert OPTION_MESSAGE_TYPE in options
        assert options[OPTION_MESSAGE_TYPE][0] == DHCP_OFFER

        # Check server identifier
        assert OPTION_SERVER_ID in options

        # Check PXE vendor class
        assert OPTION_VENDOR_CLASS in options


class TestPXEClientDetection:
    """Test PXE client identification."""

    def test_pxe_client_detection(self):
        """Verify PXE client is detected by vendor class."""
        proxy = ProxyDHCP()

        # Build packet with PXEClient vendor class
        packet_data = self._build_packet_with_vendor_class(PXE_CLIENT_ID)
        packet = proxy.parse_dhcp_packet(packet_data)

        assert packet.is_pxe_client is True

    def test_non_pxe_client_detection(self):
        """Verify non-PXE client is not detected as PXE."""
        proxy = ProxyDHCP()

        # Build packet with different vendor class
        packet_data = self._build_packet_with_vendor_class(b'OtherClient')
        packet = proxy.parse_dhcp_packet(packet_data)

        assert packet.is_pxe_client is False

    def test_no_vendor_class(self):
        """Verify packet without vendor class is not PXE."""
        proxy = ProxyDHCP()

        # Build packet without option 60
        packet_data = self._build_packet_without_vendor_class()
        packet = proxy.parse_dhcp_packet(packet_data)

        assert packet.is_pxe_client is False

    def _build_packet_with_vendor_class(self, vendor_class: bytes) -> bytes:
        """Build test packet with specific vendor class."""
        data = struct.pack('!BBBB', 1, 1, 6, 0)
        data += b'\x12\x34\x56\x78'
        data += struct.pack('!HH', 0, 0)
        data += b'\x00' * 16  # IP addresses
        data += b'\xaa\xbb\xcc\xdd\xee\xff' + b'\x00' * 10
        data += b'\x00' * 64
        data += b'\x00' * 128
        data += DHCP_MAGIC_COOKIE
        data += bytes([OPTION_MESSAGE_TYPE, 1, DHCP_DISCOVER])
        data += bytes([OPTION_VENDOR_CLASS, len(vendor_class)]) + vendor_class
        data += b'\xff'
        return data

    def _build_packet_without_vendor_class(self) -> bytes:
        """Build test packet without vendor class option."""
        data = struct.pack('!BBBB', 1, 1, 6, 0)
        data += b'\x12\x34\x56\x78'
        data += struct.pack('!HH', 0, 0)
        data += b'\x00' * 16
        data += b'\xaa\xbb\xcc\xdd\xee\xff' + b'\x00' * 10
        data += b'\x00' * 64
        data += b'\x00' * 128
        data += DHCP_MAGIC_COOKIE
        data += bytes([OPTION_MESSAGE_TYPE, 1, DHCP_DISCOVER])
        data += b'\xff'
        return data


class TestProxyDHCPMethods:
    """Test ProxyDHCP methods."""

    def test_handle_discover_pxe_client(self):
        """Verify handle_discover returns offer for PXE client."""
        proxy = ProxyDHCP()
        proxy.config.server_ip = "192.168.1.100"

        packet = DHCPPacket(
            message_type=DHCP_DISCOVER,
            xid=b'\x12\x34\x56\x78',
            client_mac=b'\xaa\xbb\xcc\xdd\xee\xff',
            is_pxe_client=True
        )

        offer = proxy.handle_discover(packet)

        assert len(offer) > 0
        assert offer[0] == 2  # BOOTREPLY

    def test_handle_discover_non_pxe_client(self):
        """Verify handle_discover returns empty for non-PXE client."""
        proxy = ProxyDHCP()

        packet = DHCPPacket(
            message_type=DHCP_DISCOVER,
            xid=b'\x12\x34\x56\x78',
            client_mac=b'\xaa\xbb\xcc\xdd\xee\xff',
            is_pxe_client=False
        )

        offer = proxy.handle_discover(packet)

        assert len(offer) == 0

    def test_repr(self):
        """Verify string representation."""
        proxy = ProxyDHCP()
        repr_str = repr(proxy)
        assert "ProxyDHCP" in repr_str
        assert "stopped" in repr_str


class TestDHCPConfigAutoDetect:
    """Test DHCPConfig auto-detection."""

    def test_auto_detect_interface_ip(self):
        """Verify interface IP auto-detection works."""
        config = DHCPConfig()
        # The auto-detect should set some IP (or 0.0.0.0 on failure)
        assert config.server_ip is not None

    def test_explicit_ip_not_overridden(self):
        """Verify explicit IP is not overridden by auto-detect."""
        config = DHCPConfig(server_ip="10.0.0.1")
        assert config.server_ip == "10.0.0.1"

    def test_tftp_server_defaults_to_server_ip(self):
        """Verify tftp_server defaults to server_ip."""
        config = DHCPConfig(server_ip="192.168.1.50")
        assert config.tftp_server == "192.168.1.50"


class TestUtilityMethods:
    """Test utility methods."""

    def test_ip_to_bytes(self):
        """Verify IP to bytes conversion."""
        result = ProxyDHCP._ip_to_bytes("192.168.1.100")
        assert result == bytes([192, 168, 1, 100])

    def test_bytes_to_ip(self):
        """Verify bytes to IP conversion."""
        result = ProxyDHCP._bytes_to_ip(bytes([192, 168, 1, 100]))
        assert result == "192.168.1.100"

    def test_build_option(self):
        """Verify option building."""
        result = ProxyDHCP._build_option(53, bytes([2]))
        assert result == bytes([53, 1, 2])

    def test_parse_options(self):
        """Verify options parsing."""
        # Build options: 53=2, 60="PXEClient", 255=end
        options_data = bytes([53, 1, 2])
        options_data += bytes([60, 9]) + b'PXEClient'
        options_data += bytes([255])

        result = ProxyDHCP._parse_options(options_data)

        assert 53 in result
        assert result[53] == bytes([2])
        assert 60 in result
        assert result[60] == b'PXEClient'
