# tests/swarm/ctp/test_types.py
"""Tests for CTP types and constants."""
from systems.swarm.ctp.types import (
    CTPVersion,
    TrustLevel,
    IntentType,
    CTPSignal,
    ContextHash,
)


class TestCTPVersion:
    """Test CTP version constants."""

    def test_version_string(self):
        """Version should be 'CTP/1.0'."""
        assert CTPVersion.VERSION == "CTP/1.0"

    def test_default_port(self):
        """Default port should be 8472."""
        assert CTPVersion.DEFAULT_PORT == 8472


class TestTrustLevel:
    """Test trust level enum."""

    def test_internal_level(self):
        """INTERNAL should have highest capabilities."""
        assert TrustLevel.INTERNAL.value == "INTERNAL"
        assert TrustLevel.INTERNAL.can_publish_skills is True
        assert TrustLevel.INTERNAL.can_vote is True

    def test_external_level(self):
        """EXTERNAL should have limited capabilities."""
        assert TrustLevel.EXTERNAL.value == "EXTERNAL"
        assert TrustLevel.EXTERNAL.can_publish_skills is False
        assert TrustLevel.EXTERNAL.can_subscribe is True

    def test_untrusted_level(self):
        """UNTRUSTED should have minimal capabilities."""
        assert TrustLevel.UNTRUSTED.value == "UNTRUSTED"
        assert TrustLevel.UNTRUSTED.can_query is True
        assert TrustLevel.UNTRUSTED.rate_limit == 10


class TestIntentType:
    """Test intent type enum."""

    def test_core_intents_exist(self):
        """Core intents should be defined."""
        assert IntentType.INTENT.value == "INTENT"
        assert IntentType.INSIGHT.value == "INSIGHT"
        assert IntentType.QUERY.value == "QUERY"
        assert IntentType.FRAGMENT.value == "FRAGMENT"
        assert IntentType.CONSENSUS.value == "CONSENSUS"


class TestContextHash:
    """Test context hash computation."""

    def test_empty_context_hash(self):
        """Empty context should have zero hash."""
        ctx = ContextHash(fragments=[])
        assert ctx.hash == "0x0000000000000000"

    def test_single_fragment_hash(self):
        """Single fragment should produce consistent hash."""
        ctx = ContextHash(fragments=[
            {"namespace": "test", "hash": "abc123", "timestamp": 1.0}
        ])
        assert ctx.hash.startswith("0x")
        assert len(ctx.hash) == 18  # 0x + 16 hex chars

    def test_order_independence(self):
        """Same fragments in different order should produce same hash."""
        fragments = [
            {"namespace": "a", "hash": "h1", "timestamp": 1.0},
            {"namespace": "b", "hash": "h2", "timestamp": 2.0},
        ]
        ctx1 = ContextHash(fragments=fragments)
        ctx2 = ContextHash(fragments=list(reversed(fragments)))
        assert ctx1.hash == ctx2.hash


class TestCTPSignal:
    """Test CTP signal dataclass."""

    def test_minimal_signal(self):
        """Minimal signal should have required fields."""
        signal = CTPSignal(
            message_type="STREAM",
            agent_id="test-agent",
            intent=IntentType.QUERY,
            context_hash="0x0000000000000000",
        )
        assert signal.message_type == "STREAM"
        assert signal.agent_id == "test-agent"
        assert signal.intent == IntentType.QUERY
        assert signal.payload is None
        assert signal.content_type == "text/ascii"

    def test_signal_to_ascii(self):
        """Signal should serialize to ASCII format."""
        signal = CTPSignal(
            message_type="STREAM",
            agent_id="test-agent",
            intent=IntentType.INSIGHT,
            context_hash="0x7f3a9c2e1b4d8f6a",
            content_type="text/ascii",
            payload="test payload",
        )
        ascii_output = signal.to_ascii()
        assert "CTP/1.0 STREAM" in ascii_output
        assert "Agent-ID: test-agent" in ascii_output
        assert "Intent: INSIGHT" in ascii_output
        assert "---CTP-PAYLOAD---" in ascii_output
        assert "test payload" in ascii_output

    def test_signal_from_ascii(self):
        """Signal should parse from ASCII format."""
        ascii_input = """CTP/1.0 STREAM
Agent-ID: test-agent
Intent: QUERY
Context-Hash: 0x7f3a9c2e1b4d8f6a
Content-Type: text/ascii
Content-Length: 12
---CTP-PAYLOAD---
test payload
---CTP-END---
"""
        signal = CTPSignal.from_ascii(ascii_input)
        assert signal.agent_id == "test-agent"
        assert signal.intent == IntentType.QUERY
        assert signal.context_hash == "0x7f3a9c2e1b4d8f6a"
        assert signal.payload == "test payload"
