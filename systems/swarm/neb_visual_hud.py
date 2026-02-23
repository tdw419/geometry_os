"""
NEB Visual HUD - Visual tracking for Neural Event Bus.

Provides real-time visualization data for:
- Event ripples: Expanding circles with fading opacity
- Agent glows: Activity-based glow effects with decay

Task 7 of NEB implementation plan.
"""

import time
from dataclasses import dataclass, field
from typing import List, Dict, Any, Optional

from systems.swarm.neb_bus import NEBBus
from systems.swarm.neb_signal import NEBSignal


@dataclass
class Ripple:
    """
    Represents an animated ripple effect for event visualization.

    Ripples expand outward from the event source position with
    gradually decreasing opacity until they fade out completely.
    """
    topic: str
    source_id: str
    x: float
    y: float
    radius: float = 0.0
    max_radius: float = 100.0
    opacity: float = 1.0
    created_at: float = field(default_factory=time.time)
    expansion_rate: float = 50.0  # pixels per second

    def update(self, current_time: float) -> None:
        """Update ripple radius and opacity based on elapsed time."""
        elapsed = current_time - self.created_at
        self.radius = min(self.expansion_rate * elapsed, self.max_radius)

        # Opacity decreases as ripple expands (0 to max_radius maps to 1.0 to 0.0)
        if self.max_radius > 0:
            self.opacity = max(0.0, 1.0 - (self.radius / self.max_radius))


@dataclass
class AgentGlow:
    """
    Represents an agent's activity glow effect.

    Glow intensity increases with agent activity and decays over time.
    Different topic types may have different visual representations.
    """
    agent_id: str
    intensity: float = 0.0
    topic_type: str = ""
    decay_rate: float = 0.5  # intensity units per second
    last_activity: float = field(default_factory=time.time)

    def update(self, current_time: float) -> None:
        """Apply decay to intensity based on elapsed time."""
        elapsed = current_time - self.last_activity
        self.intensity = max(0.0, self.intensity - (self.decay_rate * elapsed))
        # Update last_activity to prevent double-decay
        # (caller should set last_activity when adding intensity)


class NEBVisualHUD:
    """
    Visual HUD integration for the Neural Event Bus.

    Subscribes to all events ("**") and generates visualization data:
    - Recent events list for activity feed
    - Ripple effects for spatial events
    - Agent glow states for activity visualization

    Example:
        bus = NEBBus(node_id="hud-node")
        hud = NEBVisualHUD(event_bus=bus)

        # Elsewhere, events are published
        bus.publish("task.started", {"x": 100, "y": 200})

        # Get visualization data
        ripples = hud.get_ripples()  # Animated ripples
        glows = hud.get_agent_glows()  # Agent activity
        events = hud.get_recent_events()  # Event feed
    """

    def __init__(self, event_bus: NEBBus, max_events: int = 100):
        """
        Initialize the Visual HUD.

        Args:
            event_bus: The NEB bus to subscribe to
            max_events: Maximum number of events to keep in history
        """
        self._event_bus = event_bus
        self._max_events = max_events

        # Event storage
        self._events: List[Dict[str, Any]] = []

        # Visual elements
        self._ripples: List[Ripple] = []
        self._agent_glows: Dict[str, AgentGlow] = {}

        # Default position for events without x,y
        self._default_x = 0
        self._default_y = 0

        # Subscribe to all events
        self._subscription_id = event_bus.subscribe("**", self._on_event)

    def _on_event(self, signal: NEBSignal) -> None:
        """
        Handle incoming events from the bus.

        Creates ripples for spatial events and updates agent glows.

        Args:
            signal: The received NEB signal
        """
        current_time = time.time()

        # Store event in history
        event_data = {
            "topic": signal.topic,
            "source_id": signal.source_id,
            "payload": signal.payload,
            "timestamp": signal.timestamp
        }
        self._events.append(event_data)

        # Trim event history
        if len(self._events) > self._max_events:
            self._events = self._events[-self._max_events:]

        # Extract position from payload if available
        x = signal.payload.get("x", self._default_x)
        y = signal.payload.get("y", self._default_y)

        # Create ripple for the event
        ripple = Ripple(
            topic=signal.topic,
            source_id=signal.source_id,
            x=x,
            y=y,
            max_radius=100.0,
            expansion_rate=50.0
        )
        self._ripples.append(ripple)

        # Update agent glow if agent_id is present
        agent_id = signal.payload.get("agent_id")
        if agent_id:
            # Determine topic type (first segment of topic)
            topic_type = signal.topic.split(".")[0] if "." in signal.topic else signal.topic

            if agent_id in self._agent_glows:
                # Update existing glow
                glow = self._agent_glows[agent_id]
                glow.intensity = min(glow.intensity + 1.0, 10.0)  # Cap at 10
                glow.topic_type = topic_type
                glow.last_activity = current_time
            else:
                # Create new glow
                self._agent_glows[agent_id] = AgentGlow(
                    agent_id=agent_id,
                    intensity=1.0,
                    topic_type=topic_type,
                    last_activity=current_time
                )

    def get_recent_events(self, limit: int = 20) -> List[Dict[str, Any]]:
        """
        Get recent events from the HUD.

        Args:
            limit: Maximum number of events to return

        Returns:
            List of event dictionaries, most recent last
        """
        return self._events[-limit:]

    def get_ripples(self, max_age: float = 2.0) -> List[Ripple]:
        """
        Get animated ripples with radius and opacity.

        Removes ripples older than max_age and updates
        the radius/opacity of remaining ripples.

        Args:
            max_age: Maximum age of ripples in seconds

        Returns:
            List of active Ripple objects
        """
        current_time = time.time()

        # Filter out old ripples
        self._ripples = [
            r for r in self._ripples
            if (current_time - r.created_at) < max_age
        ]

        # Update remaining ripples
        for ripple in self._ripples:
            ripple.update(current_time)

        return list(self._ripples)

    def get_agent_glows(self) -> List[AgentGlow]:
        """
        Get agent glow states with decayed intensity.

        Updates intensity decay for all glows and removes
        glows that have decayed to zero.

        Returns:
            List of AgentGlow objects with current intensity
        """
        current_time = time.time()

        # Update all glows with decay
        active_glows = []
        for glow in self._agent_glows.values():
            # Calculate decay based on time since last activity
            elapsed = current_time - glow.last_activity
            decayed_intensity = max(0.0, glow.intensity - (glow.decay_rate * elapsed))

            if decayed_intensity > 0.01:  # Keep if still visible
                glow.intensity = decayed_intensity
                active_glows.append(glow)
            else:
                # Remove from tracking
                del self._agent_glows[glow.agent_id]

        return active_glows
