# systems/visual_shell/swarm/scanner_agent.py
"""
Scanner Agent - Specialized worker for catalog scanning.

Scans the infinite map for .rts.png artifacts, extracts metadata,
and verifies integrity.
"""

import asyncio
import hashlib
import json
import logging
import os
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Any
import websockets

logger = logging.getLogger(__name__)


@dataclass
class ScanResult:
    """Result of scanning a region."""
    region: Dict[str, int]
    scanned_at: float
    artifacts_found: List[Dict[str, Any]]
    errors: List[str] = field(default_factory=list)
    duration_ms: float = 0


class ScannerAgent:
    """
    Specialized agent for catalog scanning.

    Responsibilities:
    - Scan assigned map regions for .rts.png files
    - Extract metadata and compute SHA256 hashes
    - Report findings to Coordinator via A2A
    """

    def __init__(
        self,
        agent_id: str,
        region: Dict[str, int],
        a2a_url: str = "ws://localhost:8766",
        catalog_path: str = "."
    ):
        self.agent_id = agent_id
        self.region = region
        self.a2a_url = a2a_url
        self.catalog_path = Path(catalog_path)

        self.ws = None
        self.running = False
        self.scanned_count = 0
        self.artifacts = []

        logger.info(f"ScannerAgent {agent_id} initialized for region {region}")

    async def connect(self) -> bool:
        """Connect to A2A router and register."""
        try:
            self.ws = await websockets.connect(self.a2a_url, subprotocols=["a2a"])

            # Register with router
            await self.ws.send(json.dumps({
                "type": "register",
                "agent_id": self.agent_id,
                "agent_type": "scanner",
                "region": self.region
            }))

            response = json.loads(await self.ws.recv())
            if response.get("type") == "ack":
                logger.info(f"Scanner {self.agent_id} registered")
                return True

        except Exception as e:
            logger.error(f"Connection failed: {e}")
            return False

        return False

    async def scan_region(self) -> ScanResult:
        """Scan the assigned region for artifacts."""
        start_time = time.time()
        artifacts = []
        errors = []

        try:
            # Find .rts.png files in region (simulated for now)
            x, y = self.region["x"], self.region["y"]
            width, height = self.region["width"], self.region["height"]

            # Scan the catalog path
            for file_path in self.catalog_path.glob("**/*.rts.png"):
                try:
                    artifact = await self._scan_artifact(file_path)
                    if artifact:
                        artifacts.append(artifact)
                except Exception as e:
                    errors.append(f"Error scanning {file_path}: {e}")

            self.scanned_count += 1
            self.artifacts.extend(artifacts)

        except Exception as e:
            errors.append(f"Region scan failed: {e}")

        duration_ms = (time.time() - start_time) * 1000

        return ScanResult(
            region=self.region,
            scanned_at=time.time(),
            artifacts_found=artifacts,
            errors=errors,
            duration_ms=duration_ms
        )

    async def _scan_artifact(self, file_path: Path) -> Optional[Dict[str, Any]]:
        """Scan a single artifact file."""
        try:
            stat = file_path.stat()

            # Compute SHA256
            sha256 = hashlib.sha256()
            async for chunk in self._read_chunks(file_path):
                sha256.update(chunk)

            return {
                "path": str(file_path),
                "size_bytes": stat.st_size,
                "sha256": sha256.hexdigest(),
                "scanned_at": time.time(),
                "scanner_id": self.agent_id
            }

        except Exception as e:
            logger.error(f"Failed to scan {file_path}: {e}")
            return None

    async def _read_chunks(self, file_path: Path, chunk_size: int = 8192):
        """Async generator to read file in chunks."""
        with open(file_path, "rb") as f:
            while chunk := f.read(chunk_size):
                yield chunk
                await asyncio.sleep(0)  # Yield to event loop

    async def report_findings(self, result: ScanResult) -> bool:
        """Report scan results to coordinator."""
        if not self.ws:
            return False

        try:
            await self.ws.send(json.dumps({
                "type": "task_complete",
                "agent_id": self.agent_id,
                "task_type": "scan_region",
                "result": {
                    "region": result.region,
                    "artifacts_count": len(result.artifacts_found),
                    "errors_count": len(result.errors),
                    "duration_ms": result.duration_ms
                }
            }))
            return True
        except Exception as e:
            logger.error(f"Failed to report findings: {e}")
            return False

    async def run(self):
        """Main agent loop."""
        if not await self.connect():
            return

        self.running = True

        try:
            while self.running:
                # Scan region
                result = await self.scan_region()

                # Report findings
                await self.report_findings(result)

                # Wait before next scan
                await asyncio.sleep(5.0)

        except Exception as e:
            logger.error(f"Scanner loop error: {e}")
        finally:
            if self.ws:
                await self.ws.close()

    async def stop(self):
        """Stop the scanner."""
        self.running = False
