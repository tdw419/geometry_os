# tests/swarm/test_scanners_bandit.py
"""Tests for Bandit security scanner."""

import pytest
from systems.swarm.guilds.scanners.bandit import BanditScanner
from systems.swarm.guilds.scanners.base import SecurityFinding


class TestBanditScanner:
    """Test Bandit scanner implementation."""

    def test_scanner_name(self):
        """Scanner should have correct name."""
        scanner = BanditScanner()
        assert scanner.name == "bandit"

    def test_scan_detects_assert_usage(self):
        """Should detect assert usage (B101)."""
        scanner = BanditScanner()
        code = """
def test_something():
    assert True
    assert 1 + 1 == 2
"""
        findings = scanner.scan(code)
        assert len(findings) >= 1
        assert any(f.rule_id == "B101" for f in findings)

    def test_scan_detects_exec_usage(self):
        """Should detect exec usage (B102)."""
        scanner = BanditScanner()
        code = 'exec("print(1)")'
        findings = scanner.scan(code)
        assert len(findings) >= 1
        assert any(f.rule_id == "B102" for f in findings)

    def test_scan_clean_code_returns_empty(self):
        """Clean code should return no findings."""
        scanner = BanditScanner()
        code = """
def add(a, b):
    return a + b
"""
        findings = scanner.scan(code)
        assert len(findings) == 0

    def test_finding_has_correct_structure(self):
        """Findings should have all required fields."""
        scanner = BanditScanner()
        code = "eval('1+1')"
        findings = scanner.scan(code)

        assert len(findings) >= 1
        finding = findings[0]
        assert isinstance(finding, SecurityFinding)
        assert finding.rule_id.startswith("B")
        assert finding.severity in ("low", "medium", "high", "critical")
        assert finding.line > 0
        assert finding.confidence in ("low", "medium", "high")

    def test_scan_handles_invalid_python(self):
        """Should handle syntax errors gracefully."""
        scanner = BanditScanner()
        code = "this is not valid python !!!"
        findings = scanner.scan(code)
        assert isinstance(findings, list)
