#!/usr/bin/env python3
"""
Live LLM Terminal Verification

Uses LM Studio to semantically verify terminal functionality.
This test REQUIRES:
- LM Studio running on http://localhost:1234
- A model loaded (qwen2.5-coder-7b-instruct recommended)
- Visual Bridge running on port 8768

This is NOT a mock test - it uses real AI to verify real terminal output.

Run: python systems/visual_shell/api/tests/live_llm_verify.py
"""

import asyncio
import json
import aiohttp
import websockets
from dataclasses import dataclass
from typing import List, Optional


@dataclass
class VerificationResult:
    command: str
    output: str
    passed: bool
    llm_analysis: str
    confidence: float


class LiveLLMVerifier:
    """Uses real LM Studio to verify terminal output."""

    def __init__(self, model: str = "qwen2.5-coder-7b-instruct"):
        self.lm_studio_url = "http://localhost:1234/v1"
        self.model = model

    async def verify_output(
        self, command: str, output: str, expected_behavior: str
    ) -> VerificationResult:
        """Ask LLM to verify if output matches expected behavior."""

        prompt = f"""You are a terminal output analyzer. Verify if this command output is correct.

COMMAND: {command}

OUTPUT:
```
{output}
```

EXPECTED BEHAVIOR: {expected_behavior}

Analyze the output and respond in JSON format:
{{
    "is_correct": true/false,
    "confidence": 0.0-1.0,
    "analysis": "brief explanation of why it's correct or not",
    "issues": ["list of any problems found"]
}}

Be strict - only mark as correct if the output clearly shows the expected behavior."""

        try:
            async with aiohttp.ClientSession() as session:
                async with session.post(
                    f"{self.lm_studio_url}/chat/completions",
                    json={
                        "model": self.model,
                        "messages": [
                            {
                                "role": "system",
                                "content": "You are a terminal verification assistant. Always respond with valid JSON."
                            },
                            {"role": "user", "content": prompt}
                        ],
                        "max_tokens": 500,
                        "temperature": 0.1,
                    },
                    timeout=aiohttp.ClientTimeout(total=30)
                ) as response:
                    if response.status == 200:
                        data = await response.json()
                        llm_response = data["choices"][0]["message"]["content"]

                        # Parse JSON from response
                        try:
                            if "```json" in llm_response:
                                llm_response = llm_response.split("```json")[1].split("```")[0]
                            result = json.loads(llm_response.strip())

                            return VerificationResult(
                                command=command,
                                output=output,
                                passed=result.get("is_correct", False),
                                llm_analysis=result.get("analysis", ""),
                                confidence=result.get("confidence", 0.5)
                            )
                        except json.JSONDecodeError:
                            return VerificationResult(
                                command=command,
                                output=output,
                                passed=False,
                                llm_analysis=f"Failed to parse LLM response: {llm_response[:200]}",
                                confidence=0.0
                            )
                    else:
                        return VerificationResult(
                            command=command,
                            output=output,
                            passed=False,
                            llm_analysis=f"LM Studio error: HTTP {response.status}",
                            confidence=0.0
                        )
        except Exception as e:
            return VerificationResult(
                command=command,
                output=output,
                passed=False,
                llm_analysis=f"Error: {str(e)}",
                confidence=0.0
            )


class LiveTerminalTester:
    """Runs live terminal tests with LLM verification."""

    def __init__(self):
        self.verifier = LiveLLMVerifier()
        self.ws_url = "ws://localhost:8769/terminal?token=live-llm-test"
        self.results: List[VerificationResult] = []

    async def test_command(
        self, ws, command: str, expected_behavior: str, wait_time: float = 2.0
    ) -> VerificationResult:
        """Send command and verify output with LLM."""

        # Clear buffer
        output_buffer = []

        # Send command
        await ws.send(json.dumps({"type": "input", "data": command + "\n"}))

        # Collect output
        try:
            while True:
                msg = await asyncio.wait_for(ws.recv(), timeout=wait_time)
                data = json.loads(msg)
                if data.get("type") == "output":
                    output_buffer.append(data.get("data", ""))
        except asyncio.TimeoutError:
            pass

        full_output = "".join(output_buffer)

        # Verify with LLM
        result = await self.verifier.verify_output(command, full_output, expected_behavior)
        self.results.append(result)

        return result

    async def run_all_tests(self) -> List[VerificationResult]:
        """Run comprehensive terminal tests."""

        test_cases = [
            # Basic commands
            ("echo 'HELLO_WORLD_TEST'", "Output should contain 'HELLO_WORLD_TEST'"),
            ("pwd", "Output should be a valid directory path starting with /"),
            ("whoami", "Output should be a valid username"),

            # Shell features
            ("echo $SHELL", "Output should contain 'bash', 'zsh', or 'fish'"),
            ("uname -a", "Output should show Linux system information"),

            # Error handling
            ("cd /nonexistent_directory_xyz", "Output should show an error message"),
            ("ls -la", "Output should show file listing with permissions"),

            # Multi-line
            ("for i in 1 2 3; do echo $i; done", "Output should show numbers 1, 2, and 3 on separate lines"),
        ]

        print("=" * 60)
        print("🤖 Live LLM Terminal Verification")
        print("=" * 60)
        print("\nPrerequisites:")
        print("  - LM Studio running on http://localhost:1234")
        print("  - Visual Bridge running on ws://localhost:8768")
        print("")

        try:
            async with websockets.connect(self.ws_url, close_timeout=5) as ws:
                # Send resize
                await ws.send(json.dumps({"type": "resize", "cols": 120, "rows": 36}))

                # Initial wait for shell prompt
                await asyncio.sleep(1.0)

                for command, expected in test_cases:
                    print(f"\n🧪 Testing: {command}")

                    result = await self.test_command(ws, command, expected)

                    icon = "✅" if result.passed else "❌"
                    print(f"   {icon} Confidence: {result.confidence:.0%}")
                    print(f"   Analysis: {result.llm_analysis[:100]}...")

        except ConnectionRefusedError:
            print("❌ Cannot connect to Visual Bridge on port 8768")
            print("   Start with: python3 systems/visual_shell/api/visual_bridge.py")
            return []
        except Exception as e:
            print(f"❌ Error: {e}")
            return []

        return self.results

    def print_summary(self):
        """Print test summary."""
        print("\n" + "=" * 60)
        print("📊 Live LLM Verification Summary")
        print("=" * 60)

        passed = sum(1 for r in self.results if r.passed)
        total = len(self.results)

        for r in self.results:
            icon = "✅" if r.passed else "❌"
            print(f"{icon} {r.command}")
            print(f"   {r.llm_analysis[:80]}...")

        print(f"\nResults: {passed}/{total} passed ({passed/total*100:.0f}%)")

        if passed == total:
            print("\n🎉 All tests verified by LLM - Terminal is working correctly!")
        else:
            print("\n⚠️  Some tests failed - review the analysis above")


async def main():
    tester = LiveTerminalTester()

    # Check LM Studio
    print("Checking LM Studio...")
    try:
        async with aiohttp.ClientSession() as session:
            async with session.get(
                "http://localhost:1234/v1/models",
                timeout=aiohttp.ClientTimeout(total=5)
            ) as response:
                if response.status == 200:
                    models = await response.json()
                    print(f"✅ LM Studio available")
                    print(f"   Models: {[m['id'] for m in models.get('data', [])]}")
                else:
                    print("❌ LM Studio returned error")
                    return
    except Exception as e:
        print(f"❌ LM Studio not available: {e}")
        print("   Start LM Studio and load a model")
        return

    await tester.run_all_tests()
    tester.print_summary()


if __name__ == "__main__":
    asyncio.run(main())
