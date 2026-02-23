"""
Tests for SubscriptionManager - topic subscription and matching.
"""

import pytest
from systems.swarm.subscription_manager import SubscriptionManager


class TestSubscriptionManager:
    """Test subscription management."""

    def test_subscribe_exact_match(self):
        """Exact topic subscription matches only that topic."""
        manager = SubscriptionManager()
        received = []

        manager.subscribe("build.success", lambda s: received.append(s))

        manager.match_and_deliver("build.success", {"test": 1})
        manager.match_and_deliver("build.failure", {"test": 2})

        assert len(received) == 1
        assert received[0]["test"] == 1

    def test_subscribe_wildcard_single(self):
        """Single * matches one segment."""
        manager = SubscriptionManager()
        received = []

        manager.subscribe("build.*.success", lambda s: received.append(s))

        manager.match_and_deliver("build.frontend.success", {"a": 1})
        manager.match_and_deliver("build.backend.success", {"b": 2})
        manager.match_and_deliver("build.success", {"c": 3})  # No match

        assert len(received) == 2

    def test_subscribe_wildcard_multi(self):
        """** matches multiple segments."""
        manager = SubscriptionManager()
        received = []

        manager.subscribe("task.**", lambda s: received.append(s))

        manager.match_and_deliver("task.available", {"a": 1})
        manager.match_and_deliver("task.claimed.by.agent1", {"b": 2})
        manager.match_and_deliver("build.success", {"c": 3})  # No match

        assert len(received) == 2

    def test_multiple_subscribers_same_topic(self):
        """Multiple subscribers can listen to same topic."""
        manager = SubscriptionManager()
        calls_a = []
        calls_b = []

        manager.subscribe("event.test", lambda s: calls_a.append(s))
        manager.subscribe("event.test", lambda s: calls_b.append(s))

        manager.match_and_deliver("event.test", {"x": 1})

        assert len(calls_a) == 1
        assert len(calls_b) == 1

    def test_unsubscribe(self):
        """Can unsubscribe from topics."""
        manager = SubscriptionManager()
        received = []

        sub_id = manager.subscribe("test.topic", lambda s: received.append(s))
        manager.match_and_deliver("test.topic", {"a": 1})

        manager.unsubscribe(sub_id)
        manager.match_and_deliver("test.topic", {"b": 2})

        assert len(received) == 1  # Only first delivery
