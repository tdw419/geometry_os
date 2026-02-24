# systems/swarm/ctp/client.py
"""CTP minimal client - stdlib-only for broad device compatibility."""
import asyncio
from typing import Optional, List, Dict, Any

from .types import TrustLevel
from .parser import CTPParser


class CTPClient:
    """
    Minimal CTP client for device onboarding.

    Uses only Python stdlib for maximum compatibility.
    Works on Python 3.8+ (phones, IoT devices, etc.)
    """

    def __init__(
        self,
        gateway_host: str,
        gateway_port: int = 8472,
        agent_id: str = "",
        capabilities: Optional[List[str]] = None,
        trust_level: TrustLevel = TrustLevel.EXTERNAL,
    ):
        self.gateway_host = gateway_host
        self.gateway_port = gateway_port
        self.agent_id = agent_id
        self.capabilities = capabilities or ["query"]
        self.trust_level = trust_level
        self.parser = CTPParser()

        # Connection state
        self.connected = False
        self.session_id: Optional[str] = None
        self.context_hash: str = "0x0000000000000000"

        # Async internals
        self._reader: Optional[asyncio.StreamReader] = None
        self._writer: Optional[asyncio.StreamWriter] = None

    def build_hello_message(self) -> str:
        """Build HELLO handshake message."""
        caps_str = ",".join(self.capabilities)
        return f"""CTP/1.0 HELLO
Agent-ID: {self.agent_id}
Context-Hash: {self.context_hash}
Capabilities: {caps_str}
Trust-Level: {self.trust_level.value}
---CTP-PAYLOAD---
---CTP-END---
"""

    def build_query_message(self, query_text: str) -> str:
        """Build QUERY message."""
        return f"""CTP/1.0 STREAM
Agent-ID: {self.agent_id}
Intent: QUERY
Context-Hash: {self.context_hash}
Session-ID: {self.session_id or ""}
Content-Type: text/ascii
Content-Length: {len(query_text)}
---CTP-PAYLOAD---
{query_text}
---CTP-END---
"""

    def parse_welcome(self, response: str) -> Dict[str, Any]:
        """Parse WELCOME response."""
        parsed = self.parser.parse(response)
        headers = parsed["headers"]
        return {
            "session_id": headers.get("Session-ID", ""),
            "context_hash": headers.get("Context-Hash", ""),
            "delta_available": int(headers.get("Delta-Available", 0)),
        }

    def parse_reject(self, response: str) -> Dict[str, Any]:
        """Parse REJECT response."""
        parsed = self.parser.parse(response)
        headers = parsed["headers"]
        return {
            "reason": headers.get("Reason", "Unknown"),
        }

    async def _create_connection(self):
        """Create TCP connection to gateway."""
        self._reader, self._writer = await asyncio.open_connection(
            self.gateway_host, self.gateway_port
        )

    async def _send_and_receive(self, message: str) -> str:
        """Send message and receive response."""
        if not self._writer:
            raise RuntimeError("Not connected")

        self._writer.write(message.encode())
        await self._writer.drain()

        # Read until end marker
        response = b""
        while b"---CTP-END---" not in response:
            chunk = await self._reader.read(4096)
            if not chunk:
                break
            response += chunk

        return response.decode()

    async def connect(self) -> bool:
        """Connect to gateway and perform handshake."""
        await self._create_connection()

        # Send HELLO
        hello = self.build_hello_message()
        response = await self._send_and_receive(hello)

        # Parse response
        if "WELCOME" in response:
            result = self.parse_welcome(response)
            self.session_id = result["session_id"]
            self.context_hash = result["context_hash"]
            self.connected = True
            return True
        else:
            self.connected = False
            return False

    async def query(self, query_text: str) -> str:
        """Send query to mesh and return response."""
        if not self.connected:
            raise RuntimeError("Not connected")

        message = self.build_query_message(query_text)
        response = await self._send_and_receive(message)

        # Extract payload from response
        parsed = self.parser.parse(response)
        return parsed.get("payload", "")

    async def close(self):
        """Close connection."""
        if self._writer:
            self._writer.close()
            await self._writer.wait_closed()
        self.connected = False
