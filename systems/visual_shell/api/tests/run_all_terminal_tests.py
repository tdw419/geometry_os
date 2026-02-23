#!/usr/bin/env python3
"""
Unified Test Runner: Geometry OS Web Terminal

Combines all verification approaches:
1. WebSocket integration tests
2. E2E Puppeteer browser tests
3. LLM-based output verification
4. ASCII desktop capture

Run: python systems/visual_shell/api/tests/run_all_terminal_tests.py
"""

import asyncio
import subprocess
import sys
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Any


class TerminalTestRunner:
    """Runs all terminal verification tests."""

    def __init__(self):
        self.test_dir = Path(__file__).parent
        self.results: Dict[str, Any] = {
            "timestamp": datetime.now().isoformat(),
            "tests": {},
            "summary": {"passed": 0, "failed": 0, "skipped": 0}
        }

    def run_command(self, cmd: List[str], timeout: int = 60) -> Dict[str, Any]:
        """Run a command and capture results."""
        try:
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=timeout,
                cwd=self.test_dir
            )
            return {
                "returncode": result.returncode,
                "stdout": result.stdout[:2000],  # Truncate
                "stderr": result.stderr[:1000],
                "success": result.returncode == 0
            }
        except subprocess.TimeoutExpired:
            return {
                "returncode": -1,
                "stdout": "",
                "stderr": "Timeout",
                "success": False
            }
        except FileNotFoundError:
            return {
                "returncode": -2,
                "stdout": "",
                "stderr": "Command not found",
                "success": False
            }

    async def run_websocket_tests(self) -> Dict[str, Any]:
        """Run WebSocket integration tests."""
        print("\n" + "=" * 50)
        print("🔌 Test Suite 1: WebSocket Integration")
        print("=" * 50)

        result = self.run_command([
            sys.executable, "-m", "pytest",
            str(self.test_dir / "test_terminal_bridge.py"),
            "-v", "--tb=short", "-q"
        ], timeout=30)

        # Count pass/fail from output
        passed = result["stdout"].count(" PASSED")
        skipped = result["stdout"].count(" SKIPPED")
        failed = result["stdout"].count(" FAILED")

        self.results["tests"]["websocket"] = {
            "passed": passed,
            "failed": failed,
            "skipped": skipped,
            "output": result["stdout"][:1500]
        }

        self.results["summary"]["passed"] += passed
        self.results["summary"]["failed"] += failed
        self.results["summary"]["skipped"] += skipped

        print(f"   Passed: {passed}, Failed: {failed}, Skipped: {skipped}")
        return self.results["tests"]["websocket"]

    async def run_e2e_tests(self) -> Dict[str, Any]:
        """Run E2E Puppeteer tests."""
        print("\n" + "=" * 50)
        print("🌐 Test Suite 2: E2E Browser (Puppeteer)")
        print("=" * 50)

        result = self.run_command([
            "node", str(self.test_dir / "e2e_terminal_test.js")
        ], timeout=60)

        # Parse results from output
        passed = result["stdout"].count("✅")
        failed = result["stdout"].count("❌")
        skipped = result["stdout"].count("⚠️")

        self.results["tests"]["e2e"] = {
            "passed": passed,
            "failed": failed,
            "skipped": skipped,
            "output": result["stdout"][:1500]
        }

        self.results["summary"]["passed"] += passed
        self.results["summary"]["failed"] += failed
        self.results["summary"]["skipped"] += skipped

        print(f"   Passed: {passed}, Failed: {failed}, Skipped: {skipped}")
        return self.results["tests"]["e2e"]

    async def run_llm_tests(self) -> Dict[str, Any]:
        """Run LLM verification tests."""
        print("\n" + "=" * 50)
        print("🤖 Test Suite 3: LLM Verification")
        print("=" * 50)

        result = self.run_command([
            sys.executable,
            str(self.test_dir / "llm_terminal_verify.py")
        ], timeout=120)  # LLM can be slow

        # Parse results
        passed = result["stdout"].count("✅")
        failed = result["stdout"].count("❌")

        # Check if LM Studio was available
        lm_studio_ok = "LM Studio available" in result["stdout"]

        self.results["tests"]["llm"] = {
            "passed": passed,
            "failed": failed,
            "lm_studio_available": lm_studio_ok,
            "output": result["stdout"][:1500]
        }

        if lm_studio_ok:
            self.results["summary"]["passed"] += passed
            self.results["summary"]["failed"] += failed
        else:
            self.results["summary"]["skipped"] += passed + failed

        print(f"   Passed: {passed}, Failed: {failed}")
        print(f"   LM Studio: {'✅' if lm_studio_ok else '❌ Not available'}")
        return self.results["tests"]["llm"]

    async def run_ascii_tests(self) -> Dict[str, Any]:
        """Run ASCII desktop capture tests."""
        print("\n" + "=" * 50)
        print("🖥️  Test Suite 4: ASCII Desktop Capture")
        print("=" * 50)

        result = self.run_command([
            sys.executable,
            str(self.test_dir / "ascii_terminal_test.py")
        ], timeout=30)

        # Parse results
        passed = result["stdout"].count("✅")
        failed = result["stdout"].count("❌")

        self.results["tests"]["ascii"] = {
            "passed": passed,
            "failed": failed,
            "output": result["stdout"][:1500]
        }

        self.results["summary"]["passed"] += passed
        self.results["summary"]["failed"] += failed

        print(f"   Passed: {passed}, Failed: {failed}")
        return self.results["tests"]["ascii"]

    async def run_all(self) -> Dict[str, Any]:
        """Run all test suites."""
        print("=" * 60)
        print("🧪 Geometry OS Web Terminal - Unified Test Runner")
        print("=" * 60)
        print(f"Started: {self.results['timestamp']}")

        # Run each suite
        await self.run_websocket_tests()
        await self.run_e2e_tests()
        await self.run_llm_tests()
        await self.run_ascii_tests()

        # Final summary
        print("\n" + "=" * 60)
        print("📊 FINAL SUMMARY")
        print("=" * 60)

        total = (self.results["summary"]["passed"] +
                 self.results["summary"]["failed"] +
                 self.results["summary"]["skipped"])

        print(f"\nTotal Tests Run: {total}")
        print(f"  ✅ Passed: {self.results['summary']['passed']}")
        print(f"  ❌ Failed: {self.results['summary']['failed']}")
        print(f"  ⚠️  Skipped: {self.results['summary']['skipped']}")

        pass_rate = (self.results["summary"]["passed"] / total * 100
                     if total > 0 else 0)
        print(f"\nPass Rate: {pass_rate:.1f}%")

        # Verdict
        if pass_rate >= 80:
            print("\n🎉 VERDICT: Web Terminal is WORKING correctly!")
            verdict = "PASS"
        elif pass_rate >= 50:
            print("\n⚠️  VERDICT: Web Terminal is PARTIALLY working")
            verdict = "PARTIAL"
        else:
            print("\n❌ VERDICT: Web Terminal needs attention")
            verdict = "FAIL"

        self.results["verdict"] = verdict
        self.results["pass_rate"] = pass_rate

        # Save results
        import json
        results_file = self.test_dir / "test_results.json"
        with open(results_file, "w") as f:
            json.dump(self.results, f, indent=2)
        print(f"\n📄 Results saved to: {results_file}")

        return self.results


async def main():
    """Entry point."""
    runner = TerminalTestRunner()
    results = await runner.run_all()

    # Exit with appropriate code
    if results["verdict"] == "PASS":
        exit(0)
    elif results["verdict"] == "PARTIAL":
        exit(1)
    else:
        exit(2)


if __name__ == "__main__":
    asyncio.run(main())
