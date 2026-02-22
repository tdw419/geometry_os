"""
VerificationAgent Agent - Validates Tectonic Optimization quality and health.
Part of the Tectonic Optimization system.
"""

import math
import logging
import time
from typing import Dict, List, Tuple, Any

logger = logging.getLogger(__name__)

class VerificationAgent:
    """
    Measures the effectiveness of tectonic migrations.
    Computes system-wide locality scores and detects regressions.
    """

    def __init__(self):
        self.metrics_history: List[Dict[str, Any]] = []
        logger.info("VerificationAgent initialized")

    def compute_system_score(self, state: Dict[str, Any]) -> float:
        """
        Computes a score (0.0 to 1.0) representing map locality quality.
        Higher is better.
        """
        positions = state.get("positions", {})
        relationships = state.get("relationships", [])
        
        if not relationships:
            return 1.0
            
        total_weight = 0
        weighted_sum = 0.0
        
        for u, v, w in relationships:
            p1 = positions.get(u)
            p2 = positions.get(v)
            
            if not p1 or not p2:
                continue
                
            dist = math.sqrt((p1.get('x', 0) - p2.get('x', 0))**2 + 
                             (p1.get('y', 0) - p2.get('y', 0))**2)
            
            # Locality score for pair: weight / (dist + k)
            # Related files close together contribute high score
            k = 100.0
            pair_score = w / (dist + k)
            
            weighted_sum += pair_score
            total_weight += w
            
        if total_weight == 0:
            return 1.0
            
        return weighted_sum / total_weight

    def compare_states(self, before: Dict[str, Any], after: Dict[str, Any]) -> float:
        """Compute relative improvement (positive = better)."""
        score_before = self.compute_system_score(before)
        score_after = self.compute_system_score(after)
        
        if score_before == 0:
            return score_after
            
        return (score_after - score_before) / score_before

    def record_optimization(self, opt_id: str, score_before: float, score_after: float):
        """Record results of an optimization pass."""
        improvement = (score_after - score_before) / score_before if score_before > 0 else 0
        
        entry = {
            "id": opt_id,
            "before": score_before,
            "after": score_after,
            "improvement": improvement,
            "timestamp": time.time()
        }
        self.metrics_history.append(entry)
        logger.info(f"Recorded opt {opt_id}: {improvement*100:.1f}% improvement")

    def generate_report(self) -> str:
        """Generate a text report of optimization history."""
        if not self.metrics_history:
            return "No optimization data available."
            
        lines = ["=== Tectonic Optimization Report ==="]
        for entry in self.metrics_history:
            lines.append(f"Pass {entry['id']}: Improvement {entry['improvement']*100:.1f}% "
                         f"({entry['before']:.3f} -> {entry['after']:.3f})")
            
        return "\n".join(lines)
