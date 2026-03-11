"""
Swarm Recursive Evolution Module.

This module provides AI value scoring and evolution components
for recursive self-improvement of the Geometry OS codebase.
"""

from .axion_core import AxionCore, AxionTarget
from .evolution_daemon import DaemonConfig, DaemonState, EvolutionDaemon
from .evolution_tracker import EventType, EvolutionEvent, EvolutionTracker
from .gravity_placer import GravityPlacer, GravityPosition
from .recursive_orchestrator import (
    EvolutionPhase,
    EvolutionResult,
    EvolutionState,
    RecursiveOrchestrator,
)
from .value_evaluator import ValueEvaluator, ValueScore

__all__ = [
    "ValueScore",
    "ValueEvaluator",
    "AxionCore",
    "AxionTarget",
    "GravityPosition",
    "GravityPlacer",
    "EventType",
    "EvolutionEvent",
    "EvolutionTracker",
    "EvolutionPhase",
    "EvolutionState",
    "EvolutionResult",
    "RecursiveOrchestrator",
    "DaemonConfig",
    "DaemonState",
    "EvolutionDaemon",
]
