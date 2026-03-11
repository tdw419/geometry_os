# systems/visual_shell/web/geoasm_server.py
"""
GeoASM WebSocket Server

Bridges WebMCP GeoASM tools to the Python GeoASM implementation.
"""

import asyncio
import json
import logging

import websockets

from .geoasm_bridge import handle_geoasm_request

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("geoasm_server")

async def geoasm_handler(websocket, path):
    """Handle incoming WebSocket connections from WebMCP."""
    logger.info(f"New connection from {websocket.remote_address}")

    try:
        async for message in websocket:
            try:
                request = json.loads(message)
                logger.info(f"Request: {request.get('action')}")

                response = handle_geoasm_request(request)

                await websocket.send(json.dumps(response))
            except json.JSONDecodeError:
                await websocket.send(json.dumps({
                    "success": False,
                    "error": "Invalid JSON"
                }))
            except Exception as e:
                logger.error(f"Error handling message: {e}")
                await websocket.send(json.dumps({
                    "success": False,
                    "error": str(e)
                }))
    except websockets.ConnectionClosed:
        logger.info("Connection closed")

async def main():
    port = 8771 # New port for GeoASM
    logger.info(f"Starting GeoASM Server on ws://localhost:{port}")
    async with websockets.serve(geoasm_handler, "localhost", port):
        await asyncio.Future()  # run forever

if __name__ == "__main__":
    asyncio.run(main())
