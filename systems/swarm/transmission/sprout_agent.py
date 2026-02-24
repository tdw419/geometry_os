"""
SproutAgent - Learner player agent for transmission sessions.

Handles learning sessions as a Sprout (learner) role:
- Requests sessions from TransmissionBoard
- Cancels pending sessions
- Receives Socratic questions via NEB
"""

from typing import Dict, Any, Optional, TYPE_CHECKING

from systems.swarm.guilds.base import GuildAgent
from systems.swarm.task_board import TaskBoard
from systems.swarm.transmission.types import TransmissionSession

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus
    from systems.swarm.transmission.board import TransmissionBoard


class SproutAgent(GuildAgent):
    """
    Sprout agent for learning (student) in transmission sessions.

    Capabilities:
    - Request mentoring sessions on topics
    - Cancel pending session requests
    - Receive Socratic questions via NEB
    - Publish session lifecycle events
    """

    def __init__(
        self,
        agent_id: str,
        task_board: TaskBoard,
        event_bus: Optional['NEBBus'] = None,
        transmission_board: Optional['TransmissionBoard'] = None,
        auto_claim: bool = False
    ):
        """
        Initialize sprout agent.

        Args:
            agent_id: Unique identifier for this agent
            task_board: TaskBoard for base GuildAgent compatibility
            event_bus: Optional NEBBus for publishing events
            transmission_board: TransmissionBoard for session management
            auto_claim: If True, automatically claim tasks when notified
        """
        super().__init__(
            agent_id=agent_id,
            task_board=task_board,
            role="sprout",
            event_bus=event_bus,
            capabilities=[],  # Sprouts don't handle TaskTypes, they handle sessions
            auto_claim=auto_claim
        )
        self.transmission_board = transmission_board
        self.pending_session: Optional[TransmissionSession] = None
        self.active_session: Optional[TransmissionSession] = None

    def request_session(
        self,
        topic: str,
        vps_location: Optional[str] = None
    ) -> Optional[str]:
        """
        Request a new mentoring session.

        Creates a PENDING session on the TransmissionBoard.
        Stores session in pending_session.

        Args:
            topic: Learning topic for the session
            vps_location: Optional VPS location string for colocalization

        Returns:
            Session ID if request successful, None otherwise
        """
        # Check transmission board is configured
        if self.transmission_board is None:
            return None

        # Create session metadata
        metadata = {}
        if vps_location:
            metadata["vps_location"] = vps_location

        # Create session
        session = TransmissionSession(
            session_id="",  # Auto-generated
            sprout_id=self.agent_id,
            topic=topic,
            metadata=metadata
        )

        # Post to board
        self.transmission_board.post(session)
        session_id = session.session_id
        self.pending_session = self.transmission_board.get(session_id)

        # Publish request event via NEB
        if self.event_bus:
            self._publish_result("transmission.sprout.requested", {
                "sprout_id": self.agent_id,
                "session_id": session_id,
                "topic": topic,
                "vps_location": vps_location,
            })

        return session_id

    def cancel_request(self, reason: str = "") -> bool:
        """
        Cancel a pending session request.

        Args:
            reason: Optional reason for cancellation

        Returns:
            True if cancellation successful, False otherwise
        """
        if self.transmission_board is None:
            return False

        if self.pending_session is None:
            return False

        # Can only cancel PENDING sessions
        if self.pending_session.status.value != "PENDING":
            return False

        # Cancel on board
        success = self.transmission_board.cancel(
            self.pending_session.session_id,
            reason or "Cancelled by sprout"
        )

        if success:
            session_id = self.pending_session.session_id
            self.pending_session = None

            # Publish cancel event via NEB
            if self.event_bus:
                self._publish_result("transmission.sprout.cancelled", {
                    "sprout_id": self.agent_id,
                    "session_id": session_id,
                    "reason": reason,
                })

        return success

    def update_session_status(self) -> Optional[TransmissionSession]:
        """
        Update session status from the board.

        Call this to check if a pending session has been claimed
        by a scribe or if status has changed.

        Returns:
            Updated session or None if not found
        """
        if self.transmission_board is None:
            return None

        # Check pending session
        if self.pending_session:
            session = self.transmission_board.get(self.pending_session.session_id)
            if session:
                self.pending_session = session
                # If claimed, move to active
                if session.scribe_id and not self.active_session:
                    self.active_session = session
                    return session
            return session

        # Check active session
        if self.active_session:
            session = self.transmission_board.get(self.active_session.session_id)
            if session:
                self.active_session = session
            return session

        return None

    def _summarize(self, result: Dict[str, Any]) -> str:
        """
        Summarize a session result for logging.

        Args:
            result: Result dictionary with session info

        Returns:
            Human-readable summary string
        """
        session_id = result.get("session_id", "none")
        status = result.get("status", "unknown")

        if "error" in result:
            return f"Sprout error in session {session_id}: {result['error']}"

        return f"Sprout session {session_id}: {status}"

    def _publish_result(self, topic: str, payload: Dict[str, Any]) -> None:
        """
        Publish a result event to the event bus.

        Override to add sprout-specific context.

        Args:
            topic: Event topic
            payload: Event payload data
        """
        if self.event_bus is None:
            return

        # Add sprout context to payload
        payload["sprout_id"] = self.agent_id

        self.event_bus.publish(topic, payload)
