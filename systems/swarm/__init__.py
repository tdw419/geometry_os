"""
Swarm Intelligence System for Geometry OS.

Provides decentralized MapReduce-style coordination with:
- TaskBoard: File-based shared task storage
- SwarmAgent: Autonomous task-executing agents
- SwarmCoordinator: MapReduce orchestration
- NEBBus: Neural Event Bus for pub/sub coordination
- SwarmNEBBridge: Bridge between SwarmNode consensus and NEBBus
- Guild Agents: Specialized agents for code generation, review, architecture
"""

from systems.swarm.task import Task, TaskType, TaskStatus
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent
from systems.swarm.swarm_coordinator import SwarmCoordinator
from systems.swarm.reduction import reduce_results, STRATEGIES

# NEB exports
from systems.swarm.neb_signal import NEBSignal
from systems.swarm.neb_bus import NEBBus
from systems.swarm.subscription_manager import SubscriptionManager
from systems.swarm.neb_visual_hud import NEBVisualHUD

# SwarmNEBBridge export
from systems.swarm.swarm_neb_bridge import SwarmNEBBridge

# Guild exports
from systems.swarm.guilds import GuildAgent, EngineerAgent, ReviewerAgent, ArchitectAgent, GuildFactory

# Phase 2 integration exports
from systems.swarm.guilds import (
    SandboxExecutor,
    ExecutionResult,
)
from systems.swarm.guilds.providers import LLMProvider, LLMProviderError
from systems.swarm.guilds.providers.mock import MockProvider
from systems.swarm.guilds.scanners import SecurityFinding, SecurityScanner
from systems.swarm.guilds.scanners.bandit import BanditScanner
from systems.swarm.guilds.linters import RuffChecker, StyleViolation

__all__ = [
    # Core
    "Task", "TaskType", "TaskStatus",
    "TaskBoard", "SwarmAgent", "SwarmCoordinator",
    "reduce_results", "STRATEGIES",
    # NEB
    "NEBSignal", "NEBBus", "SubscriptionManager", "NEBVisualHUD",
    # Bridge
    "SwarmNEBBridge",
    # Guilds
    "GuildAgent", "EngineerAgent", "ReviewerAgent", "ArchitectAgent", "GuildFactory",
    # Phase 2 integrations
    "SandboxExecutor", "ExecutionResult",
    "LLMProvider", "LLMProviderError", "MockProvider",
    "SecurityFinding", "SecurityScanner", "BanditScanner",
    "RuffChecker", "StyleViolation",
]
