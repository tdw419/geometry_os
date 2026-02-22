import pytest
import asyncio
import time
from systems.visual_shell.swarm.node_registry import NodeRegistry
from systems.visual_shell.swarm.distributed_coordinator import DistributedCoordinator
from systems.visual_shell.swarm.node_health_monitor import NodeHealthMonitor
from systems.visual_shell.swarm.task_migrator import TaskMigrator

class TestSwarmDistributionIntegration:
    """End-to-end integration tests for the distributed swarm cluster."""

    @pytest.mark.asyncio
    async def test_full_cluster_task_lifecycle(self):
        """Verify task lifecycle across a distributed cluster."""
        # 1. Setup
        registry = NodeRegistry(heartbeat_timeout=1)
        coordinator = DistributedCoordinator(node_id="leader", registry=registry)
        
        # 2. Register Nodes
        await registry.register_node("node-1", {"capabilities": ["scan"], "load": 5})
        await registry.register_node("node-2", {"capabilities": ["process"], "load": 2})
        
        # 3. Submit Tasks with Capability Requirements
        task1 = await coordinator.submit_task("scan", {"region": "A"}, required_capability="scan")
        task2 = await coordinator.submit_task("process", {"region": "A"}, required_capability="process")
        
        # 4. Target Node Selection
        target1 = coordinator.select_target_node(task1)
        target2 = coordinator.select_target_node(task2)
        
        assert target1 == "node-1"
        assert target2 == "node-2"
        
        # 5. Simulate Execution and State Sync
        await coordinator.assign_task(task1, "node-1-agent")
        await coordinator.sync_task_state(task1, {"status": "completed", "result": "done"})
        
        assert coordinator.task_history[0].task_id == task1
        assert coordinator.task_history[0].status == "completed"

    @pytest.mark.asyncio
    async def test_cluster_failover_and_recovery(self):
        """Verify node failure detection and task failover migration."""
        # 1. Setup
        registry = NodeRegistry(heartbeat_timeout=1)
        coordinator = DistributedCoordinator(node_id="leader", registry=registry)
        monitor = NodeHealthMonitor(registry=registry, failure_threshold=1)
        migrator = TaskMigrator(coordinator=coordinator, registry=registry)
        
        # 2. Register Active Node
        await registry.register_node("node-1", {"capabilities": ["compute"]})
        await registry.register_node("node-2", {"capabilities": ["compute"]})
        
        # 3. Submit and Assign Task
        task_id = await coordinator.submit_task("compute", {}, required_capability="compute")
        target = coordinator.select_target_node(task_id)
        assert target == "node-1"
        await coordinator.assign_task(task_id, "node-1-agent")
        
        # 4. Simulate Node-1 Failure
        # Manually set node-1 heartbeat to the past
        registry.nodes["node-1"]["last_heartbeat"] = time.time() - 2
        
        # Run health check
        dead_nodes = await monitor.check_health()
        assert "node-1" in dead_nodes
        assert "node-2" not in dead_nodes
        
        # Unregister (monitor would do this in loop)
        for node_id in dead_nodes:
            await registry.unregister_node(node_id)
        
        # 5. Migrate Orphans
        await migrator.migrate_orphans()
        
        # 6. Verify Task Re-queued
        assert task_id in coordinator.active_tasks
        assert coordinator.active_tasks[task_id].status == "pending"
        
        # 7. Reassign to Node-2
        new_target = coordinator.select_target_node(task_id)
        assert new_target == "node-2"
        assert coordinator.task_node_assignments[task_id] == "node-2"
