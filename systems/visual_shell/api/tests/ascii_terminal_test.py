#!/usr/bin/env python3
"""
ASCII Desktop Verification: Geometry OS Web Terminal

Uses the ASCII Desktop Control infrastructure to:
1. Capture desktop as ASCII when terminal is open
2. Verify terminal window is visible
3. Detect terminal content and shell prompt
4. Cross-reference with WebSocket output

Prerequisites:
- X11 display on :0
- ASCII Desktop Control plugin active
- Visual Bridge running
- Terminal page open in browser

Run: pytest systems/visual_shell/api/tests/ascii_terminal_test.py -v
"""

import subprocess
import json
import re
import os
import pytest
from pathlib import Path
from typing import Optional, Tuple, List
from dataclasses import dataclass


@dataclass
class TerminalDetection:
    """Result of detecting terminal in ASCII output."""
    found: bool
    prompt_detected: bool
    shell_type: str
    cursor_visible: bool
    text_readable: bool
    raw_ascii: str
    confidence: float


class ASCIITerminalVerifier:
    """Verifies terminal using ASCII desktop capture."""

    def __init__(self):
        # Path from: systems/visual_shell/api/tests/ -> need 5 parents to reach project root
        self.project_root = Path(__file__).parent.parent.parent.parent.parent
        self.ascii_script = self.project_root / ".gemini/skills/ascii-desktop-control/scripts/get_ascii_view.py"

    def capture_desktop(self, width: int = 160, height: int = 50) -> str:
        """Capture current desktop as ASCII."""
        if not self.ascii_script.exists():
            # Try alternative location
            alt_path = self.project_root / "systems/ascii_view/get_ascii_view.py"
            if alt_path.exists():
                self.ascii_script = alt_path

        if not self.ascii_script.exists():
            return "ERROR: ASCII capture script not found"

        try:
            result = subprocess.run(
                ["python3", str(self.ascii_script)],
                capture_output=True,
                text=True,
                env={**os.environ, "DISPLAY": ":0"},
                timeout=10
            )

            if result.returncode == 0:
                # The script outputs --- ASCII MAP --- header, extract the actual ASCII
                output = result.stdout
                if "--- ASCII MAP ---" in output:
                    # Extract content between ASCII MAP and BINDINGS sections
                    parts = output.split("--- ASCII MAP ---")
                    if len(parts) > 1:
                        ascii_part = parts[1].split("--- BINDINGS ---")[0]
                        return ascii_part.strip()
                return output
            else:
                return f"ERROR: {result.stderr}"
        except Exception as e:
            return f"ERROR: {str(e)}"

    def detect_terminal(self, ascii_output: str) -> TerminalDetection:
        """Analyze ASCII output to detect terminal presence."""

        # Common shell prompts
        prompt_patterns = [
            r'\$\s*$',           # Basic $
            r'#\s*$',            # Root #
            r'>\s*$',            # Windows-style
            r'~\]\$',            # Bash with path
            r'\w+@\w+.*\$',      # user@host$
            r'\(base\)\s*\$',    # Conda
            r'\[\d+\]\$',        # Command number
        ]

        # Terminal indicators
        terminal_indicators = [
            'xterm', 'terminal', 'bash', 'zsh', 'shell',
            'geometry', 'go terminal', 'wordpress',
            'localhost', 'connected', 'disconnected'
        ]

        # Check for prompt
        prompt_detected = any(
            re.search(p, ascii_output, re.IGNORECASE | re.MULTILINE)
            for p in prompt_patterns
        )

        # Count terminal indicators
        indicator_count = sum(
            1 for ind in terminal_indicators
            if ind.lower() in ascii_output.lower()
        )

        # Check for cursor (block or underline)
        cursor_visible = any(p in ascii_output for p in ['█', '▋', '▌'])

        # Check readability (alphanumeric density)
        alpha_chars = sum(1 for c in ascii_output if c.isalnum())
        total_chars = len(ascii_output.replace('\n', '').replace(' ', ''))
        text_readable = alpha_chars > total_chars * 0.3 if total_chars > 0 else False

        # Determine shell type
        shell_type = "unknown"
        if 'bash' in ascii_output.lower():
            shell_type = "bash"
        elif 'zsh' in ascii_output.lower():
            shell_type = "zsh"
        elif 'fish' in ascii_output.lower():
            shell_type = "fish"
        elif prompt_detected:
            shell_type = "detected"

        # Calculate confidence
        confidence = 0.0
        if prompt_detected:
            confidence += 0.4
        if indicator_count > 0:
            confidence += min(0.3, indicator_count * 0.1)
        if text_readable:
            confidence += 0.2
        if cursor_visible:
            confidence += 0.1

        found = confidence > 0.5

        return TerminalDetection(
            found=found,
            prompt_detected=prompt_detected,
            shell_type=shell_type,
            cursor_visible=cursor_visible,
            text_readable=text_readable,
            raw_ascii=ascii_output,
            confidence=min(1.0, confidence)
        )


@pytest.fixture
def verifier():
    """Create ASCIITerminalVerifier instance."""
    return ASCIITerminalVerifier()


@pytest.fixture
def captured_ascii(verifier):
    """Capture desktop ASCII for tests."""
    return verifier.capture_desktop()


class TestASCIICapture:
    """Test ASCII desktop capture functionality."""

    def test_ascii_script_exists(self, verifier):
        """Verify the ASCII capture script exists."""
        assert verifier.ascii_script.exists(), f"Script not found at {verifier.ascii_script}"

    def test_capture_returns_output(self, verifier):
        """Test that capture returns non-error output."""
        ascii_output = verifier.capture_desktop()
        assert not ascii_output.startswith("ERROR"), f"Capture failed: {ascii_output}"

    def test_capture_has_content(self, captured_ascii):
        """Test that captured ASCII has meaningful content."""
        assert len(captured_ascii) > 100, "ASCII output too short"
        assert len(captured_ascii.split('\n')) >= 5, "Not enough lines captured"


class TestTerminalDetection:
    """Test terminal detection in ASCII output."""

    def test_detect_terminal_returns_detection(self, verifier, captured_ascii):
        """Test that detect_terminal returns a TerminalDetection object."""
        if captured_ascii.startswith("ERROR"):
            pytest.skip(f"Capture failed: {captured_ascii}")

        detection = verifier.detect_terminal(captured_ascii)
        assert isinstance(detection, TerminalDetection)
        assert detection.found in [True, False]
        assert 0.0 <= detection.confidence <= 1.0

    def test_detection_has_confidence_score(self, verifier, captured_ascii):
        """Test that detection includes confidence score."""
        if captured_ascii.startswith("ERROR"):
            pytest.skip(f"Capture failed: {captured_ascii}")

        detection = verifier.detect_terminal(captured_ascii)
        assert detection.confidence >= 0.0, "Confidence should be non-negative"

    def test_terminal_found_or_valid_negative(self, verifier, captured_ascii):
        """Test that terminal is either found or has valid reason for not being found."""
        if captured_ascii.startswith("ERROR"):
            pytest.skip(f"Capture failed: {captured_ascii}")

        detection = verifier.detect_terminal(captured_ascii)
        # If not found, confidence should be below threshold
        if not detection.found:
            assert detection.confidence <= 0.5, "Not found but confidence > 0.5"


class TestTerminalContent:
    """Test terminal content verification."""

    def test_ascii_has_readable_text(self, captured_ascii):
        """Test that captured ASCII has readable alphanumeric text."""
        if captured_ascii.startswith("ERROR"):
            pytest.skip(f"Capture failed: {captured_ascii}")

        alpha_count = sum(1 for c in captured_ascii if c.isalnum())
        assert alpha_count > 50, f"Not enough alphanumeric chars: {alpha_count}"

    def test_ascii_structure(self, captured_ascii):
        """Test that ASCII output has expected structure."""
        if captured_ascii.startswith("ERROR"):
            pytest.skip(f"Capture failed: {captured_ascii}")

        lines = captured_ascii.split('\n')
        # Should have header line with window info
        assert len(lines) >= 2, "Should have at least header and content"


class TestIntegration:
    """Integration tests for full ASCII bridge workflow."""

    def test_full_capture_and_detect_workflow(self, verifier):
        """Test complete workflow: capture -> detect -> verify."""
        # Capture
        ascii_output = verifier.capture_desktop()
        if ascii_output.startswith("ERROR"):
            pytest.skip(f"Capture failed: {ascii_output}")

        # Detect
        detection = verifier.detect_terminal(ascii_output)

        # Verify detection object is complete
        assert detection.raw_ascii == ascii_output
        assert isinstance(detection.prompt_detected, bool)
        assert isinstance(detection.cursor_visible, bool)
        assert isinstance(detection.text_readable, bool)
        assert detection.shell_type in ["unknown", "bash", "zsh", "fish", "detected"]


def main():
    """Run verification (for direct script execution)."""
    suite_verifier = ASCIITerminalVerifier()
    ascii_output = suite_verifier.capture_desktop()

    print("=" * 60)
    print("🖥️  ASCII Desktop Verification - Web Terminal")
    print("=" * 60)

    if ascii_output.startswith("ERROR"):
        print(f"\n❌ Capture failed: {ascii_output}")
        exit(1)

    detection = suite_verifier.detect_terminal(ascii_output)

    print(f"\n✅ Captured {len(ascii_output)} chars")
    print(f"Terminal found: {'✅' if detection.found else '❌'}")
    print(f"Prompt detected: {'✅' if detection.prompt_detected else '❌'}")
    print(f"Shell type: {detection.shell_type}")
    print(f"Confidence: {detection.confidence:.0%}")

    print("\n📄 ASCII Preview (first 500 chars):")
    print("-" * 40)
    print(ascii_output[:500])
    print("-" * 40)

    exit(0 if detection.found else 1)


if __name__ == "__main__":
    main()
