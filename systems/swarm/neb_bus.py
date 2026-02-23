"""
NEBBus - Pub/Sub API for the Neural Event Bus.

Provides a high-level API for publishing and subscribing to events
on the Neural Event Bus, wrapping SubscriptionManager and NEBSignal.
"""

import uuid
from typing import Callable, Dict, Any, List, Optional, Tuple

from systems.swarm.subscription_manager import SubscriptionManager
from systems.swarm.neb_signal import NEBSignal


class NEBBus:
    """
    Pub/Sub API for the Neural Event Bus.

    Provides:
    - Topic-based pub/sub with wildcard matching
    - Semantic matching via embeddings
    - Signal history tracking

    Example:
        bus = NEBBus(node_id="agent-001")
        bus.subscribe("build.*.success", lambda s: print(s.topic))
        bus.publish("build.frontend.success", {"duration": 1500})
    """

    def __init__(self, node_id: str):
        """
        Initialize the NEB Bus.

        Args:
            node_id: Unique identifier for this bus node
        """
        self.node_id = node_id
        self._manager = SubscriptionManager()
        self._signal_history: List[NEBSignal] = []
        self._max_history = 100

    def subscribe(
        self,
        pattern: str,
        callback: Callable[[NEBSignal], None]
    ) -> str:
        """
        Subscribe to a topic pattern.

        Args:
            pattern: Topic pattern (exact or wildcard)
                - "*" matches single segment (e.g., "build.*.success")
                - "**" matches multiple segments (e.g., "task.**")
            callback: Function to call with NEBSignal when matched

        Returns:
            Subscription ID for later unsubscription
        """
        # Wrap callback to convert payload dict to NEBSignal
        def wrapped_callback(payload: Dict[str, Any]):
            # The payload is actually the full signal data
            if isinstance(payload, NEBSignal):
                callback(payload)
            elif isinstance(payload, dict):
                # Create NEBSignal from the payload dict
                signal = NEBSignal(
                    source_id=payload.get("source_id", self.node_id),
                    topic=payload.get("topic", ""),
                    payload=payload.get("payload", {}),
                    embedding=payload.get("embedding"),
                    timestamp=payload.get("timestamp", 0.0)
                )
                callback(signal)
            else:
                callback(payload)

        return self._manager.subscribe(pattern, wrapped_callback)

    def subscribe_semantic(
        self,
        embedding: List[float],
        callback: Callable[[NEBSignal], None],
        threshold: float = 0.8,
        pattern: str = None
    ) -> str:
        """
        Subscribe to semantically similar embeddings.

        Args:
            embedding: Reference embedding vector for similarity matching
            callback: Function to call with NEBSignal when matched
            threshold: Cosine similarity threshold (0-1)
            pattern: Optional topic pattern filter

        Returns:
            Subscription ID
        """
        # Wrap callback to convert payload dict to NEBSignal
        def wrapped_callback(payload: Dict[str, Any]):
            if isinstance(payload, NEBSignal):
                callback(payload)
            elif isinstance(payload, dict):
                signal = NEBSignal(
                    source_id=payload.get("source_id", self.node_id),
                    topic=payload.get("topic", ""),
                    payload=payload.get("payload", {}),
                    embedding=payload.get("embedding"),
                    timestamp=payload.get("timestamp", 0.0)
                )
                callback(signal)
            else:
                callback(payload)

        return self._manager.subscribe_semantic(
            embedding=embedding,
            callback=wrapped_callback,
            threshold=threshold,
            pattern=pattern
        )

    def publish(
        self,
        topic: str,
        payload: Dict[str, Any],
        embedding: Optional[List[float]] = None
    ) -> NEBSignal:
        """
        Publish a signal to the bus.

        Args:
            topic: Event topic
            payload: Event payload data
            embedding: Optional embedding for semantic matching

        Returns:
            The created NEBSignal
        """
        signal = NEBSignal(
            source_id=self.node_id,
            topic=topic,
            payload=payload,
            embedding=embedding
        )

        # Store in history
        self._signal_history.append(signal)
        if len(self._signal_history) > self._max_history:
            self._signal_history = self._signal_history[-self._max_history:]

        # Deliver to subscribers
        signal_data = {
            "source_id": signal.source_id,
            "topic": signal.topic,
            "payload": signal.payload,
            "embedding": signal.embedding,
            "timestamp": signal.timestamp
        }

        if embedding is not None:
            # With embedding: semantic subscriptions use semantic matching
            # (match_and_deliver_semantic handles both topic and similarity)
            self._manager.match_and_deliver_semantic(topic, signal_data, embedding)
            # Also deliver to non-semantic topic subscriptions
            self._manager.match_and_deliver(topic, signal_data, skip_semantic=True)
        else:
            # Topic-based delivery only (non-semantic subscriptions)
            self._manager.match_and_deliver(topic, signal_data)

        return signal

    def unsubscribe(self, subscription_id: str) -> bool:
        """
        Remove a subscription.

        Args:
            subscription_id: ID returned from subscribe()

        Returns:
            True if subscription was found and removed, False otherwise
        """
        return self._manager.unsubscribe(subscription_id)

    def list_subscriptions(self) -> List[Tuple[str, str]]:
        """
        List all active subscriptions.

        Returns:
            List of (subscription_id, pattern) tuples
        """
        return self._manager.list_subscriptions()

    def get_recent_signals(self, limit: int = 10) -> List[NEBSignal]:
        """
        Get recently published signals.

        Args:
            limit: Maximum number of signals to return

        Returns:
            List of NEBSignal objects, most recent last
        """
        return self._signal_history[-limit:]
