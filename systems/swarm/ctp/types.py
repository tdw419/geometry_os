# systems/swarm/ctp/types.py
"""CTP types, constants, and data structures."""
import hashlib
from dataclasses import dataclass, field
from enum import Enum
from typing import Dict, List, Optional, Any


class CTPVersion:
    """CTP protocol version constants."""
    VERSION = "CTP/1.0"
    DEFAULT_PORT = 8472


class TrustLevel(Enum):
    """Trust levels for CTP connections."""
    INTERNAL = "INTERNAL"
    EXTERNAL = "EXTERNAL"
    UNTRUSTED = "UNTRUSTED"

    @property
    def can_publish_skills(self) -> bool:
        return self == TrustLevel.INTERNAL

    @property
    def can_vote(self) -> bool:
        return self == TrustLevel.INTERNAL

    @property
    def can_subscribe(self) -> bool:
        return self in (TrustLevel.INTERNAL, TrustLevel.EXTERNAL)

    @property
    def can_query(self) -> bool:
        return True  # All levels can query

    @property
    def rate_limit(self) -> int:
        """Requests per minute."""
        limits = {
            TrustLevel.INTERNAL: 0,  # Unlimited
            TrustLevel.EXTERNAL: 100,
            TrustLevel.UNTRUSTED: 10,
        }
        return limits[self]


class IntentType(Enum):
    """CTP signal intent types."""
    INTENT = "INTENT"
    INSIGHT = "INSIGHT"
    QUERY = "QUERY"
    RESPONSE = "RESPONSE"
    FRAGMENT = "FRAGMENT"
    CONSENSUS = "CONSENSUS"
    HEARTBEAT = "HEARTBEAT"


@dataclass
class ContextHash:
    """Represents a context hash computed from fragments."""
    fragments: List[Dict[str, Any]] = field(default_factory=list)
    _hash: str = field(default="", init=False)

    def __post_init__(self):
        self._hash = self._compute_hash()

    @property
    def hash(self) -> str:
        return self._hash

    def _compute_hash(self) -> str:
        """Compute SHA-256 hash from sorted fragments."""
        if not self.fragments:
            return "0x0000000000000000"

        # Sort by (namespace, timestamp) for consistency
        sorted_frags = sorted(
            self.fragments,
            key=lambda f: (f.get("namespace", ""), f.get("timestamp", 0))
        )

        # Concatenate fragment hashes
        concat = "".join(f.get("hash", "") for f in sorted_frags)

        # SHA-256 and truncate to 16 hex chars
        full_hash = hashlib.sha256(concat.encode()).hexdigest()
        return "0x" + full_hash[:16]


@dataclass
class CTPSignal:
    """A CTP signal with ASCII serialization."""
    message_type: str
    agent_id: str
    intent: IntentType
    context_hash: str
    content_type: str = "text/ascii"
    payload: Optional[str] = None
    headers: Dict[str, str] = field(default_factory=dict)

    def to_ascii(self) -> str:
        """Serialize signal to ASCII format."""
        lines = [f"CTP/1.0 {self.message_type}"]
        lines.append(f"Agent-ID: {self.agent_id}")
        lines.append(f"Intent: {self.intent.value}")
        lines.append(f"Context-Hash: {self.context_hash}")
        lines.append(f"Content-Type: {self.content_type}")

        # Add optional headers
        for key, value in self.headers.items():
            lines.append(f"{key}: {value}")

        # Add payload if present
        if self.payload:
            lines.append(f"Content-Length: {len(self.payload)}")
            lines.append("---CTP-PAYLOAD---")
            lines.append(self.payload)
            lines.append("---CTP-END---")
        else:
            lines.append("Content-Length: 0")
            lines.append("---CTP-PAYLOAD---")
            lines.append("---CTP-END---")

        return "\n".join(lines) + "\n"

    @classmethod
    def from_ascii(cls, ascii_input: str) -> "CTPSignal":
        """Parse signal from ASCII format."""
        lines = ascii_input.strip().split("\n")

        # Parse first line for message type
        first_line = lines[0]
        message_type = first_line.split()[-1]

        # Parse headers
        headers = {}
        i = 1
        while i < len(lines) and not lines[i].startswith("---"):
            if ":" in lines[i]:
                key, value = lines[i].split(":", 1)
                headers[key.strip()] = value.strip()
            i += 1

        # Extract payload
        payload = None
        if i < len(lines) and lines[i] == "---CTP-PAYLOAD---":
            payload_lines = []
            i += 1
            while i < len(lines) and lines[i] != "---CTP-END---":
                payload_lines.append(lines[i])
                i += 1
            payload = "\n".join(payload_lines)

        return cls(
            message_type=message_type,
            agent_id=headers.get("Agent-ID", ""),
            intent=IntentType(headers.get("Intent", "QUERY")),
            context_hash=headers.get("Context-Hash", "0x0000000000000000"),
            content_type=headers.get("Content-Type", "text/ascii"),
            payload=payload if payload else None,
            headers={k: v for k, v in headers.items()
                     if k not in ["Agent-ID", "Intent", "Context-Hash", "Content-Type", "Content-Length"]},
        )
