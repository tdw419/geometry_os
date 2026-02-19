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

                # 3. Echo/Ping
                elif msg_type == 'ping':
                    await websocket.send(json.dumps({'type': 'pong'}))

                # 4. RISC-V UART Output (from silicon substrate)
                elif msg_type == 'riscv_uart':
                    # Broadcast UART bytes to all clients for HUD display
                    print(f"🦾 RISC-V UART: {data.get('text', '')[:50]}...")
                    await self._broadcast({
                        'type': 'riscv_uart',
                        'text': data.get('text', ''),
                        'bytes': data.get('bytes', []),
                        'timestamp': data.get('timestamp'),
                        'vm_id': data.get('vm_id', 'default')
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

    async def _broadcast(self, data):
        """Broadcast a message to all connected clients"""
        if not self.clients:
            return
        
        message = json.dumps(data)
        await asyncio.gather(*[client.send(message) for client in self.clients], return_exceptions=True)

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
