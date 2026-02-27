#!/usr/bin/env python3
"""
Terminal Position Persistence API

WebSocket server for syncing terminal window positions.
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


# In-memory storage
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
        return JSONResponse(content=positions_db[terminal_id].dict())
    return JSONResponse(content={"error": "not found"}, status_code=404)


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
    return JSONResponse(content={"error": "not found"}, status_code=404)


# WebSocket connection manager
class ConnectionManager:
    def __init__(self):
        self.active_connections: list = []

    async def connect(self, websocket: WebSocket):
        self.active_connections.append(websocket)
        try:
            while True:
                data = await websocket.receive_text()
                message = json.loads(data)

                if message.get("type") == "load_positions":
                    await websocket.send_json({
                        "type": "positions",
                        "positions": {tid: pos.dict() for tid, pos in positions_db.items()}
                    })
                elif message.get("type") == "save_positions":
                    global positions_db
                    positions_db = {
                        tid: Position(**pos)
                        for tid, pos in message.get("positions", {}).items()
                    }
                    await websocket.send_json({
                        "type": "saved",
                        "count": len(positions_db)
                    })
                    # Broadcast to other clients
                    for conn in self.active_connections:
                        if conn != websocket:
                            await conn.send_json({
                                "type": "positions_updated",
                                "positions": {tid: pos.dict() for tid, pos in positions_db.items()}
                            })
        except WebSocketDisconnect:
            self.active_connections.remove(websocket)


connection_manager = ConnectionManager()


@app.websocket("/ws/terminals")
async def websocket_endpoint(websocket: WebSocket):
    await connection_manager.connect(websocket)


if __name__ == "__main__":
    print("Starting Terminal Positions API server on http://0.0.0.0:8765")
    uvicorn.run(app, host="0.0.0.0", port=8765)
