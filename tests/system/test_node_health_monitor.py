import pytest
import asyncio
import time
from systems.visual_shell.swarm.node_health_monitor import NodeHealthMonitor
from systems.visual_shell.swarm.node_registry import NodeRegistry

class TestNodeHealthMonitor:
    """Tests for the node health monitor."""

    @pytest.fixture
    def registry(self):
        return NodeRegistry()

    @pytest.fixture
    def monitor(self, registry):
        return NodeHealthMonitor(registry=registry, failure_threshold=2)

    @pytest.mark.asyncio
    async def test_node_health_monitor_initialization(self, monitor, registry):
        """NodeHealthMonitor initializes with registry and threshold."""
        assert monitor.registry == registry
        assert monitor.failure_threshold == 2

    @pytest.mark.asyncio
    async def test_heartbeat_liveness_detection(self, monitor, registry):
        """Monitor detects node liveness based on heartbeats."""
        node_id = "node-1"
        await registry.register_node(node_id, {})
        
        # Manually mark as dead by setting last_heartbeat
        registry.nodes[node_id]["last_heartbeat"] = time.time() - 3
        
        # Run check
        dead_nodes = await monitor.check_health()
        
        assert node_id in dead_nodes

    @pytest.mark.asyncio
    async def test_automatic_node_removal(self, monitor, registry):
        """Monitor automatically removes dead nodes from the registry."""
        node_id = "node-1"
        await registry.register_node(node_id, {})
        
        registry.nodes[node_id]["last_heartbeat"] = time.time() - 3
        
        # Start the monitoring task
        monitor_task = asyncio.create_task(monitor.start_monitoring(interval=0.1))
        
        # Give it time to run
        await asyncio.sleep(0.5)
        
        assert node_id not in registry.nodes
        
        # Teardown
        await monitor.stop_monitoring()
        monitor_task.cancel()
