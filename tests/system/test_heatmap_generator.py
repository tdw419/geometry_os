import pytest
import numpy as np
from systems.visual_shell.swarm.tectonic_heatmap_generator import HeatMapGenerator

class TestHeatMapGenerator:
    """Tests for the HeatMapGenerator agent."""

    @pytest.fixture
    def generator(self):
        return HeatMapGenerator(grid_size=10, cell_width=100)

    def test_generator_initialization(self, generator):
        """HeatMapGenerator initializes with correct grid dimensions."""
        assert generator.grid.shape == (10, 10)
        assert generator.cell_width == 100

    def test_spatial_heat_grid_creation(self, generator):
        """HeatMapGenerator can add heat to specific grid cells."""
        generator.add_heat(50, 50, 1.0) # (0,0) in grid coords
        assert generator.grid[0, 0] == 1.0
        
        generator.add_heat(150, 150, 0.5) # (1,1)
        assert generator.grid[1, 1] == 0.5

    def test_heat_diffusion(self, generator):
        """Heat diffuses to neighboring cells."""
        generator.add_heat(500, 500, 1.0) # Center
        grid_pos = (5, 5)
        assert generator.grid[grid_pos] == 1.0
        
        generator.diffuse(kernel_size=3)
        
        # Center should still have most heat, but neighbors should now have some
        assert generator.grid[5, 5] > 0
        assert generator.grid[4, 5] > 0
        assert generator.grid[6, 5] > 0

    def test_hot_cold_zone_identification(self, generator):
        """Generator identifies hot zones (above threshold)."""
        generator.add_heat(100, 100, 1.0)
        generator.add_heat(900, 900, 0.1)
        
        hot_zones = generator.get_hot_zones(threshold=0.5)
        assert (1, 1) in hot_zones
        assert (9, 9) not in hot_zones

    def test_normalized_output(self, generator):
        """Generator provides normalized heat map (0.0 to 1.0)."""
        generator.add_heat(50, 50, 5.0)
        generator.add_heat(150, 150, 10.0)
        
        normalized = generator.get_normalized_grid()
        assert np.max(normalized) == 1.0
        assert normalized[0, 0] == 0.5
        assert normalized[1, 1] == 1.0
