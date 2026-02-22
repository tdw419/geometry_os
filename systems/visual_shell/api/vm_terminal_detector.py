#!/usr/bin/env python3
"""
VM Terminal Detector

Scans VM framebuffer/textures to detect terminal windows and extract content.
Uses heuristics to identify terminal-like text patterns.

Architecture:
┌──────────────────────┐     ┌──────────────────────┐
│ VM Framebuffer       │ ──► │ VmTerminalDetector   │
│ (texture/screenshot) │     │ scan()               │
└──────────────────────┘     └──────────────────────┘
                                      │
                                      ▼
                             ┌──────────────────────┐
                             │ ExtractionPipeline   │
                             │ (OCR + Analysis)     │
                             └──────────────────────┘
"""

import re
import logging
from dataclasses import dataclass
from typing import List, Optional, Tuple, Dict, Any
from pathlib import Path
import sys

logger = logging.getLogger("vm_terminal_detector")


@dataclass
class TerminalCandidate:
    """A detected potential terminal window."""
    bbox: Tuple[int, int, int, int]  # x, y, w, h
    text: str
    confidence: float  # 0.0 to 1.0
    shell_prompt: bool  # Does it have a shell prompt?
    grid_size: Tuple[int, int]  # Estimated cols, rows


class VmTerminalDetector:
    """
    Detects terminal windows in VM framebuffers.
    """

    # Patterns that indicate terminal content
    TERMINAL_PATTERNS = [
        r'\$\s*$',              # $ prompt
        r'#\s*$',               # # prompt (root)
        r'>\s*$',               # > prompt
        r'\w+@\w+.*[#$]\s*$',   # user@host prompt
        r'\[\d+\]',             # [0] style indicators
        r'total\s+\d+',         # ls -la output
        r'drwx[rwx-]+',         # directory listing
        r'-rwx[rwx-]+',         # file listing
        r'\x1b\[[0-9;]+m',      # ANSI escape sequences
    ]

    # Patterns that indicate GUI content (not terminal)
    GUI_PATTERNS = [
        r'\[Button\]',
        r'\[Menu\]',
        r'File\s+Edit\s+View',
        r'Click here',
        r'<[a-z]+>',            # HTML-like tags
    ]

    def __init__(self, min_confidence: float = 0.5):
        """
        Initialize detector.

        Args:
            min_confidence: Minimum confidence threshold
        """
        self.min_confidence = min_confidence
        self._terminal_re = [re.compile(p) for p in self.TERMINAL_PATTERNS]
        self._gui_re = [re.compile(p) for p in self.GUI_PATTERNS]

    def scan(self, image_path: str) -> List[TerminalCandidate]:
        """
        Scan an image for terminal windows.

        Args:
            image_path: Path to VM screenshot/framebuffer

        Returns:
            List of TerminalCandidate objects
        """
        candidates = []

        # Try to use extraction pipeline if available
        try:
            conductor_path = Path(__file__).parent.parent.parent.parent / "conductor/tracks/shotcut-on-the-map"
            if conductor_path.exists():
                sys.path.insert(0, str(conductor_path))
                try:
                    from extraction_pipeline import ExtractionPipeline
                    pipeline = ExtractionPipeline()
                    result = pipeline.extract(image_path)

                    # Strategy A: Check widgets labeled as TERMINAL or similar
                    for widget in result.widgets:
                        if widget.type.name in ["TERMINAL", "WINDOW"] and self.is_terminal_like(widget.text):
                            grid_size = self.estimate_grid_size(widget.text)
                            candidates.append(TerminalCandidate(
                                bbox=tuple(widget.bbox),
                                text=widget.text,
                                confidence=0.9,
                                shell_prompt=bool(self._find_prompt(widget.text)),
                                grid_size=grid_size
                            ))

                    # Strategy B: Check clusters
                    for cluster in result.clusters:
                        cluster_text = " ".join([e.text for e in cluster.elements])
                        if self.is_terminal_like(cluster_text):
                            grid_size = self.estimate_grid_size(cluster_text)
                            candidates.append(TerminalCandidate(
                                bbox=tuple(cluster.bounds),
                                text=cluster_text,
                                confidence=0.8,
                                shell_prompt=bool(self._find_prompt(cluster_text)),
                                grid_size=grid_size
                            ))
                except Exception as e:
                    logger.error(f"Error during ExtractionPipeline processing: {e}")
            else:
                logger.warning(f"Conductor path not found: {conductor_path}")

        except ImportError:
            logger.warning("ExtractionPipeline not available, using basic detection")

        # Deduplicate results (if needed)
        return self._deduplicate([c for c in candidates if c.confidence >= self.min_confidence])

    def is_terminal_like(self, text: str) -> bool:
        """
        Check if text looks like terminal output.

        Args:
            text: Text to analyze

        Returns:
            True if text appears to be from a terminal
        """
        if not text or not text.strip():
            return False
            
        # Check for terminal patterns
        terminal_score = 0
        for pattern in self._terminal_re:
            if pattern.search(text):
                terminal_score += 1

        # Check for GUI patterns (negative signal)
        gui_score = 0
        for pattern in self._gui_re:
            if pattern.search(text):
                gui_score += 1

        # Calculate confidence
        if gui_score > 0:
            return False
            
        if terminal_score >= 1:
            return True

        return False

    def _find_prompt(self, text: str) -> Optional[str]:
        """Find shell prompt in text."""
        for pattern in self._terminal_re[:4]:  # Check first 4 patterns (prompts)
            match = pattern.search(text)
            if match:
                return match.group()
        return None

    def estimate_grid_size(self, text: str, char_width: int = 8, char_height: int = 16) -> Tuple[int, int]:
        """
        Estimate terminal grid size from text.

        Args:
            text: Terminal text content
            char_width: Character width in pixels
            char_height: Character height in pixels

        Returns:
            (cols, rows) tuple
        """
        lines = text.split('\n')
        max_width = max((len(line) for line in lines), default=80)
        rows = min(len(lines), 100)  # Cap at 100 rows

        cols = min(max_width, 200)  # Cap at 200 cols
        
        # Ensure minimums
        cols = max(cols, 40)
        rows = max(rows, 10)

        return (cols, rows)

    def _deduplicate(self, candidates: List[TerminalCandidate]) -> List[TerminalCandidate]:
        """Removes overlapping detected terminal regions."""
        if not candidates:
            return []
            
        unique = []
        # Sort by area descending
        sorted_candidates = sorted(
            candidates, 
            key=lambda x: (x.bbox[2]-x.bbox[0]) * (x.bbox[3]-x.bbox[1]), 
            reverse=True
        )
        
        for c in sorted_candidates:
            is_sub_region = False
            for u in unique:
                if self._is_inside(c.bbox, u.bbox):
                    is_sub_region = True
                    break
            if not is_sub_region:
                unique.append(c)
        return unique

    def _is_inside(self, inner: Tuple[int, int, int, int], outer: Tuple[int, int, int, int]) -> bool:
        return (inner[0] >= outer[0] and inner[1] >= outer[1] and
                inner[2] <= outer[2] and inner[3] <= outer[3])


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("image", help="Path to VM framebuffer screenshot")
    args = parser.parse_args()
    
    logging.basicConfig(level=logging.INFO)
    detector = VmTerminalDetector()
    results = detector.scan(args.image)
    
    print(f"Found {len(results)} terminal regions:")
    for i, res in enumerate(results):
        print(f"[{i}] {res.bbox} -> Grid: {res.grid_size}, Prompt: {res.shell_prompt}")
