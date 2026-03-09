"""
Entropy Mapper for Intrinsic Curiosity Engine

Identifies cold spots (unused/underused code) and hot spots (bottlenecks)
using PerformanceMonitor data to guide autonomous exploration and optimization.
"""

from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Tuple, Union
from systems.sisyphus.performance_monitor import PerformanceMonitor


# Scoring constants for hot spot detection
# These represent the scale at which factors reach maximum contribution
HOT_FREQ_SCALE = 1000  # Call count at which frequency factor = 1.0
HOT_TIME_SCALE = 100.0  # Avg time (ms) at which time factor = 1.0


@dataclass(order=False)
class EntropySpot:
    """
    Represents an area of code entropy (cold or hot spot).

    Cold spots are underused code that may indicate:
    - Dead code
    - Forgotten features
    - Missing test coverage
    - Opportunities for refactoring

    Hot spots are overused code that may indicate:
    - Performance bottlenecks
    - Tight loops
    - Candidates for optimization
    - Critical paths needing attention
    """

    file_path: str
    entropy_type: str  # "cold" or "hot"
    score: float  # 0.0 to 1.0
    metrics: Dict[str, Any] = field(default_factory=dict)
    function_name: Optional[str] = None
    source_line: Optional[int] = None

    def __lt__(self, other: "EntropySpot") -> bool:
        """Sort by score descending (higher score = more important)."""
        return self.score > other.score


class EntropyMapper:
    """
    Maps code entropy using PerformanceMonitor data.

    Analyzes function call patterns to identify:
    - Cold spots: Functions with low call counts (potential dead code)
    - Hot spots: Functions with high call counts or slow execution (bottlenecks)

    Provides structural health scoring (PAS - Performance Alignment Score)
    to measure overall code balance.
    """

    def __init__(
        self,
        performance_monitor: PerformanceMonitor,
        cold_threshold_calls: int = 10,
        hot_threshold_calls: int = 100,
        hot_threshold_time_ms: float = 10.0
    ):
        """
        Initialize the entropy mapper.

        Args:
            performance_monitor: PerformanceMonitor instance with call data
            cold_threshold_calls: Call count below which code is "cold"
            hot_threshold_calls: Call count at or above which code is "hot" by frequency
            hot_threshold_time_ms: Average time at or above which code is "hot" by slowness
        """
        self.perf_monitor = performance_monitor
        self.cold_threshold = cold_threshold_calls
        self.hot_threshold_calls = hot_threshold_calls
        self.hot_threshold_time = hot_threshold_time_ms

    def map_entropy(self) -> List[EntropySpot]:
        """
        Map all entropy spots (cold and hot) in the monitored code.

        Returns:
            List of EntropySpot objects sorted by score (descending)
        """
        spots: List[EntropySpot] = []

        # Get all tracked functions using thread-safe public accessors
        call_counts = self.perf_monitor.call_counts
        call_times = self.perf_monitor.call_times
        source_locations = self.perf_monitor.source_locations

        # Get all function names (including registered but never called)
        all_functions = call_counts.keys() | source_locations.keys()

        for func_name in all_functions:
            call_count = call_counts.get(func_name, 0)
            total_time = call_times.get(func_name, 0.0)
            avg_time = total_time / call_count if call_count > 0 else 0.0

            # Get source location
            file_path, source_line = source_locations.get(func_name, ("unknown", None))

            # Check for cold spot
            if call_count < self.cold_threshold:
                score = 1.0 - (call_count / self.cold_threshold)
                spot = EntropySpot(
                    file_path=file_path,
                    entropy_type="cold",
                    score=score,
                    metrics={
                        "call_count": call_count,
                        "threshold": self.cold_threshold
                    },
                    function_name=func_name,
                    source_line=source_line
                )
                spots.append(spot)

            # Check for hot spot
            elif call_count >= self.hot_threshold_calls or avg_time >= self.hot_threshold_time:
                # Calculate hot score combining frequency and time factors
                # Uses defined constants for scale factors
                freq_factor = min(1.0, call_count / HOT_FREQ_SCALE)
                time_factor = min(1.0, avg_time / HOT_TIME_SCALE)
                score = (freq_factor + time_factor) / 2.0

                spot = EntropySpot(
                    file_path=file_path,
                    entropy_type="hot",
                    score=score,
                    metrics={
                        "call_count": call_count,
                        "avg_time_ms": avg_time,
                        "total_time_ms": total_time,
                        "freq_factor": freq_factor,
                        "time_factor": time_factor
                    },
                    function_name=func_name,
                    source_line=source_line
                )
                spots.append(spot)

        # Sort by score descending
        spots.sort()

        return spots

    def get_cold_spots(self, limit: int = 10) -> List[EntropySpot]:
        """
        Get cold spots (underused code).

        Args:
            limit: Maximum number of cold spots to return

        Returns:
            List of cold EntropySpot objects sorted by score (descending)
        """
        all_spots = self.map_entropy()
        cold_spots = [s for s in all_spots if s.entropy_type == "cold"]
        return cold_spots[:limit]

    def get_hot_spots(self, limit: int = 10) -> List[EntropySpot]:
        """
        Get hot spots (bottlenecks).

        Args:
            limit: Maximum number of hot spots to return

        Returns:
            List of hot EntropySpot objects sorted by score (descending)
        """
        all_spots = self.map_entropy()
        hot_spots = [s for s in all_spots if s.entropy_type == "hot"]
        return hot_spots[:limit]

    def compute_structural_health(self) -> float:
        """
        Compute structural health (PAS - Performance Alignment Score).

        A balanced system has functions called at moderate rates.
        Too many cold spots = dead code bloat
        Too many hot spots = bottlenecks

        Returns:
            Health score from 0.0 (imbalanced) to 1.0 (perfectly balanced)
        """
        all_spots = self.map_entropy()

        # Count total tracked functions
        total_functions = len(self.perf_monitor.call_counts)

        if total_functions == 0:
            return 1.0  # No data means no imbalance

        cold_count = sum(1 for s in all_spots if s.entropy_type == "cold")
        hot_count = sum(1 for s in all_spots if s.entropy_type == "hot")

        # Imbalance ratio: how much of the code is in an extreme state
        imbalance = (cold_count + hot_count) / total_functions

        # Health is inverse of imbalance
        health = 1.0 - imbalance

        return max(0.0, min(1.0, health))
