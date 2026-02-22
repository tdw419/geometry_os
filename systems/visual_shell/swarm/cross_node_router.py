"""
Cross-Node Router - Handles secure messaging between swarm nodes.
"""

import asyncio
import logging
import websockets
import json
from typing import Dict, Any, Optional
from systems.visual_shell.swarm.node_registry import NodeRegistry

logger = logging.getLogger(__name__)

class CrossNodeRouter:
    """
    Routes messages between nodes using secure WebSockets.
    Integrates with SecurityMiddleware for signing and verification.
    """

    def __init__(self, node_id: str, registry: NodeRegistry, security: Any):
        self.node_id = node_id
        self.registry = registry
        self.security = security
        self.connections: Dict[str, Any] = {}

        logger.info(f"CrossNodeRouter initialized for node: {node_id}")

    async def send_to_node(self, target_node_id: str, message: Dict[str, Any], 
                           max_retries: int = 3) -> Dict[str, Any]:
        """Send a signed message to another node with retry logic."""
        if target_node_id not in self.registry.nodes:
            raise ValueError(f"Unknown node: {target_node_id}")

        node_info = self.registry.nodes[target_node_id]
        url = node_info["metadata"].get("url")
        if not url:
            raise ValueError(f"No URL found for node: {target_node_id}")

        # Sign the message using security middleware
        signed_message = await self.security.sign_outgoing(message)

        last_error = None
        for attempt in range(max_retries):
            try:
                return await self._send_to_url(url, signed_message)
            except Exception as e:
                last_error = e
                logger.warning(f"Failed to send to {target_node_id} (attempt {attempt+1}/{max_retries}): {e}")
                await asyncio.sleep(0.5 * (attempt + 1))

        logger.error(f"Failed to send message to {target_node_id} after {max_retries} attempts")
        raise last_error

    async def _send_to_url(self, url: str, signed_message: Dict[str, Any]) -> Dict[str, Any]:
        """Actual WebSocket transmission (to be mocked in tests)."""
        async with websockets.connect(url) as ws:
            await ws.send(json.dumps(signed_message))
            response = await ws.recv()
            return json.loads(response)

    async def handle_incoming(self, signed_message: Dict[str, Any], 
                              sender_id: str) -> Dict[str, Any]:
        """Verify and process an incoming cross-node message."""
        # Use security middleware to verify and extract
        result = await self.security.process_incoming(signed_message, sender_id)
        if not result["success"]:
            logger.warning(f"Security check failed for incoming message from {sender_id}: {result['error']}")
            return result

        # Message is verified, handle it
        payload = result["data"]
        logger.info(f"Processing secure message from {sender_id}: {payload.get('type')}")
        
        # Dispatch logic would go here
        return {"success": True, "status": "processed"}
