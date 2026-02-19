import pytest
import asyncio
from systems.visual_shell.swarm.task_migrator import TaskMigrator
from systems.visual_shell.swarm.distributed_coordinator import DistributedCoordinator
from systems.visual_shell.swarm.node_registry import NodeRegistry

class TestTaskMigrator:
    """Tests for the task failover migrator."""

    @pytest.fixture
    def registry(self):
        return NodeRegistry()

    @pytest.fixture
    def coordinator(self, registry):
        return DistributedCoordinator(node_id="leader", registry=registry)

    @pytest.fixture
    def migrator(self, coordinator, registry):
        return TaskMigrator(coordinator=coordinator, registry=registry)

    @pytest.mark.asyncio
    async def test_task_migrator_initialization(self, migrator, coordinator, registry):
        """TaskMigrator initializes with coordinator and registry."""
        assert migrator.coordinator == coordinator
        assert migrator.registry == registry

    @pytest.mark.asyncio
    async def test_orphaned_task_detection(self, migrator, coordinator, registry):
        """Migrator detects tasks assigned to dead nodes."""
        # 1. Register two nodes
        await registry.register_node("node-1", {"capabilities": ["compute"]})
        await registry.register_node("node-2", {"capabilities": ["compute"]})
        
        # 2. Submit and assign a task to node-1
        task_id = await coordinator.submit_task("compute", {})
        coordinator.task_node_assignments[task_id] = "node-1"
        coordinator.active_tasks[task_id].status = "assigned"
        
        # 3. Simulate node-1 failure
        await registry.unregister_node("node-1")
        
        # 4. Detect orphans
        orphans = await migrator.detect_orphans()
        assert task_id in orphans

    @pytest.mark.asyncio
    async def test_task_reassignment_on_failover(self, migrator, coordinator, registry):
        """Migrator reassigns orphaned tasks to healthy nodes."""
        # 1. Setup orphan
        await registry.register_node("node-1", {})
        await registry.register_node("node-2", {"capabilities": ["compute"]})
        
        task_id = await coordinator.submit_task("compute", {}, required_capability="compute")
        coordinator.task_node_assignments[task_id] = "node-1"
        coordinator.active_tasks[task_id].status = "assigned"
        
        await registry.unregister_node("node-1")
        
        # 2. Migrate
        await migrator.migrate_orphans()
        
        # 3. Verify reassignment
        assert task_id in coordinator.active_tasks
        assert coordinator.active_tasks[task_id].status == "pending"
        
        # Leader should reselect target
        new_target = coordinator.select_target_node(task_id)
        assert new_target == "node-2"
