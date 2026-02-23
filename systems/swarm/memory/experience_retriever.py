"""
ExperienceRetriever - Similarity search for experiences.

Provides cosine similarity-based retrieval of relevant experiences.
"""

from typing import List, Optional, Tuple
from dataclasses import dataclass

from systems.swarm.memory.experience import Experience


def cosine_similarity(vec1: List[float], vec2: List[float]) -> float:
    """
    Compute cosine similarity between two vectors.

    Args:
        vec1: First vector
        vec2: Second vector

    Returns:
        Cosine similarity score between -1 and 1
    """
    # Manual calculation to avoid numpy dependency for simple case
    dot_product = sum(a * b for a, b in zip(vec1, vec2))
    norm1 = sum(a * a for a in vec1) ** 0.5
    norm2 = sum(b * b for b in vec2) ** 0.5

    if norm1 == 0 or norm2 == 0:
        return 0.0

    return dot_product / (norm1 * norm2)


@dataclass
class SimilarityResult:
    """Result of a similarity search."""
    experience: Experience
    similarity: float


class ExperienceRetriever:
    """
    Retrieves similar experiences using cosine similarity.

    Supports filtering by outcome and limiting results.
    """

    def __init__(self, experiences: Optional[List[Experience]] = None):
        """
        Initialize the retriever.

        Args:
            experiences: Optional list of experiences to search (can be set later)
        """
        self._experiences: List[Experience] = experiences or []

    def set_experiences(self, experiences: List[Experience]) -> None:
        """Set the experiences to search."""
        self._experiences = experiences

    def find_similar(
        self,
        query_embedding: List[float],
        outcome_filter: Optional[str] = None,
        k: int = 5,
        min_similarity: float = 0.0
    ) -> List[SimilarityResult]:
        """
        Find experiences similar to the query embedding.

        Args:
            query_embedding: The embedding to compare against
            outcome_filter: Optional filter for outcome (e.g., "success", "failure")
            k: Maximum number of results to return
            min_similarity: Minimum similarity threshold (default 0.0)

        Returns:
            List of SimilarityResult objects, sorted by similarity descending
        """
        # Filter experiences by outcome if specified
        candidates = self._experiences
        if outcome_filter:
            candidates = [e for e in candidates if e.outcome == outcome_filter]

        # Calculate similarities
        results: List[SimilarityResult] = []
        for exp in candidates:
            sim = cosine_similarity(query_embedding, exp.embedding)
            if sim >= min_similarity:
                results.append(SimilarityResult(experience=exp, similarity=sim))

        # Sort by similarity descending and take top k
        results.sort(key=lambda r: r.similarity, reverse=True)
        return results[:k]

    def find_similar_failures(
        self,
        query_embedding: List[float],
        k: int = 5,
        min_similarity: float = 0.5
    ) -> List[SimilarityResult]:
        """
        Find similar failure experiences.

        Convenience method for find_similar with outcome="failure".

        Args:
            query_embedding: The embedding to compare against
            k: Maximum number of results
            min_similarity: Minimum similarity threshold (default 0.5)

        Returns:
            List of similar failures
        """
        return self.find_similar(
            query_embedding,
            outcome_filter="failure",
            k=k,
            min_similarity=min_similarity
        )

    def find_similar_successes(
        self,
        query_embedding: List[float],
        k: int = 5,
        min_similarity: float = 0.5
    ) -> List[SimilarityResult]:
        """
        Find similar success experiences.

        Convenience method for find_similar with outcome="success".

        Args:
            query_embedding: The embedding to compare against
            k: Maximum number of results
            min_similarity: Minimum similarity threshold (default 0.5)

        Returns:
            List of similar successes
        """
        return self.find_similar(
            query_embedding,
            outcome_filter="success",
            k=k,
            min_similarity=min_similarity
        )

    def get_nearest_neighbors(
        self,
        query_embedding: List[float],
        k: int = 5
    ) -> List[Tuple[Experience, float]]:
        """
        Get k nearest neighbors regardless of outcome.

        Args:
            query_embedding: The embedding to compare against
            k: Number of neighbors to return

        Returns:
            List of (experience, similarity) tuples
        """
        results = self.find_similar(query_embedding, k=k)
        return [(r.experience, r.similarity) for r in results]
