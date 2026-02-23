"""
NEBSignal - Topic-based event signals for the Neural Event Bus.
"""

import json
import time
from dataclasses import dataclass, asdict
from typing import Dict, Any, Optional, List


@dataclass
class NEBSignal:
    """
    A topic-based event signal for Neural Event Bus coordination.

    Extends the concept of TelepathySignal with structured topics
    for pub/sub coordination.
    """
    source_id: str
    topic: str
    payload: Dict[str, Any] = None
    embedding: Optional[List[float]] = None
    timestamp: float = 0.0

    def __post_init__(self):
        if self.payload is None:
            self.payload = {}
        if self.timestamp == 0.0:
            self.timestamp = time.time()

    def to_bytes(self) -> bytes:
        """Serialize signal for network transmission."""
        return json.dumps(asdict(self)).encode('utf-8')

    @staticmethod
    def from_bytes(data: bytes) -> 'NEBSignal':
        """Deserialize signal from bytes."""
        d = json.loads(data.decode('utf-8'))
        return NEBSignal(**d)
