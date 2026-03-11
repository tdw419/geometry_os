"""
Tests for Autonomous Loop (Phase 38)

Tests the continuous prediction → decision → action cycle.
"""

import time
from unittest.mock import Mock

import pytest

from systems.visual_shell.autonomous_loop import (
    ActionType,
    AutonomousLoop,
    LoopAction,
    LoopMetrics,
    LoopState,
    create_autonomous_loop,
)
from systems.visual_shell.cluster_visualizer import ClusterVisualizer


class TestLoopState:
    """Tests for LoopState enum."""

    def test_state_values(self):
        assert LoopState.STOPPED.value == "stopped"
        assert LoopState.RUNNING.value == "running"
        assert LoopState.PAUSED.value == "paused"
        assert LoopState.ERROR.value == "error"


class TestActionType:
    """Tests for ActionType enum."""

    def test_action_types(self):
        assert ActionType.MIGRATE_CONTAINER.value == "migrate_container"
        assert ActionType.REJECT_BOOT.value == "reject_boot"
        assert ActionType.SCALE_PEER.value == "scale_peer"
        assert ActionType.ALERT_OPERATOR.value == "alert_operator"
        assert ActionType.NO_ACTION.value == "no_action"


class TestLoopAction:
    """Tests for LoopAction dataclass."""

    def test_action_creation(self):
        action = LoopAction(
            action_id="action-1",
            action_type=ActionType.MIGRATE_CONTAINER,
            peer_id="peer-1",
            container_id="container-1",
            target_peer_id="peer-2",
            reason="CPU overload predicted",
            confidence=0.85,
            created_at=time.time(),
        )
        assert action.action_id == "action-1"
        assert action.action_type == ActionType.MIGRATE_CONTAINER
        assert action.peer_id == "peer-1"
        assert action.container_id == "container-1"
        assert action.target_peer_id == "peer-2"
        assert action.reason == "CPU overload predicted"
        assert action.confidence == 0.85
        assert action.executed_at is None
        assert action.success is None

    def test_action_defaults(self):
        action = LoopAction(
            action_id="action-2",
            action_type=ActionType.ALERT_OPERATOR,
            peer_id="peer-1",
            container_id=None,
            target_peer_id=None,
            reason="Test",
            confidence=0.5,
            created_at=time.time(),
        )
        assert action.executed_at is None
        assert action.success is None
        assert action.error_message is None


class TestLoopMetrics:
    """Tests for LoopMetrics dataclass."""

    def test_metrics_defaults(self):
        metrics = LoopMetrics()
        assert metrics.cycles_completed == 0
        assert metrics.actions_taken == 0
        assert metrics.successful_actions == 0
        assert metrics.failed_actions == 0
        assert metrics.last_cycle_time == 0.0
        assert metrics.average_cycle_time == 0.0
        assert metrics.predictions_processed == 0


class TestAutonomousLoop:
    """Tests for AutonomousLoop."""

    @pytest.fixture
    def visualizer(self):
        """Create a mock visualizer with peers."""
        viz = ClusterVisualizer()
        peer1 = Mock()
        peer1.cpu_usage = 0.9
        peer1.memory_usage = 0.7
        peer1.container_count = 3
        peer1.containers = [Mock(container_id="c1"), Mock(container_id="c2")]

        peer2 = Mock()
        peer2.cpu_usage = 0.3
        peer2.memory_usage = 0.4
        peer2.container_count = 1
        peer2.containers = []

        viz._peers = {
            "peer-1": peer1,
            "peer-2": peer2,
        }
        return viz

    @pytest.fixture
    def loop(self, visualizer):
        """Create an AutonomousLoop instance."""
        return AutonomousLoop(
            visualizer=visualizer,
            config={"cycle_interval": 0.1, "confidence_threshold": 0.7},
        )

    def test_loop_creation(self, loop):
        assert loop._state == LoopState.STOPPED
        assert loop._metrics.cycles_completed == 0

    def test_get_state(self, loop):
        assert loop.get_state() == LoopState.STOPPED

    @pytest.mark.asyncio
    async def test_start_stop(self, loop):
        await loop.start()
        assert loop.get_state() == LoopState.RUNNING

        await loop.stop()
        assert loop.get_state() == LoopState.STOPPED

    @pytest.mark.asyncio
    async def test_pause_resume(self, loop):
        await loop.start()
        assert loop.get_state() == LoopState.RUNNING

        loop.pause()
        assert loop.get_state() == LoopState.PAUSED

        loop.resume()
        assert loop.get_state() == LoopState.RUNNING

        await loop.stop()

    @pytest.mark.asyncio
    async def test_run_cycle(self, loop):
        """Test that a cycle runs and collects metrics."""
        await loop._run_cycle()

        assert loop._metrics.cycles_completed == 1
        assert loop._metrics.last_cycle_time > 0

    @pytest.mark.asyncio
    async def test_collect_metrics(self, loop, visualizer):
        metrics = await loop._collect_metrics()

        assert "peer-1" in metrics
        assert metrics["peer-1"]["cpu"] == 0.9
        assert metrics["peer-1"]["memory"] == 0.7
        assert metrics["peer-1"]["container_count"] == 3

    @pytest.mark.asyncio
    async def test_predict_overload(self, loop):
        metrics = {"cpu": 0.9, "memory": 0.5}
        prediction = await loop._predict_overload("peer-1", metrics)

        assert prediction is not None
        assert prediction.peer_id == "peer-1"
        assert prediction.confidence == 0.9

    @pytest.mark.asyncio
    async def test_predict_no_overload(self, loop):
        metrics = {"cpu": 0.3, "memory": 0.4}
        prediction = await loop._predict_overload("peer-1", metrics)

        assert prediction is None

    @pytest.mark.asyncio
    async def test_decide_actions(self, loop):
        prediction = Mock()
        prediction.peer_id = "peer-1"
        prediction.confidence = 0.85
        prediction.message = "High CPU"

        actions = await loop._decide_actions([prediction])

        assert len(actions) == 1
        assert actions[0].action_type == ActionType.MIGRATE_CONTAINER
        assert actions[0].peer_id == "peer-1"

    @pytest.mark.asyncio
    async def test_decide_actions_below_threshold(self, loop):
        loop.set_confidence_threshold(0.9)

        prediction = Mock()
        prediction.peer_id = "peer-1"
        prediction.confidence = 0.8
        prediction.message = "High CPU"

        actions = await loop._decide_actions([prediction])

        assert len(actions) == 0

    @pytest.mark.asyncio
    async def test_execute_action(self, loop, visualizer):
        action = LoopAction(
            action_id="action-1",
            action_type=ActionType.MIGRATE_CONTAINER,
            peer_id="peer-1",
            container_id=None,
            target_peer_id=None,
            reason="Test",
            confidence=0.9,
            created_at=time.time(),
        )

        await loop._execute_action(action)

        assert action.success is True
        assert action.executed_at is not None
        assert loop._metrics.successful_actions == 1

    @pytest.mark.asyncio
    async def test_get_actions(self, loop):
        action = LoopAction(
            action_id="action-1",
            action_type=ActionType.MIGRATE_CONTAINER,
            peer_id="peer-1",
            container_id=None,
            target_peer_id=None,
            reason="Test",
            confidence=0.9,
            created_at=time.time(),
        )
        await loop._execute_action(action)

        actions = loop.get_actions()

        assert len(actions) == 1
        assert actions[0].action_id == "action-1"

    def test_get_stats(self, loop):
        stats = loop.get_stats()

        assert stats["state"] == "stopped"
        assert stats["cycles_completed"] == 0
        assert stats["success_rate"] == 0.0

    def test_set_confidence_threshold(self, loop):
        loop.set_confidence_threshold(0.95)
        assert loop._confidence_threshold == 0.95

    def test_set_cycle_interval(self, loop):
        loop.set_cycle_interval(10.0)
        assert loop._cycle_interval == 10.0

    def test_on_action_callback(self, loop):
        callback = Mock()
        loop.on_action(callback)

        assert callback in loop._callbacks["action"]

    @pytest.mark.asyncio
    async def test_full_cycle_integration(self, loop):
        """Test a full cycle with prediction and action."""
        await loop._run_cycle()

        stats = loop.get_stats()
        assert stats["cycles_completed"] == 1
        assert stats["predictions_processed"] >= 0


class TestCreateAutonomousLoop:
    """Tests for factory function."""

    def test_create_with_defaults(self):
        loop = create_autonomous_loop()
        assert isinstance(loop, AutonomousLoop)

    def test_create_with_params(self):
        visualizer = ClusterVisualizer()
        config = {"cycle_interval": 2.0}

        loop = create_autonomous_loop(
            visualizer=visualizer,
            config=config,
        )
        assert loop.visualizer == visualizer
        assert loop.config == config


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
