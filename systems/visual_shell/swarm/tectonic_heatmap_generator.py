"""
Tectonic HeatMapGenerator - Spatial aggregation and diffusion of access patterns.
Part of the Tectonic Optimization system.
"""

import numpy as np
import logging
from typing import List, Tuple, Dict, Any

logger = logging.getLogger(__name__)

class HeatMapGenerator:
    """
    Generates and maintains a spatial heat grid based on file access events.
    Supports diffusion algorithms to identify cluster-able regions.
    """

    def __init__(self, grid_size: int = 64, cell_width: float = 100.0):
        self.grid_size = grid_size
        self.cell_width = cell_width
        self.grid = np.zeros((grid_size, grid_size), dtype=np.float32)
        
        logger.info(f"HeatMapGenerator initialized: {grid_size}x{grid_size} grid")

    def add_heat(self, x: float, y: float, amount: float):
        """Add heat at a specific spatial coordinate."""
        grid_x = int(x / self.cell_width) % self.grid_size
        grid_y = int(y / self.cell_width) % self.grid_size
        
        self.grid[grid_y, grid_x] += amount

    def diffuse(self, kernel_size: int = 3):
        """Apply a simple diffusion (blur) kernel to the heat map."""
        if kernel_size < 3:
            return
            
        # Simple box blur for diffusion
        kernel = np.ones((kernel_size, kernel_size), dtype=np.float32) / (kernel_size * kernel_size)
        
        # Note: We use a simple padded convolution approach
        pad = kernel_size // 2
        padded = np.pad(self.grid, pad, mode='wrap')
        
        new_grid = np.zeros_like(self.grid)
        for y in range(self.grid_size):
            for x in range(self.grid_size):
                region = padded[y:y+kernel_size, x:x+kernel_size]
                new_grid[y, x] = np.sum(region * kernel)
                
        self.grid = new_grid

    def get_hot_zones(self, threshold: float = 0.5) -> List[Tuple[int, int]]:
        """Identify grid cells with heat above the specified threshold."""
        hot_indices = np.where(self.grid >= threshold)
        return list(zip(hot_indices[1], hot_indices[0])) # (x, y)

    def get_normalized_grid(self) -> np.ndarray:
        """Return the heat map normalized to 0.0-1.0 range."""
        max_val = np.max(self.grid)
        if max_val <= 0:
            return np.zeros_like(self.grid)
        return self.grid / max_val

    def reset(self):
        """Clear the heat map."""
        self.grid.fill(0)
