#!/usr/bin/env python3
"""
run_self_improvement.py - CLI tool for executing self-improvement cycles.

This tool analyzes swarm code files, computes value scores, selects
high-value targets via AxionCore, and runs complete evolution cycles.

Usage:
    python run_self_improvement.py --dry-run              # Preview without applying
    python run_self_improvement.py --target core.py       # Target specific file
    python run_self_improvement.py --max-iterations 3     # Limit iterations
    python run_self_improvement.py                        # Full execution
"""

import argparse
import ast
import os
import sys
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple

# Add parent directories to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent.parent))

from systems.visual_shell.swarm.evolution import (
    ValueEvaluator,
    ValueScore,
    GravityPlacer,
    GravityPosition,
    AxionCore,
    AxionTarget,
    RecursiveOrchestrator,
    EvolutionPhase,
    EvolutionState,
    EvolutionResult,
    EvolutionTracker,
    EvolutionEvent,
    EventType,
)


class CodeAnalyzer:
    """Analyzes Python files for value scoring."""

    def __init__(self, swarm_dir: Path):
        self.swarm_dir = swarm_dir
        self._import_cache: Dict[str, List[str]] = {}

    def scan_files(self) -> List[Path]:
        """Scan all Python files in the swarm directory."""
        files = []
        for py_file in self.swarm_dir.rglob("*.py"):
            # Skip __pycache__ and test files for main analysis
            if "__pycache__" in str(py_file):
                continue
            files.append(py_file)
        return files

    def compute_complexity(self, file_path: Path) -> float:
        """Compute complexity score based on AST analysis."""
        try:
            with open(file_path, "r") as f:
                content = f.read()

            tree = ast.parse(content)

            # Count various complexity indicators
            function_count = sum(1 for _ in ast.walk(tree) if isinstance(_, ast.FunctionDef))
            class_count = sum(1 for _ in ast.walk(tree) if isinstance(_, ast.ClassDef))
            if_count = sum(1 for _ in ast.walk(tree) if isinstance(_, ast.If))
            loop_count = sum(1 for _ in ast.walk(tree) if isinstance(_, (ast.For, ast.While)))
            try_count = sum(1 for _ in ast.walk(tree) if isinstance(_, ast.Try))
            line_count = len(content.splitlines())

            # Weighted complexity formula
            raw_complexity = (
                function_count * 2 +
                class_count * 3 +
                if_count * 1 +
                loop_count * 2 +
                try_count * 3 +
                line_count * 0.1
            )

            # Normalize to 0-1 range (assume max complexity ~500)
            return min(1.0, raw_complexity / 500)

        except Exception:
            return 0.5  # Default complexity on error

    def compute_staleness(self, file_path: Path) -> float:
        """Compute staleness based on modification time."""
        try:
            stat = file_path.stat()
            mod_time = stat.st_mtime
            now = datetime.now().timestamp()

            # Days since modification
            days_old = (now - mod_time) / (60 * 60 * 24)

            # Staleness increases with age, saturating at ~30 days
            return min(1.0, days_old / 30)

        except Exception:
            return 0.5

    def count_imports(self, file_path: Path) -> Tuple[int, List[str]]:
        """Count how many files import from this file."""
        file_module = self._path_to_module(file_path)
        importers = []

        for other_file in self.scan_files():
            if other_file == file_path:
                continue

            imports = self._get_file_imports(other_file)
            if file_module in imports:
                importers.append(str(other_file))

        return len(importers), importers

    def _path_to_module(self, file_path: Path) -> str:
        """Convert file path to Python module path."""
        rel_path = file_path.relative_to(self.swarm_dir.parent.parent.parent.parent)
        module = str(rel_path).replace("/", ".").replace(".py", "")
        return module

    def _get_file_imports(self, file_path: Path) -> List[str]:
        """Get list of modules imported by a file."""
        if str(file_path) in self._import_cache:
            return self._import_cache[str(file_path)]

        imports = []
        try:
            with open(file_path, "r") as f:
                content = f.read()

            tree = ast.parse(content)

            for node in ast.walk(tree):
                if isinstance(node, ast.Import):
                    for alias in node.names:
                        imports.append(alias.name)
                elif isinstance(node, ast.ImportFrom):
                    if node.module:
                        imports.append(node.module)

        except Exception:
            pass

        self._import_cache[str(file_path)] = imports
        return imports

    def estimate_coverage(self, file_path: Path) -> float:
        """Estimate test coverage based on corresponding test file."""
        # Look for test file
        test_patterns = [
            file_path.parent / "tests" / f"test_{file_path.name}",
            file_path.parent.parent / "tests" / f"test_{file_path.name}",
        ]

        for test_file in test_patterns:
            if test_file.exists():
                # Has test file - estimate 50-80% coverage
                try:
                    with open(test_file, "r") as f:
                        test_content = f.read()
                    # More test functions = higher estimated coverage
                    test_count = test_content.count("def test_")
                    return min(0.8, 0.3 + test_count * 0.05)
                except Exception:
                    return 0.4

        # No test file found
        return 0.1


class SelfImprovementRunner:
    """Main runner for self-improvement cycles."""

    def __init__(self, swarm_dir: Path, dry_run: bool = False):
        self.swarm_dir = swarm_dir
        self.dry_run = dry_run
        self.evaluator = ValueEvaluator()
        self.analyzer = CodeAnalyzer(swarm_dir)
        self.axion_core = AxionCore(
            protected_files=[str(swarm_dir / "evolution" / "run_self_improvement.py")]
        )
        self.orchestrator = RecursiveOrchestrator()
        self.tracker = EvolutionTracker()
        self.gravity_placer = GravityPlacer()

        # Results storage
        self.value_scores: Dict[str, ValueScore] = {}
        self.selected_target: Optional[AxionTarget] = None
        self.evolution_result: Optional[EvolutionResult] = None

    def analyze_codebase(self) -> Dict[str, ValueScore]:
        """Analyze all files and compute value scores."""
        print("=" * 60)
        print("ANALYZING CODEBASE")
        print("=" * 60)

        files = self.analyzer.scan_files()
        print(f"Found {len(files)} Python files in swarm directory")

        for file_path in files:
            # Compute metrics
            complexity = self.analyzer.compute_complexity(file_path)
            staleness = self.analyzer.compute_staleness(file_path)
            dependent_count, dependents = self.analyzer.count_imports(file_path)
            coverage = self.analyzer.estimate_coverage(file_path)

            # Access count is simulated based on file role
            # Core files get higher access counts
            rel_path = file_path.relative_to(self.swarm_dir)
            access_count = 10  # Base access
            if "core" in str(rel_path).lower():
                access_count = 100
            elif "coordinator" in str(rel_path).lower():
                access_count = 80
            elif "agent" in str(rel_path).lower():
                access_count = 50

            # Compute value score
            score = self.evaluator.evaluate(
                file_path=str(file_path),
                access_count=access_count,
                dependent_count=dependent_count,
                coverage=coverage,
                complexity=complexity,
                staleness=staleness,
                metadata={
                    "dependents": dependents[:5],  # Top 5 dependents
                    "test_coverage_estimated": coverage,
                }
            )

            self.value_scores[str(file_path)] = score

            # Add to AxionCore
            self.axion_core.add_candidate(
                file_path=str(file_path),
                value_score=score.composite_score,
                reason=f"composite={score.composite_score:.3f}",
                value_breakdown={
                    "access": score.access_score,
                    "criticality": score.criticality_score,
                    "improvement": score.improvement_score,
                    "complexity": score.complexity_score,
                    "staleness": score.staleness_score,
                }
            )

        print(f"Computed value scores for {len(self.value_scores)} files")
        return self.value_scores

    def select_target(self, specific_file: Optional[str] = None) -> Optional[AxionTarget]:
        """Select the highest-value target for improvement."""
        print("\n" + "=" * 60)
        print("SELECTING TARGET")
        print("=" * 60)

        if specific_file:
            # Find the specific file
            target_path = self.swarm_dir / specific_file
            if target_path.exists():
                score = self.value_scores.get(str(target_path))
                if score:
                    self.selected_target = AxionTarget(
                        file_path=str(target_path),
                        value_score=score.composite_score,
                    )
            else:
                print(f"ERROR: Target file not found: {specific_file}")
                return None
        else:
            # Select highest-value non-protected target
            self.selected_target = self.axion_core.select_target()

        if self.selected_target:
            print(f"Selected target: {self.selected_target.file_path}")
            print(f"  Value score: {self.selected_target.value_score:.3f}")
        else:
            print("No suitable target found")

        return self.selected_target

    def run_evolution_cycle(self, max_iterations: int = 3) -> EvolutionResult:
        """Run the evolution cycle for the selected target."""
        print("\n" + "=" * 60)
        print("RUNNING EVOLUTION CYCLE")
        print("=" * 60)

        if not self.selected_target:
            return EvolutionResult(
                success=False,
                target_file="",
                error_message="No target selected",
            )

        if self.dry_run:
            print("DRY RUN - Simulating evolution cycle")
            self.evolution_result = EvolutionResult(
                success=True,
                target_file=self.selected_target.file_path,
                improvement_delta=0.0,
                tests_passed=5,
                tests_failed=0,
                consensus_achieved=True,
                iterations=1,
                metadata={"dry_run": True},
            )
        else:
            # Run actual evolution
            self.evolution_result = self.orchestrator.run_evolution_cycle(
                target_file=self.selected_target.file_path,
                max_iterations=max_iterations,
            )

        # Log event
        event = EvolutionEvent(
            type=EventType.SUCCESS if self.evolution_result.success else EventType.REJECTION,
            target_file=self.evolution_result.target_file,
            timestamp=datetime.now(),
            value_score_before=self.selected_target.value_score,
            value_score_after=self.selected_target.value_score + self.evolution_result.improvement_delta,
            reason="Evolution cycle completed",
            metadata={
                "iterations": self.evolution_result.iterations,
                "tests_passed": self.evolution_result.tests_passed,
                "consensus": self.evolution_result.consensus_achieved,
            },
        )
        self.tracker.log_event(event)

        return self.evolution_result

    def generate_report(self) -> str:
        """Generate a detailed evolution report."""
        report_lines = [
            "# Swarm Self-Improvement Report",
            "",
            f"**Generated:** {datetime.now().isoformat()}",
            f"**Mode:** {'DRY RUN (no changes applied)' if self.dry_run else 'LIVE (changes applied)'}",
            "",
            "## Summary",
            "",
        ]

        if self.selected_target:
            report_lines.extend([
                f"- **Target File:** `{Path(self.selected_target.file_path).name}`",
                f"- **Full Path:** `{self.selected_target.file_path}`",
                f"- **Initial Value Score:** {self.selected_target.value_score:.4f}",
            ])

        if self.evolution_result:
            final_score = self.selected_target.value_score + self.evolution_result.improvement_delta if self.selected_target else 0
            report_lines.extend([
                f"- **Final Value Score:** {final_score:.4f}",
                f"- **Improvement Delta:** {self.evolution_result.improvement_delta:+.4f}",
                f"- **Tests Passed:** {self.evolution_result.tests_passed}",
                f"- **Tests Failed:** {self.evolution_result.tests_failed}",
                f"- **Consensus Achieved:** {'Yes' if self.evolution_result.consensus_achieved else 'No'}",
                f"- **Iterations:** {self.evolution_result.iterations}",
                f"- **Success:** {'Yes' if self.evolution_result.success else 'No'}",
            ])

        report_lines.extend([
            "",
            "## Files Analyzed",
            "",
            f"Total files scanned: {len(self.value_scores)}",
            "",
            "### Top 10 by Value Score",
            "",
            "| Rank | File | Composite | Criticality | Improvement |",
            "|------|------|-----------|-------------|-------------|",
        ])

        # Sort by composite score
        sorted_scores = sorted(
            self.value_scores.items(),
            key=lambda x: x[1].composite_score,
            reverse=True
        )[:10]

        for i, (path, score) in enumerate(sorted_scores, 1):
            filename = Path(path).name
            report_lines.append(
                f"| {i} | `{filename}` | {score.composite_score:.3f} | "
                f"{score.criticality_score:.3f} | {score.improvement_score:.3f} |"
            )

        report_lines.extend([
            "",
            "## Evolution Metrics",
            "",
        ])

        metrics = self.tracker.generate_report()
        report_lines.extend([
            f"- **Total Improvements:** {metrics['total_improvements']}",
            f"- **Total Rejections:** {metrics['total_rejections']}",
            f"- **Total Rollbacks:** {metrics['total_rollbacks']}",
            f"- **Average Improvement Delta:** {metrics['average_improvement_delta']:.4f}",
            f"- **Evolution Velocity:** {metrics['velocity']:.2f} per hour",
        ])

        if self.selected_target and self.evolution_result:
            report_lines.extend([
                "",
                "## Target Selection Rationale",
                "",
                f"The file `{Path(self.selected_target.file_path).name}` was selected because:",
                "",
            ])

            score = self.value_scores.get(self.selected_target.file_path)
            if score:
                if score.criticality_score > 0.5:
                    report_lines.append("- High criticality: Many other files depend on it")
                if score.improvement_score > 0.5:
                    report_lines.append("- High improvement potential: Low test coverage")
                if score.complexity_score > 0.5:
                    report_lines.append("- High complexity: Could benefit from refactoring")
                if score.staleness_score > 0.5:
                    report_lines.append("- High staleness: Has not been updated recently")

        report_lines.extend([
            "",
            "## Recommendations",
            "",
            "### Next Steps",
            "",
            "1. Review the changes made to the target file",
            "2. Run full test suite to verify no regressions",
            "3. Consider committing the improvements",
            "4. Run again to target the next highest-value file",
            "",
            "### High-Value Candidates for Next Run",
            "",
        ])

        # Skip the already-targeted file
        next_candidates = [
            (path, score) for path, score in sorted_scores
            if path != (self.selected_target.file_path if self.selected_target else "")
        ][:5]

        for path, score in next_candidates:
            report_lines.append(f"- `{Path(path).name}` (score: {score.composite_score:.3f})")

        report_lines.extend([
            "",
            "---",
            "",
            "*Report generated by Swarm Recursive Evolution System*",
        ])

        return "\n".join(report_lines)

    def save_report(self, output_path: Path) -> None:
        """Save the report to a file."""
        report = self.generate_report()
        with open(output_path, "w") as f:
            f.write(report)
        print(f"\nReport saved to: {output_path}")


def main():
    parser = argparse.ArgumentParser(
        description="Run self-improvement cycles on swarm code",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    %(prog)s --dry-run                  Preview what would be improved
    %(prog)s --target coordinator.py    Target specific file
    %(prog)s --max-iterations 5         Allow more iterations
    %(prog)s                            Full execution
        """
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Preview improvements without applying changes",
    )
    parser.add_argument(
        "--target",
        type=str,
        help="Target a specific file (relative to swarm directory)",
    )
    parser.add_argument(
        "--max-iterations",
        type=int,
        default=3,
        help="Maximum iterations for evolution cycle (default: 3)",
    )
    parser.add_argument(
        "--swarm-dir",
        type=str,
        default=None,
        help="Path to swarm directory (default: auto-detect)",
    )
    parser.add_argument(
        "--report",
        type=str,
        default=None,
        help="Path to save report (default: evolution/evolution_report.md)",
    )

    args = parser.parse_args()

    # Determine swarm directory
    if args.swarm_dir:
        swarm_dir = Path(args.swarm_dir)
    else:
        # Auto-detect based on script location
        swarm_dir = Path(__file__).parent.parent

    if not swarm_dir.exists():
        print(f"ERROR: Swarm directory not found: {swarm_dir}")
        sys.exit(1)

    print(f"Swarm directory: {swarm_dir}")
    print(f"Mode: {'DRY RUN' if args.dry_run else 'LIVE'}")

    # Create runner and execute
    runner = SelfImprovementRunner(swarm_dir, dry_run=args.dry_run)

    # Step 1: Analyze codebase
    runner.analyze_codebase()

    # Step 2: Select target
    target = runner.select_target(args.target)
    if not target:
        print("ERROR: No target could be selected")
        sys.exit(1)

    # Step 3: Run evolution cycle
    result = runner.run_evolution_cycle(args.max_iterations)

    # Step 4: Generate and save report
    report_path = Path(args.report) if args.report else Path(__file__).parent / "evolution_report.md"
    runner.save_report(report_path)

    # Print summary
    print("\n" + "=" * 60)
    print("SUMMARY")
    print("=" * 60)
    print(f"Target: {Path(result.target_file).name if result.target_file else 'None'}")
    print(f"Success: {result.success}")
    print(f"Improvement Delta: {result.improvement_delta:+.4f}")
    print(f"Tests: {result.tests_passed} passed, {result.tests_failed} failed")
    print(f"Consensus: {'Achieved' if result.consensus_achieved else 'Not achieved'}")

    if result.error_message:
        print(f"Error: {result.error_message}")

    sys.exit(0 if result.success else 1)


if __name__ == "__main__":
    main()
