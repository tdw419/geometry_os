"""
Tests for SpeculativeOptimizer component of the Intrinsic Curiosity Engine.

The SpeculativeOptimizer explores semantic latent space to identify
optimization opportunities based on performance metrics.
"""

import pytest


class TestSpeculativeOptimizerModule:
    """Test module structure and imports."""

    def test_speculative_optimizer_module_exists(self):
        """SpeculativeOptimizer module should be importable."""
        from systems.sisyphus import speculative_optimizer
        assert speculative_optimizer is not None

    def test_optimization_candidate_dataclass_exists(self):
        """OptimizationCandidate dataclass should exist."""
        from systems.sisyphus.speculative_optimizer import OptimizationCandidate
        assert OptimizationCandidate is not None

    def test_speculative_optimizer_class_exists(self):
        """SpeculativeOptimizer class should exist."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer
        assert SpeculativeOptimizer is not None


class TestOptimizationCandidate:
    """Test OptimizationCandidate dataclass behavior."""

    def test_candidate_creation(self):
        """OptimizationCandidate should be creatable with all fields."""
        from systems.sisyphus.speculative_optimizer import OptimizationCandidate

        candidate = OptimizationCandidate(
            source_file="test.py",
            function_name="process_data",
            optimization_type="memoization",
            estimated_benefit=0.8,
            risk_level="low",
            description="Cache function results",
            implementation_hint="Add @lru_cache decorator"
        )

        assert candidate.source_file == "test.py"
        assert candidate.function_name == "process_data"
        assert candidate.optimization_type == "memoization"
        assert candidate.estimated_benefit == 0.8
        assert candidate.risk_level == "low"
        assert candidate.description == "Cache function results"
        assert candidate.implementation_hint == "Add @lru_cache decorator"

    def test_candidate_default_fields(self):
        """OptimizationCandidate should have default values for optional fields."""
        from systems.sisyphus.speculative_optimizer import OptimizationCandidate

        candidate = OptimizationCandidate(
            source_file="test.py",
            function_name="process_data",
            optimization_type="memoization",
            estimated_benefit=0.8,
            risk_level="low"
        )

        assert candidate.description == ""
        assert candidate.implementation_hint == ""

    def test_candidate_sorting_by_benefit(self):
        """OptimizationCandidates should sort by benefit descending."""
        from systems.sisyphus.speculative_optimizer import OptimizationCandidate

        candidates = [
            OptimizationCandidate("a.py", "func_a", "memoization", 0.5, "low"),
            OptimizationCandidate("b.py", "func_b", "caching", 0.9, "low"),
            OptimizationCandidate("c.py", "func_c", "inline", 0.3, "low"),
        ]

        # Sort should order by benefit descending (highest first)
        candidates.sort()

        assert candidates[0].estimated_benefit == 0.9
        assert candidates[1].estimated_benefit == 0.5
        assert candidates[2].estimated_benefit == 0.3


class TestSpeculativeOptimizerAnalysis:
    """Test SpeculativeOptimizer analyze methods."""

    def test_analyze_for_memoization(self):
        """Should detect memoization opportunity for frequently-called fast functions."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        optimizer = SpeculativeOptimizer()

        # High call count, low time = memoization candidate
        candidates = optimizer.analyze(
            source_file="utils.py",
            function_name="compute_hash",
            call_count=500,  # Above min_calls=100 for memoization
            avg_time_ms=2.0  # Above min_time_ms=1.0 for memoization
        )

        assert len(candidates) > 0

        # Find memoization candidate
        memo_candidates = [c for c in candidates if c.optimization_type == "memoization"]
        assert len(memo_candidates) == 1

        memo = memo_candidates[0]
        assert memo.source_file == "utils.py"
        assert memo.function_name == "compute_hash"
        assert memo.risk_level == "low"
        # Benefit = 0.8 * ((500/1000 + 2.0/50) / 2) = 0.8 * 0.27 = 0.216
        assert memo.estimated_benefit > 0.0

    def test_analyze_for_loop_optimization(self):
        """Should detect loop optimization opportunity for slow functions."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        optimizer = SpeculativeOptimizer()

        # Moderate call count, high time = loop unrolling candidate
        candidates = optimizer.analyze(
            source_file="processor.py",
            function_name="transform_data",
            call_count=50,  # Above min_calls=10 for loop_unrolling
            avg_time_ms=25.0  # Above min_time_ms=20.0 for loop_unrolling
        )

        assert len(candidates) > 0

        # Find loop_unrolling candidate
        loop_candidates = [c for c in candidates if c.optimization_type == "loop_unrolling"]
        assert len(loop_candidates) == 1

        loop = loop_candidates[0]
        assert loop.source_file == "processor.py"
        assert loop.function_name == "transform_data"
        assert loop.risk_level == "medium"

    def test_analyze_for_parallelization(self):
        """Should detect parallelization opportunity for CPU-intensive functions."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        optimizer = SpeculativeOptimizer()

        # High call count and time = parallelization candidate
        candidates = optimizer.analyze(
            source_file="compute.py",
            function_name="heavy_calculation",
            call_count=100,  # Above min_calls=50 for parallelization
            avg_time_ms=15.0  # Above min_time_ms=10.0 for parallelization
        )

        # Find parallelization candidate
        para_candidates = [c for c in candidates if c.optimization_type == "parallelization"]
        assert len(para_candidates) == 1

        para = para_candidates[0]
        assert para.risk_level == "high"
        # Benefit = 0.9 * ((100/1000 + 15/50) / 2) = 0.9 * 0.2 = 0.18
        assert para.estimated_benefit > 0.0  # Has some benefit
        assert para.optimization_type == "parallelization"

    def test_analyze_for_kernel_rewrite(self):
        """Should detect kernel rewrite opportunity for GPU-bound functions."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        optimizer = SpeculativeOptimizer()

        candidates = optimizer.analyze(
            source_file="gpu_kernel.py",
            function_name="render_pass",
            call_count=150,  # Above min_calls=100
            avg_time_ms=20.0  # Above min_time_ms=15.0
        )

        kernel_candidates = [c for c in candidates if c.optimization_type == "kernel_rewrite"]
        assert len(kernel_candidates) == 1

        kernel = kernel_candidates[0]
        assert kernel.risk_level == "high"
        # Benefit = 0.85 * ((150/1000 + 20/50) / 2) = 0.85 * 0.275 = 0.23375
        assert kernel.estimated_benefit > 0.0  # Has some benefit
        assert kernel.optimization_type == "kernel_rewrite"

    def test_analyze_no_candidates_for_low_usage(self):
        """Should return empty list for functions with low call count and time."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        optimizer = SpeculativeOptimizer()

        candidates = optimizer.analyze(
            source_file="rare.py",
            function_name="rarely_called",
            call_count=5,  # Below all thresholds
            avg_time_ms=0.1  # Below all thresholds
        )

        assert len(candidates) == 0


class TestSpeculativeOptimizerRiskFiltering:
    """Test risk level filtering in rank_optimizations."""

    def test_risk_assessment_low_only(self):
        """Should filter to only low-risk optimizations."""
        from systems.sisyphus.speculative_optimizer import (
            SpeculativeOptimizer,
            OptimizationCandidate
        )

        optimizer = SpeculativeOptimizer()

        candidates = [
            OptimizationCandidate("a.py", "func_a", "memoization", 0.5, "low"),
            OptimizationCandidate("b.py", "func_b", "parallelization", 0.9, "high"),
            OptimizationCandidate("c.py", "func_c", "loop_unrolling", 0.7, "medium"),
        ]

        filtered = optimizer.rank_optimizations(candidates, max_risk="low")

        assert len(filtered) == 1
        assert filtered[0].risk_level == "low"

    def test_risk_assessment_medium(self):
        """Should filter to low and medium-risk optimizations."""
        from systems.sisyphus.speculative_optimizer import (
            SpeculativeOptimizer,
            OptimizationCandidate
        )

        optimizer = SpeculativeOptimizer()

        candidates = [
            OptimizationCandidate("a.py", "func_a", "memoization", 0.5, "low"),
            OptimizationCandidate("b.py", "func_b", "parallelization", 0.9, "high"),
            OptimizationCandidate("c.py", "func_c", "loop_unrolling", 0.7, "medium"),
        ]

        filtered = optimizer.rank_optimizations(candidates, max_risk="medium")

        assert len(filtered) == 2
        risk_levels = {c.risk_level for c in filtered}
        assert risk_levels == {"low", "medium"}

    def test_risk_assessment_high_allows_all(self):
        """Should include all risk levels when max_risk is high."""
        from systems.sisyphus.speculative_optimizer import (
            SpeculativeOptimizer,
            OptimizationCandidate
        )

        optimizer = SpeculativeOptimizer()

        candidates = [
            OptimizationCandidate("a.py", "func_a", "memoization", 0.5, "low"),
            OptimizationCandidate("b.py", "func_b", "parallelization", 0.9, "high"),
            OptimizationCandidate("c.py", "func_c", "loop_unrolling", 0.7, "medium"),
        ]

        filtered = optimizer.rank_optimizations(candidates, max_risk="high")

        assert len(filtered) == 3

    def test_candidates_sorted_by_benefit(self):
        """rank_optimizations should return candidates sorted by benefit descending."""
        from systems.sisyphus.speculative_optimizer import (
            SpeculativeOptimizer,
            OptimizationCandidate
        )

        optimizer = SpeculativeOptimizer()

        candidates = [
            OptimizationCandidate("a.py", "func_a", "memoization", 0.5, "low"),
            OptimizationCandidate("b.py", "func_b", "caching", 0.9, "low"),
            OptimizationCandidate("c.py", "func_c", "inline", 0.3, "low"),
        ]

        ranked = optimizer.rank_optimizations(candidates, max_risk="high")

        assert ranked[0].estimated_benefit == 0.9
        assert ranked[1].estimated_benefit == 0.5
        assert ranked[2].estimated_benefit == 0.3


class TestSpeculativeOptimizerEntropySpot:
    """Test analyze_entropy_spot method."""

    def test_analyze_hot_spot(self):
        """Should analyze hot entropy spots for optimization."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer
        from systems.sisyphus.entropy_mapper import EntropySpot

        optimizer = SpeculativeOptimizer()

        hot_spot = EntropySpot(
            file_path="hot.py",
            entropy_type="hot",
            score=0.8,
            metrics={
                "call_count": 200,
                "avg_time_ms": 15.0
            },
            function_name="hot_function"
        )

        candidates = optimizer.analyze_entropy_spot(hot_spot)

        assert len(candidates) > 0
        for c in candidates:
            assert c.function_name == "hot_function"
            assert c.source_file == "hot.py"

    def test_analyze_cold_spot_returns_empty(self):
        """Should return empty list for cold spots (no optimization needed)."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer
        from systems.sisyphus.entropy_mapper import EntropySpot

        optimizer = SpeculativeOptimizer()

        cold_spot = EntropySpot(
            file_path="cold.py",
            entropy_type="cold",
            score=0.9,
            metrics={"call_count": 2},
            function_name="cold_function"
        )

        candidates = optimizer.analyze_entropy_spot(cold_spot)

        # Cold spots don't need optimization
        assert len(candidates) == 0


class TestBenefitCalculation:
    """Test benefit calculation formula."""

    def test_benefit_formula_high_usage(self):
        """High call count and time should produce high benefit."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        optimizer = SpeculativeOptimizer()

        # Max out both factors
        candidates = optimizer.analyze(
            source_file="test.py",
            function_name="maxed_func",
            call_count=2000,  # call_factor = min(1.0, 2000/1000) = 1.0
            avg_time_ms=100.0  # time_factor = min(1.0, 100/50) = 1.0
        )

        # Should have multiple candidates
        assert len(candidates) > 0

        # For memoization (benefit_factor=0.8):
        # benefit = 0.8 * ((1.0 + 1.0) / 2) = 0.8 * 1.0 = 0.8
        memo = [c for c in candidates if c.optimization_type == "memoization"][0]
        assert memo.estimated_benefit == pytest.approx(0.8, rel=0.01)

    def test_benefit_formula_partial_usage(self):
        """Partial usage should produce proportional benefit."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        optimizer = SpeculativeOptimizer()

        candidates = optimizer.analyze(
            source_file="test.py",
            function_name="partial_func",
            call_count=500,  # call_factor = 0.5
            avg_time_ms=25.0  # time_factor = 0.5
        )

        # For memoization (benefit_factor=0.8):
        # benefit = 0.8 * ((0.5 + 0.5) / 2) = 0.8 * 0.5 = 0.4
        memo = [c for c in candidates if c.optimization_type == "memoization"][0]
        assert memo.estimated_benefit == pytest.approx(0.4, rel=0.01)


class TestOptimizationPatterns:
    """Test that all optimization patterns are correctly defined."""

    def test_caching_pattern(self):
        """Should detect caching pattern for IO-bound functions."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        optimizer = SpeculativeOptimizer()

        candidates = optimizer.analyze(
            source_file="io.py",
            function_name="fetch_data",
            call_count=100,  # Above min_calls=50
            avg_time_ms=10.0  # Above min_time_ms=5.0
        )

        cache_candidates = [c for c in candidates if c.optimization_type == "caching"]
        assert len(cache_candidates) == 1
        assert cache_candidates[0].risk_level == "low"

    def test_inline_expansion_pattern(self):
        """Should detect inline expansion for tiny hot functions."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        optimizer = SpeculativeOptimizer()

        candidates = optimizer.analyze(
            source_file="tiny.py",
            function_name="getter",
            call_count=500,  # Above min_calls=200
            avg_time_ms=1.0  # Above min_time_ms=0.5
        )

        inline_candidates = [c for c in candidates if c.optimization_type == "inline_expansion"]
        assert len(inline_candidates) == 1
        assert inline_candidates[0].risk_level == "low"
