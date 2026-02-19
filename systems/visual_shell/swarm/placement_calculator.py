"""
PlacementCalculator Agent - Computes optimal file coordinates using force-directed layout.
Part of the Tectonic Optimization system.
"""

import math
import logging
from typing import Dict, List, Tuple, Any

logger = logging.getLogger(__name__)

class PlacementCalculator:
    """
    Simulates a physics-based layout engine for files on the infinite map.
    Related files attract; all files repel to prevent overlap.
    """

    def __init__(self, k_attract: float = 0.1, k_repel: float = 1000.0, alpha: float = 0.5):
        self.k_attract = k_attract
        self.k_repel = k_repel
        self.alpha = alpha # Learning rate/step size
        self.bounds: Optional[Dict[str, float]] = None
        
        logger.info(f"PlacementCalculator initialized: k_attr={k_attract}, k_repel={k_repel}")

    def compute_step(self, positions: Dict[str, Dict[str, float]], 
                     relationships: List[Tuple[str, str, int]]) -> Dict[str, Dict[str, float]]:
        """Perform one iteration of the force-directed simulation."""
        forces = {f: {'x': 0.0, 'y': 0.0} for f in positions}
        
        # 1. Repulsive Forces (O(N^2) - all nodes repel)
        file_ids = list(positions.keys())
        for i in range(len(file_ids)):
            for j in range(i + 1, len(file_ids)):
                f1, f2 = file_ids[i], file_ids[j]
                p1, p2 = positions[f1], positions[f2]
                
                dx = p1['x'] - p2['x']
                dy = p1['y'] - p2['y']
                dist_sq = dx*dx + dy*dy + 0.01 # Avoid div by zero
                
                # F_repel = k / dist^2
                force_mag = self.k_repel / dist_sq
                
                angle = math.atan2(dy, dx)
                fx = math.cos(angle) * force_mag
                fy = math.sin(angle) * force_mag
                
                forces[f1]['x'] += fx
                forces[f1]['y'] += fy
                forces[f2]['x'] -= fx
                forces[f2]['y'] -= fy

        # 2. Attractive Forces (Only related nodes)
        for u, v, weight in relationships:
            if u not in positions or v not in positions:
                continue
                
            p1, p2 = positions[u], positions[v]
            dx = p2['x'] - p1['x']
            dy = p2['y'] - p1['y']
            dist = math.sqrt(dx*dx + dy*dy)
            
            # F_attr = weight * k * dist
            force_mag = weight * self.k_attract * dist
            
            angle = math.atan2(dy, dx)
            fx = math.cos(angle) * force_mag
            fy = math.sin(angle) * force_mag
            
            forces[u]['x'] += fx
            forces[u]['y'] += fy
            forces[v]['x'] -= fx
            forces[v]['y'] -= fy

        # 3. Apply Forces and Bounds
        new_positions = {}
        for f, pos in positions.items():
            nx = pos['x'] + self.alpha * forces[f]['x']
            ny = pos['y'] + self.alpha * forces[f]['y']
            
            # Constraints
            if self.bounds:
                nx = max(self.bounds['x_min'], min(nx, self.bounds['x_max']))
                ny = max(self.bounds['y_min'], min(ny, self.bounds['y_max']))
                
            new_positions[f] = {'x': nx, 'y': ny}
            
        return new_positions

    def generate_plan(self, positions: Dict[str, Dict[str, float]], 
                      relationships: List[Tuple[str, str, int]], 
                      iterations: int = 50) -> List[Dict[str, Any]]:
        """Run multiple steps and generate a move plan."""
        curr_positions = positions.copy()
        for _ in range(iterations):
            curr_positions = self.compute_step(curr_positions, relationships)
            
        plan = []
        for f, pos in curr_positions.items():
            orig = positions[f]
            dist = math.sqrt((pos['x'] - orig['x'])**2 + (pos['y'] - orig['y'])**2)
            
            # Only record significant moves
            if dist > 1.0:
                plan.append({
                    "file_id": f,
                    "target_x": pos['x'],
                    "target_y": pos['y'],
                    "distance": dist
                })
                
        # Sort plan by distance (largest moves first)
        plan.sort(key=lambda x: x["distance"], reverse=True)
        return plan
