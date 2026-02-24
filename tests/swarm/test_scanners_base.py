# tests/swarm/test_scanners_base.py
"""Tests for security scanner base classes."""

import pytest
from systems.swarm.guilds.scanners.base import SecurityFinding, SecurityScanner


class TestSecurityFinding:
    """Test SecurityFinding dataclass."""

    def test_finding_has_required_fields(self):
        """Finding should have all required fields."""
        finding = SecurityFinding(
            rule_id="B101",
            severity="medium",
            message="Use of assert detected",
            line=42,
            confidence="high"
        )
        assert finding.rule_id == "B101"
        assert finding.severity == "medium"
        assert finding.message == "Use of assert detected"
        assert finding.line == 42
        assert finding.confidence == "high"

    def test_finding_is_dataclass(self):
        """Finding should be a dataclass for easy construction."""
        finding = SecurityFinding(
            rule_id="B101",
            severity="low",
            message="test",
            line=1,
            confidence="low"
        )
        assert hasattr(finding, '__dataclass_fields__')


class TestSecurityScannerProtocol:
    """Test SecurityScanner protocol."""

    def test_scanner_protocol_exists(self):
        """SecurityScanner should be a Protocol."""
        assert SecurityScanner is not None
