import pytest
import asyncio
from systems.visual_shell.swarm.distributed_coordinator import DistributedCoordinator
from systems.visual_shell.swarm.node_registry import NodeRegistry

class TestDistributedCoordinator:
    """Tests for the distributed swarm coordinator."""

    @pytest.fixture
    def registry(self):
        return NodeRegistry()

    @pytest.fixture
    def coordinator(self, registry):
        return DistributedCoordinator(node_id="coordinator-1", registry=registry)

    @pytest.mark.asyncio
    async def test_distributed_coordinator_initialization(self, coordinator, registry):
        """DistributedCoordinator initializes with a node ID and registry."""
        assert coordinator.node_id == "coordinator-1"
        assert coordinator.registry == registry

    @pytest.mark.asyncio
    async def test_cross_node_task_routing(self, coordinator, registry):
        """Coordinator can route tasks to agents on other nodes."""
        # Register two nodes
        await registry.register_node("node-1", {"capabilities": ["compute"]})
        await registry.register_node("node-2", {"capabilities": ["storage"]})
        
        # Submit a task that requires storage
        task_id = await coordinator.submit_task(
            task_type="storage_task",
            params={"data": "test"},
            required_capability="storage"
        )
        
        # Should be assigned to an agent on node-2
        # In a real system, this would involve sending a message to node-2
        # For this test, we verify the target node selection logic
        target_node = coordinator.select_target_node(task_id)
        assert target_node == "node-2"

    @pytest.mark.asyncio
    async def test_load_balancing_across_nodes(self, coordinator, registry):
        """Coordinator balances tasks across nodes with same capabilities."""
        await registry.register_node("node-1", {"load": 10})
        await registry.register_node("node-2", {"load": 5})
        
        task_id = await coordinator.submit_task("generic_task", {})
        
        # Should pick node-2 because it has lower load
        target_node = coordinator.select_target_node(task_id)
        assert target_node == "node-2"

    @pytest.mark.asyncio
    async def test_task_state_synchronization(self, coordinator):
        """Coordinator syncs task state with other nodes."""
        # This is a mock test for the sync mechanism
        task_id = "task-123"
        state = {"status": "completed", "result": "done"}
        
        await coordinator.sync_task_state(task_id, state)
        
        assert task_id in coordinator.active_tasks or task_id in [t.task_id for t in coordinator.task_history]
