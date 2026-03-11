"""
Predictive Glow - Phase 37

Highlights peers predicted to overload before it happens.

Usage:
    from systems.visual_shell.predictive_glow import (
        PredictiveGlow,
        GlowIndicator,
        OverloadWarning,
        PredictiveOverlay,
        create_predictive_overlay,
    )

    # Create the overlay
    overlay = PredictiveOverlay(
        visualizer=visualizer,
        predictor=predictor,
    )
    await overlay.start()

    # Highlight a peer predicted to overload
    overlay.highlight_peer("peer-1", duration=10.0)

    # Get warnings
    warnings = overlay.get_warnings("peer-1")
    assert len(warnings) == 1
"""

import asyncio
import logging
import time
import uuid
from collections import defaultdict
from collections.abc import Callable
from dataclasses import dataclass
from enum import Enum
from typing import Any

from systems.visual_shell.cluster_visualizer import (
    ClusterVisualizer,
)
from systems.visual_shell.event_streaming import (
    MeshEventBus,
    MeshEventType,
)

logger = logging.getLogger("PredictiveGlow")


class PredictiveGlow(Enum):
    """Severity levels for predictive glow indicators."""
    PREDICTED_OVERLOAD = "predicted_overload"
    ATTENTION_REQUIRED = "attention"
    CRITICAL = "critical"


@dataclass
class GlowIndicator:
    """A visual indicator on a peer showing predicted state."""
    indicator_id: str
    indicator_type: str
    peer_id: str
    severity: str
    confidence: float
    message: str
    created_at: float
    is_visible: bool = True
    duration: float = 10.0


@dataclass
class OverloadWarning:
    """A warning about predicted overload."""
    warning_id: str
    peer_id: str
    severity: str
    message: str
    confidence: float
    predicted_at: float
    time_to_overload: float | None = None


class PredictiveOverlay:
    """
    Overlay that highlights peers predicted to overload.

    Shows glow indicators on the visual mesh with different colors
    based on severity and confidence.
    """

    def __init__(
        self,
        visualizer: ClusterVisualizer | None = None,
        predictor=None,
        config: dict[str, Any] | None = None,
    ):
        self.visualizer = visualizer or ClusterVisualizer()
        self.predictor = predictor
        self.config = config or {}
        self.event_bus: MeshEventBus | None = None

        self._running = False
        self._indicators: dict[str, GlowIndicator] = {}
        self._warnings: dict[str, list[OverloadWarning]] = defaultdict(list)
        self._callbacks: dict[str, list[Callable]] = defaultdict(list)
        self._indicator_timers: dict[str, asyncio.Task] = {}

    async def start(self):
        """Start the overlay."""
        if self._running:
            return

        self._running = True

        # Set up predictor callbacks if available
        if self.predictor:
            self.predictor.on_prediction(self._handle_prediction)

        # Set up event bus for metrics
        self.event_bus = MeshEventBus(local_peer_id="predictive-glow")
        self.event_bus.on_event(
            MeshEventType.PEER_METRICS_UPDATED,
            self._handle_peer_metrics,
        )

        logger.info("Predictive glow overlay started")

    async def stop(self):
        """Stop the overlay."""
        self._running = False
        self._indicators.clear()
        self._warnings.clear()

        # Cancel any pending timers
        for timer in self._indicator_timers.values():
            timer.cancel()
        self._indicator_timers.clear()

        logger.info("Predictive glow overlay stopped")

    def set_predictor(self, predictor):
        """Set the predictor for overload predictions."""
        self.predictor = predictor
        self._setup_predictor_callbacks()

    def _setup_predictor_callbacks(self):
        """Set up predictor callbacks."""
        if self.predictor and self.event_bus:
            self.predictor.on_metrics(self._handle_prediction)
            self.event_bus.on_event(
                MeshEventType.PEER_METRICS_UPDATED,
                self._handle_peer_metrics,
            )

    async def _handle_prediction(self, prediction):
        """Handle a prediction from the predictor."""
        if prediction.peer_id not in self.visualizer._peers:
            logger.warning(f"Prediction for unknown peer: {prediction.peer_id}")
            return

        # Create indicator from prediction
        indicator_id = str(uuid.uuid4())
        indicator = GlowIndicator(
            indicator_id=indicator_id,
            indicator_type=PredictiveGlow.PREDICTED_OVERLOAD.value,
            peer_id=prediction.peer_id,
            severity=PredictiveGlow.ATTENTION_REQUIRED.value,
            confidence=prediction.confidence,
            message=prediction.message,
            created_at=time.time(),
        )

        self._indicators[indicator_id] = indicator

        # Create warning
        warning = OverloadWarning(
            warning_id=str(uuid.uuid4()),
            peer_id=prediction.peer_id,
            severity=PredictiveGlow.CRITICAL.value,
            message=prediction.message,
            confidence=prediction.confidence,
            predicted_at=time.time(),
        )

        self._warnings[prediction.peer_id].append(warning)

    async def _handle_peer_metrics(self, event):
        """Handle peer metrics update event."""
        # Process metrics for prediction updates
        pass

    def highlight_peer(
        self,
        peer_id: str,
        severity: PredictiveGlow = PredictiveGlow.ATTENTION_REQUIRED,
        message: str = "",
        confidence: float = 0.0,
        duration: float = 10.0,
    ):
        """Highlight a peer with a glow indicator."""
        if peer_id not in self.visualizer._peers:
            logger.warning(f"Cannot highlight peer {peer_id}: not in visualizer")
            return

        if severity is None:
            severity = PredictiveGlow.ATTENTION_REQUIRED.value

        indicator_id = str(uuid.uuid4())
        indicator = GlowIndicator(
            indicator_id=indicator_id,
            indicator_type=PredictiveGlow.PREDICTED_OVERLOAD.value,
            peer_id=peer_id,
            severity=severity,
            confidence=confidence,
            message=message,
            created_at=time.time(),
            is_visible=True,
            duration=duration,
        )

        self._indicators[indicator_id] = indicator

        # Create warning
        warning = OverloadWarning(
            warning_id=str(uuid.uuid4()),
            peer_id=peer_id,
            severity=severity,
            message=message or "Overload predicted",
            confidence=confidence,
            predicted_at=time.time(),
        )

        self._warnings[peer_id].append(warning)

    def clear_indicators(self):
        """Clear all indicators."""
        self._indicators.clear()
        self._warnings.clear()

    def get_indicators(self) -> list[GlowIndicator]:
        """Get all indicators."""
        return list(self._indicators.values())

    def get_warnings(self, peer_id: str = None) -> list[OverloadWarning]:
        """Get warnings, optionally filtered by peer."""
        if peer_id:
            return self._warnings.get(peer_id, [])
        all_warnings = []
        for warnings_list in self._warnings.values():
            all_warnings.extend(warnings_list)
        return all_warnings

    def get_stats(self) -> dict[str, Any]:
        """Get overlay statistics."""
        visible_count = len([i for i in self._indicators.values() if i.is_visible])
        total_warnings = sum(len(w) for w in self._warnings.values())
        return {
            "running": self._running,
            "indicator_count": len(self._indicators),
            "warning_count": len(self._warnings),
            "visible_count": visible_count,
            "total_warnings": total_warnings,
        }

    def on_warning(self, callback: Callable):
        """Register a callback for warnings."""
        self._callbacks["warning"].append(callback)

    def on_indicator_cleared(self, callback: Callable):
        """Register a callback for indicator clearance."""
        self._callbacks["cleared"].append(callback)


def create_predictive_overlay(
    visualizer: ClusterVisualizer | None = None,
    predictor=None,
    config: dict[str, Any] | None = None,
) -> PredictiveOverlay:
    """Factory function to create a PredictiveOverlay."""
    return PredictiveOverlay(
        visualizer=visualizer,
        predictor=predictor,
        config=config,
    )
