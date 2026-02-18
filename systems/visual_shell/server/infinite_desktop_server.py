#!/usr/bin/env python3
"""
Infinite Desktop Server: WebSocket Bridge for PixiJS Frontend

This server provides real-time data from the HarmonicHub and file system
to the PixiJS infinite desktop frontend via WebSocket.

Features:
- WebSocket server for real-time daemon state updates
- File system scanning for spatial visualization
- Neural pattern streaming from HarmonicHub
- HTTP API for static data queries
"""

import asyncio
import json
import logging
import math
import os
import shutil
import socket
import struct
import subprocess
import sys
import time
import zipfile
from pathlib import Path
from typing import Dict, List, Optional
import websockets
import aiohttp
from aiohttp import web
import tempfile

# Add project root to path (relative to this file)
SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent.parent
sys.path.append(str(PROJECT_ROOT))

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [INFINITE-DESKTOP-SERVER] %(message)s',
    handlers=[
        logging.FileHandler("infinite_desktop_server.log"),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger("InfiniteDesktopServer")

# Import HarmonicHub (optional)
try:
    from systems.neural_cortex.harmonic_hub import HarmonicHub, DaemonRole, DaemonFrequencyBand
    from systems.neural_cortex.cortex import PredictiveCortex
    from systems.neural_cortex.reflexes import ReflexController
    from systems.intelligence.core.contextual_memory_system import ContextualMemorySystem
except ImportError as e:
    logger.warning(f"Optional neural components not available: {e}")
    HarmonicHub = None
    PredictiveCortex = None
    ReflexController = None
    ContextualMemorySystem = None

# Import Build System
try:
    from systems.build.orchestrator import BuildOrchestrator
    from systems.build.job_protocol import BuildJob, JobManifest, JobStatus
except ImportError as e:
    logger.warning(f"Build system not available: {e}")
    BuildOrchestrator = None
    BuildJob = None
    JobManifest = None
    JobStatus = None


class FileSystemScanner:
    """
    Scans the file system and generates spatial coordinates for files.
    
    Files are positioned in a spiral pattern based on directory structure.
    """
    
    def __init__(self, root_path: str = PROJECT_ROOT):
        self.root_path = Path(root_path)
        self.file_cache = {}
        self.last_scan_time = 0
        self.scan_interval = 300  # 5 minutes
        self.compositor_path = PROJECT_ROOT / "systems" / "compositor"
        
    def scan_filesystem(self, force: bool = False) -> List[Dict]:
        """
        Scan the file system and generate spatial coordinates.
        
        Args:
            force: Force re-scan even if cache is fresh
            
        Returns:
            List[Dict]: List of file nodes with spatial coordinates
        """
        current_time = time.time()
        if not force and current_time - self.last_scan_time < self.scan_interval:
            return self.file_cache.get('files', [])
        
        logger.info(f"📂 Scanning file system: {self.root_path}")
        
        files = []
        # Spiral parameters
        angle = 0
        radius = 100
        angle_step = 0.5  # radians between files
        radius_growth = 0.5  # pixels per file
        
        # Walk the file system
        for root, dirs, filenames in os.walk(self.root_path):
            # Skip hidden directories and common ignore patterns
            dirs[:] = [d for d in dirs if not d.startswith('.') and d not in ['node_modules', '__pycache__', '.git', 'target']]
            
            for filename in filenames:
                # Filter for relevant file types
                if not self._is_relevant_file(filename):
                    continue
                
                filepath = Path(root) / filename
                rel_path = filepath.relative_to(self.root_path)
                
                # Skip broken symlinks
                try:
                    stat_info = filepath.stat()
                except (FileNotFoundError, PermissionError):
                    continue
                
                # Calculate spatial position (spiral)
                x = radius * math.cos(angle)
                y = radius * math.sin(angle)
                
                # Determine file type
                file_type = self._get_file_type(filename)

                # Calculate size based on file size (clamped)
                file_size = stat_info.st_size
                visual_size = min(50, max(15, math.log(file_size + 1) * 2))

                # Validate TypeScript files
                semantic_health = None
                if file_type == 'CODE' and filename.endswith('.ts'):
                    semantic_health = self._validate_typescript_file(filepath)

                file_data = {
                    'id': str(rel_path),
                    'name': filename,
                    'path': str(rel_path),
                    'type': file_type,
                    'x': x,
                    'y': y,
                    'size': visual_size,
                    'file_size': file_size,
                    'modified': stat_info.st_mtime
                }

                if semantic_health:
                    file_data['semantic_health'] = semantic_health

                files.append(file_data)
                
                # Advance spiral
                angle += angle_step
                radius += radius_growth
        
        # Cache results
        self.file_cache['files'] = files
        self.last_scan_time = current_time
        
        logger.info(f"✅ File system scan complete: {len(files)} files")
        
        # Injection: Add Virtual Memory Inspector if not found
        inspector_id = "neural/memory_inspector"
        if not any(f['id'] == inspector_id for f in files):
            files.append({
                'id': inspector_id,
                'name': 'Memory Graph Inspector',
                'path': 'systems/intelligence/ui/inspector.py',
                'type': 'NEURAL_MONITOR',
                'x': 500,
                'y': -300,
                'size': 40,
                'file_size': 0,
                'modified': time.time()
            })
            
        return files
    
    def _is_relevant_file(self, filename: str) -> bool:
        """Check if file is relevant for visualization."""
        if filename.endswith('.rts.png'):
            return True
            
        extensions = {
            '.py', '.js', '.ts', '.html', '.css', '.md', '.txt',
            '.rs', '.wgsl', '.asm', '.json', '.yaml', '.yml',
            '.png', '.jpg', '.jpeg', '.svg', '.gif'
        }
        return Path(filename).suffix.lower() in extensions
    
    def _get_file_type(self, filename: str) -> str:
        """Determine file type category."""
        if filename.endswith('.rts.png'):
            return 'APP'
            
        ext = Path(filename).suffix.lower()
        
        if ext in ['.py', '.js', '.ts', '.rs']:
            return 'CODE'
        elif ext in ['.html', '.css', '.wgsl']:
            return 'WEB'
        elif ext in ['.md', '.txt', '.json', '.yaml', '.yml']:
            return 'DOC'
        elif ext in ['.png', '.jpg', '.jpeg', '.svg', '.gif']:
            return 'IMAGE'
        elif ext == '.asm':
            return 'ASSEMBLY'
        elif filename == 'memory_inspector.py':
            return 'NEURAL_MONITOR'
        else:
            return 'OTHER'

    def _validate_typescript_file(self, filepath: Path) -> Optional[Dict]:
        """Validate a TypeScript file using the compositor daemon."""
        try:
            # Check if compositor is available
            if not self.compositor_path.exists():
                return None

            # Run the validation script
            cmd = [
                'npx', 'ts-node',
                str(self.compositor_path / 'examples' / 'validate-file.ts'),
                str(filepath)
            ]

            result = subprocess.run(
                cmd,
                cwd=str(self.compositor_path),
                capture_output=True,
                text=True,
                timeout=10  # 10 second timeout
            )

            if result.returncode == 0:
                validation_data = json.loads(result.stdout)
                return {
                    'has_errors': validation_data['hasErrors'],
                    'has_warnings': validation_data['hasWarnings'],
                    'error_count': validation_data['errorCount'],
                    'warning_count': validation_data['warningCount'],
                    'diagnostics': validation_data['diagnostics']
                }
            else:
                logger.warning(f"TypeScript validation failed for {filepath}: {result.stderr}")
                return None

        except (subprocess.TimeoutExpired, json.JSONDecodeError, KeyError) as e:
            logger.warning(f"TypeScript validation error for {filepath}: {e}")
            return None



class FileExecutor:
    """
    Universal File Executor.
    Handles execution logic for different file types, including .rts.png Pixel Apps.
    """
    
    def __init__(self, on_app_launch=None):
        self.on_app_launch = on_app_launch

    def execute(self, path_str: str):
        """Execute a file based on their type."""
        try:
            # Resolve path relative to project root
            path = (Path(PROJECT_ROOT) / path_str).resolve()
            
            if not path.exists():
                logger.error(f"❌ File not found: {path}")
                return False
                
            logger.info(f"⚡ Executing: {path}")
            
            # 1. Pixel App (.rts.png)
            if path.name.endswith('.rts.png'):
                return self._run_rts_image(path)
                
            # 2. Python Script
            if path.suffix == '.py':
                return self._run_in_terminal(['python3', str(path)])
                
            # 3. Shell Script
            if path.suffix == '.sh':
                return self._run_in_terminal(['bash', str(path)])
                
            # 4. Fallback: System Default (xdg-open)
            cmd = ['xdg-open', str(path)]
            subprocess.Popen(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            return True
            
        except Exception as e:
            logger.error(f"❌ Execution failed: {e}")
            return False

    def _run_in_terminal(self, cmd_list):
        """Run command in a new terminal window."""
        # Try common terminal emulators
        terminals = ['gnome-terminal', 'x-terminal-emulator', 'xterm']
        
        for term in terminals:
            if shutil.which(term):
                if term == 'gnome-terminal':
                    full_cmd = [term, '--', *cmd_list]
                else:
                    full_cmd = [term, '-e', *cmd_list]
                
                subprocess.Popen(full_cmd)
                return True
                
        # Fallback: run in background if no terminal found
        subprocess.Popen(cmd_list)
        return True

    def _run_rts_image(self, path):
        """Unpack and run a Pixel App (.rts.png)."""
        try:
            runtime_dir = Path("/tmp/geometry_os/runtime") / path.stem
            if runtime_dir.exists():
                shutil.rmtree(runtime_dir)
            runtime_dir.mkdir(parents=True, exist_ok=True)
            
            # --- 1. Extract Payload (V2 Format) ---
            # Call the specific extractor script to handle the complexity
            # We assume pixelrts_v2_extractor.py is in the project root
            extractor_script = PROJECT_ROOT / "pixelrts_v2_extractor.py"
            
            if not extractor_script.exists():
                logger.error("❌ Extractor script not found")
                return False
                
            logger.info(f"📦 Extracting PixelRTS: {path}")
            cmd = ['python3', str(extractor_script), str(path), '--output', str(runtime_dir)]
            
            # Run extraction synchronously to ensure files are ready
            result = subprocess.run(cmd, capture_output=True, text=True)
            
            if result.returncode != 0:
                logger.error(f"❌ Extraction failed: {result.stderr}")
                return False
                
            logger.info(f"✅ Extracted to: {runtime_dir}")
            
            # --- 2. Determine App Type & Metadata ---
            # Read metadata if available
            meta_path = runtime_dir / f"{path.name}.meta.json"
            meta = {}
            if meta_path.exists():
                try:
                    with open(meta_path, 'r') as f:
                        meta = json.load(f)
                except:
                    pass
            
            app_id = path.stem
            app_type = "generic"
            
            # Special case for Ubuntu/Linux Boot
            boot_script = runtime_dir / f"{path.name}.boot.sh"
            
            if boot_script.exists():
                app_type = "linux_vm"
                logger.info(f"🐧 Booting Linux VM: {boot_script}")
                
                # Make executable
                boot_script.chmod(0o755)
                
                # Run the boot script in a terminal
                return self._run_in_terminal(['bash', str(boot_script)])
            
            # Standard Pixel App Detection
            if "system_monitor" in app_id:
                app_type = "system_monitor"
            elif "process_hive" in app_id:
                app_type = "process_hive"
            elif "macromedia" in app_id:
                app_type = "legacy_suite"
                logger.info("🎨 Detected Macromedia Legacy Suite")
                
            # Trigger callback for visual panel
            if self.on_app_launch:
                app_data = {
                    "type": app_type,
                    "title": path.stem.replace('_', ' ').title(),
                    "icon": "🐧" if app_type == "linux_vm" else "🔮",
                    "content": meta.get('original_rts', {}),
                    "x": 200,
                    "y": 200
                }
                self.on_app_launch(app_id, app_data)

            # --- 3. Run Entry Point (if not VM) ---
            # Find Entry Point (assuming main.py for now)
            main_py = runtime_dir / "main.py"
            if main_py.exists():
                logger.info(f"🐍 Booting Pixel App: {main_py}")
                return self._run_in_terminal(['python3', str(main_py)])
            
            # Check for generic scripts in metadata
            if "scripts" in meta:
                for script_name, cmd_str in meta["scripts"].items():
                    logger.info(f"📜 Found Script: {script_name} -> {cmd_str}")
                    # For now, we just run the first one or specifically 'install'/'run'
                    if script_name in ["install", "run", "start"]:
                         return self._run_in_terminal(['bash', '-c', cmd_str])

            # If no main.py and not a VM, just open the folder
            if app_type != "linux_vm":
                logger.warning(f"⚠️ No entry point found in {path.name}, opening folder.")
                subprocess.Popen(['xdg-open', str(runtime_dir)])
                
            return True
            
        except Exception as e:
            logger.error(f"❌ Failed to run RTS Image: {e}")
            return False


class InfiniteDesktopServer:
    """
    WebSocket server for the Infinite Desktop frontend.

    Provides real-time updates from HarmonicHub and file system.
    """
    def __init__(self, ws_port=8765, http_port=8080, udp_port=5005):
        self.ws_port = ws_port
        self.http_port = http_port
        self.udp_port = udp_port
        self.clients = set()
        self.active_apps = {}
        self.running = False
        self.broadcast_task = None
        self.udp_task = None
        
        # Subsystems
        self.harmonic_hub = HarmonicHub() if HarmonicHub else None
        self.fs_scanner = FileSystemScanner()
        self.executor = FileExecutor(on_app_launch=self.handle_app_activation)

        # Intelligence System Integration (Week 4)
        self.memory_system = ContextualMemorySystem() if ContextualMemorySystem else None
        if self.memory_system:
            logger.info("🧠 Contextual Memory System connected to Visual Shell")

        # Cortex Integration (Simulated/Real)
        self.cortex = PredictiveCortex() if PredictiveCortex else None

        # Build System Integration
        self.build_orchestrator: Optional[BuildOrchestrator] = None

        # Dream Mode State
        self.dream_mode = True
        self.dream_beat_phase = 0.0
        
        logger.info("🚀 Infinite Desktop Server Initialized")
        logger.info(f"📡 WebSocket Port: {ws_port}")
        logger.info(f"🌐 HTTP Port: {http_port}")
        logger.info(f"📡 UDP Port: {udp_port}")
    
    def set_build_orchestrator(self, orchestrator: BuildOrchestrator):
        """Set the build orchestrator for build system integration."""
        self.build_orchestrator = orchestrator
        logger.info("🔨 Build Orchestrator connected to Infinite Desktop Server")
    
    def handle_app_activation(self, app_id: str, app_data: Dict):
        """Handle execution event from FileExecutor."""
        logger.info(f"✨ App Activated: {app_id}")
        
        # Store active app state
        self.active_apps[app_id] = app_data
        
        # Broadcast activation immediately if loop is running
        if self.running and self.clients:
            message = {
                'type': 'APP_ACTIVATED',
                'data': {
                    'id': app_id,
                    **app_data
                }
            }
            # We are likely in a synchronous callback, need to schedule broadcast
            # But broadcast_task is running the loop.
            # We can rely on the next loop or try to enqueue.
            # For simplicity, we'll let the next broadcast loop handle continuous updates,
            # but activation needs a trigger.
            # We can create a task for it.
            try:
                 asyncio.create_task(self._broadcast_message(message))
            except RuntimeError:
                # No loop?
                pass
                
    async def _broadcast_message(self, message_dict):
        """Helper to send message to all clients."""
        msg_str = json.dumps(message_dict)
        disconnected = set()
        for client in self.clients:
            try:
                await client.send(msg_str)
            except websockets.exceptions.ConnectionClosed:
                disconnected.add(client)
        self.clients -= disconnected

    async def handle_websocket(self, websocket):
        """Handle WebSocket client connection."""
        self.clients.add(websocket)
        logger.info(f"✅ Client connected: {websocket.remote_address}")
        
        try:
            # Send initial data
            await self.send_initial_data(websocket)
            
            # Send currently active apps
            for app_id, app_data in self.active_apps.items():
                await websocket.send(json.dumps({
                    'type': 'APP_ACTIVATED',
                    'data': {'id': app_id, **app_data}
                }))
            
            # Handle incoming messages
            async for message in websocket:
                await self.handle_client_message(websocket, message)
        except websockets.exceptions.ConnectionClosed:
            logger.info(f"❌ Client disconnected: {websocket.remote_address}")
        except Exception as e:
            logger.error(f"❌ WebSocket error here: {e}")
        finally:
            self.clients.discard(websocket)
    
    async def send_initial_data(self, websocket):
        """Send initial data to newly connected client."""
        # Send daemon states
        if self.harmonic_hub:
            sync_packet = self.harmonic_hub.generate_sync_packet()
            await websocket.send(json.dumps({
                'type': 'INITIAL_DAEMONS',
                'data': sync_packet.to_dict()
            }))
        
        # Send file system data
        files = self.fs_scanner.scan_filesystem()
        await websocket.send(json.dumps({
            'type': 'INITIAL_FILES',
            'data': files
        }))
        
        # Send build swarm status if available
        if self.build_orchestrator:
            swarm_status = self.build_orchestrator.get_swarm_status()
            await websocket.send(json.dumps({
                'type': 'BUILD_SWARM_STATUS',
                'data': swarm_status
            }))
        
        logger.info("📦 Initial data sent to client")
    
    async def handle_client_message(self, websocket, message: str):
        """Handle incoming message from client."""
        try:
            data = json.loads(message)
            msg_type = data.get('type')
            
            if msg_type == 'REQUEST_REFRESH':
                # Force refresh file system
                files = self.fs_scanner.scan_filesystem(force=True)
                await websocket.send(json.dumps({
                    'type': 'FILES_UPDATE',
                    'data': files
                }))
            elif msg_type == 'SET_AMPLITUDE':
                # Adjust daemon amplitude
                daemon_name = data.get('daemon')
                amplitude = data.get('amplitude', 1.0)
                self.harmonic_hub.set_daemon_amplitude(daemon_name, amplitude)
                logger.info(f"🎛️ Amplitude adjusted: {daemon_name} -> {amplitude}")
            elif msg_type == 'EXECUTE_FILE':
                # Execute file
                path = data.get('path')
                if path:
                    self.executor.execute(path)
            elif msg_type == 'REQUEST_BUILD_STATUS':
                # Request build swarm status
                if self.build_orchestrator:
                    swarm_status = self.build_orchestrator.get_swarm_status()
                    await websocket.send(json.dumps({
                        'type': 'BUILD_SWARM_STATUS',
                        'data': swarm_status
                    }))
            elif msg_type == 'REQUEST_JOB_STATUS':
                # Request specific job status
                if self.build_orchestrator:
                    job_id = data.get('job_id')
                    if job_id:
                        job_status = self.build_orchestrator.job_queue.get_job_status(job_id)
                        await websocket.send(json.dumps({
                            'type': 'JOB_STATUS',
                            'data': job_status
                        }))
            else:
                logger.warning(f"⚠️ Unknown message type: {msg_type}")
        except json.JSONDecodeError:
            logger.error("❌ Invalid JSON received from client")
        except Exception as e:
            logger.error(f"❌ Error handling client message: {e}")

    async def handle_udp_packets(self):
        """Listen for UDP packets from thought streamer and forward to WebSocket clients."""
        loop = asyncio.get_event_loop()
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.bind(('127.0.0.1', self.udp_port))
        sock.setblocking(False)

        logger.info(f"📡 UDP listener started on port {self.udp_port}")

        while self.running:
            try:
                # Use asyncio to wait for data
                data, addr = await loop.sock_recv(sock, 4096)
                message = data.decode('utf-8').strip()

                try:
                    packet = json.loads(message)
                    logger.debug(f"📦 UDP packet received: {packet}")

                    # Forward activation packets to WebSocket clients
                    if packet.get('type') == 'activation':
                        if self.clients:
                            await self._broadcast_message({
                                'type': 'activation',
                                'data': packet
                            })
                        else:
                            logger.debug("No WebSocket clients connected, dropping activation packet")

                except json.JSONDecodeError as e:
                    logger.warning(f"❌ Invalid JSON in UDP packet: {e}")

            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"❌ UDP listener error: {e}")
                await asyncio.sleep(1)  # Prevent tight loop on errors

        sock.close()
        logger.info("📡 UDP listener stopped")

    async def broadcast_daemon_updates(self):
        """Periodically broadcast daemon state updates to all clients."""
        while self.running:
            try:
                # Generate sync packet
                if self.harmonic_hub:
                    sync_packet = self.harmonic_hub.generate_sync_packet()

                    # Broadcast DAEMON_UPDATE
                    if self.clients:
                        await self._broadcast_message({
                            'type': 'DAEMON_UPDATE',
                            'data': sync_packet.to_dict()
                        })
                    
                # --- TELEMETRY INTEGRATION (Glass Panels) ---
                # Check active apps for telemetry data
                for app_id, app_data in self.active_apps.items():
                    # System Monitor Telemetry
                    if app_data.get('type') == 'system_monitor':
                         log_path = Path("system_telemetry.log") # In CWD
                         if log_path.exists():
                             try:
                                 with open(log_path, 'r') as f:
                                     telemetry = json.load(f)
                                 # Send update
                                 # We re-send activation or a specific update message. 
                                 # The frontend expects APP_ACTIVATED to update content or we could add APP_UPDATE
                                 # The current frontend implementation re-creates panel on APP_ACTIVATED.
                                 # We should probably avoid re-creating panels every 0.1s.
                                 # Checking frontend renderSystemMonitor... it just renders content.
                                 # But createGlassPanel checks if it exists? 
                                 # Frontend logic: glassPanels[panelId] = ...
                                 # It overwrites. That might Flickr.
                                 # But for now, let's just send it.
                                 
                                 # Ideally we send APP_UPDATE. But let's stick to what we have or modify frontend.
                                 # The frontend `handleAppActivated` calls `createGlassPanel`.
                                 # `createGlassPanel` DOES overwrite.
                                 # Let's see if we can optimize later.
                                 
                                 # Only send if timestamp changed?
                                 last_ts = app_data.get('content', {}).get('timestamp', 0)
                                 if telemetry.get('timestamp', 0) > last_ts:
                                     app_data['content'] = telemetry
                                     await self._broadcast_message({
                                         'type': 'APP_ACTIVATED',
                                         'data': {'id': app_id, **app_data}
                                     })
                             except:
                                 pass
                                 
                # --- CORTEX INTEGRATION ---
                
                # 1. Generate Synthetic Sensory Data (Dream Mode)
                # This would be replaced by real microphone/input data in Phase 23
                current_time = time.time()
                
                sensory_input = {
                    "audio": {"volume": 0.0, "bass": 0.0, "treble": 0.0},
                    "input_events": []
                }

                if self.dream_mode:
                    # Techno Beat (120 BPM = 2Hz)
                    self.dream_beat_phase += 0.6  # approx increment per 0.1s
                    beat_signal = (math.sin(self.dream_beat_phase) + 1) / 2
                    
                    # Random "Input Focus" bursts
                    input_burst = []
                    if math.sin(current_time * 0.5) > 0.8: # Occasional burst
                         input_burst.append({"type": "mouse_move", "timestamp": current_time})
                    
                    sensory_input = {
                        "audio": {
                            "volume": 0.2 + (beat_signal * 0.5), # Pulse volume
                            "bass": 0.2 + (beat_signal * 0.7 if beat_signal > 0.8 else 0.0), # Kick drum
                            "treble": 0.1
                        },
                        "input_events": input_burst
                    }
                
                # 2. Process Cortex State
                # Neural vector placeholder (would come from EvolutionDaemon)
                neural_vector = [0.5] * 8 
                visual_stats = {"entropy": 0.5, "brightness": 0.5} # Placeholder
                
                if self.cortex:
                    cortex_result = self.cortex.process_state(neural_vector, visual_stats, sensory_input)
                else:
                    cortex_result = {}
                
                # 3. Broadcast Reflex Actions
                actions = cortex_result.get('actions', [])
                if actions:
                    for action in actions:
                        reflex_msg = {
                            'type': 'REFLEX_ACTION',
                            'payload': action
                        }
                        await self._broadcast_message(reflex_msg)
                        
                    logger.info(f"🧠 Reflex Triggered: {[a['reflex_type'] for a in actions]}")

                # Wait before next update (10 Hz)
                await asyncio.sleep(0.1)
            except Exception as e:
                logger.error(f"❌ Error broadcasting updates: {e}")
                await asyncio.sleep(1)
    
    async def handle_http_get_files(self, request: web.Request) -> web.Response:
        """HTTP GET endpoint for file system data."""
        force = request.query.get('force', 'false').lower() == 'true'
        files = self.fs_scanner.scan_filesystem(force=force)
        return web.json_response(files)
    
    async def handle_http_get_daemons(self, request: web.Request) -> web.Response:
        """HTTP GET endpoint for daemon states."""
        if not self.harmonic_hub:
            return web.json_response({"error": "Harmonic hub not available"}, status=503)
        sync_packet = self.harmonic_hub.generate_sync_packet()
        return web.json_response(sync_packet.to_dict())
    
    async def handle_http_get_build_status(self, request: web.Request) -> web.Response:
        """HTTP GET endpoint for build swarm status."""
        if not self.build_orchestrator:
            return web.json_response({"error": "Build orchestrator not available"}, status=503)
        
        swarm_status = self.build_orchestrator.get_swarm_status()
        return web.json_response(swarm_status)
    
    async def handle_http_get_job_status(self, request: web.Request) -> web.Response:
        """HTTP GET endpoint for specific job status."""
        if not self.build_orchestrator:
            return web.json_response({"error": "Build orchestrator not available"}, status=503)
        
        job_id = request.query.get('job_id')
        if not job_id:
            return web.json_response({"error": "job_id parameter required"}, status=400)
        
        job_status = self.build_orchestrator.job_queue.get_job_status(job_id)
        if not job_status:
            return web.json_response({"error": "Job not found"}, status=404)
        
        return web.json_response(job_status)
    
    async def handle_http_get_queue_status(self, request: web.Request) -> web.Response:
        """HTTP GET endpoint for job queue status."""
        if not self.build_orchestrator:
            return web.json_response({"error": "Build orchestrator not available"}, status=503)
        
        queue_status = self.build_orchestrator.job_queue.get_queue_status()
        return web.json_response(queue_status)
    
    async def handle_http_submit_job(self, request: web.Request) -> web.Response:
        """HTTP POST endpoint to submit a new build job."""
        if not self.build_orchestrator:
            return web.json_response({"error": "Build orchestrator not available"}, status=503)
        
        try:
            job_data = await request.json()
            job = BuildJob(
                job_id=job_data['job_id'],
                source_path=job_data['source_path'],
                build_command=job_data['build_command'],
                output_artifacts=job_data.get('output_artifacts', []),
                priority=job_data.get('priority', 1),
                dependencies=job_data.get('dependencies', []),
                environment=job_data.get('environment', {}),
                timeout_seconds=job_data.get('timeout_seconds', 300),
            )
            
            await self.build_orchestrator.submit_job(job)
            
            return web.json_response({
                "status": "queued",
                "job_id": job.job_id
            })
        except Exception as e:
            logger.error(f"Error submitting job: {e}")
            return web.json_response({"error": str(e)}, status=400)

    # --- Memory Graph Inspector API Handlers ---

    async def handle_get_memory_patterns(self, request: web.Request) -> web.Response:
        """Fetch all stored patterns for visualization."""
        if not self.memory_system:
            return web.json_response({"error": "Memory system unavailable"}, status=503)
        
        try:
            patterns = self.memory_system.get_all_patterns()
            return web.json_response([p.to_dict() for p in patterns])
        except Exception as e:
            return web.json_response({"error": str(e)}, status=500)

    async def handle_get_memory_graph(self, request: web.Request) -> web.Response:
        """Generate a force-directed graph structure from patterns."""
        if not self.memory_system:
            return web.json_response({"error": "Memory system unavailable"}, status=503)
            
        try:
            patterns = self.memory_system.get_all_patterns()
            nodes = []
            links = []
            
            # Create nodes
            for p in patterns:
                nodes.append({
                    "id": p.id,
                    "label": p.goal_category,
                    "val": p.access_count,
                    "color": self._get_category_color(p.goal_category)
                })

            # Create edges based on similarity (threshold > 0.8)
            for i in range(len(patterns)):
                for j in range(i + 1, len(patterns)):
                    sim = self.memory_system.calculate_similarity(patterns[i], patterns[j])
                    if sim > 0.8:
                        links.append({
                            "source": patterns[i].id,
                            "target": patterns[j].id,
                            "value": sim
                        })
            
            return web.json_response({"nodes": nodes, "links": links})
        except Exception as e:
            return web.json_response({"error": str(e)}, status=500)

    def _get_category_color(self, category: str) -> str:
        """Map goal categories to hex colors for the graph."""
        colors = {
            "CODE_GENERATION": "#00FF9D",
            "ARCHITECTURE": "#00D1FF",
            "DEBUGGING": "#FF4D4D",
            "RESEARCH": "#FFD100",
            "OPTIMIZATION": "#A04DFF",
            "PLANNING": "#FF8C00"
        }
        return colors.get(category, "#CCCCCC")
    
    # --- Security API Handlers (Phase 6) ---
    
    async def handle_get_security_metrics(self, request: web.Request) -> web.Response:
        """Fetch security metrics from Silicon District metadata."""
        security_metadata_path = PROJECT_ROOT / "systems" / "builder" / "metadata" / "silicon_district.json"
        
        if not security_metadata_path.exists():
            return web.json_response({"error": "Security metadata not available"}, status=404)
        
        try:
            with open(security_metadata_path, 'r') as f:
                metadata = json.load(f)
            
            # Return security section if available
            if 'security' in metadata:
                return web.json_response(metadata['security'])
            else:
                return web.json_response({"error": "No security data available"}, status=404)
        except Exception as e:
            logger.error(f"Error reading security metadata: {e}")
            return web.json_response({"error": str(e)}, status=500)
    
    async def handle_get_security_report(self, request: web.Request) -> web.Response:
        """Generate a detailed security report."""
        security_metadata_path = PROJECT_ROOT / "systems" / "builder" / "metadata" / "silicon_district.json"
        
        if not security_metadata_path.exists():
            return web.json_response({"error": "Security metadata not available"}, status=404)
        
        try:
            with open(security_metadata_path, 'r') as f:
                metadata = json.load(f)
            
            if 'security' not in metadata:
                return web.json_response({"error": "No security data available"}, status=404)
            
            security = metadata['security']
            
            # Generate detailed report
            report = {
                "summary": {
                    "risk_score": security.get('risk_score', 0),
                    "vulnerable_drivers": security.get('vulnerable_drivers', 0),
                    "total_drivers": security.get('total_drivers', 0),
                    "kernel_version": security.get('kernel_version', 'unknown'),
                    "last_scan": security.get('last_scan', 'unknown')
                },
                "vulnerabilities": {
                    "critical": security.get('critical_vulns', 0),
                    "high": security.get('high_vulns', 0),
                    "medium": security.get('medium_vulns', 0),
                    "low": security.get('low_vulns', 0)
                },
                "top_vulnerabilities": security.get('top_vulnerabilities', [])
            }
            
            return web.json_response(report)
        except Exception as e:
            logger.error(f"Error generating security report: {e}")
            return web.json_response({"error": str(e)}, status=500)
    
    # --- Context Compaction API Handlers (Week 4) ---
    
    async def handle_memory_compact(self, request: web.Request) -> web.Response:
        """Trigger memory compaction."""
        if not self.memory_system:
            return web.json_response({"error": "Memory system unavailable"}, status=503)
        
        try:
            # Import ContextCompactor
            from systems.intelligence.optimization.context_compactor import ContextCompactor
            
            # Create compactor
            compactor = ContextCompactor(self.memory_system)
            
            # Run compaction
            result = compactor.compact_patterns(
                similarity_threshold=0.95,
                temporal_window_hours=24,
                min_access_count=1
            )
            
            return web.json_response({
                "status": "success",
                "result": result
            })
        except Exception as e:
            logger.error(f"Memory compaction error: {e}")
            return web.json_response({"error": str(e)}, status=500)
    
    async def handle_memory_stats(self, request: web.Request) -> web.Response:
        """Get memory statistics including compaction info."""
        if not self.memory_system:
            return web.json_response({"error": "Memory system unavailable"}, status=503)
        
        try:
            # Get basic statistics
            stats = self.memory_system.get_statistics()
            
            # Add compaction statistics if available
            from systems.intelligence.optimization.context_compactor import ContextCompactor
            compactor = ContextCompactor(self.memory_system)
            compaction_stats = compactor.get_statistics()
            
            return web.json_response({
                "memory_stats": stats,
                "compaction_stats": compaction_stats
            })
        except Exception as e:
            logger.error(f"Memory stats error: {e}")
            return web.json_response({"error": str(e)}, status=500)
    
    async def handle_memory_restore(self, request: web.Request) -> web.Response:
        """Restore memory from backup."""
        if not self.memory_system:
            return web.json_response({"error": "Memory system unavailable"}, status=503)
        
        try:
            # Get backup path from request
            data = await request.json()
            backup_path = data.get("backup_path")
            
            if not backup_path:
                return web.json_response({"error": "backup_path parameter required"}, status=400)
            
            # Restore from backup
            self.memory_system.restore_database(backup_path)
            
            logger.info(f"Memory restored from: {backup_path}")
            
            return web.json_response({
                "status": "success",
                "backup_path": backup_path
            })
        except FileNotFoundError as e:
            return web.json_response({"error": f"Backup file not found: {e}"}, status=404)
        except Exception as e:
            logger.error(f"Memory restore error: {e}")
            return web.json_response({"error": str(e)}, status=500)
    
    async def start_http_server(self):
        """Start HTTP server for REST API and static map assets."""
        app = web.Application()
        
        # Static Assets for Infinite Map
        builder_path = PROJECT_ROOT / "systems" / "builder"
        if builder_path.exists():
            app.router.add_static('/builder/', path=builder_path, name='builder')
            logger.info(f"📁 Serving static map tiles from: {builder_path}")
        
        app.router.add_get('/api/files', self.handle_http_get_files)
        app.router.add_get('/api/daemons', self.handle_http_get_daemons)
        
        # Build System API endpoints
        app.router.add_get('/api/build/status', self.handle_http_get_build_status)
        app.router.add_get('/api/build/job', self.handle_http_get_job_status)
        app.router.add_get('/api/build/queue', self.handle_http_get_queue_status)
        app.router.add_post('/api/build/submit', self.handle_http_submit_job)
        
        # --- Memory Graph Inspector API (Week 4) ---
        app.router.add_get('/api/memory/patterns', self.handle_get_memory_patterns)
        app.router.add_get('/api/memory/graph', self.handle_get_memory_graph)
        
        # --- Context Compaction API (Week 4) ---
        app.router.add_post('/api/memory/compact', self.handle_memory_compact)
        app.router.add_get('/api/memory/stats', self.handle_memory_stats)
        app.router.add_post('/api/memory/restore', self.handle_memory_restore)
        
        # --- Security API (Phase 6) ---
        app.router.add_get('/api/security/metrics', self.handle_get_security_metrics)
        app.router.add_get('/api/security/report', self.handle_get_security_report)
        
        runner = web.AppRunner(app)
        await runner.setup()
        site = web.TCPSite(runner, 'localhost', self.http_port)
        await site.start()
        
        logger.info(f"🌐 HTTP Server started on port {self.http_port}")
    
    async def start(self):
        """Start the WebSocket and HTTP servers."""
        self.running = True

        # Start HTTP server
        await self.start_http_server()

        # Start broadcast task
        self.broadcast_task = asyncio.create_task(self.broadcast_daemon_updates())

        # Start UDP listener
        self.udp_task = asyncio.create_task(self.handle_udp_packets())

        # Start WebSocket server
        async with websockets.serve(self.handle_websocket, 'localhost', self.ws_port):
            logger.info(f"📡 WebSocket Server started on port {self.ws_port}")
            logger.info("🎯 Infinite Desktop Server is ready!")

            # Keep server running
            await asyncio.Future()  # Run forever
    
    async def stop(self):
        """Stop the server."""
        self.running = False
        if self.broadcast_task:
            self.broadcast_task.cancel()
        if self.udp_task:
            self.udp_task.cancel()
        logger.info("🛑 Infinite Desktop Server stopped")


def main():
    """Main entry point."""
    server = InfiniteDesktopServer()
    
    try:
        asyncio.run(server.start())
    except KeyboardInterrupt:
        logger.info("🛑 Shutting down...")
        asyncio.run(server.stop())


if __name__ == '__main__':
    main()
