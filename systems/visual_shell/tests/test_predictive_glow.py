"""
Tests for Predictive Glow (Phase 37)

Tests predictive overlays and overload warnings.
"""

import time
from unittest.mock import Mock

import pytest

from systems.visual_shell.cluster_visualizer import (
    ClusterVisualizer,
)
from systems.visual_shell.predictive_glow import (
    GlowIndicator,
    OverloadWarning,
    PredictiveGlow,
    PredictiveOverlay,
    create_predictive_overlay,
)


class TestGlowIndicator:
    """Tests for GlowIndicator."""

    def test_indicator_types(self):
        assert PredictiveGlow.PREDICTED_OVERLOAD.value == "predicted_overload"
        assert PredictiveGlow.ATTENTION_REQUIRED.value == "attention"
        assert PredictiveGlow.CRITICAL.value == "critical"

    def test_indicator_creation(self):
        indicator = GlowIndicator(
            indicator_id="ind-1",
            indicator_type=PredictiveGlow.PREDICTED_OVERLOAD.value,
            peer_id="peer-1",
            severity=PredictiveGlow.ATTENTION_REQUIRED.value,
            confidence=0.85,
            message="CPU at 85%",
            created_at=time.time(),
        )
        assert indicator.indicator_id == "ind-1"
        assert indicator.indicator_type == PredictiveGlow.PREDICTED_OVERLOAD.value
        assert indicator.peer_id == "peer-1"
        assert indicator.severity == PredictiveGlow.ATTENTION_REQUIRED.value
        assert indicator.confidence == 0.85
        assert indicator.message == "CPU at 85%"
        assert indicator.is_visible is True

    def test_indicator_with_warning(self):
        indicator = GlowIndicator(
            indicator_id="ind-2",
            indicator_type=PredictiveGlow.ATTENTION_REQUIRED.value,
            peer_id="peer-1",
            severity=PredictiveGlow.ATTENTION_REQUIRED.value,
            confidence=0.9,
            message="High memory usage",
            created_at=time.time(),
        )
        warning = OverloadWarning(
            warning_id="warn-1",
            peer_id="peer-1",
            severity=PredictiveGlow.CRITICAL.value,
            message="Critical overload predicted",
            confidence=0.95,
            predicted_at=time.time(),
        )
        assert warning.warning_id == "warn-1"
        assert warning.peer_id == "peer-1"
        assert warning.severity == PredictiveGlow.CRITICAL.value
        assert warning.message == "Critical overload predicted"
        assert warning.confidence == 0.95
        assert warning.predicted_at is not None
        assert isinstance(indicator, GlowIndicator)
        assert isinstance(warning, OverloadWarning)


class TestOverloadWarning:
    """Tests for OverloadWarning."""

    def test_warning_creation(self):
        warning = OverloadWarning(
            warning_id="warn-1",
            peer_id="peer-1",
            severity=PredictiveGlow.CRITICAL.value,
            message="Critical overload",
            confidence=0.95,
            predicted_at=time.time(),
            time_to_overload=30.0,
        )
        assert warning.warning_id == "warn-1"
        assert warning.peer_id == "peer-1"
        assert warning.severity == PredictiveGlow.CRITICAL.value
        assert warning.confidence == 0.95
        assert warning.time_to_overload == 30.0


class TestPredictiveOverlay:
    """Tests for PredictiveOverlay."""

    @pytest.fixture
    def visualizer(self):
        """Create a mock visualizer with peers."""
        viz = ClusterVisualizer()
        viz._peers = {
            "peer-1": Mock(),
            "peer-2": Mock(),
        }
        return viz

    @pytest.fixture
    def overlay(self, visualizer):
        """Create a PredictiveOverlay instance."""
        return PredictiveOverlay(visualizer=visualizer)

    def test_overlay_creation(self, overlay):
        assert overlay._running is False
        assert len(overlay._indicators) == 0
        assert len(overlay._warnings) == 0

    @pytest.mark.asyncio
    async def test_start_stop(self, overlay):
        await overlay.start()
        assert overlay._running is True

        await overlay.stop()
        assert overlay._running is False

    def test_highlight_peer(self, overlay):
        overlay.highlight_peer(
            peer_id="peer-1",
            severity=PredictiveGlow.ATTENTION_REQUIRED.value,
            confidence=0.8,
            message="High CPU",
        )
        assert len(overlay._indicators) == 1
        assert "peer-1" in overlay._warnings
        assert len(overlay._warnings["peer-1"]) == 1

    def test_highlight_nonexistent_peer(self, overlay):
        overlay.highlight_peer(
            peer_id="nonexistent",
            duration=1.0,
        )
        assert len(overlay._indicators) == 0
        assert len(overlay._warnings) == 0

    def test_get_indicators(self, overlay):
        for i in range(3):
            overlay.highlight_peer(
                peer_id=f"peer-{i % 2 + 1}",
                severity=PredictiveGlow.ATTENTION_REQUIRED.value,
                confidence=0.8,
                message=f"Warning {i}",
            )
        indicators = overlay.get_indicators()
        assert len(indicators) == 3

    def test_get_warnings(self, overlay):
        overlay.highlight_peer("peer-1")
        warnings = overlay.get_warnings("peer-1")
        assert len(warnings) == 1
        assert warnings[0].peer_id == "peer-1"

    def test_get_all_warnings(self, overlay):
        overlay.highlight_peer("peer-1")
        overlay.highlight_peer("peer-2")
        all_warnings = overlay.get_warnings()
        assert len(all_warnings) == 2

    def test_get_stats(self, overlay):
        overlay.highlight_peer("peer-1")
        stats = overlay.get_stats()
        assert stats["running"] is False
        assert stats["indicator_count"] == 1
        assert stats["warning_count"] == 1  # Number of peers with warnings
        assert stats["visible_count"] == 1
        assert stats["total_warnings"] == 1

    def test_clear_indicators(self, overlay):
        overlay.highlight_peer("peer-1")
        overlay.highlight_peer("peer-2")
        assert len(overlay._indicators) == 2

        overlay.clear_indicators()
        assert len(overlay._indicators) == 0
        assert len(overlay._warnings) == 0


class TestCreatePredictiveOverlay:
    """Tests for factory function."""

    def test_create_with_defaults(self):
        overlay = create_predictive_overlay()
        assert isinstance(overlay, PredictiveOverlay)

    def test_create_with_params(self):
        visualizer = ClusterVisualizer()
        config = {"threshold": 0.8}

        overlay = create_predictive_overlay(
            visualizer=visualizer,
            config=config,
        )
        assert overlay.visualizer == visualizer
        assert overlay.config == config


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
