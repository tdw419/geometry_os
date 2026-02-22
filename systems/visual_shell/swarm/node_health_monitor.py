"""
Node Health Monitor - Periodically checks node liveness and manages failures.
"""

import asyncio
import logging
import time
from typing import List, Dict, Any
from systems.visual_shell.swarm.node_registry import NodeRegistry

logger = logging.getLogger(__name__)

class NodeHealthMonitor:
    """
    Monitors node heartbeats and triggers failover logic.
    """

    def __init__(self, registry: NodeRegistry, failure_threshold: int = 10):
        self.registry = registry
        self.failure_threshold = failure_threshold
        self.running = False
        self._monitor_task: Optional[asyncio.Task] = None

        logger.info(f"NodeHealthMonitor initialized: threshold={failure_threshold}s")

    async def check_health(self) -> List[str]:
        """Check all nodes for liveness and return a list of dead node IDs."""
        now = time.time()
        dead_nodes = []
        
        # We use a copy of the keys to avoid modification during iteration
        for node_id, info in list(self.registry.nodes.items()):
            if now - info["last_heartbeat"] > self.failure_threshold:
                dead_nodes.append(node_id)
                logger.warning(f"Node health check failed: {node_id} (last seen {int(now - info['last_heartbeat'])}s ago)")
                
        return dead_nodes

    async def start_monitoring(self, interval: float = 5.0):
        """Start the background monitoring loop."""
        self.running = True
        logger.info(f"Starting node health monitoring loop (interval: {interval}s)")
        
        while self.running:
            try:
                dead_nodes = await self.check_health()
                for node_id in dead_nodes:
                    # Remove from registry (this triggers leader reelection if needed)
                    await self.registry.unregister_node(node_id)
                    logger.error(f"Node {node_id} removed due to health failure.")
                
                await asyncio.sleep(interval)
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Error in health monitor loop: {e}")
                await asyncio.sleep(interval)

    async def stop_monitoring(self):
        """Stop the background monitoring loop."""
        self.running = False
        if self._monitor_task:
            self._monitor_task.cancel()
            try:
                await self._monitor_task
            except asyncio.CancelledError:
                pass
        logger.info("Node health monitoring stopped.")
