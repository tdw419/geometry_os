# systems/swarm/ctp/gateway.py
"""CTP Gateway - Bridge between CTP (external) and Telepathy (internal)."""
import uuid
from dataclasses import dataclass, field
from typing import Dict, Any
from datetime import datetime

from .types import CTPSignal, TrustLevel, IntentType
from .parser import CTPParser, ParseError
from .trust_manager import TrustManager


@dataclass
class CTPSession:
    """Active CTP session."""
    session_id: str
    agent_id: str
    context_hash: str
    trust_level: TrustLevel
    created_at: float = field(default_factory=lambda: datetime.now().timestamp())


class CTPGateway:
    """
    Bridge between CTP (external) and Telepathy (internal).

    - Accepts CTP connections on port 8472
    - Translates to Telepathy for internal mesh
    - Enforces trust levels and rate limits
    """

    def __init__(self, telepathy_node, port: int = 8472):
        self.telepathy = telepathy_node
        self.port = port
        self.parser = CTPParser()
        self.trust_manager = TrustManager()
        self.sessions: Dict[str, CTPSession] = {}
        self.running = False

    def translate_to_telepathy(self, ctp_signal: CTPSignal):
        """Convert CTP message to Telepathy format."""
        # Import here to avoid circular dependency
        from systems.swarm.telepathy_protocol import TelepathySignal

        return TelepathySignal(
            source_id=ctp_signal.agent_id,
            signal_type=ctp_signal.intent.value,
            payload={
                "context_hash": ctp_signal.context_hash,
                "content_type": ctp_signal.content_type,
                "data": ctp_signal.payload,
                "headers": ctp_signal.headers,
            },
            timestamp=datetime.now().timestamp(),
        )

    def validate_trust(self, agent_id: str) -> bool:
        """Check if agent is allowed to connect."""
        trust_level = self.trust_manager.registry.get_trust_level(agent_id)
        # For now, only INTERNAL and EXTERNAL can connect
        return trust_level in (TrustLevel.INTERNAL, TrustLevel.EXTERNAL)

    def build_reject_response(self, reason: str) -> str:
        """Build REJECT response message."""
        return f"""CTP/1.0 REJECT
Reason: {reason}
Timestamp: {datetime.now().isoformat()}Z
---CTP-PAYLOAD---
---CTP-END---
"""

    def build_welcome_response(
        self,
        session_id: str,
        context_hash: str,
        delta_available: int = 0,
    ) -> str:
        """Build WELCOME response message."""
        return f"""CTP/1.0 WELCOME
Server-ID: gos-gateway-01
Session-ID: {session_id}
Context-Hash: {context_hash}
Delta-Available: {delta_available}
Timestamp: {datetime.now().isoformat()}Z
---CTP-PAYLOAD---
---CTP-END---
"""

    async def handle_handshake(self, message: str) -> Dict[str, Any]:
        """Handle HELLO handshake message."""
        try:
            parsed = self.parser.parse(message)
        except ParseError as e:
            return {"status": "rejected", "reason": str(e)}

        headers = parsed["headers"]
        agent_id = headers.get("Agent-ID", "")
        context_hash = headers.get("Context-Hash", "0x0000")
        capabilities = headers.get("Capabilities", "").split(",")
        trust_str = headers.get("Trust-Level", "UNTRUSTED")

        # Determine trust level
        try:
            trust_level = TrustLevel(trust_str)
        except ValueError:
            trust_level = TrustLevel.UNTRUSTED

        # Register agent
        self.trust_manager.registry.register(
            agent_id, capabilities, trust_level
        )

        # Validate trust
        if not self.validate_trust(agent_id):
            return {"status": "rejected", "reason": "Trust level insufficient"}

        # Create session
        session_id = f"sess_{uuid.uuid4().hex[:12]}"
        self.sessions[session_id] = CTPSession(
            session_id=session_id,
            agent_id=agent_id,
            context_hash=context_hash,
            trust_level=trust_level,
        )

        return {
            "status": "welcome",
            "session_id": session_id,
            "agent_id": agent_id,
        }

    async def handle_stream(self, message: str) -> None:
        """Handle STREAM message and forward to Telepathy."""
        try:
            parsed = self.parser.parse(message)
        except ParseError:
            return  # Silently ignore malformed messages

        headers = parsed["headers"]
        agent_id = headers.get("Agent-ID", "")

        # Check rate limit
        if self.trust_manager.is_rate_limited(agent_id):
            return  # Drop message if rate limited

        # Record request
        self.trust_manager.record_request(agent_id)

        # Build CTP signal
        try:
            intent = IntentType(headers.get("Intent", "QUERY"))
        except ValueError:
            intent = IntentType.QUERY

        ctp_signal = CTPSignal(
            message_type="STREAM",
            agent_id=agent_id,
            intent=intent,
            context_hash=headers.get("Context-Hash", "0x0000"),
            content_type=headers.get("Content-Type", "text/ascii"),
            payload=parsed.get("payload"),
            headers={k: v for k, v in headers.items()
                     if k not in ["Agent-ID", "Intent", "Context-Hash", "Content-Type"]},
        )

        # Translate and inject into Telepathy mesh
        telepathy_signal = self.translate_to_telepathy(ctp_signal)
        self.telepathy.process_signal(telepathy_signal)

    async def start(self):
        """Start the CTP gateway server."""
        self.running = True
        # TODO: Implement actual QUIC/UDP server
        # For now, this is a placeholder for the async server loop
        pass

    async def stop(self):
        """Stop the CTP gateway server."""
        self.running = False
