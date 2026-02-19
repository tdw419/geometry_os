"""
FragmentationDetector Agent - Identifies locality gaps in file placement.
Part of the Tectonic Optimization system.
"""

import math
import logging
from typing import Dict, List, Tuple, Any, Set

logger = logging.getLogger(__name__)

class FragmentationDetector:
    """
    Detects when related files are spatially separated on the infinite map.
    Identifies "fragmented" clusters that need tectonic migration.
    """

    def __init__(self):
        self.file_positions: Dict[str, Dict[str, float]] = {}
        self.relationships: List[Tuple[str, str, int]] = []
        
        logger.info("FragmentationDetector initialized")

    def find_related_groups(self, relationships: List[Tuple[str, str, int]]) -> List[Set[str]]:
        """Identify connected components in the file relationship graph."""
        adj: Dict[str, Set[str]] = {}
        all_files = set()
        
        for u, v, w in relationships:
            if u not in adj: adj[u] = set()
            if v not in adj: adj[v] = set()
            adj[u].add(v)
            adj[v].add(u)
            all_files.add(u)
            all_files.add(v)
            
        visited = set()
        groups = []
        
        for f in all_files:
            if f not in visited:
                # Start a new BFS/DFS
                group = set()
                stack = [f]
                while stack:
                    curr = stack.pop()
                    if curr not in visited:
                        visited.add(curr)
                        group.add(curr)
                        stack.extend(adj.get(curr, set()) - visited)
                groups.append(group)
                
        return groups

    def get_distance(self, file_a: str, file_b: str) -> float:
        """Compute spatial distance between two files."""
        p1 = self.file_positions.get(file_a)
        p2 = self.file_positions.get(file_b)
        
        if not p1 or not p2:
            return float('inf')
            
        return math.sqrt((p1['x'] - p2['x'])**2 + (p1['y'] - p2['y'])**2)

    def compute_fragmentation_score(self, file_a: str, file_b: str, weight: int) -> float:
        """
        Compute fragmentation score for a pair of files.
        Score = Weight * Distance / K
        Higher score means more fragmented (needs optimization).
        """
        dist = self.get_distance(file_a, file_b)
        if dist == float('inf'):
            return 0.0
            
        # Normalize: high weight + high distance = high score
        # Using a sigmoid-like scaling for distance
        k_dist = 500.0 # Normalizing constant for distance
        normalized_dist = dist / (dist + k_dist)
        
        return weight * normalized_dist

    def get_optimization_targets(self, relationships: List[Tuple[str, str, int]], limit: int = 10) -> List[Tuple[str, str, float]]:
        """Identify the top-N most fragmented relationships."""
        scores = []
        for u, v, w in relationships:
            score = self.compute_fragmentation_score(u, v, w)
            scores.append((u, v, score))
            
        # Sort by score descending
        scores.sort(key=lambda x: x[2], reverse=True)
        return scores[:limit]

    def update_positions(self, positions: Dict[str, Dict[str, float]]):
        """Update internal map of file positions."""
        self.file_positions.update(positions)
