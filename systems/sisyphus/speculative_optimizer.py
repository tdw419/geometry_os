"""
Speculative Optimizer for Intrinsic Curiosity Engine

Explores semantic latent space to identify optimization opportunities
based on performance metrics and heuristics.
"""

from dataclasses import dataclass
from typing import Any


@dataclass(order=False)
class OptimizationCandidate:
    """
    Represents a potential optimization opportunity.

    Describes an optimization that could be applied to improve
    performance, along with estimated benefit and risk assessment.
    """

    source_file: str
    function_name: str
    optimization_type: str
    estimated_benefit: float  # 0.0 to 1.0
    risk_level: str  # "low", "medium", "high"
    description: str = ""
    implementation_hint: str = ""

    def __lt__(self, other: "OptimizationCandidate") -> bool:
        """Sort by benefit descending (higher benefit = more important)."""
        return self.estimated_benefit > other.estimated_benefit


# Optimization pattern definitions with heuristics
# Each pattern has: min_calls, min_time_ms, benefit_factor, risk_level
OPTIMIZATION_PATTERNS: dict[str, dict[str, Any]] = {
    "memoization": {
        "min_calls": 100,
        "min_time_ms": 1.0,
        "benefit_factor": 0.8,
        "risk": "low",
        "description": "Cache function results to avoid redundant computation",
        "hint": "Add @lru_cache decorator or implement memoization pattern"
    },
    "caching": {
        "min_calls": 50,
        "min_time_ms": 5.0,
        "benefit_factor": 0.7,
        "risk": "low",
        "description": "Cache results for IO-bound or expensive operations",
        "hint": "Implement caching layer with TTL or use Redis/Memcached"
    },
    "loop_unrolling": {
        "min_calls": 10,
        "min_time_ms": 20.0,
        "benefit_factor": 0.5,
        "risk": "medium",
        "description": "Unroll loops to reduce iteration overhead",
        "hint": "Manually unroll tight loops or use compiler pragmas"
    },
    "parallelization": {
        "min_calls": 50,
        "min_time_ms": 10.0,
        "benefit_factor": 0.9,
        "risk": "high",
        "description": "Parallelize CPU-intensive work across multiple cores",
        "hint": "Use multiprocessing, concurrent.futures, or async patterns"
    },
    "inline_expansion": {
        "min_calls": 200,
        "min_time_ms": 0.5,
        "benefit_factor": 0.4,
        "risk": "low",
        "description": "Inline small functions to reduce call overhead",
        "hint": "Mark function for inlining or manually inline at call sites"
    },
    "kernel_rewrite": {
        "min_calls": 100,
        "min_time_ms": 15.0,
        "benefit_factor": 0.85,
        "risk": "high",
        "description": "Rewrite GPU kernel for better performance",
        "hint": "Optimize kernel memory access patterns or use shared memory"
    }
}

# Risk level hierarchy for filtering
RISK_HIERARCHY = {
    "low": 0,
    "medium": 1,
    "high": 2
}


class SpeculativeOptimizer:
    """
    Analyzes performance data to identify optimization opportunities.

    Explores the semantic latent space of code to find patterns that
    could benefit from various optimization techniques.
    """

    def __init__(self):
        """Initialize the speculative optimizer."""
        self.patterns = OPTIMIZATION_PATTERNS

    def analyze(
        self,
        source_file: str,
        function_name: str,
        call_count: int,
        avg_time_ms: float
    ) -> list[OptimizationCandidate]:
        """
        Analyze a function for optimization opportunities.

        Args:
            source_file: Path to the source file
            function_name: Name of the function to analyze
            call_count: Number of times the function has been called
            avg_time_ms: Average execution time in milliseconds

        Returns:
            List of OptimizationCandidate objects sorted by benefit (descending)
        """
        candidates: list[OptimizationCandidate] = []

        # Calculate base factors for benefit computation
        # call_factor: how frequently the function is called (scaled to 1000 calls)
        call_factor = min(1.0, call_count / 1000.0)
        # time_factor: how slow the function is (scaled to 50ms)
        time_factor = min(1.0, avg_time_ms / 50.0)
        # Combined factor
        combined_factor = (call_factor + time_factor) / 2.0

        # Check each optimization pattern
        for opt_type, pattern in self.patterns.items():
            min_calls = pattern["min_calls"]
            min_time_ms = pattern["min_time_ms"]

            # Check if this pattern applies
            if call_count >= min_calls and avg_time_ms >= min_time_ms:
                # Calculate benefit
                benefit_factor = pattern["benefit_factor"]
                benefit = benefit_factor * combined_factor

                candidate = OptimizationCandidate(
                    source_file=source_file,
                    function_name=function_name,
                    optimization_type=opt_type,
                    estimated_benefit=benefit,
                    risk_level=pattern["risk"],
                    description=pattern["description"],
                    implementation_hint=pattern["hint"]
                )
                candidates.append(candidate)

        # Sort by benefit descending
        candidates.sort()

        return candidates

    def analyze_entropy_spot(self, spot: Any) -> list[OptimizationCandidate]:
        """
        Analyze an entropy spot for optimization opportunities.

        Only hot spots are analyzed - cold spots don't need optimization.

        Args:
            spot: EntropySpot object from entropy_mapper

        Returns:
            List of OptimizationCandidate objects (empty for cold spots)
        """
        # Cold spots don't need optimization - they're underused
        if spot.entropy_type == "cold":
            return []

        # Extract metrics from hot spot
        metrics = spot.metrics
        call_count = metrics.get("call_count", 0)
        avg_time_ms = metrics.get("avg_time_ms", 0.0)

        return self.analyze(
            source_file=spot.file_path,
            function_name=spot.function_name or "unknown",
            call_count=call_count,
            avg_time_ms=avg_time_ms
        )

    def rank_optimizations(
        self,
        candidates: list[OptimizationCandidate],
        max_risk: str = "high"
    ) -> list[OptimizationCandidate]:
        """
        Filter and rank optimization candidates by risk level.

        Args:
            candidates: List of OptimizationCandidate objects
            max_risk: Maximum risk level to include ("low", "medium", "high")

        Returns:
            Filtered list of candidates sorted by benefit (descending)
        """
        max_risk_level = RISK_HIERARCHY.get(max_risk, 2)

        # Filter by risk level
        filtered = [
            c for c in candidates
            if RISK_HIERARCHY.get(c.risk_level, 2) <= max_risk_level
        ]

        # Sort by benefit descending
        filtered.sort()

        return filtered
