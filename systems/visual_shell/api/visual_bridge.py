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

Port: 8768 (WebSocket)
"""

import asyncio
import json
import os
import sys
import socket
import time
import websockets
from websockets.server import serve
import numpy as np
import argparse
from pathlib import Path
from typing import Dict, Any, Optional, List

# Add project root to path for imports
sys.path.insert(0, os.getcwd())

# Import SynapticQueryEngine for semantic search
from systems.neural_city.synaptic_query_engine import SynapticQueryEngine

# Import Spatial Tectonics components (Phase 28 Step 2)
from systems.visual_shell.api.tectonic_handler import TectonicHandler
from systems.visual_shell.api.vat_manager import VATManager

class VisualBridge:
    def __init__(self, memory_socket="/tmp/vector_memory_daemon.sock", ws_port=8768, map_size=4096):
        self.memory_socket = memory_socket
        self.ws_port = ws_port
        self.map_size = map_size
        self.clients = set()

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
        print(f"🚀 Visual Bridge starting...")
        print(f"   WebSocket: ws://localhost:{self.ws_port}")
        print(f"   Memory Daemon: {self.memory_socket}")

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

        async with serve(self.handle_client, "0.0.0.0", self.ws_port):
            await asyncio.Future()

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
            from .heat_aggregator import HeatAggregator

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
