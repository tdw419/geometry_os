#!/usr/bin/env python3
"""
WebMCP Terminal Verification

Uses WordPress REST API and WebMCP patterns to verify terminal functionality.
This test verifies the full stack: WordPress → Plugin → Visual Bridge → PTY

Run: python systems/visual_shell/api/tests/webmcp_verify.py
"""

import asyncio
import json
import aiohttp
from dataclasses import dataclass
from typing import Optional, List
from datetime import datetime


@dataclass
class WebMCPTestResult:
    test_name: str
    passed: bool
    response_time_ms: float
    details: str


class WebMCPTerminalVerifier:
    """
    Verifies terminal via WordPress REST API.

    Uses the same patterns as wordpress_mcp.js but in Python.
    Tests the full request path: HTTP → WordPress → Plugin → Response
    """

    def __init__(self, wp_url: str = "http://localhost/wordpress"):
        self.wp_url = wp_url
        self.api_base = f"{wp_url}/wp-json/geometry-os/v1"
        self.results: List[WebMCPTestResult] = []

    async def check_plugin_active(self) -> WebMCPTestResult:
        """Verify the terminal plugin is active in WordPress."""
        start = datetime.now()

        try:
            async with aiohttp.ClientSession() as session:
                # Check if plugin REST endpoints exist
                async with session.get(
                    f"{self.wp_url}/wp-json/",
                    timeout=aiohttp.ClientTimeout(total=10)
                ) as response:
                    elapsed = (datetime.now() - start).total_seconds() * 1000

                    if response.status == 200:
                        data = await response.json()
                        routes = data.get("routes", {})

                        # Check for geometry-os routes
                        geo_routes = [r for r in routes if "geometry-os" in r]

                        return WebMCPTestResult(
                            test_name="Plugin REST API Active",
                            passed=len(geo_routes) > 0,
                            response_time_ms=elapsed,
                            details=f"Found {len(geo_routes)} geometry-os routes"
                        )
                    else:
                        return WebMCPTestResult(
                            test_name="Plugin REST API Active",
                            passed=False,
                            response_time_ms=elapsed,
                            details=f"HTTP {response.status}"
                        )
        except Exception as e:
            return WebMCPTestResult(
                test_name="Plugin REST API Active",
                passed=False,
                response_time_ms=0,
                details=f"Error: {str(e)}"
            )

    async def check_visual_bridge_health(self) -> WebMCPTestResult:
        """Check if Visual Bridge is running and healthy."""
        start = datetime.now()

        try:
            async with aiohttp.ClientSession() as session:
                async with session.get(
                    "http://localhost:8769/health",
                    timeout=aiohttp.ClientTimeout(total=5)
                ) as response:
                    elapsed = (datetime.now() - start).total_seconds() * 1000

                    if response.status == 200:
                        data = await response.json()
                        return WebMCPTestResult(
                            test_name="Visual Bridge Health",
                            passed=True,
                            response_time_ms=elapsed,
                            details=f"Status: {data.get('status', 'unknown')}"
                        )
                    else:
                        return WebMCPTestResult(
                            test_name="Visual Bridge Health",
                            passed=False,
                            response_time_ms=elapsed,
                            details=f"HTTP {response.status}"
                        )
        except Exception as e:
            return WebMCPTestResult(
                test_name="Visual Bridge Health",
                passed=False,
                response_time_ms=0,
                details=f"Not running: {str(e)[:50]}"
            )

    async def check_terminal_session_endpoint(self) -> WebMCPTestResult:
        """Check if terminal session creation endpoint works."""
        start = datetime.now()

        try:
            async with aiohttp.ClientSession() as session:
                async with session.post(
                    "http://localhost:8769/terminal/session",
                    json={"cols": 80, "rows": 24},
                    timeout=aiohttp.ClientTimeout(total=10)
                ) as response:
                    elapsed = (datetime.now() - start).total_seconds() * 1000

                    if response.status == 200:
                        data = await response.json()
                        session_id = data.get("session_id")

                        return WebMCPTestResult(
                            test_name="Terminal Session Creation",
                            passed=bool(session_id),
                            response_time_ms=elapsed,
                            details=f"Session: {session_id}"
                        )
                    else:
                        return WebMCPTestResult(
                            test_name="Terminal Session Creation",
                            passed=False,
                            response_time_ms=elapsed,
                            details=f"HTTP {response.status}"
                        )
        except Exception as e:
            return WebMCPTestResult(
                test_name="Terminal Session Creation",
                passed=False,
                response_time_ms=0,
                details=f"Error: {str(e)[:50]}"
            )

    async def check_websocket_endpoint(self) -> WebMCPTestResult:
        """Check if WebSocket endpoint accepts connections."""
        import websockets

        start = datetime.now()

        try:
            async with websockets.connect(
                "ws://localhost:8769/terminal?token=webmcp-test",
                close_timeout=5
            ) as ws:
                elapsed = (datetime.now() - start).total_seconds() * 1000

                # Send resize to verify bidirectional communication
                await ws.send(json.dumps({"type": "resize", "cols": 80, "rows": 24}))

                # Wait briefly for any response
                try:
                    msg = await asyncio.wait_for(ws.recv(), timeout=2.0)
                    # Any response is good - means connection works
                except asyncio.TimeoutError:
                    pass  # No response is also OK for resize

                return WebMCPTestResult(
                    test_name="WebSocket Connection",
                    passed=True,
                    response_time_ms=elapsed,
                    details="Connected and sent resize"
                )
        except Exception as e:
            return WebMCPTestResult(
                test_name="WebSocket Connection",
                passed=False,
                response_time_ms=0,
                details=f"Error: {str(e)[:50]}"
            )

    async def check_terminal_command(self) -> WebMCPTestResult:
        """Send a command via WebSocket and verify response."""
        import websockets

        start = datetime.now()

        try:
            async with websockets.connect(
                "ws://localhost:8769/terminal?token=webmcp-cmd-test",
                close_timeout=10
            ) as ws:
                # Initialize
                await ws.send(json.dumps({"type": "resize", "cols": 120, "rows": 36}))
                await asyncio.sleep(0.5)

                # Send test command
                test_string = "WEBMCP_TEST_" + str(int(datetime.now().timestamp()))
                await ws.send(json.dumps({"type": "input", "data": f"echo {test_string}\n"}))

                # Collect output
                output_buffer = []
                try:
                    while True:
                        msg = await asyncio.wait_for(ws.recv(), timeout=3.0)
                        data = json.loads(msg)
                        if data.get("type") == "output":
                            output_buffer.append(data.get("data", ""))
                except asyncio.TimeoutError:
                    pass

                full_output = "".join(output_buffer)
                elapsed = (datetime.now() - start).total_seconds() * 1000

                # Verify our test string is in output
                passed = test_string in full_output

                return WebMCPTestResult(
                    test_name="Terminal Command Execution",
                    passed=passed,
                    response_time_ms=elapsed,
                    details=f"Echo test: {'found' if passed else 'not found'} in output"
                )
        except Exception as e:
            return WebMCPTestResult(
                test_name="Terminal Command Execution",
                passed=False,
                response_time_ms=0,
                details=f"Error: {str(e)[:50]}"
            )

    async def run_all_tests(self) -> List[WebMCPTestResult]:
        """Run all WebMCP verification tests."""
        print("=" * 60)
        print("🌐 WebMCP Terminal Verification")
        print("=" * 60)
        print(f"\nWordPress URL: {self.wp_url}")
        print("")

        # Run tests in sequence (some depend on previous)
        tests = [
            ("Plugin Active", self.check_plugin_active),
            ("Visual Bridge", self.check_visual_bridge_health),
            ("Session Endpoint", self.check_terminal_session_endpoint),
            ("WebSocket", self.check_websocket_endpoint),
            ("Command Exec", self.check_terminal_command),
        ]

        for name, test_func in tests:
            print(f"\n🧪 Testing: {name}...")
            result = await test_func()
            self.results.append(result)

            icon = "✅" if result.passed else "❌"
            print(f"   {icon} {result.details}")
            print(f"   Time: {result.response_time_ms:.0f}ms")

        return self.results

    def print_summary(self):
        """Print test summary."""
        print("\n" + "=" * 60)
        print("📊 WebMCP Verification Summary")
        print("=" * 60)

        passed = sum(1 for r in self.results if r.passed)
        total = len(self.results)

        for r in self.results:
            icon = "✅" if r.passed else "❌"
            print(f"{icon} {r.test_name}: {r.details}")

        print(f"\nResults: {passed}/{total} passed ({passed/total*100:.0f}%)")
        print(f"Avg response: {sum(r.response_time_ms for r in self.results)/total:.0f}ms")

        if passed == total:
            print("\n🎉 Full stack verified! Terminal is production-ready.")
        elif passed >= total * 0.6:
            print("\n⚠️  Partial success - some components need attention.")
        else:
            print("\n❌ Multiple failures - review infrastructure setup.")


async def main():
    verifier = WebMCPTerminalVerifier()
    await verifier.run_all_tests()
    verifier.print_summary()


if __name__ == "__main__":
    asyncio.run(main())
