#!/usr/bin/env python3
"""
Tests for Phase 1 Benchmark Runner

Tests the benchmark runner script that executes all Phase 1 benchmarks
and generates analysis reports.
"""

import unittest
import tempfile
import json
from pathlib import Path
from unittest.mock import patch, MagicMock

# Import the runner module
import sys
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from systems.pixel_compiler.benchmarks.phase1_benchmark_runner import (
    format_time_unit,
    generate_markdown_report,
    get_system_info,
    save_results,
    run_benchmarks,
    CONFIG,
)

from systems.pixel_compiler.benchmarks.phase1_benchmark import (
    BenchmarkResult,
    BenchmarkSuite,
    Phase1Benchmark,
)


class TestTimeFormatting(unittest.TestCase):
    """Test time unit formatting functions."""

    def test_format_nanoseconds(self):
        """Test formatting of nanosecond-scale times."""
        value, unit = format_time_unit(50e-9)
        self.assertEqual(value, "50.00")
        self.assertEqual(unit, "ns")

    def test_format_microseconds(self):
        """Test formatting of microsecond-scale times."""
        value, unit = format_time_unit(100e-6)
        self.assertEqual(value, "100.00")
        self.assertEqual(unit, "μs")

    def test_format_milliseconds(self):
        """Test formatting of millisecond-scale times."""
        value, unit = format_time_unit(50e-3)
        self.assertEqual(value, "50.00")
        self.assertEqual(unit, "ms")

    def test_format_seconds(self):
        """Test formatting of second-scale times."""
        value, unit = format_time_unit(5.5)
        self.assertEqual(value, "5.50")
        self.assertEqual(unit, "s")

    def test_format_zero(self):
        """Test formatting of zero time."""
        value, unit = format_time_unit(0)
        self.assertEqual(value, "0")
        self.assertEqual(unit, "s")

    def test_format_infinity(self):
        """Test formatting of infinity (error case)."""
        value, unit = format_time_unit(float('inf'))
        self.assertEqual(value, "ERROR")
        self.assertEqual(unit, "")


class TestSystemInfo(unittest.TestCase):
    """Test system information collection."""

    def test_get_system_info(self):
        """Test that system info collects expected fields."""
        info = get_system_info()

        # Check required fields
        self.assertIn("platform", info)
        self.assertIn("python_version", info)
        self.assertIn("machine", info)
        self.assertIn("processor", info)
        self.assertIn("hostname", info)
        self.assertIn("timestamp", info)

        # Check timestamp format
        self.assertRegex(info["timestamp"], r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}")


class TestMarkdownGeneration(unittest.TestCase):
    """Test markdown report generation."""

    def setUp(self):
        """Set up test fixtures."""
        self.system_info = {
            "platform": "Linux-6.0.0-test",
            "python_version": "3.11.0",
            "machine": "x86_64",
            "processor": "test",
            "hostname": "test-host",
            "timestamp": "2026-02-11T12:00:00",
        }

        self.config = {
            "grid_size": 2048,
            "iterations": 100,
            "e2e_iterations": 10,
            "warmup_iterations": 5,
        }

    def test_generate_markdown_with_passing_results(self):
        """Test markdown generation with passing benchmarks."""
        # Create test suite with passing results
        suite = BenchmarkSuite()

        result = BenchmarkResult(
            name="test_benchmark",
            iterations=100,
            total_time=1.0,
            mean_time=0.001,  # 1ms, well under 1s target
            min_time=0.0005,
            max_time=0.002,
            std_dev=0.0001,
            throughput=1000.0,
            memory_mb=10.0,
            target_time=1.0,
            passed=True,
            metadata={"grid_size": 2048}
        )
        suite.add_result(result)

        # Generate markdown
        markdown = generate_markdown_report(suite, self.system_info, self.config)

        # Check sections
        self.assertIn("# Phase 1 Benchmark Results", markdown)
        self.assertIn("## Executive Summary", markdown)
        self.assertIn("## Performance Overview", markdown)
        self.assertIn("## Detailed Results", markdown)
        self.assertIn("## Performance Analysis", markdown)
        self.assertIn("## Conclusions", markdown)
        self.assertIn("## Next Steps", markdown)

        # Check that passing result is shown
        self.assertIn("✓ PASS", markdown)
        self.assertIn("Test Benchmark", markdown)

    def test_generate_markdown_with_failing_results(self):
        """Test markdown generation with failing benchmarks."""
        suite = BenchmarkSuite()

        result = BenchmarkResult(
            name="slow_benchmark",
            iterations=100,
            total_time=10.0,
            mean_time=2.0,  # 2s, over 1s target
            min_time=1.5,
            max_time=2.5,
            std_dev=0.2,
            throughput=0.5,
            memory_mb=50.0,
            target_time=1.0,
            passed=False,
            metadata={}
        )
        suite.add_result(result)

        markdown = generate_markdown_report(suite, self.system_info, self.config)

        # Check failure indicators
        self.assertIn("✗ FAIL", markdown)
        self.assertIn("Slow Benchmark", markdown)
        self.assertIn("200.0%", markdown)  # 200% of target

    def test_generate_markdown_with_skipped_results(self):
        """Test markdown generation with skipped benchmarks."""
        suite = BenchmarkSuite()

        result = BenchmarkResult(
            name="unavailable_benchmark",
            iterations=0,
            total_time=0.0,
            mean_time=0.0,
            min_time=0.0,
            max_time=0.0,
            std_dev=0.0,
            throughput=0.0,
            memory_mb=0.0,
            target_time=None,
            passed=False,
            metadata={"skipped": True, "reason": "Module not available"}
        )
        suite.add_result(result)

        markdown = generate_markdown_report(suite, self.system_info, self.config)

        # Check skip indicators
        self.assertIn("⊘ SKIP", markdown)
        self.assertIn("Unavailable Benchmark", markdown)
        self.assertIn("Module not available", markdown)

    def test_markdown_includes_system_info(self):
        """Test that markdown includes system information."""
        suite = BenchmarkSuite(metadata={"grid_size": 2048})
        suite.add_result(BenchmarkResult(
            name="test",
            iterations=1,
            total_time=0.0,
            mean_time=0.001,
            min_time=0.001,
            max_time=0.001,
            std_dev=0.0,
            throughput=1000.0,
            memory_mb=0.0,
            target_time=1.0,
            passed=True
        ))

        markdown = generate_markdown_report(suite, self.system_info, self.config)

        # Check system info section
        self.assertIn("## System Information", markdown)
        self.assertIn("Linux-6.0.0-test", markdown)
        self.assertIn("3.11.0", markdown)
        self.assertIn("test-host", markdown)


class TestSaveResults(unittest.TestCase):
    """Test saving benchmark results."""

    def setUp(self):
        """Set up test fixtures."""
        self.temp_dir = tempfile.mkdtemp()
        self.json_path = Path(self.temp_dir) / "results.json"
        self.markdown_path = Path(self.temp_dir) / "report.md"

        self.system_info = get_system_info()
        self.config = CONFIG.copy()

        # Create test suite
        self.suite = BenchmarkSuite()
        result = BenchmarkResult(
            name="test_benchmark",
            iterations=100,
            total_time=1.0,
            mean_time=0.001,
            min_time=0.0005,
            max_time=0.002,
            std_dev=0.0001,
            throughput=1000.0,
            memory_mb=10.0,
            target_time=1.0,
            passed=True,
            metadata={"test": "data"}
        )
        self.suite.add_result(result)

    def tearDown(self):
        """Clean up temp directory."""
        import shutil
        shutil.rmtree(self.temp_dir)

    def test_save_json_results(self):
        """Test saving JSON results file."""
        save_results(
            self.suite,
            self.system_info,
            str(self.json_path),
            str(self.markdown_path),
            self.config
        )

        # Check JSON file exists
        self.assertTrue(self.json_path.exists())

        # Load and verify JSON content
        with open(self.json_path) as f:
            data = json.load(f)

        self.assertIn("metadata", data)
        self.assertIn("summary", data)
        self.assertIn("results", data)
        self.assertEqual(len(data["results"]), 1)

        # Check system info was added
        self.assertIn("system_info", data["metadata"])
        self.assertIn("config", data["metadata"])

    def test_save_markdown_report(self):
        """Test saving markdown report."""
        save_results(
            self.suite,
            self.system_info,
            str(self.json_path),
            str(self.markdown_path),
            self.config
        )

        # Check markdown file exists
        self.assertTrue(self.markdown_path.exists())

        # Read and verify markdown content
        with open(self.markdown_path) as f:
            content = f.read()

        self.assertIn("# Phase 1 Benchmark Results", content)
        self.assertIn("Test Benchmark", content)

    def test_save_creates_directories(self):
        """Test that save creates parent directories."""
        # Use paths with non-existent directories
        deep_json = self.json_path.parent / "deep" / "dir" / "results.json"
        deep_md = self.markdown_path.parent / "deep" / "dir" / "report.md"

        save_results(
            self.suite,
            self.system_info,
            str(deep_json),
            str(deep_md),
            self.config
        )

        self.assertTrue(deep_json.exists())
        self.assertTrue(deep_md.exists())


class TestRunBenchmarks(unittest.TestCase):
    """Test the main benchmark execution function."""

    @patch('systems.pixel_compiler.benchmarks.phase1_benchmark_runner.Phase1Benchmark')
    def test_run_benchmarks_creates_instance(self, mock_benchmark_class):
        """Test that run_benchmarks creates benchmark runner with correct config."""
        mock_instance = MagicMock()
        mock_instance.run_all.return_value = BenchmarkSuite()
        mock_benchmark_class.return_value = mock_instance

        config = {
            "grid_size": 1024,
            "iterations": 50,
            "e2e_iterations": 5,
            "warmup_iterations": 3,
        }

        run_benchmarks(config)

        # Verify Phase1Benchmark was created with correct args
        mock_benchmark_class.assert_called_once_with(
            iterations=50,
            warmup_iterations=3
        )

        # Verify run_all was called with grid_size
        mock_instance.run_all.assert_called_once_with(grid_size=1024)


class TestIntegration(unittest.TestCase):
    """Integration tests for the benchmark runner."""

    def test_full_workflow_simulation(self):
        """Test a simulated full workflow without actual benchmarks."""
        # Create a mock suite
        suite = BenchmarkSuite(metadata={"grid_size": 2048})

        # Add various result types
        # 1. Passing result
        suite.add_result(BenchmarkResult(
            name="hilbert_lut",
            iterations=100,
            total_time=0.5,
            mean_time=0.005,
            min_time=0.004,
            max_time=0.006,
            std_dev=0.0005,
            throughput=200.0,
            memory_mb=5.0,
            target_time=1.0,
            passed=True,
            metadata={"grid_size": 2048}
        ))

        # 2. Failing result
        suite.add_result(BenchmarkResult(
            name="slow_operation",
            iterations=100,
            total_time=5.0,
            mean_time=0.05,
            min_time=0.04,
            max_time=0.06,
            std_dev=0.005,
            throughput=20.0,
            memory_mb=25.0,
            target_time=0.01,
            passed=False,
            metadata={}
        ))

        # 3. Skipped result
        suite.add_result(BenchmarkResult(
            name="optional_feature",
            iterations=0,
            total_time=0.0,
            mean_time=0.0,
            min_time=0.0,
            max_time=0.0,
            std_dev=0.0,
            throughput=0.0,
            memory_mb=0.0,
            target_time=None,
            passed=False,
            metadata={"skipped": True, "reason": "Not implemented"}
        ))

        # Verify summary
        summary = suite.get_summary()
        self.assertEqual(summary["total"], 3)
        self.assertEqual(summary["passed"], 1)
        self.assertEqual(summary["failed"], 2)  # Includes skipped

        # Generate markdown
        system_info = get_system_info()
        config = CONFIG.copy()
        markdown = generate_markdown_report(suite, system_info, config)

        # Verify all result types are represented
        self.assertIn("✓ PASS", markdown)
        self.assertIn("✗ FAIL", markdown)
        self.assertIn("⊘ SKIP", markdown)

        # Test saving
        with tempfile.TemporaryDirectory() as tmpdir:
            json_path = Path(tmpdir) / "results.json"
            md_path = Path(tmpdir) / "report.md"

            save_results(suite, system_info, str(json_path), str(md_path), config)

            self.assertTrue(json_path.exists())
            self.assertTrue(md_path.exists())


if __name__ == "__main__":
    unittest.main()
