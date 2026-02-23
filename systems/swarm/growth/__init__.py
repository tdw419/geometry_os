"""
RecursiveGrowth system for agent self-improvement.

Provides pattern analysis and growth tracking for agents to learn
from their experiences.
"""

from systems.swarm.growth.recursive_growth import RecursiveGrowth, GrowthMetrics
from systems.swarm.growth.pattern_analyzer import PatternAnalyzer, PerformanceAnalysis

__all__ = [
    "RecursiveGrowth",
    "GrowthMetrics",
    "PatternAnalyzer",
    "PerformanceAnalysis",
]
