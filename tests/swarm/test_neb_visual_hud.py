"""
Tests for NEB Visual HUD - Event ripples and agent glow tracking.

Task 7 of NEB implementation plan.
"""

import time
import pytest
from unittest.mock import Mock, patch

from systems.swarm.neb_bus import NEBBus
from systems.swarm.neb_signal import NEBSignal
from systems.swarm.neb_visual_hud import NEBVisualHUD, Ripple, AgentGlow


class TestNEBVisualHUD:
    """Test suite for NEB Visual HUD integration."""

    def test_hud_tracks_events(self):
        """HUD tracks published events."""
        # Create event bus and HUD
        bus = NEBBus(node_id="test-node")
        hud = NEBVisualHUD(event_bus=bus, max_events=100)

        # Publish some events
        bus.publish("task.started", {"task_id": "task-001"})
        bus.publish("task.completed", {"task_id": "task-001", "result": "success"})
        bus.publish("build.frontend.success", {"duration": 1500})

        # Get recent events from HUD
        events = hud.get_recent_events(limit=20)

        # Verify HUD tracked all events
        assert len(events) == 3
        assert events[0]["topic"] == "task.started"
        assert events[1]["topic"] == "task.completed"
        assert events[2]["topic"] == "build.frontend.success"

    def test_hud_generates_ripple_data(self):
        """HUD generates ripple visualization data (expanding circles with opacity)."""
        # Create event bus and HUD
        bus = NEBBus(node_id="test-node")
        hud = NEBVisualHUD(event_bus=bus, max_events=100)

        # Publish an event with position data
        bus.publish("task.started", {
            "task_id": "task-001",
            "x": 100,
            "y": 200
        })

        # Get ripples from HUD
        ripples = hud.get_ripples(max_age=2.0)

        # Verify ripple was created
        assert len(ripples) == 1

        ripple = ripples[0]
        assert isinstance(ripple, Ripple)
        assert ripple.topic == "task.started"
        assert ripple.source_id == "test-node"
        assert ripple.x == 100
        assert ripple.y == 200
        assert ripple.radius >= 0
        assert ripple.max_radius > 0
        assert 0 <= ripple.opacity <= 1
        assert ripple.created_at > 0

        # Ripple should expand over time
        initial_radius = ripple.radius
        time.sleep(0.1)
        ripples_updated = hud.get_ripples(max_age=2.0)
        assert ripples_updated[0].radius >= initial_radius

        # Opacity should decrease over time (fades out)
        initial_opacity = ripple.opacity
        assert ripples_updated[0].opacity <= initial_opacity

    def test_hud_tracks_agent_glow(self):
        """HUD tracks agent activity for glow effect."""
        # Create event bus and HUD
        bus = NEBBus(node_id="test-node")
        hud = NEBVisualHUD(event_bus=bus, max_events=100)

        # Publish events from different agents
        bus.publish("agent.heartbeat", {
            "agent_id": "agent-alpha",
            "status": "active"
        })
        bus.publish("task.started", {
            "task_id": "task-001",
            "agent_id": "agent-beta"
        })
        bus.publish("task.completed", {
            "task_id": "task-001",
            "agent_id": "agent-beta"
        })

        # Get agent glows
        glows = hud.get_agent_glows()

        # Verify agent glows are tracked
        assert len(glows) == 2

        # Find each agent's glow
        alpha_glow = next((g for g in glows if g.agent_id == "agent-alpha"), None)
        beta_glow = next((g for g in glows if g.agent_id == "agent-beta"), None)

        assert alpha_glow is not None
        assert beta_glow is not None

        assert isinstance(alpha_glow, AgentGlow)
        assert isinstance(beta_glow, AgentGlow)

        # Alpha had 1 event, Beta had 2 events
        assert alpha_glow.intensity > 0
        assert beta_glow.intensity > alpha_glow.intensity

        # Beta's last activity topic type should be "task"
        assert beta_glow.topic_type == "task"

        # Decay rate should be set
        assert beta_glow.decay_rate > 0
        assert beta_glow.last_activity > 0

        # Glow intensity decays over time
        initial_beta_intensity = beta_glow.intensity
        time.sleep(0.1)
        glows_updated = hud.get_agent_glows()
        beta_glow_updated = next((g for g in glows_updated if g.agent_id == "agent-beta"), None)
        assert beta_glow_updated.intensity < initial_beta_intensity
