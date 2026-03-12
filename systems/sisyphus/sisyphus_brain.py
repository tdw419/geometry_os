"""
Sisyphus Brain - The learning and adaptation system for Geometry OS.

Implements neural-like learning mechanisms for system optimization and adaptation.
"""

import time
import json
from pathlib import Path
from typing import Dict, Any, Optional, List
from dataclasses import dataclass, asdict
import logging

logger = logging.getLogger(__name__)


@dataclass
class BrainState:
    """Current state of the Sisyphus brain."""

    generation: int = 0
    mutations_applied: int = 0
    fitness_score: float = 0.0
    last_update: float = 0.0
    adaptation_count: int = 0
    metadata: Dict[str, Any] = None

    def __post_init__(self):
        if self.metadata is None:
            self.metadata = {}


class SisyphusBrain:
    """
    The Sisyphus brain continuously learns from system interactions
    and applies optimizations to improve performance and stability.
    """

    def __init__(self, config_path: Optional[Path] = None):
        """
        Initialize the Sisyphus brain.

        Args:
            config_path: Optional path to brain configuration file
        """
        self.state = BrainState()
        self.config = self._load_config(config_path)
        self.history: List[Dict[str, Any]] = []
        self._initialize()

    def _load_config(self, config_path: Optional[Path]) -> Dict[str, Any]:
        """Load brain configuration."""
        default_config = {
            "learning_rate": 0.01,
            "adaptation_threshold": 0.8,
            "memory_size": 1000,
            "mutation_rate": 0.1,
            "elite_size": 5,
        }

        if config_path and config_path.exists():
            try:
                with open(config_path, "r") as f:
                    user_config = json.load(f)
                default_config.update(user_config)
            except Exception as e:
                logger.warning(f"Failed to load brain config: {e}")

        return default_config

    def _initialize(self) -> None:
        """Initialize brain state."""
        self.state.last_update = time.time()
        logger.info("Sisyphus brain initialized")

    def observe(self, event: Dict[str, Any]) -> None:
        """
        Observe a system event and potentially learn from it.

        Args:
            event: Dictionary containing event data
        """
        observation = {
            "timestamp": time.time(),
            "event": event,
            "brain_generation": self.state.generation,
        }

        self.history.append(observation)

        # Keep history bounded
        max_size = self.config.get("memory_size", 1000)
        if len(self.history) > max_size:
            self.history = self.history[-max_size:]

        # Trigger learning if enough observations
        if len(self.history) % 100 == 0:
            self._learn_from_history()

    def _learn_from_history(self) -> None:
        """Learn patterns from historical observations."""
        if len(self.history) < 10:
            return

        # Simple learning: count event types
        event_types = {}
        for obs in self.history[-100:]:  # Last 100 observations
            event_type = obs.get("event", {}).get("type", "unknown")
            event_types[event_type] = event_types.get(event_type, 0) + 1

        # Update brain state based on learned patterns
        self.state.adaptation_count += 1
        self.state.last_update = time.time()

        logger.debug(f"Brain learned from {len(self.history)} observations")

    def propose_mutation(self) -> Optional[Dict[str, Any]]:
        """
        Propose a mutation based on learned patterns.

        Returns:
            Mutation proposal or None if no mutation should be applied
        """
        # Simple mutation proposal based on fitness
        if self.state.fitness_score < self.config.get("adaptation_threshold", 0.8):
            mutation = {
                "type": "optimization",
                "generation": self.state.generation + 1,
                "timestamp": time.time(),
                "parameters": {
                    "learning_rate": self.config["learning_rate"] * 1.1,
                    "focus_areas": list(
                        set([obs["event"].get("type", "unknown") for obs in self.history[-50:]])
                    ),
                },
            }
            return mutation
        return None

    def apply_mutation(self, mutation: Dict[str, Any]) -> bool:
        """
        Apply a mutation to the system.

        Args:
            mutation: Mutation proposal to apply

        Returns:
            True if mutation was applied successfully
        """
        try:
            self.state.generation = mutation.get("generation", self.state.generation + 1)
            self.state.mutations_applied += 1
            self.state.last_update = time.time()

            logger.info(
                f"Applied mutation #{self.state.mutations_applied} "
                f"at generation {self.state.generation}"
            )

            # Record mutation in history
            self.history.append(
                {"timestamp": time.time(), "mutation": mutation, "type": "mutation_applied"}
            )

            return True
        except Exception as e:
            logger.error(f"Failed to apply mutation: {e}")
            return False

    def update_fitness(self, fitness_score: float) -> None:
        """
        Update the brain's fitness assessment.

        Args:
            fitness_score: New fitness score (0.0 to 1.0)
        """
        self.state.fitness_score = max(0.0, min(1.0, fitness_score))
        self.state.last_update = time.time()

    def get_state(self) -> BrainState:
        """Get current brain state."""
        return self.state

    def get_recent_history(self, count: int = 10) -> List[Dict[str, Any]]:
        """Get recent observations."""
        return self.history[-count:] if self.history else []

    def save_state(self, path: Path) -> None:
        """Save brain state to file."""
        state_data = {
            "state": asdict(self.state),
            "config": self.config,
            "history_length": len(self.history),
            "timestamp": time.time(),
        }

        path.parent.mkdir(parents=True, exist_ok=True)
        with open(path, "w") as f:
            json.dump(state_data, f, indent=2)

        logger.info(f"Brain state saved to {path}")

    def load_state(self, path: Path) -> bool:
        """Load brain state from file."""
        if not path.exists():
            logger.warning(f"Brain state file not found: {path}")
            return False

        try:
            with open(path, "r") as f:
                state_data = json.load(f)

            self.state = BrainState(**state_data["state"])
            self.config = state_data.get("config", self.config)
            # Note: history is not saved/restored for simplicity
            self.history = []

            logger.info(f"Brain state loaded from {path}")
            return True
        except Exception as e:
            logger.error(f"Failed to load brain state: {e}")
            return False


def main() -> None:
    """Main entry point for testing."""
    import sys

    logging.basicConfig(level=logging.INFO)

    brain = SisyphusBrain()

    # Simulate some observations
    for i in range(10):
        brain.observe({"type": "system_event", "value": i * 0.1, "source": "test"})

    # Propose and apply a mutation
    mutation = brain.propose_mutation()
    if mutation:
        brain.apply_mutation(mutation)

    # Update fitness
    brain.update_fitness(0.85)

    # Print state
    print(json.dumps(asdict(brain.get_state()), indent=2))


if __name__ == "__main__":
    main()
