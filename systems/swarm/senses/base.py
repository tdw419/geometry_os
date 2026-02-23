"""
Base classes for sense operations.
"""

from dataclasses import dataclass
from typing import Any, Optional


@dataclass
class SenseResult:
    """Result wrapper for sense operations."""

    success: bool
    data: Optional[Any] = None
    error: Optional[str] = None

    def __repr__(self) -> str:
        if self.success:
            return f"SenseResult(success=True, data={self.data!r})"
        return f"SenseResult(success=False, error={self.error!r})"
