#!/usr/bin/env python3
"""
Swarm Monitor - Real-time health tracking for Geometry OS Swarm.

Monitors the A2A Router for agent activity and pushes health status
to the Visual Bridge for browser-based monitoring.
"""

import asyncio
import json
import logging
import time
import websockets
import sys
import os
from pathlib import Path
from collections import deque

# Add project root to path
sys.path.append(os.getcwd())

from systems.visual_shell.swarm.health_dashboard import HealthDashboard, HealthStatus

logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(name)s] %(message)s')
logger = logging.getLogger("swarm-monitor")

class SwarmMonitor:
    def __init__(self, a2a_url="ws://localhost:8766", bridge_url="ws://localhost:8768"):
        self.a2a_url = a2a_url
        self.bridge_url = bridge_url
        self.dashboard = HealthDashboard(stale_threshold_seconds=15.0)
        self.running = False
        self.a2a_ws = None
        self.bridge_ws = None
        # Task DAG tracking
        self.task_dag = {}  # task_id -> task info
        self.task_history = deque(maxlen=100)  # Recent task updates

    def _process_task_update(self, update: dict):
        """Process a task update and update the DAG."""
        task_id = update.get("task_id")
        if not task_id:
            return

        # Initialize or update task entry
        if task_id not in self.task_dag:
            self.task_dag[task_id] = {
                "task_id": task_id,
                "task_type": update.get("task_type", "unknown"),
                "status": update.get("status"),
                "assigned_to": None,
                "transitions": [],
                "created_at": update.get("timestamp"),
                "duration": None
            }

        task = self.task_dag[task_id]

        # Record transition
        task["transitions"].append({
            "from": update.get("previous_status"),
            "to": update.get("status"),
            "timestamp": update.get("timestamp"),
            "assigned_to": update.get("assigned_to")
        })

        # Update current state
        task["status"] = update.get("status")
        if update.get("assigned_to"):
            task["assigned_to"] = update.get("assigned_to")
        if update.get("duration"):
            task["duration"] = update.get("duration")

        # Add to history
        self.task_history.append({
            "task_id": task_id,
            "status": update.get("status"),
            "timestamp": update.get("timestamp")
        })

    def _get_task_dag_summary(self) -> dict:
        """Generate a summary of the task DAG for HUD rendering."""
        status_counts = {"pending": 0, "assigned": 0, "completed": 0, "failed": 0}

        for task in self.task_dag.values():
            status = task.get("status", "pending")
            if status in status_counts:
                status_counts[status] += 1

        # Get active tasks (not completed/failed)
        active_tasks = [
            {
                "task_id": t["task_id"],
                "task_type": t["task_type"],
                "status": t["status"],
                "assigned_to": t["assigned_to"],
                "duration": t["duration"],
                "transition_count": len(t["transitions"])
            }
            for t in self.task_dag.values()
            if t["status"] in ("pending", "assigned")
        ]

        return {
            "total_tasks": len(self.task_dag),
            **status_counts,
            "active_tasks": active_tasks,
            "recent_updates": list(self.task_history)[-10:]
        }

    async def connect_bridge(self):
        """Connect to the Visual Bridge."""
        try:
            self.bridge_ws = await websockets.connect(self.bridge_url)
            logger.info(f"🦾 Connected to Visual Bridge at {self.bridge_url}")
            return True
        except Exception as e:
            logger.error(f"❌ Failed to connect to Visual Bridge: {e}")
            return False

    async def connect_a2a(self):
        """Connect to the A2A Router."""
        try:
            self.a2a_ws = await websockets.connect(self.a2a_url, subprotocols=["a2a"])
            logger.info(f"🐝 Connected to A2A Router at {self.a2a_url}")
            
            # Register as monitor
            await self.a2a_ws.send(json.dumps({
                "type": "register",
                "agent_id": "swarm-monitor-daemon",
                "agent_type": "monitor"
            }))
            
            # Discover existing agents
            await self.a2a_ws.send(json.dumps({
                "type": "discover"
            }))
            
            return True
        except Exception as e:
            logger.error(f"❌ Failed to connect to A2A Router: {e}")
            return False

    async def run(self):
        self.running = True
        
        while self.running:
            if not self.bridge_ws:
                await self.connect_bridge()
            
            if not self.a2a_ws:
                if await self.connect_a2a():
                    # Start listening task for A2A events
                    asyncio.create_task(self.listen_a2a())
            
            # Update dashboard (detect stale)
            self.dashboard.get_stale_agents()
            
            # Push to bridge (health + task DAG)
            if self.bridge_ws:
                try:
                    await self.bridge_ws.send(json.dumps({
                        "type": "swarm_health",
                        "data": {
                            **self.dashboard.to_dict(),
                            "task_dag": self._get_task_dag_summary()
                        }
                    }))
                except Exception as e:
                    logger.warning(f"Bridge connection lost: {e}")
                    self.bridge_ws = None
            
            await asyncio.sleep(2.0)

    async def listen_a2a(self):
        """Listen for A2A Router messages and update health."""
        try:
            async for message in self.a2a_ws:
                data = json.loads(message)
                msg_type = data.get("type")
                
                if msg_type == "ack" and "agents" in data:
                    # Initial discovery result
                    for agent in data["agents"]:
                        self.dashboard.register_agent(agent["agent_id"], agent)
                
                elif msg_type == "event":
                    event_type = data.get("event_type")
                    event_data = data.get("data", {})
                    
                    if event_type == "agent_registered":
                        self.dashboard.register_agent(event_data["agent_id"], event_data)
                    elif event_type == "agent_unregistered":
                        self.dashboard.mark_offline(event_data["agent_id"])
                
                elif msg_type == "broadcast":
                    # Potentially heartbeat or progress update
                    from_agent = data.get("from_agent")
                    msg_category = data.get("message_type")
                    
                    if msg_category == "heartbeat":
                        self.dashboard.update_heartbeat(from_agent)
                    elif msg_category == "task_complete":
                        self.dashboard.update_heartbeat(from_agent)
                        # Could extract more stats here
                
                # Update heartbeat for any message from an agent
                from_agent = data.get("from_agent")
                if from_agent:
                    self.dashboard.update_heartbeat(from_agent)

        except Exception as e:
            logger.error(f"A2A listener error: {e}")
            self.a2a_ws = None

if __name__ == "__main__":
    monitor = SwarmMonitor()
    try:
        asyncio.run(monitor.run())
    except KeyboardInterrupt:
        logger.info("Stopping Swarm Monitor...")
