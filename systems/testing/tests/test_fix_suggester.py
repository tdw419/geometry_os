# systems/testing/tests/test_fix_suggester.py
"""
Tests for FixSuggester component.

TDD: Tests written first, implementation follows.
"""

import pytest


class TestFixSuggesterInit:
    """Test FixSuggester initialization."""

    def test_init(self):
        """FixSuggester initializes correctly."""
        from systems.testing.fix_suggester import FixSuggester

        suggester = FixSuggester()

        assert suggester is not None


class TestFixSuggesterSuggest:
    """Test fix suggestion generation."""

    def test_suggest_returns_list(self):
        """suggest() returns a list of suggestions."""
        from systems.testing.fix_suggester import FixSuggester

        suggester = FixSuggester()

        analysis = {
            "failure_type": "import_error",
            "root_cause": "Missing module: wasmtime",
            "related_files": ["test_wasm.py"]
        }

        result = suggester.suggest(analysis)

        assert isinstance(result, list)

    def test_suggest_for_import_error(self):
        """Generates fix for import error."""
        from systems.testing.fix_suggester import FixSuggester

        suggester = FixSuggester()

        analysis = {
            "failure_type": "import_error",
            "root_cause": "Missing module: wasmtime",
            "related_files": ["requirements.txt"]
        }

        result = suggester.suggest(analysis)

        assert len(result) > 0
        assert "pip install" in result[0]["suggestion"]

    def test_suggest_for_assertion_error(self):
        """Generates fix for assertion error."""
        from systems.testing.fix_suggester import FixSuggester

        suggester = FixSuggester()

        analysis = {
            "failure_type": "assertion_error",
            "root_cause": "expected 5, got 4",
            "related_files": ["test_math.py"]
        }

        result = suggester.suggest(analysis)

        assert len(result) > 0
        assert "assertion" in result[0]["suggestion"].lower()

    def test_suggestion_has_required_fields(self):
        """Each suggestion has required fields."""
        from systems.testing.fix_suggester import FixSuggester

        suggester = FixSuggester()

        analysis = {
            "failure_type": "import_error",
            "root_cause": "Missing module",
            "related_files": ["test.py"]
        }

        result = suggester.suggest(analysis)

        if result:  # If suggestions generated
            assert "suggestion" in result[0]
            assert "action" in result[0]
            assert "confidence" in result[0]
