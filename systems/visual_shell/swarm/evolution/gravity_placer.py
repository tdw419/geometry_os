"""
GravityPlacer - Foveated Knowledge Gravity positioning system.

Implements inverse gravity positioning where high-value code clusters
near the visual center (fovea) and low-value code is pushed to the periphery.

Core formula:
    distance_from_center = gravity_constant / (value_score + epsilon)

This creates a "foveated" knowledge map where the most valuable code
is always at the center of attention, similar to how human vision works.
"""

import math
import hashlib
from dataclasses import dataclass
from typing import Dict, List, Optional, Tuple


@dataclass
class GravityPosition:
    """
    Represents a file's position in the gravity-based layout.

    Attributes:
        file_path: Path to the source file
        x: X coordinate in the infinite map
        y: Y coordinate in the infinite map
        value_score: The computed value/importance of this file (0.0 to 1.0)
        distance_from_center: Distance from (0,0) or custom center
    """
    file_path: str
    x: float
    y: float
    value_score: float
    distance_from_center: float


class GravityPlacer:
    """
    Positions code files based on their value using gravity simulation.

    High-value files gravitate toward the center (fovea), while low-value
    files are pushed to the periphery. This creates an intuitive spatial
    organization where the most important code is always visible at the center.

    The angle of each file's position is determined deterministically from
    a hash of the file path, ensuring the same file always appears in the
    same direction from center, just at varying distances based on value.

    Example:
        >>> placer = GravityPlacer(gravity_constant=100.0)
        >>> core_pos = placer.place("src/core.py", 0.95)  # Near center
        >>> legacy_pos = placer.place("legacy/old.py", 0.05)  # Far from center

        # Update all positions when values change
        >>> new_positions = placer.recenter({"src/core.py": 0.80})

        # Get files within viewing range
        >>> inner_ring = placer.get_inner_ring(500)
    """

    def __init__(
        self,
        center: Tuple[float, float] = (0.0, 0.0),
        gravity_constant: float = 100.0,
        epsilon: float = 0.001
    ):
        """
        Initialize the GravityPlacer.

        Args:
            center: The center point (fovea) of the gravity field
            gravity_constant: Controls how spread out the layout is.
                             Higher values push low-value files further out.
            epsilon: Small value to prevent division by zero for files with
                    value_score of 0.0
        """
        self.center = center
        self.gravity_constant = gravity_constant
        self.epsilon = epsilon
        self._positions: Dict[str, GravityPosition] = {}

    def place(self, file_path: str, value_score: float) -> GravityPosition:
        """
        Position a file based on its value score.

        High-value files are placed near the center, low-value files
        are placed further away. The angle is determined by hashing
        the file path for deterministic positioning.

        Args:
            file_path: Path to the source file
            value_score: Value/importance of the file (0.0 to 1.0)
                        Values outside this range are clamped

        Returns:
            GravityPosition with coordinates and metadata
        """
        # Clamp value to valid range
        clamped_value = max(0.0, min(1.0, value_score))

        # Calculate distance using inverse gravity formula
        # distance = gravity_constant / (value + epsilon)
        distance = self.gravity_constant / (clamped_value + self.epsilon)

        # Get deterministic angle from file path hash
        angle = self._get_angle_from_path(file_path)

        # Convert polar to cartesian coordinates relative to center
        x = self.center[0] + distance * math.cos(angle)
        y = self.center[1] + distance * math.sin(angle)

        # Create and store the position
        position = GravityPosition(
            file_path=file_path,
            x=x,
            y=y,
            value_score=clamped_value,
            distance_from_center=distance
        )

        self._positions[file_path] = position
        return position

    def recenter(self, value_updates: Dict[str, float]) -> Dict[str, GravityPosition]:
        """
        Update positions for files with new value scores.

        All files maintain their angle from center (determined by file path hash)
        but their distances are recalculated based on the new values.

        Args:
            value_updates: Dictionary mapping file paths to new value scores

        Returns:
            Dictionary of all current positions (not just updated ones)
        """
        # Update values for specified files
        for file_path, new_value in value_updates.items():
            if file_path in self._positions:
                # Re-place with new value (maintains same angle)
                self.place(file_path, new_value)

        return self._positions.copy()

    def get_inner_ring(self, radius: float) -> List[GravityPosition]:
        """
        Get all files within a specified radius of the center.

        Useful for determining which files are visible in the current
        viewport or "foveal region".

        Args:
            radius: Maximum distance from center to include

        Returns:
            List of GravityPosition objects within radius, sorted by
            distance (closest first)
        """
        inner_files = [
            pos for pos in self._positions.values()
            if pos.distance_from_center <= radius
        ]

        # Sort by distance (closest first)
        inner_files.sort(key=lambda p: p.distance_from_center)
        return inner_files

    def get_all_positions(self) -> Dict[str, GravityPosition]:
        """
        Get all current file positions.

        Returns:
            Dictionary mapping file paths to their GravityPosition
        """
        return self._positions.copy()

    def _get_angle_from_path(self, file_path: str) -> float:
        """
        Generate a deterministic angle from a file path.

        Uses SHA-256 hash of the file path to generate a consistent
        angle in radians. This ensures the same file always appears
        in the same direction from center.

        Args:
            file_path: Path to hash

        Returns:
            Angle in radians [0, 2*pi)
        """
        # Hash the file path
        hash_bytes = hashlib.sha256(file_path.encode()).digest()

        # Use first 8 bytes as an integer and map to [0, 2*pi)
        hash_int = int.from_bytes(hash_bytes[:8], 'big')
        angle = (hash_int / (2**64 - 1)) * (2 * math.pi)

        return angle

    def clear(self) -> None:
        """Remove all stored positions."""
        self._positions.clear()

    def __len__(self) -> int:
        """Return the number of positioned files."""
        return len(self._positions)

    def __contains__(self, file_path: str) -> bool:
        """Check if a file has been positioned."""
        return file_path in self._positions
