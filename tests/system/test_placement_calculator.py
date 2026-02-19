import pytest
from systems.visual_shell.swarm.placement_calculator import PlacementCalculator

class TestPlacementCalculator:
    """Tests for the PlacementCalculator agent."""

    @pytest.fixture
    def calculator(self):
        return PlacementCalculator()

    def test_calculator_initialization(self, calculator):
        """PlacementCalculator initializes with default constants."""
        assert calculator.k_attract > 0
        assert calculator.k_repel > 0

    def test_force_directed_layout_step(self, calculator):
        """Calculator computes displacement for a single physics step."""
        positions = {
            "a": {"x": 0, "y": 0},
            "b": {"x": 100, "y": 0}
        }
        # Attractive relationship between A and B
        relationships = [("a", "b", 10)]
        
        new_positions = calculator.compute_step(positions, relationships)
        
        # A and B should move closer to each other
        assert new_positions["a"]["x"] > 0
        assert new_positions["b"]["x"] < 100

    def test_repulsive_force_computation(self, calculator):
        """Unrelated files repel each other to avoid overlap."""
        positions = {
            "a": {"x": 0, "y": 0},
            "b": {"x": 10, "y": 0}
        }
        # No relationship
        relationships = []
        
        new_positions = calculator.compute_step(positions, relationships)
        
        # A and B should move further apart
        assert new_positions["a"]["x"] < 0
        assert new_positions["b"]["x"] > 10

    def test_boundary_constraint_handling(self, calculator):
        """Calculator respects grid boundaries."""
        calculator.bounds = {"x_min": 0, "x_max": 100, "y_min": 0, "y_max": 100}
        positions = {"a": {"x": -10, "y": 150}}
        
        new_positions = calculator.compute_step(positions, [])
        
        assert new_positions["a"]["x"] >= 0
        assert new_positions["a"]["y"] <= 100

    def test_tectonic_plan_generation(self, calculator):
        """Calculator outputs a list of required moves (TectonicPlan)."""
        positions = {
            "a": {"x": 0, "y": 0},
            "b": {"x": 500, "y": 0}
        }
        relationships = [("a", "b", 100)]
        
        plan = calculator.generate_plan(positions, relationships, iterations=5)
        
        assert len(plan) > 0
        assert plan[0]["file_id"] in ["a", "b"]
        assert "target_x" in plan[0]
