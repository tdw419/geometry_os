# tests/swarm/ctp/test_gateway.py
"""Tests for CTP Gateway."""
import pytest
from unittest.mock import Mock
from systems.swarm.ctp.gateway import CTPGateway
from systems.swarm.ctp.types import TrustLevel, IntentType, CTPSignal
from systems.swarm.telepathy_protocol import TelepathyNode


class TestCTPGateway:
    """Test CTP gateway functionality."""

    @pytest.fixture
    def mock_telepathy(self):
        """Create mock TelepathyNode."""
        node = Mock(spec=TelepathyNode)
        node.process_signal = Mock()
        return node

    @pytest.fixture
    def gateway(self, mock_telepathy):
        """Create CTP gateway with mock telepathy."""
        return CTPGateway(telepathy_node=mock_telepathy, port=8472)

    def test_gateway_initialization(self, gateway):
        """Gateway should initialize with correct settings."""
        assert gateway.port == 8472
        assert gateway.trust_manager is not None
        assert gateway.parser is not None

    def test_translate_ctp_to_telepathy(self, gateway):
        """CTP signal should translate to Telepathy format."""
        ctp_signal = CTPSignal(
            message_type="STREAM",
            agent_id="phone-alpha-7",
            intent=IntentType.INSIGHT,
            context_hash="0x7f3a9c2e",
            payload="test insight",
        )

        telepathy_signal = gateway.translate_to_telepathy(ctp_signal)

        assert telepathy_signal.source_id == "phone-alpha-7"
        assert telepathy_signal.signal_type == "INSIGHT"
        assert telepathy_signal.payload["context_hash"] == "0x7f3a9c2e"
        assert telepathy_signal.payload["data"] == "test insight"

    def test_validate_trust_allowed(self, gateway):
        """Internal agent should be allowed."""
        gateway.trust_manager.registry.register(
            "internal-1", [], TrustLevel.INTERNAL
        )
        assert gateway.validate_trust("internal-1") is True

    def test_validate_trust_denied(self, gateway):
        """Unknown agent should be denied for high-trust operations."""
        # Unknown agents are UNTRUSTED by default
        assert gateway.validate_trust("unknown-agent") is False

    def test_build_reject_response(self, gateway):
        """Build REJECT response message."""
        response = gateway.build_reject_response("Rate limited")
        assert "CTP/1.0 REJECT" in response
        assert "Rate limited" in response

    def test_build_welcome_response(self, gateway):
        """Build WELCOME response message."""
        response = gateway.build_welcome_response(
            session_id="sess_abc123",
            context_hash="0x7f3a",
            delta_available=847,
        )
        assert "CTP/1.0 WELCOME" in response
        assert "Session-ID: sess_abc123" in response
        assert "Context-Hash: 0x7f3a" in response
        assert "Delta-Available: 847" in response

    @pytest.mark.asyncio
    async def test_handle_hello_message(self, gateway, mock_telepathy):
        """Handle HELLO handshake message."""
        hello_msg = """CTP/1.0 HELLO
Agent-ID: phone-alpha-7
Context-Hash: 0x0000
Capabilities: query,fragment_receive
Trust-Level: EXTERNAL
---CTP-PAYLOAD---
---CTP-END---
"""
        result = await gateway.handle_handshake(hello_msg)
        assert result["status"] == "welcome"
        assert "session_id" in result
        assert result["agent_id"] == "phone-alpha-7"

    @pytest.mark.asyncio
    async def test_handle_stream_message(self, gateway, mock_telepathy):
        """Handle STREAM message and forward to Telepathy."""
        # Register agent first
        gateway.trust_manager.registry.register(
            "phone-alpha-7", ["query"], TrustLevel.EXTERNAL
        )

        stream_msg = """CTP/1.0 STREAM
Agent-ID: phone-alpha-7
Intent: QUERY
Context-Hash: 0x7f3a
---CTP-PAYLOAD---
What agents know about authentication?
---CTP-END---
"""
        await gateway.handle_stream(stream_msg)

        # Should have called telepathy
        mock_telepathy.process_signal.assert_called_once()
        signal = mock_telepathy.process_signal.call_args[0][0]
        assert signal.source_id == "phone-alpha-7"
        assert signal.signal_type == "QUERY"
