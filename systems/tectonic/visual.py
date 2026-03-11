"""
District visualization for tectonic plates.

Phase 49: Neural District Coalescence
Provides heatmap rendering and ghost layer for temporal visualization.

PixelBrain specs:
- Ghost Layer Depth: 60 frames (1 sec @ 60fps)
- Ghost Layer Format: Compressed PNG diffs
- Decay: Exponential e^(-gamma*t) where gamma = 0.3
"""

from collections import deque

import numpy as np

from systems.tectonic.plate import TectonicPlate


class DistrictHeatmap:
    """
    Renders tectonic plates as a district heatmap.

    Each tile in plate.tiles gets colored according to plate.get_color().
    Output is an RGBA array suitable for display or further processing.
    """

    def __init__(self, width: int = 256, height: int = 256):
        """
        Initialize the heatmap renderer.

        Args:
            width: Canvas width in pixels
            height: Canvas height in pixels
        """
        self.width = width
        self.height = height

    def render(
        self,
        plates: list[TectonicPlate],
        background: np.ndarray | None = None,
    ) -> np.ndarray:
        """
        Render plates to an RGBA array.

        Args:
            plates: List of TectonicPlate objects to render
            background: Optional RGBA array to use as background (must match dimensions)

        Returns:
            np.ndarray: RGBA array of shape (height, width, 4)
        """
        # Initialize with background or transparent black
        if background is not None:
            frame = background.copy().astype(np.uint8)
        else:
            frame = np.zeros((self.height, self.width, 4), dtype=np.uint8)

        # Render each plate's tiles
        for plate in plates:
            color = plate.get_color()
            for (x, y) in plate.tiles:
                # Check bounds
                if 0 <= x < self.width and 0 <= y < self.height:
                    frame[y, x] = color

        return frame

    def render_to_png(
        self,
        plates: list[TectonicPlate],
        output_path: str,
        background: np.ndarray | None = None,
    ) -> None:
        """
        Render plates and save to PNG file.

        Args:
            plates: List of TectonicPlate objects to render
            output_path: Path to save the PNG file
            background: Optional RGBA array to use as background
        """
        from PIL import Image

        frame = self.render(plates, background)
        # Convert RGBA to PIL Image
        img = Image.fromarray(frame, mode="RGBA")
        img.save(output_path)

    def render_with_borders(
        self,
        plates: list[TectonicPlate],
        border_width: int = 2,
        background: np.ndarray | None = None,
    ) -> np.ndarray:
        """
        Render plates with glowing borders around tile groups.

        Args:
            plates: List of TectonicPlate objects to render
            border_width: Width of the border glow effect
            background: Optional RGBA array to use as background

        Returns:
            np.ndarray: RGBA array with borders
        """
        # First render the base tiles
        frame = self.render(plates, background)

        # For each plate, find border tiles and add glow
        for plate in plates:
            color = plate.get_color()
            tiles_set = set(plate.tiles)

            # Find border tiles (tiles adjacent to empty space or other plates)
            border_tiles = self._find_border_tiles(plate.tiles, tiles_set)

            # Draw border glow (brighter version of the color)
            glow_color = self._make_glow_color(color)

            for (x, y) in border_tiles:
                # Draw border pixels around the tile
                for dx in range(-border_width, border_width + 1):
                    for dy in range(-border_width, border_width + 1):
                        nx, ny = x + dx, y + dy
                        if 0 <= nx < self.width and 0 <= ny < self.height:
                            # Only draw if not overwriting another tile
                            if (nx, ny) not in tiles_set:
                                # Blend glow with existing pixel
                                frame[ny, nx] = glow_color

        return frame

    def _find_border_tiles(
        self,
        tiles: list[tuple[int, int]],
        tiles_set: set,
    ) -> list[tuple[int, int]]:
        """
        Find tiles that are on the border (adjacent to empty space).

        Args:
            tiles: List of tile coordinates
            tiles_set: Set of tile coordinates for fast lookup

        Returns:
            List of border tile coordinates
        """
        border = []
        for (x, y) in tiles:
            # Check 4-connected neighbors
            is_border = False
            for (dx, dy) in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                neighbor = (x + dx, y + dy)
                if neighbor not in tiles_set:
                    is_border = True
                    break
            if is_border:
                border.append((x, y))
        return border

    def _make_glow_color(self, color: tuple[int, int, int, int]) -> tuple[int, int, int, int]:
        """
        Create a brighter glow color from base color.

        Args:
            color: Base RGBA color tuple

        Returns:
            Brighter RGBA color tuple for glow effect
        """
        r, g, b, a = color
        # Brighten the color
        glow_r = min(255, r + 50)
        glow_g = min(255, g + 50)
        glow_b = min(255, b + 50)
        # Slightly reduce alpha for softer glow
        glow_a = max(128, a - 50)
        return (glow_r, glow_g, glow_b, glow_a)


class GhostLayer:
    """
    Temporal ghost layer for motion trail visualization.

    Stores a history of frames and composites them with exponential decay.
    Older frames fade out according to: weight = e^(-gamma * t)

    PixelBrain specs:
    - Default depth: 60 frames (1 second at 60fps)
    - Decay formula: weight = e^(-gamma * t) where gamma = 0.3
    - Normalized by total weight sum
    """

    def __init__(self, depth: int = 60, decay_gamma: float = 0.3):
        """
        Initialize the ghost layer.

        Args:
            depth: Maximum number of frames to store (default: 60)
            decay_gamma: Decay rate for older frames (default: 0.3)
        """
        self.depth = depth
        self.decay_gamma = decay_gamma
        self._history: deque = deque(maxlen=depth)

    def push_frame(self, frame: np.ndarray) -> None:
        """
        Add a frame to the history.

        Args:
            frame: RGBA array to add to history
        """
        # Store a copy to prevent external modifications
        self._history.append(frame.copy())

    def composite(self) -> np.ndarray:
        """
        Blend all frames with exponential decay.

        Weight for frame at age t (0 = newest): e^(-gamma * t)
        Result is normalized by total weight sum.

        Returns:
            np.ndarray: Composited RGBA array, or zeros if history is empty
        """
        if not self._history:
            # Return empty frame with correct shape
            # We don't know the shape yet, return minimal array
            return np.zeros((0, 0, 4), dtype=np.uint8)

        # Get shape from first frame
        height, width, channels = self._history[0].shape

        # Calculate weights for all frames
        n_frames = len(self._history)
        weights = []
        for t in range(n_frames):
            # t=0 is newest (at the end of deque), t=n_frames-1 is oldest
            weight = np.exp(-self.decay_gamma * t)
            weights.append(weight)

        # Normalize weights
        total_weight = sum(weights)
        if total_weight == 0:
            total_weight = 1.0  # Avoid division by zero

        normalized_weights = [w / total_weight for w in weights]

        # Composite frames (from newest to oldest)
        # _history[0] is oldest, _history[-1] is newest
        result = np.zeros((height, width, channels), dtype=np.float32)

        for i, frame in enumerate(self._history):
            # Age is (n_frames - 1 - i) because newest is at the end
            age = n_frames - 1 - i
            weight = normalized_weights[age]
            result += frame.astype(np.float32) * weight

        return np.clip(result, 0, 255).astype(np.uint8)

    def clear(self) -> None:
        """Reset history, removing all stored frames."""
        self._history.clear()

    @property
    def frame_count(self) -> int:
        """Return current number of frames in history."""
        return len(self._history)
