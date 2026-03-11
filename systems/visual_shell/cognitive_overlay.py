"""
Cognitive Overlay - Phase 36

Shows cognitive decisions (LLM) on the visual mesh.

Bridges the cognitive load balancer to the visual shell, allowing users to see:
- Placement decisions and reasoning
- Migration recommendations
- Overload predictions

Usage:
    from systems.visual_shell.cognitive_overlay import (
        CognitiveOverlay,
        DecisionVisualizer,
        ReasoningPanel,
        DecisionType,
        create_cognitive_overlay,
    )

    # Create the overlay
    overlay = CognitiveOverlay(
        visualizer=visualizer,
        cognitive_load_balancer=load_balancer,
    )
    await overlay.start()

    # Show a decision
    overlay.show_decision(
        decision_type=DecisionType.PLACEMENT,
        peer_id="peer-1",
        reasoning="Selected due to low CPU (23%) and high memory (512MB free)",
        confidence=0.92,
    )
"""

import asyncio
import logging
import time
import uuid
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

from systems.visual_shell.cluster_visualizer import (
    ClusterVisualizer,
)
from systems.visual_shell.event_streaming import (
    MeshEvent,
    MeshEventBus,
    MeshEventType,
)

logger = logging.getLogger("CognitiveOverlay")


class DecisionType(Enum):
    """Types of cognitive decisions."""
    PLACEMENT = "placement"
    MIGRATION = "migration"
    OVERLOAD_PREDICTION = "overload_prediction"
    CAPACITY_SCORING = "capacity_scoring"
    WORKLOAD_AFFINITY = "workload_affinity"


class DecisionStatus(Enum):
    """Status of a decision."""
    PENDING = "pending"
    APPLIED = "applied"
    REJECTED = "rejected"
    FAILED = "failed"


@dataclass
class CognitiveDecision:
    """A cognitive decision made by the LLM."""
    decision_id: str
    decision_type: DecisionType
    peer_id: str
    reasoning: str
    confidence: float = 0.0
    status: DecisionStatus = DecisionStatus.PENDING
    timestamp: float = field(default_factory=time.time)
    source_peer_id: str | None = None
    target_peer_id: str | None = None
    container_name: str | None = None
    workload_type: str | None = None
    factors: dict[str, Any] = field(default_factory=dict)
    metadata: dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary."""
        return {
            "decision_id": self.decision_id,
            "decision_type": self.decision_type.value,
            "peer_id": self.peer_id,
            "reasoning": self.reasoning,
            "confidence": self.confidence,
            "status": self.status.value,
            "timestamp": self.timestamp,
            "source_peer_id": self.source_peer_id,
            "target_peer_id": self.target_peer_id,
            "container_name": self.container_name,
            "workload_type": self.workload_type,
            "factors": self.factors,
            "metadata": self.metadata,
        }


@dataclass
class ReasoningPanel:
    """Panel for displaying LLM reasoning."""
    panel_id: str
    title: str = "Cognitive Reasoning"
    content: list[str] = field(default_factory=list)
    is_visible: bool = False
    is_expanded: bool = False
    decision_id: str | None = None
    created_at: float = field(default_factory=time.time)

    _metadata: dict[str, Any] = field(default_factory=dict)

    def show(self):
        """Show the panel."""
        self.is_visible = True

    def hide(self):
        """Hide the panel."""
        self.is_visible = False

    def expand(self):
        """Expand the panel."""
        self.is_expanded = True

    def collapse(self):
        """Collapse the panel."""
        self.is_expanded = False

    def set_content(self, lines: list[str]):
        """Set panel content."""
        self.content = lines

    def add_line(self, line: str):
        """Add a line to content."""
        self.content.append(line)

    def clear(self):
        """Clear panel content."""
        self.content.clear()


class DecisionVisualizer:
    """
    Visualizes cognitive decisions on the mesh.

    Adds visual overlays to the cluster visualizer
    showing where decisions are being made.
    """

    def __init__(
        self,
        visualizer: ClusterVisualizer | None = None,
        max_history: int = 50,
    ):
        self.visualizer = visualizer
        self.max_history = max_history

        self._decisions: dict[str, CognitiveDecision] = {}
        self._active_decisions: dict[str, float] = {}  # decision_id -> expiry_time
        self._decision_highlights: dict[str, list[str]] = {}  # peer_id -> decision_ids
        self._history: list[CognitiveDecision] = []

    def set_visualizer(self, visualizer: ClusterVisualizer):
        """Set the visualizer."""
        self.visualizer = visualizer

    def show_decision(self, decision: CognitiveDecision, duration: float = 5.0):
        """Show a decision on the visualizer."""
        if not self.visualizer:
            return

        self._decisions[decision.decision_id] = decision
        self._active_decisions[decision.decision_id] = time.time() + duration

        # Track by peer
        if decision.peer_id not in self._decision_highlights:
            self._decision_highlights[decision.peer_id] = []
        self._decision_highlights[decision.peer_id].append(decision.decision_id)

        # Add to history
        self._history.append(decision)
        if len(self._history) > self.max_history:
            self._history = self._history[-self.max_history:]

        # Update peer visual state if possible
        if hasattr(self.visualizer, '_peers') and decision.peer_id in self.visualizer._peers:
            peer = self.visualizer._peers[decision.peer_id]
            # Add decision metadata to peer
            if not hasattr(peer, '_cognitive_decisions'):
                peer._cognitive_decisions = []
            peer._cognitive_decisions.append(decision.decision_id)

    def hide_decision(self, decision_id: str):
        """Hide a decision."""
        if decision_id in self._active_decisions:
            del self._active_decisions[decision_id]

    def get_decision(self, decision_id: str) -> CognitiveDecision | None:
        """Get a decision by ID."""
        return self._decisions.get(decision_id)

    def get_decisions_for_peer(self, peer_id: str) -> list[CognitiveDecision]:
        """Get all decisions for a peer."""
        decision_ids = self._decision_highlights.get(peer_id, [])
        return [
            self._decisions[did]
            for did in decision_ids
            if did in self._decisions
        ]

    def get_active_decisions(self) -> list[CognitiveDecision]:
        """Get all active (non-expired) decisions."""
        now = time.time()
        active = []
        expired = []

        for decision_id, expiry in self._active_decisions.items():
            if expiry > now:
                if decision_id in self._decisions:
                    active.append(self._decisions[decision_id])
            else:
                expired.append(decision_id)

        # Clean up expired
        for decision_id in expired:
            del self._active_decisions[decision_id]

        return active

    def get_history(self, limit: int = 20) -> list[CognitiveDecision]:
        """Get decision history."""
        return self._history[-limit:]

    def clear(self):
        """Clear all decisions."""
        self._decisions.clear()
        self._active_decisions.clear()
        self._decision_highlights.clear()

    def get_stats(self) -> dict[str, Any]:
        """Get visualizer statistics."""
        return {
            "total_decisions": len(self._decisions),
            "active_decisions": len(self._active_decisions),
            "peers_with_decisions": len(self._decision_highlights),
            "history_size": len(self._history),
        }


class CognitiveOverlay:
    """
    Bridges cognitive load balancer to visual shell.

    Receives cognitive decisions and displays them
    on the mesh visualization with reasoning panels.
    """

    def __init__(
        self,
        visualizer: ClusterVisualizer | None = None,
        cognitive_load_balancer=None,
        event_bus: MeshEventBus | None = None,
        config: dict[str, Any] | None = None,
    ):
        self.visualizer = visualizer
        self.cognitive_load_balancer = cognitive_load_balancer
        self.event_bus = event_bus
        self.config = config or {}

        self.decision_visualizer = DecisionVisualizer(visualizer)
        self._reasoning_panels: dict[str, ReasoningPanel] = {}

        self._running = False
        self._decision_history: list[CognitiveDecision] = []
        self._max_history = self.config.get("max_history", 100)

        # Callbacks
        self._decision_callbacks: list[Callable[[CognitiveDecision], None]] = []

    async def start(self):
        """Start the cognitive overlay."""
        if self._running:
            return

        self._running = True

        # Set visualizer on decision visualizer
        if self.visualizer:
            self.decision_visualizer.set_visualizer(self.visualizer)

        # Subscribe to cognitive events if event bus provided
        if self.event_bus:
            self.event_bus.on_event(
                MeshEventType.CUSTOM_EVENT,
                self._handle_custom_event,
            )

        logger.info("Cognitive overlay started")

    async def stop(self):
        """Stop the cognitive overlay."""
        self._running = False
        self._reasoning_panels.clear()
        logger.info("Cognitive overlay stopped")

    def _handle_custom_event(self, event: MeshEvent):
        """Handle custom cognitive events."""
        data = event.data
        event_subtype = data.get("subtype")

        if event_subtype == "cognitive_decision":
            decision = self._parse_decision(data)
            if decision:
                asyncio.create_task(self.show_decision(decision))

    def _parse_decision(self, data: dict[str, Any]) -> CognitiveDecision | None:
        """Parse a decision from event data."""
        try:
            decision_type_str = data.get("decision_type", "placement")
            decision_type = DecisionType(decision_type_str)

            status_str = data.get("status", "pending")
            status = DecisionStatus(status_str)

            return CognitiveDecision(
                decision_id=data.get("decision_id", str(uuid.uuid4())[:8]),
                decision_type=decision_type,
                peer_id=data.get("peer_id", ""),
                reasoning=data.get("reasoning", ""),
                confidence=data.get("confidence", 0.0),
                status=status,
                source_peer_id=data.get("source_peer_id"),
                target_peer_id=data.get("target_peer_id"),
                container_name=data.get("container_name"),
                workload_type=data.get("workload_type"),
                factors=data.get("factors", {}),
                metadata=data.get("metadata", {}),
            )
        except Exception as e:
            logger.error(f"Error parsing decision: {e}")
            return None

    async def show_decision(
        self,
        decision_type: DecisionType,
        peer_id: str,
        reasoning: str,
        confidence: float = 0.0,
        source_peer_id: str | None = None,
        target_peer_id: str | None = None,
        container_name: str | None = None,
        workload_type: str | None = None,
        factors: dict[str, Any] | None = None,
        metadata: dict[str, Any] | None = None,
        duration: float = 5.0,
    ) -> CognitiveDecision:
        """Show a cognitive decision on the overlay."""
        decision = CognitiveDecision(
            decision_id=str(uuid.uuid4())[:8],
            decision_type=decision_type,
            peer_id=peer_id,
            reasoning=reasoning,
            confidence=confidence,
            source_peer_id=source_peer_id,
            target_peer_id=target_peer_id,
            container_name=container_name,
            workload_type=workload_type,
            factors=factors or {},
            metadata=metadata or {},
        )

        # Show on decision visualizer
        self.decision_visualizer.show_decision(decision, duration)

        # Create reasoning panel
        panel = self._create_reasoning_panel(decision)
        panel.show()
        panel.expand()

        # Add to history
        self._decision_history.append(decision)
        if len(self._decision_history) > self._max_history:
            self._decision_history = self._decision_history[-self._max_history:]

        # Notify callbacks
        for callback in self._decision_callbacks:
            try:
                callback(decision)
            except Exception as e:
                logger.error(f"Callback error: {e}")

        # Publish to event bus
        if self.event_bus:
            await self.event_bus.publish(
                MeshEventType.CUSTOM_EVENT,
                {
                    "subtype": "cognitive_decision",
                    **decision.to_dict(),
                },
            )

        logger.info(f"Showing decision {decision.decision_id}: {decision_type.value}")
        return decision

    def _create_reasoning_panel(self, decision: CognitiveDecision) -> ReasoningPanel:
        """Create a reasoning panel for a decision."""
        panel_id = f"reasoning-{decision.decision_id}"

        # Build content
        content = [
            f"Decision: {decision.decision_type.value.upper()}",
            f"Peer: {decision.peer_id}",
            f"Confidence: {decision.confidence:.0%}",
            "",
            "Reasoning:",
            decision.reasoning,
        ]

        if decision.source_peer_id and decision.target_peer_id:
            content.append("")
            content.append(f"Migration: {decision.source_peer_id} → {decision.target_peer_id}")

        if decision.container_name:
            content.append(f"Container: {decision.container_name}")

        if decision.factors:
            content.append("")
            content.append("Factors:")
            for key, value in decision.factors.items():
                content.append(f"  {key}: {value}")

        panel = ReasoningPanel(
            panel_id=panel_id,
            title=f"Cognitive: {decision.decision_type.value}",
            content=content,
            decision_id=decision.decision_id,
        )

        self._reasoning_panels[panel_id] = panel
        return panel

    def hide_decision(self, decision_id: str):
        """Hide a decision."""
        self.decision_visualizer.hide_decision(decision_id)

        # Hide reasoning panel
        panel_id = f"reasoning-{decision_id}"
        if panel_id in self._reasoning_panels:
            self._reasoning_panels[panel_id].hide()

    def get_decision(self, decision_id: str) -> CognitiveDecision | None:
        """Get a decision by ID."""
        return self.decision_visualizer.get_decision(decision_id)

    def get_decisions_for_peer(self, peer_id: str) -> list[CognitiveDecision]:
        """Get all decisions for a peer."""
        return self.decision_visualizer.get_decisions_for_peer(peer_id)

    def get_active_decisions(self) -> list[CognitiveDecision]:
        """Get all active decisions."""
        return self.decision_visualizer.get_active_decisions()

    def get_history(self, limit: int = 20) -> list[CognitiveDecision]:
        """Get decision history."""
        return self._decision_history[-limit:]

    def get_reasoning_panel(self, decision_id: str) -> ReasoningPanel | None:
        """Get reasoning panel for a decision."""
        panel_id = f"reasoning-{decision_id}"
        return self._reasoning_panels.get(panel_id)

    def get_visible_panels(self) -> list[ReasoningPanel]:
        """Get all visible reasoning panels."""
        return [p for p in self._reasoning_panels.values() if p.is_visible]

    def on_decision(self, callback: Callable[[CognitiveDecision], None]):
        """Register callback for new decisions."""
        self._decision_callbacks.append(callback)

    def off_decision(self, callback: Callable[[CognitiveDecision], None]):
        """Unregister callback."""
        if callback in self._decision_callbacks:
            self._decision_callbacks.remove(callback)

    def get_stats(self) -> dict[str, Any]:
        """Get overlay statistics."""
        return {
            "running": self._running,
            "decision_count": len(self._decision_history),
            "active_decisions": len(self.get_active_decisions()),
            "panel_count": len(self._reasoning_panels),
            "visible_panels": len(self.get_visible_panels()),
            **self.decision_visualizer.get_stats(),
        }


# Convenience function
def create_cognitive_overlay(
    visualizer: ClusterVisualizer | None = None,
    cognitive_load_balancer=None,
    event_bus: MeshEventBus | None = None,
    config: dict[str, Any] | None = None,
) -> CognitiveOverlay:
    """Create a cognitive overlay."""
    return CognitiveOverlay(
        visualizer=visualizer,
        cognitive_load_balancer=cognitive_load_balancer,
        event_bus=event_bus,
        config=config,
    )
