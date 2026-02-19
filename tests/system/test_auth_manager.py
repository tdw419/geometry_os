import pytest
import asyncio
import time
from systems.visual_shell.swarm.auth_manager import AuthManager

class TestAuthManager:
    """Tests for the agent authentication manager."""

    @pytest.fixture
    def auth_manager(self):
        return AuthManager(shared_secret="test-secret", token_expiry=1)

    @pytest.mark.asyncio
    async def test_auth_manager_initialization(self, auth_manager):
        """AuthManager initializes with correct configuration."""
        assert auth_manager.shared_secret == "test-secret"
        assert auth_manager.active_sessions == {}

    @pytest.mark.asyncio
    async def test_agent_registration_success(self, auth_manager):
        """Agents can register with the correct shared secret."""
        agent_id = "agent-001"
        token = await auth_manager.register_agent(agent_id, "test-secret")
        
        assert token is not None
        assert agent_id in auth_manager.active_sessions
        assert auth_manager.active_sessions[agent_id]["token"] == token

    @pytest.mark.asyncio
    async def test_agent_registration_failure(self, auth_manager):
        """Agents fail to register with an incorrect shared secret."""
        agent_id = "agent-001"
        with pytest.raises(ValueError, match="Invalid secret"):
            await auth_manager.register_agent(agent_id, "wrong-secret")

    @pytest.mark.asyncio
    async def test_token_validation(self, auth_manager):
        """Session tokens can be validated."""
        agent_id = "agent-001"
        token = await auth_manager.register_agent(agent_id, "test-secret")
        
        assert await auth_manager.validate_token(agent_id, token) is True
        assert await auth_manager.validate_token(agent_id, "invalid-token") is False

    @pytest.mark.asyncio
    async def test_token_expiration(self, auth_manager):
        """Tokens expire after the configured time."""
        agent_id = "agent-001"
        token = await auth_manager.register_agent(agent_id, "test-secret")
        
        assert await auth_manager.validate_token(agent_id, token) is True
        
        # Wait for expiration
        await asyncio.sleep(1.1)
        
        assert await auth_manager.validate_token(agent_id, token) is False
        assert agent_id not in auth_manager.active_sessions

    @pytest.mark.asyncio
    async def test_agent_disconnect_cleanup(self, auth_manager):
        """Agent sessions are cleaned up on disconnect."""
        agent_id = "agent-001"
        await auth_manager.register_agent(agent_id, "test-secret")
        
        await auth_manager.unregister_agent(agent_id)
        assert agent_id not in auth_manager.active_sessions
