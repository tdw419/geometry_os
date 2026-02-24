# systems/swarm/guilds/scanners/bandit.py
"""Bandit security scanner implementation."""

import json
import subprocess
import tempfile
from pathlib import Path
from typing import List

from systems.swarm.guilds.scanners.base import SecurityFinding


class BanditScanner:
    """Bandit-based security scanner for Python code."""

    def __init__(self, severity_threshold: str = "low"):
        self.name = "bandit"
        self._severity_threshold = severity_threshold

    def scan(self, code: str, language: str = "python") -> List[SecurityFinding]:
        """Scan code using bandit."""
        if language != "python":
            return []

        with tempfile.NamedTemporaryFile(
            mode="w",
            suffix=".py",
            delete=False
        ) as f:
            f.write(code)
            temp_path = f.name

        try:
            result = subprocess.run(
                ["bandit", "-f", "json", "-r", temp_path],
                capture_output=True,
                text=True,
                timeout=30
            )

            if result.returncode not in (0, 1):
                return []

            return self._parse_output(result.stdout)

        except subprocess.TimeoutExpired:
            return []
        except FileNotFoundError:
            return []
        finally:
            Path(temp_path).unlink(missing_ok=True)

    def _parse_output(self, json_output: str) -> List[SecurityFinding]:
        """Parse bandit JSON output into findings."""
        if not json_output.strip():
            return []

        try:
            data = json.loads(json_output)
        except json.JSONDecodeError:
            return []

        findings = []
        severity_map = {
            "LOW": "low",
            "MEDIUM": "medium",
            "HIGH": "high",
            "CRITICAL": "critical"
        }

        for issue in data.get("results", []):
            severity = severity_map.get(
                issue.get("issue_severity", "LOW").upper(),
                "low"
            )

            findings.append(SecurityFinding(
                rule_id=issue.get("test_id", "UNKNOWN"),
                severity=severity,
                message=issue.get("issue_text", ""),
                line=issue.get("line_number", 0),
                confidence=issue.get("issue_confidence", "MEDIUM").lower()
            ))

        return findings
