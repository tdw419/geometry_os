# tests/swarm/ctp/test_client.py
"""Tests for CTP minimal client."""
import pytest
from unittest.mock import Mock, AsyncMock, patch
from systems.swarm.ctp.client import CTPClient
from systems.swarm.ctp.types import TrustLevel


class TestCTPClient:
    """Test CTP client functionality."""

    @pytest.fixture
    def client(self):
        """Create CTP client."""
        return CTPClient(
            gateway_host="127.0.0.1",
            gateway_port=8472,
            agent_id="phone-alpha-7",
            capabilities=["query", "fragment_receive"],
        )

    def test_client_initialization(self, client):
        """Client should initialize with correct settings."""
        assert client.gateway_host == "127.0.0.1"
        assert client.gateway_port == 8472
        assert client.agent_id == "phone-alpha-7"
        assert client.trust_level == TrustLevel.EXTERNAL
        assert "query" in client.capabilities

    def test_build_hello_message(self, client):
        """Build HELLO handshake message."""
        hello = client.build_hello_message()
        assert "CTP/1.0 HELLO" in hello
        assert "Agent-ID: phone-alpha-7" in hello
        assert "Capabilities: query,fragment_receive" in hello
        assert "Trust-Level: EXTERNAL" in hello

    def test_build_query_message(self, client):
        """Build QUERY message."""
        query = client.build_query_message("What agents know about auth?")
        assert "CTP/1.0 STREAM" in query
        assert "Intent: QUERY" in query
        assert "What agents know about auth?" in query

    def test_parse_welcome_response(self, client):
        """Parse WELCOME response."""
        response = """CTP/1.0 WELCOME
Server-ID: gos-gateway-01
Session-ID: sess_abc123
Context-Hash: 0x7f3a
Delta-Available: 847
---CTP-PAYLOAD---
---CTP-END---
"""
        result = client.parse_welcome(response)
        assert result["session_id"] == "sess_abc123"
        assert result["context_hash"] == "0x7f3a"
        assert result["delta_available"] == 847

    def test_parse_reject_response(self, client):
        """Parse REJECT response."""
        response = """CTP/1.0 REJECT
Reason: Trust level insufficient
---CTP-PAYLOAD---
---CTP-END---
"""
        result = client.parse_reject(response)
        assert result["reason"] == "Trust level insufficient"

    @pytest.mark.asyncio
    async def test_connect_success(self, client):
        """Test successful connection."""
        # Mock _create_connection to set reader/writer
        async def mock_create_conn():
            client._reader = AsyncMock()
            client._writer = AsyncMock()
            # Mock read to return WELCOME response
            client._reader.read.return_value = b"""CTP/1.0 WELCOME
Session-ID: sess_abc123
Context-Hash: 0x7f3a
---CTP-PAYLOAD---
---CTP-END---
"""
            client._writer.write = Mock()
            client._writer.drain = AsyncMock()

        with patch.object(client, '_create_connection', side_effect=mock_create_conn):
            await client.connect()
            assert client.session_id == "sess_abc123"
            assert client.connected is True

    @pytest.mark.asyncio
    async def test_query(self, client):
        """Test sending query."""
        client.connected = True
        client.session_id = "sess_abc123"

        with patch.object(client, '_send_and_receive', new_callable=AsyncMock) as mock_send:
            mock_send.return_value = """CTP/1.0 STREAM
Intent: RESPONSE
---CTP-PAYLOAD---
Agent gos-node-3 knows about authentication.
---CTP-END---
"""
            response = await client.query("Who knows about auth?")
            assert "gos-node-3" in response
            assert "authentication" in response
