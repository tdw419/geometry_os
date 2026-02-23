"""
EpisodicMemory - Facade for experience storage and retrieval.

Provides a unified interface for agents to store and query experiences.
"""

from typing import List, Optional

from systems.swarm.memory.experience import Experience
from systems.swarm.memory.experience_store import ExperienceStore, generate_embedding
from systems.swarm.memory.experience_retriever import ExperienceRetriever, SimilarityResult


class EpisodicMemory:
    """
    Facade for storing and retrieving agent experiences.

    Combines ExperienceStore and ExperienceRetriever into a single
    easy-to-use interface for agents.

    Usage:
        memory = EpisodicMemory("agent_001")
        memory.store_experience("CODE_GEN", "write", "success", "Generated auth module")
        failures = memory.check_similar_failures(embedding)
    """

    def __init__(
        self,
        agent_id: str,
        storage_path: str = ".geometry/episodic_memory.json"
    ):
        """
        Initialize episodic memory for an agent.

        Args:
            agent_id: ID of the agent using this memory
            storage_path: Path to JSON storage file
        """
        self.agent_id = agent_id
        self._store = ExperienceStore(storage_path)
        self._retriever = ExperienceRetriever()

    def _refresh_retriever(self) -> None:
        """Refresh retriever with current experiences from store."""
        experiences = self._store.get_all()
        self._retriever.set_experiences(experiences)

    def store_experience(
        self,
        task_type: str,
        action: str,
        outcome: str,
        description: str,
        metadata: Optional[dict] = None
    ) -> Experience:
        """
        Store a new experience.

        Automatically generates embedding from description and creates
        a unique experience ID.

        Args:
            task_type: Type of task (e.g., "CODE_GEN", "REVIEW")
            action: Action taken (e.g., "write", "review")
            outcome: Result ("success", "failure", "partial")
            description: Human-readable description of what happened
            metadata: Optional additional context

        Returns:
            The created Experience object
        """
        # Generate embedding from description
        embedding = generate_embedding(description)

        # Create unique ID
        import time
        import hashlib
        unique_input = f"{self.agent_id}:{task_type}:{action}:{time.time()}"
        exp_id = hashlib.md5(unique_input.encode()).hexdigest()[:12]

        experience = Experience(
            experience_id=exp_id,
            agent_id=self.agent_id,
            task_type=task_type,
            action=action,
            outcome=outcome,
            description=description,
            embedding=embedding,
            metadata=metadata or {}
        )

        self._store.add(experience)
        self._refresh_retriever()

        return experience

    def check_similar_failures(
        self,
        query_embedding: List[float],
        k: int = 5,
        min_similarity: float = 0.5
    ) -> List[SimilarityResult]:
        """
        Check for similar past failures.

        Useful before attempting a task to avoid repeating mistakes.

        Args:
            query_embedding: Embedding of the current situation
            k: Maximum number of results
            min_similarity: Minimum similarity threshold

        Returns:
            List of similar failure experiences
        """
        self._refresh_retriever()
        return self._retriever.find_similar_failures(
            query_embedding, k=k, min_similarity=min_similarity
        )

    def find_similar_successes(
        self,
        query_embedding: List[float],
        k: int = 5,
        min_similarity: float = 0.5
    ) -> List[SimilarityResult]:
        """
        Find similar past successes.

        Useful for learning what approaches worked before.

        Args:
            query_embedding: Embedding of the current situation
            k: Maximum number of results
            min_similarity: Minimum similarity threshold

        Returns:
            List of similar success experiences
        """
        self._refresh_retriever()
        return self._retriever.find_similar_successes(
            query_embedding, k=k, min_similarity=min_similarity
        )

    def find_similar(
        self,
        query_embedding: List[float],
        outcome_filter: Optional[str] = None,
        k: int = 5,
        min_similarity: float = 0.0
    ) -> List[SimilarityResult]:
        """
        Find similar experiences with optional outcome filter.

        Args:
            query_embedding: Embedding of the current situation
            outcome_filter: Optional filter for outcome type
            k: Maximum number of results
            min_similarity: Minimum similarity threshold

        Returns:
            List of similar experiences
        """
        self._refresh_retriever()
        return self._retriever.find_similar(
            query_embedding,
            outcome_filter=outcome_filter,
            k=k,
            min_similarity=min_similarity
        )

    def get_all_experiences(self) -> List[Experience]:
        """Get all stored experiences."""
        return self._store.get_all()

    def get_my_experiences(self) -> List[Experience]:
        """Get experiences for this agent only."""
        return self._store.get_by_agent(self.agent_id)

    def clear_all(self) -> None:
        """Clear all stored experiences."""
        self._store.clear()
        self._retriever.set_experiences([])

    @staticmethod
    def text_to_embedding(text: str) -> List[float]:
        """
        Convert text to an embedding vector.

        Utility method for agents to create embeddings for comparison.

        Args:
            text: Text to embed

        Returns:
            128-dimensional embedding vector
        """
        return generate_embedding(text)
