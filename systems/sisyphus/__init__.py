"""
Sisyphus - Self-Improving Guardian System for Geometry OS

This module provides autonomous monitoring, healing, and evolution capabilities
for the Geometry OS runtime environment.

Components:
- Guardian: Watchdog process monitoring system health
- Evolution: Self-improvement through code generation
- Memory Management: Intelligent resource optimization
- FFI Bridge: Native code integration layer
- Unified Glass Bridge: Multi-stream daemon visualization
"""

__version__ = "1.0.0"
__author__ = "Geometry OS Team"

# Import key components when available
try:
    from .guardian import Guardian
except ImportError:
    Guardian = None

try:
    from .evolution import EvolutionEngine
except ImportError:
    EvolutionEngine = None

try:
    from .unified_glass_bridge import (
        MultiStreamStats,
        StreamMessage,
        StreamType,
        TransportType,
        UnifiedGlassBridge,
        create_unified_bridge_for_daemon,
    )
except ImportError:
    UnifiedGlassBridge = None
    StreamType = None
    TransportType = None
    StreamMessage = None
    MultiStreamStats = None
    create_unified_bridge_for_daemon = None

__all__ = [
    "Guardian",
    "EvolutionEngine",
    "UnifiedGlassBridge",
    "StreamType",
    "TransportType",
    "StreamMessage",
    "MultiStreamStats",
    "create_unified_bridge_for_daemon",
    "__version__",
]
