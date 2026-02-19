import pytest
import asyncio
from cryptography.hazmat.primitives.asymmetric import ed25519
from systems.visual_shell.swarm.auth_manager import AuthManager
from systems.visual_shell.swarm.task_signer import TaskSigner
from systems.visual_shell.swarm.sandbox import Sandbox
from systems.visual_shell.swarm.audit_logger import AuditLogger
from systems.visual_shell.swarm.security_middleware import SecurityMiddleware

class MockAgent:
    def __init__(self, agent_id):
        self.agent_id = agent_id
        self.received_messages = []
    
    async def handle_message(self, message):
        self.received_messages.append(message)
        return {"status": "processed"}

class TestSecurityIntegration:
    """Tests for the integrated security middleware."""

    @pytest.fixture
    def security_components(self, tmp_path):
        auth = AuthManager(shared_secret="secret")
        signer = TaskSigner(private_key=ed25519.Ed25519PrivateKey.generate())
        sandbox = Sandbox()
        audit = AuditLogger(log_path=str(tmp_path / "security.log"))
        return auth, signer, sandbox, audit

    @pytest.mark.asyncio
    async def test_secure_handshake(self, security_components):
        """Middleware requires authentication handshake before processing messages."""
        auth, signer, sandbox, audit = security_components
        agent = MockAgent("agent-1")
        middleware = SecurityMiddleware(agent, auth, signer, sandbox, audit)
        
        # Unauthorized message should fail (integrity check first)
        message = {"type": "task", "data": "do work"}
        result = await middleware.process_incoming(message, sender_id="agent-1")
        assert result["success"] is False
        assert "Invalid signature" in result["error"]
        
        # Register and get token
        token = await auth.register_agent("agent-1", "secret")
        
        # Message with token should succeed
        message["token"] = token
        
        # But wait, it also needs a signature!
        signed_message = await signer.sign_payload(message)
        
        result = await middleware.process_incoming(signed_message, sender_id="agent-1")
        assert result["success"] is True

    @pytest.mark.asyncio
    async def test_signature_verification_integration(self, security_components):
        """Middleware verifies signatures of incoming tasks."""
        auth, signer, sandbox, audit = security_components
        agent = MockAgent("agent-1")
        middleware = SecurityMiddleware(agent, auth, signer, sandbox, audit)
        
        token = await auth.register_agent("agent-1", "secret")
        
        # Valid signature
        message = {"type": "task", "data": "work", "token": token}
        signed_message = await signer.sign_payload(message)
        
        result = await middleware.process_incoming(signed_message, sender_id="agent-1")
        assert result["success"] is True
        
        # Invalid signature (tampered)
        signed_message["payload"]["data"] = "evil"
        result = await middleware.process_incoming(signed_message, sender_id="agent-1")
        assert result["success"] is False
        assert "Invalid signature" in result["error"]

    @pytest.mark.asyncio
    async def test_sandboxed_task_execution_integration(self, security_components):
        """Middleware executes tasks in the sandbox."""
        auth, signer, sandbox, audit = security_components
        
        # Define an agent that uses the sandbox
        class SandboxedAgent(MockAgent):
            async def handle_message(self, message):
                # This should be wrapped by middleware
                return {"result": "done"}
        
        agent = SandboxedAgent("agent-1")
        middleware = SecurityMiddleware(agent, auth, signer, sandbox, audit)
        
        token = await auth.register_agent("agent-1", "secret")
        message = {"type": "task", "action": "compute", "token": token}
        signed_message = await signer.sign_payload(message)
        
        result = await middleware.process_incoming(signed_message, sender_id="agent-1")
        assert result["success"] is True
        # Audit log should have recorded the task
        events = await audit.get_events(event_type="task_executed")
        assert len(events) == 1

    @pytest.mark.asyncio
    async def test_audit_log_integration(self, security_components):
        """Middleware logs all security-relevant events."""
        auth, signer, sandbox, audit = security_components
        agent = MockAgent("agent-1")
        middleware = SecurityMiddleware(agent, auth, signer, sandbox, audit)
        
        # Log auth failure
        await middleware.process_incoming({"type": "test"}, sender_id="agent-unknown")
        
        events = await audit.get_events(event_type="security_alert")
        assert len(events) >= 1
