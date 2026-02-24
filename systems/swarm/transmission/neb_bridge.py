"""
TransmissionNEBBridge - Bridge for transmission session events on NEBBus.

Provides real-time event subscription for transmission protocol events including
session lifecycle (available/claimed/completed), Socratic questions, and
prosocial behavior scoring.

Usage:
    from systems.swarm.neb_bus import NEBBus
    from systems.swarm.transmission.neb_bridge import TransmissionNEBBridge

    bus = NEBBus(node_id="scribe-001")
    bridge = TransmissionNEBBridge(event_bus=bus)

    def handle_available(signal):
        print(f"New session: {signal.payload}")

    bridge.subscribe_to_available(handle_available)
"""

from typing import Callable, Optional, TYPE_CHECKING

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus
    from systems.swarm.neb_signal import NEBSignal


class TransmissionNEBBridge:
    """
    Bridge for transmission session events on NEBBus.

    Provides subscribe methods for all transmission-related topics:
    - transmission.available: New session available
    - transmission.claimed: Session claimed by scribe
    - transmission.started: Session active
    - transmission.question: Socratic question sent
    - transmission.completed: Session finished
    - transmission.haptic: Haptic feedback
    - prosocial.scored: Behavior scored

    Attributes:
        event_bus: The NEBBus instance for pub/sub operations
    """

    def __init__(self, event_bus: Optional['NEBBus'] = None):
        """
        Initialize the TransmissionNEBBridge.

        Args:
            event_bus: Optional NEBBus for event subscription
        """
        self._event_bus = event_bus

    def subscribe_to_available(
        self,
        callback: Callable[['NEBSignal'], None]
    ) -> str:
        """
        Subscribe to session available events.

        Triggered when a new transmission session is posted and available
        for claiming by a scribe.

        Args:
            callback: Function to call with NEBSignal when session becomes available

        Returns:
            Subscription ID for later unsubscription

        Raises:
            RuntimeError: If no event_bus is configured
        """
        if self._event_bus is None:
            raise RuntimeError("Cannot subscribe without event_bus")
        return self._event_bus.subscribe("transmission.available", callback)

    def subscribe_to_claimed(
        self,
        callback: Callable[['NEBSignal'], None]
    ) -> str:
        """
        Subscribe to session claimed events.

        Triggered when a scribe claims a transmission session.

        Args:
            callback: Function to call with NEBSignal when session is claimed

        Returns:
            Subscription ID for later unsubscription

        Raises:
            RuntimeError: If no event_bus is configured
        """
        if self._event_bus is None:
            raise RuntimeError("Cannot subscribe without event_bus")
        return self._event_bus.subscribe("transmission.claimed", callback)

    def subscribe_to_started(
        self,
        callback: Callable[['NEBSignal'], None]
    ) -> str:
        """
        Subscribe to session started events.

        Triggered when a transmission session becomes active.

        Args:
            callback: Function to call with NEBSignal when session starts

        Returns:
            Subscription ID for later unsubscription

        Raises:
            RuntimeError: If no event_bus is configured
        """
        if self._event_bus is None:
            raise RuntimeError("Cannot subscribe without event_bus")
        return self._event_bus.subscribe("transmission.started", callback)

    def subscribe_to_question(
        self,
        callback: Callable[['NEBSignal'], None]
    ) -> str:
        """
        Subscribe to Socratic question events.

        Triggered when a scribe sends a Socratic question to a sprout.

        Args:
            callback: Function to call with NEBSignal when question is sent

        Returns:
            Subscription ID for later unsubscription

        Raises:
            RuntimeError: If no event_bus is configured
        """
        if self._event_bus is None:
            raise RuntimeError("Cannot subscribe without event_bus")
        return self._event_bus.subscribe("transmission.question", callback)

    def subscribe_to_completed(
        self,
        callback: Callable[['NEBSignal'], None]
    ) -> str:
        """
        Subscribe to session completed events.

        Triggered when a transmission session finishes successfully.

        Args:
            callback: Function to call with NEBSignal when session completes

        Returns:
            Subscription ID for later unsubscription

        Raises:
            RuntimeError: If no event_bus is configured
        """
        if self._event_bus is None:
            raise RuntimeError("Cannot subscribe without event_bus")
        return self._event_bus.subscribe("transmission.completed", callback)

    def subscribe_to_haptic(
        self,
        callback: Callable[['NEBSignal'], None]
    ) -> str:
        """
        Subscribe to haptic feedback events.

        Triggered when haptic feedback is sent during a session.

        Args:
            callback: Function to call with NEBSignal when haptic is triggered

        Returns:
            Subscription ID for later unsubscription

        Raises:
            RuntimeError: If no event_bus is configured
        """
        if self._event_bus is None:
            raise RuntimeError("Cannot subscribe without event_bus")
        return self._event_bus.subscribe("transmission.haptic", callback)

    def subscribe_to_prosocial(
        self,
        callback: Callable[['NEBSignal'], None]
    ) -> str:
        """
        Subscribe to prosocial behavior scoring events.

        Triggered when the ProsocialAuditor scores behavior during a session.

        Args:
            callback: Function to call with NEBSignal when behavior is scored

        Returns:
            Subscription ID for later unsubscription

        Raises:
            RuntimeError: If no event_bus is configured
        """
        if self._event_bus is None:
            raise RuntimeError("Cannot subscribe without event_bus")
        return self._event_bus.subscribe("prosocial.scored", callback)

    def unsubscribe(self, subscription_id: str) -> bool:
        """
        Remove a subscription.

        Args:
            subscription_id: ID returned from subscribe_to_* methods

        Returns:
            True if subscription was found and removed, False otherwise

        Raises:
            RuntimeError: If no event_bus is configured
        """
        if self._event_bus is None:
            raise RuntimeError("Cannot unsubscribe without event_bus")
        return self._event_bus.unsubscribe(subscription_id)
