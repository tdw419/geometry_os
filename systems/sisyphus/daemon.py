"""
Sisyphus v4 Daemon - Python-based evolution system with FFI integration.

Replaces shell scripts with native Python daemon that:
1. Uses FFI-accelerated Hilbert mapping for glyph operations
2. Monitors performance and offloads bottlenecks
3. Integrates with visual-vm via shared memory
"""

import re
import os
import time
import logging
from dataclasses import dataclass
from enum import Enum
from pathlib import Path
from typing import Optional, List, Callable
from datetime import datetime

from .native_hilbert import NativeHilbertLUT


class TaskState(Enum):
    PENDING = "[ ]"
    IN_PROGRESS = "[→]"
    COMPLETE = "[x]"
    failed = "[!]"


@dataclass
class Task:
    """Represents a task from the state file."""
    number: int
    name: str
    description: str
    verification: Optional[str] = None
    line_number: int = 0

    @property
    def full_description(self) -> str:
        if self.verification:
            return f"{self.description} - **Verification**: {self.verification}"
        return self.description


