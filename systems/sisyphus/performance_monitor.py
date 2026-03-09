"""
Performance Monitor for Self-Rewriting Kernel

Detects performance hot spots in native Rust kernels by tracking
function call counts and durations.
"""

from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple, Any
from threading import Lock
import time


@dataclass
class HotSpot:
    """Represents a detected performance hot spot."""
    function_name: str
    call_count: int
    total_time_ms: float
    avg_time_ms: float
    source_file: Optional[str] = None
    source_line: Optional[int] = None

    @property
    def hotspot_score(self) -> float:
        """
        Calculate a combined score for hot spot ranking.

        Score = call_count * avg_time_ms
        This prioritizes frequently-called functions that are also slow.
        """
        return self.call_count * self.avg_time_ms


class PerformanceMonitor:
    """
    Thread-safe performance monitoring for kernel functions.

    Tracks call counts and durations to detect hot spots that
    may benefit from optimization via the Self-Rewriting Kernel.
    """

    def __init__(self, visual_bridge: Optional[Any] = None):
        """Initialize the monitor with thread-safe data structures."""
        self._lock = Lock()
        self._call_counts: Dict[str, int] = {}
        self._call_times: Dict[str, float] = {}  # total time in ms
        self._source_locations: Dict[str, Tuple[str, int]] = {}
        self.visual_bridge = visual_bridge

    @property
    def call_counts(self) -> Dict[str, int]:
        """Get a copy of call counts (for testing)."""
        with self._lock:
            return dict(self._call_counts)

    def register_function(self, name: str, file: str, line: int) -> None:
        """
        Register a function's source location.

        Args:
            name: Function name
            file: Source file path
            line: Line number in source file
        """
        with self._lock:
            self._source_locations[name] = (file, line)

    def record_call(self, function_name: str, duration_ms: float) -> None:
        """
        Record a function call with its duration.

        Args:
            function_name: Name of the function called
            duration_ms: Duration of the call in milliseconds
        """
        with self._lock:
            self._call_counts[function_name] = self._call_counts.get(function_name, 0) + 1
            self._call_times[function_name] = self._call_times.get(function_name, 0.0) + duration_ms
            
            # Highlight extreme hot spots in the UI
            if duration_ms > 100.0 and self.visual_bridge:
                self.visual_bridge.emit_kernel_hotspot(function_name, duration_ms)

    def detect_hot_spots(
        self,
        threshold_calls: int = 100,
        threshold_time_ms: float = 10.0,
        max_results: int = 10
    ) -> List[HotSpot]:
        """
        Detect performance hot spots based on thresholds.

        A hot spot is a function that:
        - Has been called at least threshold_calls times, OR
        - Has average call time >= threshold_time_ms

        Args:
            threshold_calls: Minimum call count to consider
            threshold_time_ms: Minimum average time in ms to consider
            max_results: Maximum number of hot spots to return

        Returns:
            List of HotSpot objects sorted by hotspot_score (descending)
        """
        hot_spots = []

        with self._lock:
            # Get all function names that have been tracked
            all_functions = set(self._call_counts.keys()) | set(self._call_times.keys())

            for func_name in all_functions:
                call_count = self._call_counts.get(func_name, 0)
                total_time = self._call_times.get(func_name, 0.0)
                avg_time = total_time / call_count if call_count > 0 else 0.0

                # Check if this function meets hot spot criteria
                if call_count >= threshold_calls or avg_time >= threshold_time_ms:
                    # Get source location if registered
                    source_file = None
                    source_line = None
                    if func_name in self._source_locations:
                        source_file, source_line = self._source_locations[func_name]

                    hot_spot = HotSpot(
                        function_name=func_name,
                        call_count=call_count,
                        total_time_ms=total_time,
                        avg_time_ms=avg_time,
                        source_file=source_file,
                        source_line=source_line
                    )
                    hot_spots.append(hot_spot)

        # Sort by hotspot score (descending)
        hot_spots.sort(key=lambda h: h.hotspot_score, reverse=True)

        # Return top max_results
        return hot_spots[:max_results]

    def clear_stats(self) -> None:
        """Clear all collected statistics."""
        with self._lock:
            self._call_counts.clear()
            self._call_times.clear()
            # Note: source locations are preserved
