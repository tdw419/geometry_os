#!/usr/bin/env python3
"""
Terminal Position Persistence API

WebSocket server for syncing terminal window positions.
Provides REST endpoints for position management and WebSocket for real-time sync.
"""

import asyncio
import json
from pathlib import Path
from typing import Dict, Optional
from fastapi import FastAPI, WebSocket, WebSocketDisconnect, HTTPException
from fastapi.responses import JSONResponse
from pydantic import BaseModel
import uvicorn

app = FastAPI(
    title="Terminal Positions API",
    description="Persistence API for Geometry OS Terminal Windows",
    version="1.0.0"
)


class Position(BaseModel):
    """Terminal window position model"""
    x: float
    y: float
    width: Optional[float] = None
    height: Optional[float] = None


# In-memory storage (replace with database for production)
positions_db: Dict[str, Position] = {}


@app.get("/api/terminals/positions")
async def get_positions() -> Dict[str, dict]:
    """Load all terminal positions"""
    return {
        terminal_id: {
            "x": pos.x,
            "y": pos.y,
            "width": pos.width,
            "height": pos.height
        }
        for terminal_id, pos in positions_db.items()
    }


@app.post("/api/terminals/positions")
async def save_positions(positions: Dict[str, Position]) -> dict:
    """Save all terminal positions"""
    global positions_db
    positions_db = positions
    return {"status": "ok", "count": len(positions)}


@app.get("/api/terminals/{terminal_id}")
async def get_terminal(terminal_id: str) -> dict:
    """Get single terminal state"""
    if terminal_id not in positions_db:
        raise HTTPException(status_code=404, detail="Terminal not found")

    pos = positions_db[terminal_id]
    return {
        "x": pos.x,
        "y": pos.y,
        "width": pos.width,
        "height": pos.height
    }


@app.put("/api/terminals/{terminal_id}/position")
async def update_position(terminal_id: str, position: Position) -> dict:
    """Update single terminal position"""
    positions_db[terminal_id] = position
    return {"status": "ok"}


@app.delete("/api/terminals/{terminal_id}")
async def delete_terminal(terminal_id: str) -> dict:
    """Delete terminal position"""
    if terminal_id in positions_db:
        del positions_db[terminal_id]
    return {"status": "ok"}


# WebSocket connection manager
class ConnectionManager:
    def __init__(self):
        self.active_connections: list = []

    async def broadcast(self, message: dict):
        """Broadcast message to all connected clients"""
        for connection in self.active_connections:
            try:
                await connection.send_json(message)
            except Exception:
                pass


connection_manager = ConnectionManager()


@app.websocket("/ws/terminals")
async def websocket_endpoint(websocket: WebSocket):
    """
    WebSocket endpoint for real-time terminal position sync.

    Message types:
    - load_positions: Request all positions
    - save_positions: Save positions to server
    - position_update: Single position update
    """
    await websocket.accept()
    connection_manager.active_connections.append(websocket)

    try:
        while True:
            data = await websocket.receive_text()

            try:
                message = json.loads(data)
                msg_type = message.get("type")

                if msg_type == "load_positions":
                    # Send all positions
                    await websocket.send_json({
                        "type": "positions",
                        "positions": {
                            tid: {"x": pos.x, "y": pos.y, "width": pos.width, "height": pos.height}
                            for tid, pos in positions_db.items()
                        }
                    })

                elif msg_type == "save_positions":
                    # Save all positions
                    global positions_db
                    positions = message.get("positions", {})
                    positions_db = {
                        tid: Position(**pos)
                        for tid, pos in positions.items()
                    }

                    # Confirm save
                    await websocket.send_json({
                        "type": "saved",
                        "count": len(positions_db)
                    })

                    # Broadcast to other clients
                    await connection_manager.broadcast({
                        "type": "positions_updated",
                        "source": "remote"
                    })

                elif msg_type == "position_update":
                    # Single position update
                    terminal_id = message.get("terminal_id")
                    position_data = message.get("position", {})

                    if terminal_id:
                        positions_db[terminal_id] = Position(**position_data)

                        # Broadcast to other clients
                        await connection_manager.broadcast({
                            "type": "position_update",
                            "terminal_id": terminal_id,
                            "position": position_data
                        })

            except json.JSONDecodeError:
                await websocket.send_json({
                    "type": "error",
                    "message": "Invalid JSON"
                })
            except Exception as e:
                await websocket.send_json({
                    "type": "error",
                    "message": str(e)
                })

    except WebSocketDisconnect:
        pass
    finally:
        if websocket in connection_manager.active_connections:
            connection_manager.active_connections.remove(websocket)


@app.on_event("startup")
async def startup_event():
    """Log startup"""
    print("[TerminalPositionsAPI] Server started on port 8765")


if __name__ == "__main__":
    uvicorn.run(
        app,
        host="0.0.0.0",
        port=8765,
        log_level="info"
    )
