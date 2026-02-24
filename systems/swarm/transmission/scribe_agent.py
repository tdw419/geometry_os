"""
ScribeAgent - Mentor player agent for transmission sessions.

Handles mentoring sessions as a Scribe (mentor) role:
- Claims pending sessions from TransmissionBoard
- Sends Socratic questions via NEB events
- Tracks covenant validity for the session
"""

from typing import Dict, Any, Optional, TYPE_CHECKING

from systems.swarm.guilds.base import GuildAgent
from systems.swarm.task_board import TaskBoard
from systems.swarm.transmission.types import (
    CovenantOath,
    SocraticQuestion,
    TransmissionSession,
)

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus
    from systems.swarm.transmission.board import TransmissionBoard


class ScribeAgent(GuildAgent):
    """
    Scribe agent for mentoring (teaching) in transmission sessions.

    Capabilities:
    - Claim pending sessions from TransmissionBoard
    - Send Socratic questions to sprouts via NEB
    - Track and validate covenant oath
    - Publish session lifecycle events
    """

    def __init__(
        self,
        agent_id: str,
        task_board: TaskBoard,
        event_bus: Optional['NEBBus'] = None,
        transmission_board: Optional['TransmissionBoard'] = None,
        covenant: Optional[CovenantOath] = None,
        auto_claim: bool = False
    ):
        """
        Initialize scribe agent.

        Args:
            agent_id: Unique identifier for this agent
            task_board: TaskBoard for base GuildAgent compatibility
            event_bus: Optional NEBBus for publishing events
            transmission_board: TransmissionBoard for session management
            covenant: Optional CovenantOath for this scribe
            auto_claim: If True, automatically claim sessions when notified
        """
        super().__init__(
            agent_id=agent_id,
            task_board=task_board,
            role="scribe",
            event_bus=event_bus,
            capabilities=[],  # Scribes don't handle TaskTypes, they handle sessions
            auto_claim=auto_claim
        )
        self.transmission_board = transmission_board
        self.covenant = covenant
        self.active_session: Optional[TransmissionSession] = None

    def claim_session(self, session_id: str) -> bool:
        """
        Claim a pending session for mentoring.

        Checks covenant validity before claiming.
        Stores claimed session in active_session on success.

        Args:
            session_id: ID of session to claim

        Returns:
            True if claim successful, False otherwise
        """
        # Check covenant is valid before claiming
        if not self.check_covenant_valid():
            return False

        # Check transmission board is configured
        if self.transmission_board is None:
            return False

        # Attempt to claim the session
        success = self.transmission_board.claim(session_id, self.agent_id)
        if success:
            # Store the claimed session
            self.active_session = self.transmission_board.get(session_id)

            # Publish claimed event via NEB
            if self.event_bus and self.active_session:
                self._publish_result("transmission.scribe.claimed", {
                    "scribe_id": self.agent_id,
                    "session_id": session_id,
                    "sprout_id": self.active_session.sprout_id,
                    "topic": self.active_session.topic,
                })

        return success

    def send_question(self, question: SocraticQuestion) -> None:
        """
        Send a Socratic question to the sprout via NEB.

        Publishes 'transmission.question' event with question data.

        Args:
            question: SocraticQuestion to send
        """
        if self.event_bus is None:
            return

        # Set the question's asked_by field
        question.asked_by = self.agent_id

        # Publish question event
        self._publish_result("transmission.question", {
            "scribe_id": self.agent_id,
            "session_id": self.active_session.session_id if self.active_session else None,
            "question": question.to_json(),
            "level": question.level.value,
            "category": question.category.value,
        })

    def check_covenant_valid(self) -> bool:
        """
        Check if the scribe's covenant is still valid.

        Returns:
            True if covenant exists and is not void, False otherwise
        """
        return self.covenant is not None and not self.covenant.is_void

    def start_session(self) -> bool:
        """
        Start the active session (mark as ACTIVE).

        Requires session to be claimed first.

        Returns:
            True if session started successfully
        """
        if self.transmission_board is None or self.active_session is None:
            return False

        success = self.transmission_board.start(self.active_session.session_id)
        if success:
            # Refresh session state
            self.active_session = self.transmission_board.get(self.active_session.session_id)

        return success

    def complete_session(self, metrics: Optional[Dict[str, Any]] = None) -> bool:
        """
        Complete the active session.

        Args:
            metrics: Optional completion metrics

        Returns:
            True if session completed successfully
        """
        if self.transmission_board is None or self.active_session is None:
            return False

        success = self.transmission_board.complete(
            self.active_session.session_id,
            metrics
        )
        if success:
            self.active_session = None

        return success

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
            return f"Scribe error in session {session_id}: {result['error']}"

        return f"Scribe session {session_id}: {status}"

    def _publish_result(self, topic: str, payload: Dict[str, Any]) -> None:
        """
        Publish a result event to the event bus.

        Override to add scribe-specific context.

        Args:
            topic: Event topic
            payload: Event payload data
        """
        if self.event_bus is None:
            return

        # Add scribe context to payload
        payload["scribe_id"] = self.agent_id
        if self.covenant:
            payload["covenant_valid"] = self.covenant.is_valid()

        self.event_bus.publish(topic, payload)
