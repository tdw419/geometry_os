"""
Auth Manager - Handles agent authentication and session management.
"""

import asyncio
import hmac
import hashlib
import secrets
import time
import logging
from typing import Dict, Optional

logger = logging.getLogger(__name__)

class AuthManager:
    """
    Manages agent authentication using shared secrets and session tokens.
    """

    def __init__(self, shared_secret: str, token_expiry: int = 3600):
        self.shared_secret = shared_secret
        self.token_expiry = token_expiry
        self.active_sessions: Dict[str, Dict] = {}

        logger.info(f"AuthManager initialized with token expiry: {token_expiry}s")

    async def register_agent(self, agent_id: str, secret: str) -> str:
        """
        Register an agent using a shared secret.
        Returns a session token if successful.
        """
        if not secrets.compare_digest(secret, self.shared_secret):
            logger.warning(f"Failed authentication attempt for agent: {agent_id}")
            raise ValueError("Invalid secret")

        token = secrets.token_urlsafe(32)
        self.active_sessions[agent_id] = {
            "token": token,
            "created_at": time.time()
        }

        logger.info(f"Agent authenticated and registered: {agent_id}")
        return token

    async def validate_token(self, agent_id: str, token: str) -> bool:
        """
        Validate an agent's session token and check for expiration.
        """
        if agent_id not in self.active_sessions:
            return False

        session = self.active_sessions[agent_id]
        
        # Check token validity
        if not secrets.compare_digest(session["token"], token):
            return False

        # Check expiration
        if time.time() - session["created_at"] > self.token_expiry:
            logger.info(f"Session expired for agent: {agent_id}")
            del self.active_sessions[agent_id]
            return False

        return True

    async def unregister_agent(self, agent_id: str):
        """
        Remove an agent's session.
        """
        if agent_id in self.active_sessions:
            del self.active_sessions[agent_id]
            logger.info(f"Agent session cleared: {agent_id}")
