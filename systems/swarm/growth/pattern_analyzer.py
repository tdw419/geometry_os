"""
PatternAnalyzer - Analyze agent performance patterns.

Extracts insights from experiences for self-improvement.
"""

from typing import List, Dict, Any, Optional
from dataclasses import dataclass
from collections import Counter

from systems.swarm.memory.experience import Experience


@dataclass
class PerformanceAnalysis:
    """Results of performance analysis."""
    success_rate: float
    total_experiences: int
    common_failures: List[Dict[str, Any]]
    common_successes: List[Dict[str, Any]]
    avg_completion_time: Optional[float]
    improvement_areas: List[str]
    recommendations: List[str]


class PatternAnalyzer:
    """
    Analyzes experiences to extract performance patterns.

    Provides metrics and recommendations for agent improvement.
    """

    def __init__(self, min_sample_size: int = 3):
        """
        Initialize the analyzer.

        Args:
            min_sample_size: Minimum experiences needed for reliable analysis
        """
        self.min_sample_size = min_sample_size

    def analyze_agent_performance(
        self,
        experiences: List[Experience]
    ) -> Dict[str, Any]:
        """
        Analyze an agent's performance from their experiences.

        Args:
            experiences: List of experiences to analyze

        Returns:
            Dictionary with performance metrics:
            - success_rate: Fraction of successful outcomes
            - common_failures: Most frequent failure types
            - avg_completion_time: Average time (if tracked in metadata)
            - total_count: Total number of experiences
        """
        if not experiences:
            return {
                "success_rate": 0.0,
                "common_failures": [],
                "avg_completion_time": None,
                "total_count": 0,
                "improvement_areas": [],
                "recommendations": ["Collect more experience data"]
            }

        # Count outcomes
        outcomes = Counter(exp.outcome for exp in experiences)
        total = len(experiences)
        successes = outcomes.get("success", 0)

        success_rate = successes / total if total > 0 else 0.0

        # Analyze failures by task type
        failure_by_type: Counter = Counter()
        failure_descriptions: List[str] = []
        for exp in experiences:
            if exp.outcome == "failure":
                failure_by_type[exp.task_type] += 1
                failure_descriptions.append(exp.description)

        # Get most common failure types
        common_failures = [
            {"task_type": task_type, "count": count}
            for task_type, count in failure_by_type.most_common(5)
        ]

        # Analyze successes by task type
        success_by_type: Counter = Counter()
        success_descriptions: List[str] = []
        for exp in experiences:
            if exp.outcome == "success":
                success_by_type[exp.task_type] += 1
                success_descriptions.append(exp.description)

        common_successes = [
            {"task_type": task_type, "count": count}
            for task_type, count in success_by_type.most_common(5)
        ]

        # Calculate average completion time if available
        completion_times = []
        for exp in experiences:
            if "duration" in exp.metadata:
                completion_times.append(exp.metadata["duration"])

        avg_completion_time = None
        if completion_times:
            avg_completion_time = sum(completion_times) / len(completion_times)

        # Identify improvement areas
        improvement_areas = []
        if success_rate < 0.5:
            improvement_areas.append("Overall success rate needs improvement")
        if failure_by_type:
            worst_type = failure_by_type.most_common(1)[0][0]
            improvement_areas.append(f"Focus on improving {worst_type} tasks")

        # Generate recommendations
        recommendations = []
        if len(experiences) < self.min_sample_size:
            recommendations.append("Collect more experience data for reliable analysis")
        if success_rate < 0.7:
            recommendations.append("Review failure patterns and adjust approach")
        if not improvement_areas:
            recommendations.append("Continue current approach, performance looks good")

        return {
            "success_rate": success_rate,
            "common_failures": common_failures,
            "common_successes": common_successes,
            "avg_completion_time": avg_completion_time,
            "total_count": total,
            "improvement_areas": improvement_areas,
            "recommendations": recommendations
        }

    def detect_patterns(
        self,
        experiences: List[Experience],
        window_size: int = 10
    ) -> Dict[str, Any]:
        """
        Detect patterns in recent experiences.

        Looks for trends like improving/degrading success rate,
        recurring failure types, etc.

        Args:
            experiences: List of experiences (should be sorted by time)
            window_size: Number of recent experiences to analyze

        Returns:
            Dictionary with detected patterns
        """
        if len(experiences) < window_size:
            return {"pattern": "insufficient_data", "confidence": 0.0}

        # Get recent and older windows
        recent = experiences[-window_size:]
        older = experiences[-2*window_size:-window_size] if len(experiences) >= 2*window_size else experiences[:-window_size]

        # Calculate success rates
        recent_success_rate = sum(1 for e in recent if e.outcome == "success") / len(recent)
        older_success_rate = sum(1 for e in older if e.outcome == "success") / len(older) if older else 0.5

        # Detect trend
        trend = "stable"
        confidence = 0.5
        if recent_success_rate > older_success_rate + 0.1:
            trend = "improving"
            confidence = min(0.9, recent_success_rate - older_success_rate + 0.5)
        elif recent_success_rate < older_success_rate - 0.1:
            trend = "declining"
            confidence = min(0.9, older_success_rate - recent_success_rate + 0.5)

        # Detect recurring failures
        recent_failures = [e for e in recent if e.outcome == "failure"]
        recurring_types = Counter(e.task_type for e in recent_failures)
        recurring = [
            {"task_type": t, "count": c}
            for t, c in recurring_types.most_common(3)
            if c > 1
        ]

        return {
            "trend": trend,
            "confidence": confidence,
            "recent_success_rate": recent_success_rate,
            "previous_success_rate": older_success_rate,
            "recurring_failures": recurring
        }

    def get_recommendations(
        self,
        experiences: List[Experience],
        current_task_type: Optional[str] = None
    ) -> List[str]:
        """
        Get actionable recommendations based on experience analysis.

        Args:
            experiences: List of past experiences
            current_task_type: Optional current task type for specific advice

        Returns:
            List of recommendation strings
        """
        analysis = self.analyze_agent_performance(experiences)
        recommendations = analysis.get("recommendations", [])

        # Add task-specific recommendations if provided
        if current_task_type:
            type_experiences = [e for e in experiences if e.task_type == current_task_type]
            if type_experiences:
                type_success_rate = sum(1 for e in type_experiences if e.outcome == "success") / len(type_experiences)
                if type_success_rate < 0.5:
                    recommendations.append(
                        f"Consider alternative approach for {current_task_type} tasks"
                    )

        return recommendations
