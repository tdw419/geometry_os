#!/usr/bin/env python3
"""
LLM Verification Test: Geometry OS Web Terminal

Uses LM Studio local LLM to:
1. Interpret terminal output ASCII
2. Verify command responses are correct
3. Detect error patterns
4. Confirm terminal functionality

Prerequisites:
- LM Studio running on http://localhost:1234
- Model loaded (qwen2.5-coder-7b-instruct recommended)
- Visual Bridge running on port 8768

Run: python systems/visual_shell/api/tests/llm_terminal_verify.py

For CI environments without LM Studio:
TERMINAL_TEST_MOCK_LLM=1 python systems/visual_shell/api/tests/llm_terminal_verify.py
"""

import asyncio
import json
import os
import aiohttp
import websockets
from dataclasses import dataclass
from typing import Optional, List
from datetime import datetime

# Mock mode for CI environments without LM Studio
TERMINAL_TEST_MOCK_LLM = os.environ.get('TERMINAL_TEST_MOCK_LLM', '0') == '1'


@dataclass
class VerificationResult:
    test_name: str
    passed: bool
    llm_response: str
    confidence: float
    details: str


class MockLLMVerifier:
    """Mock LLM verifier for CI environments without LM Studio."""

    def __init__(self):
        self.model = "mock-llm"

    async def ask_llm(self, prompt: str, max_tokens: int = 500) -> str:
        """Return mock JSON response."""
        # Determine response based on prompt content
        if "is_correct" in prompt:
            # Command verification response
            return json.dumps({
                "is_correct": True,
                "confidence": 0.95,
                "analysis": "Mock: Command output matches expected pattern",
                "issues": []
            })
        elif "is_working_terminal" in prompt:
            # ASCII terminal analysis response
            return json.dumps({
                "is_working_terminal": True,
                "confidence": 0.90,
                "shell_detected": "bash",
                "issues": []
            })
        else:
            # Generic mock response
            return json.dumps({
                "result": "mock",
                "confidence": 0.85,
                "details": "Mock response for CI testing"
            })

    async def verify_command_output(
        self, command: str, output: str, expected_pattern: str
    ) -> VerificationResult:
        """Mock verification - returns success if expected pattern in output."""
        # Check if expected pattern is in output (simple mock verification)
        passed = expected_pattern.lower() in output.lower()

        return VerificationResult(
            test_name=f"Command: {command}",
            passed=passed,
            llm_response=json.dumps({
                "is_correct": passed,
                "confidence": 0.95,
                "analysis": f"Mock: {'Pattern found' if passed else 'Pattern not found'} in output",
                "issues": [] if passed else [f"Expected '{expected_pattern}' not found"]
            }),
            confidence=0.95,
            details=f"Mock: {'PASS' if passed else 'FAIL'} - expected '{expected_pattern}'"
        )


class LLMTerminalVerifier:
    """Uses local LLM to verify terminal functionality."""

    def __init__(self, lm_studio_url: str = "http://localhost:1234/v1"):
        self.lm_studio_url = lm_studio_url
        self.model = "qwen2.5-coder-7b-instruct"

    async def ask_llm(self, prompt: str, max_tokens: int = 500) -> str:
        """Send prompt to LM Studio and get response."""
        payload = {
            "model": self.model,
            "messages": [
                {
                    "role": "system",
                    "content": "You are a terminal output analyzer. Respond with JSON containing 'analysis', 'is_correct', 'confidence' (0-1), and 'issues' fields."
                },
                {"role": "user", "content": prompt}
            ],
            "max_tokens": max_tokens,
            "temperature": 0.1,  # Low temp for deterministic analysis
        }

        try:
            async with aiohttp.ClientSession() as session:
                async with session.post(
                    f"{self.lm_studio_url}/chat/completions",
                    json=payload,
                    timeout=aiohttp.ClientTimeout(total=30)
                ) as response:
                    if response.status == 200:
                        data = await response.json()
                        return data["choices"][0]["message"]["content"]
                    else:
                        return f"Error: HTTP {response.status}"
        except Exception as e:
            return f"Error: {str(e)}"

    async def verify_command_output(
        self, command: str, output: str, expected_pattern: str
    ) -> VerificationResult:
        """Use LLM to verify command output matches expected behavior."""

        prompt = f"""Analyze this terminal interaction and verify it's correct:

Command: {command}
Output:
```
{output}
```

Expected: {expected_pattern}

Respond in JSON format:
{{
    "is_correct": true/false,
    "confidence": 0.0-1.0,
    "analysis": "brief explanation",
    "issues": ["list of any problems found"]
}}"""

        llm_response = await self.ask_llm(prompt)

        try:
            # Try to parse JSON from response
            if "```json" in llm_response:
                llm_response = llm_response.split("```json")[1].split("```")[0]
            elif "```" in llm_response:
                llm_response = llm_response.split("```")[1].split("```")[0]

            result = json.loads(llm_response.strip())
            return VerificationResult(
                test_name=f"Command: {command}",
                passed=result.get("is_correct", False),
                llm_response=llm_response,
                confidence=result.get("confidence", 0.5),
                details=result.get("analysis", "")
            )
        except json.JSONDecodeError:
            # Fallback to keyword matching
            passed = expected_pattern.lower() in output.lower()
            return VerificationResult(
                test_name=f"Command: {command}",
                passed=passed,
                llm_response=llm_response,
                confidence=0.7 if passed else 0.3,
                details="Keyword match (LLM JSON parse failed)"
            )


class TerminalTestRunner:
    """Runs terminal tests and verifies with LLM."""

    def __init__(self, verifier=None):
        self.verifier = verifier if verifier else LLMTerminalVerifier()
        self.ws_url = "ws://localhost:8768/terminal?token=llm-test-token"
        self.results: List[VerificationResult] = []

    async def connect_and_test(self) -> List[VerificationResult]:
        """Connect to terminal and run test commands."""

        test_commands = [
            ("echo 'LLM_TEST_12345'", "LLM_TEST_12345"),
            ("pwd", "/"),  # Should show a directory path
            ("echo $SHELL", "bash"),  # Should mention shell
            ("uname -a", "Linux"),  # Should show system info
        ]

        # In mock mode, run mock tests without Visual Bridge
        if TERMINAL_TEST_MOCK_LLM:
            return await self.run_mock_tests(test_commands)

        try:
            async with websockets.connect(
                self.ws_url, close_timeout=5
            ) as ws:
                # Send resize
                await ws.send(json.dumps({
                    "type": "resize",
                    "cols": 120,
                    "rows": 36
                }))

                for command, expected in test_commands:
                    print(f"\n🧪 Testing: {command}")

                    # Clear buffer
                    output_buffer = []

                    # Send command
                    await ws.send(json.dumps({
                        "type": "input",
                        "data": command + "\n"
                    }))

                    # Collect output for 2 seconds
                    try:
                        while True:
                            msg = await asyncio.wait_for(ws.recv(), timeout=2.0)
                            data = json.loads(msg)
                            if data.get("type") == "output":
                                output_buffer.append(data.get("data", ""))
                    except asyncio.TimeoutError:
                        pass

                    full_output = "".join(output_buffer)
                    print(f"   Output: {full_output[:100]}...")

                    # Verify with LLM
                    result = await self.verifier.verify_command_output(
                        command, full_output, expected
                    )
                    self.results.append(result)

                    status = "✅" if result.passed else "❌"
                    print(f"   {status} Confidence: {result.confidence:.0%}")

        except ConnectionRefusedError:
            print("⚠️  Visual Bridge not running - creating mock results")
            for command, expected in test_commands:
                self.results.append(VerificationResult(
                    test_name=f"Command: {command}",
                    passed=False,
                    llm_response="Visual Bridge not available",
                    confidence=0.0,
                    details="SKIPPED - No connection"
                ))
        except Exception as e:
            print(f"❌ Test error: {e}")

        return self.results

    async def run_mock_tests(self, test_commands: list) -> List[VerificationResult]:
        """Run mock tests in CI environment without Visual Bridge."""
        print("   Using mock terminal outputs for CI testing")

        # Mock outputs that would come from a real terminal
        mock_outputs = {
            "echo 'LLM_TEST_12345'": "LLM_TEST_12345\n",
            "pwd": "/home/user\n",
            "echo $SHELL": "/bin/bash\n",
            "uname -a": "Linux hostname 6.1.0-generic #1 SMP x86_64 GNU/Linux\n",
        }

        for command, expected in test_commands:
            print(f"\n🧪 Testing: {command}")

            # Use mock output
            mock_output = mock_outputs.get(command, f"mock output for {command}\n")
            print(f"   Output: {mock_output[:50]}...")

            # Verify with mock LLM
            result = await self.verifier.verify_command_output(
                command, mock_output, expected
            )
            self.results.append(result)

            status = "✅" if result.passed else "❌"
            print(f"   {status} Confidence: {result.confidence:.0%}")

        return self.results

    async def verify_ascii_output(self, ascii_data: str) -> VerificationResult:
        """Use LLM to analyze ASCII terminal screenshot."""

        prompt = f"""Analyze this ASCII representation of a terminal screen and determine if it shows a working terminal:

ASCII Screen:
```
{ascii_data}
```

Check for:
1. Shell prompt (usually ends in $ or #)
2. Readable text
3. No obvious error messages
4. Terminal appears responsive

Respond in JSON:
{{
    "is_working_terminal": true/false,
    "confidence": 0.0-1.0,
    "shell_detected": "bash/zsh/fish/unknown",
    "issues": ["list of problems"]
}}"""

        llm_response = await self.verifier.ask_llm(prompt)

        try:
            if "```json" in llm_response:
                llm_response = llm_response.split("```json")[1].split("```")[0]
            result = json.loads(llm_response.strip())
            return VerificationResult(
                test_name="ASCII Terminal Analysis",
                passed=result.get("is_working_terminal", False),
                llm_response=llm_response,
                confidence=result.get("confidence", 0.5),
                details=f"Shell: {result.get('shell_detected', 'unknown')}"
            )
        except json.JSONDecodeError:
            return VerificationResult(
                test_name="ASCII Terminal Analysis",
                passed=False,
                llm_response=llm_response,
                confidence=0.3,
                details="JSON parse failed"
            )


async def main():
    """Run all LLM verification tests."""
    print("=" * 60)
    print("🤖 Geometry OS Web Terminal - LLM Verification")
    print("=" * 60)

    # Check mock mode
    if TERMINAL_TEST_MOCK_LLM:
        print("\n🔄 Running in MOCK mode (CI environment)")
        verifier = MockLLMVerifier()
        runner = TerminalTestRunner(verifier=verifier)
    else:
        # Check LM Studio availability
        print("\n📡 Checking LM Studio...")
        try:
            async with aiohttp.ClientSession() as session:
                async with session.get(
                    "http://localhost:1234/v1/models",
                    timeout=aiohttp.ClientTimeout(total=5)
                ) as response:
                    if response.status == 200:
                        models = await response.json()
                        print(f"   ✅ LM Studio available")
                        print(f"   Models: {[m['id'] for m in models.get('data', [])]}")
                    else:
                        print("   ⚠️ LM Studio returned error")
                        print("   Set TERMINAL_TEST_MOCK_LLM=1 for CI environments")
                        return
        except Exception as e:
            print(f"   ❌ LM Studio not available: {e}")
            print("   Run: lmstudio or start LM Studio server")
            print("   Or set TERMINAL_TEST_MOCK_LLM=1 for CI environments")
            return

        runner = TerminalTestRunner()

    # Run terminal tests
    print("\n🔌 Connecting to Visual Bridge...")
    results = await runner.connect_and_test()

    # Summary
    print("\n" + "=" * 60)
    print("📊 LLM Verification Results")
    print("=" * 60)

    passed = sum(1 for r in results if r.passed)
    total = len(results)

    for r in results:
        icon = "✅" if r.passed else "❌"
        print(f"{icon} {r.test_name}")
        print(f"   Confidence: {r.confidence:.0%} | {r.details}")

    print(f"\nTotal: {passed}/{total} passed ({passed/total*100:.0f}%)")

    # Overall assessment
    if passed == total:
        print("\n🎉 All tests passed! Web terminal is working correctly.")
    elif passed >= total * 0.5:
        print("\n⚠️  Partial success. Some tests failed - review details above.")
    else:
        print("\n❌ Most tests failed. Web terminal may not be working correctly.")


if __name__ == "__main__":
    asyncio.run(main())
