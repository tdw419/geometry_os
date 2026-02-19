import pytest
import asyncio
from systems.visual_shell.swarm.access_analyzer import AccessAnalyzer
from systems.visual_shell.swarm.tectonic_heatmap_generator import HeatMapGenerator
from systems.visual_shell.swarm.fragmentation_detector import FragmentationDetector
from systems.visual_shell.swarm.placement_calculator import PlacementCalculator
from systems.visual_shell.swarm.migration_coordinator import MigrationCoordinator
from systems.visual_shell.swarm.verification_agent import VerificationAgent

class TestTectonicIntegration:
    """End-to-end integration tests for the Tectonic Optimization system."""

    @pytest.mark.asyncio
    async def test_full_optimization_cycle(self):
        """Verify the complete flow from access analysis to migration verification."""
        # 1. Setup Agents
        analyzer = AccessAnalyzer()
        heatmap = HeatMapGenerator()
        detector = FragmentationDetector()
        calculator = PlacementCalculator()
        coordinator = MigrationCoordinator()
        verifier = VerificationAgent()
        
        # Initial State: a and b are far apart
        initial_positions = {
            "a": {"x": 0, "y": 0},
            "b": {"x": 1000, "y": 1000}
        }
        detector.update_positions(initial_positions)
        
        # 2. Record Accesses (Creating relationships)
        for _ in range(10):
            analyzer.record_access("a")
            analyzer.record_access("b")
            
        state = analyzer.get_state()
        relationships = []
        for pair_str, weight in state["co_occurrences"].items():
            u, v = pair_str.split("|")
            relationships.append((u, v, weight))
            
        assert len(relationships) > 0
        
        # 3. Detect Fragmentation
        targets = detector.get_optimization_targets(relationships)
        assert len(targets) > 0
        assert targets[0][0] == "a"
        assert targets[0][1] == "b"
        
        # 4. Compute New Placement
        plan = calculator.generate_plan(initial_positions, relationships, iterations=10)
        assert len(plan) > 0
        
        # 5. Execute Migrations
        # Mock move for coordinator
        final_positions = initial_positions.copy()
        async def mock_move(file_id, x, y):
            final_positions[file_id] = {"x": x, "y": y}
            return True
        coordinator._move_file = mock_move
        
        results = await coordinator.execute_plan(plan)
        assert results["success_count"] > 0
        
        # 6. Verify Results
        before_state = {"positions": initial_positions, "relationships": relationships}
        after_state = {"positions": final_positions, "relationships": relationships}
        
        improvement = verifier.compare_states(before_state, after_state)
        assert improvement > 0 # Score should have increased
        
        verifier.record_optimization("tectonic-integration-test", 
                                     verifier.compute_system_score(before_state),
                                     verifier.compute_system_score(after_state))
        
        report = verifier.generate_report()
        assert "Improvement" in report
