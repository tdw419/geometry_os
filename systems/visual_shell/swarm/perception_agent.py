"""
PerceptionAgent - The 'Retina' of the Swarm.

Specialist agent for visual perception and extraction tasks.
Wraps the ExtractionPipeline to provide OCR, semantic clustering,
and reverse UI engineering capabilities.
"""

import asyncio
import json
import logging
import os
import sys
from typing import Dict, Any, Optional

# Add extraction pipeline to path
EXTRACTION_PIPELINE_PATH = os.path.join(
    os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__)))),
    "conductor", "tracks", "shotcut-on-the-map"
)
if EXTRACTION_PIPELINE_PATH not in sys.path:
    sys.path.insert(0, EXTRACTION_PIPELINE_PATH)

from systems.visual_shell.swarm.worker_agent import WorkerAgent

logger = logging.getLogger(__name__)


class PerceptionAgent(WorkerAgent):
    """
    The 'Retina' of the Swarm.

    A specialist agent that handles visual perception tasks including:
    - Visual extraction (OCR + clustering + widget detection)
    - Semantic clustering of UI elements
    - Reverse UI engineering

    This agent wraps the ExtractionPipeline and exposes it via the
    A2A (Agent-to-Agent) messaging protocol.
    """

    AGENT_CAPABILITIES = [
        "perception",
        "visual_extraction",
        "ocr",
        "semantic_clustering",
        "reverse_ui_engineering"
    ]

    def __init__(self, agent_id: str, a2a_url: str = "ws://localhost:8766",
                 ascii_width: int = 80, ascii_height: int = 24):
        """
        Initialize the PerceptionAgent.

        Args:
            agent_id: Unique identifier for this agent
            a2a_url: WebSocket URL for A2A communication
            ascii_width: Width of ASCII view in characters
            ascii_height: Height of ASCII view in characters
        """
        super().__init__(agent_id=agent_id, a2a_url=a2a_url)
        self.capabilities = list(self.AGENT_CAPABILITIES)
        self.ascii_width = ascii_width
        self.ascii_height = ascii_height
        self._pipeline = None
        self.logger.info(f"PerceptionAgent {self.agent_id} online")

    @property
    def pipeline(self):
        """
        Lazy-load the ExtractionPipeline.

        The pipeline is only loaded when first accessed to avoid
        importing heavy dependencies during agent initialization.
        """
        if self._pipeline is None:
            try:
                from extraction_pipeline import ExtractionPipeline
                self._pipeline = ExtractionPipeline(
                    ascii_width=self.ascii_width,
                    ascii_height=self.ascii_height
                )
                self.logger.info("ExtractionPipeline loaded")
            except ImportError as e:
                self.logger.error(f"Failed to load ExtractionPipeline: {e}")
                raise
        return self._pipeline

    def get_registration_metadata(self) -> Dict[str, Any]:
        """
        Get metadata for agent registration.

        Returns:
            Dict with agent_type, capabilities, and district info
        """
        return {
            "agent_id": self.agent_id,
            "agent_type": "specialist",
            "capabilities": [
                "visual_extraction",
                "ocr",
                "semantic_clustering",
                "reverse_ui_engineering"
            ],
            "district": "COGNITIVE"
        }

    async def _run_extraction(self, image_path: str) -> Dict[str, Any]:
        """
        Run extraction pipeline in executor to avoid blocking.

        Args:
            image_path: Path to the image to extract

        Returns:
            Dict with extraction results
        """
        loop = asyncio.get_event_loop()

        def extract():
            result = self.pipeline.extract(image_path)
            return result.to_dict()

        return await loop.run_in_executor(None, extract)

    async def handle_message(self, msg: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """
        Handle incoming A2A messages.

        Args:
            msg: Message dict with type and payload

        Returns:
            Response dict or None if message not handled
        """
        msg_type = msg.get("type")

        if msg_type == "extract_visuals":
            return await self._handle_extract_visuals(msg)

        # Unknown message type
        self.logger.debug(f"Unhandled message type: {msg_type}")
        return None

    async def _handle_extract_visuals(self, msg: Dict[str, Any]) -> Dict[str, Any]:
        """
        Handle extract_visuals request.

        Expected message format:
            {
                "type": "extract_visuals",
                "image_path": "/path/to/screenshot.png"
            }

        Returns:
            Dict with extraction results or error
        """
        image_path = msg.get("image_path")

        if not image_path:
            return {
                "type": "extraction_error",
                "error": "Missing image_path in request",
                "agent_id": self.agent_id
            }

        if not os.path.exists(image_path):
            return {
                "type": "extraction_error",
                "error": f"Image not found: {image_path}",
                "agent_id": self.agent_id
            }

        try:
            self.logger.info(f"Extracting visuals from: {image_path}")
            result = await self._run_extraction(image_path)

            return {
                "type": "extraction_result",
                "agent_id": self.agent_id,
                "image_path": image_path,
                "result": result
            }

        except Exception as e:
            self.logger.error(f"Extraction failed: {e}")
            return {
                "type": "extraction_error",
                "error": str(e),
                "agent_id": self.agent_id,
                "image_path": image_path
            }


# CLI entry point for testing
if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="PerceptionAgent - Visual Extraction Specialist")
    parser.add_argument("--id", default="perception-001", help="Agent ID")
    parser.add_argument("--url", default="ws://localhost:8766", help="A2A WebSocket URL")
    parser.add_argument("--test-extract", metavar="IMAGE", help="Test extraction on image file")
    parser.add_argument("--width", type=int, default=80, help="ASCII view width")
    parser.add_argument("--height", type=int, default=24, help="ASCII view height")

    args = parser.parse_args()

    # Configure logging
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s [%(name)s] %(message)s'
    )

    agent = PerceptionAgent(
        agent_id=args.id,
        a2a_url=args.url,
        ascii_width=args.width,
        ascii_height=args.height
    )

    if args.test_extract:
        # Test extraction mode
        async def test_extraction():
            result = await agent._handle_extract_visuals({
                "type": "extract_visuals",
                "image_path": args.test_extract
            })
            print(json.dumps(result, indent=2))

        asyncio.run(test_extraction())
    else:
        # Normal agent mode
        try:
            asyncio.run(agent.connect())
        except KeyboardInterrupt:
            print("\nPerceptionAgent shutting down...")
