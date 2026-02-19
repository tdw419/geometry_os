"""
Security Middleware - Integrates auth, signing, sandbox, and audit logging.
"""

import logging
from typing import Dict, Any, Optional
from cryptography.hazmat.primitives.asymmetric import ed25519

from systems.visual_shell.swarm.auth_manager import AuthManager
from systems.visual_shell.swarm.task_signer import TaskSigner
from systems.visual_shell.swarm.sandbox import Sandbox
from systems.visual_shell.swarm.audit_logger import AuditLogger

logger = logging.getLogger(__name__)

class SecurityMiddleware:
    """
    Wraps an agent's message processing with security checks.
    """

    def __init__(self, agent: Any, 
                 auth: AuthManager, 
                 signer: TaskSigner, 
                 sandbox: Sandbox, 
                 audit: AuditLogger):
        self.agent = agent
        self.auth = auth
        self.signer = signer
        self.sandbox = sandbox
        self.audit = audit

        logger.info(f"SecurityMiddleware initialized for agent: {getattr(agent, 'agent_id', 'unknown')}")

    async def process_incoming(self, signed_message: Dict[str, Any], 
                               sender_id: str) -> Dict[str, Any]:
        """
        Process an incoming message through the security stack.
        """
        try:
            # 1. Signature Verification
            # Need to know the public key of the sender. For this prototype,
            # we'll assume we're verifying using the common public key or 
            # a per-agent key provided elsewhere.
            # In this implementation, TaskSigner.public_key will be used as fallback.
            public_key = self.signer.public_key
            if not await self.signer.verify_signature(signed_message, public_key):
                error = "Invalid signature or replay attack detected"
                await self.audit.log("security_alert", {"agent_id": sender_id, "error": error})
                return {"success": False, "error": error}

            # Extract actual payload
            payload = signed_message.get("payload", {})
            token = payload.get("token")

            # 2. Authentication Verification (except for register message)
            if payload.get("type") != "register":
                if not token or not await self.auth.validate_token(sender_id, token):
                    error = "Authentication required or session expired"
                    await self.audit.log("security_alert", {"agent_id": sender_id, "error": error})
                    return {"success": False, "error": error}

            # 3. Sandboxed Task Execution
            if payload.get("type") == "task":
                async def execute_task(params):
                    return await self.agent.handle_message(params)

                result = await self.sandbox.execute(execute_task, payload)
                
                # Log outcome
                event_type = "task_executed" if result["success"] else "task_failed"
                await self.audit.log(event_type, {"agent_id": sender_id, "task_id": payload.get("task_id")})
                
                return result

            # Generic message handling (for register/status/etc.)
            result_data = await self.agent.handle_message(payload)
            return {"success": True, "data": result_data}

        except Exception as e:
            error_msg = f"Middleware error: {str(e)}"
            logger.error(error_msg)
            await self.audit.log("security_error", {"error": error_msg})
            return {"success": False, "error": error_msg}

    async def sign_outgoing(self, message: Dict[str, Any]) -> Dict[str, Any]:
        """
        Signs an outgoing message before transmission.
        """
        return await self.signer.sign_payload(message)
