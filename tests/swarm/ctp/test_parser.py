# tests/swarm/ctp/test_parser.py
"""Tests for CTP ASCII parser."""
import pytest
from systems.swarm.ctp.parser import CTPParser, ParseError


class TestCTPParser:
    """Test ASCII parsing functionality."""

    def test_parse_simple_headers(self):
        """Parse simple header block."""
        parser = CTPParser()
        text = """CTP/1.0 STREAM
Agent-ID: test-agent
Intent: QUERY
Context-Hash: 0x7f3a
---CTP-PAYLOAD---
---CTP-END---
"""
        result = parser.parse(text)
        assert result["version"] == "CTP/1.0"
        assert result["message_type"] == "STREAM"
        assert result["headers"]["Agent-ID"] == "test-agent"
        assert result["headers"]["Intent"] == "QUERY"

    def test_parse_with_payload(self):
        """Parse message with payload."""
        parser = CTPParser()
        text = """CTP/1.0 STREAM
Agent-ID: test-agent
Intent: INSIGHT
Context-Hash: 0x7f3a
Content-Length: 13
---CTP-PAYLOAD---
Hello, world!
---CTP-END---
"""
        result = parser.parse(text)
        assert result["payload"] == "Hello, world!"

    def test_parse_multiline_payload(self):
        """Parse multiline payload."""
        parser = CTPParser()
        text = """CTP/1.0 STREAM
Agent-ID: test-agent
---CTP-PAYLOAD---
Line 1
Line 2
Line 3
---CTP-END---
"""
        result = parser.parse(text)
        assert "Line 1" in result["payload"]
        assert "Line 2" in result["payload"]
        assert "Line 3" in result["payload"]

    def test_parse_missing_end_marker_raises(self):
        """Missing end marker should raise ParseError."""
        parser = CTPParser()
        text = """CTP/1.0 STREAM
Agent-ID: test-agent
---CTP-PAYLOAD---
Some payload
"""
        with pytest.raises(ParseError, match="Missing ---CTP-END---"):
            parser.parse(text)

    def test_parse_invalid_version_raises(self):
        """Invalid version should raise ParseError."""
        parser = CTPParser()
        text = """HTTP/1.1 OK
Agent-ID: test
---CTP-PAYLOAD---
---CTP-END---
"""
        with pytest.raises(ParseError, match="Invalid CTP version"):
            parser.parse(text)

    def test_parse_empty_message_raises(self):
        """Empty message should raise ParseError."""
        parser = CTPParser()
        with pytest.raises(ParseError, match="Empty message"):
            parser.parse("")

    def test_grep_extract_intent(self):
        """Intent should be grep-able."""
        text = """CTP/1.0 STREAM
Intent: INSIGHT
Agent-ID: test
---CTP-PAYLOAD---
---CTP-END---
"""
        # Simulate grep extraction
        import re
        match = re.search(r"^Intent: (.+)$", text, re.MULTILINE)
        assert match is not None
        assert match.group(1) == "INSIGHT"

    def test_partial_parse_resilience(self):
        """Truncated message should parse what's available."""
        parser = CTPParser()
        text = """CTP/1.0 STREAM
Agent-ID: test-agent
Intent: INSIGH"""  # Truncated
        result = parser.parse_partial(text)
        assert result["headers"].get("Agent-ID") == "test-agent"
        # Intent is truncated but we don't crash
