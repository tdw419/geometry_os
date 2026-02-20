"""
CompletionDetector - Pattern matching for render completion detection.

Detects completion signals (100%, Complete, Finished) in extraction results.
"""

import re
import logging
from typing import Dict, Any, Optional, List
from dataclasses import dataclass

logger = logging.getLogger(__name__)


@dataclass
class CompletionMatch:
    """Represents a detected completion match."""
    pattern: str
    text: str
    widget: Dict[str, Any]

    def to_dict(self) -> Dict[str, Any]:
        return {
            "pattern": self.pattern,
            "text": self.text,
            "widget": self.widget
        }


class CompletionDetector:
    """
    Detects render completion from extraction pipeline results.

    Uses regex pattern matching against widget text to identify
    completion indicators like "100%", "Complete", "Finished".
    """

    DEFAULT_PATTERNS = [
        r"100\s*%",           # "100%" or "100 %"
        r"[Cc]omplete",       # "Complete" or "complete"
        r"[Ee]xport\s+finished",
        r"[Dd]one",
        r"[Ff]inished"
    ]

    def __init__(self, patterns: Optional[List[str]] = None):
        """
        Initialize CompletionDetector.

        Args:
            patterns: Custom regex patterns (uses defaults if None)
        """
        self.patterns = [
            re.compile(p) for p in (patterns or self.DEFAULT_PATTERNS)
        ]
        logger.info(f"CompletionDetector initialized with {len(self.patterns)} patterns")

    def detect(self, extraction_result: Dict[str, Any]) -> Optional[CompletionMatch]:
        """
        Check if extraction result indicates completion.

        Args:
            extraction_result: Dict with 'widgets' list from extraction pipeline

        Returns:
            CompletionMatch if completion detected, None otherwise
        """
        widgets = extraction_result.get("widgets", [])

        for widget in widgets:
            text = widget.get("text", "")
            if not text:
                continue

            for pattern in self.patterns:
                if pattern.search(text):
                    logger.info(f"Completion detected: '{text}' matched pattern '{pattern.pattern}'")
                    return CompletionMatch(
                        pattern=pattern.pattern,
                        text=text,
                        widget=widget
                    )

        return None
