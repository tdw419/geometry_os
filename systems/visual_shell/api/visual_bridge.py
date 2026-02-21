#!/usr/bin/env python3
"""
Visual Bridge - Geometry OS
===========================

The central communication hub between AI agents (Evolution Daemon, etc.)
and the PixiJS Visual Shell.

Capabilities:
- Semantic Memory Retrieval (Hippocampus)
- Mirror Validation Results (Master Stage)
- RISC-V UART Streaming (Neuro-Silicon Bridge)
- Token Visualization Update (Neural City)
- Visual Action Routing
- Ambient Narrative System (WordPress WebMCP)

Port: 8768 (WebSocket)
"""

import asyncio
import json
import os
import sys
import socket
import time
import uuid
import websockets
from websockets.server import serve
import numpy as np
import argparse
from pathlib import Path
from typing import Dict, Any, Optional, List
from aiohttp import web

# Add project root to path for imports
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, PROJECT_ROOT)

# Import SynapticQueryEngine for semantic search
from systems.neural_city.synaptic_query_engine import SynapticQueryEngine

# Import Spatial Tectonics components (Phase 28 Step 2)
from systems.visual_shell.api.tectonic_handler import TectonicHandler
from systems.visual_shell.api.vat_manager import VATManager

# Import Semantic Notification Bridge (PixelRTS v3 integration)
from systems.visual_shell.api.semantic_notification_bridge import (
    SemanticNotificationBridge,
    NotificationEvent,
)

# Import Evolution WebMCP Bridge (Ambient Narrative System)
try:
    from systems.visual_shell.api.evolution_webmcp_bridge import (
        EvolutionWebMCPBridge,
        EvolutionWebMCPHook
    )
    HAS_WEBMCP_BRIDGE = True
except ImportError:
    HAS_WEBMCP_BRIDGE = False
    EvolutionWebMCPBridge = None
    EvolutionWebMCPHook = None

class VisualBridge:
    def __init__(self, memory_socket="/tmp/vector_memory_daemon.sock", ws_port=8768, map_size=4096):
        self.memory_socket = memory_socket
        self.ws_port = ws_port
        self.map_size = map_size
        self.clients = set()
        self.lock_file = "/tmp/visual_bridge.pid"

        # ASCII Scene Graph state
        self.ascii_scene_dir = Path(".geometry/ascii_scene")
        self.ascii_scene_files: Dict[str, str] = {}  # filename -> content cache
        self._ascii_renderers_registered = False

        # Spatial Tectonics (Phase 28)
        self.consensus_engine = None  # Initialized lazily
        self._tectonic_enabled = True

        # Tectonic components (Step 2)
        self.tectonic_handler = TectonicHandler()
        self.vat_manager = VATManager()

        # Heat Map Aggregator (Visual Hotspot Debugger)
        self.heat_aggregator: Optional[Any] = None  # Initialized in start_heat_aggregator()
        self._heat_aggregator_enabled = True

        # Semantic Notification Bridge (WordPress → Terminal)
        self.semantic_bridge = SemanticNotificationBridge()

        # Ambient Narrative System (WordPress WebMCP)
        self.webmcp_bridge: Optional[EvolutionWebMCPBridge] = None
        self._narrative_session_id: Optional[int] = None
        self._webmcp_enabled = True  # Can be disabled via CLI

        # Current session state for narrative
        self._ambient_state = "MONITORING"
        self._fps_data = {"fps": 60.0, "draw_calls": 0, "last_update": time.time()}

        # Agent task queue for WordPress agent requests
        self.agent_task_queue: Dict[str, dict] = {}
        self.task_counter = 0

        # HTTP server for REST endpoints (WordPress agent requests)
        self.http_port = 8769  # Different from WebSocket port
        self.app = web.Application()

        # Register HTTP routes
        self._setup_http_routes()

    def _setup_http_routes(self) -> None:
        """Setup HTTP routes for WordPress agent requests."""
        self.app.router.add_post('/agent/request', self._handle_agent_request_http)
        self.app.router.add_get('/agent/status/{task_id}', self._handle_agent_status_http)

    async def _handle_agent_request_http(self, request: web.Request) -> web.Response:
        """HTTP endpoint for agent requests from WordPress."""
        try:
            data = await request.json()
            result = self.handle_agent_request(data)
            status_code = 200 if result.get('status') != 'error' else 400
            return web.json_response(result, status=status_code)
        except json.JSONDecodeError:
            return web.json_response(
                {'status': 'error', 'message': 'Invalid JSON'},
                status=400
            )
        except Exception as e:
            return web.json_response(
                {'status': 'error', 'message': str(e)},
                status=500
            )

    async def _handle_agent_status_http(self, request: web.Request) -> web.Response:
        """HTTP endpoint to check task status."""
        task_id = request.match_info['task_id']
        status = self.get_task_status(task_id)
        status_code = 200 if status.get('status') != 'error' else 404
        return web.json_response(status, status=status_code)

    def handle_agent_request(self, data: dict) -> dict:
        """
        Handle agent request from WordPress.

        Args:
            data: Dict containing:
                - agent_type: One of 'content_intelligence', 'evolution_publish', 'plugin_analysis'
                - payload: Dict with request-specific data
                - request_id: Optional unique request identifier

        Returns:
            Dict with 'status' and 'task_id' or 'error' and 'message'
        """
        agent_type = data.get('agent_type')
        payload = data.get('payload', {})
        request_id = data.get('request_id', str(uuid.uuid4()))

        valid_agent_types = ['content_intelligence', 'evolution_publish', 'plugin_analysis']
        if agent_type not in valid_agent_types:
            return {'status': 'error', 'message': f'Unknown agent type: {agent_type}'}

        self.task_counter += 1
        task_id = f"wp-{agent_type}-{self.task_counter}-{int(time.time())}"

        task = {
            'task_id': task_id,
            'request_id': request_id,
            'agent_type': agent_type,
            'payload': payload,
            'status': 'queued',
            'created_at': time.time(),
            'result': None
        }

        self.agent_task_queue[task_id] = task

        # Notify Evolution Daemon via pulse system (only if event loop running)
        try:
            loop = asyncio.get_running_loop()
            loop.create_task(self._send_agent_pulse(task))
        except RuntimeError:
            # No event loop running - pulse will be sent when server starts
            pass

        return {'status': 'queued', 'task_id': task_id}

    def get_task_status(self, task_id: str) -> dict:
        """Get status of agent task."""
        task = self.agent_task_queue.get(task_id)
        if not task:
            return {'status': 'error', 'message': f'Task not found: {task_id}'}

        return {
            'task_id': task_id,
            'status': task['status'],
            'result': task.get('result')
        }

    async def _send_agent_pulse(self, task: dict) -> None:
        """Send neural pulse to trigger Evolution Daemon."""
        pulse = {
            'type': 'agent_request',
            'event': 'agent_request',
            'task': task,
            'timestamp': task['created_at']
        }
        await self._broadcast(pulse)

    def _is_already_running(self):
        """Check if another instance of visual_bridge is already running via PID file."""
        if not os.path.exists(self.lock_file):
            return False
        
        try:
            with open(self.lock_file, 'r') as f:
                pid = int(f.read().strip())
            
            # Check if process with this PID actually exists
            os.kill(pid, 0)
            return True
        except (ValueError, ProcessLookupError, PermissionError, OSError):
            return False

    def _acquire_lock(self):
        """Write current PID to lock file."""
        with open(self.lock_file, 'w') as f:
            f.write(str(os.getpid()))

    def _release_lock(self):
        """Remove the PID lock file."""
        if os.path.exists(self.lock_file):
            try:
                os.remove(self.lock_file)
            except OSError:
                pass

    def _query_memory_daemon(self, message):
        """Send a message to the Vector Memory Daemon and get response"""
        try:
            if not os.path.exists(self.memory_socket):
                return {"error": f"Memory socket not found at {self.memory_socket}"}

            with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as sock:
                sock.connect(self.memory_socket)
                sock.sendall(json.dumps(message).encode('utf-8'))

                # Receive response
                response_data = b""
                while True:
                    chunk = sock.recv(4096)
                    if not chunk:
                        break
                    response_data += chunk

                if not response_data:
                    return {"error": "Empty response from memory daemon"}

                return json.loads(response_data.decode('utf-8'))
        except Exception as e:
            print(f"❌ Failed to connect to Memory Daemon: {e}")
            return {"error": str(e)}

    async def handle_client(self, websocket):
        """Handle WebSocket client (Browser or AI Agent)"""
        self.clients.add(websocket)
        print(f"🔌 Connection established: {websocket.remote_address}")
        try:
            async for message in websocket:
                try:
                    data = json.loads(message)
                except json.JSONDecodeError:
                    continue

                msg_type = data.get('type')

                # 1. Semantic Memory Retrieval
                if msg_type == 'recall_memories':
                    await self._handle_recall_memories(websocket, data)

                # 2. Mirror Validation Results (from AI Agent)
                elif msg_type == 'mirror_validation_result' or data.get('method') == 'broadcast_event':
                    # Handle both flat and JSON-RPC formats
                    event_data = data
                    if data.get('method') == 'broadcast_event':
                        params = data.get('params', {})
                        event_data = {
                            'type': params.get('type'),
                            **params.get('data', {})
                        }
                    
                    print(f"🪞 Received event: {event_data.get('type')}")
                    # Broadcast to all clients (specifically the browser)
                    await self._broadcast(event_data)

                # 3. RISC-V UART Output (Neuro-Silicon Bridge)
                elif msg_type == 'riscv_uart':
                    # Broadcast UART output to browser HUD
                    uart_text = data.get('text', data.get('data', {}).get('text', ''))
                    print(f"🦾 RISC-V UART: {uart_text[:50]}...")
                    await self._broadcast({
                        'type': 'RISCV_UART_OUTPUT',
                        'data': {
                            'text': uart_text,
                            'bytes': data.get('bytes', []),
                            'timestamp': data.get('timestamp'),
                            'vm_id': data.get('vm_id', 'riscv-gpu-vm')
                        }
                    })

                # 3b. RISC-V Execution State (Execution Traces)
                elif msg_type == 'riscv_state':
                    # Broadcast execution state to browser for Silicon District pulses
                    print(f"⚡ RISC-V State: PC=0x{data.get('pc', 0):08x}, Cycles={data.get('cycles', 0)}")
                    await self._broadcast({
                        'type': 'RISCV_STATE_UPDATE',
                        'data': data
                    })

                # 3c. Shotcut Visual HUD Update
                elif msg_type == 'shotcut_frame':
                    # Broadcast frame + extraction data to browser HUD
                    print(f"🎬 Shotcut Frame: {len(data.get('widgets', []))} widgets detected")
                    await self._broadcast({
                        'type': 'SHOTCUT_FRAME_UPDATE',
                        'data': data
                    })

                # 4. Swarm Health Updates
                elif msg_type == 'swarm_health':
                    # Broadcast Swarm Health to browser HUD
                    print(f"🐝 Swarm Health Update received")
                    await self._broadcast({
                        'type': 'SWARM_HEALTH_UPDATE',
                        'data': data.get('data', {})
                    })

                # 5. Collective Consciousness Thoughts (Glass Box)
                elif msg_type == 'thought_journal':
                    # Broadcast thought to browser HUD
                    thought_data = data.get('data', {})
                    print(f"🧠 Thought Journal: {thought_data.get('agent_id')} → {thought_data.get('thought_type')}")
                    await self._broadcast({
                        'type': 'THOUGHT_JOURNAL',
                        'data': thought_data
                    })

                # 6. Task DAG Updates (Distributed Task Visualization)
                elif msg_type == 'task_update':
                    # Broadcast task update to browser HUD
                    task_data = data.get('data', data)
                    print(f"📋 Task Update: {task_data.get('task_id')} → {task_data.get('status')}")
                    await self._broadcast({
                        'type': 'TASK_DAG_UPDATE',
                        'data': task_data
                    })

                # 7. Agent Relocation (District Rebalancing)
                elif msg_type == 'agent_relocated':
                    # Broadcast agent relocation to browser HUD
                    relocation_data = data.get('data', data)
                    agent_id = relocation_data.get('agent_id', 'unknown')
                    to_district = relocation_data.get('to_district', 'unknown')
                    print(f"🔀 Agent Relocated: {agent_id} → {to_district}")
                    await self._broadcast({
                        'type': 'AGENT_RELOCATED',
                        'data': relocation_data
                    })

                # 16. Diagnostic Pulse Events (Perceptual Bridge V16)
                elif msg_type == 'diagnostic_pulse':
                    status = data.get('status', 'HEALTHY')
                    district_id = data.get('district_id', 'silicon')
                    matched_pattern = data.get('matched_pattern', '')
                    detected_text = data.get('detected_text', '')

                    print(f"🔮 Diagnostic Pulse: {district_id} → {status}")
                    if status == 'CRITICAL':
                        print(f"   ⚠️  ANOMALY: {matched_pattern}")

                    await self._broadcast({
                        "type": "DIAGNOSTIC_PULSE",
                        "district_id": district_id,
                        "status": status,
                        "matched_pattern": matched_pattern,
                        "detected_text": detected_text[:200],
                        "timestamp": data.get('timestamp', time.time())
                    })

                    if status == 'CRITICAL':
                        await self._broadcast({
                            "type": "QUARANTINE_DISTRICT",
                            "district_id": district_id,
                            "reason": matched_pattern,
                            "severity": "CRITICAL",
                            "timestamp": data.get('timestamp', time.time())
                        })

                # 8. Echo/Ping
                elif msg_type == 'ping':
                    await websocket.send(json.dumps({'type': 'pong'}))

                # 9. Token Visualization Update (Neural City)
                elif msg_type == 'token_visualization_update':
                    await self.relay_token_pulse(data)

                # 9b. Tectonic Drift Update (Neural City V15)
                elif msg_type == 'tectonic_drift':
                    # Relay 16KB float32 buffer (base64 encoded in 'data' field)
                    await self._broadcast({
                        "type": "tectonic_drift_update",
                        "data": data.get("data")
                    })

                # 10. Synaptic Query (Semantic Search)
                elif msg_type == 'synaptic_query':
                    response = await self._handle_synaptic_query(data)
                    await websocket.send(json.dumps(response))

                # 11. ASCII Scene Graph Events
                elif msg_type == 'ascii_scene_update':
                    # Broadcast ASCII file update to all clients
                    filename = data.get('filename')
                    content = data.get('content')
                    if filename:
                        self.ascii_scene_files[filename] = content
                        await self._broadcast({
                            "type": "ascii_scene_update",
                            "filename": filename,
                            "content": content,
                            "timestamp": data.get('timestamp', time.time())
                        })

                elif msg_type == 'ascii_scene_request':
                    # Client requests list of ASCII files
                    await self.broadcast_ascii_scene_list()
                    # Also send current cached content
                    for filename, content in self.ascii_scene_files.items():
                        await websocket.send(json.dumps({
                            "type": "ascii_scene_update",
                            "filename": filename,
                            "content": content,
                            "timestamp": time.time()
                        }))

                # 12. Neural City Events (from NeuralCityHookBroadcaster)
                elif msg_type == 'neural_city_event':
                    event_type = data.get('event_type')
                    print(f"🏙️ Neural City Event: {event_type}")
                    await self._broadcast({
                        "type": "NEURAL_CITY_EVENT",
                        "data": data
                    })
                    # Trigger ASCII file refresh
                    await self.broadcast_ascii_file("neural_city_map.ascii")

                # 13. Visual Shell Events (from VisualShellHookBroadcaster)
                elif msg_type == 'visual_shell_event':
                    event_type = data.get('event_type')
                    print(f"🪟 Visual Shell Event: {event_type}")
                    await self._broadcast({
                        "type": "VISUAL_SHELL_EVENT",
                        "data": data
                    })
                    # Trigger ASCII file refresh
                    await self.broadcast_ascii_file("shell_fragments.ascii")

                # 14. Evolution Events (from EvolutionHookBroadcaster)
                elif msg_type == 'evolution_event':
                    event_type = data.get('event_type')
                    print(f"🧬 Evolution Event: {event_type}")
                    await self._broadcast({
                        "type": "EVOLUTION_EVENT",
                        "data": data
                    })
                    # Trigger ASCII file refresh
                    await self.broadcast_ascii_file("evolution_pas.ascii")

                # 14b. WordPress Semantic Publishing (Memory District)
                elif msg_type == 'wordpress_publish':
                    title = data.get('title', 'Untitled')
                    content = data.get('content', '')
                    url = data.get('url', '')
                    print(f"📝 WordPress Publish: {title}")

                    # Create notification event for semantic bridge
                    event = NotificationEvent(
                        title=title,
                        content=content,
                        url=url,
                    )

                    # Broadcast to browser clients
                    await self._broadcast({
                        "type": "WORDPRESS_PUBLISH",
                        "title": title,
                        "content": content,
                        "url": url,
                        "timestamp": time.time()
                    })

                    # Send to geometric terminal (PixelRTS v3)
                    terminal_op = self.semantic_bridge.to_terminal_opcode(event)
                    await self._broadcast(terminal_op)
                    print(f"📺 Terminal notification: {title[:40]}...")

                # 15a. Mutation Batch Events (Evolution Daemon)
                elif msg_type == 'mutation_batch':
                    # Broadcast mutation batch to all clients for visualization
                    mutations = data.get('mutations', [])
                    generation = data.get('generation', 0)
                    print(f"🧬 Mutation Batch: {len(mutations)} mutations in generation {generation}")
                    await self._broadcast({
                        "type": "WEIGHT_MUTATION_BATCH",
                        "data": {
                            "mutations": mutations,
                            "generation": generation,
                            "timestamp": data.get('timestamp', time.time() * 1000)
                        }
                    })

                # 15b. District Upgrade Events (Neural City)
                elif msg_type == 'district_upgrade':
                    # Broadcast district upgrade with animation data
                    district_id = data.get('district_id')
                    upgrade_type = data.get('upgrade_type', 'capacity')
                    animation_data = data.get('animation', {})
                    print(f"🏙️ District Upgrade: {district_id} ({upgrade_type})")
                    await self._broadcast({
                        "type": "DISTRICT_UPGRADE",
                        "data": {
                            "district_id": district_id,
                            "upgrade_type": upgrade_type,
                            "animation": animation_data,
                            "timestamp": data.get('timestamp', time.time() * 1000)
                        }
                    })

                # 15. Tectonic Pulse Events (Phase 28: Spatial Tectonics)
                elif msg_type == 'tectonic_pulse':
                    # Forward pulse to ConsensusEngine for spatial realignment
                    source = data.get('source', 0)
                    dest = data.get('dest', 0)
                    pulse_type = data.get('pulse_type', 'violet')
                    volume = data.get('volume', 1.0)
                    print(f"🌋 Tectonic Pulse: {source} → {dest} ({pulse_type}, vol={volume})")

                    # Record in ConsensusEngine if available
                    if hasattr(self, 'consensus_engine') and self.consensus_engine:
                        from systems.evolution_daemon.spatial_tectonics import PulseEvent
                        event = PulseEvent(
                            source_tile=source,
                            dest_tile=dest,
                            pulse_type=pulse_type,
                            volume=volume,
                            timestamp=time.time()
                        )
                        self.consensus_engine.record_pulse(event)

                    # Broadcast to browser for visualization
                    await self._broadcast({
                        "type": "TECTONIC_PULSE",
                        "source": source,
                        "dest": dest,
                        "pulse_type": pulse_type,
                        "volume": volume,
                        "timestamp": data.get('timestamp', time.time() * 1000)
                    })

                # 16. Tectonic Realignment Proposal (from ConsensusEngine)
                elif msg_type == 'tectonic_proposal':
                    # Forward proposal to Rust TectonicSimulator via TectonicHandler
                    proposal_id = data.get('proposal_id')
                    bonds = data.get('bonds', [])
                    print(f"🌋 Tectonic Proposal: {proposal_id} with {len(bonds)} bonds")

                    # Process proposal through TectonicHandler
                    success = self.tectonic_handler.process_proposal(data)

                    # Check for layout delta from Rust (simulated for now)
                    delta = self.tectonic_handler.read_layout_delta()
                    if not delta:
                        # Simulate delta if Rust not available
                        delta = self.tectonic_handler.simulate_delta(data)

                    # Apply delta to VAT
                    moved_count = self.vat_manager.apply_delta(delta)
                    print(f"🌍 Applied layout delta: {moved_count} tiles moved")

                    # Broadcast for HUD display with full status
                    status = self.tectonic_handler.get_status()
                    await self._broadcast({
                        "type": "TECTONIC_PROPOSAL",
                        "proposal_id": proposal_id,
                        "bonds": bonds,
                        "expected_improvement": data.get('expected_improvement', 0),
                        "timestamp": data.get('timestamp', time.time() * 1000),
                        "delta_applied": moved_count,
                        "status": status
                    })

                    # Trigger ASCII file refresh
                    await self.broadcast_ascii_file("tectonic_activity.ascii")

                # 17. Heat Access Events (Visual Hotspot Debugger)
                elif msg_type == 'heat_access':
                    # Record heat access from external sources (e.g., RISC-V executor)
                    heat_x = data.get('x', 0)
                    heat_y = data.get('y', 0)
                    access_type = data.get('access_type', 'unknown')
                    source = data.get('source', 'unknown')

                    if self.heat_aggregator:
                        self.heat_aggregator.record_access(heat_x, heat_y, source)
                        print(f"🔥 Heat Access: ({heat_x}, {heat_y}) from {source}")
                    else:
                        print(f"⚠️  Heat Aggregator not initialized, ignoring heat_access")

                # 18. Heat Memory Access Events (from RISC-V executor)
                elif msg_type == 'heat_memory_access':
                    # Record heat for memory access (linear address)
                    address = data.get('address', 0)
                    access_type = data.get('access_type', 'read')
                    source = data.get('source', 'riscv')

                    if self.heat_aggregator:
                        self.heat_aggregator.record_memory_access(address, source)
                        print(f"🔥 Heat Memory: 0x{address:x} ({access_type}) from {source}")

                # 19. Alpine Linux Live Tile Handlers (v3)
                elif msg_type == 'alpine_input':
                    # Forward input to LiveTileService
                    tile_id = data.get('tile_id')
                    input_text = data.get('input', '')
                    source = data.get('source', 'human')
                    print(f"⌨️ Alpine Input: {tile_id} <- '{input_text.strip()}' ({source})")
                    
                    # Implementation depends on LiveTileService integration
                    # For now, broadcast to all (including agents)
                    await self._broadcast({
                        "type": "ALPINE_INPUT_RELAY",
                        "tile_id": tile_id,
                        "input": input_text,
                        "source": source
                    })

                elif msg_type == 'alpine_output':
                    # Relay terminal grid updates to browser
                    await self._broadcast({
                        "type": "ALPINE_OUTPUT",
                        "data": data
                    })

                elif msg_type == 'alpine_focus':
                    # Handle focus changes
                    tile_id = data.get('tile_id')
                    focused = data.get('focused', False)
                    print(f"🎯 Alpine Focus: {tile_id} -> {'FOCUSED' if focused else 'IDLE'}")
                    await self._broadcast({
                        "type": "ALPINE_FOCUS_UPDATE",
                        "tile_id": tile_id,
                        "focused": focused
                    })

                elif msg_type == 'alpine_stats':
                    # Relay metrics
                    await self._broadcast({
                        "type": "ALPINE_STATS",
                        "data": data
                    })

                # === Track Coordination (WordPress Git Coordination) ===

                elif msg_type == 'track_claim':
                    # Track claim event from WordPress Track Board
                    track_id = data.get('track_id')
                    agent_id = data.get('agent_id')
                    files = data.get('files', [])
                    coordinates = data.get('coordinates', {'x': 0, 'y': 0})

                    print(f"🎯 Track Claimed: {track_id} by {agent_id} ({len(files)} files)")

                    await self._broadcast({
                        "type": "TRACK_CLAIMED",
                        "track_id": track_id,
                        "agent_id": agent_id,
                        "files": files,
                        "coordinates": coordinates,
                        "timestamp": data.get('timestamp', time.time())
                    })

                elif msg_type == 'track_release':
                    # Track release event from WordPress Track Board
                    track_id = data.get('track_id')
                    agent_id = data.get('agent_id')

                    print(f"🔓 Track Released: {track_id} by {agent_id}")

                    await self._broadcast({
                        "type": "TRACK_RELEASED",
                        "track_id": track_id,
                        "agent_id": agent_id,
                        "timestamp": data.get('timestamp', time.time())
                    })

                # === Ambient Narrative System (V2.0) ===

                elif msg_type == 'narrative_event':
                    # AI agent publishing a thought or steering action
                    event_type = data.get('event_type', 'thought')
                    session_id = data.get('session_id', self._narrative_session_id)
                    print(f"📖 Narrative Event: {event_type} (session={session_id})")

                    # Relay to WordPress via WebMCP
                    if self.webmcp_bridge and session_id:
                        if event_type == 'thought':
                            result = self.webmcp_bridge.invoke_tool('publishNarrative', {
                                'session_id': session_id,
                                'thought': data.get('thought', ''),
                                'state': data.get('state', 'MONITORING')
                            })
                        elif event_type == 'steering':
                            result = self.webmcp_bridge.invoke_tool('steerSession', {
                                'session_id': session_id,
                                'action': data.get('action', ''),
                                'target': data.get('target', '')
                            })
                        else:
                            result = {'success': False, 'error': f'Unknown event type: {event_type}'}

                        if result.get('success'):
                            print(f"   ✅ Published to WordPress")

                    # Broadcast to browser clients
                    await self._broadcast({
                        "type": "NARRATIVE_EVENT",
                        "event_type": event_type,
                        "data": data
                    })

                elif msg_type == 'scene_graph_update':
                    # PixiJS streaming scene graph for AI analysis
                    scene_graph = data.get('scene_graph', {})
                    session_id = data.get('session_id', self._narrative_session_id)
                    fps = data.get('fps', 60.0)
                    draw_calls = data.get('draw_calls', 0)

                    # Update local FPS tracking
                    self._fps_data = {
                        "fps": fps,
                        "draw_calls": draw_calls,
                        "last_update": time.time()
                    }

                    # Relay to WordPress
                    if self.webmcp_bridge and session_id:
                        self.webmcp_bridge.invoke_tool('scene_update', {
                            'session_id': session_id,
                            'scene_graph': scene_graph
                        })

                    # Optional: Forward to VLM for visual analysis
                    # This would be handled by a separate service

                elif msg_type == 'daemon_heartbeat':
                    # Evolution daemon status update
                    daemon_state = data.get('state', 'unknown')
                    evolution_count = data.get('evolution_count', 0)
                    visual_connected = data.get('visual_connected', False)

                    print(f"💓 Daemon Heartbeat: {daemon_state} (evolutions={evolution_count})")

                    # Update ambient state
                    self._ambient_state = daemon_state

                    # Relay to WordPress
                    if self.webmcp_bridge:
                        self.webmcp_bridge.invoke_tool('daemon_status', {
                            'state': daemon_state,
                            'evolution_count': evolution_count,
                            'visual_connected': visual_connected,
                            'fps': self._fps_data.get('fps', 60.0),
                            'draw_calls': self._fps_data.get('draw_calls', 0)
                        })

                    # Broadcast to browser
                    await self._broadcast({
                        "type": "DAEMON_HEARTBEAT",
                        "state": daemon_state,
                        "evolution_count": evolution_count,
                        "visual_connected": visual_connected
                    })

                elif msg_type == 'get_narrative_session':
                    # Client requesting current session info
                    if self.webmcp_bridge:
                        result = self.webmcp_bridge.invoke_tool('get_narrative_session', {})
                        if result.get('success') and result.get('result', {}).get('session'):
                            self._narrative_session_id = result['result']['session'].get('id')
                    await websocket.send(json.dumps({
                        "type": "narrative_session",
                        "session_id": self._narrative_session_id,
                        "ambient_state": self._ambient_state
                    }))

                # === GOSR Radio Broadcast Events ===

                elif msg_type == 'radio_broadcast':
                    # Radio segment broadcast from GOSR (Geometry OS Radio)
                    station_id = data.get('station_id', '87.6')
                    segment_type = data.get('segment_type', 'NEWS')
                    content = data.get('content', '')
                    timestamp = data.get('timestamp', time.time())

                    print(f"📻 Radio Broadcast: {station_id} FM [{segment_type}] {content[:50]}...")

                    # Broadcast to all WebSocket clients (browser HUD, etc.)
                    await self._broadcast({
                        "type": "RADIO_BROADCAST",
                        "station_id": station_id,
                        "segment_type": segment_type,
                        "content": content,
                        "timestamp": timestamp,
                        "entropy": data.get('entropy', 0.5),
                        "evolution_count": data.get('evolution_count', 0)
                    })

        except websockets.exceptions.ConnectionClosed:
            pass
        except Exception as e:
            print(f"❌ Error handling client: {e}")
        finally:
            if websocket in self.clients:
                self.clients.remove(websocket)
            print(f"🔌 Connection closed: {websocket.remote_address}")

    async def _handle_recall_memories(self, websocket, data):
        world_x = data.get('x', 0)
        world_y = data.get('y', 0)
        
        norm_x = world_x / self.map_size
        norm_y = world_y / self.map_size
        
        query_vector = data.get('embedding')
        if not query_vector:
            query_vector = np.random.rand(1536).tolist()
        
        memory_msg = {
            'message_type': 'GetMemoryBeam',
            'payload': {
                'query_vector': query_vector,
                'current_x': norm_x,
                'current_y': norm_y,
                'limit': 20
            }
        }
        
        response = self._query_memory_daemon(memory_msg)
        
        if 'beam' in response:
            memories = []
            for m in response['beam']:
                memories.append({
                    'x': m['hilbert_x'] * self.map_size,
                    'y': m['hilbert_y'] * self.map_size,
                    'similarity': m['similarity'],
                    'preview': m['token'],
                    'timestamp': m['timestamp']
                })
            
            await websocket.send(json.dumps({
                'type': 'memory_beam_results',
                'memories': memories
            }))
        else:
            await websocket.send(json.dumps({
                'type': 'error',
                'message': f"Memory retrieval failed: {response.get('error')}"
            }))

    async def _handle_synaptic_query(self, data: Dict[str, Any]) -> Dict[str, Any]:
        """
        Handle a synaptic_query message by routing to SynapticQueryEngine.

        Args:
            data: Dict containing 'query' (str) and optional 'limit' (int)

        Returns:
            Dict with:
                - type: 'synaptic_query_response'
                - results: List of search results
                - navigate_to: Best match coordinates (or None if no results)
        """
        query_text = data.get('query', '')
        limit = data.get('limit', 10)

        # Create engine and execute query
        engine = SynapticQueryEngine()
        results = engine.query(query_text, limit=limit)

        # Build response
        response = {
            'type': 'synaptic_query_response',
            'results': results,
            'navigate_to': None
        }

        # Include navigate_to for best match (highest similarity, already sorted)
        if results:
            best = results[0]
            response['navigate_to'] = {
                'x': best['x'],
                'y': best['y']
            }

        return response

    async def _broadcast(self, data):
        """Broadcast a message to all connected clients"""
        if not self.clients:
            return

        message = json.dumps(data)
        await asyncio.gather(*[client.send(message) for client in self.clients], return_exceptions=True)

    # --- ASCII Scene Graph Methods ---

    async def broadcast_ascii_file(self, filename: str) -> None:
        """
        Read and broadcast an ASCII file to all connected clients.

        Args:
            filename: Name of the .ascii file in .geometry/ascii_scene/
        """
        try:
            filepath = self.ascii_scene_dir / filename
            if not filepath.exists():
                return

            content = filepath.read_text()
            self.ascii_scene_files[filename] = content

            await self._broadcast({
                "type": "ascii_scene_update",
                "filename": filename,
                "content": content,
                "timestamp": time.time()
            })
            print(f"📄 ASCII Scene: {filename} updated ({len(content)} bytes)")
        except Exception as e:
            print(f"❌ Failed to broadcast ASCII file {filename}: {e}")

    async def broadcast_ascii_scene_list(self) -> None:
        """Broadcast list of available ASCII scene files."""
        try:
            if not self.ascii_scene_dir.exists():
                return

            files = list(self.ascii_scene_dir.glob("*.ascii"))
            file_list = [f.name for f in files]

            await self._broadcast({
                "type": "ascii_scene_list",
                "files": file_list,
                "timestamp": time.time()
            })
        except Exception as e:
            print(f"❌ Failed to list ASCII files: {e}")

    def register_ascii_renderers(self) -> None:
        """
        Register ASCII renderers with their respective hook broadcasters.

        This wires up the NeuralCity, VisualShell, and Evolution ASCII
        renderers to receive events and generate .ascii files.
        """
        if self._ascii_renderers_registered:
            return

        try:
            from systems.visual_shell.ascii_scene import wire_all_renderers

            # Wire all renderers to their broadcasters
            results = wire_all_renderers(output_dir=str(self.ascii_scene_dir))

            # Store references for potential future use
            self._ascii_renderers = results

            print(f"📄 ASCII Scene Graph renderers registered ({len(results)} types)")
            self._ascii_renderers_registered = True

        except ImportError as e:
            print(f"⚠️ Could not register ASCII renderers: {e}")

    def _setup_ascii_scene_watcher(self) -> None:
        """
        Setup file watcher for ASCII scene directory.

        This monitors .geometry/ascii_scene/ for changes and broadcasts
        updates to connected clients.
        """
        # This is a simple polling-based watcher
        # In production, consider using watchdog library
        asyncio.create_task(self._ascii_scene_poller())

    async def _ascii_scene_poller(self) -> None:
        """Poll ASCII scene directory for changes and broadcast updates."""
        while True:
            try:
                await asyncio.sleep(1.0)  # Poll every second

                if not self.ascii_scene_dir.exists():
                    continue

                for filepath in self.ascii_scene_dir.glob("*.ascii"):
                    filename = filepath.name
                    try:
                        content = filepath.read_text()
                        if filename not in self.ascii_scene_files or \
                           self.ascii_scene_files[filename] != content:
                            self.ascii_scene_files[filename] = content
                            await self._broadcast({
                                "type": "ascii_scene_update",
                                "filename": filename,
                                "content": content,
                                "timestamp": time.time()
                            })
                    except Exception:
                        pass
            except asyncio.CancelledError:
                break
            except Exception as e:
                print(f"⚠️ ASCII scene poller error: {e}")
                await asyncio.sleep(5.0)  # Back off on error

    async def relay_token_pulse(self, token_event: dict):
        """
        Relay a token visualization event to Neural City clients.

        Args:
            token_event: Dict with hilbert_x, hilbert_y, token, timestamp
        """
        if not self.clients:
            return

        # Transform to Neural City pulse format
        pulse_message = {
            "type": "neural_city_pulse",
            "x": token_event.get("hilbert_x", 0),
            "y": token_event.get("hilbert_y", 0),
            "token": token_event.get("token", ""),
            "timestamp": token_event.get("timestamp", 0)
        }

        # Use existing _broadcast method
        await self._broadcast(pulse_message)

    async def start(self):
        """Start the Visual Bridge server with singleton enforcement."""
        # Check for existing instance
        if self._is_already_running():
            print(f"🛑 Visual Bridge is already running (PID lock found at {self.lock_file})")
            print("   Connect as a client instead: VisualBridgeClient()")
            sys.exit(1)

        # Acquire lock
        self._acquire_lock()

        print(f"🚀 Visual Bridge starting...")
        print(f"   WebSocket: ws://localhost:{self.ws_port}")
        print(f"   Memory Daemon: {self.memory_socket}")
        print(f"   PID Lock: {self.lock_file}")

        try:
            # Register ASCII renderers and start watcher
            self.register_ascii_renderers()
            self._setup_ascii_scene_watcher()

            # Initialize Spatial Tectonics (Phase 28)
            if self._tectonic_enabled:
                await self._setup_spatial_tectonics()

            # Initialize Perceptual Bridge V16 (New)
            await self._setup_perceptual_bridge()

            # Initialize Heat Aggregator (Visual Hotspot Debugger)
            if self._heat_aggregator_enabled:
                await self.start_heat_aggregator()

            # Initialize WebMCP Bridge (Ambient Narrative System)
            if self._webmcp_enabled:
                await self._setup_webmcp_bridge()

            async with serve(self.handle_client, "0.0.0.0", self.ws_port):
                await asyncio.Future()
        finally:
            # Release lock on shutdown
            self._release_lock()
            print("🔓 PID lock released")

    async def _setup_spatial_tectonics(self):
        """Initialize the Spatial Tectonics ConsensusEngine."""
        try:
            from systems.evolution_daemon.spatial_tectonics import ConsensusEngine
            self.consensus_engine = ConsensusEngine(
                aggregation_window_secs=60,
                min_pulse_count=10,
                min_bond_strength=0.1
            )
            await self.consensus_engine.start()
            print("🌋 Spatial Tectonics initialized (60s aggregation window)")
        except ImportError as e:
            print(f"⚠️  Spatial Tectonics not available: {e}")
            self.consensus_engine = None
        except Exception as e:
            print(f"⚠️  Failed to initialize Spatial Tectonics: {e}")
            self.consensus_engine = None

    async def _setup_perceptual_bridge(self):
        """Initialize the Perceptual Bridge for Silicon District monitoring."""
        try:
            from systems.neural_city.perceptual_bridge import PerceptualBridge

            self.perceptual_bridge = PerceptualBridge(
                ws_url=f"ws://localhost:{self.ws_port}",
                district_id="silicon",
                scan_interval=2.0
            )

            # Start as background task
            asyncio.create_task(self.perceptual_bridge.start())
            print("🔮 Perceptual Bridge V16 initialized (2s scan interval)")

        except ImportError as e:
            print(f"⚠️  Perceptual Bridge not available: {e}")
            self.perceptual_bridge = None
        except Exception as e:
            print(f"⚠️  Failed to initialize Perceptual Bridge: {e}")
            self.perceptual_bridge = None

    async def _setup_webmcp_bridge(self):
        """Initialize the WebMCP Bridge for Ambient Narrative System."""
        if not HAS_WEBMCP_BRIDGE:
            print("⚠️  WebMCP Bridge not available (evolution_webmcp_bridge not imported)")
            return

        try:
            # Get WordPress URL from environment or use default
            wordpress_url = os.environ.get('WORDPRESS_URL', 'http://localhost:8080')

            self.webmcp_bridge = EvolutionWebMCPBridge(
                wordpress_url=wordpress_url,
                enabled=True
            )

            # Get or create narrative session
            result = self.webmcp_bridge.invoke_tool('get_narrative_session', {})
            if result.get('success') and result.get('result', {}).get('session'):
                self._narrative_session_id = result['result']['session'].get('id')
                print(f"📖 WebMCP Bridge initialized (session={self._narrative_session_id})")
            else:
                # Create new session
                result = self.webmcp_bridge.invoke_tool('create_narrative_session', {})
                if result.get('success'):
                    self._narrative_session_id = result.get('result', {}).get('session_id')
                    print(f"📖 WebMCP Bridge initialized (new session={self._narrative_session_id})")
                else:
                    print(f"⚠️  Failed to create narrative session: {result.get('error')}")

            print(f"   WordPress URL: {wordpress_url}")

        except Exception as e:
            print(f"⚠️  Failed to initialize WebMCP Bridge: {e}")
            self.webmcp_bridge = None

    # --- Heat Aggregator Methods (Visual Hotspot Debugger) ---

    async def start_heat_aggregator(self, vat_manager: Optional[Any] = None):
        """
        Start the heat aggregation service.

        The HeatAggregator collects access patterns from multiple sources
        (RISC-V execution, FUSE filesystem, Evolution Daemon) and broadcasts
        a real-time heat map to connected clients.

        Args:
            vat_manager: Optional VATManager instance (uses self.vat_manager if not provided)

        Example:
            bridge = VisualBridge()
            await bridge.start_heat_aggregator()
            # Heat map updates will be broadcast via WebSocket
        """
        if self.heat_aggregator is not None:
            print("⚠️  Heat Aggregator already running")
            return

        try:
            try:
                from .heat_aggregator import HeatAggregator
            except ImportError:
                from systems.visual_shell.api.heat_aggregator import HeatAggregator

            vat = vat_manager or self.vat_manager
            self.heat_aggregator = HeatAggregator(self, vat)
            await self.heat_aggregator.start()
            print("🔥 Heat Aggregator started (1 Hz update rate)")

        except ImportError as e:
            print(f"⚠️  Heat Aggregator not available: {e}")
            self.heat_aggregator = None
        except Exception as e:
            print(f"⚠️  Failed to initialize Heat Aggregator: {e}")
            self.heat_aggregator = None

    async def stop_heat_aggregator(self):
        """
        Stop the heat aggregation service.

        Persists the current heat state to disk before stopping.
        """
        if self.heat_aggregator is not None:
            await self.heat_aggregator.stop()
            self.heat_aggregator = None
            print("🔥 Heat Aggregator stopped")

    def record_heat_access(self, x: int, y: int, source: str = "unknown"):
        """
        Record a heat access event at the given coordinates.

        Convenience method that delegates to HeatAggregator.record_access().

        Args:
            x: Grid X coordinate
            y: Grid Y coordinate
            source: Source identifier (e.g., "riscv", "fuse", "evolution")
        """
        if self.heat_aggregator is not None:
            self.heat_aggregator.record_access(x, y, source)

    def record_heat_memory_access(self, address: int, source: str = "riscv"):
        """
        Record a heat access event for a memory address.

        Convenience method that delegates to HeatAggregator.record_memory_access().

        Args:
            address: Linear memory address
            source: Source identifier (default: "riscv")
        """
        if self.heat_aggregator is not None:
            self.heat_aggregator.record_memory_access(address, source)


class VisualBridgeClient:
    """
    Client for connecting to a running Visual Bridge server.

    AI agents should use this class instead of starting their own VisualBridge
    to avoid port conflicts and state fragmentation.

    Usage:
        client = VisualBridgeClient()
        await client.connect()

        # Send events
        await client.broadcast("mirror_validation_result", {"task_id": "...", "passed": True})
        await client.send("riscv_uart", {"text": "Hello from RISC-V"})

        # Disconnect when done
        await client.disconnect()
    """

    def __init__(self, ws_url: str = "ws://localhost:8768", agent_id: str = None):
        self.ws_url = ws_url
        self.agent_id = agent_id or f"agent-{os.getpid()}"
        self._ws = None
        self._connected = False

    async def connect(self) -> bool:
        """Connect to the Visual Bridge server."""
        if self._connected:
            return True

        try:
            self._ws = await websockets.connect(self.ws_url)
            self._connected = True
            print(f"🔌 {self.agent_id} connected to Visual Bridge at {self.ws_url}")
            return True
        except Exception as e:
            print(f"❌ {self.agent_id} failed to connect to Visual Bridge: {e}")
            return False

    async def disconnect(self):
        """Disconnect from the Visual Bridge server."""
        if self._ws:
            await self._ws.close()
            self._ws = None
            self._connected = False
            print(f"🔌 {self.agent_id} disconnected from Visual Bridge")

    async def send(self, msg_type: str, data: dict) -> bool:
        """
        Send a message to the Visual Bridge.

        Args:
            msg_type: Message type (e.g., "riscv_uart", "mirror_validation_result")
            data: Message payload

        Returns:
            True if sent successfully, False otherwise
        """
        if not self._connected:
            if not await self.connect():
                return False

        try:
            message = {"type": msg_type, **data}
            await self._ws.send(json.dumps(message))
            return True
        except Exception as e:
            print(f"❌ {self.agent_id} failed to send message: {e}")
            self._connected = False
            return False

    async def broadcast(self, msg_type: str, data: dict) -> bool:
        """
        Send a broadcast event to all connected clients.

        This is an alias for send() - all messages are broadcast by the server.
        """
        return await self.send(msg_type, data)

    async def receive(self, timeout: float = None) -> Optional[dict]:
        """
        Receive a message from the Visual Bridge.

        Args:
            timeout: Optional timeout in seconds

        Returns:
            Message dict or None if timeout/no message
        """
        if not self._connected:
            if not await self.connect():
                return None

        try:
            if timeout:
                message = await asyncio.wait_for(self._ws.recv(), timeout=timeout)
            else:
                message = await self._ws.recv()
            return json.loads(message)
        except asyncio.TimeoutError:
            return None
        except Exception as e:
            print(f"❌ {self.agent_id} failed to receive message: {e}")
            self._connected = False
            return None

    @property
    def connected(self) -> bool:
        return self._connected


def parse_args():
    parser = argparse.ArgumentParser(description='Visual Bridge for Geometry OS')
    parser.add_argument('--port', type=int, default=8768, help='WebSocket port')
    parser.add_argument('--socket', default='/tmp/vector_memory_daemon.sock', help='Memory daemon socket')
    parser.add_argument('--map-size', type=int, default=4096, help='Map size for conversion')
    return parser.parse_args()


# Standalone handler function for testing and external use
async def handle_synaptic_query(bridge: Any, data: Dict[str, Any]) -> Dict[str, Any]:
    """
    Standalone synaptic query handler for testing.

    Args:
        bridge: VisualBridge instance (or mock for testing)
        data: Dict containing 'query' (str) and optional 'limit' (int)

    Returns:
        Dict with:
            - type: 'synaptic_query_response'
            - results: List of search results
            - navigate_to: Best match coordinates (or None if no results)
    """
    query_text = data.get('query', '')
    limit = data.get('limit', 10)

    # Create engine and execute query
    engine = SynapticQueryEngine()
    results = engine.query(query_text, limit=limit)

    # Build response
    response = {
        'type': 'synaptic_query_response',
        'results': results,
        'navigate_to': None
    }

    # Include navigate_to for best match (highest similarity, already sorted)
    if results:
        best = results[0]
        response['navigate_to'] = {
            'x': best['x'],
            'y': best['y']
        }

    return response

if __name__ == "__main__":
    args = parse_args()
    bridge = VisualBridge(
        memory_socket=args.socket,
        ws_port=args.port,
        map_size=args.map_size
    )
    try:
        asyncio.run(bridge.start())
    except KeyboardInterrupt:
        print("\n🛑 Shutting down...")
