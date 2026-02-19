import pytest
import asyncio
import json
from systems.visual_shell.swarm.cross_node_router import CrossNodeRouter
from systems.visual_shell.swarm.node_registry import NodeRegistry
from systems.visual_shell.swarm.auth_manager import AuthManager

class MockSecurity:
    async def sign_outgoing(self, message):
        return {"payload": message, "signature": "signed", "nonce": "123"}
    
    async def process_incoming(self, signed_message, sender_id):
        return {"success": True, "data": signed_message["payload"]}

class TestCrossNodeRouter:
    """Tests for the cross-node secure router."""

    @pytest.fixture
    def registry(self):
        return NodeRegistry()

    @pytest.fixture
    def security(self):
        return MockSecurity()

    @pytest.fixture
    def router(self, registry, security):
        return CrossNodeRouter(node_id="node-1", registry=registry, security=security)

    @pytest.mark.asyncio
    async def test_cross_node_router_initialization(self, router, registry):
        """CrossNodeRouter initializes with node ID and registry."""
        assert router.node_id == "node-1"
        assert router.registry == registry

    @pytest.mark.asyncio
    async def test_secure_message_routing(self, router, registry):
        """Router signs and sends messages to other nodes."""
        await registry.register_node("node-2", {"url": "ws://node-2.local"})
        
        # Mock the sending mechanism
        sent_messages = []
        async def mock_send(url, message):
            sent_messages.append((url, message))
            return {"status": "ok"}
            
        router._send_to_url = mock_send
        
        message = {"type": "ping", "data": "hello"}
        await router.send_to_node("node-2", message)
        
        assert len(sent_messages) == 1
        assert sent_messages[0][0] == "ws://node-2.local"
        assert "signature" in sent_messages[0][1]
        assert sent_messages[0][1]["payload"] == message

    @pytest.mark.asyncio
    async def test_connection_failure_retry(self, router, registry):
        """Router retries failed connections."""
        await registry.register_node("node-2", {"url": "ws://node-2.local"})
        
        call_count = 0
        async def failing_send(url, message):
            nonlocal call_count
            call_count += 1
            if call_count < 3:
                raise ConnectionError("Connection failed")
            return {"status": "ok"}
            
        router._send_to_url = failing_send
        
        await router.send_to_node("node-2", {"type": "ping"}, max_retries=3)
        
        assert call_count == 3
