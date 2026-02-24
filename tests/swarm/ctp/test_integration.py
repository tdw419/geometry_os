# tests/swarm/ctp/test_integration.py
"""Integration tests for CTP end-to-end flows."""
import pytest
from unittest.mock import Mock

from systems.swarm.ctp.client import CTPClient
from systems.swarm.ctp.gateway import CTPGateway
from systems.swarm.ctp.types import TrustLevel
from systems.swarm.ctp.parser import CTPParser


class TestCTPIntegration:
    """End-to-end CTP integration tests."""

    @pytest.fixture
    def mock_telepathy(self):
        """Create mock TelepathyNode for gateway."""
        node = Mock()
        node.process_signal = Mock()
        return node

    @pytest.fixture
    def gateway(self, mock_telepathy):
        """Create CTP gateway."""
        return CTPGateway(telepathy_node=mock_telepathy, port=8472)

    @pytest.fixture
    def client(self):
        """Create CTP client."""
        return CTPClient(
            gateway_host="127.0.0.1",
            gateway_port=8472,
            agent_id="phone-integration-test",
            capabilities=["query", "fragment_receive"],
        )

    @pytest.mark.asyncio
    async def test_full_handshake_flow(self, gateway, client):
        """Test complete HELLO -> WELCOME flow."""
        # Client sends HELLO
        hello = client.build_hello_message()
        assert "CTP/1.0 HELLO" in hello
        assert "phone-integration-test" in hello

        # Gateway processes HELLO
        result = await gateway.handle_handshake(hello)
        assert result["status"] == "welcome"
        assert "session_id" in result

    @pytest.mark.asyncio
    async def test_query_flow(self, gateway, client, mock_telepathy):
        """Test complete query flow through gateway."""
        # Setup: register client with gateway
        gateway.trust_manager.registry.register(
            "phone-integration-test",
            ["query"],
            TrustLevel.EXTERNAL,
        )

        # Client builds query
        query_msg = client.build_query_message("Who knows about auth?")
        assert "Intent: QUERY" in query_msg
        assert "Who knows about auth?" in query_msg

        # Gateway processes query
        await gateway.handle_stream(query_msg)

        # Verify Telepathy received translated signal
        mock_telepathy.process_signal.assert_called_once()
        signal = mock_telepathy.process_signal.call_args[0][0]
        assert signal.source_id == "phone-integration-test"
        assert signal.signal_type == "QUERY"
        assert "auth" in signal.payload["data"]

    @pytest.mark.asyncio
    async def test_rate_limiting_integration(self, gateway, client):
        """Test rate limiting across multiple requests."""
        # Register as EXTERNAL (100 req/min limit)
        gateway.trust_manager.registry.register(
            "phone-rate-test",
            ["query"],
            TrustLevel.EXTERNAL,
        )

        # Should not be limited initially
        for _ in range(50):
            assert gateway.trust_manager.is_rate_limited("phone-rate-test") is False
            gateway.trust_manager.record_request("phone-rate-test")

        # After hitting limit, should be limited
        for _ in range(60):
            gateway.trust_manager.record_request("phone-rate-test")

        assert gateway.trust_manager.is_rate_limited("phone-rate-test") is True

    @pytest.mark.asyncio
    async def test_trust_level_enforcement(self, gateway, client):
        """Test that UNTRUSTED clients are rejected."""
        # Register as UNTRUSTED
        gateway.trust_manager.registry.register(
            "untrusted-device",
            [],
            TrustLevel.UNTRUSTED,
        )

        # Should fail validation
        assert gateway.validate_trust("untrusted-device") is False

    @pytest.mark.asyncio
    async def test_ascii_roundtrip(self, gateway, client):
        """Test ASCII serialization roundtrip."""
        signal = client.build_query_message("Test message")
        assert "---CTP-PAYLOAD---" in signal
        assert "---CTP-END---" in signal

        # Parse it back
        parser = CTPParser()
        parsed = parser.parse(signal)

        assert parsed["headers"]["Agent-ID"] == "phone-integration-test"
        assert parsed["payload"] == "Test message"

    @pytest.mark.asyncio
    async def test_client_reject_parsing(self, client):
        """Test client can parse REJECT response."""
        reject_msg = """CTP/1.0 REJECT
Reason: Rate limited
Timestamp: 2026-02-24T12:00:00Z
---CTP-PAYLOAD---
---CTP-END---
"""
        result = client.parse_reject(reject_msg)
        assert result["reason"] == "Rate limited"

    @pytest.mark.asyncio
    async def test_client_welcome_parsing(self, client):
        """Test client can parse WELCOME response."""
        welcome_msg = """CTP/1.0 WELCOME
Server-ID: gos-gateway-01
Session-ID: sess_abc123def456
Context-Hash: 0x7f3a9c2e
Delta-Available: 42
Timestamp: 2026-02-24T12:00:00Z
---CTP-PAYLOAD---
---CTP-END---
"""
        result = client.parse_welcome(welcome_msg)
        assert result["session_id"] == "sess_abc123def456"
        assert result["context_hash"] == "0x7f3a9c2e"
        assert result["delta_available"] == 42

    @pytest.mark.asyncio
    async def test_full_session_lifecycle(self, gateway, mock_telepathy):
        """Test full session: handshake, query, validation."""
        # Create fresh client
        test_client = CTPClient(
            gateway_host="127.0.0.1",
            gateway_port=8472,
            agent_id="lifecycle-test-device",
            capabilities=["query", "subscribe"],
        )

        # Step 1: Handshake
        hello = test_client.build_hello_message()
        handshake_result = await gateway.handle_handshake(hello)
        assert handshake_result["status"] == "welcome"

        # Step 2: Build and send query
        test_client.session_id = handshake_result.get("session_id", "sess_test")
        query = test_client.build_query_message("What services are available?")

        # Step 3: Gateway processes
        await gateway.handle_stream(query)

        # Step 4: Verify translation
        mock_telepathy.process_signal.assert_called_once()
        signal = mock_telepathy.process_signal.call_args[0][0]
        assert signal.source_id == "lifecycle-test-device"
        assert "services" in signal.payload["data"]
