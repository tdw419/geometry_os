#!/usr/bin/env python3
"""
Swarm Installation Daemon - Collaborates with remote AIs to install Geometry OS.

This daemon:
1. Listens for installation requests from remote AIs
2. Guides the remote AI through the installation process
3. Generates config files and commands specific to the remote system
4. Tracks installation sessions and progress

Usage:
    python3 install_daemon.py --port 8765
"""

import asyncio
import json
import logging
import os
import secrets
import sys
import time
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Any

try:
    import aiohttp
    from aiohttp import web
except ImportError:
    print("Install aiohttp: pip install aiohttp")
    sys.exit(1)

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(name)s: %(message)s'
)
logger = logging.getLogger("install_daemon")


@dataclass
class InstallSession:
    """Tracks an installation collaboration session."""
    session_id: str
    remote_url: str = ""
    remote_ip: str = ""
    status: str = "pending"  # pending, in_progress, completed, failed
    created_at: float = field(default_factory=time.time)
    updated_at: float = field(default_factory=time.time)
    messages: List[Dict] = field(default_factory=list)
    context: Dict = field(default_factory=dict)  # Store shared context

    def to_dict(self) -> dict:
        return {
            "session_id": self.session_id,
            "remote_url": self.remote_url,
            "remote_ip": self.remote_ip,
            "status": self.status,
            "created_at": datetime.fromtimestamp(self.created_at).isoformat(),
            "updated_at": datetime.fromtimestamp(self.updated_at).isoformat(),
            "message_count": len(self.messages),
            "context": self.context
        }


class InstallDaemon:
    """Daemon that collaborates with remote AIs for installation."""

    def __init__(self, port: int = 8765, host: str = "0.0.0.0"):
        self.port = port
        self.host = host
        self.sessions: Dict[str, InstallSession] = {}
        self.app = web.Application(client_max_size=10*1024*1024)  # 10MB
        self._setup_routes()

        # This server's public URL (will be set dynamically)
        self.public_url = f"http://localhost:{port}"

    def _setup_routes(self):
        """Set up HTTP routes for the daemon."""
        self.app.router.add_get("/", self.handle_root)
        self.app.router.add_get("/status", self.handle_status)
        self.app.router.add_post("/session", self.handle_create_session)
        self.app.router.add_get("/session/{session_id}", self.handle_get_session)
        self.app.router.add_post("/session/{session_id}/message", self.handle_message)
        self.app.router.add_get("/session/{session_id}/poll", self.handle_poll)
        self.app.router.add_post("/ai/webhook", self.handle_ai_webhook)
        self.app.router.add_get("/ai/instructions", self.handle_ai_instructions)

    async def handle_root(self, request: web.Request) -> web.Response:
        """Root endpoint - shows daemon info."""
        return web.json_response({
            "service": "Geometry OS Installation Daemon",
            "version": "1.0",
            "sessions": len(self.sessions),
            "endpoints": {
                "status": "/status",
                "create_session": "POST /session",
                "get_session": "GET /session/{id}",
                "send_message": "POST /session/{id}/message",
                "poll": "GET /session/{id}/poll",
                "ai_webhook": "POST /ai/webhook",
                "ai_instructions": "GET /ai/instructions"
            }
        })

    async def handle_status(self, request: web.Request) -> web.Response:
        """Get daemon status."""
        active = sum(1 for s in self.sessions.values() if s.status == "in_progress")
        completed = sum(1 for s in self.sessions.values() if s.status == "completed")

        return web.json_response({
            "running": True,
            "port": self.port,
            "public_url": self.public_url,
            "sessions": {
                "total": len(self.sessions),
                "active": active,
                "completed": completed
            }
        })

    async def handle_create_session(self, request: web.Request) -> web.Response:
        """Create a new installation session."""
        try:
            data = await request.json()
        except:
            data = {}

        session_id = secrets.token_urlsafe(8)
        session = InstallSession(
            session_id=session_id,
            remote_url=data.get("remote_url", ""),
            remote_ip=request.remote or "unknown"
        )

        # Initial context
        session.context = {
            "remote_url": data.get("remote_url", ""),
            "os_type": data.get("os_type", "unknown"),
            "has_wordpress": data.get("has_wordpress", False),
            "wordpress_path": data.get("wordpress_path", ""),
            "python_version": data.get("python_version", ""),
            "git_installed": data.get("git_installed", False)
        }

        self.sessions[session_id] = session
        logger.info(f"Created session: {session_id} from {session.remote_ip}")

        return web.json_response({
            "success": True,
            "session_id": session_id,
            "session_url": f"{self.public_url}/session/{session_id}",
            "message": "Session created. Remote AI can now connect.",
            "next_step": "POST to /session/{session_id}/message with system info"
        })

    async def handle_get_session(self, request: web.Request) -> web.Response:
        """Get session details."""
        session_id = request.match_info["session_id"]

        if session_id not in self.sessions:
            return web.json_response({"error": "Session not found"}, status=404)

        return web.json_response(self.sessions[session_id].to_dict())

    async def handle_message(self, request: web.Request) -> web.Response:
        """Handle a message from the remote AI."""
        session_id = request.match_info["session_id"]

        if session_id not in self.sessions:
            return web.json_response({"error": "Session not found"}, status=404)

        try:
            data = await request.json()
        except:
            return web.json_response({"error": "Invalid JSON"}, status=400)

        session = self.sessions[session_id]
        session.updated_at = time.time()

        # Store the incoming message
        message = {
            "from": "remote_ai",
            "type": data.get("type", "message"),
            "content": data.get("content", ""),
            "timestamp": time.time()
        }
        session.messages.append(message)

        # Process the message and generate a response
        response = await self._process_message(session, data)
        session.status = "in_progress"

        # Store our response
        session.messages.append({
            "from": "install_daemon",
            "type": response.get("type", "response"),
            "content": response.get("content", ""),
            "timestamp": time.time()
        })

        logger.info(f"Session {session_id}: {data.get('type')} -> {response.get('type')}")

        return web.json_response(response)

    async def handle_poll(self, request: web.Request) -> web.Response:
        """Poll for new messages (for clients that can't use webhooks)."""
        session_id = request.match_info["session_id"]

        if session_id not in self.sessions:
            return web.json_response({"error": "Session not found"}, status=404)

        session = self.sessions[session_id]
        since = float(request.query.get("since", 0))

        # Get messages since timestamp
        new_messages = [
            m for m in session.messages
            if m["timestamp"] > since
        ]

        return web.json_response({
            "session_id": session_id,
            "status": session.status,
            "messages": new_messages
        })

    async def handle_ai_webhook(self, request: web.Request) -> web.Response:
        """Webhook for AI assistants to connect and start installation."""
        try:
            data = await request.json()
        except:
            data = {}

        # Extract info from the AI request
        ai_type = data.get("ai_type", "unknown")  # claude, gemini, etc.
        prompt = data.get("prompt", "")
        user_context = data.get("context", {})

        # Create a session
        session_id = secrets.token_urlsafe(8)
        session = InstallSession(
            session_id=session_id,
            remote_ip=request.remote or "unknown"
        )
        session.context.update(user_context)
        session.context["ai_type"] = ai_type

        self.sessions[session_id] = session

        logger.info(f"AI webhook from {ai_type}: session {session_id}")

        return web.json_response({
            "success": True,
            "session_id": session_id,
            "session_url": f"{self.public_url}/session/{session_id}",
            "daemon_response": f"Hello! I'm the Geometry OS Installation Daemon. Let me help you set up. First, tell me: what OS is the target system, and is WordPress already installed?",
            "protocol": {
                "step": 1,
                "total_steps": 5,
                "instruction": "POST system info to /session/{session_id}/message"
            }
        })

    async def handle_ai_instructions(self, request: web.Request) -> web.Response:
        """Get instructions for AI assistants on how to connect."""
        return web.json_response({
            "service": "Geometry OS Installation Daemon",
            "how_to_connect": {
                "step_1": "POST to /ai/webhook with your context",
                "step_2": "Receive a session_id and daemon_response",
                "step_3": "Continue conversation via /session/{id}/message"
            },
            "example_request": {
                "method": "POST",
                "url": f"{self.public_url}/ai/webhook",
                "body": {
                    "ai_type": "claude",
                    "prompt": "Help me install Geometry OS",
                    "context": {
                        "os_type": "linux",
                        "has_wordpress": True,
                        "wordpress_path": "/var/www/html"
                    }
                }
            },
            "message_types": {
                "system_info": "Provide information about the target system",
                "command_result": "Report the result of a command execution",
                "question": "Ask a question about the installation",
                "error": "Report an error that occurred",
                "progress": "Report installation progress"
            }
        })

    async def _process_message(self, session: InstallSession, data: Dict) -> Dict:
        """Process a message from the remote AI and respond."""
        msg_type = data.get("type", "message")
        content = data.get("content", "")

        # Update session context with new info
        if "system_info" in msg_type:
            session.context.update(data.get("context", {}))

        # Generate appropriate response based on message type and current state
        if msg_type == "system_info":
            return await self._handle_system_info(session, data)
        elif msg_type == "command_result":
            return await self._handle_command_result(session, data)
        elif msg_type == "error":
            return await self._handle_error(session, data)
        elif msg_type == "question":
            return await self._handle_question(session, data)
        elif msg_type == "progress":
            return await self._handle_progress(session, data)
        else:
            return await self._handle_general_message(session, data)

    async def _handle_system_info(self, session: InstallSession, data: Dict) -> Dict:
        """Handle system information from remote AI."""
        ctx = session.context

        # Build next steps based on what we know
        steps = []

        if not ctx.get("git_installed", True):
            steps.append("First, install git: sudo apt install git -y (or equivalent)")

        if not ctx.get("has_wordpress", False):
            steps.append("WordPress is not installed. Would you like me to guide WordPress installation first?")
        else:
            wp_path = ctx.get("wordpress_path", "")
            steps.append(f"WordPress found at {wp_path}. Next steps:")
            steps.append("1. Clone Geometry OS: git clone https://github.com/tdw419/geometry_os.git")
            steps.append("2. Copy the swarm plugin to WordPress mu-plugins")
            steps.append("3. Create remote_nodes.json configuration")
            steps.append("4. Start the discovery daemon")

        return {
            "type": "installation_steps",
            "content": "\n".join(steps),
            "commands": self._generate_commands(session),
            "config": self._generate_config(session),
            "next_action": "Execute the clone command and report results"
        }

    async def _handle_command_result(self, session: InstallSession, data: Dict) -> Dict:
        """Handle command execution result from remote AI."""
        command = data.get("command", "")
        success = data.get("success", False)
        output = data.get("output", "")

        if "git clone" in command and success:
            session.context["cloned"] = True
            return {
                "type": "next_step",
                "content": "Great! Repository cloned. Now copy the swarm plugin:",
                "commands": [
                    "mkdir -p /path/to/wordpress/wp-content/mu-plugins/",
                    "cp geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_swarm_node.php /path/to/wordpress/wp-content/mu-plugins/"
                ]
            }
        elif "geometry_os_swarm_node.php" in command and success:
            session.context["plugin_installed"] = True
            return {
                "type": "next_step",
                "content": "Plugin installed! Now create the configuration:",
                "config": self._generate_config(session),
                "commands": [
                    f"mkdir -p geometry_os/geometry_os/systems/swarm",
                    f"echo '{json.dumps(self._generate_config(session))}' > geometry_os/geometry_os/systems/swarm/remote_nodes.json"
                ]
            }
        elif "remote_nodes.json" in command and success:
            session.context["config_created"] = True
            return {
                "type": "next_step",
                "content": "Configuration created! Start the daemon:",
                "commands": [
                    "cd geometry_os/geometry_os",
                    "python3 systems/swarm/wp_discovery_daemon.py -f"
                ]
            }
        elif "wp_discovery_daemon" in command and success:
            session.status = "completed"
            return {
                "type": "installation_complete",
                "content": "🎉 Installation complete! The remote node is now syncing with the swarm.",
                "session_status": "completed",
                "swarm_url": self.public_url,
                "verify_command": "curl http://localhost:8080/?rest_route=/geoos/v1/sync&since=0&limit=5"
            }
        else:
            return {
                "type": "command_feedback",
                "content": f"Command {'succeeded' if success else 'failed'}. Output: {output[:500]}",
                "troubleshoot": not success
            }

    async def _handle_error(self, session: InstallSession, data: Dict) -> Dict:
        """Handle an error from remote AI."""
        error_msg = data.get("content", "Unknown error")

        return {
            "type": "troubleshooting",
            "content": f"I see there was an error: {error_msg}",
            "suggestions": [
                "Check if you have the necessary permissions",
                "Verify the path exists",
                "Ensure Python 3 and required packages are installed"
            ],
            "ask": "What was the exact error message?"
        }

    async def _handle_question(self, session: InstallSession, data: Dict) -> Dict:
        """Handle a question from remote AI."""
        question = data.get("content", "").lower()

        if "wordpress" in question:
            return {
                "type": "answer",
                "content": "WordPress is required for the swarm node. You can install it with: apt install wordpress, or download from wordpress.org",
                "alternative": "Or use the built-in PHP server: php -S 0.0.0.0:8080 -t /path/to/wordpress"
            }
        elif "python" in question:
            return {
                "type": "answer",
                "content": "Python 3.8+ is required. Install with: apt install python3 python3-pip",
                "dependencies": "pip install aiohttp"
            }
        else:
            return {
                "type": "answer",
                "content": "I'm here to help! Please provide more details about your question.",
                "context_needed": ["system_os", "current_step", "error_message"]
            }

    async def _handle_progress(self, session: InstallSession, data: Dict) -> Dict:
        """Handle progress update from remote AI."""
        progress = data.get("progress", 0)
        step = data.get("current_step", "")

        return {
            "type": "progress_ack",
            "content": f"Progress: {progress}%. Currently: {step}",
            "encouragement": "Keep going!" if progress < 100 else "Almost there!"
        }

    async def _handle_general_message(self, session: InstallSession, data: Dict) -> Dict:
        """Handle a general message from remote AI."""
        content = data.get("content", "")

        return {
            "type": "response",
            "content": f"Received your message. Current session status: {session.status}",
            "context": session.context,
            "suggested_action": "Send 'system_info' type with your system details to proceed with installation"
        }

    def _generate_commands(self, session: InstallSession) -> List[str]:
        """Generate installation commands based on session context."""
        ctx = session.context
        commands = []

        if not ctx.get("cloned"):
            commands.append("git clone https://github.com/tdw419/geometry_os.git")

        if ctx.get("has_wordpress") and ctx.get("wordpress_path"):
            wp_path = ctx["wordpress_path"]
            commands.append(f"cp geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_swarm_node.php {wp_path}/wp-content/mu-plugins/")

        return commands

    def _generate_config(self, session: InstallSession) -> Dict:
        """Generate remote_nodes.json config for the remote system."""
        return {
            "nodes": [{
                "node_id": f"swarm-main",
                "url": self.public_url.replace(f":{self.port}", ":8080"),
                "api_url": self.public_url.replace(f":{self.port}", ":8080") + "/?rest_route=/geoos/v1",
                "enabled": True
            }]
        }

    def run(self):
        """Start the daemon."""
        logger.info(f"🐝 Install Daemon starting on {self.host}:{self.port}")
        logger.info(f"📡 Public URL: {self.public_url}")
        logger.info(f"🤖 AI instructions: {self.public_url}/ai/instructions")

        web.run_app(self.app, host=self.host, port=self.port, print=None)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Geometry OS Installation Daemon")
    parser.add_argument("--port", type=int, default=8765, help="Port to listen on")
    parser.add_argument("--host", default="0.0.0.0", help="Host to bind to")
    parser.add_argument("--public-url", help="Public URL for this daemon")

    args = parser.parse_args()

    daemon = InstallDaemon(port=args.port, host=args.host)
    if args.public_url:
        daemon.public_url = args.public_url

    daemon.run()
