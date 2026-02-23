"""
SubscriptionManager - Topic-based subscription and matching.
"""

import fnmatch
import uuid
from typing import Dict, List, Callable, Any, Tuple
from dataclasses import dataclass


@dataclass
class Subscription:
    """A single subscription entry."""
    subscription_id: str
    pattern: str
    callback: Callable[[Dict[str, Any]], None]
    is_semantic: bool = False
    similarity_threshold: float = 0.8


class SubscriptionManager:
    """
    Manages topic subscriptions with exact, wildcard, and semantic matching.

    Wildcard patterns:
    - `*` matches a single segment (e.g., "build.*.success")
    - `**` matches multiple segments (e.g., "task.**")
    """

    def __init__(self):
        self._subscriptions: Dict[str, Subscription] = {}

    def subscribe(
        self,
        pattern: str,
        callback: Callable[[Dict[str, Any]], None]
    ) -> str:
        """
        Subscribe to a topic pattern.

        Args:
            pattern: Topic pattern (exact or wildcard)
            callback: Function to call when matching signal received

        Returns:
            Subscription ID for later unsubscription
        """
        sub_id = str(uuid.uuid4())[:8]
        self._subscriptions[sub_id] = Subscription(
            subscription_id=sub_id,
            pattern=pattern,
            callback=callback
        )
        return sub_id

    def unsubscribe(self, subscription_id: str) -> bool:
        """Remove a subscription."""
        if subscription_id in self._subscriptions:
            del self._subscriptions[subscription_id]
            return True
        return False

    def match_and_deliver(self, topic: str, payload: Dict[str, Any]) -> int:
        """
        Match topic against all subscriptions and deliver to matches.

        Args:
            topic: The event topic
            payload: The event payload

        Returns:
            Number of subscribers that received the event
        """
        delivered = 0
        for sub in self._subscriptions.values():
            if self._match_pattern(sub.pattern, topic):
                try:
                    sub.callback(payload)
                    delivered += 1
                except Exception:
                    pass  # Don't let one bad callback break others
        return delivered

    def _match_pattern(self, pattern: str, topic: str) -> bool:
        """Check if topic matches pattern (exact or wildcard)."""
        # Exact match
        if pattern == topic:
            return True

        # Multi-segment wildcard **
        if "**" in pattern:
            # Convert ** to fnmatch ** equivalent
            # "task.**" should match "task.any.thing"
            prefix = pattern.replace("**", "*")
            return fnmatch.fnmatch(topic, prefix) or topic.startswith(pattern.replace("**", ""))

        # Single-segment wildcard *
        if "*" in pattern:
            return fnmatch.fnmatch(topic, pattern)

        return False

    def subscribe_semantic(
        self,
        embedding: List[float],
        callback: Callable[[Dict[str, Any]], None],
        threshold: float = 0.8,
        pattern: str = None
    ) -> str:
        """
        Subscribe to semantically similar embeddings.

        Args:
            embedding: Reference embedding vector
            callback: Function to call on match
            threshold: Cosine similarity threshold (0-1)
            pattern: Optional topic pattern filter

        Returns:
            Subscription ID
        """
        import numpy as np
        sub_id = str(uuid.uuid4())[:8]
        self._subscriptions[sub_id] = Subscription(
            subscription_id=sub_id,
            pattern=pattern or "*",
            callback=callback,
            is_semantic=True,
            similarity_threshold=threshold
        )
        # Store reference embedding
        self._subscriptions[sub_id].reference_embedding = np.array(embedding)
        return sub_id

    def match_and_deliver_semantic(
        self,
        topic: str,
        payload: Dict[str, Any],
        embedding: List[float]
    ) -> int:
        """
        Match and deliver based on semantic similarity.

        Args:
            topic: Event topic (also checked against pattern if set)
            payload: Event payload
            embedding: Event embedding vector

        Returns:
            Number of deliveries
        """
        import numpy as np
        delivered = 0
        event_vec = np.array(embedding)
        event_norm = np.linalg.norm(event_vec)

        if event_norm == 0:
            return 0

        for sub in self._subscriptions.values():
            if not sub.is_semantic:
                continue

            # Check topic pattern if set
            if sub.pattern != "*" and not self._match_pattern(sub.pattern, topic):
                continue

            # Compute cosine similarity
            ref_vec = getattr(sub, 'reference_embedding', None)
            if ref_vec is None:
                continue

            ref_norm = np.linalg.norm(ref_vec)
            if ref_norm == 0:
                continue

            similarity = np.dot(event_vec, ref_vec) / (event_norm * ref_norm)

            if similarity >= sub.similarity_threshold:
                try:
                    sub.callback(payload)
                    delivered += 1
                except Exception:
                    pass

        return delivered

    def list_subscriptions(self) -> List[Tuple[str, str]]:
        """List all active subscriptions as (id, pattern) tuples."""
        return [(s.subscription_id, s.pattern) for s in self._subscriptions.values()]
