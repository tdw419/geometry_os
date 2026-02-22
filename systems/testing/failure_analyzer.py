# systems/testing/failure_analyzer.py
"""
FailureAnalyzer: Analyze test failures and identify root causes.

Provides structured analysis of test failures for AI consumption.
"""

import re
from typing import Dict, List, Optional, Any
from dataclasses import dataclass


@dataclass
class FailureAnalysis:
    """Structured analysis of a test failure."""
    test_name: str
    failure_type: str
    root_cause: str
    stack_trace: List[str]
    suggested_fix: str
    confidence: float
    related_files: List[str]


class FailureAnalyzer:
    """
    Analyze test failures and identify root causes.

    Usage:
        analyzer = FailureAnalyzer()
        analysis = analyzer.analyze({
            "name": "test_example",
            "status": "fail",
            "error": "AssertionError: expected 5, got 4"
        })
    """

    # Error type patterns
    PATTERNS = {
        "import_error": r"ImportError|ModuleNotFoundError",
        "assertion_error": r"AssertionError|assert ",
        "type_error": r"TypeError",
        "attribute_error": r"AttributeError",
        "key_error": r"KeyError",
        "value_error": r"ValueError",
        "index_error": r"IndexError",
        "timeout": r"TimeoutError|timed out|timeout",
        "connection": r"ConnectionError|ConnectionRefused|Connection reset",
        "file_not_found": r"FileNotFoundError|No such file",
        "permission_denied": r"PermissionError|Permission denied",
    }

    # Fix suggestions by error type
    FIX_SUGGESTIONS = {
        "import_error": "Check that the module is installed. Run: pip install <module_name>",
        "assertion_error": "Review the test assertion. The expected value differs from actual.",
        "type_error": "Type mismatch detected. Check function signatures and argument types.",
        "attribute_error": "Object missing expected attribute. Check class initialization and imports.",
        "key_error": "Dictionary key not found. Verify the key exists before access.",
        "value_error": "Invalid value provided. Check input validation.",
        "index_error": "List index out of range. Check list length before indexing.",
        "timeout": "Test exceeded time limit. Consider optimizing or increasing timeout.",
        "connection": "Connection failed. Verify the server is running and accessible.",
        "file_not_found": "Required file not found. Check file path and permissions.",
        "permission_denied": "Permission denied. Check file/directory permissions.",
        "unknown": "Review the error message and stack trace for clues.",
    }

    def __init__(self):
        self._compiled_patterns = {
            name: re.compile(pattern, re.IGNORECASE)
            for name, pattern in self.PATTERNS.items()
        }

    def classify(self, error_text: str) -> str:
        """
        Classify the type of error.

        Args:
            error_text: Error message text

        Returns:
            Error type string
        """
        if not error_text:
            return "unknown"

        for error_type, pattern in self._compiled_patterns.items():
            if pattern.search(error_text):
                return error_type

        return "unknown"

    def analyze(self, test_result: Dict[str, Any]) -> Dict[str, Any]:
        """
        Analyze a test failure and return structured analysis.

        Args:
            test_result: Test result dict with 'name', 'status', 'error'

        Returns:
            Analysis dict with 'test_name', 'failure_type', 'root_cause', etc.
        """
        test_name = test_result.get("name", "unknown")
        error_text = test_result.get("error", "")

        # Classify failure type
        failure_type = self.classify(error_text)

        # Extract root cause
        root_cause = self._extract_root_cause(error_text, failure_type)

        # Extract stack trace
        stack_trace = self._extract_stack_trace(error_text)

        # Extract related files
        related_files = self._extract_files(stack_trace)

        # Generate suggested fix
        suggested_fix = self._generate_fix(failure_type, root_cause, related_files)

        # Calculate confidence
        confidence = self._calculate_confidence(failure_type, error_text)

        return {
            "test_name": test_name,
            "failure_type": failure_type,
            "root_cause": root_cause,
            "stack_trace": stack_trace[:10],  # Limit to 10 frames
            "suggested_fix": suggested_fix,
            "confidence": confidence,
            "related_files": related_files[:5],  # Limit to 5 files
        }

    def _extract_root_cause(self, error_text: str, failure_type: str) -> str:
        """Extract the root cause from error text."""
        if not error_text:
            return "Unknown error"

        # For import errors, extract the module name
        if failure_type == "import_error":
            match = re.search(r"No module named ['\"]?(\S+)['\"]?", error_text)
            if match:
                return f"Missing module: {match.group(1)}"
            match = re.search(r"cannot import name ['\"]?(\S+)['\"]?", error_text)
            if match:
                return f"Cannot import: {match.group(1)}"

        # For assertion errors, extract the assertion
        if failure_type == "assertion_error":
            match = re.search(r"AssertionError: (.+)", error_text)
            if match:
                return match.group(1)

        # For type errors, extract the type issue
        if failure_type == "type_error":
            match = re.search(r"TypeError: (.+)", error_text)
            if match:
                return match.group(1)

        # Default: return first line
        lines = error_text.strip().split("\n")
        return lines[0] if lines else "Unknown error"

    def _extract_stack_trace(self, error_text: str) -> List[str]:
        """Extract stack trace lines from error text."""
        if not error_text:
            return []

        stack_trace = []
        for line in error_text.split("\n"):
            # Match Python stack trace lines
            if re.match(r'\s*File "', line) or re.match(r'\s*\w+Error:', line):
                stack_trace.append(line.strip())

        return stack_trace

    def _extract_files(self, stack_trace: List[str]) -> List[str]:
        """Extract file paths from stack trace."""
        files = []
        for line in stack_trace:
            match = re.search(r'File "([^"]+)"', line)
            if match:
                file_path = match.group(1)
                # Filter out library files
                if not any(skip in file_path for skip in ["/usr/lib", "site-packages", "/lib/python"]):
                    files.append(file_path)

        return list(dict.fromkeys(files))  # Remove duplicates, preserve order

    def _generate_fix(self, failure_type: str, root_cause: str, files: List[str]) -> str:
        """Generate a fix suggestion."""
        base_suggestion = self.FIX_SUGGESTIONS.get(failure_type, self.FIX_SUGGESTIONS["unknown"])

        # Add context from related files
        if files:
            base_suggestion += f" Files to check: {', '.join(files[:3])}"

        return base_suggestion

    def _calculate_confidence(self, failure_type: str, error_text: str) -> float:
        """Calculate confidence score for the analysis."""
        if failure_type == "unknown":
            return 0.3

        if not error_text:
            return 0.5

        # Higher confidence if we found a known pattern
        confidence = 0.7

        # Boost if error message is clear
        if len(error_text) > 20:
            confidence += 0.1

        # Boost if stack trace is present
        if "File" in error_text and "line" in error_text.lower():
            confidence += 0.1

        return min(confidence, 0.95)
