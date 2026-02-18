#!/usr/bin/env python3
"""
Geometry OS Mock Server
Provides mock data for the web-based infinite map frontend.

Features:
- HTTP API for chunk data (/api/chunk)
- HTTP API for tile textures (/builder/queue/{brick})
- WebSocket server for camera sync (ws://127.0.0.1:8765)
- Procedural tile generation
"""

import json
import asyncio
import websockets
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse, parse_qs
import threading
import random
import time
from io import BytesIO
from PIL import Image, ImageDraw, ImageFont
import base64


class MockChunkData:
    """Generates mock chunk data for testing."""
    
    def __init__(self):
        self.chunk_cache = {}
        self.brick_types = [
            'system_core', 'data_block', 'neural_link', 'memory_cell',
            'processing_unit', 'storage_sector', 'network_node', 'security_layer'
        ]
    
    def generate_chunk(self, chunk_x, chunk_y, chunk_size=16):
        """Generate mock tile data for a chunk."""
        cache_key = f"{chunk_x},{chunk_y}"
        
        if cache_key in self.chunk_cache:
            return self.chunk_cache[cache_key]
        
        # Generate tiles based on chunk position
        tiles = {}
        seed = chunk_x * 10000 + chunk_y
        random.seed(seed)
        
        for x in range(chunk_size):
            for y in range(chunk_size):
                world_x = chunk_x * chunk_size + x
                world_y = chunk_y * chunk_size + y
                
                # Determine brick type based on position
                dist_from_center = ((world_x - 8192) ** 2 + (world_y - 8192) ** 2) ** 0.5
                
                if dist_from_center < 5:
                    brick_type = 'system_core'
                elif dist_from_center < 20:
                    brick_type = random.choice(['data_block', 'neural_link'])
                else:
                    brick_type = random.choice(self.brick_types)
                
                tiles[f"{world_x},{world_y}"] = {
                    'x': world_x,
                    'y': world_y,
                    'brick': brick_type,
                    'timestamp': int(time.time() * 1000)
                }
        
        chunk_data = {
            'chunkX': chunk_x,
            'chunkY': chunk_y,
            'tiles': tiles,
            'metadata': {
                'generated_at': int(time.time() * 1000),
                'version': '1.0'
            }
        }
        
        self.chunk_cache[cache_key] = chunk_data
        return chunk_data


class MockTextureGenerator:
    """Generates mock tile textures."""
    
    def __init__(self):
        self.texture_cache = {}
        self.colors = {
            'system_core': (0, 255, 255),      # Cyan
            'data_block': (0, 0, 255),         # Blue
            'neural_link': (255, 0, 255),      # Magenta
            'memory_cell': (255, 255, 0),       # Yellow
            'processing_unit': (255, 0, 0),     # Red
            'storage_sector': (0, 255, 0),      # Green
            'network_node': (128, 0, 128),     # Purple
            'security_layer': (255, 128, 0)     # Orange
        }
    
    def generate_texture(self, brick_type, size=100):
        """Generate a mock texture for a brick type."""
        cache_key = f"{brick_type}_{size}"
        
        if cache_key in self.texture_cache:
            return self.texture_cache[cache_key]
        
        # Create image
        img = Image.new('RGB', (size, size), color=(17, 17, 17))
        draw = ImageDraw.Draw(img)
        
        # Get color for brick type
        base_color = self.colors.get(brick_type, (128, 128, 128))
        
        # Draw pattern based on brick type
        if brick_type == 'system_core':
            # Pulsing circle pattern
            for i in range(3):
                radius = size // 4 + i * size // 8
                draw.ellipse(
                    [size//2 - radius, size//2 - radius,
                     size//2 + radius, size//2 + radius],
                    outline=base_color, width=2
                )
        elif brick_type == 'data_block':
            # Grid pattern
            for i in range(0, size, size//4):
                draw.line([(i, 0), (i, size)], fill=base_color, width=1)
                draw.line([(0, i), (size, i)], fill=base_color, width=1)
        elif brick_type == 'neural_link':
            # Diagonal lines
            for i in range(-size, size*2, size//4):
                draw.line([(i, 0), (i + size, size)], fill=base_color, width=1)
        else:
            # Default: border with smaller inner rectangle
            draw.rectangle([2, 2, size-3, size-3], outline=base_color, width=2)
            draw.rectangle([size//4, size//4, size*3//4, size*3//4], 
                         fill=tuple(c//2 for c in base_color))
        
        # Add text label
        try:
            font = ImageFont.load_default()
            text = brick_type[:4].upper()
            bbox = draw.textbbox((0, 0), text, font=font)
            text_width = bbox[2] - bbox[0]
            text_height = bbox[3] - bbox[1]
            draw.text(
                (size//2 - text_width//2, size//2 - text_height//2),
                text, fill=base_color, font=font
            )
        except:
            pass
        
        # Save to buffer
        buffer = BytesIO()
        img.save(buffer, format='PNG')
        buffer.seek(0)
        
        self.texture_cache[cache_key] = buffer
        return buffer


class HTTPRequestHandler(BaseHTTPRequestHandler):
    """HTTP request handler for mock API."""
    
    chunk_data = MockChunkData()
    texture_generator = MockTextureGenerator()
    
    def log_message(self, format, *args):
        """Suppress default logging."""
        pass
    
    def do_GET(self):
        """Handle GET requests."""
        parsed = urlparse(self.path)
        path = parsed.path
        params = parse_qs(parsed.query)

        # CORS headers
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')

        # Handle chunk API
        if path.startswith('/api/chunk'):
            self._handle_chunk_request(params)
        # Handle manifest.json
        elif path == '/builder/map/manifest.json':
            self._handle_manifest_request()
        # Handle security metadata
        elif path == '/builder/metadata/silicon_district.json':
            self._handle_security_metadata_request()
        # Handle texture requests from queue
        elif path.startswith('/builder/queue/'):
            brick_type = path.split('/')[-1].split('?')[0]
            self._handle_texture_request(brick_type, 'queue')
        # Handle texture requests from map directory
        elif path.startswith('/builder/map/'):
            brick_type = path.split('/')[-1].split('?')[0]
            self._handle_texture_request(brick_type, 'map')
        # Handle static HTML/JS files
        elif path == '/' or path == '/index.html':
            self._handle_static_file('index.html', 'text/html')
        elif path == '/workflow_monitor.html':
            self._handle_static_file('workflow_monitor.html', 'text/html')
        elif path.endswith('.js'):
            self._handle_static_file(path[1:], 'application/javascript')
        elif path.endswith('.css'):
            self._handle_static_file(path[1:], 'text/css')
        # Health check
        elif path == '/health':
            self._handle_health_check()
        # Workflow monitor APIs
        elif path == '/api/health':
            self._handle_api_health()
        elif path == '/api/roadmap/status':
            self._handle_api_roadmap_status()
        elif path == '/api/agents/status':
            self._handle_api_agents_status()
        elif path == '/api/changes/active':
            self._handle_api_changes_active()
        else:
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b'Not Found')
    
    def _handle_chunk_request(self, params):
        """Handle chunk data request."""
        try:
            chunk_x = int(params.get('x', [0])[0])
            chunk_y = int(params.get('y', [0])[0])
            size = int(params.get('size', [16])[0])
            
            data = self.chunk_data.generate_chunk(chunk_x, chunk_y, size)
            
            self.send_header('Content-Type', 'application/json')
            self.end_headers()
            self.wfile.write(json.dumps(data).encode())
        except Exception as e:
            self.send_response(500)
            self.end_headers()
            self.wfile.write(json.dumps({'error': str(e)}).encode())
    
    def _handle_texture_request(self, brick_type, location='queue'):
        """Handle texture request."""
        try:
            # Try to serve actual tile image from disk first
            import os
            script_dir = os.path.dirname(os.path.abspath(__file__))

            if location == 'map':
                # Try to load from builder/map directory
                file_path = os.path.join(script_dir, 'builder', 'map', brick_type)
            else:
                # Try to load from builder/queue directory
                file_path = os.path.join(script_dir, 'builder', 'queue', brick_type)

            if os.path.exists(file_path):
                with open(file_path, 'rb') as f:
                    image_data = f.read()
                self.send_header('Content-Type', 'image/png')
                self.send_header('Cache-Control', 'public, max-age=3600')
                self.end_headers()
                self.wfile.write(image_data)
            else:
                # Fall back to generated texture
                buffer = self.texture_generator.generate_texture(brick_type)
                self.send_header('Content-Type', 'image/png')
                self.send_header('Cache-Control', 'public, max-age=3600')
                self.end_headers()
                self.wfile.write(buffer.getvalue())
        except Exception as e:
            self.send_response(500)
            self.end_headers()
            self.wfile.write(json.dumps({'error': str(e)}).encode())

    def _handle_manifest_request(self):
        """Handle manifest.json request."""
        try:
            import os
            script_dir = os.path.dirname(os.path.abspath(__file__))
            manifest_path = os.path.join(script_dir, 'builder', 'map', 'manifest.json')

            if os.path.exists(manifest_path):
                with open(manifest_path, 'r') as f:
                    manifest_data = f.read()
                self.send_header('Content-Type', 'application/json')
                self.send_header('Cache-Control', 'public, max-age=60')
                self.end_headers()
                self.wfile.write(manifest_data.encode())
            else:
                # Return empty manifest if file doesn't exist
                self.send_header('Content-Type', 'application/json')
                self.end_headers()
                self.wfile.write(json.dumps({}).encode())
        except Exception as e:
            self.send_response(500)
            self.end_headers()
            self.wfile.write(json.dumps({'error': str(e)}).encode())

    def _handle_security_metadata_request(self):
        """Handle security metadata request."""
        try:
            import os
            script_dir = os.path.dirname(os.path.abspath(__file__))
            metadata_path = os.path.join(script_dir, 'builder', 'metadata', 'silicon_district.json')

            if os.path.exists(metadata_path):
                with open(metadata_path, 'r') as f:
                    metadata_data = f.read()
                self.send_header('Content-Type', 'application/json')
                self.send_header('Cache-Control', 'public, max-age=60')
                self.end_headers()
                self.wfile.write(metadata_data.encode())
            else:
                # Return empty metadata if file doesn't exist
                self.send_header('Content-Type', 'application/json')
                self.end_headers()
                self.wfile.write(json.dumps({}).encode())
        except Exception as e:
            self.send_response(500)
            self.end_headers()
            self.wfile.write(json.dumps({'error': str(e)}).encode())

    def _handle_static_file(self, file_path, content_type):
        """Handle static file requests (HTML, JS, CSS)."""
        try:
            import os
            script_dir = os.path.dirname(os.path.abspath(__file__))
            full_path = os.path.join(script_dir, file_path)

            if os.path.exists(full_path):
                with open(full_path, 'rb') as f:
                    file_data = f.read()
                self.send_header('Content-Type', content_type)
                self.send_header('Cache-Control', 'public, max-age=60')
                self.end_headers()
                self.wfile.write(file_data)
            else:
                self.send_response(404)
                self.end_headers()
                self.wfile.write(f'File not found: {file_path}'.encode())
        except Exception as e:
            self.send_response(500)
            self.end_headers()
            self.wfile.write(json.dumps({'error': str(e)}).encode())

    def _handle_health_check(self):
        """Handle health check."""
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        self.wfile.write(json.dumps({'status': 'ok'}).encode())

    def _handle_api_health(self):
        """Handle API health endpoint for workflow monitor."""
        health_data = {
            'lm_studio': {
                'connected': True,
                'latency': 45
            },
            'mcp_server': {
                'running': True,
                'uptime': 3600
            },
            'system_load': {
                'cpu': 25,
                'memory': 60
            },
            'error_rate': 0.02,
            'timestamp': int(time.time() * 1000)
        }
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        self.wfile.write(json.dumps(health_data).encode())

    def _handle_api_roadmap_status(self):
        """Handle roadmap status endpoint."""
        roadmap_data = {
            'title': 'Phase 25: Emergent Consciousness',
            'phases': [
                {'name': 'Week 1: Foundation', 'progress': 85, 'status': 'completed'},
                {'name': 'Week 2: Integration', 'progress': 60, 'status': 'in_progress'},
                {'name': 'Week 3: Learning', 'progress': 30, 'status': 'pending'},
                {'name': 'Week 4: Emergence', 'progress': 0, 'status': 'pending'}
            ],
            'overall_progress': 43,
            'timestamp': int(time.time() * 1000)
        }
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        self.wfile.write(json.dumps(roadmap_data).encode())

    def _handle_api_agents_status(self):
        """Handle agents status endpoint."""
        agents_data = [
            {
                'id': 'ubuntu_agent',
                'name': 'Ubuntu Integration Agent',
                'status': 'active',
                'task': 'System monitoring',
                'progress': 75
            },
            {
                'id': 'neural_bridge',
                'name': 'Neural Bridge Agent',
                'status': 'active',
                'task': 'Data processing',
                'progress': 90
            },
            {
                'id': 'evolution_daemon',
                'name': 'Evolution Daemon',
                'status': 'idle',
                'task': 'Waiting for tasks',
                'progress': 0
            }
        ]
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        self.wfile.write(json.dumps(agents_data).encode())

    def _handle_api_changes_active(self):
        """Handle active changes endpoint."""
        changes_data = [
            {
                'id': 'change_001',
                'title': 'Add neural feedback loop',
                'status': 'in_review',
                'priority': 'high'
            },
            {
                'id': 'change_002',
                'title': 'Optimize memory usage',
                'status': 'approved',
                'priority': 'medium'
            },
            {
                'id': 'change_003',
                'title': 'Implement consciousness metrics',
                'status': 'draft',
                'priority': 'high'
            }
        ]
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        self.wfile.write(json.dumps(changes_data).encode())


class WebSocketServer:
    """WebSocket server for camera sync."""
    
    def __init__(self, host='127.0.0.1', port=8765):
        self.host = host
        self.port = port
        self.clients = set()
    
    async def handle_client(self, websocket):
        """Handle a WebSocket client connection."""
        self.clients.add(websocket)
        print(f"✅ WebSocket client connected: {websocket.remote_address}")
        
        try:
            async for message in websocket:
                try:
                    data = json.loads(message)
                    await self.handle_message(websocket, data)
                except json.JSONDecodeError:
                    pass
        except websockets.exceptions.ConnectionClosed:
            pass
        finally:
            self.clients.remove(websocket)
            print(f"🔌 WebSocket client disconnected: {websocket.remote_address}")
    
    async def handle_message(self, websocket, data):
        """Handle incoming WebSocket message."""
        msg_type = data.get('type')

        if msg_type == 'camera_update':
            # Broadcast camera updates to other clients
            await self.broadcast(data, exclude=websocket)
        elif msg_type == 'heartbeat':
            # Respond to heartbeat
            await websocket.send(json.dumps({
                'type': 'heartbeat',
                'timestamp': int(time.time() * 1000)
            }))
        elif msg_type == 'control_command':
            # Handle workflow monitor control commands
            await self.handle_control_command(websocket, data)

    async def handle_control_command(self, websocket, data):
        """Handle workflow monitor control commands."""
        command = data.get('command')
        print(f"🎮 Received control command: {command}")

        # Acknowledge the command
        await websocket.send(json.dumps({
            'type': 'command_ack',
            'command': command,
            'status': 'received',
            'timestamp': int(time.time() * 1000)
        }))

        # Simulate command execution and broadcast updates
        if command == 'start_roadmap':
            # Simulate starting roadmap
            await asyncio.sleep(1)
            await self.broadcast({
                'type': 'roadmap_update',
                'data': {
                    'title': 'Phase 25: Emergent Consciousness',
                    'phases': [
                        {'name': 'Week 1: Foundation', 'progress': 85, 'status': 'completed'},
                        {'name': 'Week 2: Integration', 'progress': 65, 'status': 'in_progress'},
                        {'name': 'Week 3: Learning', 'progress': 30, 'status': 'pending'},
                        {'name': 'Week 4: Emergence', 'progress': 0, 'status': 'pending'}
                    ],
                    'overall_progress': 45
                }
            })
        elif command == 'pause_roadmap':
            # Simulate pausing roadmap
            await self.broadcast({
                'type': 'roadmap_update',
                'data': {
                    'title': 'Phase 25: Emergent Consciousness (PAUSED)',
                    'phases': [
                        {'name': 'Week 1: Foundation', 'progress': 85, 'status': 'completed'},
                        {'name': 'Week 2: Integration', 'progress': 65, 'status': 'paused'},
                        {'name': 'Week 3: Learning', 'progress': 30, 'status': 'pending'},
                        {'name': 'Week 4: Emergence', 'progress': 0, 'status': 'pending'}
                    ],
                    'overall_progress': 45
                }
            })
        elif command == 'stop_roadmap':
            # Simulate stopping roadmap
            await self.broadcast({
                'type': 'roadmap_update',
                'data': {
                    'title': 'Phase 25: Emergent Consciousness (STOPPED)',
                    'phases': [
                        {'name': 'Week 1: Foundation', 'progress': 85, 'status': 'completed'},
                        {'name': 'Week 2: Integration', 'progress': 65, 'status': 'stopped'},
                        {'name': 'Week 3: Learning', 'progress': 30, 'status': 'pending'},
                        {'name': 'Week 4: Emergence', 'progress': 0, 'status': 'pending'}
                    ],
                    'overall_progress': 45
                }
            })

    async def broadcast(self, data, exclude=None):
        """Broadcast message to all connected clients."""
        if self.clients:
            message = json.dumps(data)
            tasks = []
            for client in self.clients:
                if client != exclude:
                    tasks.append(client.send(message))
            if tasks:
                await asyncio.gather(*tasks, return_exceptions=True)
    
    async def start(self):
        """Start the WebSocket server."""
        print(f"🚀 WebSocket server starting on ws://{self.host}:{self.port}")

        # Start periodic updates
        asyncio.create_task(self.periodic_updates())

        async with websockets.serve(self.handle_client, self.host, self.port):
            print(f"✅ WebSocket server listening on ws://{self.host}:{self.port}")
            await asyncio.Future()  # Run forever

    async def periodic_updates(self):
        """Send periodic updates to simulate real-time data."""
        while True:
            try:
                if self.clients:
                    # Simulate health updates
                    health_data = {
                        'lm_studio': {
                            'connected': True,
                            'latency': random.randint(30, 60)
                        },
                        'mcp_server': {
                            'running': True,
                            'uptime': random.randint(3500, 3700)
                        },
                        'system_load': {
                            'cpu': random.randint(20, 40),
                            'memory': random.randint(50, 70)
                        },
                        'error_rate': random.uniform(0.01, 0.05)
                    }

                    await self.broadcast({
                        'type': 'health_update',
                        'data': health_data
                    })

                    # Simulate occasional agent updates
                    if random.random() < 0.3:  # 30% chance
                        agents_data = [
                            {
                                'id': 'ubuntu_agent',
                                'name': 'Ubuntu Integration Agent',
                                'status': 'active',
                                'task': 'System monitoring',
                                'progress': min(100, random.randint(70, 85))
                            },
                            {
                                'id': 'neural_bridge',
                                'name': 'Neural Bridge Agent',
                                'status': 'active',
                                'task': 'Data processing',
                                'progress': min(100, random.randint(85, 95))
                            },
                            {
                                'id': 'evolution_daemon',
                                'name': 'Evolution Daemon',
                                'status': random.choice(['active', 'idle']),
                                'task': random.choice(['Processing tasks', 'Waiting for tasks', 'Optimizing']),
                                'progress': random.randint(0, 30)
                            }
                        ]

                        await self.broadcast({
                            'type': 'agent_status',
                            'data': agents_data
                        })

                await asyncio.sleep(5)  # Update every 5 seconds
            except Exception as e:
                print(f"Error in periodic updates: {e}")
                await asyncio.sleep(5)


def start_http_server(port=8000):
    """Start the HTTP server."""
    server = HTTPServer(('127.0.0.1', port), HTTPRequestHandler)
    print(f"🚀 HTTP server starting on http://127.0.0.1:{port}")
    print(f"✅ HTTP server listening on http://127.0.0.1:{port}")
    server.serve_forever()


def start_websocket_server(port=8765):
    """Start the WebSocket server."""
    ws_server = WebSocketServer(port=port)
    asyncio.run(ws_server.start())


def main():
    """Main entry point."""
    import sys
    
    # Parse command line arguments
    http_port = 8000
    ws_port = 8765
    
    if len(sys.argv) > 1:
        try:
            http_port = int(sys.argv[1])
        except ValueError:
            pass
    
    if len(sys.argv) > 2:
        try:
            ws_port = int(sys.argv[2])
        except ValueError:
            pass
    
    print("=" * 60)
    print("Geometry OS Mock Server")
    print("=" * 60)
    print(f"HTTP API: http://127.0.0.1:{http_port}")
    print(f"WebSocket: ws://127.0.0.1:{ws_port}")
    print("=" * 60)
    
    # Start servers in separate threads
    http_thread = threading.Thread(target=start_http_server, args=(http_port,), daemon=True)
    http_thread.start()
    
    # WebSocket server runs in main thread
    start_websocket_server(ws_port)


if __name__ == '__main__':
    main()
