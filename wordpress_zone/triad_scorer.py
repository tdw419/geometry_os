"""
TriadScorer - CTRM Hybrid Scoring System

Implements confidence scoring using triad of factors:
- LLM confidence (40%)
- Author reliability (30%)
- Source type quality (20%)
- Corroboration count (10%)

The distance_from_center metric positions truths on the Hilbert map,
with higher confidence truths closer to the center (50) and lower
confidence truths pushed toward the periphery (90).
"""

from dataclasses import dataclass, field
from typing import Dict


@dataclass
class TriadScore:
    """Result of triad scoring calculation."""
    confidence: float  # 0.0 to 1.0
    distance_from_center: int  # 50 to 90
    components: Dict[str, float] = field(default_factory=dict)


class TriadScorer:
    """
    CTRM hybrid scoring system for truth confidence.

    Combines multiple signals into a single confidence score:
    - LLM confidence from extraction
    - Author role reliability
    - Source type quality
    - Corroboration from other sources

    Formula:
        confidence = (llm * 0.4) + (author * 0.3) + (source * 0.2) + (corroboration * 0.1)
        distance_from_center = int(50 + (1 - confidence) * 40)
    """

    DEFAULT_AUTHOR_WEIGHTS: Dict[str, float] = {
        "admin": 0.9,
        "editor": 0.8,
        "author": 0.7,
        "contributor": 0.6,
    }

    DEFAULT_SOURCE_WEIGHTS: Dict[str, float] = {
        "post": 0.8,
        "page": 0.85,
        "research_document": 0.9,
        "comment": 0.5,
    }

    def __init__(
        self,
        author_weights: Dict[str, float] | None = None,
        source_weights: Dict[str, float] | None = None,
    ):
        """
        Initialize TriadScorer with optional custom weights.

        Args:
            author_weights: Custom role -> reliability mapping
            source_weights: Custom source type -> quality mapping
        """
        self.author_weights = author_weights or self.DEFAULT_AUTHOR_WEIGHTS.copy()
        self.source_weights = source_weights or self.DEFAULT_SOURCE_WEIGHTS.copy()

    def calculate_score(
        self,
        llm_confidence: float,
        author_role: str,
        source_type: str,
        corroboration_count: int,
    ) -> TriadScore:
        """
        Calculate triad confidence score.

        Args:
            llm_confidence: LLM extraction confidence (0.0-1.0)
            author_role: WordPress user role (admin, editor, author, contributor)
            source_type: Content type (post, page, research_document, comment)
            corroboration_count: Number of corroborating sources

        Returns:
            TriadScore with confidence, distance, and component breakdown
        """
        # Clamp LLM confidence to valid range
        llm_score = max(0.0, min(1.0, llm_confidence))

        # Get author weight (default to 0.5 for unknown roles)
        author_score = self.author_weights.get(author_role.lower(), 0.5)

        # Get source weight (default to 0.5 for unknown types)
        source_score = self.source_weights.get(source_type.lower(), 0.5)

        # Corroboration boost: 0 sources = 0.3, caps at 1.0 with 7+ sources
        corroboration_score = min(1.0, 0.3 + (corroboration_count * 0.1))

        # Calculate weighted confidence
        confidence = (
            (llm_score * 0.4) +
            (author_score * 0.3) +
            (source_score * 0.2) +
            (corroboration_score * 0.1)
        )

        # Calculate distance from center (50 = center, 90 = periphery)
        distance_from_center = int(50 + (1 - confidence) * 40)

        return TriadScore(
            confidence=confidence,
            distance_from_center=distance_from_center,
            components={
                "llm": llm_score,
                "author": author_score,
                "source": source_score,
                "corroboration": corroboration_score,
            },
        )
