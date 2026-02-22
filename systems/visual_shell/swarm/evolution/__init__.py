"""
Swarm Recursive Evolution Module.

This module provides AI value scoring and evolution components
for recursive self-improvement of the Geometry OS codebase.
"""

from .value_evaluator import ValueScore, ValueEvaluator
from .axion_core import AxionCore, AxionTarget
from .gravity_placer import GravityPosition, GravityPlacer
from .evolution_tracker import EventType, EvolutionEvent, EvolutionTracker
from .recursive_orchestrator import (
    EvolutionPhase,
    EvolutionState,
    EvolutionResult,
    RecursiveOrchestrator,
)
from .evolution_daemon import DaemonConfig, DaemonState, EvolutionDaemon

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
