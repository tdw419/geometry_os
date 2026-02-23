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

Run: python systems/visual_shell/api/tests/ascii_terminal_test.py
"""

import subprocess
import json
import re
import time
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
        self.project_root = Path(__file__).parent.parent.parent.parent
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
                ["python3", str(self.ascii_script), str(width), str(height)],
                capture_output=True,
                text=True,
                env={**subprocess.os.environ, "DISPLAY": ":0"},
                timeout=10
            )

            if result.returncode == 0:
                # Parse JSON output if available
                try:
                    data = json.loads(result.stdout)
                    return data.get("ascii", result.stdout)
                except json.JSONDecodeError:
                    return result.stdout
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
        cursor_patterns = [r'█', r'▋', r'▌', r'_\s*$']
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


class TerminalVerificationSuite:
    """Complete verification suite using ASCII capture."""

    def __init__(self):
        self.verifier = ASCIITerminalVerifier()
        self.results = []

    def test_desktop_capture(self) -> Tuple[bool, str]:
        """Test that ASCII capture is working."""
        print("\n🧪 Test 1: Desktop Capture")
        ascii_output = self.verifier.capture_desktop()

        if ascii_output.startswith("ERROR"):
            print(f"   ❌ Capture failed: {ascii_output}")
            return False, ascii_output

        lines = ascii_output.split('\n')
        print(f"   ✅ Captured {len(lines)} lines")
        return True, ascii_output

    def test_terminal_detection(self, ascii_output: str) -> TerminalDetection:
        """Test terminal detection in ASCII output."""
        print("\n🧪 Test 2: Terminal Detection")

        detection = self.verifier.detect_terminal(ascii_output)

        print(f"   Found: {'✅' if detection.found else '❌'}")
        print(f"   Prompt: {'✅' if detection.prompt_detected else '❌'}")
        print(f"   Shell: {detection.shell_type}")
        print(f"   Confidence: {detection.confidence:.0%}")

        return detection

    def test_terminal_content(
        self, expected_content: str = None
    ) -> Tuple[bool, str]:
        """Test specific content in terminal."""
        print("\n🧪 Test 3: Terminal Content")

        ascii_output = self.verifier.capture_desktop(120, 36)

        if expected_content:
            found = expected_content.lower() in ascii_output.lower()
            print(f"   Expected '{expected_content}': {'✅' if found else '❌'}")
            return found, ascii_output

        # Generic check for shell activity
        has_prompt = any(c in ascii_output for c in ['$', '#', '>'])
        has_text = len(re.findall(r'[a-zA-Z]{3,}', ascii_output)) > 5

        print(f"   Has prompt: {'✅' if has_prompt else '❌'}")
        print(f"   Has readable text: {'✅' if has_text else '❌'}")

        return has_prompt and has_text, ascii_output

    def run_all_tests(self) -> dict:
        """Run complete verification suite."""
        print("=" * 60)
        print("🖥️  ASCII Desktop Verification - Web Terminal")
        print("=" * 60)

        results = {
            "capture_works": False,
            "terminal_found": False,
            "content_verified": False,
            "details": {}
        }

        # Test 1: Capture
        capture_ok, ascii_output = self.test_desktop_capture()
        results["capture_works"] = capture_ok

        if not capture_ok:
            print("\n❌ Cannot proceed - desktop capture not working")
            return results

        # Test 2: Detection
        detection = self.test_terminal_detection(ascii_output)
        results["terminal_found"] = detection.found
        results["details"]["detection"] = {
            "prompt": detection.prompt_detected,
            "shell": detection.shell_type,
            "confidence": detection.confidence
        }

        # Test 3: Content
        content_ok, _ = self.test_terminal_content()
        results["content_verified"] = content_ok

        # Summary
        print("\n" + "=" * 60)
        print("📊 Results Summary")
        print("=" * 60)

        total = 3
        passed = sum([
            results["capture_works"],
            results["terminal_found"],
            results["content_verified"]
        ])

        print(f"Capture: {'✅' if results['capture_works'] else '❌'}")
        print(f"Terminal: {'✅' if results['terminal_found'] else '❌'}")
        print(f"Content: {'✅' if results['content_verified'] else '❌'}")
        print(f"\nTotal: {passed}/{total} ({passed/total*100:.0f}%)")

        if passed == total:
            print("\n🎉 Terminal verified via ASCII capture!")
        else:
            print("\n⚠️  Some checks failed - ensure terminal is visible on screen")

        # Print sample of ASCII output
        print("\n📄 ASCII Preview (first 500 chars):")
        print("-" * 40)
        print(ascii_output[:500])
        print("-" * 40)

        return results


def main():
    """Run verification."""
    suite = TerminalVerificationSuite()
    results = suite.run_all_tests()

    # Exit code based on results
    exit(0 if results.get("terminal_found", False) else 1)


if __name__ == "__main__":
    main()
