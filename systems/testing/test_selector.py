# systems/testing/test_selector.py
"""
TestSelector: Intelligently select tests to run.

Selection strategies:
- changed_files: Select tests covering modified files
- coverage_gap: Select tests for files with low coverage
- full: Select all tests
"""

import subprocess
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import List, Optional, Dict, Set
from dataclasses import dataclass


@dataclass
class CoverageInfo:
    """Coverage information for a file."""
    file_path: str
    line_rate: float  # 0.0 - 1.0
    covered_lines: int
    total_lines: int


class TestSelector:
    """
    Intelligently select tests to run based on context.

    Usage:
        selector = TestSelector(project_root="/path/to/project")

        # Select tests for changed files
        tests = selector.select_for_changes(["src/main.py"])

        # Select tests for coverage gaps
        tests = selector.select_for_coverage_gap(threshold=80.0)

        # Select all tests
        tests = selector.select_full()
    """

    # Mapping of source file patterns to test file patterns
    TEST_MAPPINGS = {
        "systems/pixel_compiler/": "systems/pixel_compiler/tests/",
        "systems/kernel/": "systems/kernel/tests/",
        "systems/testing/": "systems/testing/tests/",
        "ai_project_management/": "ai_project_management/tests/",
    }

    def __init__(
        self,
        project_root: Optional[str] = None,
        coverage_file: str = "coverage.xml",
        junit_file: str = "junit_results.xml"
    ):
        self.project_root = Path(project_root) if project_root else Path.cwd()
        self.coverage_file = coverage_file
        self.junit_file = junit_file
        self._coverage_data: Optional[Dict[str, CoverageInfo]] = None

    def select_for_changes(
        self,
        changed_files: List[str],
        include_deps: bool = True
    ) -> List[str]:
        """
        Select tests that cover the changed files.

        Args:
            changed_files: List of changed source files
            include_deps: Include tests for dependent files

        Returns:
            List of test files to run
        """
        if not changed_files:
            return []

        test_files: Set[str] = set()

        for changed_file in changed_files:
            # Direct test file mapping
            test_file = self._source_to_test(changed_file)
            if test_file:
                test_files.add(test_file)

            # Find tests that cover this file (via coverage data)
            covering_tests = self._find_covering_tests(changed_file)
            test_files.update(covering_tests)

        return sorted(list(test_files))

    def select_for_coverage_gap(
        self,
        threshold: float = 80.0
    ) -> List[str]:
        """
        Select tests for files with coverage below threshold.

        Args:
            threshold: Minimum coverage percentage

        Returns:
            List of test files to run
        """
        coverage_data = self._load_coverage_data()

        if not coverage_data:
            return []

        test_files: Set[str] = set()

        for file_path, info in coverage_data.items():
            coverage_pct = info.line_rate * 100
            if coverage_pct < threshold:
                # Find tests for this file
                tests = self._find_covering_tests(file_path)
                test_files.update(tests)

        return sorted(list(test_files))

    def select_full(self) -> List[str]:
        """
        Select all test files in the project.

        Returns:
            List of all test files
        """
        test_files: List[str] = []

        # Common test directories
        test_dirs = [
            "tests",
            "systems/pixel_compiler/tests",
            "systems/kernel/tests",
            "systems/testing/tests",
            "ai_project_management/tests",
        ]

        for test_dir in test_dirs:
            test_path = self.project_root / test_dir
            if test_path.exists():
                for test_file in test_path.glob("test_*.py"):
                    test_files.append(str(test_file.relative_to(self.project_root)))

        return sorted(test_files)

    def _source_to_test(self, source_file: str) -> Optional[str]:
        """
        Map a source file to its corresponding test file.

        Args:
            source_file: Path to source file

        Returns:
            Path to test file or None
        """
        # Check if this is already a test file
        if "test_" in source_file or source_file.endswith("_test.py"):
            return source_file

        # Map based on directory structure
        for src_pattern, test_pattern in self.TEST_MAPPINGS.items():
            if src_pattern in source_file:
                # Convert source path to test path
                relative = source_file.replace(src_pattern, "")
                module_name = Path(relative).stem
                test_file = f"{test_pattern}test_{module_name}.py"

                # Check if test file exists
                if (self.project_root / test_file).exists():
                    return test_file

        # Default convention: test_<name>.py in tests/ directory
        name = Path(source_file).stem
        test_file = f"tests/test_{name}.py"

        if (self.project_root / test_file).exists():
            return test_file

        return None

    def _find_covering_tests(self, source_file: str) -> List[str]:
        """
        Find test files that cover the given source file.

        Uses coverage data if available.

        Args:
            source_file: Path to source file

        Returns:
            List of test files
        """
        # If we have coverage data, use it
        coverage_data = self._load_coverage_data()

        if not coverage_data:
            return []

        # For now, return tests for files in the same directory
        # A more sophisticated approach would trace actual coverage
        test_files: List[str] = []

        src_dir = Path(source_file).parent
        test_dir = self.project_root / src_dir / "tests"

        if test_dir.exists():
            for test_file in test_dir.glob("test_*.py"):
                test_files.append(str(test_file.relative_to(self.project_root)))

        return test_files

    def _load_coverage_data(self) -> Optional[Dict[str, CoverageInfo]]:
        """
        Load coverage data from coverage.xml.

        Returns:
            Dict mapping file paths to coverage info
        """
        if self._coverage_data is not None:
            return self._coverage_data

        coverage_path = self.project_root / self.coverage_file

        if not coverage_path.exists():
            return None

        try:
            tree = ET.parse(coverage_path)
            root = tree.getroot()

            self._coverage_data = {}

            for package in root.iter("package"):
                for cls in package.iter("class"):
                    file_path = cls.get("filename")
                    line_rate = float(cls.get("line-rate", 0.0))

                    # Count lines
                    lines = cls.find("lines")
                    covered = sum(1 for l in lines.iter("line") if l.get("hits", "0") != "0") if lines else 0
                    total = sum(1 for _ in lines.iter("line")) if lines else 0

                    self._coverage_data[file_path] = CoverageInfo(
                        file_path=file_path,
                        line_rate=line_rate,
                        covered_lines=covered,
                        total_lines=total
                    )

            return self._coverage_data

        except Exception:
            return None
