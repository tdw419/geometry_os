"""
ValueEvaluator - AI value scoring for recursive evolution.

Computes composite value scores for files based on:
- Access frequency (how often the file is accessed)
- Criticality (how many files depend on it)
- Improvement potential (inverse of test coverage)
- Complexity (code complexity metrics)
- Staleness (time since last modification)

The composite score uses weighted formula:
    composite = 0.25*access + 0.25*criticality + 0.20*(1-coverage) + 0.15*complexity + 0.15*staleness
"""

import math
from dataclasses import dataclass, field
from typing import Dict, Any, Optional


@dataclass
class ValueScore:
    """
    Composite value score for a file.

    Attributes:
        file_path: Path to the scored file
        access_score: Score based on access frequency (0-1)
        criticality_score: Score based on dependent count (0-1)
        improvement_score: Score based on coverage gaps (0-1)
        complexity_score: Score based on code complexity (0-1)
        staleness_score: Score based on time since modification (0-1)
        composite_score: Weighted combination of all scores (0-1)
        metadata: Optional additional information
    """
    file_path: str
    access_score: float
    criticality_score: float
    improvement_score: float
    complexity_score: float
    staleness_score: float
    composite_score: float
    metadata: Dict[str, Any] = field(default_factory=dict)


class ValueEvaluator:
    """
    Evaluates the value of files for AI-driven recursive evolution.

    The evaluator computes a composite value score that helps prioritize
    which files would benefit most from AI attention. Files with high
    access frequency, high criticality, low test coverage, and high
    staleness are prioritized.

    Default weights:
        - access: 0.25
        - criticality: 0.25
        - improvement: 0.20
        - complexity: 0.15
        - staleness: 0.15

    Example:
        >>> evaluator = ValueEvaluator()
        >>> score = evaluator.evaluate(
        ...     file_path="core.py",
        ...     access_count=100,
        ...     dependent_count=20,
        ...     coverage=0.3,
        ...     complexity=0.5,
        ...     staleness=0.8
        ... )
        >>> print(f"Composite: {score.composite_score:.2f}")
    """

    def __init__(
        self,
        weight_access: float = 0.25,
        weight_criticality: float = 0.25,
        weight_improvement: float = 0.20,
        weight_complexity: float = 0.15,
        weight_staleness: float = 0.15,
    ):
        """
        Initialize the ValueEvaluator.

        Args:
            weight_access: Weight for access frequency score
            weight_criticality: Weight for criticality score
            weight_improvement: Weight for improvement potential score
            weight_complexity: Weight for complexity score
            weight_staleness: Weight for staleness score
        """
        self.weight_access = weight_access
        self.weight_criticality = weight_criticality
        self.weight_improvement = weight_improvement
        self.weight_complexity = weight_complexity
        self.weight_staleness = weight_staleness

    def compute_access_score(self, file_path: str, access_count: int) -> float:
        """
        Compute access score based on access frequency.

        Uses logarithmic scaling to prevent extremely high access counts
        from dominating the score.

        Args:
            file_path: Path to the file (for context, not used in calculation)
            access_count: Number of times the file has been accessed

        Returns:
            Score in range [0, 1], where higher access = higher score
        """
        if access_count <= 0:
            return 0.0

        # Log scale: log10(access_count + 1) / log10(max_expected + 1)
        # Max expected access count is ~10000 for very hot files
        max_access = 10000
        score = math.log10(access_count + 1) / math.log10(max_access + 1)

        return min(1.0, score)

    def compute_criticality_score(self, file_path: str, dependent_count: int) -> float:
        """
        Compute criticality score based on number of dependents.

        Files with many dependents are more critical to the system
        and deserve more attention.

        Args:
            file_path: Path to the file (for context, not used in calculation)
            dependent_count: Number of files that depend on this file

        Returns:
            Score in range [0, 1], where more dependents = higher score
        """
        if dependent_count <= 0:
            return 0.0

        # Use sigmoid-like scaling to saturate at high dependent counts
        # score = count / (count + k) where k is the half-saturation point
        k = 20  # Half saturation at 20 dependents
        score = dependent_count / (dependent_count + k)

        return min(1.0, score)

    def compute_improvement_score(self, coverage: float) -> float:
        """
        Compute improvement potential score based on test coverage.

        Lower coverage means higher improvement potential.

        Args:
            coverage: Test coverage as a fraction (0-1)

        Returns:
            Score in range [0, 1], where lower coverage = higher score
        """
        # Ensure coverage is in valid range
        coverage = max(0.0, min(1.0, coverage))

        # Improvement potential is inverse of coverage
        return 1.0 - coverage

    def evaluate(
        self,
        file_path: str,
        access_count: int,
        dependent_count: int,
        coverage: float,
        complexity: float,
        staleness: float,
        metadata: Optional[Dict[str, Any]] = None,
    ) -> ValueScore:
        """
        Evaluate a file and compute its composite value score.

        The composite score uses the formula:
        composite = w_access*access + w_criticality*criticality +
                    w_improvement*improvement + w_complexity*complexity +
                    w_staleness*staleness

        Args:
            file_path: Path to the file being evaluated
            access_count: Number of times the file has been accessed
            dependent_count: Number of files that depend on this file
            coverage: Test coverage as a fraction (0-1)
            complexity: Code complexity score (0-1)
            staleness: Staleness score based on time since modification (0-1)
            metadata: Optional additional information to store

        Returns:
            ValueScore containing all component scores and composite
        """
        # Compute individual scores
        access_score = self.compute_access_score(file_path, access_count)
        criticality_score = self.compute_criticality_score(file_path, dependent_count)
        improvement_score = self.compute_improvement_score(coverage)

        # Ensure complexity and staleness are in valid range
        complexity_score = max(0.0, min(1.0, complexity))
        staleness_score = max(0.0, min(1.0, staleness))

        # Compute weighted composite
        composite_score = (
            self.weight_access * access_score +
            self.weight_criticality * criticality_score +
            self.weight_improvement * improvement_score +
            self.weight_complexity * complexity_score +
            self.weight_staleness * staleness_score
        )

        # Ensure composite is in valid range
        composite_score = max(0.0, min(1.0, composite_score))

        return ValueScore(
            file_path=file_path,
            access_score=access_score,
            criticality_score=criticality_score,
            improvement_score=improvement_score,
            complexity_score=complexity_score,
            staleness_score=staleness_score,
            composite_score=composite_score,
            metadata=metadata if metadata is not None else {},
        )
