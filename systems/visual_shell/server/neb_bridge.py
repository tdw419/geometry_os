#!/usr/bin/env python3
"""
NEB Bridge: WebSocket Bridge for Neural Event Bus

Bridges frontend NeuralEventBus.js to backend NEB system,
enabling real-time agent activity visualization in morphological terminals.

Architecture:
[Frontend NeuralEventBus.js]
        ↓ WebSocket
[NEBBridge Server]
        ↓ Python NEB
[Swarm Agents / Intelligence]

Usage:
    python3 neb_bridge.py

WebSocket Protocol:
    Client → Server: {"type": "subscribe", "pattern": "agent.*"}
    Client → Server: {"type": "emit", "topic": "terminal.input", "data": {...}}
    Server → Client: {"type": "event", "topic": "agent.thought", "data": {...}}
"""

import asyncio
import json
import logging
import random
from datetime import datetime
from typing import Dict, Set, Optional, Any
from dataclasses import dataclass, asdict

try:
    from fastapi import FastAPI, WebSocket, WebSocketDisconnect
    from fastapi.middleware.cors import CORSMiddleware
    import uvicorn
except ImportError:
    print("Install: pip install fastapi uvicorn websockets")
    exit(1)

# Try to import the real NEB system
try:
    from systems.swarm.neb_bus import NEBBus
    from systems.swarm.neb_signal import NEBSignal
    NEB_AVAILABLE = True
except ImportError:
    NEB_AVAILABLE = False
    logging.warning("Backend NEB not available, using mock mode")

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [NEB-BRIDGE] %(message)s'
)
logger = logging.getLogger("NEBBridge")

app = FastAPI(title="NEB Bridge", version="1.0.0")

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
    agent_type: str  # architect, engineer, reviewer, executor
    status: str  # active, thinking, sleeping, error
    current_task: Optional[str] = None
    belief_state: Dict[str, float] = None
    attention_focus: Optional[str] = None
    memory_activity: int = 0
    last_thought: Optional[str] = None

    def __post_init__(self):
        if self.belief_state is None:
            self.belief_state = {}

class NEBBridge:
    """
    Bridges frontend NeuralEventBus to backend agent activity.
    """

    def __init__(self):
        self.connections: Set[WebSocket] = set()
        self.subscriptions: Dict[WebSocket, Set[str]] = {}
        self.agents: Dict[str, AgentState] = {}
        self.event_history = []
        self.max_history = 1000

        # Initialize mock agents if NEB not available
        if not NEB_AVAILABLE:
            self._init_mock_agents()

        # Start agent simulation
        self._simulate = not NEB_AVAILABLE

    def _init_mock_agents(self):
        """Initialize mock agents for demo mode."""
        agent_types = ['architect', 'engineer', 'reviewer', 'executor']

        for i, agent_type in enumerate(agent_types):
            agent_id = f"agent-{agent_type[:3]}-{i+1:03d}"
            self.agents[agent_id] = AgentState(
                agent_id=agent_id,
                agent_type=agent_type,
                status='active',
                current_task=f"Processing {agent_type} tasks",
                belief_state={
                    'confidence': random.uniform(0.6, 0.95),
                    'uncertainty': random.uniform(0.05, 0.3),
                    'creativity': random.uniform(0.3, 0.8),
                    'focus': random.uniform(0.5, 0.9)
                },
                attention_focus='code_analysis' if agent_type in ['engineer', 'reviewer'] else 'planning'
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
                'mode': 'mock' if self._simulate else 'live'
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
            topic = message.get('topic', '')
            data = message.get('data', {})
            await self.broadcast_event(topic, data)

        elif msg_type == 'get_agents':
            await self._send_initial_state(websocket)

    async def broadcast_event(self, topic: str, data: dict):
        """Broadcast event to all subscribed clients."""
        event = {
            'type': 'event',
            'topic': topic,
            'data': data,
            'timestamp': datetime.now().isoformat()
        }

        # Store in history
        self.event_history.append(event)
        if len(self.event_history) > self.max_history:
            self.event_history.pop(0)

        # Send to matching subscribers
        disconnected = set()
        for ws in self.connections:
            try:
                if self._matches_subscription(ws, topic):
                    await ws.send_json(event)
            except:
                disconnected.add(ws)

        # Clean up disconnected
        for ws in disconnected:
            await self.disconnect(ws)

    def _matches_subscription(self, websocket: WebSocket, topic: str) -> bool:
        """Check if topic matches any subscription pattern."""
        patterns = self.subscriptions.get(websocket, set())
        if not patterns:
            return True  # No subscriptions = receive all

        for pattern in patterns:
            if pattern == '**':
                return True
            if pattern == topic:
                return True
            if pattern.endswith('.*'):
                prefix = pattern[:-2]
                if topic.startswith(prefix + '.'):
                    return True

        return False

    async def simulate_agent_activity(self):
        """Simulate agent activity for demo mode."""
        if not self._simulate:
            return

        thoughts = [
            "Analyzing code structure...",
            "Processing semantic tokens...",
            "Generating morphological patterns...",
            "Optimizing Hilbert synthesis...",
            "Evaluating geometric coherence...",
            "Synthesizing SDF textures...",
            "Updating belief state...",
            "Focusing attention on new task...",
        ]

        statuses = ['active', 'thinking', 'active', 'active', 'sleeping']

        while self._simulate:
            try:
                # Pick random agent
                agent = random.choice(list(self.agents.values()))

                # Update state
                old_status = agent.status
                agent.status = random.choice(statuses)
                agent.memory_activity = random.randint(0, 100)

                # Update belief state
                for key in agent.belief_state:
                    delta = random.uniform(-0.1, 0.1)
                    agent.belief_state[key] = max(0, min(1, agent.belief_state[key] + delta))

                # Generate thought event
                if agent.status == 'thinking':
                    agent.last_thought = random.choice(thoughts)
                    await self.broadcast_event(
                        f'agent.{agent.agent_type}.thought',
                        {
                            'agent_id': agent.agent_id,
                            'thought': agent.last_thought,
                            'belief_state': agent.belief_state
                        }
                    )

                # Broadcast state change
                await self.broadcast_event(
                    f'agent.{agent.agent_type}.state_change',
                    {
                        'agent_id': agent.agent_id,
                        'old_status': old_status,
                        'new_status': agent.status,
                        'memory_activity': agent.memory_activity
                    }
                )

                await asyncio.sleep(random.uniform(0.5, 2.0))

            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Simulation error: {e}")
                await asyncio.sleep(1)

# Global bridge instance
bridge = NEBBridge()

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
        "name": "NEB Bridge",
        "version": "1.0.0",
        "connections": len(bridge.connections),
        "agents": len(bridge.agents),
        "mode": "mock" if bridge._simulate else "live"
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

@app.on_event("startup")
async def startup_event():
    """Start background tasks."""
    if bridge._simulate:
        asyncio.create_task(bridge.simulate_agent_activity())
        logger.info("Started agent simulation")

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="NEB Bridge for Geometry OS")
    parser.add_argument("--port", type=int, default=8768, help="Port to listen on")
    parser.add_argument("--host", default="0.0.0.0", help="Host to bind to")
    parser.add_argument("--no-sim", action="store_true", help="Disable mock simulation")
    args = parser.parse_args()

    if args.no_sim:
        bridge._simulate = False

    logger.info(f"Starting NEB Bridge on {args.host}:{args.port}")
    uvicorn.run(app, host=args.host, port=args.port, log_level="info")
