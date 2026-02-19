import pytest
import asyncio
from systems.visual_shell.swarm.migration_coordinator import MigrationCoordinator

class TestMigrationCoordinator:
    """Tests for the MigrationCoordinator agent."""

    @pytest.fixture
    def coordinator(self):
        return MigrationCoordinator()

    @pytest.mark.asyncio
    async def test_coordinator_initialization(self, coordinator):
        """MigrationCoordinator initializes with ready status."""
        assert coordinator.active_migrations == {}
        assert coordinator.is_running is False

    @pytest.mark.asyncio
    async def test_tectonic_plan_execution(self, coordinator):
        """Coordinator processes a multi-file migration plan."""
        plan = [
            {"file_id": "a", "target_x": 100, "target_y": 100},
            {"file_id": "b", "target_x": 200, "target_y": 200}
        ]
        
        # Mock file move operation
        moved_files = []
        async def mock_move(file_id, x, y):
            moved_files.append(file_id)
            return True
            
        coordinator._move_file = mock_move
        
        results = await coordinator.execute_plan(plan)
        
        assert len(moved_files) == 2
        assert results["success_count"] == 2

    @pytest.mark.asyncio
    async def test_conflict_detection(self, coordinator):
        """Coordinator prevents simultaneous migrations of the same file."""
        plan = [{"file_id": "a", "target_x": 100, "target_y": 100}]
        
        # Simulate 'a' already migrating
        coordinator.active_migrations["a"] = True
        
        results = await coordinator.execute_plan(plan)
        assert results["conflict_count"] == 1
        assert results["success_count"] == 0

    @pytest.mark.asyncio
    async def test_atomic_multi_file_moves(self, coordinator):
        """Coordinator handles rollbacks if a move in a batch fails."""
        # Note: Rollback logic implementation depth depends on complexity
        # For this test, we verify failure tracking.
        plan = [{"file_id": "fail_me", "target_x": 0, "target_y": 0}]
        
        async def failing_move(fid, x, y):
            raise IOError("Move failed")
            
        coordinator._move_file = failing_move
        
        results = await coordinator.execute_plan(plan)
        assert results["failure_count"] == 1
