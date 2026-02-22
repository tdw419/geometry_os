"""
ConsensusEngine for Collective Consciousness federated inference.

Task 5: ConsensusEngine
- Weighted aggregation by confidence
- Agreement detection using cosine similarity
- Conflict resolution
"""

from dataclasses import dataclass, field
from datetime import datetime, timezone
from typing import List, Optional
from uuid import uuid4

import numpy as np

from systems.visual_shell.swarm.consciousness import Thought, ThoughtType


def cosine_similarity(a: np.ndarray, b: np.ndarray) -> float:
    """
    Compute cosine similarity between two vectors.

    Args:
        a: First vector
        b: Second vector

    Returns:
        Cosine similarity in range [-1, 1], or 0.0 if either vector has zero norm.
    """
    norm_a = np.linalg.norm(a)
    norm_b = np.linalg.norm(b)

    if norm_a == 0 or norm_b == 0:
        return 0.0

    return float(np.dot(a, b) / (norm_a * norm_b))


@dataclass
class ConsensusEngine:
    """
    Engine for computing consensus among multiple agent inferences.

    Provides weighted aggregation, agreement detection, and conflict resolution
    for federated inference in the collective consciousness system.

    Attributes:
        agreement_threshold: Threshold for detecting agreement (default 0.8)
        timeout_seconds: Timeout for consensus operations (default 5.0)

    Example:
        >>> engine = ConsensusEngine(agreement_threshold=0.8)
        >>> inferences = [thought1, thought2, thought3]
        >>> consensus = await engine.aggregate(inferences)
        >>> has_agreement = await engine.detect_agreement(inferences)
    """

    agreement_threshold: float = 0.8
    timeout_seconds: float = 5.0

    def __post_init__(self):
        """Validate engine parameters after initialization."""
        if not 0.0 <= self.agreement_threshold <= 1.0:
            raise ValueError(
                f"agreement_threshold must be between 0 and 1, "
                f"got {self.agreement_threshold}"
            )
        if self.timeout_seconds <= 0:
            raise ValueError(
                f"timeout_seconds must be positive, got {self.timeout_seconds}"
            )

    async def aggregate(
        self, inferences: Optional[List[Thought]]
    ) -> Optional[Thought]:
        """
        Aggregate multiple inferences into a consensus Thought.

        Computes a weighted average of content vectors, weighted by confidence.
        Higher confidence inferences have more influence on the result.

        Args:
            inferences: List of Thought objects to aggregate

        Returns:
            A new Thought representing the weighted consensus, or None if
            inferences is empty or None.

        Example:
            >>> inferences = [
            ...     Thought(agent_id="a1", thought_type=ThoughtType.INFERENCE,
            ...             content=np.array([0.8, 0.2]), confidence=0.9),
            ...     Thought(agent_id="a2", thought_type=ThoughtType.INFERENCE,
            ...             content=np.array([0.6, 0.4]), confidence=0.7),
            ... ]
            >>> result = await engine.aggregate(inferences)
            >>> result.content  # Closer to [0.8, 0.2] due to higher confidence
        """
        if not inferences:
            return None

        if len(inferences) == 0:
            return None

        # Single inference case - return as-is with new ID
        if len(inferences) == 1:
            return Thought(
                agent_id="consensus",
                thought_type=inferences[0].thought_type,
                content=inferences[0].content.copy(),
                confidence=inferences[0].confidence,
                metadata={"source": "aggregate", "count": 1},
            )

        # Compute weighted average of content
        total_weight = 0.0
        weighted_content = None
        thought_type = inferences[0].thought_type

        for inference in inferences:
            weight = inference.confidence
            total_weight += weight

            if weighted_content is None:
                weighted_content = inference.content.copy() * weight
            else:
                # Handle potential shape mismatches
                if inference.content.shape != weighted_content.shape:
                    # Use broadcast-compatible addition
                    weighted_content = weighted_content + inference.content * weight
                else:
                    weighted_content += inference.content * weight

        if total_weight == 0 or weighted_content is None:
            return None

        # Normalize by total weight
        consensus_content = weighted_content / total_weight

        # Compute average confidence
        avg_confidence = sum(i.confidence for i in inferences) / len(inferences)

        return Thought(
            agent_id="consensus",
            thought_type=thought_type,
            content=consensus_content,
            confidence=avg_confidence,
            metadata={
                "source": "aggregate",
                "count": len(inferences),
                "weighted": True,
            },
        )

    async def detect_agreement(self, inferences: List[Thought]) -> bool:
        """
        Detect whether inferences agree with each other.

        Computes the average pairwise cosine similarity between all inference
        content vectors and compares against the agreement_threshold.

        Args:
            inferences: List of Thought objects to check for agreement

        Returns:
            True if average pairwise similarity >= agreement_threshold,
            False otherwise. Returns False for empty list, True for single item.

        Example:
            >>> similar = [
            ...     Thought(agent_id="a1", thought_type=ThoughtType.INFERENCE,
            ...             content=np.array([0.8, 0.1, 0.1]), confidence=0.9),
            ...     Thought(agent_id="a2", thought_type=ThoughtType.INFERENCE,
            ...             content=np.array([0.79, 0.11, 0.1]), confidence=0.85),
            ... ]
            >>> await engine.detect_agreement(similar)
            True
        """
        if not inferences or len(inferences) == 0:
            return False

        # Single inference trivially agrees with itself
        if len(inferences) == 1:
            return True

        # Compute pairwise cosine similarities
        similarities = []
        n = len(inferences)

        for i in range(n):
            for j in range(i + 1, n):
                sim = cosine_similarity(
                    inferences[i].content.flatten(),
                    inferences[j].content.flatten(),
                )
                similarities.append(sim)

        # Compute average similarity
        avg_similarity = sum(similarities) / len(similarities) if similarities else 0.0

        return avg_similarity >= self.agreement_threshold

    async def detect_multipath(self, inferences: List[Thought]) -> List[List[Thought]]:
        """
        Detect multiple distinct 'paths' or clusters of reasoning in the swarm.
        
        Implements Einstellung Effect Mitigation by identifying when the swarm
        has branched into multiple valid but different approaches.
        
        Args:
            inferences: List of Thought objects.
            
        Returns:
            A list of clusters, where each cluster is a list of agreeing Thoughts.
        """
        if not inferences:
            return []
            
        clusters: List[List[Thought]] = []
        
        for inf in inferences:
            found_cluster = False
            for cluster in clusters:
                # Check if inf agrees with the first item in the cluster
                sim = cosine_similarity(inf.content.flatten(), cluster[0].content.flatten())
                if sim >= self.agreement_threshold:
                    cluster.append(inf)
                    found_cluster = True
                    break
            
            if not found_cluster:
                clusters.append([inf])
                
        return clusters

    async def resolve_conflict(self, inferences: List[Thought]) -> Optional[Thought]:
        """
        Resolve conflict between disagreeing inferences.

        Uses weighted aggregation to combine conflicting inferences into
        a consensus result, with conflict metadata attached.

        Args:
            inferences: List of conflicting Thought objects

        Returns:
            A new Thought representing the resolved consensus with
            conflict_resolved=True metadata, or None if inferences is empty.

        Example:
            >>> conflicting = [
            ...     Thought(agent_id="a1", thought_type=ThoughtType.INFERENCE,
            ...             content=np.array([0.9, 0.1]), confidence=0.6),
            ...     Thought(agent_id="a2", thought_type=ThoughtType.INFERENCE,
            ...             content=np.array([0.1, 0.9]), confidence=0.95),
            ... ]
            >>> resolved = await engine.resolve_conflict(conflicting)
            >>> resolved.metadata["conflict_resolved"]
            True
        """
        if not inferences or len(inferences) == 0:
            return None

        # Use aggregate for weighted combination
        result = await self.aggregate(inferences)

        if result is None:
            return None

        # Add conflict resolution metadata
        result.metadata["conflict_resolved"] = True
        result.metadata["resolution_method"] = "weighted_aggregation"

        return result
