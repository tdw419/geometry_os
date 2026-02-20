#!/usr/bin/env python3
"""
Neural Semantic Publisher - Evolution + Geometric Terminal → WordPress Integration

This module provides the bridge between:
- Evolution Daemon events → WordPress posts (improvement logs)
- Geometric Terminal events → WordPress posts (terminal state)
- Neural Substrate → WordPress pages (living documentation)

Architecture:
┌──────────────────────┐     ┌──────────────────────┐     ┌──────────────────────┐
│ Evolution Daemon     │ ──► │ NeuralSemanticPub    │ ──► │ WordPress District   │
│ (improvements)       │     │ publish_evolution()  │     │ (semantic memory)    │
└──────────────────────┘     └──────────────────────┘     └──────────────────────┘
                                      ▲
                                      │
┌──────────────────────┐              │
│ Geometric Terminal   │ ─────────────┘
│ (cell events)        │     publish_terminal_event()
└──────────────────────┘

Usage:
    from systems.visual_shell.api.neural_semantic_publisher import (
        NeuralSemanticPublisher, publish_evolution, publish_terminal_event
    )

    # Publish evolution improvement
    publish_evolution(
        cycle=48,
        target="geometric_terminal_bridge.py",
        improvement="Optimized RGBA encoding for 15% faster render",
        delta=0.12
    )

    # Publish terminal event
    publish_terminal_event(
        tile_id=0,
        event="texture_rendered",
        cells_updated=124,
        grid_size=(32, 32)
    )
"""

import json
import logging
import time
import sys
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Optional, Dict, Any, List, Tuple

# Add wordpress_zone to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent / "wordpress_zone"))

try:
    from publish_to_wp import publish_to_wordpress
    WORDPRESS_AVAILABLE = True
except ImportError:
    WORDPRESS_AVAILABLE = False
    logging.warning("WordPress publishing not available - semantic memory disabled")

logger = logging.getLogger("neural_semantic_publisher")


@dataclass
class EvolutionEvent:
    """Represents an evolution daemon improvement event."""
    cycle: int
    target: str
    improvement: str
    delta: float
    timestamp: str = field(default_factory=lambda: datetime.utcnow().isoformat())
    success: bool = True
    metrics: Dict[str, float] = field(default_factory=dict)


@dataclass
class TerminalEvent:
    """Represents a geometric terminal event."""
    tile_id: int
    event: str  # texture_rendered, pty_feed, cell_update, etc.
    cells_updated: int = 0
    grid_size: Tuple[int, int] = (0, 0)
    cursor_pos: Tuple[int, int] = (0, 0)
    timestamp: str = field(default_factory=lambda: datetime.utcnow().isoformat())


class NeuralSemanticPublisher:
    """
    Publishes neural substrate events to WordPress semantic memory.

    This creates a human-readable external memory of:
    - Evolution improvements (self-modification history)
    - Terminal events (geometric state changes)
    - Neural substrate documentation (living architecture)
    """

    def __init__(
        self,
        enabled: bool = True,
        rate_limit_seconds: float = 30.0,
        min_delta_threshold: float = 0.01,
        visual_bridge_port: int = 8768
    ):
        """
        Initialize the semantic publisher.

        Args:
            enabled: Whether publishing is enabled
            rate_limit_seconds: Minimum seconds between posts
            min_delta_threshold: Minimum improvement delta to publish
            visual_bridge_port: Port for Visual Bridge telemetry
        """
        self.enabled = enabled and WORDPRESS_AVAILABLE
        self.rate_limit_seconds = rate_limit_seconds
        self.min_delta_threshold = min_delta_threshold
        self.visual_bridge_port = visual_bridge_port

        self._last_publish_time = 0.0
        self._event_queue: List[Dict[str, Any]] = []
        self._stats = {
            "evolution_posts": 0,
            "terminal_posts": 0,
            "total_posts": 0,
            "rate_limited": 0
        }

        if self.enabled:
            logger.info("NeuralSemanticPublisher initialized (WordPress available)")
        else:
            logger.info("NeuralSemanticPublisher initialized (publishing disabled)")

    def _check_rate_limit(self) -> bool:
        """Check if we can publish (respects rate limit)."""
        elapsed = time.time() - self._last_publish_time
        if elapsed < self.rate_limit_seconds:
            self._stats["rate_limited"] += 1
            return False
        return True

    def _publish_with_rate_limit(self, title: str, content: str, post_type: str = "post") -> Optional[Dict]:
        """Publish with rate limiting."""
        if not self.enabled:
            logger.debug(f"Publishing disabled, skipping: {title}")
            return None

        if not self._check_rate_limit():
            logger.debug(f"Rate limited, queuing: {title}")
            self._event_queue.append({"title": title, "content": content, "type": post_type})
            return None

        result = publish_to_wordpress(title, content, post_type)
        if result:
            self._last_publish_time = time.time()
            self._stats["total_posts"] += 1

            # Send visual bridge pulse
            self._send_visual_pulse(title)

        return result

    def _send_visual_pulse(self, event_type: str):
        """Send a telemetry pulse to Visual Bridge."""
        try:
            import requests
            pulse = {
                "type": "semantic_publish",
                "event": event_type,
                "timestamp": datetime.utcnow().isoformat()
            }
            # Fire and forget
            requests.post(f"http://localhost:{self.visual_bridge_port}/pulse", json=pulse, timeout=1)
        except Exception:
            pass  # Visual Bridge is optional

    def publish_evolution(self, event: EvolutionEvent) -> Optional[Dict]:
        """
        Publish an evolution improvement event.

        Args:
            event: Evolution event details

        Returns:
            WordPress response or None
        """
        # Skip if delta is too small
        if abs(event.delta) < self.min_delta_threshold:
            logger.debug(f"Skipping small delta: {event.delta}")
            return None

        title = f"🧬 Evolution Cycle {event.cycle}: {Path(event.target).stem}"

        content = f"""
<h2>Self-Improvement Event</h2>
<table>
<tr><td><b>Cycle</b></td><td>{event.cycle}</td></tr>
<tr><td><b>Target</b></td><td><code>{event.target}</code></td></tr>
<tr><td><b>Delta</b></td><td>{event.delta:+.4f}</td></tr>
<tr><td><b>Status</b></td><td>{"✅ Success" if event.success else "❌ Rejected"}</td></tr>
<tr><td><b>Timestamp</b></td><td>{event.timestamp}</td></tr>
</table>

<h3>Improvement</h3>
<p>{event.improvement}</p>
"""

        if event.metrics:
            content += "<h3>Metrics</h3><ul>"
            for key, value in event.metrics.items():
                content += f"<li><b>{key}</b>: {value}</li>"
            content += "</ul>"

        content += """
<hr>
<p><i>This improvement was automatically generated by the Evolution Daemon v13.</i></p>
<p><i>"The Screen is the Hard Drive. The Website is the Memory."</i></p>
"""

        result = self._publish_with_rate_limit(title, content)
        if result:
            self._stats["evolution_posts"] += 1

        return result

    def publish_terminal_event(self, event: TerminalEvent) -> Optional[Dict]:
        """
        Publish a geometric terminal event.

        Args:
            event: Terminal event details

        Returns:
            WordPress response or None
        """
        title = f"🖥️ Terminal {event.tile_id}: {event.event}"

        content = f"""
<h2>Geometric Terminal Event</h2>
<table>
<tr><td><b>Tile ID</b></td><td>{event.tile_id}</td></tr>
<tr><td><b>Event</b></td><td>{event.event}</td></tr>
<tr><td><b>Grid Size</b></td><td>{event.grid_size[0]}×{event.grid_size[1]}</td></tr>
<tr><td><b>Cells Updated</b></td><td>{event.cells_updated}</td></tr>
<tr><td><b>Cursor Position</b></td><td>({event.cursor_pos[0]}, {event.cursor_pos[1]})</td></tr>
<tr><td><b>Timestamp</b></td><td>{event.timestamp}</td></tr>
</table>

<h3>PixelRTS v3 Encoding</h3>
<p>Terminal cells are encoded as RGBA pixels:</p>
<ul>
<li><b>R</b>: ASCII character (0-127)</li>
<li><b>G</b>: Foreground color (0-15)</li>
<li><b>B</b>: Background color (0-15)</li>
<li><b>A</b>: Style flags</li>
</ul>

<hr>
<p><i>This event was generated by the Geometric Terminal Bridge.</i></p>
"""

        result = self._publish_with_rate_limit(title, content)
        if result:
            self._stats["terminal_posts"] += 1

        return result

    def publish_neural_documentation(
        self,
        title: str,
        architecture: str,
        components: List[Dict[str, str]],
        status: str = "Active"
    ) -> Optional[Dict]:
        """
        Publish living documentation for neural substrate.

        Args:
            title: Documentation title
            architecture: Architecture description
            components: List of component descriptions
            status: System status

        Returns:
            WordPress response or None
        """
        content = f"""
<h2>Neural Substrate Documentation</h2>
<p><b>Status:</b> {status}</p>
<p><b>Updated:</b> {datetime.utcnow().isoformat()}</p>

<h3>Architecture</h3>
<p>{architecture}</p>

<h3>Components</h3>
<table>
<tr><th>Component</th><th>Description</th><th>Path</th></tr>
"""

        for comp in components:
            content += f"""
<tr>
<td><b>{comp.get('name', 'Unknown')}</b></td>
<td>{comp.get('description', '')}</td>
<td><code>{comp.get('path', '')}</code></td>
</tr>
"""

        content += """
</table>

<hr>
<p><i>This documentation is automatically maintained by the Neural Semantic Publisher.</i></p>
<p><i>Query via SynapticQueryEngine or browse at localhost:8080</i></p>
"""

        return self._publish_with_rate_limit(title, content, post_type="page")

    def get_stats(self) -> Dict[str, Any]:
        """Get publisher statistics."""
        return {
            **self._stats,
            "enabled": self.enabled,
            "wordpress_available": WORDPRESS_AVAILABLE,
            "queue_size": len(self._event_queue),
            "rate_limit_seconds": self.rate_limit_seconds
        }

    def flush_queue(self) -> int:
        """Flush queued events (best effort)."""
        if not self._event_queue:
            return 0

        flushed = 0
        while self._event_queue and self._check_rate_limit():
            event = self._event_queue.pop(0)
            result = publish_to_wordpress(event["title"], event["content"], event.get("type", "post"))
            if result:
                self._last_publish_time = time.time()
                flushed += 1

        return flushed


# Global publisher instance
_publisher: Optional[NeuralSemanticPublisher] = None


def get_publisher() -> NeuralSemanticPublisher:
    """Get or create the global publisher instance."""
    global _publisher
    if _publisher is None:
        _publisher = NeuralSemanticPublisher()
    return _publisher


# Convenience functions
def publish_evolution(
    cycle: int,
    target: str,
    improvement: str,
    delta: float,
    metrics: Optional[Dict[str, float]] = None
) -> Optional[Dict]:
    """Publish an evolution event."""
    event = EvolutionEvent(
        cycle=cycle,
        target=target,
        improvement=improvement,
        delta=delta,
        metrics=metrics or {}
    )
    return get_publisher().publish_evolution(event)


def publish_terminal_event(
    tile_id: int,
    event: str,
    cells_updated: int = 0,
    grid_size: Tuple[int, int] = (0, 0),
    cursor_pos: Tuple[int, int] = (0, 0)
) -> Optional[Dict]:
    """Publish a terminal event."""
    term_event = TerminalEvent(
        tile_id=tile_id,
        event=event,
        cells_updated=cells_updated,
        grid_size=grid_size,
        cursor_pos=cursor_pos
    )
    return get_publisher().publish_terminal_event(term_event)


# Demo
if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Neural Semantic Publisher")
    parser.add_argument("--demo", action="store_true", help="Run demo")
    parser.add_argument("--evolution", action="store_true", help="Publish test evolution")
    parser.add_argument("--terminal", action="store_true", help="Publish test terminal event")
    parser.add_argument("--stats", action="store_true", help="Show stats")

    args = parser.parse_args()

    logging.basicConfig(level=logging.INFO)

    publisher = get_publisher()

    if args.demo or not (args.evolution or args.terminal or args.stats):
        # Demo: publish both types
        print("Running Neural Semantic Publisher demo...")

        publish_evolution(
            cycle=48,
            target="geometric_terminal_bridge.py",
            improvement="Optimized RGBA cell encoding for 15% faster Hilbert traversal",
            delta=0.12,
            metrics={"render_time_ms": 45.2, "memory_kb": 512}
        )

        time.sleep(31)  # Wait for rate limit

        publish_terminal_event(
            tile_id=0,
            event="texture_rendered",
            cells_updated=124,
            grid_size=(32, 32),
            cursor_pos=(10, 5)
        )

    if args.evolution:
        publish_evolution(
            cycle=100,
            target="test.py",
            improvement="Test improvement",
            delta=0.05
        )

    if args.terminal:
        publish_terminal_event(
            tile_id=1,
            event="test_event",
            cells_updated=50
        )

    if args.stats:
        print(json.dumps(publisher.get_stats(), indent=2))
