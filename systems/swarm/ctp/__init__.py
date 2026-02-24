# systems/swarm/ctp/__init__.py
"""Cognitive Transmission Protocol - AI-native ASCII protocol."""

# Types and constants
from .types import CTPVersion, TrustLevel, IntentType, CTPSignal, ContextHash

# Parser
from .parser import CTPParser, ParseError

# Trust management
from .trust_manager import AgentRegistry, TrustManager

# Gateway and session
from .gateway import CTPGateway, CTPSession

# Client
from .client import CTPClient

# Simulation
from .simulation import CTPSimulationRunner

__all__ = [
    # Types
    "CTPVersion",
    "TrustLevel",
    "IntentType",
    "CTPSignal",
    "ContextHash",
    # Parser
    "CTPParser",
    "ParseError",
    # Trust management
    "AgentRegistry",
    "TrustManager",
    # Gateway
    "CTPGateway",
    "CTPSession",
    # Client
    "CTPClient",
    # Simulation
    "CTPSimulationRunner",
]
