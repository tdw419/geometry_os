#!/usr/bin/env python3
"""
NEB Bridge Live: WebSocket Bridge to Real Geometry OS Agents

Bridges frontend NeuralEventBus.js to live backend agents using the real NEBBus.

Architecture:
[Frontend NeuralEventBus.js]
        ↓ WebSocket
[NEBBridgeLive Server]
        ↓ Real NEBBus
[Live Guild Agents (engineer, reviewer, architect, executor)]

Usage:
    python3 neb_bridge_live.py

Environment:
    Requires Geometry OS swarm system to be available.
"""

import asyncio
import json
import logging
import os
import sys
from datetime import datetime
from typing import Dict, Set, Optional, Any, List
from dataclasses import dataclass, asdict

# Add parent paths for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))))

try:
    from fastapi import FastAPI, WebSocket, WebSocketDisconnect
    from fastapi.middleware.cors import CORSMiddleware
    import uvicorn
except ImportError:
    print("Install: pip install fastapi uvicorn websockets")
    exit(1)

# Import real Geometry OS components
try:
    from systems.swarm.neb_bus import NEBBus
    from systems.swarm.neb_signal import NEBSignal
    from systems.swarm.task_board import TaskBoard
    from systems.swarm.guilds.factory import GuildFactory
    from systems.swarm.guilds.base import GuildAgent
    NEB_AVAILABLE = True
except ImportError as e:
    print(f"Warning: Geometry OS swarm not available: {e}")
    NEB_AVAILABLE = False

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [NEB-LIVE] %(message)s'
)
logger = logging.getLogger("NEBBridgeLive")

app = FastAPI(title="NEB Bridge Live", version="2.0.0")

# Enable CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@dataclass
class AgentState:
    """Represents an agent's cognitive state."""
    agent_id: str
    agent_type: str  # engineer, reviewer, architect, executor
    status: str  # active, thinking, sleeping, error
    current_task: Optional[str] = None
    belief_state: Dict[str, float] = None
    attention_focus: Optional[str] = None
    memory_activity: int = 0
    last_thought: Optional[str] = None
    tasks_completed: int = 0

    def __post_init__(self):
        if self.belief_state is None:
            self.belief_state = {
                'confidence': 0.7,
                'uncertainty': 0.2,
                'creativity': 0.5,
                'focus': 0.8
            }


class NEBBridgeLive:
    """
    Bridges frontend NeuralEventBus to live Geometry OS agents.
    """

    def __init__(self):
        self.connections: Set[WebSocket] = set()
        self.subscriptions: Dict[WebSocket, Set[str]] = {}
        self.agents: Dict[str, AgentState] = {}
        self.event_history: List[dict] = []
        self.max_history = 1000

        # Real NEB components
        self.neb_bus: Optional[NEBBus] = None
        self.task_board: Optional[TaskBoard] = None
        self.guild_agents: Dict[str, Any] = {}

        # Initialize
        if NEB_AVAILABLE:
            self._init_live_system()
        else:
            logger.warning("Live NEB not available, using mock mode")
            self._init_mock_agents()

    def _init_live_system(self):
        """Initialize the live NEB system with real agents."""
        logger.info("Initializing live NEB system...")

        # Create shared NEBBus
        self.neb_bus = NEBBus(node_id="neb-bridge-live")

        # Create TaskBoard
        storage_path = "/tmp/gos_neb_tasks.json"
        self.task_board = TaskBoard(storage_path=storage_path, event_bus=self.neb_bus)

        # Subscribe to all agent events on the NEB bus
        self.neb_bus.subscribe("agent.**", self._handle_neb_event)
        self.neb_bus.subscribe("guild.**", self._handle_neb_event)
        self.neb_bus.subscribe("task.**", self._handle_neb_event)
        self.neb_bus.subscribe("swarm.**", self._handle_neb_event)

        # Spawn live agents
        self._spawn_agents()

        logger.info(f"Live NEB initialized with {len(self.guild_agents)} agents")

    def _spawn_agents(self):
        """Spawn live guild agents."""
        agent_configs = [
            ("architect", "agent-arc-001"),
            ("engineer", "agent-eng-001"),
            ("engineer", "agent-eng-002"),
            ("reviewer", "agent-rev-001"),
            ("executor", "agent-exec-001"),
        ]

        for role, agent_id in agent_configs:
            try:
                agent = GuildFactory.create(
                    role=role,
                    agent_id=agent_id,
                    task_board=self.task_board,
                    event_bus=self.neb_bus,
                    auto_claim=False
                )

                if agent:
                    self.guild_agents[agent_id] = agent
                    self.agents[agent_id] = AgentState(
                        agent_id=agent_id,
                        agent_type=role,
                        status='active',
                        current_task='Waiting for tasks'
                    )
                    logger.info(f"Spawned {role} agent: {agent_id}")
            except Exception as e:
                logger.error(f"Failed to spawn {role} agent: {e}")

    def _handle_neb_event(self, signal: NEBSignal):
        """Handle events from the real NEB bus."""
        try:
            event_data = {
                'source_id': signal.source_id,
                'topic': signal.topic,
                'payload': signal.payload,
                'timestamp': signal.timestamp
            }

            # Store in history
            self.event_history.append(event_data)
            if len(self.event_history) > self.max_history:
                self.event_history.pop(0)

            # Update agent state if applicable
            self._update_agent_from_event(signal)

            # Broadcast to WebSocket clients
            asyncio.create_task(self._broadcast_to_clients(signal.topic, event_data))

        except Exception as e:
            logger.error(f"Error handling NEB event: {e}")

    def _update_agent_from_event(self, signal: NEBSignal):
        """Update agent state based on NEB event."""
        topic = signal.topic
        source = signal.source_id
        payload = signal.payload

        # Find or create agent state
        if source not in self.agents:
            # Try to determine agent type from source
            agent_type = "unknown"
            if "eng" in source.lower():
                agent_type = "engineer"
            elif "rev" in source.lower():
                agent_type = "reviewer"
            elif "arc" in source.lower():
                agent_type = "architect"
            elif "exec" in source.lower():
                agent_type = "executor"

            self.agents[source] = AgentState(
                agent_id=source,
                agent_type=agent_type,
                status='active'
            )

        agent = self.agents[source]

        # Update based on event type
        if "task.claimed" in topic:
            agent.status = "thinking"
            agent.current_task = payload.get("task_title", "Unknown task")
        elif "task.completed" in topic:
            agent.status = "active"
            agent.tasks_completed += 1
            agent.current_task = "Waiting for tasks"
        elif "task.failed" in topic:
            agent.status = "error"
            agent.current_task = f"Failed: {payload.get('error', 'Unknown error')}"
        elif "thought" in topic.lower():
            agent.status = "thinking"
            agent.last_thought = payload.get("thought", "")
            # Update belief state if provided
            if "belief_state" in payload:
                agent.belief_state.update(payload["belief_state"])

    async def _broadcast_to_clients(self, topic: str, data: dict):
        """Broadcast event to all subscribed WebSocket clients."""
        event = {
            'type': 'event',
            'topic': topic,
            'data': data,
            'timestamp': datetime.now().isoformat()
        }

        disconnected = set()
        for ws in self.connections:
            try:
                if self._matches_subscription(ws, topic):
                    await ws.send_json(event)
            except:
                disconnected.add(ws)

        for ws in disconnected:
            await self.disconnect(ws)

    def _init_mock_agents(self):
        """Initialize mock agents for demo mode."""
        agent_types = ['engineer', 'reviewer', 'architect', 'executor']

        for i, agent_type in enumerate(agent_types):
            agent_id = f"agent-{agent_type[:3]}-{i+1:03d}"
            self.agents[agent_id] = AgentState(
                agent_id=agent_id,
                agent_type=agent_type,
                status='active',
                current_task=f"Processing {agent_type} tasks"
            )

        logger.info(f"Initialized {len(self.agents)} mock agents")

    async def connect(self, websocket: WebSocket):
        """Register a new WebSocket connection."""
        await websocket.accept()
        self.connections.add(websocket)
        self.subscriptions[websocket] = set()
        logger.info(f"Client connected. Total: {len(self.connections)}")

        # Send initial state
        await self._send_initial_state(websocket)

    async def disconnect(self, websocket: WebSocket):
        """Remove a WebSocket connection."""
        self.connections.discard(websocket)
        self.subscriptions.pop(websocket, None)
        logger.info(f"Client disconnected. Total: {len(self.connections)}")

    async def _send_initial_state(self, websocket: WebSocket):
        """Send current agent states to new client."""
        # Send agent states
        for agent in self.agents.values():
            await websocket.send_json({
                'type': 'agent.state',
                'data': asdict(agent),
                'timestamp': datetime.now().isoformat()
            })

        # Send connection confirmation
        await websocket.send_json({
            'type': 'system.connected',
            'data': {
                'agent_count': len(self.agents),
                'mode': 'live' if self.neb_bus else 'mock',
                'neb_available': NEB_AVAILABLE
            },
            'timestamp': datetime.now().isoformat()
        })

    async def subscribe(self, websocket: WebSocket, pattern: str):
        """Subscribe a client to a topic pattern."""
        if websocket not in self.subscriptions:
            self.subscriptions[websocket] = set()
        self.subscriptions[websocket].add(pattern)
        logger.debug(f"Client subscribed to: {pattern}")

    async def handle_message(self, websocket: WebSocket, message: dict):
        """Handle incoming message from client."""
        msg_type = message.get('type')

        if msg_type == 'subscribe':
            pattern = message.get('pattern', '**')
            await self.subscribe(websocket, pattern)

        elif msg_type == 'emit':
            # Emit to the real NEB bus if available
            topic = message.get('topic', '')
            data = message.get('data', {})
            if self.neb_bus:
                self.neb_bus.publish(topic, data)
            await self._broadcast_to_clients(topic, data)

        elif msg_type == 'get_agents':
            await self._send_initial_state(websocket)

        elif msg_type == 'create_task':
            # Create a task on the task board
            if self.task_board:
                task = self.task_board.create_task(
                    title=message.get('title', 'New Task'),
                    description=message.get('description', ''),
                    task_type=message.get('task_type', 'CODE_GEN')
                )
                await websocket.send_json({
                    'type': 'task.created',
                    'data': {'task_id': task.id, 'title': task.title},
                    'timestamp': datetime.now().isoformat()
                })

    def _matches_subscription(self, websocket: WebSocket, topic: str) -> bool:
        """Check if topic matches any subscription pattern."""
        patterns = self.subscriptions.get(websocket, set())
        if not patterns:
            return True

        for pattern in patterns:
            if pattern == '**':
                return True
            if pattern == topic:
                return True
            if pattern.endswith('.*'):
                prefix = pattern[:-2]
                if topic.startswith(prefix + '.'):
                    return True
            if '.*.' in pattern:
                # Handle patterns like "agent.*.thought"
                import re
                regex = pattern.replace('.', r'\.').replace('*', '[^.]+')
                if re.match(f"^{regex}$", topic):
                    return True

        return False


# Global bridge instance
bridge = NEBBridgeLive()

@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    """WebSocket endpoint for NeuralEventBus clients."""
    await bridge.connect(websocket)

    try:
        while True:
            data = await websocket.receive_text()
            try:
                message = json.loads(data)
                await bridge.handle_message(websocket, message)
            except json.JSONDecodeError:
                await websocket.send_json({
                    'type': 'error',
                    'message': 'Invalid JSON'
                })
    except WebSocketDisconnect:
        await bridge.disconnect(websocket)

@app.get("/")
async def root():
    """API root."""
    return {
        "name": "NEB Bridge Live",
        "version": "2.0.0",
        "connections": len(bridge.connections),
        "agents": len(bridge.agents),
        "mode": "live" if bridge.neb_bus else "mock",
        "neb_available": NEB_AVAILABLE
    }

@app.get("/agents")
async def get_agents():
    """Get all agent states."""
    return {
        "agents": [asdict(a) for a in bridge.agents.values()],
        "count": len(bridge.agents)
    }

@app.get("/events")
async def get_events(limit: int = 50):
    """Get recent events."""
    return {
        "events": bridge.event_history[-limit:],
        "total": len(bridge.event_history)
    }

@app.post("/task")
async def create_task(title: str, description: str = "", task_type: str = "CODE_GEN"):
    """Create a new task on the task board."""
    if not bridge.task_board:
        return {"error": "Task board not available"}

    task = bridge.task_board.create_task(
        title=title,
        description=description,
        task_type=task_type
    )

    return {
        "task_id": task.id,
        "title": task.title,
        "status": task.status
    }

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="NEB Bridge Live for Geometry OS")
    parser.add_argument("--port", type=int, default=8769, help="Port to listen on")
    parser.add_argument("--host", default="0.0.0.0", help="Host to bind to")
    args = parser.parse_args()

    logger.info(f"Starting NEB Bridge Live on {args.host}:{args.port}")
    uvicorn.run(app, host=args.host, port=args.port, log_level="info")
