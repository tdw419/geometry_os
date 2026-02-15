# systems/testing/test_runner.py
"""
TestRunner: Execute tests and return structured results.

Integration point for WebMCP ide_test tool.
"""

import subprocess
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Optional, List, Dict, Any
from dataclasses import dataclass


@dataclass
class TestResult:
    """Result of a single test."""
    name: str
    status: str  # pass, fail, skip, error
    duration_ms: float
    error: Optional[str] = None
    file: Optional[str] = None
    line: Optional[int] = None


class TestRunner:
    """
    Execute tests and return structured results.

    Usage:
        runner = TestRunner(project_root="/path/to/project")
        result = runner.run(test_pattern="test_wasm_*")

    Returns:
        {
            "success": True/False,
            "total": 10,
            "passed": 8,
            "failed": 1,
            "skipped": 1,
            "duration_ms": 1234.5,
            "results": [...],
            "coverage": {...}  # if coverage=True
        }
    """

    def __init__(
        self,
        project_root: Optional[str] = None,
        coverage: bool = False,
        failfast: bool = False,
        verbose: bool = False,
        junit_file: str = "junit_results.xml",
        coverage_file: str = "coverage.xml"
    ):
        self.project_root = Path(project_root) if project_root else Path.cwd()
        self.coverage = coverage
        self.failfast = failfast
        self.verbose = verbose
        self.junit_file = junit_file
        self.coverage_file = coverage_file

    def build_command(
        self,
        test_file: Optional[str] = None,
        test_pattern: Optional[str] = None,
        extra_args: Optional[List[str]] = None
    ) -> List[str]:
        """
        Build the pytest command.

        Args:
            test_file: Specific test file to run
            test_pattern: Pattern to match tests (-k flag)
            extra_args: Additional pytest arguments

        Returns:
            List of command parts
        """
        cmd = ["python3", "-m", "pytest"]

        # Always output JUnit XML for parsing
        cmd.extend(["--junitxml", self.junit_file])

        # Verbose output
        if self.verbose:
            cmd.append("-v")

        # Fail fast (stop on first failure)
        if self.failfast:
            cmd.append("-x")

        # Coverage collection
        if self.coverage:
            cmd.append("--cov=.")
            cmd.extend(["--cov-report", f"xml:{self.coverage_file}"])

        # Test pattern
        if test_pattern:
            cmd.extend(["-k", test_pattern])

        # Specific test file
        if test_file:
            cmd.append(test_file)

        # Extra arguments
        if extra_args:
            cmd.extend(extra_args)

        return cmd

    def run(
        self,
        test_file: Optional[str] = None,
        test_pattern: Optional[str] = None,
        extra_args: Optional[List[str]] = None
    ) -> Dict[str, Any]:
        """
        Execute tests and return structured results.

        Args:
            test_file: Specific test file to run
            test_pattern: Pattern to match tests
            extra_args: Additional pytest arguments

        Returns:
            Structured test results
        """
        cmd = self.build_command(test_file, test_pattern, extra_args)

        # Execute pytest
        result = subprocess.run(
            cmd,
            cwd=str(self.project_root),
            capture_output=True,
            text=True
        )

        # Parse JUnit XML
        junit_path = self.project_root / self.junit_file
        parsed = self._parse_junit_xml(junit_path)

        # Build result
        return {
            "success": result.returncode == 0,
            "total": parsed["total"],
            "passed": parsed["passed"],
            "failed": parsed["failed"],
            "skipped": parsed["skipped"],
            "duration_ms": parsed["time"] * 1000,
            "results": parsed["testcases"],
            "stdout": result.stdout,
            "stderr": result.stderr,
            "command": " ".join(cmd)
        }

    def _parse_junit_xml(self, xml_path: Path) -> Dict[str, Any]:
        """
        Parse JUnit XML output from pytest.

        Args:
            xml_path: Path to junit_results.xml

        Returns:
            Parsed test results
        """
        if not xml_path.exists():
            return {
                "total": 0,
                "passed": 0,
                "failed": 0,
                "skipped": 0,
                "time": 0.0,
                "testcases": []
            }

        tree = ET.parse(xml_path)
        root = tree.getroot()

        # Get test suite stats
        testsuite = root.find("testsuite") or root

        total = int(testsuite.get("tests", 0))
        failures = int(testsuite.get("failures", 0))
        errors = int(testsuite.get("errors", 0))
        skipped = int(testsuite.get("skipped", 0))
        time = float(testsuite.get("time", 0.0))

        # Parse individual test cases
        testcases = []
        for testcase in root.iter("testcase"):
            name = testcase.get("name", "unknown")
            file = testcase.get("file")
            line = int(testcase.get("line", 0)) if testcase.get("line") else None
            tc_time = float(testcase.get("time", 0.0))

            # Determine status
            failure = testcase.find("failure")
            error = testcase.find("error")
            skip = testcase.find("skipped")

            if failure is not None:
                status = "fail"
                error_msg = failure.text or failure.get("message", "")
            elif error is not None:
                status = "error"
                error_msg = error.text or error.get("message", "")
            elif skip is not None:
                status = "skip"
                error_msg = skip.text or skip.get("message", "")
            else:
                status = "pass"
                error_msg = None

            testcases.append({
                "name": name,
                "status": status,
                "duration_ms": tc_time * 1000,
                "error": error_msg,
                "file": file,
                "line": line
            })

        return {
            "total": total,
            "passed": total - failures - errors - skipped,
            "failed": failures + errors,
            "skipped": skipped,
            "time": time,
            "testcases": testcases
        }
