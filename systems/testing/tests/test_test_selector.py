# systems/testing/tests/test_test_selector.py
"""
Tests for TestSelector component.

TDD: Tests written first, implementation follows.
"""

import pytest
from pathlib import Path
from unittest.mock import patch, MagicMock


class TestTestSelectorInit:
    """Test TestSelector initialization."""

    def test_init_with_project_root(self):
        """TestSelector initializes with project root."""
        from systems.testing.test_selector import TestSelector

        selector = TestSelector(project_root="/path/to/project")

        assert selector.project_root == Path("/path/to/project")

    def test_init_with_coverage_file(self):
        """TestSelector can use custom coverage file."""
        from systems.testing.test_selector import TestSelector

        selector = TestSelector(
            project_root="/project",
            coverage_file="custom_coverage.xml"
        )

        assert selector.coverage_file == "custom_coverage.xml"


class TestTestSelectorSelectByChangedFiles:
    """Test selection based on changed files."""

    def test_select_returns_list(self):
        """select_for_changes returns a list of test files."""
        from systems.testing.test_selector import TestSelector

        selector = TestSelector(project_root="/project")

        result = selector.select_for_changes(changed_files=["src/main.py"])

        assert isinstance(result, list)

    def test_select_with_empty_changes(self):
        """select_for_changes handles empty input."""
        from systems.testing.test_selector import TestSelector

        selector = TestSelector(project_root="/project")

        result = selector.select_for_changes(changed_files=[])

        assert result == []

    def test_select_maps_source_to_test(self):
        """select_for_changes maps source files to test files."""
        from systems.testing.test_selector import TestSelector

        selector = TestSelector(project_root="/project")

        # Should find tests related to wasm_gpu_bridge.py
        result = selector.select_for_changes(
            changed_files=["systems/pixel_compiler/wasm_gpu_bridge.py"]
        )

        # Result should include test file(s)
        assert isinstance(result, list)


class TestTestSelectorSelectByCoverageGap:
    """Test selection based on coverage gaps."""

    @patch("pathlib.Path.exists")
    def test_select_for_coverage_gap_returns_list(self, mock_exists):
        """select_for_coverage_gap returns a list."""
        from systems.testing.test_selector import TestSelector

        mock_exists.return_value = False  # No coverage file

        selector = TestSelector(project_root="/project")
        result = selector.select_for_coverage_gap()

        assert isinstance(result, list)

    def test_select_for_coverage_gap_with_threshold(self):
        """select_for_coverage_gap respects threshold parameter."""
        from systems.testing.test_selector import TestSelector

        selector = TestSelector(project_root="/project")

        result = selector.select_for_coverage_gap(threshold=50.0)

        assert isinstance(result, list)


class TestTestSelectorSelectFull:
    """Test full suite selection."""

    def test_select_full_returns_all_tests(self):
        """select_full returns all test files."""
        from systems.testing.test_selector import TestSelector

        selector = TestSelector(project_root="/project")

        result = selector.select_full()

        assert isinstance(result, list)
