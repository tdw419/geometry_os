#!/usr/bin/env python3
"""
Evolution WordPress Hook

Integrates with the Evolution Daemon to auto-publish improvements to WordPress.

This creates a "Semantic Memory" of all self-improvements made by the system.

Usage:
    # In evolution_daemon.py, add this hook:
    from systems.visual_shell.api.evolution_wordpress_hook import EvolutionWordPressHook

    hook = EvolutionWordPressHook()
    hook.on_improvement(cycle, target, improvement, delta)
"""

import json
import logging
import sys
from datetime import datetime
from pathlib import Path
from typing import Optional, Dict, Any

# Add to path for imports
sys.path.insert(0, str(Path(__file__).parent))

try:
    from neural_semantic_publisher import publish_evolution, get_publisher
    PUBLISHER_AVAILABLE = True
except ImportError:
    PUBLISHER_AVAILABLE = False

logger = logging.getLogger("evolution_wp_hook")


class EvolutionWordPressHook:
    """
    Hook that publishes evolution events to WordPress.

    Integrates with:
    - Evolution Daemon v13
    - Neural Semantic Publisher
    - WordPress Semantic District
    """

    def __init__(
        self,
        enabled: bool = True,
        min_delta_threshold: float = 0.05,
        include_rejections: bool = False
    ):
        """
        Initialize the hook.

        Args:
            enabled: Whether to publish events
            min_delta_threshold: Minimum improvement delta to publish
            include_rejections: Whether to publish rejected improvements
        """
        self.enabled = enabled and PUBLISHER_AVAILABLE
        self.min_delta_threshold = min_delta_threshold
        self.include_rejections = include_rejections

        self._published_count = 0
        self._skipped_count = 0

        if self.enabled:
            logger.info("EvolutionWordPressHook initialized")
        else:
            logger.info("EvolutionWordPressHook disabled")

    def on_improvement(
        self,
        cycle: int,
        target: str,
        improvement: str,
        delta: float,
        success: bool = True,
        metrics: Optional[Dict[str, float]] = None
    ) -> bool:
        """
        Called when an improvement is made.

        Args:
            cycle: Evolution cycle number
            target: Target file/component
            improvement: Description of improvement
            delta: Improvement delta (positive = better)
            success: Whether the improvement was accepted
            metrics: Optional metrics

        Returns:
            True if published, False otherwise
        """
        if not self.enabled:
            return False

        # Skip rejections if configured
        if not success and not self.include_rejections:
            logger.debug(f"Skipping rejection: {target}")
            return False

        # Skip small deltas
        if abs(delta) < self.min_delta_threshold:
            logger.debug(f"Skipping small delta: {delta}")
            self._skipped_count += 1
            return False

        # Publish to WordPress
        try:
            from neural_semantic_publisher import EvolutionEvent
            event = EvolutionEvent(
                cycle=cycle,
                target=target,
                improvement=improvement,
                delta=delta,
                success=success,
                metrics=metrics or {}
            )
            result = get_publisher().publish_evolution(event)

            if result:
                self._published_count += 1
                logger.info(f"Published evolution event: cycle={cycle}, target={target}")
                return True
            else:
                self._skipped_count += 1
                return False

        except Exception as e:
            logger.error(f"Failed to publish evolution event: {e}")
            return False

    def on_cycle_complete(
        self,
        cycle: int,
        total_improvements: int,
        total_rejections: int,
        current_target: str
    ) -> bool:
        """
        Called when an evolution cycle completes.

        Publishes a summary if there were significant changes.

        Args:
            cycle: Cycle number
            total_improvements: Total improvements so far
            total_rejections: Total rejections so far
            current_target: Current target being processed

        Returns:
            True if published
        """
        if not self.enabled:
            return False

        # Only publish milestones (every 10 cycles)
        if cycle % 10 != 0:
            return False

        try:
            from neural_semantic_publisher import get_publisher

            title = f"🧬 Evolution Milestone: Cycle {cycle}"
            content = f"""
<h2>Evolution Daemon Status</h2>
<table>
<tr><td><b>Cycle</b></td><td>{cycle}</td></tr>
<tr><td><b>Total Improvements</b></td><td>{total_improvements}</td></tr>
<tr><td><b>Total Rejections</b></td><td>{total_rejections}</td></tr>
<tr><td><b>Success Rate</b></td><td>{(total_improvements / max(1, total_improvements + total_rejections)) * 100:.1f}%</td></tr>
<tr><td><b>Current Target</b></td><td><code>{current_target}</code></td></tr>
</table>

<hr>
<p><i>Evolution Daemon v13 is actively improving the system.</i></p>
"""

            return get_publisher()._publish_with_rate_limit(title, content) is not None

        except Exception as e:
            logger.error(f"Failed to publish cycle summary: {e}")
            return False

    def get_stats(self) -> Dict[str, Any]:
        """Get hook statistics."""
        return {
            "enabled": self.enabled,
            "publisher_available": PUBLISHER_AVAILABLE,
            "published_count": self._published_count,
            "skipped_count": self._skipped_count,
            "min_delta_threshold": self.min_delta_threshold
        }


# Singleton hook instance
_hook: Optional[EvolutionWordPressHook] = None


def get_hook() -> EvolutionWordPressHook:
    """Get or create the global hook instance."""
    global _hook
    if _hook is None:
        _hook = EvolutionWordPressHook()
    return _hook


def on_evolution_improvement(
    cycle: int,
    target: str,
    improvement: str,
    delta: float,
    **kwargs
) -> bool:
    """Convenience function to publish evolution event."""
    return get_hook().on_improvement(cycle, target, improvement, delta, **kwargs)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Evolution WordPress Hook")
    parser.add_argument("--test", action="store_true", help="Test the hook")
    parser.add_argument("--stats", action="store_true", help="Show stats")

    args = parser.parse_args()

    logging.basicConfig(level=logging.INFO)

    hook = get_hook()

    if args.test:
        print("Testing EvolutionWordPressHook...")
        result = hook.on_improvement(
            cycle=48,
            target="geometric_terminal_bridge.py",
            improvement="Test improvement: optimized RGBA encoding",
            delta=0.12,
            metrics={"test_metric": 42.0}
        )
        print(f"Published: {result}")

    if args.stats:
        print(json.dumps(hook.get_stats(), indent=2))
