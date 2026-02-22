"""
Integration Tests for Swarm Recursive Evolution System.

Tests the complete end-to-end flow of the recursive evolution system:
1. ValueEvaluator - computes value scores for files
2. GravityPlacer - positions files based on value (high-value near center)
3. AxionCore - selects highest-value targets for improvement

These integration tests verify the components work together correctly.
"""

import math
import pytest
import numpy as np
from typing import List, Tuple

from systems.visual_shell.swarm.evolution import (
    ValueEvaluator,
    ValueScore,
    GravityPlacer,
    GravityPosition,
    AxionCore,
    AxionTarget,
)


class TestHighValueAtCenter:
    """Test 1: Verify high-value code is positioned near center."""

    def test_high_value_near_center(self):
        """High-value files (composite_score > 0.8) should be near center."""
        evaluator = ValueEvaluator()
        placer = GravityPlacer(gravity_constant=100.0)

        # Create a high-value file
        high_value = evaluator.evaluate(
            file_path="core/critical.py",
            access_count=1000,  # High access
            dependent_count=50,  # Many dependents
            coverage=0.1,  # Low coverage = high improvement
            complexity=0.8,
            staleness=0.9,
        )

        # Should be a high composite score
        assert high_value.composite_score > 0.5

        # Position should be near center
        pos = placer.place(high_value.file_path, high_value.composite_score)
        assert pos.distance_from_center < 200, (
            f"High-value file {high_value.composite_score:.2f} "
            f"should be near center, but distance is {pos.distance_from_center:.2f}"
        )

    def test_multiple_high_value_files_cluster_near_center(self):
        """Multiple high-value files should all cluster near center."""
        evaluator = ValueEvaluator()
        placer = GravityPlacer(gravity_constant=100.0)

        high_value_files = [
            ("core/kernel.py", 900, 100, 0.05, 0.9, 0.95),
            ("core/memory.py", 800, 80, 0.1, 0.85, 0.9),
            ("core/scheduler.py", 700, 60, 0.15, 0.8, 0.85),
        ]

        for file_path, access, deps, coverage, complexity, staleness in high_value_files:
            score = evaluator.evaluate(
                file_path=file_path,
                access_count=access,
                dependent_count=deps,
                coverage=coverage,
                complexity=complexity,
                staleness=staleness,
            )
            pos = placer.place(score.file_path, score.composite_score)
            assert pos.distance_from_center < 200, (
                f"High-value file {file_path} (score={score.composite_score:.2f}) "
                f"is too far from center: {pos.distance_from_center:.2f}"
            )


class TestLowValueAtPeriphery:
    """Test 2: Verify low-value code is far from center."""

    def test_low_value_far_from_center(self):
        """Low-value files (composite_score < 0.2) should be far from center."""
        evaluator = ValueEvaluator()
        placer = GravityPlacer(gravity_constant=100.0)

        # Create a low-value file
        low_value = evaluator.evaluate(
            file_path="legacy/deprecated.py",
            access_count=1,  # Low access
            dependent_count=0,  # No dependents
            coverage=1.0,  # Full coverage = no improvement
            complexity=0.1,
            staleness=0.05,
        )

        # Should be a low composite score
        assert low_value.composite_score < 0.3

        # Position should be far from center
        pos = placer.place(low_value.file_path, low_value.composite_score)
        assert pos.distance_from_center > 300, (
            f"Low-value file {low_value.composite_score:.2f} "
            f"should be far from center, but distance is {pos.distance_from_center:.2f}"
        )

    def test_multiple_low_value_files_at_periphery(self):
        """Multiple low-value files should all be at periphery."""
        evaluator = ValueEvaluator()
        placer = GravityPlacer(gravity_constant=100.0)

        low_value_files = [
            ("legacy/old1.py", 2, 0, 0.99, 0.05, 0.02),
            ("deprecated/util.py", 3, 1, 0.95, 0.1, 0.05),
            ("archived/module.py", 1, 0, 1.0, 0.08, 0.01),
        ]

        for file_path, access, deps, coverage, complexity, staleness in low_value_files:
            score = evaluator.evaluate(
                file_path=file_path,
                access_count=access,
                dependent_count=deps,
                coverage=coverage,
                complexity=complexity,
                staleness=staleness,
            )
            pos = placer.place(score.file_path, score.composite_score)
            assert pos.distance_from_center > 300, (
                f"Low-value file {file_path} (score={score.composite_score:.2f}) "
                f"should be at periphery, but distance is only {pos.distance_from_center:.2f}"
            )


class TestAxionSelectsHighestValue:
    """Test 3: AxionCore selects highest-value file."""

    def test_axion_selects_highest_value(self):
        """AxionCore.select_target() should return the file with highest value_score."""
        evaluator = ValueEvaluator()
        core = AxionCore()

        files = [
            ("utils/helper.py", 50, 5, 0.8, 0.3, 0.2),
            ("core/engine.py", 500, 30, 0.2, 0.7, 0.8),
            ("services/api.py", 200, 15, 0.5, 0.5, 0.5),
        ]

        for file_path, access, deps, coverage, complexity, staleness in files:
            score = evaluator.evaluate(
                file_path=file_path,
                access_count=access,
                dependent_count=deps,
                coverage=coverage,
                complexity=complexity,
                staleness=staleness,
            )
            core.add_candidate(
                file_path=score.file_path,
                value_score=score.composite_score,
            )

        target = core.select_target()
        assert target is not None
        assert target.file_path == "core/engine.py", (
            f"Expected core/engine.py to be selected, got {target.file_path}"
        )

    def test_axion_selects_among_many_candidates(self):
        """AxionCore should correctly select highest among many candidates."""
        evaluator = ValueEvaluator()
        core = AxionCore()

        # Add 20 candidates with varying values
        expected_highest = None
        expected_score = -1

        for i in range(20):
            access = (i + 1) * 10
            deps = (i + 1) * 2
            coverage = 1.0 - (i / 20)  # Decreasing coverage = increasing improvement

            score = evaluator.evaluate(
                file_path=f"module_{i:02d}.py",
                access_count=access,
                dependent_count=deps,
                coverage=coverage,
                complexity=0.5,
                staleness=0.5,
            )

            core.add_candidate(
                file_path=score.file_path,
                value_score=score.composite_score,
            )

            if score.composite_score > expected_score:
                expected_score = score.composite_score
                expected_highest = score.file_path

        target = core.select_target()
        assert target is not None
        assert target.file_path == expected_highest, (
            f"Expected {expected_highest} (score={expected_score:.2f}) "
            f"but got {target.file_path} (score={target.value_score:.2f})"
        )


class TestEvolutionCycle:
    """Test 4: Complete evolution cycle works end-to-end."""

    def test_evolution_cycle(self):
        """Test complete evolution cycle: evaluate -> place -> select -> complete."""
        evaluator = ValueEvaluator()
        placer = GravityPlacer(gravity_constant=100.0)
        core = AxionCore()

        # Step 1: Evaluate multiple files
        files = [
            ("app/main.py", 200, 10, 0.4, 0.6, 0.5),
            ("app/core.py", 500, 40, 0.2, 0.8, 0.7),
            ("app/utils.py", 100, 5, 0.9, 0.2, 0.3),
        ]

        scores = []
        for file_path, access, deps, coverage, complexity, staleness in files:
            score = evaluator.evaluate(
                file_path=file_path,
                access_count=access,
                dependent_count=deps,
                coverage=coverage,
                complexity=complexity,
                staleness=staleness,
            )
            scores.append(score)

            # Step 2: Place in gravity field
            pos = placer.place(score.file_path, score.composite_score)

            # Step 3: Add to AxionCore
            core.add_candidate(
                file_path=score.file_path,
                value_score=score.composite_score,
                original_position=(pos.x, pos.y),
            )

        # Verify all files are placed
        assert len(placer.get_all_positions()) == 3

        # Step 4: Select target for improvement
        target = core.select_target()
        assert target is not None
        assert target.file_path == "app/core.py"  # Highest value

        # Step 5: Complete the target
        events = []
        core.on_event = lambda e: events.append(e)
        core.complete_target(target.file_path, improvement_delta=0.25)

        # Verify completion
        assert len(events) == 1
        assert events[0]["type"] == "target_completed"
        assert events[0]["improvement_delta"] == 0.25

        # Step 6: Select next target
        next_target = core.select_target()
        assert next_target is not None
        assert next_target.file_path != "app/core.py"  # Previous target should be removed

    def test_evolution_cycle_with_protected_files(self):
        """Test evolution cycle respects protected files."""
        evaluator = ValueEvaluator()
        core = AxionCore(protected_files=["critical/safety.py"])

        # Add protected file with highest score
        protected_score = evaluator.evaluate(
            file_path="critical/safety.py",
            access_count=1000,
            dependent_count=100,
            coverage=0.1,
            complexity=0.9,
            staleness=0.9,
        )
        core.add_candidate(
            file_path=protected_score.file_path,
            value_score=protected_score.composite_score,
        )

        # Add normal file with lower score
        normal_score = evaluator.evaluate(
            file_path="normal/module.py",
            access_count=100,
            dependent_count=10,
            coverage=0.5,
            complexity=0.5,
            staleness=0.5,
        )
        core.add_candidate(
            file_path=normal_score.file_path,
            value_score=normal_score.composite_score,
        )

        # Protected file should have higher score
        assert protected_score.composite_score > normal_score.composite_score

        # But normal file should be selected (protected is skipped)
        target = core.select_target()
        assert target is not None
        assert target.file_path == "normal/module.py"


class TestGravityConsistency:
    """Test 5: Gravity consistency - correlation(value, 1/distance) > 0.95."""

    def test_gravity_consistency(self):
        """Run 100 files, verify correlation(value, 1/distance) > 0.95."""
        evaluator = ValueEvaluator()
        placer = GravityPlacer(gravity_constant=100.0)

        values = []
        inverse_distances = []

        for i in range(100):
            # Vary access count to get spread of values
            access_count = i * 10  # 0 to 990
            dependent_count = i // 5
            coverage = max(0.1, 1.0 - (i / 100))  # 0.1 to 1.0

            score = evaluator.evaluate(
                file_path=f"file_{i:03d}.py",
                access_count=access_count,
                dependent_count=dependent_count,
                coverage=coverage,
                complexity=0.5,
                staleness=0.5,
            )

            pos = placer.place(score.file_path, score.composite_score)

            values.append(score.composite_score)
            inverse_distances.append(1.0 / pos.distance_from_center if pos.distance_from_center > 0 else 0)

        # Calculate Pearson correlation
        correlation = np.corrcoef(values, inverse_distances)[0, 1]

        assert correlation > 0.95, (
            f"Expected correlation > 0.95 between value and 1/distance, "
            f"got {correlation:.4f}"
        )

    def test_gravity_consistency_with_varied_inputs(self):
        """Test gravity consistency with more varied input parameters."""
        evaluator = ValueEvaluator()
        placer = GravityPlacer(gravity_constant=100.0)

        values = []
        inverse_distances = []

        import random
        random.seed(42)  # Deterministic randomness

        for i in range(100):
            access_count = random.randint(1, 1000)
            dependent_count = random.randint(0, 50)
            coverage = random.uniform(0.0, 1.0)
            complexity = random.uniform(0.0, 1.0)
            staleness = random.uniform(0.0, 1.0)

            score = evaluator.evaluate(
                file_path=f"random_file_{i:03d}.py",
                access_count=access_count,
                dependent_count=dependent_count,
                coverage=coverage,
                complexity=complexity,
                staleness=staleness,
            )

            pos = placer.place(score.file_path, score.composite_score)

            values.append(score.composite_score)
            inverse_distances.append(1.0 / pos.distance_from_center if pos.distance_from_center > 0 else 0)

        correlation = np.corrcoef(values, inverse_distances)[0, 1]

        assert correlation > 0.95, (
            f"Expected correlation > 0.95 with varied inputs, "
            f"got {correlation:.4f}"
        )


class TestDeterministicPlacement:
    """Test 6: Same file always gets same position."""

    def test_deterministic_placement(self):
        """Same file should always get same position for same value."""
        evaluator = ValueEvaluator()
        placer = GravityPlacer(gravity_constant=100.0)

        # Evaluate same file multiple times
        positions = []
        for _ in range(10):
            score = evaluator.evaluate(
                file_path="consistent/file.py",
                access_count=100,
                dependent_count=10,
                coverage=0.5,
                complexity=0.5,
                staleness=0.5,
            )
            pos = placer.place(score.file_path, score.composite_score)
            positions.append((pos.x, pos.y, pos.distance_from_center))

        # All positions should be identical
        first_pos = positions[0]
        for i, pos in enumerate(positions):
            assert pos == first_pos, (
                f"Position {i} differs from first: {pos} vs {first_pos}"
            )

    def test_deterministic_placement_different_sessions(self):
        """Placement should be deterministic across different GravityPlacer instances."""
        file_path = "deterministic/test.py"
        value_score = 0.75

        # Create first placer and place file
        placer1 = GravityPlacer(gravity_constant=100.0)
        pos1 = placer1.place(file_path, value_score)

        # Create second placer (simulating new session) and place same file
        placer2 = GravityPlacer(gravity_constant=100.0)
        pos2 = placer2.place(file_path, value_score)

        # Positions should be identical
        assert pos1.x == pos2.x, f"X coordinates differ: {pos1.x} vs {pos2.x}"
        assert pos1.y == pos2.y, f"Y coordinates differ: {pos1.y} vs {pos2.y}"
        assert pos1.distance_from_center == pos2.distance_from_center, (
            f"Distances differ: {pos1.distance_from_center} vs {pos2.distance_from_center}"
        )

    def test_deterministic_angle_across_placements(self):
        """Same file should maintain same angle from center regardless of value."""
        placer = GravityPlacer(gravity_constant=100.0)

        file_path = "angle_test.py"

        # Place same file with different values
        pos_low = placer.place(file_path, 0.1)
        angle_low = math.atan2(pos_low.y, pos_low.x)

        pos_mid = placer.place(file_path, 0.5)
        angle_mid = math.atan2(pos_mid.y, pos_mid.x)

        pos_high = placer.place(file_path, 0.9)
        angle_high = math.atan2(pos_high.y, pos_high.x)

        # All angles should be essentially identical
        assert abs(angle_low - angle_mid) < 0.0001, (
            f"Angles differ between low and mid: {angle_low} vs {angle_mid}"
        )
        assert abs(angle_mid - angle_high) < 0.0001, (
            f"Angles differ between mid and high: {angle_mid} vs {angle_high}"
        )


class TestFullSystemIntegration:
    """Additional comprehensive integration tests."""

    def test_value_to_gravity_to_axion_pipeline(self):
        """Test complete pipeline from value evaluation to axion selection."""
        evaluator = ValueEvaluator()
        placer = GravityPlacer(gravity_constant=100.0)
        core = AxionCore()

        # Simulate a real codebase with 10 files
        files = [
            ("src/main.py", 300, 20, 0.3, 0.6, 0.5),
            ("src/core.py", 800, 50, 0.1, 0.9, 0.8),
            ("src/utils.py", 150, 10, 0.7, 0.3, 0.4),
            ("src/api.py", 400, 25, 0.4, 0.5, 0.6),
            ("src/db.py", 350, 15, 0.5, 0.6, 0.5),
            ("tests/test_main.py", 100, 0, 0.9, 0.2, 0.1),
            ("legacy/old.py", 10, 2, 0.95, 0.1, 0.05),
            ("config/settings.py", 200, 30, 0.6, 0.3, 0.7),
            ("lib/helper.py", 50, 5, 0.8, 0.4, 0.2),
            ("scripts/build.py", 20, 0, 0.85, 0.15, 0.1),
        ]

        # Process each file
        for file_path, access, deps, coverage, complexity, staleness in files:
            # Evaluate
            score = evaluator.evaluate(
                file_path=file_path,
                access_count=access,
                dependent_count=deps,
                coverage=coverage,
                complexity=complexity,
                staleness=staleness,
            )

            # Place in gravity field
            pos = placer.place(score.file_path, score.composite_score)

            # Add to AxionCore
            core.add_candidate(
                file_path=score.file_path,
                value_score=score.composite_score,
                gravity_position=(pos.x, pos.y),
            )

        # Verify all files processed
        assert len(placer.get_all_positions()) == 10
        assert core.candidate_count() == 10

        # Select highest value target
        target = core.select_target()
        assert target is not None
        assert target.file_path == "src/core.py", (
            f"Expected src/core.py, got {target.file_path}"
        )

        # Verify inner ring contains high-value files
        inner_ring = placer.get_inner_ring(200)
        inner_paths = [p.file_path for p in inner_ring]
        assert "src/core.py" in inner_paths, "High-value file should be in inner ring"

    def test_evolution_improves_over_iterations(self):
        """Test that the system tracks improvements over multiple iterations."""
        evaluator = ValueEvaluator()
        core = AxionCore()

        # Initial evaluation
        initial_scores = []
        for i in range(5):
            score = evaluator.evaluate(
                file_path=f"module_{i}.py",
                access_count=(i + 1) * 50,
                dependent_count=(i + 1) * 5,
                coverage=0.5,
                complexity=0.5,
                staleness=0.5,
            )
            initial_scores.append(score)
            core.add_candidate(score.file_path, score.composite_score)

        # Process all targets
        total_improvement = 0
        while core.candidate_count() > 0:
            target = core.select_target()
            if target is None:
                break

            # Simulate improvement
            improvement = 0.1 + (target.value_score * 0.2)  # Higher value = more potential
            total_improvement += improvement
            core.complete_target(target.file_path, improvement_delta=improvement)

        # Verify history was recorded
        assert len(core.improvement_history) == 5
        assert total_improvement > 0

        # Verify each completion was recorded
        for record in core.improvement_history:
            assert "file_path" in record
            assert "delta" in record
            assert "timestamp" in record
            assert record["delta"] > 0
