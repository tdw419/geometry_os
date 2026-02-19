"""
Distributed Coordinator - Extends CoordinatorAgent with cross-node routing and load balancing.
"""

import asyncio
import logging
import uuid
from typing import Dict, List, Optional, Any
from systems.visual_shell.swarm.coordinator_agent import CoordinatorAgent, SwarmTask
from systems.visual_shell.swarm.node_registry import NodeRegistry

logger = logging.getLogger(__name__)

class DistributedCoordinator(CoordinatorAgent):
    """
    Handles task orchestration across multiple nodes.
    """

    def __init__(self, node_id: str, registry: NodeRegistry, 
                 a2a_url: str = "ws://localhost:8766"):
        super().__init__(a2a_url=a2a_url, agent_id=node_id)
        self.node_id = node_id
        self.registry = registry
        self.task_node_assignments: Dict[str, str] = {}  # task_id -> node_id

        logger.info(f"DistributedCoordinator initialized for node: {node_id}")

    async def submit_task(
        self,
        task_type: str,
        params: Dict[str, Any],
        priority: int = 0,
        required_capability: Optional[str] = None
    ) -> str:
        """Submit a new task, optionally with capability requirements."""
        task_id = await super().submit_task(task_type, params, priority)
        
        # Store capability requirement in task object (extending it dynamically)
        task = self.active_tasks[task_id]
        task.required_capability = required_capability
        
        return task_id

    def select_target_node(self, task_id: str) -> Optional[str]:
        """Select the best node to handle a task based on capabilities and load."""
        if task_id not in self.active_tasks:
            return None
            
        task = self.active_tasks[task_id]
        required_cap = getattr(task, "required_capability", None)
        
        available_nodes = []
        for node_id, info in self.registry.nodes.items():
            metadata = info.get("metadata", {})
            capabilities = metadata.get("capabilities", [])
            
            if required_cap and required_cap not in capabilities:
                continue
            
            available_nodes.append((node_id, metadata.get("load", 0)))
            
        if not available_nodes:
            logger.warning(f"No suitable node found for task {task_id}")
            return None
            
        # Pick node with lowest load
        available_nodes.sort(key=lambda x: x[1])
        target_node = available_nodes[0][0]
        
        self.task_node_assignments[task_id] = target_node
        return target_node

    async def sync_task_state(self, task_id: str, state: Dict[str, Any]):
        """Synchronize task state from another node."""
        status = state.get("status")
        result = state.get("result")
        error = state.get("error")
        
        if task_id in self.active_tasks:
            task = self.active_tasks[task_id]
            task.status = status
            task.result = result
            task.error = error
            
            if status in ["completed", "failed"]:
                self.task_history.append(task)
                del self.active_tasks[task_id]
        else:
            # New task seen from another node
            task = SwarmTask(
                task_id=task_id,
                task_type=state.get("task_type", "unknown"),
                params=state.get("params", {}),
                status=status,
                result=result,
                error=error
            )
            if status in ["completed", "failed"]:
                self.task_history.append(task)
            else:
                self.active_tasks[task_id] = task

        logger.info(f"Task state synced: {task_id} -> {status}")
