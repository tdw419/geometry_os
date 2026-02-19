"""
AccessAnalyzer Agent - Tracks file access patterns and co-occurrences.
Part of the Tectonic Optimization system.
"""

import time
import logging
from typing import Dict, List, Tuple, Any, Optional

logger = logging.getLogger(__name__)

class AccessAnalyzer:
    """
    Analyzes file access patterns to identify locality relationships.
    Uses co-occurrence frequency to suggest which files should be placed together.
    """

    def __init__(self, window_seconds: float = 5.0):
        self.window_seconds = window_seconds
        self.access_counts: Dict[str, int] = {}
        self.co_occurrences: Dict[Tuple[str, str], int] = {}
        self.last_access: Dict[str, float] = {}
        self.last_reset = time.time()
        
        logger.info(f"AccessAnalyzer initialized with {window_seconds}s window")

    def record_access(self, file_path: str):
        """Record an access event for a file."""
        now = time.time()
        
        # Increment individual count
        self.access_counts[file_path] = self.access_counts.get(file_path, 0) + 1
        
        # Check for co-occurrences with other recently accessed files
        for other_file, last_time in self.last_access.items():
            if other_file == file_path:
                continue
                
            if now - last_time <= self.window_seconds:
                # Record co-occurrence
                pair = tuple(sorted([file_path, other_file]))
                self.co_occurrences[pair] = self.co_occurrences.get(pair, 0) + 1
        
        # Update last access time
        self.last_access[file_path] = now

    def get_frequency(self, file_path: str) -> float:
        """Get access frequency (accesses per second) since initialization."""
        elapsed = time.time() - self.last_reset
        if elapsed <= 0:
            return 0.0
        return self.access_counts.get(file_path, 0) / elapsed

    def get_state(self) -> Dict[str, Any]:
        """Return the current analysis state for publishing."""
        # Convert tuple keys to strings for JSON serializability
        co_occ_serializable = {f"{k[0]}|{k[1]}": v for k, v in self.co_occurrences.items()}
        
        return {
            "access_counts": self.access_counts,
            "co_occurrences": co_occ_serializable,
            "last_reset": self.last_reset,
            "window_seconds": self.window_seconds
        }

    def reset(self):
        """Reset all counters."""
        self.access_counts.clear()
        self.co_occurrences.clear()
        self.last_access.clear()
        self.last_reset = time.time()
        logger.info("AccessAnalyzer metrics reset")
