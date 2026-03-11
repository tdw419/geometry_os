"""
Tests for Cognitive Overlay (Phase 36)

Tests cognitive decision visualization and reasoning panels.
"""


import pytest

from systems.visual_shell.cluster_visualizer import ClusterVisualizer
from systems.visual_shell.cognitive_overlay import (
    CognitiveDecision,
    CognitiveOverlay,
    DecisionStatus,
    DecisionType,
    DecisionVisualizer,
    ReasoningPanel,
    create_cognitive_overlay,
)
from systems.visual_shell.event_streaming import MeshEventBus


class TestDecisionType:
    """Tests for DecisionType enum."""

    def test_decision_types(self):
        assert DecisionType.PLACEMENT.value == "placement"
        assert DecisionType.MIGRATION.value == "migration"
        assert DecisionType.OVERLOAD_PREDICTION.value == "overload_prediction"
        assert DecisionType.CAPACITY_SCORING.value == "capacity_scoring"
        assert DecisionType.WORKLOAD_AFFINITY.value == "workload_affinity"


class TestDecisionStatus:
    """Tests for DecisionStatus enum."""

    def test_statuses(self):
        assert DecisionStatus.PENDING.value == "pending"
        assert DecisionStatus.APPLIED.value == "applied"
        assert DecisionStatus.REJECTED.value == "rejected"
        assert DecisionStatus.FAILED.value == "failed"


class TestCognitiveDecision:
    """Tests for CognitiveDecision dataclass."""

    def test_decision_creation(self):
        decision = CognitiveDecision(
            decision_id="dec-1",
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Low CPU usage",
            confidence=0.85,
        )
        assert decision.decision_id == "dec-1"
        assert decision.decision_type == DecisionType.PLACEMENT
        assert decision.peer_id == "peer-1"
        assert decision.reasoning == "Low CPU usage"
        assert decision.confidence == 0.85
        assert decision.status == DecisionStatus.PENDING

    def test_decision_with_migration(self):
        decision = CognitiveDecision(
            decision_id="dec-2",
            decision_type=DecisionType.MIGRATION,
            peer_id="peer-1",
            reasoning="Overloaded",
            confidence=0.92,
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="web-server",
        )
        assert decision.source_peer_id == "peer-1"
        assert decision.target_peer_id == "peer-2"
        assert decision.container_name == "web-server"

    def test_decision_to_dict(self):
        decision = CognitiveDecision(
            decision_id="dec-1",
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Test",
            confidence=0.5,
            factors={"cpu": 0.3},
        )
        data = decision.to_dict()
        assert data["decision_id"] == "dec-1"
        assert data["decision_type"] == "placement"
        assert data["factors"] == {"cpu": 0.3}


class TestReasoningPanel:
    """Tests for ReasoningPanel."""

    def test_panel_creation(self):
        panel = ReasoningPanel(panel_id="panel-1")
        assert panel.panel_id == "panel-1"
        assert panel.title == "Cognitive Reasoning"
        assert panel.is_visible is False
        assert panel.is_expanded is False

    def test_panel_show_hide(self):
        panel = ReasoningPanel(panel_id="panel-1")
        panel.show()
        assert panel.is_visible is True
        panel.hide()
        assert panel.is_visible is False

    def test_panel_expand_collapse(self):
        panel = ReasoningPanel(panel_id="panel-1")
        panel.expand()
        assert panel.is_expanded is True
        panel.collapse()
        assert panel.is_expanded is False

    def test_panel_content(self):
        panel = ReasoningPanel(panel_id="panel-1")
        panel.set_content(["Line 1", "Line 2"])
        assert panel.content == ["Line 1", "Line 2"]
        panel.add_line("Line 3")
        assert panel.content == ["Line 1", "Line 2", "Line 3"]
        panel.clear()
        assert panel.content == []


class TestDecisionVisualizer:
    """Tests for DecisionVisualizer."""

    @pytest.fixture
    def visualizer(self):
        return ClusterVisualizer()

    @pytest.fixture
    def decision_viz(self, visualizer):
        return DecisionVisualizer(visualizer)

    def test_visualizer_creation(self, decision_viz):
        assert decision_viz.visualizer is not None
        assert len(decision_viz._decisions) == 0

    def test_show_decision(self, decision_viz):
        decision = CognitiveDecision(
            decision_id="dec-1",
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Test",
            confidence=0.9,
        )
        decision_viz.show_decision(decision, duration=1.0)

        assert "dec-1" in decision_viz._decisions
        assert "dec-1" in decision_viz._active_decisions
        assert "peer-1" in decision_viz._decision_highlights

    def test_hide_decision(self, decision_viz):
        decision = CognitiveDecision(
            decision_id="dec-1",
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Test",
            confidence=0.9,
        )
        decision_viz.show_decision(decision, duration=10.0)
        decision_viz.hide_decision("dec-1")
        assert "dec-1" not in decision_viz._active_decisions

    def test_get_decision(self, decision_viz):
        decision = CognitiveDecision(
            decision_id="dec-1",
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Test",
            confidence=0.9,
        )
        decision_viz.show_decision(decision)
        result = decision_viz.get_decision("dec-1")
        assert result == decision

    def test_get_decisions_for_peer(self, decision_viz):
        for i in range(3):
            decision = CognitiveDecision(
                decision_id=f"dec-{i}",
                decision_type=DecisionType.PLACEMENT,
                peer_id="peer-1",
                reasoning=f"Reason {i}",
                confidence=0.8,
            )
            decision_viz.show_decision(decision)

        decisions = decision_viz.get_decisions_for_peer("peer-1")
        assert len(decisions) == 3

    def test_get_active_decisions(self, decision_viz):
        decision = CognitiveDecision(
            decision_id="dec-1",
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Test",
            confidence=0.9,
        )
        decision_viz.show_decision(decision, duration=10.0)
        active = decision_viz.get_active_decisions()
        assert len(active) == 1

    def test_get_history(self, decision_viz):
        for i in range(10):
            decision = CognitiveDecision(
                decision_id=f"dec-{i}",
                decision_type=DecisionType.PLACEMENT,
                peer_id=f"peer-{i}",
                reasoning=f"Reason {i}",
                confidence=0.8,
            )
            decision_viz.show_decision(decision)
        history = decision_viz.get_history(limit=5)
        assert len(history) == 5

    def test_clear(self, decision_viz):
        decision = CognitiveDecision(
            decision_id="dec-1",
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Test",
            confidence=0.9,
        )
        decision_viz.show_decision(decision)
        decision_viz.clear()
        assert len(decision_viz._decisions) == 0

    def test_get_stats(self, decision_viz):
        stats = decision_viz.get_stats()
        assert stats["total_decisions"] == 0
        assert stats["active_decisions"] == 0


class TestCognitiveOverlay:
    """Tests for CognitiveOverlay."""

    @pytest.fixture
    def visualizer(self):
        return ClusterVisualizer()

    @pytest.fixture
    def event_bus(self):
        return MeshEventBus(local_peer_id="test-local")

    @pytest.fixture
    def overlay(self, visualizer, event_bus):
        return CognitiveOverlay(
            visualizer=visualizer,
            event_bus=event_bus,
        )

    def test_overlay_creation(self, overlay):
        assert overlay._running is False
        assert overlay.decision_visualizer is not None

    @pytest.mark.asyncio
    async def test_overlay_start_stop(self, overlay):
        await overlay.start()
        assert overlay._running is True
        await overlay.stop()
        assert overlay._running is False

    @pytest.mark.asyncio
    async def test_show_decision(self, overlay):
        await overlay.start()

        decision = await overlay.show_decision(
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Low CPU usage (23%)",
            confidence=0.92,
        )

        assert decision.decision_id is not None
        assert decision.decision_type == DecisionType.PLACEMENT
        assert decision.peer_id == "peer-1"

        # Should have created reasoning panel
        panel = overlay.get_reasoning_panel(decision.decision_id)
        assert panel is not None
        assert panel.is_visible is True

        await overlay.stop()

    @pytest.mark.asyncio
    async def test_show_migration_decision(self, overlay):
        await overlay.start()

        decision = await overlay.show_decision(
            decision_type=DecisionType.MIGRATION,
            peer_id="peer-1",
            reasoning="Overloaded - migrating to peer-2",
            confidence=0.88,
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="web-server",
        )

        assert decision.source_peer_id == "peer-1"
        assert decision.target_peer_id == "peer-2"
        assert decision.container_name == "web-server"

        await overlay.stop()

    @pytest.mark.asyncio
    async def test_show_decision_with_factors(self, overlay):
        await overlay.start()

        decision = await overlay.show_decision(
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Best fit based on multiple factors",
            confidence=0.95,
            factors={
                "cpu_score": 0.9,
                "memory_score": 0.85,
                "affinity_score": 0.7,
            },
        )

        assert decision.factors["cpu_score"] == 0.9
        assert decision.factors["memory_score"] == 0.85

        await overlay.stop()

    @pytest.mark.asyncio
    async def test_hide_decision(self, overlay):
        await overlay.start()

        decision = await overlay.show_decision(
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Test",
            confidence=0.9,
        )

        overlay.hide_decision(decision.decision_id)
        active = overlay.get_active_decisions()
        assert decision.decision_id not in [d.decision_id for d in active]

        await overlay.stop()

    @pytest.mark.asyncio
    async def test_get_decisions_for_peer(self, overlay):
        await overlay.start()

        for i in range(3):
            await overlay.show_decision(
                decision_type=DecisionType.PLACEMENT,
                peer_id="peer-1",
                reasoning=f"Decision {i}",
                confidence=0.8,
            )

        decisions = overlay.get_decisions_for_peer("peer-1")
        assert len(decisions) == 3

        await overlay.stop()

    @pytest.mark.asyncio
    async def test_get_history(self, overlay):
        await overlay.start()

        for i in range(10):
            await overlay.show_decision(
                decision_type=DecisionType.PLACEMENT,
                peer_id=f"peer-{i}",
                reasoning=f"Decision {i}",
                confidence=0.8,
            )

        history = overlay.get_history(limit=5)
        assert len(history) == 5

        await overlay.stop()

    @pytest.mark.asyncio
    async def test_get_visible_panels(self, overlay):
        await overlay.start()

        await overlay.show_decision(
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Test 1",
            confidence=0.9,
        )
        await overlay.show_decision(
            decision_type=DecisionType.MIGRATION,
            peer_id="peer-2",
            reasoning="Test 2",
            confidence=0.8,
        )

        panels = overlay.get_visible_panels()
        assert len(panels) == 2

        await overlay.stop()

    @pytest.mark.asyncio
    async def test_decision_callbacks(self, overlay):
        await overlay.start()

        decisions_received = []

        def callback(decision):
            decisions_received.append(decision)

        overlay.on_decision(callback)

        decision = await overlay.show_decision(
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Test",
            confidence=0.9,
        )

        assert len(decisions_received) == 1
        assert decisions_received[0].decision_id == decision.decision_id

        overlay.off_decision(callback)
        await overlay.stop()

    @pytest.mark.asyncio
    async def test_get_stats(self, overlay):
        await overlay.start()

        stats = overlay.get_stats()
        assert stats["running"] is True
        assert stats["decision_count"] == 0

        await overlay.show_decision(
            decision_type=DecisionType.PLACEMENT,
            peer_id="peer-1",
            reasoning="Test",
            confidence=0.9,
        )

        stats = overlay.get_stats()
        assert stats["decision_count"] == 1

        await overlay.stop()

    @pytest.mark.asyncio
    async def test_parse_decision_from_event(self, overlay):
        await overlay.start()

        data = {
            "decision_id": "dec-event-1",
            "decision_type": "placement",
            "peer_id": "peer-1",
            "reasoning": "From event",
            "confidence": 0.75,
            "status": "pending",
        }

        decision = overlay._parse_decision(data)
        assert decision is not None
        assert decision.decision_id == "dec-event-1"
        assert decision.decision_type == DecisionType.PLACEMENT

        await overlay.stop()


class TestCreateCognitiveOverlay:
    """Tests for create_cognitive_overlay function."""

    def test_create_overlay(self):
        overlay = create_cognitive_overlay()
        assert isinstance(overlay, CognitiveOverlay)

    def test_create_overlay_with_visualizer(self):
        visualizer = ClusterVisualizer()
        overlay = create_cognitive_overlay(visualizer=visualizer)
        assert overlay.visualizer == visualizer

    def test_create_overlay_with_config(self):
        config = {"max_history": 50}
        overlay = create_cognitive_overlay(config=config)
        assert overlay._max_history == 50


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
