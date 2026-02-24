"""
Transmission Protocol - Core Types and Enums

Core data structures for the P2P mentoring system:
- TransmissionStatus: Lifecycle states for sessions
- TransmissionRole: Scribe (mentor) or Sprout (learner)
- BehaviorCategory: Prosocial behavior categories for scoring
- TransmissionSession: A mentoring session between agents
- CovenantOath: The 7-article covenant with violation tracking
- VPSLocation: AR colocalization with Haversine distance
- SephiroticNode: Diagnostic overlay (Tree of Life)
- SocraticQuestion: Inquiry-based teaching prompts
- ProsocialScore: Weighted behavior scoring
- HapticPattern: Haptic feedback patterns (P2)
"""

from dataclasses import dataclass, field, asdict
from datetime import datetime
from enum import Enum
from typing import List, Dict, Optional, Any, ClassVar
import json
import math
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


# =============================================================================
# P1 Enhanced Features
# =============================================================================


@dataclass
class VPSLocation:
    """
    AR colocalization data using VPS (Visual Positioning System).

    Uses Haversine formula for distance calculation.
    """
    latitude: float
    longitude: float
    altitude: float = 0.0
    heading: Optional[float] = None  # Degrees from north

    # Earth radius in meters
    EARTH_RADIUS_M: ClassVar[float] = 6371000.0

    def distance_to(self, other: 'VPSLocation') -> float:
        """
        Calculate distance to another VPSLocation using Haversine formula.

        Returns distance in meters.
        """
        lat1 = math.radians(self.latitude)
        lat2 = math.radians(other.latitude)
        delta_lat = math.radians(other.latitude - self.latitude)
        delta_lon = math.radians(other.longitude - self.longitude)

        a = (math.sin(delta_lat / 2) ** 2 +
             math.cos(lat1) * math.cos(lat2) * math.sin(delta_lon / 2) ** 2)
        c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))

        return self.EARTH_RADIUS_M * c

    def is_colocalized(self, other: 'VPSLocation', threshold_meters: float = 50.0) -> bool:
        """
        Check if this location is within threshold distance of another.

        Args:
            other: Other VPSLocation to compare
            threshold_meters: Maximum distance in meters (default 50m per VPS accuracy target)

        Returns:
            True if within threshold distance
        """
        return self.distance_to(other) <= threshold_meters

    def to_json(self) -> str:
        """Serialize to JSON string."""
        return json.dumps(asdict(self))

    @classmethod
    def from_json(cls, json_str: str) -> 'VPSLocation':
        """Deserialize from JSON string."""
        data = json.loads(json_str)
        return cls(**data)


@dataclass
class SephiroticNode:
    """
    Diagnostic overlay node from the Tree of Life.

    Each node represents a game mechanic or skill area.
    Intensity (0.0-1.0) indicates the node's current state.
    """
    name: str
    meaning: str
    intensity: float = 0.5
    node_id: str = ""

    # Canonical 10 nodes of the Tree of Life
    CANONICAL_NODES: ClassVar[List[Dict[str, str]]] = [
        {"id": "kether", "name": "Kether", "meaning": "Goal tracking"},
        {"id": "chokmah", "name": "Chokmah", "meaning": "Theory"},
        {"id": "binah", "name": "Binah", "meaning": "Practice"},
        {"id": "chesed", "name": "Chesed", "meaning": "Support abilities"},
        {"id": "gevurah", "name": "Gevurah", "meaning": "Combat"},
        {"id": "tipheret", "name": "Tipheret", "meaning": "Main compass"},
        {"id": "netzach", "name": "Netzach", "meaning": "Persistence"},
        {"id": "hod", "name": "Hod", "meaning": "Communication"},
        {"id": "yesod", "name": "Yesod", "meaning": "Resources"},
        {"id": "malkuth", "name": "Malkuth", "meaning": "Movement"},
    ]

    def __post_init__(self):
        """Ensure node_id is set."""
        if not self.node_id:
            self.node_id = self.name.lower()

    def is_critical(self) -> bool:
        """Check if node is in critical state (intensity < 0.3)."""
        return self.intensity < 0.3

    def is_healthy(self) -> bool:
        """Check if node is healthy (intensity >= 0.7)."""
        return self.intensity >= 0.7

    @classmethod
    def create_all(cls, default_intensity: float = 0.5) -> List['SephiroticNode']:
        """Factory method to create all 10 canonical nodes."""
        return [
            cls(
                name=node["name"],
                meaning=node["meaning"],
                intensity=default_intensity,
                node_id=node["id"]
            )
            for node in cls.CANONICAL_NODES
        ]

    def to_json(self) -> str:
        """Serialize to JSON string."""
        return json.dumps(asdict(self))

    @classmethod
    def from_json(cls, json_str: str) -> 'SephiroticNode':
        """Deserialize from JSON string."""
        data = json.loads(json_str)
        return cls(**data)


class QuestionLevel(Enum):
    """Socratic question difficulty levels."""
    LEVEL_1 = 1  # Recall - basic facts
    LEVEL_2 = 2  # Compare - relationships
    LEVEL_3 = 3  # Wonder - deeper insights


class QuestionCategory(Enum):
    """Categories for Socratic questions."""
    MECHANIC_INQUIRY = "mechanic_inquiry"      # Game mechanics
    SPATIAL_AWARENESS = "spatial_awareness"    # Positioning
    COMBAT_STRATEGY = "combat_strategy"        # Battle tactics
    RESOURCE_MANAGEMENT = "resource_management"  # Economy
    TEAMWORK = "teamwork"                      # Collaboration


@dataclass
class SocraticQuestion:
    """
    Inquiry-based teaching prompt for Socratic method.

    Used by Scribes to guide Sprouts through learning.
    """
    question_text: str
    level: QuestionLevel
    category: QuestionCategory
    question_id: str = ""
    asked_by: Optional[str] = None  # Scribe agent ID
    asked_at: Optional[float] = None
    answer_text: Optional[str] = None
    answered_at: Optional[float] = None

    def __post_init__(self):
        """Ensure question_id is set."""
        if not self.question_id:
            self.question_id = f"q-{uuid.uuid4().hex[:8]}"

    def ask(self, scribe_id: str) -> None:
        """Mark question as asked by a scribe."""
        self.asked_by = scribe_id
        self.asked_at = time.time()

    def answer(self, answer: str) -> None:
        """Record an answer to this question."""
        self.answer_text = answer
        self.answered_at = time.time()

    def to_json(self) -> str:
        """Serialize to JSON string."""
        data = asdict(self)
        data["level"] = self.level.value
        data["category"] = self.category.value
        return json.dumps(data)

    @classmethod
    def from_json(cls, json_str: str) -> 'SocraticQuestion':
        """Deserialize from JSON string."""
        data = json.loads(json_str)
        data["level"] = QuestionLevel(data["level"])
        data["category"] = QuestionCategory(data["category"])
        return cls(**data)


@dataclass
class ProsocialScore:
    """
    Weighted behavior scoring for session text auditing.

    Uses BehaviorCategory weights to calculate overall score.
    Threshold of 0.7 determines prosocial behavior.
    """
    scores: Dict[BehaviorCategory, float]  # category -> score (0.0-1.0)
    agent_id: str = ""
    scored_at: float = field(default_factory=time.time)
    session_id: Optional[str] = None

    # Threshold for prosocial behavior
    PROSOCIAL_THRESHOLD: ClassVar[float] = 0.7

    def calculate_weighted_score(self) -> float:
        """
        Calculate weighted score using BEHAVIOR_WEIGHTS.

        Returns:
            Weighted score (can be negative if TOXIC is high)
        """
        total = 0.0
        for category, score in self.scores.items():
            weight = BEHAVIOR_WEIGHTS.get(category, 0.0)
            total += score * weight
        return total

    def is_prosancial(self) -> bool:
        """
        Check if score meets prosocial threshold.

        Returns:
            True if weighted score >= 0.7
        """
        return self.calculate_weighted_score() >= self.PROSOCIAL_THRESHOLD

    def get_dominant_category(self) -> Optional[BehaviorCategory]:
        """
        Get the category with highest score.

        Returns:
            BehaviorCategory with highest score, or None if no scores
        """
        if not self.scores:
            return None
        return max(self.scores.items(), key=lambda x: x[1])[0]

    def to_json(self) -> str:
        """Serialize to JSON string."""
        data = asdict(self)
        data["scores"] = {cat.value: score for cat, score in self.scores.items()}
        data["weighted_score"] = self.calculate_weighted_score()
        data["is_prosancial"] = self.is_prosancial()
        return json.dumps(data)

    @classmethod
    def from_json(cls, json_str: str) -> 'ProsocialScore':
        """Deserialize from JSON string."""
        data = json.loads(json_str)
        data["scores"] = {BehaviorCategory(k): v for k, v in data["scores"].items()}
        # Remove computed fields
        data.pop("weighted_score", None)
        data.pop("is_prosancial", None)
        return cls(**data)


@dataclass
class HapticPattern:
    """
    Haptic feedback pattern for AR guidance (P2 placeholder).

    Predefined patterns with frequency and duration.
    """
    name: str
    frequency_hz: int
    duration_ms: int
    pattern_id: str = ""
    description: str = ""

    # Predefined haptic patterns
    HAPTIC_DEFINITIONS: ClassVar[Dict[str, Dict[str, Any]]] = {
        "sacred_pulse": {"frequency": 170, "duration": 200, "desc": "Correct rhythm"},
        "error_jolt": {"frequency": 250, "duration": 100, "desc": "Deviation detected"},
        "guidance_tether": {"frequency": 125, "duration": 300, "desc": "Near target"},
        "completion_hum": {"frequency": 200, "duration": 500, "desc": "Success"},
    }

    def __post_init__(self):
        """Ensure pattern_id is set."""
        if not self.pattern_id:
            self.pattern_id = f"haptic-{uuid.uuid4().hex[:8]}"

    @classmethod
    def get_pattern(cls, name: str) -> Optional['HapticPattern']:
        """
        Get a predefined haptic pattern by name.

        Args:
            name: Pattern name (sacred_pulse, error_jolt, etc.)

        Returns:
            HapticPattern instance or None if not found
        """
        if name not in cls.HAPTIC_DEFINITIONS:
            return None

        defn = cls.HAPTIC_DEFINITIONS[name]
        return cls(
            name=name,
            frequency_hz=defn["frequency"],
            duration_ms=defn["duration"],
            description=defn["desc"]
        )

    def to_json(self) -> str:
        """Serialize to JSON string."""
        return json.dumps(asdict(self))

    @classmethod
    def from_json(cls, json_str: str) -> 'HapticPattern':
        """Deserialize from JSON string."""
        data = json.loads(json_str)
        return cls(**data)
