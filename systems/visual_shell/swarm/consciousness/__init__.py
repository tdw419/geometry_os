"""
Collective Consciousness System for Multi-Agent Thought Sharing.

This module provides data structures for representing and sharing
thoughts between agents in the Geometry OS swarm, along with hooks
for Neural City event handling.

Key Components:
- ThoughtType: Enum defining types of thoughts (embedding, attention, inference, query)
- Thought: Dataclass for individual thought units with serialization support
- ThoughtEngine: Per-agent reasoning module for generating embeddings and attention
- ConsensusEngine: Federated inference aggregation and conflict resolution
- ConsciousnessState: Global awareness state with embedding pool and attention maps
- NeuralCityHook: Abstract hook trait for Neural City events
- NeuralCityHookBroadcaster: Dispatches events to all registered hooks

Example:
    >>> from systems.visual_shell.swarm.consciousness import Thought, ThoughtType, ConsciousnessState
    >>> import numpy as np
    >>> thought = Thought(
    ...     agent_id="agent-001",
    ...     thought_type=ThoughtType.EMBEDDING,
    ...     content=np.array([0.1, 0.2, 0.3]),
    ...     confidence=0.95
    ... )
    >>> state = ConsciousnessState()
    >>> state.add_embedding("agent-001", np.array([1.0, 0.0]))
    >>> attention = state.compute_attention_map()
"""

from systems.visual_shell.swarm.consciousness.thought import (
    ThoughtType,
    Thought,
)
from systems.visual_shell.swarm.consciousness.thought_engine import ThoughtEngine
from systems.visual_shell.swarm.consciousness.thought_broadcaster import ThoughtBroadcaster
from systems.visual_shell.swarm.consciousness.consensus_engine import ConsensusEngine
from systems.visual_shell.swarm.consciousness.consciousness_state import ConsciousnessState
from systems.visual_shell.swarm.consciousness.thought_logger import ThoughtLogger
from systems.visual_shell.swarm.consciousness.collective_hud import CollectiveHUD
from systems.visual_shell.swarm.consciousness.hooks import (
    NeuralCityHook,
    NeuralCityHookBroadcaster,
    LoggingHook,
    CallbackHook,
)

__all__ = [
    # Thought system
    "ThoughtType",
    "Thought",
    "ThoughtEngine",
    "ThoughtBroadcaster",
    "ConsensusEngine",
    "ConsciousnessState",
    "ThoughtLogger",
    "CollectiveHUD",
    # Hooks system
    "NeuralCityHook",
    "NeuralCityHookBroadcaster",
    "LoggingHook",
    "CallbackHook",
]

__version__ = "0.1.0"
