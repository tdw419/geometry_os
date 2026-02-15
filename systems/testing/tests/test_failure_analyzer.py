# systems/testing/tests/test_failure_analyzer.py
"""
Tests for FailureAnalyzer component.

TDD: Tests written first, implementation follows.
"""

import pytest


class TestFailureAnalyzerInit:
    """Test FailureAnalyzer initialization."""

    def test_init(self):
        """FailureAnalyzer initializes correctly."""
        from systems.testing.failure_analyzer import FailureAnalyzer

        analyzer = FailureAnalyzer()

        assert analyzer is not None


class TestFailureAnalyzerClassify:
    """Test failure classification."""

    def test_classify_import_error(self):
        """Classifies ImportError correctly."""
        from systems.testing.failure_analyzer import FailureAnalyzer

        analyzer = FailureAnalyzer()

        error_text = "ImportError: No module named 'wasmtime'"
        result = analyzer.classify(error_text)

        assert result == "import_error"

    def test_classify_assertion_error(self):
        """Classifies AssertionError correctly."""
        from systems.testing.failure_analyzer import FailureAnalyzer

        analyzer = FailureAnalyzer()

        error_text = "AssertionError: expected 5, got 4"
        result = analyzer.classify(error_text)

        assert result == "assertion_error"

    def test_classify_type_error(self):
        """Classifies TypeError correctly."""
        from systems.testing.failure_analyzer import FailureAnalyzer

        analyzer = FailureAnalyzer()

        error_text = "TypeError: 'NoneType' object is not callable"
        result = analyzer.classify(error_text)

        assert result == "type_error"

    def test_classify_attribute_error(self):
        """Classifies AttributeError correctly."""
        from systems.testing.failure_analyzer import FailureAnalyzer

        analyzer = FailureAnalyzer()

        error_text = "AttributeError: 'Module' object has no attribute 'func'"
        result = analyzer.classify(error_text)

        assert result == "attribute_error"

    def test_classify_timeout(self):
        """Classifies timeout correctly."""
        from systems.testing.failure_analyzer import FailureAnalyzer

        analyzer = FailureAnalyzer()

        error_text = "TimeoutError: test exceeded 30s limit"
        result = analyzer.classify(error_text)

        assert result == "timeout"

    def test_classify_unknown(self):
        """Returns 'unknown' for unrecognized patterns."""
        from systems.testing.failure_analyzer import FailureAnalyzer

        analyzer = FailureAnalyzer()

        error_text = "Something weird happened"
        result = analyzer.classify(error_text)

        assert result == "unknown"


class TestFailureAnalyzerAnalyze:
    """Test full analysis."""

    def test_analyze_returns_dict(self):
        """analyze() returns structured dict."""
        from systems.testing.failure_analyzer import FailureAnalyzer

        analyzer = FailureAnalyzer()

        test_result = {
            "name": "test_example",
            "status": "fail",
            "error": "AssertionError: expected 5, got 4"
        }

        result = analyzer.analyze(test_result)

        assert isinstance(result, dict)
        assert "test_name" in result
        assert "failure_type" in result
        assert "root_cause" in result

    def test_analyze_extracts_root_cause(self):
        """analyze() extracts root cause from error."""
        from systems.testing.failure_analyzer import FailureAnalyzer

        analyzer = FailureAnalyzer()

        test_result = {
            "name": "test_import",
            "status": "fail",
            "error": "ImportError: No module named 'wasmtime'"
        }

        result = analyzer.analyze(test_result)

        assert result["failure_type"] == "import_error"
        assert "wasmtime" in result["root_cause"]

    def test_analyze_includes_suggestion(self):
        """analyze() includes fix suggestion."""
        from systems.testing.failure_analyzer import FailureAnalyzer

        analyzer = FailureAnalyzer()

        test_result = {
            "name": "test_import",
            "status": "fail",
            "error": "ImportError: No module named 'wasmtime'"
        }

        result = analyzer.analyze(test_result)

        assert "suggested_fix" in result
        assert len(result["suggested_fix"]) > 0
