"""
Goal Synthesizer for Intrinsic Curiosity Engine

Transforms EntropySpots into actionable AutonomousGoals using goal templates
and health-based synthesis strategies.
"""

from dataclasses import dataclass, field
from typing import Dict, List, Any, Optional
from datetime import datetime, timezone
import uuid

from systems.sisyphus.entropy_mapper import EntropySpot


# Goal templates with priority bases
COLD_GOAL_TEMPLATES = [
    {
        "goal_type": "eliminate_dead_code",
        "priority_base": 0.6,
        "rationale_template": "Function {function_name} has {call_count} calls (threshold: {threshold}), potential dead code"
    },
    {
        "goal_type": "speculative_rewrite",
        "priority_base": 0.4,
        "rationale_template": "Function {function_name} rarely used ({call_count} calls), candidate for speculative rewrite"
    }
]

HOT_GOAL_TEMPLATES = [
    {
        "goal_type": "kernel_rewrite",
        "priority_base": 0.9,
        "rationale_template": "Function {function_name} is a critical bottleneck ({call_count} calls, {avg_time_ms:.1f}ms avg)"
    },
    {
        "goal_type": "optimize_hot",
        "priority_base": 0.8,
        "rationale_template": "Function {function_name} needs optimization ({call_count} calls, {avg_time_ms:.1f}ms avg)"
    },
    {
        "goal_type": "parallelize",
        "priority_base": 0.7,
        "rationale_template": "Function {function_name} ({call_count} calls, {avg_time_ms:.1f}ms avg) may benefit from parallelization"
    }
]

COGNITIVE_GOAL_TEMPLATES = [
    {
        "goal_type": "brain_fine_tuning",
        "priority_base": 0.85,
        "rationale_template": "Brain quality drift detected in {sector} (Fitness: {fitness:.2f}). Mutate weight atlas to restore coherence."
    },
    {
        "goal_type": "shader_evolution",
        "priority_base": 0.75,
        "rationale_template": "WGSL shader performance bottleneck in {shader_type}. Speculative rewrite to improve inference throughput."
    },
    {
        "goal_type": "cognitive_restoration",
        "priority_base": 0.95,
        "rationale_template": "Critical coherence failure (Fitness: {fitness:.2f}). Emergency weight reset or sector mutation required."
    }
]


@dataclass(order=False)
class AutonomousGoal:
    """
    Represents an autonomous goal derived from entropy analysis.

    Goals are actionable tasks that the system can execute to improve
    code quality, performance, or reduce technical debt.
    """

    goal_id: str
    goal_type: str
    target: str
    rationale: str
    priority: float
    entropy_score: float
    created_at: str
    metrics: Dict[str, Any] = field(default_factory=dict)

    def __lt__(self, other: "AutonomousGoal") -> bool:
        """Sort by priority descending (higher priority = more important)."""
        return self.priority > other.priority

    def to_task_dict(self) -> Dict[str, Any]:
        """
        Convert goal to task dictionary format for execution.

        Returns:
            Dictionary with goal fields suitable for task scheduling
        """
        return {
            "goal_id": self.goal_id,
            "goal_type": self.goal_type,
            "target": self.target,
            "rationale": self.rationale,
            "priority": self.priority,
            "entropy_score": self.entropy_score,
            "created_at": self.created_at,
            "metrics": self.metrics
        }


class GoalSynthesizer:
    """
    Synthesizes autonomous goals from entropy spots.

    Transforms cold spots (underused code) and hot spots (bottlenecks)
    into actionable goals using templates and health-based strategies.
    """

    def __init__(self, min_entropy_score: float = 0.5):
        """
        Initialize the goal synthesizer.

        Args:
            min_entropy_score: Minimum entropy score to generate goals (0.0-1.0)
        """
        self.min_entropy_score = min_entropy_score
        self._goal_counter = 0

    def _generate_goal_id(self) -> str:
        """
        Generate a unique goal ID.

        Format: auto-{counter:04d}-{uuid[:8]}

        Returns:
            Unique goal ID string
        """
        self._goal_counter += 1
        short_uuid = uuid.uuid4().hex[:8]
        return f"auto-{self._goal_counter:04d}-{short_uuid}"

    def synthesize_from_spot(self, spot: EntropySpot) -> List[AutonomousGoal]:
        """
        Synthesize goals from a single entropy spot.

        Args:
            spot: EntropySpot to generate goals from

        Returns:
            List of AutonomousGoal objects
        """
        # Filter by minimum entropy score
        if spot.score < self.min_entropy_score:
            return []

        goals: List[AutonomousGoal] = []
        created_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

        # Select templates based on entropy type
        if spot.entropy_type == "cold":
            templates = COLD_GOAL_TEMPLATES
        else:
            templates = HOT_GOAL_TEMPLATES

        for template in templates:
            # Format rationale with spot metrics
            metrics = spot.metrics.copy()
            metrics["function_name"] = spot.function_name or "unknown"

            rationale = template["rationale_template"].format(**metrics)

            # Calculate priority: base + entropy score modifier
            priority = min(1.0, template["priority_base"] + (spot.score * 0.1))

            goal = AutonomousGoal(
                goal_id=self._generate_goal_id(),
                goal_type=template["goal_type"],
                target=spot.file_path,
                rationale=rationale,
                priority=priority,
                entropy_score=spot.score,
                created_at=created_at,
                metrics=spot.metrics.copy()
            )
            goals.append(goal)

        return goals

    def synthesize_batch(self, spots: List[EntropySpot]) -> List[AutonomousGoal]:
        """
        Synthesize goals from multiple entropy spots.

        Args:
            spots: List of EntropySpot objects

        Returns:
            List of AutonomousGoal objects sorted by priority (descending)
        """
        all_goals: List[AutonomousGoal] = []

        for spot in spots:
            goals = self.synthesize_from_spot(spot)
            all_goals.extend(goals)

        # Sort by priority descending
        all_goals.sort()

        return all_goals

    def synthesize_from_brain_metrics(
        self,
        fitness_score: float,
        latency_ms: float,
        hot_sectors: List[str]
    ) -> List[AutonomousGoal]:
        """
        Synthesize cognitive goals from brain performance/quality metrics.

        Args:
            fitness_score: Brain fitness score (0.0 to 1.0)
            latency_ms: Average inference latency in ms
            hot_sectors: List of brain sectors with highest attention weight/error

        Returns:
            List of brain-related AutonomousGoal objects
        """
        goals: List[AutonomousGoal] = []
        created_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

        # 1. Check for Quality Drift
        if fitness_score < 0.6:
            template = next(t for t in COGNITIVE_GOAL_TEMPLATES if t["goal_type"] == "cognitive_restoration")
            rationale = template["rationale_template"].format(fitness=fitness_score)
            priority = 0.95 + (1.0 - fitness_score) * 0.05
            
            goals.append(AutonomousGoal(
                goal_id=self._generate_goal_id(),
                goal_type="cognitive_restoration",
                target="tinystories_brain.rts.png",
                rationale=rationale,
                priority=min(1.0, priority),
                entropy_score=1.0 - fitness_score,
                created_at=created_at,
                metrics={"fitness": fitness_score, "latency": latency_ms}
            ))
        elif fitness_score < 0.9:
            # Regular fine-tuning
            template = next(t for t in COGNITIVE_GOAL_TEMPLATES if t["goal_type"] == "brain_fine_tuning")
            sector = hot_sectors[0] if hot_sectors else "attention_layer_0"
            rationale = template["rationale_template"].format(sector=sector, fitness=fitness_score)
            
            goals.append(AutonomousGoal(
                goal_id=self._generate_goal_id(),
                goal_type="brain_fine_tuning",
                target=f"brain_atlas:{sector}",
                rationale=rationale,
                priority=0.85,
                entropy_score=0.9 - fitness_score,
                created_at=created_at,
                metrics={"fitness": fitness_score, "sector": sector}
            ))

        # 2. Check for Performance Issues
        if latency_ms > 200.0:  # Threshold for "slow" inference
            template = next(t for t in COGNITIVE_GOAL_TEMPLATES if t["goal_type"] == "shader_evolution")
            shader_type = "attention.wgsl" if latency_ms > 500.0 else "ffn.wgsl"
            rationale = template["rationale_template"].format(shader_type=shader_type)
            
            goals.append(AutonomousGoal(
                goal_id=self._generate_goal_id(),
                goal_type="shader_evolution",
                target=f"shaders/{shader_type}",
                rationale=rationale,
                priority=0.80,
                entropy_score=min(1.0, (latency_ms - 200) / 800),
                created_at=created_at,
                metrics={"latency": latency_ms, "shader": shader_type}
            ))

        return goals

    def synthesize_from_health_score(
        self,
        health_score: float,
        cold_spots: List[EntropySpot],
        hot_spots: List[EntropySpot]
    ) -> List[AutonomousGoal]:
        """
        Synthesize goals based on system health score.

        Strategy:
        - health < 0.5: Generate goals from all spots (system needs help)
        - health < 0.8: Top 3 cold + top 3 hot spots
        - health >= 0.8: Only critical hot spots (score > 0.9)

        Args:
            health_score: System health score (0.0-1.0)
            cold_spots: List of cold EntropySpot objects
            hot_spots: List of hot EntropySpot objects

        Returns:
            List of AutonomousGoal objects sorted by priority
        """
        # Sort spots by score (descending) - they're already comparable
        sorted_cold = sorted(cold_spots)
        sorted_hot = sorted(hot_spots)

        selected_spots: List[EntropySpot] = []

        if health_score < 0.5:
            # System needs help - use all spots
            selected_spots = sorted_cold + sorted_hot
        elif health_score < 0.8:
            # Moderate health - top 3 of each
            selected_spots = sorted_cold[:3] + sorted_hot[:3]
        else:
            # Good health - only critical hot spots
            selected_spots = [s for s in sorted_hot if s.score > 0.9]

        return self.synthesize_batch(selected_spots)
