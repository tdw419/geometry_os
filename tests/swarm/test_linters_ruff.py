# tests/swarm/test_linters_ruff.py
"""Tests for Ruff style checker."""

from systems.swarm.guilds.linters.ruff import RuffChecker, StyleViolation


class TestStyleViolation:
    """Test StyleViolation dataclass."""

    def test_violation_has_required_fields(self):
        """Violation should have all required fields."""
        violation = StyleViolation(
            code="E501",
            message="Line too long",
            line=10,
            column=90,
            fixable=True
        )
        assert violation.code == "E501"
        assert violation.line == 10
        assert violation.fixable is True


class TestRuffChecker:
    """Test Ruff checker implementation."""

    def test_checker_exists(self):
        """RuffChecker should be instantiable."""
        checker = RuffChecker()
        assert checker is not None

    def test_check_detects_long_lines(self):
        """Should detect line length violations (E501)."""
        checker = RuffChecker(line_length=50)
        # Create a long line that is valid Python
        code = "# " + "x" * 100 + "\n"
        violations = checker.check(code)
        assert any(v.code == "E501" for v in violations)

    def test_check_detects_unused_imports(self):
        """Should detect unused imports (F401)."""
        checker = RuffChecker()
        code = "import os\nimport sys\n\ndef foo(): pass"
        violations = checker.check(code)
        assert len(violations) >= 2
        assert any(v.code == "F401" for v in violations)

    def test_check_clean_code_returns_empty(self):
        """Clean code should return no violations."""
        checker = RuffChecker()
        code = 'def add(a: int, b: int) -> int:\n    return a + b\n'
        violations = checker.check(code)
        critical = [v for v in violations if v.code.startswith(("E", "F"))]
        assert len(critical) == 0

    def test_format_returns_formatted_code(self):
        """Format should return properly formatted code."""
        checker = RuffChecker()
        # Test with code that ruff actually formats
        code = "def foo(  ):\n    return  1"
        formatted = checker.format(code)
        # Ruff normalizes spacing
        assert "def foo():" in formatted
        assert "return 1" in formatted

    def test_check_handles_invalid_python(self):
        """Should handle syntax errors gracefully."""
        checker = RuffChecker()
        code = "def incomplete("
        violations = checker.check(code)
        assert isinstance(violations, list)
