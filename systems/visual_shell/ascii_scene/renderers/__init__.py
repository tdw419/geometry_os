"""
ASCII Renderers for Zero-Cost AI Perception.

This module provides renderers that emit .ascii files for AI consumption,
enabling instant understanding of Neural City, Visual Shell, and Evolution
pipeline states without VLM screenshot processing.

Renderers:
- NeuralCityAsciiRenderer: District layout, camera viewport, health metrics
- VisualShellAsciiRenderer: Window tree, input state, global metrics
- EvolutionAsciiRenderer: PAS monitoring, pipeline progress, correction log

All renderers implement atomic writes and bounded logs for reliability.
"""

from .neural_city import NeuralCityAsciiRenderer
from .visual_shell import VisualShellAsciiRenderer
from .evolution import EvolutionAsciiRenderer

__all__ = [
    "NeuralCityAsciiRenderer",
    "VisualShellAsciiRenderer",
    "EvolutionAsciiRenderer",
]
