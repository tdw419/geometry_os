# systems/swarm/guilds/linters/ruff.py
"""Ruff-based style and lint checking."""

import json
import subprocess
from dataclasses import dataclass
from typing import List


@dataclass
class StyleViolation:
    """A style or lint violation."""

    code: str
    message: str
    line: int
    column: int
    fixable: bool


class RuffChecker:
    """Ruff-based style and lint checking."""

    def __init__(self, line_length: int = 88):
        self._line_length = line_length

    def check(self, code: str) -> List[StyleViolation]:
        """Run ruff lint on code string."""
        try:
            result = subprocess.run(
                [
                    "ruff", "check",
                    "--output-format=json",
                    f"--line-length={self._line_length}",
                    "--select=E,F,W,I,UP",  # Enable pycodestyle, pyflakes, warnings, isort, pyupgrade
                    "-"
                ],
                input=code,
                capture_output=True,
                text=True,
                timeout=30
            )
            return self._parse_output(result.stdout)
        except subprocess.TimeoutExpired:
            return []
        except FileNotFoundError:
            return []

    def format(self, code: str) -> str:
        """Auto-format code with ruff format."""
        try:
            result = subprocess.run(
                ["ruff", "format", "-"],
                input=code,
                capture_output=True,
                text=True,
                timeout=30
            )
            return result.stdout
        except (subprocess.TimeoutExpired, FileNotFoundError):
            return code

    def _parse_output(self, json_output: str) -> List[StyleViolation]:
        """Parse ruff JSON output into violations."""
        if not json_output.strip():
            return []

        try:
            data = json.loads(json_output)
        except json.JSONDecodeError:
            return []

        violations = []
        for issue in data:
            violations.append(StyleViolation(
                code=issue.get("code", "UNKNOWN"),
                message=issue.get("message", ""),
                line=issue.get("location", {}).get("row", 0),
                column=issue.get("location", {}).get("column", 0),
                fixable=issue.get("fix") is not None
            ))

        return violations
