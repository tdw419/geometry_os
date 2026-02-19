import pytest
import asyncio
from systems.visual_shell.swarm.restoration_executor import RestorationExecutor

class TestRestorationExecutor:
    """Tests for the Restoration Tectonic Executor."""

    @pytest.fixture
    def executor(self):
        return RestorationExecutor()

    def test_tectonic_plan_conversion(self, executor):
        """Executor converts a ClusterPlan into a TectonicPlan (move list)."""
        cluster_plan = {
            "a1": {"x": 100, "y": 100},
            "b1": {"x": 500, "y": 500}
        }
        
        tectonic_plan = executor.create_tectonic_plan(cluster_plan)
        
        assert len(tectonic_plan) == 2
        assert tectonic_plan[0]["file_id"] in ["a1", "b1"]
        assert "target_x" in tectonic_plan[0]

    @pytest.mark.asyncio
    async def test_batched_move_execution(self, executor):
        """Executor processes moves in parallel batches."""
        plan = [{"file_id": f"f{i}", "target_x": 0, "target_y": 0} for i in range(10)]
        
        moved = []
        async def mock_move(fid, x, y):
            moved.append(fid)
            return True
            
        executor._perform_move = mock_move
        
        results = await executor.execute_tectonic_plan(plan, batch_size=5)
        
        assert len(moved) == 10
        assert results["success"] == 10

    def test_move_conflict_detection(self, executor):
        """Executor detects and skips moves for files already being migrated."""
        executor.active_moves.add("a1")
        
        plan = [{"file_id": "a1", "target_x": 100, "target_y": 100}]
        conflicts = executor.detect_conflicts(plan)
        
        assert "a1" in conflicts

    @pytest.mark.asyncio
    async def test_rollback_on_failure(self, executor):
        """Executor records original positions to allow rollback if mission fails."""
        initial_positions = {"a1": {"x": 0, "y": 0}}
        plan = [{"file_id": "a1", "target_x": 100, "target_y": 100}]
        
        # Mock failed move
        async def failing_move(fid, x, y):
            return False
            
        executor._perform_move = failing_move
        
        await executor.execute_tectonic_plan(plan, initial_positions=initial_positions)
        
        # Should have recorded failure and original position for rollback
        assert executor.failure_history["a1"] == initial_positions["a1"]
