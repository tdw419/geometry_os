#!/usr/bin/env python3
"""
Neural Pipeline End-to-End Integration Tests

Tests the full neural -> visual pipeline:
1. LM Studio connectivity and SSE streaming
2. Software SHM health monitoring
3. Neural state broadcasting via WebSocket
4. Token activation forwarding to compositor

Author: Neural Pipeline Specialist
Date: 2026-02-09
"""

import asyncio
import json
import socket
import time
import sys
from pathlib import Path
from typing import Optional, Dict, Any
from dataclasses import dataclass
from datetime import datetime

# Add project root
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from systems.neural_substrate.lm_studio_bridge import LMStudioBridge, HAS_AIOHTTP
from systems.health.software_shm import SoftwareSHM, PASReport


@dataclass
class TestResult:
    """Result of a single test"""
    name: str
    status: str  # 'PASS', 'FAIL', 'SKIP', 'WARN'
    duration: float
    message: str
    details: Optional[Dict[str, Any]] = None


class NeuralPipelineTestSuite:
    """Test suite for neural pipeline E2E integration"""

    def __init__(self, verbose: bool = False):
        self.verbose = verbose
        self.results: list[TestResult] = []
        self.lm_studio_url = "http://localhost:1234/v1"
        self.socket_path = "/tmp/evolution_daemon.sock"
        self.websocket_url = "ws://localhost:8765"

    def log(self, message: str, level: str = "INFO"):
        """Log a message if verbose mode is enabled"""
        if self.verbose or level in ["WARN", "ERROR"]:
            print(f"[{level}] {message}")

    async def test_lm_studio_connection(self) -> TestResult:
        """
        Test 1: Verify LM Studio is accessible

        Tests:
        - HTTP connection to LM Studio API
        - Model list retrieval
        - Response format validation
        """
        start_time = time.time()
        name = "LM Studio Connection"

        try:
            import requests

            response = requests.get(f"{self.lm_studio_url}/models", timeout=5)

            if response.status_code != 200:
                return TestResult(
                    name=name,
                    status="FAIL",
                    duration=time.time() - start_time,
                    message=f"HTTP {response.status_code}",
                    details={"status_code": response.status_code}
                )

            data = response.json()
            models = data.get("data", [])

            self.log(f"Connected to LM Studio, {len(models)} model(s) loaded")

            return TestResult(
                name=name,
                status="PASS",
                duration=time.time() - start_time,
                message=f"Connected, {len(models)} model(s) available",
                details={
                    "model_count": len(models),
                    "models": [m.get("id", "unknown") for m in models[:3]]
                }
            )

        except requests.exceptions.Timeout:
            return TestResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                message="Connection timeout",
                details={"timeout": 5}
            )
        except requests.exceptions.ConnectionError:
            return TestResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                message="LM Studio not running",
                details={"url": self.lm_studio_url}
            )
        except Exception as e:
            return TestResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                message=str(e),
                details={"error_type": type(e).__name__}
            )

    async def test_sse_streaming(self) -> TestResult:
        """
        Test 2: Verify SSE streaming works

        Tests:
        - POST to chat completions with stream=True
        - SSE line parsing
        - Token extraction from SSE data
        - Stream completion handling
        """
        start_time = time.time()
        name = "SSE Streaming"

        if not HAS_AIOHTTP:
            return TestResult(
                name=name,
                status="SKIP",
                duration=time.time() - start_time,
                message="aiohttp not installed"
            )

        try:
            import aiohttp

            async with aiohttp.ClientSession() as session:
                async with session.post(
                    f"{self.lm_studio_url}/chat/completions",
                    json={
                        "messages": [{"role": "user", "content": "Say 'test'"}],
                        "stream": True,
                        "max_tokens": 10
                    },
                    timeout=aiohttp.ClientTimeout(total=30)
                ) as response:

                    if response.status != 200:
                        return TestResult(
                            name=name,
                            status="FAIL",
                            duration=time.time() - start_time,
                            message=f"HTTP {response.status}",
                            details={"status_code": response.status}
                        )

                    token_count = 0
                    tokens_received = []
                    async for line in response.content:
                        line_str = line.decode('utf-8').strip()
                        if line_str.startswith('data: '):
                            if line_str == 'data: [DONE]':
                                break

                            try:
                                json_str = line_str[6:]  # Remove 'data: '
                                data = json.loads(json_str)

                                if "choices" in data and len(data["choices"]) > 0:
                                    delta = data["choices"][0].get("delta", {})
                                    content = delta.get("content", "")

                                    if content:
                                        token_count += 1
                                        tokens_received.append(content)
                                        if token_count >= 1:
                                            break
                            except json.JSONDecodeError:
                                continue

                    if token_count > 0:
                        self.log(f"Received {token_count} tokens via SSE")
                        return TestResult(
                            name=name,
                            status="PASS",
                            duration=time.time() - start_time,
                            message=f"Received {token_count} token(s)",
                            details={
                                "token_count": token_count,
                                "tokens": tokens_received[:5]
                            }
                        )
                    else:
                        return TestResult(
                            name=name,
                            status="FAIL",
                            duration=time.time() - start_time,
                            message="No tokens received",
                            details={}
                        )

        except asyncio.TimeoutError:
            return TestResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                message="Stream timeout",
                details={"timeout": 30}
            )
        except aiohttp.ClientError as e:
            return TestResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                message=f"Client error: {e}",
                details={"error_type": type(e).__name__}
            )
        except Exception as e:
            return TestResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                message=str(e),
                details={"error_type": type(e).__name__}
            )

    async def test_shm_health_check(self) -> TestResult:
        """
        Test 3: Software SHM health check

        Tests:
        - PAS score calculation
        - Health metric generation
        - Threshold validation
        - Report generation
        """
        start_time = time.time()
        name = "Software SHM Health Check"

        try:
            # Initialize SHM with project root
            project_root = Path(__file__).parent.parent.parent
            shm = SoftwareSHM(project_root=str(project_root))

            # Run health check
            report = shm.check_health(use_cache=False)

            # Validate report structure
            if not isinstance(report, PASReport):
                return TestResult(
                    name=name,
                    status="FAIL",
                    duration=time.time() - start_time,
                    message=f"Invalid report type: {type(report)}",
                    details={"report_type": str(type(report))}
                )

            # Check PAS score
            if not isinstance(report.score, (int, float)) or not (0 <= report.score <= 1):
                return TestResult(
                    name=name,
                    status="FAIL",
                    duration=time.time() - start_time,
                    message=f"Invalid PAS score: {report.score}",
                    details={"score": report.score}
                )

            # Check metrics
            if not report.metrics:
                return TestResult(
                    name=name,
                    status="FAIL",
                    duration=time.time() - start_time,
                    message="No metrics in report",
                    details={}
                )

            self.log(f"PAS Score: {report.score:.4f}, Status: {report.status}")

            return TestResult(
                name=name,
                status="PASS" if report.score >= 0.5 else "WARN",
                duration=time.time() - start_time,
                message=f"PAS: {report.score:.4f} ({report.status})",
                details={
                    "pas_score": report.score,
                    "status": report.status,
                    "metrics_count": len(report.metrics),
                    "recommendations_count": len(report.recommendations)
                }
            )

        except Exception as e:
            return TestResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                message=str(e),
                details={"error_type": type(e).__name__}
            )

    async def test_neural_state_broadcast(self) -> TestResult:
        """
        Test 4: Neural state broadcast via WebSocket

        Tests:
        - WebSocket connection
        - Message creation
        - Message serialization
        - Broadcast capability (if compositor running)
        """
        start_time = time.time()
        name = "Neural State Broadcast"

        try:
            # Create bridge instance
            bridge = LMStudioBridge()

            # Test neural state message creation
            message = bridge.create_neural_state_message(strength=0.8)

            # Validate message structure
            required_fields = ["message_type", "timestamp", "payload"]
            for field in required_fields:
                if field not in message:
                    return TestResult(
                        name=name,
                        status="FAIL",
                        duration=time.time() - start_time,
                        message=f"Missing field: {field}",
                        details={"message": message}
                    )

            # Validate payload structure
            payload = message["payload"]
            required_payload_fields = ["daemon_id", "strength", "data"]
            for field in required_payload_fields:
                if field not in payload:
                    return TestResult(
                        name=name,
                        status="FAIL",
                        duration=time.time() - start_time,
                        message=f"Missing payload field: {field}",
                        details={"payload": payload}
                    )

            # Test JSON serialization
            try:
                json_str = json.dumps(message)
                self.log(f"Neural state message: {len(json_str)} bytes")
            except Exception as e:
                return TestResult(
                    name=name,
                    status="FAIL",
                    duration=time.time() - start_time,
                    message=f"JSON serialization failed: {e}",
                    details={}
                )

            # Try to connect to WebSocket (optional - compositor may not be running)
            ws_connected = False
            try:
                import websockets
                ws_url = f"{self.websocket_url}/neural"

                async with websockets.connect(ws_url, timeout=2) as ws:
                    ws_connected = True
                    self.log("WebSocket connection successful")
            except ImportError:
                self.log("websockets library not installed - skipping WebSocket test", "WARN")
            except Exception as e:
                self.log(f"WebSocket not available: {e}", "WARN")

            return TestResult(
                name=name,
                status="PASS",
                duration=time.time() - start_time,
                message=f"Message valid, WebSocket {'connected' if ws_connected else 'not available'}",
                details={
                    "message_type": message["message_type"],
                    "daemon_id": payload["daemon_id"],
                    "strength": payload["strength"],
                    "ws_connected": ws_connected
                }
            )

        except Exception as e:
            return TestResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                message=str(e),
                details={"error_type": type(e).__name__}
            )

    async def test_token_forwarding(self) -> TestResult:
        """
        Test 5: Token activation forwarding to compositor

        Tests:
        - Token message creation
        - Hilbert position mapping
        - Socket communication (if compositor running)
        - Message validation
        """
        start_time = time.time()
        name = "Token Activation Forwarding"

        try:
            bridge = LMStudioBridge()

            # Test token message creation
            test_token = "test"
            test_token_id = 12345
            message = bridge.create_token_message(test_token, test_token_id, 1.0, 0)

            # Validate message structure
            if message["message_type"] != "TokenVisualizationUpdate":
                return TestResult(
                    name=name,
                    status="FAIL",
                    duration=time.time() - start_time,
                    message=f"Wrong message type: {message['message_type']}",
                    details={"message_type": message["message_type"]}
                )

            # Validate payload
            payload = message["payload"]
            required_fields = ["current_token", "token_id", "hilbert_position", "activation"]
            for field in required_fields:
                if field not in payload:
                    return TestResult(
                        name=name,
                        status="FAIL",
                        duration=time.time() - start_time,
                        message=f"Missing payload field: {field}",
                        details={"payload": payload}
                    )

            # Validate Hilbert position
            hilbert_pos = payload["hilbert_position"]
            if not isinstance(hilbert_pos, (list, tuple)) or len(hilbert_pos) != 2:
                return TestResult(
                    name=name,
                    status="FAIL",
                    duration=time.time() - start_time,
                    message=f"Invalid Hilbert position: {hilbert_pos}",
                    details={"hilbert_position": hilbert_pos}
                )

            x, y = hilbert_pos
            if not (0 <= x <= 1 and 0 <= y <= 1):
                return TestResult(
                    name=name,
                    status="FAIL",
                    duration=time.time() - start_time,
                    message=f"Hilbert position out of range: ({x}, {y})",
                    details={"x": x, "y": y}
                )

            # Try to send to socket (optional - compositor may not be running)
            socket_sent = False
            try:
                await bridge.send_token_activation(test_token, test_token_id, 1.0, 0)
                socket_sent = True
                self.log("Token activation sent to socket")
            except FileNotFoundError:
                self.log("Compositor socket not found - skipping send test", "WARN")
            except Exception as e:
                self.log(f"Socket send failed: {e}", "WARN")

            return TestResult(
                name=name,
                status="PASS",
                duration=time.time() - start_time,
                message=f"Message valid, Socket {'sent' if socket_sent else 'not available'}",
                details={
                    "token": test_token,
                    "token_id": test_token_id,
                    "hilbert_position": (x, y),
                    "activation": payload["activation"],
                    "socket_sent": socket_sent
                }
            )

        except Exception as e:
            return TestResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                message=str(e),
                details={"error_type": type(e).__name__}
            )

    async def test_full_pipeline(self) -> TestResult:
        """
        Test 6: Full end-to-end pipeline

        Tests:
        - Health check
        - Bridge initialization
        - State update creation
        - Token message creation
        """
        start_time = time.time()
        name = "Full E2E Pipeline"

        try:
            # Initialize components
            project_root = Path(__file__).parent.parent.parent
            shm = SoftwareSHM(project_root=str(project_root))
            bridge = LMStudioBridge()

            # Step 1: Health check
            health_report = shm.check_health(use_cache=True)
            self.log(f"Health check: PAS {health_report.score:.4f}")

            # Step 2: Create neural state update
            state_message = bridge.create_neural_state_message(0.8)
            self.log(f"State message: {state_message['message_type']}")

            # Step 3: Create token messages
            tokens = [
                ("The", 1000),
                ("quick", 2000),
                ("brown", 3000),
                ("fox", 4000)
            ]

            token_messages = []
            for token, token_id in tokens:
                msg = bridge.create_token_message(token, token_id, 1.0, len(token_messages))
                token_messages.append(msg)

            self.log(f"Created {len(token_messages)} token messages")

            return TestResult(
                name=name,
                status="PASS",
                duration=time.time() - start_time,
                message=f"Pipeline executed, PAS: {health_report.score:.4f}, {len(token_messages)} tokens",
                details={
                    "pas_score": health_report.score,
                    "health_status": health_report.status,
                    "state_message_type": state_message["message_type"],
                    "token_count": len(token_messages)
                }
            )

        except Exception as e:
            return TestResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                message=str(e),
                details={"error_type": type(e).__name__}
            )

    def print_summary(self):
        """Print test summary"""
        print("\n" + "=" * 70)
        print("NEURAL PIPELINE E2E TEST SUMMARY")
        print("=" * 70)

        passed = sum(1 for r in self.results if r.status == "PASS")
        failed = sum(1 for r in self.results if r.status == "FAIL")
        skipped = sum(1 for r in self.results if r.status == "SKIP")
        warned = sum(1 for r in self.results if r.status == "WARN")
        total = len(self.results)

        for result in self.results:
            status_symbol = {
                "PASS": "✓",
                "FAIL": "✗",
                "SKIP": "○",
                "WARN": "!"
            }[result.status]

            print(f"\n{status_symbol} {result.name}")
            print(f"   Status: {result.status}")
            print(f"   Duration: {result.duration:.3f}s")
            print(f"   Message: {result.message}")

            if result.details and self.verbose:
                print(f"   Details: {json.dumps(result.details, indent=6)}")

        print("\n" + "-" * 70)
        print(f"Total: {total} | Passed: {passed} | Failed: {failed} | Skipped: {skipped} | Warned: {warned}")
        print("=" * 70)

        return failed == 0

    async def run_all(self):
        """Run all tests"""
        print("\n" + "=" * 70)
        print("NEURAL PIPELINE E2E INTEGRATION TESTS")
        print("=" * 70)
        print(f"Started at: {datetime.now().isoformat()}")
        print()

        # Run tests
        self.results.append(await self.test_lm_studio_connection())
        print()

        self.results.append(await self.test_sse_streaming())
        print()

        self.results.append(await self.test_shm_health_check())
        print()

        self.results.append(await self.test_neural_state_broadcast())
        print()

        self.results.append(await self.test_token_forwarding())
        print()

        self.results.append(await self.test_full_pipeline())
        print()

        # Print summary
        success = self.print_summary()

        return 0 if success else 1


async def main():
    """Main entry point"""
    import argparse

    parser = argparse.ArgumentParser(
        description="Neural Pipeline E2E Integration Tests"
    )
    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Enable verbose output"
    )

    args = parser.parse_args()

    suite = NeuralPipelineTestSuite(verbose=args.verbose)
    exit_code = await suite.run_all()

    return exit_code


if __name__ == "__main__":
    exit_code = asyncio.run(main())
    sys.exit(exit_code)
