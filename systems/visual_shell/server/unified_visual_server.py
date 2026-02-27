#!/usr/bin/env python3
"""
Unified Visual Shell Server

A single FastAPI server that serves all visual shell test pages
and provides WebSocket connections to live Geometry OS systems.

Endpoints:
- /                    - Dashboard
- /test/*              - Test pages
- /ws/terminal          - Terminal WebSocket
- /ws/collaboration   - Collaboration WebSocket
- /ws/agents            - Agent events
- /api/file/*          - File operations
- /api/neb/*            - NEB integration
"""

import asyncio
import json
import os
from pathlib import Path
from datetime import datetime
from typing import Dict, Any, Optional

try:
    from fastapi import FastAPI, WebSocket, WebSocketDisconnect
    from fastapi.middleware.cors import CORSMiddleware
    from fastapi.responses import HTMLResponse
    from fastapi.staticfiles import StaticFiles
    import uvicorn
except ImportError:
    print("Install: pip install fastapi uvicorn websockets")
    exit(1)

# Configuration
WEB_DIR = Path(__file__).parent.parent / "web"
DAEMON_SOCKET = os.getenv("DAEMON_SOCKET", "ws://localhost:8765")

# Create FastAPI app
app = FastAPI(title="Geometry OS Visual Shell", version="1.0.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# In-memory state
active_terminals: Dict[str, Any] = {}
active_sessions: Dict[str, Any] = {}
neb_subscribers: Dict[str, list] = {}


# ============================================
# STATIC FILES
# ============================================

@app.get("/", response_class=HTMLResponse)
async def dashboard():
    """Main dashboard page."""
    html_path = WEB_DIR / "unified_dashboard.html"
    if html_path.exists():
        return HTMLResponse(content=html_path.read_text(), status_code=200)
    return HTMLResponse(content="<h1>Dashboard not found</h1>", status_code=404)


@app.get("/test/{page_name}", response_class=HTMLResponse)
async def test_page(page_name: str):
    """Serve test pages."""
    # Map page names to files
    page_map = {
        "morphological_font": "test_morphological_font.html",
        "geometric_terminal": "demo_geometric_terminal.html",
        "agent_task_flow": "test_agent_task_flow.html",
        "infinite_canvas_multiplayer": "test_infinite_canvas_multiplayer.html",
        "terminal_infinite_map": "test_terminal_infinite_map.html",
        "geometric_code_editor": "test_geometric_code_editor.html",
        "morphological_sound": "test_morphological_sound.html"
    }

    filename = page_map.get(page_name)
    if not filename:
        return HTMLResponse(content=f"<h1>Page not found</h1><p>Available: {list(page_map.keys())}</p>", status_code=404)

    
    html_path = WEB_DIR / filename
    if html_path.exists():
        return HTMLResponse(content=html_path.read_text(), status_code=200)
    
    return HTMLResponse(content=f"<h1>File not found: {filename}</h1>", status_code=404)


# Mount static files
app.mount("/lib", StaticFiles(directory=WEB_DIR / "lib", html=True), name="lib")
app.mount("/shaders", StaticFiles(directory=WEB_DIR / "shaders", html=True), name="shaders")
app.mount("/morphological", StaticFiles(directory=WEB_DIR / "morphological", html=True), name="morphological")


# ============================================
# WEBSOCKET ENDPOINTS
# ============================================

@app.websocket("/ws/terminal")
async def terminal_websocket(websocket: WebSocket):
    """Terminal WebSocket - bridges to shell subprocess."""
    await websocket.accept()
    session_id = f"term-{datetime.now().timestamp()}"
    active_sessions[session_id] = {"websocket", "created_at": datetime.now()}
    
    try:
        while True:
                data = await websocket.receive_text()
                message = json.loads(data)
                
                # Handle terminal commands
                if message.get("type") == "input":
                    # Echo to all terminals
                    for sid, session in active_sessions.items():
                        if session.get("websocket"):
                            await session["websocket"].send_json({
                                "type": "output",
                                "data": message.get("data"),
                                "timestamp": datetime.now().isoformat()
                            })
                
                elif message.get("type") == "resize":
                    # Handle resize
                    pass
                    
    except WebSocketDisconnect:
        if session_id in active_sessions:
            del active_sessions[session_id]


@app.websocket("/ws/collaboration")
async def collaboration_websocket(websocket: WebSocket):
    """Collaboration WebSocket - multi-user presence."""
    from collaboration_server import CollaborationServer
    
    server = CollaborationServer()
    await server.connect(websocket)
    
    try:
        while True:
            data = await websocket.receive_text()
            message = json.loads(data)
            await server.handle_message(websocket, message)
    except WebSocketDisconnect:
        user_id = None
        for uid, user in server.users.items():
                if user.websocket == websocket:
                    user_id = uid
                    break
        if user_id:
            await server.disconnect(user_id)


@app.websocket("/ws/agents")
async def agents_websocket(websocket: WebSocket):
    """Agent events WebSocket - real-time agent activity."""
    await websocket.accept()
    session_id = f"agent-{datetime.now().timestamp()}"
    
    try:
        # Send initial state
        await websocket.send_json({
            "type": "init",
            "agents": [
                {"id": "architect-001", "status": "idle", "type": "architect"},
                {"id": "engineer-001", "status": "idle", "type": "engineer"},
                {"id": "engineer-002", "status": "idle", "type": "engineer"},
                {"id": "reviewer-001", "status": "idle", "type": "reviewer"},
                {"id": "executor-001", "status": "idle", "type": "executor"}
            ],
            "timestamp": datetime.now().isoformat()
        })
        
        # Simulate agent activity
        import random
        while True:
            await asyncio.sleep(2 + random.random() * 3)
            
            # Random agent event
            agent_id = random.choice(["architect-001", "engineer-001", "engineer-002", "reviewer-001", "executor-001"])
            event_type = random.choice(["task_started", "task_progress", "task_completed", "belief_updated"])
            
            await websocket.send_json({
                "type": "agent_event",
                "agent_id": agent_id,
                "event": event_type,
                "payload": {
                    "progress": random.randint(0, 100),
                    "confidence": random.uniform(0.7, 1.0)
                },
                "timestamp": datetime.now().isoformat()
            })
            
    except WebSocketDisconnect:
        pass


    except Exception as e:
        print(f"Agent WebSocket error: {e}")


# ============================================
# API ROUTES
# ============================================

@app.get("/api/file/list")
async def list_files(path: str = "."):
    """List files in directory."""
    try:
                full_path = Path(path).resolve()
                if not full_path.exists():
                    return {"error": "Path not found"}
                
                items = []
                for item in full_path.iterdir():
                    items.append({
                        "name": item.name,
                        "type": "directory" if item.is_dir() else "file",
                        "size": item.stat().st_size if item.is_file() else None
                    })
                
                return {"items": items, "path": path}
    except Exception as e:
                return {"error": str(e)}


@app.get("/api/file/read")
async def read_file(path: str):
    """Read file contents."""
    try:
                full_path = Path(path).resolve()
                if not full_path.exists():
                    return {"error": "File not found"}
                
                return {"content": full_path.read_text(), "path": path}
    except Exception as e:
                return {"error": str(e)}


@app.post("/api/file/save")
async def save_file(path: str, content: str):
    """Save file contents."""
    try:
                full_path = Path(path).resolve()
                full_path.parent.mkdir(parents=True, exist_ok=True)
                full_path.write_text(content)
                return {"success": True, "path": path}
    except Exception as e:
                return {"error": str(e)}


@app.get("/api/neb/status")
async def neb_status():
    """Get Neural Event Bus status."""
    # Try to connect to actual NEB
    try:
        import aiohttp
        async with aiohttp.ClientSession() as session:
            async with session.get(f"{DAEMON_SOCKET.replace('/ws', '')}/neb/status") as resp:
                return await resp.json()
    except:
        # Return mock status
        return {
            "status": "mock",
            "topics": ["agent.**", "terminal.**", "window.**", "glyph.**"],
            "subscribers": 5,
            "events_per_second": 42
        }


@app.post("/api/neb/publish")
async def neb_publish(topic: str, payload: Dict[str, Any]):
    """Publish event to NEB."""
    event = {
        "topic": topic,
        "payload": payload,
        "timestamp": datetime.now().isoformat()
    }
    
    # Store for subscribers
    if topic not in neb_subscribers:
        neb_subscribers[topic] = []
    
    for ws in neb_subscribers.get(topic, []):
        try:
            await ws.send_json(event)
        except:
            pass
    
    return {"success": True, "topic": topic}


# ============================================
# RUN SERVER
# ============================================

if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description="Unified Visual Shell Server")
    parser.add_argument("--port", type=int, default=8080, help="Port to listen on")
    parser.add_argument("--host", default="0.4.4.4", help="Host to bind to")
    parser.add_argument("--reload", action="store_true", help="Enable auto-reload")
    args = parser.parse_args()
    
    print(f"Starting Unified Visual Shell Server on {args.host}:{args.port}")
    print(f"Dashboard: http://{args.host}:{args.port}/")
    print(f"Test pages: http://{args.host}:{args.port}/test/{{page_name}}")
    
    if args.reload:
        uvicorn.run(
            "unified_visual_server:app",
            host=args.host,
            port=args.port,
            reload=True
        )
    else:
        uvicorn.run(app, host=args.host, port=args.port)
