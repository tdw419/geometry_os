"""
Transmission Protocol - Core Types and Enums

Core data structures for the P2P mentoring system:
- TransmissionStatus: Lifecycle states for sessions
- TransmissionRole: Scribe (mentor) or Sprout (learner)
- BehaviorCategory: Prosocial behavior categories for scoring
- TransmissionSession: A mentoring session between agents
- CovenantOath: The 7-article covenant with violation tracking
"""

from dataclasses import dataclass, field, asdict
from datetime import datetime
from enum import Enum
from typing import List, Dict, Optional, Any
import json
import time
import uuid


class TransmissionStatus(Enum):
    """Lifecycle states for a transmission session."""
    PENDING = "PENDING"        # Session requested, awaiting scribe
    ACTIVE = "ACTIVE"          # Session in progress
    PAUSED = "PAUSED"          # Session temporarily paused
    COMPLETED = "COMPLETED"    # Session finished successfully
    CANCELLED = "CANCELLED"    # Session cancelled before completion


class TransmissionRole(Enum):
    """Roles in a transmission session."""
    SCRIBE = "SCRIBE"          # Mentor - guides the session
    SPROUT = "SPROUT"         # Learner - receives guidance


class BehaviorCategory(Enum):
    """
    Categories for prosocial behavior scoring.

    Positive categories sum to weight 1.0.
    TOXIC has negative weight for penalty.
    """
    RESPECTFUL = "RESPECTFUL"   # Shows respect, 0.25 weight
    HELPFUL = "HELPFUL"         # Provides help, 0.25 weight
    POSITIVE = "POSITIVE"       # Positive attitude, 0.20 weight
    PATIENT = "PATIENT"         # Patience in teaching, 0.15 weight
    CLEAR = "CLEAR"             # Clear communication, 0.15 weight
    TOXIC = "TOXIC"             # Negative behavior, -0.5 weight


# Category weights for prosocial scoring
BEHAVIOR_WEIGHTS = {
    BehaviorCategory.RESPECTFUL: 0.25,
    BehaviorCategory.HELPFUL: 0.25,
    BehaviorCategory.POSITIVE: 0.20,
    BehaviorCategory.PATIENT: 0.15,
    BehaviorCategory.CLEAR: 0.15,
    BehaviorCategory.TOXIC: -0.50,
}


# Zero-tolerance violation types that void covenant immediately
ZERO_TOLERANCE_VIOLATIONS = frozenset([
    "harassment",
    "discrimination",
    "threats",
    "doxxing",
    "illegal_activity",
])


@dataclass
class TransmissionSession:
    """
    A mentoring session between a Scribe (mentor) and Sprout (learner).

    Lifecycle: PENDING -> ACTIVE -> COMPLETED/CANCELLED
    Sessions can be PAUSED and resumed.
    """
    session_id: str
    sprout_id: str                     # Learner agent ID
    topic: str                         # Learning topic
    status: TransmissionStatus = TransmissionStatus.PENDING
    scribe_id: Optional[str] = None    # Mentor agent ID (set when claimed)
    created_at: float = field(default_factory=time.time)
    claimed_at: Optional[float] = None
    started_at: Optional[float] = None
    completed_at: Optional[float] = None
    covenant_oath: Optional['CovenantOath'] = None
    metadata: Dict[str, Any] = field(default_factory=dict)

    def __post_init__(self):
        """Ensure session_id is set."""
        if not self.session_id:
            self.session_id = f"session-{uuid.uuid4().hex[:8]}"

    def claim(self, scribe_id: str) -> bool:
        """
        Atomically claim this session for a scribe.

        Returns True if claim successful, False if already claimed.
        """
        if self.status != TransmissionStatus.PENDING:
            return False
        self.scribe_id = scribe_id
        self.claimed_at = time.time()
        # Note: Status changes to ACTIVE on start(), not claim()
        return True

    def start(self) -> bool:
        """Mark session as active (after covenant signed)."""
        if self.scribe_id is None or self.status != TransmissionStatus.PENDING:
            return False
        self.status = TransmissionStatus.ACTIVE
        self.started_at = time.time()
        return True

    def pause(self) -> bool:
        """Pause the session temporarily."""
        if self.status != TransmissionStatus.ACTIVE:
            return False
        self.status = TransmissionStatus.PAUSED
        return True

    def resume(self) -> bool:
        """Resume a paused session."""
        if self.status != TransmissionStatus.PAUSED:
            return False
        self.status = TransmissionStatus.ACTIVE
        return True

    def complete(self, metrics: Optional[Dict[str, Any]] = None) -> bool:
        """Mark session as completed with optional metrics."""
        if self.status not in (TransmissionStatus.ACTIVE, TransmissionStatus.PAUSED):
            return False
        self.status = TransmissionStatus.COMPLETED
        self.completed_at = time.time()
        if metrics:
            self.metadata["completion_metrics"] = metrics
        return True

    def cancel(self, reason: str = "") -> bool:
        """Cancel the session."""
        if self.status == TransmissionStatus.COMPLETED:
            return False
        self.status = TransmissionStatus.CANCELLED
        self.completed_at = time.time()
        if reason:
            self.metadata["cancel_reason"] = reason
        return True

    def to_json(self) -> str:
        """Serialize session to JSON string."""
        data = asdict(self)
        data["status"] = self.status.value
        if self.covenant_oath:
            data["covenant_oath"] = self.covenant_oath.to_json()
        return json.dumps(data)

    @classmethod
    def from_json(cls, json_str: str) -> 'TransmissionSession':
        """Deserialize session from JSON string."""
        data = json.loads(json_str)
        data["status"] = TransmissionStatus(data["status"])
        if isinstance(data.get("covenant_oath"), str):
            data["covenant_oath"] = CovenantOath.from_json(data["covenant_oath"])
        elif isinstance(data.get("covenant_oath"), dict):
            # Handle raw dict from asdict
            data["covenant_oath"] = CovenantOath(**data["covenant_oath"])
        return cls(**data)


@dataclass
class CovenantOath:
    """
    The 7-article covenant for transmission sessions.

    All participants must sign the covenant before session starts.
    Zero-tolerance violations void the oath immediately.
    """
    oath_id: str
    signer_id: str                       # Agent ID who signed
    signed_at: float = field(default_factory=time.time)
    articles_accepted: List[str] = field(default_factory=lambda: list(COVENANT_ARTICLES.keys()))
    violations: List[Dict[str, Any]] = field(default_factory=list)
    is_void: bool = False
    void_reason: Optional[str] = None

    def __post_init__(self):
        """Ensure oath_id is set."""
        if not self.oath_id:
            self.oath_id = f"oath-{uuid.uuid4().hex[:8]}"

    def record_violation(self, violation_type: str, details: str = "") -> bool:
        """
        Record a covenant violation.

        Zero-tolerance violations void the oath immediately.
        Returns True if the oath is still valid after this violation.
        """
        if self.is_void:
            return False

        violation = {
            "type": violation_type,
            "details": details,
            "timestamp": time.time(),
        }
        self.violations.append(violation)

        # Check for zero-tolerance violation
        if violation_type.lower() in ZERO_TOLERANCE_VIOLATIONS:
            self.void_oath(f"Zero-tolerance violation: {violation_type}")
            return False

        # Multiple violations may also void (e.g., 3+ violations)
        if len(self.violations) >= 3:
            self.void_oath("Multiple covenant violations")
            return False

        return True

    def void_oath(self, reason: str) -> None:
        """Void the covenant oath."""
        self.is_void = True
        self.void_reason = reason

    def is_valid(self) -> bool:
        """Check if the covenant is still valid."""
        return not self.is_void

    def to_json(self) -> str:
        """Serialize oath to JSON string."""
        return json.dumps(asdict(self))

    @classmethod
    def from_json(cls, json_str: str) -> 'CovenantOath':
        """Deserialize oath from JSON string."""
        data = json.loads(json_str)
        return cls(**data)


# The 7 Articles of the Transmission Covenant
COVENANT_ARTICLES = {
    "article_1": "I commit to respectful and constructive communication.",
    "article_2": "I will help others learn without withholding knowledge.",
    "article_3": "I will maintain a positive and encouraging attitude.",
    "article_4": "I will be patient with learners at all skill levels.",
    "article_5": "I will communicate clearly and check for understanding.",
    "article_6": "I will report any violations of this covenant.",
    "article_7": "I understand that zero-tolerance violations result in immediate removal.",
}
