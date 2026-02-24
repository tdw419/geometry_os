"""WordPress Truth Daemon - Main orchestration loop.

This daemon extracts factual claims from WordPress content, scores them
using CTRM hybrid scoring, and syncs them to the CTRM database.

Usage:
    python3 wordpress_truth_daemon.py --verbose
    python3 wordpress_truth_daemon.py --poll-interval 30
"""
import asyncio
import hashlib
import logging
import signal
import sys
import os
from dataclasses import dataclass, field
from typing import List, Dict, Any, Optional
from datetime import datetime

# Add src to path for CTRM imports
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'src')))

from wp_client import WordPressClient
from truth_extractor import TruthExtractor
from triad_scorer import TriadScorer
from verification_scheduler import VerificationScheduler
from ctrm_core.database import CTRMDatabase
from ctrm_core.truth_manager import CTRMTruth, CTRMTruthManager

logger = logging.getLogger(__name__)


@dataclass
class DaemonConfig:
    """Configuration for WordPress Truth Daemon."""
    poll_interval: int = 60
    batch_size: int = 5
    post_types: List[str] = field(default_factory=lambda: ["post", "page", "research_document"])
    categories: List[str] = field(default_factory=lambda: ["documentation", "insights", "technical"])
    db_path: str = "ctrm_llm_os.db"
    wordpress_url: str = "http://localhost:8080"
    llm_model: str = "microsoft/phi-4"


class SimpleEmbedder:
    """Simple embedder using hashlib for mock embeddings."""

    async def embed(self, text: str) -> List[float]:
        """Generate a deterministic mock embedding from text."""
        h = hashlib.md5(text.encode()).hexdigest()
        return [float(int(h[i:i+2], 16)) / 255 for i in range(0, min(len(h), 768))]


class WordPressTruthDaemon:
    """
    Main daemon for extracting truths from WordPress content.

    Workflow:
    1. Poll WordPress for modified content
    2. Extract claims using LM Studio
    3. Score using triad formula
    4. Store in CTRM database
    5. Update WordPress post meta with scores
    """

    def __init__(self, config: Optional[DaemonConfig] = None):
        self.config = config or DaemonConfig()
        self._running = False
        self._last_poll_time: Optional[str] = None

        # Initialize components
        self.wp_client = WordPressClient(base_url=self.config.wordpress_url)
        self.extractor = TruthExtractor(model=self.config.llm_model)
        self.scorer = TriadScorer()

        # Initialize database
        self.db = CTRMDatabase(self.config.db_path)
        self.db.initialize()

        # Initialize truth manager with simple embedder
        self.embedder = SimpleEmbedder()
        self.truth_manager = CTRMTruthManager(self.db, self.embedder)

        # Verification scheduler
        self.scheduler = VerificationScheduler(
            db_path=self.config.db_path,
            interval_seconds=3600
        )

    async def run_discovery(self) -> int:
        """
        Run a single discovery cycle.

        Returns:
            Number of truths extracted
        """
        posts = self.wp_client.get_modified_posts(
            since=self._last_poll_time,
            post_types=self.config.post_types,
            limit=self.config.batch_size
        )

        total_truths = 0

        # High-value filter: Skip procedural/conversational noise
        procedural_keywords = ["Task:", "Execute:", "Assistant:", "Status Update:", "Log:", "Chat:"]

        for post in posts[:self.config.batch_size]:
            try:
                title = post.get("title", "")
                content = post.get("content", "")

                # Skip posts with procedural keywords in title or content
                if any(kw.lower() in title.lower() for kw in procedural_keywords) or \
                   any(kw.lower() in content[:100].lower() for kw in procedural_keywords):
                    logger.debug(f"Skipping procedural post {post.get('id')}: {title}")
                    continue

                truths = await self._process_post(post)
                total_truths += len(truths)
            except Exception as e:
                logger.error(f"Failed to process post {post.get('id')}: {e}")

        # Update last poll time
        self._last_poll_time = datetime.now().isoformat()

        return total_truths

    async def _process_post(self, post: Dict[str, Any]) -> List[CTRMTruth]:
        """
        Process a single WordPress post.

        Args:
            post: Post dictionary with id, title, content, modified

        Returns:
            List of created CTRMTruth objects
        """
        post_id = post.get("id")
        title = post.get("title", "Untitled")
        content = post.get("content", "")

        logger.info(f"Processing post {post_id}: {title}")

        # Get author info for scoring
        author_info = self.wp_client.get_post_author_info(post_id)
        author_role = author_info.role if hasattr(author_info, 'role') else "contributor"

        # Extract claims
        claims = await self.extractor.extract_claims(content, title)

        truths = []
        for claim in claims:
            # Check for similar existing truths (corroboration)
            try:
                similar = self.db.query_similar_truths(
                    await self.embedder.embed(claim.statement),
                    limit=5
                )
                corroboration = len([s for s in similar
                                   if claim.statement.lower() in s.get("statement", "").lower()])
            except Exception:
                corroboration = 0

            # Calculate triad score
            score = self.scorer.calculate_score(
                llm_confidence=claim.confidence,
                author_role=author_role,
                source_type=post.get("type", "post"),
                corroboration_count=corroboration
            )

            # Create truth in CTRM
            try:
                truth = await self.truth_manager.create_truth(
                    statement=claim.statement,
                    context=f"WordPress: {title}",
                    confidence=score.confidence,
                    importance_score=0.5,
                    category="wordpress_extracted",
                    metadata={
                        "source_url": f"{self.config.wordpress_url}/?p={post_id}",
                        "source_type": claim.evidence_type,
                        "triad_components": score.components
                    }
                )
                truths.append(truth)
                logger.debug(f"Created truth: {claim.statement[:50]}...")
            except Exception as e:
                logger.error(f"Failed to create truth: {e}")

        # Update WordPress post meta with CTRM info
        if truths:
            avg_confidence = sum(t.confidence for t in truths) / len(truths)
            self.wp_client.update_post_meta(
                post_id,
                "_ctrm_score",
                round(avg_confidence, 2)
            )
            self.wp_client.update_post_meta(
                post_id,
                "_ctrm_truth_count",
                len(truths)
            )
            self.wp_client.update_post_meta(
                post_id,
                "_last_extraction_time",
                datetime.now().isoformat()
            )
            logger.info(f"Updated post {post_id} with {len(truths)} truths, avg confidence: {avg_confidence:.2f}")

        return truths

    async def start(self):
        """Start the daemon main loop."""
        self._running = True
        logger.info(f"WordPress Truth Daemon started (poll interval: {self.config.poll_interval}s)")

        # Setup signal handlers
        def handle_signal(signum, frame):
            logger.info("Shutdown signal received")
            self._running = False

        signal.signal(signal.SIGTERM, handle_signal)
        signal.signal(signal.SIGINT, handle_signal)

        # Start verification scheduler in background
        scheduler_task = asyncio.create_task(self._run_scheduler())

        try:
            while self._running:
                try:
                    count = await self.run_discovery()
                    if count > 0:
                        logger.info(f"Discovery cycle complete: {count} truths extracted")
                    else:
                        logger.debug("Discovery cycle complete: no new truths")
                except Exception as e:
                    logger.error(f"Discovery cycle failed: {e}")

                await asyncio.sleep(self.config.poll_interval)
        finally:
            self.scheduler.stop()
            scheduler_task.cancel()
            self.db.close()
            logger.info("Daemon stopped")

    async def _run_scheduler(self):
        """Run the verification scheduler in background."""
        try:
            await self.scheduler.start()
        except asyncio.CancelledError:
            pass
        except Exception as e:
            logger.error(f"Scheduler error: {e}")

    def stop(self):
        """Stop the daemon."""
        self._running = False
        self.scheduler.stop()


def main():
    """CLI entry point."""
    import argparse

    parser = argparse.ArgumentParser(description="WordPress Truth Daemon")
    parser.add_argument("--poll-interval", type=int, default=60, help="Polling interval in seconds")
    parser.add_argument("--wordpress-url", default="http://localhost:8080", help="WordPress URL")
    parser.add_argument("--db-path", default="ctrm_llm_os.db", help="CTRM database path")
    parser.add_argument("--verbose", "-v", action="store_true", help="Enable verbose logging")

    args = parser.parse_args()

    logging.basicConfig(
        level=logging.DEBUG if args.verbose else logging.INFO,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s"
    )

    config = DaemonConfig(
        poll_interval=args.poll_interval,
        wordpress_url=args.wordpress_url,
        db_path=args.db_path
    )

    daemon = WordPressTruthDaemon(config)

    try:
        asyncio.run(daemon.start())
    except KeyboardInterrupt:
        daemon.stop()


if __name__ == "__main__":
    main()
