"""
Audit Logger - Records and verifies security events in the swarm.
"""

import hashlib
import json
import logging
import os
import time
from typing import Any

logger = logging.getLogger(__name__)

class AuditLogger:
    """
    Maintains an append-only log of security events with cryptographic chaining.
    """

    def __init__(self, log_path: str = "logs/swarm_audit.log"):
        self.log_path = log_path
        os.makedirs(os.path.dirname(self.log_path), exist_ok=True)

        # Initialize log file if it doesn't exist
        if not os.path.exists(self.log_path):
            with open(self.log_path, "w") as f:
                pass

        logger.info(f"AuditLogger initialized: {log_path}")

    async def _get_last_hash(self) -> str | None:
        """Returns the hash of the last entry in the log."""
        events = await self.get_events()
        if not events:
            return None
        return events[-1].get("hash")

    def _calculate_hash(self, entry: dict[str, Any]) -> str:
        """Calculates SHA256 hash of a log entry."""
        # Remove hash from entry if it exists to ensure deterministic hashing
        entry_copy = entry.copy()
        entry_copy.pop("hash", None)
        entry_json = json.dumps(entry_copy, sort_keys=True)
        return hashlib.sha256(entry_json.encode()).hexdigest()

    async def log(self, event_type: str, details: dict[str, Any]):
        """
        Records a new security event with a hash of the previous event.
        """
        prev_hash = await self._get_last_hash()

        entry = {
            "timestamp": time.time(),
            "event_type": event_type,
            "details": details,
            "prev_hash": prev_hash
        }

        entry["hash"] = self._calculate_hash(entry)

        with open(self.log_path, "a") as f:
            f.write(json.dumps(entry) + "\n")

        logger.debug(f"Audit event logged: {event_type}")

    async def get_events(self, event_type: str | None = None,
                         agent_id: str | None = None) -> list[dict[str, Any]]:
        """
        Retrieves and filters events from the log.
        """
        events = []
        if not os.path.exists(self.log_path):
            return []

        with open(self.log_path) as f:
            for line in f:
                if not line.strip():
                    continue
                try:
                    event = json.loads(line)

                    # Filter by type
                    if event_type and event.get("event_type") != event_type:
                        continue

                    # Filter by agent_id (if present in details)
                    if agent_id and event.get("details", {}).get("agent_id") != agent_id:
                        continue

                    events.append(event)
                except json.JSONDecodeError:
                    continue

        return events

    async def verify_integrity(self) -> bool:
        """
        Verifies the cryptographic integrity of the entire log chain.
        """
        events = await self.get_events()
        if not events:
            return True

        prev_hash = None
        for i, event in enumerate(events):
            # Check prev_hash match
            if event.get("prev_hash") != prev_hash:
                logger.error(f"Integrity failure at event {i}: prev_hash mismatch")
                return False

            # Check current hash match
            actual_hash = self._calculate_hash(event)
            if event.get("hash") != actual_hash:
                logger.error(f"Integrity failure at event {i}: hash mismatch")
                return False

            prev_hash = event.get("hash")

        return True
