"""
GeoASM Visual Bridge

Emits visual events for neural execution introspection.
Connects GeoASM execution to Geometry OS visual feedback.
"""

import logging
from typing import List, Dict, Any, Optional, Tuple
from dataclasses import dataclass, field
from enum import Enum

logger = logging.getLogger(__name__)


class EventType(Enum):
    """Types of visual events."""
    THOUGHT_PULSE = "thought_pulse"
    ATLAS_GLOW = "atlas_glow"
    ATTENTION_UPDATE = "attention_update"
    LAYER_SWITCH = "layer_switch"


@dataclass
class VisualEvent:
    """A single visual feedback event."""
    type: EventType
    data: Dict[str, Any]
    timestamp: float = field(default_factory=lambda: __import__('time').time())


class GeoASMVisualBridge:
    """
    Visual feedback bridge for GeoASM execution.

    Translates neural operations into spatial visual events
    that can be rendered on the Geometry OS desktop.
    """

    # Token semantic categories (simplified)
    PUNCTUATION_TOKENS = {1, 2, 13, 28, 29, 30}  # Common GPT-2 punctuation

    # Color palette for semantic categories
    COLORS = {
        'punctuation': (255, 255, 100),   # Yellow
        'verb': (100, 255, 255),           # Cyan
        'noun': (255, 100, 255),           # Magenta
        'default': (200, 200, 200),        # Gray
    }

    def __init__(self, max_events: int = 1000):
        """
        Initialize visual bridge.

        Args:
            max_events: Maximum events to buffer
        """
        self.max_events = max_events
        self._events: List[VisualEvent] = []
        self._callbacks: List[Any] = []

    def emit_thought_pulse(
        self,
        token: int,
        position: int,
        layer: int,
    ) -> Optional[VisualEvent]:
        """
        Emit a thought pulse visual event.

        Args:
            token: The generated token ID
            position: Sequence position
            layer: Transformer layer that produced this token

        Returns:
            The created event
        """
        color = self.get_token_color(token)

        event = VisualEvent(
            type=EventType.THOUGHT_PULSE,
            data={
                'token': token,
                'position': position,
                'layer': layer,
                'color': color,
            }
        )

        self._add_event(event)
        self._notify_callbacks(event)

        logger.debug(f"Thought pulse: token={token} pos={position} layer={layer}")
        return event

    def emit_atlas_glow(
        self,
        indices: List[int],
        intensity: float = 0.5,
    ) -> Optional[VisualEvent]:
        """
        Emit atlas glow event for weight access visualization.

        Args:
            indices: List of weight indices (Hilbert order) accessed
            intensity: Glow intensity (0.0 to 1.0)

        Returns:
            The created event
        """
        event = VisualEvent(
            type=EventType.ATLAS_GLOW,
            data={
                'indices': indices,
                'intensity': max(0.0, min(1.0, intensity)),
            }
        )

        self._add_event(event)
        self._notify_callbacks(event)

        return event

    def emit_attention_update(
        self,
        layer: int,
        head: int,
        weights: List[float],
    ) -> Optional[VisualEvent]:
        """
        Emit attention heatmap update.

        Args:
            layer: Transformer layer
            head: Attention head
            weights: Softmax attention weights

        Returns:
            The created event
        """
        event = VisualEvent(
            type=EventType.ATTENTION_UPDATE,
            data={
                'layer': layer,
                'head': head,
                'weights': weights,
            }
        )

        self._add_event(event)
        self._notify_callbacks(event)

        return event

    def get_token_color(self, token: int) -> Tuple[int, int, int]:
        """
        Get semantic color for a token.

        Args:
            token: Token ID

        Returns:
            RGB color tuple
        """
        if token in self.PUNCTUATION_TOKENS:
            return self.COLORS['punctuation']

        # Future: integrate with tokenizer for semantic analysis
        return self.COLORS['default']

    def _add_event(self, event: VisualEvent) -> None:
        """Add event to buffer, maintaining max size."""
        self._events.append(event)
        if len(self._events) > self.max_events:
            self._events = self._events[-self.max_events:]

    def get_events(self, since: float = 0.0) -> List[Dict[str, Any]]:
        """
        Get events since timestamp.

        Args:
            since: Unix timestamp to filter from

        Returns:
            List of event dictionaries
        """
        return [
            {'type': e.type.value, 'data': e.data, 'timestamp': e.timestamp}
            for e in self._events
            if e.timestamp >= since
        ]

    def clear_events(self) -> None:
        """Clear event buffer."""
        self._events.clear()

    def add_callback(self, callback: Any) -> None:
        """Add callback for real-time event streaming."""
        self._callbacks.append(callback)

    def _notify_callbacks(self, event: VisualEvent) -> None:
        """Notify all callbacks of new event."""
        for cb in self._callbacks:
            try:
                cb(event)
            except Exception as e:
                logger.warning(f"Callback error: {e}")
