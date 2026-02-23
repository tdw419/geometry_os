"""
ExperienceStore - JSON-based persistence for experiences.

Provides file-based storage with locking for cross-process safety.
"""

import json
import os
import fcntl
import hashlib
import math
from pathlib import Path
from typing import List, Optional, Dict, Any

from systems.swarm.memory.experience import Experience


def generate_embedding(text: str, dimensions: int = 128) -> List[float]:
    """
    Generate a deterministic embedding vector from text using hashing.

    Creates a normalized 128-dimensional vector from text input.
    Same text always produces the same embedding.

    Args:
        text: Input text to embed
        dimensions: Number of dimensions (default 128)

    Returns:
        List of floats representing the embedding vector (normalized to unit length)
    """
    # Create chunks of text for different dimensions
    embedding = []
    for i in range(dimensions):
        # Use SHA256 of text + index to get deterministic but varied values
        chunk = f"{text}:{i}"
        hash_bytes = hashlib.sha256(chunk.encode()).digest()
        # Convert first 8 bytes to a float between -1 and 1
        int_val = int.from_bytes(hash_bytes[:8], 'big')
        # Map to [-1, 1] range
        val = (int_val / (2**64 - 1)) * 2 - 1
        embedding.append(val)

    # Normalize to unit length
    magnitude = math.sqrt(sum(x * x for x in embedding))
    if magnitude > 0:
        embedding = [x / magnitude for x in embedding]

    return embedding


class ExperienceStore:
    """
    JSON-based storage for agent experiences.

    Uses file-based storage with locking for cross-process safety.
    Experiences are stored in a single JSON file with atomic updates.
    """

    def __init__(self, storage_path: str = ".geometry/episodic_memory.json"):
        """
        Initialize the experience store.

        Args:
            storage_path: Path to JSON file for storage (default: .geometry/episodic_memory.json)
        """
        self.storage_path = Path(storage_path)
        self.storage_path.parent.mkdir(parents=True, exist_ok=True)
        self._lock_path = self.storage_path.parent / ".memory.lock"
        self._cache: Optional[List[Experience]] = None

    def _acquire_lock(self):
        """Acquire exclusive lock for store operations."""
        lock_file = open(self._lock_path, 'w')
        fcntl.flock(lock_file.fileno(), fcntl.LOCK_EX)
        return lock_file

    def _release_lock(self, lock_file):
        """Release the store lock."""
        fcntl.flock(lock_file.fileno(), fcntl.LOCK_UN)
        lock_file.close()

    def load(self) -> List[Experience]:
        """
        Load all experiences from storage.

        Returns:
            List of all stored experiences
        """
        lock = self._acquire_lock()
        try:
            if not self.storage_path.exists():
                self._cache = []
                return self._cache

            with open(self.storage_path, 'r') as f:
                data = json.load(f)

            self._cache = [Experience.from_dict(item) for item in data]
            return self._cache
        except (json.JSONDecodeError, KeyError, ValueError) as e:
            # If corrupted, start fresh but log the issue
            print(f"Warning: Corrupted experience store, starting fresh: {e}")
            self._cache = []
            return self._cache
        finally:
            self._release_lock(lock)

    def save(self, experiences: List[Experience]) -> None:
        """
        Save all experiences to storage.

        Args:
            experiences: List of experiences to save
        """
        lock = self._acquire_lock()
        try:
            data = [exp.to_dict() for exp in experiences]
            # Write to temp file first, then rename for atomicity
            temp_path = self.storage_path.with_suffix('.tmp')
            with open(temp_path, 'w') as f:
                json.dump(data, f, indent=2)
            # Atomic rename
            temp_path.rename(self.storage_path)
            self._cache = experiences
        finally:
            self._release_lock(lock)

    def add(self, experience: Experience) -> None:
        """
        Add a single experience to storage.

        Args:
            experience: Experience to add
        """
        experiences = self.load()
        experiences.append(experience)
        self.save(experiences)

    def get_all(self) -> List[Experience]:
        """
        Get all stored experiences.

        Returns:
            List of all experiences
        """
        if self._cache is not None:
            return self._cache
        return self.load()

    def get_by_agent(self, agent_id: str) -> List[Experience]:
        """
        Get all experiences for a specific agent.

        Args:
            agent_id: Agent identifier

        Returns:
            List of experiences for the agent
        """
        return [exp for exp in self.get_all() if exp.agent_id == agent_id]

    def get_by_outcome(self, outcome: str) -> List[Experience]:
        """
        Get all experiences with a specific outcome.

        Args:
            outcome: Outcome to filter by (e.g., "success", "failure")

        Returns:
            List of experiences with matching outcome
        """
        return [exp for exp in self.get_all() if exp.outcome == outcome]

    def clear(self) -> None:
        """Clear all stored experiences."""
        lock = self._acquire_lock()
        try:
            if self.storage_path.exists():
                self.storage_path.unlink()
            self._cache = []
        finally:
            self._release_lock(lock)
