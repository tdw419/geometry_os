"""
Integration tests for full NEB system.
"""

import pytest
import tempfile
from pathlib import Path

from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent
from systems.swarm.neb_bus import NEBBus
from systems.swarm.neb_visual_hud import NEBVisualHUD


class TestNEBFullIntegration:
    """End-to-end NEB integration tests."""

    def test_full_workflow_publish_claim_complete(self):
        """Full workflow: post → publish → claim → complete."""
        with tempfile.TemporaryDirectory() as tmpdir:
            bus = NEBBus(node_id="coordinator")
            hud = NEBVisualHUD(event_bus=bus)
            board = TaskBoard(storage_path=tmpdir, event_bus=bus)

            events = []
            bus.subscribe("**", lambda s: events.append(s))

            # Post task
            board.post(Task(
                task_id="integration-001",
                task_type=TaskType.CODE_ANALYSIS,
                description="Integration test"
            ))

            # Agent claims
            agent = SwarmAgent(agent_id="worker-1", task_board=board)
            task = agent.claim_next_task()
            agent.complete_task(task, {"result": "done"})

            # Verify events
            topics = [e.topic for e in events]
            assert "task.available" in topics
            assert "task.claimed" in topics
            assert "task.completed" in topics

            # Verify HUD tracked events
            assert len(hud.get_recent_events()) >= 3

    def test_semantic_subscription_filters_events(self):
        """Semantic subscription only matches similar embeddings."""
        bus = NEBBus(node_id="semantic-test")

        received = []
        bus.subscribe_semantic(
            embedding=[1.0, 0.0, 0.0],  # "error" direction
            callback=lambda s: received.append(s),
            threshold=0.8
        )

        # Similar - should match
        bus.publish("error.disk", {"msg": "IO"}, embedding=[0.9, 0.1, 0.0])
        bus.publish("error.network", {"msg": "timeout"}, embedding=[0.85, 0.15, 0.0])

        # Dissimilar - should not match
        bus.publish("build.success", {"msg": "ok"}, embedding=[0.1, 0.9, 0.0])

        assert len(received) == 2

    def test_wildcard_subscription_catches_all_tasks(self):
        """Wildcard pattern catches all task events."""
        bus = NEBBus(node_id="wildcard-test")

        task_events = []
        bus.subscribe("task.**", lambda s: task_events.append(s))

        bus.publish("task.available", {"id": "1"})
        bus.publish("task.claimed", {"id": "1"})
        bus.publish("task.completed", {"id": "1"})
        bus.publish("build.success", {"id": "1"})  # Should not match

        assert len(task_events) == 3
