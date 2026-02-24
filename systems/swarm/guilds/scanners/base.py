# systems/swarm/guilds/scanners/base.py
"""Base classes for security scanners."""

from dataclasses import dataclass
from typing import List, Protocol, runtime_checkable


@dataclass
class SecurityFinding:
    """A security vulnerability finding."""

    rule_id: str       # "B101" for bandit
    severity: str      # "low" | "medium" | "high" | "critical"
    message: str
    line: int
    confidence: str    # "low" | "medium" | "high"


@runtime_checkable
class SecurityScanner(Protocol):
    """Interface for security scanning providers."""

    name: str

    def scan(self, code: str, language: str = "python") -> List[SecurityFinding]:
        """Scan code for security vulnerabilities.

        Args:
            code: Source code to scan
            language: Programming language (default: python)

        Returns:
            List of security findings
        """
        ...
