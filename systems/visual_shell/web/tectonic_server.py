# systems/visual_shell/web/tectonic_server.py
"""
Tectonic WebSocket Server

Bridges WebMCP Tectonic Negotiation tools to the Python TectonicNegotiator implementation.
"""

import asyncio
import json
import logging
import websockets
from systems.visual_shell.web.tectonic_bridge import TectonicBridge

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("tectonic_server")

# Global bridge instance
bridge = TectonicBridge()

async def tectonic_handler(websocket, path):
    """Handle incoming WebSocket connections from WebMCP."""
    logger.info(f"New connection from {websocket.remote_address}")
    
    try:
        async for message in websocket:
            try:
                request = json.loads(message)
                action = request.get("action")
                logger.info(f"Request: {action}")
                
                if action == "claim":
                    response = await bridge.handle_claim(request, websocket)
                elif action == "bid":
                    response = await bridge.handle_bid(request, websocket)
                elif action == "settle":
                    response = await bridge.handle_settle(request, websocket)
                elif action == "subscribe":
                    await bridge.handle_subscribe(request, websocket)
                    response = {"success": True, "message": "Subscribed to tectonic notifications"}
                elif action == "unsubscribe":
                    bridge.handle_unsubscribe(websocket)
                    response = {"success": True, "message": "Unsubscribed from tectonic notifications"}
                else:
                    response = {"success": False, "error": f"Unknown action: {action}"}
                
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
        logger.info(f"Connection closed: {websocket.remote_address}")
        bridge.handle_unsubscribe(websocket)

async def main():
    port = 8772 # Port for Tectonic Negotiation
    logger.info(f"Starting Tectonic Server on ws://localhost:{port}")
    async with websockets.serve(tectonic_handler, "localhost", port):
        await asyncio.Future()  # run forever

if __name__ == "__main__":
    asyncio.run(main())
