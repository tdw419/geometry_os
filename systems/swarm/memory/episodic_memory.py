"""
EpisodicMemory - Facade for experience storage and retrieval.

Provides a unified interface for agents to store and query experiences.
"""

from typing import List, Optional, TYPE_CHECKING

from systems.swarm.memory.experience import Experience
from systems.swarm.memory.experience_store import ExperienceStore, generate_embedding
from systems.swarm.memory.experience_retriever import ExperienceRetriever, SimilarityResult

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus


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
        storage_path: str = ".geometry/episodic_memory.json",
        event_bus: Optional['NEBBus'] = None
    ):
        """
        Initialize episodic memory for an agent.

        Args:
            agent_id: ID of the agent using this memory
            storage_path: Path to JSON storage file
            event_bus: Optional NEBBus for publishing memory events
        """
        self.agent_id = agent_id
        self._store = ExperienceStore(storage_path)
        self._retriever = ExperienceRetriever()
        self._event_bus = event_bus

    def _refresh_retriever(self) -> None:
        """Refresh retriever with current experiences from store."""
        experiences = self._store.get_all()
        self._retriever.set_experiences(experiences)

    def _publish_event(self, topic: str, payload: dict) -> None:
        """Publish an event to the event bus if configured."""
        if self._event_bus is None:
            return
        self._event_bus.publish(topic, payload)

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

        # Publish memory.experience.stored event
        self._publish_event("memory.experience.stored", {
            "experience_id": exp_id,
            "agent_id": self.agent_id,
            "task_type": task_type,
            "action": action,
            "outcome": outcome,
            "description": description[:100]  # Truncate for event
        })

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

    def detect_and_publish_patterns(self) -> dict:
        """
        Analyze experiences and publish pattern detection event.

        Uses PatternAnalyzer to detect trends and publishes
        memory.pattern.detected event if significant patterns found.

        Returns:
            Dictionary with detected patterns
        """
        from systems.swarm.growth import PatternAnalyzer

        experiences = self.get_all_experiences()
        if len(experiences) < 3:
            return {"pattern": "insufficient_data"}

        analyzer = PatternAnalyzer(min_sample_size=3)
        patterns = analyzer.detect_patterns(experiences, window_size=5)
        analysis = analyzer.analyze_agent_performance(experiences)

        # Only publish if there's something notable
        if patterns["trend"] != "stable" or analysis["improvement_areas"]:
            self._publish_event("memory.pattern.detected", {
                "agent_id": self.agent_id,
                "trend": patterns["trend"],
                "confidence": patterns["confidence"],
                "success_rate": analysis["success_rate"],
                "improvement_areas": analysis["improvement_areas"],
                "recommendations": analysis["recommendations"][:3]  # Top 3
            })

        return {
            "patterns": patterns,
            "analysis": analysis
        }

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
