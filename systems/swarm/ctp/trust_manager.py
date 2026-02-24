# systems/swarm/ctp/trust_manager.py
"""CTP trust management and rate limiting."""
import time
from collections import defaultdict
from dataclasses import dataclass, field
from typing import Dict, List

from .types import TrustLevel


@dataclass
class AgentInfo:
    """Information about a registered agent."""
    agent_id: str
    capabilities: List[str]
    trust_level: TrustLevel
    registered_at: float = field(default_factory=time.time)
    last_seen: float = field(default_factory=time.time)


class AgentRegistry:
    """Registry of known agents and their trust levels."""

    def __init__(self):
        self._agents: Dict[str, AgentInfo] = {}

    def register(
        self,
        agent_id: str,
        capabilities: List[str],
        trust_level: TrustLevel,
    ) -> str:
        """Register or update an agent."""
        self._agents[agent_id] = AgentInfo(
            agent_id=agent_id,
            capabilities=capabilities,
            trust_level=trust_level,
        )
        return agent_id

    def get_trust_level(self, agent_id: str) -> TrustLevel:
        """Get trust level for agent, UNTRUSTED if unknown."""
        if agent_id in self._agents:
            return self._agents[agent_id].trust_level
        return TrustLevel.UNTRUSTED

    def get_capabilities(self, agent_id: str) -> List[str]:
        """Get capabilities for agent."""
        if agent_id in self._agents:
            return self._agents[agent_id].capabilities
        return []

    def get_last_seen(self, agent_id: str) -> float:
        """Get last seen timestamp."""
        if agent_id in self._agents:
            return self._agents[agent_id].last_seen
        return 0.0

    def update_last_seen(self, agent_id: str) -> None:
        """Update last seen timestamp."""
        if agent_id in self._agents:
            self._agents[agent_id].last_seen = time.time()


class TrustManager:
    """Manage trust validation and rate limiting."""

    # Capability to trust level mapping
    CAPABILITY_REQUIREMENTS = {
        "publish_skills": TrustLevel.INTERNAL,
        "vote": TrustLevel.INTERNAL,
        "subscribe": TrustLevel.EXTERNAL,
        "query": TrustLevel.UNTRUSTED,  # Minimum requirement
    }

    # Rate limits per trust level (requests per window)
    RATE_LIMITS = {
        TrustLevel.INTERNAL: 0,  # Unlimited
        TrustLevel.EXTERNAL: 100,
        TrustLevel.UNTRUSTED: 10,
    }

    def __init__(self, rate_window_seconds: int = 60):
        self.registry = AgentRegistry()
        self.rate_window_seconds = rate_window_seconds
        self._request_times: Dict[str, List[float]] = defaultdict(list)

    def check_capability(self, agent_id: str, capability: str) -> bool:
        """Check if agent has a specific capability."""
        trust_level = self.registry.get_trust_level(agent_id)
        required = self.CAPABILITY_REQUIREMENTS.get(capability)

        if required is None:
            return False  # Unknown capability

        # Check trust level hierarchy
        level_order = [TrustLevel.INTERNAL, TrustLevel.EXTERNAL, TrustLevel.UNTRUSTED]
        agent_level_idx = level_order.index(trust_level)
        required_level_idx = level_order.index(required)

        return agent_level_idx <= required_level_idx

    def is_rate_limited(self, agent_id: str) -> bool:
        """Check if agent is currently rate limited."""
        trust_level = self.registry.get_trust_level(agent_id)
        limit = self.RATE_LIMITS[trust_level]

        if limit == 0:
            return False  # Unlimited

        # Clean old requests
        now = time.time()
        cutoff = now - self.rate_window_seconds
        self._request_times[agent_id] = [
            t for t in self._request_times[agent_id] if t > cutoff
        ]

        return len(self._request_times[agent_id]) >= limit

    def record_request(self, agent_id: str) -> None:
        """Record a request for rate limiting."""
        self._request_times[agent_id].append(time.time())
        self.registry.update_last_seen(agent_id)
