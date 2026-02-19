"""
Task Migrator - Detects and recovers orphaned tasks during node failures.
"""

import asyncio
import logging
from typing import List, Dict, Any
from systems.visual_shell.swarm.distributed_coordinator import DistributedCoordinator
from systems.visual_shell.swarm.node_registry import NodeRegistry

logger = logging.getLogger(__name__)

class TaskMigrator:
    """
    Handles task failover by detecting orphans and re-queueing them.
    """

    def __init__(self, coordinator: DistributedCoordinator, registry: NodeRegistry):
        self.coordinator = coordinator
        self.registry = registry

        logger.info(f"TaskMigrator initialized for coordinator: {coordinator.node_id}")

    async def detect_orphans(self) -> List[str]:
        """Detect tasks assigned to nodes that are no longer in the registry."""
        orphans = []
        for task_id, node_id in list(self.coordinator.task_node_assignments.items()):
            if node_id not in self.registry.nodes:
                # Node is gone, task is orphaned
                orphans.append(task_id)
                logger.warning(f"Orphaned task detected: {task_id} (assigned to lost node {node_id})")
        
        return orphans

    async def migrate_orphans(self):
        """Migrate orphaned tasks back to the pending queue for reassignment."""
        orphans = await self.detect_orphans()
        
        for task_id in orphans:
            if task_id in self.coordinator.active_tasks:
                task = self.coordinator.active_tasks[task_id]
                
                # Mark as pending again for retry/reassignment
                task.status = "pending"
                task.assigned_to = None
                
                # Re-add to coordinator's pending queue if not there
                if task not in self.coordinator.pending_tasks:
                    self.coordinator.pending_tasks.append(task)
                
                # Clear old node assignment
                if task_id in self.coordinator.task_node_assignments:
                    del self.coordinator.task_node_assignments[task_id]
                
                logger.info(f"Task {task_id} migrated back to pending queue for failover.")
            else:
                # Cleanup if task no longer active
                if task_id in self.coordinator.task_node_assignments:
                    del self.coordinator.task_node_assignments[task_id]
        
        return len(orphans)
