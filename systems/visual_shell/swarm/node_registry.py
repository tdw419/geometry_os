"""
Node Registry - Handles node discovery, registration, and leader election.
"""

import asyncio
import time
import logging
from typing import Dict, Any, List, Optional

logger = logging.getLogger(__name__)

class NodeRegistry:
    """
    Manages a cluster of swarm nodes.
    Tracks heartbeats and performs leader election.
    """

    def __init__(self, heartbeat_timeout: int = 30):
        self.nodes: Dict[str, Dict] = {}
        self.leader_id: Optional[str] = None
        self.heartbeat_timeout = heartbeat_timeout

        logger.info(f"NodeRegistry initialized with timeout: {heartbeat_timeout}s")

    async def register_node(self, node_id: str, metadata: Dict[str, Any]):
        """Register a node with metadata."""
        self.nodes[node_id] = {
            "metadata": metadata,
            "registered_at": time.time(),
            "last_heartbeat": time.time(),
            "status": "online"
        }
        logger.info(f"Node registered: {node_id}")
        
        # If no leader, hold an election
        if not self.leader_id:
            await self.elect_leader()

    async def update_heartbeat(self, node_id: str):
        """Update node heartbeat."""
        if node_id in self.nodes:
            self.nodes[node_id]["last_heartbeat"] = time.time()
            self.nodes[node_id]["status"] = "online"

    async def unregister_node(self, node_id: str):
        """Unregister a node."""
        if node_id in self.nodes:
            del self.nodes[node_id]
            logger.info(f"Node unregistered: {node_id}")
            
            # If the leader was removed, elect a new one
            if self.leader_id == node_id:
                self.leader_id = None
                await self.elect_leader()

    async def check_timeouts(self):
        """Check for timed-out nodes and remove them."""
        now = time.time()
        to_remove = []
        
        for node_id, info in self.nodes.items():
            if now - info["last_heartbeat"] > self.heartbeat_timeout:
                to_remove.append(node_id)
        
        for node_id in to_remove:
            logger.warning(f"Node {node_id} timed out, removing.")
            await self.unregister_node(node_id)

    async def elect_leader(self) -> Optional[str]:
        """Elect a leader from registered nodes."""
        if not self.nodes:
            self.leader_id = None
            return None
            
        # Simple election: Node with highest priority, or first node by ID
        # For this prototype, we'll use priority if present, otherwise alphabetical
        sorted_nodes = sorted(
            self.nodes.items(),
            key=lambda x: (x[1]["metadata"].get("priority", 0), x[0]),
            reverse=True
        )
        
        self.leader_id = sorted_nodes[0][0]
        logger.info(f"Leader elected: {self.leader_id}")
        return self.leader_id

    def get_cluster_status(self) -> Dict[str, Any]:
        """Get summary of cluster status."""
        return {
            "leader_id": self.leader_id,
            "total_nodes": len(self.nodes),
            "nodes": list(self.nodes.keys())
        }
