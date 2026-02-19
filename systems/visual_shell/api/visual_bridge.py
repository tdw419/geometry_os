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
import socket
import websockets
from websockets.server import serve
import numpy as np
import argparse
from pathlib import Path
from typing import Dict, Any, Optional, List

# Import SynapticQueryEngine for semantic search
from systems.neural_city.synaptic_query_engine import SynapticQueryEngine

class VisualBridge:
    def __init__(self, memory_socket="/tmp/vector_memory_daemon.sock", ws_port=8768, map_size=4096):
        self.memory_socket = memory_socket
        self.ws_port = ws_port
        self.map_size = map_size
        self.clients = set()

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

                # 8. Echo/Ping
                elif msg_type == 'ping':
                    await websocket.send(json.dumps({'type': 'pong'}))

                # 9. Token Visualization Update (Neural City)
                elif msg_type == 'token_visualization_update':
                    await self.relay_token_pulse(data)

                # 10. Synaptic Query (Semantic Search)
                elif msg_type == 'synaptic_query':
                    response = await self._handle_synaptic_query(data)
                    await websocket.send(json.dumps(response))

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
        
        async with serve(self.handle_client, "0.0.0.0", self.ws_port):
            await asyncio.Future()

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
