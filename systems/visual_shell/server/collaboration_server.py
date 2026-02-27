#!/usr/bin/env python3
"""
Collaboration Server: WebSocket server for infinite canvas multiplayer.

Provides real-time presence and edit synchronization for collaborative
terminal editing on the infinite canvas.

Usage:
    python3 collaboration_server.py --port 8770

Protocol:
    Client → Server:
        { "type": "join", "userId": "...", "userName": "...", "userColor": "...", "state": {...} }
        { "type": "state_update", "userId": "...", "state": {...} }
        { "type": "edit", "userId": "...", "edit": {...} }
        { "type": "leave", "userId": "..." }

    Server → Client:
        { "type": "user_joined", "userId": "...", ... }
        { "type": "user_left", "userId": "..." }
        { "type": "user_update", "userId": "...", "state": {...} }
        { "type": "remote_edit", "userId": "...", "edit": {...} }
        { "type": "presence_sync", "users": [...] }
"""

import asyncio
import json
import logging
from datetime import datetime
from typing import Dict, Set, Any
from dataclasses import dataclass, asdict

try:
    from fastapi import FastAPI, WebSocket, WebSocketDisconnect
    from fastapi.middleware.cors import CORSMiddleware
    import uvicorn
except ImportError:
    print("Install: pip install fastapi uvicorn websockets")
    exit(1)

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [COLLAB] %(message)s'
)
logger = logging.getLogger("CollaborationServer")


@dataclass
class UserState:
    """User's current state on the canvas."""
    position: Dict[str, float]
    viewport: Dict[str, Any]
    selection: Any = None
    editing: Any = None


@dataclass
class User:
    """Connected user."""
    user_id: str
    user_name: str
    user_color: str
    state: UserState
    websocket: WebSocket
    last_update: float = 0.0


class CollaborationServer:
    """
    Manages real-time collaboration on the infinite canvas.
    """

    def __init__(self):
        self.users: Dict[str, User] = {}
        self.rooms: Dict[str, Set[str]] = {}  # room_id → set of user_ids
        self.edit_history = []
        self.max_history = 1000

    async def connect(self, websocket: WebSocket):
        """Accept a new WebSocket connection."""
        await websocket.accept()
        logger.info(f"New connection. Total: {len(self.users) + 1}")

    async def disconnect(self, user_id: str):
        """Handle user disconnect."""
        user = self.users.pop(user_id, None)

        if user:
            # Broadcast to all other users
            await self._broadcast({
                "type": "user_left",
                "userId": user_id,
                "timestamp": datetime.now().isoformat()
            }, exclude_user=user_id)

            logger.info(f"User {user.user_name} left. Total: {len(self.users)}")

    async def handle_message(self, websocket: WebSocket, message: dict):
        """Handle incoming message from client."""
        msg_type = message.get("type")
        user_id = message.get("userId")

        if msg_type == "join":
            await self._handle_join(websocket, message)

        elif msg_type == "state_update":
            await self._handle_state_update(message)

        elif msg_type == "edit":
            await self._handle_edit(message)

        elif msg_type == "leave":
            await self.disconnect(user_id)

    async def _handle_join(self, websocket: WebSocket, message: dict):
        """Handle user join."""
        user_id = message["userId"]
        user_name = message["userName"]
        user_color = message["userColor"]
        state_data = message.get("state", {})

        # Create user
        state = UserState(
            position=state_data.get("position", {"x": 0, "y": 0}),
            viewport=state_data.get("viewport", {"x": 0, "y": 0, "zoom": 1}),
            selection=state_data.get("selection"),
            editing=state_data.get("editing")
        )

        user = User(
            user_id=user_id,
            user_name=user_name,
            user_color=user_color,
            state=state,
            websocket=websocket,
            last_update=datetime.now().timestamp()
        )

        self.users[user_id] = user

        # Send current presence to new user
        await self._send_presence_sync(websocket)

        # Broadcast join to all other users
        await self._broadcast({
            "type": "user_joined",
            "userId": user_id,
            "userName": user_name,
            "userColor": user_color,
            "state": asdict(state),
            "timestamp": datetime.now().isoformat()
        }, exclude_user=user_id)

        logger.info(f"User {user_name} joined. Total: {len(self.users)}")

    async def _handle_state_update(self, message: dict):
        """Handle state update from user."""
        user_id = message["userId"]
        state_data = message.get("state", {})

        user = self.users.get(user_id)
        if not user:
            return

        # Update state
        user.state.position = state_data.get("position", user.state.position)
        user.state.viewport = state_data.get("viewport", user.state.viewport)
        user.state.selection = state_data.get("selection")
        user.state.editing = state_data.get("editing")
        user.last_update = datetime.now().timestamp()

        # Broadcast to other users
        await self._broadcast({
            "type": "user_update",
            "userId": user_id,
            "state": asdict(user.state),
            "timestamp": datetime.now().isoformat()
        }, exclude_user=user_id)

    async def _handle_edit(self, message: dict):
        """Handle edit from user."""
        user_id = message["userId"]
        edit = message.get("edit", {})

        # Store in history
        self.edit_history.append({
            "userId": user_id,
            "edit": edit,
            "timestamp": datetime.now().isoformat()
        })

        if len(self.edit_history) > self.max_history:
            self.edit_history.pop(0)

        # Broadcast to other users
        await self._broadcast({
            "type": "remote_edit",
            "userId": user_id,
            "edit": edit,
            "timestamp": datetime.now().isoformat()
        }, exclude_user=user_id)

    async def _send_presence_sync(self, websocket: WebSocket):
        """Send current presence state to a user."""
        users = []
        for user in self.users.values():
            users.append({
                "userId": user.user_id,
                "userName": user.user_name,
                "userColor": user.user_color,
                "state": asdict(user.state)
            })

        await websocket.send_json({
            "type": "presence_sync",
            "users": users,
            "timestamp": datetime.now().isoformat()
        })

    async def _broadcast(self, message: dict, exclude_user: str = None):
        """Broadcast message to all connected users except excluded."""
        disconnected = []

        for user_id, user in self.users.items():
            if user_id == exclude_user:
                continue

            try:
                await user.websocket.send_json(message)
            except:
                disconnected.append(user_id)

        # Clean up disconnected
        for user_id in disconnected:
            await self.disconnect(user_id)

    def get_stats(self):
        """Get server statistics."""
        return {
            "connected_users": len(self.users),
            "edit_count": len(self.edit_history),
            "users": [
                {
                    "id": u.user_id,
                    "name": u.user_name,
                    "color": u.user_color
                }
                for u in self.users.values()
            ]
        }


# Global server instance
server = CollaborationServer()

# FastAPI app
app = FastAPI(title="Collaboration Server", version="1.0.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    """WebSocket endpoint for collaboration clients."""
    await server.connect(websocket)
    user_id = None

    try:
        while True:
            data = await websocket.receive_text()
            try:
                message = json.loads(data)
                user_id = message.get("userId")
                await server.handle_message(websocket, message)
            except json.JSONDecodeError:
                await websocket.send_json({
                    "type": "error",
                    "message": "Invalid JSON"
                })
    except WebSocketDisconnect:
        if user_id:
            await server.disconnect(user_id)


@app.get("/")
async def root():
    """API root."""
    return {
        "name": "Collaboration Server",
        "version": "1.0.0",
        **server.get_stats()
    }


@app.get("/stats")
async def get_stats():
    """Get server statistics."""
    return server.get_stats()


@app.get("/history")
async def get_history(limit: int = 50):
    """Get edit history."""
    return {
        "history": server.edit_history[-limit:],
        "total": len(server.edit_history)
    }


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Collaboration Server for Geometry OS")
    parser.add_argument("--port", type=int, default=8770, help="Port to listen on")
    parser.add_argument("--host", default="0.0.0.0", help="Host to bind to")
    args = parser.parse_args()

    logger.info(f"Starting Collaboration Server on {args.host}:{args.port}")
    uvicorn.run(app, host=args.host, port=args.port, log_level="info")
