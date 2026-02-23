"""
VerificationScheduler - Periodic truth verification for WordPress Zone

Runs periodic verification cycles using CTRM components to maintain
truth confidence levels in the knowledge base.
"""

import asyncio
import sys
import os
from typing import Dict, Any, Optional
from datetime import datetime

# Add src to path for CTRM imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'src'))

from ctrm_core.database import CTRMDatabase
from ctrm_core.truth_manager import CTRMTruthManager


class MockEmbedder:
    """Mock embedder for testing without a real embedding model"""

    async def embed(self, text: str) -> list:
        """Return a deterministic mock embedding based on text hash"""
        import hashlib
        import struct

        # Generate deterministic pseudo-random embedding from text hash
        hash_bytes = hashlib.sha256(text.encode()).digest()
        embedding = []
        for i in range(0, 64, 4):  # 16-dimensional embedding
            value = struct.unpack('f', hash_bytes[i:i+4])[0]
            # Normalize to [-1, 1] range
            normalized = max(-1.0, min(1.0, value / (2**30)))
            embedding.append(normalized)

        return embedding


class VerificationScheduler:
    """
    Periodic truth verification scheduler.

    Runs verification cycles at configurable intervals, using CTRM
    components to verify and update truth confidence levels.
    """

    def __init__(
        self,
        db_path: str = "ctrm_llm_os.db",
        interval_seconds: int = 3600,
        max_tokens: int = 5000
    ):
        """
        Initialize the verification scheduler.

        Args:
            db_path: Path to the CTRM database
            interval_seconds: Time between verification cycles (default: 1 hour)
            max_tokens: Maximum tokens to spend per cycle (default: 5000)
        """
        self.db_path = db_path
        self.interval_seconds = interval_seconds
        self.max_tokens = max_tokens

        # Initialize components
        self.db = CTRMDatabase(db_path)
        self.embedder = MockEmbedder()
        self.truth_manager: Optional[CTRMTruthManager] = None

        # State
        self._running = False
        self._task: Optional[asyncio.Task] = None
        self._last_cycle_result: Optional[Dict[str, Any]] = None

    async def _initialize(self):
        """Initialize async components"""
        if self.truth_manager is None:
            self.db.initialize()
            self.truth_manager = CTRMTruthManager(self.db, self.embedder)

    async def run_cycle(self) -> Dict[str, Any]:
        """
        Run a single verification cycle.

        Returns:
            Dict with verification results including:
            - verified_truths: Number of truths verified
            - total_tokens_used: Tokens consumed
            - results: List of individual verification results
            - timestamp: When the cycle completed
        """
        await self._initialize()

        cycle_start = datetime.now()

        try:
            # Run foundational truth verification
            result = await self.truth_manager.verify_foundational_truths(
                max_tokens=self.max_tokens
            )

            # Add cycle metadata
            result['cycle_start'] = cycle_start.isoformat()
            result['cycle_end'] = datetime.now().isoformat()
            result['interval_seconds'] = self.interval_seconds

            self._last_cycle_result = result
            return result

        except Exception as e:
            error_result = {
                'error': str(e),
                'verified_truths': 0,
                'total_tokens_used': 0,
                'results': [],
                'cycle_start': cycle_start.isoformat(),
                'cycle_end': datetime.now().isoformat()
            }
            self._last_cycle_result = error_result
            return error_result

    async def start(self):
        """
        Start the continuous verification loop.

        Runs verification cycles at the configured interval until stopped.
        """
        if self._running:
            return

        self._running = True
        await self._initialize()

        while self._running:
            try:
                # Run verification cycle
                result = await self.run_cycle()

                # Log result
                if 'error' in result:
                    print(f"[VerificationScheduler] Cycle error: {result['error']}")
                else:
                    print(f"[VerificationScheduler] Cycle complete: "
                          f"{result.get('verified_truths', 0)} truths verified, "
                          f"{result.get('total_tokens_used', 0)} tokens used")

                # Wait for next cycle
                if self._running:
                    await asyncio.sleep(self.interval_seconds)

            except asyncio.CancelledError:
                break
            except Exception as e:
                print(f"[VerificationScheduler] Unexpected error: {e}")
                if self._running:
                    await asyncio.sleep(60)  # Brief pause before retry

    def stop(self):
        """Stop the verification loop"""
        self._running = False
        if self._task and not self._task.done():
            self._task.cancel()

    def start_background(self) -> asyncio.Task:
        """
        Start the scheduler in background.

        Returns:
            The asyncio task running the scheduler
        """
        self._task = asyncio.create_task(self.start())
        return self._task

    @property
    def is_running(self) -> bool:
        """Check if the scheduler is running"""
        return self._running

    @property
    def last_result(self) -> Optional[Dict[str, Any]]:
        """Get the last cycle result"""
        return self._last_cycle_result


# CLI entry point for testing
if __name__ == "__main__":
    async def main():
        scheduler = VerificationScheduler(interval_seconds=10, max_tokens=1000)
        print(f"Interval: {scheduler.interval_seconds} seconds")
        print(f"Max tokens: {scheduler.max_tokens}")
        print(f"DB path: {scheduler.db_path}")

        # Run a single cycle
        result = await scheduler.run_cycle()
        print(f"Result: {result}")

    asyncio.run(main())
