"""
ScannerSwarm - Coordinates a large cluster of ScannerAgents for map-wide artifact discovery.
"""

import math
import logging
from typing import List, Dict, Any, Optional
from dataclasses import dataclass

logger = logging.getLogger(__name__)

@dataclass
class MapRegion:
    x: float
    y: float
    width: float
    height: float

class ScannerSwarm:
    """
    Manages the distributed scanning of the infinite map.
    Divides the map into regions and assigns them to agents across multiple nodes.
    """

    def __init__(self, node_count: int = 3, agents_per_node: int = 10):
        self.node_count = node_count
        self.agents_per_node = agents_per_node
        self.total_agents = node_count * agents_per_node
        self.regions: List[MapRegion] = []
        
        logger.info(f"ScannerSwarm initialized with {self.total_agents} agents across {node_count} nodes")

    def divide_map(self, width: float, height: float) -> List[MapRegion]:
        """Divide a specified area of the map into regions for agents."""
        # Calculate grid dimensions based on total agents
        cols = int(math.sqrt(self.total_agents))
        rows = math.ceil(self.total_agents / cols)
        
        region_w = width / cols
        region_h = height / rows
        
        self.regions = []
        for r in range(rows):
            for c in range(cols):
                if len(self.regions) < self.total_agents:
                    self.regions.append(MapRegion(
                        x=c * region_w,
                        y=r * region_h,
                        width=region_w,
                        height=region_h
                    ))
        
        logger.info(f"Map divided into {len(self.regions)} regions ({cols}x{rows})")
        return self.regions

    async def dispatch_agents(self, nodes: List[str]) -> Dict[str, str]:
        """Dispatch agents to the available nodes."""
        assignments = {}
        for i in range(self.total_agents):
            agent_id = f"scanner-{i:03d}"
            # Round-robin or block-based node assignment
            node_id = nodes[i % len(nodes)]
            assignments[agent_id] = node_id
            
        logger.info(f"Dispatched {len(assignments)} agents to {len(nodes)} nodes")
        return assignments

    def consolidate_results(self, agent_results: List[List[Dict[str, Any]]]) -> List[Dict[str, Any]]:
        """Deduplicate and combine artifact results from multiple agents."""
        seen_ids = set()
        consolidated = []
        
        for result_list in agent_results:
            for artifact in result_list:
                art_id = artifact.get("id")
                if art_id and art_id not in seen_ids:
                    seen_ids.add(art_id)
                    consolidated.append(artifact)
                    
        logger.info(f"Consolidated results: {len(consolidated)} unique artifacts found")
        return consolidated

    def detect_orphans(self, found_artifacts: List[Dict[str, Any]], 
                       manifest_ids: List[str]) -> List[Dict[str, Any]]:
        """Find artifacts present on the map but missing from the official manifest."""
        manifest_set = set(manifest_ids)
        orphans = [a for a in found_artifacts if a.get("id") not in manifest_set]
        
        logger.warning(f"Detected {len(orphans)} orphan artifacts")
        return orphans

    def analyze_fragmentation(self, cluster: List[Dict[str, Any]]) -> float:
        """Compute spatial fragmentation score for a group of related artifacts."""
        if len(cluster) < 2:
            return 0.0
            
        # Fragmentation = avg distance from centroid / cluster radius?
        # Simpler for now: max distance between any two points
        max_dist = 0.0
        for i in range(len(cluster)):
            for j in range(i + 1, len(cluster)):
                a1, a2 = cluster[i], cluster[j]
                dist = math.sqrt((a1['x'] - a2['x'])**2 + (a1['y'] - a2['y'])**2)
                if dist > max_dist:
                    max_dist = dist
                    
        # Normalize by a constant (e.g., 1000 pixels)
        k_frag = 1000.0
        score = min(1.0, max_dist / k_frag)
        return score
