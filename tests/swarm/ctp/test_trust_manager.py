# tests/swarm/ctp/test_trust_manager.py
"""Tests for CTP trust manager."""
import time
from systems.swarm.ctp.trust_manager import TrustManager, AgentRegistry
from systems.swarm.ctp.types import TrustLevel


class TestAgentRegistry:
    """Test agent registration."""

    def test_register_new_agent(self):
        """Register a new external agent."""
        registry = AgentRegistry()
        agent_id = registry.register(
            agent_id="phone-alpha-7",
            capabilities=["query", "fragment_receive"],
            trust_level=TrustLevel.EXTERNAL,
        )
        assert agent_id == "phone-alpha-7"
        assert registry.get_trust_level("phone-alpha-7") == TrustLevel.EXTERNAL

    def test_get_capabilities(self):
        """Get agent capabilities."""
        registry = AgentRegistry()
        registry.register(
            agent_id="test-agent",
            capabilities=["query", "skill_subscribe"],
            trust_level=TrustLevel.EXTERNAL,
        )
        caps = registry.get_capabilities("test-agent")
        assert "query" in caps
        assert "skill_subscribe" in caps

    def test_unknown_agent_returns_untrusted(self):
        """Unknown agent should be UNTRUSTED."""
        registry = AgentRegistry()
        level = registry.get_trust_level("unknown-agent")
        assert level == TrustLevel.UNTRUSTED

    def test_update_last_seen(self):
        """Update last seen timestamp."""
        registry = AgentRegistry()
        registry.register("test", [], TrustLevel.EXTERNAL)
        before = registry.get_last_seen("test")
        time.sleep(0.1)
        registry.update_last_seen("test")
        after = registry.get_last_seen("test")
        assert after > before


class TestTrustManager:
    """Test trust validation and capability checks."""

    def test_check_capability_allowed(self):
        """Internal agent can publish skills."""
        manager = TrustManager()
        manager.registry.register("internal-1", [], TrustLevel.INTERNAL)
        assert manager.check_capability("internal-1", "publish_skills") is True

    def test_check_capability_denied(self):
        """External agent cannot publish skills."""
        manager = TrustManager()
        manager.registry.register("external-1", [], TrustLevel.EXTERNAL)
        assert manager.check_capability("external-1", "publish_skills") is False

    def test_check_query_allowed_for_all(self):
        """All trust levels can query."""
        manager = TrustManager()
        for level in TrustLevel:
            agent_id = f"agent-{level.value}"
            manager.registry.register(agent_id, [], level)
            assert manager.check_capability(agent_id, "query") is True

    def test_is_rate_limited_untrusted(self):
        """Untrusted agent is rate limited."""
        manager = TrustManager()
        agent_id = "untrusted-1"
        manager.registry.register(agent_id, [], TrustLevel.UNTRUSTED)

        # Should not be limited initially
        assert manager.is_rate_limited(agent_id) is False

        # After 10 requests, should be limited
        for _ in range(10):
            manager.record_request(agent_id)

        assert manager.is_rate_limited(agent_id) is True

    def test_is_rate_limited_internal_unlimited(self):
        """Internal agent is never rate limited."""
        manager = TrustManager()
        agent_id = "internal-1"
        manager.registry.register(agent_id, [], TrustLevel.INTERNAL)

        # Even after many requests
        for _ in range(1000):
            manager.record_request(agent_id)
            assert manager.is_rate_limited(agent_id) is False

    def test_rate_limit_window_expires(self):
        """Rate limit should expire after window."""
        manager = TrustManager(rate_window_seconds=1)
        agent_id = "external-1"
        manager.registry.register(agent_id, [], TrustLevel.EXTERNAL)

        # Hit the limit
        for _ in range(100):
            manager.record_request(agent_id)

        assert manager.is_rate_limited(agent_id) is True

        # Wait for window to expire
        time.sleep(1.1)
        assert manager.is_rate_limited(agent_id) is False
