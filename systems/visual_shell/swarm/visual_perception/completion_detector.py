"""
CompletionDetector - Pattern matching for render completion detection.

Detects completion signals (100%, Complete, Finished) in extraction results.
Also supports PixelRTS v3 HALT opcode detection for geometric programs.
"""

import re
import logging
from typing import Dict, Any, Optional, List, Union
from dataclasses import dataclass

logger = logging.getLogger(__name__)


@dataclass
class CompletionMatch:
    """Represents a detected completion match."""
    pattern: str
    text: str
    widget: Dict[str, Any]
    source: str = "text"  # "text" or "pixelrts3"
    pixelrts3_data: Optional[Dict[str, Any]] = None

    def to_dict(self) -> Dict[str, Any]:
        result = {
            "pattern": self.pattern,
            "text": self.text,
            "widget": self.widget,
            "source": self.source
        }
        if self.pixelrts3_data:
            result["pixelrts3_data"] = self.pixelrts3_data
        return result


class CompletionDetector:
    """
    Detects render completion from extraction pipeline results.

    Uses regex pattern matching against widget text to identify
    completion indicators like "100%", "Complete", "Finished".

    Also supports PixelRTS v3 HALT opcode detection for geometric programs.
    """

    DEFAULT_PATTERNS = [
        r"100\s*%",           # "100%" or "100 %"
        r"[Cc]omplete",       # "Complete" or "complete"
        r"[Ee]xport\s+finished",
        r"[Dd]one",
        r"[Ff]inished"
    ]

    def __init__(self, patterns: Optional[List[str]] = None, detect_pixelrts3: bool = True):
        """
        Initialize CompletionDetector.

        Args:
            patterns: Custom regex patterns (uses defaults if None)
            detect_pixelrts3: Enable PixelRTS v3 HALT detection (default True)
        """
        self.patterns = [
            re.compile(p) for p in (patterns or self.DEFAULT_PATTERNS)
        ]
        self.detect_pixelrts3 = detect_pixelrts3
        self._pixelrts3_detector = None

        if detect_pixelrts3:
            try:
                from systems.visual_shell.swarm.visual_perception.pixelrts3_detector import PixelRTS3Detector
                self._pixelrts3_detector = PixelRTS3Detector()
                logger.info("CompletionDetector initialized with text patterns + PixelRTS v3 detection")
            except ImportError:
                logger.warning("PixelRTS3Detector not available, text-only mode")

        logger.info(f"CompletionDetector initialized with {len(self.patterns)} text patterns")

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
                        widget=widget,
                        source="text"
                    )

        return None

    def detect_from_screenshot(self, screenshot_path: str) -> Optional[CompletionMatch]:
        """
        Detect completion from a screenshot file.

        First tries PixelRTS v3 HALT detection (if enabled), then falls back
        to text extraction.

        Args:
            screenshot_path: Path to screenshot image

        Returns:
            CompletionMatch if completion detected, None otherwise
        """
        # Try PixelRTS v3 detection first (more reliable)
        if self._pixelrts3_detector:
            pixelrts3_match = self._pixelrts3_detector.detect_halt(screenshot_path)
            if pixelrts3_match:
                logger.info(f"PixelRTS v3 HALT detected at PC={pixelrts3_match.pc}")
                return CompletionMatch(
                    pattern=f"pixelrts3:halt",
                    text=f"HALT at PC={pixelrts3_match.pc}",
                    widget={"type": "pixelrts3_instruction", "rgba": list(pixelrts3_match.rgba)},
                    source="pixelrts3",
                    pixelrts3_data=pixelrts3_match.to_dict()
                )

        return None

    def extract_pixelrts3_program(self, screenshot_path: str, max_instructions: int = 100) -> List[Dict[str, Any]]:
        """
        Extract PixelRTS v3 program from screenshot.

        Args:
            screenshot_path: Path to .rts.png file
            max_instructions: Maximum instructions to extract

        Returns:
            List of decoded instructions
        """
        if not self._pixelrts3_detector:
            logger.warning("PixelRTS v3 detection not available")
            return []

        return self._pixelrts3_detector.extract_program(screenshot_path, max_instructions)
