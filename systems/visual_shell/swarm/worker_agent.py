"""
WorkerAgent - Base class for all A2A-enabled agents in the Geometry OS swarm.

Provides core functionality for connecting to the A2A message bus,
handling messages, and basic lifecycle management.
"""

import asyncio
import json
import logging
from typing import Any

import websockets

class WorkerAgent:
    """Base class for A2A-enabled agents."""

    def __init__(self, agent_id: str, a2a_url: str = "ws://localhost:8766"):
        """
        Initialize the WorkerAgent.

        Args:
            agent_id: Unique identifier for this agent.
            a2a_url: WebSocket URL for the Agent-to-Agent (A2A) message bus.
        """
        self.agent_id = agent_id
        self.a2a_url = a2a_url
        self.capabilities: list[str] = []
        self.logger = logging.getLogger(self.__class__.__name__)
        self.websocket = None

    async def connect(self):
        """Connect to the A2A message bus and start listening for messages."""
        self.logger.info(f"Agent {self.agent_id} connecting to {self.a2a_url}...")
        try:
            async with websockets.connect(self.a2a_url) as websocket:
                self.websocket = websocket
                self.logger.info(f"Agent {self.agent_id} connected.")

                # Register the agent with the swarm
                await self.register()

                # Listen for incoming messages
                async for message in websocket:
                    try:
                        msg_data = json.loads(message)
                        self.logger.debug(f"Received message: {msg_data}")
                        response = await self.handle_message(msg_data)
                        if response:
                            await self.send(response)
                    except json.JSONDecodeError:
                        self.logger.error("Failed to decode incoming JSON message.")
                    except Exception as e:
                        self.logger.error(f"Error handling message: {e}")
        except (websockets.exceptions.ConnectionClosedError, ConnectionRefusedError) as e:
            self.logger.error(f"Connection to A2A bus failed: {e}. Retrying in 10 seconds...")
            await asyncio.sleep(10)
            await self.connect() # Simple retry logic

    async def register(self):
        """Register the agent with the A2A bus/registry."""
        registration_msg = {
            "type": "register_agent",
            "payload": self.get_registration_metadata()
        }
        await self.send(registration_msg)
        self.logger.info(f"Agent {self.agent_id} registration sent.")

    def get_registration_metadata(self) -> dict[str, Any]:
        """Get metadata for agent registration."""
        return {
            "agent_id": self.agent_id,
            "agent_type": "worker",
            "capabilities": self.capabilities,
        }

    async def handle_message(self, msg: dict[str, Any]) -> dict[str, Any] | None:
        """
        Handle incoming messages. Subclasses should override this method.
        """
        # Generic ping/pong for health checks
        if msg.get("type") == "ping":
            return {"type": "pong", "agent_id": self.agent_id}
        
        self.logger.warning(f"Unhandled message type: {msg.get('type')}")
        return None

    async def send(self, data: dict[str, Any]):
        """Send a JSON message to the A2A bus."""
        if self.websocket and self.websocket.open:
            try:
                await self.websocket.send(json.dumps(data))
                self.logger.debug(f"Sent message: {data}")
            except websockets.exceptions.ConnectionClosed:
                self.logger.error("Cannot send message, connection is closed.")
        else:
            self.logger.error("Cannot send message, not connected.")
