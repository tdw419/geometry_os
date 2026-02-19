import pytest
import asyncio
import time
from systems.visual_shell.swarm.node_registry import NodeRegistry

class TestNodeRegistry:
    """Tests for the swarm node registry."""

    @pytest.fixture
    def registry(self):
        return NodeRegistry(heartbeat_timeout=2)

    @pytest.mark.asyncio
    async def test_node_registry_initialization(self, registry):
        """NodeRegistry initializes with empty nodes and leader."""
        assert registry.nodes == {}
        assert registry.leader_id is None
        assert registry.heartbeat_timeout == 2

    @pytest.mark.asyncio
    async def test_node_registration_success(self, registry):
        """Nodes can register with metadata."""
        node_id = "node-1"
        metadata = {"hostname": "node-1.local", "capabilities": ["scanner"]}
        
        await registry.register_node(node_id, metadata)
        
        assert node_id in registry.nodes
        assert registry.nodes[node_id]["metadata"] == metadata
        assert "last_heartbeat" in registry.nodes[node_id]

    @pytest.mark.asyncio
    async def test_node_heartbeat_updates(self, registry):
        """Node heartbeats update the last_heartbeat timestamp."""
        node_id = "node-1"
        await registry.register_node(node_id, {})
        
        first_heartbeat = registry.nodes[node_id]["last_heartbeat"]
        await asyncio.sleep(0.1)
        
        await registry.update_heartbeat(node_id)
        second_heartbeat = registry.nodes[node_id]["last_heartbeat"]
        
        assert second_heartbeat > first_heartbeat

    @pytest.mark.asyncio
    async def test_node_removal_on_heartbeat_timeout(self, registry):
        """Nodes are removed when their heartbeat times out."""
        node_id = "node-1"
        await registry.register_node(node_id, {})
        
        # Manually set last_heartbeat to the past
        registry.nodes[node_id]["last_heartbeat"] = time.time() - 3
        
        await registry.check_timeouts()
        assert node_id not in registry.nodes

    @pytest.mark.asyncio
    async def test_leader_election(self, registry):
        """Leader is elected from registered nodes (simple Raft-style mock)."""
        await registry.register_node("node-1", {"priority": 10})
        await registry.register_node("node-2", {"priority": 20})
        
        # Trigger election
        leader_id = await registry.elect_leader()
        
        # Should pick highest priority or first registered for simplicity
        assert leader_id in ["node-1", "node-2"]
        assert registry.leader_id == leader_id

    @pytest.mark.asyncio
    async def test_leader_reelection_on_failure(self, registry):
        """New leader is elected when old leader times out."""
        await registry.register_node("node-1", {})
        await registry.register_node("node-2", {})
        
        registry.leader_id = "node-1"
        
        # Fail node-1
        registry.nodes["node-1"]["last_heartbeat"] = time.time() - 3
        await registry.check_timeouts()
        
        assert "node-1" not in registry.nodes
        assert registry.leader_id != "node-1"
        assert registry.leader_id == "node-2"
