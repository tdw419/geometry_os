import pytest
import asyncio
from systems.visual_shell.swarm.scanner_swarm import ScannerSwarm, MapRegion

class TestScannerSwarm:
    """Tests for the Distributed Scanner Swarm."""

    @pytest.fixture
    def swarm(self):
        return ScannerSwarm(node_count=3, agents_per_node=10)

    def test_map_region_division(self, swarm):
        """Swarm divides the infinite map into equal regions for agents."""
        # Total area 1000x1000, 30 agents
        # sqrt(30) ~ 5.4 -> cols=5, rows=6
        regions = swarm.divide_map(width=1000, height=1000)
        
        assert len(regions) == 30
        assert regions[0].width == 200.0 # 1000 / 5

    @pytest.mark.asyncio
    async def test_scanner_agent_batch_dispatch(self, swarm):
        """Swarm dispatches agents across multiple nodes."""
        # Mock node registry
        nodes = ["node-1", "node-2", "node-3"]
        
        assigned_agents = await swarm.dispatch_agents(nodes)
        
        assert len(assigned_agents) == 30
        # Check distribution
        node_counts = {}
        for node_id in assigned_agents.values():
            node_counts[node_id] = node_counts.get(node_id, 0) + 1
        
        for node in nodes:
            assert node_counts[node] == 10

    @pytest.mark.asyncio
    async def test_artifact_collection_and_deduplication(self, swarm):
        """Swarm collects artifacts from agents and removes duplicates."""
        agent_results = [
            [{"id": "art-1", "x": 10}, {"id": "art-2", "x": 20}],
            [{"id": "art-2", "x": 20}, {"id": "art-3", "x": 30}]
        ]
        
        total_artifacts = swarm.consolidate_results(agent_results)
        
        assert len(total_artifacts) == 3
        assert "art-2" in [a["id"] for a in total_artifacts]

    def test_orphan_detection(self, swarm):
        """Swarm identifies artifacts that are not tracked in the manifest."""
        manifest = ["art-1", "art-2"]
        found = [{"id": "art-1"}, {"id": "art-2"}, {"id": "art-3"}]
        
        orphans = swarm.detect_orphans(found, manifest)
        assert len(orphans) == 1
        assert orphans[0]["id"] == "art-3"

    def test_fragmentation_analysis(self, swarm):
        """Swarm computes fragmentation score for artifact clusters."""
        # Cluster of related artifacts far apart
        cluster = [
            {"id": "a1", "category": "system", "x": 0, "y": 0},
            {"id": "a2", "category": "system", "x": 1000, "y": 1000}
        ]
        
        score = swarm.analyze_fragmentation(cluster)
        assert score > 0.5 # High fragmentation
