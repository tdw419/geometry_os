"""
Sisyphus - Self-Improving Guardian System for Geometry OS

This module provides autonomous monitoring, healing, and evolution capabilities
for the Geometry OS runtime environment.

Components:
- Guardian: Watchdog process monitoring system health
- Evolution: Self-improvement through code generation
- Memory Management: Intelligent resource optimization
- FFI Bridge: Native code integration layer
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

__all__ = ["Guardian", "EvolutionEngine", "__version__"]
